/* Mewmazons galore
 * this spaghetti by master pasta chef lighterfluid
 * 
 * flogs:
 *  SHIZZY_TRAP_ENCOUNTERED
 *   -ammount of times you’ve seen shizzyspezzodysseyencounter()
 *  SHIZZY_YAMMI_AT_TRAP
 *   -1 if yammi was there when player met shizzy
 *  SHIZZY_MET
 *   - 1 if pc investigated the trap
 *  SHIZZY_CUNT_SNAKE_RECIPE
 *   - 1 if player tried the fried snake, 0 if they chickened out
 *  SHIZZY_ANNO_MENTIONED_AKKADI
 *   - had anno’s follower talk about akkadi
 *  SHIZZY_NOMMED_MIKA
 *   - did u breathed when meeting her?
*/

public function shizzyTrapAvailable():Boolean
{
	return flags["SHIZZY_MET"] == undefined && flags["STELLAR_TETHER_CLOSED"] != undefined && (flags["SHIZZY_TRAP_ENCOUNTERED"] == undefined || flags["SHIZZY_TRAP_ENCOUNTERED"] <= 4);
}

public function showShizuya(nekkid:Boolean=false, showauthor:Boolean=true):void
{
	if (showauthor) author("QuestyRobo");
	
	showName("\nSHIZUYA");
	showBust("SHIZUYA" + (nekkid ? "_NUDE" : ""));
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
	output("\n\n<i>“Oh, hey boss, I was just wondering what I should do with these.”</i>");
	output("\n\n<i>“What are they?”</i>");
	output("\n\n<i>“Cunt snakes. You’ve been to Mhen’ga a good bit, so you’ve probably seen them. Apparently some people... eat them, without the ‘bits’ of course.");
	if (flags["SHIZZY_YAMMI_AT_TRAP"] == 1) output(" Adelline told me it’s kind of a thing that some of the more eccentric vanae do, and apparently it’s actually pretty good, so she gave me the recipe...");
	else output(" I was out getting ingredients and I met this... big woman who said she knew you. We talked for a bit, and when I mentioned that I cooked for you, she gave me this recipe.");
	output(" I can get them from the same guys I get the Ginder Fish from, so it’s not hard to come by.”</i>");
	output("\n\n<i>“Sounds... odd.”</i>");
	output("\n\n<i>“Yeah, kinda. I mean, it sounds good, it’s seasoned well, it smells great, but it is a bit weird.”</i>");
	output("\n\n<i>“Have you tried it?”</i>");
	output("\n\n<i>“Yeah, it’s good, but I’m not sure if you’d like it enough for me to really commit too much to it.”</i>");
	output("\n\nDo you want to try it?");
	
	processTime(2);
	
	addButton(0, "Yes", shizzyStillInADream, undefined, "Yes", "Give it a go.");
	addButton(1, "No", shizzyCuntSnakesAreFriendsNotFood, undefined, "No", "No thanks. <i>She probably won’t be serving this if you don’t try it.</i>");
}

public function shizzyStillInADream():void
{
	clearOutput();
	yammiFollowerDisplay();
	author("QuestyRobo");
	
	output("You pick up a knife and fork and start to cut off a piece. There’s a flakey, satisfying crunch as you carve through the fried skin. It’s not tough or dry. In fact, despite the crunch, it’s very easy to get through. The flesh is tender, almost like cutting through a layer of butter, and there’s a nice, juicy squelch when you cut through the fruit in the middle. You pick up the small piece that you’ve cut for yourself, making sure to keep it over the plate so that the copious juices don’t drip all over the floor.");
	output("\n\nShe wasn’t kidding when she said it smelled good. It’s very sweet, but not overwhelmingly so, and with an undertone of what smells like roasted pork. You bite into it, finding it almost candy-like in sweetness at first, then you get into the meat. It’s an explosion of savoriness; for as little meat as there is, it feels like you just chewed a thick, over-seasoned steak. Somehow, though, the sweetness of the fruit and sweet crust manage to balance it out perfectly.");
	output("\n\nThe softness and the balance of sweetness and savoriness makes it seem more like a dessert than a main course, and it’s pretty easy to forget exactly what it is.");
	output("\n\n<i>“So, are we putting this on the menu?”</i>");
	output("\n\n<i>“I’d say so.”</i>");
	output("\n\n<i>“Great! Just a heads up, these come with the aphrodisiac venom separate, so if you want that extra kick, just ask.”</i> You nod, realizing that you’ve been eating without thinking, and the plate is empty, save a few crumbs and splatters of juice.");
	output("\n\nYammi chuckles. <i>“Alright, boss, anything else?”</i>");
	output("\n\n<b>(Yammi will now cook Fried and Stuffed Cunt Snake.)</b>");
	
	processTime(30);
	
	flags["SHIZZY_CUNT_SNAKE_RECIPE"] = 1;
	
	yammiFollowerMenu();
}

public function shizzyCuntSnakesAreFriendsNotFood():void
{
	clearOutput();
	yammiFollowerDisplay();
	author("QuestyRobo");
	
	output("<i>“No, that’s weird.”</i>\n\nYammi sighs. <i>“Oh well, not everything is going to work out.”</i> She takes the plate and scrapes the food off into the garbage. <i>“Anyway, boss, did you want anything else?”</i>");

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
	
	output("<i>“Coming right up, boss. Do you want the " + (silly ? "juice" : "venom") + " or no?”</i>");
	
	addButton(0, "Yes", shizzyCuntSnakeNom, true, "Yes", "Get a dose of that venom.");
	addButton(1, "No", shizzyCuntSnakeNom, false, "No", "Have it normal.");
}

public function shizzyCuntSnakeNom(venom:Boolean = false):void
{
	clearMenu();
	clearOutput();
	yammiFollowerDisplay();
	author("QuestyRobo");

	output("Yammi comes in and puts down a plate of sizzling, fried Cunt Snake. The smell wafts up and tickles your nostrils. It’s a familiar sweetness with an undertone of savory meat that takes your tastebuds back to your first sampling. Your mouth waters slightly as you recall the taste. You dig in, hearing the satisfying crunch of your fork through the flakey crust, and the squelch as you hit the veritable fruit stuffed in the center.");
	output("\n\nYou tear into the dish, carving out a large piece and eating it in one bite, savoring the perfect blend of salty and sweet, before taking another bite.");
	if (venom) output(" You feel the venom working its magic on you. It’s not as potent as getting it direct from the source, but enough that a constant flow of blood is flowing to your [pc.crotch].");
	output(" By the time you even realize, you’ve already polished off the plate. You can’t believe it’s snake!");
	
	processTime(15);
	eatHomeCooking(100);
	if (venom)
	{
		//10 libido, 20 min lust
		pc.createStatusEffect("Fried Cunt Snake", 10, 20, 0, 0, true, "", "", false, 0);
		pc.setStatusMinutes("Fried Cunt Snake", 24 * 60);
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
		output("Your ship’s navigation system takes you on a different path than usual; apparently there’s some kind of disturbance on the main route. It’s out of the way, but still seems safe, though rarely traveled. There’s even a few very picturesque sights along it. A bright, dazzling nebula in particular catches your eye. You think you could just sit for hours and watch the shades of purple and blue swirl around each other in their mesmerizing dance.");
		output("\n\nIt’s moments like this when you really appreciate this whole quest. You’d probably never see any of this from behind a desk at Steele Tech. As you’re taking it in, your comms pick up a distress signal. It’s too garbled to decipher anything beyond them being stranded. The message seems to be automated, which could mean that either the people sending it aren’t doing so well, or it’s a trap.");
	}
	else
	{
		output("Nobody ever said interstellar travel was fun. You find yourself on the same route you’re always on, seeing the same things. Your mind drifts back to that side path you took; it didn’t take that much longer than your normal route, and you barely got to explore. The tourist inside you is screaming at you to go see more of it, and you can’t ignore [pc.him] anymore.");
		output("\n\nYou take your time to observe more this time. In addition to the nebula there’s also a binary star system consisting of a larger star and a white dwarf star. Matter from the large star has accreted into a series of beautiful rings and tails around the dwarf star.");
		output("\n\nYou could just sit here for hours and watch these wonderful sights, but just as you’re getting comfortable, the comm rings up. It’s a distress signal, the same one from before. If this is a trap, it’s a damn persistent one. Or maybe there really are people who need your help.");
	}
	
	var invTooltip:String;
	var leaveTooltip:String;
	if (pc.isAss())
	{
		invTooltip = "Who cares if it’s a trap? You’ll get through it, you always do.";
		leaveTooltip = "You have better things to do than put your ass on the line like that.";
	}
	else
	{
		invTooltip = "You can’t let uncertainty stop you from doing the right thing.";
		leaveTooltip = "It’s too much of a risk; better hope it’s actually a trap.";
	}
	
	if (pc.isBro()) invTooltip += " Maybe there’ll even be some hotties to reward you for your heroism.";
	
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
	
	output("If there really is someone in danger, then it’s worth risking the possible trap. Just in case, though, you take a route that keeps you closer to the nebula. The concentration of plasma and scattered material will make you harder to detect.");
	if (pc.characterClass == GLOBAL.CLASS_ENGINEER) output(" You remember that from some of the technical manuals you read.");
	else output(" One of your buddies from back in the day taught you that, saved your ass a few times already.");
	output("\n\nEventually you get close enough to be able to see the ship. It’s an old Pyrite Industries freighter. Probably broke down out here. Pyrite ships aren’t exactly known for their reliability, especially as they get up there in age. You pull out of the nebula’s range and try and open a comm channel. As you’d expect, the ship’s communication systems are down. Time for a rescue mission.");
	output("\n\nThe second you start to close in, your sensors pick up an unknown weapon’s discharge, and before you can react, you’re hit. The whole ship shudders from the impact, the projectile seeming to go right through your shields. Lights dim, power failure warnings start blasting before fading out. Soon you’re down to nothing but emergency life support and a few lights.");
	
	if (annoIsCrew())
	{
		showAnno();
		
		output("\n\nAnno comes barreling into the bridge, pulls out a maintenance panel from the wall and starts to work.");
		output("\n\n<i>“What just hit us?”</i> You ask, thinking she might know a bit more about this stuff than you.");
		output("\n\n<i>“If it blew through the shields like that, then it was at least a Class 3 EMP shell. Which means we need to get the fuck out of here. That’s military-grade shit, boss; if they have that level of tech, then we don’t want to mess with th-”</i> A sudden flurry of sparks cuts her off, as smoke starts billowing out of the hole. Anno comes out, coughing up a fit as she starts cursing in irritation.");
		output("\n\n<i>“I’m guessing we’re fucked now?”</i>");
		output("\n\n<i>“Yep!”</i>");
		output("\n\nAnother shock rocks the ship. This time it doesn’t feel like an explosion, and you hear noises coming from the airlock.");
		output("\n\n<i>“Well, at least they’re boarding us instead of just blowing us up. I’ll go grab some weapons and meet you at the airlock. If we’re lucky, their bark is a lot worse than their bite.”</i> She dashes out as another series of small quakes ring out. You grab your [pc.weapon] and head to the airlock ahead of her.");
	}
	else
	{
		if (canFix) output("\n\nYou pull off a maintenance panel and get to work, seeing if there’s any way to restore at least some power. Shit, this is bad; some of the wiring and circuitry is already burned out. You try and rewire it to bypass the damaged parts, but only manage to make things worse. You’re not getting out of this with any quick repairs, and there’s no time to do anything in-depth.");
		else output("\n\nYou’re way out of your depth with any of this. Things are broke, shit doesn’t work, and you have no idea where to start, how to start, or what you’d even start doing.");
		output("\n\nAnother shock rocks the ship. This time it doesn’t feel like an explosion, and you hear noises coming from the airlock. They’ve docked with your ship. At least they didn’t just blow you to bits. You grab your [pc.weapon] and set off for the airlock. Hopefully you’ll have a better chance fighting them in person.");
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
	if (flags["SHIZZY_TRAP_ENCOUNTERED"] == 1) output("\n\n<i>“Well well well, ya fell for that one quick, didn’t ya? I thought you were supposed to be smart? Well, doesn’t matter much, you’re gonna tell me what I need to know or else this won’t be-”</i>");
	else output("\n\n<i>“Ya sure took your sweet fucking time! I was starting to think that you’d figured it out, but here we are. Now, you’re going to tell me everything, or else this won’t be-”</i>");
	output("\n\nA loud clang rings out as the figure that was talking screams and falls forward, splitting the leftover smoke from the explosion as she impacts the floor.");
	output("\n\n<i>“WINSTON, YOU AND MIKA WERE SUPPOSED TO FIX THAT LOOSE STRUT!”</i> She screams at a large, scruffy looking huskar man.");
	output("\n\n<i>“There’s a hell of a lot more broken in this old piece of shit than that strut, give me a break!”</i> The man replies in a deep voice.");
	output("\n\n<i>“Yeah, we barely got this thing in shape for today.”</i> Another female voice says. You can’t see this one. She must be pretty far back there.");
	output("\n\n<i>“Fiiiiiine, sorry.”</i> The first woman says as she picks herself up off the ground. As she stands up, you realize that, sweet fuck, she’s tall!");
	if (brynnIntroduced()) output(" She’s about on par with Brynn, maybe even taller. Of course, it doesn’t seem to matter how many eleven foot tall people you see, it never stops being surprising.");
	else output(" At about eleven feet, by your estimation, she’s about the tallest normal person you’ve seen so far.");
	output("\n\n<i>“I knew we should have just let Mika rip the ship open and drag him out.”</i>");
	if (pc.isFeminine()) output(" Wait, him?");
	output("\n\n<i>“Please don’t encourage her, Shizuya.”</i> A calm, but stern toned voice calls out. The woman steps into view, revealing herself, and");
	if (flags["MET_VANAE_HUNTRESS"] != undefined || flags["MET_VANAE_MAIDEN"] != undefined) output(" you recognize her as one of the Vanae. A weird thing you see immediately is that she seems to have a working pair of eyes. Though, on closer inspection, her eyes appear to be cybernetic, or at least enhanced in some way.");
	else output(" you don’t quite recognize her species, but your codex beeps out that she’s something called a vanae. Weird, it says their eyes are vestigial, but her’s seem to be working fine, must be implants or something.");
	output(" <i>“You know that would have been far too risky.”</i>");
	output("\n\n<i>“You mean it would have been far too fun?”</i> The unseen woman calls out, mockingly.");
	output("\n\n<i>“Ugh.”</i> The vanae grunts out, not paying any more thought to the comment. <i>“Now, captain, your plan worked; are you going to stop beating yourself up over it now?”</i> She says to the tall woman, smiling expectantly.");
	output("\n\n<i>“It was a pretty bad plan, honestly. I’m surprised it worked!”</i> The tall woman says, somewhat dejectedly in response. The vanae’s smile quickly disappears, and she just grunts out again. While nobody’s looking at you, you quietly reach for your [pc.weapon]. You’re not sure if you can take three of them, and probably a lot more from the sounds deeper in, but you’re not willing to go out without a fight. A shot suddenly lands between your hand and your weapon just as you get within reach. The huskar is holding a large handgun, twirling and flipping it around his finger.");
	output("\n\n<i>“Good grief, did you really think I wouldn’t see that? You kids today aren’t that bright. Back in my day we kept emergency grenades up our asses; it worked great, until Jenkins had to ruin everything. Remember kids, loose anuses sink ships, literally in this case.”</i> What the hell is he talking about?");
	output("\n\n<i>“You know I only have so many grunts I can make in a row before my throat starts to hurt?”</i> The vanae quips.");
	output("\n\n<i>“Wow, Adelline makes a joke! Anyone see a flying pig around here? If you do, tell that fucker he owes me two-hundred credits.”</i> The two get into a back-and-forth scuff, trying to one-up each other. You’d think the huskar would be distracted by this, but the way he aims his gun at you when you try to move says otherwise. The tall woman has mostly been engrossed in their conversation, but the occasional glances in your direction tell you that she’s also still keenly aware of you.");
	
	if (pc.femininity >= 60)
	{
		output("\n\nShe looks over at you with a puzzled look on her face. <i>“Aren’t ya supposed to be a guy?”</i>");
		output(pc.mf("\n\n<i>“I am.”</i>\n\n<i>“Okay, okay, I see.”</i>", "\n\n<i>“Says who?”</i>\n\n<i>“I mean, whatever.”</i>"));
	}
	
	output("\n\nShe turns to you fully, an act that seems to signal to her arguing companions that it’s time to get serious. <i>“Alright Judau, you know exactly why we’re here. Your contact already squealed on ya, told us you knew where to find one of the bigwigs of the operation. It’d work a lot better for ya if you just spilled it right now.”</i>");

	if (pc.short.toLowerCase() == "judau") output(" Contacts? Bigwigs? What is she talking about?");
	else output(" Who the hell is Judau? What is she even talking about?");
	if (pc.isNice()) output("\n\n<i>“Um, I think you have the wrong person. I have no idea what you’re talking about.”</i>");
	else if (pc.isMisch()) output("\n\n<i>“Wow, you know I really appreciate you frying my ship because you can’t get your facts straight.”</i>");
	else if (pc.isAss()) output("\n\n<i>“Bitch, what are you even talking about?”</i>");

	output("\n\n<i>“Don’t try and weasel out of this! We knew you’d be coming by this route, who the hell else would?”</i>");
	output("\n\n<i>“What do you mean?”</i>");
	output("\n\n<i>“What do ya mean what do I mean? This route is only safe for a very small amount of time, and only smugglers like you, and bitches like us who have to be on your ass, keep track of that.”</i> Say what? Before she can say anything else, the huskar man comes up to her and begins whispering in her ear.");
	output("\n\n<i>“What?”</i>");
	output("\n\n<i>“I SAID THAT’S " + pc.short.toUpperCase() + " STEELE!”</i> The man comically yells.");
	output("\n\n<i>“I DIDN’T MEAN TO SCREAM IT!”</i> The woman replies.");
	output("\n\n<i>“I KNOW!”</i> Winston screams back. The large woman raises her hands like she’s about to throttle him, but slams them into her own face instead. She holds her double face-palm for at least a minute, occasionally shrieking into her palms. Eventually she slides her hands down off her face.");
	output("\n\n<i>“Okay. Okay, okay, okay, okay, okay, O. FUCKIN’. KAY! This is why you don’t let me come up with the plans.”</i> She says, looking back at her other crew members. Adelline keeps up a disappointed scowl while Winston just blows a quick raspberry. She turns back to you.");
	output("\n\n<i>“Ya okay, buddy? You can probably figure out that there was, uh, a little mix up here.”</i> You stand up and stare at her, wordlessly and angrily. <i>“I guess we owe ya an explanation huh?”</i> Damn right they do! Part of you wants to lay into them, but you also realize that they still massively outgun you, so you need to take this carefully.");

	if (annoIsCrew())
	{
		showBust("SHIZUYA", annoBustDisplay());
		output("\n\nSuddenly Anno bursts out from behind you, brandishing what looks like the biggest rifle she could find. <i>“Don’t worry [pc.name], I got your ba-”</i> Anno stops, staring at the woman with a confused look on her face, as if she’s trying hard to remember something. The woman has the same look, but she quickly perks up and starts to speak.");
		output("\n\n<i>“Anno? Is that you? Holy crap, I haven’t seen you since... well, ya know.”</i> Anno takes a few more moments surveying, before everything seems to click. <i>“Shizuya?”</i> She hesitantly asks. The woman nods enthusiastically in response. <i>“Wh-what the hell did you do to yourself? Better yet, why did you attack us?”</i> She raises her gun up, leveling it at Shizuya.\n\n");
		if (annoIsHuskar()) output("<i>“What did I do to myself? Look at you, all, uh... umm...”</i> She devolves into gibberish as she looks over Anno’s new curves, utterly lost until Anno feins a loud cough and draws the kaithrit’s attention back to the husky’s heavy gun. ");
		output("Shizuya sighs.");
		output("\n\n<i>“Look, it’s really complicated; we thought you were someone else, so we kinda jumped the gun here.”</i> Anno still looks a bit unconvinced, and only slightly lowers her weapon. Suddenly the weapon is yanked from her hands and, before she can react, a box of tools is shoved in its place. Looking down, you all see a small, dark skinned cowgirl in front of Anno. How did she get there without you seeing?");
		output("\n\nYou take the time to examine her. She can’t be any taller than about four and a half feet, though she certainly manages to pack a lot into her small frame. The loose-fitting, black tank top she wears lets you see how ripped her arms and back are. They flex with an unnatural strength, and several odd bulges and metal protrusions tell you that she’s had some augmentation done. Her short, black hair is tied up into a small ponytail, letting you see one more augment going down her neck.");
		output("\n\nIt’s a thin metallic strip leading from her head to a small set of openings at the base of her neck.");
		if (knowImplant) output(" You remember reading about something like this not too long ago. It’s a form of power armor interface, used to provide the user with quick, accurate control over larger power armor frames. You don’t recall reading about a price, but you’d certainly think that it would be out of the reach of a bunch of normal bounty hunters.");
		else output(" You’re certainly not well-versed enough in this kind of thing to really know what they’re for, but it looks way too expensive for a bunch of bounty hunters.");
		output(" Then again, they’ve already shown that they have some access to some pretty beefy hardware.");
		output("\n\n<i>“Come on then, we’re not getting this heap fixed up by standing around.”</i> The little lady says, aggravatedly. Anno tries to say something, but the little cowgirl just walks off, carrying her own toolbox. Anno’s eyes dart between you and her, trying to decide what to do. Shizuya chimes in. <i>“Relax, I’m not gonna do anything bad back here, and Mika’s not gonna bite ya unless you ask.”</i>");
		output("\n\nAnno still seems a bit flustered about the situation. not sure how to go about dealing with it. <i>“HEY SNOWY, THE SHIP ISN’T FIXING ITSELF. GET YOUR ASS OVER HERE!”</i> Anno jumps at the sudden shout from Mika, letting out an irritated growl before finally deciding to go with her.");
	}
	else
	{
		if (pc.tallness < 5 * 12 + 2) output("\n\nYou see a dark skinned cowgirl walking out from behind the rest of them. She’s about on par with you, in terms of height. She’s carrying a large toolbox, and has an irritated look on her face. She approaches you surprisingly quickly and quietly; if she weren’t near eye-to-eye with you, you might not even notice her coming up.");
		else output("\n\nA sudden tug on your leg brings your attention to a little, dark skinned cowgirl at your feet.");
		output("\n\nYou take the time to examine her. She can’t be any taller than about four and a half feet, though she certainly manages to pack a lot into her small frame. The loose-fitting, black tank top she wears lets you see how ripped her arms and back are. They flex with an unnatural strength, and several odd bulges and metal protrusions tell you that she’s had some augmentation done. Her short, black hair is tied up into a small ponytail, letting you see one more augment going down her neck.");
		output("\n\nIt’s a thin metallic strip leading from her head to a small set of openings at the base of her neck.");
		if (knowImplant) output(" You remember reading about something like this not too long ago. It’s a form of power armor interface, used to provide the user with quick, accurate control over larger power armor frames. You don’t recall reading about a price, but you’d certainly think that it would be out of the reach of a bunch of normal bounty hunters.");
		else output(" You’re certainly not well-versed enough in this kind of thing to really know what they’re for, but it looks way too expensive for a bunch of bounty hunters.");
		output(" Then again, they’ve already shown that they have some access to some pretty beefy hardware.");
		output("\n\n<i>“Hey, do you know how to fix this heap up?”</i>");
		if (canFix) output("\n\nYou explain that you’ve never <i>really</i> gotten too deep into how to fix it up, but you could...\n\n<i>“Ugh, nevermind, don’t have time to teach a noobie.”</i>" + (pc.isAss() ? " Little cunt." : ""));
		else output("\n\nYou tell her that you have no fucking clue.\n\n<i>“Figures.”</i> She rolls her eyes.\n\n");
		if (pc.tallness < 5 * 12 + 2) output("You hear a soft squealing from behind her, and see Shizuya staring at you, delightedly.\n\n<i>“Soooooooo cute!”</i> She whispers under her breath. The little cowgirl goes red on hearing that. ");
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
	
	output("Here you are, face to face with the strange intruders. For people who must be professionals, given the hardware they have, they’re very... What’s a nice word for dysfunctional? Winston and Adelline are back at arguing. What they’re arguing about escapes you, and Shizuya too, apparently.");
	if (silly) output(" She’s taken to squatting on the floor and cracking open a bottle of vodka. She takes a big sip before offering some to you.\n\n<i>“Suka blyat.”</i> What? <i>“Want some?”</i>\n\n<i>“No thanks.”</i>\n\n<i>“Suit yourself, comrade.”</i>");
	else output(" She’s taken to sitting on the floor and cracking open a soda. She takes a big sip before offering some to you.\n\n<i>“Want some?”</i>\n\n<i>“No thanks.”</i>\n\n<i>“Suit yourself.”</i>");	
	output("\n\nA blonde gryvain woman interrupts the argument, dragging Adelline away, leaving Winston all by himself. Without anything else to do, he comes over to you and introduces himself.");
	output("\n\n<i>“Winston Seabook, nice to meet you.”</i> He extends his hand out, and you meet his gesture, if only to not make this too awkward.");
	output("\n\nYou take the time to look him over: He’s a tall man, a little over seven feet and very grizzled despite his youthful energy, easily over fifty from his looks. His hair is short and blonde, and an equally short, well-trimmed beard wraps around his squared jaw-line. His eyes are a piercingly bright shade of blue, almost white. He’s definitely muscular, built like a small tank, with a washboard stomach that you could probably grate cheese on. The biggest thing to note, however, is the massive amount of scars across his body.");
	output(" The arm he’s shaking your hand with is covered in large bald spots along its blonde fur, giving way to various burns and scars. The simple white tank top he sports is low cut enough for you to see a large gash just below his neck, barely visible under his fluffy, blonde mane. And, lastly, his other arm is completely bandaged up, small glints of metal showing between the wrappings. His massive tail is extremely large and fluffy. Unlike the rest of him, it looks pristine, groomed, and incredibly soft.");
	if (pc.characterClass == GLOBAL.CLASS_MERCENARY) output("\n\nWait, Seabook? Why does that name sound familiar? Oh wait, you remember! He was a big shot at one of the larger merc companies, back in the day. No wonder he was so accurate.");
	output("\n\n<i>“So, Steele’s kid, huh?”</i>");
	output("\n\n<i>“Yeah? You knew him?”</i>");
	output("\n\n<i>“Naaaaaaaaaah, I just looked you up a few minutes ago after I thought this didn’t seem right. I thought Steele Tech made ice cream or some shit, but I guess they do other stuff.”</i> You get the impression that he’s not being completely honest.");
	output("\n\n<i>“Questions, comments, suggestions? We got plenty of time to kill.”</i>");

	addButton(0, "Him", shizzyAskWinstonHim, undefined, "Him", "Who is he?");
	addButton(1, "Them", shizzyAskWinstonThem, destination, "Them", "Who are they?");
	addDisabledButton(2, "No", "No", "You should at least ask who they are.");
}

public function shizzyAskWinstonHim():void
{
	clearOutput();
	showBust("WINSTON");
	author("QuestyRobo");
	
	if (pc.characterClass == GLOBAL.CLASS_MERCENARY)
	{
		output("<i>“Seabook, huh? I know that name.”</i>");
		output("\n\n<i>“Oh boy, you’re going to bring it up aren’t you?”</i> Bring what up? Wait, was there something? You never really paid much attention to him beyond the basics. Oh right, he...");
		output("\n\n<i>“So what if I blew my boss’s head off and collapsed Emeraude overnight in a sea of blood and bullets? People do bad shit all the time. Why I bet you haven’t even paid your taxes, have you?”</i> Oh, yeah, that was the thing. Wait, taxes? Are you supposed to pay those? <i>“In all seriousness, I had good damn reasons to do what I did.”</i>");
		output("\n\n<i>“Which are?”</i>");
		output("\n\n<i>“I said we had time to kill, not time to stuff in a burlap sack, drag down to the river, and hold it down until the bubbles stop.”</i> ... Wow. <i>“You want to keep talking about this now, or are we moving on?”</i>");
		output("\n\n<i>“Yeah, let’s just move on.”</i>");
	}
	else
	{
		output("<i>“You’re a pretty good shot; military, merc?”</i>");
		output("\n\n<i>“Oh, I scaled the tallest peaks of the most dangerous planets in order to find the greatest gunmen to teach me their ways. But it turned out that they either didn’t live up there, or they were ungodly expensive; so I just became a merc and learned from there.”</i>");
		output("\n\n<i>“You just have a story for everything, don’t you?”</i>");
		output("\n\n<i>“Not <b>everything</b>, but I’ve got some killers if you want to know where the bathroom is. It’s not all bullshit either. I did climb a mountain, once, and the fucker up there was charging an arm a leg, and probably about a fifth of a gallbladder for lessons.”</i>");
		output("\n\n<i>“Alright alright, let’s get to some actual questions.”</i>");
	}
	
	output("\n\n<i>“Okay, what’s with the arm?”</i>");
	output("\n\n<i>“Ah, you see my father was a warm-blooded spaceican who loved wearing black and had an unreasonable hatred of sand. One day we were playing on the rafters of one of his factories and he cut it off with his laser sword.”</i>");
	output("\n\n<i>“... Can you give a serious answer for once.”</i>");
	output("\n\n<i>“Well that’d just ruin the illusion wouldn’t it? Don’t want people thinking I’m smart or something.”</i> This is getting maddening!");
	output("\n\n<i>“Okay, where are you from?”</i>");
	output("\n\nYou ask, expecting another nonsense answer. <i>“Melkia, it’s a huskar colony in the Gilgamesh system.”</i> Wow, a straight answer for once.");
	output("\n\n<i>“Yep, my mom was a dickgirl, and I was born out of my dad’s asshole.”</i> Well, it was nice while it lasted.");

	addDisabledButton(0, "Him");
}

public function shizzyAskWinstonThem(destination:String):void
{
	clearOutput();
	showBust("WINSTON");
	author("QuestyRobo");
	
	output("<i>“So, who are all of you?”</i>");
	output("\n\n<i>“All of me? Well, I’m all of me, unless you mean my little me, in which case you need to wash your brain of such lewd thoughts, young " + pc.mf("lad.”</i>", "lady.”</i>"));
	if (pc.isNice()) output(" You scream internally, but keep a polite face.");
	else if (pc.isMisch()) output(" You start mock laughing. Very loudly. He joins you. It’s fun.");
	else output(" You grunt in irritation, giving him your best “I’m going to punch you” stare.");
	
	output("\n\n<i>“No really, who are all of you?”</i>");
	output("\n\n<i>“Ummmmm, I want to say bounty hunters, I guess that’s right, sort of. What we’re doing here isn’t exactly standard operating procedure, if you know what I mean.”</i>");
	output("\n\n<i>“I don’t.”</i>");
	output("\n\n<i>“Kid, it’s fucking complicated. We’re members of Black Iron. You heard of ‘em? Probably not, wouldn’t take you as someone to get involved in that kind of stuff. Big JAF and UGC affiliated PMC, basically we do the military’s bitch work when they don’t feel like sending their own guys in. Right now, can’t say too much, that means trying to find a guy who’s most likely dead, because some admiral pissed himself over some new drug or some shit.”</i>");
	output("\n\n<i>“That sounds like something the UGC should be handling themselves.”</i>");
	output("\n\n<i>“It does, doesn’t it? The way they see it, finding the guy or guys is secondary to making sure the drug doesn’t spread around too much. They’ve got a ton of guys on that, so they figured why not call in those disposable chumps to do the heavy lifting? Besides, all they’re thinking right now is that some son of a bitch stumbled on data that he really shouldn’t have. If that’s right, then they’ve probably spread it around so much that knocking off just one or two guys isn’t going to cut it.”</i>");
	output("\n\n<i>“Why bother then?”</i>");
	output("\n\n<i>“Like I said, one of the admirals on the board thinks that it might be something bigger, again, can’t tell you details. He’s got the board curious enough to look into it, but not enough to really commit too many resources to make a real effort. Our boss has a pretty personal stake in finding out who’s behind this, too.”</i>");
	output("\n\n<i>“How so?”</i>");
	output("\n\n<i>“Let’s just say these guys haven’t exactly made many friends, with anyone. Slippery shits.”</i>");
	output("\n\n<i>“What happens when you find them?”</i>");
	output("\n\n<i>“If we confirm that someone else created and distributed the drug, then we call in the cavalry, and get a nice bonus. If by some miracle the fucker is alive, ho boy, shit gets complicated. Cause he’s supposed to be dead, and everyone’s been going on like he’s dead, so if he’s not, that throws a lot of shit out.”</i>");
	output("\n\n<i>“Would you guys fit into that?”</i>");
	output("\n\n<i>“Eh, probably not. I’d hope we would, be better than paperwork, but the UGC isn’t gonna let a bunch of nobodies and an old psycho handle a big job, are they? Oh well.”</i>");
	
	addDisabledButton(1, "Them");
	addButton(2, "No", shizzyEnoughQuestionsAlreadyJeez, destination, "No", "No more questions.");
}

public function shizzyEnoughQuestionsAlreadyJeez(destination:String):void
{
	clearMenu();
	clearOutput();
	showShizuya();

	output("<i>“Well, I don’t have much to do around here. I’ll come back if I think of something else stupid to say.”</i> With that, he walks back through the airlock, striking a pose that seems genuinely thoughtful.");

	output("\n\nThat just leaves you and Shizuya. Many awkward minutes filled with nothing but the occasional clatter of metal as " + (annoIsCrew() ? "Anno and Mika work" : "Mika works") + " on getting your ship back in working order. Shizuya finishes her drink in short order, and just sits and stares at you.");
	output("\n\nYou finally have time to just look over the massive kaithrit. She has short, unkempt red hair, parted by a pair of cat ears, one of which has a large chunk of it missing. She also has a pair of large ram horns that wrap around behind her head. Her face has several noticeable scars across it. They’re not fully faded yet, so they must be recent. Her eyes fade from green to red as they approach her slitted iris, though the red is very slight.");
	output("\n\nHer body is clad in thick military padding, the kind of stuff you’d see on SWAT officers. It hides most of the features you could make out on her body, except for the unmistakable curve of her massive breasts. She’s wearing a skirt too, and upon closer examination, what appeared to be pants are actually thigh highs, with a heavily bulging pair of panties peeking out.");

	if (pc.tallness < 5 * 12 + 2)
	{
		output("\n\nShe looks incredibly happy as she looks over your diminutive size. It’s not predatory or condescending, instead she radiates a sort of protective adoration, like she could sweep you up in her arms and protect you from anything.\n\n<i>“Wanna hop up, little " + pc.mf("guy", "girl") + "?”</i>");
		if (pc.isBimbo())
		{
			var args:Array = new Array(destination, 3);
			addButton(0, "Yes", shizzyIntroductionPartEinsEpilogue, args);
			if (silly) for (var i:int = 0; i <= 14; ++i) addButton(i, "YES", shizzyIntroductionPartEinsEpilogue, args);
		}
		else
		{
			addButton(0, "Yes", shizzyIntroductionPartEinsEpilogue, [destination, 2]);
			addButton(1, "No", shizzyIntroductionPartEinsEpilogue, [destination, 1]);
		}
	}
	else addButton(0, "Next", shizzyIntroductionPartEinsEpilogue, [destination, 0]);
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
			output("Cuddle sense tingling! Must engage hugs! You fly into her arms as soon as she finishes talking, helping her unzip her padded shirt so that you can get at her big ol’ titties! Once they’re exposed, you shove yourself between them, feeling the warmth of being so engulfed spread throughout you. You beam at each other, relishing the feeling of closeness.");
			output("\n\n<i>“You’re so precious.”</i>");
			output("\n\n<i>“So are you!”</i> You reply as you settle in.");
		}
		else
		{
			output("Why not? You walk up to the towering kitty woman, presenting yourself to be picked up. She reaches for you, but stops halfway. <i>“Hold on a sec.”</i> She zips down her shirt, revealing a canyon of cleavage. <i>“There ya go, best seat in the house.”</i> She presses her breasts together for emphasis.");
			if (pc.hasCock())
			{
				output(" Your [pc.cocks] " + (pc.hasCocks() ? "are" : "is") + " rock hard at the thought of being nestled in that bountiful boobage. She gives you a cheshire smile as she looks at your");
				if (pc.isCrotchGarbed()) output(" bulge.");
				else output(" blatantly exposed " + (pc.hasCocks() ? "dicks" : "dick"));
			}
			output("\n\nShe grabs you, hoisting your diminutive frame easily, and plants you in her boobs. You have to squirm a bit in order to get yourself fully embedded in her tits.");
		}
		output("\n\nIt’s undeniably comfortable, like being engulfed in a big, soft bed that’s also giving you a gentle massage. A combination of her heavy heartbeats and full-body purring creates an effect not too dissimilar to a massage chair, working out all of your built up stress and aches. It’s comfy as shit, to make it short.");
		output("\n\nYou sigh as you settle in. You could live in these tits.\n\n");
	}
	//PC said no, but cuddles were offered
	else if (choice == 1) output("She looks very disappointed as you tell her, no. <i>“Come oooooon, you’d love it!”</i>\n\n<i>“No.”</i> She huffs at your response, begrudgingly accepting that she won’t be able to snuggle with your bad self.\n\n");

	output("About an hour passes, very uneventfully. The only thing keeping you busy has been small bouts of inconsequential chatter between you and Shizuya; You learned that she likes to cook, that she’s married and her wife recently gave birth to twins, and many less wholesome things about how much she loves bondage. Hot.");
	output("\n\nEventually the lights start to flicker back to life. You check your codex and see that system power is at 40%. It’s not enough to get the ship back moving, but enough for the main systems to kick back in.");
	if (annoIsCrew()) output(" They’ve been at this for a while , maybe you should check up on them?");
	else output( "She’s been at this for a while , maybe you should check up on her?");
	
	//PC in tittays
	if (choice >= 2)
	{
		output("\n\nShizuya has fallen asleep by this point, content to cuddle with you until the ship’s fixed. You reach up and give her face a few taps to wake her up.");
		output("\n\n<i>“Hmm, huh? What’s up, is the ship fixed?”</i> You tell her that it’s not, but you wanted to go check up to see how it’s going. <i>“Hmmmm, sure, I need to go get something set up anyway.”</i> She lifts you out and sets you on the ground, getting ready to go back into her own ship.");
	}
	else
	{
		output("\n\nShizuya has been messing around with her codex for the past hour, looking up various things, chatting with friends.You give her the heads up that you’re going to check and see how things are going with the repairs.");
		output("\n\n<i>“Oh, ok. Um, I’ll be back, gotta get some things set up on the ship.”</i> She gets to her feet and gets ready to go back to her ship.");
	}
	
	output("\n\n<i>“What are you getting ready?”</i>");
	output("\n\n<i>“Gonna get the kitchen fired up to cook some ‘sorry I almost blew up your ship’ food.”</i> Well then, that sounds pretty nice. Adelline comes back before Shizuya can even get to the entrance of the airlock.");
	output("\n\n<i>“I’m afraid that’ll have to wait, the kitchen is in no condition to be doing anything.”</i> Shizuya freezes, first in confusion, and then anger.");
	output("\n\n<i>“Wh-what the? How did... It was Tiffa again, wasn’t it?”</i> Adelline nods in response. <i>“Is she still using her pussy to store plasma cartridges?”</i>");
	output("\n\n<i>“Of course she is.”</i> Adelline dryly responds. From out of the airlock, another voice echos out.");
	output("\n\n<i>“See kids, loose assholes! Well, vaginas in this case.”</i> It’s Winston; of course it is.");
	output("\n\n<i>“Did anyone ask you for input!?”</i> Adelline yells out, angrily.");
	output("\n\n<i>“Addy, I promised the kid I’d come back if I had something stupid to say. I’m a man of word, so here I am.”</i> Adelline grunts out again, noticeably straining to get it out. Guess she wasn’t joking, earlier.");
	output("\n\n<i>“Well fuck. Are the food stores at least okay?”</i>");
	output("\n\n<i>“Yes, they were untouched in the blast.”</i>");
	output("\n\n<i>“Perfect!”</i> Shizuya turns back to you. <i>“You’ve got a kitchen, right?”</i> Of course you do. <i>“Great, we’ll cook here! Just let me get everything together and I’ll be back.”</i> She darts off before you can say anything.");
	output("\n\nWell, looks like your kitchen is going to be getting some use.");
	if (yammiIsCrew()) output(" You hope Yammi won’t mind having some extra cooks in the kitchen.");
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
		showBust(annoBustDisplay(), "MIKA");
		showName("ANNO\nAND MIKA");
		
		output("You find Anno working on an open panel on the floor. There’s another panel at the top of the wall that’s been removed, and it looks like Mika is in that one. Occasionally she’ll ask Anno to pass her a tool or take one away. Anno spots you across the hall, waving you over with an exhausted smile.");
		output("\n\n<i>“Hey, boss, repairs are coming along great. We should be back up and running in another hour.”</i> A rattling comes from up above, getting closer. An arm comes out of the open panel.");
		output("\n\n<i>“Hey, Snowy, pass me the bolt extractor.”</i> Anno rummages through Mika’s toolbox and pulls out the tool, passing it up to Mika.");
		output("\n\n<i>“Hey, do you still need that wire welder?”</i> Anno says as Mika takes the tool. A moment passes before Mika returns with a small welding kit, which she passes down.");
		output("\n\n<i>“Thanks.”</i>");
		output("\n\nAnno gets back to work on her panel. <i>“It’s a good thing she’s here, I hate trying to squeeze in up there.”</i>");
		output("\n\n<i>“So, she’s been alright?”</i>");
		output("\n\n<i>“A little pushy, but yeah, she’s alright.”</i> She closes in on you and starts to whisper. <i>“She’s cute as fuck too. Have you seen " + (silly ? "dat" : "her") + " ass? Mhmm!”</i> She gives an okay sign for emphasis. <i>“So, what’s been happening with you?”</i> You explain all the things that Shizuya told you. <i>“A wife and kids? That woman works fast, doesn’t she? Never took her for a charmer, but I guess she’s had some ‘changes’ since then.”</i> She bites her lip a bit at that. <i>“Say, wanna help me talk these girls into some ‘dessert’?”</i>");
		output("\n\n<i>“I’m not deaf, you know.”</i> Mika interrupts before you can answer, hoping out of the wall. <i>“What’s there to talk into? You wanna fuck, I’m down to fuck.");
		if (pc.femininity <= 40) output(" Weeeell, maybe [pc.he]’ll need to do some talking.");
		output(" But, we got a job to do , sex comes later.”</i> Anno feigns a huff as Mika picks up her toolbox and starts walking over to the next point of repair. The pale pup is almost shameless in ogling her ass as she walks. You can’t blame her, even in the baggy cargo pants Mika is wearing, her ass manages to make a noticeable indent, and jiggles like two perfectly molded gelatin domes.");
		output("\n\nYou’re both so captivated that you don’t even notice when she looks back at you.");
		if (pc.isNice()) output(" You and Anno both go red, a slight look of shame coming over your faces, though you’re pretty sure Anno is faking it.");
		else if (pc.isMisch()) output(" You and Anno immediately look away, pretending like you weren’t looking.");
		else output(" Anno looks away, but you keep looking, even giving her a thumbs up on that delicious rump.");
		output(" She looks mad, but the way she starts swaying her hips says that she’s actually enjoying the attention.");
		output("\n\n<i>“Better get moving, lot of stuff left to fix. Hey, if you don’t have anything else to do, why don’t you come with? We could use the help.”</i> Why not? You help Anno finish up here before moving on. On the way there, you decide to finally ask Anno how she knows Shizuya.");
		if (flags["SHIZZY_ANNO_MENTIONED_AKKADI"] != undefined) output("\n\n<i>“Remember when I told you I got my own team for the warp gate project at Akkadi? She was one of them.”</i>");
		else output("\n\n<i>“It’s a long story, but the gist of it is; back at Akkadi I got on a project to upgrade the tech used in warp gates, got my own team and everything. She was one of the people who got assigned to my team.");
		output(" She was a lot different back then, I’d say she was just a bit taller than Mika, skinny as a rail too. Not much to really say; she was nice, fun, knew what she was doing, could hold her drinks like a machine. Stars, I remember this time we were out celebrating a big find in our research, and this nine or ten-foot Treated guy was harassing us. She challenged him to a drinking contest, and she drank him so far under the table that he could barely speak. The look on his face was priceless!”</i>");
		output("\n\n<i>“Sounds like you had fun, what happened?”</i>");
		output("\n\nShe sulks a bit at your question.");
		if (flags["SHIZZY_ANNO_MENTIONED_AKKADI"]) output("\n\n<i>“You remember what I told you, the project went wrong, really wrong.");
		else output("\n\n<i>“The project went bad, really bad. We got pushed into testing the tech on people before it was ready. A few people died, and some might have even got it worse.");
		output(" Everyone got shaken up at that, but I think Shizuya took it the worst. Her boyfriend was one of the people who went through, poor guy didn’t even come out the other side.”</i>");
		output("\n\nOuch. <i>“She must have been devastated.”</i>");
		output("\n\n<i>“She spent a week combing over the data, even after the rest of us gave up on finding them. Best conclusion we came up with is that they just never rematerialized right, and their particles got scattered into space. After that she just quit, said she couldn’t take it anymore. Looking back, it might have been better if I’d gone with her like I was thinking, but that was when I was too naive to realize that the higher-ups didn’t give two shits about actually learning from mistakes.”</i>");
		output("\n\nJeez...");
		output("\n\n<i>“Sorry for getting so down, it’s a bit of a sore subject");
		if (flags["SHIZZY_ANNO_MENTIONED_AKKADI"]) output(", you probably know that already");
		output(". I don’t know what happened after she left; she said she’d stay in touch, but this is the first time I’ve seen or heard from her since. I can see why, now.”</i>");
		output("\n\nMika stops ahead of you and starts to examine some of the damage. <i>“Anno, I’m going to need you to fix the R218 and C902 circuits. Steele, you stay here and help me out with this.”</i> Anno nods before moving over to a distant circuit panel, leaving you alone with Mika.");
		output("\n\nAt least you think Mika is here. You turn around after watching Anno turn a corner to see that the little twerp is nowhere in sight. You wonder where she went, only to realize all too late that she’s somehow managed to climb up into an open vent, and she jumps out as soon as you notice. There’s no way you could duck out of the way of such a large object before it connects with your face, and you’re sent tumbling to the ground, Mika’s dusky ass cheeks blocking out everything else.");
		output("\n\n<i>“Must be getting pretty hungry. How about we stop for a quick meal? Don’t worry about Anno, I prepared enough for both of you.”</i>");
		output("\n\nHer fat, chocolate pussy is pressed right up against your nose, drooling obscene amounts of pheromone-laden girlcum down your face.");
	}
	else
	{
		showMika();
		
		output("As you move into the hall, you’re surprised to see that Mika isn’t there. Her tools are laying against the wall, and there’s an open panel in ceiling, but you don’t see her anywhere. You decide to take a closer look at her toolbox. It has all the usual things you’d expect, some specialty equipment, from the looks of it, and... candy? There’s a <i>ton</i> of candy and other sweets sitting in what seems to be their own dedicated section of the box.");
		output("\n\nYou reach into the box, just to see if it’s some kind of joke. Suddenly you hear a loud rumbling from above, moving towards you. You look up just in time to get a face-full of ass as Mika drops down onto you.");
		output("\n\n<i>“Trying to steal my sweets, huh? Well, you’re going to have to eat dinner before you get dessert!”</i> What, dinner? It takes you a second to recover, and when you do, you realize that she’s not wearing pants!");
		output("\n\nYour nose is pressed right against her mons, only the thin, red fabric of her thong sitting between them. The curve of her huge, black ass dominates your vision as it jiggles like two fat bowls of jelly.");
	}
	
	if (pc.hasGenitals()) addButton(0, "Inhale", shizzyMikaNomNomNom, destination, "Inhale", "​Take a deeeep whiff of that good shit.");
	else addDisabledButton(0, "Inhale");
	if (!pc.isTreated() || !pc.hasGenitals()) addButton(1, "Push Off", shizzyNoMikas, destination, "Push Off", "Nope");
}

public function shizzyMikaNomNomNom(args:*):void
{
	clearMenu();
	clearOutput();
	showMika(true);
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
			addButton(0, "Penis", shizzyMikaNomNomNom, [destination, 1]);
			addButton(1, "Vagina", shizzyMikaNomNomNom, [destination, 2]);
			return;
		}
		else if (pc.hasCock()) mode = 1;
		else if (pc.hasVagina()) mode = 2;
		else if (silly) mode = 3;
		else
		{
			output("<b>Something has gone very wrong. Please report this.</b>");
			addButton(0, "Next", flyToWrapper, destination);
			return;
		}
	}
	
	if (pc.isTreated()) output("The scent of her sex seems to briefly skip your sense of smell and instead takes a shortcut right to your brain. Your Treated instincts spring into action, taking charge like an army general during a surprise attack. There’s a wet, ready cunt that hasn’t been filled yet! Get your lazy ass in gear, maggot! Your [pc.tongue] darts out, removing the cloth blockade with masterful speed and driving itself in.");
	else output("If you weren’t convinced Mika was Treated before, the overpowering musk is making damn sure that you are. Every nerve in your body lights up and stands to attention; it’s fucking time! Your [pc.tongue] moves out of your mouth on its own, slapping and flailing against her thong-covered cooch in a desperate attempt to get at the sweet honeypot. It’s a sloppy procedure, but your lust-fueled flailing eventually moves her pussy-soaked thong out of the way and digging into her.");

	output("\n\n<i>“Gooood, you’re just a natural pussy eater aren’t you? Is the taste of it so addicting that your mouth feels dry when you haven’t had a muff to munch on? Is the smell burning into your brain so that you never have to go without it?”</i>");
	output("\n\nYou want to respond; whether to deny it or gleefully accept your devotion to pleasing pussy is beyond your lust-drugged mind to decide. But you can’t respond. Every muscle in your mouth is dedicating itself to driving your [pc.tongue] into the choco-cow’s cunt.");

	if (mode == 1)
	{
		var cIdx:int = pc.longestCockIndex();
		
		output("\n\nYour [pc.cocks] " + (pc.hasCocks() ? "are" : "is") + " straining ");
		output((pc.isCrotchGarbed() ? "against your " + (pc.hasLowerGarment() ? "[pc.lowerGarment]" : "[pc.armor]") : "in the air"));
		output(", jealous of the privileged position that your tongue has. Mika takes eager note of your hardening member" + (pc.hasCocks() ? "s" : "") + ", extending out a foot to stroke [pc.oneCock].");
		
		if (pc.isCrotchGarbed())
		{
			output("\n\nHer dainty, dark toes expertly move across the bulge in your " + (pc.hasLowerGarment() ? "[pc.lowerGarment]" : "[pc.armor]") + ", teasing the sensitive flesh until pre starts " + (pc.cumQ() < 8000 ? "collecting at your tip." : "soaking through."));
			output("\n\nJust when you think she’s going to make you cum in your pants, she pulls off and yanks your clothes off with a graceful flourish, letting your tool" + (pc.hasCocks() ? "s" : "") + " spring out, flinging " + (pc.cumQ() < 8000 ? "faint drops" : "a splash") + " of off-[pc.cumColor] pre onto your [pc.belly].");
		}
		
		output("\n\n<i>“Oh ho, someone’s a little overeager. Let me guess.”</i> Mika brings her foot up to your [pc.cockHead]. <i>“You want this naughty boy inside me instead of your tongue?”</i> She flicks your head with her toe. The impact is a sublime mix of pain and pleasure, causing another " + (pc.cumQ() < 8000 ? "drop of pre to roll" : "spurt of pre to fly") + " out of your eager urethra. You begin to thrust your [pc.hips] on instinct, as your [pc.tongue] probes even deeper into her depths. Her Treated pheromones have you on full breed mode, thrusting anything getting stimulation in a desperate bid to sow your seed.");
		output("\n\n<i>“Yeah, you want in, don’t you?”</i> She starts stroking you, while you start eating her out faster. <i>“You want my tight, fertile pussy squeezing around your ");
		if (pc.longestCockLength() < 8) output("little");
		else if (pc.longestCockLength() < 12) output("fat");
		else if (pc.longestCockLength() < 18) output("big");
		else if (pc.longestCockLength() < 26) output("giant");
		else output("fuck-huge");
		output(" cock?”</i> You both go faster. <i>“You want me to scream your name in pleasure while I’m cumming my brains out around you?”</i> Faster. <i>“Your [pc.balls] tightening up from the sensation, brewing up a big, fat, fertile load at the thought of knocking up a curvy, Treated slut.”</i> Oh stars, you’re so close! And so’s she.");
		output("\n\nYour tongue is shooting in and out of her like a piston, drawing out fat splatters of girlcum with each thrust. It’s like eating a warm, ripe watermelon, so delicious and juicy that it’s worth having your face soaked in it, and soaked it is. You feel like you’re laying under a small, pulsing waterfall, each splash soaking your face and sense in a wash of pheromone-laced ambrosia. The runoff pools below you, soaking into your [pc.hair] and back, ensuring that you’ll reek of her cunt for at least the rest of the day.");
		output("\n\n<i>“Mmmh, feel how wet I am? Fuck, I’m just crying out to be bred! And you’d love to do it. You’d love to fill me with fertile cum, to watch my belly swell up with your cum, knocking me up with your little brats.”</i> FUCK, you can’t take it anymore! <i>“Cum, breeding slut!”</i> Mika lifts off of you in a flash, leaving your tongue slurping at empty air. Before you can react, she’s already on your [pc.oneCock], pressing it down against your [pc.belly] with her foot.");
		output("\n\n<i>“Cum!”</i>");

		if (pc.cumQ() < 8000) output("\n\nYou moan out loud as you unload on yourself, splattering streaks of [pc.cumColor] across your front. An errant drop hits your tongue, giving you a taste of your own [pc.cumFlavor] [pc.cumNoun].");
		else if (pc.cumQ() < 40000) output("\n\nYour urethra bulges enough to lift her foot up a bit as it transports your fertile cargo. Jets of [pc.cum] spray from your overworked cock, painting you in waves of [pc.cumColor] as Mika laughs at your obscene output.");
		else
		{
			output("\n\nMassive sperm-packed bulges obscenely distend your urethra. The curvaceous cowgirl notices this and presses her toe down on your cumvein, hard enough to stop your seed in its tracks. You groan out loud as your release is halted, fat floods of [pc.cum] melding together as they desperately seek an exit. In less than a minute the bottom half of your urethra is swollen beyond reason, pulsing and throbbing, begging for release. Even with that, there’s enough leeway for your cum to shoot out with force and volume that puts most men to shame, and it’s just the leakage.");
			output("\n\n<i>“You know, you and Shizuya should get together sometime, fill a galotian swimming pool or something.”</i> She lifts her foot off, allowing the outrageous backup to finally release. Your [pc.cock " + cIdx + "] lifts up from the sheer strain of unloading its cargo, the blood rushing to it acting like helium in a balloon. [pc.cum] flies out of you like water from a firehose. It slams against the ceiling before raining down on you in a torrent of [pc.cumNoun].");
			output("\n\nThe blasts are so heavy, so intense that you feel your middle tightening up all over again. You cry out as you cum again in the middle of your orgasm. Your [pc.cumColor] sprays with renewed force, and your [pc.balls] pulse with such force that " + (pc.balls > 1 ? "they start" : "it starts") + " to hurt. You cum and cum until the ceiling looks more like the floor of a New Texas brothel, and the actual floor looks like a kiddy pool.");

		}
		
		output("\n\nAs you recover from your orgasm, you hear a small whirring noise. You look over and see Mika holding a small, handheld vacuum cleaner. The device effortlessly sweeps up all of your cum, leaving you" + (pc.cumQ() >= 40000 ? " and the rest of the hall" : "") + " spotless. <i>“These things are expensive, but they’re damn worth it.”</i>");
	}
	else
	{
		var vIdx:int = pc.wettestVaginaIndex();
		
		output("\n\nYour [pc.pussy " + vIdx + "] is absolutely soaked at this point, and Mika knows. Her hand works over your mons, massaging your outer lips");
		if (pc.isCrotchGarbed()) output(" through your " + (pc.hasLowerGarment() ? "[pc.lowerGarment]" : "[pc.armor]") + ". She dutifully removes the offending clothing, leaving your cunt to taste the open air");
		output(". She takes stock of your desperate honeypot, admiring how your [pc.clits] raise" + (pc.totalClits() > 1 ? " from their hoods and pulse" : "s from its hood and pulses") + " for attention.");
		output("\n\n<i>“Horny, are you? Well, I’m a fair woman, do a good job down there and I’ll return the favor.”</i> She pats your [pc.hips] as if to say, chop chop.");
		output("\n\nAs if anything could sway you from pleasing her fragrant cunt, now you just have incentive to do it better. You move your lower lip over to envelope her pulsating clitty. It’s easy to find, with how big it is, and you’re able to settle into a rhythm of thumbing it as you eat her out. A satisfied moan of approval rings out from the curvy cow, and her position begins to shift. She bends forward, laying herself across your body in order to get at your [pc.pussy " + vIdx + "]. Her body is delightfully warm, and surprisingly soft, not to mention the pleasant tingle of her dribbling milk on your [pc.belly].");
		output("\n\nMika’s hot breath finally falls on your honeypot, sending shivers up your over-sensitive body. Her big, cow-like tongue slaps over your outer lips, trying to batter its way inside. You moan out loud as she slips inside you, her wide tongue curling up into a thick, fleshy cylinder that pounds you as well as any cock. She facefucks you, stopping whenever you lose your rhythm, training you to keep collected under pressure. After a short time, you and her are perfectly synchronized, fucking each other like a well-oiled machine.");
		output("\n\nYour ministrations become faster, more frantic; you can practically see your climax racing toward you, and you welcome it with open arms. Your muscles tense up, pleasurable spasms shooting through your body, congregating at your [pc.pussy " + vIdx + "]. Your inner muscles milk Mika’s tongue, trying desperately to milk out phantom spunk.");

		if (pc.wettestVaginalWetness() <= 2) output(" Your [pc.girlcum] is quickly swept away by the fat cow tongue, absorbed like water into a sponge.");
		else if (pc.wettestVaginalWetness() <= 4) output(" Your [pc.girlCum] messily splatters out around Mika’s probing tongue. Your climax takes on a very wet sound profile as splatters of [pc.girlCumNoun] go flying with each plunge the coercive cow takes.");
		else if (pc.wettestVaginalWetness() <= 6) output(" Mika moans out as your excessive [pc.girlCum] splatters out with enough force to soak her face. She’s so enamored with your output that she takes her tongue to lap up your excessive juices, moaning as she savors your flavor, before diving back in.");
		else output(" You spray [pc.girlCum] like a broken faucet nailing her face with a shot so voluminous that it looks like she just dipped her head in a [pc.girlCumNoun] pool. She seems shocked for a second, but quickly overcomes it as she dives onto your firehose-like womanhood, wrapping her lips around it so she can get every last drop.");
		
		output("\n\nYour tongue is shooting in and out of her like a piston, drawing out fat splatters of girlcum with each thrust. It’s like eating a warm, ripe watermelon, so delicious and juicy that it’s worth having your face soaked in it, and soaked it is. You feel like you’re laying under a small, pulsing waterfall, each splash soaking your face and sense in a wash of pheromone-laced ambrosia.");
		output("\n\nThe run-off pools below you, soaking into your [pc.hair] and back, ensuring that you’ll reek of her cunt for at least the rest of the day.");
		output("\n\nMika rolls off of you, fully satiated, panting lightly with exertion. You both lay there, enjoying the afterglow of your sixty-nining. Eventually Mika pops up, lazily reaches over to her bag, and pulls out a cloth. She moves back on you, straddling your prone form. She takes the cloth and starts to wipe off your face, slowly, sensually; she moves her face closer and closer as she pays particular attention to your [pc.lips], tracing the shape of your mouth.");
		output("\n\nShe’s so close now, you can feel her breath mix with yours. It’s so warm and passionate... you could almost- oh. She takes the cloth out of the way and locks lips with you, tasting her own flavor that’s still heavy on your breath. You tie your tongues together as you engage in a quick, post-sex make-out session. She parts lips curtly, wiping the rest of her juices from your face before hopping off. <i>“Nice work.”</i>");
	}
	
	flags["SHIZZY_NOMMED_MIKA"] = 1;
	
	if (pc.isCrotchGarbed()) output("\n\nYou and her both redress.");
	else output("\n\nShe redresses.");
	output(" As she’s putting her pants back on, she makes sure to catch them just under her fat cheeks, jiggling her curvy rump in your direction. <i>“You’ve got a great mouth; I’d love to see if the rest of you lives up.”</i> She gives her booty a quick slap before picking her tools back up.");

	pc.orgasm();
	
	output("\n\n<i>“Anyway, if you’re wondering how shit’s going, I’d say I’m about forty percent done. I think I should be able to get you up and flying in another hour.”</i> Well that’s good. Getting this whole thing behind you will be a huge relief. <i>“If you don’t have anything else to do, you might as well come along. Maybe you’ll knock a few minutes off.”</i> Well, it’s that or just standing around some more. You follow her to the next point of repair, ready to assist the diminutive mechanic.");

	addButton(0, "Next", shizzyIntroductionPartSorf, [destination, true]);
}

public function shizzyNoMikas(destination:String):void
{
	clearMenu();
	clearOutput();
	showMika();
	author("QuestyRobo");
	
	output("As tempting as it is, you’re not in the mood for this. You grab the little cowgirl and lift her off. She resists at first, but acquiesces when she realizes that you’re not going to go for it anyway. <i>“Dull ass.”</i> She grabs her pants and pulls them back up in a single stroke before picking her tools back up. Rude.");
	
	output("\n\n<i>“Anyway, if you’re wondering how shit’s going, I’d say I’m about forty percent done. I think I should be able to get you up and flying in another hour.”</i> Well that’s good. Getting this whole thing behind you will be a huge relief. <i>“If you don’t have anything else to do, you might as well come along. Maybe you’ll knock a few minutes off.”</i> Well, it’s that or just standing around some more. You follow her to the next point of repair, ready to assist the diminutive mechanic.");

	addButton(0, "Next", shizzyIntroductionPartSorf, [destination, false]);
}

public function shizzyIntroductionPartSorf(args:Array):void
{
	clearMenu();
	clearOutput();
	showMika();
	author("QuestyRobo");
	
	var destination:String = args[0];
	var ate:Boolean = flags["SHIZZY_NOMMED_MIKA"] != undefined;
	
	output("You spend the next few minutes doing small things; passing along tools, bringing up the ship’s blueprint when she needs it, generally just making sure things go smoothly. After about half an hour, Mika is soaked in sweat and calls a break.");
	output("\n\nShe settles down against a wall, pulling out a big, long, chocolate coated bismarck. It’s as long as her torso, and thick as her arm. She looks down at the rich pastry with reverence, a bead of drool forming at her mouth. She pops the pastry down against her own chocolate tits, putting the tip tantalizingly close to her mouth. A soft moan escapes her lips as her breath goes ragged.");
	output("\n\nHer wide tongue teases the tip of the confection, slurping up a mouthful of chocolate, with much more still to go. Her tonguing grows more frantic as she becomes more fixated on getting more sweet sugar. Her arms close around the perverse dessert as she pulls it closer to her lips. She kisses the “crown” of the pastry, shuddering as she starts to work her way down.");
	output("\n\nShe starts to deepthroat the oversized pastry, moaning as her senses are overwhelmed by sweetness, and chocolate-tinged spittle seeps out the corners of her mouth. You have to admit, the sight of it is getting you hot under the collar, and that’s almost certainly the point. That doesn’t mean she isn’t enjoying it, though. Her nipples are practically spearing through her top, dribbling enough milk to soak through her top and send sprays of white milk rolling down her body.");
	output("\n\nHer chest is heaving hard, her motions are growing quicker. Her moans grow louder and more fevered as she reaches a crescendo. Her arms squeeze harder, and her head motions stop as she bites down. A spray of thick white cream spills across her face, making it look like she’s just gotten out of a New Texas bukkake party. It takes her a second to swallow the near foot of bismarck in her mouth; when she finishes, she gasps, both for breath and in contentment. Did she really cum from doing that?");
	output("\n\nMika pants heavily as she recovers from her sugar-induced orgasm. <i>“Did you like that, pervert?”</i> She huffs, as a huge grin spreads over her face.");
	output("\n\n<i>“Obviously not as much as you.”</i> You jab. She chuckles before getting back to eating her pastry.");

	if (ate)
	{
		output("\n\nHalfway through, she reaches back into her bag and pulls out another doughnut, tossing it to you. <i>“You ate your dinner like a good " + pc.mf("boy", "girl") + " so here’s dessert.”</i>");
		if (pc.isNice()) output(" Oh, that’s nice. You thank the dusky shortstack, and start chowing down.");
		else if (pc.isMisch()) output(" That’s nice and all, but you were expecting a bit more of a ‘dessert’. <i>“Later, can’t go around fucking too much while I’m on the clock. So get your ass ready for later!”</i> Oh, sounds like fun.");
		else output(" What, just one? <i>“It’s a reward for eating me out, you cock, take it or leave it.”</i> You stare each other down, but eventually you back down, just wanting to enjoy your sweet.");
	}
	else
	{
		output("\n\nYou stare at her as she eats her pastry, silently asking her to share. At least it was silent until your stomach opens its yap and growls out. She glares at you. <i>“You ain’t having my sweets. Here.”</i> She reaches into her bag, pulls a giant plastic container of salad, and throws it at you. <i>“Tiffa gave me that crap, said I don’t eat well; moron. You can have it.”</i> Well, better than nothing.");
	}
	
	output("\n\nYou finish your snack quickly, as does she. She gives herself a nice, long stretch, reaches into her bag, grabs a drink, and reclines back. <i>“Soooo, you’re Victor’s kid?”</i> She asks as she takes a big gulp of her drink.");
	output("\n\n<i>“Yeah" + (pc.isAss() ? ", what’s it to you" : "") + "?”</i> Of course it’s not like dad was a nobody, but it’s still a weird thing to ask.");
	output("\n\n<i>“Nah. I just saw him. He had his little ‘meetings’ with my parents. And yeah, I mean exactly what you think I mean. You know, I could introduce you to at least two of your sisters. There’s probably more than that, that bitch never kept track of who belonged to who after a while.”</i>");
	output("\n\nNot the most flattering way to talk about her mother, you comment.");
	output("\n\n<i>“Yeah, it’s almost like there’s a reason for that, but you’re not my shrink.”</i>");
	output("\n\nOkay, that’s going to a awkward place, time to change subjects.");
	output("\n\n<i>“So, those are some nice implants.”</i>");
	output("\n\nHer expression lights up at your statement. <i>“Hell yeah they are! Back on that dump, New Texas, I never thought I’d get real ones. It’s a power armor interface, and of course the strength mods to go with them.”</i> She flexes her arm, showing off her natural muscles, as well as some faintstreaks of soft, blue light that must be her mods. <i>“And I’m not talking about some cheap, standard issue crap, I’m talking XV-class battlesuits, baby!”</i> She’s almost drooling as she gushes over tech specs.");
	if (pc.isMisch()) output(" Wow, pastries, robots, what doesn’t this chick get off to?");
	output("\n\n<i>“Oh man, oh man, oh man! I got this big-ass autocannon, tested it out on a decommissioned cruiser, and I blew a big hole in the hull in like four shots. Oh, and I can mount this plasma cannon on the shoulder, and the payload on that thing is fan-fucking-tastic. You can joke all you want about me getting off to this, but when you feel the heat and vibration coming off a plasma railcannon, and then watch that bright flash arc through the air before melting everything in a 50 meter radius, you gotta beg your body not to get turned on.”</i>");
	output("\n\nHer hand is actually moving down her pants... She’s really getting off from this! <i>“What’s that look? You’re telling me that you’ve never put an L31 gatling laser between your legs and set it to low so you could feel the vibration and heat on your pussy while it shreds an old, abandoned barn to charred pieces? You never hooked a vibrator to a ZK rifle so that it shook every time you shot it? You never saddled a bomb disposal cylinder while an explosive went off inside? Fuckin’ weirdo.”</i>");
	output("\n\nYou don’t even have a response to that, just... wow. <i>“It’s a joke, you know... except the first one, that’s just something I like to do on weekends. It’s not always barns, just whatever old building I can find that nobody gives a crap about anymore.”</i>");
	if (pc.isNice()) output("\n\n<i>“That’s, uh, great. It’s nice to have hobbies.”</i>");
	else if (pc.isMisch()) output("\n\n<i>“Yeeeeeah, that makes it <b>so</b> much better!”</i>");
	else output("\n\n<i>“What the fuck is wrong with you?”</i>");
	output("\n\n<i>“Bahahahaha! Alright, enough screwing around, back to work!”</i> Anything’s better than falling deeper into this madness.");
	
	addButton(0, "Next", shizzyIntroductionPartForParting, destination);
}

public function shizzyIntroductionPartForParting(destination:String):void
{
	clearOutput();
	author("QuestyRobo");
	
	if (annoIsCrew())
	{
		showName("SHIZUYA\nAND CREW");
		showBust("SHIZUYA_NUDE", annoBustDisplay());
		
		output("Anno meets back up with you after fixing the circuits, and the three of you get to work");
		if (pc.characterClass != GLOBAL.CLASS_ENGINEER && pc.intelligence() < pc.intelligenceMax()) output(", though you’re not exactly much help, given your inexperience with this sort of thing");
		output(". As you’re finishing up, you hear a loud rumbling coming down the hallway. Quickly you realize that it’s Shizuya, carting several large coolers and crates on a dolly. She waves at you as she approaches, stopping in front of you in order to chat.");
		output("\n\n<i>“Suuuuuuuuuuuuuuuup?”</i> She scans across the three of you, looking for a response.");
		output("\n\n<i>“Wow, that’s a lot of food. Are you cooking for your whole crew or something?”</i> Anno says, ogling Shizuya’s curves. She’s changed out of her combat gear into a simple T-shirt and skirt outfit that leaves very little to the imagination as they hug tightly to her curves. Her ass juts out like a drink tray, and it firmly jiggles with even the slightest movement. Her tits are obviously too big for her shirt; it’s stretched so thin that it’s almost see-through. And that’s not even mentioning her bulge. Ho boy! You’d consider her mauve skirt generously spacious, even with her ass pushing out so obviously, but nothing could hide that mound of fuckmeat. It’s so busy that it’s impossible to make out anything other than the fact that her balls are gigantic, and she’s got quite a bit extra down there.");
		output("\n\nYou and Anno are so busy tracing her curves, and “curves”, that you don’t even answer. Anno seems especially enamored, to the point where she struts up to Shizuya, shamelessly eyeing her crotch.");
		output("\n\n<i>“Oh, we’re doing good. Saaaay, you’ve got a lot of food there...”</i> She snuggles up to Shizuya, the size difference making it so that she’s face-to-face with the increasingly strained bulge. Both of their faces are flushed by this point, and Anno is visibly panting. Suddenly Anno grabs one of the amazon’s giant balls, roughly groping and squeezing it through the thin fabric of her skirt. <i>“Do you have any dessert in there? Because you’ve got a looot down here, and trust me when I say that me and [pc.name] can get really, <b>really</b> hungry.”</i>");
		output("\n\nYou wonder what’s gotten into Anno, until a powerful smell hits your nostrils.");
		if (pc.isTreated()) output(" Blood rockets to your [pc.crotch] as some of the most potent pheromones you’ve ever smelled assault your senses. Your brain is about to overload; it’s like standing next to a New Texas orgy and not getting to join in!");
		else output(" The smell almost burns your nose, and that feeling trails its way through your body, spreading heat through your body, and each time you inhale, the heat gets worse.");
		if (pc.hasCock()) output(" Your [pc.cocks] rocket" + (pc.hasCocks() ? "s" : "") + " to full hardness, and then some, already starting to drool a bit of pre.");
		if (pc.hasVagina()) output(" You feel your [pc.pussy] clench, soaking itself in preparation for penetration, " + (pc.isBimbo() ? "that you really want to happen as soon as possible!" : "that you really hope isn’t going to happen right now, in the middle of fixing your ship."));
		output("\n\nIt gets even worse when the intoxicating giant lets out a weak moan as something rockets into her skirt with a loud tearing sound. Your [pc.eyes] go wide, as do Anno’s at the sight of two massive bulges tenting Shizuya’s skirt. Her breathing is ragged, and her eyes are glassing over. Her hidden cocks are spraying cum with the ferocity of what would be a mind-breaking orgasm for any normal person, but the slightly translucent texture of it tells you that it’s only pre. Though, it’s certainly thicker than most pre you’ve seen.");
		output("\n\nAnno’s hands dart from just fondling her through her skirt, to almost throwing it off to get at the real prize. You can see everything now; four massive balls that Anno can’t even fit in her hands, and two giant, dark red horsecocks, covered in feline-like nubs. Anno strokes along the bottom shaft, slowing down when she goes over the nubs to make sure that they’re especially stimulated.");
		output("\n\n<i>“For me, Shizuya? You shouldn’t have! You always were a good coc-cook, so generous with your portions, too! Ooooh, you’re brewing up a big load of ‘dessert’ here, aren’t you? How about you share?”</i>");
		output("\n\nHer pupils are like the pinpricks of an addict looking at another fix; her skin’s completely flushed and covered in a thick layer of sweat, and her hand is like a blur as she vigorously jacks off Shizuya. The reasonable part of your brain is screaming at you that this is going too far, that Anno’s too far in, and this needs to stop. But the rest of your mind and body is so saturated in lusty pheromones that those thoughts are immediately filtered into an irresistible desire to get on your knees and start sucking down the ever thickening shots of cum rolling out of her twinned slits.");
		output("\n\nHer shots are rapidly gaining in thickness, volume, and velocity. Any hint of translucency is gone, leaving you wondering if she’s already cumming, or if she’s just that potent. The amazon was whimpering meekly at Anno’s advances before, but that’s quickly starting to change. The hesitant panting and soft moans are being replaced with an almost bestial, throaty pant. Her glassed over eyes are starting to gain a new focus, but rather than her normal clarity, it’s a kind of predatory stare, like a leopard that’s just spotted its prey. The red hints near her iris are even starting to expand, converting her jade pupils a piercing shade of crimson.");
		output("\n\nHer hand begins to move, jerkily, slowly finding their way toward Anno’s head. Your white-haired companion is far too lost to notice, even when one of Shizuya’s massive hand is resting right on her head. Anno is practically worshiping the oversized catgirl’s cock and balls, polishing both with the kind of reverence that one would expect out of a devotee polishing a statue of their god. Shizuya’s other hand clenches, the reason unknown. She’s about to do something, when Anno suddenly drops to the floor.");
		output("\n\nYou completely forgot Mika was even here. Somehow she’s not affected by the pheromones, and seems to have had enough of this. She’s dragging Anno away by the ankle as she tries her best to kick and scream. When they’re far enough away, she takes a small bottle out of her pocket, uncorks the top, and- SWEET VOID, THAT STINKS! All the arousal drains out of your body like you were a faucet that just burst open. It’s so bad that you nearly throw up on the spot, and Anno and Shizuya react the same way.");
		output("\n\n<i>“Well, that was fun, but I don’t think [pc.name] over here would appreciate their ship getting flooded, and I ain’t about to refix all the shit you short out.”</i> Shizuya is gagging, but she manages to cough out a “thanks” before getting on her way.");
		output("\n\nA few minutes pass before you and Anno recover. Mika, however, seems completely unaffected by all of it. <i>“Yeah, Shizuya can be a bit of a walking biohazard sometimes. If I didn’t get an implant that let me turn off my sense of smell, I’d probably be her cocksleeve most of the time... Not that I’d mind that, but, ya know...”</i> She blushes hard at that last admission. <i>“A-anyway, I carry around some strong smelling salts to diffuse these sorts of situations. Impromptu orgies are nice, but productivity and shit is more important.”</i>");
		output("\n\nAnno stares at you, wordlessly, wide-eyed, silently apologizing for getting so carried away. You pat your pup on the head, and Mika joins you. The pats give way to some light ear scritching, followed by heavier ear scritching, until she’s nothing but a pile of content floof in your hands.");
		output("\n\n<i>“Hmm, you’ve a well trained pet here, Steele. Glad she’s not one of those ausar who get really uptight about the pet stuff. That means we can have a </i>lot<i> of fun together.”</i> Anno perks up at that.");
		if (annoHasPetplayed()) output(" She does love her pet play, after all.");
		else output(" You didn’t know she was into that kind of thing. Maybe you should follow up on that?");
		output(" <i>“Anyway, back to work, guys.”</i>");
	}
	else
	{
		showName("SHIZUYA\nAND CREW");
		showBust("SHIZUYA_NUDE", "MIKA");
		
		output("The repairs go a bit slow with just the two of you, but you manage to get at least this section done in a decent amount of time. Just when you finish, you hear something barreling down the hall. You turn to see Shizuya carting several crates and coolers behind her. She waves at you as she closes in, a big smile on her face.");
		output("\n\n<i>“Yoooooooooooooooooooooooooooooooo!”</i> She holds until coming to a stop in front of you. <i>“How’s it comin’ along?”</i>");
		if (pc.tallness < 5 * 12 + 2) output(" Her eyes are lit up like supernovas as she looks down on you. <i>“Must be hard for ya two little cuties to fix this big ship all by yourselves. I could hold off on the food for a bit, keep ya company for a while.”</i> She looks very excited at the prospect, a little too much, and looking down makes it plain why she is.");
		else output(" She’s practically beaming at the two of you, radiating a sense of happiness, excitement, and... something that you can’t quite place. <i>“Hmm, you guys must be getting pretty lonely doin’ this all by yourselves. Maybe I could, uh, hang around with you guys for a bit?”</i> That’s a little spontaneous; doesn’t she have to prepare the food? Why would she... oh, you see pretty clearly why.");
		output("\n\nShe’s changed out of her military gear into a much more casual outfit; a black T-shirt with some faded writing on it, and a long, mauve skirt that’s not even close to being able to hide what’s inside. " + (pc.tallness < 8 * 12 ? "You’re face-to-face with" : "You look down and see") + " a massive, throbbing tent in her skirt, pulsing almost violently as you notice it.");
		output("\n\nMika sees it too, but seems composed and unsurprised, despite the obvious flush spreading across her face. <i>“Nice try, but no, we’re not gonna get anywhere if we’re just sucking you off all day.”</i>");
		output("\n\n<i>“Come ooooooon! I was stressin’ out so much today that I forgot my morning session! I got one for each of you.”</i> You hear a faint tearing noise coming from her busy bulge. She yelps and quickly grabs at it, compressing it to try and keep a flood of cock from spilling out of her panties. It doesn’t work, and almost immediately two massive tents throw up her skirt, pointing right at the two of you.");
		if (pc.isBimbo()) output("\n\nYummy! You reach out and grab one of the bulges, causing the flustered feline to groan out loud. It’s just not right to leave a big old cock hanging like that! You give her a few quick strokes, admiring how quickly her skirt is soaked in off-white pre. Pheromones are rolling off her like water off of the rocks at the bottom of a waterfall. You lift up her skirt and squee when you see the feast on offer. A thick, blunt flare with a deliciously drooling cum-slit, attached to a nubbed horsecock that’s obscenely thick and deliciously long. Its twin is staring Mika right in the face, but she’s not sucking it, for some reason.");
		else 
		{ 
			output("\n\nA sudden rush of pheromones hits you, as if her springing erections were catapults trying to break down your mental walls and siege your senses. Shudders run down your whole body, followed by pulses of sensual heat as your body grows more aroused by the second. You try and pull yourself back, but your body isn’t listening, and instead you find your hand has found its way to one of her moist tents while you weren’t paying attention! It’s almost impossible to pull off, every time you try, another burst of pheromones drowns out the thought.");
			output("\n\nYour grip quickly turns into an impromptu handjob, causing the dick that you’re grabbing to absolutely coat the front of her skirt, driving you even further into your lust-hazed cock milking. Your jerks grow so frantic that you start to lift her skirt up. It’s unintentional at first, but once you catch a peek of her cock, something snaps. Before you know it, you’ve flipped up her dress, revealing two of the biggest horsecocks you’ve ever seen! Endless, fat, nub covered inches stretch out behind a wicked looking flare, and a cumslit that’s leaking like a faucet.");
			output("\n\nYour mouth feels dry, like you haven’t had a drink in hours, and you’re face to face with a spraying fountain. You want to put your lips around it, you <i>need</i> to taste it! Despite what’s happening to you, Mika seems completely unphased. She seems interested in the amazon’s phallus, but not compelled to do anything with it, like you are.");
		}
		output("\n\nMika reaches into her pocket and pulls out a small vial.");
		if (pc.isBimbo()) output(" Oh, maybe she just wanted to get some lube before she dug in. That’s a lot of dick for such a little mouth, after all.");
		else output(" It’s small and black, and you can’t tell what’s in it. There’s a handwritten label on it, but it’s hard to read from this far away.");
		output(" She casually uncorks the vial, and then just stands there, holding it up. You wonder what she’s... GODS AND STARS, THAT SMELL! It’s like someone rolled a family of skunks into a ball and threw them at your face!");
		output("\n\nAny hint of arousal drains from your body as you struggle not to gag. Shizuya has retreated to the other side of the hall, covering her mouth and nose with both hands.");
		output("\n\n<i>“Bad kitty, bad! No blowies, go make food!”</i> Mika screams, waving the vial at Shizuya. She whimpers, grabs her cart, and scurries off to the kitchen.");
		output("\n\nIt takes you a minute to recover, even then, your eyes are still watering. Mika, however, seems unaffected by it. <i>“Yeah, Shizuya can be a bit of a walking biohazard sometimes. If I didn’t get an implant that let me turn off my sense of smell, I’d probably be her cocksleeve most of the time... Not that I’d mind that, but, ya know...”</i> She blushes hard at that last admission. <i>“A-anyway, I carry around some strong smelling salts to diffuse these sorts of situations. Impromptu orgies are nice, but productivity and shit is more important. On that note, let’s get back to work.”</i>");
	}

	output("\n\nThe last of the repairs go pretty quickly, the smell of food gradually filling the halls of the ship; It starts simple with the unmistakable smell of cooking meat, followed by frying potatoes, a myriad of spices, and finally an array of sweet smells. It makes the rest of the repairs much more pleasant, at least until your stomach starts rumbling.");
	output("\n\nThe repairs don’t go uninterrupted, and you soon see Adelline and Winston coming down the hall, arguing, as they seem to usually do.");
	output("\n\n<i>“I keep telling you, no amount of peanut butter can block a bullet, and I don’t believe your ridiculous story.”</i>");
	output("\n\n<i>“Addy, I’ve been at this shit for forty-two fucking years, and I’m telling you, Roddy blocked a machine gun by covering himself in two feet of peanut butter!”</i>");
	output("\n\n<i>“You spin these ridiculous tales every day, and no one ever believes you. Why are you so indignant about this one?”</i>");
	output("\n\n<i>“BECAUSE IT’S TRUE, DAMMIT; and so are at least...”</i> Winston pauses for thought. <i>“Forty - eight percent of the other ones.”</i> Truly enlightening conversations these people get up too. The husky huskar looks at you intently as he passes by. <i>“Kiddo, stock up on peanut butter, that shit can save your ass.”</i>");
	output("\n\n<i>“Please pay no attention to him.”</i>");
	output("\n\n<i>“NO, pay all of the attention to me! She likes to think that she knows everything, but she hasn’t been through the shit I have. Forty-two years, kid! Forty-two years of learning to kill; I’ve survived on paper, climbed mountains with sporks, killed twenty people with a pool set, skinned a");
	if (silly) output(" space deer with a melon rind, you young whipersnappers");
	else output(" conovian hopper with a melon rind, you people"); 
	output(" don’t get to TELL me what’s possible!”</i>");
	output("\n\nAn awkward silence falls over all of you. Through it all, Winston retains the same, indignant look. A few moments pass before Winston starts reaching into one of the large pockets of his pants. He pulls out a small jar of peanut butter and places it in your hand. <i>“Stay safe...”</i> And he, and Adelline just continue on their way, not saying another word.");

	addButton(0, "Next", shizzyIntroductionPartTimeJobForAFiver, destination);
}

public function shizzyIntroductionPartTimeJobForAFiver(destination:String):void
{
	clearOutput();
	showShizuya();
	
	output("Finally, it’s done. With the flip of a few switches, the engines whur back to life, and all seems well. " + (annoIsCrew() ? "All" : "Both") + " of you take a well deserved rest. Several people come back and forth from the ship. Some of them are people you recognize, others not so much.");
	output("\n\nA dark skinned human girl in some very skimpy, egyptian looking outfit strikes up a conversation with Winston. You’re out of earshot, but the flirtatious looks, and the kiss when they finish, tell you that that’s probably his girlfriend. She’s pretty flat up top, but damn does she have it going on down below. She walks up and past you, giving you a casual “hey” in an... almost masculine voice... That’s not a girl, is it?");
	output("\n\nBefore you can think about that, Shizuya comes rushing up to you, buck naked except for an apron with a cartoon cat in a chef hat on it. <i>“Miiiiiiika, I need ya milk!”</i> Mika stares at her with a scowl and a blush.");
	output("\n\n<i>“Why mine? You’ve got plenty!”</i> Indeed, you can see large damp spots on her apron where her big nips are tenting it; and another one down near her crotch, but you don’t think she’s using that ‘milk’ for cooking. " + (pc.isBimbo() ? "You wish she would, though." : "At least you hope she’s not."));
	output("\n\n<i>“Yours is sweeter than mine, and I want this sauce to be sweet to compliment the meat.”</i> She looks over at you" + (annoIsCrew() ? " and Anno. <i>“You two" : ". You") + " can come too, it’s your kitchen after all.”</i> Well, why not, you’re going to be eating whatever she’s making, so you might as well see it beforehand.");
	output("\n\nShizuya books it back to the kitchen, keeping you and Mika" + (annoIsCrew() ? " and Anno" : "") + " in tow. Being behind her naturally gives you a great view of her ass. Her natural sway, even when rushing, exaggerates the already massive bulk. It’s a strange contrast to see how muscular her back is, and then her ass is almost like a bowl of jelly with how violently it jiggles.");
	output("\n\nYou’re so transfixed by it, that you don’t notice when she stops and thrusts her booty at you. Instinctively, you put your hands out to block the incoming object. They sink in as they collide with dozens of pounds of assflesh. She’s looking back at you with a sly grin and, with a single clench, her booty goes from jelly to iron. Your hands almost bounce right off, as the plush-posteriored feline sticks her tongue out, slightly. Very funny.");
	output("\n\n<i>“Lotta control back there, wanna try it out?”</i> Umm...");
	output("\n\n<i>“Come on, Shizzy, we’re starving here. Save the fucking for after dinner.”</i> Mika already has her top off, letting her big, chocolate tits flail free, and letting you see that her freckles spread to more than just her face.");
	output("\n\n<i>“Okaaaay... Can I get both of you" + (annoIsCrew() ? " and Anno" : "") + " along for it?”</i> She looks at you with a mixture of lust and disappointment.");
	output("\n\n<i>“If " + (annoIsCrew() ? "they say" : "[pc.he] says") + " yes, of course. I’ve been meaning to test out some new techniques.”</i> Mika says, off-hand.");

	if (annoIsCrew())
	{
		output("\n\nShizuya glances over at Anno, who’s been staying a bit further back, probably to avoid what happened earlier. <i>“Sure, I’d love to pick up where we left off; privately, of course.”</i> Shizuya blushes at the mention of the incident earlier.");
		output("\n\n<i>“I’m really sorry ‘bout that whole thing. My pheromones get really thick if I get pent up, and then you started rubbing me like that and... Ya know I lose it pretty easy these days.”</i>");
		output("\n\n<i>“You don’t have to say sorry, just make sure you only lose it at the right time from now on.”</i> They give each other knowing, lustful smiles, which quickly turn to you.");
	}
	else output("\n\nThey both stare at you with hunger in their eyes, like predators looming over" + (pc.tallness >= 5 * 12 + 2 ? ", or under, in Mika’s case," : "") + " their trapped prey.");

	output("\n\nBefore you can respond, the group starts moving again, picking up the pace after your lusty little detour.");
	output("\n\nYou open the door to the kitchen and see Adelline" + (yammiIsCrew() ? " and Yammi" : "") + " working the stoves. There’s a massive pile of food already prepared behind " + (yammiIsCrew() ? "her" : "them") + " piles of steaks of various cut, all dripping with juices; baked potatoes, cut open and stuffed with an overflowing amount of sour cream, chives, melted cheese, bacon bits, and fried onions; a massive pot of steaming stew, full of various meats and vegetables; a salad bowl that Mika could probably comfortably sleep in filled with fruits and vegetables that you haven’t even seen before, but look absolutely delicious; and lastly, a plate of strange kebobs, garnished with odd-looking, sliced fruit.");
	output("\n\n<i>“There you are. Did you stop to jerk off, again?”</i> Adelline is focusing on you now, but she’s not missing a beat.");
	if (flags["MET_VANAE_HUNTRESS"] != undefined || flags["MET_VANAE_MAIDEN"] != undefined) output(" Not really surprising; you know first hand how dextrous they are without using their eyes.");
	else output(" You guess living without eyes, they’d get pretty good at doing things without them.");
	output("\n\n<i>“Noooooo! Well... maybe almost, but I need to get food ready, and save up for the after-dinner special.”</i> She gives her balls a quick squeeze, and moans in surprise as a spray of pre slams against the ground below her. <i>“Okay, okay, too much!”</i> She brings out her codex and pulls something up. You can’t see what it is, but whatever it is causes her to grimace, and her burgeoning erections to wilt instantly.");
	output("\n\n<i>“Bleh, better. Anyway, come on Mika, we need four cups.”</i>");
	output("\n\n<i>“Yeah, yeah.”</i> The miniscule moo follows Shizuya over to the stove. Shizuya lifts her up onto the counter, where she gets to work milking herself into a measuring cup.");
	
	if (yammiIsCrew())
	{
		output(" As Shizuya takes back over, Yammi finishes up and comes up to you.");
		output("\n\n<i>“Hey boss, how are you doing?”</i> You’re fine, but she seems a bit winded. <i>“Oh, I’m fine, just a lot of cooking, and, uh, dealing with Shizuya.”</i>");
		output("\n\n<i>“Dealing?”</i>");
		output("\n\n<i>“Yeah, she was really pent up when she rushed in here. Don’t worry, you work on New Texas long enough, you either learn to deal with situations like that well, or you get used to raising a lot of kids, and I can tell you that I’m not a mom.”</i> She seems to be almost boasting about that.");
		output("\n\n<i>“She’s magic I tell ya.”</i> Shizuya is incredibly cheery, doing a little dance in place as she continues to cook. Occasionally she leans over and takes a drink from Mika’s dribbling teats as she sits on the edge of the counter.");
		output("\n\n<i>“I mean, we did, kind of, clog up the wash sink and make a mess, but we cleaned it up... eventually.”</i> Yammi seems a bit sheepish as she says that, and looking over her shoulder, there are still some large, white puddles strewn about. <i>“... Mostly... Don’t worry, none of it is in the food, I think.”</i>");
	}
	else 
	{
		output("As Shizuya takes back over, Adelline seems like she’s taking a break, or at least taking out some time to speak with you...");
		output("\n\n<i>“Apologies for the delay. When I arrived here, I found our dear Shizuya desperately trying to unclog the wash sink, clean up her ‘mess’, and prepare the food. Though, I must say, she did a better job than I expected. Unfortunately, she also spoiled her dinner.”</i> She shoots a piercing stare at the libidinous feline, who turns her head in shame as she tries to stifle a loud burp. <i>“Fortunately, I’ve ensured that none of it got into the food.”</i>");
	}		
	
	if (pc.isBimbo()) output("\n\n<i>“Aww, all that yummy cum... Can I have some anyway?”</i> Shizuya’s cat-like pupils go wide at that, and she flashes you a huge smile, two thumbs up, and some enthusiastic nodding, followed by a light pat on her exposed sack. Yay, cum" + (silly ? "mies!" : "!"));
	output((yammiIsCrew() ? "\n\nYammi" : "\n\nAdelline") + " finishes her brief break and gets back to work, leaving you to just sit and watch them prepare the food. The " + (yammiIsCrew() ? "three" : "two") + " seem to be in perfect sync as they pass from pan to pot and back again; turning meat, stirring sauces, and putting vegetables on to fry. One particularly impressive move is when Shizuya flips a pair of steaks from a pan into a bowl of caramelized onions, and Adelline pours a pan of sauce over them, as soon as they land, without even looking.");

	if (annoIsCrew())
	{
		output("\n\nAnno seems to be amused by the situation as well. <i>“Holy crap, Shizuya, I remember when you tried that before, the steaks landed right on your head!”</i> She’s chuckling and smiling as she recounts the story.");
		output("\n\n<i>“Maaan, I thought my hair caught fire, and I was like ‘oh fuck, I’m gonna die, I’m gonna die!’ Yikes. But yeah, Adelline taught me some stuff. I can flip and throw and toss and all that shit. You want me to teach ya? I might be a little hard since you’re, like, half my size and probably like a third as heavy since you don’t have anything big down there... Yet...”</i>");
		output("\n\n<i>“What’s that supposed to mean?”</i> Anno says, half confused, half amused.");
		output("\n\n<i>“Come oooooooooon, you’ve never thought about it?”</i> There’s an obvious tent in her apron now, and she’s so distracted that she almost drops a pan of fried rice.");
		output("\n\n<i>“Not seriously, I can just " + (flags["ANNO_OWNS_LIGHT_STRAPON"] == undefined ? "get a" : "use my") + " strap-on for that.”</i>");
		output("\n\n<i>“Pfft, it’s not the same.”</i> She huffs.");
		if (flags["ANNO_OWNS_LIGHT_STRAPON"])
		{
			output("\n\n<i>“Good enough for me.”</i> Anno pats her crotch in satisfaction.");
			output("\n\n<i>“But is it good enough for me?”</i> Shizuya cocks her ass toward Anno, takes one of her hands, and spreads her cheeks open, revealing her " + (silly ? "bootyhole" : "anus") + " and her big, puffy pussy, dripping with thick, off-white juices.");
			output("\n\n<i>“Mmmmh, we’ll have to see about that later, won’t we?”</i>");
		}
		output("\n\n<i>“Oh, anyway, guess what I brought over?”</i> Shizuya motions to a crate on the far side of the kitchen. Anno raises an eyebrow and goes over to open the crate.");
		output("\n\nAs she lifts the lid, Anno yells out in excitement. <i>“Sweet stars, is this what I think it is!?”</i>");
		output("\n\nShizuya pulls out a massive bottle full of a clear, bubbling liquid. <i>“Hell yeah, genuine General Grindguttz’ Pussy Burner, classified as a lethal poison on thirteen different planets.”</i> It certainly looks the part; every small shake Anno makes causes the liquid to bubble up like it’s about to blow up the bottle, and on closer inspection, the liquid that looked clear from a distance is actually a roiling soup of faint, translucent colors.");
		output("\n\n<i>“Last time we had this... fuck, I don’t even remember what we did, but you don’t wake up in a busted C-982 with half a ton of juiced oranges without something cool happening, right? Of course I felt like I got kicked in the head by a recoiling railgun for a week afterwards, so I’m probably going to pass on this.”</i> She brings the bottle up to her nose, and recoils after just a small sniff. <i>“Oh, Void! I forgot how strong this stuff smelled! I didn’t even take the top off!”</i>");
		output("\n\n<i>“Yeah, the vapors on that stuff are like breathing vodka, it’s fuckin’ awesome. All this Treatment stuff really bumped up my tolerance, so I can actually drink that stuff straight now.”</i>");
		output("\n\n<i>“Hoo boy, and I was just telling [pc.name] earlier about that time you outdrank that big asshole.”</i> Shizuya snickers at that.");
		output("\n\n<i>“Hey, cap, did she mention how they had to pour me into a taxi after, because I couldn’t feel my legs? And that was me winning, you should’ve seen the other guy!”</i>");
		output("\n\nThe two spend the next half an hour reminiscing about the past. There’s happy stories, funny ones, and a few sad ones that cap off the mood. A hearty handshake brings the spirits back up, and a smile to their faces.");
		output("\n\n<i>“All that’s behind us, though. A new start, for both of us, let’s just keep making the best of it!”</i> A little cheesy, but a very nice sentiment. <i>“Anyway, food’s done! We’re gonna serve up on our ship, since I have to feed the crew, and you probably don’t want a mob of weirdos running around your ship. Grab a cart and let’s get going.”</i>");
	}
	else
	{
		if (pc.isNice()) output("\n\n<i>“That’s impressive!”</i>");
		else
		{
			output("\n\n<i>“Are you trying to show off?”</i> You ask.\n\n<i>“... Maaaaaaybe, you like it?”</i>"); 
			if (pc.isMisch() && silly) output("\n\n<i>“Hey, that was pretty good.”</i>\n\n<i>“I have crippling depression.”</i>\n\n<i>“Seriously?”</i>\n\n<i>“No, that was an earlier draft, I’m pretty well off now.”</i>"); 
			else output("\n\n<i>“Meh.”</i>\n\n<i>“Feh.”</i>\n\n<i>“Bleh.”</i>\n\n<i>“Heh.”</i>");
		}
		output("\n\n<i>“Gonna be a bit longer here, so, uh, wanna talk some more? I can... ya know... say things, about stuff... that I did.”</i> That sounds... descriptive. <i>“I mean, I kind of already told you all the interesting stuff a bit ago. Well, the interesting stuff that I’m comfortable with.”</i>");
		output("\n\n<i>“Bad stuff?”</i>");
		output("\n\n<i>“Yeeeeeeeeah. It’s, like, the stuff before I got all " + (silly ? "swole." : "huge.") +" I mean, I’ll tell ya, even if it’s kind of... weird for me. Gotta spend time somehow, and ya know, I like ya.”</i> She’s known you for less than a day, though. <i>“I get to like people pretty quick, okay? It’s like, I meet people, talk to ‘em, and then we’re fucking in a few hours. I know it sounds weird, but it just sort of happens that way.”</i> That does seem to be the way of things, for you, at least. <i>“So, you want some story time?”</i>");
		output("\n\n<i>“Why not?”</i>");
		output("\n\n<i>“Ya know, I don’t really have time for specifics, but I’ll give you the jist of it. I used to be tiny as shit, like, just a bit bigger than Mika. Little baby nerd Shizuya. I grew up on some ass backwards fuckin’ Kaithrit colony, don’t even remember the name now, got outta there as soon as possible. Reasons and shit. I don’t wanna get into it, cause I don’t wanna get pissed and ruin the food, boils my fucking blood, I tell ya. Anyway, I did good enough at my new school to get a scholarship to a nice university. I met a guy who was a big wig at a company called Akkadi R&D, apparently he was a professor there and had his own lab just off of campus. Long story short, yadda yadda yadda, He got me a job at Akkadi after I graduated.”</i>");
		output("\n\n<i>“That didn’t sound so bad.”</i>");
		output("\n\n<i>“Oh, we’re at the bad part. I got pushed from project to project for a few years before I got put on this big one. Miniaturizing warp gates, big fuckin’ deal stuff. That was the best time of my life, I’m telling ya; made great friends, got a boyfriend, felt good about myself for the first time in a long time.”</i>");
		output("\n\n<i>“This still sounds pretty...”</i> You stop as you see tears welling up in her eyes. <i>“And then it all went fucking wrong. The project went to shit; we tested it too damn early, and almost everyone who went through died... including Roy.”</i>");
		output("\n\nOh.");
		output("\n\n<i>“He went in, an... a-and he never came back out. He never came out... It was all my fault! It was all my fault! It was all my...”</i> Shizuya starts freaking out at the memories, but Adelline quickly puts a stop to it, roughly grabbing her by the shoulders, turning her to face her, and looking her straight in the eye. No words are exchanged, but they don’t seem to need to be. Shizuya calms down and wipes the tears from her eyes, before refocusing on cooking.");
		output("\n\n<i>“S-sorry ‘bout that, I-I just thought I could talk about this now. So much has happened since then, but I still can’t get over this stuff.”</i>");
		output("\n\n<i>“Sorry I brought it up.”</i>");
		output("\n\n<i>“No, no, I wanted to talk about it. If I just try and bury it, I’ll never really be able to move on. I should be thankin’ you for putting up with it. Anywho, uh, let’s talk about something else, wind down a bit.”</i>");
		output("\n\nThe conversation briefly shifts to just casual banter, before quickly dissolving into more bondage talk between her and Mika. You get some really interesting lessons on leashes; good and bad collar materials, proper grip. The conversation stops just as the last of the food is prepared. <i>“Done and done! Gonna take it over to our ship; gotta feed the crew, and I doubt you want a mob of weirdos running around your ship. Grab a cart and let’s get moving.”</i>");
	}

	addButton(0, "Next", shizzyIntroductionDinner, destination);
}

public function shizzyIntroductionDinner(destination:String):void
{
	clearOutput();
	author("QuestyRobo");
	showBust("SHIZUYA", "MIKA");
	
	var ate:Boolean = flags["SHIZZY_NOMMED_MIKA"] != undefined;
	
	output("You all make your way down the hall and to the airlock. Once you pass through to her ship, you find not much to get excited about. The wide, tall hallway is mostly steel colored, with some red accents. There’s a stack of signs in front of you, with different colored lines going from them, along the walls. One leads to the left, and says “Hangar Elevator”, the other two lead to the right and say, “Crew Quarters: Block 4” and “Mess Hall/Kitchen”. You assume that’s where you’re going.");
	output("\n\nShizuya pulls out her codex and starts to speak into it. <i>“Hey guys, food time! Everyone get your asses to the mess hall.”</i> Her voice echoes throughout the hall, presumably from an intercom system. Faint voices start echoing down the hall, growing steadily louder. Shizuya puts her hand on your shoulder and pushes you along.");
	output("\n\n<i>“Come on, don’t want to get stampeded before we serve up.”</i> She shepherds you to the mess hall, passing a colorful collection of " + (silly ? "crewmemebers" : "crewmembers") + " on the way. You burst into the mess hall, a group of at least 80 in tow. The mess is certainly big enough, at least; it looks more like a large dance hall with how spacious it is.");
	output("\n\nYou look over and see where the kitchen is. Or, well, where it used to be. They weren’t exaggerating when they said a grenade blew up in there; you can hardly make anything out through all the soot. There’s a few people in there that were cleaning up, who come out as soon as you enter. One of them approaches you directly, though they’re all wearing gas masks, so it’s hard to make out her face. A mask can’t hide her whole body though, and it’s obvious that she’s a gryvain. Wings, tail, and scales all on full display, all pitch black, her skin is a chocolate tone, smooth and supple, the darkness contrasted by long, flowing locks of blonde hair. She’s also military, a pair of military pips decorating her simple, white shirt.");
	output("\n\nShe removes her gas mask, revealing a pair of piercing, slitted pink eyes, long eyelashes, and supple, black lips. One odd thing you note, is that there’s a slight glow emanating from her mouth.");
	output("\n\n<i>“You must be [pc.name] Steele. Lieutenant Commander Aerowyn Alsmith.”</i>");
	output("\n\n<i>“Military?”</i>");
	output("\n\n<i>“Miss Tamaran and crew are actin’ under a UGC assignment. As such, an active duty officer of Lieutenant rank or higher is required to be present in order to enforce regulations and make regular progress reports.”</i>");
	output("\n\n<i>“Okay, why come up to me, though?”</i>");
	output("\n\n<i>“What you did on Tarkus turned a few heads, including mine.");
	if (completedStellarTetherGood()) output(" Ya did good kid: Single-handedly taking out a group of entrenched, heavily armed pirates by yourself. That’s the kind of thing that gets people promoted, sometimes more than once. I should know.”</i>");
	else output(" You may not ‘ave been successful, but your bravery, and the fact that you survived at all is impressive. That’s worth at least a commendation, a promotion or two if you had succeeded; I know that bit from experience.”</i>");
	output("\n\nShe points toward the pips on her shirt. <i>“See that red one? That’s the Republic Medal of Valor. I’d recount ya the tale, but it looks like the men don’t wanna wait any longer, ey?”</i> Cheers erupt from behind you, calling for you to get on with the food serving.");
	output("\n\nYou do so with gusto, setting it up buffet style with large plates of food in the middle of one of the larger tables on one side of the room, and setting out enough plates and silverware for everyone. The crew sieges the food table, tearing down the walls of food, and taking the fruits of their conquest to their tables. Thankfully, Shizuya prepared more than enough, and you’re able to serve yourself a hearty portion.");
	output("\n\nYour stomach growls heavily as you look at the platter you’ve prepared for yourself. Your main course is a huge platter of smoked brisket, heavily seasoned and seared, red in the middle, and so moist and tender that your fork almost glides through it. On the side, you have a large bowl of rich, creamy, crisp coleslaw, and one of those baked potatoes from earlier, filled with sour cream, melted cheese of all kinds, chives, and bacon bits, all fried into a nice crust; they’re practically overflowing with how stuffed they are. For dessert, you grabbed the last piece of a delicious looking neapolitan cake, with delicious buttercream frosting, and is just delectably moist.");
	if (pc.tallness < 5 * 12 + 2) output("\n\nYou dig in and start eating as much as you possibly can. Unfortunately you bit off more than your tiny body could chew, and you quickly stuff yourself, barely having finished half of your food. Shizuya is sitting across from you, and softly comments on your predicament. <i>\“There there little " + pc.mf("guy", "girl") + ", you don’t have to eat all of it, just finish what you want.”</i> She reaches over and starts petting you. Your body is so heavy with food, that you couldn’t work up the strength to get her off, if you wanted too. She stays there for about a minute, before pulling off, and blowing you a soft kiss.");
	else output("\n\nYou dig in and start chowing down. " + (ate ? "You’ve barely" : "You haven’t") + " had a bite to eat since this whole thing started, and you’re going to get your fill, damn it! Shizuya watches as you gorge yourself, outpacing you, despite having to deal with her much larger portion. It almost becomes a silent competition between you and her, seeing whose appetite is stronger. You both finish at around the same time, though, ending whatever perceived bout the two of you were in, in a draw.\n\n<i>“Love that enthusiasm, it’s infectious. Suppose that means the food was good?”</i>");
	output("\n\n<i>“Definitely.”</i>");
	output("\n\nYou recline back in your seat, content to ride out the food coma until the end of this, when you suddenly feel something brush against your leg. You’re about to look under the table and see when suddenly");
	if (!pc.isAssExposed())
	{
		output(" you feel your");
		if(!pc.isAssExposedByArmor()) output(" [pc.armor]");
		if(!pc.isAssExposedByArmor() && !pc.isAssExposedByLowerUndergarment()) output(" and");
		if(!pc.isAssExposedByLowerUndergarment()) output(" [pc.lowerUndergarment]");
		output(" being yanked down, and a small object placed inside your [pc.anus].");
	}
	else output(" you feel a small object being pushed into your [pc.anus].");
	output(" You jump a bit and quietly yelp, getting immediately shushed by whoever is under the table.");
	output("\n\n<i>“Initiation time, meat.”</i> The voice starts speaking softly, and of course it’s Mika.\n\nWait, “initiation?”");
	output("\n\n<i>“Yeah " + pc.mf("boi", "gal") + ", time to break you in. I’m going to take what you’ve got down here, I’mma " + (pc.hasCock() ? "suck" : "eat") + " it like a real Treated bitch, and if you squeal, that vibe is going to make you cum like a firehose in front of everyone. Deal?”</i>");

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
	showMika();
	author("QuestyRobo");
	
	//mode is -1 for herm, 1 for deeks, 2 for pussays and 3 for silly. 0 is for losers.
	var mode:int;
	var destination:String;
	var deek:CockClass;
	var cIdx:int = -1;
	var vag:VaginaClass;
	var vIdx:int = -1;
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
			addButton(0, "Penis", shizzyIntroductionHazing, [destination, 1]);
			addButton(1, "Vagina", shizzyIntroductionHazing, [destination, 2]);
			return;
		}
		else if (pc.hasCock()) mode = 1;
		else if (pc.hasVagina()) mode = 2;
		else if (silly) mode = 3;
		else
		{
			output("<b>Something has gone very wrong. Please report this.</b>");
			addButton(0, "Next", flyToWrapper, destination);
			return;
		}
	}
	
	if (pc.isTreatedBull() || pc.isAmazon()) output("So, the little girl wants to " + (mode == 1 ? "suck your cock" : "eat you out" ) + " huh? Well, who are you to say no to a little after-dinner action. It’s a Treated tradition after all, probably.");
	else output("<i>“Bring it on.”</i>");
	output(" Mika chuckles happily as she");
	if (pc.hasLowerGarment()) output(" finishes removing your [pc.lowerUndergarment].");
	else output(" turns her attention to your [pc.crotch].");

	if (mode == 1)
	{
		cIdx = pc.longestCockIndex();
		deek = pc.cocks[cIdx];
		output("\n\nThe perverse pipsqueak takes stock of your [pc.cocks],");
		if (pc.hasCocks()) output(" juggling your multiple endowments, examining the bouquet you’ve offered her. Rather than trying to do anything fancy, she just picks out the largest she can take, and pushes your others to the side.");
		else output(" taking it in her hands, making note of its size and shape.");
		
		if (deek.cLength() <= 8 || deek.thickness() < 1.5) output("\n\n<i>“Hmph, I guess this is a good break from Shizuya, no offense. I mean, if you wanted it bigger, it’s not like that’s hard.”</i>");
		else if (deek.cLength() <= 16) output("\n\n<i>“Nice heft, good shape, prime meat right here.”</i>");
		else if (deek.cLength() <= 30 || deek.thickness() < 4.5) output("\n\n<i>“Trying to turn this thing into a club or something? Maybe you and Shizuya should go fencing with these babies, I know she’s always wanted to try that.”</i>");
		else output("\n\nYou hear nothing for a few moments as Mika looks over your mammoth tool. You expect that she’s simply awe-struck with the amount of dick that you’re packing, but the real reaction you get kind of deflates your ego on that. <i>“I can work with this. Sorry for the pause, need to do a few jaw stretches. You really should lay off the Virection, you weirdo.”</i>");
	}
	else if (mode == 2)
	{
		vIdx = pc.wettestVaginaIndex();
		vag = pc.vaginas[vIdx];
		output("\n\nThe tiny tramp softly spreads the lips of your [pc.pussy " + vIdx + "], dipping one of her little, pudgy fingers into your honeypot. You twitch at the sensation, but the movements of her fingers seem more exploratory than anything fully for your pleasure. She presses against your inner walls, seeing how far they stretch, and makes a heavy, scooping motion as she exits you.");
		if (vag.wetness() <= 3) output("\n\n<i>“Not bad, I can work this; just gotta warm you up a bit.”</i>");
		else if (vag.wetness() <= 5) output("\n\n<i>“Mhm, that’s some nice slut wetness you’ve got down here. Makes me want to break out the strap-on, but that breaks the spirit of the thing.”</i>");
		else output("\n\n<i>“Pfft, are you trying to turn yourself into a faucet down here? Am I stealing a meal from some poor galotian? ... Shouldn’t have eaten so much...”</i>");
	}
	else if (mode == 3)
	{
		output(" Mika spies your genital-less state and seems incredibly taken aback, to the point where she crawls out from under the table and stares at you like you just killed a man.");
		output("\n\n<i>“WHAT THE FU.. UH... UH...”</i> The world around you turns blue in an instant, everyone around you gone, and Mika replaced with the all too familiar text.");
		output("<i>");
		output("\n\nA problem has been detected and TiTS has been shut down to prevent damage to your dong. The system encountered an uncorrectable ‘hardware’ error.");
		output("\n\nTechnical Information");
		output("\n\n*** STOP: 0x4uk1nn3uter5");
		output("\n\nBeginning dump of physical cummies");
		output("\n\nPhysical cummies dump complete");
		output("\n\nContact your system code dragon or armchair forum coder for further assistance.");
		output("</i>");
		output("\n\nThe struggles of playing a porn game without genitals. At least CoC2 won’t have this bullshit. You find and hold down the power button, shutting it all down before rebooting. When everything comes back, you find yourself a few minutes after when you crashed, Mika sitting a few seats down, giving you a very disappointed look.");
		addButton(0, "Next", shizzyIntroductionEpilouge, destination);
		return;
	}
	
	output("\n\nYou sit straight up in your seat, pushing yourself up closer to the table in order to avoid any wandering eyes. Of course, as you look around, the eyes are less wandering, and more following a detailed map to exactly where you are. Mika either told them ahead of time, or you’re just that unsubtle. Regardless, you have an audience for this" + (pc.exhibitionism() >= 50 ? ", sweet." : ".") + " Shizuya seems especially excited, giving you a big double thumbs-up from across the table.");
	output("\n\n<i>“You can do it, man" + (silly ? ", believe in the me that believes in you.”</i>" : ".”</i>") + " Um, sure. Before you can really respond, you feel a pair of soft lips around your " + (mode == 1 ? "[pc.cock " + cIdx + "]" : "[pc.pussy " + vIdx + "]") + ", and you know the show’s getting started.");

	if (mode == 1)
	{
		output("\n\nBefore you can prepare, Mika slams herself down on your [pc.cock " + cIdx + "],");
		if (deek.cLength() <= 16) output(" taking the whole thing to the [pc.sheath].");
		else output(" taking as much of your many inches as her throat will allow.");
		output(" You stifle back a groan, remembering what she told you what would happen if you were too loud. It soon gets much harder to hold back, as the pint-sized cock vacuum uses her throat like a mechanical onahole. She jackhammers herself on your prick, her Treated instincts keeping her from getting tired or needing to breathe too soon. Loud, wet noises ring through the mess hall, and quiet murmurings start to become audible as you continue to be the center of attention.");
		if (pc.exhibitionism() < 50) output("\n\nYou try and ignore all of the eyes on you, but there’s just too many! You’re breaking out in a cold sweat, it’s so embarrassing... but some part of you is enjoying it, pushing you to keep going until the end.");
		else output("\n\nYou push your [pc.chest] out, confidently, revelling in the attention that you’re getting, and determined to ride it out until the end.");
		output(" That end might be coming up sooner rather than later. You feel a tightness forming in your gut and [pc.balls] as your body gets ready to release. You’re about to boil over, you can practically taste it. She’s so relentless, taking your meat over and over again, seemingly uncaring about your imminent orgasm. Seemingly, but not actually.");
		output("\n\nJust when you’re about to rush past the point of no return, she stops. She stops with a superhuman suddenness that leaves a bit of residual warmness on your [pc.cock " + cIdx + "], that quickly fades as you’re exposed to the cold air of the mess hall.");
		output("\n\n<i>“Did you think it was going to be that easy? No, no, no,");
		if (silly) output(" your punishment must be more severe.");
		else output(" you’re far from done here.");
		output(" Don’t even think about trying anything, either. I see one hand and that vibe is going to go off like a thraggen cluster mine.”</i> Damn it, looks like you’re in here for the long haul.");
		output("\n\nYou try and calm down, panting as your [pc.cocks]");
		if (pc.cumQ() < 8000) output(" drip");
		else if (pc.cumQ() < 40000) output(" dribble");
		else output(" spray");
		output(" pre onto Mika. You can’t see her face, but you can just imagine the grin she has on it, watching you in this state.");
		if (pc.hasVagina()) output(" Even your [pc.pussy] is on the edge, soaking the seat under you");
		if (pc.wettestVaginalWetness() > 5) output(", your [pc.girlCum] running out in voluminous enough amounts to make a small puddle under you and run over the sides");
		output(". You’d think she’d let you rest, that she’d give you some kind of warning before she started up again, but no!");
		output("\n\nWhen your ardor dies down, not even that much, just enough to take you away from the edge, she takes you right back. She grabs your [pc.cock " + cIdx + "] and starts jacking it off like she’s polishing the barrel of a railgun. You almost yell out again, but manage to choke it down. Can’t give up now! She jerks you until you’re sent careening toward orgasm, and like before, she stops right before you blow, leaving you to cool off in the cold air.");
		if (pc.balls > 0) output("\n\nMika starts massaging your [pc.balls], gently caressing the sore orbs as more of your pre leaks onto her. ");
		else output("\n\n");
		output("<i>“Mmh, you’re getting really pent up now, aren’t you? Yeeeah, I’m gonna pump you up and up until you’re ready to fucking explode; and then you’re gonna squeal like a little piggy, and I’m going to make you cum ‘til your brain melts into nothing but a pile of cummed-out mush.");
		if (pc.hasPerk("Nuki Nuts")) output(" Oh? I guess I’m pumping you up in more ways than one.”</i> Oh fuck, you’re getting so pent up that your stupid ‘nuki balls are starting to swell up! <i>“This is going to be a </i>lot<i> more fun than I thought.”</i>");
		else output("”</i>");
		output("\n\nYou’re already struggling to maintain your composure. The pistoning blowjob, combined with with her constant edging have left you a sweating, panting mess. You hunch over the table, digging your nails into it as you try to distract yourself from her wrapping her tits around your [pc.cock " + cIdx + "]; trying to distract yourself from her perfect, warm, chocolatey globes caressing your straining meat, her wide, boiling hot tongue caressing your [pc.cockHead " + cIdx + "], overheating your [pc.cockColor " + cIdx + "] skin, until your dick feels like an iron bar fresh out of the smelter. You feel yourself at the peak again, and then feel it snatched away from you, again.");
		output("\n\nYou slam your head against the table, both in frustration and to muffle an involuntary groan as you reach peaks of pleasure that you didn’t even know your body could reach without orgasming. You’re a complete wreck at this point, babbling and drooling against the table as the whole hall stares on. Shizuya has been staring particularly intently, almost transfixed on your situation. You hear a loud thud and a yelp from Mika.");
		output("\n\n<i>“Damn it, Shizuya! Why don’t you wear fucking panties?”</i> The meowmazon’s face turns red as some of the eyes around you shift to her.");
		output("\n\n<i>“Sorry. Um, maybe you could do both of us?”</i> The already unbearable heat under the table suddenly grows in intensity, like someone lit a fire next to your already boiling [pc.crotch]. Your mouth feels so dry from all this heat... so thirsty...");
		output("\n\n<i>“Hey, do something useful. Go get our friend here some water. Poor " + pc.mf("guy", "girl") + "’s about to pass out over here.”</i>");
		output("\n\nShizuya pops up, unashamedly flaunting her rock-hard, pre-spewing erections as she hops over to the food table and pours out a big glass of punch. She hurries back over and slams the glass down in front of you, giving you a beaming smile.");
		output("\n\n<i>“There ya go! Gotta have all the fluids you can for the big finish, whatever happens.”</i> Mika seems to have stopped long enough to let you drink, and drink you do. You grab the glass and knock it back in seconds, your immense thirst driving you to seek any liquid you can.");
		output("\n\nYou slam the glass down, and let out a loud grunt of satisfaction, immediately followed by a feeling of sudden dread as you realize what you’ve done.");
		output("\n\n<i>“I’ll let that one slide.”</i> The tiny tormentor mumbles out as she suddenly grows quiet. For a second, you wonder what she’s doing. After that second, you realize exactly what she’s doing. All at once, she takes " + (deek.cLength() <= 16 ? "the whole of" : "a large amount of") + " your [pc.cock " + cIdx + "] into her mouth");
		if (pc.hasPerk("Nuki Nuts")) output(", her hands darting down to press into your already massively inflated sack, sinking into it like a beanbag chair.");
		else if (pc.balls > 0) output(", her hands darting down to your [pc.balls], giving them a hefty squeeze.");
		else output(".");
		output(" You choke back what must be the biggest moan you could let out, your throat straining, and your resolve waning.");
		output("\n\nShe’s back to deepthroating you, and you’re sure that she’s not going to hold back this time. You try and brace yourself, but there’s no way you could, not in this state. All of your muscles are slack from pleasure, your head feels light, it’s almost like all of your blood has pooled in your [pc.cocks], making it feel like half of your weight has shifted into your crotch. It feels so bloated, like your skin is an overfilled balloon, and it’s going to pop; thankfully, in not nearly as disgusting a way.");
		if (pc.cumQ() < 8000) output("\n\nYou unload into Mika’s throat, desperately spraying every drop from your [pc.balls] down her clenching throat. You keep cumming, and cumming, and cumming. Even when you’re long empty, your body still tries to expel more cum than you could possibly make without mods. You’re so sore... Stars, you won’t be able to sit right for a week!");
		else if (pc.cumQ() < 40000) output("\n\nYou fire off into Mika’s throat, your [pc.cock " + cIdx + "] feeling more like a hose that’s been kinked up for an hour, and finally got straightened out. You flood her throat, letting out an inhuman amount of [pc.cum] almost straight into her gut. Of course, she’s Treated, so your load is nothing that she can’t handle, and she takes as much as you pump out, without complaint. Even your mighty reserves run dry, but that doesn’t stop your body from trying to expel more. You clench and pump until your [pc.balls] feel like they’ve been through a ringer, and then keep going. Oh boy, you’re not going to be sitting right for a while.");
		else 
		{
			output("\n\nYou explode like a broken faucet, hosing gallons of [pc.cum] down her throat. She tries her best, and being Treated, her best is pretty damn good, but even her mighty moo tummy can’t handle everything you put out, and she eventually lets you out of her sinfully tight, moist mouth, letting you unload right onto her. Shizuya gasps and pushes her crotch further under the table, presumably right into Mika, judging by her reaction.");
			output("\n\n<i>“Damnit, no!”</i>");
			output("\n\n<i>“Come oooooooooooon! [pc.heShe]’s already basting you, it’s just a bit more.”</i>");
			output("\n\n<i>“A bit? You two are going to flood the fucking ship!”</i> The flustered feline whimpers and backs off, casting lusty eyes around the hall to see if there are any takers.");
			output("\n\nMeanwhile, your [pc.cumColor] flood has gotten large enough that you feel it at your [pc.feet]. There’s no end to the flow; it’s like the dam keeping your [pc.cum] inside you has completely broken, and every drop is rushing out like a river. You can only imagine how absolutely coated Mika is, or how far the pool of your seed is spreading. You don’t even have the energy to lift your head to see for yourself, you just have to take the cat calls and laughing from the people around as indication of it. Stars, you’re still going! You probably came again, but your nerves are so overstimulated that all sensation blends together. You’re going to be so sore after this.");
		}
	}
	else if (mode == 2)
	{
		output("\n\nYou feel something slowly inserting itself into your honeypot. It’s big, thick, and sinfully warm. The" + (vag.hasFlag(GLOBAL.TYPE_EQUINE) ? " immense" : "") + " heat of your [pc.pussy " + vIdx + "] is almost frigid in comparison. It’s her tongue, rolled into a decidedly phallic shape, and cutting through your inner lips like a hot iron, slowly, through butter. You almost moan out as you feel the simmering contact between flesh, the burgeoning heat starting to spread like wildfire in your loins. You catch yourself before you can blow it early, keeping your mouth shut tight, and doing anything to distract yourself.");
		output("\n\nHer tongue continues its trek to your deepest reaches, her upper lip accentuating the pleasure every time she passes a particularly sensitive spot by brushing across your [pc.clit " + vIdx + "]. She bottoms out after a surprisingly long time. Her tongue is as long as, and much thicker than, most cocks. You feel so full! She holds for a minute, undulating her fuck piston slightly to keep stimulation on you. Just when you feel yourself running up against the edge, she yanks out, liberally splattering your fluids across her face as her tongue drags out a plentiful helping of it. You’re left to cool down from the burning fire she stoked in you, your [pc.pussy " + vIdx + "] still");
		if (vag.wetness() <= 3) output(" dripping");
		else if (vag.wetness() <= 6) output(" drooling");
		else output(" fountaining");
		output(" [pc.girlCum] onto the seat below you.");
		output("\n\nIt’s maddening. You almost feel like reaching down and doing it yourself, but you figure she wouldn’t like that; and you’d be correct. She closes in on your mons again, getting what must be mere centimeters from your skin, enough that you can feel the vibrations from her voice as she speaks.");
		output("\n\n<i>“This is </i>mine<i> now, meat. I control it, I say if and when she’s good enough to get fucked, and I say when she cums, and how hard, and trust me, when I decide it’s time, she’s gonna cum </i>hard<i>.”</i> Terrifying and reassuring at the same time, not like your lust-enamored brain registered much beyond being able to cum.");
		output("\n\nShe keeps your lust momentum going by lapping up the [pc.girlcum] from your outer lips, the heat from her tongue helping to keep the fire of your lust high. It’s not enough to keep your lust from waning over time, but that’s probably intentional. As soon as you’re back to a reasonable level of arousal, you suddenly feel her fingers shoot into your [pc.pussy " + vIdx + "]. Stubby and plump, but surprisingly dextrous, they work their way into your moist depths, plundering the treasures inside.");
		output("\n\nShe hits your sensitive spots with such speed and accuracy that it can’t be guess work. Her Treated instincts combined with her tongue probing earlier seem to have let her plot out a mental map of the pleasurable spots in your cunt, a map that she follows to a tee. Your pleasure shoots up like a rocket as her fingers dance from one sensitive point to another. You almost slam your head into the table in order to stop yourself from crying out. You feel like there’s no way she could stop your momentum toward orgasm, but she somehow knows just when to let up so that you stop just before climax.");
		output("\n\nYour crotch is like a swamp at this point. You might not have cum yet, but nobody seems to have told that to your [pc.pussy " + vIdx + "].");
		if (vag.wetness() <= 3) output((pc.raceShort() != "ausar" ? " You’re no ausar" : " You’re pretty dry for an ausar") + ", but that hasn’t stopped you from leaving a sheet of [pc.girlCum] on the seat, and coating the inside of your [pc.thighs]. You’re sure that Mika’s face has some splatter on it as well.");
		else if (vag.wetness() <= 5) output(" You really made a mess down there. There’s a large puddle on the seat below you, and you can hear stray drops leaking off the sides. Your [pc.thighs] are also soaked and dripping, no doubt contributing to a second puddle under the table. You’ve probably soaked little Mika too, glazed her in a few layers of [pc.girlCum].");
		else 
		{
			output(" You’re fully aware of the torrent you’ve been letting out. [pc.girlCum] is flowing off the sides of your seat in small waterfalls, collecting in several puddles on the ground. Your [pc.legs] are soaked from top to bottom, dripping so much that a passerby would think you’d just gone swimming. Little Mika is probably drowning down there, though, from the faint giggles you hear, that’s not a bad thing. You’re still squirting too, like a damaged faucet that won’t be turned off.");
			output("\n\n<i>“Fuck, Steele, is this some kind of threat? You’re going to drown me if I don’t get you off?”</i> You might not be thinking that, but your body is definitely sending that sort of message, almost like your womanhood is aiming for her.");
		}
		output("\n\nShizuya has been staring at you the whole time, enraptured by your situation. Her hands have been firmly in her lap, probably to keep her colossal cocks in check.");
		output("\n\n<i>“Hey Shizzy.”</i> Mika calls out, snapping Shizuya out of her stupor, and confirming your theory as her hands come up and ‘something’ impacts the bottom of the table, nearly lifting it up.");
		output("\n\n<i>“Pay attention, damn it, you almost hit me! Go get [pc.name] some water or something; I feel like I’m draining [pc.him] dry.”</i> She’s not entirely wrong, your mouth feels like a desert, in fact, it feels like most of the liquid in your body is running out your [pc.pussy " + vIdx + "].");
		output("\n\nShizuya pops out of her seat, nubby horse wangs waving freely in the air as she prances over to the food table. She pours out a tall glass of punch, making sure to wag her bubbly ass in your direction as she does. She has a sex sashay as she comes back and plants the glass in front of you.");
		output("\n\n<i>“There ya go, sweetie. Best of luck.”</i> You chug down the glass, drinking it like a " + pc.mf("man", "woman") + " in a desert who just found an oasis. Mika is still lapping up your juices almost right from the source, keeping you from fully calming down as you refresh yourself.");
		output("\n\nAs soon as you’re finished, however, you feel her fingers at your entrance again, and you brace for the inevitable. Several more times you’re sent hurdling to the finish line, only to stop right at the edge, and get slowly dragged back. Each time, the distance between your climax and when she decides to throw you towards it, grows more and more narrow. Finally, instead of letting you calm down, she keeps her finger on your G-spot, unmoving.");
		output("\n\n<i>“Good " + pc.mf("boy", "girl") + ", very good. I think it’s time we gave you a nice reward.”</i> You’re almost insensate by this point, panting and drooling as you lay limply on the table, so there’s no way you can respond.");
		output("\n\nYou don’t really need to respond, it wouldn’t matter at this point anyway, she’s already in charge. Her finger starts to move again, slowly, methodically. It starts with some simple jittering, putting just the slightest amount of pressure on your G-spot. The intensity grows painfully slowly, not going far enough to take you over the edge, yet. It’s driving you crazy! You use whatever strength you have left in order to wiggle your hips into her. Before you can get anywhere with that, you feel a hard slap on the inside of your [pc.thigh], and that last bit of strength jolts out of you.");
		output("\n\n<i>“Bad, bad, bad, bad, bad!”</i>");
		output("\n\nYou groan softly in apology as Mika repositions herself, planting her face right up against your [pc.pussy " + vIdx + "] and one of her fingers on your [pc.clit " + vIdx + "]. There’s no way for you to brace for it. You know exactly what she’s going to do, and you’re just going to have to sit there and take it. On cue, her familiar tongue breaches your nethers once more, while her finger starts strumming your clit like a guitar string during a solo. She tongue-fucks you like a beast in heat, thrusting in and out with a level of speed that you’d only expect out of the most seasoned studs.");
		output("\n\nYou cum instantly, once, twice, thrice, you lose count almost instantly as her heavy treatment, combined with her constant teasing, causes your orgasms to cascade into each other at an accelerating rate. White hot pleasure blends each one into a continuous stream. Your life in this moment is nothing but blinding orgasm, everything else gets pushed out of your thoughts. Friends, family, your mission, everything not to do with the wonderful moo tongue bringing you to new heights of pleasure is cast aside in this blissful moment.");
		output("\n\nYou try and wring her dry, every muscle in your [pc.pussy " + vIdx + "] working overtime to try and breed you with the phallic object, despite you knowing you’re not getting any " + (silly ? "cummies" : "cum") + " out of it.");
		if (vag.wetness() <= 3) output(" She takes every drop you have and more. There’s no way for your poor pussy to keep up with her thirst, but the little girl tries its best anyway, splattering any traces of [pc.girlCum] it can dredge up.");
		else if (vag.wetness() <= 6) output(" She keeps up with your productive pussy well. You spray [pc.girlCum] out in large gouts, each one gleefully swept away by her pistoning tongue. You keep pumping out uncontrollably from your back-to-back orgasms. She’s not complaining, it’s probably thirsty work tongue-fucking with such ferocity.");
		else output(" You spray out massive gouts of [pc.girlCum], so much that she can’t possibly keep up, and you can hear your juices splash out around her tongue. You didn’t think the sounds from you coupling could get any wetter, but now it sounds more like someone’s popping water balloons against your crotch. Mika grunts in irritation, takes her strumming finger away, and presses her whole mouth against your mons, taking your overflow directly into her mouth.");
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
	showMika();
	
	shizzyIntroductionHazingLoss(destination);
}

public function shizzyIntroductionHazingLoss(destination:String):void
{
	output("You can’t hold it back anymore, it’s just too much! You let out a wailing moan, so loud that everyone in the mess hall can hear it. As soon as you do, you hear a click, and immediately feel something stirring in your [pc.anus]. It isn’t just vibration, there’s some kind of wetness that wells up for a second, before seeping into your anal walls, leaving a slight tingling sensation in its wake. You wonder what it just did, until you figure out exactly that. Your [pc.skin] breaks out in goosebumps, and an unbearable heat spreads through your whole body. Your previously slack muscles spring back to life with an overload of energy.");
	output("\n\nYou shoot up from the table, leaving Mika behind as you move around the room in jolts, feeling more like a remote control toy with a broken receiver as surges of energy and pleasure force you to move somewhere, anywhere just to burn off the excess. Your [pc.crotch] feels so heavy and swollen, like you haven’t cum in weeks even though Mika just finished draining you dry, and then some; what the hell did she do to you? Another small surge of wetness comes up in your butthole, getting just as quickly absorbed, except instead of just a tingling sensation, it’s almost like it’s burning a path to your crotch.");
	output("\n\nYou fall onto your back as pleasure builds in you like a balloon attached to an industrial air pump. You can’t do anything but scream and pump your hips wildly into the air as you’re assaulted by mind bending pleasure.");

	if (pc.hasCock())
	{
		output("\n\nYour [pc.cocks] " + (pc.hasCocks() ? "are" : "is") + " so adamantine hard that you can almost see the blood rushing through the coiling, overworked veins.");
		if (pc.hasVagina()) output(" Your [pc.pussy] is just as riled up, feeling like it’s swelling to almost double its size from the amount of blood going into it.");
		output("\n\nPre pools at the " + (pc.hasCocks() ? "tips" : "tip") + " of your meat, more than you’ve ever seen. How can you have more cum, what the fuck did she give you? Heavy contractions start in the bottom of your gut, reverberating into your [pc.balls] and " + (pc.hasCocks() ? "shafts." : "shaft.") + " You feel like a soda can that’s been shaken up in a tumble dryer, ready to pop, to fucking explode whether someone opens you or not.");
		output("\n\nIt gets heavier and heavier, until you feel like your crotch is made of lead. Your screams of pleasure devolve into mindless babbling, and then, finally, teeth gritting as you feel something snap, like the rope on a catapult.");
		if (pc.cumQ() < 8000) output(" You hose out [pc.cum] in gouts that are bigger than your entire, usual orgasm. Your [pc.balls] are working overtime to keep up with the demand of your drugged-up libido. It doesn’t work completely, and you fire far more blanks than real shots, but you still get out enough to give yourself a nice [pc.cumColor] coating. Whatever she gave you must have skyrocketed your production.");
		else if (pc.cumQ() < 40000) output(" You spray out [pc.cum] like a hose, your urethra working so hard that the contractions come in less than a second after each other. Even your virility can’t quite keep up with your drugged-up lusts, and your stream wanes as your [pc.balls] struggle to keep pace, even with what seems like a production boost from whatever is going through you. It doesn’t take long for you to absolutely coat yourself in a few layers of [pc.cumColor], and there’s more where that came from.");
		else output(" You explode, firing cannon blasts of [pc.cum] with such force that small splatters coat the ceiling. Your continuous climax is so forceful, that rivers of your seed run out from your urethra, in addition to the massive, thick arcs that fly up into the air. You’re soaked from above and below as you form a small, [pc.cumColor] lake under you. It feels like so much more than usual. Maybe whatever she put in you is putting your [pc.balls] into overdrive? Doesn’t really matter at this point.");
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
		output("\n\nYour [pc.pussy] feels, and looks absurdly swollen, like it’s just spent a few hours inside a pump. Your hand grabs for it, almost out of instinct, your fingers sinking into the yielding, swollen flesh. The contact is like a lightning bolt striking you, setting you off in an instant. Your back arches off the ground, your whole body paralyzed except for your busy fingers.");
		if (pc.wettestVaginalWetness() <= 3) output(" You rain down [pc.girlCum] onto the ground below you, spraying like a sprinkler as the familiar feeling of back-to-back orgasms returns with a vengeance.");
		else if (pc.wettestVaginalWetness() <= 6) output(" You hose [pc.girlcum] onto the ground below you, firing off like a water gun, creating a small puddle under your feet, as the familiar feeling of back-to-back orgasms returns with a vengeance.");
		else output(" You shoot [pc.girlcum] out with the volume and ferocity of a hose, spraying so hard that your streams scatter on impact, causing a thin rain to fall over you. Your back arches even harder as the pressure from expelling so much lady juice brings you to even further heights of pleasure. You feel like a living water fountain, and the only thing left on your mind is, how many people in this room want to come and help plug you up? Void, if only you had the motor control to speak, you’d start a fuck train right here and now!");
	}

	output("\n\nAs you continue to cum your brains out, you hear a yell ringing out from where you were sitting. <i>“OH FUCK!”</i> You dredge up enough control to look over, just in time to catch a huge gout of pearly cum across the [pc.chest]. <i>“Damnit Shizuya! What’s the point in me restraining you if you’re just going to cum anyway?”</i>");
	output("\n\n<i>“S-s-sorry, it wa-as just so fuckin’ h-h-hooooooooooooooot!”</i> You see Mika, standing on the table, holding Shizuya’s hands behind her back, probably to keep her from masturbating, not like it helped. Her cocks are hosing out cum at an amazing rate, already making a good-sized puddle under her feet after only a few seconds. Her eyes are going red again, and she’s looking at you, hungrily.");
	output("\n\n<i>“Fine, have at it. She lost, so she’s getting punished anyway.”</i> Mika lets go of her arms, and immediately Shizuya springs over to you. She holds one of her members toward you, jerking it off to get her flow going at full speed. The other one gets nestled right in her cleavage, where it launches cum with enough force to obscure her vision, and absolutely paint her.");
	output("\n\nShe stands there, painting the booth of you white, as the warm, liquid contact on your hyper-sensitive skin only extends your own orgasm. Eventually, both of you run your course, leaving a small flood on the floor, and a deafening cheer from the crowd around you. Shizuya picks up your slack, coated form, throwing you over her shoulder as she fiddles with her cum-drenched codex.");
	output("\n\n<i>“It’s alright, bud, even when ya lose, everyone wins!”</i> Your only response is a soft groan. After a minute, a beeping sound starts, and you feel a faint suction on your body. Before your eyes, the cum on the floor starts draining into some unseen mechanism. The same mechanism also seems to suck the fluids straight off your bodies, leaving you and Shizuya squeaky clean.");

	pc.orgasm();
	
	addButton(0, "Next", shizzyIntroductionEpilouge, destination);
}

public function shizzyIntroductionHazeThroughItAll(destination:String):void
{
	clearMenu();
	clearOutput();
	author("QuestyRobo");
	showMika();
	
	output("Despite how drained you are, you hold fast, choking down any noise in order to win. She keeps at you, making you cum several more times, but after a while, even her persistence reaches its end, and she concedes defeat.");
	output("\n\n<i>“Very good, Steele. Not many people on this ship can say they got through that without my little toy going off. Of course, I’m pretty sure most of them lose on purpose anyway, but whatever.”</i> She comes up from under the table, next to you, and flashes a thumbs up to the rest of the hall, which erupts in cheering. You see that Shizuya has moved to another table, flanked by two busty women, with a noticeable puddle below them. They also flash you a thumbs up.");

	pc.orgasm();
	
	addButton(0, "Next", shizzyIntroductionEpilouge, destination);
}

public function shizzyIntroductionNoHazing(destination:String):void
{
	clearMenu();
	clearOutput();
	author("QuestyRobo");
	showMika();
	
	output("You tell her no, you don’t want to be a part of whatever she’s planning down there.");
	output("\n\n<i>“Bleh, you really are no fun, you know that?”</i> She spitefully yanks out whatever she put inside of you. It’s not hard enough to hurt, but enough to let you know without a doubt that she’s upset. A few boos come your way as Mika climbs out from under the table, and the raspberry she blows at you certainly isn’t very nice either. That brief period of unpleasantness ends, leaving things to go back to normal.");
	
	addButton(0, "Next", shizzyIntroductionEpilouge, destination);
}

public function shizzyIntroductionEpilouge(destination:String):void
{
	clearOutput();
	author("QuestyRobo");
	showBust("SHIZUYA", (annoIsCrew() ? annoBustDisplay() : ""));
	showName((annoIsCrew() ? "SHIZUYA &\nANNO" : "SHIZUYA"));
	
	output("The rest of the day is filled with food, drinks, and getting to know a few of the " + (silly ? "memebers" : "members") + " of the crew. It’s an odd bunch to say the least, filled with people of almost every race you can think of. It feels like you could learn a lot about a ton of different cultures just from being here; that is, assuming both of you aren’t too drunk to talk coherently, because the drinks, right now at least, flow like water around here, and they’re <i>strong</i>. They’re the kind of drinks that would knock most people out, and even stuff that would put the unconditioned in the hospital.");
	output("\n\nYou eventually settle into a large lounge, where you" + (annoIsCrew() ? ", Anno" : "") + ", Shizuya, and pals take some time to just shoot the shit, and by the time you decide it’s time to part ways, it’s already been several hours.");
	output("\n\n<i>“Well, shit, has it been that long? Alright, guess we better get movin’ on here. Addy, you been watching the coms?”</i>");
	output("\n\n<i>“Of course, someone has to have been working this whole time. Judau hasn’t been seen in... Wait, we might have something. One of our moles just got contacted, Leda-squad is moving in, and is requesting back-up.”</i>");
	output("\n\n<i>“Fuck yeah!”</i> Everyone hops up immediately, and excitedly. <i>“Um, yeah, gotta deal with this. But, uh, you know, if you see us around, ya can stop by anytime.");
	if (annoIsCrew()) output(" You too, Anno. Sorry we couldn’t, uh, ya know, today. Offer’s still open, ‘specially if you bring your friend along.”</i>\n\nAnno blows Shizuya a quick kiss, before turning to you. <i>“Looking forward to it. Both of us, I hope.”</i> ");
	else output("”</i>\n\n");
	output("With that, you follow Shizuya and company out of the room, parting ways at the hallway as you head back to the airlock, and back to your ship, where you replot your original course, and set off.");
	
	flags["SHIZZY_MET"] = (annoIsCrew() ? 2 : 1);
	if (yammiIsCrew()) flags["SHIZZY_YAMMI_AT_TRAP"] = 1;
	else flags["SHIZZY_YAMMI_AT_TRAP"] = 0;
	
	addButton(0, "Next", flyToWrapper, destination);
}

/*
 * anno things
*/
public function shizzyAnnoShipTalk():void
{
	clearOutput();
	author("QuestyRobo");
	showBust(annoBustDisplay(), "SHIZUYA");
	
	output("As you’re about to enter your ship, you see Anno off to the side, talking to Shizuya. The two seem to be very chummy. Do they know each other? You walk up to them, getting giddy waves from both as they see you approach.");
	output("\n\n<i>“Boss, you didn’t tell me you knew Shizuya. I mean, I guess you couldn’t have really known, but, just, wow, how long has it been?”</i> She turns to Shizuya.");
	output("\n\n<i>“Three years? Something like that. Sorry I haven’t been keeping up.”</i>");
	output("\n\n<i>“It’s alright. I can see you’ve, uh, been through... quite a lot.”</i> Anno seems unfocused as she looks over Shizuya. You wonder why, until you see that the newfound interest on Shizuya body is causing her skirt to stir and bulge out.");
	if (annoIsHuskar())	output(" She seems especially enamored with Anno’s new curves. She isn’t the only one who changed quite a bit in the last three years.");

	output("\n\n<i>“Uh, a-anyway, yeah, me and Anno go back to Akkadi. She was sort of my boss.”</i>");
	output("\n\n<i>“Sort of?”</i> Anno crosses her arms in mock offense. Both of them chuckle before Anno turns back to you. <i>“But yeah, she was part of my team. It takes me back, you know. Me, her, and the others messing around, trying to figure things out; good times. I haven’t been able to catch up with any of you, have you talked to the others?”</i> Shizuya shrugs her shoulders.");
	output("\n\n<i>“Nah, I kinda wanted a fresh start after everything. Then, ya know, shit happened, and I just kinda got too busy. I almost didn’t even recognize ya!”</i>");
	output("\n\n<i>“Yeah, me neither...”</i> Anno is almost unashamedly staring at Shizuya’s bulging crotch, not like it’s easy to ignore; it looks like she’s smuggling a pumpkin in her skirt. You don’t hear any ripping this time, though, so she’s at least wearing stronger underwear today. Shizuya starts blushing and stammering a bit as a wet patch starts forming at the front of her skirt.");
	output("\n\n<i>“I-I, uh, let’s, uh... I’ll m-message you later, ‘kay?”</i> She starts to back away before Anno takes a step toward her and starts to speak.");
	output("\n\n<i>“Come on, don’t be such a stranger. I’d love to come over and... catch up. I’m sure [pc.name] would love to join us, too.”</i>");
	output("\n\nThe worry drains from Shizuya’s face, replaced with mischievous glee and lust, only to be replaced with more worry as you hear a loud tear and her skirt flies up, revealing her cocks for a second, before the mauve cloth settles down over them. Anno moves back quick enough to not get smacked in the face, and is left mere inches from the towering feline’s concealed cockheads, the sheer size difference between them making it so that Anno is eye-level with them, standing up.");
	output("\n\n<i>“SORRY! I, uh...”</i> Shizuya starts running off. <i>“I’ll see you guys later!”</i>");
	output("\n\nAnno is frozen, wide-eyed. You put your hand on her shoulder and try to shake her back to awareness. It takes a few moments, but eventually she blinks it off. <i>“Oh, fuck, sorry boss. That was just... wow. You never really get used to that Treated smell, especially when it’s right in your face.”</i>");
	
	if (flags["SHIZZY_SEXED"] != undefined)
	{
		output("\n\n<i>“If you thinks that’s bad, you should try sleeping with her.”</i>");
		output("\n\n<i>“Yeeeeah, that’d be... potent.”</i>");
	}
	else if (pc.isMisch() || pc.isTreated()) output("\n\n<i>“It’s" + (pc.isBimbo() ? ", like," : ",") + " so much better if you’re Treated, though.”</i> Anno pauses, then chuckles when she realizes, or at least thinks you’re joking. <i>“Pft, yeah, I guess it would be. Just not a fan of the horns, you know?”</i>");
	else output("\n\n<i>“Yeah, I noticed that.”</i>");
	output("\n\nYou walk with Anno back to the ship. As you’re about to get in, you take one last look over to where Shizuya went. From this angle you can see her behind a large crate, some poor woman trying to stay cogent as she realizes she bit off more than she could chew.");

	flags["SHIZZY_MET"] = 3;

	addButton(0, "Next", mainGameMenu);
}

/* 
 * ship stuf goes here
 */
 
 //Possibly the worst function I’ve ever written -lighter
 //ADD BUSTS ME
 public function shizzyMajinMenu():void
 {
	clearMenu();
	clearOutput();
	showShizuya();
	
	//Hangar Scenes
	if (flags["MAJIN_SHIZZY_LOC"] == 1)
	{
		switch(majinTimeZone())
		{
			//Morning Scenes
			case 1: switch(rand(6))
			{
				case 0: 
					output("You walk up to Shizuya as you see her lifting Mika up into an open panel on one of the ships. You don’t even say anything, but one of her acute senses picks you up anyway, and she turns her attention to you.");
					output("\n\n<i>“Oh, hey ca-c-caaaAAAAP.”</i> Mika shifts suddenly in her grip, throwing her off-balance, and sending them both to the ground. Thankfully, Shizuya cushioned Mika’s fall... with her face.");
					output("\n\nMika is sitting directly on Shizuya’s face, trying to get her bearings back as Shizuya holds her steady. It takes a strangely long time, and it’s pretty obvious why once you hear the soft squelching noises coming from the point of contact. For her part, Mika is completely composed atop her pussy perch, and Shizuya is surprisingly discrete. After a few awkward minutes Mika hops off, the only evidence of their tryst being trace amounts of wetness on Shizuya’s face.");
					output("\n\n<i>“Sorry ‘bout that, cap, little accident.”</i> She hops up off the floor and picks Mika back up to the ship, where she sarcastically quips.");
					output("\n\n<i>“Yeeeaaah, big old accidental tongue in my pussy.”</i> Shizuya doesn’t even react as she gets Mika into place.");
					output("\n\n<i>“So, what’s up?”</i> You tell her that you were just hoping to talk. <i>“Oh, sweet! I was just killing time here anyway. Let’s head up to my room.”</i> She leads you up the lift and into her room, where she " + (silly ? "pomfs" : "throws herself") + " onto her bed.");
					output("\n\n<i>“So, what’s happenin?”</i>");
					moveTo("MAJIN OFFICERS QUARTERS");
					processTime(2);
					break;
				case 1: case 2:
					output("Shizuya is working by herself, off in a corner. She seems to be struggling with something, but her back is turned, and you can’t quite see what it is. You walk up and hear her grunting and cursing as she bangs on some unseen machine. She’s panting and coated in sweat," + (flags["SHIZZY_SEEN_FLESHLIGHT"] == undefined ? " is she alright?" : " is she in that fleshlight again?") + " You tap her on the shoulder and she jumps in surprise.");
					output("\n\n<i>“GAH! Wha-wh-what? Where did you come from? I-I’m n-not doing anything. I just, ya know," + (flags["SHIZZY_SEEN_FLESHLIGHT"] == undefined ? " d-didn’t make a mechanical fleshlight with an old engine, and got it stuck.”</i>" : " d-didn’t try and use the mechanical fleshlight, again...”</i>") + " You look around her, and, as you’d have guessed, that’s exactly what she did. <i>“Please help...”</i>");
					output("\n\nYou’re about to go get someone when the jury-rigged machine suddenly starts working again, driving her to orgasm in seconds as it works to make up for lost time. Mika rises up from the other side of the device."); 
					output("\n\n<i>“What did I tell you about this old thing? I’ll build you a new one, just be patient.”</i> She waits a moment for Shizuya to finish, before pulling out a big, industrial bag full of cum, taking off with it for unknown (but probably easy to guess) purposes.");
					output("\n\nShizuya finally pulls out of the entrapping machine, and breathes a heavy sigh of relief. She stares at you with a big smile. <i>“Sorry about that, just got a bit bored" + (flags["SHIZZY_SEEN_FLESHLIGHT"] == undefined ? "... again." : ".") + " Ya wanna talk or something? We could talk, or, ya know, once usually isn’t enough for me.”</i> Sounds good. You hop into the lift, and head to her room, where she digs through a drawer for another thong, and lays herself on the bed as she puts it on.");
					output("\n\n<i>“How ya doin’, cap?”</i>");
					flags["SHIZZY_SEEN_FLESHLIGHT"] = 1;
					processTime(5);
					break;
				case 3: case 4: case 5:
					output("Shizuya is stacking crates, looking increasingly bored while doing so. After stacking one on top of an already gigantic stack, you see her slump over and, presumably, pass out. You walk up and put your hand on her");
					if (pc.tallness < 5*12+2) output(" thigh"); else if (pc.tallness < 7*12+11) output(" side"); else output(" shoulder");
					output(", trying to shake her awake. She jolts awake almost comically, scrambling around until she nearly falls on her ass.");
					output("\n\n<i>“I’M AWAKE, I’M AWAKE! ... Oh, it’s just you, cap. Sorry, shit just gets so boring during the early hours. Saaaaaaaay, ya wanna head up to my room? We can talk or... whatever.”</i> She grabs her skirt-covered crotch for emphasis. Whatever you’re going to do, you head up to her room and relax as she lays herself on her bed.");
					output("\n\n<i>“What’cha got?”</i>");
					processTime(1);
					break;
			} break;
			case 2: switch(rand(4))
			{
				case 0: case 1: case 2:
					output("Shizuya is running all over the place, helping out and operating machines. She doesn’t look tired or overworked, but she looks exceedingly bored. One last heavy looking piece of machinery later and she looks like she’s had absolutely enough. That’s when she sees you, and her eyes light up.");
					output("\n\nShe runs up to you and grabs your shoulder. <i>“Heeeeeeeey, buddy! Welcome back. Let’s go up to my room; NOW!”</i> She doesn’t give you much of a choice,");
					if (pc.tallness < 5*12+2) output(" picking you up"); else output(" grabbing you by the hand");
					output(" and taking you up to her room. Once you both are in, she slams the door shut behind her and collapses onto the bed. <i>“Thank. You. Sweet void, this shit gets grating sometimes, and I just need an excuse to get out. Please, tell me you came over to fuck. I can talk, but I really want some fuck.”</i>");
					moveTo("MAJIN OFFICERS QUARTERS");
					processTime(2);
					break;
				case 3:
					showBust("SHIZUYA", "WINSTON");
					output("Shizuya and Winston are working up high on one of the ships. You can’t really tell what they’re doing, but they seem to be yelling quite loudly. You can’t make out most of what they’re saying, but you hear something about");
					output(RandomInCollection([" rabbits and bears.", " skinning a moose.", " horsecocks and dogcocks.", " handholding.", " gay frogs.", " balls touching."]));
					output(" The argument continues for about another minute, before you hear something concerning. Loud creaking followed by a crash as you hear Winston yell out.");
					output("\n\n<i>“HOLY SHIT!”</i> You look up and see Winston plummeting toward you. You don’t know if you should get out of the way or try to catch him. Before you can decide, he’s already on you. Thankfully his bungee cord pulls taught before he hits the ground, leaving him suspended upside down in front of you.");
					if (flags["SHIZZY_WINSTON_CRASH"] == undefined) output("\n\n<i>“Oh, is this the big kiss scene? And here I am forgetting my spandex.”</i>");
					else output("\n\n<i>“Nice to know you can still joke around after nearly splattering your head on the deck like an old pumpkin.”</i> Mika quips as her and Shizuya rappel down. <i>“Hey, let me tell you about the time I did a whole routine in an exploding refinery sometime.”</i>");
					output("\n\n<i>“I feel like you’re doing this on purpose now.”</i> Mika quips as her and Shizuya rappel down. <i>“Maaaaybe. If it makes you feel any better, I’m at least not getting off to it.”</i>");
					output("\n\nMika scoffs and works on cutting him down, while Shizuya comes up to you. <i>“Welp, that happened" + (flags["SHIZZY_WINSTON_CRASH"] == undefined ? ", again." : ".") + " Anyway, we’re done on this one, so I’ve got some free time! You wanna pop up to my room for some ‘break time’?”</i> Might as well.");
					output("\n\nWith a quick trip up the lift, you arrive at Shizuya’s room, where she flops down onto her bed. <i>“Anything ‘special’ ya wanted to do, cap?”</i>");
					flags["SHIZZY_WINSTON_CRASH"] = 1;
					processTime(5);
					break;
			} break;
		}
	}
	else if (flags["MAJIN_SHIZZY_LOC"] == 2)
	{
		switch(majinTimeZone())
		{
			case 1: case 2: if (metKiro() && flags["SHIZZY_KIRO_TALK"] != undefined)
			{
				output("You [pc.walk] into Shizuya’s room only to see that she’s not there. You do hear the shower running, and a quick call-out gets you a muffled response.");
				output("\n\n<i>“Be out in a minute, cap.”</i> That leaves you to just explore her room. You pull a few holotapes down from one of her shelves, finding many of them to be pornographic; several volumes of Amazing Amazon Assfucking, two volumes of Slippery Shortstack Sluts, a copy of The Breedenstain Bears, the entire Horsecock Hell collection, with bonus scenes, and");
				if (silly) output(" Extreme Public Handholding. That fucking degenerate!");
				else output(" The Complete Works of Tank Kannon, which upon closer inspection seems to be a collection of piano solos. Who knew he was an expert pianist in addition to being an expert in penis.");
				output("\n\nAs you’re looking over her collection, you hear a message beep from the computer on her desk. You wouldn’t pay too much mind to it, but a quick glance shows you a very familiar looking ‘Nuki on the screen. You move up to the screen and confirm that, yes, it is Kiro. It’s Kiro and several other dick-wielding girls");
				if (penny.hasCock() && flahneDickOut()) output(", including Penny and Flahne,");
				else if (penny.hasCock()) output(", including Penny,");
				else if (flahneDickOut()) output(", including Flahne,");
				output(" all showing off their goods. The picture chain is titled ‘GalLink Monthly Meat Parade’.");
				if (flags["KIRO_ORGIED"] != undefined) output(" Looking closer, you do recognize the people from your last meet-up, as well as quite a few people whom you haven’t seen.");
				else output(" This must be some group that Kiro is a part of. Definitely something you’d expect out of her.");
				output("\n\nShizuya steps out of the bathroom at that moment. <i>“What’cha lookin’... OH SHIT!”</i> She rushes over to the the screen. <i>“The new meat parade is out! Let’s see umm, oh, there I am! Check it!”</i> It’s definitely Shizuya, in a very obscene photo of her with her front pressed against a pane of glass, lifting her balls up so that everything is on display and visibly dripping fluids. <i>“Hah, second place, again! ‘Course Kiro cheats so I’m basically first place.”</i>");
				output("\n\n<i>“You know Kiro?”</i>");
				output("\n\n<i>“Oh, yeah, we met a while back. Long story short; She was after the same guy I was, we started fighting over who got him, both of us got caught ‘cause of that. Stripped us down, tied our hands, and threw us in a cell. We argued for a bit, mostly about who got us caught. I tried not to get turned on, but she kept teasing me. Eventually we just started frotting, and we came so much that the cell flooded. The poor guy who came to check what was happening almost drowned when he opened the door! Anyway, bang boom, we used that little distraction to turn the tables and get the job done. Kept up ever since. Let me get dressed here.”</i>");
				output("\n\nShe wanders over to her closet, picking out her usual outfit, which she seems to have plenty of sets of, and putting it on. She sits on the bed and motions you over.");
				output("\n\n<i>“So, what’cha need?”</i>");
				flags["SHIZZY_KIRO_TALK"] = 1;
				processTime(15);
			}
			else switch(rand(8))
			{
				case 0:
					showBust("SHIZUYA_NUDE", "MIKA_NUDE");
					output("You hear soft moaning as you enter Shizuya’s room, and it’s easy to tell who they’re coming from as soon as you enter. You see Shizuya splayed out on her bed, ass up, coated in sweat, and surrounded by soaked, well used toys. Atop her upraised ass sits Mika, triumphantly polishing a massive, drenched strap-on.");
					output("\n\n<i>“Hey Steele, here to talk to Shizzy?”</i> Maybe you are. She slaps Shizuya hard on the ass, causing her to break out of her stupor and moan out loud. <i>“WAKE UP!”</i> To punctuate, she hops down and grabs a string coming from Shizuya’s ass. The curvy pipsqueak gives it a yank, causing an obscene string of massive anal beads to fly out. The speed that they pop out makes you cringe, but Shizuya is loving it, cumming her brains out and moaning in pure bliss.");
					output("\n\n<i>“All yours. Don’t worry, she’s still ready to go. Even I’ve never been able to really tire her out.”</i> That’s a bit of a scary thought, you have to admit. Before you can think much about that, Shizuya slinks back to life, rubbing her undoubtedly sore ass and groggily working her way over to her closet, dressing herself without a care that she reeks like someone who’s been locked in a week long orgy.");
					output("\n\nShe moves back to the bed, plants herself down and gives herself a few good wake up smacks. <i>“Alllllright. Wanna fuck or something?”</i>");
					processTime(1);
					break;
				case 1: case 2: case 3:
					output("You hear some thumping beats as you approach. You open the door and are greeted by the sound of loud techno-pop, and the sight of Shizuya dancing sensually. Every movement she makes causes her assets to swing in a way that immediately draws your eyes to them. She has the form and sexual energy of a seasoned pole-dancer. Part of you thinks that it’s for your benefit, but she hasn’t seen you yet. Maybe it’s a Treatment thing?");
					if (pc.isTreated()) output(" Do you do that without even realizing it?");
					output("\n\nOne of her twirling dance moves turns her toward you, causing her to stop as she finally sees you. <i>“Oh, hey [pc.name], just a sec.”</i> She swipes on her codex screen, turning down the volume on her music, fading it into the background. <i>“Sorry it was so loud, I just love Sharon.”</i>");
					if (flags["SHIZZY_SHARON_TALK"] == undefined)
					{
						output("\n\n<i>“Sharon?”</i>");
						output("\n\n<i>“You’ve never heard of Sharon? I guess she is pretty old at this point. She was the first full AI pop star. She was super huge way back in the day. Of course, most people nowadays probably know her more for that time she went rogue and tried to steal a Terran battle carrier.”</i>");
						output("\n\nThat would be something to remember.");
						output("\n\n<i>“It sucks ‘cause all everyone ever talks about when ya bring her up now is the political stuff. Ya got AI rights guys claiming that she was some rebel trendsetter, fighting for the rights of all AI before anyone else. Ya got the other guys saying she was a sign we should have never let AIs get this far. Blah blah blah, crap crap crap. I don’t get into that shit, but I hear it all the damn time.”</i>");
						flags["SHIZZY_SHARON_TALK"] = 1;
					}
					output("\n\nShe flops onto the bed, nodding her head to the song for the last minute, until it ends. <i>“Nice to just lay back and enjoy, once in awhile. Did ya need anything?”</i>");
					processTime(5);
					break;
				//skip to last variation if too soon since last time. note the break is inside if clause.
				case 4: case 5: if (flags["SHIZZY_LAST_TIFFAD"] == undefined || flags["SHIZZY_LAST_TIFFAD"] + 2 < days)
				{
					showShizuya(true);
					output("You hear very obvious grunting and moaning as you approach the door. It’s not the kind of guttural intensity that you’d hear from an intense fucking, so you assume she’s probably by herself. For a second you think about coming back later, but then you remember who Shizuya is, and figure she’d probably like it if you walked in on her masturbating" + (pc.hasPerk("Ultra-Exhibitionist") ? ", you know you would." : ".") + " You open up the door and find something a bit different than you were expecting.");
					output("\n\nInstead of masturbating by herself, her tits are hooked to a tall milker, the three person-sized milk tanks half full. Her eyes are blood red and glazed over, and her hips are moving at a frantic pace as she grips two handles on the sides of the machine. You look around the machine and see" + (flags["SHIZZY_LAST_TIFFAD"] == undefined ? " an android being violently facefucked." : " Tiffa being violently facefucked, again.") + " Her stomach is obscenely gravid, touching the floor as she kneels down and unflinchingly accepts Shizuya’s hefty loads, while jerking her other cock between her synthetic tits.");
					output("\n\nShizuya growls out like a feral beast as her quads tighten up and her tits spray even harder, filling the tanks at staggering speeds." + (flags["SHIZZY_LAST_TIFFAD"] == undefined ? " The android’s" : " Tiffa’s") + " belly bloats out to even more insane proportions. If she weren’t synthetic you’d be really worried, but even then, it’s a very strange sight. Even her mammoth belly can’t take all of Shizuya’s load, and it starts to spill out, being sucked through openings in the floor by some unknown force.");
					output("\n\nThe feral feline slumps down as her orgasm wanes, as does her lactic flow. Her eyes fade back to mostly green, and her cocks softly flop out of" + (flags["SHIZZY_LAST_TIFFAD"] == undefined ? " the android’s" : " Tiffa’s") + " synthetic maw. The bionic babe gets up with an ease that you wouldn’t expect out of someone carrying roughly their own body mass in fluid, but she obviously has more strength than a typical organic, or even an average synthetic.");
					output("\n\n<i>“Another excellent batch, captain. You’ve certainly made use of your personal milker.”</i> She pats the nearly overflowing tanks, before carting the machine out, excusing herself as she passes you.");
					output("\n\nShizuya sighs as she collects her clothes and calmly puts them on. <i>“Hey [pc.name], just gettin’ milked. These girls get out of hand pretty quick, and Tiffa’s always there to help when I need it.”</i>");
					output("\n\n" + (flags["SHIZZY_LAST_TIFFAD"] == undefined ? "Wait, wasn’t Tiffa the one they said blew up the kitchen? <i>“Yeeeah, she’s got her moments. She does fantastic work the rest of the time, though.”</i> " : "") + "She casually struts over to the bed, making sure her ass ripples in your direction before she pivots and lies down. She flashes you a sultry look and palms her covered crotch, causing it to pulse with desire.");
					output("\n\n<i>“Don’t think that little quickie burned me out, cap. I’m ready and willing!”</i>");
					flags["SHIZZY_LAST_TIFFAD"] = days;
					processTime(15);
					break;
				}
				//Watchan Animu
				case 6: case 7: 
					output("You hear faint noises coming from inside the room, nothing you can make out from here. You enter the room and see Shizuya sitting on her couch, watching something on the holoscreen. She notices you and calls you over, patting the spot on the couch, next to her. You head up and" + (pc.isTaur() ? " stand, unable to sit down with your tauric body," : " sit down,") + " Shizuya giddily pointing you toward the screen to show you what she’s watching.");
					switch(rand(4))
					{
						case 0:
							output("\n\nThe show depicts several extremely curvy Treated girls of different races. The curviest one is an ausar, though not a hellhound, in an orange gi and nothing else, with tits easily bigger than a child, each. The other ausar is a hellhound, though a short one. She’s clad in nothing but a skintight, blue bodysuit and some white plates on her nipples that are probably supposed to pass as armor. She has a constant scowl, but the camera takes every opportunity it can to show how tightly the suit clings to her gushing pussy lips. The third one is a thraggen, green as can be, and wearing nothing but a loose-fitting purple gi, and pants that ride so far down her legs that you can catch glimpses of her clit. There are some normal cowgirls with them, but they don’t seem to do much.");
							output("\n\nThe episode pits the girls against a bull named Lord Frostyballs and his Gyaru Force. Most of it is very prolonged sex scenes where the girls scream very loudly in pleasure as they monologue about how tough their opponent is. It’s stupidly indulgent, and you wonder who would make something like this, until you see the ‘New Texas TV’ logo in the corner.");
							output("\n\n<i>“I love this show. People say the filler is annoying, but, like, it’s extra sex, so who cares? Ya watching this show for the plot or somethin’?”</i>");
							break;
						case 1:
							output("\n\nThe show stars several girls with increasingly ridiculous hair-styles. It culminates in the main character whose hair looks more like a coral reef than anything that belongs on a human; and the carpet matches the drapes. It’s easy to tell that from the almost gimp-like attire she’s wearing. Tight leather, spiked collars and armbands, and an ornate, golden buttplug that’s magic or something. She yells out ‘Yuri Oh!’ and it vibrates and turns her into what appears to be just a slightly taller version of herself with angry eyebrows.");
							output("\n\nThe show seems to be about her and her friend with what you recognize as an old Terran Brooklyn accent, except it’s so thick that it’s comical, traveling the world, playing a strange card game with holographically projected monster girls. Each duel seems to put in some kind of ridiculous scenario involving traps and arenas that would have needed to be set up months in advance, yet the bad guys seem to have set them up within, at most, a day. Each one is some kind of over-the-top fuck-machine, or some kind of magic bullshit, and there’s some talk about sending people to the Scissor Realm.");
							output("\n\nYou stop following the actual duels as soon as you realize that they’re just making shit up as they go. It’s all just an excuse to see digital monster girls fuck until one of them explodes.");
							break;
						case 2:
							output("\n\nThe show follows a loud-mouthed girl who travels to a strange, dystopian high school in order to get revenge for her father’s apparent murder by the head of the school. It seems normal, at first, but then she finds a sentient school uniform that transforms into a sling bikini, gives her superpowers, and also turns her into a beefy bimbo, complete with make-up, huge tits, and an ass that could suffocate a man. That theme carries through the rest of the show; heroes and villains alike all get similar suits, each with their own unique powers and sexual transformations. Fights are bombastic, switching between hard core sex, over the top action, and heartfelt speeches seamlessly. What follows is a baffling, shameless, yet amazing series of events that eventually culminate in a war against clothing itself.");
							output("\n\nThe show obviously doesn’t take itself seriously, but it’s so confident in itself that it’s absolutely engrossing.");
							break;
						case 3:
							output("\n\nThe show is about giant robots, something that the memorabilia around Shizuya’s room tells you that she’s very much into. It takes place in a post-apocalyptic world where furries have forced humanity into sexual slavery, with only a small group hiding underground, and a group of rebels fighting on the surface. It begins innocently enough, with people underground, mining for materials, when one of the characters finds a strange object that... yeah, that’s a dick. That pretty sums up what you see from the show. The robots have giant, laser shooting dicks and tits. The entire motif seems to be plunging big, metal cocks as deep into things as possible. And that’s great.");
							break;
					}
					output("\n\nShe turns off the screen after finishing an episode. <i>“Alright, enough of that, let’s get comfy.”</i> She hops up and stretches, before walking over to the bed and flopping down on it.");
					output("\n\n<i>“What’s up?”</i>");
					processTime(15);
					break;
			} break;
			//Night Scenes
			case 3: switch(rand(5))
			{
				case 0: case 1: case 2: case 3:
					output("You decide that it’s late enough that you should at least knock. Usually she’s all for you barging in on whatever she’s doing, but sleeping is probably pretty high up on the list of things she’d want to have uninterrupted. You knock on the door and hear an almost immediate reaction.");
					if (rand(2) == 0)
					{
						output("\n\nA quick burst of movement, and the door swings open, revealing Shizuya, staring" + (pc.tallness < 9*12 ? " down" : "") + " at you, dicks hard and swinging in the air.");
						output("\n\n<i>“Hey hey, [pc.name]! Come in, come in.”</i> She leads you in with an energy that surpases even her usual giddyness. She practically cannonballs onto her bed, causing it to shake violently, but it returns to its original shape quite quickly. <i>“Thank fuck you’re here. I can’t sleep and you’re a hell of a lot more interesting than just jerkin’ off ‘til I pass out again.”</i> She reaches into a dresser drawer next to her bed and pulls out a thong, sliding it over her half-hard cocks, and moaning as she rubs the encased flesh. <i>“Fuuuuck... love that feeling. Maybe I could slip into something else tight?”</i>");
					}
					else
					{
						showMika();
						output("\n\nYou hear her knocking around in there, grunting and mumbling as she sorts around her room. <i>“Just a minute.”</i> She groggily mumbles. A minute later she opens up the door, the unmistakable smell of her cum and pheromones flooding out. While you’re reeling from that, she grabs you and lifts you into a big hug.");
						output("\n\n<i>“Heeeeey buddy! How ya doin’?”</i> Other than her squeezing you like a tube of toothpaste, you’re doing great! <i>“Ooops, sorry.”</i> She sets you down. <i>“Come on in.”</i> She leads you in with a bit of grogginess still in her step, but that quickly dissipates as she gets closer to the bed. She flops down on it with a nice jump, before turning her attention back to you. <i>“Don’t worry, I don’t need much sleep these days anyway. What’cha need?”</i>");
					}
					processTime(5);
					break;
				case 4:
					output("You knock on Shizuya’s door, but don’t get any reaction. After about a minute of silence, you hear a loud snore. She must be pretty fast asleep, should you bother her?");
					flags["MAJIN_SHIZZY_SLEEP_TIMESTAMP"] = GetGameTimestamp();
					addButton(0, "Yes", shizzyWakeUpSleepyCat, undefined, "Yes", "Time to be a rude " + pc.mf("boy.", "girl."));
					addButton(1, "No", mainGameMenu, undefined, "No", "Better leave her alone.");
					return; break;
			} break;
		}
	}
	
	shizzyMajinMainButtons();
 }
 
 public function shizzyMajinMainButtons():void
 {
	clearMenu();
 	addButton(0, "Talk", shizzyGobWagging, undefined, "Talk", (silly ? "Strike up a conversation." : "Whip up some gibber-gabber."));
	if (pc.lust() >= 33) addButton(1, "Fuck", shizzyFunTimes, undefined, "Fuck", (silly ? "Get down, and maybe a bit dirty." : "Button say what happen. Do biggum. Fucky fucky."));
	else addDisabledButton(1, "Fuck", "Fuck", "You are not aroused enough for this!");
	addButton(2, "Special", shizzyChefsSpecialties);
	if (silly) addButton(3, "Appearance", shizzyStareAt, undefined, "Appearance", "OwO");
	else addButton(3, "Appearance", shizzyStareAt);
	addButton(14, "Leave", mainGameMenu, undefined, "Leave", (silly ? "That’s enough for now." : "Bye bye big lady."));
 }
 
 public function shizzyWakeUpSleepyCat():void
 {
	clearMenu();
	clearOutput();
	showShizuya(true);
	
	output("You slowly open the door, making sure not to make too much of a racket. What you see is what you expected; Shizuya is splayed out on her bed, buck naked and snoring heavily. The bed is a complete mess, and her cocks are half-hard and drooling cum. There’s also a trail of cum leading off into the bathroom, so something’s definitely happened here.");
	output("\n\nYou walk up to the side of her bed, not really too sure what you’re doing here, if you’re being honest. She looks blissed out, and even has a bit of drool hanging from her mouth. You might as well be polite. You grab a tissue and reach in to wipe the stray strand off of her face. Suddenly she turns toward you, arms unconsciously grabbing you as she shifts position. You’re pulled down into her grasp as she continues to snooze, her body devilishly hot even while sleeping.");
	if (pc.tallness < 5*12+2) output("\n\nYou’re wedged into her cleavage, your [pc.feet] just barely dangling out the bottom. She starts to purr intensely as she feels your small form held between her boobers. She starts to grab down tighter, bringing her legs up and her head down in order to fully envelope you.");
	else if (pc.tallness < 7*12+11) output("\n\nYou’re held in her grip, head pressed into her massive cleavage, though not enough to suffocate you. She starts to purr as she feels you pressed into her tits, and her grasp deepens.");
	else output("\n\nYou’re pressed face to face with her, your [pc.chest] mashing into her colossal tits. She starts purring as she feels you against her, and her grip tightens.");
	output("\n\nIf you don’t get out now, you’re probably not getting out until she wakes up.");

	addButton(0, "Escape", shizzyRunLikeHell, undefined, "Escape", "You got shit to do, man!");
	addButton(1, "Stay", shizzyZZZ, undefined, "Stay", "Embrace the snuggles.");
 }
 
 public function shizzyRunLikeHell():void
 {
	clearMenu();
	clearOutput();
	showBust("SHIZUYA_NUDE", "MIKA_NUDE");
	showName("SHIZUYA\nAND MIKA");
	author("QuestyRobo");
	
	output("You wiggle as hard as you can, without intentionally waking her up. Her grip is strong, but, in her unconscious state, it doesn’t have much fight in it, and you’re able to slip away. You hear a disappointed moan as you get off the bed. Looking back, she’s still asleep, but her arms seem to be searching for something to grab onto. You think about handing her a pillow or something, until you hear footsteps coming from the bathroom.");
	output("\n\nMika walks back in, drying herself off with a towel before tossing it in a nearby clothes hamper. She glances at you, but otherwise pays you no mind as she climbs onto the bed. Shizuya’s arms immediately seize the little moo and pull her in. You head out of the room as the two Treated babes settle in for a night’s rest.");

	addButton(0, "Next", mainGameMenu);
}
 
 public function shizzyZZZ():void
 {
	clearMenu();
	clearOutput();
	showBust("SHIZUYA_NUDE", "MIKA_NUDE");
	author("QuestyRobo");
	
	output("Well, it’s pretty late anyway, might as well take a snooze. You settle into her grip, letting her fully envelope you.");
	if (pc.isNude()) output(" Thankfully you go around in the nude, so this is comfy and uncomplicated, even if one of her erect cocks is rubbing against your [pc.ass].");
	else output(" You don’t even have time to take off your [pc.gear], but she doesn’t seem to mind, and the temperature control is good enough that it’s not uncomfortable.");
	output(" You’re about to settle in completely when you hear someone walking out of the bathroom. You can’t get a good enough look to see them, but you can immediately tell who it is once they start talking.");
	output("\n\n<i>“Dammit, you’re in my spot!”</i> Mika angrily whispers as she climbs on the bed. You explain that you didn’t exactly get into this situation intentionally. <i>“Ugh, whatever, just move over.”</i>");
	if (pc.tallness < 5*12+2) output(" She presses herself into Shizuya’s tatas alongside you. It’s a tight fit, but both babes are soft enough that it feels like being pressed between a pair of pillows. <i>“Hope you’re comfy, shorty, ‘cause I’m not moving.”</i> She presses her tits hard against your back, hot streams of milk dripping out as she dozes off.");
	else if (pc.tallness < 7*12+11) output(" She comes up top and squeezes herself down between Shizuya’s tits. She comes down low enough that her bare, jiggling ass peaks out right in your face. <i>“Enjoy the view, perv.”</i> She makes sure you get a nice, clear view of her drooling puss as she dozes off.");
	else output(" She squeezes herself down between Shizuya’s tits and your [pc.chest], settling in with little more than her head, shoulders, and tits exposed above the ocean of titflesh. She makes sure to scrunch her shoulders in to emphasize her bust to you. <i>“Need a midnight snack? Go ahead, take as much as you want, perv.”</i> Milk beads from her teats as she dozes off.");
	output("\n\nWith nothing else to be said, you join the two girls in dreamland, letting your weariness take over.");
		
	addButton(0, "Next", shizzyZZZZZ);
}

public function shizzyZZZZZ():void
{
	clearMenu();
	clearOutput();
	showShizuya();
	
	output("Before you even wake up, you feel something pressing against your face. You slowly open your eyes and see Shizuya staring back, her hand gently pressing against your face.");
	output("\n\n<i>“Cap, if ya wanna sleep together, all ya gotta do is ask. Not that I mind the surprise.”</i> She decouples herself from you and gets up, you following soon after. <i>“Was Mika here?”</i>");
	output("\n\n<i>“Yeah.”</i>");
	output("\n\n<i>“She probably got to work ahead of us. I still don’t know how she’s that sneaky.”</i> She starts digging through her closet, picking out her outfit and getting ready for the day’s work. <i>“Sorry we can’t mess around, gotta get things set up downstairs before I can slack off. Catch me later, okay?”</i> You promise you’ll try and stop by when you can, as both of you depart. You chatter on the way down the lift, before splitting off at the hangar; you leaving to get on with your business, and her gathering her crew together to get things in motion.");
	
	processTime(((4-hours)*60 - minutes)%(24*60));
	
	addButton(0, "Next", majinLeave, false);
}

public function shizzyGobWagging():void
{
	clearOutput();
	showShizuya();
	
	output("<i>“Oh, ya wanna talk? Sure thing, ask away!”</i>");

	shizzyTalkButtons();
}

public function shizzyTalkButtons(slot:int = -1):void
{
	clearMenu();
	if (slot != 0) addButton(0, "Herself", shizzyTellMeAboutYourMother, undefined, "Herself", "Ask about her.");
	else addDisabledButton(0, "Herself");
	addButton(1, "Crew", shizzyTalkCrew);
	if (slot != 2 && flags["SHIZZY_TALKED_HERSELF"] != undefined) addButton(2, "Kenka", shizzyWhyDoesSheWearTheMask, undefined, "Kenka", "Ask about her relationship with her boss.");
	else if (slot == 2) addDisabledButton(2, "Kenka");
	if (slot != 3 && flags["SHIZZY_TALKED_HERSELF"]) addButton(3, "Past", shizzyLetsDwellOnThePast, undefined, "Her Past", "Ask about before she got Treated.");
	else if (slot == 3) addDisabledButton(3, "Past");
	if (flags["SHIZZY_OUTFIT_STATE"] != undefined)
	{
		if (flags["SHIZZY_OUTFIT_STATE"] < 4 && slot != 4) addButton(4, "Outfit", shizzyGimmeYerClothes, undefined, "Her Outfit", "Ask about the outfit she wore during your fight.");
		else
		{
			if (flags["SHIZZY_OUTFIT_STATE"] < 4) addDisabledButton(4, "Outfit", "Outfit", "She’s already given you her outfit.");
			else addDisabledButton(4, "Outfit");
		}
	}
	if (slot != 5) addButton(5, "Black Iron", shizzyTellMeYourSecrets, undefined, "Black Iron", "Ask about the organization she works for.");
	else addDisabledButton(5, "Black Iron");
	if (slot != 6) addButton(6, "Treatment", shizzyHowDidTheyTreatYou, undefined, "The Treatment", "Ask about how she got Treated.");
	else addDisabledButton(6, "Treatment");
	if (slot != 7 && flags["SHIZZY_TALKED_TREATMENT"]) addButton(7, "Overdose", shizzyODdOnLifeItself, undefined, "Overdose", "Ask about the drug, Overdose.");
	else if (slot == 7) addDisabledButton(7, "Overdose");
	if (slot != 8 && flags["SHIZZY_TALKED_OVERDOSE"]) addButton(8, "Bounty", shizzyTellMeAboutTheBooty, undefined, "Bounty", "Ask about the person she’s after.");
	else if (slot == 8) addDisabledButton(8, "Bounty");
	addButton(14, "Back", shizzyMajinMainButtons);
}

public function shizzyTellMeAboutYourMother():void
{
	clearOutput();
	showShizuya();
	
	output("<i>“Who exactly are you?”</i>");
	output("\n\n<i>“Me? Jeez, that’s a bit hard. Uh, I guess I already told ya the basics back the... OH.”</i> She sits up and walks to a far wall with many framed pictures on it. She takes a few of them down and brings them over with a gleeful smile.");
	output("\n\n<i>“Okayokayokay! So here’s wifey, here’s her preggy, here’s her with the babes.”</i> She goes on and on, gushing about each picture. In many of them you see the woman who must be her wife. She’s tall, probably about six and a half to seven feet, comparing her to Shizuya’s behemoth stature. She has a grizzled, but feminine look about her. She’s muscled, but fairly slender, with wide hips. Her face is covered in nicks and scars, but not enough to heavily mar her smooth, rich, caramel skin. Her hair is long, but well kept, with a flat fringe and a lustrous sheen. That is, except in the picture of her and Shizuya with their newborns, where she’s obviously worn down by labor, but still manages to smile as she cradles three mewling little half-breed pups, Shizuya hugging her close with tears in her eyes.");
	output("\n\nThe rest of them are various pictures of the two and their kids, doing various normal activities. Well, as normal as you can get with someone like Shizuya. You’ve been so busy looking over the photos yourself, that you haven’t noticed that Shizuya’s stopped talking, and in fact seems to be sobbing softly.");
	output("\n\n<i>“I hate long missions, [pc.name]. Ya might not think it, looking at me and how I act, but I’ve started to be more of a homebody these days. Just, ya know, I used to think being out here, doing the adventurer stuff was all there was, this was going to be my new life.”</i>");
	output("\n\n<i>“I used to be kind of a bastard; it’s hard to even think I’m still the same person. Back when I first joined up, I was just so into it; huntin’ people down, bringing them in or just wiping them out, it felt right. But, then when Kenka, when I... when she told me she was pregnant... I don’t know, it’s like everythin’ that was hard and jagged in me just softened up. Might have also had something to do with her mother almost blowing my head off when she figured out.”</i>");
	output("\n\n<i>“What?”</i>");
	output("\n\n<i>“Yeah, Kenka’s family aren’t exactly the kindest people. But Kenka stood up for me, and eventually she came around. When we got to the wedding, I felt... I don’t know.”</i>");
	output("\n\n<i>“Happy?”</i>");
	output("\n\n<i>“Sort of, but, I think it’s better to say I felt like... me. It was like wakin’ up from a long dream; one that had been goin’ on since before I got Treated. It was the first time I felt like I knew myself in so long.”</i> She roots through the pile of pictures and brings up one of her and Kenka. Kenka in a beautiful, white wedding dress, and Shizuya in a tuxedo that looks at least two sizes too small for her, and with tears streaming down her face.");
	output("\n\n<i>“She didn’t know if we should do a kaithrit wedding or an ausar wedding, so we met in the middle with a terran one. I didn’t even know why I was crying, it felt so overwhelming. There I was, standing up there with the love of my life, and kids on the way. When I was just a dumpy little dork getting bullied in school, I thought I’d end up being some loser working a dead-end job, in an unhappy marriage, if anyone even took enough pity to even have me.”</i>");
	output("\n\n<i>“Not a very high opinion of yourself, back then?”</i>");
	output("\n\n<i>“Herms got treated like shit where I lived. The best ya could hope for is getting a big dick so one of the colony rich bitches would take ya as a harem slut. Best I could hope for was being a sideshow, or getting the fuck out. Thankfully I got up enough sense, and got lucky enough to do the latter. Ugh, fuck, sorry I got so into it. I guess I didn’t really give you a good answer there.”</i>");
	output("\n\n<i>“No, I think that was more than enough.”</i>");
	output("\n\n<i>“Thanks. I’ll tell ya more later; talking about this stuff gives me a headache.”</i>");

	processTime(5);
	
	flags["SHIZZY_TALKED_HERSELF"] = 1;
	
	shizzyTalkButtons(0);
}

public function shizzyTalkCrew():void
{
	clearOutput();
	showShizuya();
	
	output("You tell her you’d like to know more about her crew.\n\n<i>“Which one, cap? There’s a lot of them.”</i>");

	shizzyCrewTalkButtons();
}

public function shizzyCrewTalkButtons(slot:int = -1):void
{
	clearMenu();
	
	if (slot != 0) addButton(0, "Mika", shizzyTalkMika, undefined, "Mika", "Ask about the little cowgirl.");
	else addDisabledButton(0, "Mika");
	if (slot != 1) addButton(1, "Adelline", shizzyAdellineIveNeverSeenVanaeYou, undefined, "Adelline", "Ask about the peculiar Vanae.");
	else addDisabledButton(1, "Adelline");
	if (slot != 2) addButton(2, "Aerowyn", shizzyAerosmithIMeanWyn, undefined, "Aerowyn", "Ask about the cocky gryvain.");
	else addDisabledButton(2, "Aerowyn");
	if (slot != 3) addButton(3, "Winston", shizzyWhoWinston, undefined, "Winston", "Ask about the big Huskar.");
	else addDisabledButton(3, "Winston");
	if (flags["SHIZZY_TALKED_WINSTON"] != undefined)
	{
		if (slot != 4) addButton(4, "Thoth", shizzyDoNotBegoneThoth, undefined, "Thoth", "Ask about the mysterious psyker.");
		else addDisabledButton(4, "Thoth");
	}
	
	addButton(14, "Back", shizzyGobWagging);
}

public function shizzyWhyDoesSheWearTheMask():void
{
	clearOutput();
	showShizuya();
	
	output("You ask her to tell you about Kenka, a request which causes her to perk up. <i>“Ooooh she’s the best! She comes off really strict and uptight, but that’s just for the men. When ya get to really know her, she’s just the sweetest. She has this soft, but commanding voice that just melts me whenever she talks. She’s so sweet with the kids too. When she found out she was pregnant, she wasn’t mad, she wasn’t even upset, she was actually happy. Through the whole pregnancy she was just an angel, never got moody, always stayed positive. I was just a damn wreck the whole time. Every time she’d be even slightly uncomfortable, I’d just freak out.”</i>");
	output("\n\nShe starts chuckling to herself. <i>“Oh stars, I remember one time she called me while she was having stomach cramps, and when I heard she was in pain, I almost cancelled the mission to run back to her.”</i>");
	output("\n\nHer chuckles turn to outright laughing. <i>“Oh man, hard to believe I used to be more of a wreck than I am now. Just, all that emotions I was feeling, starting a family with someone I really loved. I just didn’t think I’d ever get there, so I sure as void never really prepared myself for it.”</i>");
	output("\n\n<i>“How’d you meet?”</i>");
	if (flags["SHIZZY_TALKED_TREATMENT"] != undefined) output("\n\n<i>“Remember when I told ya I met her when we got in the middle of that ambush?”</i>");
	else output("\n\n<i>“Well, back before I was with Black Iron, I struck out on my own for a bit. I tried my hand at being a real pirate, with only two guys for a crew, and my first hit turned out to be part of a Black Iron ambush crew.”</i>");
	output(" We tried our best, well, I tried my best. The others gave up pretty quick, but I was going head on, cracking heads. I managed to make my way to the bridge. When I got there, she was waiting, gun in hand, ready to shoot. I was dumb, but even I realized that I was gonna get myself killed if I kept goin’, so I gave up. Instead of blowing my head off, or turning me into the cops, she hired me on.”</i>");
	output("\n\n<i>“Why?”</i>");
	output("\n\n<i>“Mostly ‘cause I managed to take out most of her men by myself, partly because I was givin’ off pheromones like a shower gives off water, and she was kinda into it. I worked under her for a few months, gettin’ up there, eventually earning my own ship. We were gettin’ to know each other, bit by bit that whole time. One day she invited me to her ship, ‘personal visit’. We had lunch, talked a lot... fucked for about five hours straight.”</i>");
	output("\n\nShe takes on a bashful look as she says that. <i>“We sat in bed for a few hours after she recovered. I don’t think it was what either of us intended to happen, and we knew she was knocked-up right away. I mean, how couldn’t she be? She looked like a dog balloon until we drained her.”</i>");
	output("\n\nShe lays back and sighs. <i>“It was fine, we were ready to take it to the end. Of course, her mom wasn’t. When she found out, she kicked my ass, then put a fuckin’ gun to my head. I guess that’s what ya get for fuckin’ the boss’s daughter and knockin’ her up. If Kenka didn’t get in the way and convince her that we really loved each other, well, I wouldn’t be talking right now. Elhora demanded that we get married; no bastards in the Jinn family. That was fine by us, even if she gave me a death stare the whole ceremony. She lightened up on me after that, and I think we’re pretty good now.”</i>");
	output("\n\nShe throws you a thumbs up. <i>“Anyway, our kids were born a bit later, and we’ve been takin’ turns taking care of the little ones. Kenka’s so busy, usually, so it ends up being me most of the time. I don’t mind that. In fact, I love them, and I love takin’ care of them. Honestly, I just wanna take a few years off of this to make sure they grow up right. ‘Course, we have to finish this up before that. I guess we better get back to that; enough gushing about the family. Unless you wanted to talk about something else?”</i>");

	processTime(5);
	
	shizzyTalkButtons(2);
}

public function shizzyLetsDwellOnThePast():void
{
	clearOutput();
	showShizuya();
	
	output("<i>“Can you tell me more about your past?”</i>");
	output("\n\nShe flops back on the bed and sighs heavily. <i>“Yeah, yeah, might as well. I grew up on a colony called Olivier. That place was a fuckin’ shithole; the only way you got anywhere there was if you were one of the rich bitches who ran the place, one of their groupies, or one of their fuckpets, if you weren’t a chick. I was born a herm; not too rare with kaithrit, but that doesn’t stop us from being that one friend that nobody knows how to talk to because they just look funny. Ya either get treated like shit or ya don’t. Best ya could hope for as a herm on Olivier was gettin’ born with a nice, big cock and fucking one of the rich cunts. I didn’t have that. I had four inches to work with; and yes, I burned that fuckin’ number into my brain, because it was something I had to deal with for years.”</i>");
	output("\n\nShe’s visibly angry at this point, gritting her teeth and balling up her sheets in her fists. <i>“Thank FUCK I got out of there! Graduation came around, I didn’t even go, why would I? I went out to eat and was just happy for a second, tryin’ not to think about the fact that the job market was gonna be just as much of a bitch as school. I stayed there all day, to the point where the college recruiters got done at the graduation ceremony, and one of them came over to eat. We actually hit it off, talked about my schooling, grades, what I wanted to do. Apparently I graduated in the top three of my class. Looking back it’s not that surprising since I had no social life, and I’d either binge eat or study all night to try and forget everything. He offered me a scholarship to an off-world college, and I almost hugged him for that. I went home, said goodbye to Dad and...”</i>");
	output("\n\nShe freezes mid sentence, eyes flying open. <i>“Fuck, I forgot Dad! Dad’s cool. Mom left about a year after I was born, don’t know why, Dad never told me. He raised me all by himself, got a ton of shit for it too. Felt like every year there was some chick trying to get in his pants while they treated me like shit. He didn’t take any of that, he told them to respect his family or fuck off!”</i> She has a huge grin on her face as she waxes on about her father.");
	output("\n\n<i>“That man was the only thing that really kept me going. We talked a lot, but I didn’t see him in person for a long time after I went to college. Of course, that was after I got Treated, so there was some... catching up to do.”</i> Whew. <i>“It wasn’t as awkward as you’d think. He always taught me to be happy with my body, so when I explained it to him, he was fine with it.”</i>");
	output("\n\n<i>“Sounds like a great guy.”</i>");
	output("\n\n<i>“He is. Anyway, college. Tel’Adre university; kind of a dump, but still a great place. The place was famous for its theoretical physics courses, mostly because of Professor Cheret, who was a researcher and a member of the board of directors at Akkadi R&D. He had a lab just off campus where he did his own, private experiments. I got the last spot in the class, mostly ‘cause it seemed like the option that would get me the furthest, didn’t actually care what I did, but I ended up really liking it. I don’t know, something about all those big, heady concepts really got me excited, and Cheret was just a nice guy. I even volunteered to help him out in his lab, something that wasn’t too popular after one kid got his leg fused into a table...”</i>");
	output("\n\nOh, wow. <i>“He was fine, mostly. Cheret managed to get them mostly decoupled, though I hear he still needs to watch out for termites. People thought he was some kind of mad scientist after that, so I got some funny looks when I told people I was volunteering. It was pretty cool, actually, he had a bunch of weird tech down there. The thing he was really focusing on, though, was basically a teleporter. See, he’d been pushing for scaling down the warp gate tech for years, but the board never thought they could make it viable." + (flags["SHIZZY_ANNO_MENTIONED_AKKADI"] == undefined ? "”</i>" : " In fact, he was one of the ones who really pushed Anno’s thesis when she submitted it.”</i>"));
	output("\n\n<i>“Interesting, but why wouldn’t he just do that at Akkadi?”</i>");
	output("\n\n<i>“Like I said, they didn’t see it as viable, so they weren’t going to devote resources to it. His lab and all of his experiments were self-funded. He wasn’t even trying to move anything big. It was basically set up to move a very small amount of matter through a solid wall, and that took a </i>massive<i> amount of hardware just to do that. I actually helped out, not much, but I impressed him enough to get a job.”</i>");
	output("\n\n<i>“What did you do?”</i>");
	output("\n\n<i>“Mostly, just help out around the lab, clean up, organize stuff, carry some equipment around. During the last two years, though, I started getting more into reading his research. It was next level shit, way beyond even the stuff he was teaching in class. I figured if I could wrap my head around this stuff, I can make one hell of a final project!’ I was right about that, though not in the way I imagined at the time. I dug up an old formula that he had just thrown out, half done. Spent about eight months or so working through it. When I showed it to him, he was impressed. I didn’t get it all right, but I was close.”</i>");
	output("\n\nShe has a huge smirk as she says that. <i>“More than that, though, that formula was part of a chain that he’d forgotten about months ago that was key in gettin’ the project done, and me reminding him by finishing that part let him finish it before graduation. During finals he got everyone to the lab, turned on the machine, and it worked! Of course, keep in mind that this was inorganic matter, so it was always going to be easier to get through. The college was impressed, but the board wasn’t. Too expensive, not enough results. Bad news. Good news, though, my grades were good enough, and he vouched for me enough that I was able to get a junior position at Akkadi straight out of college!”</i>");
	output("\n\n<i>“You must have been proud.”</i>");
	output("\n\n<i>“Damn right! I minored in chemistry too, so I was able to get into experimental chemical testing in addition to the physics department. It was pretty boring stuff for the most part. Testing fuel mixtures, new stimulants and body enhancers, not on myself, of course. Physics was a lot of dull shit too. Through it all though, Cheret was sorta grooming me and a few of the others, said he was close to gettin’ the warp gate project off the ground, and he wanted a team lined up to go. So, between projects he gave us a bunch of material on it, even got us military clearance. Of course, it still took a few years before that got off the ground. In the meantime, the only really interesting project was this stupid wormhole drive. It was supposed to tunnel through space itself to go faster than the speed of light. All that really happened with that is that we ended up embedding a few of them into a wall. One of them did kinda work, in the sense that it disappeared and we never quite figured out where it went.”</i>");
	output("\n\nShe holds her hands up toward you, and gives you a look like a kid telling a story by the campfire.");
	output("\n\n<i>“Spooky, right? Anyway, that was the project where I met Roy. He was a JAF officer who was supposed to test pilot a craft with the engine in it. Of course, that plan assumed the damn thing worked, so he ended up just hanging around. He was the cutest little ausar you’d ever seen; short and stout, with big ears and a teeny little tail. We hit it off after the third engine decided to explode on us, and the cleaning crew had to come in. After the project went south, we both took a day off and went out on a date.”</i>");
	output("\n\nA big smile goes across her face. <i>“That was an amazing night; the food was great, the places he took me were so beautiful, Roy was such a charmer. I remember sitting on the grass, him holding me in his arms while we looked over the city lights... I miss him.”</i>");
	output("\n\nShe takes a more solemn look as she finishes that thought. <i>“Anyway, a bit after that, " + (flags["SHIZZY_MET_ANNO"] == undefined ? "Ms. Dorna" : "Anno") + " pushed her thesis about the warp gates through, and Cheret jumped on that and used it to get the project going. " + (flags["SHIZZY_MET_ANNO"] == undefined ? "Ms. Dorna" : "Anno") + " was put in charge, and me and the others he was grooming got assigned to her team. And then... I think we covered what happened after that enough, let’s move on.”</i>");

	processTime(15);
	
	shizzyTalkButtons(3);
}

public function shizzyGimmeYerClothes():void
{
	clearOutput();
	showShizuya();
	
	processTime(1);
	
	shizzyTalkButtons(4);
	
	output("You ask her about the weird outfit she wore during your fight.");
	switch(flags["SHIZZY_OUTFIT_STATE"])
	{
		case 0:
			output("\n\n<i>“Oh yeah, those. That was just something I whipped together a while back. I saw it on clearance at a costume shop, so I bought a few, stuck some shield boosters and shock resonators on them. The gauntlets were something I also whipped up myself. Kind of a first attempt, not as good as something Mika would have made, but they also won’t blow you up, probably. I got two of them, too, managed to work that. Why, did you want a pair?”</i>");
			output("\n\n<i>“Maybe.”</i>");
			output("\n\n<i>“Hmmmm, tell ya what, cap, ya beat me, ya get the gear. Deal?”</i> You suppose that’s fair. <i>“You’re on!”</i> You say excitedly. <i>“Allllright! just tell me when you’re ready.”</i>");
			flags["SHIZZY_OUTFIT_STATE"] = 1;
			break;
		case 1: output("\n\n<i>“Like I said, cap, ya gotta beat me to get the goods.”</i>"); break;
		case 2:
			output("\n\n<i>“Oh yeah, those. That was just something I whipped together a while back. I saw it on clearance at a costume shop, so I bought a few, stuck some shield boosters and shock resonators on them. The gauntlets were something I also whipped up myself. Kind of a first attempt, not as good as something Mika would have made, but they also won’t blow you up, probably. I got two of them, too, managed to work that. Why, did you want a pair?”</i>");
			output("\n\n<i>“Maybe.”</i>");
			output("\n\n<i>“Hmmmm, ya know what, ya won fair and square, I’ll give ya the spare pair.”</i> She pulls a second metal box out from under her bed, and hands it to you. <i>“Enjoy!”</i> You open it up and pull out a pair of black gauntlets and greaves, and a bright yellow set of clothes.");
			flags["SHIZZY_OUTFIT_STATE"] = 4;
			shizzyPrizeGet();
			break;
		case 3: 
			output("\n\n<i>“Ya did good, cap.”</i> She pulls a second metal box out from under her bed, and hands it to you. <i>“Enjoy!”</i> You open it up and pull out a pair of black gauntlets and greaves, and a bright yellow set of clothes.");
			flags["SHIZZY_OUTFIT_STATE"] = 4;
			shizzyPrizeGet();
			break;
	}
}

public function shizzyPrizeGet():void
{
	output("\n\n");

	var items:Array = [];
	items.push(new ShockGear());
	items.push(new YellowClothes());
	
	itemScreen = shizzyTalkButtons;
	lootScreen = shizzyTalkButtons;
	useItemFunction = shizzyTalkButtons;
	
	itemCollect(items);
}

public function shizzyTellMeYourSecrets():void
{
	clearOutput();
	showShizuya();
	
	output("<i>“Alright, enough messing around, time to talk about Black Iron.”</i>");
	output("\n\nShe pauses in thought, trying to figure out how to answer you. <i>“Uh, okay, ya remember when Winston said shit was complicated? He really meant that Black Iron is complicated. Ya could say that it’s really two companies; there’s the core world operation, which is your standard PMC, providing military aid, supplies, occasionally gettin’ our hands dirty, but not nearly as much as you’d think. Really wholesome shit, not even Nova Securities level stuff there, since there’s a ton of oversight. Then you’ve got us out here; bounty hunters, assassins, professional hackers, little to no oversight.”</i>");
	output("\n\n<i>“How does that even work?”</i>");
	output("\n\n<i>“The big boss knows how to play the system. She’s old, experienced, and has enough strings to pull, and pockets greased that, as long as we don’t do something toooo stupid out here, we’re golden. ‘Course, personally, we don’t get into the kinds of things that would get ya in real trouble. We’re what they call ‘squeakies’, people who can run the UGC jobs and only get our hands dirty in ways that we can easily wash off, if we even need to.”</i>");
	output("\n\n<i>“Like?”</i>");
	output("\n\n<i>“Bounty hunting, for the most part. We get jobs to take down a lot of different people; smugglers, slavers, terrorists, the usual stuff. Sounds all nice and shit, and you’d think we’d get on some bad sides. But something you figure out pretty quick is that a lot of the ‘concerned citizens’ that put these jobs out are Black Void proxies.”</i>");
	output("\n\n<i>“What?”</i>");
	output("\n\n<i>“Yeah, most of the people we take out or take in are people who just so happen to be on the Void’s bad side. Either they didn’t pay their dues, or they just pissed someone high up off. Not as bad as it sounds, not like we’re handing them right to the Void; in fact, most jobs have us turning them into the UGC. Gets them out of the Void’s hair, either way, and keeps us in the green. Not all of them are about that, but we generally seem to wind up taking out their trash. Most of the time that’s not really a bad thing, still gets those people put away.”</i>");
	output("\n\n<i>“Still seems shady.”</i>");
	output("\n\n<i>“Welcome to life on the frontier, cap; ya make compromises to make it, and as far as compromises go, I’d rather be shady and live a good life, than be a good guy and wind up in a shallow grave. Besides, ya wanna hear about real shady shit? Ask Winston what it’s like on the really bad side of Black Iron. Let me tell ya, a lot of people here are ex- or just inactive members of the Black Void or some of the other big groups, and I’m not talking about randos who got kicked out for fucking up too much. Dio Braik, the captain of Leda squad, was on his way to being a fuckin’ Dread Lord before he quit. Those are the guys who do the real bad shit. Even then, Dio never struck me as a monster. Hell, him and Winston used to do a lot together, and he’s got nothin’ but good things to say about him.”</i>");
	output("\n\n<i>“So what’s the difference between you and the Void?”</i>");
	output("\n\n<i>“Values and principles. The big boss values tradition, camaraderie, and a certain sense of right and wrong. Even at the worst; we don’t kill or enslave people who didn’t do anything to us, we don’t backstab each other, we’re not out to fuck things up without any reason. The big boss, Elhora, she’s part of a dying breed, the old crime boss who values family and tradition over constantly pushing the bottom line beyond reason. I imagine a lot of people disconnected themselves from the Void to join Black Iron for the same reason she created it in the first place. The Void is almost corporate in its function; individual Dread Lords can have their own ideals, but the main incentive is always the same; move slaves, make money, support the bottom line, expand influence. They’re all drones, mindlessly feeding into a massive, uncaring maw that’s just waiting for them to be used up so it can swallow them too!”</i>");
	output("\n\nShe seems very... passionate about this, holding a much sterner face than you’ve seen on her before. <i>“Sorry if I get really into this, that’s just what happens when you get thrown in with someone like Elhora who takes the time out of her day to give you lectures about this stuff. Did I tell ya Kenka is Elhora’s daughter? I think I did. Whatever. People join Black Iron looking for more structure and concrete ideology. Believe it or not, even bad people can want standards. And that lure spreads to more than just Black Void people or pirates in general. I’ve seen former military, private security, mercs, and even just random people who heard about it somehow. They all come in because they want somewhere that values them, even if it sometimes requires some more scummy actions. And of course, ya don’t have to do that stuff; I </i>choose<i> not to get involved in that side of things, and I don’t get treated any less for it.”</i>");
	output("\n\nHer stern face melts away a bit as she finishes up. <i>“I guess, to answer the question, Black Iron is a family, a </i>very<i> complicated, messy family, but it’s one I’m happy I’m a part of. And that’s that.”</i>");
	
	processTime(5);
	
	shizzyTalkButtons(5);
}

public function shizzyHowDidTheyTreatYou():void
{
	clearOutput();
	showShizuya();
	
	output("<i>“How exactly did you get Treated?”</i> It’s strange, nothing about what she’s told you would lead you to believe that she’d be wealthy or important enough to go to New Texas. She’s taken aback a bit by your question, seeming to fumble over what she should say.");
	output("\n\n<i>“Uh, I really hoped ya wouldn’t ask about that; it’s not my best story. Oh well, just to warn ya, it gets kinda weird.”</i>");
	if (pc.isMisc()) output("\n\n<i>“Oh, I love weird!”</i>");
	else output("\n\n<i>“Fine by me.”</i>");
	output("\n\n<i>“Alright, here it goes. You remember when I said I left Akkadi after the incident? Well, I never told you where I went, because I didn’t really go anywhere. I bounced around bars, getting drunk off my ass, feeling like I was at the end.”</i>");
	output("\n\n<i>“It hit you that bad?”</i>");
	output("\n\n<i>“I-It wasn’t just that, it was everythin’ before that. My whole life, all I ever got told is that I was just this little useless thing that would never get anything right. I tried to prove them wrong, I tried to be useful and successful, but it just never worked out quite right. I wasn’t a complete failure or anything like that, but all I could think, back then, when I looked back over what I’d done, I couldn’t help but just feel... mediocre. And when... when that happened, it was like, what else could I do? My career was ruined, my boyfriend was dead, and it was my fault.”</i>");
	output("\n\n<i>“What did you do?”</i>");
	output("\n\n<i>“I left, I took my ship and I flew off, just anywhere; I could have wound up on some ass-nowhere colony, cleaning up old ship parts to sell for scrap, hell, I could have wound up back home, begged to be the pet of some rich cunt. Anything was better than stickin’ to my old life. ‘Course it didn’t work out like that: I ran out of fuel mid-trip and was so drunk I could barely see straight. I passed out, figured the auto-distress would get me picked up by </i>somebody<i>. Hell, I probably would have been fine if it was a slaver, nothing says new life like being pimped out and sold to the highest bidder.”</i>");
	output("\n\nShe’s shaking and gnashing her teeth as she recounts that last part. <i>“I was so fucking pathetic... just giving up like that. Fuck... Anyway, I didn’t get picked up by slavers, I got picked up these two Treated dorks, dad was some rich fuck on an offworld colony, wasn’t allowed on New Texas.”</i>");
	output("\n\n<i>“Why?”</i>");
	output("\n\n<i>“There’s an unwritten rule on New Texas; ya can have whatever weird, crazy opinions you want about the Treatment, but don’t go blabbing to people about them. Don’t want some dumbass tourist going off and telling people they’re going to put the Treatment in the water supply or something. Usually doesn’t get that crazy, except with this guy.”</i>");
	output("\n\n<i>“Bad?”</i>");
	output("\n\n<i>“Bad. Ya know, most of the time you’ll get people who think that the Treatment should be mandatory for tourists, or, hell, people who don’t want tourists at all. Loonies who don’t really know what they’re talking about. This guy wasn’t like that, this guy is the guy who the loonies stay away from because he’s too far out there. Get this; this guy thought that the Treatment was a literal gift from some god, and that it was the next step in evolution for sentient life.”</i>");
	output("\n\n<i>“... What?”</i>");
	output("\n\nShe’s smiling and laughing at this point, so at least the conversation is at a happier place. <i>“I know! That’s the kind of shit that gets you banned from the big parties, imagine what people were thinking when he got up on a literal soapbox and started preaching about it.”</i>");
	output("\n\n<i>“Really?”</i>");
	output("\n\n<i>“Really! Apparently a pair of rangers had to tranq him after he got in a fight with some old chick. ‘Course, she actually started it, so they couldn’t pin it on him, and throwing him in the slammer for having a stupid, insane opinion wasn’t gonna be the best PR move either, especially since he was part of a big, rich family. So they chose to exile him, strip him of his titles, family name, everything but the shirt on his back and an old family house on a distant colony.”</i>");
	output("\n\n<i>“Wow.”</i>");
	output("\n\n<i>“Yeah, of course his stupid kids went with him, and they ended up finding me drifting out in space. Apparently their old man had still been making money on the side, enough to get them a nice ship, and some... other things. They took me in, fed me, heard me whine about my shitty life. I guess they felt bad for me, cause they offered me what we thought was a Treatment needle.”</i>");
	if (CodexManager.entryViewed("The Treatment")) output("\n\n<i>“Outside New Texas? That’s illegal.”</i>\n\n<i>“Sure is.");
	else output("\n\n<i>“Outside New Texas? That’s unusual.”</i>\n\n<i>“And illegal.");
	output(" Of course, it wasn’t the normal Treatment. Apparently ol’ daddy made some... less than upstanding friends during his exile, ‘cause he got his hands on a few needles of Overdose.”</i>");
	output("\n\n<i>“Overdose?”</i>");
	output("\n\n<i>“I can’t actually remember if I’m supposed to tell you about this, but oh well. Overdose is basically the Treatment on steroids, with all the lumps and instability that come with that. It’s been around for a couple of years, but it flew under the radar until recently.”</i>");
	output("\n\n<i>“Wait, is that the drug Winston was talking about?”</i>");
	output("\n\n<i>“Yeah. That’s its own thing, though. Back on topic, they offered me the needle, said it would fix everything. I’d heard of the Treatment before, but I didn’t think I’d ever actually get my hands on it. Plus, I was scared shitless that I’d be some brain dead cow, but at that point, I wasn’t particularly picky. I was sick of being little, sick of feeling like shit. This was my chance to start over, so I did it.”</i>");
	output("\n\nShe pauses for a second. <i>“Yeah, time for the weird part. I stuck myself and it felt like fucking fire. Everything hurt, I could barely breathe. They were freaking the fuck out, but I didn’t know what the Treatment was supposed to do, so I was just powering through it. Lucky me I was in the experimental chemicals division at Akkadi, for a bit, and they mandate hazmat certified neurosurgeons. Normally Overdose hits you with so many chemicals and hormones that most people just fuckin’ lose it, but I got out... mooostly fine.”</i> She shifts her massive legs to give her already half-hard cocks some breathing room.");
	output("\n\n<i>“I swear these guys have a mind of their own sometimes. ‘Course, I don’t mind, they’ve got some good ideas. I like the eye thing too, they sort of shift between red and green when I get really horny. I think it’s a reaction with this weird mood coloring thing I got in college. Was supposed to be subtle, but now it ain’t. Well, after the chemicals and shit started working, the fun part started. I mean that, too, that shit was... addictive. It was like the fire was out, but there was still this simmering heat that kept flaring up in my bits. It was like I was made of clay, just melting down and molding into something better. I felt my weak little body bulk up, like I was a balloon getting filled up, and everything going in was twisting and morphing into pure fuckin’ muscle and bulk. It’s hard to really describe what it’s like, growing that much so quick, and that was before everything else came in.”</i>");
	output("\n\nShe moans loudly as her beast cocks rip through her thong, displaying them flagrantly as she immerses herself in her past. Her eyes are shifting red as a crazed look overtakes her. <i>“Oooh, stars, I remember when you boys showed up. Four inches, four fuckin’ inches! That’s all I had to fuckin’ work with, and those stupid little peanut balls. Then you came along. Can you imagine what it’s like watching your dick grow twenty inches in seconds? To feel your teeny tiny little balls that couldn’t knock up a fuckin’ rat grow into these breeding machines?”</i> She starts manhandling her own balls, causing her cocks to spray a huge gout of off-white pre into her own face.");
	output("\n\n<i>“Mmhmm, fuck, I could probably knock up someone with just my pre, couldn’t I? Thaaaaank you Sterilex, thank you thank you. Oh Void, and when the twins came iiiiiiiiiiin.”</i> She shifts her grip to hold both of her shafts, jerking them off slowly, and basting herself in her own oversaturated virility.");
	if (pc.isBimbo()) output(" Poor dicks, they look so pent up! You should help those poor boys out.");
	else output(" The sheer amount of pheromones is starting to get to you, and you’re afraid that you’re about to do something that you’d regret. Would you, though?");
	output(" Before you can do anything, Shizuya’s eyes shoot open, and she jumps up out of bed and runs into the bathroom.");
	output("\n\nYou hear her moan out loud for a second before she’s drown out by the wet sound of what must be gallons hitting the shower wall. ");
	if (pc.isBimbo()) output(" You sigh as you realize how much yummy cum is being wasted. You could have eaten that, damn it!");
	output(" After a minute, you hear the shower flip on for a second, and right after, Shizuya walks out, horsecocks still flopping around, half-hard.");
	output("\n\n<i>“Sorry, gettin’ carried awwwwwwway. Um, back to more nitty-gritty stuff. Yeah, not normal stuff. I got fuckin’ hooves out of it, too, got rid of that shit as soon as possible, let me tell ya. Kept the fur, though. Anyway, after, uh, letting off some steam with the guys, I kinda realized how fucked we were. They didn’t even realize you weren’t supposed to bring the Treatment outside New Texas, so they were freaking out. I was... well, I was kinda crazy off the stuff, so I just said fuck it, let’s be pirates. That lasted for a whole... two days. First job was a pretty beat down looking frigate that turned out to be part of a Black Iron ambush. And that’s how I met my wife; any other questions?”</i>");
	
	flags["SHIZZY_TALKED_TREATMENT"] = 1;
	processTime(10);
	
	shizzyTalkButtons(6);
}

public function shizzyODdOnLifeItself():void
{
	clearOutput();
	showShizuya();

	output("<i>“So what’s the deal with this Overdose stuff?”</i>");
	output("\n\n<i>“Okay, so ya know the Treatment, it’s basically all-in-one sexual supercharging. It gives you everything you want, and only some stuff ya don’t like, like fuckin’ hooves. People want that shit, but the problem is, it isn’t legal outside New Texas; and unlike stuff like Throbb where the recipe is just out there and there are guys who make it in their bathtubs, you can’t get it outside of there. The best you usually hope for is that someone has a few that they got off-world, but that’s still really expensive. So, naturally, people look for alternatives. Most of them are cocktails of garbage that are more likely to turn you into an actual dick than give you anything you actually wanted.”</i>");
	output("\n\nVery... interesting imagery. <i>“Of course I haven’t heard about anything </i>that<i> weird happen, but the horror stories you hear aren’t much better. Can’t tell ya if the stuff about Overdose is better or worse, but I’ll get to that. What makes Overdose special is that it’s modified from the actual Treatment. Now, this isn’t the first time, but the other times that got big were either just people wiping the nano surgeons and trying to reprogram them, or just people guessing at what’s in it and fucking around with the formula based on that. Usually ends up with people gettin’ really weird stuff, like turning into actual cows.”</i>");
	output("\n\n<i>“Actual cows?”</i>");
	if (silly) output("\n\n<i>“Nanomachines, son!");
	else output("\n\n<i>“Shit gets weird.");
	output(" What’s special about Overdose isn’t </i>just<i> that it’s an effective reverse-engineering of the Treatment, it’s that it’s a reverse-engineering of a UGC version, an old one, but that’s still a problem.”</i>");
	output("\n\n<i>“UGC version?”</i>");
	output("\n\n<i>“Surprised, cap? You really think they’d pass up on a wonder drug like that, especially with how involved in it they are?”</i> She does have a point. <i>“Anyway, yeah, old military variant, I’m talkin’ like two, three hundred years old. Lucky that it’s so old, so that means that anything you could get off of them, encryption keys and stuff like that, is too out of date to make much issue. And they’re pretty sure that stuff’s been cracked, since they’re convinced that this stuff is gettin’ made almost from scratch. Not mass-production or anything, but most of the samples found were made in the past fifteen years or so.”</i>");
	output("\n\n<i>“Damn.”</i>");
	output("\n\n<i>“Yeah, the UGC wasn’t too happy when they found out, but that’s enough of the politics of it, you wanted to know about the stuff itself. In terms of effects, it’s pretty hit or miss. I got the good end of the stick, though, I’m only as good off as I am because of the nano surgeons. Even then, I’ve got some, uh, balance issues.");
	if (flags["SHIZZY_BEEN_ROUGH"] != undefined) output(" I’m sure you noticed.");
	else output(" I really hope you don’t have to see it, though, maybe you’ll like it. I don’t know.");
	output(" I also got this fur on my arms, and these honkers out of it.”</i>");
	output("\n\nShe flashes her claws at you. <i>“The normal Treatment mostly only does racial shit with ausar, but Overdose seems to draw out weird traits like that with most races. Like I said, I got the good end of the stick here. The unlucky guys get it bad. I’ve seen a few of them, and it’s fuckin’ scary to think I could have been like that!”</i>");
	output("\n\n<i>“What were they like?”</i>");
	output("\n\n<i>“Fuckin’. Monsters. You think I’m bad, some of those guys looked like two of me mashed together! Ugh, and don’t even get me started on the people who did it more than once.”</i> She visibly shudders as she mentions that. <i>“Y-ya know, there’s safeguards against doing that kind of thing with the normal Treatment, you DO NOT get that with Overdose. You can use that shit as many times as you want; or, more accurately, however many times someone can stick you before you go so crazy you rip them apart, which is usually not too many, from what I hear. Never seen anyone who did, not like they keep them around. From what I hear, the second dose just fucks you up. The effects become completely unpredictable, and just... extreme.”</i>");
	output("\n\nShe looks very uncomfortable now, but also weirdly aroused. <i>“Fuck, I hate that part of me that thinks this is hot. Stars, jus-just thinking about turning into a giant fuck beast gets that part riled up. I got a family and friends now, damn it! I can’t be thinking like that! L-Let’s just move on, I ain’t gettin’ into this again.”</i>");
		
	processTime(10);
	
	flags["SHIZZY_TALKED_OVERDOSE"] = 1;
		
	shizzyTalkButtons(7);
}

public function shizzyTellMeAboutTheBooty():void
{
	clearOutput();
	showShizuya();
	
	output("<i>“So, what’s this bounty you guys are after?”</i>");
	output("\n\n<i>“I can’t tell ya everything, but I can at least give you the gist. You know we’re after whoever is actually making Overdose, and Winston was talkin’ about some guy who may or may not be involved. There’s kind of a story to that. Basically, a long ass time ago, there was this team of scientists who worked on some big, top secret projects in the UGC. Apparently, one of them messed them up in the head, or something, and they took all of their research and booked it. One of the things they took was a version of the Treatment that was being developed at the time. And Overdose is very heavily based on that version.”</i>");
	output("\n\n<i>“So, what’s the confusion here?”</i>");
	output("\n\n<i>“The confusion is that this was, like I said, two to three hundred years ago. Adding to that, most of the scientist came up dead after the manhunt started. Killed by pirates, poisoned themselves, blew up. Bad time for most of ‘em. Only one never turned up, but considering the state of some of the others, after there was no sign of him for about a decade, they just assumed he died in a way where they couldn’t find his body. That was before they found Overdose, so now most people are thinking that somebody stumbled on his research, or maybe a secret lab that they never found. But some people think the guy himself is still alive and out there.”</i>");
	output("\n\n<i>“Why?”</i>");
	output("\n\n<i>“The guy was kinda a geneticist savant I guess, bit of a psycho too. Someone on the admiralty board was really freaking out about it, and I guess he got enough of a thing going to get the rest of them to at least consider it. And that’s where we come in. Basically, Black Iron is in this to actually do the dirty work tracking the guy down, then we bring them in and get paid.”</i>");
	output("\n\n<i>“It still seems like something the UGC could handle by themselves, though.”</i>");
	output("\n\n<i>“They probably could, but the bigger thing here is shutting down distribution before they can make much headway. Far as anyone can tell, these guys are running a pretty small operation, but they’re keeping really quiet, and obviously know their way around the underworld. Black Iron... let’s just say we’re in a better position to be nosing around there.”</i>");
	output("\n\n<i>“I thought you were a PMC?”</i>");
	output("\n\n<i>“Weeeeeeeee are! But we also aren’t. It’s weird. We’ve got connections, that’s all I’ll say for now. I feel like we’re pretty close to wrapping this one up, honestly, just gotta get the info out of Judau. Probably gonna hold off on big jobs for a whiiiiiiiile after this. Maybe you could tag along, if you’re not too busy.”</i>");
	output("\n\nYou’ll see.");
	
	processTime(5);
	
	shizzyTalkButtons(8);
}

public function shizzyTalkMika():void
{
	clearOutput();
	showShizuya();
	
	output("<i>“What about Mika?”</i>");
	output("\n\n<i>“Mika’s our little workhorse. If there’s one thing that girl loves more than fuckin’, it’s tech. Ya need something fixed, or need to know what guns blow stuff up the best, ya go to Mika. She knows every system, bit of electronics, panel, vent, and rivet on this ship. And ho boy, that girl loves her guns. She used to keep a bunch of them in her room. That was before she nearly blew a hole in the hull, and Addy made her tone it down to just a pistol. Now she’s got that workshop down in the hangar, with nice, reinforced walls.”</i>");
	output("\n\n<i>“How’d you meet?”</i>");
	output("\n\n<i>“New Texas. She was just wandering around, lookin’ pretty sad. Apparently she’d just gotten fired for gettin’ into a fight at work and was pretty close to givin’ up. When I told her that I was a ship captain, she begged me to come on board. I was like, I ain’t gonna’ take this random kid on missions, she’s just gonna get hurt. Then she told me about how she’d been studying UGC technical manuals that her uncle got her her whole life, and that she could fix a ship better than any stuffed shirt college shit; her words, not mine. She proved that by fixin’ that shitty old aft machine gun. She could shoot too, way better than me, at least, which is good enough. So we took her on.”</i>");
	output("\n\n<i>“She’s an amazon, right?”</i>");
	output("\n\n<i>“Yeah.”</i>");
	if (pc.isNice()) output("\n\n<i>“She’s a little... small”</i>");
	else if (pc.isMisch()) output("\n\n<i>“Is she a member of the lollipop guild?”</i>");
	else output("\n\n<i>“She’s fucking tiny.”</i>");
	output("\n\n<i>“Yep. Normally they get taller, but apparently there’s a rare effect where they get really short, and really dense. They call them ‘minizons’ and Mika says it’s kinda like being a faux-cow, ‘cept instead of getting subby, ya just get really irritable. Don’t know if they get more angry than normal, or if it’s just gettin’ teased that makes them more mad, but Mika’s got a mean streak. Strong as shit, too. Even before she got those implants she was a tough little thing.”</i>");
	output("\n\n<i>“Why get the implants then?”</i>");
	output("\n\n<i>“Power armor, obviously. She said she wasn’t gonna be too much use if she couldn’t even get up to most people’s crotches to punch them. So she took it to the boss, and got approved for the implants. The suit they gave her was garbage, at least that’s what she says. So, she saved up for a while to get that frame and the attachments. I chipped in too, cause all I ever buy is food and cheap thongs.”</i> She takes out a wastebasket near her bed, revealing a small mountain of torn cloth. And then she opens up a drawer on her dresser, revealing a pile of multi-colored thongs, each with a large front sheet for carrying her massive package.");
	output("\n\n<i>“Ya know, the essentials. Me and her really hit it off after that. She’s a horny one, and she loves being on top. It was kinda weird having a dom at first, but I love it now. She even lets me have at it, when I’ve been a good girl.”</i>");
	output("\n\nSpeaking of torn thongs, from earlier, you hear a familiar ripping noise, and see the familiar sight of her horsecocks flipping up her skirt to say hello. <i>“There goes another one. Anyway, you’d be surprised how much that little girl can take. First time I stuck it in, she was just yelling at me to go faster. I swear I must have been hitting her stomach but she never made a peep about it. S’cuse me.”</i> She gets up off the bed, cocks drooling, and makes her way to the bathroom.");
	output("\n\nYou don’t need much thought to figure out what she’s doing, especially when the sound of gallons of liquid hitting the shower wall echos out. She comes back, cocks mostly limp, with a satisfied look on her face.");
	output("\n\n<i>“Anything else?”</i>");

	shizzyCrewTalkButtons(0);
}

public function shizzyAdellineIveNeverSeenVanaeYou():void
{
	clearOutput();
	showShizuya();
	
	output("<i>“What about Adelline?”</i>");
	output("\n\n<i>“Hmm, can’t tell ya too much there; she doesn’t like to talk about herself much. Found her on a job. Her and her tribe got captured and were gonna be sold off. Thankfully, those guys made someone’s shitlist, so we were on them. UGC turn-in stuff too, so they all got taken care of. Addy stayed though. She said she failed them and couldn’t go home until she proved herself. All I know is, she was their leader, and I guess she fucked up and got them caught. I don’t pry much into that.”</i>");
	output("\n\nShe shuffles around awkwardly, giving you the feeling that she knows more than she’s letting on. <i>“Anyway, she does great work around here. She came in and was just workin’ it from day one. The boys weren’t too happy when she started bossing everyone around, but she was damn persistent, and I wasn’t stoppin’ her, so they got used to it. She just made things so much smoother around here; gettin’ people organized and in gear, training up the crew, hell I wouldn’t be half as good as I am now without her, and even these days she’s the one who keeps everything working smooth around here. I can’t imagine this place without her.”</i>");
	output("\n\n<i>“Anything else?”</i>");

	shizzyCrewTalkButtons(1);
}

public function shizzyAerosmithIMeanWyn():void
{
	clearOutput();
	showShizuya();

	output("<i>“What about Aerowyn?”</i>");
	output("\n\n<i>“Aerowyn is our liaison with the UGC, she makes sure we’re following protocols, not eating babies, the usual stuff. I’m not gonna be able to tell ya much, since we don’t get to see her all that much. She only comes around when we get UGC jobs, and the last time that happened was like four months ago. It’s too bad, I like havin’ her around. She’s real friendly, even if she gets super cocky sometimes. Crew loves her too. Ya wouldn’t think they’d get on well with a military type, but Aerowyn is super laid back.”</i>");
	output("\n\n<i>“Laid back seems like a bad trait for a military officer.”</i>");
	output("\n\n<i>“It’s not like she’s a slacker or anything. I’ve seen her fight. Hell, she has her own little strike team. Let me tell ya, she kicks ass! Four guys tried to jump her and she just kicked their asses like they were nothin’! So she’s cool to hang with, great lay too. I have </i>never<i> met someone who could lock thighs with me and win, before her. She’s not dommy like Mika where she’s calm and commanding, nah, she fights ya, if you’re cool with it, of course.”</i>");
	output("\n\n<i>“Fuck, if we keep going I’m just gonna start talkin’ about hard sex, and why talk about it when we could have it?”</i> She raises her eyebrows for emphasis.");
	output("\n\n<i>“Anything else?”</i> She says with a sultry tone");
	
	shizzyCrewTalkButtons(2);
}

public function shizzyWhoWinston():void
{
	clearOutput();
	showShizuya();

	output("<i>“What about Winston?”</i>");
	output("\n\n<i>“He’s a fun guy, isn’t he? Don’t let that fool ya, though, he’s not here for his sense of humor.");
	if (pc.characterClass == GLOBAL.CLASS_MERCENARY) output(" I guess you already knew that, but you probably don’t know the specifics.");
	else output(" You could probably tell by his aim, but he’s damn well trained.");
	output(" Winston’s been working the mercenary scene for over forty years now, got real big too. Started off in some no-name band that turned into one of the biggest merc companies around. Then he blew the place up, the end.”</i>");
	output("\n\n<i>“Why?”</i>");
	output("\n\n<i>“He just told me they fucked with him, so he fucked back. He ended up in jail, but I guess the big boss thought he was good enough to bail out and hire on. Out of all the crews in Black Iron, I have no idea why he choose us. He was actually one of the first guys to sign on. Guess I made a good impression when I talked to him.”</i>");
	output("\n\n<i>“He’s saved our asses a few times now; guy hasn’t lost a step. Gave us a big boost in rep too. Apparently he did a lot of jobs with Black Iron back in the day, and a lot of people remember him. I remember like a week after he joined up, we had another crew giving us shit, trying to pick a fight. The second Winston showed up, the fuckers scattered.”</i>");
	output("\n\n<i>“Do you believe his");
	if (pc.isNice()) output(" stories?”</i>");
	else if (pc.isMisch()) output(" crazy talk?”</i>");
	else output(" crap?”</i>");
	output("\n\n<i>“I feel like I’ve gotten to the point where I can tell if he’s joking or not. He has more heart-to-hearts with me than the rest of the crew, except Thoth.”</i>");
	output("\n\n<i>“Thoth?”</i>");
	output("\n\n<i>“Oh, right, he’s Winston’s boyfriend, the human guy with the dark skin and the white hair, and the ass for daaaaays! He’s the ship’s psionics user, one of the only ones in the organization, actually. I’ll tell ya more, if ya want, but back to Winston. He mostly fucks around with Addy, which is why they don’t get along. He fucks with Mika too, but she plays ball most of the time. He really gets along with most of the crew, honestly. Really lightens up the mood, makes it easier to get through the bad times.”</i>");
	output("\n\n<i>“Anything else?”</i>");
	
	flags["SHIZZY_TALKED_WINSTON"] = 1;
		
	shizzyCrewTalkButtons(3);
}

public function shizzyDoNotBegoneThoth():void
{
	clearOutput();
	showShizuya();
		
	output("<i>“What about Thoth?”</i>");
	output("\n\n<i>“Thoth is a weird little guy. He’s one of the only psykers I’ve ever met. Apparently he was some kind of lab baby or something that the boss’s family adopted, so he’s my nephew in-law, cause he’s Kenka’s sister’s adopted kid. I think that’s how it works. I actually don’t remember when he got assigned to the ship, he was just here one day and we were off. I think Anoma just wanted him to have something to do, so why not just stick him with the new in-law.”</i>");
	output("\n\nMhmm, family stuff. <i>“Yeah, anyway he’s a fun kid. Well, actually I think he’s older than me, so not really a kid, but whatever. He’s upbeat, usually smiling, makes some good jokes with Winston, doesn’t mind if you look at his ass, since he never wears pants, but stars help you if you smack it cause he’s gonna toss you against a wall for that shit. Don’t let that hot boy body fool ya, I’ve seen that guy mess people up like nobody’s business.”</i>");
	output("\n\n<i>“Honestly, I don’t talk to Thoth much, so I can’t tell ya much more. Anything else?”</i>");

	shizzyCrewTalkButtons(4);
}

public function shizzyStareAt():void
{
	clearOutput();
	showShizuya();
	
	output("Shizuya is a towering eleven feet tall. She’s wearing a white T-shirt that, which manages to cover down to just below her navel. The shirt depicts large, faded Japanese text ending in a large Z. She normally wears a black denim jacket over it, but she has it off right now. She has a knee-length, mauve skirt that manages to obfuscate her massive members while they’re soft and contained.");
	output("\n\nIf the titanic physique weren’t enough to tip you off to her being Treated, the huge ram horns that curl above her head are. The horns twist backward from her forehead, wrapping around her large, feline ears. Her face is covered in small nicks and some large scars, and it’s obvious she doesn’t wear any makeup, but she still manages to be quite cute. Her features are surprisingly soft, with a button nose, supple lips, and long eyelashes. Her feline eyes are odd, shifting more toward red as her lusts inflame, and seem to convey a level of focus beyond what her usually foggy expression would imply. Her straight hair is short and messy, not even reaching halfway down her neck at its longest point. It’s dark red in color.");
	output("\n\nHer top half is quite built. Her arms are large, but not massive, and coated in strong muscle. You can see her forearms and hands are covered in dark red fur and tipped with abnormally large claws. Her waist is slim, with pronounced abs and back muscle. Her massive K-Cup tits complement the largeness of the rest of her torso, keeping a strong air of femininity despite her muscle. Her intentional jostling of her massive melons makes it very clear that she’s not wearing a bra. Her colossal nipples make obvious swells in her shirt, and you can make out small wet patches at the peaks. Large gashes mar her torso; three large ones across her right shoulder, with more down her back, and one cutting from her other shoulder down. Her bottom half is an almost striking contrast to her top. Her thighs are almost as wide as her torso, and covered in thick muscle. Heavy fur covers her legs from her thigh down, ending in human feet that look somewhat out of place. Her ass borders on ridiculous. Massive, supple globes that make big, noticeable bulges in the back of her skirt. Two feline tails swing happily above her southern peaks, often attempting to frame her rump when she spies someone looking.");
	output("\n\nThe busy looking bulge, visible even through her loose skirt, gives way to a very crowded looking crotch as Shizuya follows your gaze and lets her monsters spring out. Massive, twined cocks grow out from her crotch, leaking eager streams of pre from the attention you’re giving them. Each shaft is two feet long and about four inches thick. Her shafts are dark red. Each bears the distinct flare of a horse cock, and also the wicked looking but soft spines of a feline phallus. Below her dicks lies a packed scrotum with four soccer-ball-sized balls. Behind her testes is a pink pussy with heavily puffed out lips that constantly drool off-white, frosting flavored girlcum.");
	output("\n\n<i>“So, " + (silly ? "nya" : "ya") + " gonna sit there and look at my crotch or... what? Unless you just wanna watch me jerk off. I’m game, as long I can finish on your face”</i> She licks her lips and shifts to accentuate her crotch.");

	addDisabledButton(3, "Appearance");
}

public function shizzyFunTimes():void
{
	clearOutput();
	showShizuya();
	
	output("You tell her that you" + (silly ? " wan sum fuk." : " want to fuck.") + " She springs up at that, in more ways than one. She hops off the bed, and her horsecocks fly up, ripping her thong to ribbons that fall uselessly onto the floor. Her shirt and skirt come off in seconds, revealing her nude form, which she is quick to take advantage of. She hefts her heavy breasts in your direction, giving you a sultry look as she kneads the massive mammaries until they start drooling their lactic cargo all over the floor. Her lower half joins in, splattering the floor with liberal amounts of off-white girl and pre cum. She sits back on the bed, legs splayed as she gives her cocks a hard jerk, sending a splatter of pre directly into her face. She licks off the opaque fluid, breathing raggedly, beckoning you over as her pheromones waft off of her in rivers.");
	output("\n\nHow do you take her?");

	shizzySexyButtons();
}

public function shizzySexyButtons(canleave:Boolean = true):void
{
	clearMenu();
	
	var firstcawk:int = pc.cockThatFits(1500);
	var secondcawk:int = pc.cockThatFits(1500, "volume", [firstcawk]);
	var sixtycawk:int = pc.cockThatFits(500);
	
	if (firstcawk != -1) addButton(0, "Use Dick", shizzyOneStickDoesTheTrick, firstcawk);
	else addDisabledButton(0, "Use Dick", "Use Dick", (pc.hasCock() ? "Your dick is too big." : "You need a dick for this."));
	if (secondcawk != -1) addButton(1, "Use Dicks", shizzyTwoDicksForThoseThatFit, [firstcawk, secondcawk]);
	else addDisabledButton(1, "Use Dicks", "Use Dicks", (pc.hasCocks() ? "Your dick is too big." : "You need two dicks for this."));
	if (pc.isTaur()) addDisabledButton(2, "Sixty-Nine", "Sixty-Nine", "You’ve a few too many legs.");
	else if (pc.hasGenitals()) addButton(2, "Sixty-Nine", shizzyNomNomNom, canleave);
	else addDisabledButton(2, "Sixty-Nine", "Sixty-Nine", "With what?");
	addButton(3, "Get Fucked", shizzyDriverNephisLegacy, canleave);
	if (canleave) addButton(14, "Back", shizzyMajinMainButtons);
	else addDisabledButton(14, "Leave");
}

public function shizzyOneStickDoesTheTrick(dick:int):void
{
	clearMenu();
	clearOutput();
	showShizuya(true);
	
	output("You tell her that you’re going to fuck her brains out, and that she’s going to lay down and take it! She complies eagerly, turning around and laying on all fours. She looks over her shoulder at you as you" + (pc.isNude() ? "" : " strip your [pc.gear] and") + " brandish your [pc.oneCock] at her.");
	if (pc.cocks[dick].volume() > 800) output(" Her eyes go wide looking your ogre cock. Most people stare at your mass with worry or hesitation, but Shizuya looks like she’s almost begging for it.\n\n<i>“F-fuck, cap, that’s a reeeeeeeeal nice piece there. Oh, stars, just fuck me, I wanna feel it inside me, you stud!”</i> ");
	else if (pc.cocks[dick].volume() > 200) output(" She gives your cock a look of excitement.\n\n<i>“Damn that’s a nice piece right there! Don’t worry bout it fitting, I can take a lot.”</i> ");
	else output(" She looks at your cock with an uncontrollable lust, her eyes begging you to stick it in.\n\n");
	output("You plant your [pc.cockNounSimple " + dick + "] between her luscious ass cheeks, sawing it through her backside to get yourself nice and ready. You push your whole [pc.cock " + dick + "] into her cheeks and gasp in shock as her ass suddenly clamps down on you! You try to move your cock, but her grip is too strong!");
	if (pc.cocks[dick].cLength() > 20) output(" Her trap gets worse as her cat tails start to massage the exposed parts of your shaft, teasing your [pc.cockHead " + dick + "] until you start gushing pre.");
	output(" Shizuya looks at you, her pupils wide and her tongue sticking slightly out.");

	if (!pc.isTaur())
	{
		output("\n\nYou slap her giant ass to try and get her to loosen up, but you just end up sending delicious vibrations through to your shaft.");
		output("\n\n<i>“I-I though you were... Gah... letting me take charge!?”</i> You scold her, to which she only replies by tightening up her ass even more! The constriction is sitting you firmly on the precipice between pleasure and pain, which only gets worse when she starts gliding up and down. ");
		if (pc.cocks[dick].cLength() < 14) output(" Your [pc.cock " + dick + "] is already so enveloped by her astronomical ass that it feels like you’re being guided in and out of the world’s tightest pussy. Her skin is so smooth that you don’t even need lube!");
		else if (pc.cocks[dick].cLength() < 20) output(" Your tip just barely peeks out the other side of her titan-sized tush, but that only helps emphasize the strangling heat the rest of your shaft is feeling. But that feeling is fleeting as her movements submerge your [pc.cockHead " + dick + "] in bubbly, gratuitously sized flesh.");
		else output(" Even her massive ass can’t contain your beastly [pc.cockNounSimple " + dick + "]. Of course, that doesn’t stop her from shining and squeezing every inch of your pole, combined with her super smooth skin, her assjob feels more like the world’s tightest titfuck.");
		output("\n\nYou almost feel like she’s trying to squeeze the [pc.cum] right out of you. Your rod feels almost painfully bloated from the constant, squeezing pressure, like you’re trapped in a malfunctioning pump. You feel your [pc.balls] tightening up, getting close to unloading their payload. Before you can get too close to the edge, she lets go. Her ass almost turns to jelly in an instant.");
		output("\n\nYour prick pops free with such suddenness that you nearly fall backward. You catch yourself and stare daggers at her, to which she only continues to smile. You give her a few hard slaps while you calm down from her assault. She moans and purrs, getting louder each time you bring your hand down on her grandiose globes.");
		output("\n\n<i>“Yeeees! Spank me! Punish me! I’m such a naughty kitty! Are you gonna pound this bad little pussy? Are you gonna make me squeal and squirt until I’ve learned my lesson?!”</i>");
		output("\n\nEmpty void, this chick’s kinky! She’s purring so loudly that you can see her vibrating, and her whole body has taken on a flushed tone. She looks like she’s gonna pass out if you keep up your strikes, so you decide to get on with the main event.");
		output("\n\nYou take a closer inspection of your lover’s hole. Her pussy has gone into overdrive, squirting thick streams of girlcum onto the ground under her. Just behind her puffy muff is her massively swollen balls. They’ve definitely grown since you last saw them, easily as big as soccer balls at this point, and looking almost painfully tight. Her dicks have already made a massive puddle of cum under her and don’t look to be stopping anytime soon. The twin shafts are spraying thick pre like hoses, desperate to drain her overpacked balls.");
		output("\n\nYou begin to reach your head in for a taste of her snatch, but suddenly find yourself reeling and cross-eyed. It takes a second for you to process the sensory overload that just hit you. Sweet void, she smells like a centaur orgy down there! Your mouth suddenly feels dry as a desert, like her puffed-up puss is some kind of sponge sucking in all the moisture from the air to collect in its own drooling tide. Your mouth is almost magnetized to it as you dive into her.");
		output("\n\nBlood rockets to [pc.eachCock] making your" + (pc.hasCocks() ? " dicks" : " dick") + " feel painfully bloated. The increasingly intense throbbing in your nethers only drives you further in, deforming her puffy outer lips with your own as you begin to taste her candy-like nectar. It’s intoxicating, like drinking a sweet ale, her thick pheromones seeping so deep that they tinge her juices with an almost alcoholic sting, complete with making your head fuzzy.");
		if (pc.isBro()) output(" Fuck, man, the way this bitch is pouring this stuff out, you could bottle it and never need to buy booze again!");
		output(" She’s spraying it out like water from a broken faucet, staining your face and spraying out to soak all the way down to your [pc.chest]. You swoon as you feel hotboxed just being this close to her sex.");
		output("\n\nThe smell is too much, your [pc.cocks]" + (pc.hasCocks() ? " feel like they’re" : " feels like it’s") + " about to pop from the sheer, overwhelming urge to breed. You can’t hold back anymore! You ram your [pc.cockNounSimple " + dick + "] against her sex, battering her lips open with ease, and slipping inside her.");
	}
	else
	{
		output("\n\nIt’s times like this that you really hate being a taur! She has you by the cock, and you’re too far away to do anything! And she’s just sitting there, staring, purring, like she’s not doing anything wrong.");
		output("\n\n<i>“I-I... Gah! I thought you were letting me take charge!?”</i> She doesn’t even respond, she just gives you the same look, and continues squeezing your [pc.cockNounSimple " + dick + "]. She squeezes near-painfully hard. Stars damn it, the ass on this woman! ");
		if (pc.cocks[dick].cLength() < 14) output(" Your [pc.cock " + dick + "] is consumed by the vast, fleshy waves of her oceanic ass. Your rod feels like it’s in a roiling bowl of smolderingly hot jelly, jostled around by her swaying ministrations.");
		else if (pc.cocks[dick].cLength() < 20) output(" Your [pc.cock " + dick + "] is <i>just</i> long enough to peek out the other end of her titanic tush, not that that’s necessarily a good thing. The cold air, or at least as cold as it can get between your writing bodies, blows across your [pc.cockHead " + dick + "], the contrast only emphasizing the smoldering, fleshy heat that envelops your shaft. The pleasure only gets worse as she starts jostling her booty around your member, making you feel like your dick is in a tumbler full of bubbling hot jelly.");
		else output(" Your [pc.cock " + dick + "] is long enough that even her mountainous ass can’t fully contain it. That doesn’t mean you’re out of the woods, however. Your breath gets knocked out of you as you feel her slam her ass, and your cock, against your underside. You groan out as you feel her start to jerk her booty up and down, giving you the tightest assjob you’ve ever had, as well as massaging your undercarriage with overwhelming amounts of sinfully smooth, unnaturally hot skin.");
		output(" You almost feel like she’s trying to squeeze the [pc.cum] right out of you. Your rod feels almost painfully bloated from the constant, squeezing pressure, like you’re trapped in a malfunctioning pump. You feel your [pc.balls] tightening up, getting close to unloading their payload. Just when you think she’s going to make you waste your load on her ass, it practically turns to jelly, and she lets go of your cock, making you stagger off of her in surprise.");
		output("\n\nYou take a moment to collect yourself before looking back at her with an irritated expression. She’s still giving you that look, but now she’s added a massive smile to it.");
		output("\n\n<i>“Oh, poor horsey. Was little kitty mean to you? Maybe she deserves some punishment.”</i> On that, she raises her ass toward you and gives her fat cheek a swift slap. Is she really asking for a spanking? This chick’s more kinky than you thought.");
		output("\n\nWell, you were never one to deny a woman when asked. You strut commandingly back up to her and ready your hand. Thankfully she’s propped her ass up high enough that you don’t have to bend over to reach it. You slap her bountiful butt, causing it to ripple and jiggle long after your hand has left it. You continue to spank her, upping the tempo and intensity of your strikes with each impact. You look at her face to see if you’re going too hard on her, only to find that no matter how hard or fast you strike her, she only seems to enjoy your attentions.");
		output("\n\n<i>“Oh Void, keep going! Hit me as hard as you can and don’t stop! I’m such a bad kitty. I deserve all the punishment, don’t I?”</i>");
		output("\n\nShe keeps egging you on, even after her body goes completely flush and her curvaceous cheeks are burning red. She’s moaning shamelessly loud by this point, and a few more strikes cause her moans to turn into loud screams as she cums. Her fat pussy squirts small streams of girlcum onto your [pc.legs], while her cocks hose the floor under her.");
		output("\n\nSweet Void that smell is intense! You suddenly feel like you’re sitting in a field of horny mares, with all of the pheromones wafting off of her. Fresh blood rockets to your crotch and there’s little else you can think about other than breeding this bitch! You rear up onto her and batter your [pc.cockHead " + dick + "] against her puffy mons, pushing inside with ease.");
	}

	if (pc.cocks[dick].volume() > 800)
	{
		output("\n\nYou can <i>feel</i> the way your monstrous member distends her gut. You almost feel like turning her over just so you can see it firsthand," + (pc.isTaur() ? " but your cumbersome body disallows you from doing so." : " but your lusts have your hands firmly rooted to her jiggling, expansive ass to aid in your frantic mating") + " Her already manic moans take on an incoherent tone as she struggles to cope with how much cockflesh is invading her. Your ego, and your [pc.cock " + dick + "], swell with pride at so thoroughly stuffing even such a massive mate.");
		output("\n\n<i>“F-f-f-ffffffffffuUUCK! FUCK, FUCK ME! DON’T HOLD BACK, JUST STUFF ME SO FULLLLLLL!”</i> She stares at you, pupils quickly reddening at the pleasure starts overwhelming her.");
	}
	else if (pc.cocks[dick].volume() > 200)
	{
		output("\n\nShe wasn’t kidding when she said she could take a lot! Your [pc.cock " + dick + "] is sliding through her like a bullet down an oiled gun barrel. You bottom out within seconds, somehow managing to fit the whole thing into her muff.");
		output("\n\n<i>“Fu-fucking... damn. There’s something ‘bout being this full that ya never get used to. Still feels amazing, of course! Don’t even think ‘bout holding back on me, I can take whatever you give!”</i>");
	}
	else
	{
		output("\n\nYou slip inside her with ease, her internal muscles clamping down to fit a perfect mold of your cock. Despite the tightness of her hole, it’s still easy to move your [pc.cock " + dick + "] in until you bottom out.");
		output("\n\n<i>“Get nice and comfy, cap, and don’t try and hold back on me!”</i>");
	}
	output("\n\nWith how riled up her pheromones have gotten you, it’s not like you could have held back anyway! You rear back until nothing is left in her but your [pc.cockHead " + dick + "]. You sit there for a second, letting her purring body massage your tip, before ramming yourself back in. As you ram in and out of her, you can truly appreciate how welcoming her hole is. Her luscious outer lips wrap each probing inch of your member in velvet softness as they saw in and out of her, ending in a soft, loving <i>“kiss”</i> to your [pc.sheath " + dick + "] every time you bottom out. Her tunnel is just as luxurious as her outer lips. It feels plush and sensual no matter how hard she clamps down on you.");
	output("\n\nYou feel like royalty! Your dick is caressed in the galaxy’s softest, wettest, warmest velvet, and you savor every second! She seems to be enjoying it just as much. Every time you bottom out is accompanied by shamelessly loud moans from Shizuya. Her body convulses in pleasure, her vaginal walls rippling along your length from her end to end orgasms. Her arms have given out, leaving her face planted in the moat that her spasming cocks have turned her bed into.");
	output("\n\nShe’s cumming her brains out already, her quads visibly pulsing as they work overtime to mix together drums of her" + (silly ? " herm chowder" : " baby juice") + " to expel out of her twin shafts. Her urethras strain and bulge obscenely as endless, gigantic pulses of white jizz fire out of her in increasingly high pressure streams. Her luxurious pussy strangles your [pc.cock " + dick + "] like a vice, almost completely stopping your movements. You bring your hand down again, slamming into her tender assflesh with all the might you can muster.");
	output("\n\nShe groans out loud and cums again, squeezing you even harder! At this point it feels more like you stuck your dick in a malfunctioning pump than a pussy. Your cock feels harder than you thought was possible, and you feel like you need to pull out before she rips your [pc.cockNoun " + dick + "] right off of you! Thankfully she seems to have gotten the hint from your slap, and after a moment you feel her muscles starting to work. The tightness becomes much less overbearing and more focused, rippling inward to guide you back into rhythm. You gladly take the opportunity, and immediately renew your thrusts, finding that her rippling, velvet cunt is guiding you in and out.");
	output("\n\nAnd you just keep going! Whatever her pheromones are doing to you is turning you into a sexual god. You rut her in a frenzy, going far beyond the point where you would usually tire out or cum. Every nerve feels super charged, even the slight trickle of sweat beading down your [pc.skin] is electrifying. And yet you don’t cum, your body somehow holding it back in spite of all the pleasure you’re experiencing.");
	output("\n\nNothing lasts forever though, and you soon feel your high start to fade as your orgasm approaches. Your [pc.legs] are trembling with pleasure and exertion" + (pc.isTaur() ? "." : ", and your [pc.arms] are straining from keeping her near-limp form held up.") + " Every muscle feels exhausted and energized at the same time, the building pleasure in your gut and the desire to breed keeping you going. You feel your release creeping up on you, your [pc.balls] feel bloated with the [pc.cumVisc] payload they’re about to deliver.");

	if (pc.cumQ() < 8000)
	{
		output("\n\nYour release hits you like a freight train. Your [pc.balls] tense up, shooting everything they have, going on far longer than you usually do. Your [pc.cock " + dick + "] is still throbbing, even after you’ve begun shooting blanks. Your strength gives out and you both go tumbling to the ground, too worn out to do much more than lie there and pant from your exertion.");
		if (pc.cocks[dick].hasFlag(GLOBAL.FLAG_KNOTTED)) output(" Your knot stays stubbornly lodged inside of her, still trying to pump out cum from your long-empty [pc.balls].");
		else output(" You go limp, your [pc.cock " + dick + "] slipping out of her still-spasming hole.");
		output("\n\nYou don’t even have the strength to move anymore, and you flop down on top of her.");
	}
	else if (pc.cumQ() < 40000)
	{
		output("\n\nYour release hits you like a freight train. Your [pc.balls] tense up, shooting massive gouts of [pc.cum] through your urethra. Each massive pulse feels like its own orgasm, shorting your already overworked nerves, causing both of you to go tumbling to the ground.");
		if (pc.cocks[dick].hasFlag(GLOBAL.FLAG_KNOTTED)) output(" Your knot has already tied you both together, leaving you helpless to do anything but fill her overwhelmed hole until backed up [pc.cum] is shooting out around your knot. With nothing to do but sit there and cum, you quickly find your exhaustion getting the better of you. You take one last look into Shizuya’s insensate face, before you fall limply on her back.");
		else output(" You try to pull out of her when the pressure starts pushing streams of [pc.cum] out of her hole, but find your body unresponsive. You must have gone way harder than you thought! Everything is sore... so sore... The energy, and even desire to get up quickly leaves your body. You lie on top of her as you recover.");
	}
	else
	{
		output("\n\nYou cum like a raging river, bathing her furthest depths in ludicrous amounts of [pc.cum]. Your [pc.balls] feel like they’re erupting into miniature supernovas as your body’s production works itself up into overdrive. Your urethra is already getting sore from expelling barrels upon barrels of seed into Shizuya’s" + (pc.isBro() ? " unfortunately" : "fortunately") + " sterilex’d womb.");
		output("\n\nShe was already swelling out from just your first shot; after a few seconds she’s positively gravid. Your unreal virility is absolutely overwhelming her, and she couldn’t be happier. She looks back at you with rapture, trying and failing to babble out worshipful thanks to your god-like virility.");
	}
	
	pc.orgasm();
		
	addButton(0, "Next", shizzyPostSex);
}

public function shizzyTwoDicksForThoseThatFit(dicks:Array):void
{
	clearMenu();
	clearOutput();
	showShizuya(true);
	
	var x:int = dicks[0];
	var y:int = dicks[1];
	
	output("Shizuya moves up to grope your crotch, her movements growing more curious as she feels your multiple endowments through your [pc.armor].");
	output("\n\n<i>“Oh, someone’s got good taste! I bet these babies want some nice warm holes to settle in, don’t they?”</i>");
	output("\n\nYou bet your sweet ass they do! You push her back and tear your [pc.gear] off before thrusting your crotch at her. The sight of your [pc.cocks] turns her ecstatic, and she darts toward your dicks. She brings her face down to your crotch and begins to inspect your offering.");

	if (pc.cocks.length > 2) 
	{
		output(" She pauses for a second, seemingly taken aback by your busy crotch.");
		output("\n\n<i>“Geez, Steele, and here I thought I was greedy. Ya tryin’ to grow a forest down here or something?”</i> She says playfully as she begins to work.");
	}
	else output("\n\nShe brings her face in just next to [pc.oneCock] and begins to blow softly on it. She alternates between your two poles, her hot, wet breath dancing along your lengths, somehow much hotter than the strained skin of your phalluses. When she feels like you’re sufficiently stirred up, she gets to the real work.");

	output("\n\nYou flinch when she brings her hands to fondle your crotch, showing off the massive claws at the tips of her fingers. She looks at you, smiles, and starts to reassure you.");
	output("\n\n<i>“Come on cap, you really think I haven’t learned how to jerk off with these babies?”</i> She says, pointing down toward her own cocks. <i>“Besides, I file ‘em down nowadays so it ain’t even an issue anymore.”</i>");
	output("\n\n<i>“Guess I can’t argue with that.”</i> You say as she slowly begins to jerk you off.");

	if (pc.cocks.length > 2) 
	{
		output("\n\nHer hands dart clumsily between your [pc.multiCocks]. For someone with a few dicks of her own, she seems uncomfortable handling all of you.");
		output("\n\n<i>“Don’t look at me like that, I’m used to only having to deal with two of these things. Actually thought about gettin’ a few more arms a while back, but that shit’s way too complicated.”</i>");
		output("\n\nAfter a minute she finally finds her rhythm, gliding around your dicks, making sure one doesn’t stay unattended for too long. She even finds time to" + (pc.balls > 0 ? " fondle your [pc.balls]." : " sneak a quick finger up your ass."));
	}
	else
	{
		output("\n\nHer hands handle your members expertly, constantly raising and lowering intensity to keep you as stimulated as she wants you, no more, no less. She keeps you so entranced that you don’t even see her hands dart toward your" + (pc.balls > 0 ? " [pc.balls], and give them a quick squeeze." : " [pc.ass] and dart a quick finger up your anus."));
		output("\n\n<i>“Like it cap? I’ve had a <b>lot</b> of practise with this.”</i>");
		output("\n\nYou’re not gonna argue that! It hasn’t even been that long since she started and your [pc.cocks] are straining as hard as they ever have.");
	}
	
	output("\n\nYou’re nearing the edge when she suddenly sits up and pushes her dicks into yours, carelessly slapping the two hot bundles together.");
	output("\n\n<i>“Wha-what are you doing!?”</i>");
	output("\n\n<i>“Just makin’ sure you’re as ready for this as I am”</i>");
	output("\n\n<i>“What?”</i> You stop when a fresh blast of pheromones hits your nostrils. The thick fog settles on your brain, causing you to grow cross-eyed for a second as your [pc.cocks] engorge beyond reason.");
	output("\n\nYou snap out of your stupor to see Shizuya on her back, legs spread, her cock and balls lifted out of the way of her snatch. Unable to take anymore you pounce onto her and line up your [pc.cock " + x + "] with her puffy pussy, and your [pc.cock " + y + "] with her ass.");

	if (pc.cocks[x].volume() < 200) output("\n\nYour [pc.cock " + x + "] sails through her lips with ease, only halted by her butthole’s denial of your [pc.cock " + y + "].");
	else if (pc.cocks[x].volume() < 800) output("\n\nYour [pc.cock " + x + "] slips into her pussy, facing only a bit of resistance despite your size.");
	else output("\n\nYou ease your [pc.cock " + x + "] into her, finding that despite the way your ogre size distends her belly, she takes all of you like a champ.");

	if (pc.cocks[y].volume() < 200) output(" Compared to that, your smaller [pc.cock " + y + "] faces some issues; you guess she’s not as pliant back there.\n\n");
	else if (pc.cocks[y].volume() < 800) output(" You can’t say your [pc.cock " + y + "] is having as good a time slipping into her ass. You’re getting in, but it’s certainly a challenge.\n\n");
	else 
	{
		output(" Your [pc.cock " + y + "], however, is having a hell of a time getting into her asshole. You batter your tip against her backdoor, but feel it barely budge. You almost want to call it off, but a lusty, desperate voice rings out from Shizuya.");
		output("\n\n<i>“Nonononono! I want it, I want all of you inside me! J-just keep goin’.”</i> If she insists. You keep slamming in, feeling her hole start to give more and more as you work it. ");
	}

	output("As soon as she gives out, though, you’re met with a feeling of bliss and confusion. Your cocks are in completely different worlds, one of moist velvet squeezes, and the other of clenching tightness. Thankfully she seems to have lubed up her ass beforehand.");
	output("\n\n<i>“G-g-good gir-girls never leave home with-with... OH... without lubing up.”</i>");
	output("\n\nYou’re glad she did, because there’s no way you could hold yourself back! You thrust into her with wild abandon");

	if (pc.cocks[x].volume() < 200) output(", burying every inch of your lengths into her holes with ease. Your [pc.cocks] throb heavily inside her, their pulsations reverberating off of each other through her thin walls. The sensations are so delightful that you can’t help but to lie down and savor them");
	else if (pc.cocks[x].volume() < 800)
	{
		output(", spearing her with so much cock meat that her stomach bulges.");
		output("\n\n<i>“Th-that’s i-it cap, drive those monsters home! FUCK, I love being this stuffed!”</i>");
		output("\n\nYou miraculously bottom out, your [pc.cocks] throbbing hard against each other through her thin inner walls. The sensations are so delightful that you can’t help but to lie down and savor them.");
	}
	else
	{
		output(".\n\nShe babbles incoherently as she feels the sheer amount of cockflesh inside her. Her toned stomach is bulged out so heavily that you think you can see your veins pulsing under her skin.");
		output("\n\n<i>“Oh fuck oh fuck ooooooh FUUUUUUUUUUUUUUUUUUCK!”</i> Her holes start spasming around your [pc.cocks], and her whole body seems to be going crazy, spasming and heating up to furnace-like temperatures.");
	}

	if (pc.isTaur())
	{
		output("\n\nYou gently lay yourself on her, careful not to crush her. She’s tall enough that your body can’t cover her face. She looks at you with an irritated scowl, and sticks her tongue out slightly. You press yourself harder onto her, deciding to have a little fun with this. Her scowl worsens, but you can tell that she’s enjoying this. Her nipples are as hard as diamonds against your underbelly, spraying warm streams of milk that coat your [pc.skin] in a white sheen.");
		output("\n\nYou finally press your full weight onto her, and with that her face begins to turn flush and she starts sweating profusely. You begin to lift off of her, thinking you’re starting to go too far, but she slaps you on the flank, sending you slamming back onto her. You look down in a panic to see if you hurt her, but are met with a smile and a wink. A little confusing, but she seems to be at least enjoying this treatment.");
		output("\n\nYou know she’s definitely enjoying it when you feel a gush of warmth spread out from her crotch and her ass and pussy squeeze down on you. She just came, and hard! By this point her eyes have pivoted up into her skull, and she’s panting heavily. She’s absolutely loving this. Maybe you should think about doing this again sometime.");
		output("\n\nYou lay on her for another minute, until her hands slap against your flanks and she speaks out in a strained voice.");
		output("\n\n<i>“You know, I’m lovin’ this, but we’ve got more fun things to do than sit around don’t we?”</i> She squeezes down on your rods to emphasize her point. You weren’t intending for this to go on much longer anyway. You sit up from her and admire just how much milk and cum soaked between your bodies. And she’s still spraying out more. You lick your lips as you readjust yourself to start fucking her for real.");
	}
	else if (pc.tallness < 5*12 + 2)
	{
		output("\n\nYou rest your head between her bountiful breasts, not tall enough to reach her face from your position. She reaches her hands out, one to guide you to one of her leaking teats and the other to stroke your [pc.hair].");
		output("\n\n<i>“Good little " + pc.mf("guy", "girl") + ", make mama feel good and I’ll make you feel good. Little ones like you need love and kisses and big warm titties to snuggle.”</i>");
		output("\n\nHer words fill you with a comforting warmth, a gentle softness to contrast the the hardness of your [pc.cocks]. Her gentle tones and warm milk make you feel like you’re cuddling in your own mother’s arms... While also balls deep inside her... You decide now is the time to get on with the main event, sitting up from her breasts and grabbing her wide hips.");
		output("\n\n... You might need to see a counselor after this.");
	}
	else
	{
		output("\n\nYou press your [pc.lips] to hers, pulling her into a surprise make-out session. You tie your [pc.tongue] around hers, the appendages vying for dominance. Meanwhile, her massive melons are pressing into your [pc.chest], covering you in her copious milk. ");
		if (pc.isLactating()) output(" Your [pc.nipples] are rubbing against hers, causing your [pc.milk] to spill out, joining her already-copious fluids.");
		output("\n\nYou feel deliciously warm all over. Your [pc.chest] and [pc.belly] are covered in" + (pc.isLactating() ? " both of your" : " her") + " warm milk, your pricks feel like miniature suns by this point, burning away in her body’s hot furnaces.");
		output("\n\nYou break your kiss, and exchange a long lustful look.");
		output("\n\n<i>“So passionate, cap. I hope you didn’t forget what you put me down here for, though.”</i> She squeezes down on your hot rods for emphasis.");
		output("\n\nYou sit up and slap your hands against her fat hips, taking a firm hold and assuring her that you haven’t forgotten anything.");
	}

	//Tying panties
	var knotX:Boolean = pc.cocks[x].hasFlag(GLOBAL.FLAG_KNOTTED);
	var knotY:Boolean = pc.cocks[y].hasFlag(GLOBAL.FLAG_KNOTTED);
	if (knotX || knotY)
	{
		output("\n\nYour " + (knotX && knotY ? "knots" : "knot") + " pulse and grow inside of her " + (knotX ? (knotY ? "holes" : "pussy") : "ass") + ", threatening to tie you together at any moment.");
		output("\n\n<i>“You’re going to use " + (knotX && knotY ? "those" : "that") + " right? Tie me down and breed me like a little bitch in heat!? Come on, I want it, I want so bad!”</i>");
		output("\n\nHow could you possibly resist with an invitation like that? But, for now, you pull your " + (knotX && knotY ? "knots" : "knot") + " out and get ready for some pounding.");
	}

	output("\n\nYou pull your doubled dongs out until only the tips are left, before thrusting them in to their bases. The first few thrusts are wild and unwieldy, but you quickly settle into a rhythm of sawing yourself in and out of her, pressing one dick in as you pull the other one out.");
	output("\n\nThe ambrosial contrast only gets worse as you start thrusting. Her ass tightens around your [pc.cock " + y + "] every time you pull out, as if it’s begging you to stay. When you do bottom out, it wrings you dry, trying to savor every moment it has with your member. Meanwhile her pussy is drawing your [pc.cock " + x + "] like they’re a pair of magnets. With how soft her inner lips are, it’s hard to tell if it’s her own muscles drawing you in, or your lusts driving your hips in on pure instinct. It doesn’t matter though; you’re on cloud nine, enjoying some of the best holes you’ve ever felt.");
	output("\n\nShe moans like a siren, cumming almost instantly. Your foreplay earlier must have really gotten her going, her holes squeeze orgasmically down on you, holding your pricks hostage and halting your thrusts for a few seconds. Her dongs spray down her top half and then some, leaving a growing white pool around her.");
	output("\n\nEverything collides into a perfect storm. Her orgasmic contractions wringing your cocks, the sight of her cumming her brains out, the pheromones that are still hanging in the air. It’s heavenly, and you can feel your [pc.balls] tense up as you get ready to top it off.");

	if (pc.cumQ() < 8000) 
	{
		output("\n\nYour [pc.cocks] explode inside of her, dumping the entire content of your [pc.balls] in a matter of seconds. To you, though, those seconds feel like hours. You’ve been so on-edge this whole time that each throb of your dicks feels like its separate orgasm.");
		if (knotX || knotY) output(" The feeling only intensifies when your" + (knotX && knotY ? " knots finally swells enough to plug her holes." : " knot finally swells enough to plug her" + (knotX ? " muff." : " ass.")));
		output(" The needy pulsations send you into fits, causing your hips to jerk violently as your balls try desperately to pump out phantom cum.");
	}
	else
	{
		output("\n\nYour [pc.cocks] throb heavily, their urethras distending as fat wads of [pc.cum] shoot through them. By this point she’s far too insensate to do much more than groan as you begin to fill her. Her belly starts to swell as you stuff both of her holes to capacity, and then some.");
		if (pc.cumQ() < 40000) output("\n\nYou pump until she looks at least six months pregnant, and your cum is spraying out" + (knotX || knotY ? " around your swelling " + (knotX && knotY ? "knots" : "knot") : " onto your crotch") + " in small streams. The cum that splatters out is quickly swept up in the pool of her own cum. Even your mighty output is no match for her flood.");
		else
		{
			output("\n\nYou pump and pump, never letting up." );
			if (knotX || knotY) output((knotX && knotY ? " Your knots swell into place, but even they" : " Your knot swells into place, but even it") + " can’t hold back your tide. Cum surges out in lewd waves, coating your crotch and pooling on the ground.");
			output(" She’s completely gravid, submerged in a pool of both of (but mostly your) cum by the time you even start to slow down.");
		}
	}

	if (knotX || knotY)
	{
		output("\n\nEven after you’re done cumming, the lustful energy in the air keeps your hips moving, desperate for another round, but thwarted by your fleshy" + (knotX && knotY ? " bulbs" : " bulb.") + " Your mind is near blank by this point, fruitlessly trying to pry your prongs out, but only succeeding in sending lustful shocks throughout your body. Even after that explosive orgasm you still feel wads of cum shoot through you. Your balls never empty, filling just faster than you can pump them. This is insane! What’s in her pheromones?");
		output("\n\nYou run out of energy quickly and flop limply onto Shizuya.");
		if (pc.isTaur())
		{
			output("\n\nHer face turns to shock for a moment, before settling back into bliss. her hands reach up and grab your face, pulling it as close to hers as you can reach.");
			output("\n\n<i>“Fuck, cap, you’re really tryin’ to push me aren’t ya? Lucky for you I love this kinda shit! Jeez you look worse than I do, and you don’t even have someone on top of you... It’s all right if ya pass out, I’ll just toss ya off if it gets too much.”</i>");
			output("\n\nYou wouldn’t even have the strength to get up if she wanted you too. Your eyelids feel like lead, and exhaustion quickly takes you.");
		}
		else
		{
			output("\n\nYou feel like you’re about to pass out when you feel hands grab your head, one guiding you into her bosom while the other pets through your [pc.hair].");
			output("\n\n<i>“You’re a good puppy ain’t ya? You can sleep now, we’ll have more fun later...”</i>");
			if (InCollection(pc.race(), ["half-ausar", "ausar", "huskar"]) && pc.hasTail() && pc.hasTailFlag(GLOBAL.TYPE_CANINE)) output(" Your [pc.tail] wags at the suggestion that you are indeed a good doggy.");
			output(" She continues to stroke you as exhaustion takes you, and you fall limply on her.");
		}
	}
	else output("\n\nYour hips have been sawing away at her like a prime redwood log even through your orgasm, and they show no signs of stopping. You’re on autopilot, your mind unable to process any but the most primal desires. You cum again, filling her even more. But your movements don’t cease, you fuck her and fuck her until your body completely gives out, and you fall down on her.");

	pc.orgasm();
	
	addButton(0, "Next", shizzyPostSex);
}

public function shizzyNomNomNom(canleave:Boolean):void
{
	clearMenu();
	clearOutput();
	showShizuya(true);
	
	output("How do you take her?");
	
	var dick:int = pc.cockThatFits(500);
	if (pc.hasVagina() || dick != -1)
	{
		addButton(0, "Dicks", shizzySuckHerDick, dick, "Dicks", "Use her dick, and have her use yours, if you have one.");
		addButton(1, "Vaginas", shizzySlurpSlurp, dick, "Vaginas", "Eat her out, and have her eat you out, if you have a vagina.");
	}
	else
	{
		addDisabledButton(0, "Dicks");
		addDisabledButton(1, "Vaginas");
	}
	addButton(14, "Back", shizzySexyButtons, canleave);
}

public function shizzySuckHerDick(dick:int):void
{
	clearMenu();
	clearOutput();
	showShizuya(true);
	
	output("She hops up to grope you, grabbing your [pc.crotch], and" + (pc.hasBreasts() ? " groping your" : " running her hand down your") + " [pc.chest], you fire back, one hand grabbing one of her massive tits and the other grabbing for her crotch. You alternate between jerking off her colossal cocks, squeezing one of her many balls, and massaging the fat lips of her flower. She rips off your [pc.gear] in response, intensifying her touches on your now naked form.");
	
	if (dick != -1)
	{
		output("\n\nShe pays particular attention to your [pc.cocks]," + (pc.hasCocks() ? " frenziedly jerking each of your lengths." : " rubbing your length raw.") + " You return the favor, taking your hand off of her tit and putting your full attention on her shafts. You stand there, stroking each other off until your pre has formed a ");
		if (pc.cumQ() < 8000) output(" small");
		else if (pc.cumQ() < 40000) output(" large");
		else output(" massive");
		output(" off-[pc.cumColor] puddle on the ground. You can feel your [pc.balls] tense up, and her own shafts throb on the edge of release. Before you can get off, she stops stroking you and takes your hands off of her schlongs.");
		output("\n\n<i>“That’d be a pretty boring way to end things, wouldn’t it?”</i> She pants at you. <i>“I’ve got a better idea.”</i>");
		output("\n\nShe sinks down your shaft, taking your [pc.cockHead " + dick + "] in her mouth.You blow a wad of pre into her throat, your prick barreling toward the edge. She only sucks for a brief second before pulling off. She stays face to phallus with you, just watching you throb on the verge of release. She bops you with her nose, taking in your scent and catching another spurt of pre on her face.");
		output("\n\n<i>“Now for the fun part.”</i> She says as she springs up only to lay back down on her back a foot from you. She brings a finger up to her mouth and begins to fellate it while her other hand strokes off one of her cocks. That’s all the invitation you need, and you lay down on her, [pc.cocks] in her face, and her own cocks in yours.");
	}
	else
	{
		output("\n\nShe pays particular attention to your [pc.pussy], vigorously fingering you. Somehow her claws don’t cause you any pain, but instead add to the pleasure of her fingers.");
		output("\n\n<i>“I file ‘em down. Ain’t no use cutting myself every time I masturbate is there?”</i> It’s hard to even think of a response. Her fingers are slender on her large frame, but they’re still as big as a normal man’s dick! She hammers her fingers in and out of you, making sure to flick your [pc.clit] every thrust. You repay her ministrations by putting both of your hands to work on her hermhoods. The pleasure coursing through you makes your strokes jerky and unfocused, but judging by her face and how much pre she’s leaking, you don’t think she cares.");
		output("\n\nShe stops you before you both blow, taking her fingers out of your [pc.pussy] and pushing your hands from her throbbing shafts.");
		output("\n\n<i>“That’d be a pretty boring way to end things, wouldn’t it?”</i> She pants at you. <i>“I’ve got a better idea.”</i>");
		output("\n\nShe sinks down, grabs your [pc.hips] and digs her face into your snatch. Her massive tongue undulates inside of you, filling every needy fold with bliss. She tongues you to orgasm" + (pc.wettestVaginalWetness() > 5 ? ", filling her cheeks with your flow of [pc.girlCum]. She sucks it down like water in a desert, intensifying her tongue-fuck to get more of your juices." : ", licking up every drop of [pc.girlCum] you can make. Her tongue digs deeper, exploring for every delicious drop.") + " She pulls off as you reach your second climax, letting your juices splatter her face. Despite your back to back orgasms, your pussy is aching for more of her tongue. You spread your lips for her, inviting her to dive back in. She brings a finger up and bops your [pc.clit] before wagging at it.");
		output("\n\n<i>“Hey, I’m the greedy pussy around here. You can have more, but you have to return the favor.”</i> She gets up before stepping back and lying down in front of you. She licks her lips while her hands lightly stroke her pricks. Given an invitation you can’t resist, you climb onto her and pull her dick toward your face while pressing your puss into her face.");
	}

	if (pc.isBimbo())
	{
		output("\n\nYou take a second just to take in her shafts. Dicks are like works of art, and you love to take in every little detail. Her heads are all big and fat like all the cute horsey boys. You love how the flares stretch your throat open; you never have to worry about any yummy cum getting out of your tummy. She gives you a few slaps on your [pc.ass], signaling that she wants you to get going. You apologize. Treated boys and herms get so touchy when they don’t get off. That’s where you come in, of course, a nice angel to take all that yummy cum away.");
		output("\n\nYou dive onto her dick going as far down on it as you can go, sampling the many kitty-spines and thick veins along the way. The yummy smell coming off of her dick is almost better than her pre. It’s thick and complex, like speed-eating a five-course meal. If how it’s assaulting your senses is any indication, you’ll have plenty of time after the fact to pick out the nuances. You pop off to catch a quick breath and see how far you got. Sweet, over half way in one go, that’s, like, a new record for you!");
		output("\n\nYou’re about to dive in for another round when you see how lonely her other length is. Poor thing, watching its brother having all the fun! You squish both of them together and suck the tips into your mouth. There’s no way you can get them beyond the tips, but it’s so fun feeling your mouth stretch like this that you don’t even care.");
	}
	else
	{
		output("\n\nYou try to take her, but are only able to get a few inches before you start to gag. Fuck she’s so big! You have to pull off, you can’t take this! That’s what you keep telling yourself, but your body won’t listen. The combination of being so close to her pheromones and the divine taste of her pre is keeping you glued to her dick. You can taste her pheromones along with her juices. It’s an indescribable taste, like the distilled essence of sex flooding over each of your tastebuds. Your hand grabs her other cock, jerking it and rubbing it against your face to get more of her sweet scent.");
		output("\n\nYou start to bob up and down on her shaft, coming off for just long enough to catch a breath. Despite your trepidation you’re already managing to get almost half-way down her shaft. Your gag reflex is gone, replaced with the desire to shove as much cock down your throat as possible. You start to alternate between her hermhoods, taking a few dives onto one while letting the other soak in more of her delicious musk. Now that your hands are free you set them to work on her balls, cupping and squeezing them two at a time. Void, this must be how Treated girls feel! Completely absorbed in cock, nothing to worry about but getting as much as possible. It’s paradise.");
	}
	
	if (dick != -1)
	{
		output("\n\nYou’re so distracted by working on her dick that you barely notice her starting on yours. She takes hold of your [pc.hips], lifts your bottom into the air, and slams" + (pc.hasCocks() ? " one of your" : " your") + " [pc.cocks] into her mouth. She takes you right down to the base in one stroke, rousing you from your cock-obsessed stupor, and causing you to moan loudly in surprise. She throws you an annoyed look.");
		output("\n\n<i>“Slow ‘er down there cap, don’t wanna blow you up just yet.”</i> Blow you up? You turn back to her dick and see what she’s talking about. Her balls have swollen up to the size of cantaloupes, and her pre is thickening and spraying out at a rate that would put most orgasms to shame. She’s gonna cum big, and she wants to savor it. You do too. The idea of her filling you to the brim, and possibly more, is so alluring in the sexual fog she’s put you in.");
		output("\n\nShe nods happily and lifts you back up, this time restraining herself to just bench-pressing you in and out of her mouth. She raises and lowers you slowly, allowing her tongue to work along every inch of your shaft that’s in her mouth. Occasionally she’ll keep you at the peak of her lift and focus on pleasing your [pc.cockHead " + dick + "].");
		if (pc.hasCocks()) output(" She alternates between each of your dongs, determined to please all of them.");
		if (pc.balls > 0) output(" Some thrusts she guides your" + (pc.hasCocks() ? " dicks" : " dick") + " into her cleavage so she can focus on your [pc.balls]. She takes each orb into her mouth, giving them a heavenly tongue bath, causing your shafts to jump and glaze her melons with pre-cum.");
	}
	else
	{
		output("\n\nYour pussy is gushing, aching to be filled. You’ve actually forgotten about Shizuya in your lusty haze. That is, before you feel your lower half being raised up, and a hard slap on your mons. You yelp in surprise, pleasure, and pain, looking back to see a very annoyed looking Shizuya.");
		output("\n\n<i>“Slow ‘er down there cap, don’t wanna blow you up just yet.”</i> Blow you up? You turn back to her dick and see what she’s talking about. Her balls have swollen up to the size of cantaloupes, and her pre is thickening and spraying out at a rate that would put most orgasms to shame. She’s gonna cum big, and she wants to savor it. You do too. The idea of her filling you to the brim, and possibly more, is so alluring in the sexual fog she’s put you in.");
		output("\n\nShe lifts your box up to her face, giving herself unimpeded access to your lady bits. She dives her tongue back into your folds, and your cunt pulls her in like a long lost lover. Her last cunny lashing left a hunger in your [pc.pussy " + pc.wettestVaginaIndex() + "] that she effortlessly fills again. Her oral organ is big and long enough to reach the furthest depths of your honeypot. Her tongue scans your depths like a machine, pinpointing all of your sensitive spots and making sure they’re always stimulated. Her bottom lip presses into your [pc.clit], massaging it while her tongue works your insides.");
	}

	if (pc.isBimbo())
	{
		output("\n\nHer mouth is so good! You hope yours is just as good for her. You take a second to reexamine her kittyquine cocks. There’s a super yummy smell coming from her sheaths. All that tasty dickflesh must have been fermenting this whole time. You pull back the skin of her sheath with your [pc.lips], and the most awesome smell ever rushes up your nose. Your tongue darts out on instinct, diving into her sheath-fermented skin. It’s a delicious soup of pre-cum and distilled pheromone sweat. You lick both of her sheaths clean, but you still want more!");
		output("\n\nStray gobs of pre have been falling on you this whole time, only getting bigger from your handiwork. You tilt your head up and open your mouth, catching a nice big spurt and drinking it down effortlessly. Oh stars you want more! You dive onto her tip and take her down to the base, deepthroating her as fast as your muscles will let you. You put one hand down on her balls, trying to squeeze all of her yummy cum out. Your other hand is frenziedly jerking off her other cock, causing gouts of thick pre to spill all over your [pc.hair] and back. You want it, you want it, oh Void do you want it! Her balls are all super swollen, they want to give you cum as much as you want to drink it!");
	}
	else
	{
		output("\n\nHer attentions on your" + (dick != -1 ? " length" : " pussy") + " drive you crazy, but the siren song of her dicks never leaves your mind. You take it slowly this time, kissing her cumslit and getting a nice cheekfull of thick pre for your efforts. You swallow greedily, wanting more but also wanting to savor every drop. You plant your hands over her heads, collecting spurt after spurt until your hands are soaking in her juices. You glide your cum covered hands down each of her shafts, coating them in her salty goodness. You give them several good layers before you get to work.");
		output("\n\nYou travel down her shafts with your tongue, lapping up every drop you can get. You worship her spiney horse-dongs like godly idols, desperately trying to take in all of their gifts to you. Even after you’ve licked both lengths clean you still want more! You take one of her penetrators and impale your mouth on it, letting it spray its bountiful juices straight into your stomach. Her other phallus is sitting on your head, soaking your [pc.hair] in thick white. You reach down to her balls and start squeezing them. Each one is accompanied by a fresh burst of ambrosia into your mouth, and a fat arc of cum that splatters all over your [pc.ass]. Her massive balls throb hard in your hand, swelling even bigger as they ready her real load.");
	}
	
	if (dick != -1)
	{
		output("\n\nYour ministrations are driving her over the edge and she decides she isn’t going alone. She takes your [pc.cock " + dick + "] in to the base, purring uncontrollably, sending vibrations up and down your shaft. Your [pc.balls] tremble in tune with hers, signaling your synchronous orgasms.");
		if (pc.cumQ() < 8000)
		{
			output("\n\nYou unload in seconds, her skilled mouth carrying away everything you have to offer and then some. Her purring tunnel is demanding more and more of your [pc.cum]. You deliver with gusto, coming to a second orgasm in record time, and being hot on the heels of a third. She sucks down load after load, demanding more from you, and always seeming to get it no matter how drained you feel. You wish you could say you were handling it as well. Your belly is so full that you look like a beach ball just inflated inside you. You’ve gone completely slack at the intense sensations. Everything is white... so much cum... Your stomach is so pressurized that a large blast sends you rocketing off of her cock. Her flow seems to slow down as your face settles next to her balls. Your tongue sticks out, unthinkingly licking at the source of the lewd pool you’ve found yourself in. Your stomach growls in discomfort, but you feel surprisingly sated.");
			output("\n\nShe takes your cock out of her mouth, placing it gently into her tits. Her arms cradle around you as you pass out.");
		}
		else
		{
			output("\n\nYou cum first, your urethra distending as fat gobs of [pc.cum] come barreling through it directly into her stomach. You feel her stomach start to swell against your [pc.belly] before her orgasm balloons you out. Thankfully she’s so deep in your throat that you don’t have to worry about swallowing. You can just sit there and bask in the warm feelings flooding your stomach. Her other cock is a geyser, coating both of you in layer upon layer of her cum.");
			if (pc.cumQ() < 40000) output("\n\nShe looks pregnant with twins by the time your flow subsides. She actually manages to swallow your entire load before flopping your spit-slick dick out of her mouth, letting it sit and dribble its last drops of [pc.cumNoun] on her cheek. You wish you could say you were handling it as well. Your belly is so full that you look like a beach ball just inflated inside you. You’ve gone completely slack at the intense sensations. Everything is white... so much cum... Your stomach is so pressurized that a large blast sends you rocketing off of her shaft. Her flow seems to slow down as your face settles next to her balls. Your tongue sticks out, unthinkingly licking at the source of the lewd pool you’ve found yourself in. Your stomach growls in discomfort, but you feel surprisingly sated. Her arms cradle around you as you pass out.");
			else output("\n\nYou match her spray for spray, feeling your [pc.cumNoun] hose out of you as her own cum floods your stomach. Your stomachs are both ridiculously gravid. Anyone looking at the two of you would think you were about to give birth to a small village. And you both just keep going. Your bellies are filled to bursting, and excess cum is shooting out of your mouths and noses, creating a pool on the ground. You pop off of each other’s cocks, catching another massive gout right to the face as you flop into a pile of sticky cum-balloons. Your body is numb with pleasure and covered in a thick blanket of mixed cum. You think your orgasm stopped, but it’s hard to feel anything about your body right now. You’re tired, sore, and more sated than you think you’ve ever been. Your eyelids drop like lead, and sleep quickly comes.");
		}
	}
	else
	{
		output("\n\nYour ministrations are driving her over the edge, and she decides she isn’t going alone. She dives her tongue as deep as she can in your [pc.pussy " + pc.wettestVaginaIndex() + "], forcing down your most sensitive spots, trying to force you to more orgasms. It works almost too well and you go off like a plasma cannon. Orgasm after orgasm rings from your depths, coating her face in floods of [pc.girlCum]. She drinks down your offering like water from a leaky faucet, pillaging your depths for more, demanding you give her everything. You comply, cumming your brains out as you feel her starting to fill you.");
		output("\n\nYour [pc.belly] bloats out in seconds, unable to withstand her liquid assault. The sudden fluid cascade has you cuming all the harder. Your womb is throbbing in jealousy over the filling your stomach is getting. A sublime warmth is spreading from your overfilled middle, burning through your whole body and turning you to jelly. Your muscles go slack, and the feeling in your body is reduced to your spasming cunt and overworked mouth in a sea of warm bliss. At some point you popped off of her dick, but you’re far too out of it to know exactly when.");
		output("\n\nThe only thing you do know at this point is that she’s still eating you out, though she’s going at a much slower pace than before. The slower pace slows your mind with it. So warm, so full... You doze off, every cell in your body sated to the point where you couldn’t stay up if you wanted to.");
	}
	
	pc.orgasm();
	pc.loadInMouth(chars["SHIZUYA"])
	
	addButton(0, "Next", shizzyPostSex);
}

public function shizzySlurpSlurp(dick:int):void
{
	clearMenu();
	clearOutput();
	showShizuya(true);

	var vag:int = pc.wettestVaginaIndex();
	
	output("She hops up to grope you, grabbing your [pc.crotch], and" + (pc.hasBreasts() ? " groping your" : " running her hand down your") + " [pc.chest], you fire back, one hand grabbing one of her massive tits and the other grabbing for her crotch. You alternate between jerking off her colossal cocks, squeezing one of her many balls, and massaging the fat lips of her flower. She rips off your [pc.gear] in response, intensifying her touches on your now naked form.");
	
	if (pc.hasVagina())
	{
		output("\n\nShe pays particular attention to your [pc.pussy " + vag + "], vigorously fingering you. Somehow her claws don’t cause you any pain, but instead add to the pleasure of her fingers. <i>“I file ‘em down. Ain’t no use cutting myself every time I masturbate, is there?”</i> It’s hard to even think of a response. Her fingers are slender on her large frame, but they’re still as big as a normal man’s dick! She hammers her fingers in and out of you, making sure to flick your [pc.clit] every thrust. You repay her ministrations by reaching around her sack and jamming your fingers between her puffy folds. You drove in two fingers at first, but quickly find that there’s room for all of your fingers and more. Soon you’re driving your whole hand in and out of her mons. The pleasure coursing through you makes your strokes jerky and unfocused, but judging by her face and how soaking wet she is, you don’t think she cares.");
		output("\n\nShe stops you before you both blow, taking her fingers out of your [pc.pussy] and pushing your hand out of her folds.");
		output("\n\n<i>“That’d be a pretty boring way to end things, wouldn’t it?”</i> She pants at you. <i>“I’ve got a better idea.”</i>");
		output("\n\nShe sinks down, grabs your [pc.hips] and digs her face into your snatch. Her massive tongue undulates inside of you, filling every needy fold with bliss. She tongues you to orgasm" + (pc.wettestVaginalWetness() > 5 ? ", filling her cheeks with your flow of [pc.girlCum]. She sucks it down like water in a desert, intensifying her tongue-fuck to get more of your juices." : ", licking up every drop of [pc.girlCum] you can make. Her tongue digs deeper, exploring for every delicious drop.") + " She pulls off as you reach your second orgasm, letting your juices splatter her face. Despite your back-to-back orgasms, your pussy is aching for more of her tongue. You spread your lips for her, inviting her to dive back in. She brings a finger up and bops your [pc.clit] before wagging at it.");
		output("\n\n<i>“Hey, I’m the greedy pussy around here. You can have more, but you have to return the favor.”</i> She gets up before stepping back and lying down in front of you. She licks her lips while her hands lightly stroke her pricks. Given an invitation you can’t resist, you climb onto her and attempt to align yourself with her puffy puss. It’s easier said than done with her massive sack in the way. There’s no way you could keep her balls out of your way the whole time, so rather than trying you decide to just let them rest on your head while you work.");
	}
	else
	{
		output("\n\nShe pays particular attention to your [pc.cocks]," + (pc.hasCocks() ? " frenziedly jerking each of your lengths." : " rubbing your length raw.") + " You return the favor, taking your hand off of her tit and putting your full attention on her shafts. You stand there, stroking each other off until your pre has formed a small puddle on the ground. You can feel your [pc.balls] tense up, and her own shafts throb on the edge of release. Before you can get off, she stops stroking you and takes your hands off of her schlongs.");
		output("\n\n<i>“That’d be a pretty boring way to end things, wouldn’t it?”</i> She pants at you. <i>“I’ve got a better idea.”</i>");
		output("\n\nShe sinks down and takes your [pc.cockHead " + dick + "] in her mouth.You blow a wad of pre into her throat, your prick barreling toward the edge. She only sucks for a brief second before pulling off. She stays face to phallus with you, just watching you throb on the verge of release. She bops you with her nose, taking in your scent and catching another spurt of pre on her face.");
		output("\n\n<i>“Now for the fun part.”</i> She says as she springs up only to lay back down on her back a foot from you. She brings a finger up to her mouth and begins to fellate it while her other hand sinks into her folds. That’s all the invitation you need, and you lay down on her, [pc.cocks] in her face. It takes you a minute to navigate past her massive balls, but eventually you manage to find your way under them. There’s no way you could hold up her whole sack the entire session, so you decide to just let it flop down onto your head. Trapped between a sack and a soft place, there’s no better time to get to work.");
	}
		
	output("\n\nNow that you’re hot boxed in with it, there’s no ignoring the sheer potency of her pheromones. You feel like you’re in a broom closet with a troop of horny horse-morphs! A fresh surge of blood rockets to your [pc.crotch], engorging your offering to her as thanks for her ambrosial nethers.");
	output("\n\nYou reach forward and plant a kiss on her outer lips, marveling at how easily they deform. They’re so plush and warm. Combined with the heavenly taste of her juices, they remind you of a freshly baked pastry. Her pussy juice is sugary sweet, like a light frosting. The way it mixes with the slight salty tinge of her skin makes you bite down into her. You stop yourself before it gets too weird, and simply add the soft scrapings of your teeth across her vulva to your ministrations.");
	output("\n\nYou dive further into her, taking your proverbial first steps into her tunnel and also finding her chubby little clit. Well, it’s little compared to the rest of her. It’s the size of a jawbreaker, almost unnaturally fat for how short it is. You take a slight detour just to appreciate the pink ball, planting a series of quick kisses on it that prompt a moan from your lover as she gets to work.");

	if (pc.hasVagina())
	{
		output("\n\nYour pussy is gushing, aching to be filled. Your lavishing attentions on her are sending pangs of jealousy down south. You need her back inside you, why isn’t she doing anything!? Suddenly you feel your lower half being raised up, and a hard slap on your mons. You yelp in surprise, pleasure, and pain, looking back to see a very mischievous looking Shizuya.");
		output("\n\n<i>“Bet ya you’ll cum first!”</i> You’re a bit confused at her sudden competitiveness, but it doesn’t really matter. You just want to get off, and if that means taking some bet then you’ll gladly accept.");
		output("\n\n<i>“Alright, you’re on! Now just get on with it!”</i> You may have come off a little gruff, but you’re desperate and she seems to know that. She goes back to your snatch without another word.");
		output("\n\nShe lifts your box up to her face, giving herself unimpeded access to your lady bits. She dives her tongue back into your folds and your cunt pulls her in like a long lost lover. Her last cunt lashing left a hunger in your [pc.pussy " + vag + "] that she effortlessly fills again. Her pussy pleaser is big and long enough to reach the furthest depths of your honeypot. It scans your depths like a machine, pinpointing all of your sensitive spots and making sure they’re always stimulated. Her bottom lip presses into your [pc.clit], massaging it while her tongue works your insides.");
	}
	else
	{
		output("\n\nShe takes hold of your [pc.hips], lifts your bottom into the air, and slams" + (pc.hasCocks() ? " one of your" : " your") + " [pc.cocks] into her mouth. She takes you right down to the base in one stroke, rousing you from your nether exploration, and causing you to moan loudly in surprise. You scramble out from under her balls to see just what the hell she’s doing. She hoists your bottom up, taking your cock out of her mouth.");
		output("\n\n<i>“Normally I like to build on this, ya know. Take it slow before I really get going. But damn I don’t get eaten out enough! it’s fucking awesome! So you dig in there as hard as you want and we’ll see who cums first, ‘kay?”</i>");
		output("\n\nAs if you’d be able to hold back with pussy this good. You give her a quick nod and return to your succulent treat, eager for another taste. She nods happily and lifts you back up, this time restraining herself to just bench-pressing you in and out of her mouth. She raises and lowers you slowly, allowing her tongue to work along every inch of your shaft that’s in her mouth. Occasionally she’ll keep you at the peak of her lift and focus on pleasing your [pc.cockHead].");
		if (pc.hasCocks()) output(" She alternates between each of your dongs, determined to please all of them.");
		if (pc.balls > 0) output(" Some thrusts she guides your" + (pc.hasCocks() ? " dicks" : " dick") + " into her cleavage so she can focus on your [pc.balls]. She takes each orb into her mouth, giving them a heavenly tongue bath, causing your shafts to jump and glaze her melons with pre-cum.");
	}
	
	output("\n\nNot to be outdone, you drive yourself back into her puss and attack with renewed feroicty. You begin with her curious clit, giving the big button a few hard sucks and a nice tongue bath. That really sets her off, and a flood of sweet girlcum splatters against your face. You lick off the delicious nectar," + (pc.hasTongueFlag(GLOBAL.FLAG_PREHENSILE) ? " getting every last drop thanks to your flexible appendage." : " even bringing your hand up to gather the drops your tongue can’t reach.") + " You can’t get enough of this stuff! The lovely sweetness combined with the sheer density of her pheromones is driving you insane.");
	output("\n\nYou dive as deep into her flower as you can, her plush outer lips covering your cheeks as you bury your face in her muff. Your [pc.tongue] ventures deep into her folds, seeking out every drop of her sweet juices. Not that you need to look very far. Shizuya has the kind of over-productive sex that you usually only see on Ausar pornstars. Her nectar splashes out in lewd waves, each exploration of your tongue triggering another tide. As buried in her as you are, there’s nowhere else for that tide to go but into your mouth and onto your nose.");
	output("\n\nThe scent drives you even further into your stupor, fogging your mind until you can’t even remember what you were doing before. Wasn’t there a mission you were going on? Or were you always just here, in this beautiful vagina, drinking down its juices like a [pc.manWoman] in a desert drinks down the water of an oasis? Everything’s so blurry now it’s hard to tell. You’ll sort it all out afterward... hopefully.");

	if (pc.hasVagina())
	{
		output("\n\nHer balls are throbbing against your skull, sending the signal that she’s more than ready to climax. Her womanhood is incessantly tugging on your tongue as it climaxes explosively. You thought you were getting soaked before, now it feels like someone turned on a sprinkler while your face was next to it. Her pussy is climaxing indefinitely, driven on by the complementing sensations of her spraying cocks. Her orgasm hasn’t halted her own oral work, far from it. Her tongue is working even harder to get you off. She’s even added her own purring to the pleasure, using the heavy vibrations to turn her tongue into a makeshift vibrator.");
		output("\n\nYou moan out into her depths as your own [pc.pussy " + vag + "] starts to mirror hers. Your orgasms hit like a rockslide, one leading directly into the next, increasing intensity with each subsequent one.");
		if (pc.hasCock()) output(" Your [pc.cocks] go off as well. Caught between your bodies," + (pc.hasCocks() ? " they" : " it") + " soak both of you in [pc.cum], adding to the warm pool of her own ejaculate.");
		output(" You cling to her pussy for dear sanity, trying to distract yourself by putting all of your attention on eating her out. It doesn’t work.");
		output("\n\nInstead your mind drifts to vivid fantasies. You imagine yourself in much the same situation you’re in now, face deep in Shizuya’s pussy. Instead of laid on the floor of your ship, however, you find yourself servicing her in mid-coitus with one of many sluts she’s knocked up that day. Your fierce devotion to her pussy has earned you a special place in her harem, though. And you have your contingent of fucksluts at your command.");
		output("\n\nOne is busy eating out your own sex, getting a face full of the fresh load that your mistress had dumped into you just minutes ago. Another is cradling your overstuffed belly, savoring what is to be another addition to the growing brood.");
		if (pc.hasCock()) output(" The rest are gathered around your [pc.cocks], eagerly awaiting their turn to receive your seed. A chill runs up your spine as you taste your own [pc.cum] mixed with her juices.");
		output(" Truly this is paradise.");
		output("\n\nReality seeps back in, but the idle fantasies continue as a simmering undercurrent to your debauchery. The endless loop of pleasure you’ve found yourself in has numbed most of your senses. You hear nothing but the wet squelches of sex. You see nothing but the imprint of her vagina in your mind. You taste nothing but the sweetness of her juices. You smell nothing other than what can only be described as pure distilled sex.");
		output("\n\nYou feel nothing but pleasure, and even that fades as your mind shuts down from the sheer overload of it all, and you flop down uselessly.");
	}
	else
	{
		output("\n\nHer balls are pulsing, swelling against the back of your head, almost mirroring your own [pc.balls]. Her womanhood is going insane, trying as hard as it can to drag your tongue deeper inside. It’s milking you, desperate for fresh, virile cum despite knowing that your [pc.cock " + dick + "] is busy elsewhere. Through the fog of your mind you can feel her getting more aggressive on your length. She takes it down to the base, deepthroating you and letting her purring throat massage you. She’s vibrating so hard it feels like your prick is in a malfunctioning sex toy! The gyrations are so strong that you can feel them on your tongue. She sticks one of her fingers up your [pc.asshole], sending you flying over the edge.");
		if (pc.cumQ() < 8000)
		{
			output("\n\nYour [pc.balls] tighten as they unload in thick waves. It might just be your imagination, but you feel like you’re cumming more than you usually do. It doesn’t matter though. All that matters now is getting more delicious girlcum from her honeypot. Well, that and the incessant throbbing of her sack on your head as she unloads. No matter how much you even think you’re cumming, you’re no match for her. Even mired in her crotch as you are, you can feel the huge splashes of white drown your body.");
			output("\n\nHer balls are almost thrumming into your ears, sending sweet vibrations into your head. Your thoughts scatter into the deep haze of your mind, replaced by pure lust. You feel like a lone worshipper at the foot of a fertility goddess. Her balls are so productive that she could sire an entire generation by herself. Her pussy is so soft and inviting, and her hips are just made for birthing. Visions, vivid fantasies of being atop a massive throne with your goddess fill your mind. You’re surrounded by worshipful subjects with massively swollen bellies, thanking their goddess for her gifts. Her own stomach is swollen with your offspring, and you sit under her, fucking her ambrosial hole in an endless rut.");
			if (pc.hasVagina()) output(" Your own belly is swollen as well, just another offering to your idol of worship and her endless pleasure.");
			output("\n\nThe fantasy eventually fades back to reality, or at least what you can perceive of reality. But the feeling remains. The overpowering urge to breed and be bred. However, you’re in no position to do any breeding, and your body refuses to do anything but eat her out and fuck her face. So that’s exactly what you do. You rear your lower half up and begin to fuck her face as fast as your hips will carry you. Meanwhile, you redouble your efforts on eating her out, sawing your tongue in and out of her with the same frantic pace as your prick. You lose yourself to the rut, desperate to see at least some part of your fantasy come to life, even if you’re in no position to do so. Reality fades to nothing but fuck and rut, and soon blackness settles in on your senses.");
		}
		else
		{
			if (pc.cumQ() < 40000)
			{
				output("\n\nYour balls tighten as your urethra distends powerfully. Huge sprays of [pc.cum] hose their way into her gut. You fill her obscenely, but she somehow manages to keep it all down. Her gut is pushing hard against your [pc.belly], sloshing with your copious [pc.cumNoun]. Her own cock goes off, firing massive arcs into the air that rain down on both of your bodies. She keeps going too. The warm, frantic pulsations of her sack on your head and the warm flood washing over your body are only further numbing your already blurry thoughts.");
				output("\n\nThis is where you belong isn’t it? Helping big virile breeders relieve their lusts, and tending to their underused assets. Oh, maybe she’ll even let you knock her up while she’s plugging some slut! Your [pc.cock " + dick + "] rockets back to hardness at the thought, still dripping from your last orgasm. The thought of breeding her has your hips moving on their own, facefucking her as hard your hips will carry you. You desperately return to tonguefucking her, compelled by some voice at the back of your mind to fuck her hard even though there’s no way you could knock her up with your tongue. You don’t even care at this point. You’re stuck in a rut, looping in and out of orgasms, never seeming to run dry. Your world fades to nothing but pussy, cock, and endless orgasms, and you quickly lose track of time and even consciousness.");
			}
			else
			{
				output("\n\nThe muscles in your middle tense, your balls pull tight, and your urethra widens as far as possible to prepare for your flood. You fire off massive gouts of [pc.cum], bloating her stomach with just the first titanic pulse. The second shot fills her to the brim and spills out of her mouth. You’re not done yet, not even close. You keep hosing into her, each voluminous spray flowing out around your cock in geysers.");
				output("\n\nHer dick responds by firing its own fountaining shower of cum. Your pricks and hers are in some perverse competition. Every blast from you is followed by one from her, and the shots on both ends only seem to be getting bigger each time. Your orgasm is seemingly dragging on forever. The time between each individual orgasm is so short that it doesn’t even matter anymore. It’s out of your control. Your manhood is acting independent of whatever rationality you have left, which isn’t much. The throbbing of her sack on your head is sinking into your mind, blowing away any rational thought like depth charges.");
				output("\n\nAny ideas of the outside world are superseded by pure lust. It’s amazing how virile you two are isn’t it? You’re swimming in a pond of your mixed cum that come up so high that it’s spilling between your mouth and her sweet flower. Shit, between the two of you, you could sire an entire generation in a single orgasm.");
				output("\n\nFuck, that sounds hot! Wait, was that what you were doing? You were on a quest or something, that was probably it. Yeah, two virile studs fucking the universe into submission sounds like something you’d want. Maybe you’ll even knock up this slutty little cunt of hers. Unless you already did that. Did you? Fuck it, might as well make sure later. That’s where your thoughts end. You go back to eating out her honeypot that you’ve unwittingly addicted yourself to. You’re caught in a seemingly endless loop of eating out, sucking, being sucked, and orgasming over and over again. Reality and consciousness fades as your perceptions go black.");
			}
		}
	}

	pc.orgasm();
	
	addButton(0, "Next", shizzyPostSex);
}

public function shizzyDriverNephisLegacy(canleave:Boolean):void
{
	clearMenu();
	
	if (pc.hasVagina()) addButton(0, "Double Pen", shizzyTwoAndTwoAlwaysMakesFun);
	else addDisabledButton(0, "Double Pen", "Double Penetration", "You need more holes, cap.");
	if (InCollection(true, shizzyQualifyForDBLSTFF())) addButton(1, "Double Stuff", shizzyImNotATurkey);
	else addDisabledButton(1, "Double Stuff", "Double Stuffing", "You’ll need capacity for this one.");
	addButton(14, "Back", shizzySexyButtons, canleave);
}

public function shizzyTwoAndTwoAlwaysMakesFun():void
{
	clearMenu();
	clearOutput();
	showShizuya(true);
	
	output("You pull her in for a deep kiss, locking your lips together and tying your tongues like a pair of long lost lovers. Even her saliva is laced with her pheromones. You didn’t think you could ever get so aroused through just kissing, but here you are with your [pc.vaginas] soaking your thighs" + (pc.hasCock() ? " and your [pc.cocks] rock hard." : ".") + " You start to lead her, guiding her groping hands to strip you of your [pc.gear].");
	output("\n\nNow that you’re both fully nude, the real foreplay can begin. One of her hands jumps to your [pc.ass], giving your cheek a good slap before settling into kneading the soft flesh. Her other hand rockets to your crotch, cupping [pc.eachVagina], and going to work getting you ready.");
	output("\n\nInstinctively you reach down and grasp her animalic dongs.");
	output("\n\nYour insides jump as you feel their sheer girth. You can’t even get your hands all the way around them, and they seem to be growing oh so slightly thicker with each beat of her heart. You stroke her up and down, getting a good feel for the details of her shafts. The veins are as thick as your thumbs and pulse heavily, struggling, even with their size, to keep her monsters fed. Her flares are already almost an inch wider than the rest of her cockmeat, and your mind races with the thought of being plugged by the monstrous tips. And all along her shaft you can feel the cat-like nubs that line her hermhoods. They yield easily to your touch, firm enough to be easily felt, but soft enough to be pleasant and unobstructive.");
	output("\n\nYour mind drifts off to fantasies of taking her members. Not just one, oh no. You’ve got enough holes to go around, and you’re already far too gone to settle for anything less than both. You stay in your fantasies for a minute, jerking her off and feeling her grope you, wishing your fantasies were real. Your wits come back to you and you realize that your " + (silly ? "memes" : "dreams") + " don’t have to be dreams. You’re right here after all.");
	output("\n\nFeeling a tinge of embarrassment over that little bit of absent-mindedness, you break your kiss and step back. You look down her body and realize just how horny you made her. Her chest is heaving from the deep, lusty breaths she’s taking. Her breasts jiggle slightly with each heave, held down by their own immense weight and liquid cargo. Speaking of which, her white milk is spraying out of her puffy nips, quickly and diligently caught and spread across her massive tatas by her own groping hands. Her horse dongs are spraying pre like broken faucets, and you suddenly feel just how much of that got on your hands. They’re absolutely soaked! It looks like you submerged them in a pool for a few minutes, at least. Were you really jerking her for that long, or is she that productive?");
	output("\n\nBefore you can even think about that, the siren’s song of her musk catches back up with you. Without thinking, you press your soaked hands to your face, taking in the strong musk. Her cum is fragrant and near pure white despite the fact it’s only pre.");
	if (pc.isBimbo()) output(" You pout as you realize she’s on those stupid drugs. She could give you so many babies with cum this thick!");
	else output("\n\nYou’re glad she’s on sterilex, otherwise there would definitely be a surprise waiting for both of you after this. Then again, an increasingly loud part of your brain is really getting off on that idea...");
	output("\n\nSuddenly Shizuya is right on you, pressing those lovely lengths right into your [pc.chest]. <i>“Hey hon’, the tap’s right here if you want more.”</i> Her flares are pressed right to your face.");
	output("\n\nYour mouth waters at the idea of getting a taste, but a heavy throb down below reminds you of your other needs.");
	output("\n\n<i>“N-no, better idea!”</i> You stammer out before pushing her back again. You flop onto your back and spread your legs, pressing your hands into your [pc.vaginas] spreading" + (pc.hasVaginas() ? "them" : "it") + " open in invitation.");
	output("\n\nShizuya smirks and saunters up to your prone form, planting herself right in front of you and lifting your lower half up to level with her spears.");
	output("\n\n<i>“So, how do you want it?”</i> She asks, pressing her tips to your" + (pc.hasVaginas() ? "multiple entrances." : " flower and [pc.asshole]."));
	output("\n\n<i>“Both of them, just give me everything and don’t fucking stop!”</i> You probably shouldn’t say things like that, but your body really isn’t listening at this point, and frankly your mind isn’t that much more composed.");
	output("\n\nThe smirk on her face turns into a huge, cheshire grin at your request. She sets you down, reaches into one of her drawers and pulls out a large tube of lube.");
	if (kiroSexed()) output(" You recognize it as the same brand that Kiro uses, so at least you know it’s going to be effective.");
	output(" She squeezes out a huge glob into her hand, jerking it onto her cocks one at a time.");
	output("\n\nShe groans as a strong jet of pre shoots out over your [pc.belly], an act which only turns you on more, if that were even possible. When she’s fully lubed up, she hoists you back up and plants her tips back against your holes. She hammers against them like two battering rams sieging a castle gate. She steadily ups the force and tempo before giving one final shove to break down the last of your resistance and make room for her titanic girth.");
	output("\n\nShe shoves her lengths half way in on the first thrust, breaking the last vestiges of thought not devoted to your cock-lust. Empty Void, there’s so much! She’s not even moving yet and you feel completely overwhelmed. Your stomach bulges with the sheer amount of cockmeat lodged inside you, and you can actually make out the outline of her medial ring and head in your gut. You’re laying there, writhing, panting, moaning, barely able to process the sensations assaulting you. Meanwhile she’s just sitting there, taunting you with that huge grin and her unmoving hips, but you can tell she’s just as riled up as you.");
	output("\n\nHer eyes are glassy and unfocused, her breaths are getting deeper and deeper, and her whole body spasms every few seconds. You’re about to tell her to hurry up, but just as you open your mouth she yells out and pushes herself as far as she can into you. You scream out in ecstasy, caught completely off guard, every cell in your body screaming along with you.");
	output("\n\nShe doesn’t let up, either. She yanks herself out and forces herself back in just as quick as you feel her exit. She’s not even trying to hold back, rutting you like a wild animal at the height of its rut. And you love it! The thick pheromone soup you’re lying in, combined with how well she’s overloading your senses, have reduced you to a drooling, horny animal who can think of nothing but breeding with the virile beast you’ve found yourself with.");
	if (pc.hasCock()) output(" Even in her state she still gives you some courtesy, taking a hand away from hoisting you up to jerk off your [pc.cock], giving it the same frantic treatment she’s giving the rest of you.");
	output("\n\nYou cum uncontrollably, each orgasm cascading into another before the prior one even finishes.");
	if (pc.hasCock()) output(" Your upper half" + (pc.cumQ() < 8000 ? " is splattered with stray strands of" : ", and pretty much everything around you is covered in") + " your [pc.cum]. You go on for far longer than you usually do, your [pc.balls] spurred to insane production by your crippling lust.");
	output(" Your " + (pc.hasVaginas() ? "[pc.vaginas]" : "fuckholes") + " spasm around her intruding pillars, begging them for their copious fluids. She’s already delivering splendidly. Your middle is swelling slowly just from her pre. It’s only been a few minutes, you think, it’s hard to tell, but you look like you’ve gotten through a line of virile suitors.");
	output("\n\nYou begin to imagine yourself laid as you are now, but swollen with one in a line of litters that your alpha has put into you. She’s still fucking you, but much more gently, wouldn’t want to hurt the little ones after all. The fantasy shatters, however, when you feel yourself being lifted off the ground. She presses you to her chest, smashing your [pc.breasts] against her own colossal melons. Her tips are still spraying out their lactic cargo, drenching both of you and creating a small reservoir in the gap between your bodies.");
	if (pc.isLactating()) output(" Your own [pc.milkyNipples] join hers, adding your [pc.milk] to the flow she’s creating.");
	output("\n\nInstinctively you wrap yourself around her, bracing yourself for her renewed thrusting. Her lengths pulse heavily inside of you, just as eager to continue fucking you as you are to be fucked. Her flare is already stretching you beyond reason. The thick veins along her shaft hammer hard with each rapid beat of her heart, almost feeling like living vibrators lining her shafts. You cum again just from the sensation of her holding you like this. She smiles at your blissed out face as you continue to cum your brains out without her even trying. She goes in for a kiss and you eagerly accept. She kisses you long and deep, not out of affection or love, but out of possession. She owns you, and you’re happy to be owned, at least while you’re in the mire of her pheromones. This isn’t permanent... probably.");
	output("\n\nHer kiss ends, but she doesn’t move back. She keeps herself face to face with you, staring directly into your eyes. The closeness is intoxicating, and you stare back into her red and green eyes, unable to avert yours even as she readies up to continue your lovemaking.");
	output("\n\nYou moan out as you feel her rods retract, getting in position to piston into you once more. You ready for another wild ride, only to find her taking a much more methodical pace. Her first thrust is quick and gets her bottomed out inside you, her flares pressing softly against your");
	if (pc.hasVaginas()) output(" cervixes, teasing them with a blast of her thick pre, but not slamming into them.");
	else output(" cervix, teasing it with a blast of her thick pre, but not slamming into it.");
	output("\n\nShe pulls out slowly, letting you savor how the soft spines on her cocks brush into your most sensitive spots. Her next thrust is as quick as her first, and the cycle continues. The slow, loving fuck is in such contrast to her previous pace that, despite the long period between, it registers in your weakened mind like whiplash. Your body is a hot, limp noodle right now, to the point where she has to hastily catch you as you begin to flop backwards. She settles your head in the valley of her cleavage and yours, giving you a kiss and assuring you that you don’t need to do anything at this point.");
	output("\n\nYou don’t know how long she fucks you before she cums. All you know is the telltale signs of her orgasm. Her thrusts become shorter and more frantic as her inseminators swell past their already monstrous thickness. Her urethras distends as massive gouts of cum work their way up her shafts, their ascent slowed by the sheer tightness of your holes.");
	output("\n\nThe blissful seconds before she blows seem to stretch on for hours, your body tensing up in preparation. But no amount of preparation could get you ready for the inhuman volume of her orgasm. The first shot fills your");
	if (pc.isPregnant()) output(" stomach and washes out of your vaginal passage after meeting with your closed-off" + (pc.hasVaginas() ? "wombs." : " womb."));
	else output((pc.hasVaginas() ? " wombs" : " womb and stomach") + " to the brim with thick, virile cum.");
	output(" Your body jolts back to life at the sensation, experiencing an orgasm so powerful that your vision starts going white. You start bouncing on her cocks as her second blast overfills you and starts to flow out, creating a small pool at your [pc.feet].");
	output("\n\nYour second wind hit you like a freight train, and you find yourself taking charge, demanding more cum even as her orgasm pumps you to looking like you’re about to give birth to triplets.");
	output("\n\nYou ride her until her legs give out and she drops to her back. She’s more than happy to just let you work, reaching up and grabbing your [pc.breasts] to spur you on.");
	output("\n\nTime becomes meaningless as you fuck. Minutes fade into hours, who knows, hours might even fade into days. Your mind only knows the rut of the situation, how to fuck and be bred over and over again. You don’t know when you finally pass out, but at some point your vision goes dark for some time, and you wake up slumped over her, limply.");
		
	addButton(0, "Next", shizzyPostSex);
}

public function shizzyQualifyForDBLSTFF():Array
{
	var butt:Boolean = false;
	var vag:Boolean = false;
	if (pc.hasPerk("Buttslut")) butt = true;
	if (pc.analCapacity() > 2*chars["SHIZUYA"].biggestCockVolume()) butt = true;
	if (pc.cuntThatFits(800) != -1) vag = true;

	return [vag, butt];
}

public function shizzyImNotATurkey(mode:int = -1):void
{
	clearMenu();
	clearOutput();
	showShizuya(true);
	
	var can:Array = shizzyQualifyForDBLSTFF();
	var vag:int = pc.cuntThatFits(2*chars["SHIZUYA"].biggestCockVolume());
	var anal:Boolean = (mode == 2);
		
	//If GroundCombatContainer can do it...
	if (flags["TIMES_BUTT_TEASED"] == undefined) flags["TIMES_BUTT_TEASED"] = 0;
	if (flags["TIMES_HIPS_TEASED"] == undefined) flags["TIMES_HIPS_TEASED"] = 0;
	
	if (mode == -1)
	{
		if (pc.hasPerk("Buttslut")) anal = true;
		else
		{
			output("How do you let her take you?");
			if (can[1]) addButton(0, "Ass", shizzyImNotATurkey, 2);
			else addDisabledButton(0, "Ass");
			if (can[0]) addButton(1, "Vagina", shizzyImNotATurkey, 1);
			else addDisabledButton(1, "Vagina");
			return;
		}
	}
	
	if (pc.hasPerk("Buttslut") || (pc.isTreated() && pc.isBimbo()))
	{
		output("Something inside of you snaps as you behold the twin monoliths that she’s sporting. A wave of lust tears its way through your body, concentrating in your " + (anal ? "[pc.ass]." : "[pc.vagina].") + " Feelings and memories flow back into you as though you were a barrel at the base of a waterfall. Feelings of lust and submission, memories of being thoroughly fucked and wanting. You recognize it for what it is,");
		if (pc.hasPerk("Buttslut")) output(" it’s the Buttslutinator’s programing, and it’s going crazy at the sight of such thick dominators.");
		else output(" it’s the Treatment, overloading your mind with lust in response to the strange pheromones she’s letting out.");
		output("\n\nYou stand there, muttering and drooling while you process all of your lust.");
		
		if (flags["SHIZZY_STUFFED"] == undefined) 
		{
			output(" Shizuya looks almost scared at how you’re acting, though her huge horse cocks throb heavily as you ogle them. <i>“Cap, you okay? You don’t look so good, maybe we should stop.”</i>");
			output("\n\nStop? NO, you need her now! You throw off your [pc.gear] and rush her down, pressing youself against her and pleading that she promised to fuck you! She gives in fairly quickly when she realizes that you’re really all-in on this, letting out a worried, but lust-laced, sigh.");
		}
		else
		{
			output("\n\nShizuya understands exactly what you want, and spreads her legs with a chesire grin as her eyes turn a deep red.");
			output("\n\n<i>“Lookin’ for another fix my little addict? I bet you just can’t get enough of having that sweet hole of yours stretched to the breaking point. I sure can’t. Seeing you bloat out like that is just magical. Now come here, and let’s get started.”</i> Memories of your last time doing this flood back into you. Fuck, you need that again! You throw off your [pc.gear] and rush her down, murmuring worshipful pleads for another round.");
		}
		
		output("\n\nYou fondle her kittyquine shafts, getting a mental map of every bump and vein that’s going to be inside you. You cup her balls, admiring the heft and volume. She gives out a moan and her dongs jump, spilling out her copious precum. Seeing that you’re missing out on precious cum, you dive onto one of her rods, stretching your jaw to its limit just to get a sweet taste of her cum. It’s so good! Even if it’s just pre, it’s still thicker and muskier than most people you’ve <i>“met”</i>.");
		output("\n\nOh no, you forgot her other cock! There’s no way you can get all of this delicious cum with just your mouth. You pull off in a hurry and bend over, spreading your " + (anal ? "[pc.ass]" : "[pc.vagina]") + " in order to entice her. All that delicious cum can’t go to waste if it’s in your" + (anal ? " ass!" : " honeypot!"));
		output("\n\n<i>“Alright, that’s the spirit! How do ya want it?”</i> She says grabbing one of her rods.");
		output("\n\n<i>“Both! Give me both, and don’t fucking hold back!”</i> You scream out.");

		if (flags["SHIZZY_STUFFED"] == undefined) 
		{
			output("\n\nHer face goes pale at the suggestion, but her body moves into position anyway. <i>“I-I just, ya know, are ya sure?”</i> She says, pulling out a massive tub of lube.");
			output("\n\n<i>“STOP WHINING AND FUCK ME!”</i>");
			output("\n\nYou can’t take this any more! You watch in rapture as she shakily applies the lube.");
		}
		else
		{
			output("\n\nShe chuckles at the suggestion as she moves into position.");
			output("\n\n<i>“Yeeeeeeah, you can’t get enough.”</i> She firmly grabs your [pc.ass], aggressively kneading your flesh as she brings her cocks into position.");
		} 
		output(" Her flares come close enough to your " + (anal ? "pucker" : "pussy") + " that the stray shots of pre she’s shooting out pool in your hole. You eagerly reach back to lube yourself with her love-juices, shoveling it up with your fingers and then fingering it as deep as you can.");
		
		output("\n\nYour show works well in getting her ready as well.");
		if (flags["SHIZZY_STUFFED"] == undefined) output(" She’s long since run out of extra lube to spread and is just jerking herself off at this point, splattering even heavier gouts of pre onto your " + (anal ? "[pc.ass]." : "[pc.vagina]."));
		else output(" She’s jerking herself off vigorously, lubing herself with the massive amount of pre that she’s squirting out.");
		output(" Void, there’s so much!");
		output("\n\nYou’re already slicked up enough for a day-long orgy, and there’s still so much more. You use the rest to oil up your cheeks, giving yourself a nice shine.");
		if (flags["SHIZZY_STUFFED"] == undefined) output("\n\n<i>“F-fuck, don’t even need the lube do I? Gaaaah, cap, why do you drive me so crazy?!”</i>");
		else 
		{
			output("\n\n<i>“Oh yeah! FuckfuckfuckFUCK! There’s something about you [pc.name], something about the way you beg that just sends me over the fuckin’ edge!");
			if (!anal) output(" Oooooh, I wanna stop taking my Sterilex! I wanna make you my fuckin’ brood bitch! Knock you up over and over and over and over until you’re just the perfect little breeding hole! Gah-ah!”</i> You swoon as you feel an otherworldly gob of cum splatter your backside. <i>“Sweet fuck!} I love you, you fucking sexy slut! And I’m gonna fuck ya like you deserve!”</i>");
		}
		
		output("\n\nYou give yourself a couple of slaps before slamming yourself against her rods, demanding that she ravage you.");
		if (flags["SHIZZY_STUFFED"] == undefined) output("\n\n<i>“Okay, okay, settle down!”</i> She grabs both of her dicks and presses one of them against your " + (anal ? "[pc.ass]." : "[pc.vagina].") + " <i>“This is such a bad idea...”</i> She mumbles under her breath before pressing forward.");
		else output("\n\n<i>“Not yet, it’ll be so much better if ya work for it.”</i> She grabs both of her dicks and presses one of them against your " + (anal ? "[pc.ass]." : "[pc.vagina].") + " <i>“I’ll never get tired of this...”</i> She mumbles under her breath before pressing forward.");
	}
	else
	{
		output("A wicked idea crosses your mind, one that’s probably not going to end super great, but whatever.");
		if (pc.isNude())
		{
			output(" You’re already naked, so you decide to get right to the teasing.");
			if (flags["TIMES_HIPS_TEASED"] < 20) output(" You shake your [pc.hips] haphazardly, trying poorly to imitate a belly-dancing routine you saw a while back. She giggles, but still seems taken in by your amateur display.");
			else if (flags["TIMES_HIPS_TEASED"] < 60) output(" You won’t be getting any awards for your dancing, but you’d probably make decent tips, and Shizuya definitely doesn’t seem that picky.");
			else output(" You shake your [pc.hips] with the expertise of a seasoned belly-dancer. All that practice you’ve had really pays off as Shizuya becomes enraptured in your display.");
			output(" You turn around and hike your [pc.ass] toward her, giving it a few shakes as you look invitingly at her.		");
		}
		else
		{
			output(" You start to strip off your [pc.armor], making a show out of exposing yourself to her. You shake your [pc.hips] as you shimmy out of your clothes,");
			if (flags["TIMES_HIPS_TEASED"] < 20) output(" not doing a very good job, and almost tripping over yourself.");
			else if (flags["TIMES_HIPS_TEASED"] < 60) output(" doing, what you’d consider to be a serviceable job putting on a show for her.");
			else output(" putting on a show that would turn heads at even the best strip clubs.");
			output(" As the offending clothing falls to the ground, you turn around and hike up your [pc.ass] to her, looking at her with a longing stare.");
		}
	}
		
	output("\n\nShe takes the hint and saunters up to you, shafts bobbing in the air, but never knocking into each other, you imagine she has to practice walking with erections a lot. She reaches you in short order, and slaps her hands on your [pc.hips]. You yelp at the shock, but quickly start moaning as her hands work their way up your sides. She’s really good at this! Her hands caress and squeeze you with the precision of a veteran masseuse.");
	output("\n\nBlood rockets to your [pc.crotch] from her attentions, getting you even more ready for what’s coming.");

	if (pc.hasLowerGarment()) output("\n\nShe hooks her fingers into your [pc.lowerUndergarment] and begins sliding it down. She plants a kiss on your [pc.ass] as your garment slips out of the way. Your underwear fall around your feet as she finishes undressing you. She even helps you step over them, and puts them off to the side, so ladylike!");
	else 
	{
		output("\n\nShe grabs hold of your [pc.ass] groping and massaging your cheeks with the same expertise she put on your sides. Her fingers move to your genitals, one massaging the rim of your [pc.asshole] and");
		if (pc.hasGenitals())
		{
			var buffer:Array = [];
			if (pc.hasVagina()) buffer.push(" the other thumbing your [pc.clit].");
			if (pc.hasCock()) buffer.push(" the other tracing the cumvein of your [pc.cock].");
			output(RandomInCollection(buffer));
		}
		else output(" the other massaging the sensitive skin of your bare crotch.");
	}
	
	output("\n\nShe moves to your top next");
	if (pc.hasUpperGarment()) output(" yanking down your [pc.upperGarment] and" + (pc.hasBreasts() ? " freeing your [pc.breasts]." : " exposing your [pc.chest]."));
	else output(" groping and squeezing your [pc.chest].");
	if (pc.tallness < 8*12) output(" She threads her arms under yours and" + (pc.hasBreasts() ? " under your [pc.breasts]" : " around your [pc.chest]") + ", and hoists up your smaller frame with ease.");
	else output(" You’re tall enough that she can line herself up with you without having to worry about boosting you up.");
	output(" Her rods rear up on your rear, hotdogging your [pc.ass], and spraying pre all across your back. Her mouth closes in on your neck, and you can feel how almost blisteringly hot her breath is. She bites down gently, making you moan out loud at how thoroughly she’s turning you on. She lifts her head to your ear and whispers <i>“How do ya want me?”</i> You tell that you want it in your" + (anal ? " [pc.ass]" : " [pc.vagina " + vag + "]") + "... both of them. She freezes up at that suggestion.");

	if (flags["SHIZZY_STUFFED"] == undefined) 
	{
		output("\n\nYou turn your head to see her completely wide-eyed, mouth slightly agape. You wave a hand in front of her and get no response. You start to get a little worried, but a few seconds later she blinks and starts to stammer something out.");
		output("\n\n<i>“U-umm, are y-you sure? Cause I’ve tried that, never worked out too well.”</i> She visibly shudders, probably thinking about some case where this sort of thing went wrong. You assure her that you’re plenty flexible, and have been itching to really stretch yourself. Her hermhoods jump at that suggestion, hitting you in the back of the head with what feels like a pint of pre. The look of worry on her face remains, though. Another devious thought crosses your mind as you press your [pc.ass] against her dongs, massaging them up and down with your cheeks. The worried look fades as her eyes start to unfocus. You look back at her and whisper.");
		output("\n\n<i>“You know you want it as much as I do.”</i>");
		output("\n\n<i>“F-fi-fi-FUCK, OKAY!”</i> She bellows as she lightly shoves you off of her. <i>“J-just let me get some damn lube. If this goes wrong, don’t get pissed at me, ‘kay?”</i>");

		output("\n\nThat’s fine with you, you assure her as you lie down. You lie on your [pc.chest],");
		if (pc.biggestTitSize() < 6) output(" pressing your pecs against the floor,");
		else if (pc.biggestTitSize() < 8) output(" your tits squeezing against the floor,");
		else output(" your big tits lifting you off the floor a bit,");
		output(" [pc.ass] raised in the air. The show certainly gets her attention, she can barely keep her eyes off of you as she applies her lube. Her application turns to jerking herself off as you begin to shake your rump at her.");
		if (flags["TIMES_BUTT_TEASED"] < 20) output(" You’re not very good at it, but she doesn’t seem to mind.");
		else if (flags["TIMES_BUTT_TEASED"] < 60) output(" You shake it in a way many would describe as ‘hot’. You wouldn’t turn heads at a club, but you’re definitely doing well.");
		else output(" You bounce that booty like a champ, giving her a show most people would have to pay top dollar for.");
		output(" She finally finishes and grabs your [pc.hips], jamming against her crotch, battering one of her flares against your" + (anal ? " [pc.ass]." : " [pc.vagina " + vag + "]."))

		output("\n\n<i>“You can always back out of taking both, ya know.”</i> Like you’d do that, you’re in this for the long run. <i>“Suit yourself.”</i> She sighs as she lines up her flare and presses it in.");
	}
	else
	{
		output("\n\nYou look back and see her with her eyes closed, breathing heavily as she slowly jerks off her monsterous cocks.");
		output("\n\n<i>“Ooooooh, I was hoping you’d say that.”</i> Her eyes open again, and you can clearly see the dark red color they’ve taken on. She grabs you by the [pc.ass] and guides you to give her an assjob, and you comply.");
		if (flags["TIMES_BUTT_TEASED"] < 20) output(" You’re not particularly skilled at this, but she doesn’t seem to mind if the groans and showers of pre on your back are any indication.");
		else if (flags["TIMES_BUTT_TEASED"] < 60) output(" There’s more of a learning curve to this than you anticipated, but you manage to get by with only a few slip-ups.");
		else output(" You bounce like a champ, feeling her cocks throb as you expertly jerk them with your backside.\n\n<i>“Yeeeeah, right there! Fuck, you could get rich off this ass.”</i> Huge drops of pre rain down as you coax more out of her.");

		output("\n\nYour ministrations really get her going, and you soon find yourself pushed forward, and with two massive flares pressed against your" + (anal ? " [pc.ass]." : " [pc.vagina " + vag + "].") + " You wonder if she’s going to start without lube, but you quickly get an answer to that as you feel a gush of near-scalding wetness shoot into you. She’s jerking herself off, using the raging fire you’ve stoked in her to drive her production into overdrive, and hose you with excess fluid that’s probably more fertile than any normal person’s real cum.");
		output("\n\n<i>“Fuuuuck, don’t need lube anymore when you do this to me!”</i> Her hands grasp your [pc.hips] and you feel her press in.");
	}

	addButton(0, "Next", shizzyStuffingCommence, anal);
}

public function shizzyStuffingCommence(anal:Boolean):void
{
	clearMenu();
	clearOutput();
	showShizuya(true);
	
	var vag:int = pc.cuntThatFits(2*chars["SHIZUYA"].biggestCockVolume());

	output("The first push blows right past your defenses, lodging a good few inches of massively thick animal-cock inside you. She doesn’t go further, instead sticking at the same depth and stirring around your insides. She pulls out after a few seconds before pushing back in, this time cramming a few more inches in your" + (anal ? " [pc.ass]." : " [pc.vagina " + vag + "]."));
	output("\n\nThis is maddening, you asked to be fucked, and all she’s doing is teasing you!");
	if (!anal) output(" If it weren’t bad enough already, some of her spines seem to have taken a liking to your [pc.clit], and rub against it every time she settles in.");
	output(" You beg her to get on with it, but get a hard slap in response. A few more follow, sending your [pc.ass] jiggling and turning your cheeks red.");
	output("\n\n<i>“Look here, with this kind a’ shit I have to make sure I’m not breaking anything. So stop whining and let me work this. ‘Kay?’”</i> You grumble under your breath and submit to her teasing. <i>“Beggars can’t be choosers, cap.”</i> Yeah, yeah...");
	output("\n\nHer next thrust buries almost half of her length inside you. Void, that’s a lot! It’s hard to think of many partners you’ve had that have been this huge. It’s hard to think in general, now that you mention it. You’re stuffed with so much cock, but all your ravenous" + (anal ? " [pc.ass]" : " [pc.vagina " + vag + "]") + " can do is squeeze as hard as it can and demand more.");
	output("\n\nHer other prick has settled into the crack of your [pc.ass], hotdogging you while its brother plows you. You feel shotgun blasts of thick pre land all over your back and [pc.hair]. The thick deluge spills over onto your face, dripping down past your nose, where you get a full blast of her musk. Up until now her pheromones have been acting as an undercurrent, not-so-subtly turbocharging your desires, but this is on a completely different level. It’s like her pheromones have condensed down into a super-concentrated liquid. You start going light-headed as the drops turn into small streams.");
	output("\n\nYou start licking the cum off your face as it comes down, partially to help spare your senses of the sexual overload she’s imposed on you, but mostly because it just tastes really good!" + (pc.hasPerk("Buttslut") || (pc.isBimbo() && pc.isTreated()) ? " It’s even better than before, so much thicker and richer. Maybe it gets better the more you turn her on? Oh Void, you can’t even imagine how good it’s going to taste when she’s actually cumming!" : " You can’t even really place why it’s so good, it’s like liquid sex is drowning each of your taste buds, causing them to orgasm endlessly. You don’t think you’ve ever understood how someone could say they were cumming from their mouth until now."));
	output("\n\nWhile you think about that, you suddenly feel Shizuya pull out completely, leaving your" + (anal ? " [pc.ass]" : " [pc.vagina " + vag + "]") + " gaping and aching for more. You look back at her to see a very shaken Shizuya. She’s coated in sweat, panting heavily, unable to tear her focus away from your backside, with a manic look in her eyes. Every muscle in her body seems tensed, especially her twinned hermhoods. The veins on her red destroyers are so swollen and pulsating that they look like they’re about to burst, and her flare is as wide as you’ve ever seen one, thickening even further every time she lances out what looks like another gallon of pre.");
	output("\n\nA moment of clarity comes to you as you reach down and cradle your [pc.belly]. Oh fuck, she hasn’t even cum yet and you already look like you’re at least six months pregnant! Between her obscene amount of cum, and the heavy state of rut she’s desperately trying to hold back, you finally start to have second thoughts about this. Too late for that, though, as Shizuya lets out a feral roar that shakes the hull of the ship, grasping you by the [pc.hips] and forcing you down to the ground.");

	output("\n\nShe grabs both of her shafts in a bundle and starts to ram them against your" + (anal ? " [pc.ass]." : " [pc.vagina " + vag + "]."));
	if (anal)
	{
		output(" Your poor [pc.asshole] is being absolutely tenderized, every hit against your ring sends volleys of pain and pleasure surging throughout your body, robbing your limbs of sensation. ");
		if (pc.ass.wetness() > 2) output(" She stops for a second when she sees your pucker lubricating itself, she looks frightened that she might have hurt you. You manage to sputter out enough of an explanation that she realizes that your backdoor self-lubricates. She looks more than relieved at that revelation, in fact she looks downright giddy, and resumes her previous pounding at an even faster pace.");
	}
	else
	{
		output(" Her ceaseless battering on your box is driving you even more insane. Every smack from her lower shaft rams straight into your [pc.clit], sending shocks of conflicting pain and pleasure that rob your body of any remaining will to fight back.");
		if (pc.vaginas[vag].wetness() >5) output(" Your box is completely soaking itself at the sensation, sending small explosions of [pc.girlCum] flying every time she bats your cunt.");
	}

	output("\n\nEventually she manages to weaken your entrance enough to slip her compressed tips into you. You moan out loud at being so utterly filled, and she’s barely inside of you yet! You cum on the spot, having been just a hair away for the past several minutes.");
	if (anal) output(" Your [pc.asshole] panics at the sudden intrusion and squeezes down in order to halt their advance, but with your slacked muscles, only manages to spur them on.");
	else output(" Your [pc.vagina " + vag + "] squeezes her with all of the force you can muster, not trying to push her out or keep her in place, but instead rippling inward to try and get her into optimal mating position.");
	if (pc.hasCock()) output(" Your unused [pc.cocks] " + (pc.hasCocks() ? "unload" : "unloads") + " as well. Pressed between your body and the floor, all " + (pc.hasCocks() ? "they" : "it") + " can do is soak you uselessly.");
	output(" You use what little faculties you have left to brace yourself for a real pounding, but are instead met with her gently cradling herself around you. You feel the familiar sensation of her hot breath near your ear as she has you pinned to the ground.");

	if (flags["SHIZZY_STUFFED"] == undefined) output("\n\n<i>“I guess we’re too deep into this to not go all the way. Let’s just ease into it.”</i>");
	else output("\n\n<i>“Just a bit longer now; gotta ease you in before we get to the main event.”</i>");
	output(" She seems determined to keep this agonizing pace for a while longer, but you’re not in any position to dictate otherwise; a nice, slow fuck to savor this is probably for the best anyway. She bites down gently on the base of your neck as she begins to saw her flares inside you.");
	output("\n\nShe starts purring too, and with her size and the way she’s wrapped so tightly around you, it’s almost like being in a massage chair that’s also fucking your " + (anal ? "[pc.ass]" : "[pc.vagina " + vag + "]") + " with ungodly thick cocks... that are also vibrating. It’s less powerful than her upper body, but with how stirred up and sensitive you are, it’s more than enough to push you over the edge again, and you cream yourself submissively.");
	output("\n\nShe spends the next few minutes sawing her first few inches in and out of you, advancing by mere millimeters with each time she pushes back in. Despite her shallow thrusts, you feel like several people are bottoming out inside you with each one. She’s so fucking thick! Her flares must be almost seven inches across by this point, so thick that no amount of lube could give them enough space to occupy the same point inside you. By the time she crams almost six inches in you, her heads have been forced apart, one much farther in you than its brother. The loss of sync creates two distinct points of friction, rather than the monolith of sensation from before.");
	output("\n\nSuddenly you feel yourself being hoisted up as Shizuya drags you up onto her lap, impaling you on just over a foot of horsecock. Her arms grasp your [pc.ass] as she begins lifting you before slamming you down on her meat. You yell out in confused pleasure, fourteen inches of double thick animal dick stuffed in your " + (anal ? "gut." : "tunnel.") + " She holds you there for a second, letting you get used to her, while increasing the intensity of her purring in order to keep you stimulated. You cum all over her,");
	if (anal) output(" squeezing uselessly around her lengths, barely able to hold her with your overloaded muscles.");
	else output(" soaking her lap with an ever thickening stream of [pc.girlCum].");
	output("\n\nThe pattern continues, getting slammed down on her crotch, taking an extra inch of dick each time, then being held down while you cum your brains out, before being slowly dragged back up for another round. Eventually you can take no more, and she bottoms out. Something’s wrong: she’s stopped dead, and her hands are twitching and squeezing you even harder. With the lapse in sensation you’re able to concentrate enough to look back and see. Something’s definitely changed in her expression, like all the sense has drained away from her, leaving a rutting beast.");
	output("\n\n<i>“AAAAGGGHHH, FUCKFUCKFUCKFUCK!”</i> She screams in lust-induced madness as her body springs back to life. You yelp as she lifts you back to the peak of her cocks with a rutting determination.");
	output("\n\n<i>“I-I-I’m s-sorr... GRAAAAHH!”</i> Her words turn to feral growls as she slams you back down. You don’t even get a chance to savor it this time, she pulls you back up before you even know where you are on her shafts. The pace becomes insane, every muscle in her body seemingly going into overdrive as yours turn to mush. You’re turned into a living onahole, pistoned up and down on her hermhoods with no regard for your own pleasure. That’s not to say you aren’t getting off - you’re locked in an almost constant state of orgasm, mind broken down to mush.");
	
	output("\n\nReality starts to fade as your eyelids droop along with the rest of your body. As the world before you fades, another materializes in its place. You find yourself in a pleasure palace, surrounded by rich tapestry, glittering gold, soft pillows, and even softer sluts. You recognize all of them, they’re your friends");
	if ((anal && !pc.ass.hymen) || (!anal && !pc.vaginas[vag].hymen)) output(", your lovers");
	output(", all the people you know and love have come to join you in reverence to your new alpha. The beautiful beast has you in the same position as in reality,");
	if (anal)
	{
		if (pc.hasVagina()) output(" only now you find yourself swollen with her immense brood, your massive, kicking belly so large that it immobilizes you.");
		else output(" still bouncing along on her pricks, silently begging her to fill you.");
	}
	else output(" only now she’s shifted focus to your ass, as to not harm her brood that, thanks to her amazing virility, has swollen you to the point of immobilization.");
	output(" You see the gathered masses around you groaning out in rapture. Rubbing their swollen bellies, enjoying each other’s bodies, or making sure you and your mistress are well served.");

	output("\n\nYou feel like you could disappear in the bliss of your fantasies, and you almost do. You’re broken out, however, when Shizuya lets out a loud, lusty shriek. You snap back to reality and hurriedly look over your shoulder. You see Shizuya spacing out, her tongue lolling out of her mouth as you feel her body twitching more intensely. Prying your head downward you see something shocking: her balls are growing. They’re certainly not ‘nuki nuts, but they’ve noticeably swollen since you’ve last been able to focus on them. They’re pulsing and tightening, getting ready to release what’s certainly going to be a biblical load.");
	output("\n\nYour stomach is already overflowing just from her pre, the flow having thickened considerably from her overloading balls. Her dongs fill out inside you, massive amounts of blood engorging them beyond reason. You look down to see her urethra’s distend massively, sending baseball-sized bulges up the bottom of her shafts. The bulges catch at the entrance of your " + (anal ? " [pc.ass]" : " [pc.vagina " + vag + "]") + ", growing even fatter as they back up. You’re horrified at what’s about to happen, but your body refuses to move. You feel the molasses thick liquid start to seep through, and you accept your fate.");
	output("\n\nTitanic gouts of sizzling hot cum flood into your " + (anal ? "rear" : " womb") + ", forcing out the pools of pre that already occupied your insides, and replacing their already thick liquid mass with something that feels closer to a light pudding. Your lower half has turned into a constant jet of thick, white fluid, since every conceivable place that could be filled in you is well filled in seconds. It’s long since stopped being about stuffing you, and more about just making you feel owned, and demonstrating the monstrous woman’s godly (or devil-like) virility.");
	output("\n\nAfter a few minutes (though it feels like hours to your numb mind), Shizuya falls back, pulling you back onto the bed and slipping her cock out of you. You marvel through blurry eyes as her streams shoot out with enough force to hit the ceiling. The resulting rain drenches the both of you as she continues to shoot out. As she starts to slow down, you hear a beep and see several drones come out of the walls. They quickly start to vacuum up the mess that you two have made. You think it’s over, but suddenly you feel a pair of hands press down on your [pc.belly], causing pressurized streams of cum blast out of you onto the floor, where they’re swiftly cleaned up.");
	output("\n\nYou pass out completely from the effort, waking up nebula knows how long after.");

	IncrementFlag("SHIZZY_STUFFED");
	
	pc.orgasm();
	if (anal) pc.loadInAss(chars["SHIZUYA"]);
	else pc.loadInCunt(chars["SHIZUYA"]);
		
	addButton(0, "Next", shizzyPostRoughSex, 240);
}

public function shizzyPostSex():void
{
	clearOutput();
	showShizuya(true);
	
	processTime(60);
		
	output("You groan as you recover from your intense session with Shizuya. You pant heavily as her warm, purring body soothes your aches away. It isn’t long before you feel your strength come back to you. You pry yourself away from her, hearing her whine softly as you do.");
	output("\n\n<i>“Mmmm, alright babe. Just come back whenever ya need another roll in the kitty sack.”</i> She stays in bed, moaning softly as she starts to grope herself, probably trying to entice you into another round. But you have places to go, and you" + (pc.isNude() ? " head out." : " put on your [pc.gear] and head out."));
	
	IncrementFlag("SHIZZY_SEXED");
	
	addButton(0, "Next", majinLeave, false);
}

public function shizzyPostRoughSex(time:int = 240):void
{
	clearMenu();
	clearOutput();
	showShizuya(true);
	
	processTime(time);
	
	output("You’re sore all over, but somehow it still feels <i>good</i>. The cloud of her pheromones still hangs over you like a lead weight, dragging down every sense you have except pure pleasure. Shizuya curls around you possessively; she owns you, at least for the moment, and you can feel that. The way her giant, furred arms curl around you make you feel like a precious possession, something to be used to its owner’s content, but never harmed or abused. You feel her almost singeing hot breath on your neck as she begins to speak.");
	if (flags["SHIZZY_BEEN_ROUGH"] == undefined) output("\n\n<i>“I’m sorry if that was... unexpected. If ya don’t like this side of me, don’t worry, I won’t make you do anything. But if you want to come back, I promise I’ll never hurt you.”</i>");
	else if (flags["SHIZZY_BEEN_ROUGH"] == 1) output("\n\n<i>“You came back. I suppose this is fine with you, then?”</i> You groan and nod submissively. <i>“Good. I don’t show this side to many people, ya know. You won’t regret this, I promise.”</i>");
	else output("\n\n<i>“You’re magical, ya know that? I feel like I can go all out and you can just take it. Just a good little sub.”</i>");
	output(" She works her hands around your body, her magmatic heat and heavy purring soothes away any lingering pains for your intense session. Soon you shift to a sitting position, her cradling you in her lap as she pets you. Her tails wrap around her and you like a safety belt. You feel like a loved pet, and that’s fine.");
	output("\n\nEventually she releases you, and you stand on shaky [pc.feet].");
	if (pc.isNude()) output("\n\nShe roughly grabs your [pc.ass] as she remembers that you came in here naked. <i>“Naughty [pc.boyGirl], coming into my ship naked. I love it.”</i>");
	else output("\n\nShe helps you put back on your discarded [pc.gear]. <i>“Ya look better nude, but business requires some modesty, sadly.”</i>");
	output(" She plants a big kiss on your [pc.lips], locking her tongue with yours for a solid minute. Your head reels when she lets go, still overcome by the swamp of passion her room has turned into. <i>“You should get goin’, big shot like you’s got things to do.”</i> She’s right. You leave the room, getting one last kiss blown at you as you reach the doorway.");
	output("\n\nStepping out finally lets you clear your head. That was intense, and fuck, has it been that long? You’d better get moving.");

	IncrementFlag("SHIZZY_BEEN_ROUGH");
	IncrementFlag("SHIZZY_SEXED");
	
	pc.cumMultiplierRaw += 2;
	for each (var vag:VaginaClass in pc.vaginas) vag.wetnessRaw += 1;
	pc.slowStatGain("libido", 1);
	
	addButton(0, "Next", majinLeave, false);
}



public function shizzyChefsSpecialties():void
{
	clearMenu();
	
	addDisabledButton(0, "Group Fuckin’");
	addButton(1, "Spar", shizzyTimeToDDDuel, undefined, "Spar", "Get in a tussle with the big girl.");
	addButton(14, "Back", shizzyMajinMainButtons);
}

public function shizzyTimeToDDDuel():void
{
	clearMenu();
	clearOutput();
	showShizuya();

	if (flags["SHIZZY_OUTFIT_STATE"] == undefined)
	{
		output("You mention how strong Shizuya looks, and how her bounty hunting must have made her pretty strong. <i>“Maaaaaybe. Why?”</i>");
		output("\n\n<i>“I was hoping for a match”</i>");
		output("\n\n<i>“A match, ey? Just for fun, or?”</i>");
		output("\n\n<i>“For fun.”</i>");
		output("\n\n<i>“Alright, just keep in mind that the crew is gonna want to get in on it. They loooove their bets.”</i>");
		flags["SHIZZY_OUTFIT_STATE"] = 0;
	}
	else
	{
		output("You tell her you want a rematch.");
		output("\n\n<i>“Alright, cap, just tell me when.”</i> She looks giddy at the opportunity to fight you again.");
	}

	addButton(0, "Fight", shizzyMakeYourBets, undefined, "Fight", "You’re on!");
	addButton(1, "Wait", shizzyChickenOut, undefined, "Wait", "Not right now.");
}

public function shizzyChickenOut():void
{
	clearMenu();
	clearOutput();
	showShizuya();

	output("You decide that you don’t want to fight right now.");
	output("\n\n<i>“Aww, okay. Just tell me when you’re ready.”</i>");

	shizzyMajinMainButtons();
}
	
public function shizzyMakeYourBets():void
{
	clearMenu();
	clearOutput();
	showShizuya();
	
	output("<i>“All right then, cap, come on.”</i>");
	output("\n\nShe goes into one of her drawers and grabs a large, metal box. After taking a peek inside, she leads you out of her room and down the lift, eventually leading you to the mess hall. There, she starts stripping down, completely indifferent to any eyes on her, probably even getting off as the people of the mess draw their attention to her.");
	output("\n\n<i>“Ey boys, the cap’n gettin’ ready fer a fight!”</i> A voice calls out, signaling a ring of people to form around you. You even see Mika and Adelline huddle in. Winston’s boyfriend seems to be going around from person to person, writing down something from each of them. While you’re looking at that, you hear a loud grunt from Shizuya.");
	output("\n\nYou look over and see her struggling to get a pair of tight, yellow pants over her giant ass and genitals. Her ass bounces heavily, her balls jostle and knock into each other inside their tightly packed pouch, and her cocks are rock-hard, drooling pre as they bounce to her dressing attempts. Eventually she sucks in her gut, and jams her swollen package and rods down her pants, each shaft snaking down one of her pant legs.");
	output("\n\n<i>“Phew, okay give me a minute to calm down here. Fightin’ like this is, uh, kinda awkward.”</i> The frazzled feline closes her eyes and stares up at the ceiling, keeping her arms behind her back to resist any temptation. After a few minutes, and some deep breathing, she’s soft enough to refocus, and dive back into the box. Out of the box, she pulls a pair of heavy looking, black gauntlets and then a similar looking pair of greaves. She puts them on quickly, and slams the gauntlets together, causing sparks to crackle and fly. She gives a few stretches as her expression hardens.");
	output("\n\n<i>“No going easy here, Steele. This is serious time.”</i>");
	output("\n\nWith that, you raise your [pc.weapon] and get ready to fight.");
	
	moveTo("MAJIN MESS HALL");
	processTime(1);

	chars["SHIZUYA"].freshenUp();
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(chars["SHIZUYA"]);
	CombatManager.encounterTextGenerator(chars["SHIZUYA"].encounterText);
	CombatManager.victoryScene(shizzyAWinnerIsYou);
	CombatManager.lossScene(function():void{CombatManager.genericLoss(shizzyKickedUrAssFagget);});
	
	addButton(0, "Fight", CombatManager.beginCombat);
}

//Fight thingie
public function shizzyCounterAttack(target:Creature, melee:Boolean = false):void
{
	chars["SHIZUYA"].counterAttack(target, melee);
}

public function shizzyAWinnerIsYou():void
{
	clearMenu();
	clearOutput();
	showShizuya();

	output("After what seems like hours, Shizuya finally runs out of steam and collapses onto her back, panting hard and" + (enemy.HP() <= 0 ? " soaked in sweat." : " rock hard.") + " Her crew falls silent as they observe the fall of their captain, though their faces are of disappointment and anger, and you quickly find out why.");
	output("\n\n<i>“All right, all right, quick gawking and pay up!”</i>");
	output("\n\nYou look over to see Adelline smiling as many crew members begrudgingly hand over their credits. Did she bet on you? Before you have time to think about that, you hear a groan from Shizuya. ");
	if (enemy.HP() <= 0) 
	{
		output(" She slowly begins to sit up, looking more like she just woke up from a nap than a lengthy brawl, even yawning once she’s sat up. Though, she obviously still has some pains as she stands up.");
		output("\n\n<i>“Gah, my legs are fuckin’ killing me.”</i> She says, rubbing her thighs. <i>“That was amazing, Steele, I haven’t felt this alive in years! You’re tough as shit.”</i> You jokingly flex, taking on a cartoonish, superhero-like pose. She laughs as she starts stripping back down, stopping and huffing as her hermhoods slide tightly out of her spandex-tight pants.");
		output(" She moans as her dongs pop out,");
		output(" hard as diamonds and drooling pre from your teasing.");
	}
	else
	{
		output(" She’s desperately pawing at her painfully trapped crotch, desperately trying to dig her dongs out before they rip her pants right off her. She can’t quite do it from her prone position, so she springs up with a shocking level of energy.");
		output("\n\n<i>“Ahhh, fuck! W-why are you s-so damn, FUCKING SEXY, HOLY SHIT!”</i> She starts cursing and stuttering as she desperately tries to slide her spandex-tight pants off of herself.");
		output(" She moans as her dongs pop out,");
		output(" mostly hard from their tight squeeze-job.");
	} 
	output(" <i>“Fuckfuck, why are you guys so touchy?”</i> She mumbles to herself as she slips the rest of her clothes and weapons off, putting them back in the box, and taking her old clothes back out.");
	output("\n\n<i>“Ugh, I’d ask ya to help me take care of this,");
	if (enemy.HP() <= 0) output(" but my legs are screaming at me to sit the fuck down.”</i>");
	else output(" but I really don’t trust myself with all this fuckin’ adrenaline goin’ through me.”</i>");
	output(" She throws her clothes over her shoulder, not even bothering to put it on, and walks out, completely erect.");
	output("\n\n<i>“I’m gonna go jerk off" + (enemy.HP() <= 0 ? "." : " for a few hours.") + " Later!”</i> She walks off casually, and the crowd disperses, leaving you by yourself in the mess hall.\n\n");

	if (flags["SHIZZY_OUTFIT_STATE"] < 2) flags["SHIZZY_OUTFIT_STATE"] += 2;

	CombatManager.genericVictory();
}

public function shizzyKickedUrAssFagget():void
{
	clearMenu();
	clearOutput();
	showShizuya();
	
	output("You fall on your back," + (pc.HP() <= 0 ? " panting in pain and exertion." : "too flushed with desire to continue.") + " Shizuya looms overhead, panting and coated in sweat, her gauntlets still firing arcs of electricity.");
	if (pc.HP() <= 0)
	{
		output("\n\nShe reaches down, extending her hand to yours and grabbing it, lifting you back to your [pc.feet]. It’s a bit hard to stay up after the thrashing you got, but she’s more than happy to support you.");
		output("\n\n<i>“Ya alright? Didn’t go in too hard did I?”</i> She says with genuine concern and a hint of mockery. You tell her you’re fine, though.");
		output("\n\n<i>“Don’t sweat it too much, no judging here. Just, uh, come back when you’ve got some more practice, ‘kay?”</i> When you feel like you can stand by yourself again, she lets go, and heads back over to the box.");
		output("\n\nShe starts stripping back down, stopping and huffing as her hermhoods slide tightly out of her spandex-tight pants. She moans as her dongs pop out.");
		output("\n\n<i>“Fuckfuck, why are you guys so touchy?”</i> She mumbles to herself as she slips the rest of her clothes and weapons off, putting them back in the box, and taking her old clothes back out. She throws her clothes over her shoulder, not even bothering to put it on, and walks out, completely erect.");
		output("\n\n<i>“I’m gonna go jerk off. Later!”</i> She walks off casually, and the crowd disperses, leaving you by yourself in the mess hall.");
		addButton(0, "Next", mainGameMenu);
	}
	else
	{
		output("\n\nShe reaches down and grabs you around the waist, hoisting you up and over her shoulder as she rushes you out of the mess hall.");
		output("\n\n<i>“Shizuya want snu-snu!”</i> She yells out as she darts down the hall. You’re really in no position to complain, what with how absurdly swollen your nethers feel. She hoists you all the way to her room, where she slams the door behind the two of you, and tosses you onto the bed. She strips in a flash, grunting through the ripping tightness that her swollen members have created in her pants. She stands before you, naked and practically drooling pheromones from every pore. The smell is so overwhelming that it pushes your tired body up and into her arms.");
		if (pc.tallness < 8*12) output("\n\nShe hoists you up, bringing you");
		else output("\n\nYou stand");
		output(" face to face, your breath mixes together in a hot fog that adds a simmering undercurrent to the passionate moment. You kiss, tying your tongues together as her body radiates blissful heat into yours, like sitting near a radiator on a cold day. She swings you around, planting you on the ground in front of the bed, and laying herself down on it.");
		output("\n\n<i>“Fuck. Me!”</i> She huskily insists, and you’re in no place to refuse.");
		moveTo("MAJIN OFFICERS QUARTERS");
		processTime(2);
		shizzySexyButtons(false);
	}
}

