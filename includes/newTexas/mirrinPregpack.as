/**
 * Mirrin's Frend Xpac
 *
 * MIRRIN_PREGSTAGE:
 * 0 - not preg compatible
 * 1 - [Pregnancy] available
 * 2 - [About Preg] available
 * 3 - Actual pregnancy available
 * 4 - Actual pregnancy available and said No
 * 5 - got pounded
 * 6 - pounded her
 * 7 - pounded both
 * 8 - pregged mirrin
 * 9 - pregged both
 * 10 - pregged live
 * 11 - pregged live & both
 * MIRRIN_PREGMAIL_TIMESTAMP: when to receive nonpreg email
 * MIRRIN_TAVROSMAIL_TIMESTAMP: when to receive tavros email
 * MIRRIN_PREG_TIME_LEFT: how long until mirrin pops
*/

public const mirrinMaxSize:Number = 500;
public const mirrinMaxButtSize:Number = 600;

public function startMirrinPreg():void
{
	flags["MIRRIN_PREG_TIME_LEFT"] = 18*7*24*60; // 18 weeks
	flags["MIRRIN_TAVROSMAIL_TIMESTAMP"] = GetGameTimestamp() + 7*24*60; //1 week

	// If PC is also Mirrignant, use PC's pregnancy multiplier
	var timeMulti:Number = 1;
	var pregSlot:int = pc.findPregnancyOfType("MirrinPregnancy");
	if (pregSlot >= 0) timeMulti = pc.pregnancyData[pregSlot].pregnancyIncubationMulti;
	flags["MIRRIN_PREG_TIME_LEFT"] /= timeMulti;
	flags["MIRRIN_PREG_DURATION"] = flags["MIRRIN_PREG_TIME_LEFT"];

	//events
	flags["MIRRIN_SUGARMOMMY"] = GetGameTimestamp() + 0.2*flags["MIRRIN_PREG_TIME_LEFT"];
	flags["MIRRIN_SENDNUDES"] = GetGameTimestamp() + 0.4*flags["MIRRIN_PREG_TIME_LEFT"];
}
public function startPCMirrinPreg(vagIdx:int):void
{
	var fertileMirrin:Mirrin = new Mirrin();
	fertileMirrin.impregnationType = "MirrinPregnancy";
	fertileMirrin.createPerk("Fixed CumQ", 10000);
	pc.loadInCunt(fertileMirrin,vagIdx);
	flags["MIRRIN_TAVROSMAIL_TIMESTAMP"] = GetGameTimestamp() + 7*24*60; //1 week
}

public function jentaBorn():Boolean
{
	return MailManager.isEntryUnlocked("mirrin_jenta");
}

public function torriBorn():Boolean
{
	return flags["MIRRIN_PREGSTAGE"] > 8 && !pc.hasPregnancyOfType("MirrinPregnancy");
}

public function goToFrontOfMirrinGym():void
{
	move("RESIDENTIAL DECK 11");
}

// Write Mirrin's entry to the log, because she might be in NT or Tavros
public function writeMirrinLogEntry():void
{
	output2("\n<b>* Mirrin:</b> Met her");
	if(flags["MIRRIN_CONFIDENTED"] != undefined) output2(", You boosted her confidence");
	if(flags["FRIENDED_MIRRIN"] != undefined && flags["SEXED_MIRRIN"] == undefined) output2(", Just Friends");
	if(flags["MIRRIN_BIGGUS_DICKUS"] != undefined) output2(", Modded her dicks");
	if(flags["MIRRIN_TRAINED"] != undefined) output2("\n<b>* Mirrin, Times Trained with Her:</b> " + flags["MIRRIN_TRAINED"]);
	if(flags["SEXED_MIRRIN"] != undefined) output2("\n<b>* Mirrin, Times Sexed:</b> " + flags["SEXED_MIRRIN"]);
	if(flags["MIRRIN_PREG_TIME_LEFT"] != undefined) output2("\n<b>* Mirrin, Pregnancy, Gestation Time:</b> " + prettifyMinutes(flags["MIRRIN_PREG_TIME_LEFT"]));
}

public function mirrinLetsJustBeFriends():void
{
	clearOutput();
	showMirrin();
	author("SoAndSo");

	output("You hold your hand up to get her attention.");
	if (pc.isNice()) output("\n\n<i>“Actually, Mirrin, I’ve thought it over too. I really dig our time together, but you’re very much my friend first. Couldn’t we just, ya know... keep doing what we were doing?”</i> you say warmly, trying the ‘just friends’ angle.");
	else if (pc.isMisch()) output("\n\n<i>“Woah woah, hold on there big girl! I’ve had a think too and really, I just wanna bro down with my kickass qilin friend. Sorry if I sent the wrong signals,”</i> you say sheepishly, trying to hold an awkward smile.");
	else output("\n\n<i>“Wait, stop. I’ve given it some thought and I’m much more into the whole ‘us being friends’ thing. So, I would rather not ruin that with romantic endeavours,”</i> you say flatly and bluntly.");
	output("\n\nThe she-dragon holds her breath, then smacks her palm to her forehead with a laugh.");
	output("\n\n<i>“Fucking... I did it again, huh? Kind of dragged you around doing this uhh, ‘mixed signals’ shit. Yeah, you know, I get it! I <b>do</b> get it. I’m sorry if it seemed that way but now, I figure that we’re both happier knowing what’s what, huh?”</i> she thinks aloud, her muscular frame visibly relaxing before you.");
	output("\n\nNice!");
	output("\n\n<i>“Alright, well all this prepping means I’m a little uhhhh, pent up right now so... come back tomorrow and we can do whatever, you know? Weights, food, drinks, blah blah,”</i> she says, heartily slapping your shoulder.");
	output("\n\nDouble nice!");
	if (pc.isBro()) output(" Brotacular!");
	if (silly) output(" Shablagoo!");
	output("\n\nAh jeez, that shoulder hurts a bit now...");
	output("\n\nShe waves you goodbye, a satisfied smile on the she-dragon’s face. You do too, intent on going about your business.");

	//PC is now considered a ‘friend’ until they decide to have sex with Mirrin. 
	flags["FRIENDED_MIRRIN"] = 1;

	clearMenu();
	addButton(0, "Leave", goToFrontOfGym);
}

public function mirrinWeNeedToTalk():void
{
	clearOutput();
	showMirrin();
	author("SoAndSo");

	output("It’s been great being her friend but you want a little bit more out of this thing you two have going on. You approach the qilin with a little caution, unsure of how she’ll react to your proposition after turning her down before.");
	output("\n\n<i>“Uh, Mirrin, hey. I was thinking about us and... I’m kind of thinking back to that time we almost-”</i> you begin.");
	output("\n\n<i>“Almost banged?”</i> she says in between squats, finishing up the motion.");
	if (pc.isNice()) output("\n\n<i>“Uh, y-yeah...”</i> you confirm with an awkward foot shuffle. <i>“So maybe we could start off from before? If you feel the same, of course.”</i>");
	else if (pc.isMisch()) output("\n\n<i>“Mhmm, I’ve had the best meat in the Barbecue Pit but haven’t got my hands on some exotic dragon meat yet" + (silly ? " cuz dragon meat is yummy and I really want it in my tummyyyy" : "") + ",”</i> you joke, internally eye-rolling at your own pun.");
	else output("\n\n<i>“Well, now I think we should,”</i> you say flatly, giving her a smoky look in the mirror.");
	output("\n\nThe she-dragon sets her weights down with a harsh series of <i>clanks</i> and brings herself to within a foot of you.");
	output("\n\n<i>“I’ve always been game, Steele. Two things: I feel I owe you a bit of talk about why I’m... being the fucking way I am, so to uhhh, speak. The other is that we do this my way, that’s just how it is. Still up for some of this?”</i> she smiles, gesturing down from her shoulder to her knees.");

	processTime(1);
	clearMenu();
	if (pc.isNice()) addButton(0,"Hmm...",mirrinFirstTImeOneOffSex);
	else addButton(0,"Her Place",visitMirrinsPlace);
	addButton(1,"Still No",mirrinIJustWantedToTalk);
}

public function mirrinIJustWantedToTalk():void
{
	clearOutput();
	showMirrin();
	author("SoAndSo");

	output("You decide against it at the last second, hoping she’ll understand.");
	output("\n\n<i>“Bjáni, why bring it up if... fiiine. Ok, no matter, no worries. If and when, just talk to me about it,”</i> she says, blowing out a huff of air at your indecision. <i>“Back to it, I think.”</i>");
	output("\n\nThe hulking she-dragon hauls her barbell back onto her shoulders and begins a new routine.");
	output("\n\nYou give her a goodbye, to which she gives you a wink in the mirror. You then leave the gym for new journeys.");

	processTime(1);
	clearMenu();
	addButton(0,"Next",goToFrontOfGym);
}

public function mirrinFindsOutYoureACrappyBreeder():void
{
	clearOutput();
	showMirrin();
	author("SoAndSo");

	output("<i>“I’m guessing if I do, then...”</i> you say, your eyes unable to settle on anything. Shit.");
	output("\n\n<i>“You kinda know what I’m going to ask, right? So you know it can’t be said until... yeah. Sorry, this is all a bit messy in my head,”</i> she says with a sigh, her palm against her forehead, <i>“you need to get it checked, whatever it is. Need. To. Then you come back and we talk.”</i>");
	output("\n\nYou nod with a reflexive smile on your face. Quite awkward. You got this though, it’s just a quick visit to a clinic, right? Few shots in the arm and all that. With this in mind, you turn away from her glare - one with a twitch in her cheeks and purse of the lips - and walk away as if no one was paying attention.");

	flags["MIRRIN_PREGSTAGE"] = 0;

	processTime(3);
	clearMenu();
	addButton(0,"Next",goToFrontOfGym);
}

public function wereGoodToMakeBabbysDragonLady():void
{
	clearOutput();
	showMirrin();
	author("SoAndSo");

	output("What sort of problem could have her so worked up? You ask her what’s wrong.");
	output("\n\n<i>“Ehh, I don’t know if ‘wrong’ is the right word. Is a bit like, uhhh, how do you say, um... hedged bets. I worked them out badly and now I’m nervous about asking you. Let’s just sit here, huh?”</i> she states, setting herself down on a bench with her hands on her knees. You sit next to her then put your hand on hers to console her, to which you can see a faint flicker of a smile at the corners of her mouth.");
	output("\n\n<i>“" + (silly ? "So. And So." : "So.") + " We’ve been kind of open about all this, right? Having some pretty great fucking and the rest of it, no strings, no commitment. But like, I guess I’ve never been that open as a person. Not with the full history, you know. Most of it is pretty mundane,”</i> she explains somewhat haphazardly, chuckling at her last sentence. <i>“But I’m in a real good spot. More than enough to live off and to support anyone I chose, adoring fans all over the galaxy, someone pretty close to me...”</i>");
	output("\n\nShe puts her other rough-skinned palm on top of your hand, giving it a soft and warm squeeze.");
	output("\n\n<i>“And I guess I never talked about some other things. Did you know I’m 38 next year? This kind of life breezes by when you hit a number like that. Like, I never even remembered until dad mailed me a few days ago to uhhh, say things about my birthday,”</i> she continues, her nervousness giving way to relief as she talks.");
	output("\n\n38, huh? You tell her she barely looks out of her mid twenties. A little bit of you regrets saying something so cheesy.");
	output("\n\nShe just chuckles and pats the back of your hand.");
	output("\n\n<i>“Yeah, I know what you’re trying to say, you... flatterer, you. Probably doesn’t even matter, I might not get ‘old’ old until I’m like a century and a half or some shit. Gryvain nonsense, you know? Hah! But anyway, I guess the human part of me is getting... needy.”</i>");
	output("\n\nShe pauses, carefully choosing her words.");
	output("\n\n<i>“I want to have a baby.”</i>");
	output("\n\n<i>Ohhh</i>. Oh, wow.");
	output("\n\n<i>“With you, elskan,”</i> she adds, turning her gaze to address you with a hopeful grin.");
	output("\n\n<i>Definitely</i> has got your attention. It’s a bit of a curveball and you can only give it a quick mulling over: sure, it’s a bit flippant but it’s perfectly doable.");
	if (StatTracking.getStat("pregnancy/total births") > 0) output(" You’ve done it before, anyway!");
	output(" And getting bred by a beast of a she-dragon like her...");
	if (!pc.hasVagina()) output(" or actually breeding <i>her</i> for that matter.");
	output("\n\nYou ask her for more details, specifically about who’s actually doing the impregnating.");
	if (!pc.hasVagina()) output(" You imagine that the answer will be simple and obvious given your particular ‘organ’ arrangement.");
	if (pc.isHerm()) output("\n\n<i>“Well me, of course! And I’d make it <b>so</b> special for you. I’ve got new toys and all these things... but at the same time, it could always be you, perhaps,”</i> she says, enthusiasm giving way to a sly wink.");
	else if (pc.hasVagina()) output("\n\n<i>“Well me, of course! And I’d make it <b>so</b> special for you. I’ve got new toys and all these things,”</i> she says, leaning in a little closer to you.");
	else output("\n\n<i>“Ehh... might be problematic. On the inside, I’m aching for it but... is it going to ruin all this?”</i> she sighs, gesturing to her sculpted, iron-hard abs and then to her breasts for some reason. <i>“I don’t know. This is why my bet hedging failed.”</i>");
	output("\n\n<i>“Don’t rush for an answer though, it’s a big thing. Well, it’s big for me, anyway. I know that you’ve probably had who knows how many children and all the trust funds that Daddy Steele had, yadda yadda...”</i>");
	output("\n\n<i>“But yeah, don’t say anything yet, think it over. Come back whenever and we’ll... go with what you want,”</i> she finishes, giving you a peck on the cheek. <i>“Didn’t want to make it too big a thing so... I should get back to it, got some clothes to, uhhh, avoid shredding. Find me around later.”</i>");
	output("\n\nYou nod, giving her arm a squeeze for a goodbye. Mirrin hurriedly stands up and slowly walks over to the locker rooms, waving you on your way.");
	output("\n\nWith some life-altering food for thought, you take your leave.");

	//Mirrin becomes unavailable for 12 hours.
	pc.createStatusEffect("MIRRIN_DISABLED");
	pc.setStatusMinutes("MIRRIN_DISABLED",12*60);
	flags["MIRRIN_PREGSTAGE"] = 1;

	processTime(3);
	clearMenu();
	addButton(0,"Next",goToFrontOfGym);
}

public function mirrinLetsTalkBabies():void
{
	clearOutput();
	showMirrin();
	author("SoAndSo");

	output("You’re ready: you want to help Mirrin with her dreams of a baby. You say it directly to her, keeping the notes of caution and apprehension out of your voice.");
	output("\n\nThe she-dragon says nothing for a minute, staring at the floor while inhaling and exhaling very slowly. She turns her gaze to you, seemingly unfazed.");
	output("\n\n<i>“Oki. Oki. This is what I hoped. Fuck, gimme a minute,”</i> she says quickly, burying her face in her palms. You rub her muscle-bound shoulder to comfort her: even the biggest girls can cry sometimes.");
	output("\n\n<i>“Alright, angle of attack... no, that’s stupid. I <b>mean</b> to say, here’s what we should do: I lay out the biggest problem here, which is me and my dumbass body as it always is, then the ‘hard part’ I have to mention. <b>Then</b> we make a decision based on what you’re good with. Ok with that?”</i>");
	output("\n\nYou nod, having no reason not to hear her out at least.");
	output("\n\n<i>“Right, so more about stupid me and my life choices. Now I talked about how me and myself disagreed when I was younger. So I had to cut myself out of me, so to uhhh, tone down all these gryvain genes fucking with me. Dad understood it, although I suppose he didn’t want to,”</i> she begins, talking in a very matter-of-fact fashion towards the mirror so that she’s looking at you through it.");
	output("\n\n<i>“Best way was to simply ‘dull’ my sex drive or else go physically insane. And it worked a little too well. Don’t get me wrong though, I </i>adore<i> what we do together but... before that, was difficult getting ‘excited’ in that sense. Went beyond that too: I’m fairly sure my sperm cells are the most collective, lazy piece of shit that uhhh, you know, could exist. Definitely ironic, no?”</i> she says with a huff through her nose, trying to smile at the situation. You give her shoulder another rub, asking her to continue.");
	output("\n\n<i>“Yah yah, so... getting me pregnant or getting you pregnant is an issue. But it’s not one you need to help with, I have some very, <b>very</b> nice treats for us,”</i> she winks, rubbing her forearm against your [pc.leg]. You squeeze said arm in response, your fingers barely making an impression on her iron-hard biceps.");
	output("\n\n<i>“Main issue is ownership, I guess we can say,”</i> she continues, twirling her finger in the air while she carefully plans out her words.");
	output("\n\n<i>“I’m quite happy for our... offspring to end up at that Steele nursery at that station place. In fact, I’ll probably move there when it happens, I need to get helvitis out of here. No more waiting days for intergalactic delivery or hardlight patches. But you have to understand that I think it’s best if I’m parent number one. I want our child or children to be the core of my world and being in that world would mean this: I choose the name and I choose how to raise. I could only trust you, but you’re not going to be around 24 hours a day...”</i>");
	output("\n\nHer shoulders slouch and her face becomes saddened in the reflection of the mirror. The dejected she-dragon stares straight at the floor, a hint of a tear in her half-closed eye.");
	output("\n\n<i>“And you’ve every reason to say no because of that but it’s the only way I see it working, [pc.name]...”</i>");
	output("\n\nYou wrap your arm around her middle, resting your head against her shoulder.");

	processTime(8);

	clearMenu();
	addButton(0,"Well...",function ():void
	{
		clearOutput();
		showMirrin();
		author("SoAndSo");
		output("<i>“That’s a bit of a tall order,”</i> you say with a heavy sigh.");
		output("\n\n<i>“Yeah, figured. So, mm, if, ummm... okay, the short of it: I get it, if you don’t want to ever then okay, we can keep doing our thing. If you change your mind, then...”</i>");
		output("\n\nShe rubs your hand with a loose grip, a reconciliation of sorts. She still seems hopeful, you feel. You nod and rub her hand back.");
		output("\n\n<i>“Okay, maybe I’ll give it a little more thought,”</i> you say with a squeeze of her forearm, <i>“although if I don’t bring it up again, then-”</i>");
		output("\n\n<i>“Then yeah, it’s okay. You go on and decide, don’t let me nag,”</i> says Mirrin as she lets go of your hand, <i>“I won’t say anything if you won’t, so. Back to weights.”</i>");
		output("\n\nShe chuckles and lets go of your hand, her fingers stretched out for a set of handbells by her side. Yeah, wow. Really dumping all that info on you. Let her build your kids into what <i>she</i> wants them to be...");
		output("\n\nHmm.");
		output("\n\nYou leave her be.");
		flags["MIRRIN_PREGSTAGE"] = 2;
		processTime(1);
		clearMenu();
		addButton(0,"Next",goToFrontOfGym);
	},undefined,"Well...","You don’t think you can take that offer, either for now or ever.");
	addButton(1,"Okay",sureMirrinLetsMakeDragonBabus,undefined,"Okay","You’re okay with that arrangement, as galling as it might be. Down the line, however, you never know how much leeway she’ll give you...");
}

public function talkAboutBabiesAgain():void
{
	clearOutput();
	showMirrin();
	author("SoAndSo");

	output("<i>“Okay, yeah, chat. I thought it over and I think I’m good with what you want to do with our child. Or children. That is, as long as you hold up the other parts of it, letting me see them regularly, doing things...”</i> you say with a squint in her direction. The qilin sighs in relief.");
	output("\n\n<i>“Absolutely. And my place, any time, wherever I am. We’ll be sharing stories, visiting... I can’t wait, elskan, I can’t.”</i>");

	processTime(1);
	clearMenu();
	addButton(0,"Okay",sureMirrinLetsMakeDragonBabus,undefined,"Okay","You’re okay with that arrangement, as galling as it might be. Down the line, however, you never know how much leeway she’ll give you...");
}

public function sureMirrinLetsMakeDragonBabus():void
{
	clearOutput();
	showMirrin();
	author("SoAndSo");

	output("<i>“If that’s what you really want out of this, I understand,”</i> you say in an empathetic tone. After all, she’s not wrong on her reasoning.");
	if (CodexManager.entryViewed("gryvain")) output(" Also stands to reason that gryvain children of all dilutions would need exceptional care and attention which you might not always be there for...");
	output("\n\n<i>“So... you want this too?”</i> she says quietly, an irregular note of optimism in her voice.");
	output("\n\nOf course, you wouldn’t even ask if you weren’t interested, duhhh.");
	output("\n\n<i>“Aggh, I did it again,”</i> she sighs, chuckling to herself. <i>“Built it up inside all this time and you’re all calm and... blah, anyway.”</i>");
	output("\n\nShe wraps her arm loosely around your neck and kisses the top of your head.");
	output("\n\n<i>“Hm hmm, who’s the best Steele in the world, huh? Right, so: give me a few days and then we can... <b>breed</b>,”</i> she finishes, purring the last word into your ear.");
	output("\n\n<i>Ooh...</i>");
	output("\n\nBut you can do better than that, Mirrin. You pull her face to yours by her jaw and give her a full, loving kiss on the lips. Now that’s how you say goodbye, ya big dumb dragon.");
	output("\n\nMirrin holds her pose, a little shocked by your assertive act. She quickly pulls herself back, clearing her throat in an awkwardly audible manner.");
	output("\n\n<i>“Mmmhmmm, well. That’s a good way to start,”</i> she smiles. <i>“But I have to prep. In fact...”</i>");
	output("\n\nShe hurriedly gets up, spurred on by the prospect of fulfilling her physical desires. You can’t quite imagine what she’s got planned but you’re feeling a bit of excitement yourself. She waves you goodbye before <i>clip-clop</i>ing to the changing rooms.");
	output("\n\nYou take your own leave, thinking to return later once she’s prepared.");

	//Mirrin becomes unavailable for 72 hours. 
	pc.createStatusEffect("MIRRIN_DISABLED");
	pc.setStatusMinutes("MIRRIN_DISABLED",24*60*3);
	flags["MIRRIN_PREGSTAGE"] = 3;

	processTime(3);
	clearMenu();
	addButton(0,"Next",goToFrontOfGym);
}

public function finallyMakeMirrinBabusForRealThisTimeTotally():void
{
	clearOutput();
	showMirrin();
	author("SoAndSo");

	output("You tell her you’re ready, to which she immediately stands to full height without issue.");
	if (pc.tallness < 84) output(" She towers above you with her hands on her hips, a knowing look in her eyes.");
	output("\n\n<i>Huh.</i> No leg pain then...?");
	output("\n\n<i>“MMmnnnope, like I said, I’m fine. It’s something else,”</i> she says plainly, suddenly grabbing your wrist! She yanks your hand to her fabric-shrink-wrapped bulge and you can feel it... vibrating. The she-dragon grins the most salacious grin you’ve seen her make, her bulge twitching in your palm to your idle rubbing. Oh boy...");
	output("\n\n<i>“You’re going to be so broken by the end of this, Steele,”</i> she half whispers " + (pc.tallness < 84 ? "from above" : "into your ear") + " <i>“We’re going to go to my place and we’re not coming out again until");
	if (pc.isHerm()) output(" we’ve drained each other dry.”</i>");
	else if (pc.hasCock()) output(" I’ve drained you dry.”</i>");
	else output(" you’re swollen.”</i>");
	output("\n\nEep.");

	processTime(3);
	clearMenu();
	addButton(0,"Next",mirrinBabusTakeOne);
}

public function mirrinBabusTakeOne():void
{
	clearOutput();
	showMirrin(true);
	author("SoAndSo");

	output("Without warning, the grinning qilin turns you about by your shoulders and wraps her arm around your neck. You can feel her sculpted, powerful bicep squeeze against your skin as she does and she starts pushing you forward into an awkwardly fast walk towards the gyms exit. You’re not quite in the position to protest but her forcefulness is oddly... exciting.");
	output("\n\nAlong the way, numerous calls and whoops of encouragement come from the gyms regulars and Mirrin gives them all a knowing wink and a wave. Oh they know what’s up alright!");
	output("\n\nThe walk to her faux-ranch house is quick and filled with small squeezes from the she-dragon. She’s long since moved her palm to your lower back and now hurries you along in time with her long strides. That grin she had from before have never left her face. You can even see a bit of darkening in her cheeks and her nostrils flare up when she exhales through her nose: she must be under a lot of strain <i>down there</i>.");
	output("\n\nYou get to her place in short order, her security guard bidding you a welcoming nod at the front gate. Once the doors swing open, the breathy she-dragon");
	if (pc.tallness < 84) output(" lifts you up into her arms so that your [pc.legs] dangle over the side. Instinctively, you wrap your arms around her sturdy neck and draw your [pc.lips] to hers for a messy kiss. She staggers a little as you do, aiming for the ‘bedroom’.");
	else output(" pushes your [pc.face] towards her with her hand round the back of your head. The other finds itself gripping at a [pc.hip], giving it an aggressive squeeze as she locks her mouth to your [pc.lips]. She pretty much drags you into the ‘bedroom’!");
	output("\n\nOnce you’re at the bed, Mirrin pretty much throws you on to it with a careless laugh, the plush fabric beneath providing a very comfortable landing at least. The familiar bed feels oddly tantalizing to your [pc.skinFurScalesNoun] and being on it brings a sincere smile to your face.");
	if (!pc.isNude()) output(" First things first though: you almost tear at your [pc.gear] in an attempt to take it all off, only to then chuck it over the side of the bed.");
	output("\n\nMirrin herself basks in front of the rooms wall sized window, the ambient light of the New Texas " + (hours > 20 || hours < 7 ? "moon" : "sun") + " forming a long, imposing shadow against you and the bed. She turns around on a hoof, facing you with a predatory look.");
	output("\n\n<i>“So prompt, so eager. You’re just begging for a");
	if (pc.isHerm()) output(" breeding");
	else if (pc.hasCock()) output(" milking");
	else output(" breeding");
	output(", eh?”</i> she teases, playing the rim of her skintight shorts. <i>“</i>Helvetis<i> with this!”</i>");
	output("\n\nThe she-dragon impatiently rips at the fabric of her clothing with her claws, discarding a ruined set of sports clothes and a torn up jockstrap. Now it’s plain as day as to where the vibration was coming from...");
	output("\n\nAlong both of her already-hard stallion shafts, a network of pads and wires line both meatsticks and have cables reaching around her hips to behind her. They twitch and pulse with her heartbeat, almost ominous in their meaning.");
	output("\n\nShe flexes her arms in your direction, essentially showing off her body in it’s fully aroused state. The qilin pivots on a hoof so that her perfectly toned, perky behind is the focus of your attention. Her silver horse tail flicks around her hip to give you a better view and what you can see are three thick wires exiting her crevice. She slowly pulls those toned buns apart and her cheeks reveal a large, white plug that visibly buzzes in her backdoor. You can see that her tight-looking pussy has parted ever so slightly, a little sheen of grool on her labia.");
	output("\n\n<i>“I’ve had this accursed, fucking thing in me for 33 hours. Right up against the internals. It has been the best and worst 33 hours I’ve had in... possibly ever. I’ve been hard for the whole thing and I. Haven’t. Cum. Once,”</i> she says over her shoulder, palpable frustration in her voice.");
	output("\n\n<i>“But now that you’re with me, I’m pretty damned sure that it’s going to work,”</i> finishes the dragon with a devilish grin, turning around and kneeling onto the bed. Her twin shafts stick out menacingly in front of you, both tempting and threatening.");
	output("\n\n<i>“At least, I uhhh, hope it works. So: who’s riding who?”</i>");

	//PC lust set to max. 
	pc.changeLust(pc.lustMax());

	processTime(13);
	clearMenu();
	if (!pc.hasVagina()) addDisabledButton(0,"Get Pumped");
	else addButton(0,"Get Pumped",vaginaRouter,[allPumpedUpForAndWithDragonKiddos,mirrin.cockVolume(0),0,-1],"Get Pumped","You’re gonna get pregnant. Very, very pregnant. Probably."); 

	if (pc.cockThatFits(mirrinMaxSize) < 0) addDisabledButton(1,"Pump Her");
	else addButton(1,"Pump Her",penisRouter,[putSomeDragonsInMirrinBrah,mirrinMaxSize,false],"Pump Her","Breed your dragon queen! Or at least, while she allows you to...");

	if (!pc.isHerm()) addDisabledButton(2,"Pump Both");
	else addButton(2,"Pump Both",mirrinBabesAllOverThePlace,undefined,"Pump Both","Well hey, if you both can do both things... why not?");
}

public function allPumpedUpForAndWithDragonKiddos(vagIdx:int):void
{
	clearOutput();
	showMirrin(true);
	author("SoAndSo");

	output("You’re the one with the babymaker: you’re willing to take it. To get her to take the hint, you draw your [pc.legOrLegs] back and slide your fingers against your [pc.pussy " + vagIdx + "] with enticing, silent demand.");
	output("\n\nThe she-dragon does a chiropractic neck crack on herself, a deep series of <i>crrnkk</i> sounds that remind you of just how dense her bone structure must be.");
	output("\n\n<i>“Before we do, get the EasyFit. On the top of that. I want this to feel amazing...”</i> she directs, pointing to the side drawer next to you. You eagerly lay back and grab the small jar, offering it to her in cupped [pc.hands]. She deftly snatches it and applies some to the flared tip of her 16\" monster dong, then to gently lather some against the folds of your labia.");
	output("\n\nBrr, cold...!");
	output("\n\nOnce she’s briefly admired her application, she grabs you by your [pc.hips] and yanks you towards her. Eep! With your legs in the air and your arms askew, you’re pretty much compromised...");
	output("\n\nThe she-dragon lays her thickest piece of flared meat across your front, grinding its weight against your [pc.groin]: a complete display of her physical control over you.");
	output("\n\nHer grin is as wide as it could be, her long gryvain tongue sliding out of her lips to taste the air. She holds you up by your [pc.legs] and draws her hips back, her flare now pressing on your [pc.vaginaColor " + vagIdx + "] folds. She quickly removes the pads lining her cocks for obvious, imminent reasons.");
	output("\n\n<i>“Here goes...”</i> she half whispers. Very slowly and very gently, the dragoness spears you onto her turgid horsemeat! You can feel it slide in and stretch out your");
	if (pc.looseness(vagIdx) > 4) output(" easily parting");
	output(" hole to an alarming degree, the pre-applied EasyFit taking a good few seconds to help your body adjust to her 4\" girth.");
	pc.cuntChange(vagIdx,mirrin.cockVolume(0));
	output("\n\nYour vision can’t keep away from it: an impressive abdominal bulge forms on your [pc.skinFurScales]! The perverse sight is both perturbing and strangely enthralling...");
	if (pc.hasCock()) output(" especially with the way it pushes [pc.eachCock] towards your eyeline.");
	output("\n\nShe takes her time with the initial insertion, just like always. Using her tool to get close to physically breaking you: the thought is enough to flush your [pc.face] red. She notices, of course, the qilin luridly biting her lower lip as she sinks herself to the deepest parts of your [pc.cunt " + vagIdx + "]! In unison, you both groan as the flare prods at your cervix.");
	output("\n\n<i>“Nnng, right... right. Here’s something for you to do, Steele,”</i> whispers the dragoness, her predatory visage only a few inches from your [pc.face]. Mirrin grunts a little as she reaches around her back, pulling out the vibe in her ass halfway...");
	output("\n\n<i>“Nnnmmm, I want you to hold onto this thing with you hands. You’re going to milk me so hard when I’m ravaging your guts that all you’ll want in life is to be </i>bred<i> and </i><b>bred</b><i> by this meat,”</i> she taunts, gripping one of your wrists and forcefully guiding it to the end of the vibe. You try to keep your gaze on her red eyes but her gaze breaks its way into your very being. With your hand on the vibe, you’re just able to hold on to it. It’s too awkward a position to actually toy her ass with it, however...");
	output("\n\nMirrin leans onto you, her perky E-cup bust pushing against your [pc.chest]. Her forehead meets yours and her piercing, reptilian eyes are unavoidable. You feel her hips shift against you, her body’s girthy keystones pulling back her meat only to slowly thrust in again. You whine as she does, the horse shaft within you finding all corners of your [pc.pussy " + vagIdx + "] to fill. There’s a numbness growing in your [pc.legOrLegs] from the sheer size of the insertion.");
	output("\n\nShe breaks into a comfortably slow, deep rhythm of breeding you.");
	output("\n\nEach thrust in leads to her flare brushing against your cervix and every pull out forces the vibe in her asshole to bottom out within her. You can see the muscles of her face contort every time in your peripheral vision, but whether in pleasure or pain is difficult to discern. Her body heat is overwhelming: it keeps your heart beat high despite the slow and steady rhythm you’re locked into.");
	output("\n\nShe’s keeping it emotionally intense but... much more gentle than usual. Is it the vibe? Her attempt at tenderness?");
	output("\n\nWith a grunt and a huff of air through her nose, she picks up the pace further: the deep, <i>deep</i> thrusts still manage to stretch you out in a devilishly perverse way but they come harder and faster!");
	output("\n\nYour resultant whimpers and whines are stifled by her mouth aggressively locking to your [pc.lips] and her foot long piece of mouth meat suppressing your will to speak. The vibe in your hand feels like it’s slipping as your body jerks and pulses all over!");
	output("\n\n<i>“Mmnng, </i>bjáni<i>, don’t let go!”</i> she growls into your ear, briefly breaking the mouth lock. With new resolve, you try your best to hold it in place as she aggressively fucks your [pc.cunt " + vagIdx + "]! With every thrust, you can feel the flare inside you expand and twitch a little more each time: she’s close! The vision of your womb overflowing with her seed becomes irresistible...");
	output("\n\nSuddenly, she slows.");
	output("\n\nWith a deep series of exhales, the qilin pushes herself up from you. She holds your [pc.legs] up in the air and goes back to a slow, deep rhythm.");
	output("\n\n<i>“Fuuuuck, Steele, you feel unbelievable! This is <b>unnnfff...</b> the best slutfucking I’ve done in years! So close, so fucking close,”</i> she shouts, a throaty groan catching her last few words.");
	output("\n\nSomewhere along the line, you’ve lost grip of the vibe but that doesn’t seem to bother her.");
	output("\n\nWith a feral, dragonic growl, she leans back in again and grinds her forehead against yours.");
	output("\n\n<i>“Gonnabreedyou, fuckingperfectpieceof <b>UNNNG</b> fuck, that hurts so <b>good</b>!”</i>");
	output("\n\nThe insensate predator blabbers and gasps unintelligibly as she puts her all into rough-fucking your stretched out hole! You can feel the hot wetness of pre-cum line the inside of your [pc.cunt " + vagIdx + "] and then-");
	output("\n\n<i>“<b>Fuuuckk!</b>”</i>");
	output("\n\nMirrin buries her meat one final time, the flare of her girthy meat locking in place at your cervix! You both cry out in unison as her burning hot seed erupts within you! Thick, fast moving fluid floods your womb: in seconds, it’s already full and groaning with heavy liquid!");
	output("\n\nThe aggressive, masculine grunts and shouts of the dragoness are replaced with babbling whines and moans as her meat continues to pump and <b>pump</b> demi-gryvain seed into your babymaker at an alarming rate. Mirrin’s eyes shut tight as her body forces out 33 hours of pent up seed, the sheer force of the output making it spurt out of your already full womb and breeding hole!");
	output("\n\nHer orgasm seems to last for a full minute. It only ends once you feel her monster cock soften and flex inside your [pc.cunt " + vagIdx + "]. The wheezing dragoness slumps backwards and her beastcock follows, leaving a thick pool of her smoky smelling spunk inside. There’s a warm sensation pooling against your back: looks like both horse-cocks got what they needed!");
	output("\n\nSpent of energy or perhaps drained from her abnormally large climax, Mirrin tumbles against the bed onto her front with her face buried into the covers. You can hear her whimper into the fabric, her hands clutching at her pelvis.");
	output("\n\n<i>“Huuuurts... fuck,”</i> she whines meekly, grabbing at the vibe that still rages in her backside. As she pulls it out and discards it without care, you can see that it’s over a foot long! No wonder she was feeling it.");
	output("\n\nYou take stock of your own situation. You’re only just coming down from a ravaging from your half-gryvain lover. At last, you can feel your [pc.legs]! You lay back in an enervated state, your middle having inflated from a [pc.belly] to a fluid-filled barrel filled with hot, teeming qilin cum. Audible groans emanate from your guts as your womb adjusts to the abnormal mass within. There’s no telling just how much is in there...");
	output("\n\nYou can’t help but pat at your filled midriff even so: the faux-bump you’ve just been dealt is close to the real thing!");
	output("\n\nYour dragoness lover drags herself closer to you, her fearsome visage of horns and scales softened and tempered by a weary look of adoration for you. She slinks up to your eye level, her sweaty palm caressing the [pc.skinColor] surface of your cum-bump with tender attentions.");
	output("\n\n<i>“I’ve uh... thought of names, you know,”</i> she half whispers, unwrapping her ponytail bindings with her other hand.");
	output("\n\n<i>“I’m thinking... ‘Torri’. Torri Mirrinsduttir. Cuz you know, gryvain births are almost always... uhhh, thing thing, uuh, monogendered.”</i>");
	output("\n\n<i>“Torri, Torri... I like it,”</i> you whisper back, much to Mirrin’s silent delight. <i>“But maybe there’s a chance that it’s a boy...?”</i>");
	output("\n\n<i>“Ehh, father would throttle me if I didn’t say ‘Arkos’ but fuck that! He’ll be Einar, Einar Mirrinsonne. And whoever it ends up being will be beautiful...”</i> she chuckles, her eyes fluttering as she seems to drift off to sleep.");
	output("\n\nYeah, a little nap would be good right now...");

	//Orgasm event/PC lust reduced to 0. Gains ‘Vaginally Filled’ and ‘Sore’ status effect. Bring up Vagina choice selector screen thing.
	pc.orgasm();
	pc.loadInCunt(mirrin,vagIdx);
	soreDebuff(5);
	processTime(120);

	clearMenu();
	addButton(0,"Next",wakeUpToFreshlyBredMirrin,0);
}

public function putSomeDragonsInMirrinBrah(cockIdx:int):void
{
	clearOutput();
	showMirrin(true);
	author("SoAndSo");

	output("You’ve got the dick! Well, she does too but she <i>also</i> has the babymaker. You idly jerk at your [pc.cock " + cockIdx + "] while she’s eyeing you over and it’s enough for her to get the hint.");
	output("\n\n<i>“Ehhffff, fiiine. Inevitable anyway,”</i> she admits, awkwardly clambering onto the bed and then to your side. The she-dragon lines herself up parallel to you and lays on her side, her vibrating, flared horse-cocks laying against your [pc.legs]. <i>“Don’t get any silly ideas, </i>elskan<i>: I’m riding you dry until one of us is dead.”</i>");
	output("\n\n<i>Gulp</i>.");
	output("\n\nThat’s the reaction she was looking for. With a sultry smile, she takes your [pc.cock " + cockIdx + "] in her hand and gives it a soft squeeze. Her rough palms feel <i>very</i> strange against the [pc.sheath " + cockIdx + "] of your quickly aroused wang: just once, you wish she’d used some lotion...");
	if (pc.cLength(cockIdx) > 24)
	{
		output("\n\n<i>“Hold on actually, I want </i>aaaall<i> of this but ehhh, it’s a little...”</i> she interjects, reaching over behind her to another set of drawers. She rummages for something quickly then pulls out a packet with ‘Condensol Plus’ written on it.");
		output("\n\n<i>“Take one. I’m not the one built to be bred, you know,”</i> she says with sass, pushing the packet into your hands. Oh well, it’s only temporary! You fittingly steel yourself and then swallow the small pill without difficulty, to the dragonesses silent approval.");
		output("\n\nAlmost immediately, you can feel the awkward loss of mass in [pc.eachCock " + cockIdx + "], the results becoming much more manageable for your breeding queen. Anything for her...");
	}
	output("\n\nYou can feel her free hand reaching under your back and holding you in a cradling position, your eyeline now " + (pc.tallness < 84 ? "locked in to" : "level with") + " her predatory, grin-enhanced stare. Her grip around your [pc.cock " + cockIdx + "] jumps up in pressure, almost to the point of pain. You whine in her grasp as backed up blood strains inside your cockmeat, a mewling whine that makes your dragon lover giggle uncontrollably.");
	output("\n\n<i>“FFfaha! You’re so precious, </i>elskan<i>! So willing to roll over with a light bit of squeezing. I could break this meat, you know. Twist, yank and rrrrip it off right in front of you...”</i> she half whispers, rolling her R’s in a threatening manner. Your heart skips a few beats as a little bit more pressure is felt from her grip.");
	output("\n\n<i>“PFFTHAHA, fuck this is too easy!”</i>");
	output("\n\nThe laughing qilin lessens her grip to a loose, comfortable hold. Sweet relief! Thus begins a smooth series of jerks, pumps and caresses as she works your [pc.cock " + cockIdx + "] to a hardness that earns her approval. <i>“Nothing gets the blood pumping like uhhh, a good frighten, no?”</i>");
	output("\n\nYou shy away from her chiding, quickly agreeing to blow away her shenanigans and turning your head away out of mild embarrassment. It seems to have been her plan: she takes the opportunity to kiss and lick your neck with loving, gentle pressure. Ohh, that’s nice...");
	output("\n\n<i>“MMhmm, enough lovey dovey shit! I’ve got some Steele to bend,”</i> she announces, pushing you onto your back and straddling your [pc.belly] in one smooth motion, her muscled thighs slapping against your [pc.skinFurScales]. Mirrin towers above you with her massive palms pinning your forearms to the bed and her equally massive, flared horse-cocks laying against your [pc.chest] with lurid intent.");
	output("\n\n<i>“Thaaat’s better, no?”</i>");
	output("\n\n<i>Uhhh.</i>");
	output("\n\nThe breathy dragoness lowers her body towards your hardened shaft, the [pc.cockHead " + cockIdx + "] pressing against her warm folds. She teases it a little, using micro-movements to catch and tease the [pc.cockHead " + cockIdx + "] with her slightly parted lips. The sublime teasing is reflected in your [pc.face] as a movement of ephemeral bliss, the she-dragon smiling back to you as it happens.");
	output("\n\nAs a reward, she finishes spearing herself on your rod: a drawn out, smooth motion from tip to [pc.knot " + cockIdx + "] that ends with her lip-bitten moan of approval. She shuffles her weight around a little, getting used to your particular [pc.cockShape " + cockIdx + "] meat while flexing her fingers around your pinned forearms. You can feel the vibe lodged in her backside pleasantly buzz against your [pc.skinFurScales] and wonder if you’ll survive a blast to the face...");
	pc.cockChange();
	output("\n\n<i>“Mmmm, so rare to find someone worthy of fucking <b>me</b> for once. Remember this moment, my " + pc.mf("king", "queen") + ".”</i>");
	output("\n\nShe leans in to kiss you on the forehead and then regains her upright posture.");
	output("\n\nSlowly, the dragoness rocks back and forth with a little gyration in her hips. It’s only now that can feel just how naturally tight her Terran pussy feels, a form fitting squeeze that tickles the most sensitive parts of your shaft.");
	output("\n\nDespite her sturdy, unwavering grip on your middle and arms, her slow-humping is rather tender and controlled. She really wants this to last!");
	output("\n\nIt’s not long before her rhythm picks up.");
	if (pc.balls > 0) output(" Her muscle-toned ass smacks and grinds against your [pc.sack], disturbing the sensitive " + (pc.balls > 1 ? "orbs" : "orb") + " within. She <i>really</i> wants what’s inside...");
	output("\n\nGyrating and grinding turns into full on humping, her powerful thighs laying waste to your [pc.hips] as she bounces on your lap. Her mammoth set of horse-cocks twitch and bounce along with the rhythm, the flares within licking distance to your [pc.lips].");
	if (pc.isBimbo()) output(" OOo, the temptation to just reach out and <b>suck</b> is powerful...");
	output("\n\nThe bed creaks and shakes beneath with each of her humps, accompanied with a heavy exhale through her mouth.");
	output("\n\nYou try to restrain your quickly rising need to cum: the foreplay really did wonders on you! You can hang on, your body says. Mirrin’s just going to make it difficult, is all.");
	output("\n\nHer internals muscles work wonders against your meat: although comfortably lubricated, the grip of her tight walls is only getting tougher and more constricting on the [pc.cock " + cockIdx + "] within!");
	output("\n\nAch, there’s a body-jerking twinge deep in your bowels: you’re close!");
	output("\n\nAs if sensing this, the dragoness redoubles her efforts and is now <b>pummeling</b> your [pc.hips] beneath her! That’s going to leave a bruise or two. The dragoness’s heavy, throaty ventilating and grunting becomes randomly punctuated with a hint of girlish euphoria: she’s close too!");
	output("\n\nAs your hear her burgeoning femgasm taking hold, your body is spurred on out of your control: you cum!");
	output("\n\nWith a loud series of gasps and grunts, your [pc.balls] force a payload of [pc.cumVisc] seed through [pc.cock " + cockIdx + "] right into your dragon lover’s awaiting womb! In tandem with this, Mirrin smashes her body down one last time against your lap, a loud, girly cry signifying her own femgasm!");
	if (pc.cumQ() > 10000) output("\n\nWith your [pc.cockHead " + cockIdx + "] wedged firmly against her cervix, the [pc.cumColor] fluid injects directly into her womb. Thick globules pump through your urethra into her well-ridden pussy and immediately have a bulging effect on the dragoness’s abs! A deluge of pressurized fluid spurts into your lap and all over your front, leaving you sodden in your own juices!");
	else output("\n\nWith your [pc.cockHead " + cockIdx + "] wedged firmly against her cervix, the [pc.cumColor] fluid injects directly into her womb. Spurts and strings of [pc.cum] spread inside her lovingly warm Terran pussy, leaving it well-bred!");
	output("\n\nWith her orgasm spent and her belly full of seed, the wheezing Mirrin practically flops forward on top of you! She just about manages to hold herself up by her elbows, both of your panting mouths mere inches from each other. The look on the she-dragon’s face is one of pure admiration, her half-closed eyes having that glazed gleam of sensory stimulation that comes with a good, strong breeding. And then comes a kiss.");
	output("\n\nHer tongue-heavy mouth locks to your [pc.lips] and seems intent on staying there for all eternity. Her heavy, hulking form heaves with hormone-enriched muscle, curving over you as if wanting to protect you during this moment of tenderness.");
	output("\n\nYou’re made aware of an elephant, or elephants, in the room: two flared cocks that are still rock hard and dribbling smoke-scented pre-cum.");
	output("\n\n<i>“MMmmfff, I gotta <b>unff</b> get rid of this thing,”</i> your dragon queen quietly whines, grinding her horsemembers against your front.");
	output("\n\nA devious plan quickly forms in your brain: what if you turn the tables...?");
	output("\n\n<i>“Need some help...?”</i> you say breathily, caressing and squeezing her tense shoulders now that your arms are free. The enervated she-dragon nods, her hefty frame buckling over to your side with a dense <i>thrump</i>.");
	output("\n\nShe lays on her back, horse legs spread so that her [pc.cumColor]-stained labia, horse-cocks and vibe stuffed ass are open and vulnerable. Now’s your chance.");
	output("\n\nWith a little effort, you pull yourself up and kneel next to her, placing a respective hand on her 16\" dong and the end of the still-buzzing vibe. She coos in approval, the sprawled out and subdued Mirrin leaving you to do your work.");
	output("\n\nShe’s already pretty close: you need only help her get to the end.");
	output("\n\nIn a haphazard unison, you rub your palm against her skyward shaft while gently sliding the erratic vibe in and out of her unresistant hole. She whimpers as you do, the cover under her claws now strained to tearing point. <i>“G-gentle, </i>bjáni<i>, fffffuck...”</i>");
	output("\n\nYeah, gentle, sure.");
	output("\n\nInstead, you take the chance to increase the pace, your palm becoming a grip around her flaring shaft and the dildo-fucking becoming deeper and faster. The she-dragon sucks in air through her teeth, whining as she is given a thorough milking. Damn, you’re really getting away with this! Now the dominator has become the domina-");
	output("\n\n<i>“Harder,”</i> comes a low growl.");
	output("\n\n<i>Uh oh</i>");
	output("\n\n<i>“HARDER,”</i> commands the qilin, grabbing the back of your head and smushing her forehead to yours. Her other hand has grabbed your [pc.cock " + cockIdx + "] like before, a tight and unearthly constriction that sets your heart rate higher. Her eyes are afire with need and now, you’re in no position to refuse...");
	output("\n\nYou continue to pump and grip the best you can, the energized dragoness boring into your soul with her red gryvain eyes. Through gritted teeth, she curses and chides you when you slip up or slow down. <i>“You can do <b>better</b>, </i>bjáni<i>!”</i>");
	output("\n\nQuickly, her commands devolve into gibbering wails as something physically bulges through her urethra!");

	//Orgasm event/PC lust reduced to 0. PC gains ‘Cum covered’ and ‘Sore’ status effects.
	pc.orgasm();
	pc.applyCumSoaked();
	soreDebuff(5);
	processTime(120);

	clearMenu();
	addButton(0,"Next",mirrinsTotallyFullOfDragonsBraah);
}

public function mirrinsTotallyFullOfDragonsBraah():void
{
	clearOutput();
	showMirrin(true);
	author("SoAndSo");

	output("You’re just about able to pull yourself back before both of her erect shafts unload thick, white ropes of scented sperm! They shoot towards the window, some of the ropes actually splattering against it with a thick force and there’s little sign of her stopping. The spasming dragoness violently grips at her rods and jerks them as hard as it seems she can: 33 hours of pent up seed unloaded within the space of a minute!");
	output("\n\nHer monster of a second climax abruptly ends with her slumping back against the bed, pulling you down with her. The vibe has somehow ended up in your hands, finally dislodged: It’s at least a foot long, how the hell did she survive?? You look at the damage done from below: it’s almost a work of modern art with streaks and pools of the stuff forming all over the bed, floor and window. Several litres of wasted seed at least...");
	output("\n\nYou’re now firmly gripped in the wheezing qilin’s arms, head resting on her mountainous shoulder.");
	output("\n\n<i>“Takk....takk fyrir...”</i> she whispers into your closest [pc.ear], her hand draped over your [pc.hip].");
	output("\n\nYou lay together in each other’s heat, chests heaving from the sojourn. Mirrin has her eyes pointed to the ceiling, lids drooping and fluttering as she calms down from her orgiastic high.");
	output("\n\n<i>“I’ve uh... thought of names, you know,”</i> she half whispers, caressing her fluid filled belly with maternal tenderness.");
	output("\n\n<i>“I’m thinking... ‘Torri’. Torri Mirrinsduttir. Cuz you know, gryvain births are almost always... uhhh, thing thing, uuh, monogendered.”</i>");
	output("\n\n<i>“Torri, Torri... I like it,”</i> you whisper back, much to Mirrin’s silent delight. <i>“But maybe there’s a chance that it’s a boy...?”</i>");
	output("\n\n<i>“Ehh, father would throttle me if I didn’t say ‘Arkos’ but fuck that! He’ll be Einar, Einar Mirrinsonne. And whoever it ends up being will be beautiful...”</i> she chuckles, her eyes fluttering as she seems to drift off to sleep.");
	output("\n\nYeah, a little nap would be good right now...");

	clearMenu();
	addButton(0,"Next",wakeUpToFreshlyBredMirrin,1);
}

public function mirrinBabesAllOverThePlace():void
{
	// Router bullshittery
	if (flags["MIRRIN_PUMPCOCK"] == undefined) return penisRouter([function(cockIdx:int):void
	{
		flags["MIRRIN_PUMPCOCK"] = cockIdx;
		mirrinBabesAllOverThePlace();
	}, mirrinMaxSize, false]);
	if (flags["MIRRIN_PUMPCUNT"] == undefined) return vaginaRouter([function(vagIdx:int):void
	{
		flags["MIRRIN_PUMPCUNT"] = vagIdx;
		mirrinBabesAllOverThePlace();
	},mirrin.cockVolume(0),0,-1]);

	var cockIdx:int = flags["MIRRIN_PUMPCOCK"];
	var vagIdx:int = flags["MIRRIN_PUMPCUNT"];
	flags["MIRRIN_PUMPCOCK"] = undefined;
	flags["MIRRIN_PUMPCUNT"] = undefined;

	//Real function starts here
	clearOutput();
	showMirrin(true);
	author("SoAndSo");

	output("Here’s a crazy thought: the <i>both</i> of you impregnating each other! Now wouldn’t that be something...");
	output("\n\nYou lay back on the bed and idle fondle [pc.eachCock] while giving her viewing access to your [pc.pussy " + vagIdx + "]. You point to both sets of breeding tools and then to Mirrin, hoping she’ll get it.");
	output("\n\n<i>“<b>Both</b> of us?,”</i> she asks in disbelief, raising a skeptical eyebrow. <i>“Crazy or ambitious, I can never tell with you. But you know, let’s... let us, uuuhhh, try it.”</i>");
	output("\n\nShe leans forward a little, pushing her perfectly proportioned E-cup bust out for a tease. But she has her hands behind her, grasping at... oh.");
	output("\n\nWith a swift motion and an obviously painful grunt, the qilin pulls out the vibe and dismantles the apparatus covering her horse-cocks. <i>“Glad to be rid of this fucking... fucking, fucking thing,”</i> she says in irritation while tossing the wired mess aside.");
	output("\n\nIn another equally smooth motion, she physically tears the binding that holds her hair into a ponytail and the full, two foot mane of green-tinted silver flows down her shoulders. Glorious.");
	output("\n\nYou recline on your back, eyeing the muscled beast as she gathers something from a set of drawers: EasyFit?");
	if (pc.cLength(cockIdx) > 24)
	{
		output("\n\nAnd Condensol...Plus? She tosses you the pack of Condensol.");
		output("\n\n<i>“Hey, big as I am, even I have limits,”</i> she shrugs. You’re tempted to ask why she never uses it herself but get the impression it wouldn’t be a satisfying answer for you...");
		output("\n\nWithout hesitation, you swallow a single pill of Condensol and wait for the changes in [pc.eachCock] to take hold. The physical recession of matter feels strange but the resulting reduction is sure to be enough for your dragon queen.");
	}
	output("\n\nShe grins at you with that knowing ‘I’m going to fuck you to death’ grin, idly rubbing some of the EasyFit cream on her twin shafts. Of course, this is your turn for it to go both ways if she so permits...");
	output("\n\n<i>“So what to do first...”</i> she ponders, rubbing both her flared tips with her palms. Mirrin is quick to clamber onto the bed and line herself up with your laid out form. She’s just as quick to grab and then sling your [pc.legOrLegs] up to her shoulder");
	if (pc.tallness >= 84) output(" with your [pc.footOrFeet] resting comfortably on the rock-hard muscle");
	output(". Guess it’s your turn to receive first! Oh boy...");
	output("\n\n<i>“I’ll always love this: getting physical, ready to bend you around and then just... <b>brrrreed</b> you,”</i> she half-whispers through her teeth, hefting and then grinding her double-meat against your exposed [pc.groin]. The incessant friction is more than enough to excite your [pc.cock " + cockIdx + "] and [pc.pussy " + vagIdx + "] to pumped up arousal much to Mirrin’s delight.");
	output("\n\nShe draws her hips back to the same distance as her fully erect 16\" shaft.");
	output("\n\nHowever, instead of lining up her largest member, she opts for her second 12\" shaft and shunts it unceremoniously into your [pc.cunt " + vagIdx + "]!");
	pc.cuntChange(vagIdx,mirrin.cockVolume(1));
	output("\n\nYou cry out at the sudden insertion: in spite of the smaller length and width, a foot long cock is a foot long cock! The flared tip feels like it’s lodging itself inside you and her other beastcock is weighing heavily on [pc.eachCock], causing an ache to takeover your " + (pc.hasCocks() ? "shafts." : "shaft."));
	output("\n\n<i>“Unggh! Never get tired of doing that,”</i> she exclaims loudly with gritted teeth, her rough hands gripping both your [pc.cock " + cockIdx + "] and her horse-cock together. While you’re subjugated by her secondary member within you, the dragoness administers a lovingly slow squeeze around your combined members.");
	output("\n\nDespite the rough skin of her two palms, it’s a very pleasurable experience and one that draws out gasps and groans from your [pc.lipsChaste] when she hits a particularly sensitive spot. Mirrin seems intent on keeping it gentle slow for now, the twitching mini-member within you having now fitted to your welcoming, warm and wetted breeding hole over the duration.");
	output("\n\nA tender minute passes and the muscled draconid draws her hips back, her foot long beast cock following. The sudden change in state makes you wince and wail: now the breeding begins...");
	output("\n\nHer rhythm is long and deep, a little gyration here and there to really explore all the corners of your inner [pc.vaginaNounSimple " + vagIdx + "]. The EasyFit has really done its work: even though you’ve taken her before, her second shaft is a much more comfortable fit! The resulting abdominal bulge is almost rather cute!");
	output("\n\nYou dragon lover groans in content every time she bottoms you out, her powerful hips meeting your [pc.ass] with gentle smacking sounds, and each hump sends nerve-deep pleasure through your body.");
	output("\n\n<i>“Thaaat’s it, [pc.name], work with it,”</i> she half-whispers, letting go of your combined members and then leaning in so that your [pc.knees] are now squished against your [pc.chest]. It’s a little bit awkward and you imagine that was the intention... and now that her hands are planted either side of your shoulders into the bed, you’re fully pinned!");
	output("\n\nWith a primal growl, her slow and deep rhythm kicks up a couple of notches! She starts to hammer her hips, her hard horsemeat pistoning in and out of your [pc.pussy " + vagIdx + "] with primal ferocity.");
	output("\n\nYou have the urgent need to hold on to something for stability and your hands find themselves around the dragon’s tree-trunk wrists. She grunts in acknowledgment, her forehead touching yours so that her red, piercing eyes become the only thing you can see.");
	output("\n\nNow in a fully hunched-over position, her body heat is overwhelming. The claustrophobic space is exacerbated by the rising aggression in her breeding of your womb and [pc.cunt " + vagIdx + "]!");
	output("\n\n<i>“Gonnabreedyou, fuckingperfectpieceof <b>UNNNG</b>!”</i>");
	output("\n\nWithout warning, the wailing qilin arches herself upwards, <i>slams</i> her hips against your [pc.ass] and then...");
	output("\n\nThe tell-tale twitch and pulse of her double-meat gives way to a visible bulge surging through her biggest horse-cock! Oh shi-");
	output("\n\nA thick, far-reaching deluge of smoky dragon cream erupts from the flaring tip, shooting over your prone form to the end of the bed! Simultaneously, the cervix-locked twelve incher within you unloads a strong flood of the dragon’s baby batter directly into your womb!");
	output("\n\nYou whine in orgiastic joy as her powerful orgasm starts to inflate your [pc.belly] at a startlingly rapid rate. Your eyes roll back into your head as the experience of being bred by your dragon queen overwhelms you.");
	output("\n\nAnd she just keeps going! What feels like almost a minute of inflation and soaring ejaculate goes by in a chorus of throaty growls, your belly already looking like it’s in the final term of pregnancy!");
	output("\n\nWith a gasp, Mirrin’s");
	if (silly) output(" wicked sick hip hop rap");
	output(" flow seems to abate. With the both of you caught in breathlessness, you can only lay meekly beneath her while she roughly squeezes out the last of her seed into your open mouth. As a blessing, there isn’t much to swallow, prompting you to glug the dribbling sauce willingly. You even lick your [pc.lips] for the qilin’s viewing pleasure much to her delighted grin.");
	output("\n\nYou both have a breather, the spent dragoness gently withdrawing her cum-dripping cock from your flooded insides. Against expectations, very little of her seed actually leaves your parted pussy lips: a fine sheen coats your labia and yet there’s nothing else.");
	output("\n\nWith a deep inhale and exhale, your dragonic lover grabs you by your [pc.legOrLegs]! She yanks you towards the edge of the bed and lets your [pc.legOrLegs] hang over the edge. You hadn’t even noticed that [pc.eachCock] hadn’t even had release!");
	output("\n\nAs her palms apply some abrasive pumps to your [pc.cock " + cockIdx + "], the re-energized and breathy Mirrin has a determined look on her tense face: she <i>will</i> get her babies, costs regardless!");
	output("\n\nOnce she’s satisfied, she turns about with her tail-brushed ass hovering right above her shaft of choice. She guides it towards her slightly parted Terran slit, the [pc.cockHead " + cockIdx + "] pulsing just above her grip with its own anticipation. You figure it’s best to let her have her way: you’re so battered and cum-filled that movement is a chore.");
	output("\n\nWith a heft <i>smack</i>, the she-dragon hammers her lower body onto your [pc.cock " + cockIdx + "], catching you by surprise. You groan as 600lbs of muscle compresses you into the bed!");
	if (silly) output(" THE SNU-SNU COMETH!");
	pc.cockChange();
	output("\n\nFuck, just how strong is this thing?!");
	output("\n\n<i>“Ach..! Mirrin!”</i> you call out while trying to breathe.");
	output("\n\nYou hear a teasing laugh from up above, the lusty qilin relenting just enough to give you some breathing room.");
	output("\n\n<i>“Mmmhaha! Too easy!”</i> she calls out, flicking her tail away from the view of her muscled behind. Still chuckling herself, Mirrin starts the second part of her babymaking journey: milking your [pc.balls] for every drop of [pc.cum]!");
	output("\n\nStarting off slow, she reclines backwards onto her palms so that you don’t have to bear her weight. In an effort to adjust to your [pc.cockShape " + cockIdx + "] member, she grinds her lower half left and right, round and round until the tight, hot and wet depths of her inviting breedhole have formally welcomed you inside. And tight she is! Dare you say almost virginal...?");
	output("\n\nShe has no trouble using it, at least!");
	output("\n\nSatisfied with the impression your meat is making on her body, she begins to lightly bounce on your [pc.cock " + cockIdx + "] and lap. The dragoness still goes slowly, perhaps out of tiredness or perhaps to savour the moment, it’s not clear. You can hear her though: a surprisingly feminine, husky coo of approval with every hump. There’s a subtle sense of pride welling in you for having her tap into her feminine side just a bit more.");
	output("\n\nShe slows and stops abruptly, awkwardly pushing herself onto the bed and adopting a messy kneeling position. Her flowing silver mane comes to rest on her back and her tail hangs loosely over your [pc.belly], her muscled buns emphasized by her arched back and flattened thighs.");
	output("\n\nVery quickly, her rhythm becomes more and more intense!");
	output("\n\nThe tight squeeze of her breeding hole is so complete that each of her humps threatens to make you cum at any moment. The faster she rides, the harder her butt-smacks against your [pc.hips] become and you’re certain you’ll be feeling bruises when this is over!");
	output("\n\nThen, there’s the twinge: a deep sense of release within your loins. Oh fu-");
	output("\n\nWith a throaty, loud groan, the hot seed within your [pc.balls] surges through your [pc.eachCock]! Anticipating this, Mirrin slams her body down as before, pinning you down to the bed with her pussy and hips!");
	output("\n\nWith the [pc.cockHead " + cockIdx + "] lodged firmly against her cervix, the rising wave of [pc.cum] can only go one way! [pc.cumVisc] seed shoots almost directly into her awaiting womb, forced in even further by the locking of her inner muscles around your [pc.cock " + cockIdx + "]!");
	output("\n\n<i>“Mmmmfuuu...fuuck! Fill me, fill me!”</i> wails the insensate qilin as she grabs her belly, her powerful thighs on the verge of crushing your [pc.hips] to dust.");
	var cumQ:Number = pc.cumQ();
	if (cumQ > 10000) output("\n\nYou can hear her chant for more and more of your seed as she grips at her midriff. At this rate, she’ll gain a faux-bump just like you! It continues until warm seed breaks the seal of your shaft and her well-fucked pussy, a gooey [pc.cumColor] mess forming all over your lap and the bed.");
	else output("\n\nYou can hear her chant for more and more of your seed as she grips at her midriff. Your shaft does its best to output as much as it can and you can feel it leak a little around your [pc.cockHead " + cockIdx + "]. She’ll be just as well bred as you by the end of this, quantity aside.");
	output("\n\nAs your orgasm dies down, the euphoric qilin slovenly slips off of your lap, leaving your [pc.eachCock] to soften in the cool air of the room. A little [pc.cumColor] trail of fluid drips from Mirrin’s well-bred, gaping pussy.");
	if (cumQ > 10000) output(" You’re surprised by how little there is considering just how much you pumped into her! She’s looking positively gravid to boot, as if already in the final stage of pregnancy.");
	output("\n\nShe lays on her side with her eyes level to yours.");
	output("\n\n<i>“Mmhmm, how wonderful,”</i> she whispers, trailing a claw over your bloated womb. <i>“I feel like I could...”</i>");
	output("\n\nShe giggles, pecking you light on the cheek while slowly dragging you into her arms.");
	output("\n\nYou both lay there breathlessly for a tender few minutes, the mutual afterglow of riotous breeding soothing your bodies together.");
	output("\n\n<i>“I’ve uh... thought of names, you know,”</i> she half whispers, caressing her fluid filled belly with maternal tenderness.");
	output("\n\n<i>“I’m thinking... ‘Torri’. Torri Mirrinsduttir. Cuz you know, gryvain births are almost always... uhhh, thing thing, uuh, monogendered.”</i>");
	output("\n\n<i>“Torri, Torri... I like it,”</i> you whisper back, much to Mirrin’s silent delight. <i>“But maybe there’s a chance that it’s a boy...?”</i>");
	output("\n\n<i>“Ehh, father would throttle me if I didn’t say ‘Arkos’ but fuck that! He’ll be Einar, Einar Mirrinsonne. And whoever it ends up being will be beautiful...”</i> she chuckles, her eyes fluttering as she seems to drift off to sleep.");
	output("\n\nYeah, a little nap would be good right now...");

	//Orgasm event/PC lust reduced to 0. PC gains ‘Cum covered’, ‘Vaginally Filled’ and ‘Sore’ status effects. Bring up cock and vagina selector screen thing.
	pc.orgasm();
	pc.loadInCunt(mirrin,vagIdx);
	pc.applyCumSoaked();
	soreDebuff(5);
	processTime(120);

	clearMenu();
	addButton(0,"Next",wakeUpToFreshlyBredMirrin,2);
}

//scene: prev scene - 0 get pump - 1 pump her - 2 pump both
public function wakeUpToFreshlyBredMirrin(scene:int):void
{
	clearOutput();
	showMirrin(true);
	author("SoAndSo");

	output("You wake up from a peaceful, hazy sleep.");
	output("\n\nIt takes a few moments for your eyes to get used to the dawn light that enters the ranch.");
	output("\n\nHaving a feel for where you are, your fingers grip at soft vinyl that feels playfully squishy in your hands. Hehe, squish...");
	output("\n\nLooking around you, you’re laid out on a large, black couch with a light blanket covering most of your nude form. What were you doing here again...? A pang of an ache in your lower abdomen is enough to remind you. Breeding...dragons...?");
	if (scene != 1) output("\n\nA heavy sense of weight in your womb makes itself known with a slosh and a groan. Peering down, you can see the result of your endeavours: an inflated, bulging womb full of qilin seed! You idly rub the [pc.skinFurScales] of your [pc.belly] and smile with the warmth you feel in your lower body.");
	if (pc.hasCock()) output("\n\nYour battered [pc.hips] and [pc.groin] feel thoroughly used and sore, almost to the point of pain. It’s a well-earned pain, however: anything to make you dragon queen happy, right...?");
	output("\n\nYou can hear hissing, fizzling and clinking sounds from some other side of the house: the sounds of cooking. A groan of hunger follows, instincts goading you to find the source.");
	output("\n\nWith a little effort, you haul yourself up to standing height, a little weak in your [pc.knees]. You wrap the blanket around your shoulders for a little more warmth, particularly around your [pc.groin]" + (scene != 1 ? " and [pc.belly]." : "."));
	output("\n\nYou slowly lumber along to where the sounds are echoing from while using the few walls in between ‘rooms’ for support. As you turn a corner, guided by an overhead array of mood lights, you find Mirrin in the nude with a pan and flipper in her hands. She turns as she hears you wander in.");
	output("\n\n<i>“Oo, oo, wait wait,”</i> she says, quickly setting her tools down and rushing over to you.");
	output("\n\nYou’re fine though, it’s just tire-");
	output("\n\nOne hand holds you by the lower back and the other on your [pc.hip], the two guiding you to sit on a stool nearby. <i>“Theeere, there,”</i> says the relieved Mirrin, a tired but peaceful look in her eyes.");
	output("\n\n<i>“I’m ok, ya big dummy,”</i> you say with a weak chuckle, patting her tensed up forearm. She rubs her brow as she hears it.");
	output("\n\n<i>“Yeeeah but fuck, I was pretty, uhhh, pretty aggro, no? Keep thinking I broke your spine half the time,”</i> she sighs, gnawing on a knuckle in worry. You tell her to relax: a squeeze on her hand from you helps.");
	output("\n\n<i>“Ah shit,”</i> she says under her breath, quickly getting back to her cooking station. You can see two medium sized bowls next to the stove, various kinds of salad leaves and colorful vegetables lining the insides. Oooo, wonder what dish this could be?");
	if (scene != 0 && pc.cumQ() > 10000) output("\n\nYou notice that her bare abs bulge outward slightly, although less than you remember from when you <i>really</i> unloaded in her. Still, it seems she is very content to keep as much of your breeding seed as she’s comfortable with. You think about what she’ll look like with a fully, heavy belly bearing a child and it’s... an interesting image.");
	output("\n\nYou spend a moment gazing out of the wide window wall behind you, the distant New Texas sun brightening in color and warmth every passing second. You have a quick think about how your " + (scene != 2 ? "child might turn out: will it" : "children might turn out: will they") + " be mostly human or mostly gryvain? Or something else, even. It’s difficult to know when Mirrin herself is quite the modded beast.");
	output("\n\n<i>“All done,”</i> she calls out over the dying sounds of sizzling <i>something</i>, elegantly spooning hot foodstuff into the leaf-laden bowls. A serving in both palms with a fork under each thumb, she hands you one and leans against the wall next to you with the other.");
	output("\n\n<i>“Eat up, is good,”</i> she encourages, piercing some dressed leaves and chewing them rather slowly. Well, you’ve no reason to turn down free food!");
	output("\n\nYou have a quick look at the steaming ensemble under your nose. Familiar looking salad is pressed under a mix of rocket leaves, diced tender pork and golden colored egg with a sprinkling of a sweet smelling dressing adorning the fresh mess.");
	output("\n\nWithout much thought, you’re already diving into it with your fork.");
	output("\n\n<i>“Good, yes? Perfect wake up food,”</i> she comments, smiling at you.");
	if (scene != 1) output(" <i>“I wonder how you’ll be a few weeks down the line with a baby. I’ll have to put you on my meat-heavy diet, huh? Heh.”</i>");
	output("\n\nYou nod with a beaming smile, savouring the salty sweet taste of pork, dressing and egg at the same time. She’s a true foodie it seems, although that’s not so surprising given her physical needs.");
	output("\n\n<i>“Mm, so I guess... us,”</i> she starts, gesturing between the both of you. <i>“It’s more than just ‘friendly’ now, right? And maybe more than just girlfriend or boyfriend or whatever. Maybe...”</i>");
	output("\n\nShe pauses, sauntering over to your side and placing a clawed hand on your shoulder.");
	output("\n\n<i>“Whatever this all turns out to be, I’m glad it’s you, [pc.name]. I haven’t felt this... <b>real</b> in a long, long time. And... and...”</i>");
	output("\n\nShe seems to have trouble finding the right words but you place your hand on hers and mouth <i>“don’t worry about it”</i> to her. You feel her grip go at ease as she exhales through her nose in relief.");
	output("\n\n<i>“I-I guess I’m just worried. All new to me, super new. Being a " + ["father", "mother", "father AND mother"][scene] + " is something that’s uhh, probably messing with my head and I don’t want it to come back on you,”</i> she says softly, rubbing the back of her fingers against your neck.");
	output("\n\n<i>“I’m going to be busy for a while, so... we’ll be apart for a bit. It’ll be brief... Oh also, I put your things near the couch where you woke up.");
	if (pc.hasStatusEffect("Cum Soaked")) output(" I hope you uh, don’t mind that I left you a little [pc.cumColor] and dirty, it’s... easy on the nose.");
	output(" I booked my physician to fly out here. I am making damn sure this thing goes smoothly and he’s a crazy genius,”</i> says Mirrin, lazily laying her arms over your shoulders from behind you.");
	output("\n\nYou finish up your bowl of pork’n’egg salad and place it on a table in arms reach, leaning back against your mountainous qilin lover.");
	output("\n\n<i>“So when’s that happening, then?”</i> you ask, idly playing with one of her claws. <i>“Guess I have to stick around?”</i>");
	output("\n\n<i>“No no, I’ll send a mail or something. Wouldn’t want to tie a free spirit down more than I already try to, huh? Hmmhmm...”</i>");
	output("\n\nShe nuzzles the top of your [pc.hair] with her nose, your head getting smushed between her soft cleavage.");
	output("\n\n<i>“Fuck, does that make me a MILF now?”</i> she half-whispers, as if locked in a moment of epiphany.");
	if (scene != 0)
	{
		output("\n\n<i>“Double fuck, also means I’m gonna get more of this chest meat, huh?”</i>");
		output("\n\nShe gently squeezes her ample jugs against your head with a chuckle, just long enough to warm your [pc.ears].");
	}
	output("\n\nYou both spend a long, peaceful period just talking about what-ifs and bad jokes, idling the time away in each others lax embrace. It’s a wonder to find out how long she’s been hiding this side of herself, especially given her self-driven isolation before you knew each other.");
	output("\n\nA beep comes the other room. <i>“Damnit... just wanted to... apparently, my loving fanbase needs me, </i>elskan<i>. You don’t mind if...?”</i>");
	output("\n\nYou shake your head, acknowledging that she has her commitments. You gather up your things and make sure everything is together.");
	if (pc.hasArmor() && scene != 1) output("\n\nYou find that getting your [pc.gear] on is a bit of a struggle with the newly inflated belly but it does leave a nice and tight imprint on the material when you’re finished putting everything on.");
	output("\n\nShe returns to find you ready to leave and with a full bodied, gentle hug for a goodbye, she takes you to her door and waves as you leave for adventure.");

	//In game time jumps ahead 6 in-game hours. PC moves to ship. Mirrin becomes unavailable until PC reads ‘Doctor Appointment’ email.
	processTime(6*60);
	flags["MIRRIN_PREGSTAGE"] = 5+scene;
	flags["MIRRIN_PREGMAIL_TIMESTAMP"] = GetGameTimestamp() + 7*24*60 + rand(7*24*60);
	IncrementFlag("MIRRIN_SEXED");

	clearMenu();
	addButton(0,"Next",move,shipLocation);
}

public function mirrinNotPregEmail():String
{
	var ret:String = "Steele, doc’s in. Don’t worry about how I got your address, it’s just a thing.";
	ret += "\n\nHope you’re doing well, hope you’ve been staying out of trouble. You make me worry, you know? I brought in my personal doctor, his name’s Belker. Does all kinds of things but he’s the guy who consulted me on my mod procedures all those years back. He can handle baby stuff no problem. Find me at the usual spot, I’ll be doing some light routines. Oh and try not to do anything too exertive, ok?";
	if (flags["MIRRIN_PREGSTAGE"] != 6) ret += " It’s my damn baby you got in there.";
	else ret += " I don’t want to be gentle with you with a broken shoulder or whatever the fuck.";
	ret += " Also, none of those diseases. Not sure if he’ll even do it otherwise. I’m trusting you on that, okay?";
	ret += "\n\n<i>Okay?</i> bjani, typing on this thingg--";
	ret += "\n\nActually no, he’s a doctor, it should be okay.";
	ret += "\n\nAnyway, get that cute butt of yours back here or I’ll have to find you and drag you by the hair. Although knowing you, that’d be preferable, right? XxX";
	ret += "\n\nBut please come ASAP, for the kids sake";
	if (flags["MIRRIN_PREGSTAGE"] == 7) ret += "s";
	ret += ". Much love,";
	ret += "\n\nMirrin XxX";
	ret += "\n\nP.S. a little something for you, elskan";
	ret += "\n\n<i>The email comes with an attachment: a full nude shot of your qilin lover with her double-shafts fully hard. A barely fitting white sheet covers the shafts so that the flared tips poke through proudly. Hot damn...</i>";

	return ret;
}

public function PCFinallyGetsToPlayDoctorsAndDragons():void
{
	clearOutput();
	showMirrin();
	showName("MIRRIN\n& DR. BELKER");
	author("SoAndSo");

	output("You catch Mirrin at a lull in the crowd, the gym oddly empty at this hour. She’s doing some rather conservative exercises, mostly handbells and arm stretches.");
	output("\n\nShe spots you approaching in the giant mirror along the wall and puts her weights away in their rightful places. With a wave to each other, you meet in the middle and the qilin immediately puts her arms around you in a rushed hug. Achh..!");
	output("\n\n<i>“Steele! Fuck, so glad, so glad. Can’t believe how worked up I’ve been, worrying and oh-”</i>");
	output("\n\nShe lets go once she hears your gasps for breath. You lean against her for a few moments as you inhale deeply. Jeez, where was the warning...");
	output("\n\n<i>“Eeeh, sorry, I uh, got carried away,”</i> she loosely apologises, a somewhat blank look on her face. <i>“But yeah, shit, I’m excited. Doc’s here and it’s going to be... going to be great, I can feel it!”</i>");
	output("\n\nYou’re finding it hard to not have a little enthusiasm: you’re going to be parents! Every detail about your " + (flags["MIRRIN_PREGSTAGE"] == 7 ? "children" : "child") + "-to-be would be like a little treasure from the heavens.");
	output("\n\nA well-to-do looking ausar male appears from around the corner of the entrance, looking very out of place in the world of bulls and cows. He’s dressed rather plainly in white shirt and blue shorts, a heavy looking duffle bag over his shoulder.");
	output("\n\n<i>“Heeeey, Mirrin, how ya doing?”</i> he greets, walking with his hand outstretched for a shake.");
	output("\n\n<i>“Ah, Belker, made it ok! Flight good? Everything go smoothly?”</i>");
	output("\n\n<i>“Mhmm, all fine, no worries about me. I’m more worried about you and your friend here, really. Complex cross-species pregnancies always raise my worry levels,”</i> he says, turning to you.");
	output("\n\n<i>“Hey, name’s Belker, general health fixer-upper,”</i> he greets, offering his hand for a shake.");
	output("\n\n<i>“[pc.name] Steele,”</i> you say politely, returning the shake. His eyebrow raises slightly.");
	output("\n\n<i>“Ahh, I see. Very well then, [pc.MisterMiss] Steele, I’ll be blunt: this won’t be invasive but it might be uncomfortable. I just need to run a few tests to see if everything is going accordingly while also cleaning up any underlying health problems,”</i> he assures you with a warmth and understanding in his voice. You ask him what tests he needs to perform.");
	output("\n\n<i>“Oh, simple x-rays, content measuring, ultrasound, general STD shot, a special something for Mirrin here,”</i> he explains, Mirrin audibly huffing behind him.");
	output("\n\n<i>“Fuck...”</i> she says under her breath.");
	output("\n\n<i>“You remember what I said, it’s not likely that this is going to bring success by normal means. Could’ve even gotten worse over time,”</i> he says with a wry grin, fiddling the items in his duffle bag. The tests are short and clean. Most of them involve him holding devices to your lower body and then noting the results, followed by a short round of general STD cleansers.");
	if (pc.hasSSTD()) output(" Good thing he’s got that at hand, you being the galaxy’s bicycle that you seem to be.");
	output(" He does the same for Mirrin, although her ‘extra’ test comes from him measuring something from a tightly sealed container of suspiciously familiar white fluid. Once he’s done with her, your qilin lover stands by your side, her hand wrapping loosely around your [pc.hip]. <i>“All good?”</i> she asks, squeezing you to her warm body.");
	output("\n\nYou nod, doing the same with your hand to her hip. Several beeps come out of the doctor’s devices, a dissonant mess of irregular rhythms.");
	output("\n\n<i>“Oh right, here we go. Let’s just read... ah, okay. Yeah, it’s as I thought,”</i> he says flatly, wrinkling his nose and sniffing.");
	switch (flags["MIRRIN_PREGSTAGE"])
	{
		case 5: output("\n\n<i>“You’re not pregnant, [pc.name]”</i>"); break;
		case 6: output("\n\n<i>“You’re not pregnant, Mirrin,”</i>"); break;
		case 7: output("\n\n<i>“Neither of you are pregnant.”</i>"); break;
	}
	output(" he says in a flat tone, standing up from his bag with his hands on his hips.");
	output("\n\n<i>“Fuckkk, I knew it,”</i> blurts out Mirrin, rubbing her face with her palm. <i>“It’s me, right? Always this stupid, <b>fokking</b> body.”</i>");
	output("\n\nShe lets go of your hip and stares herself down in the mirror, a thousand mile glare in her red eyes. <i>“Stupid, stupid... </i>bjániiii<i>,”</i> is what you can hear her say to herself. You can’t help but feel a little dejected by the revelation.");
	output("\n\nYou ask the doc what you can both do next.");
	output("\n\n<i>“Oh it’s very simple, just use Priapin and Breeders Bliss at the same time. I even brought some, free of charge, because I knew our friend here would be quite stubborn about it,”</i> he explains casually, digging once again into his bag.");
	output("\n\n<i>“Uegh, more needles. I suppose if it’s just one or two more, though...”</i> she sighs as she rubs her brow with a hand. <i>“Fiiine.”</i>");
	output("\n\nYou smile, knowing she’d see sense eventually. The doctor puts a handful of packets in her hands, seven in total.");
	output("\n\n<i>“Three of each, just in case. Also a little something if you want a speedier pregnancy, Mirrin,”</i> he winks, patting her shoulder. <i>“I’ll still be around for a few days before I fly back, you know where I’m staying.”</i>");
	output("\n\nWith that, the doctor hurriedly gathers his things and walks out.");
	output("\n\n<i>“Never one for chatting, the guy. Shit, I just... I just hate all these needles. Relying on drugs...”</i> says the dragoness, analyzing the packs of Priapin and Breeders Bliss. There’s also something called Coetilozaotine-B-S, contained in a more anodyne pill bottle. You ask her what the hang up is.");
	output("\n\n<i>“I just get really aggro when I take these. Like, properly aggro. Although knowing you, you’re probably into that,”</i> she chuckles, stowing the mods away. She puts herself behind you and places her hands on your shoulders.");
	output("\n\n<i>“So how about round two?”</i>");

	pc.removeSSTDs();
	processTime(12);
	clearMenu();
	addButton(0,"Yeah!",function():void
	{
		clearOutput();
		showMirrin();
		author("SoAndSo");
		output("You’re so ready. You push her hands away, turn around and " + (pc.tallness < 84 ? "pull on the back of her neck with your hands, kissing her on the lips" : "give her a surprise kiss on the lips") + ". Taken aback, she lets you engage tongues but breaks it off after a few precious seconds.");
		output("\n\n<i>“Ey ey, that’s my part, you... whatever,”</i> she flusters, playfully grabbing your right wrist and hurriedly pulling you towards the gym’s exit. You both laugh, a renewed sense of anticipation being shared.");
		output("\n\nIt’s a quicker trip to Mirrin’s house than usual, the both of you having trouble keeping each other’s hands to themselves. Her security guard greets you as you both reach the house, a knowing smirk on his face.");
		output("\n\nOnce you’re through the doors and into the main room, the she-dragon pushes you up to the wall with an arm over your shoulder and a palm planted firmly against the surface.");
		output("\n\n<i>“So now I’m wondering about we do this...”</i> she says with a breathy, smoky voice.");
		pc.changeLust(pc.lustMax());
		processTime(2);
		clearMenu();
		// [Get Preg] ded
		if (pc.cockThatFits(mirrinMaxSize) < 0) addDisabledButton(0,"Preg Her");
		else addButton(0,"Preg Her",penisRouter,[mirrinGetsDragonBabusForRealThisTime,mirrinMaxSize,false],"Preg Her","Get aggressively, most assuredly power-bottomed.");
		if (!pc.hasVagina() || pc.cockThatFits(mirrinMaxSize) < 0) addDisabledButton(1,"Preg Both");
		else addButton(1,"Preg Both",mirrinTriesForPregAgainThisTimeWithAdvantage,undefined,"Preg Both","Both of you get very pregnant.");
		if (!pc.hasVagina()) addDisabledButton(2,"Live Preg...?");
		else addButton(2,"Live Preg...?",vaginaRouter,[mirrinAndSteeleRecordAnEducationalVideo,mirrin.cockVolume(0),0,-1],"Live Preg...?","Get aggressively, most assuredly pregnant in front of a live studio audience.");
	},undefined,"Yeah!","<b>It’s breedin’ time.</b>");
}

public function mirrinGetsDragonBabusForRealThisTime(cockIdx:int):void
{
	clearOutput();
	showMirrin(true);
	author("SoAndSo");

	output("<i>“Actually, why am I even thinking about it,”</i> she says in surprise, looking off to her left as if actually thinking about ‘thinking about it’.");
	output("\n\n<i>“Stick to the plan, stick to the plan...”</i>");
	output("\n\nOut of nowhere, she slams her palms against the wall underneath your armpits.");
	if (pc.tallness < 84) output("\n\nShe hooks you up with her rippling, tree-trunk forearms, forcing you to tiptoe a little!");
	else output("\n\nWith seamless ease, she hooks you up off the floor, your hands scrabbling to grab onto her forearms while your feet dangle in the air!");
	output("\n\n<i>“Better,”</i> whispers the smirking qilin, leaning into you so that her tightly bound bust squishes against your [pc.chest]. With you now pinned where she wants you, Mirrin pushes her O-forming lips towards yours. Taking the hint, you welcome her kiss, [pc.lipsChaste] locking in sensual slowness with her mouth.");
	output("\n\nYour tongues take turns in play-fighting each other: one moment, your [pc.tongue] suppresses and twists around hers and the other, her foot long, dragonic tongue wraps around yours in totality, bringing it low.");
	output("\n\nOne passionate exchange after the other, you feel the palpitation of arousal warm your extremities and blur your thoughts. Mirrin feels it too, her movements and tones becoming all the more excited and frisky.");
	output("\n\nShe pulls away unexpectedly, her tongue taking a second or two to fully leave your mouth. The dragoness wipes her jaw clean, breathing huskily as if having done a light jog.");
	output("\n\n<i>“Enough of that: babies, give, now,”</i> she growls, pressing her forehead to yours. Her unavoidable gaze of red, slitted orbs bores into you for some tense seconds.");
	if (pc.hasVagina())
	{
		output("\n\n<i>“Normally, I’d just take what’s mine and... and <b>pound</b> on the floor like some brundþró begging for it...”</i> she begins, a palm sliding over your [pc.belly].");
		output("\n\n<i>“But then now I’m feeling a little uhhhh... generous, I guess you could say.”</i>");
	}
	else
	{
		output("\n\n<i>“I’ll take what’s mine and you’ll <b>love</b> it. Imagine...”</i> she half-whispers, a palm reaching for your [pc.belly].");
		output("\n\n<i>“Me bearing your child...”</i>");
	}
	output("\n\nYou can’t help but grin at the thought, the intent to breed and make life adding texture and fuzziness to your bodily arousal. Mirrin grins back, giggling in a way that breaks through her usually bullish mien.");
	output("\n\nShe pulls back her arms, letting you " + (pc.tallness < 84 ? "fall to your [pc.feet], holding you by the waist so that you don’t fall." : "slip down onto your [pc.feet]."));
	output("\n\n<i>“Bedroom, go,”</i> she directs, swatting you on the [pc.ass] with a playful slap. Well, that’s a done deal!");
	output("\n\nWith excitement and anticipation fuelling your mood, you dart for the ‘bedroom’" + (pc.isNude() ? "!" : ", taking your [pc.gear] off along the way in a haphazard rush!"));
	output("\n\nYou jump onto the bed, spreading your body against the soft, plush covers and getting reacquainted with its proportions. Mm, the feeling on your [pc.skinFurScales] is sensuous and warming!");
	output("\n\nThe <i>clop clop</i> of hooves comes from around the corner, a fully denuded Mirrin looming into view with the New Texas " + (hours > 20 || hours < 7 ? "moon" : "sun") + " texturizing her clay-red skin. You get a good look at the mountain-build qilin: a wall of muscle and curves, arms folded to hold up her heaving E-cups and her double-dicks protruding at half hardness towards you. Her smile is one of knowing and yet, you’re still not quite sure what she has planned for you...");
	output("\n\n<i>“Just relax, elskan,”</i> she coos, her voice calm and woozy. Mirrin walks herself to the front of the bed, lining herself up with your pelvis. Oooh, oral...?");
	output("\n\nAs that thought buzzes around, she kneels to the edge of the bed and pulls you to her by your [pc.hips]! It’s not rough but more... insistent.");
	output("\n\nWith your [pc.legs] now within waist-wrapping range,");
	if (silly) output(" picking the peppers of pied pipers pickled in piss penises,");
	output(" she gently grips at [pc.eachCock]");
	if (pc.balls > 0) output(" and [pc.balls] in turn");
	output(", inspecting and caressing every tender spot between her fingers. Even with the rough, calloused skin of her hands, the application is delicate and loving, making [pc.eachCock] harden in her grasp.");
	output("\n\n<i>“Awhah, always so eager to please me, hm?”</i> she teases, kissing the [pc.cockHead " + cockIdx + "] of your [pc.cock " + cockIdx + "].");
	output("\n\nRiiight there...");
	output("\n\nYou grip at the bed covers as she tends to your solid " + (silly ? "Snake" : "shaft") + ", your [pc.cockHead " + cockIdx + "] twitching between her hot, spit-lined lips.");
	output("\n\nHer hands grip at the [pc.sheath " + cockIdx + "] and begin pumping your [pc.cock " + cockIdx + "] with firm, slow rhythms. Her tongue tip laps, licks and slathers the tiny, sensitive hole of your gripped member, sending hot flashes of whine-inducing pleasure through your lower body. You can’t help but gasp as the shooting sensation tickles your nerves.");
	output("\n\nWith another girlish giggle, the she-dragon tightens her grip and pumps from [pc.knot " + cockIdx + "] to tip with dexterous motions. Combined with the tongue bath, it’s not long before your [pc.cock " + cockIdx + "] is wetted and properly prepped in her eyes.");
	output("\n\nMirrin lets go of your shaft, proceeding to clamber on top of you! The bed creaks and groans but seems to handle her weight all the same. Just how durable is this thing...?!");
	if (pc.cLength(cockIdx)) output("\n\nFirst things first, she reaches over to the side table for a usual jar of EasyFit. With a bit of wincing on her end, she reaches around and applies some of the cold cream to her honeybox. Beats Condensol anyhow!");
	output("\n\nShe positions herself over your [pc.belly], double-dongs now turgid and flared to their fullest, mere inches from your [pc.face]. With both hands, she searches for your [pc.cock " + cockIdx + "] behind her, grips it intently and guides the head to her awaiting slit.");
	output("\n\nThe lusty dragoness takes her time with teasing herself, using your [pc.cockHead " + cockIdx + "] to arouse her more. Her satisfied grin tells you all you need to know.");
	output("\n\n<i>“Here we go,”</i> she half-whispers, spearing herself on your unresistant tool. <i>“Rrrrright there, unff...”</i>");
	output("\n\nShe lowers herself all the way down to the [pc.knot " + cockIdx + "], stopping just shy of full penetration: saving a little room to move, you surmise.");
	pc.cockChange();
	output("\n\nThe proud flares of her cocks find themselves against your [pc.belly] and in the middle of your [pc.chest], the winking cumslits a tiny distance from your [pc.lips]. Mm, just for a little taste...");
	output("\n\n<i>“Hands here,”</i> commands the qilin, breathing heavily as she gets used to your [pc.cockShape " + cockIdx + "] shaft. She points to both of her stallion pricks, particularly to the flares.");
	output("\n\n<i>“Don’t forget the entry fee...”</i>");
	output("\n\nFeeling tentative, you grasp at her thick meatsticks and squeeze the unnaturally hard muskmuscles to get a feel for them: obscenely solid flesh, rivaling her beefy thighs!");
	output("\n\nShe coos in approval, reclining a little as she begins to slow-ride you.");
	output("\n\n<i>“Yeahhh, just hold those hands in place... like that...”</i>");
	output("\n\nAs she rocks her body back and forth, your hands act like faux-holes for her shafts. It’s difficult to wrap your fingers around them, the thickest, 4\" wide shaft allowing you to only grip half way around but you keep it up all the same.");
	output("\n\nThe tightness of her puffed-up pussy is heavenly, almost virginal. You feel a sense of privilege from the permission to breed her, especially considering her preference for using her shafts...");
	output("\n\nWith the dragoness getting more into it, she adds gyration and long, deep pauses to her motions, savouring the full feeling of your [pc.cock " + cockIdx + "] which she treats like her personal dildo.");
	if (pc.cLength(cockIdx)) output(" You admire how she’s able to take your sizable shaft so easily, even with her reliance on EasyFit. You can see a vague bulge form in between her abs, tickling the dirtiest parts of your mind.");
	output("\n\n<i>“Unff... kinda nice just being slow, huh?”</i> probes the paused qilin, cupping her full, bouncy breasts in her palms. She gives them both a self-involved and gentle fondle, biting her lip in a display of femininity.");
	output("\n\n<i>“J-just keep holding those hands rrrright there...”</i>");
	output("\n\nWith that, she bends herself forward so that you’re pressed to each others bodies, her hefty chest laying atop your own [pc.chest] and trapping her dual-cocks in between!");
	output("\n\nHer grinning visage hangs only a few inches above you, the smouldering look in her blazing red eyes filled intent.");
	output("\n\n<i>“Hang on...”</i>");
	output("\n\nShe stops her movements, pausing in place with her face screwed up in thought.");
	output("\n\n<i>“I didn’t take the... fokk this,”</i> she sighs, palming her forehead. Mirrin pushes herself off of you, cursing to herself through gritted teeth. Your [pc.cock " + cockIdx + "] stays erect and exposed to the air, the sudden drop in temperature making you tense a little. The perturbed dragoness searches for something just around the corner.");
	output("\n\n<i>“Where is... ah! Bjáni...”</i>");
	output("\n\nShe quickly returns, a small blue packet of Breeder’s Bliss in between her fingers. With a shake of the head, the red-faced qilin hurriedly tears at the packet and swallows the tiny pill just as quickly.");
	output("\n\nYou take the moment in between to gaze over her bare form, the appeal of which keeps [pc.eachCock] rock hard with impetus.");
	output("\n\nAs the pill takes effect, you can see her nostrils flare and face twitch as her heart rate increase. Her twin shafts, already hard, angle even higher into the air, forming a natural curve that strains at the sheaths. You spy a tiny trickle of feminine fluid roll down her inner thighs: oh, she’s definitely ready...");
	output("\n\nYour vague smile falters as she stands over you with her stallions hoisted above your [pc.face].");

	processTime(75);

	clearMenu();
	addButton(0,"Uhhh...",mirrinGetsPreggoWithEggoEggoEggo,cockIdx);
}

public function mirrinGetsPreggoWithEggoEggoEggo(cockIdx:int):void
{
	clearOutput();
	showMirrin(true);
	author("SoAndSo");

	output("<i>“Off,”</i> she growls, pointing vaguely to the end of the bed. <i>“This Bliss shit is making me feel like living in helvíti. You want to breed me? Work for it...”</i>");
	output("\n\nWith a little reluctance, you force yourself to leave the comfortable spot on the covers, trying to avoid her aggressive eye-contact.");
	output("\n\nMirrin then puts herself in your former place, her powerful legs spread apart towards the window so that her now-glistening pussy is exposed.");
	output("\n\n<i>“Hurry up!”</i> she commands, pointing to the spot on the bed in front of her. As if you needed more encouragement! You take up that spot and line yourself up with her puffed, winking cunt and press your [pc.cockHead " + cockIdx + "] against the inviting folds.");
	output("\n\nWith a jolt from behind, the back of her hooves pull you into her without ceremony! You grunt as your shaft fills her all the way to your [pc.knot " + cockIdx + "], stopping just shy of total penetration. You’re locked in place! Mirrin grabs you by the back of the head with a tense, almost-painful grip and pushes your forehead to hers.");
	output("\n\n<i>“Better, huhhh? Now you’re going to do this rrright or I’ll break you in half and use your useless, leftover dick like a dildo, got it?”</i> she whispers with menace, her red gaze seeming to glow as it bores into your vision.");
	output("\n\nY-yeah, I can do that, don’t break me please...");
	output("\n\nYou feel her hooves relent, not quite giving up complete control but giving enough room to let you do your work. With your shaft very much re-acquainted with her femjuice-dripping breedhole, you try a few shallow, tentative thrusts just to get a rhythm for it. With little purchase on offer, you using her rock-hard, thick thighs for support.");
	output("\n\nYour qilin lover grins as you do, using her other hand to stroke the side of your cheek.");
	output("\n\n<i>“Thaaaat’s it, you can do this.”</i>");
	output("\n\nEncouraged by her words and still-tense grip on the back of your skull, you pick up the pace. Now that she’s naturally wetter and receptive, the heavenly ease and smoothness of her tight walls makes her feel like the perfect fit for your [pc.cock " + cockIdx + "]!");
	output("\n\nTaking you off guard, Mirrin presses her lips to your mouth, one hand gently caressing your cheek as you kiss and the other still holding your head in place with a deathlike grip.");
	output("\n\nEvoking your lip-locking from before, her tongue plays and tangles with yours in a lazy battle for dominance. Her eyelids close in lust, the aggressive stare turning to one of intense satisfaction.");
	output("\n\n<i>“C’mon elskan, I like nice but I <b>love</b> hard,”</i> she whispers in between kisses, moving her hand to your side to grope your [pc.ass].");
	output("\n\nWith her grip loosening all over, you have free reign to properly breed that dragon’s pussy!");
	output("\n\nYou take the plunge, instantly going from slow and sensual to deep, hip-smacking humps!");
	output("\n\nIt’s a fight against temptation to just hilt and knot her on the spot, her frilly pussy teasing your [pc.knot " + cockIdx + "] as it presses on the wet lips with each hump.");
	output("\n\nCaught in between two thriving, hot bodies, the qilin’s two stallion shafts grind between her heavy, curvy cleavage and your [pc.chest]. The heaving, feminine chirps and gasps from your breeding queen spike when her shafts meet resistance against your [pc.skinFurScales].");
	output("\n\nYou meet her sounds with intermittent pecks and kisses on her lips, her clawed fingers squeezing and pulling all over your [pc.ass] in response.");
	output("\n\nThere’s a bit more added force to your thrusts than you’re consciously putting in, almost as if...");
	output("\n\nPeering behind you for a second, you remember: she’s using her legs! Holding the back of her calves against your thighs, she adds an insistent, springy force to your penetrative rhythm and it’s a bit of a challenge to keep up.");
	output("\n\n<i>“C’mon, Steele, c’mon!”</i> she grunts through gritted teeth, her tongue slipping out to pull on your lower lip.");
	output("\n\nYou’re trying, matching her rhythm almost perfectly for short bursts but you’re still having to take a few seconds to not burn out.");
	output("\n\nHer controlled grip on your body refreshes in strength, the hand on the back of your head returning to it’s rock-solid, wince-inducing hold from before. The palm on your [pc.ass] becomes more aggressive, the blunted claw tips digging into your butt-flesh.");
	output("\n\n<i>“Harder, bjáni!”</i>");
	output("\n\nYou’re trying! As she yells into your ears, you feel the second wind she demands of you, letting you keep up with her insistent rhythm. It’s all the more difficult now that her hot, tight pussy is squeezing you with all its might! You can feel the heat of climax building within: not long now...");
	output("\n\nWith a quick yank, she smacks her forehead to yours.");
	output("\n\n<i>“<b>C’mon, harder!</b> Don’t make me rip you in half!”</i> she wails, Mirrin’s feminine side breaking through her gruff tones with throaty groans and yips.");
	output("\n\n<i>“So fokking cluh...hnggg...hah... hngg!”</i>");
	output("\n\nWith an orgiastic cry piercing your ears, you feel her inner walls contract and quiver around your buried shaft, a fresh wash of femjuice spurting against your pelvis! Something primal in your body is triggered, the will to hold back your need to breed breaking down: You cum!");
	output("\n\nUsing the last of your hip-strength, you hammer one last time into her spasming, wettening cunt, burying your [pc.cock " + cockIdx + "] right up to the [pc.knot " + cockIdx + "]!");
	if (pc.hasKnot(cockIdx)) output("\n\nIn the same motion, you force your [pc.knot " + cockIdx + "] inside, the thick flesh bulging to full size!");
	output("\n\nWith a pained, euphoric grunt, your [pc.balls] unleash " + (pc.balls > 1 ? "their" : "its") + " contents straight into the awaiting womb of the dragoness,");
	var cumQ:Number = pc.cumQ();
	if (cumQ > 10000) output(" a thick, hot torrent of [pc.cum] that already starts forming an impressive bulge under her abs!");
	else output(" a nice shot of [pc.cum] that fills out her pussy with warmth!");
	output("\n\nHer legs pull you in as close as you can possibly be, [pc.hips] locking to her femcum drenched pelvis!");
	output("\n\n<i>“R-right there...yeah...!”</i> moans the quivering qilin, her words devolving into gasps and wails as you fulfill her dream of getting bred...");
	output("\n\nYou tense up in place as your orgasm flourishes, burns out and fades in her embrace, the strength to stand rapidly leaving your [pc.legs]. You slump forward, your head resting on her left shoulder as she holds you close with her hands across your back.");
	output("\n\n<i>“Shhh, shh...”</i> she whispers, nuzzling your neck.");
	output("\n\nIt takes a little while to soften from within her: some part of your body doesn’t want to stop breeding!");
	if (pc.hasKnot(cockIdx)) output(" Your [pc.knot " + cockIdx + "] is even more reluctant, taking several minutes to properly deflate.");
	output(" As you try gently pulling out, much to your qilin lover’s approval, a " + (cumQ > 10000 ? "thick stream" : "thin trickle") + " of [pc.cumColor] fluid leaks onto the bed, some still hanging off of your [pc.cockHead " + cockIdx + "].");

	//Orgasm event/reduce PC lust to zero. PC gains ‘Sore’ status effect. 
	processTime(90);
	pc.orgasm();
	soreDebuff(5);
	startMirrinPreg();
	flags["MIRRIN_PREGSTAGE"] = 8;

	clearMenu();
	addButton(0,"Hug Time",hugThatDragonMommy,undefined,"Hug Time","You’ll need a couple of days to recover from that. Several days. Maybe even weeks...");
}

public function mirrinTriesForPregAgainThisTimeWithAdvantage():void
{
	// Router bullshittery
	if (flags["MIRRIN_PUMPCOCK"] == undefined) return penisRouter([function(cockIdx:int):void
	{
		flags["MIRRIN_PUMPCOCK"] = cockIdx;
		mirrinTriesForPregAgainThisTimeWithAdvantage();
	}, mirrinMaxSize, false]);
	if (flags["MIRRIN_PUMPCUNT"] == undefined) return vaginaRouter([function(vagIdx:int):void
	{
		flags["MIRRIN_PUMPCUNT"] = vagIdx;
		mirrinTriesForPregAgainThisTimeWithAdvantage();
	},mirrin.cockVolume(1),0,-1]);

	var cockIdx:int = flags["MIRRIN_PUMPCOCK"];
	var vagIdx:int = flags["MIRRIN_PUMPCUNT"];
	new BreedersBliss().useFunction(pc);
	new Priapin().useEffect(pc);

	//Real function starts here
	clearOutput();
	showMirrin(true);
	author("SoAndSo");

	output("<i>“Aha! I know, oh yes. Something very fun...”</i> she proclaims, staring you down with a crazed look of need.");
	output("\n\nYou lock up a bit as she bores into you " + (pc.tallness < 84 ? "from above" : "at eye level") + " knowing full well that it’s gonna be <i>rough</i>.");
	output("\n\nShe stands back and folds her arms.");
	output("\n\n<i>“On the bed, go.”</i>");
	output("\n\nYou take the hint and rush to the bed in the far corner of the open floor, eager for what she has in store for the both of you. The she-dragon saunters along after you, casually unpacking two Breeder’s Bliss and two Priapin medipens.");
	if (!pc.isNude()) output(" You take the time window to quickly undress from your [pc.gear] and chuck it somewhere for later.");
	output("\n\nMirrin stands in front of the bed and then points to a few all-too-familiar jars of EasyFit on the drawer top.");
	output("\n\n<i>“You know what to do,”</i> she winks, eyeing you over.");
	if (pc.cLength(cockIdx) > 24)
	{
		output(" <i>“Actually hand me one too, I feel like treating you.”</i>");
		output("\n\nYou toss one over to her and she immediately unscrews it, takes a thick wad with two fingers and stuffs the same hand into her skin-tight shorts with a few grunts.");
	}
	output("\n\nYou then apply some to the inner folds of your own [pc.pussy " + vagIdx + "], the cold cream teasing your sensitive nerves. For added measure, you rub it in a little bit further: a properly ready breeding hole for your dragon queen...");
	output("\n\n<i>“And now for the... big stuff, elskan. You ready?”</i> she asks, handing you the fertility drugs. You nod: you’ve been wanting this for a long time and you’re more ready than ever!");
	output("\n\n<i>“Same time, eh?”</i>");
	output("\n\nYou both take the Priapin medipens and angle them to your respective thighs. Mirrin begins a countdown.");
	output("\n\n<i>“Three, two, one...”</i>");
	output("\n\nYou press firmly on the pen and a small <i>pssh</i> sound follows the unsettling numbing sensation in your [pc.thigh]. Immediately, you can feel your heart rate jump in speed and the flush of arousal warms every part of your body. Ooo, what a feeling! [pc.eachCock] " + (pc.hasCocks() ? "engorge" : "engorges") + " to a nearly-full hardness, your [pc.balls] swelling alongside with a sudden urge to release. The need to breed and be bred has never felt stronger!");
	output("\n\nWithout another thought, you swallow down the Breeders Bliss and wait a few seconds for the magic to work. The heat from the Priapin that fills your pelvis grows exponentially as your [pc.vagina " + vagIdx + "] goes into heat! A thin trickle of [pc.girlCum] escapes from your parting, puffed-up entrance and tickles the blood-flushed skin around it. [pc.EachCockIsAre] painfully erect, curling up slightly as " + (pc.hasCocks() ? "they throb" : "it throbs") + " with readiness in front of you.");
	output("\n\nYou feel a smile grow on your [pc.face] as ambient pleasure simmers within your body. You’re definitely ready! And how is Mirrin doi- <i>Oh.</i>");
	output("\n\nYou can see the qilin bending over with a pained expression on her face. <i>“Fokkk, that’s so <b>hot</b>,”</i> she whines, her eyelids flickering and cheeks flushing a deeper shade of red. She leans on the edge of the bed, ventilating deeply through her open mouth.");
	output("\n\nYou feel the need to stroke yourself... no wait, she’s in pain, right?!");
	output("\n\nBut what if...");
	output("\n\nGiving in to that little voice in your head");
	if (silly) output(" (thanks a bunch, spirit of christmas)");
	output(", you openly stroke your [pc.cock " + cockIdx + "] for the viewing pleasure of your struggling dragon lover. Her eyes catch your display, her focus coming back in that instant. Her eyes widen and her breathing slows but you can see that her clay-red cheeks are now a deeply alluring crimson.");
	output("\n\nWith a yell of triumph, the she-dragon grabs at her sports bra and shorts then physically tears them apart with her herculean strength!");
	output("\n\nWhat’s left behind is her firm E-cup mammaries heaving above her dual brace of stallion cocks. They’re engorged to a disturbingly hard state, the flares pulsing and twitching proudly towards you.");
	output("\n\nHer face is one of pure knowing: flared nostrils, wide eyes and a twisted, devilish smirk. She’s <i>definitely</i> ready!");
	output("\n\n<i>“Are you-”</i>");
	output("\n\n<i>“Quiet!”</i> she barks, reaching for your [pc.legs]! With a strong yank, she pulls you to the edge of the bed in an instant!");
	if (pc.isNaga()) output("\n\nThe qilin pins you by your hips with your [pc.leg] caught between her thighs. She then turns around with her back to you, flipping her leg over: What is she planning?!");
	else output("\n\nThe qilin turns you onto your front so that your [pc.chest] and [pc.face] are pushed into the bedding. Your back is bent uncomfortably while she holds a [pc.leg] in the air and the other between her rock-solid thighs: What is she planning?!");
	output("\n\nA rough palm finds itself on your [pc.cockHead " + cockIdx + "] and then squeezes it. You wince, the strength in her fingers forming a told hold as she yanks your tool around and grinds it against her slightly parted, dripping pussy. At the same time, she guides the flare of her monstrous, 16\" stallion prick against your [pc.cunt " + vagIdx + "]! Oh she’s not really going to try <i>that</i>, right...?!");

	//PC lust set to max. PC gains ‘Breeders Bliss’ and ‘Priapin’ status effects. Brings up cock and vagina selection screen. 
	pc.changeLust(pc.lustMax());

	processTime(11);
	clearMenu();
	addButton(0,"Hnggg!",mirrInWeGo);
}

public function mirrInWeGo():void
{
	clearOutput();
	showMirrin(true);
	author("SoAndSo");
	var cockIdx:int = flags["MIRRIN_PUMPCOCK"];
	var vagIdx:int = flags["MIRRIN_PUMPCUNT"];

	output("With a hefty, resistance-free thrust of Mirrin’s hips, you both penetrate each other! In unison, you both cry out as both of you simultaneously plunder and get plundered by each other’s shafts!");
	pc.cuntChange(vagIdx,mirrin.cockVolume(0));
	pc.cockChange();
	output("\n\n<i>“Fuckk! Fuck, that’s so <b>unggh</b>!”</i> growls your dragon breeder through gritted teeth. She holds her pose for a few breathless moments, adjusting to your [pc.cockShape] tool’s shape and [pc.pussy]’s depths.");
	output("\n\nYou need to check the damage: you can see the bulge that her monster cock makes in your abdomen, the chemical cocktail within you sending nothing but spasms of pleasure through your flesh and nerves. Could get used to a sight like that...");
	output("\n\n<i>“No slacking, give me my fucking babies!”</i> growls the qilin.");
	output("\n\nShit!");

	processTime(1);
	clearMenu();
	addButton(0,"Next",mirrinDoubleFuckGoGoGo);
}

public function mirrinDoubleFuckGoGoGo():void
{
	clearOutput();
	showMirrin(true);
	author("SoAndSo");
	var cockIdx:int = flags["MIRRIN_PUMPCOCK"];
	var vagIdx:int = flags["MIRRIN_PUMPCUNT"];

	output("The frenzied qilin begins to add weight to her need...");
	output("\n\nWith a tight-gripping hand on your " + (pc.isNaga() ? "[pc.leg]" : "[pc.hips]") + " for purchase, she begins a firm and deep fuck of your [pc.pussy " + vagIdx + "] while the other hand holds your [pc.cock " + cockIdx + "] in place! The weird yet <i>dirty</i> sensation that comes from fucking and being fucked by your lover makes your body feel extra eager, extra reactive to the consistent bottoming out that you’re experiencing in two ways.");
	output("\n\nSimultaneously, your [pc.cockHead " + cockIdx + "] and her flared tip smoosh against each other’s deepest parts, making you whine and her grunt. As if spurred on by your reaction, Mirrin ever so slightly increases her pace with every simul-hump against your " + (pc.isNaga() ? "[pc.hips]" : "[pc.ass]") + ". You can’t help but whine and squirm underneath her, the increase in speed coming with an increase in bruise-worthy heft!");
	output("\n\n<i>“Ungh, this is so <b>fucking</b> nice!”</i> you hear from on high, the qilin re-applying her grip with her clawed fingers sinking into your [pc.skinFurScales]: good thing they’re smooth and rounded!");
	output("\n\nEvery one of her thrusts come with a " + (pc.isNaga() ? "hip-bruising" : "butt-bruising") + " <i>smack</i>, and you feel your bones shake each time.");
	output("\n\nYou gasp in discomfort as one particularly heavy hump hammers onto your cervix. There’s a deep, throaty growl from the qilin’s lips: not this soon, surely?!");
	output("\n\nYour thoughts are blanked out by the thick, inhuman heat that boils into your [pc.pussy " + vagIdx + "]! Locked in by her massive flare, the she-dragon’s seed has nowhere to go but <i>in</i>. With each palpable, tangible wad that travels through her stallion pricks urethra, its forced through the tight and pressurized juncture of your cervix and straight into your wanting womb!");
	output("\n\nYou whine in place as the heat becomes almost overwhelming but holy <i>fuck</i> does your body respond: without any control, that deep twinge at the [pc.base " + cockIdx + "] of your [pc.cock " + cockIdx + "] that’s lodged within Mirrin’s tight hole grows and builds until it too erupts from sheer sensory overload.");
	output("\n\nYour whines turn into delirious, breathless moans as the synchronized cumflation continues for a torturously imperceptible length of time. By the end of it, you’re both left gasping.");
	output("\n\nYour vision catches the newly formed, liquid bulge in your womb and it conjures an immensely warm sense of pride from within. Mm, flooded with baby making cum...");
	if (pc.cumQ() > 10000) output("\n\nYou’re also able to catch a glimpse at the qilin’s newly expanded midriff out of the corner of your eye. Fuck, she’s almost as big as you are! You can feel a sticky warmth pool all around your pelvis as [pc.cumColor] seed seeps out of the qilin’s hot hole.");
	else output("\n\nYou can feel your own, drug-powered [pc.cumNoun] form a lovingly warm layer of wetness to the tight hole that’s captured your [pc.cock " + cockIdx + "]. Doesn’t quite compare to how thoroughly she’s bred you, however...");
	output("\n\n<i>“Hng... fuck... fuck... more,”</i> growls the qiliin under her breath, her hands unravelling her tightly wrapped ponytail.");
	output("\n\nM-more...?");
	output("\n\n<i>“<b>More</b>.”</i>");

	processTime(14);
	clearMenu();
	addButton(0,"More...!",moreMirrinMoreBabus);
}

public function moreMirrinMoreBabus():void
{
	clearOutput();
	showMirrin(true);
	author("SoAndSo");
	var cockIdx:int = flags["MIRRIN_PUMPCOCK"];
	var vagIdx:int = flags["MIRRIN_PUMPCUNT"];
	flags["MIRRIN_PUMPCOCK"] = undefined;
	flags["MIRRIN_PUMPCUNT"] = undefined;
	
	output("The drug-enhanced rutting continues anew, the awkwardly pinned position that you’re locked into becoming a strain on your frame.");
	output("\n\nIt’s little extra effort for Mirrin now she’s so energized and breed-hungry from the potent chemical concoction. With her hands once again locking on your [pc.hip] and [pc.cock " + cockIdx + "], her deep and fluid-rich breeding of your womb progresses into a grunting, animalistic conquest.");
	output("\n\nAs it progresses, you can only grip onto the bed covers for stability while your body is used as both a cum-pump <i>and</i> cum-dump!");
	output("\n\nWith another unified cry, a fresh exchange of potent seed erupts within the both of you with as much density as before. Your overflowing womb and [pc.cunt " + vagIdx + "] can barely handle more fluid, your belly reaching the size of a 9-month pregnancy with twins. The seal formed by her stallion beast-member and your [pc.pussy " + vagIdx + "] can’t contain the excess fluid and it spills onto the bed in thick, audible splatters.");
	var cumQ:Number = pc.cumQ();
	if (cumQ > 10000) output("\n\nMirrin’s own breeding hole seeps with [pc.cumColor] baby juice, the two blends of your and her breeding fluids making a pale mess all over your lower bodies.");
	else output("\n\nThe amount of [pc.cum] that you’re outputting is now giving her a mild bulge of her own! You can feel it form an extra layer of fluid inside her tight hole and the divine squeeze of her inner muscles chokes as much of it out of you as they can.");
	output("\n\nOnce the second round of exceedingly messy orgasms has passed, you’re beginning to feel light headed. There’s a moment for a breather.");
	output("\n\n<i>“Mir...mirnnn... I-I think that’s all I can take...”</i> you half-whisper, your enervated hands trying to clutch at her.");
	output("\n\nThe hulking she-dragon holds you in place still, her heavy, audible breathing through her flared nostrils tinged with what sounds like notes of discomfort. " + (pc.isNaga() ? "She very slowly, very delicately tries pushing herself up from the entwined configuration of meatsticks and pussyholes" : "She very slowly lets you down onto the bed by your [pc.hips]") + ", audibly groaning as her sensitive flare struggles to exit your [pc.pussy " + vagIdx + "]. With a grotesque dollop of white dragon cream splattering from the urethra, the thick stallion pick is pulled free while your [pc.cock " + cockIdx + "] recedes from the warm confines of her tight cunt.");
	output("\n\nHer brace of horse members seem to wilt slightly, not quite used up but certainly used <i>enough</i>. Mirrin tries to stand herself up, clutching at her " + (cumQ > 10000 ? "pregnant-looking" : "seed-filled") + " womb with a slightly pained expression on her puffed up face.");
	output("\n\nBut her legs quickly give way and she slumps with her back to the bed, her tree-trunk arms splayed to her sides.");
	output("\n\nYou feel the bounce shake you around unnervingly and it rolls you over... right into her grasp. Your [pc.face] ends up buried into her heaving chest, the soft pillows providing a lazy cushion for your breathless self. You can feel her hot and heavy breath against the top of your head, still punctuated with notes and gasps of discomfort. You can hear her whispering something in her native language, faint enough that you can’t tell make out the words.");
	output("\n\nA rough palm finds itself squeezing you against the heaving dragoness body, the usual, familiar heat blending with a radiant, sexual glow. You gently place a palm on her fluid-stuffed womb, the palm that’s squeezing you now moving to your [pc.belly] to do the same.");

	//Orgasm event/reduce PC lust to 0. PC gains ‘Breeders Bliss’, ‘Priapin’, ‘Vaginally Filled’ and ‘Very Sore’ status effects.
	processTime(27);
	soreDebuff(8);
	startPCMirrinPreg(vagIdx);
	startMirrinPreg();
	pc.orgasm();
	flags["MIRRIN_PREGSTAGE"] = 9;

	clearMenu();
	addButton(0,"Hug Time",hugThatDragonMommy,undefined,"Hug Time","You’ll need a couple of days to recover from that. Several days. Maybe even weeks...");
}

public function mirrinAndSteeleRecordAnEducationalVideo(vagIdx:int):void
{
	clearOutput();
	showMirrin(true);
	author("SoAndSo");

	output("<i>“MMmhhhmmm, I know, I know. Something... wild,”</i> says the smoky voiced dragon, stroking your chin with the back of her fingers. Although stony-faced, you can see the glint of predatory desire in her red eyes.");
	output("\n\n<i>“On the bed, go,”</i> she directs, flicking her eyes over to the bedrooms direction.");
	output("\n\nMirrin heads to the other side of the open-plan house, one of the few corners with actual walls. You follow her until you reach the bed area and then jump straight onto it, eager to feel the plush material on your [pc.skinFurScales].");
	if (!pc.isNude()) output(" Oh that’s a thing: you hurriedly remove your [pc.gear] and pile it off to the side. Mm, now that bed cover feels so welcoming and ready to be used...");
	output("\n\nYou spread yourself over the wide surface, wondering what your dragon lover has in store for you. Hopefully something messy and horse-cock-heavy...");
	output("\n\nYou can hear some shuffling of objects behind you, the sounds of rummaging and frustration. Perhaps she could use help but... no, she said wait here. Your dragon queen’s the one at the helm, after all.");
	output("\n\nA quick minute turns into five.");
	output("\n\nJeez, what could she be doing back there? Iron forging?? The hefty <i>clink, clink</i> of metal on metal is a confusing sign. Still, you lay there in anticipation as you were told to, images of possibilities tickling the lurid parts of your inner mind.");
	output("\n\nFive turns into ten.");
	output("\n\nShe’s still fidgeting with something, something that’s either very heavy or quite painful from the sounds of it. The echoic, open space amplifies her grunts and hoofsteps as Mirrin does... whatever it is she’s doing.");
	output("\n\nBut it’s okay, it’s all necessary, is what you say to yourself. Just a little bit longer and you can fulfill each other’s mutual desires for a child...");
	output("\n\nFinally, you can hear her tell-tale hoofsteps along the darkwood floor. She appears around the corner of the wall that the bedstop is pushed against, a rather interesting modification on her biggest, fully erect stallion shaft...");
	output("\n\nYou quickly glance her over: her cheeks, usually a clay-red like her skin, are flushed a deep red and she’s breathing deeply through her flared nostrils. An empty Priapin medipen is in her fist which she puts on the drawer top next to the bed.");
	output("\n\nHer cock, though... no wonder she took so long! Along with her somewhat smaller shaft, it stands fully erect with a perverse upward curve. The flat flare is expanded and pulsing, the cycle of her blood flow seemingly giving its own sense of sentience; of need and command.");
	output("\n\nJust under the flare is a brass colored cock ring, pressing tightly into the deep red cock flesh. Along the underside, a line of wrap-around vibes thrum with flesh-teasing noise against the thick, bulging urethra. Towards the base, another ring sits tight and looks even more constrictive than the one at the top of the shaft. Comparatively, her smaller shaft has no such apparatus, standing almost as erect.");
	output("\n\n<i>“You like?”</i> she probes, breaking your gaze. You look up to see her smirking with folded arms, something crumpled in her her other fist.");
	output("\n\n<i>“Stand up for me, face the bed.”</i>");
	output("\n\nYou scramble for the edge of the bed, standing to attention as a few butterflies flutter around. This is it, this is it...");
	output("\n\nShe positions herself behind you, blocking out the light and gentle heat of the New Texas sun with her herculean body.");
	output("\n\n<i>“Close your eyes.”</i>");
	output("\n\nYou do so with a little hesitation, inhaling through your nose. A soft pressure covers your eyes and [pc.face], some sort of smooth fabric: a blindfold? A slight jerk from Mirrin confirms it as your head is pulled back.");
	output("\n\n<i>“Theeere we go. Not too tight, hm?”</i>");
	output("\n\nYou shake your head, the blindfold fitting comfortably around your head. She murmurs with approval, her hands drawing your wrists together from behind. You feel a cold, dense weight around each one and then a metallic <i>snap</i>: cuffs, right...?");
	output("\n\nMirrin gives them a little tug, making sure they’re just tight enough to restrain but not constrict.");
	output("\n\n<i>“Very nice, very nice,”</i> the breathy dragon comments, her hot exhalation hitting the back of your neck.");
	output("\n\n<i>“Ah, before the uhh, next step, you’re going to need some Bliss, hm? Get you nice and... receptive,”</i> she whispers from behind, pressing her thumbs into your back muscles.");

	processTime(23);
	pc.changeLust(pc.lustMax());

	clearMenu();
	addButton(0,"Sure",mirrinShowsTheWorldHowGirlGetPragnent,vagIdx,"Sure","Anything to guarantee it this time around! Plus it’s going to make you super horny!");
	if (pc.cockThatFits(mirrinMaxSize) >= 0) addButton(1,"Priapin",gottaGiveMirrinsViewersAProperShowAfterAll,vagIdx,"Priapin","How about getting at that Priapin too? Maybe the BOTH of you can get pregnant...");
}

public function mirrinShowsTheWorldHowGirlGetPragnent(vagIdx:int):void
{
	new BreedersBliss().useFunction(pc);
	clearOutput();
	showMirrin(true);
	author("SoAndSo");

	output("You open your mouth in an instant, your [pc.tongue] extending out to receive the pill.");
	output("\n\n<i>“Ohoo, getting more into it, huh? You really <b>do</b> want this as much as me,”</i> she quips, placing the small pill on the tip of your tongue. You gulp it down without a thought, the pill going down easily along with a sprinkling of adrenaline in your gut.");
	output("\n\nWithin seconds, a deep heat forms within you and spreads to your [pc.groin]. Your [pc.vagina], already willing and receptive, flushes and puffs up in added arousal.");
	if (pc.hasCock()) output(" Alongside, [pc.eachCockIsAre] subjected to the same added lust, reaching an aching, semi-hard state.");
	output(" You find yourself " + (pc.isNaga() ? "grinding your [pc.legs] against the floor" : "rubbing your [pc.knees]") + " as the sensation imbues you with need...");
	output("\n\n<i>“Mm, very good,”</i> whispers Mirrin, letting go of your shoulders.");

	processTime(1);

	clearMenu();
	addButton(0,"Next",timeToStartADragonBreedingShow,[vagIdx, false]);
}

public function gottaGiveMirrinsViewersAProperShowAfterAll(vagIdx:int):void
{
	new Priapin().useEffect(pc);
	new BreedersBliss().useFunction(pc);
	clearOutput();
	showMirrin(true);
	author("SoAndSo");

	output("<i>“Actually... how about giving me some of that Priapin stuff?”</i> you ask, turning your head to where you think she’s standing.");
	output("\n\n<i>“So what, so we can both...? Elskan...”</i>");
	output("\n\nHer grip loosens on your shoulders and you’re sure you could hear her choke on the last word. <i>“If it’s what you want, then of course,”</i> she says softly, sniffling then rubbing her nose. <i>“I’ll just uh... just grab it.”</i>");
	output("\n\nYou can feel a cold, metallic pressure on your [pc.thigh], then a synchronized <i>psssh</i> follows and slight numbness takes over. It’s not long before the drug manifests.");
	output("\n\nA pleasant but ever-present heat builds inside your loins, filling all parts of your [pc.groin]. Your [pc.pussy " + vagIdx + "] moistens with arousal, puffy and ready while [pc.eachCock] " + (pc.hasCocks() ? "harden" : "hardens") + " to a semi-erect state. Dang, that feels <i>great</i>! You could just breed that dragon right on the spot if...you weren’t... tied up...huh.");
	output("\n\n<i>“Not so fast, no chances taken,”</i> says the qilin, cupping your chin between her thumb and forefinger.");
	output("\n\n<i>“Open.”</i>");
	output("\n\nYou do so at her prompt, a little worried by the tight squeeze of her digits. You unfurl your [pc.tongue] and Mirrin places the small pill on the center. It’s easily swallowed and in your already aroused state, you can only guess at to what happens next. Although subtle at first, a compounding warmth fills out your lower body completely, engorging your sex organs all the more! [pc.EachCock] now " + (pc.hasCocks() ? "stand" : "stands") + " painfully erect and eager to be used while your [pc.pussy " + vagIdx + "] is begging to bred by thick dragon meat!");
	processTime(1);

	clearMenu();
	addButton(0,"Next",mirrinStartsThePreparationForImpregnationPenetration,vagIdx);
}

public function mirrinStartsThePreparationForImpregnationPenetration(vagIdx:int):void
{
	clearOutput();
	showMirrin(true);
	author("SoAndSo");

	output("Mirrin tugs at your chin.");
	output("\n\n<i>“Open, lie your tongue flat.”</i>");
	output("\n\nYou do so with a ‘ah huh’ sound, the tip of your [pc.tongue] sticking just over the edge of your [pc.lips]. The she-dragon tugs the sides of your mouth with her cold claw tips.");
	output("\n\n<i>“Wider.”</i>");
	output("\n\nYou try to widen your open mouth as far as you can, your flushed cheeks hugging your eye sockets. Holding the facial pose is a little tough: you’re so horny that the ambient pulse of blood running through your [pc.groin] is intensely distracting. Fuck, why won’t she hurry up with whatever??");
	output("\n\nAn unaccounted sliver of saliva drips off the edge of your [pc.tongue]...");
	output("\n\n<i>“Ey, ey, dirty bitch...”</i> you hear from behind, a harsh flick nipping at the flesh of your mouth muscle. You wince as the microsecond of pain almost breaks your focus on holding that facial posture.");
	output("\n\nA cold, hard sphere sets itself right on your [pc.tongue] and then hooks into your open mouth with a soft jerk. Hrrggn!");
	output("\n\n<i>“And just a biiiit... right <b>there</b>,”</i> you hear Mirrin say, a tight binding now holding in the ball gag. She pats you with both hands on the shoulders. You can feel her twin shafts slowly grind against " + (pc.isNaga() ? "the [pc.skinFurScales] of your [pc.leg]" : "the inside of your [pc.thigh]") + ", reminding you of what’s to come.");
	output("\n\nA palm presses to your back and another turns you by the shoulder, your body is then spun around! You fall onto your back with your hands cuffed underneath, making you inhale sharply as the harsh metal presses on your spine.");
	output("\n\nYour [pc.chest] rises and heaves in apprehension as Mirrin becomes more manipulatory with your body, the anticipation fusing with the drug-induced arousal to fill your gut with sexually charged butterflies.");
	output("\n\nYou feel her rough palms pull on your shoulders and you’re dragged up the bed, whimpering as the metal cuffs dig into your spine a little bit more.");
	output("\n\nShe grabs you by the " + (pc.isNaga() ? "end of your [pc.leg], spreading it out along the bed." : "end of your [pc.legs], spreading them apart and pushing them so that your [pc.knees] touch on your [pc.chest].\n\n<i>“Hold,”</i> you hear her say, her hands leaving your [pc.thighs]. Fuck... you’re able to hold the folded position, if barely, having to pivot on your upper back. It leaves your [pc.groin] on full display, exposing all to your qilin lover."));
	output("\n\nYou can hear some heavy <i>clinking</i> behind you. What the hell is-");
	output("\n\n<i>“Steady,”</i> murmurs the she-dragon, gripping your [pc.legOrLegs] all the harder. You can feel something loop and then tighten around " + (pc.isNaga() ? "the middle of your snaky half, a strong force then pinning it down to the bed." : "the middle of your calves, a strong force parting each [pc.leg] so that they’re now spread painfully wide against their will."));
	output("\n\nYou whimper as you try moving a little from your bound up spot, only to find that it’s impossible: your limbs are all tightly bound!");
	output("\n\n<i>“Mm, good work, I think. Been a bit since I’ve done this sort of extent.");
	if (flags["SEXED_MIRRIN_LIVE"] != undefined) output(" Bit of a step up from last time we did this, huh? Wonder where those pig ears have got to...");
	output("”</i>");
	output("\n\nYou can hear some more nearby rummaging, then the sound of a <i>click</i> and a <i>vurhmmmm</i> that reminds you an awful lot of a... oh.");
	output("\n\nAs you’re trying to figure out what it could all be, two heavily vibrating objects press on your [pc.pussy " + vagIdx + "]" + (pc.hasCock() ? " and [pc.asshole]!" : "!"));
	output("\n\nThey prod and poke the sensitive flesh, imparting intense vibration through your unnaturally aroused nerves. The mere contact is almost orgasm-inducing; imagine the actual penetra-<i>unggg</i>!");
	output("\n\nYou moan through the gag as the " + (pc.hasCock() ? "dual probes part your holes in unison, the combination of vibes very close to pushing you over the edge! Must be at least eight inches’ a piece..." : "probe parts your [pc.pussy " + vagIdx + "] and it’s almost enough to push you over the edge! Must be at least eight inches’ long..."));
	output("\n\nYou whimper as the low-level buzz sets in, the constant, unbearable thrum making your " + (pc.isNaga() ? "naga tail tip curl up" : "making your [pc.toes] curl") + " in response.");
	if (pc.hasCock()) output(" The vibe against your prostate exacerbates it all, making you reflexively squeeze on it with your [pc.asshole].");
	pc.cuntChange(vagIdx,mirrin.cockVolume(0)/2);
	output("\n\n<i>“Hm, what a picture that is, eh? Actually... actually... ahehe,”</i> says Mirrin, her sentence turning into a stifled giggle.");
	output("\n\n<i>“I’ll be back in, I’m not sure... five? Ten minutes? Let the toys do their magic for a little, huh?”</i>");
	output("\n\nWait, w-what?");
	output("\n\n<i>“Back in a biiiit.”</i>");
	output("\n\nHer voice trails off behind you, the heavy <i>clop clop</i> of her hooves echoing away.");

	processTime(26);
	clearMenu();
	addButton(0,"F-fuck...!",timeToStartADragonBreedingShow,[vagIdx, true]);
}

public function timeToStartADragonBreedingShow(arg:Array):void
{
	var vagIdx:int = arg[0];
	var isPunished:Boolean = arg[1];
	
	clearOutput();
	showMirrin(true);
	author("SoAndSo");

	output("In your bound state, it’s impossible to focus on anything else: your body wants you to cum, so bad!");
	output("\n\nBut you try your best to hold on, to save it all for Mirrin: to make your breeding hole the best it can be, wet and waiting for her thick stallion cocks!");
	if (pc.hasStatusEffect("Prapin")) output(" And to make sure you save all your seed, enough to fill her up with baby batter!");
	output("\n\nIt takes all your willpower to focus on holding back a burgeoning orgasm, your inner muscles clenching tight on the " + (pc.hasCock() ? "vibes" : "vibe") + " within you.");
	if (pc.hasCock()) output(" [pc.EachCockIsAre] priapismic, your [pc.balls] aching, full with [pc.cum] and kept sensitive by the drugs in your system.");
	output("\n\nYou stay strong, if just on the edge: Doing it for her, doing it for, doing it for...ffuuh...");
	output("\n\nYou lose all sense of how long you’ve been subjected to this torturous entrapment or even a sense of your surroundings, bound");
	if(isPunished) output(", gagged");
	output(" and blinded as you are. All you can sense and feel is the ache of your posture, the deep arousal that fills out your body and the intense struggle to not cum your brains out.");
	output("\n\nYou hear some approaching hoofsteps, and your heart rate jumps up a notch. In your subdued, horny state, the first thing you try to do is call out, but you only end up moaning through your gag.");
	output("\n\n<i>“Eh? How’re you handling things, hm? I was expecting an iron will out of my breeding partner and all I see is a quivering bitch,”</i> she mocks, chuckling to herself. A heavy, clawed hand runs down the side of your [pc.legOrLegs] and stops at your [pc.hip], feeling rough against your [pc.skinFurScales] the whole way.");
	output("\n\n<i>“Let’s check progress, huh? Make sure you’re really ready to receive...”</i>");
	output("\n\n You’re not quite sure what she does next. Her hand stays where it is but she doesn’t seem to do anything else...");
	output("\n\n<i>“Oohoo, quite the grool pool... I think you’re ready,”</i> she says in a low tone, exhaling a heavy breath against your exposed, vibe-stuffed honeypot.");
	output("\n\nYou can hear her fiddling with something electronic just above you, the beeps and whirrs sounding a bit like a communicator.");
	if (flags["SEXED_MIRRIN_LIVE"] != undefined) output(" Wait, that’s her camera mode turning on, right...? Oh fuck, she’s going to stream it...!");
	output("\n\n<i>“Heeey boys and girls, MirrinBoss here again. Stream in a few minutes and then I’ll show you what I’m doing wiiiith... this,");
	if (flags["SEXED_MIRRIN_LIVE"] != undefined) output(" that’s right, this cock-ready bitch is back,");
	output("”</i> you hear her say loudly, trying to figure out what she could be doing. It’s wasted effort though as your mind quickly snaps back to your sexually subjugated state: don’t cum yet, don’t cum yeehh-");
	output("\n\nYou once again manage to stop your body from giving in, a muted whine now the only evidence. You hear Mirrin chuckling again above you, muttering something in her native language.");
	output("\n\n<i>“Æ haltu kjafti... best is yet to come.”</i>");
	if(isPunished)
	{
		output("\n\nYou feel the vibe slide out of your [pc.pussy " + vagIdx + "] at a torturous pace, the sensation of emptiness a welcome respite that draws a satisfied series of groans from your throat.");
		if (pc.hasCock()) output(" The vibe stuffed into your [pc.asshole], however, still buzzes away but still, the sense of relief is a welcome one...");
	}
	output("\n\n<i>“Fuuuck me, huh? Look at how wet this utterrrrr slut is, boys,”</i> you hear her quip loudly, her R’s rolling with devilish intent, <i>“Think [pc.heShe] is ready? Poll time, go go go: wetten [pc.himHer] more or <b>fuck</b> and <b>breed</b> [pc.himHer] right fucking now?!”</i>");
	output("\n\nYou can hear what sounds like a hundred little pings going off at once, much to the qilin’s delight.");
	output("\n\n<i>“Woaaah, alright, alright, right fucking now then! One more thing left...”</i>");
	output("\n\nAs light blurs your vision, you wince as you try to readjust to the brightness of the New Texas sun that blares through the window.");
	if (silly) output(" <i>Volumetric God Rays > Off</i>");
	output("\n\nA shadow of two hands holding something rectangular gets right up into your field-of-view, mere inches from your face. You can see a mirrored image of your red-cheeked, gagged-up and teary-eyed [pc.face]...");
	output("\n\n<i>“Yehh, see that boys’n’girls? Isn’t that the perfect look?”</i>");
	output("\n\nThe camera gets moved to different shots and angles, much like an annoying insect that doesn’t know where to go. <i>“Fingerfuck this bitch on the spot if I could, although then I’d be shredding up [pc.hisHer] insides...”</i>");
	output("\n\nMirrin holds a clawed hand in front of the camera, posing and flexing it for the crowd.");
	output("\n\nShe very quickly pulls it away, moving out of your visual range entirely.");
	output("\n\n<i>“And then we apply a bit of this...”</i>");
	output("\n\nA cold, wet substance grinds against your sensitive folds, reaching an inch or so into your [pc.cunt " + vagIdx + "]. You gasp as the gentle rubbing plays with your nerves, another wave of pleasure hitting you.");
	if (pc.hasCock()) output(" At the same time, your prostate aches and pangs with need, compounding the mild pussy pleasuring.");
	output("\n\n<i>“Fuck me, huh? Never made this bitch so wet for me before. I’m suddenly some fucking wizard right now,”</i> mocks the she-dragon, wiping her hand against your [pc.hip].");
	output("\n\n<i>“Right, let’s get to breeding!”</i>");
	output("\n\nThe towering qilin clambers onto the bed with her knees, twin flares jutting out obscenely a foot above your [pc.belly]. Fuck, it’s really happening...!");
	output("\n\nOnce she’s lined up, Mirrin grips her smaller stallion cock and directs it to your wet and welcoming breeding hole. While she looks through her camera, the flare sinks quite quickly and <i>very</i> smoothly inside!");
	output("\n\nYou whine as your [pc.vagina " + vagIdx + "] is speared open with extreme ease, the three-inch thick meat filling you out just as easily and forming a visible, tubular bulge!");
	pc.cuntChange(vagIdx,mirrin.cockVolume(0));
	output("\n\n<i>“Unnggmmm, that’s the shit, rrrright here!”</i> Mirrin proclaims, angling her camera to the [pc.girlCum]-soaked entry point. Her other hand gets cozy with your pelvis, using it as a stabilizer while she starts slow-breeding your [pc.pussy " + vagIdx + "].");
	if (pc.hasCock()) output(" [pc.EachCock] " + (pc.hasCocks() ? "remains" : "remain") + " untouched and aching for her grip, the tip already pooling with tiny, [pc.cumColor] flecks.");
	output("\n\nThe qilin’s larger, tooled-up stallion prick " + (pc.hasCock() ? "frots against [pc.eachCock]" : "grinds against your [pc.belly]") + " with each of her deep, thorough humps, reminding you of what’s on the main course.");
	output("\n\nWith a gentle smack of your [pc.belly], your dragonic lover picks up the pace. Settling into a deep, hip-bumping rhythm, her focus now centers on getting as much out of her cocks as possible! Each hump comes with a gyration in her hips, your [pc.pussy] getting used for all it’s worth. Every pounding knocks painfully against your cervix, forcing whines aplenty out of your plastic-stuffed mouth.");
	output("\n\nYou find you have little control even through your inner muscles: all that pre-prep from the drugs and vibe has left your breeding hole a non-resistant toy for your dragon queen! You can even see the sheen of [pc.girlCumColor] fluid on her 12-inch’ shaft as it plows in and out of you, droplets splashing all over the impact zone.");
	output("\n\n<b>Huff, huff</b> <i>“Enjoying it guys?? Lemme see those faces!”</i> she yells overhead, burying herself up to the hilt within you for several, agonizing seconds.");
	output("\n\n<i>“Yeaheah! Just listen to this bitch!”</i> she yells again as you scream through the gag out of reflex. <i>“Just look at that bulge, holy fokkkk! Hngg, I should just give in now and cream, huh?! Use this big boy next! Poll time!”</i>");
	output("\n\nYou hear several more beeps, a much larger deluge from before.");
	output("\n\n<i>“Oho, need have I said? Er, whatever that fucking phrase is, you know. Give me some BjániMotes, boys! There we go, that’s what I want to see! Now to close round one...”</i> she exclaims with a squeeze of your belly [pc.skinFurScales]. She immediately leans herself forward for a quicker, rougher angle of attack. <i>“Let’s go, bitch!”</i>");
	output("\n\nQuick, frictionless humps start making short work of your willpower. You can feel it coming, that build up that you’ve been trying to contain for so long: You’re gonna cum!");
	output("\n\nWith a throat-hurting, gag-blocked scream, the sensational orgasm that overtakes your body forces out [pc.girlCum] through the squishy seal of your cock-stuffed breeding hole! Mirrin’s unabated humping only exacerbates it, the [pc.girlCumVisc] forming a sheen on the she-dragon’s ultra-toned abs!");
	output("\n\n<i>“Gave in already, huh?! My turn!”</i> she shouts through gritted teeth.");
	output("\n\nWith one final, cervix-smacking thrust, the dragoness grunts and groans as her pent up seed floods into your womb!");
	output("\n\nYou squirm in place as the thick, hot fluid feels like it’s searing your endorphin-rich flesh, the long bulge of her embedded horse-cock turning into a rounded bump.");
	output("\n\n<i>“Fuckfuckfuuuuh<b>nnnng!</b> Look at it!”</i> she growls above you, her grip quivering on her camera as she breeds and inflates you in real time. It only ends when she jerks forward, catching herself with a free hand on the bed.");
	output("\n\nHer lust-ridden, glazed eyes meet yours from above, the two of you sharing a moment of breathy, silent tenderness. You can see a hint of a smile from the open mouthed dragoness... but that view is quickly blocked out by her camera-holding hand.");
	output("\n\n<i>“Round two...”</i> she says under her breath, pulling her softened horse-cock from your [pc.pussy " + vagIdx + "] in one slick motion. In its place, the thicker, tooled up beast member is lowered, dribbling smoky smelling pre-cum all over your [pc.belly]. With some sloppy fiddling, she dismantles her double cock-rings and vibe arrangement, leaving a fully hard, perverse and twitchy stallion cock.");

	processTime(37);
	clearMenu();
	addButton(0,"Double Fuck...!",heyDragonJuiceMirrinBossHere,vagIdx);
}

public function heyDragonJuiceMirrinBossHere(vagIdx:int):void
{
	clearOutput();
	showMirrin(true);
	author("SoAndSo");

	output("No, no, you’re already full! So full...! Could you take another, thicker load...??");
	output("\n\nMirrin seems to have decided for you.");
	output("\n\nWith a lick of her lips, the heaving qilin re-aligns with your [pc.pussy " + vagIdx + "] and presses the proud flare against it. With a natural lube of white-on-[pc.girlCumColor], she’s encouraged to just slide it right in and her beastcock spreads you open even wider than before!");
	pc.cuntChange(vagIdx,mirrin.cockVolume(0)*1.2);
	output("\n\nYou whine and shake in response as deep, cathartic euphoria eats at your lower body, the breeding chems in your blood reinforcing a positive reaction to getting speared and bred by thick, monster cocks. Your eyes roll back into your head, the added litres of dragon cream shifting inside your tender womb as the qilin’s meat bottoms out against your cervix!");
	output("\n\n<i>“Hah... huh... guh... good thing for this breedslut I’m pretty close. Ready for the main event, boys?”</i> addresses the panting qilin, her free hand resting loosely on your cum-stuffed bump.");
	output("\n\nIn a chorus of beeps and chimes, she begins rocking her hips back and forth with a slow, deep rhythm. Through the haze of sexual stimulation and nerve-drenching endorphins, you get the sense that she’s struggling to get as comfortable as before. Too sensitive, maybe...?");
	output("\n\nThat thought blurs away as she hilts within you, her hips pressing against your [pc.skinFurScales].");
	output("\n\n<i>“Huh... hah... let’s just get a... a nice shot here,”</i> wheezes the qilin, angling her camera for several shots. You can hardly bear to look: your aching gut is distracting enough as it is.");
	output("\n\nShe slips back into her slow, intimate rhythm, placing the camera to your left so that it records at your eye level.");
	output("\n\nThen, the dragoness leans in against you, a supporting hand at either side of your shoulders. With her face mere inches from yours, her red-glare gaze is now squarely locked to your eyes and you find it difficult to look away...");
	output("\n\nAs she continues to pound and spear you on her thick prick, her breathing becomes tinged with pained whines and groans: she’s close!");
	output("\n\nWith a sudden, final hilting, the flare of her beastcock slams against your cervix and Mirrin mushes her forehead to yours. Her pained grunts and groans resound loudly in your ears and then you feel it: more urethra-bulging globules of dragon cum unloading into your already full womb!");
	output("\n\nEach thick load adds more size and weight to your belly with ease, the sheer volume now spilling into your [pc.cunt " + vagIdx + "] and then oozing out in a stream under the stallioncock’s thick urethra!");
	output("\n\nYou’re both locked in a pose of orgiastic bliss for what seems like eons, the climax of the dragoness diminishing slowly.");
	output("\n\nOn a final, strained note, Mirrin places a hand on your [pc.face], rubbing your cheek bone with her thumb. Her fiery, lust-driven gaze turns to delirious, close-eyed joy, capturing your vision so fully that all else around you feels immaterial. Just to be here, used and embraced by your dragon queen...");
	output("\n\nThe moment is cut short as the hulking, heaving qilin pushes herself up and pulls her softened horse-cock out of your thoroughly bred hole. In its wake comes a mixed musky spill of [pc.girlCumColor]-and-white, the precious fluid dripping all over your [pc.groin] to the bed beneath.");
	output("\n\n<i>“Done...I think...”</i> pants Mirrin, gently rubbing her pelvis with a look of pure satisfaction. With ginger, slovenly movement, she begins undoing your lower body binds, gag, and cuffs.");
	if (pc.hasCock()) output(" She even tends to your numbed [pc.asshole], carefully removing the dead probe that tortured your prostate so.");
	output("\n\n<i>“We did good, right girls’n’boys? I think that’s a record of some sort... anyheck, bye for now!”</i>");
	output("\n\nWith that, she puts the dataslate to the side. <i>“Make the whole ‘actual pregnancy’ thing a surprise for them, heh...”</i>");

	startPCMirrinPreg(vagIdx);
	processTime(14);
	pc.orgasm();
	soreDebuff(10);
	flags["MIRRIN_PREGSTAGE"] = 10;

	clearMenu();
	addButton(0,"Hug Time",hugThatDragonMommy,undefined,"Hug Time","You’ll need a couple of days to recover from that. Several days. Maybe even weeks...");
	if (pc.hasStatusEffect("Priapin")) addButton(1,"Hold On...",penisRouter,[neverEnoughMirrinBabies,mirrinMaxSize,false],"Hold On...","Her turn now, surely...?");
}

public function neverEnoughMirrinBabies(cockIdx:int):void
{
	clearOutput();
	showMirrin(true);
	author("SoAndSo");

	pc.changeLust(pc.lustMax());
	output("You inhale with all your waning strength, tongue lolling out to the side as you try taking in as much air as possible. With your free hands, you grasp at your overstuffed womb... so hot and full! If those fertility drugs work, then there’s no way you’re not getting pregnant.");
	output("\n\n...but speaking of.");
	output("\n\nThroughout all this, [pc.eachCock] " + (pc.hasCock() ? "have" : "has") + " been ignored this entire time. Still painfully erect with priapismic stiffness, you so desperately want to get off even after getting bred into submission by your dragon queen. You reach over your [pc.belly] and grope at [pc.eachCock] with enervated tugs, your insides groaning with all that fresh weight.");
	output("\n\n<i>“Oh hang on,”</i> says Mirrin, quickly picking up her dataslate again. <i>“Let’s just uhhh...”</i>");
	output("\n\nThe breathy dragoness turns on her knees, aligning her densely muscled ass and hips with [pc.eachCock]. With her free hand, she reaches for a usual jar of EasyFit, unscrews the top between her thumb and forefinger and then sets about applying some to her Terran honeypot.");
	output("\n\n<i>“Efffff, right there, just in case...”</i> she mutters through gritted teeth, the cold cream making her visibly shiver for a few seconds.");
	output("\n\n<i>“Rrrrright. Hey stream! A little change in plans: Round 3! My little breeding bitch did so, so good that I’m going to reward [pc.himHer] with something special! Everyone watching?!”</i> she says while holding the device in the air. With her rough palm firmly on your [pc.cock " + cockIdx + "], she lowers her body down. The [pc.cockHead " + cockIdx + "] presses on her slightly parted pussy lips, a tiny bit of resistance making it tingle before the whole thing sinks into her tight, body-hot breeding hole. You groan from the sensation, the slow and gentle movements of the dragoness feeling like a blessed balm on a sore muscle.");
	pc.cockChange();
	output("\n\n<i>“Mmm, hear that boys? I know how to treat my breedsluts...”</i> she purrs, holding the dataslate very close to her face. Mirrin gasps as your [pc.cockHead " + cockIdx + "] fills out as much of her as it can: " + (pc.cLength(cockIdx) > 24 ? "she must be bulging pretty hard from the front! Good thing she just loves to use EasyFit..." : "mmm, so tight, so comfortable!"));
	output("\n\nMoving her hand away, she slow rides your [pc.cockShape " + cockIdx + "] shaft with sensual, hip-heavy grinding, really savoring your shape as it fills out her tightness. You gasp as she takes a particularly slow spearing, her parted, puffy labia touching on your [pc.knot " + cockIdx + "]. Mmmfuck...");
	output("\n\nThe post-breeding high blends blissfully with gentle ride you’re receiving, heightened by the fertility chems still in your system. But as it builds and builds, you try your hardest to not give in, wanting the moment to last forever.");
	output("\n\nAs if sensing this, Mirrin looks over her shoulder, glassy eyed and needy. <i>“For us,”</i> she mouths, rubbing her cock-stuffed pelvis. You can feel the heavy patting from her palm vibrate against your [pc.cock " + cockIdx + "], making it twinge: oh shit!");
	output("\n\nThe physical barrier broken, the tell-tale surge of fluid through your pelvis shoots through your [pc.cock " + cockIdx + "]! You’re still so drained of energy from before, and so you whine in meekness as [pc.cum] burns its way through, straight into Mirrin’s awaiting pussy!");
	output("\n\n<i>“Y-yeah, right there, right there!”</i> you hear her gasp, her bullish demeanour turning to a feminine slurring as her pussy fills with your hot seed. With her deft inner muscles, the tight passage of her cunt squeezes your [pc.cock " + cockIdx + "] for all the [pc.cumVisc] juice it can pump!");
	if (pc.cumQ() > 10000)
	{
		output("\n\nThat’s all icing though: with your virility, plus the combination of breeding drugs, you can feel your [pc.cum] balloon the qilins insides!");
		output("\n\n<i>“Nnng, watch it guys! Waaatch...”</i> you hear her yell, the camera pointed at the bulge forming in her ultra-toned midriff.");
	}
	output("\n\nAs it all subsides, you find yourself panting for air all the more as your body strength leaves you. The towering qilin slumps forward on her palms, and your [pc.cock " + cockIdx + "] springs out of her thoroughly filled pussy, loose fluids dripping all over your [pc.groin].");
	output("\n\nTaking a few seconds to focus, the she-dragon reaches around with her device, showing the creamy splash zone that is her nicely used pussy and your wilting, deflating shaft.");
	output("\n\n<i>“Yeeeah, look at that. I pick ‘em well, huh...?”</i> she says breathlessly. <i>“Alright, right... think I’m done for real, boys. Till next tuh... time.”</i>");
	output("\n\nWith that, she tosses the device onto the end of the bed.");

	//Orgasm event/reduce PC lust to 0. PC gains ‘Breeders Bliss’, ‘Vaginally Filled’ and ‘Very Sore’ status effects.
	processTime(15);
	pc.orgasm();
	startMirrinPreg();
	flags["MIRRIN_PREGSTAGE"] = 11;

	clearMenu();
	addButton(0,"Hug Time",hugThatDragonMommy,undefined,"Hug Time","You’ll need a couple of days to recover from that. Several days. Maybe even weeks...");
}

public function hugThatDragonMommy():void
{
	clearOutput();
	showMirrin(true);
	author("SoAndSo");

	output("With the two of you now thoroughly drained, the huffing dragoness holds you and pulls you up to the top of the bed, away from the splatter-zones. Buried instincts blossom within her as she wraps an arm around you from underneath, side-by-side with your exhausted form. Using her other hand, she guides your head to rest just above her heaving chest" + (pc.hasHorns() ? ", making sure to accommodate your [pc.horns]." : "."));
	var cumQ:Number = pc.cumQ();
	if (flags["MIRRIN_PREGSTAGE"] == 8)
	{
		if (cumQ > 10000)
		{
			output("\n\nYou lay your hand on her protruding abs, caressing the substantial under-bulge that you bred her with.");
			output("\n\n<i>“Mmhmm, feels odd being the one so full up. Always with the surprises...”</i> she whispers into your ear, kissing the top of your head.");
		}
		else
		{
			output("\n\nYou lay your hand on her taut abs, caressing the skin of her womb with tender care.");
			output("\n\n<i>“Mm, I can still feel it slinking around inside, you know...”</i> she whispers into your ear, kissing the top of your head.");
		}
	}
	else if (flags["MIRRIN_PREGSTAGE"] != 10)
	{
		if (cumQ > 10000) output("\n\n<i>“You know what? Feels rrrrreally fokkin’ dirty to have matching bulges,”</i> she whispers into your ear, squeezing you closer.");
		else
		{
			output("\n\nYou lay your hand on her taut abs, caressing the skin of her womb with tender care.");
			output("\n\n<i>“You know, some dirty part of me wishes we had matching bulges. But I think I prefer your [pc.cumNoun] just like this, elskan...”</i> she whispers into your ear, squeezing you closer.");
		}
	}
	else
	{
		output("\n\nYou lay your hand on her taut abs, caressing the sweat-sheened, dense wall of muscle to help calm her body.");
		output("\n\n<i>“That was divine, elskan...”</i> she whispers into your ear, kissing the top of your head and idly drawing her claws along the skin of your [pc.belly].");
	}

	if (flags["MIRRIN_PREGSTAGE"] != 8) output("\n\n<i>“Can you help though? I can feel some... backlog,”</i> she grunts, gently jerking on her biggest rod. As she squeezes and tugs, the tip drips with creamy, smoky dragon cum all over the bed. You tenderly help her along, making sure her softening shaft is fully cleansed of backed up seed.");
	output("\n\nYou smile as she tends to you, your eyelids becoming heavier as post-rutting energy warms your body and soul. The dragoness is whispering something unknown to you but you can feel the loving intent. Her hands continue to gently caress you all over, the comforting body heat of her large form radiating with nerve-tingling warmth.");
	if (flags["MIRRIN_PREGSTAGE"] != 8)
	{
		output("\n\nMirrin spends more time on your bulging womb than anything, walking her fingers across your [pc.skinFurScales] as if you already had a baby in there.");
		output("\n\nYou join in, walking your own fingers side by side in much slower movements.");
	}
	if (flags["MIRRIN_PREGSTAGE"] != 10)
	{
		output("\n\nYou tend to her belly in time, marvelling at how her powerful musculature holds your seed in perfect place.");
		if (cumQ > 10000) output(" How is she gonna deflate all that later...?! Her body might even work against her, unwilling to let go of your [pc.cum]! Who knows at this point?");
		output(" She joins you while you rub her abdomen, one hand on top of yours.");
		output("\n\n<i>“Yyyeah... right there, elskan...”</i> she coos, her voice calm yet hoarse.");
	}
	output("\n\n<i>“So brave, you know? Helping me do this... I don’t think uhhh... heh, I don’t know what to think...”</i> are the words you hear in your ear, drowsy and delirious in the tender moment.");
	output("\n\nThat’s ok, you say, hoping to allay any concerns in her emotionally tender state. You squeeze her once more, coaxing a softened giggle from the sleepy dragoness.");
	output("\n\nYou both feel like... like taking a nap... just a lil’...");

	processTime(12);
	clearMenu();
	addButton(0,"Zzzzz",sleepWithThatDragonMommy);
}

public function sleepWithThatDragonMommy():void
{
	clearOutput();
	showMirrin();
	author("SoAndSo");

	output("Something warm over your face brings you out of your sleep.");
	output("\n\nTrying to get a feel for your surroundings, you open your eyes, immediately greeted with the yellow glare of the New Texas " + (hours > 20 || hours < 7 ? "moon" : "sun") + ". It should hurt your pupils but... man, that was such a great, deep sleep!");
	output("\n\nWhere are you...");
	output("\n\nBreathing takes a little effort, as if you’d only just come down from intense exercise. Damn, your limbs are all sore and used up: might need another nap when you’re back on the ship!");
	output("\n\nYou feel for the world around you with your fingers, touching upon a thick blanket that covers you. Oo, cozy. You don’t remember having it when you fell asleep, only intense, happy thoughts of... oh yeah! That whole roll in the hay...");
	if (flags["MIRRIN_PREGSTAGE"] != 8)
	{
		output("\n\nLooking down, you’ve got a bloated belly full of baby juice, the sensation of which feels heavy, hot and dare you say, heart-warming... with this much dragon jizz inside of your womb, Mirrin’s dreams of pregnancy are certain! Not that some part of you didn’t want it as well.");
		output("\n\nYour gut groans as your body starts waking up too, the sheer amount of breeding juice in there being... fuck, doesn’t even bare thinking about. Enough to make you look 9-months pregnant at any rate!");
	}
	output("\n\nMoving around is a bit of a chore: the soreness of your body starts seeping into your nervous system by the second, making you wish for the sweetness of sleep again.");
	if (flags["MIRRIN_PREGSTAGE"] != 8) output(" The added weight in your [pc.belly] isn’t exactly helping...");
	output("\n\nStill, you push yourself onto your [pc.legOrLegs] and adjust to the ‘damage’.");
	output("\n\nYou realize that you’ve been sleeping on a couch and that you’re a little... soggy? You run your fingers against your [pc.hair], finding that it’s even wetter. There’s a woody perfume that hangs around your body. The heck, did someone bathe you?");
	output("\n\nThe sound of sizzling and smell of cooking meat permeates the building, tempting you to follow. Mm, smells like bacon and... syrup? Oh boy!");
	output("\n\nYou plod about to find the sounds of kitchen activity, your limbs having an awkward, floaty sensation to them that makes you want to hold on to something as you walk.");
	if (flags["MIRRIN_PREGSTAGE"] != 9) output("\n\nYou wince with every lower body movement, your [pc.hips] feeling like they’ve been pummeled, bruised and used to their breaking point. Jeez, that dragon...");
	output("\n\nVaguely remembering where the kitchen is, you just so happen to turn the right corners, finding a busy Mirrin working on the food. She’s standing with her back to you, that usual outfit of black sportswear holding all her body. No sign of jockstrap straps though...");
	output("\n\nShe turns around, spotting you gazing her over from the corner.");
	if (flags["MIRRIN_PREGSTAGE"] != 10 && pc.cumQ() > 10000) output("\n\nYou spy her bred belly and ponder on the substantially smaller bulge than what you unloaded inside of her. Huh.");
	output("\n\n<i>“Oh oh, wait, wait. Let me just make some space annnnd help you over,”</i> she says in a bluster, setting her pan down on the stove and hurriedly pulling a stool out for you. She helps you hobble over to the seat, a heavy hand holding you up by your lower back.");
	if (pc.PQ() >= 50) output("\n\nCome on, I’m fine! Just a little, full-body exhaustion is all...");
	output("\n\n<i>“Shh, there we go, there we go, just sit here, huh? I’ll have the perfect, perfect remedy, elskan,”</i> she assures with a grin, a similarly deep look of exhaustion in her eyes. Wouldn’t think it looking at her move, however... damn sports models.");
	if (flags["MIRRIN_PREGSTAGE"] != 10) output("\n\nThe dragoness is acting a little cautiously all the same, less hand and more finger movement. She’s especially careful to not put anything near her stomach, for good reason.");
	output("\n\n<i>“Just hold tight, this is going to fill you right up,");
	if (flags["MIRRIN_PREGSTAGE"] != 8) output(" even more than I did to you, huh?");
	output("”</i> she coos, serving up the food from the pans: pancakes!");
	output("\n\nThe still sizzling bacon sits on top of the 3-stack with syrup leaking into the steaming hot fluffiness of the flapjacks. Shit, that looks good..");
	output("\n\nMirrin places your plate before you with the appropriate utensils, leaning her muscle-packed butt against the black-topped table in front of you.");
	output("\n\n<i>“Sooooo, tell me how it is,”</i> she asks, folding her arms expectantly with a smirk.");
	output("\n\nWell it certainly <i>smells</i> great! Your body could use the dense fat and sugar...");
	output("\n\nYou pretty much tear into the stack, wolfing down your first forkful in seconds. Mm, so many flavours for something so simple! Vanilla, coconut, cinnamon: that warm, fluffy doughiness is nice and relaxing on your worn jaw.");
	output("\n\nThe dragoness hums in approval, a lazy grin on her face.");
	output("\n\n<i>“Good then?”</i> she asks, sauntering behind you with her palms gently massaging your shoulders. You nod: more than good! Just what a brand new baby");
	switch (flags["MIRRIN_PREGSTAGE"])
	{
		case 8: output(" daddy"); break;
		case 9: case 11: output(" momma... er, father... person"); break;
		case 10: output(" momma"); break;
	}
	output(" needs!");
	output("\n\n<i>“Got me thinking, you know. I don’t think the next... however many months should be wasted here on this nothingness of a planet. I thought about it after we uh... blew our tops, heh. I’m thinking Tavros. Why? Well... I know that you’ve got that there Nursery that ol’ papi Steele set up. How I uhhh, how I know, well... secret,”</i> she begins, her voice somewhat sedate but happy all the same.");
	output("\n\n<i>“Easier access to contracts, pick of any apartment, I can see the " + (flags["MIRRIN_PREGSTAGE"]%2 == 0 ? "kid" : "kids") + " every day. It’s uh... it’s perfect for me. And you, I think. You’ve got this massive obligation and the best years ahead.");
	output("\n\nI’m not old but I’ve been full pelt all day, every day for like... fokk, 25 years? A few years off, raise some babies, indulge some, you know. What do you think?”</i>");
	output("\n\nYou can see it working out: she’s been happier since you came into her life but a new change of scenery could improve her mental state. Money would never be an issue either. You say sure, no reason not to.");
	output("\n\n<i>“Mm, settled then. I can get rid of this place in a week, set up on Tavros the next. Probably take Brescoe with me too, he’s very handy. Won’t need to fly all the way to this ass end to see the " + (flags["MIRRIN_PREGSTAGE"]%2 == 0 ? "kid" : "kids") + " or...me...”</i> she continues, trailing off somewhat to the end.");
	output("\n\n<i>“Mmmhmm, anyway, uh what was I going to say... yeah, um, I, mmm...”</i>");
	output("\n\nShe seems to have trouble with her next words, as if they were perhaps too daring or impolite.");
	output("\n\n<i>“I was wondering if you’d be willing to stay here until tomorrow. With me, of course. I, uh... just want this whole thing to go smoothly, make sure this baby thing really works.");
	if (flags["MIRRIN_PREGSTAGE"] != 10) output(" I’ve been feeling odd all morning, very low, very... anxious.");
	if (flags["MIRRIN_PREGSTAGE"] != 8) output(" And I just want to make sure you’re safe, you know? Yeah, yeah, you’re a galactic adventurer with scars and shit but this is so serious for me.");
	output(" So would you?”</i> she asks, her absent gaze trailing off to some corner of the room. Her expression forms a hesitant, anxious frown.");
	output("\n\n<i>“Sure, what’s a day?”</i> you say, seeing the unrest in her body language. Immediately, she exhales in relief, her eyes turning to you.");
	output("\n\nShe mouths ‘thank you’, stroking your cheek with the back of her hand.");
	output("\n\n<i>“Please, please, please... do not forget your pancakes,”</i> she chuckles. <i>“Sit tight, we got more to talk about in a bit.”</i>");
	output("\n\nShe leaves you to your food, wandering off to some other part of the house with her hooves <i>clip clopping</i> against the wooden floor.");
	output("\n\nYou wonder what more there is to discuss but eh, that can come later.");

	processTime(8*60);
	clearMenu();
	addButton(0,"Next",spendADayMirinMirrin);
}

public function spendADayMirinMirrin():void
{
	clearOutput();
	showMirrin();
	author("SoAndSo");

	output("After the wake-up meal, you head over to the open lounge. That familiar arrangement of soft, spartan couches seems like the perfect place to relax. A shiver rolls down your spine as you walk along the cool wooden floor: oh that’s right, you’re still naked!");
	output("\n\nThankfully, the blanket that aided you in sleep is still waiting for you on the couch.");
	output("\n\nYou wrap yourself up in the thick, warm material, the ambient light of the " + (hours > 20 || hours < 7 ? "starry sky" : "New Texas sun") + " putting your mind into a calm, thoughtless state.");
	output("\n\nMm, let’s just sit down a bit, let them pancakes settle...");
	output("\n\n<i>“Room for another?”</i> comes Mirrin’s voice from behind, her buff-as-hell body covered in a very loose, very long dressing gown. It somehow manages to conceal almost everything, barring the occasional peep of her snakes through the front curtains...");
	output("\n\nYou smile as she sets herself by your side, her natural body warmth tempered by the two layers of fabric between you. She wraps her hand around your shoulder, pulling you into an embrace.");
	output("\n\nYou hum in approval, using her substantial chest as a headrest as your body tries overcoming its soreness.");
	output("\n\n<i>“Ahh, I’ve missed this kind of uhhh, kind of niceness. Just enjoying the view, something precious by my side, prospects, all that. The idea to leave this planet is just, it’s burning away at me, Steele. First time my body has agreed with me on something in a while.");
	switch (flags["MIRRIN_PREGSTAGE"])
	{
		case 8: output(" Fuck, never thought getting fucked and bred so hard would make me feel this <b>nice</b>. I wonder if this is what mother felt..."); break;
		case 9: case 11: output(" I think I’m still trying to wrap my head around being both mother and father but... fuck, it feels really, really nice."); break;
		case 10: output(" Might be because I’m becoming a dad or... something like a dad."); break;
	}
	output(" How about you? It’s hard not to notice this kind of... ‘glow’ around you. Happy, healthy, " + (flags["MIRRIN_PREGSTAGE"] != 8 ? "maternal" : "paternal") + " kind of thing,”</i> says the slow talking dragoness, her warm voice feeling warmer what with your ear smushed to her chest.");
	output("\n\nYou consider it for a moment: aside from the");
	if (flags["MIRRIN_PREGSTAGE"] != 8) output(" mild euphoria and");
	output(" bodily ache, you’re feeling proud more than anything. Proud of her for getting her goal, proud of yourself for not getting ripped apart by " + (flags["MIRRIN_PREGSTAGE"] != 8 ? "monster dicks" : "dragon claws") + " mid-fuck...");
	output("\n\nThe she-dragon chuckles, squeezing you to her again.");
	output("\n\n<i>“Aw, you know I wouldn’t...");
	if (flags["MIRRIN_PREGSTAGE"] != 8) output(" plus, you might actually be getting used to thick, stallion muscle, huh? Might not even need the EasyFit at this rate...");
	output("”</i> she half-whispers, kissing the top of your head.");
	output("\n\nMirrin undoes her hair-sheath, letting the silver cascade slide loosely all over her shoulders. A few stray locks fall on your fingers: thick, heavy but soft, not like her coarse mane or tail.");
	output("\n\n<i>“Mm, big talk though: I talked to Belker, he’s still around for some reason but nevermind that. Told me about uhhh, what’s the word... gestation.");
	switch (flags["MIRRIN_PREGSTAGE"])
	{
		case 8: output(" Torri’s living in me for about 18 weeks, or so he said. I am going to be so lazy during that time, fuck."); break;
		case 9: case 11: output(" We’ve got different bodies so... you’re 23 weeks, I’m 18 weeks."); break;
		case 10: output(" Torri’s living in you for about 23 weeks, or so he said. 23 very secure weeks, I’m hoping."); break;
	}
	output(" He said it’ll be closer to human birth than anything so... no eggs, thank fuck. Also dunno about if you’ve got one of those ‘breeders bodies’ or whatever it is but that might change things too. Don’t ask how he confirmed all this, he was only here for like ten minutes and did some magic with all that uhhh, techno stuff of his. There might be some gene-crossing problems, uh... I’ve got that covered, just in case. Not letting this one slip away,”</i> she sighs, nuzzling the side of your head.");
	output("\n\nYou promise her the same, placing your hand on the one loosely resting on your shoulder.");
	output("\n\nHer beaming grin is all the confirmation you need.");
	output("\n\nThe both of you sit in front of the window for several hours, lightly hugging, kissing, belly patting: simple, effortless things. There’s not so much talking as there is murmuring, the weirdly sedate mood and atmosphere feeling disconnected from the world around you.");
	output("\n\nYou don’t think about that, of course, only about keeping warm with your qilin lover.");
	output("\n\nThen there’s a groan from your gut. " + (flags["MIRRIN_PREGSTAGE"] != 8 ? "Is that your womb or... nope, stomach!" : "Just pancakes seems like a year ago: you’re hungry!"));
	output("\n\nHearing this, Mirrin reaches for something on a table behind the couch. She pulls over a dataslate, tapping on it very quickly.");
	output("\n\n<i>“Ey, ey, Brescoe. Not dozing, eh?”</i> she calls out, the sounds of a heavy-lunged male coming through.");
	output("\n\n<i>“Uh, yeah, hey. All good in there? Need something?”</i> says a casual Brescoe, an audible sniff coming after his question.");
	output("\n\n <i>“Me and my friend are hungry as fuck, just go get some take out for us, eh? And some for you, we’ll make a thing of it. I’ll pay you back and shit, kay?”</i>");
	output("\n\n<i>“Fine I guess, be about a half hour, aight?”</i>");
	output("\n\n<i>“Sweeeeet, no booze though. Although you can, just not for us. Ah um, yeah, whatever, don’t forget side salad, yah?”</i>");
	output("\n\nWith that, she ends the voice channel and chucks the dataslate to the end of the couch.");
	output("\n\nFood comes in short order, only about twenty minutes or so. Brescoe barely says a word outside of mundane ‘security stuff’, talking about house maintenance and the occasional fan who wanted an autograph hanging around a little bit longer than usual. Still, the three of you have a delicious chow down on the BBQ spread, the overly juicy and sauce drizzled meats filling that need very nicely and then some.");
	if (flags["MIRRIN_PREGSTAGE"] != 8) output("\n\nHasn’t actually made a dent in that belly bump you already have, though...");
	output("\n\nOf course, Mirrin takes the lion’s share again, her fingers and cheeks dotted with bits of sauce. You try to keep up with a napkin, feeling the urge to nag her about it. Might be those burgeoning,");
	switch (flags["MIRRIN_PREGSTAGE"])
	{
		case 8: output(" paternal"); break;
		case 9: case 11: output(" parental"); break;
		case 10: output(" maternal"); break;
	}
	output(" instincts coming to... even if it’s only been a day.");
	output("\n\nOnce you’re all done, you both press gang Brescoe into cleaning up, much to his vague annoyance. <i>“Damn lovebirds, treatin’ me like some glorified maid, bleh...”</i>");

	processTime(2*60);
	clearMenu();
	addButton(0,"Next",hangOutWithTheMirrinMommyIGuess);
}

public function hangOutWithTheMirrinMommyIGuess():void
{
	clearOutput();
	showMirrin();
	author("SoAndSo");

	output("You hadn’t even realized how much time had been spent here. The whole thing’s been a blur of sex, food and heavy sleeping. You check the Codex to have a look since checking in with Belker: 34 hours...?!");
	output("\n\nYou nudge the reclining qilin as she recovers from her food coma, showing her the time gap.");
	output("\n\n<i>“Hm, how bout that... ehh, well, I did say a day. I’d get it if you wanted to get back to your business saving the world or... whatever it is you do these days. I keep hearing crazy shit. Have to start prepping to relocate anyway,”</i> she says slowly, a mild note of exhaustion in her voice. Well, she <i>has</i> been taking care of her baby");
	switch (flags["MIRRIN_PREGSTAGE"])
	{
		case 8: output(" daddy"); break;
		case 9: case 11: output(" momma... poppa... breeder"); break;
		case 10: output(" momma"); break;
	}
	output(" all day!");
	output("\n\nYou imagine that she’ll be a good parent, if maybe a little loose with the rules.");
	output("\n\n<i>“That’s ok, tell me when you’re set up and I’ll visit,”</i> you say back, " + (pc.tallness < 84 ? "wrapping your arm around her waist." : "wrapping your arm around her shoulder."));
	output("\n\n<i>“Aight, I’ll send a mail. Also, do I get access to the nursery?”</i> she asks, eyes darting around is if she’s trying to remember loads of things at once.");
	output("\n\nYou nod, quickly sending an automated alert to the Nursery’s system with Mirrin’s details attached.");
	output("\n\n<i>“Nice, well... how about a little goodbye, huh?”</i> she half-whispers, drawing your mouth towards her. Her semi-closed, smouldering eyes meet your gaze and you feel a pang of adrenaline as they do. Ooh...");
	output("\n\nTaking the initiative, you push your [pc.lipsChaste] to her mouth, catching her off guard. In a turn of play, you make merry with her long, dragon’s tongue, licking, pressing and pushing at it with all your mouth-muscles might.");
	output("\n\nYou break it just as quickly, leaving the qilin breathless and stunned.");
	output("\n\n<i>“Oo, uh... fuck. That’s very much a goodbye,”</i> she chuckles, a slightly dopey smirk on her face.");
	output("\n\nWith some final pats to");
	switch (flags["MIRRIN_PREGSTAGE"])
	{
		case 8: output(" Mirrin’s new belly bulge"); break;
		case 9: case 11: output(" each others belly bulges"); break;
		case 10: output(" your new belly bulge"); break;
	}
	output(", you give each other a reluctant goodbye.");
	output("\n\nGathering your equipment together, you leave Mirrin’s ranch with a new passenger on the way...");

	processTime(24*60);
	flags["MIRRIN_TAVROS_TIMESTAMP"] = GetGameTimestamp() + 7*60*24;
	clearMenu();
	addButton(0,"Next",move,shipLocation);
}

public function mirrinMovingEmail():String
{
	var ret:String = "You should see this apartment, holy helvitis. Nice and modular, loads of room to load up shit. I’ve basically removed all the walls, outside of the bathroom. There’s a jacuzzi, crazy kitchen, big open plan for my personal gym equipment. It’s like a 5 minute walk to the nursery as well, for when little Torri pops out of";
	switch (flags["MIRRIN_PREGSTAGE"])
	{
		case 8: ret += " me"; break;
		case 9: case 11: ret += " either of us"; break;
		case 10: ret += " you"; break;
	}
	ret += " I’ve considered making space for a baby’s room and play area but the Nursery is just ‘there’, you know? Figure it was way more secure as well. Brescoe wouldn’t have anything to do in this place, too small. He’ll keep in touch though, might do drinks nights or some dumb shit. Oh oh! Another name just in case: Jenta. Family thing, caved in to dad, don’t ask.";
	switch (flags["MIRRIN_PREGSTAGE"])
	{
		case 8: ret += "\n\nI’ve not been feeling myself recently, I have to say. Bit low, lonely. I could use your company, [pc.name]."; break;
		case 9: case 11: ret += "\n\nIt’s been crazy fast, all this moving. Only just managed to settle down today and it’s pretty lonely here. I could really do with your company, [pc.name]. Plus I’d love to know what you think of the apartment."; break;
		case 10: ret += "\n\nI really want to know what you think of the place, elskan. This should really be your place too, we’ll talk about it when you get here."; break;
	}
	ret += "\n\nI kept the bed, btw.";
	ret += "\n\nAll my love,";
	ret += "\n\nMirrin XxX";

	return ParseText(ret);
}

public function mirrinPregnancyEnds():void
{
	clearOutput();
	author("SoAndSo");
	showName("\nBIRTHING!");

	output("There’s a lurching in your [pc.belly].");
	output("\n\n<i>“Ah!”</i>");
	output("\n\nYou clutch at your gut as a dysphoria of realness and hormonal energy bleeds into your field of view, making you buckle over. A hot dampness makes itself known " + (pc.isCrotchExposed() ? "along your [pc.thighs]" : "in your [pc.lowerGarment]") + ": It’s time!");
	if (InShipInterior())
	{
		output("\n\nThank fuck you’re on the ship!");
		output("\n\nWithout an extra thought, you gingerly make your way to the captain’s chair.");
		if (getPlanetName() != "Tavros Station") output("\n\nFrantically punching in co-ordinates for Tavros, you can do nothing but sit back as the shaky auto-pilot takes over. You feel like passing out every minute of the brief journey, clutching at your gut all the way. With blessed speed, you make it to the station just barely hanging in!");
	}
	else if (InRoomWithFlag(GLOBAL.HAZARD))
	{
		output("\n\nAnd what a place to be in...");
		output("\n\nThinking quickly, you sink yourself to the ground and huddle against the nearest flat surface you can feel behind you. You tap away on your codex like mad, flustered enough to miss the communicator several times.");
		output("\n\nIn a moment of panicked gratitude, you send an emergency distress signal from the local wilderness.");
		output("\n\nAn agonizingly short time later, a cavalcade of an ambulance with guards arrives. Feeling the hands of your saviours stretcher you onto the awaiting vehicle, everything becomes a bit blurrier, muffled...sleepier...easy now...");
		output("\n\nYou start sending a local signal for emergency services, making sure that all the docking doors are open. Not long now, not long now...!");
		output("\n\nIn the haze of pain and concentration you expend, medics arrive and tend to you like saviours from on high. Everything becomes a bit blurrier, muffled...sleepier...easy now...");
	}
	else
	{
		output("\n\nThinking on your toes, you find a wall to lean on. Using it as a support, you let yourself slide against it to the floor and make sure you can draw attention to your predicament from nearby hub dwellers.");
		output("\n\n<i>“H-help! My water broke!”</i> you cry out with your eyes closed up, hoping for divine assistance as pain now takes over your body.");
		output("\n\nThere’s a clamour of voices and movement with several passers-by rushing to your aid. They help you get into a comfortable position, using some jackets to aid your rest.");
		output("\n\nIn no time at all, U.G.C officers and medical crew have already arrived and they stretcher you away. Everything becomes a bit blurrier, muffled...sleepier...easy now...");
	}

	processTime(3);
	clearMenu();
	addButton(0,"Zzz...",wakeUpDoodUHaveMirrinBabiesToDeliver);
}

public function wakeUpDoodUHaveMirrinBabiesToDeliver():void
{
	clearOutput();
	author("SoAndSo");
	showName("\nBIRTHING!");

	output("Mmm, peaceful.");
	output("\n\nPeaceful sleep.");
	output("\n\nNo reason to wake up. No pain, no confusion, just effortless bliss. But don’t you have a... thing... you were doing... what was it...?");
	output("\n\nYour eyes and ears open up to the slowly to the white world around you. Beep. Beep. Beep.");
	output("\n\nA pulse monitor? Gah, that light is so blinding...");
	output("\n\nComing to, you realize that you are... in the Nursery.");
	output("\n\nYour body is stiff as a board, the will to move your limbs dissipating as tiredness brickwalls your mind. What’s happening, where’s the...");
	output("\n\nBaby?");
	output("\n\nThe impetus comes to turn your head, first to the right and then to the left. Nothing on the right but...");
	output("\n\nNext to you sits a familiar figure, slouched against an ill-fitting chair with folded arms. Mirrin sits there with her head bent forward, napping away.");
	output("\n\nShe’s a little...different? Casual? Loose black tanktop, grey yoga pants, silvered hair unbound and left to sit loosely over her tensed-up shoulders. How long has she been there, waiting and on duty?");
	output("\n\nYou can see automated staff roaming around the corridors through the doorway, occasionally seeing the familiar face of Bridget wander past.");
	if (StatTracking.getStat("pregnancy/total day care") > 0) output("\n\nMost likely tending to your other kids, you reckon. Seeing her do her life’s passion puts you at ease: safe, secure, familiar hands.");
	else output("\n\nOh right, now she actually has something to do... maybe you should have more kids? Mmmm, let’s not think about that right now.");
	output("\n\nSpeaking of kids, you really, <i>really</i> want to know where your newborn has ended up. Like <i>right now</i>.");
	output("\n\n<i>“Miirrrrnnn...”</i> you slur with loose lips, your throat hoarse and dry. Exhaustion? Anaesthetic...? You try turning your head to her anyway, desperately wishing that your meek cries will awaken the sleeping dragon.");
	output("\n\n<i>“Mirrin...!”</i> you try calling out, still slurring.");
	output("\n\n<i>“Ertu... aaaalgjör... hálfviti...”</i> she murmurs, her own voice just as slurred as yours. Dumbass dragon...");
	output("\n\n<i>“Oh come on,”</i> you sigh, regaining a big of intelligibility.");
	output("\n\n<i>“Eh huh, what, fucking, lawyers, what,”</i> she mumbles, jolting awake in shock from her dreams. <i>“[pc.name]...”</i>");
	output("\n\nShe turns to you, her stony face lighting up with a wide grin you’d have thought she’d never wear.");
	output("\n\n<i>“Fuck, fuck! Uh, uhh, just hold it, stay down. Don’t move, there was some trouble with the birth and the thing an-”</i>");
	output("\n\n<i>“Where’s the baby?”</i> you interrupt cooly, stopping her mid sentence. She inhales in an effort to stop herself from babbling.");
	output("\n\n<i>“Right, right! I’ll just be uhhh, moment, moment!”</i>");
	output("\n\nYou’ve never seen her bolt so quickly. With large strides, the flustered qilin darts out of the room with heavy hoofsteps then turns right for some other part of the Nursery. Huh.");
	output("\n\nHopefully the staff don’t try to stop a bull in its tracks... or a dragon-horse in this case.");
	output("\n\nIn moments, she’s back and cradling a bundle of blankets in her palms. Ohh...! Is that-");
	output("\n\n<i>“Heeere! Say hello to little Torri,”</i> she exclaims, delicately placing the bundle into your lap. She takes her place next to you, kneeling by the bedside with her chin rest on her palms.");
	output("\n\nWith a huge swelling of anticipation, you peel back the blanket covering the little babe’s face. What you see is a tiny face of dusky skin, the wispiest of silver-white hair and two tiny nubs on the forehead where front-facing horns would be. The adorable tot sleeps soundly in deep peace, compelling you to cradle the small thing in your arms.");
	output("\n\n<i>“Isn’t she just... *</i>sigh<i>* amazing?");
	if (jentaBorn()) output(" Let’s put her in the same room as Jenta, yeah? They haven’t even met yet.");
	output(" I wonder how she’ll take to you, hm?”</i> she says sleepily, gently rubbing the back of her hand against your cheek.");
	output("\n\n<i>“Mm, my beautiful babes...”</i>");
	output("\n\nAs you smile back to her, a tiny cough splutters from below. You look down and see two, tiny dragonic eyes of [pc.eyeColor] look back to you.");
	output("\n\n<i>“Mahbububbubbbb...”</i>");
	output("\n\n<i>“Toooorri?”</i> you say softly to the babbling babe, eliciting a smile from her and from Mirrin.");
	output("\n\n<i>“Heeey, it’s mom, yeah? Aren’t you just the sweetest!”</i>");
	output("\n\n<i>“Mwuhbuh...”</i>");
	output("\n\nYou find it impossible to look away from your newborn daughter, nuzzling your nose to that tiny button of hers. The response is a joyful little squeal: she’s taken to you!");
	output("\n\nWith an audible shuffle from your left, Mirrin looms into view from your side, looking down at the vulnerable bundle with glassy eyes.");
	output("\n\n<i>“You know uh... you blacked out pretty hardcore, elskan. Nurses went ham and fist with the, uh, anesthetic. You just lying so still, I didn’t...,”</i> she says slowly, wiping her eyes with her palm. <i>“Knew you could do it though, not called Steele for nothing, huh?”</i>");
	output("\n\nA heavy hand massages your left shoulder, to which you feel the urge to rest your head on it. There there, ya big lug, everything’s fine!");

	moveTo("NURSERYG4");
	if (pc.hasStatusEffect("Disarmed")) pc.removeStatusEffect("Disarmed"); //fek it
	// Ripped from flyTo. Has to be a better way.
	shipLocation = "TAVROS HANGAR";
	processTime(4*60+34);
	clearMenu();
	addButton(0,"Next",gottaRestFromHavingDragonBabus);
}

public function gottaRestFromHavingDragonBabus():void
{
	clearOutput();
	author("SoAndSo");
	showName("DONE\nBIRTHING!");

	output("You spend several hours together, just the three of you. You notice all of Torri’s little quirks and reactions: she’s very much drawn to your [pc.eyes], she loves it when you boop her nose in particular and, in turn, the sensation of her soft baby skin is a delight to tickle and touch.");
	output("\n\nA nursedroid comes by with nutrient supplements. " + (jentaBorn() ? "As with Jenta, she" : "She") + " insists upon a potent ‘booster mix’ instead of natural milk for the first few days. You and Mirrin accept readily, only wishing the best for your babe.");
	if (jentaBorn())
	{
		output("\n\nThe towering dragoness seems to hit an idea and leaves the room, returning in time with baby Jenta.");
		output("\n\nPutting yet another small bundle into your arms, you angle Jenta and Torri so that their eyelines meet. The two tiny tots stare at each other without making much movement, apparently awestruck with each others presence. After a few moments of you and Mirrin observing the two, both babies giggle at each in unison. Aww...");
		output("\n\n<i>“Best of friends already, huh? Little flón...”</i>");
		output("\n\nYou’re not quite sure if that’s a pet name or something else.");
		output("\n\nThe two of them are swiftly asleep however: too much excitement for one day! Mirrin summons a nursedroid and the robo-matron takes them back to their shared room, audio of some unknown lullaby playing from her head unit.");
	}
	else
	{
		output("\n\nYou spend an hour or so with Mirrin and Torri but it’s not too long before Torri is fast asleep in your arms after her meal, her lit face returning to the adorable sleepy expression from before.");
		output("\n\nMirrin summons a nursedroid and the robo-matron takes tiny Torri back to their shared room with the audio of some unknown lullaby playing from her head unit.");
	}
	output("\n\nAfter saying goodbye to your " + (StatTracking.getStat("pregnancy/total day care") > 1 ? "tots" : "tot") + ", you’re feeling ready to get out and about. Ain’t no internal bleeding gonna stop you!");
	output("\n\nWith a little guidance from Mirrin’s palm, you slip out of the bed and out of the medical gown you’ve been given. Re-applying your [pc.gear], you turn to your...hmm, what is she now? Girlfriend? Partner...?");
	output("\n\n<i>“Well, if you’re really feeling well, I’m going to watch over the newborn. Doc says you’ll only take a few hours to heal up properly anyhow. One last thing though,”</i> she says, " + (pc.tallness < 84 ? "swiftly scooping you up by your waist." : "pulling you to her."));
	output("\n\nWith your [pc.face] now facing hers, she leans in for a deep, tongue-heavy goodbye kiss.");
	output("\n\nOo, you... silly dragon...");
	output("\n\nYou allow her in, feeling at ease despite the body hold she has on you. But just as quickly as she goes in, she pulls out, wiping the side of her mouth with the back of her hand.");
	output("\n\n<i>“Aight, off you go!”</i>");
	output("\n\n" + (pc.tallness < 84 ? "Unwrapping her arms from your waist" : "Letting you slide to the floor") + ", the winking dragoness pats you on your [pc.hip] and wanders off to the baby’s room.");

	processTime(3*60+17);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function processMirrinPregnancy(deltaT:uint, nextTimestamp:uint):void
{
	if (flags["MIRRIN_PREGSTAGE"] == undefined) return;
	if (flags["MIRRIN_PREG_TIME_LEFT"] != undefined)
	{
		var oldTime:int = flags["MIRRIN_PREG_TIME_LEFT"];
		var newTime:int = oldTime - deltaT;
		if (newTime < 0 && !disableExploreEvents() && eventQueue.indexOf(mirrinTriggerBirth) < 0) eventQueue.push(mirrinTriggerBirth);
		flags["MIRRIN_PREG_TIME_LEFT"] = newTime;
	}
}

public function mirrinSugarMommyEmail():String
{
	var ret:String = "Hey babe,";
	ret += "\n\nForgive me if this seems formal as shit in any way but fuck me, this pregnancy press has been dogging me and I have to PR my way out of it.";
	ret += "\n\nUpside is, overwhelming support. I got to talk to dad, he’s pretty bowled over. You should meet him some time, I think he might’ve known your dad too orrrr something like that. Old men and their tales.";
	ret += "\n\nI’ve gotten used to being sick most mornings, it’s a terrible feeling all the same.";
	if (pc.isPregnant()) ret += " I really should be more gentle with you, honestly. I keep thinking I can handle anything but biology just wins and now I think about how it must be affecting you.";
	ret += "\n\nMore things to worry about.";
	ret += "\n\nAh well, I got an advance for a campaign contract so here’s some spending cash. Feels like the least I can do right now. Come see me when you can, I miss you.";
	ret += "\n\nYours,";
	ret += "\n\nMirrin XxX";
	ret += "\n\n<i>A credit notification plays from your codex, signifying that 15,000 credits have been wired directly to your account. Well then...!</i>";
	pc.credits += 15000;
	return ret;
}

public function mirrinSendNudesEmail():String
{
	var ret:String = "Hey babe,";
	ret += "\n\nWell, it’s been a hazy couple of days. Sleeping odd, eating odd, sick. My agent keeps sending over doctors at the wrong kinds of hours for all these checks. I get why but the reasons are all shit. Be glad you’re not an actual celebrity, elskan, certain spheres would tear you to shreds.";
	ret += "\n\nBut how are you? Don’t have to reply. Come see me, talk, I need my most favourite " + (flags["MIRRIN_PREGSTAGE"] != 8 ? "people" : "person") + " riiiight now. Face to face is what I need, not more holo screens and extranet.";
	ret += "\n\nI’ve uh, also got a little ‘bump’. I never really noticed till now but it’s actually nice. Have a look.";
	ret += "\n\nLots of love,";
	ret += "\n\nMirrin XxX";
	ret += "\n\n<i>Attached with the email is a large res photo of Mirrin showing off the gentle curve developing in her softening abs against the ambient backdrop of space. Her hands cover her breasts and pelvis... but she is fully nude all the same. Cheeky girl.</i>";
	return ret;
}

public function mirrinRoyaltiesEmail():String
{
	var ret:String = "Heya, you saucy birthing chamber, look at theses <i>pics</i>.";
	ret += "\n\nThey came out so good in this article, shit’s already selling like crazy back in the U.G.C. I’ve had to beat back all the requests from my agent’s ‘friends’ to get you on a contract. It’s all snake oil so I’m doing you a favour, trust me.";
	ret += "\n\nBut yes, update: I am huge, I feel huge. When they say ‘big as a house’, <i>they</i> obviously never met me cuz it feels like a skyscraper in the mirror.";
	ret += "\n\nMight be close, you know. Do you ever think about complications and things?";
	if (flags["MIRRIN_PREGSTAGE"] != 8) ret += " I hope you’re holding up good too. My little baby factory, yeah?";
	ret += "\n\nAnyway, check some pics. I managed to get you a cut of the royalties. Not a lot because of legal shit buuuut you might be able to get a fancy toy or too, eh?";
	ret += "\n\nMuch love,";
	ret += "\n\nMirrin XxX";
	ret += "\n\n<i>The email comes with a package of thirty odd pictures from the shoot as well as a copy of the article. Reading through, it’s a fairly opinionated interview that only seems to just be justifying all those lewd shots. You see your plain headshot underneath in a subheading: ‘Into The Dragon’s Layer’. Trust in the media to find a pun in anything.";
	ret += "\n\nOh, a beep comes from your codex: you’ve just got <b>20,000 credits!</b></i>";
	pc.credits += 20000;
	return ret;
}

public function mirrinTriggerBirth():void
{
	if (disableExploreEvents()) return mainGameMenu();

	clearOutput();
	author("SoAndSo");
	showName("MIRRIN\nBIRTHING!");

	output("Out of nowhere, your codex begins beeping with a shrill and constant alert. You quickly scramble for the display and gasp at the words flashing back at you: <b>Mirrin Due Date!</b>");
	output("\n\nShe’s gone into labor!");
	if (getPlanetName() == "Tavros Station") output("\n\nEep, she’s close by! Figuring that she’s most likely in good hands from the automated medical services of the station, you sprint freely towards the closest entrance to the Nursery.");
	else
	{
		output("\n\nFuck, you’re not anywhere close!");
		output("\n\nThe world mutes around you and all you hear is your heart beating through to your throat. Going into autopilot, you practically sprint to the direction of your ship. You’re not even mindful of the business you came here for.");
		output("\n\nYou rush to your ship, hastily clamber into the shuddering vessel and set course for Tavros!");
	}

	clearMenu();
	addButton(0, "To Mirrin!", mirrinIsLayingEggu);
}

public function mirrinIsLayingEggu():void
{
	clearOutput();
	author("SoAndSo");
	showName("MIRRIN\nBIRTHING!");

	output("The nursery brims with the hustle-and-bustle of emergency support staff. You’re not even sure if the nursery even had this many staff... is all this just for Mirrin?");
	output("\n\nThere’s a heavy thundering sound from upstairs. You can’t quite say what it is, but all the busybodies in the room shudder and wince momentarily as it happens. With utmost professionalism, the staff continue on as if nothing had happened.");
	output("\n\nA nursedroid takes you by the hand out of nowhere.");
	output("\n\n<i>“" + pc.mf("Mr", "Miss") + " Steele! It’s best if you wait here. Things are dicey upstairs! Miss Arkosduttir has not been cooperative even in her dilatory state and we can’t account for anyone’s personal safety at present. She’s in your room right now...”</i>");
	output("\n\nShe trails off, as if remembering some bad news that she missed out.");
	output("\n\n<i>“You might need a new door frame or even a, uhhhh, mmm, bed.”</i>");
	output("\n\nYou’re still in autopilot; your brain takes a few fuzzy seconds to process what she’s saying and what you think you should do next.");
	output("\n\n<i>“Takemethere! I have to see!”</i> you blurt out, shaking the poor nursedroid by her scrub-covered forearms.");
	output("\n\n<i>“Ayeee, ok! Just follow me,”</i> she flusters back, guiding you to the next floor...");

	//Moves PC to Briget’s tile in the Tavros nursery. If PC is on Tavros, 30 minutes in-game time passes. If PC was not on Tavros, 12 hours of in-game time pass.
	moveTo("NURSERYE14");
	if (pc.hasStatusEffect("Disarmed")) pc.removeStatusEffect("Disarmed"); //fek it
	// Ripped from flyTo. Has to be a better way.
	shipLocation = "TAVROS HANGAR";
	flags["MIRRIN_PREG_TIME_LEFT"] = undefined;
	flags["MIRRIN_PREG_DURATION"] = undefined;
	if (getPlanetName() == "Tavros Station") processTime(30);
	else processTime(12*60);

	clearMenu();
	addButton(0,"Next",moreMirrinBirthingHolyShit);
}

public function moreMirrinBirthingHolyShit():void
{
	clearOutput();
	author("SoAndSo");
	showName("MIRRIN\nBIRTHING!");

	output("As you’re led upstairs, the clamour of disgruntled voices and pained cries echoes throughout the upper floor. More and more nurses run in and out of your apartment room with various sundries. You’re pretty sure you can hear Mirrin’s voice yelling a muffled tirade of obscenities. Something about... tearing the seats of the gods asunder and something else about frozen entrails baked in brain matter.");
	output("\n\nBoth you and the nurse gingerly press on through the corridors, getting brief welcomes from the rushing staff as you pass. You try your best to acknowledge them but only one pressing thought goes through your head: your baby.");
	output("\n\n<i>“Ohhhooooo no, you’re NOT sedating me! MOTHERFOKKERS, the fuck is STEELE?!”</i>");
	output("\n\nThat bellow makes you stop in your tracks. Once again, the world seems to slow and focus on your heartbeat as you hear her... in danger?? You can’t be sure. Feet carry you before you can even think on it and in moments, you’re at the apartment door...");

	//PC moves to PC to the tile just outside the PC’s apartment tile. 
	moveTo("NURSERYG6");
	processTime(1);
	clearMenu();
	addButton(0,"Next",waitForMirrinToLay);
}

public function waitForMirrinToLay(turns:int = 0):void
{
	clearOutput();
	author("SoAndSo");
	showName("MIRRIN\nBIRTHING!");

	clearMenu();
	addButton(0,"Next",waitForMirrinToLay,++turns);

	switch (turns)
	{
		case 0:
			output("...Only to find the entrance busted up and an armed security officer standing outside it.");
			output("\n\nUhh..");
			output("\n\nThe nursedroid has a few words with him but the human officer merely raises his hand up.");
			output("\n\n<i>“Sorry ma’am, it’s in the MirrinBoss contract: unessential personnel are not allowed in until the whole thing’s over an’ done with. Not my rules, just whoever owns the boss’s contract,”</i> is his loud reply, his face and stance unwavering.");
			output("\n\nYou follow up behind the droid and confront the guard, explaining in perhaps more-than-necessary detail that it’s <i>your</i> baby in that room and <i>your</i> baby momma giving birth in that room he’s guarding.");
			output("\n\n<i>“Uhhhh, relations aside, it still stands I’m afraid. You see dis, " + pc.mf("sir", "ma’am") + "?”</i> he says firmly, pointing at a busted control panel and wrenched door lock next to him.");
			output("\n\n<i>“Dis ‘ere’s why security is needed for the Boss or rather... other people. Yeah, it’s fucked up but it’s in her and my contract. Don’t ask me who wrote it in either, I’m jus’ doing a job. You can wait around until the medics are all done getting that tyke outta her though.”</i>");
			output("\n\nHe flings his hands to the side and shrugs. With an ache in your chest and a heavy sigh, you return back downstairs. Nought to do but wait around for the good news, sucky as the situation is.");
			output("\n\nSo you wait...");
			processTime(5);
			break;
		case 1:
			output("...and wait...");
			processTime(2*60);
			break;
		case 2:
			output("...and wait!");
			processTime(60);
			clearMenu();
			addButton(0,"Next",mirrinBirthCloseToDun);
			break;
	}
}

public function mirrinBirthCloseToDun():void
{
	clearOutput();
	author("SoAndSo");
	showName("MIRRIN\nBIRTHING!");

	output("You make frequent trips to the cafeteria. Energy drinks and bars keep you awake and on the straight-and-narrow, if only just. Behind every trip is a comfortable sense of routine when you go back and forth. It’s just enough to keep your mind off of what could be happening. You wonder about how they even came to use your apartment in the first place and why Mirrin wasn’t taken to an actual medical facility. Then again, this place pretty much <i>is</i> a medical facility so that train of thought dies of quickly.");
	output("\n\nThere hasn’t been anymore outbursts in the time you’ve been here. Still an awful lot of nurses and helpers around... and more security. The security, in particular, make a habit of keeping themselves busy by patrolling the lower level. What could they even be here for? Thinking on it, this would be grade-A material for the paparazzi, and Mirrin does have the money for it... or at least someone on her side does.");
	if (StatTracking.getStat("pregnancy/total day care") > 0)
	{
		output("\n\nYou while away some time on the second floor with " + (StatTracking.getStat("pregnancy/total day care") > 1 ? "some of your kids" : "your kid") + ". It’s brief:");
		if (StatTracking.getStat("pregnancy/total day care") > 1) output(" they’re");
		else
		{
			if (ChildManager.ofGender(ChildManager.GENDER_MALE)) output(" he’s");
			else if (ChildManager.ofGender(ChildManager.GENDER_FEMALE)) output(" she’s");
			else output(" it’s");
		}
		output(" all so worn out with all the noise and commotion that");
		if (StatTracking.getStat("pregnancy/total day care") > 1) output(" they stay");
		else
		{
			if (ChildManager.ofGender(ChildManager.GENDER_MALE)) output(" he");
			else if (ChildManager.ofGender(ChildManager.GENDER_FEMALE)) output(" she");
			else output(" it");
			output(" stays");
		}
		output(" asleep even when you visit.");
		output("\n\nStill, the thought of adding another youngling to play with fills you with parental glee. It helps take your mind off more pressing things. The waiting only causes an anxious ache on the inside...");
	}
	output("\n\nOut of nowhere, almost six hours since you arrived, a small gaggle of nurses find you with their tired faces somehow brimming with delight.");
	output("\n\n<i>“[pc.Mister] Steele! It’s happened, come come! Gently now, there’s still security around and they’ve been less than helpful,”</i> beams the leading nurse, gesturing for you to follow her.");
	output("\n\nYou get up immediately and follow the group of three back up to the second floor.");

	//2 hours of in game time passes. PC moves to the nursery foyer.
	moveTo("NURSERYE14");
	processTime(2*60);
	flags["MIRRIN_JENTA_HATCHING_STAMP"] = GetGameTimestamp() + 7*60*24+rand(7*60*24);
	clearMenu();
	addButton(0,"Next",mirrinLaidAnEggo);
}

public function mirrinLaidAnEggo():void
{
	clearOutput();
	showMirrin();
	author("SoAndSo");
	showName("MIRRIN\nBIRTHING!");

	output("You’re given some much needed leeway in the corridor and you’re at the apartment before you know it. The security guard steps aside from the doorway and as you enter the room, quite the sight is there to greet you...");
	output("\n\nSprawled on top of two joined up futons and covered in a mixture of medical scrubs and thin sheets is the reclining form of Mirrin. Her head is held up by several cushions and a small, ovaline bundle of blankets sits in her palms. You can just make out the brownish-white mottling of a shiny smooth egg...");
	output("\n\nSurrounding her is an entourage of nurses and medics of all kinds. They’ve turned the main room of your apartment into a kind of emergency pitstop and it’s, uh, kind of a mess. You’re less concerned with that and more concerned with the occasional sounds of snapping cameras and shady folk. It’s doubtless that they’d have some contractual obligation to be there, sad a thought as it is. You save the thought for later to ask Mirrin about this whole ‘life in pictures’ thing she has going on but that can wait.");
	output("\n\nYou shimmy through the motley bunch of nurses and beeline right for your qilin lover. Her groggy expression turns to you as you make your ‘excuse me’s.");
	output("\n\n<i>“Eheeey... it’s my best [pc.boyGirl]. I knew you’d... make it...”</i> she murmurs. Her voice is tired and much huskier than usual; it’s likely she’s been screaming all day. You put your finger to your lips as she tries to muster more words and she nods almost immediately.");
	output("\n\nYou’ve never quite seen her so vulnerable or so placid and drained of energy. You swiftly set yourself by her side with your hands on her arm. The amount of body heat coming off of her is intense, as if she’d gone through a brutal full body workout. The dragoness slides her cradling palms over her front and closer to you so that the shiny, mottled egg is right under you.");
	output("\n\n<i>“Jenta...”</i> whispers Mirrin, her drooping eyes focused on the egg. You bend down and kiss the top of the shell, almost automatically. It’s impressively warm against your [pc.lipsChaste] and in the clutches of a small furnace like Mirrin. It’s definitely in the right hands. That’s what instinct is telling you, at least.");
	output("\n\n<i>“<b>SMIIILE</b>”</i>");
	output("\n\n<i>kzzzii-PMMMphhh</i>");
	output("\n\nYou almost jerk backwards as a camera flash gets into your eyes.");
	output("\n\n<i>“Fuck is...!”</i> you blurt out.");
	output("\n\n<i>“Alright, we got it boys! Snap of the month! Say goodbye loooosers, aw yeah!”</i> yells a shadowy journo from the end of the futon. You can practically <i>feel</i> Mirrin’s silent rage through her tensing arm muscles but knowing what she’s been through... it’s unlikely there’ll be a reaction.");
	output("\n\nNo less than five photographers waltz out of the room. The sounds of smug chatter are far louder than the general hubbub of everything else.");
	output("\n\n<i>“Mm... don’t hate them. It’s just what father wants, elskan. That’s those photograph... photogra... things paychecks for a year,”</i> slurs Mirrin. You watch as she makes a couple of obscure gestures to an observing security guard. At once, he makes an announcement.");
	output("\n\n<i>“Aight, all non-essentials out please, give us some space,”</i> he loudly asserts, waving his hands in the air. A collective grumble and shuffling of feet plays out as a swathe of twenty random people exit the room. The hell did they all come from?!");
	output("\n\n<i>“Stay with me for the night?”</i> whispers Mirrin, catching your attention. Her arm slumps to the side and around your [pc.hip] as an added incentive. Well <i>of course</i> you will but that only made things sweeter.");
	output("\n\nYou nod and she wriggles along the top of her futon to accommodate you. As if predicting this, an orderly pushes another futon - from another room, no less - underneath you, allowing you to sprawl attop it or snuggle closely to your baby momma.");
	output("\n\nWith you comfortably resting in her radiating embrace and your palm resting on the egg bundle, you both slip into a wordless, seamless sleep. Damn, today’s been... oh so tiring...");

	processTime(10);
	clearMenu();
	addButton(0,"Next",timeToRoostYourNewMirroidDraggin);
}

public function timeToRoostYourNewMirroidDraggin():void
{
	clearOutput();
	showMirrin();
	author("SoAndSo");

	output("Your dreams are fanciful and confusing. You see images of what you think could be your newborn daughter... starting life full of energy, growing up, starting her first career. It all cycles around in a layer of surreality and joy: she’s either a baker, a high-profile mercenary or professional saleswoman and that’s just one thread that your mind conjures up.");
	output("\n\nYou gently wake up to the sounds of idle chatter and a throaty breathing come from underneath you.");
	output("\n\nYou turn your tired gaze to Mirrin, exactly as you left her; still asleep. The egg lays firmly snuggled in between the dragoness’s cleavage and what a comfortable sight it seems to be.");
	output("\n\nYou consider waking her for a moment, but even if you weren’t there to experience it all, she must have had a hell of a time. The thought of all those paparazzi goons hanging around and getting free shots of your intimate moments is something you save for later. Maybe she can give you some answers when she’s up and about!");
	output("\n\nA nursedroid bumbles into the room.");
	output("\n\n<i>“Ahh, [pc.Mister] Steele, good morning. You must be quite tired so if you’re willing, I’ll fill you in on everything,”</i> she asks sweetly, hands held to where her sternum would be. You nod.");
	output("\n\n<i>“What do I have to know?”</i> you ask through a dry mouth.");
	output("\n\n<i>“One hundred percent natural, perfect birth. A healthy babe rests in the egg and should be expected to hatch in the next week. Ms. Arkosduttir is quite the individual. Most gryvain-related births are tumultuous affairs for the one bearing the burden. Still, smashed doors, battered nurses, scuffs against the walls: apparently it was a ‘nigh-euphoric’ experience. Thankfully a healthy dose of sedatives helped with the damage control,”</i> she explains, smiling sweetly all the while.");
	output("\n\nThere’s a sense of relief coming through her words even if not all your questions were answered. You thank her all the same.");
	output("\n\n<i>“Most welcome. We didn’t have much space in the other parts of the nursery for someone of her particular stature so we had to make do per the head nurse’s instruction. Ah, and Ms. Arkosduttir also conveyed her wish for you to not worry about her if you awoke first. She was very intent on making sure you carried on as normal and visited her when she was awake. Expect a message when the egg hatches. That was all.”</i>");
	output("\n\nYou sigh and nod again. It <i>was</i> what she wanted in a way: total responsibility for the " + (flags["MIRRIN_PREGSTAGE"]%2 == 0 ? "newborn" : "newborns") + ". Although she did also say you could visit whenever you want... your kids after all. Guess you gotta wait for that message.");
	output("\n\nYou slowly get up and dust yourself down, replacing Mirrin’s drooping arm back onto the futon-bed.");
	output("\n\nYou bid her and the egg a silent goodbye and the same to the nurse then begrudgingly make your way out of the nursery.");

	//16 Hours of in-game time passes.
	//*Puts player on the residential deck. Mirrin/the gym becomes unavailable for 48 hours.
	processTime(16*60);
	pc.createStatusEffect("MIRRIN_DISABLED");
	pc.setStatusMinutes("MIRRIN_DISABLED",2*24*60);
	clearMenu();
	addButton(0,"Next",move,"LIFT: RESIDENTIAL DECK");
}

public function jentaHatchingBegins():Boolean
{
	clearOutput();
	showMirrin();
	author("SoAndSo");

	output("As you enter the nursery, there’s a sudden drop in your concentration: you’ve got a new kid! Holy shit!");
	if (StatTracking.getStat("pregnancy/total births") + StatTracking.getStat("pregnancy/total sired") > 0) output(" Another one! Deary you!");
	output(" There’s so many nerves running around that your [pc.legOrLegs] already " + (pc.hasLegs() ? "feel" : "feels") + " like jelly.");
	output("\n\nYou’re not even sure where to go as if your memory of the nursery had vanished in an instant.");
	output("\n\n<i>“[pc.Mister] Steele! We’ve been expecting you! Please, please, this way!”</i> chimes in a robotic voice from behind as a nursedroid grips you by the forearm. Although you’d normally react to this, a moment of disorientation takes you out of the zone. You willfully follow the droid in a rush of sudden adrenaline, as if your body was anticipating something magical to happen right around the corner...");
	output("\n\nAnd then you see them.");
	output("\n\nJust after the break room where a small line of chairs sit against the wall is a makeshift playpen. A crouched over Mirrin, now sporting a cheesy shirt with ‘Galaxy’s Best Dadmom’ on the front, cradles and tickles a tiny tot. She only needs the palm of her powerlifter’s hand to hold the small thing, all safe and secure inside a finger-wall of red.");
	output("\n\n<i>“Aboobooboboooooo,”</i> teases the dragoness, blowing raspberries on her tiny daughter’s belly. The resultant giggling from both of them almost seems to leap out at you and tickle your very heart.");
	output("\n\nThe nursedroid appears to have dashed off somewhere else.");
	if (StatTracking.getStat("pregnancy/total births") + StatTracking.getStat("pregnancy/total sired") > 0) output(" Likely to go deal with your other, <i>other</i> children.");
	output(" You [pc.walk] with a little unease to the pen, catching a proper sight of your new daughter.");
	output("\n\nShe’s tiny, smaller than you’ve seen of human babies. A little on the fudgy side but still cute. Two nubs that might one day grow into horns poke out of the top of her forehead, both charcoal black. Her skin is a " + (baby.skinTone == "ebony" ? "light, smooth fudge color" : "soft creamy-white") + ", very smooth and dotted with black, shiny scales in the expected places. She wears a large diaper, one that almost hugs her entire torso.");
	output("\n\n<i>“Oh oh! [pc.name]! Come see, come see, she has to seeee,”</i> flusters Mirrin, all cross-legged and held down by the impossibly heavy weight of one baby. You laugh as she looks around her legs for the reason she can’t stand, not quite realising that her sitting position is the problem.");
	output("\n\n<i>“There’s my two babes,”</i> you tease, parting the pen gate. You kneel in front of them dragoness and put your arms out expectantly.");
	output("\n\n<i>“Two? But... oh, me. Meanie,”</i> she pouts, begrudgingly handing you the wriggling Jenta with both hands. You scoop her up immediately and cradle her close to your [pc.chest]. The tiny tot becomes transfixed with your [pc.face], her pinkish-red gryvain eyes never turning away for a second.");
	output("\n\n<i>“Jentaaaaa,”</i> you coo, rocking her gently from side to side. <i>“Heeeeey, it’s dad! Yeeeah.");
	if (pc.isHerm()) output(" Well, momdad. Ooo, maybe I should get a shirt too.");
	output(" Aw aren’t you just the smallest thing...”</i>");
	output("\n\nTiny Jenta smiles a toothless smile and tries to put her hand into her mouth. It’s almost unsettling just how loudly your heart pumps in these few moments, like some sort of irrational fear is overcoming you and then passing through just as quick.");
	output("\n\nThis seems <i>right</i>.");

	clearMenu();
	processTime(10);
	addButton(0,"Next",jentaIsHatchedAndInitialized);
	return true;
}

public function jentaIsHatchedAndInitialized():void
{
	clearOutput();
	showMirrin();
	author("SoAndSo");

	output("You’re not exactly sure how long you spend cradling and playing with your baby daughter. Somehow, you end up both cradling a baby and being cradled by Mirrin as you lay on your back with baby on belly. She takes a similar fascination with your features: stroking your [pc.hair], trailing her thumb across your cheekbones and jaw, some very light massaging of the temples in <i>all</i> the right places, <i>just</i> like that baby, oh ye-");
	output("\n\n<i>“Ah fokk, the time. You see this? This is to tell me that some men in suits are waiting to give me some money for letting them turn me into a video game thiinnnng or uhhh, whatever it was. I gotta... gotta go,”</i> fluffs the qilin, showing you a brief glimpse of some alert coming up on her communicator.");
	output("\n\nWell shit. With all this going on, you hadn’t even noticed little Jenta drifting to sleep on your chest. Aw...");
	output("\n\nYou carefully slide yourself out of the comfort zone that is Mirrin’s lap and give her enough space to hurry off to where she needs. Some part of you wishes that you had a little more knowledge of all that’s going on in her business ventures, yet... something else tells you that it’s not exactly the same as shooting big ol’ space lasers. A nearby nursedroid already has her arms extended to receive the motionless Jenta, and you sigh as you hand her over.");
	output("\n\nSpace ain’t no place for the babes just yet.");
	output("\n\nYou and Mirrin enjoy a body-covering hug and whisper your goodbyes to each other. She clops off to the elevators and you take the stairs, definitely promising to yourself that you’ll come back later.");

	flags["MIRRIN_JENTA_MET"] = 1;
	var jenta:MirrinUniqueChild = new MirrinUniqueChild();
	
	jenta.RaceType = GLOBAL.TYPE_GRYVAIN;
	jenta.MaturationRate = 1.0;
	jenta.BornTimestamp = MailManager.getEntry("mirrin_jenta").UnlockedTimestamp - 30 - rand(16);
	jenta.NumMale = 0;
	jenta.NumFemale = 1;
	jenta.NumIntersex = 0;
	jenta.NumNeuter = 0;

	jenta.Name = "Jenta";
	jenta.skinTone = (baby.skinTone == "ebony" ? "chocolate" : "white");
	jenta.lipColor = "brown";
	jenta.nippleColor = "brown";
	jenta.eyeColor = "rose";
	jenta.hairColor = "silver";
	jenta.scaleColor = "grey";
	ChildManager.addChild(jenta);

	StatTracking.track("pregnancy/mirrin sired", 1);	
	StatTracking.track("pregnancy/total sired", 1);
	StatTracking.track("pregnancy/total day care", 1);	

	//*Puts player on Tavros residential deck, ends scene
	clearMenu();
	addButton(0,"Next",move,"LIFT: RESIDENTIAL DECK");
}

public function mirrinSterkurHusBonus():Boolean
{
	clearOutput();
	showMirrin();
	author("SoAndSo");

	if (flags["MIRRIN_SEEN_STERKURHUS"] == undefined)
	{
		output("You’re a little surprised that she managed to both fit and get permission for these sliding doors, doubly so when you wonder how she handles security.");
		output("\n\nStill, as you enter the spartan, pristine white apartment, a familiar sight greets you: tiled rubber mats, a few spots with weights and machines in different corners of the small space, open plan to other areas... definitely Mirrin’s place.");
		output("\n\n<i>“You like, Steele?”</i> comes that familiar, smoky voice from behind. Mirrin walks up to your side, hands on her hips. She’s dressed differently than normal...");
		output("\n\nYou tell her it’s impressive, certainly when considering how small apartment lots tend to be.");
		output("\n\n<i>“Well sure, bought two and just knocked down the walls. How did I do it all so quickly? Ehh, company secret,”</i> she replies, tapping the side of her nose. Guess that’s as good a reason as any.");

		flags["MIRRIN_SEEN_STERKURHUS"] = 1;
	}
	else if (flags["MIRRIN_COCKSTAMP"]!= undefined && GetGameTimestamp() > flags["MIRRIN_COCKSTAMP"])
	{
		output("You’re on the lookout for your qilin lover, fully expecting her in her usual coaching spot. Yet, as you look around, she’s nowhere to be seen...");
		output("\n\nThere’s still clientele on the treadmills and weights, more random faces you don’t really recognize but still no big red giant lady. You think about calling out for her, but hey, it’s just her apartment really. She must be in the back!");
		output("\n\nYou wander off to the side rooms, following the dark corridor away from the noisy gym music and mechanical motions.");
		output("\n\nYou can definitely <i>hear</i> her somewhere, as if she were struggling with something that won’t quite fit. You spy the light of her ‘love dungeon’ from an open door and peer inside...");
		output("\n\n<i>“Fokkingg.... Hesturtyppi! Get. In. There. FUCK!”</i>");
		output("\n\nBetween gruff growls of frustration is the visceral sound of leather ripping itself apart. You can only hold back a laugh as she holds the ruined remains of yet another destroyed jockstrap in her hands. Even though you’re watching from behind, you can picture the impotent rage coloring her face right now.");
		output("\n\n<i>“Ahh, the eternal struggle for plus-plus-plus sized underwear,”</i> you say aloud as you enter the room.");
		output("\n\n<i>“Agh! [pc.name], sweetie, h-hold on!”</i> flusters the qilin as she looks over her shoulder, silver tails swaying around as she covers something on her front. <i>“Don’t come in!”</i>");
		output("\n\n<i>“Buuut why not? We’re far pretty beyond ‘I’ve seen you naked’, you know,”</i> you sass, resting against the doorway. Hey, if this is something you can make jokes with, you’re milking it.");
		output("\n\n<i>“I... ehh, wanted it to be surprise. You know how we talked about ‘upgrades’ in the ‘bedroom’ area?”</i> she sighs with a slump, throwing the useless leather to the side.");
		output("\n\n<i>“Aw you didn’t, no! That’s so awesome!”</i> you exclaim, clasping your hands together as something strangely wholesome bubbles within you.");
		output("\n\n<i>“Yeah yeah but... I had this whole big, sexy reveal thing and it was going to be sweet. I, uh, thing... forgot entirely about new underwear,”</i> she flusters, twirling her fingers in the air. <i>“Well, if it’s out of the bag, want to see?”</i>");
		output("\n\nYou nod far harder than is healthy and lick your [pc.lipsChaste] in anticipation as Mirrin pivots on her hoof to turn around...");
		output("\n\nDangling free in a softened state are her ‘new’ horse-cocks. Nestled above her coco-nuts, the two lengths pulse and twinge with ambient arousal and are much longer than you’re familiar with. Jeez, they must be 12\" when <i>soft</i>! Just how big did she go...?! You can’t help but analyze it more, of course: she did it all for you...");
		output("\n\nWhat takes your eyes first are the new bulges of meat near the bases of each shaft. Bulbous knots, although only an inch or so thicker than the shaft proper. The thought of having one lock inside you is almost too much to bear. Even more so when you notice the curious ribbing that lines both shafts: as if calling back to her gryvain genes, thick ribs line each shaft, reaching across the sheath and all the way to the flare. You count eight across each shaft, intervaled like a boutique condom. And is it just you or are those veins a little bit thicker...?");
		output("\n\nYou spend a few minutes too long just staring in awe, not a word said as the pendulous shafts steal your attention.");
		output("\n\n<i>“So you like ‘em, hm? Feels a bit chilly just having them out like this when...”</i> chuckles Mirrin as she gives her biggest shaft a soft pat. <i>“When no one’s handling it. How about a ha-”</i>");
		output("\n\nYou cut her off as you put a hand on each beastly member, more than intent on seeing how they work now. Your small movements alone are enough to make them twitch in your grasp and that’s all the incentive you need to jerk the lengths. The towering qilin almost seems to purr with pride as your magic touch invokes the hardening ritual, quickly fueling the meatsticks with pulsing blood. The raw warmth and stiffening muscle excites you on a base level: <i>this</i> is the alpha predator. This is going to destroy you. This is what you wanted.");
		output("\n\n<i>“You like?”</i> murmurs the husky dragoness as she freely, wantonly pats and fondles your [pc.ass].");

		flags["MIRRIN_COCKSTAMP"] = undefined;
		flags["MIRRIN_BIGGUS_DICKUS"] = 1;
		mirrin.upgradeCawks();

		processTime(3);
		clearMenu();
		addButton(0,"Hell Yes",yeMirrinLetsTryOutDemNooDicks);
		return true;
	}
	else if (flags["MIRRIN_PREG_TIME_LEFT"] != undefined && flags["MIRRIN_PREG_DURATION"] != undefined && flags["MIRRIN_PREG_TIME_LEFT"]/flags["MIRRIN_PREG_DURATION"] < .4 && flags["MIRRIN_TOOK_PICS_TIMESTAMP"] == undefined && !MailManager.isEntryUnlocked("mirrin_royalties"))
	{
		output("As you enter the bright foyer of SterkurHús, Mirrin is already idling by the entrance with a communicator in hand, a small headset across her ear and a human photographer with a camera standing a few feet away. He’s already got his tripod and backdrop set up and Mirrin stands in front of the cocoa brown backdrop, her loose tank top rolled up over the motherly bump that’s taken over her once rock-solid midriff.");
		output("\n\nWhen the sliding doors close behind you, she turns away from her digital distractions and trots to you with a spring in her step.");
		output("\n\n<i>“Ahhah! Babe, babe, I missed you, hoooly shit, this timing! THIS TIMING! Ok, you all good there?”</i> she exclaims aloud, lightly bear-hugging you around the shoulders only to quickly turn and thumbs-up the photographer.");
		output("\n\nHe thumbs-up just as quickly, his attention seemingly all over the place.");
		output("\n\n<i>“Comecomecome, over here,”</i> she says quickly, gently pulling you along by your hand and [pc.hip] to her previous spot. <i>“Thaaat’s it [pc.name], just behind me and hands... here.”</i>");
		output("\n\nIn a quick series of motions, you’re now behind her with your front firmly pressed against her back.");
		if (pc.isPregnant()) output(" You take caution with your [pc.belly], making sure not to squish your little passenger.");
		output("\n\nThe dragoness grasps your wrists and places your hands firmly on her swollen bump, positioning them to her liking. You’re so swept up in all of this that you let her do it freely, perhaps a little happy to have her secure grip manhandling you once more.");
		output("\n\n<i>“Aaaand, smile,”</i> says the photographer.");
		output("\n\nMirrin forms a positively dirty facial pose in a flash, the same sort of ‘come and get me’ face that you’ve seen most models use. Her hands move all over her bump and body, sometimes covering your hands and sometimes letting yours cover hers, the tell-tale snap of a camera signaling the change of each one. You notice that with each shot, she subtly moves your hands ever so slightly closer to her tightly bound bulge...");
		output("\n\nWhen it makes contact, you take a peek from " + (pc.tallness > 96 ? "over" : "under") + " her shoulder and see the smuggest of grins forming across her face. You take a little initiative, pushing further into the tight layers of fabric until your fingertips touch upon her coiled up cockmass.");
		output("\n\n<i>“Hooold it,”</i> calls out the photographer, raising his hand up. <i>“Just lemme focus and...”</i>");
		output("\n\nYou hold the position with a dopey grin on your face, the thunderous heartbeat of the beast you’re adhered to pulsing through her shafts and through your fingers.");
		output("\n\n<i>Spih!</i>");
		output("\n\nThe camera flashes and flickers several times over. You lock up in place as the flashes startle some primal instinct inside you and all you can do is grip into the pillar of muscle that holds your hands.");
		output("\n\n<i>“Aight, all good, muscle boss. Just need one or two more of ya friend here,”</i> rushes the photographer, guiding you in your slightly dazed state to the side of the backdrop.");
		output("\n\n<i>“Arms folded please,”</i> he says quickly, holding the camera up. You fold your arms against your [pc.chest] quickly and smile for the camera, [pc.lipsChaste] parted just <i>so</i>. Another couple of <i>spih</i> sounds later and you’re given the thumbs-up.");
		output("\n\n<i>“I’ll send the raws over tonight, expect the article out in a couple of weeks. Girls and boys back home are gonna love this, aheh,”</i> chuckles the photographer, him and Mirrin exchanging a loose handshake.");
		output("\n\n<i>“Rrrrright, good. I’ll push my agent for a recommendation, eh? You’ve got great posing ideas. Grab lunch next time you’re here, ya?”</i> she replies, waving him away as the journo leaves the gym.");
		output("\n\nWow, a shoot! You’re gonna be in a publication...");
		output("\n\n<i>“Now c’mere you,”</i> she giggles, pulling you out of your thoughts and to her bump. You gently rest your hands on top of her baby-belly and rub the she-dragon’s taut skin. It’s all so warm and <i>motherly</i> against your palms. There’s an overwhelming urge to just... stay and protect it, this little cradle of life... then again, knowing who owns said cradle, she could handle a lot.");
		output("\n\n<i>“All yours. Whenever I think that, I just get so... red in the face. Difficult to do if I already have a red face but ehhh you get the uhhh, get the joke, hehe,”</i> she fumbles, trailing her claw tips against your shoulder. They tickle you something nasty, that’s for sure.");
		output("\n\n<i>Beezzrrrrt</i>");
		output("\n\nSome sort of small, muffled alert goes off between you two.");
		output("\n\n<i>“Ahhhh... bjáni. Busy day today, talking to someone about doing a VR thing. Can you come back in like uhhh, twenty minutes, babe?”</i> sighs the dragoness, reaching into a pocket for her communicator. You nod and plant a good-luck kiss on her bump.");
		if (pc.isPregnant()) output(" She does the same for yours and blows you a kiss on top.");
		output(" You turn to leave as she puts the device to her ear.");
		output("\n\n<i>“Yah yah, it’s me. Fantasy setting? What am I doing in it? Stealing the princess...?”</i>");
		output("\n\nYou shake your head and chuckle at her before leaving her to her call.");

		flags["MIRRIN_TOOK_PICS_TIMESTAMP"] = GetGameTimestamp() + (20 + rand(11))*24*60;
		pc.createStatusEffect("MIRRIN_DISABLED");
		pc.setStatusMinutes("MIRRIN_DISABLED",60);
		clearMenu();
		addButton(0,"Next",goToFrontOfMirrinGym);
		return true;
	}
	else if (flags["MIRRIN_DEPREG_TALK"] == undefined && flags["MIRRIN_PREGSTAGE"] != 10 && flags["MIRRIN_PREG_TIME_LEFT"] == undefined)
	{
		output("You see the towering dragoness immediately. Without thinking, you quickly [pc.walk] over to her and hug Mirrin from behind.");
		output("\n\n<i>“Heeeey,”</i> you say automatically, squeezing tightly around her waist.");
		output("\n\n<i>“Eyy? [pc.name]? C’mere, c’mere,”</i> she flusters, turning around to embrace you fully; a full body hug that leaves you completely covered in radiating muscle. You give in and hug back, happy with knowing that she’s all recovered from her intense pregnancy.");
		output("\n\n<i>“How’re you feeling? How’s the baby?”</i> you ask quietly, still holding onto her middle.");
		output("\n\n<i>“Aaaa little rough but getting better every day. I think it was all the time I spent just resting in the nursery. Gotta thank you properly for that sometime. Jenta is doing well too.");
		if (!jentaBorn()) output(" Still all uhhh, eggy. I’ll ping you when she’s out of course,");
		output("”</i> she says with the usual pep in her smoky voice.");
		output("\n\n<i>“I’m goooood, I promise,”</i> she chuckles as you realize you’ve been hugging her for several minutes. <i>“Follow me, eh? I can fill you in if we talk.”</i>");
		output("\n\nYou sigh and reluctantly let go. She’s so <i>waaaarm</i>...");
	}
	else
	{
		output("The stark white of the open plan apartment tingles your eyes as you walk in, the sounds of intense routines and four-to-the-flour gym tunes reverberates around it with palpable energy.");
		output("\n\nMirrin is trotting about between the two or three gym goers present, spotting here and correcting postures there. She immediately turns her attention to you as you walk in.");
		output("\n\n<i>“Steeeele, missed you missed you, tell me what’s up,”</i> she exclaims, almost bouncing on her hooves as she places her palms on your shoulders. You greet her with a loving hug, telling her you’re doing well and that you wanted to visit your favourite dragoness, much to the qilin’s blushing cheeks. She composes herself and clears her throat.");
		output("\n\n<i>“Eheh, never sure when the treadmillers are slacking...”</i>");
	}

	output("\n\nShe wanders over to the open kitchen, keeping eyes on her clients as she does. You follow of course, right by her side.");
	output("\n\n<i>“So,”</i> she begins, leaning her front against a black granite table with a soft grin on her face. <i>“What brings my most precious person in the world to the dragon’s lair, hm?");
	if (flags["MIRRIN_DEPREG_TALK"] == undefined && flags["MIRRIN_PREGSTAGE"] != 10 && flags["MIRRIN_PREG_TIME_LEFT"] == undefined)
	{
		output(" I already know of, uuuh, course. It’s about the egg and stuff. Or maybe not, iunno, just say it already before I start blathering about nothing, ahehe.");
		flags["MIRRIN_DEPREG_TALK"] = 1;
	}
	output("”</i>");

	if (flags["MIRRIN_BIGGUS_DICKUS"] != undefined) mirrin.upgradeCawks();

	mirrinSterkurHusButtons();
	return true;
}

public function mirrinSterkurHusButtons():void
{
	clearMenu();
	addButton(0,"Appearance",mirrinsNewLook,undefined,"Appearance","Moving planets has given her a different lease on life and now she’s an official QILF (Qilin I’d Like To Fondle).");
	addButton(1,"Talk",sterkurHusChattus,true,"Talk","Well ya know. Talk. Duh.");
	if (pc.hasStatusEffect("MirrinSexCooldown")) addDisabledButton(2,"Sex","Sex","<i>“Sorry babe, still a bit worn out from before!”</i>");
	else addButton(2,"Sex",mommirrinSexingTimes,false,"Sex","It’s just been so long since you chased that dragon tail, you want all of it to yourself.");
	if(pc.isWornOut()) addDisabledButton(3,"Train","Train","You’re too tired for a training session.");
	else addButton(3,"Train",trainWithMirrinInHerGymmin,undefined,"Train","Put your body through its paces.");
	addButton(4,"Relaxing Time",chillinAnMirrin,undefined,"Relaxing Time","That sounds good. Nothing crazy, just snacks, hugs and movies...");
	if (pc.hasStatusEffect("MirrinTiddysuckCooldown")) addDisabledButton(5,"Nursing","Nursing","Let her build up some more first?");
	else if (flags["MIRRIN_PREG_TIME_LEFT"] != undefined || jentaBorn()) addButton(5,"Nursing",drinkSumDragonJuice,undefined,"Nursing","Jeez, those <b>tits</b>... if they weren’t big and imposing already, now they’re milky as heck! Maybe you could have a nice nibble on a nipple.");
	addButton(14,"Leave",goToFrontOfMirrinGym);
}

public function mirrinsNewLook():void
{
	clearOutput();
	showMirrin();
	author("SoAndSo");

	output("Mirrin is a self described qilin, which to your knowledge is mythological creature that is part horse and part dragon. Originally, she was born as a half-human, half-gryvain who went through thorough gene splicing and modification to get her ideal self-image.");
	output("\n\nBorn on Earth, there’s always been something odd about her accent and verbal mannerisms. They seem to indicate that she grew up in some part of Scandinavia if your codex is anything to go by. While she’s a bit of a bilingual, your codex doesn’t cover her own linguistic foibles, often leading to her spouting slightly odd turns of phrase.");
	output("\n\nMirrin is a large creature, towering above most: eight feet in height and with the frame of a tank. She is a powerfully built wall of muscle, pretty much every part of her having detailed and cultivated flesh that has been honed over decades. Despite this, her shape is distinctly feminine, and her muscle mass accentuates her lady lumps and bumps in all the best places. It still doesn’t stop certain aspects, such as her notable abs, from adding a masculine twist on top of her loud voice and endowments.");
	if (flags["MIRRIN_PREG_TIME_LEFT"] != undefined && flags["MIRRIN_PREG_DURATION"] > 0)
	{
		output("\n\nCurrently, said abs are fighting against the");
		var percent:Number = flags["MIRRIN_PREG_TIME_LEFT"]/flags["MIRRIN_PREG_DURATION"];
		if (percent < .25) output(" ovaline and gravid egg-bump");
		else if (percent < .50) output(" noticeable baby bump");
		else if (percent < .75) output(" mild bulge");
		else output(" small, unusual curve");
		output(" that’s taken over her belly. How she manages to maintain peak movement without difficulty is obscured to you...");
	}
	output("\n\nAs a half-gryvain, her toned, clay-red human skin is dotted with dark, rich-red scales. They form in clusters at sensitive points: neck, wrists and joints for the most part.");
	output("\n\nLike most gryvain and gryvain hybrids, a crown of horns rests on her head, although hers extend from the top of her forehead in angular ‘S-curve’ shapes. The horns are a rich jade-green in color, a multitude of spirals and designs giving them a crafted or chiseled look. You happen to know they’re naturally grown, at great physical and monetary expense to the owner.");
	output("\n\nUnlike most gryvain and gryvain hybrids, she has no wings or any discernible markings that denote former wings. One of the many foibles in her idea of self-image.");
	output("\n\nLooking down, her hefty horse-hooves follow a similar pattern and color design to her horns, slightly splayed to accommodate her thick, rippling thighs and overall frame.");
	output("\n\nHer silvered hair is long, thick, and straight, most usually kept in a tightly wrapped ponytail while a hint of a mane follows from the base of her skull to the start of her neck. Her actual pony’s tail follows the same arrangement, although its strands are more coarse. Tight leather binding holds both tails into their shapes and when she undoes them, the silver cascades behind her and flows freely. If your mind ran wild, she’d give the impression of some kind of Herculean deity when the wind blows through the strands...");
	output("\n\nIn terms of outfit, you’ve seen her in all manner of sponsored gear and getups, but right now, she’s wearing a grey tank top with ‘Galaxy’s Greatest Dadmom’ that fits loosely over her chest and a tight looking pair of grey yoga pants. The straps of her telltale jockstrap peak out over the rim, still trying its best at holding back the contents within. Speaking of...");
	output("\n\nYou can’t help but have your eyes drawn to her more intimate features.");
	output("\n\nHer prominent" + (flags["MIRRIN_PREGSTAGE"] != 10 ? ", matronly and oh-so-milky F-cup" : " E-cup") + " chest is nestled into her loose tank top and barely seems to fit even with all that loose material.");
	if (flags["MIRRIN_PREGSTAGE"] != 10) output(" You’re surprised she’s managed to adapt to the additional bust from her pregnancy, even if her method leaves even less to the imagination than before.");
	output("\n\nEvery so often, hints of her long, fleshy tongue slide and flick out from between her teeth. When it’s fully out, it almost matches the length of her forearm and is supremely dexterous.");
	output("\n\nMirrins hips are curvy and toned, as much as she is of course. Those two cornerstones of her powerful body lead to a squat-toned ass that perks out with muscle. As well-shaped as it is, there’s still a good bit of tasty jiggle whenever she walks.");
	output("\n\nHer jockstrap fights constantly to contain the beasts within: two thick horse-cocks, powered by coconut-sized nuts.");
	if (mirrin.cLength(0) > 20) output("\n\nHaving been subject to your wily ways, Mirrin’s upgraded dongs are much beefier than before: her top dong is 22\" long and 4\" wide while the lower one is 17\" long and 3\" wide. Both have 5\" knots nestled above the bases, both have slightly pointed flares ready for easy insertion and both are ribbed with gryvain-cock ridges, hybridizing her heritage with her equine bent.");
	else output("\n\nThe two shafts stand at 16\" by 4\" and 12\" by 3\" respectively, flaring proudly when erect and ready to bulldoze even the most well trained orifice.");
	output("\n\nNestled away underneath that all is her kegel-powered pussy, something she saves for more ‘special’ moments.");
	if (flags["MIRRIN_PREG_TIME_LEFT"] == undefined && flags["MIRRIN_PREGSTAGE"] != 10) output(" Now a proper mother, you can only think of how much more able she is to take bigger and wider insertions...");
	output(" A tailhole, as trained and as practiced as everything else about her, hides away and don’t you feel special knowing that it’s for your eyes only...");

	addDisabledButton(0,"Appearance");
}

public function sterkurHusChattus(showText:Boolean = false):void
{
	if (showText)
	{
		clearOutput();
		showMirrin();
		author("SoAndSo");
		output("<i>“What’s on your mind, my sweet?”</i>");
	}
	clearMenu();
	addButton(0,"Apartment",soGladMirrinIsntHomeless,undefined,"Apartment","Ask about the new digs! A good bit of effort went into it, it seems.");
	addButton(1,"Business",soWhyIsntMirrinHomeless,undefined,"Business","Ask her about how the whole personal trainer thing is going.");
	if ((flags["MIRRIN_PREGSTAGE"] == 10 || jentaBorn()) && (flags["MIRRIN_PREGSTAGE"] == 8 || torriBorn()))
	{
		if (flags["MIRRIN_PREGSTAGE"]%2 == 0) addButton(2,"Baby",mirrinTalkKiddos,false,"Baby","How is the kids?? <i>You must knooooow</i>.");
		else addButton(2,"Babies",mirrinTalkKiddos,true,"Babies","How are the kids?? <i>You must knooooow</i>.");
		addButton(3,"Us",talkToMirrinAboutYouAndMirrin,undefined,"Us","Well ya know... ya gotta talk about feelings and stuff.");
		if (flags["MIRRIN_COCKSTAMP"] == undefined && mirrin.cLength(0) < 20) addButton(4,"Modding",mirrinILikeYourDicksAndWantMoreDick,undefined,"Modding","She’s a big girl... you want her bigger. Ask her if she’d be willing to ‘upgrade’ her body.");
	}
	addButton(14,"Back",mirrinSterkurHusButtons);
}

public function soGladMirrinIsntHomeless():void
{
	clearOutput();
	showMirrin();
	author("SoAndSo");

	output("<i>“Well first off, congrats on the new apartment! Certainly had bits of ‘you’ put into it,”</i> you begin, taking up the spot next to her. Taking the hint, the dragoness puts her hand round to your waist, thus pulling you to her.");
	if (flags["MIRRIN_PREGSTAGE"] != 10) output(" Your arm manages to bump into her matronly bust, making Mirrin ‘oop’ as you do. Jeez, how does she even manage with those things?!");
	output("\n\n<i>“I’m more relieved than I thought, you know, was sure I’d never get permission to tear down a wall for it all. Pulled in some favours, quick workmen, very good. Halfway through buying I just thought, yeah, you know, personal trainer shit. Even in short time, shows Tavros needs me after all. Beats miles and miles of cows any day,”</i> she opines, a little tired and slow in her speech.");
	if ((flags["MIRRIN_PREGSTAGE"] == 10 || jentaBorn()) && (flags["MIRRIN_PREGSTAGE"] == 8 || torriBorn())) output(" Must be all those nursery visits! There’s a certain nagging thought that wills you to do the same.");
	output("\n\nShe exhales through her nose, squeezing you close again.");
	output("\n\n<i>“Between babies, moving, thinking about how you’re handling, I just... fuck, it’s the mental effort more than anything, you know? Haven’t had to use my head for a, uhhh, you know... a while,”</i> she continues, her eyelids looking sluggish. You comfort her with a rub of her abs, " + (flags["MIRRIN_PREG_TIME_LEFT"] != undefined ? "a gentle caress that brings out a half-giggle from the qilin" : "the fabric of her tank top belying the iron-hard firmness of her wide six-pack") + ". She doesn’t <i>need</i> to be so worried, she’s got...you...");
	output("\n\n<i>“Mmhm, I get it, I get it,”</i> she half-whispers into your ear, kissing the " + (pc.tallness < 84 ? "top of your head." : "side of your neck."));
	output("\n\n<i>“Oh that’s a thing, oddly. So aside all this gym shit, there’s a photo room, kitchen obviously, uhhh, bathroom and a uh, jacuzzi and lastly...”</i> she trails off, her claw tips massaging your [pc.hip]. <i>“Very nice, very teched up bedroom. Thought of you always, elskan. " + (flags["MIRRIN_PREG_TIME_LEFT"] != undefined || pc.hasPregnancyOfType("MirrinPregnancy") ? "Can show you it all when the " + (flags["MIRRIN_PREG_TIME_LEFT"] != undefined && pc.hasPregnancyOfType("MirrinPregnancy") ? "babies pop" : "baby pops") + " out, huh?" : "Stick around and I can guarantee a wild fucking party, eh?") + "”</i>");
	output("\n\nOoo, sounds like a promise...");
	output("\n\n<i>“Mhmm, you bet,”</i> she finishes, nuzzling your [pc.ear].");

	processTime(3);
	sterkurHusChattus();
	addDisabledButton(0,"Apartment");
}

public function soWhyIsntMirrinHomeless():void
{
	clearOutput();
	showMirrin();
	author("SoAndSo");

	output("<i>“Let’s see, hm. Is it just the gym thing now or...?”</i> you start, pondering on how much this all cost her to set up.");
	output("\n\n<i>“Oh, money stuff? Pfft, that’s all fine. Gym is more of a ‘cuz I can’ kind of thing. Still do shoots, many more contracts on the table now. Agent actually won’t leave me the fuck alone. Before, I had several sectors of space between me and him, now he can just take a day trip over and back again... helvitis bjáni, doesn’t help with all the journos and their bump-loving shitty news items. Might have some invasive shit every now and then, maybe. We can handle it in any case, hm?”</i>");
	output("\n\nShe pauses, turning around to lean on the table and look over her couple of clients.");
	output("\n\n<i>“Ey ey, I see you! Back on that mill!”</i> she calls out, pointing to an phone-fidgeting human girl.");
	output("\n\n<i>“Yeeeah, that’s right, back on it. 20 kilometers or I bench press you to the ceiling!”</i>");
	output("\n\nYou snort, the fumbling female almost slipping as she gets back onto the treadmill. Welp, at least Mirrin’s getting some joy out of it all.");
	output("\n\n<i>“Hm, you know, I should remind myself to take you on a shoot some day. Be fun, eh? Give those stupid lifestyle-types one of those dumbass ‘power couple’ things,”</i> she chuckles, turning to you and locking her tired gaze to your eye-level.");
	output("\n\n<i>“Be fun, huh? Mm, could wrangle you in some dough if you want it.");
	if (flags["MIRRIN_PREG_TIME_LEFT"] != undefined || pc.hasPregnancyOfType("MirrinPregnancy")) output(" Show off " + (flags["MIRRIN_PREG_TIME_LEFT"] != undefined && pc.hasPregnancyOfType("MirrinPregnancy") ? "those bumps" : "that bump") + " for the galaxy to see, huh?");
	output(" Damn, you in a bikini commission...”</i>");
	output("\n\nShe leans her chin on her hand, a pinky teasing the edge of her grinning mouth. You grin back, looking over yourself as you try to imagine your body adorned in sumptuous, expensive threads. Heh...");
	output("\n\n<i>“Something to keep in mind anyway,”</i> she finishes, winking at you.");

	processTime(2);
	sterkurHusChattus();
	addDisabledButton(1,"Business");
}

public function mirrinTalkKiddos(bothKiddos:Boolean):void
{
	clearOutput();
	showMirrin();
	author("SoAndSo");

	output("<i>“Soooo, how’s our little " + (bothKiddos ? "Jenta and Torri" : (jentaBorn() ? "Jenta" : "Torri")) + " doing?”</i> you ask, nudging her arm with your elbow.");
	output("\n\n<i>“Oh " + (bothKiddos ? "they’re" : "she’s") + " great. I spend like, four hours just doing things with " + (bothKiddos ? "them" : "her") + " every day. I wish I could do more but, uhhh, poor " + (bothKiddos ? "things sleep like rocks" : "thing sleeps like a rock") + ", you know? Plus I have <b>other</b> babies to take care of... but yeah, damn.");
	var child:Child = ChildManager.youngestOfUniqueType(MirrinUniqueChild);
	if(child != null)
	{
		//.childAge();
		if (child.Years > 1) output(" You should see " + (bothKiddos ? "them" : "her") + ", elskan. A joy to be with, I can’t... I can’t ever thank you enough, my sweet.");
		else if (child.Months > 6) output(" " + (bothKiddos ? "Both of their" : (jentaBorn() ? "Jenta’s" : "Torri’s")) + " teeth have set it so a bit restless sometimes. Hurts the fucking nips, like whyyyy does nature make it so painful, fuck!");
		else if (child.Months > 2) output(" " + (bothKiddos ? "They’re" : "She’s") + " looking so healthy now, I didn’t think I’d uh... enjoy breastfeeding so much, fuck. I haven’t felt so ehh... girly. Like, goopy, squishy on the inside, bleh. I have to slap myself sometimes or else the gym regs are going to talk, ha!");
		else if (child.Days > 3*7) output(" Tiny " + (bothKiddos ? "things" : "thing") + ", although you know I uh.. I see a bit of you in " + (bothKiddos ? "the two of them" : "her") + ". Still on that Nutrisynth stuff instead of milk but eh, I have to trust what the nurses do.");
		else if (child.Days > 1) output(" Tiny, tiny " + (bothKiddos ? "things" : "thing") + ", so precious. Always scared I’m going to break something so I barely even touch " + (bothKiddos ? "either of them" : "her") + " right now. That look I get from the little " + (bothKiddos ? "things" : "thing") + " when I come to visit though, bjáni...");
	}
	output("”</i>");
	output("\n\nYou best come with me, right? Kids always need their " + pc.mf("papa", "momma") + ". Although maybe you go when I’m not there and I just happen to miss you, huh?”</i>");
	output("\n\nYou nod along, promising that you’ll visit them with her any time you can. You squeeze her trunk of a left arm as added confirmation, a hint of a chuckle tempering the stony dragonesses face.");
	output("\n\n<i>“I wonder if " + (bothKiddos ? "they’ll" : "she’ll") + " like working out...”</i>");
	output("\n\nStart ‘em young, right...");

	processTime(4);
	sterkurHusChattus();
	addDisabledButton(2,(bothKiddos ? "Babies" : "Baby"));
}

public function talkToMirrinAboutYouAndMirrin():void
{
	clearOutput();
	showMirrin();
	author("SoAndSo");

	if (flags["MIRRIN_TALKED_LOVEDOVEY"] == undefined)
	{
		output("<i>“Something that’s never really been clear. We’ve done a lot in such a short time, training, eating to fucking in no time and it was all such a rush! Then you were like ‘baby’ and I was all ‘baby’, so now there’s " + (jentaBorn() && torriBorn() ? "<b>babies</b>" : "a baby") + ". But where does that put us at? Cuz it’s not a full relationship, I like it but- there’s all these questions!”</i> you start, quickly rattling off your thoughts to the dragoness.");
		output("\n\n<i>“Eyy, uh, mm,”</i> mumbles Mirrin while scratching the back of her neck. <i>“I’m not uh, not really sure what I’d say about it. I don’t mind what we have, this sort of ‘nearly-girlfriend’ thing. I’ve got a " + (jentaBorn() && torriBorn() ? "lovely pair of darling babes" : "lovely little babe") + " all of my own, something I never thought could uhh, could work out with all this,”</i> she continues, gesturing all over her muscle-rich physique, lady-lumps and not-so-lady-lumps.");
	}
	else
	{
		output("<i>“Iunno, let’s just talk about us again. I don’t know what we’d call our little setup other than ‘a relationship’ so... I mean, I’m all game to keep going as is but,”</i> you start, suddenly crashing your train of thought as clear reasoning fails.");
	}
	output("\n\n<i>“I like our connection but... we both know: business, careers, you and your dad’s thing, me and my dad’s thing. It wouldn’t be stable. There’s a lot of me to go around but I don’t really want to. Aside from you,”</i> finishes the qilin, looking away from you with a face of guilt.");
	output("\n\nYou... silly dragon.");
	output("\n\nWithout another word, you wrap your arms around the unawares dragon and squeeze her tightly into a hug. She merely laughs and holds her hand on your lower back. The other squeezes and rests on your shoulder, the loose hug covering you in her warmth and charcoal scent.");
	output("\n\n<i>“So maybe we’ll just end up hugging and loving and... maybe some fuckin’ like it’s the same? I can do the same, ‘the same’ sounds very nice,”</i> you say softly, rubbing your cheek against her sweat-sheen skin. Feels so <i>waaaarm</i>.");
	output("\n\n<i>“I could do ‘the same’ too. In fact, I could do ‘the same’ right now if you get my meaning,”</i> half-whispers the dragoness, guiding your hand a little lower to her legging-bound bulge. You give it a gentle squeeze and <i>woooah</i> yeah, she’s pretty much at half mast!");
	output("\n\n<i>“So, you wanna...?”</i> she asks.");

	processTime(3);
	clearMenu();
	addButton(0,"Sex",mommirrinSexingTimes,false);
	addButton(1,"Not Now",mirrinPlsImNotThatHorny,undefined,"Not Now","You aint quite feeling it... at the minute anyway.");
}

public function mirrinPlsImNotThatHorny():void
{
	clearOutput();
	showMirrin();
	author("SoAndSo");

	output("<i>“Not quite in the zone, Mirrin. I’d love to later though,”</i> you say plainly, letting her down gently.");
	output("\n\n<i>“Bah, is fine. Just a little pent up is all. I’ll save it for... when we do stuff, aheh. Better whip these ingrates into shape in the meantime,”</i> she giggles, holding you aside as she turns to yell at her questionably slacking clients.");
	output("\n\n<i>“Ey lardsacks! You don’t pay me to laze in my house all fokking day! Back on those mills, choppy chop!”</i> booms the qilin, now in full trainer mode.");
	output("\n\nYou step aside to allow her to get work, wave a quick goodbye and then leave to let her work. Maybe you’ll come back later for a little double trouble...");

	processTime(1);
	clearMenu();
	addButton(0,"Next",goToFrontOfMirrinGym);
}

public function mirrinILikeYourDicksAndWantMoreDick():void
{
	clearOutput();
	showMirrin();
	author("SoAndSo");

	output("<i>“Miiirrrriiiin,”</i> you say sweetly, eyeing her sweat-sheened arms and abs. Time to butter her up.");
	output("\n\n<i>“Mmhmmmm?”</i> grins the dragoness, raising an eyebrow at your obvious intent.");
	output("\n\n<i>“It’s been so long since the whole baby thing began. I had this idea and I know it might be delicate but I... would love it if your cocks were even bigger.”</i>");
	output("\n\nDespite saying it under your breath, Mirrin stares at you as if you shouted it to the entire room. A slight nudge of regret flushes your face with warmth but hey, nothing was ever gained by not trying!");
	output("\n\n<i>“Eeeeiiiimmmm. That’s quite the uh, quite the question. Okay, okay, say this was just hypothetical, mm? <b>How</b> big? Are we doing ‘added extras’? Knots and all that? Cuz okay, I want to make you the happiest [pc.boyGirl] I can. It’s just... we should temper it a bit, you know?”</i> is what she lays out, spreading her hands across the surface of her perch.");
	output("\n\n<i>“Iunno, just... bigger,”</i> you shrug, trailing your fingers over the back of her hand. <i>“Let’s say, reasonably bigger.”</i>");
	output("\n\n<i>“Reasonably bigger. Ayyyyaa... bjáni, what’s the reference there? Three inches? Ten?! Come on,”</i> she asks, rolling her eyes at your vagueness.");
	output("\n\n<i>“Let’s split it. Six each. I want to see and feel my guts <b>bulge</b>,”</i> you add, wrapping your arms around her rock-solid waist. <i>“Annnnd maybe something for you too like ummm... a knot. And more ribs! Or something like that, it’s your body after all.”</i>");
	output("\n\n<i>“Hmmm... having a knot? Could do, could do. Or maybe thicker muscle, hm? So hard I can just hold you hands free in air,”</i> she half-whispers into your ear, quickly getting into the idea. You grin and giggle as the thought of any potential uber-cocks gets a proper discussion.");
	output("\n\n<i>“Yeah, and then pinning me down and filling me up? All that seed sealed in by knots and pure horse meat?? I want it, I want it!”</i> you tease, using the sweetest voice you can muster to convince her.");
	output("\n\n<i>“Fuck. Fuuuuck! Fine. Fine, let’s do it, why not? What’s two or three added bits anyway?”</i> exclaims the dragoness as if a secret weight had been taken off of her shoulders. <i>“I’ll get my surgeon to organize it all and it’ll be... be easy, yeah.”</i>");
	output("\n\nShe turns on her heel so you’re both front-facing, your arms still wrapped around her middle. The tight cage of her bulge pulses against your body as if the anticipation were enough to harden her and she wraps her arms around your shoulders.");
	output("\n\n<i>“Anything for my baby-maker,”</i> she whispers, resting her forehead against yours. You tilt your head so your noses meet and nuzzle your dragon-poppa-momma. You know deep down it’s a brave thing for her, given how modded she is and her wariness from before. Still, you can’t help but think of proud you are... and what sort of surprise she’ll be packing for you later!");
	output("\n\n<i>“Gimme a few days to, uhh, get it all together, deal with the transformations... then I’ll pound you so hard, no other cock will matter,”</i> promises the dragoness. She pecks you on the forehead and lets go of you, suddenly aware that all of her gym clients are gawking.");
	output("\n\n<i>“Ey, ey! Back to it, weaklings!”</i>");
	output("\n\nThe idle louts rush back to their routines, laughing to themselves as they almost get away with it. Mirrin turns back to you.");
	output("\n\n<i>“Anyway...”</i>");

	processTime(6);
	flags["MIRRIN_COCKSTAMP"] = GetGameTimestamp() + 4*24*60;

	sterkurHusChattus();
}

public function yeMirrinLetsTryOutDemNooDicks():void
{
	clearOutput();
	showMirrin();
	author("SoAndSo");

	output("You cement your need for her shafts by quickly spitting into your palms.");
	output("\n\n<i>“That’s my [pc.girlBoy], that’s the sweetie I know...”</i> gasps the red giant as your hands apply a sheen of all natural lube to her shafts. It’s only seconds before they reach their hardest, proudly angled towards the door with both pointed flares spread wide. Your hands pass over the fleshy ridges and squeeze along them, barely able to fit all the around the four inch thick meat above and three inch thick piece below.");
	output("\n\n<i>“So where do you want your new present, elskan?”</i> whispers Mirrin into your ear.");

	clearMenu();
	addButton(0,"GoodOlAnal",mirrinPostNTButtfuggin,undefined,"Good Ol’ Anal","Get yo booty pounded.");

	if (!pc.hasVagina()) addDisabledButton(1,"Rushed DP","Rushed Double Penetration","Need a vag, m8.");
	else if (pc.isPregnant()) addDisabledButton(1,"Rushed DP","Rushed Double Penetration","Wait for your pregnancy to end, maybe?");
	else addButton(1,"Rushed DP",vaginaRouter,[prepareForMirrinAndMakeItDouble,mirrin.cockVolume(0),0,0],"Rushed Double Penetration","Classic double creaming, sprinkled with cuddles. Easy takeout for the hungry hedonist.");

	if (pc.cockThatFits(mirrinMaxButtSize) < 0 && !(pc.hasHardLightUpgraded() && pc.hasHardLightEquipped())) addDisabledButton(2,"OtherAnal","Other Good Ol’ Anal","You’re gonna need something that fits in her butt.");
	else addButton(2,"OtherAnal",penisRouter,[doanMirranUpTheBum,mirrinMaxButtSize,true],"Other Good Ol’ Anal","You know what? How about you get the action this time... buy a ticket to Ass Mountain and ride it all day.");
}

public function mommirrinSexingTimes(fromNursing:Boolean):void
{
	clearOutput();
	showMirrin();
	author("SoAndSo");

	if (fromNursing)
	{
		output("<i>“Hell yes,”</i> you say with a straight face. Mirrin merely chuckles and helps you both up. She looks in the bedroom’s direction, and you rest your palm on her power-packed abs.");
		output("\n\n<i>“Let’s <b>fuck</b>,”</i> growls the red giantess.");
	}
	else
	{
		output("<i>“Give me the good stuff”</i> you say quickly, jabbing the dragoness in the... bulge. The cloth-straining package throbs and pulses as you do, hinting that she was just waiting for you to say so all along.");
		output("\n\n<i>“You’d need only ask, elskan.”</i>");
	}

	processTime(1);
	clearMenu();

	addButton(0,"GoodOlAnal",mirrinPostNTButtfuggin,undefined,"Good Ol’ Anal","Get yo booty pounded.");

	if (!pc.hasVagina()) addDisabledButton(1,"Rushed DP","Rushed Double Penetration","Need a vag, m8.");
	else if (pc.isPregnant()) addDisabledButton(1,"Rushed DP","Rushed Double Penetration","Wait for your pregnancy to end, maybe?");
	else addButton(1,"Rushed DP",vaginaRouter,[prepareForMirrinAndMakeItDouble,mirrin.cockVolume(0),0,0],"Rushed Double Penetration","Classic double creaming, sprinkled with cuddles. Easy takeout for the hungry hedonist.");

	if (pc.cockThatFits(mirrinMaxButtSize) < 0 && !(pc.hasHardLightUpgraded() && pc.hasHardLightEquipped())) addDisabledButton(2,"OtherAnal","Other Good Ol’ Anal","You’re gonna need something that fits in her butt.");
	else addButton(2,"OtherAnal",penisRouter,[doanMirranUpTheBum,mirrinMaxButtSize,true],"Other Good Ol’ Anal","You know what? How about you get the action this time... buy a ticket to Ass Mountain and ride it all day.");

	if (pc.cockThatFits(mirrinMaxSize) < 0 && !(pc.hasHardLightUpgraded() && pc.hasHardLightEquipped())) addDisabledButton(3,"Kegel Ride","Kegel Ride","You’re gonna need something that fits in her.");
	else addButton(3,"Kegel Ride",penisRouter,[doinMirranWhereFewHaveGoneBefore,mirrinMaxSize,true],"Kegel Ride","She’s a muscle queen, even the sexy, <b>hidden</b> muscles. Coax her into kegel-fucking your tool with her pussy while getting buried in tits and milk.");

	if (pc.ass.looseness() < 4 || pc.analCapacity() < (mirrin.cLength(0)>20?600:300)) addDisabledButton(4,"Anal DP?","Anal Double Penetration?","Your butt is too tight.");
	else addButton(4,"Anal DP?",gitFuktByBothMirranDiks,undefined,"Anal Double Penetration?","Two cocks... one hole. Even if you’re brave enough, that’s a lot of EasyFit. You remember that EasyFit becomes a little <i>permanent</i>, too...");

	addButton(14,"Back",mirrinSterkurHusButtons);
}

public function mirranEndTheSexing(sexFunc:Function):void
{
	clearMenu();
	IncrementFlag("MIRRIN_SEXED");
	pc.createStatusEffect("MirrinSexCooldown");
	pc.setStatusMinutes("MirrinSexCooldown",8*60);
	addButton(0,"Next",finishedDoingTheDoWiffMirran,sexFunc,"Next","Into the warm embrace...");
}

public function mirrinPostNTButtfuggin():void
{
	clearOutput();
	showMirrin(true);
	author("SoAndSo");

	output("<i>“Theeen <b>fuck</b> my ass,”</i> you say with gritted teeth, aggressively palming her bulge as if you owned it. Calloused palms pull you against her warm body and cover you from the view of the gym as you massage and fondle her bulge.");
	output("\n\n<i>“Mmmm love it when you’re ambitious,”</i> murmurs Mirrin as she tugs at your outfit, her motherly mammaries beating against you with an elevated heartbeat. <i>“Bedroom?”</i>");
	output("\n\nYou nod with glee and slip out from under her arms, [pc.walking] with a jump in your step down the corridor to the love nest.");
	output("\n\n<i>“Back in thirty, slackers! Take some free time!”</i> comes the announcement from coach to clientele, quickly getting distant as you turn the corner into the Mirrin’s bedroom. Spying the bed, you quickly " + (pc.isAssExposed() ? "stuff" : "undress and stash your [pc.assCovers]") + " into a corner, all before your dragon lover has even finished yelling at her ‘dumbass gymrats’. You slide onto the bed and lay on your front, back curved in and [pc.ass] wiggling around in the air. A little show of need for your qilin baby-maker.");
	output("\n\n<i>“So let’s get t-ohh... can’t wait, hm?”</i> coos Mirrin as she trots around the corner. You bounce and circle your buns all the more as she gets closer, palpable heat coming off of her post-workout body. You shudder as two big palms clamp on your raised cheeks but you keep your slutty display up all the same, play-moaning as she squeezes and squishes your [pc.ass]. <i>“Missed this ass, just being able to sprrrread it open!”</i>");
	output("\n\nYou gasp as hot breath blows on your [pc.asshole], sending a frisson through your spine.");
	if (pc.hasCock()) output(" Your [pc.cocks] " + (pc.hasCocks() ? "bounce and twing as they anticipate" : "bounces and twinges as it anticipates") + " what’s coming next, already half-hard as " + (pc.hasCocks() ? "they dangle" : "it dangles") + " below you.");
	output(" Wet lips meet your exposed sphincter and massage the sensitive rim as if it were another mouth. You groan and egg her on as she preps you for entry, looking over your shoulder to see her focused entirely on pleasuring your hole. You shudder again when her long pink tongue forces itself through your [pc.asshole] and fills your insides up with writhing, squirming tongue meat.");
	if (pc.hasCock()) output(" Your body - and prostate - can’t escape such forceful arousal, sending your [pc.cocks] into " + (pc.hasCocks() ? "their hardest states" : "its hardest state") + " and forcing a hot drip of pre onto the black topsheets.");
	output("\n\nMirrin delights in the responses of your body, exacerbating her kissing and sucking sounds as she prepares and lubes your hole with her tongue. As you keep your eyes locked on her face, still tongue-deep in your ass, you can’t help but just <i>look</i>: admiring her skill, her willingness to go down on you in such a way, how she knows to touch you in just the right places.");
	output("\n\n<i>“Mirr-! S-slow down,”</i> you call out as you try to hold back a surging sensation in your body. Can’t be that close already...?! But as you call out, her ministrations slow and settle as she kips her lips planted against your [pc.asshole]. You grit your teeth as you stifle the premature orgasm, gasping as a dull, hot ache sets itself in your loins.");
	output("\n\nSensing this, Mirrin’s long tongue recedes from within you, and she quickly pushes herself up to a stand.");
	output("\n\n<i>“Myah, you’re ready,”</i> she chuckles in her smoky tone, wiping away her mouth as she stares at your slathered-up [pc.asshole]. <i>“I’ll remind this hole who truly owns it...”</i>");
	output("\n\nOn those words, she sharply pulls you by your [pc.legOrLegs] right up to the edge of the bed. You barely have time to register it, only able to grip onto the bed sheets as your [pc.ass] butts up against her straining bulge. You moan in anticipation as she grips your middle and forcefully grinds your [pc.asshole] against the pressurized cage of her jockstrap.");
	output("\n\n<i>“How much you want this, bitch?! Huh?!?”</i> she growls through gritted teeth, giving you a rough spank right after. You wail in her grasp as she lays in the rougher treatment, for her raw strength is enough to keep you in place and manipulate your body.");
	output("\n\n<i>“So bad, fuck me! Fuck me pleeeease!”</i> you beg, letting all sense of restraint fly away. Definitely loud enough for the gym goers to hear. To drive the point home, you reach around to your squished buns and desperately try to pull them even further apart. You’re used to her game: it’s all too easy to just keep begging, debasing yourself further with the need for her monster shaft.");
	output("\n\nAs you do, she fumbles with her jockstrap and quickly ends up frustrated by a zip that just won’t budge. With a pained yank, she snaps the leather strands holding it all together and tosses the ruined garment to the side. Your whorish begging is cut short as the hulking qilin slams her half-hard meat against your crevice and grinds the entire length across your [pc.asshole].");
	if (mirrin.hasCockFlag(GLOBAL.FLAG_RIBBED)) output(" The near two feet of horseshaft weighs heavily against your body, the thick, angular ribs that line it teasing your hole all the more.");
	else output(" The full sixteen inches weighs down on your ass and the thick, rigid urethra teases your hole all the more.");
	if (pc.hasCock()) output("\n\nHer lower shaft nudges insistently against the " + (pc.hasCocks() ? "undersides" : "underside") + " of your [pc.cocks], another reminder of just how much of her covers your form.");
	output("\n\n<i>“Feel good, slut?! Tell me how it feels!");
	if (mirrin.hasCockFlag(GLOBAL.FLAG_RIBBED)) output(" Can’t wait to feel these ridges, huh?!");
	output("”</i> mocks the dragoness as she spanks both of your cheeks, gently pressing her weight against you as the five inch thick knot grinds up against your [pc.asshole].");
	output("\n\n<i>“Feels so good, p-pleeease just put it in me!”</i> you whimper into the bedsheets, already tense from bracing yourself so hard. You can do little but relish how slutty you’re acting right now.");
	output("\n\n<i>“Ngg, how can I so no to such a fokkin’ slut!? Here it comes!”</i>");
	output("\n\nUsing your ass for balance, Mirrin draws her body back and lets her full-hardened shaft slide down your crack. She stops as soon as the pulsing flare lines up with that wetted slut-pucker you call an asshole and then thrusts her body forward! With a veritable roar, you’re pierced open by the flare, filled with the " + (mirrin.cLength(0) > 20 ? "lion’s share of horse-cock" : "full sixteen inches") + " and crushed against the bed as Mirrin uses your shoulders as purchase for her weight.");
	pc.buttChange(mirrin.cockVolume(0));
	output("\n\nYou whine and squirm as the air is forced out of your lungs and replaced by hot, pulsing dragon meat. Your anal invader gets to work immediately, gently grinding her hips around to get a feel for your hole and to extend the reach of her dominion over you. Your fingers dig into the bed as the combined weight and penetration becomes difficult to bear.");
	output("\n\n<i>“Thaaat’s it sweetie, that’s the good stufff, hnggg,”</i> croons the breathless dragon as she slow-fucks your stretched-out hole. You whimper and moan beneath her as you’re slowly turned into her living onahole, her powerful hands keeping you in place as she explores the deepest parts of your ass. You clasp at your [pc.belly] as it’s shoved around internally by such an intrusion, rubbing the obscene bulge that forms whenever she hilts you" + (mirrin.hasKnot(0) ? " up to the knot." : "."));
	output("\n\nHaving had her fill of exploring you, Mirrin picks up her pace and settles into a steady rhythm of straight thrusting. With her hands where they are, she only goes for the deep, near-hilt kind of thrust, the angle ensuring you feel the entire length fill out every part of you. Your breathing is dotted with grunts as your [pc.asshole] struggles to stretch around the beast that’s claiming it.");
	if (pc.hasCock()) output(" It’s colored with whines and squeals as your prostate bears the brunt of it, milked for all its worth by its horse-cock lover.");
	output(" Each thrust is a constant fight for your hole as you try not to tense up, getting more into it the more relaxed you try to be.");
	output("\n\n<i>“Such <b>nnng</b> perfect ass! You’d just love it if <b>nggg</b> if I trained it all day to only take this cock, huh?!”</i>");
	output("\n\nYou whine your desire for such a suggestion: just spending your life trained only to take Mirrin’s fat cock. Deep down, you know that’s what you signed up for.");
	output("\n\nThe qilin abruptly slows her thrusts and briefly keeps you hilted");
	if (mirrin.hasKnot(0)) output(" up to her meaty knot");
	output(". Your innards groan and throb as this hot, pulsing beastcock takes residence once more but it’s an algedonic relief all the same. You can barely feel your [pc.legOrLegs], your pucker is already well-stretched and sore, the heat is immense... and your body loves it.");
	output("\n\n<i>“Just wanna... savor this,”</i> huffs your qilin lover as she massages and caresses your shoulders. You wince as she relinquishes her grip. Only now does it hit home how hard she was holding you down. Still, the gentle caress from the softer parts of her palms is a loving balm, not only setting you at ease but filling you with a nameless, comforting sensation.");
	output("\n\nThrough huffs and gasps, you hear her mumble something in her native tongue as she feels your penetrated body. The tender moment is quickly mutated as she leans forward...");
	output("\n\nPlacing her hands at either side of your head, the giant of a woman clambers onto the bed by her knees - cock-deep within you - and presses her body against yours so that you’re fully pinned by her form into the bed. You whine as the " + (mirrin.hasKnot(0) ? "knot" : "base of her shaft") + " presses against your hole and her heaving chest presses against your back. Your love comforts you with her hands and body as she slides. her arms under yours to coat you in her form. You feel her lower legs rest above your [pc.footOrFeet], soft-pinning your [pc.legOrLegs] as she does. Her hot breath and smoky, spicy musk float around your head, her pulse almost vibrating your body as you feel it through her skin.");
	output("\n\n<i>“You’re so brave, elskan, I love this... love this about you. Let me <b>*huff*</b> lemme show you how much!”</i>");
	output("\n\nYou can’t help but moan as she pivots her pose with her knees and pushes her lower body up to lead in her next motion. The moment seems to freeze as she holds herself in that pose... only to slam her body down and fill you right back up again! You both grunt in unison as jumps into a powerful fuck-rhythm, her muscle-powered hips slamming against your [pc.ass] with bruise-worthy force. Your hands find themselves clasping at Mirrin’s spread fingers, hoping to find something to grip on as she pounds your body with belly-bulging cockmeat. You can feel she’s close: the way her shaft tenses and twitches within you, the rising notes in her voice. It’s so satisfying having her entire");
	if (mirrin.hasCockFlag(GLOBAL.FLAG_RIBBED)) output(", ribbed");
	output(" length spear you from flare to base that you can’t help but moan from that alone.");
	if (pc.hasCock()) output("\n\nYour [pc.cocks] " + (pc.hasCocks() ? "ache" : "aches") + " underneath you, unused yet so hard and ready. The build up in your prostate only now starts to hit home: you’re close!");
	if (pc.hasVagina()) output("\n\nMeanwhile, your [pc.vaginas] go untouched in " + (pc.hasVaginas() ? "their" : "its") + " arousal, leaking [pc.girlCum] into the sheets as your body rewards you for getting your ass destroyed.");
	output("\n\nNoisy, wet thrusts and low, feminine grunts fill your ears the more she fucks you. Your sense of speech has devolved into cries of lust and need. Even your eyes feel at fault as the building euphoria forces them to constantly roll back. All that’s left is the overwhelming body heat, the coat of muscle covering your pinned body and the meatspear ready to bust its juicy load within you!");
	output("\n\n<i>“Guhhh-! Ready?! Gonna cuh-!”</i> grunts your qilin lover as she power-fucks her pre-cum into you.");
	output("\n\n<i>“Give it to me!”</i> you wail, quickly burying your face into the bedsheets.");
	output("\n\nWith a veritable roar filling your ears, the gryvain slams her hips against you one last time!");
	if (mirrin.hasKnot(0)) output("\n\nThere’s no resistance when the meaty knot spreads you open that little bit extra and seals her meat inside.");
	output("\n\nThick, potent warmth fills up your guts as Mirrin unloads her stored up seed in stringy torrents. There’s so little space inside your colon: it fills what space it can and readily moves on it where it shouldn’t...");
	output("\n\nPulse after pulse of her breeding juices combines with her pained grunts, as if it’s so hot that even her own cock can’t handle it.");
	output("\n\nIn the wordless, thoughtless moment, your own body shudders, awash with an orgasm.");
	if (pc.hasCock())
	{
		if (pc.cumQ() < 3000) output("\n\nYour [pc.cocks] " + (pc.hasCocks() ? "erupt" : "erupts") + " with [pc.cum], a damp patch forming against your underside as the hands-free orgasm milks what drops it can.");
		else output("\n\nYour [pc.cocks] " + (pc.hasCocks() ? "erupt" : "erupts") + " with [pc.cum], quickly pooling and soaking the sheets you’re pressed into with bulging torrents of your seed.");
	}
	if (pc.hasVagina()) output("\n\nThe ache in your [pc.vaginas] overwhelms; trickles and drips of [pc.girlCum] splatter across the back of your [pc.thighs].");
	output("\n\n");
	if (mirrin.hasKnot(0)) output("Even knotted,");
	output("Mirrin’s sudden surge of seed is quick to die down. She barely holds herself up, having become a gasping, spent mess whose pulse flutters and jumps from the exertion. You’re just as used up, now nothing but a receptacle for belly-bulging levels of qilin seed.");
	output("\n\nWith tender movements, Mirrin holds you to her and rolls onto her side and takes you with her.");

	processTime(40+rand(26));
	pc.orgasm();
	pc.loadInAss(mirrin);
	clearMenu();
	addButton(0,"Next",cuddleDatButtfuggyDragon);
}

public function cuddleDatButtfuggyDragon():void
{
	clearOutput();
	showMirrin(true);
	author("SoAndSo");

	output("The both of you lay limp in one another’s arms, a gasping pile of sweat and exertion. As Mirrin wraps her arms over your front and holds you tighter, you nuzzle up to her bicep and use it as a comfortably fleshy headrest. Your qilin lover kisses and nuzzles the back of your head, whispering words of praise in a husky whisper.");
	output("\n\nShe shifts her weight around a little to get comfortable, only just realising that her horse-cock is still buried within you. With a knowing giggle and a bit of effort, she pulls it through your well-fucked asshole. Your body groans as things shift around internally, all that cum filling up the space her meatstick leaves behind. The flared length comes out with a soft, wet pop and a liquid heat spews down your [pc.thighs] and [pc.ass], a testament to just how much you’ve taken.");
	output("\n\n<i>“Mm, that’s a picture...”</i> says a croaky, hoarse Mirrin as she pulls out her communicator from her yoga pants. <i>“Something to share and remember, mm?”</i>");
	output("\n\nOh, as in <i>actual</i> picture.");
	output("\n\nShe angles the device at the ‘impact zone’, taking a juicy shot of your gaping hole and her cum covered horseshaft. After a few camera clicks, she brings it around and points it to your face. You can see in the reflection how it looks: you, red-faced, grinning and half-buried into her arm while she, silver hair matted with sweat, kisses the top of your head.");
	output("\n\n<i>“Perfect,”</i> she mumbles as she sends it to all her extranet media channels, another lewd shot for MirrinBoss™.");

	processTime(10+rand(6));
	mirranEndTheSexing(mirrinPostNTButtfuggin);
}

public function prepareForMirrinAndMakeItDouble(vagIdx:int):void
{
	if (flags["MIRRIN_DP_TEMP"] == undefined)
	{
		vaginaRouter([function(newVagIdx:int):void
		{
			flags["MIRRIN_DP_TEMP"] = newVagIdx;
			prepareForMirrinAndMakeItDouble(vagIdx);
		},mirrin.cockVolume(1),1,0]);
		addDisabledButton(vagIdx,(pc.hasVaginas() ? "Vagina " + (vagIdx+1) : "Vagina"));
		return;
	}

	//Real function starts here
	clearOutput();
	showMirrin(true);
	author("SoAndSo");

	var vagIdx2:int = flags["MIRRIN_DP_TEMP"];
	flags["MIRRIN_DP_TEMP"] = undefined;

	output("<i>“I want mmmmboth,”</i> you ply, patting her shapely bulge with both hands. <i>“Gape me, fill me up!”</i>");
	output("\n\nYou squeeze and grope her tightly packed shafts, more than happy to awaken <i>these</i> dragons. Mirrin merely chuckles, letting you have your fondle as she straightens herself up.");
	output("\n\n<i>“Want to break your body all over my cocks? That’s my brave [pc.boyGirl]. I want you to <b>feel</b> every inch,”</i> she growls, flashing a toothy grin as you squeeze her shafts all the harder. <i>“See you wailing in my lap, gut busted and bloated with cum...”</i>");
	output("\n\nYou almost go weak at the knees as she describes what you’re after. You " + (pc.tallness < 84 ? "spring up and pull" : "draw") + " her face to yours and steal her lips with yours, catching her off guard.");
	output("\n\n<i>“Mmph! Stretch that cuntmmm, hilt yoummm your ass!”</i> she gasps in between kisses, her palms cupping your [pc.ass] with assertive force.");
	output("\n\nYou moan in tandem with her, rubbing, buffing and playing with her " + (silly ? "coco-nuts" : "weighty nads") + " as you keep her kiss-drunk. It’s almost tee easy how quickly you’ve be-");
	output("\n\n<i>“Mmmfuck, I can’t take it, c’mere!”</i>");
	output("\n\nYou barely have time to register her words before the hulking dragoness bends to her knee, lines her shoulder with your [pc.belly] and scoops you up!");
	if (pc.fullBodyWeight() > 500) output(" Even with a big ol’ body like yours, it was near-effortless!");
	output(" Mirrin only needs the one arm as her clawed hand pins your body to her shoulder, showing off your buns and legs to all present.");
	output("\n\n<i>“Party’s over, boys and girls! I’m taking this one for the day!”</i> she calls out to the gym-goers, turning to face them with you helpless and dangling on her shoulder. <i>“Back tomorrrrow!”</i>");
	output("\n\nWhile her rolling ‘R’, she spanks your [pc.ass] with her free hand to the sound of wolf whistles and ‘you go, girl!’. You sheepishly grin to the vacating crowd as Mirrin trots to the bedroom, giving them a woozy wave as the rush of it all makes your head spin. You’re put in mind of all those ‘barbarian’ themed holovids, on how the hero saves the damsel from the monster and always gets the girl... but maybe the monster is just that much more appealing.");
	output("\n\nYou’re fireman-carried into the bedroom and carefully laid onto your back. The qilin wastes no time in helping you undress, starting from the bottom while you start from the top. In seconds, your " + (pc.isNude() ? "gear lays" : "clothes and gear lay") + " strewn around like oh so much flotsam-and-jetsam, exposing everything she wants from you. Mirrin slides her arms under yours so her palms cover your upper back and shoulders, goading you into a deep kiss. You giggle and relax in her grasp as her foot-long tongue quickly overwhelms your own. Her jock-breaking bulge bumps and humps insistently against your [pc.vaginas], her hips grinding it around to prepare you for what’s to come... it’s impossible to ignore the arousal building in your body, especially when you peek down the gap between you and revel just how damp you’re making her grey yoga pants.");
	output("\n\nThe muscle-babe tries undoing her jock with just the one hand, quickly giving up and pushing herself up to a stand. With a fumbling grip, Mirrin grimaces as the jock just refuses to unzip. With a grunt of frustration, she rips it at the seams and throws the remains away. You can only laugh at her display of unthinking macho, rubbing your [pc.foot] against her muscle-rich thigh as you do.");
	output("\n\n<i>“Are you always going to do that? Just for me?”</i> you quip, spreading your arms back to emphasise the ‘me’ she’s acquired. The dragoness says something under her breath, grinning back at you while she unfurls her semi-hard beast-cocks and " + (silly ? "coco-nuts" : "potent nuts") + ", letting them hang over the lip of her yoga pants in all their musky glory.");
	output("\n\nYou whistle and tease as Mirrin grips their lengths and runs her palms along them, only needing a few pumps to make them reach full size.");
	output("\n\n<i>“You know what, uh... know what else is just for you? Got an order of a " + (mirrin.cLength(0) > 20 ? "22 and a 17" : "16 and a 12") + " for a [pc.name] Steele, extra sauce,”</i> she says with pride, resting her fists on her hips as her equine equipment does all the visual talking.");
	output("\n\nYou can only laugh all the more.");
	output("\n\n<i>“Would that be cheese sauce, ya big lug? Pickup lines like that might end you up on a most wanted list,”</i> you joke, keeping your [pc.foot] to her thigh to keep her focused on you.");
	output("\n\n<i>“Ay, bjáni, shut it,”</i> she growls as she grips you by the [pc.legOrLegs] and yanks you right up to her! The qilins double-shafts slap against your [pc.crotch], covering your lower body in turgid horse-cock meat. You yelp as the impact hits your sensitive nethers, play-moaning as your [pc.vaginas] get a good grinding by her shafts. Mirrin uses all parts of her lower shaft to tease [pc.eachVagina], extracting [pc.girlCumVisc] fluid for natural lube. You bask in the radiating body heat as it fills your nethers with more and more need and anticipation. Just...!");
	output("\n\n<i>“...fill me up!”</i> you say aloud, quickly slurring as you realize you weren’t simply thinking it.");
	output("\n\n<i>“You sure?”</i>");
	output("\n\n<i>“Y-yes, super sure!”</i> you fire back, giving your dragon lover the puppy eyes.");
	output("\n\n<i>“Super mega sure?!”</i>");
	output("\n\n<i>“YEEES, fuck my holes! Gape me and fill me, I neeeeed it!”</i> you blurt out, scrunching your eyes shut as you give in entirely to vice.");
	output("\n\nYour yammering is cut short as two flares press against your [pc.vagOrAss " + vagIdx + "] and [pc.vagOrAss " + vagIdx2 + "], a powerful shunt spearing your holes open! You cry out and whimper in bliss as Mirrin drives her shafts into your body. You reopen your eyes and look down, enamored with the growing outline of her flared shafts as they start bulging your [pc.belly] outwards. You rub and palm the growing bulge as the impossibly hot, impossibly thick meat pulses within you, your view shadowed by 8 feet of beastly red muscle.");
	if (torriBorn()) output(" You tap into the memory you keep of Mirrin breeding you for a child, especially just how overwhelmed and full your body became one that one love-filled night.");
	pc.holeChange(vagIdx,mirrin.cockVolume(0));
	pc.holeChange(vagIdx2,mirrin.cockVolume(1));
	output("\n\nHands filled with [pc.hips], your qilin lover pulls your body up her lengths until " + (mirrin.hasAKnot() ? "your orifices tug against her twin gryvain knots." : "she hilts you against her pelvis."));
	if (vagIdx2 < 0) output("\n\n<i>“That’s it elskan, thaaat’s the good shit! Just love seeing that gut <b>bulge</b> from below,");
	else if (pc.isVagTight(vagIdx) || pc.isVagTight(vagIdx2)) output("\n\n<i>“Oooophuck, how’re you so tight still?? Gonna make me work for it, huh?");
	else output("\n\n<i>“Mmmm, two cunts just for me, huh? You fit me so perfectly, elskan,");
	output("”</i> gasps your penetrating partner as she runs her palms along your [pc.thighs]. You can’t help but lock your eyes to hers, the shared gaze betraying a quiver of the lips as she grasps you once more by the hips. Mirrin’s gentle at first, as she always is: her routine of feeling you out and getting reacquainted with your body’s limits is a familiar rhythm of deep, hip-heavy thrusts. With your [pc.hips] in her hands, she has no trouble in synchronizing her steady, passionate thrusts with every one of her focused pulls and pushes with your splayed, speared body.");
	output("\n\nIt’s all as you planned: speared by your draconic baby-maker in her prime, used and fucked as if she owned you. Your hands - restless and eager to please - massage the vulgar, dirty bulge that pokes through your [pc.belly] and your reward is a throaty, deep growl of content from your bodybuilt breeder.");
	output("\n\n<i>“Yyeeauuh, keep doing that, nnnfuck! Can feel your hands through your skin...!”</i> roars the breathy qilin. Her brow furrows and her mouth hangs open as she picks up the pace of her cervix-butting thrusts. The feeling of her flares");
	if (mirrin.hasACockFlag(GLOBAL.FLAG_RIBBED)) output(" and cock ridges");
	output(" as they grind out your holes becomes indescribable: thick rings of muscle drag inside your inner walls and throb on impulse as Mirrin’s faster rhythm picks up. You shudder and yelp as the thick, flat flares bat at your " + (vagIdx2 < 0 ? "cervix" : "cervices") + ", the wordless reminder turning into a wish for her overflowing seed.");
	if (pc.isNaga()) output(" Your snake body wraps around her middle seemingly on its own accord and warms from all her spent energy, another incentive for your qilin lover to breed you properly.");
	output("\n\n<i>“Ngg, love this body, can’t stop... fucking! C’mere!”</i>");
	output("\n\nWith a joyous laugh, she scoops you up with a ragged ease. Your vision blurs momentarily as your body is swung upwards and crushed against a standing Mirrin as she holds you to her chest. Still doubly-speared, gravity does most of the work of keeping you stuck in her herculean embrace. " + (pc.tallness < 72 ? "Your head barely peeks out between the top of her cleavage; pretty much all of your body is enveloped in tits and arms, your body itself enveloping her meatspears." : "You’re snugly fit between her milky cleavage, now forced into a smoky, hazy eye contact with Mirrin’s determined, breathy look.") + " Her hand creeps up your spine and runs through your [pc.hair] from below, and her clawed fingers curve around your temples in a gentle grip.");
	output("\n\n<i>“What’s - </i>huff<i> - what’s a slut like you do to get holes like this, huh?! Must </i>love<i> using them, hm? My word, bjáni...”</i> gasps the qilin as she guides your forehead to hers. You barely have the words as she slow-rolls her hips with you cradled in her grasp, the rocking motion leading to sensuously deep penetration. Your eyes roll back into your head as " + (mirrin.hasAKnot() ? "you latch against her threatening knots" : "she hilts you cock-deep") + ", physical power overtaking mental clarity.");
	output("\n\n<i>“I wah... I wan...”</i> you slur, mouth agape from such a hot, energized railing. <i>“I wan you...”</i>");
	output("\n\nMirrin simply grins. She helps you hook your arms around her neck and nestles her chin against your shoulder.");
	output("\n\n<i>“Then I’ll give you <b>all</b> of me,”</i> she growls into your ear.");

	processTime(15);
	clearMenu();
	addButton(0,"Next",mirrinTooBusyFuggingYouToNoticeThatMyPokemonJokeDidntWork,{vagIdx:vagIdx, vagIdx2:vagIdx2});
}

public function mirrinTooBusyFuggingYouToNoticeThatMyPokemonJokeDidntWork(vags:Object):void
{
	clearOutput();
	showMirrin(true);
	author("SoAndSo");

	var vagIdx:int = vags.vagIdx;
	var vagIdx2:int = vags.vagIdx2;

	output("With you in her grasp, Mirrin slams her weight back onto the bed! Inside your cradle of muscle, you feel naught but the air rush from your lungs and yet the floating, fleeting moment returns to you pinned under your dragoness breeder. Buried in her heaving, soft chest, you can do little as she begins bunny-humping you into the bed!");
	output("\n\nWith your");
	if (pc.isNaga()) output(" tailbody still wrapped around her middle");
	else if (pc.legType == GLOBAL.TYPE_GOOEY) output(" gooey body jiggling about like putty");
	else output(" [pc.legs] splayed wide");
	output(", Mirrin uses this ease of access to full effect: effortless, rapid pounds that come with meaty slaps of her churning nuts. Buried under a mountain of woman and breast, you can only grit your teeth as pistoning hips smack against your [pc.ass] with bruise-inducing force. Your world is a darkened embrace of heat, flesh and qilin wails, now given meaning, love and purpose through Mirrin’s " + (mirrin.hasAKnot() ? "hybrid-" : "") + "horse-cocks.");
	output("\n\n<i>“Nngggthat bulge! Feeling it on my abs!”</i> yells the grunting giantess, her body rapidly slickening with smoky perspiration. Bulge, penetration, heat, darkness: it all blends into one miasmic, euphoric dream as your body numbs to everything but its own brutal stimulation. You can’t even keep track of your limbs: there’s nothing but cocks, nothing but the overwhelming body heat and creaking, humping mass of muscle controlling it all.");
	output("\n\nThen a sound - low at first - builds in the chest-prison your face is stuffed into. A throaty note rises in strength and pitch, vibrating through both of your bodies as Mirrin reaches her peak!");
	output("\n\nWith one last hammer-smack of her lower half against your [pc.ass], your dragon lover shunts her shafts into their deepest reaches and lets loose her creamy payload. Her cries and grunts warble and wobble as thick, hot qilin cum diluviates into your inner reaches, filling your [pc.vagOrAss " + vagIdx + "] and [pc.vagOrAss " + vagIdx2 + "] with roiling heat. You can only groan and whine under her weighty mammaries, far too used to fight this gooey breeding. With each pulse of dragon cum, her shafts bulge with the liquid weight as it shoots through the urethras. Her flares dilate within and pull against your inner slutholes with each weakening hump the red giantess gives you.");
	output("\n\nYou’re not fully sure of how much she cums; your world is a claustrophobic cage of body heat, tensing muscle and deep penetration. It’s almost a task to simply breathe and your limbs fall numb from the splayed-out pose.");
	output("\n\nHer mouth agape and posture bent, your dragoness pushes herself up on her palms and her mountainous melons follow. Cool air fills your lungs and you regain control over your arms, enough that your first thought is to just let them relax; your head spins as you gasp down all this lovely, clean air...");
	output("\n\nMirrin gently rocks her hips back and forth as her shafts haven’t quite softened within you just yet. You’re so full of heat and warmth that the gently shifting meat and cum is more soothing than anything. You murmur and giggle as she slow-fucks your thoroughly used slutholes, lost in her gaze from on high as you look each other in the eyes.");
	output("\n\n<i>“One seh... sec, can’t uhh... pass this up,”</i> gasps Mirrin, her hips still gently swaying back and forth as she fiddles around for her datapad. In seconds, she’s stood upright and got it perfectly angled to the messy impact zone.");
	output("\n\n<i>“Oh my, boys and girls... I couldn’t hide something so gorgeous from you. Look at this... <b>bulge</b>,”</i> says the husky qilin, a pornstar lilt to her smoky tones. You groan and your [pc.belly] grumbles as the soft indent of her flares bulge through your [pc.skinFurScales]. Your " + (vagIdx2 < 0 ? "womb is" : "wombs are") + " so stuffed with seed that you could be mistaken for being pregnant. <i>“Get ready for the pop, here it comes...”</i>"); 
	if (mirrin.hasAKnot()) output("\n\nWith her teeth gritted, she draws her hips back. Her double knots struggle to free themselves from your holes despite her softening shafts. With a pained grunt and an internal wash of fluid following suit, the knots come free and her ribbed shafts drag out of your body.");
	else output("\n\nWith her teeth gritted, she pulls her hips back so her tender shafts slide from your well used holes.");
	output("\n\n<i>“Here it comes, watch... mmm... ahhhh...! Ahhh... look at it....”</i>");
	output("\n\nIn tandem with her satisfied gasping, her flares pop free and unleash the thick, gooey store of her alien seed from your thoroughly bred holes.");
	output("\n\n<i>“Ohmyguhh... mmm, it’s so fuckin’ hot...”</i> she giggles, rubbing her biggest flare against your [pc.vagina " + vagIdx + "]. With her datapad outstretched and aimed at you, Mirrin leans in. Your follow her as she lowers in for a sloppy, lip-heavy kiss and your eyes flutter to a close once contact is made.");
	output("\n\nYou ‘mm’ and ‘ahhh’ together as you show off for the camera. It’s wordless, slovenly passion, ignorant of the viewers reaction and caught only in your and your lovers world.");
	output("\n\n<i>“That’s why I’m The Boss, boys and girls... till next time.”</i>");
	output("\n\nWith that, she powers down the pad and turns back to you.");
	output("\n\n<i>“Cuddle time.”</i>");

	pc.orgasm();
	pc.loadInCunt(mirrin,vagIdx);
	if (vagIdx2 < 0) pc.loadInAss(mirrin);
	else pc.loadInCunt(mirrin,vagIdx);

	processTime(20+rand(16));
	mirranEndTheSexing(prepareForMirrinAndMakeItDouble);
}

public function doanMirranUpTheBum(cockIdx:int):void
{
	clearOutput();
	showMirrin(true);
	author("SoAndSo");

	output("<i>“How about I take <b>you</b> for a ride this time? All that muscly junk in your trunk and you don’t use it?”</i> you smirk. It’s your turn to take the reins for once and you cement your assertion with a firm <i>smack</i> on her protruding mass of ass.");
	if (pc.PQ() < 80) output(" You quickly shake your hand about as a sharp pain hits your palm. Goddamn buns of steel right here...!");
	output("\n\nMirrin blinks and squints as the smack makes its impact.");
	output("\n\n<i>“That so, hm? So bold of you, elskan. Weeell... eh, fuck it, lazy day. These slackers can have some free down time,”</i> she says with a grin. You eye the couch and then back to her... then back to the couch.");
	output("\n\n<i>“You for serious? Huh... I’m game. No down time for slackers then, yeah?”</i> is her inquisitive reply. You nod, grin and cock your head to the long, padded couch. Mirrin quickly reaches for a nearby squirt bottle and plants it in your hands. <i>“We make do.”</i>");
	output("\n\n<i>“Then get on there, give me a show. Or. Else,”</i> you say with a squint. With a quick thrust, you point the bottle at her straining bulge and give the middle a harsh squeeze. The resulting splatter of water almost makes the qilin jump on the spot as her abs and leggings are glazed and soaked.");
	output("\n\n<i>“Aiiiee, what the-”</i>");
	output("\n\n<i>“Ooops. Better take them off before they chaff,”</i> you say innocently while waggling the bottle in your hand.");
	output("\n\n<i>“Ey, bjáni...”</i> sneers your qilin lover as she trots over to the couch with her hands on her hips. You get another beefy <i>smack</i> in against that swaying, rippling rump. Mirrin actually jolts as your hit lands, taken off guard. <i>“”</i>E-ey, bjáni!”</i>");
	output("\n\nWell if she’s going to have THAT attitude...");
	output("\n\nAs soon as she’s rested one knee on the couch, you pull on the rim of her leggings and snap them against her back. She turns her head but you’re quick: you sneak your arms around her middle and clasp one against her bulge and the other against her abs.");
	output("\n\n<i>“So tell me big girl, how long </i>has<i> it been since you’ve taken a trip downtown?”</i> you tease as you openly molest her soaked bulge and ride your hand along her thick abs. Those same hands hastily wander over her " + (flags["MIRRIN_PREGSTAGE"] != 10 ? "motherly" : "powerbuilder’s") + " hips and slide inside her leggings.");
	output("\n\n<i>“Oohhh, asking the big questions, hm? I was fresh off my flight on NT. Horny as all frosted hell. Went to the grill, found the biggest bull in the room, dragged him to his place. I think he still has that torsion injury,”</i> chuckles your baby momma as she hangs her arm over your shoulder. Despite the size and weight, she angles it so you have free reign to fondle, grab and grip any part of her you want.");
	output("\n\n<i>“That so? Sounds like he didn’t know a way to a girl’s heart.”</i>");
	output("\n\nOn those words, you yank her leggings down to her knees and clasp both her toned, taut cheeks with an assertive grip. Mirrin croons her approval and slaps her hands against the couches backrest, a telltale arch in her back now pushing that exposed, gloriously taut rump further against your front. Her long, silvered tail flicks and swishes forward on its own accord and splays against her back like a course curtain that once covered her prize. Now, jockstrap aside, it’s all yours...");
	output("\n\n<i>“Yeah, take your prize. Do what that idiot bull couldn’t. I know you can...”</i> growls Mirrin through gritted teeth. Goddamn, you really could take her here and now <i>but</i> there’s just some things that need doing right. You inhale her post-workout musk; that spicy, smoky aroma tickles the nostrils and warms your heart. Your hands get busy with undoing her jockstrap and it only takes a quick fiddle to untie it, allowing the hefty, half hard double-barrels to swing against the backrest with meaty thuds. You put the strap to the side: even if she goes through one with every wardrobe malfunction, no point throwing a good one away...");
	output("\n\n<i>“Ohhh, before we get ‘busy’ busy, might want to, uh, check... pocket. I’m sure to make a mess, you know,”</i> pipes up the giantess as she snaps up straight. Her double-dongs flick upwards and then come to rest on the backrest in their near-hard glory, pulsing with anticipation. You reach down to her crumpled leggings and rummage around, easily finding two thin foil packets. Ahaaa...! You pull then out and give them a quick looking over:");
	output("\n\nKhans ‘Horse Lord’ XXL. Not Every Season Is Breeding Season!");
	output("\n\n<i>“That’s them. How about gearing me up, cow[pc.boyGirl]? What good’s in owning a filly if you can’t tame her?”</i> chuckles your dragon lover as she grips her tools in a hand each. With a tsk and a laugh, you tear open the condoms and reach around her rock-hard middle to grip her " + (mirrin.cLength(0) > 20 ? "22\" hybrid" : "16\" of") + " horse-cock. The wide condom is easy to stretch over her " + (mirrin.hasACockFlag(GLOBAL.FLAG_KNOTTED) ? "pointed" : "flat") + " flare and once you’ve snapped the ring against the shaft, you pull it all the way down until it’s fully stretched out. Mirrin idly rubs your shoulder as you ready up her second dong in as seamless a manner, huffing through her nose with every snap, stretch and pull of the condom. You finish it with a sharp doublespank against her thick flanks and muscled behind, prompting the red giant to fold her arms against the backrest. You run your palms against her tensing back and trace along every detailed muscle, always leading the trail back to the base of her leather-bound tail. With a tamed and eager " + (flags["MIRRIN_PREGSTAGE"] != 10 ? "MILF" : "musclebabe") + " all ready for you, you undo the bottom of your [pc.armor] and " + (cockIdx < 0 ? "turn on your hardlight schlong" : "let loose your [pc.cock " + cockIdx + "]") + ". It’s all too easy to slap your [pc.cockOrStrapon " + cockIdx + "] against her flexing crevice and you wrangle the thick leather stalk that binds her tail with your other hand.");
	output("\n\nPrime fucking position.");
	output("\n\n<i>“Yessss, gimme...! But what abo-”</i>");
	output("\n\n<i>“Right here,”</i> you interject as you wave and dangle the squirt bottle over her head. With her knowing giggle of approval giving you the go ahead, you angle the bottle over your axis of ass and cock. Your hips gently thrust your " + (cockIdx < 0 ? "faux-" : "") + "meat across that flexing crevice almost on their own accord as you squirt water across both. Mirrin sways her ass from side to side to help you work in the replacement lube as you grind your length against her awaiting asshole. The bottle just rolls away on the ground...");
	output("\n\n<i>“Guhhh, can’t wait! Better do your best, [pc.name]. You fuckin’ better!”</i> growls the qilin as she rests her chin against her forearms and arches her back.");
	output("\n\n<i>“...or what?”</i> you tease, your gentle, grinding rhythm exchanging speed for coverage of space. You use the entire length of your [pc.cockOrStrapon " + cockIdx + "] from tip to [pc.knot " + cockIdx + "] to torment her, eager to see how far you can push this angle.");
	output("\n\n<i>“Or torsion injury! Crippled hips! Fractured pelvis! Bjáni, just do iiiit!”</i> comes the rough, throaty growl of indignation.");
	output("\n\n<i>“And how are you going to do that from down there?”</i> you chuckle with another couple of hearty <i>spanks</i> against her rock-solid ass.");
	if (pc.PQ() < 80) output(" <i>Ow</i>. Goddamnit, Steele, stop doing that to yourself.");
	output(" Mirrin muffles her discontent for each one.");
	output("\n\n<i>“Guuhhh come oonnn! I am <b>not</b> begging forrrr <b>cock</b>, rassgat!”</i> she growls again as she reaches around and plants your hand around her tail-bind. Mirrin wraps her fingers around the grip you’ve been forced into and holds it there, her eyes staring you down with unfettered insistence.");
	output("\n\nYou simply smile. With your other hand, you lightly squeeze her clenched fist and it immediately relaxes. Mirrin’s expression follows, turning back into the excited smile from before. She resumes her resting position with both hands on the back rest and brings her knees up onto the cushions. <i>Now</i> she’s ready.");
	output("\n\nYou take your [pc.cockOrStrapon " + cockIdx + "] and hold its rigid length in one palm. You grab Mirrin’s tail-bind with the other and draw your [pc.hips] back as far as they’ll allow. With a full view of her exposed tailhole, you can now see what’s going in where: while proportionate to her size, you’re sure that such a taut hole has seen action before. No matter, it’s all yours now...");
	output("\n\nYou lean your weight forward and let the [pc.cockOrStraponHead " + cockIdx + "] pierce her hole. It parts smoothly and with little effort thanks to all the prep, quickly enveloping your shaft in overwhelming warmth. It’s impossible to stop: despite the jump in heat, the soft flesh-pocket is all too happy to greet its intruder. Mirrin just giggles as her hole is");
	if (cockIdx >= 0 && pc.cThickness(cockIdx) < 1) output(" comfortably parted");
	else if (cockIdx < 0 || pc.cThickness(cockIdx) < 3) output(" comfortably stretched");
	else output(" obscenely stretched");
	output(" by your shaft, her thighs and buns twitching and flexing as you slowly go deeper. Soft ‘bumps’ squeeze against your length as your pelvis bumps against the qilins firm cheeks. She stifles a girlish wail as each ‘bump’ feels your hot length squeeze them against her walls in turn.");
	pc.cockChange();
	output("\n\n<i>“Mmmm, right there... you know what those are, right?”</i> she giggles huskily, her mood mellowed now that you’ve hit her array of gryvain prostates. <i>“Better fuck me hard and fast if you want to see me explode...”</i>");
	output("\n\nYes ma’am!");
	output("\n\n<i>“Goddamn right,”</i> you say under your breath. With your hands firmly in place, you draw your hips back and slide your [pc.cockOrStrapon " + cockIdx + "] all the way until you hit your [pc.knot " + cockIdx + "]. Mirrin grunts again as your length squishes against her internal cum factories, and her spread sphincter constantly tightens and relaxes with each pass of hard meat sensitive baubles.");
	if (cockIdx >= 0 && pc.cLength(cockIdx) > 18) output(" You can only imagine the bulging your length is doing to her abdominals, the thought keeping you steady as you plough your way through.");
	output("\n\n<i>“Mmmmuh, come ooon, don’t want tender, harder!”</i> comes the indignant growl. You’re tempted to swat her again but given just how little it does... well, there’s only way to go: <i>harder</i>.");
	output("\n\nYou catch the flowing silver topknot that swings about as she checks over her shoulder and yank it backwards. It’s enough to catch the dragoness’s breath and force her view forwards but that’s only step one. Step two is you putting all the stamina you have in pummeling your [pc.hips] against the muscly impact zone. Moisture and sweat flecks off of her ruby skin with every smack of your pelvis and the hot tailhole you’re burying your [pc.cockOrStrapon " + cockIdx + "] into squeezes all the tighter. The steadier your rhythm becomes, the more she pushes her body back against it. It’s near-effortless to bury yourself all the way up to the [pc.knot] with her cooperative flexing. Your hearts throb in a rhythmical fugue, a sensation that makes the mind weak whenever you feel it pulse through your [pc.skinFurScales].");
	output("\n\nTrue teamwork.");
	output("\n\nBut all this time and you hadn’t taken notice of the intimate crowd of gym goers filming you and your lover. Mirrin has her gaze tilted to the ceiling thanks to your grip on her flowing mane and you relax the pull to let her see what her hedonism has brought her.");
	output("\n\n<i>“Yeeeah! Film us! Put us on the nnnet! Fuh...! Fckkk! Mm! MMM!”</i>");
	if (pc.exhibitionism() < 66) output("\n\nYou’re too focused on pounding that hole to really think about the crowd’s actions. It’s much easier to let her wail away while you do the glorious ‘grunt’ work.");
	output("\n\nYeah, film us you sick freaks. You can’t help but pose and swoon for the cameras as you pound your wailing lover into the couch. How could you miss the chance to show your power to <i>millions</i> of loyal viewers?");
	output("\n\n<i>“Yyeah! Get my gggggud side! Don’t stop, don’t stop!”</i>");
	output("\n\nFuck, the <i>lungs</i> on this girl. You slow and then steady your pace briefly as you let her direct her new ‘minions’ into performing some adhoc photo op. As your gaze travels aimlessly, you spot her discarded jockstrap and an equally adhoc, devious thought hits you. With your hips still in deep auto-thrust mode, you let go of Mirrin’s tail and hair bindings and rapidly extend your arms forward. With a quick motion, you sling the cup of the jock over her head and pull, covering her yapping mouth in an instant!");
	output("\n\n<i>“MMm! Muhrrhwwuh!”</i> comes the muffled yell and she tries to twist her head around to see. You’re far quicker in this case and pull all the strings back so that it tightens around her mouth.");
	output("\n\nNow you’ve got a properly tamed filly.");
	output("\n\nDespite all this, there’s no resistance. Mirrin merely holds her position as if expecting you to continue with this attempt at assertion.");
	output("\n\n<i>“Atta girl,”</i> you say under your breath. With one more good-luck spank, you reign in your qilin conquest and restart your frantic, [pc.knot " + cockIdx + "]-deep rhythm. With her hole so thoroughly speared, hitting her in all the right places is a breeze as your [pc.cockOrStrapon " + cockIdx + "] just goes <i>in</i> and <i>out</i> and <i><b>in</b></i> and <i><b>out</b></i>-");
	output("\n\n<i>“Mhrmm! Grmrmcmmm! Mmrrhhh!”</i> whines your tamed beastie. Her tailhole flexes and tenses with every hump in some attempt to squeeze as much out of your rod as possible, her ass pushing back with more and more insistence for every smack of your [pc.hips]. You can’t help but lose yourself in this primal headspace, thinking of nothing but just how much this whorish hole needs your <b>hard</b>-earned blessing. Your heart thumps in your head, your fists clench the straps like there’s nothing else that matters, sweat flies from your brow... all is right in this moment.");
	output("\n\n<i>“Crmrmmmmnngggg! NNNGGG!”</i>");
	output("\n\nYou can’t even focus on your lover’s strained, impassioned whines. The more noises she makes, the deeper it hits, the more it builds, the more it <b>burns</b> as your hips grow sore and used. You’re so close, just a little more, lil’ more! The lust builds and builds until you can’t hold it in!");
	var cumQ:Number = pc.cumQ();
	if (cockIdx < 0) output("\n\nYour lower body shudders and shakes as hot euphoria floods your body. With joyous cries, you ride the precious, orgasmic moment to its fullest by humping that red mountain of ass as hard as you can. You keep going, grunting and humping until your hips give out completely.");
	else if (cumQ < 1000)
	{
		output("\n\nYour lower body jitters and shakes as a surge of your seed forces its way out of your [pc.cock " + cockIdx + "]. You ride the moment as hard as you can, humping away as your spasming shaft unloads the built-up [pc.cumNoun] from your [pc.balls]. Streak after streak builds into a hotter, wetter hole but it comes to a painful halt as your hips give out completely.");
		if (pc.hasKnot(cockIdx)) output(" With one final hump, you hilt your [pc.knot " + cockIdx + "] into Mirrin’s well-fucked asshole, and your orgasm flows free.");
	}
	else
	{
		output("\n\nYour entire body jitters as a monster load forces its way out of your [pc.cock " + cockIdx + "]. You hammer your [pc.hips] one last time, hilt your [pc.knot " + cockIdx + "] into that thoroughly fucked tailhole, and let your [pc.balls] do the rest.");
		output("\n\nThick jet after thick jet shoots deep into the qilin’s depths, quickly flooding her chambers with [pc.cum]. It squirts, gushes and spills out of the tight seal your [pc.cock " + cockIdx + "] has made, leaving trails of [pc.cumColor] breeding juice to merely drip down Mirrin’s snatch and dangling sack. Some splatters on the hard floor with nasty wet plops. Some simply runs down her thick ass and thighs while the majority groans and rumbles deep inside. Such a hefty load knocks all the strength from your [pc.legOrLegs], and your [pc.hips] give out completely.");
	}
	output("\n\nIt’s too much effort to hold yourself up... but luckily, you’ve a nice red warm mattress underneath. You slump forward with your head landing neatly in the mess of Mirrin’s silver mane. Your hands fall around her middle and the ‘bit’ - or what remains of a chewed jock - falls to the side. The world seems muted and numbed as you simply rest on top of your qilin lover, but there’s just so much <i>warmth</i> coming from her...");
	output("\n\nYou loosely hold your hands around her middle and squeeze the top of her abs.");
	if (cockIdx >= 0 && cumQ > 1000) output(" Even without feeling it, you can tell her toned belly is that much more rounded from all the seed you put in her.");
	output(" A bigger, rougher hand lightly squeezes your joined together fingers and massages them with calloused motions. In turn, you rub the belly of the great beast and murmur your content for your lover.");

	processTime(40+rand(26));
	//reported as bug here: https://forum.fenoxo.com/threads/0-8-044-cum-covered-tag-for-mirrin-scenes.19329/
	//pc.applyCumSoaked();
	soreDebuff(4);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",restFromMirrinsAssTripToAssMountain,cockIdx,"Mmm...","Mmmmmmmmm... hugs.");
}

public function restFromMirrinsAssTripToAssMountain(cockIdx:int):void
{
	clearOutput();
	showMirrin(true);
	author("SoAndSo");

	output("<i>“Hoooly shit, that was <b>intense</b>!”</i>");
	output("\n\nYou’re snapped out of your post-orgasm haze by the catcalls of the gathered ‘crowd’. The smiles on their faces are so wide you’d think they’d won the lottery. Ever so slowly, you push yourself up to a stand, still half-hilted in your lover’s tailhole. You pat Mirrin’s back with both palms and pull them across her moistened, muscled skin. This is enough to rouse the drained dragon from her own comedown, if only to have her gaze at you with smouldering, infatuated eyes.");
	output("\n\n<i>“Better... tell me when you’re gonna do that again... yeah?”</i> she murmurs with her long tongue licking her lips. <i>“Rub my uh... rub the smell out of mouth later, jeez.”</i>");
	output("\n\nYou give her another squeeze around her middle. It’s almost tempting to just dose off on her back, knowing she could easily accommodate a nice, hug-heavy nap.");
	output("\n\n<i>“Mmrrh, you slackers better be grateful for all this easy footage. Ey you, come round here,”</i> asserts the breathy qilin as she points to one of the gym-goers and directs them around the couch. <i>“Gapes sell...”</i>");
	output("\n\n<i>“Eeeyes ma’am! Holy shiiit,”</i> says the random human gym-rat with his holocamera angled at those big red buns.");
	output("\n\n<i>“Give ‘em the good stuff, elskan,”</i> says the husky dragoness as she looks to you over her shoulder with a wink and a smile. <i>“Slow and steady...”</i>");
	output("\n\nYou perform a loose salute and open your [pc.hip] wide enough for the ‘cameraman’ to get a good shot. With him in place, you pull back to let your softened shaft slide out of its conquest.");
	if (cockIdx < 0) output(" As the [pc.cockOrStrapon -1] pulls free, you let the camera guy get a feed of the awesome gape you’ve left between those muscled buns.");
	else if (pc.cumQ() < 1000) output(" As the [pc.cockHead " + cockIdx + "] pulls free, you take a step back to admire the awesome gape and let trickle of [pc.cum] that follows speak for itself. The camera guy focuses on the damage done and pays extra attention to the [pc.cumColor] fluid’s trails.");
	else output(" As the [pc.cockHead " + cockIdx + "] pulls free, you admire the awesome gape and the gentle gush of overflowing cum that follows. Mirrin wriggles and swirls her behind around as the rush of [pc.cum] flows down her swinging nuts and thick thighs, eager to put on a show for the camera. You - and the camera - keep looking back at the mess made from impact zone to the fluids pooled at the floor as if it were art.");
	output("\n\n<i>“Thaaat’s the shiiit. Gregor, right? Uhh, let me tell you something. Send me that video, I’ll give you a flat cheque, yah? Take the year off with some easy money?”</i>");
	output("\n\nYou take a step back as they quickly form an awkward conversation on some business. Well if you were buying those pics, you’d probably ask for good money too... and it’s only now that you see what happened to those skins you put on your dragon lover. Somewhere in the messy, sweaty hump, she’s pumped up both condoms into perfectly round balls of hot cum. Each is easily as big as one of her");
	if (flags["MIRRIN_PREGSTAGE"] != 10) output(" motherly");
	output(" mammaries and without a steady hand, they’d definitely spill when disposal comes around...");
	output("\n\n<i>“Yah, yah, it’ll be mine but you’ll get credit too. [pc.name], babe, grrreat job but uhhh, yeah this and... well, I’m a bit stiff right now. Catch you later?”</i> says a hurried Mirrin as she points to you, to the camera guy and to her again in a web of awkward gesticulations. You’re already reaching for a nearby towel to clean yourself down but you both exchange blown kisses in the face of a job well done.");
	output("\n\nWith that, you suit yourself back up and leave the SterkurHús well sated.");
	output("\n\nGoddamn, it’s good to be on top.");

	processTime(10+rand(6));
	pc.exhibitionism(2);
	mirranEndTheSexing(doanMirranUpTheBum);
	clearMenu();
	addButton(0,"Next",goToFrontOfMirrinGym);
}

public function doinMirranWhereFewHaveGoneBefore(cockIdx:int):void
{
	clearOutput();
	showMirrin(true);
	author("SoAndSo");

	output("<i>“You know what I want? I want that pussy. You never let me use it!");
	if (flags["MIRRIN_PREGSTAGE"] != 10) output(" Well except that one time I put a baby in you, but still!");
	output("”</i> you say with your hands on your hips. <i>“And I know you’d never forget to work out </i>those<i> muscles.”</i>");
	output("\n\n<i>“Ahhhmm, you thinking about kegels, elskan? Thinking about how natural, <b>virginal</b> pussy just doesn’t do it next to a <b>real</b> breeding hole?”</i> asks the sly qilin as she matches your");
	if (pc.PQ() > 65) output(" impressive and powerful");
	output(" posture with ease. <i>“Get your tool choked into filling me with your... yadda yadda, we’re doing this.”</i>");
	output("\n\nShe scoops you up from behind with both of her flexing, thickly-muscled arms and holds you in a bear hug; might just be a little <i>too</i> tight. Your [pc.chest] presses against her");
	if (jentaBorn() || flags["MIRRIN_JENTA_HATCHING_STAMP"] != undefined) output(" MILF-y, milky");
	output(" mammaries and you can only give her a sheepish grin as she trots off towards the bedroom.");
	output("\n\n<i>“Uhhh, boss, do get a time out or what?”</i> asks one of the gym goers as he’s stopped in his tracks on the... track machine.");
	output("\n\n<i>“Yeah, yeahyeahyeah, sure, I’ll be busy for a good while...”</i> calls back the qilin with her devilish smile still pinned to you. Although you’re quite comfortably grappled and locked to her view, the cool shadows of the bedroom corridor seem like some sort of gate or passage to a different realm entirely.");
	output("\n\nShe casually knocks the bedroom door open with a flick of a hoof, rushes over to the bed with you bouncing in her grip and let’s you fall onto the plush mattress as her arms flind wide. You bounce onto your back with your [pc.ass] cushioning most of the fall but not even a moment passes before you’re pounced upon. Eight feet of muscles and mass pins you by your shoulders to the bed and a big, hot body weighs itself against your");
	if (pc.tallness < 88) output(" much smaller");
	output(" frame. The light from above distorts as a predatory glare and swish of an unfurled, silver mane blots it out. Your heart can’t help but jump: pinned by a needy baby-");
	switch (flags["MIRRIN_PREGSTAGE"])
	{
		case 8: output(" momma"); break;
		case 10: output(" pappa"); break;
		case 9: case 11: output(" momma-pappa");
	}
	output(" with the promise of poon... hell <i>yes</i>.");
	output("\n\n<i>“Right where I want you. Riiight there. You know how it is: you uhhh, demand a slice and I’ll give you the entire pie. How’s that work for you, huh?”</i> chuckles the qilin as she licks her lips and straddles your lap. The bed sinks as her knees and thick thighs make landfall on either side of your [pc.hips] and you can’t help but laugh as you sink in kind as this ludicrous muscle-babe gives dirty talk a try.");
	output("\n\n<i>“Ehhwhat? I say something funny? Ríddu þér, bjáni...”</i> scoffs the grinning Mirrin as she straightens herself up to a full right angle. With her hair flung backwards, she slowly pulls the hem of her loose shirt upwards so it catches the full weight of her mammoth");
	if (jentaBorn() || flags["MIRRIN_JENTA_HATCHING_STAMP"] != undefined) output(", motherly");
	output(" mammaries and jiggles the bulging set of " + (jentaBorn() || flags["MIRRIN_JENTA_HATCHING_STAMP"] != undefined ? "milky F-cups" : "E-cups") + " for your viewing pleasure. " + (cockIdx < 0 ? "You <i>really</i> want to get at your hardlight funtoy right now but just... gotta... jimmy your hips around a bit and-\n\nYou feel an odd stretch in your outfit as the hardlight turns on underneath. Uhhh. " : "While your eyes are caught in the hypnotic, jiggling display, your [pc.cocksIsAre] all ready to burst out of your [pc.crotchCovers].\n\n"));
	output("You do your best to try and undress in as quick and yet dignified manner as possible. It’s more of a desperate series of wriggles");
	if (pc.isCrotchGarbed()) output(" as you try to remove your [pc.crotchCovers]");
	output(", but even so, you manage to <i>mostly</i> keep your eyes on the cleavage prize. Satisfied with the state of near-undress, you suddenly tense up as Mirrin’s weighty black bulge slaps against your [pc.cockOrStrapon " + cockIdx + "].");
	output("\n\n<i>“Yeeeah, not so funny, huh? Stopped dead by a big lady with a big set of balls, huh?! Aheheh,”</i> taunts the dragoness as she grinds her pent-up package against your half-hard " + (pc.hasCocks() ? "tool" : "tools") + ". <i>“Good thing ‘big lady’ has... ‘lady needs’.”</i>");
	output("\n\n<i>“");
	if (pc.isNice()) output("Mmmm, that’s why I’m helping, ya big lug,");
	else if (pc.isMisch()) output("That’s why we’re here though, ya big dummy!");
	else output("Just hurry up already!");
	output("”</i> you chuckle as you slap your hands against those iron-hard thighs. With her sweat-slick skin, the ruby giantess is a joy to just <i>sliiide</i> your palms against.");
	output("\n\nPulling a face between a scowl and a pout, Mirrin pivots forward on her palms and knees. The warm light of the room darkens as her monster tits bury your entire head in hot, soft and squishy flesh. The prison of milky goodness spills around your neck, past your shoulders, a barrier for your senses; such a buffet is too much to turn away. You spread your arms out and slap your hands to the matronly melons and draw them further in.");
	output("\n\n<i>“Erfffmuffmarrf...!”</i> you exclaim as you squeeze, squish and fondle the bounty of boob you’ve been bathed in. You <i>feel</i> Mirrin’s giggle before you hear it, another sound layered with her heavy, fast heartbeat.");
	output("\n\n<i>“Mmm, keep talking elskan, tell me how much you <b>love</b> drowning in my tits. Just going toooo get this, uh, thing in me, uhh...”</i>");
	output("\n\nAs you get intimate with the qilin’s cleavage, fingers and claws draw along your [pc.cockOrStrapon " + cockIdx + "]. The hulking mass atop of you leans further in so that even more chest is pressed against your [pc.face] and a hot, wet pocket rubs against the length of your shaft. You peek out from your");
	if (jentaBorn() || flags["MIRRIN_JENTA_HATCHING_STAMP"] != undefined) output(" MILFy");
	output(" breast-cage and lock eyes with your lover. She licks her lips as she watches you kiss and fondle your prize, her eyes closing tightly as she lowers her primed pussy onto your [pc.cockOrStrapon " + cockIdx + "]. The all-encompassing heat and warmth from her body and from the parted lips that envelope your shaft’s head is immense: your world becomes <i>hers</i> as her muscled framed takes your length and covers you whole.");
	if (cockIdx <= 0) pc.cockChange();
	output("\n\nThe tight, willing sensation of her squeezing pussy is the only thing that cuts through the cloying lust-haze. A crushing pressure hammers your lower body into the bed as hundreds of pounds of muscle and heat claims it as its seat.");
	output("\n\nYou’re buried. Trapped. Every sense buried by warmth, skin, lust and sweat.");
	output("\n\nAnd it’s glorious.");
	output("\n\nWith all " + (silly ? "dis tiddy" : "this titflesh") + " in your arms, you <i>squeeeeze</i> to your heart’s content. Spurts of pinkish-white, gryvain-milk seep between the tight gaps of your breast-cage and soak your face in their sweet warmth. While you’re playing with your food, your qilin lover gears up.");
	output("\n\nThe obscene warmth of her soft, tight snatch recedes as she pushes her lower body up on her knees. The achingly slow motion stops just before your [pc.cockOrStrapon " + cockIdx + "] pops free, and sticky trails of femjuice tickle the shaft. Mirrin giggles, saying something in her smoky tones, but whatever is said is lost in the sounds of her heartbeat through her chest. As soon as she finishes, the grip of her cunt constricts around your shaft’s head and your [pc.legOrLegs] " + (pc.hasLegs() ? "curl" : "curls") + " up our of reflex. The tightening of her kegels and inner walls turns a flesh glove into a vice; rhythmic squeezes massage and pleasure your tool to a pinpoint level. Nerves you never thought you had are stimulated by soft folds and seasoned muscle working in harmony. No more than a minute in and it’s a struggle to last under this cloying, hot and crushingly intimate assault.");
	output("\n\nMirrin continues to giggle with glee as your jerky movements, motorboating prowess and muffled, lustful murmurs play for her amusement. Ever so slowly, she sinks back down and lets your [pc.cockOrStrapon " + cockIdx + "] fill her up all over again. Yet as she sinks, she still squeezes her mighty inner muscles all the way...");
	output("\n\nSoon, the effect takes its toll on your will and your shaft aches with sensation from the massaged bloodflow. Your head throbs with the sound of heartbeats - yours and hers - as you try your best to hold back a forced orgasm. From your qilin-prison, every thought evaporates into wordless <i>rightness</i> and every movement becomes little more than a flail. This stream of primal sensation jolts about when the she-dragon’s body slams once more against your pelvis and buries you in the matted bed.");
	output("\n\nYou arms splay to the side from the impact, releasing the overflowing mammaries from your grasp. The weight and heat from your head shifts and light pours through to your eyes as Mirrin slides her chest downwards. The cool air of the room hits your gasping lungs, and your vision waivers from the sudden shift. You lay there, mouth agape and gasping under her body.");
	output("\n\n<i>“Mmpeekaboo, how about something to help you... mm, cool down?”</i> slurs the qilin as she grabs a tit in each hand. You can only force out slurred noises of your own as she directs her fat, dribbling nipples towards your [pc.lipsChaste].");
	output("\n\nOh well, in for a penny.");
	output("\n\nYou allow your mouth to slacken and the two milky teats force themselves into your mouth. The soft flesh fights for space and it quickly dawns on you that you might’ve made a questionable choice...");
	output("\n\nWith her eyes fixed on you and her grip ready to go, Mirrin practically crushes her tits in her palms. Warm, sweet milk hits the back of your throat like a high-yield cumshot, forcing your eyes to widen as you struggle to gulp down the initial burst. There’s so much from that one squeeze that it forces itself through your nose in a spray of pinkish sweetness. You barely react to each of her squeezes, focusing only on gulping and glugging down the stuff as much as you can. All the while, your [pc.cockOrStrapon " + cockIdx + "] weathers the sensuous assault of deft muscle control with all the fighting spirit it has, but...");

	processTime(35);
	pc.maxOutLust();
	clearMenu();
	addButton(0,"Next",gonnaComeInMirrinBrahNais,cockIdx);
}

public function gonnaComeInMirrinBrahNais(cockIdx:int):void
{
	clearOutput();
	showMirrin(true);
	author("SoAndSo");

	output("It’s no use: you’re gonna explode.");
	var cumQ:Number = pc.cumQ();
	if (cockIdx < 0)
	{
		output("\n\nAs another glug of milk spills out of your mouth, that constant, needy ache in your [pc.cockOrStrapon " + cockIdx + "] spreads to your loins. A blissful rush of adrenaline wracks your body as the faux-cock does its work, driving your body into an orgasmic state from all that tight buildup.");
		output("\n\nYou whine and wail with a mouth full of nipples muffling your calls as the tight seal of fleshy muscle keeps going and going, your lover trying to extend your orgiastic joy as long as physically possible.");
		output("\n\nMirrin bites her lower lip as you take pleasure from her needy hole, pulling her chest from your milk-wet mouth and giving your [pc.face] one last jowl-juggle with her mammoth mammaries.");
	}
	else if (cumQ < 1000)
	{
		output("\n\nAs another glug of milk spills out of your mouth, that constant, needy ache in your [pc.cock " + cockIdx + "] spreads to your loins. Adrenaline pumps up your heart and your mind fogs over as a twinge starts at that [pc.knot " + cockIdx + "], only to surge up the length in the most blissful of ways.");
		output("\n\nYou groan and wail with two thick areola muffling your calls as your [pc.cumVisc] erupts inside Mirrin’s tightened cunt. String after hot string spools and leaks out of the muscular seal just so, as if your shaft were melting wax inside that fuck-furnace of a pussy.");
		output("\n\nMirrin bites her lower lip as the fresh spillage of Steele seed cools her needy hole, pulls her chest from your milk-wet mouth and gives your [pc.face] one last jowl-juggle with her mammoth mammaries.");
	}
	else
	{
		output("\n\nAs another glug of milk spills out of your mouth, that constant, needy ache in your [pc.cock] spreads to your loins. Adrenaline pumps up your heart and your mind fogs over as an overwhelming, eye-watering twinge starts at that [pc.knot " + cockIdx + "], only to then surge up the length with hot, liquid weight.");
		output("\n\nYou whine and wail with a mouth full of nipples muffling your calls as your [pc.cumVisc] erupts inside Mirrin’s tightened cunt. Shot after hot shot pools, spurts and leaks out of the muscular seal just so, as if your shaft were melting wax inside that fuck-furnace of a pussy. It just keeps going and going, cooling the fleshy chamber with all that Steele-branded baby juice " + (jentaBorn() || flags["MIRRIN_JENTA_HATCHING_STAMP"] != undefined ? "as if you were trying to breed her all over again. Oh wouldn’t that just be the best right now..." : "as if it were a blessing from a higher power.") + " [pc.Cum] pools at your [pc.hips] and warms the qilin’s messy impact zone with yet more wet love.");
		output("\n\nMirrin bites her lower lip as the fresh spillage of Steele seed calms her needy hole, pulls her chest from your milk-wet mouth and gives your [pc.face] one last jowl-juggle with her mammoth mammaries.");
	}
	output("\n\nYou feel your eyes rolling backwards as the last ebbs");
	if (pc.hasCock()) output(" and ‘flows’");
	output(" of your gently induced orgasm give way to peace, inner warmth and an awareness of your milk-filled gut. Breathing and grinning is all you can do as Mirrin leans herself forward to let your [pc.cockOrStrapon " + cockIdx + "] slop out of her now-<i>super</i> loose pussy. With her palms planted on your cheeks, your qilin lover plants her lips to yours and takes advantage of your drained state.");
	output("\n\nIt’s strange: everything seems slowed. A frantic, rough ride broken by endlessness and a gentle touch. You can barely keep your eyes open through the kiss and all your senses are raw. What little flavor is left in your mouth is just milk. Sweetened, warm milk. Your frame aches with warmth and numbness in equal measure. Your ears throb with nothing but the sound of two heartbeats. Sweats and fluids mingle and meld all over, coating the both of you in dirty, intoxicating scents.");
	if (cockIdx >= 0 && cumQ >= 1000) output(" Much of it is from the mess made after your tool slopped out of your lovers snatch: a pleasing, familiar waft from the spilled mess of [pc.cum]. Judging from how ‘wet’ everything feels, you’ve been a messy [pc.boyGirl]...");
	output("\n\nWith a satisfied exhale, the mountainous Mirrin rolls over to the left and the whole bed creaks with her. You make a noise between a yelp and a gasp as you’re bounced neatly into the red giantesses arms, your [pc.face] nestled between a soft, " + (jentaBorn() || flags["MIRRIN_JENTA_HATCHING_STAMP"] != undefined ? "MILF-y" : "squishy") + " set of tits.");
	output("\n\n<i>“Well hello there. Fancy seeing you,”</i> croons your qilin lover as she plants a peck on your forehead. You simply smile as the warmth of it all - the sex, the bodies rubbing together, the guarding arms of an amazon - works it’s sleepy magic on your worn out frame. Just a... lil’ snooze...");

	//Orgasm event, PC gains ....milk covered? Status effect? (is there a milk covered status effect) and Cum Covered status effect if PC cumoutput>1000.
	if (cumQ >= 1000) pc.applyCumSoaked();
	pc.orgasm();
	processTime(55);
	mirranEndTheSexing(doinMirranWhereFewHaveGoneBefore);
}

public function gitFuktByBothMirranDiks():void
{
	clearOutput();
	showMirrin(true);
	author("SoAndSo");

	output("Something ridiculous crosses your mind. Something silly, awesome and equally dangerous. Something you’re sure will have consequences for at least one part of your body. To hell with that though, you’re going to get it.");
	output("\n\nTwo cocks. One hole.");
	output("\n\nMirrin crumples an eyebrow as your face does all the talking.");
	output("\n\n<i>“Weeeell? Got one of those, uhh, those looks. You know. The ‘cunning plan’ look. What’s in that head of yours?”</i> croons the qilin as she taps her knuckle against your forehead. You simply smile and pull her arm by the wrist. The movement’s easy enough that she simply let’s you, obviously curious with where you want to take it. You push her palm against her bulge and rub it up and down. Then, you spin on your [pc.foot] and spank your [pc.ass] for her viewing pleasure.");
	output("\n\n<i>“Mmm, anal-slut has needs? That’s all you had to say, els-”</i>");
	output("\n\nYou wave your finger around in a ‘no’ gesture then add in your middle finger to form a ‘V’.");
	output("\n\n<i>“A DP? Again, you jus-”</i>");
	output("\n\n<i>“Ugh, no, goofus. Both. Cocks. My. Ass. Alright?”</i> you assert, spanking yourself with each syllable of ‘my ass’. Without another word, Mirrin crouches, hoists you up from behind and rests you on her shoulder, all in the space of seconds.");
	output("\n\n<i>“Yeah, yeah, yeah, okay, I like that, we can do that,”</i> laughs your dragon lover as she waves her gym clients away. Your world is thoroughly upside down and swaying from side to side while you’re unceremoniously shipped into the bedroom. It’s only fitting to wave the gym-goers goodbye as they stand around gawking, and before you know it, you’ve gone from the dark of the corridor to the moodlights of Mirrin’s private fun room. It all spins around once again as you’re firmly unloaded face-first into the bed.");
	output("\n\n<i>“Better give me a show, elskan. I want everything to be remembered,”</i> chimes Mirrin as you feel a hard hoof push against your [pc.ass]. You move with the push, hunker your chest down and back your booty up: she’ll get a show alright. With a chuckle, she waltzes off to some corner out of view, leaving you to undress. It’s a non-issue: you hastily slip out of your gear and pile it off the edge of the bed. Now it’s out of sight and mind, you return to your rightful place of face-down-ass-up and wriggle that [pc.ass] for Mirrin’s fancy.");
	output("\n\n<i>“Yeeeah, that’s it. Mm, can’t wait to feel that thing bounce off my fucking hips, stuffed and stretched and... hunnh, patience, patience,”</i> says a distracted qilin while she fiddles with something made of chains. From the sounds of it, they’re pretty heavy duty... all the better to, uh, haul in the ships...?");
	output("\n\nOne sound you’re more familiar with is the tearing of tight fabrics. You take a quick glance past your arm and watch the red giantess tossing the shredded remains of yoga pants and yet another jockstrap against the wall. Even when she has her back turned, you can’t help but grin as the ambient light bounces off of her masterfully sculpted ass. The shadow of two half-hard horse members sways in the same light, an image broken by Mirrin glancing over her shoulder right at you. You can only giggle as she <i>tsk-tsks</i> and goes back to her preparations. In turn, you continue to wave your money-maker around in the ways that feel ‘right’, hoping that your need is sated soon.");
	output("\n\nMirrin keeps her eyes half on you and half on her tasks. Those chains have thick strips of flat leather, lining them like a sling. You bite your lip as they’re hoisted up in a pair: that’s obviously where you’re ending up. With one more shorter chain dangling in between the pair, Mirrin double checks her work before snapping up a small jar of something. She looms from behind with the opened jar in one hand and her middle and ring finger outstretched in the other.");
	output("\n\n<i>“Is that...?”</i> you ask, already guessing as to what it could be.");
	output("\n\n<i>“Mmhmm, old friend EasyFit. I think this is a ‘whole pot’, uhhh, scene, scenario, thing,”</i> replies Mirrin with a twirl of her finger.");
	if (pc.ass.looseness() > 5) output(" <i>“Yet... mm, fuck you’re such a stretchy slutbutt already but what’s a little more going to change, huh?”</i>");
	output("\n\nFigures.");
	output("\n\nYou rest your chin on your palm as she takes her sweet time in pouring the gel-like contents on her long, thick fingers. Just hurry up, why don’tcha...");
	output("\n\nHer response is a raised eyebrow and flare of her nostrils at your impatience. You grumble and half-heartedly wag your butt to and fro in some vain attempt to hurry it up. Then, you tense up.");

	processTime(20);
	clearMenu();
	addButton(0,"Next",thanksToSpaceScienceMirrinIsAnEasyFit);
}

public function thanksToSpaceScienceMirrinIsAnEasyFit():void
{
	EasyFit.ItemTargetChoice([pc, 3]);
	EasyFit.ItemTargetChoice([pc, 3]);
	//raise PC lust to max. Apply two doses of EasyFit to PC.
	clearOutput();
	showMirrin(true);
	author("SoAndSo");

	output("Two slathered digits force their way into your [pc.asshole] all the way to the knuckle. You yelp and groan as the muscled, wet warmth squirms and slides around with its gooey slatherings, quickly adapting to their rhythm as they pound away.");
	if (pc.hasCock()) output(" The ache from your prostate is sudden and wince-inducing, jump-starting your [pc.cocks] into arousal.");
	if (pc.hasVagina()) output(" A guilty dribble of femjuice runs off of your [pc.clits] when those knuckles hit your rim: your body <i>needs</i> this, it lives for the need of double-dicks. How shameless.");
	output("\n\nMirrin lays her other palm on your ass cheek to steady you. The firm, heavy grip of her blunted claws reminds you of whose place is whose, a feeling that heats your [pc.face] even as your wettened backdoor is pounded by your lovers fingers. Already, you can sense the effect that this deep fingerfuck and jars-worth of elasticizing cream is doing to you: as Mirrin’s knot-like joints blister in, out, in, out of your [pc.asshole], each pass is easier, smoother and more pleasurable.");
	if (pc.hasCock()) output(" The motions massage your prostate something fierce, sending a constant wave of sensation all over your body. You haven’t even gotten to the good stuff and your poor [pc.cocksIsAre] already leaking [pc.cumColor] fluid into the bed.");
	output(" It’s taken a second for you to stop clenching your teeth, but with her fingers now in a fluid and gentle rhythm, your body begins to relax.");
	output("\n\n<i>“Nnnggg, that’s it babe, feels good getting your ass turned into my next conquest, huh? Just two fingers to break Steele, huh?!”</i> taunts the grinning qilin. A whine leaps from your throat as she hilts her knuckles once again and forces you forward. You can’t help but kick your [pc.legOrLegs] around as this invader weakens you from the inside, intent on working that hole before she breaks it open... but not yet. With one fluid motion, she withdraws her fingers from your well-worked sluthole and rubs the excess all over your sensitive rim. You croon in content as this little gesture signals what’s coming next...");
	output("\n\n<i>“All loosey-goose now. Let’s see here,”</i> says Mirrin under her breath. A shiver runs through your skin as a finger pulls all too easily on your [pc.asshole], the sensation and the pure ease of this motion is oddly satisfying. <i>“Holy fuck, I just have to... camera 2, 3, 4. Tripod arrangement.”</i>");
	output("\n\nYou turn your head about as three holo-cameras swoop down from unseen holding places and hover in a triangular formation. Of course she wouldn’t do this without recording it... ah well. Whatever makes it better for both of you. You gasp as the rush of this finger foreplay catches up to you, sending an ache to the back of your skull. You can only rest your forehead in your palm as the room seems to spin from it all and your heart thumps in your ears.");
	output("\n\nAs if there’s room for a breather.");
	output("\n\nRough, tight palms grip your [pc.hips] and yank you off of the bed. You instantly pull your limbs to as your view is once again sent flying around as you’re arranged to Mirrin’s pleasure. An arm hooks your [pc.legOrLegs] and probes you against her shoulder while she transports you to the arrangement of chains hanging from the ceiling. Her other hand rests on your [pc.thigh] with a gentle caress, putting you at ease as you titter in her arms.");
	output("\n\n<i>“Now, legs first.");
	if (pc.isNaga()) output(" Uhh, tail first. Mm, I can work this out.");
	output(" Just let it all relax,”</i> coaxes Mirrin. " + (pc.isNaga() ? "She pulls the right and left slings together and raises you to help your snaking body slide through. You help her along by angling your naga form out and with all things in synced motion, your [pc.thighs] find a comfortable resting pose." : "She guides your right leg into the right sling and vice versa, taking the utmost care in ensuring you’re well balanced and comfortable in the strange arrangement.") + " With only a hand on your lower back to hold you up, the slings do a wonderful job of allowing your [pc.ass] to spread itself apart. As you hold on to the chains for rest, Mirrin pulls the middle chain forward to reveal a pair of shackles bound up in the links. You exhale through your teeth as you recognize what the next step is and lift your limp wrists above your head.");
	output("\n\n<i>“There we go, just these little, uh, things, manacles and mmmm, done,”</i> mutters the dragoness as she loops the leather manacles just under your wrists and tightens them. She then rubs the side of her finger against your shoulder and the back of your palm, apparently satisfied. You pull on each limb to test the stability of it all, finding that your movement is restricted to whatever you can do with your hips...");
	output("\n\nWith Mirrin still behind you, you have to crane your neck over your shoulder and outstretched arms to follow what she’s doing. She gives you little more than a wink as she wrestles one of the floating cameras and holds it in both hands.");
	output("\n\n<i>“Here we go. Heya boys and girls, a Boss Special™ in the making: getting the most out of your money maker. As you can see, here’s one I prepared earlier. With a little, uh, little ‘working of the blade’, you can get anything you need with what your mother gave ya,”</i> begins Mirrin as she addresses her fans. The camera is aimed squarely at your [pc.ass] and the winking pucker nestled between, a shot you can’t help but shake your tush for.");
	output("\n\n<i>“Mmm lookit that shit, begging for it,”</i> teases the qilin as she spanks both your cheeks in quick succession. You do your best pornstar moan for each one, the fresh sting hyping you up for the <i>real</i> treat in the making. <i>“Hopefully we’ll break some limits today, or at least get pretty close, huh?”</i>");
	output("\n\nYou wince and whine again as another spank bounces off of your cheek. Two wide, calloused palms clasp your [pc.ass] and pull you against a soft backrest of Mirrin’s tits and abs. Your eyes almost roll back on their own as a half-hard shaft - " + (mirrin.cLength(0) > 20 ? "22\" of ridged, hybrid horsedong" : "16\" of horsedong") + " - grinds against your taint and [pc.asshole]. Turning your slings into swings, Mirrin rocks you back and forth across her lengths to help them rise.");
	if (!pc.isNaga()) output(" You look down between your arm hold to see the two flares of her shafts rise between your [pc.legs].");
	output(" The deep throb of both of your lustful hearts mingle together as you’re used to help your lover get off. The qilin keeps her chin close to your shoulder, whispering words of encouragement while she squeezes and caresses your [pc.hips].");
	if (!pc.isNaga()) output(" Your eyes are still on her twin shafts, almost mesmerized with their thickness, length and pure <i>hard</i>ness.");
	output("\n\n<i>“MMnuh, let’s see what we’re working with down there,”</i> announces Mirrin. Those hands slip away from your body handles and drag down to your ass. A cringe-inducing sensation travels up your back when two hard claws dig into your [pc.asshole] and tug it open. Where you’d expect pain of a sort, the sensation is merely ‘strange’ as if your pre-prepared hole were slightly numbed. Although you can’t see the effect, the worryingly wide stretching motions that Mirrin makes with her arms tells you all...");
	output("\n\n<i>“Hooooly shit, boys... now that’s a <b>sleeve</b> right there. Ooo, I have to go in, I just have to,”</i> teases the qilin as she presents for the camera. You bite your lip as a pulsing, " + (mirrin.hasAKnot() ? "dome-like" : "flat") + " flare butts against your elasticized asshole, a mere thrust of the hips away from spreading you apart. Her hands re-acquaint themselves with your [pc.hips] and lend her all the support she needs. With that, she rests her chin on your shoulder and nuzzles your cheek.");
	output("\n\n<i>“Ready? You want this, elskan?”</i> comes the whisper, a note of care buried within the lustful tone of her voice. Hell yes, you want it. You’re way too into it to back out: the mere thought of wanting <I>both</i> pillars inside you is keeping you going just as much as her firm command of your body is.");
	output("\n\n<i>“Pleeease, Mirrin, babe, I want it!”</i> you say with a choke in your voice, your hips gyrating your [pc.asshole] to encourage her. Mirrin just chuckles and shunts her hips forward.");
	output("\n\nThe sudden invasion of " + (mirrin.cLength(0) > 20 ? "near-two feet" : "16\"") + " of thick horsemeat sets your sense afire.");
	pc.buttChange(mirrin.cockVolume(0)/4);
	output(" The pure heat and weight of the thing travels through your ass and fills it up in seconds, the quick insertion allowing your lover’s hard, veiny shaft to hilt you to the [mirrin.knot]. What amazes you is just how <i>easy</i> and pleasurable the insertion is. Your [pc.asshole] is so easily stretched that it simply hugs Mirrin’s shaft with the smallest hint of elastic resistance: she wasn’t kidding when she claimed your ass was now a proper cocksleeve.");
	if (pc.hasCock()) output(" The shaft grinds against your prostate in total dominance, the sensitive organ having no resistance for such a large invader. Your [pc.cocks] " + (pc.hasCocks() ? "leak" : "leaks") + " an errant dribble of fluid " + (pc.hasCocks() ? "each " : "") + "from just the first pass...");
	if (pc.hasVagina()) output(" The thought of it all - the <i>feeling</i> of it all - is enough for your [pc.vaginas], encouraging a healthy dribble of [pc.girlCum] to leak onto the invading shaft.");
	pc.buttChange(mirrin.cockVolume(0)/2);
	output("\n\nMirrin ‘mm’s’ and ‘ah’s’ as she finishes her first thrust while her hands caress, fondle and squeeze your body. Your eyes are drawn to your midriff, now bulging with the outline of a monstercock. You can’t help but laugh in glee as the shape pulses through your [pc.skinFurScales]. The qilin’s hands rub up and down the outline with you watching and the heat - the tenderness - of it all makes you sweat.");
	output("\n\nYour [pc.legOrLegs] " + (pc.hasLegs() ? "tense" : "tenses") + " up as your lover draws her hips back and the shape recedes from your gut. The impossibly warm weight inside you shifts with it, leaving you emptier and lusting for its return. Mirrin keeps pulling back until the thick ring of her horse-cock snags on your [pc.asshole]. You whine as she holds it in place, willing to beg for it if need be.");
	output("\n\n<i>“Hoo... fokk, time for number two...”</i>");
	output("\n\nYour eyes widen as that hard claw stretches your [pc.asshole] open again, a downward pull that’s greeted with another fat flare pushing against it. Your heart jumps as you wonder if your body can even take it. Trepidation sets in as Mirrin rubs the spongy tip against your rim.");
	output("\n\n<i>“Ready? Just sa-”</i>");
	output("\n\nYou bounce around in your swingset moaning <i>“ffiiiill meeee, fuck meeeee”</i> as a debased desire wins out over your fear, interrupting Mirrins words. Your reward is a spank and a squeeze of your exposed cheeks. Without another word, Mirrin forces her second shaft into your already-stuffed ass and powers her hips forward. This time, you feel the stretch: if you had a limit for your backdoor, it’s lost amongst the sheer mass of <i>two</i>");
	if (mirrin.hasAKnot()) output(" hybrid");
	output(" horse-cocks filling you up. Once again, your lover tests your depths with a full penetration from the flares to " + (mirrin.hasAKnot() ? "the knots" : "her base") + " with her hands fully in control of your [pc.ass]. With you moaning aloud and her grunting as she reigns it all in, your draconic lover settles into a smooth and easy rhythm of humps.");
	pc.buttChange((mirrin.cockVolume(0)+mirrin.cockVolume(1))/2);
	output("\n\nSlow at first, the swing of your chain-slings and the muscle-memorised thrusts from Mirrin let’s her use the momentum to do the work. " + (pc.bellyRating() < 50 ? "Twin flares bulge out your [pc.belly] with every hump; w" : "W") + " eighty pillars of meat pack tightly inside your ass. Your hole, tighter from the combined shafts, stretches and aches with each in, out, in, out pass, the EasyFit that didn’t take now providing ample lube for your body as it bends to these twin invaders. Controlling hands fondle your [pc.belly], [pc.hips], and [pc.thighs] as each change in position allows for deeper angles, faster fucks or easier stretches of your hole.");
	if (pc.hasCock()) output(" The building heat and friction inside your ass sends your [pc.cocks] into a frenzy, the " + (pc.hasCocks() ? "tips" : "tip") + " leaking your [pc.cum] from the sheer sensation of getting fucked.");
	if (pc.hasVagina()) output(" Your body loves this; [pc.eachVagina] is leaking more and more feminine fluid in response to a full filling, as if " + (pc.hasVaginas() ? "they’re" : "it’s") + " jealous of not getting penetrated in kind.");
	output("\n\nThe cameras do their best to get up in your face. Hardlight orbs with facsimiles of lenses buried in the middle zoom around you in wavering orbits, shining their blinking lights into your eyes as your face changes expression. Every time you roll of your eyes or loll of your tongue or make a delirious verbalisation, it captures it all for a distant audience of hundreds of <i>thousands</i>. Reams of digital text from multiple chatlogs spill out of the sides of the cameras in abstract animations, most of them describing just how fucking sexy your subby-slut mouth is. Mirrin reaches around with a hand and loosely holds your jaw. She slows her rhythm and let’s your body weight sink on her shafts, only then to lean her chin on your shoulder and snatch the camera out of the air.");
	output("\n\n<i>“Mmmsmile babe, give the people what they want,”</i> goads the qilin as she puts on her ‘faux-whore’ voice. You’re able to play along and let your [pc.tongue] hang out as you give a dopey, rolled-eyed grin for the holocamera. Mirrin takes several quick snaps and then throws the camera back into its orbit. A second camera zooms up from below and the light of the lens draws your view between your arms. Although it’s pointed at your gasping face, it’s hovering just above your [pc.belly] is it gently bulges with each cockthrust. The thoughts in your head blur into " + (silly ? "ur mom lol" : "nonsense") + " as you look at that gut of yours. It’s so perverse. It’s so fucked. <i>You’re</i> so fucked. And you wanted it all the same.");
	output("\n\n<i>“Mmm, love this body, the way you feel as I just use this broken ass, love it all,”</i> grunts your lover through gritted teeth as she twists and gyrates her hips. Something about those words forces your heart to skip, your breath to catch and your eyelids to flutter. To be used and enjoyed, to earn praise for it: <i>yes</i>. <i>More</i>. As if your mind is laid bare for her to see, Mirrin squeezes the imprint she’s making in your midriff and puts her other arm under your [pc.thigh]. Now even more pressed together, you’re left hapless to her next whim...");
	output("\n\nYour [pc.asshole], already ‘made-to-fit’ for her twin shafts, is so easy to use that Mirrin has no trouble with jumping into a powerful, fast rhythm. The horse-cocks buried within you slide in and out at a near-mechanical pace, from flare to " + (mirrin.hasAKnot() ? "knot" : "base") + " and with hip-hurting force. Each weighty, sweaty smack of her pelvis against your [pc.ass] comes with a healthy swing of her loaded " + (silly ? "coco-nuts" : "nuts") + " slapping against your [pc.groin]. You both grunt in unison, your voices rising in pitch with each power-hump that makes impact. Mirrin keeps her grip firm, her posture steady, even as her wild pace tests what little grip there is of your hole. One slip up could seriously hurt.");
	output("\n\nYou clasp your fingers together out of reflex, desperately wanting something to hold onto. Between the building euphoria, lust for belly-bulging insertions and the hands of a powerful woman taking your bound-up body to town, your mind is spinning and your head is throbbing. Merely rubbing your [pc.skinFurScales] reveals how sensitive you’ve become and just how <i>amazing</i> it is to touch and be touched. Your eyes flutter, your focus is barely there, even as your ass is pounded again and again.");
	if (pc.hasCock()) output(" In the haze of intense sensations, [pc.eachCock] " + (pc.hasCocks() ? "twinge, bounce and spill" : "twinges, bounces and spills") + " erratic strings of [pc.cum] onto the floor as the ache in your brutalized prostate reaches peak burn.");
	if (pc.hasVagina()) output(" Despite the pure anal, your [pc.vaginas] " + (pc.hasVaginas() ? "leaks and quiver" : "leaks and quivers") + " in proxy, the sheer rush of sexual energy forcing a skull-shaking orgasm out of you.");
	output(" Such an orgasm is sustained rather than felt, as if it began long ago and will only end when your lover is spent.");
	output("\n\nThere’s a joyous laughter from behind.");
	output("\n\n<i>“Nngghahaha! Holy shit, look at [pc.himHer] blow!");
	if (!pc.hasGenitals()) output(" You guys can’t - huff - see it but [pc.heShe]’s shaking like crazy!");
	output(" So fucking hot!”</i>");
	output("\n\nMirrin breaks her brutal, rapid fucki-rhythm and hilts herself against your [pc.asshole]. Her whole upper body weighs against you and presses your form forward into an awkward bend while her hands wrap around your [pc.belly] and [pc.chest]. She holds herself tightly, still slow-humping that hole so it feels every part of her twin lengths. You’re still numbed from your sustained orgasm, the heat from it all blurring her words as she whispers all kinds of dirty promises to your ear. All you make out between heady gasps is ‘fuck’, ‘bloat’, ‘breed’ and other debased mutterings. You merely whine in the face of her self-assured giggle, bracing yourself as she goes for one last round...");
	output("\n\nYou yelp as she swings you forward and grips your [pc.hips] one last time. Your hole stretched, your belly bulged and shifted around, Mirrin powers through with smacking her powerful hips to your [pc.ass]. Each one feels like it could be the last; each one filling you up with her cocks. The frantic rhythm breaks as she hammers her hips hard enough to shunt you forward in your swing" + (mirrin.hasAKnot() ? ", her twin knots needing only a little effort to bust your hole open." : ".") + " Mirrin grunts as her pent-up seed erupts inside your [pc.ass]. You can only whine as two streams of her cum immediately bloat your midriff forward, and in seconds, your front is weighed down with fresh, hot liquid love. You whine in delight as its heat floods your innards, the buried thought of being used as a cum receptacle twisting your [pc.face] into a delirious smile. Even as she unloads, your qilin lover holds you tight to her, both covering and filling you with her love.");

	processTime(35);
	clearMenu();
	addButton(0,"Next",finallyProperlyDragonfuckd);
}

public function finallyProperlyDragonfuckd():void
{
	clearOutput();
	showMirrin(true);
	author("SoAndSo");

	output("For a half-minute, you’re pumped with seed. It bloats and bloats until the little resistance your [pc.asshole] has gives and it spills in gooey splatters against your [pc.thighs] and [pc.ass]. Mirrin keeps her mouth pressed to your shoulder, grunting and jolting as her own body’s output breaks down her stamina. When it finally stops, your fuzzed-over eyes are entranced with your gut: bloated to the point of appearing pregnant, all the warmth churning inside you, the gentle throb of your lover’s heartbeat through her shafts...");
	output("\n\nThe next few moments seem like a bur.");
	output("\n\nMirrin guides you in for a kiss over your shoulder, using her long, dextrous tongue to bulge your mouth for the camera. Blissful as you are, your eyes are barely able to stay open and constant shuttering of holocameras becomes hypnotic. A great shift in mass disrupts it all as Mirrin draws her softened lengths from your backdoor. All that heat spills and sloughs out of your [pc.asshole] and pools in a musky mess around her jade hooves, almost enough to bathe with. The cum cascade subsides after a few seconds, replaced with the numbed sensation of your poor, poor backdoor getting pulled apart again by claws. Mirrin mutters something into her cameras, proud of the work she’s imprinted upon you. It’s then you find your sense falter, your eyes blanking, your mind... going... dar...");

	processTime(5);
	pc.orgasm();
	soreDebuff(5);
	pc.loadInAss(mirrin);
	pc.loadInAss(mirrin);
	mirranEndTheSexing(gitFuktByBothMirranDiks);
}

public function finishedDoingTheDoWiffMirran(sexFunc:Function):void
{
	clearOutput();
	showMirrin(true);
	author("SoAndSo");

	output("You’re more than a little worn to be anything other than the small spoon.");
	if (flags["MIRRIN_POST_PREG_SEXED"] == undefined && (flags["MIRRIN_PREGSTAGE"] == 10 || flags["MIRRIN_PREG_TIME_LEFT"] == undefined) && (flags["MIRRIN_PREGSTAGE"] == 8 || torriBorn()))
	{
		output(" Waiting so long since the " + (flags["MIRRIN_PREGSTAGE"]%2 == 0 ? "pregnancy" : "ies") + " ended has sweetened that returning moment, that’s for sure. Those balmy New Texas days don’t seem so distant now.");	
		flags["MIRRIN_POST_PREG_SEXED"] = 1;
	}
	output(" Mirrin’s scooped you into her grasp with a muscly arm left draped over your middle, her nose idly nuzzling the back of your head. The soft bed is the perfect balm for your body, especially after such an intense bout of lovin’.");
	switch (sexFunc)
	{
		case mirrinPostNTButtfuggin:
		case gitFuktByBothMirranDiks:
			output("\n\nYour [pc.belly] grumbles from its out-of-place burden of seed, but something about it brings a sense of comfort to you.");
			break;
		case prepareForMirrinAndMakeItDouble:
			output("\n\nBurbling and sloshing inside you is a double dose of qilin love, settling in you as if it were meant to be despite your [pc.belly]’s grumblings.");
			break;
		case doinMirranWhereFewHaveGoneBefore:
			output("\n\nYour pelvis, sore as it is and aching from orgasm, is quick to settle into a body-warming bloom of endorphins.");
			break;
	}
	output(" There’s a strange throbbing in your ears as your breath lightens and slows. All this warmth and sense of wanting seems impossible to verbalize. When you try, it’s just a murmur. Mirrin is similarly out for the count, bordering on sleep. Still, she mumbles <i>some</i>thing: her thoughts on you, seeing how far you’ve come, how brave and beautiful you are. It’s a mess of words but... an appreciated one.");
	output("\n\nYou both lay in this wordless, sleepy state for quite a while. When you think of moving, the warmth of your dragoness’s embrace is too good to give up. She moves first after a time, spilling over to the side with a satisfied exhale.");
	output("\n\n<i>“Oh my... you know how to make this ol’ girl work for it, [pc.name]. How uh... how about we do something? Watch a movie. Grab some snacks. Forget about things for a while, hm?”</i> she asks you as you roll over to match her pose.");
	output("\n\n<i>“Movie? Hm... don’t you have a gym to run?”</i> you ask with a knowing grin.");
	output("\n\n<i>“Fuck ‘em. I got you.”</i>");
	output("\n\nAt that, she plants a light kiss on your forehead and rubs your [pc.belly].");
	output("\n\n<i>“So how about it?”</i>");


	processTime(60);
	clearMenu();
	addButton(0,"Relaxing Time",chillinAnMirrin,true,"Relaxing Time","That sounds good. Nothing crazy, just snacks, hugs and movies...")
	addButton(1,"Nah",noTimeToBeTheDragonsBroad,undefined,"Nah","Maybe you would but you got oodles of Steele-stuff to do.");
}

public function noTimeToBeTheDragonsBroad():void
{
	clearOutput();
	showMirrin(true);
	author("SoAndSo");

	output("<i>“Mm, maybe another time...? Sucks but there’s things I need to do,”</i> you say with a sigh and a consolatory smile. <i>“That was... really good though.”</i>");
	output("\n\n<i>“Aheh, okay. Think I’ll just peace out for a while, think about your " + (pc.tone > 50 && pc.thickness < 50 ? "tight" : "chunky") + " butt of yours,”</i> she murmurs she closes her eyes. Mirrin yawns as her massive frame relaxes into the bed. <i>“Uuuaaah, maybe think of");
	switch (flags["MIRRIN_PREGSTAGE"])
	{
		case 10: output(" Torri"); break;
		case 8: output(" Jenta"); break;
		case 9: case 11: default: output(" the kids"); break;
	}
	output(" a bit.”</i>");
	output("\n\nYou manage to haul yourself up and give her a goodbye rub of her meat-grinder abs. You watch each other with smiles as you redress in front of her, every bit of clothing arranged in an askew manner.");
	output("\n\nSatisfied, you leave her and the gym with a spring in your step and smile.");

	processTime(1);
	clearMenu();
	addButton(0,"Next",goToFrontOfMirrinGym);
}

public function chillinAnMirrin(fromFinishUp:Boolean = false):void
{
	clearOutput();
	showMirrin();
	author("SoAndSo");

	output("<i>“I could do with that, yeeeah,”</i> you sigh. <i>“I don’t think I’ve got to just roll over and watch TV for a while.");
	if (flags["STEPH_WATCHED"] != undefined) output(" Well, something that wasn’t Intergalactic Huntress or whatever...");
	output("”</i>");
	output("\n\n<i>“Let’s do it then, I got snacks, uhhh, some kinda beer, pretty much all the channels. I’ll getcha comfy and uh, yeah,”</i> says the grinning qilin as she " + (fromFinishUp ? "hauls herself up off the bed. You watch her grab and quickly put on a grey robe, laughing through your teeth as the ill-fitting thing exacerbates her obscene cleavage. <i>“Yeah yeah yeah, I’ll be laughing soon enough. Let’s get you wrapped up, eh?”</i>" : "looks from the kitchen to the lounging space a few meters from the door. <i>“Something else first, though.”</i>"));
	if (fromFinishUp)
	{
		output("\n\nYou give her a quizzical smile");
		if (silly) output(" :waitwhat:");
		output(" and she grabs another robe of the same kind from a cupboard. Even without it at full width, the mass of downy fluff is <i>huge</i>. With a roll of your eyes, you simply lay on your side while Mirrin bends forward and drapes you in it. You’re spun and twisted about several times with your head spinning and eyes wide from the playful treatment: if your dream was to be a sushi roll, then you’re already halfway there.");
		output("\n\nAlthough a little giddy, you still laugh out loud as the qilin sweeps you up in her arms and takes her Steele-maki to the lounge area out front. As you transition from bedroom to corridor then to couch, you’d almost forgotten about there being an active gym right behind you. All those moving bodies still pumping away on the exercise machines to the side: maybe they are slackers, but they’re getting <i>ripped</i>...");
		output("\n\nYou’re gently placed into the middle of the couch and immediately take up residence as a snug bagworm, covered in enough luxurious robing to please a king. Or at least a duke, maybe an earl.");
	}
	else
	{
		output("\n\nShe trots off towards the corridor towards the bedroom and beckons you to the wide, leather couch in the white-walled living space. You make your way over in your own time, a little distracted by the moving bodies still pumping away on the exercise machines to the side. Maybe they are slackers, but they’re getting <i>ripped</i>...");
		output("\n\nEven before you sit down, Mirrin comes back with two grey dressing gowns, both in her size. " + (pc.tallness < 96 ? "Although they seem impossibly plush and downy, you’re not sure that it will fit... still, s" : "S") + " he hands you one of the fresh-smelling garments and wraps herself up in the other. In turn, you just let it hang around your shoulders as the sleeves seem so endless that your [pc.hands] can’t even reach the cuffs. You both chuckle at the silly result, with Mirrin heading to the kitchen to grab food and you taking up a spot in the middle of the couch, all snug in your oversized rug.");
	}
	output("\n\nAs you’re settling in, the lighting over the lounging area darkens into an amber glow, and a blue holoscreen materializes against the wall in front of you.");
	output("\n\n<i>“Alright, nerds, that’s enough for today! I’m entertaining tonight. Don’t worry: no charge, no fee, I’ll reimburse, yadda yadda,”</i> announces Mirrin with a six pack of red cans in one hand and two big bags of chilli nachos in the other. Her clients all sigh in unison and complain about ‘being in the zone’ and ‘unfinished set’ but the qilin just points a thumb to the door. They give in but not without huffing a lot of hot air. You get more than your fair share of envious looks, a little note of smugness creeping into your smile.");
	output("\n\n<i>“Eufff, needy egoists,”</i> dismisses Mirrin as she takes up a spot next to you. The couch sinks a little into her direction and your robed-up body rolls into her side. Without really thinking about it, she drapes her arm behind your shoulders and squeezes you all the tighter against her fluffy robe.");
	output("\n\n<i>“But don’t they pay you...?”</i> you ask as Mirrin puts a bag of nacho chips in your lap. <i>“It’s a bit mean.”</i>");
	output("\n\n<i>“Ahhh they know they can’t get it anywhere else. Besides, all comfortably rich. Like, uhhh, you know, white collar, that’s it. Do it because they do it, not cuz it’s a passion,”</i> says Mirrin with a shrug of her shoulders. She breaks out two cans from the six-pack and opens both. Through the veritable mess of soft fabrics, you get your [pc.hand] around the closest one and take a quick look at it: deep red, covered in energy drink art and with two cartoony green horns on the front; there’s no surprise to be had here. Underneath it reads ‘Super Dragon Juice’ in three different Terran alphabets.");
	output("\n\n<i>“Is this really...”</i>");
	output("\n\n<i>“Mmmhmmmmm, why don’tcha try some?”</i> giggles your dragoness as she glugs down half her can with one throw of her silvery mane.");
	output("\n\nYeah, sure, whatever.");
	output("\n\nYou take a light sip and swill it around, immediately wishing you’d not done that. Despite a gentle carbonation, the " + (silly ? "<i>thicc</i>" : "thick") + ", almost syrupy wash of cherry and honey takes real effort to gulp down. The sweetness isn’t quite there either but the sheer mass of the fluid is worrying: just what <i>is</i> in this stuff??");
	output("\n\n<i>“Oo, those sounds you make, mm. Just, yeah...”</i> giggles Mirrin as she pops her bag of chips. <i>“Slurp that drink...”</i>");
	output("\n\nYou nudge her in the ribs and set your can aside. The alcoholic tang barely seems to register as you swill what little ‘juice’ remains in your mouth.");
	output("\n\n<i>“Alright, let’s see what uhhh, what we find in TV land...”</i> announces the qilin as she fiddles with a holographic interface in the couches armrest. She just seems to eyeball the most random channel she can find and the big blue screen blurts into a hyper-real 3-D rendering of a TV show.");
	var totalShows:int = 5;
	if (rand(totalShows--) == 0)
	{
		output("\n\n<i>“<b>Tonight on The Truth Isn’t Out There!</b>”</i>");
		output("\n\n<i>“Oh fuck, not this trash,”</i> groans your lover as she rubs her chin. <i>“Unless you want laughs, I suppose. As if some bjáni knows a thing about anything.”</i>");
		output("\n\n<i>“What do you mean? What kind of show is this?”</i> you ask as you squint at the overly dramatic title sequence that comes to life in 3-D models.");
		output("\n\n<i>“Ehh, they ask some backwater mook about a thing they saw and turn an entire show into a two hour special. Then they debunk the claim. Anyone could do that with a little brain, you know? Is whatever though, at least is funny,”</i> chuckles Mirrin with a dismissive wave of her hand.");
		output("\n\nYou settle in for a ‘wild ride’ of stimulating conspiracy theory and junk science. While not entirely without intrigue, the first two ‘guest claimants’ turn out to be serial fraudsters who are swiftly arrested before the commercial breaks. It’s pretty comical, enough to get some laughs out of you both, yet it’s not quite enough for what happens next...");
		output("\n\n<i>“It’s them brain salads! Look mate, the spacey types running back <b>in</b> from the wastes screamin’ about some mind controlling snakey thing are onto summin’. Has to be brain salads, the kind yer need surgery for, o’ course. Ain’t no snakes, none round ‘ere an’ I can show you them brains too, look.”</i>");
		output("\n\nYou both watch perplexed as the blurred out, diminutive ‘guest’ goes about his shack and shows off all manner of preserved biological ‘things’ stored in an obscured freezer. The shorter fellow barely has enough height to take the ‘things’ out but when he finally pulls free a bag full of mulched ‘stuff’, he almost spills it all over the floor. You can only look on as the rotted contents are revealed: some sort of monstrous seed or plant that looks almost fleshy, blackened and mushy to the touch.");
		output("\n\n<i>“That’s a brain salad. Rare. Always find ‘em dead but they take foreva to mulch. Saw one attack a poor man from the back of ‘is ‘ead, had to have the surgery,”</i> comments the guest as he gestures over his ‘trophy’.");
		output("\n\n<i>“A-and what’s the surgery entail...?”</i> asks the concerned host. Without another word, the guest pulls out a Reaper-brand stun-gun and slams it on the table next to the mulched mess.");
		output("\n\n<i>“...We’ll be back next time, dear viewers! Uhh, just... yeah... <b>cut</b>, <b>cut</b>!”</i>");
		output("\n\nThe program then goes straight to credits without a resolution. You and Mirrin look at each other’s nacho-dusted faces with the same ‘what?’ expression before sniggling away at what you saw.");
	}
	else if (rand(totalShows--) == 0)
	{
		output("\n\n<i>“<b>You think ya got guts? Got what it takes, kid? Lemme see it in ya fists!</b>”</i>");
		output("\n\n<i>“<b>B-but I’m a rahn, boss! I don’t have any guts!</b>”</i>");
		output("\n\n<i>“Oh I love this shit! Haven’t seen it in years!”</i> yells Mirrin, almost flinging her chips across the floor as she jumps in her seat. <i>“Rahney Bloboa!”</i>");
		output("\n\n<i>“Wuh?”</i> you try to ask but the next scene makes it all. While the dragoness leans forward on the couch with her hands gripping her knees, a heart-pumping montage of a white rahn punching frozen meat and running up flights of stairs segues in the worst possible way. You have to watch your [pc.legOrLegs] as Mirrin mimics the punching rhythms and hand exercises almost to perfection. Everyone’s a nerd in some way, after all...");
		output("\n\nThe film’s pretty decent for pure entertainment purposes and yet it’s Mirrin who’s the most into it. Every line of dialogue is matched by her gestures and imitations, especially the poor rahn who is clearly unable to reach the level needed to punch things professionally. Each punch just sort of bounces with the kinect force of an industrial water balloon.");
		output("\n\nYou sit with your head in your hands at the leaps in gusto and ludicrous plot developments. When the ‘sad scene’ before the climax hits, Mirrin is clutching her fist in tears.");
		output("\n\n<i>“<b>I never wanted to fight, only to try</b>!”</i>");
		output("\n<i>“I never wanted to fight, only to try!”</i>");
		output("\n\n<i>“<b>Ya did good kid, ya did real good...</b>”</i>");
		output("\n<i>“Ya did good kid, ya did real good...”</i>");
		output("\n\n<i>“<b>Boss, no! Don’t leave me! I love yoooou!</b>”</i>");
		output("\n<i>“Boss, no! Don’t leave me! I love yoooou!”</i>");
		output("\n\nEven as she ‘acts’ along with each line, the sheer cheesiness of the delivery from every party just makes you sink into the chair further and further. The scene - and film - ends with a circular fade-out.");
		output("\n\nYou both sigh together: you in relief and her in catharsis.");
		output("\n\n<i>“Oof, makes Rahney 2 all the sweeter... eee, elskan, sori, I got a little emotional there,”</i> sniffs the red giantess. You pat her on the shoulder and tell her it’s all okay. Despite her naked emotional display though, the goodwill well on cheesy and bad films is getting pretty low for today.");
	}
	else if (rand(totalShows--) == 0)
	{
		output("\n\n<i>“<b>Supa Duraguno Jyusuuu! Oishiiiii-desu!</b>”</i>");
		output("\n\nYour eyes widen as a long advert showing a chibified Mirrin jumps onto the screen. She starts off on her knees, cursing the sun for tiring her out on track day and stealing the source of her ‘inner powers’. A slender red dragon breaks through the clouds from on high decked in sunglasses and two red-and-green cans in his claws. Cans that look a lot like..");
		output("\n\n<i>“Mirrin-sama wa tsuyoi-desu! Anata wa kono Supa Duraguno Jyusu wa o nomu hitsuyou ga arimasu!”</i>");
		output("\n\nAs the dragon gives his speech, he turns to both the camera and back to chibi-Mirrin. He chucks the can, and it flies in slow-mo into her undersized, animated hands. With hearts in her eyes, she wastes no time in popping it open and chugging the entire thing. As she does, beams of green and red light pour out of her eyes, and an energized theme song plays behind. With a powerful roar, the chibi-Mirrin crushes the can, throws it aside and poses; every single muscle - and other forward bulgy parts - powers up with ‘jyusu’.");
		output("\n\nThe tagline plays again while chibi-Mirrin gives the audience a thumbs up.");
		output("\n\n<i>“Sooo... that was for...”</i> you begin, quickly losing focus as you realize what you’re holding in your hands.");
		output("\n\n<i>“Whaaat? It’s just fun. I didn’t make it anyway, blame dad and the marketing people,”</i> shrugs Mirrin as she takes a swig of her own drink. <i>“Don’t give me that look, I’m just the face of the thing.”</i>");
		output("\n\nYou give her ‘the eye’ as you consider again that... spectacle you just saw. She turns her head away with a soft blush in her cheeks and a hand in her bag of chips. Yeah, you know what you did, you big greedy girl...");
		output("\n\nNext, a panel show on ‘sex politics’ - The Dirty Truth - flips on screen and is actually just a debate format for the convoluted mess of political ideas for eight different parties... but all the contestants are buxom femme’s in oddly conservative suits. While they speak the political language, the topics mostly range from the ethics of hair removal mods in the face of a hypothetical genetic diversity problem and if laboratory-made leather is still ethically pure even though it is an entirely victimless, creative process. Something tells you that it’s much more vapid than it appears and yet it’s just so... sexy.");
		output("\n\nAnd you both keep watching the dryness of it all just hoping for a wardrobe malfunction or a little lean forward, but none of the contestants move more than their arms or necks.");
		output("\n\nAnd you keep watching.");
		output("\n\nAnd watching.");
		output("\n\nThat redhead <i>almost</i> bent over.");
		output("\n\nTwo hours of engaging in silly back and forth later and you’re still holding out for something there. The drinks are all gone, the chips have been devoured; Mirrin takes action, ends both of your disappointments and turns off the TV.");
		flags["SUPA_DORAGON_JUZU_SEEN"] = 1;
	}
	else if (rand(totalShows--) == 0)
	{
		output("\n\n<i>“<b>Smashing! A feast for the ears! The conductor, of course, a master in his field and able to wrangle the notes in just the right way. I found the violin solo particularly enchanting, pulling just enough on the edges of the original, what do you say...</b>”</i>");
		output("\n\n<i>“Ooooh, it’s an orchestra thing. It’s the Terran-Rosha Crystal Choir and Philharmonic, how about that? What do you think?”</i> asks Mirrin as she relaxes in her chair.");
		output("\n\n<i>“Sounds lovely,”</i> you say softly as you slide yourself into her lap, your head coming to rest on the closest thigh. <i>“Something reeeeeally nice.”</i>");
		output("\n\nThe performance is beautiful: a mixture of Renaissance-era opera and kaithrit mourning pieces, played by an 80 piece orchestra and 40 piece choir. It doesn’t take long for the trembling violins and sultry bassoons to lull you into a peaceful state. All seems so calm, warm and thoughtless: just you and the music.");
		output("\n\nThat turns into a nap. Even so, you can even remember the melodies, themes, the mimetic qualities of genius music passed down through the millenia...");
		output("\n\nWhat wakes you up is Mirrin’s chest-shaking yawn.");
	}
	else
	{
		output("\n\n<i>“<b>Sandra, that’s just ridiculous! There’s no way we’re halting the party because of one errant flame of yours from 20 years ago! It’s old news! We are done with it!</b>”</i>");
		output("\n\n<i>“<b>But Frank, I </b></i><b>love</b><i><b> him!</b>”</i>");
		output("\n\nAh, she appears to have found a ‘classic’ romance film. Despite the contemporary setting and mostly non-human cast, the feel is noir as all hell, all the way down to the monochromatic color scheme. It’s easily the cheesiest thing you could’ve found but hell, why not. Neither of you recognise the actors on screen, but then...");
		output("\n\n<i>“<b>Frank, no! Don’t leave me!</b>”</i>");
		output("\n\n<i>“<b>Forget it Sandra, Frank is dead, killed by " + (silly ? "the salt of the Riya-fiasco tears" : "his own vices") + ". It’s you and me now, doll!</b>”</i>");
		output("\n\nThat voice is so distinctive and integral to your memory that you can’t help but stare at the actor.");
		output("\n\n...dad?");
		output("\n\nYou sit there dumbfounded, perplexed as to how you couldn’t tell it was him from his face alone. Well, he does have much more of a neck mane than you remember... even though he didn’t have a neck mane when he was alive. You say nothing about it, just astounded and static as Mirrin crunches on handfuls of chips at a time.");
		output("\n\n<i>“Thakks kott innninit,”</i> garbles the nacho-stuffed qilin as her eyes are lazily locked to the screen. She only just about manages to swallow her mouthful before continuing. <i>“Real cute. Shame about the Frank guy. I like this other guy more though.”</i>");
		output("\n\nThat’s dad. You’d know that voice anywhere. The more you look, the more you remember his mannerisms. It all shines even through this brief cameo. Not nary two scenes later and he’s gone from the film forever.");
		output("\n\nYou put a palm to your chest in effort to calm your heart. It’s a small thing but an unsettling one. Guess dad really did get around, didn’t he...");
		output("\n\nYou slide against your qilin lover and fall limply into her lap, intent on just waiting the rest of the reel out.");
		output("\n\n<i>“Mmm, sleepy, huh?”</i> whispers Mirrin as she massages your shoulders with her palms. You just murmur as if half-awake and let yourself drift off...");
		output("\n\nWhat wakes you up is Mirrin’s chest-shaking yawn.");
	}
	output("\n\n<i>“Mwwohh, fjandinn, tired. That was... quite the thing. Also shit, that took forever! I gotta call dad...”</i> announces Mirrin. <i>“Mm, loved today babe, let’s hang more later, yah?”</i>");
	output("\n\nShe plants a kiss on your forehead and stands up with a stretch, the holoscreen blinking out of existence to leave an amber void where the big wall of blue once was. You shake yourself down, clear away the mess of the chip bags and empty cans - somehow you managed several of the things on your own - from your lap and do the best you can to get rid of the nacho dust from everything.");
	output("\n\nThe two of you take a few minutes to get changed from today’s adventures, and Mirrin gives you a full bodied goodbye hug as you’re about to leave through the automatic doors. With a wave and a nice bit of time passed, you set off back into the Steele routine.");

	processTime(3*60);
	clearMenu();
	addButton(0,"Next",goToFrontOfMirrinGym);
}

public function drinkSumDragonJuice():void
{
	clearOutput();
	showMirrin();
	author("SoAndSo");

	if (flags["MIRRIN_MILKED"] == undefined)
	{
		output("<i>“I want to help out my baby-momma. Ever since I knocked you up, you’ve just got so... <b>big</b>,”</i> you say with a wobbly grin, eyes focused squarely on her cloth-straining chest. <i>“Must be tough lactating so much milky goodness only for it to go to waste...”</i>");
		output("\n\n<i>“It is a little... but sounds like, uhhh... you’re going to fix that, hm?”</i> chuckles the dragoness as she squeezes her bounteous jugs between her biceps. The grey material quickly darkens at the nipples as the mere squish forces out her nourishing milk.");
		output("\n\nOh. Hell. Yes.");
	}
	else
	{
		output("<i>“I’m a little bit thirsty...”</i> you start, visually probing those milky mammaries of the qilin MILF. You can’t help but prod the soft mass with your fingers, hoping to drive the point home.");
		output("\n\n<i>“Mm, guess it’s not only babies that need their milk, huh?”</i> teases Mirrin as she cups her F-cups. You can only nod.");
	}
	output("\n\n<i>“Come, might be here a whiiile,”</i> she chuckles, leading you by the hand to a nearby couch. She quickly takes up her seat and sits with her godlike thighs splayed wide. Her bulge droops just a little as she lets it all hang out and her muscled arms rest against the back.");
	if (flags["MIRRIN_PREG_TIME_LEFT"] != undefined) output(" The whole view is topped off with the baby-bump in her toned belly, cementing her place as a dragon-MILF. <i>Your</i> dragon-MILF.");
	output("\n\nLetting go of her hand, you lay backwards across her lap with her chest dangling only inches above. You’re quick to get to work: her tank top is loose enough that a swift push up the middle rolls it up to her collarbone. Those two red milk-machines dangle and jiggle in their splendor as they’re freed from their grey cage. You can barely see her face from here but you do just about catch her toothy grin...");
	output("\n\nYou start with the right teat, using both hands to heft the milky mound to your [pc.lips]. The stubby, thick nub of her dark red nipple is already dripping with whitish fluid and you knead the flesh in your palms to coax even more out. Mirrins warm body surrounds you like a cradle as you fondle her, filling you with inner warmth on top.");
	output("\n\nSatisfied with merely looking at it, you eagerly guide the thick nipple into your mouth and begin suckling. All too quickly, your mouth is filled with warm, sweet mother-milk that washes your tongue with its thickness. You can barely savor the flavor as more and more of it rapidly fills your throat, and you noisily gulp it down with aplomb. You can feel Mirrin’s heart pulse and pump through her body as this intimate action makes her gasp and giggle.");
	output("\n\nAlready on autopilot, you just want more.");
	output("\n\nWith a rapid swap, you push her right teat aside with a squirt of pinkish-white milk covering your [pc.lips] and go for the other. Again, you guide the unspoiled nipple into your mouth but go the extra yard, ensuring that the areola is completely stuffed in. Now your [pc.tongue] does all the internal work, lapping and squeezing the free-flowing nectar from Mirrin’s matronly breast. You squeeeeeze and massage the flesh for all its worth, the motions actually furthering her milky output in high-pressure pulses. There’s no other sensation than warm, sugary, creamy purity and it’s just so <b>hot</b> getting it straight from the source.");
	output("\n\nYou’re a greedy monster, however, so you can’t settle on one or the other. You pull Mirrin’s milky funbags together, let the nipple slip out from your lips and press the nipples against each other. The cute dribbles of creamy-pink quickly turn into messy squirts and you know now is the time to dive in. With your mouth wide, her hard, thick nipples and soft teatflesh fill your mouth out, the output of milk almost overwhelming your ability to drink it all!");
	output("\n\nMirrin cups the back of your head for support, her voice a murmur of satisfaction and gentle arousal. You feel her yoga pants swell and throb under your back: that’s one way to coax the beasts, it seems...");
	output("\n\nYou keep gulping and supping on her milk for a good half hour. It’s so delicious, bountiful and thick that take time teasing it out of her nipples as well as gulping it down like a glutton. Mirrin herself basks in the therapeutic exercise, her hands caressing your body in gentle ways as you tend to her needs.");
	output("\n\nEventually though, you burp.");
	output("\n\nA splash of the pink milk spreads from your [pc.lipsChaste], and you gasp for breath as you realize just how full you are. So taaasty...");
	output("\n\n<i>“I think someone’s had their fill, hm? " + (flags["MIRRIN_PREG_TIME_LEFT"] != undefined ? "By fuck, I wish I could rail you right now..." : "How about second course?") + "”</i> whispers the breathy dragoness with the worlds most sedate smile on her face. " + (flags["MIRRIN_PREG_TIME_LEFT"] != undefined ? "<i>“Gotta keep sane and safe for the baby though.”</i>" : "A hardness twitches and pulses under your back, insistent and with a need all of its own."));
	output("\n\nWell...");

	processTime(20);
	pc.changeLust(15+pc.libido()/10);
	pc.createStatusEffect("MirrinTiddysuckCooldown");
	pc.setStatusMinutes("MirrinTiddysuckCooldown",24*60);
	IncrementFlag("MIRRIN_MILKED");
	clearMenu();
	if (flags["MIRRIN_PREG_TIME_LEFT"] != undefined || pc.isPregnant()) addDisabledButton(0,"Sex","Sex","With Mirrin? While this pregnant?");
	addButton(0,"Sex",mommirrinSexingTimes,true);
	addButton(1,"Rest",takeABreakFromDragonDrinking,undefined,"Rest","Nah, you’re way too bloated. Fatty.");
}

public function takeABreakFromDragonDrinking():void
{
	clearOutput();
	showMirrin();
	author("SoAndSo");

	output("You shake your head and wipe your mouth clean of her milk, instead choosing to nestle your face into her cleavage. Taking the hint, Mirrin pulls you closer and cuddles you tight, the whole thing lulling you into a sleepy, relaxing post-feed mood.");
	output("\n\nAfter a quick nap, you wake up to find Mirrin with her head resting on her shoulders. Aw, she’s sleeping, the big lug...");
	output("\n\nThinking it best to let her be, you plant a quick kiss on her head and leave the gym.");

	//Give the full restHeal()
	restHeal();

	//*Puts player on tile outside gym, 2 hours in game time passes.
	processTime(100);
	clearMenu();
	addButton(0,"Next",goToFrontOfMirrinGym);
}

public function trainWithMirrinInHerGymmin():void
{
	clearOutput();
	showMirrin();
	author("SoAndSo");

	output("<i>“Let’s hit the machines,”</i> you say with a nod towards the open floor of the gym. Mirrin grins and cracks her knuckles in her palms.");
	if (flags["MIRRIN_TAVROS_TRAINED"] == undefined)
	{
		output("\n\n<i>“Just like on NT, eh? Alright. My personal changing room is first door on the right, you’ll find a little gift waiting for ya,”</i> says the qilin. You pretty much dash to the corridor, snap right and clamber through the sliding doors. Hanging on rack all its own is a suit-bag with ‘For Steele’ written in marker pen on the side. You pull it down and open it up...");
		output("\n\nInside is a special, full-body gym suit. In stylized red-and-green, it stretches with a tell-tale polylycra sheen from top to middle. The inner thighs follow that scheme but the outer thighs from the belt down to the knee are in a hexagonal grey-black pattern. Smack dab on the navel is a set of cartoonized horns that go all the way to the neck V. You dress down without a care for where your gear ends up and slip into the bodyglove with little effort.");
		output("\n\nYou look into the mirror and get a good look. The contours of your body peek through the ultra-light material in amazing ways, exacerbating your [pc.chest] and [pc.ass]. If it weren’t for the light tension in the elastic around the middle, you’d swear you were naked. On the back is ‘STEELE’ emblazoned in brassy lettering. This <i>feels</i> expensive, from the synthetic smell to the obscenely stretchy and tough material that feels like nothing is there. That and no doubt having Mirrin’s brand on it ups the value. Then you realize: this is <i>your</i> suit. No one else gets one like this.");
		if (pc.legCount == 2 && pc.legType == GLOBAL.TYPE_HUMAN) output(" And hey! A pair of color-matching sneakers at the bottom of the bag! You put them on just as quickly and sigh in contentment as they conform to your shape perfectly.");
		output("\n\nYou [pc.walk] out of the room with your hands raised to the side, allowing everyone around to breathe in the sight. You definitely gain a few turned heads at least and those who do have approval all over their faces. Mirrin can’t help but bite her lower lip as you stroll out looking like that.");
	}
	else
	{
		output("\n\n<i>“Better suit up then. It’s fresh and clean, ready just for you. Helvitis... seeing you wear it, mmmf,”</i> says the qilin in a low, suggestive tone. You give her a wink and hurry to the changing room. It takes nary a minute to undress and slip on your very own exclusive gymsuit");
		if (pc.legCount == 2 && pc.legType == GLOBAL.TYPE_HUMAN) output(" and sneakers");
		output(" then dash back out to the main room. Mirrin greets you with a blown kiss and a wink.");
	}
	output("\n\n<i>“Let’s fuckin’ train.”</i>");
	output("\n\nRight off the bat, you go in hard. Four sets of fifty press-ups, 10 minutes of leg stretches followed by a ten kilometre sprint on the closest running machine. You’re already on the breathy end of warmed up, needing a good few minutes between each point to catch your breath. Although considerate, Mirrin still enforces strict time on everything, pushing you into new, subtle limit with every passing moment.");
	output("\n\nNext comes the weights. Handbells in a variety of patterns, two sets of ten each. What matters is the precision: making sure each movement is followed to the detail. Mirrin keeps an eye and a guiding hand when you falter in poise, gently pushing your arms into the right position when needed. By the end of your twelve sets, your chest is aflame with adrenaline and pumping blood. Flexing your arms is extremely satisfying. You want <i>more</i>.");
	output("\n\nReps, tailored to your body’s capability. That familiar barbell with gravitic orbs at each end puts you through your paces, walling you into three sets of eight for preacher curls, half that for delt and only one set hammer curls. Throughout all this, all eyes are on you and your training partner. Still, you don’t think on how much you’ve could’ve done: there’s only time to rest up for the next set...");
	output("\n\nFor the next two hours, Mirrin puts you through your paces. No part of you is unused by the end of it. You’re feeling the jelly-limbs kick in, and it’s only when you slip on the floor from machine to machine that Mirrin has to stop you and haul you up by your middle.");
	output("\n\n<i>“I thiiiink we’re done, yes? Ooof, you did so good, so proud,”</i> she says in praise with a wide smile. You simply nod and allow her to carry your used-up frame to the changing room. You can change on your own easily enough but you can’t help but think that Mirrin’s there just to ogle you freshly-pumped up muscles. With your gear all back where it should be, the two of you leave the room and return to the gum doors. Feeling like you’re done for today, you bid her a hug-filled goodbye and leave to do... <i>you</i> stuff.");

	//repeatable. Training increases Tone by 5 and reduces thickness by 2, increases Physique and Reflexes by 2, increases Willpower by 1 up to 80% of max. 2 hours in game time passes. PC gains ‘Very Sore’ and ‘Sweaty’ status effect and loses all Energy.
	processTime(2*60);
	pc.modTone(5);
	pc.modThickness(-2);
	pc.slowStatGain("physique",2);
	pc.slowStatGain("reflexes",2);
	if (pc.WQ() < 80) pc.slowStatGain("willpower",1);
	soreDebuff(7);
	sweatyDebuff(1);
	pc.energy(-pc.energyMax());
	IncrementFlag("MIRRIN_TRAINED");
	IncrementFlag("MIRRIN_TAVROS_TRAINED");
	clearMenu();
	addButton(0,"Next",goToFrontOfMirrinGym);
}

public function mirrinKidsAvailable():Boolean
{
	if (hours < 9 || hours > 17) return false;
	if (!torriBorn() && !jentaBorn()) return false;
	return true;
}

public function mirrinWiffKiddos():Boolean
{
	if (!jentaBorn() && !torriBorn()) return false;
	return hours > 14 && hours < 18;
}

public function mirrinDadWiffKiddos():Boolean
{
	return days%8 == 0 && mirrinWiffKiddos();
}

public function showMirrinAndDad():void
{
	showMirrin();
	var sceneName:String = "MIRRIN\nAND" + (flags["MIRRIN_MET_DAD"] == undefined ? "... UH..." : " ARKOS");
	showName(sceneName);
}

public function showMirrinDad():void
{
	showName("ARKOS\nARKOSSONNE");
}

public function mirrinBabyBlurbs():void
{
	if (!mirrinKidsAvailable()) return;
	output("\n\nYou see your little bumpkin" + (torriBorn() ? (jentaBorn() ? "s, Torri and Jenta" : ", Torri") : ", Jenta") + ". They’re flopping around, having fun with a mountain of kids toys with");
	if (mirrinWiffKiddos())
	{
		output(" Mirrin");
		if (mirrinDadWiffKiddos()) output(" and her... dad?");
	}
	else output(" one of the nursery’s caregivers, who promptly nods and walks away when you come by.");
}

public function mirrinKidsOptions(button:uint):uint
{
	if (!mirrinKidsAvailable()) return button;
	var label:String = (torriBorn() ? (jentaBorn() ? "Mirrin Kids" : "Torri") : "Jenta");
	addButton(button,label,interactWiffMirranKiddos,undefined,label,"Awww, lookit dem go!");
	return button+1;
}

public function interactWiffMirranKiddos():void
{
	clearOutput();
	if (mirrinWiffKiddos()) showMirrin();
	else showName((torriBorn() ? (jentaBorn() ? "TORRI\nAND JENTA" : "TORRI") : "JENTA"));
	author("SoAndSo");

	var bothKids:Boolean = jentaBorn() && torriBorn();
	output("You [pc.walk] up to your " + (bothKids ? "kids" : "kid") + " with a smile on your face and open hands. " + (bothKids ? "They see" : "She sees") + " you before you even say hello and " + (bothKids ? "raise their" : "raises her") + " stubby arms up above " + (bothKids ? "their" : "her") + " fluff-topped " + (bothKids ? "kids" : "kid"));
	if (mirrinWiffKiddos()) output(" It’s hard to miss the big, crouching form of Mirrin right next to your " + (bothKids ? "babes" : "babe") + " but she simply grins as they recognise you.");
	output(" You sit right in front of " + (bothKids ? "Torri and Jenta" : (jentaBorn() ? "Jenta" : "Torri")) + ", scoop " + (bothKids ? "them" : "her") + " up in your arms and hold " + (bothKids ? "them" : "her") + " close to your [pc.chest].");
	output("\n\n<i>“Heeeey " + (bothKids ? "Torri and heeeey Jenta" : (torriBorn() ? "Torri" : "Jenta")) + ", how are yooouuu? Huh? Looking very cute today. Aren’t you just the sweetest?”</i> you say in a silly voice while you look in " + (bothKids ? "their" : "her") + " eyes.");
	if (mirrinWiffKiddos()) output(" Mirrin chuckles and plants a kiss on your cheek. She hasn’t said a word yet but that might just be it: it’s <i>your</i> time to get silly with them.");
	if (mirrinDadWiffKiddos())
	{
		showMirrinAndDad();
		if (flags["MIRRIN_MET_DAD"] == undefined)
		{
			output("\n\nAnd then there’s... some guy sitting on the chairs behind her. Huh.");
			output("\n\n<i>“Aheh, pinulitill elskan...”</i> he says in a deep, rich voice.");
			output("\n\n<i>“Dad, no, shush. That’s what I call... anyway, let [pc.name] do [pc.hisHer] thing first,”</i> hisses Mirrin as she turns to the older guy. <i>Dad?</i> He covers his mouth with his hand and mumbles something, causing " + (bothKids ? "Torri and Jenta" : (jentaBorn() ? "Jenta" : "Torri")) + " to giggle. You simply smile and turn back to your kids, lightly bouncing them against you as they embrace their " + pc.mf("dad.", "mom."));
			output("\n\n<i>“I’ll be in, uhhh, canteen if you need me, skrimsli,”</i> says the man as he abruptly gets up and wanders to the cafeteria.");
			output("\n\n<i>“Not in front of- guh... dads. Anyway, let’s have some fun for a bit. Sure dad would like to talk too, if you reeeeally want to,”</i> sighs Mirrin as she rests her chin in her hands and watches him walk to the canteen. <i>“Fokking bjáni...”</i>");
			output("\n\n<i>“Dad? He gonna come down much?”</i> you ask, mostly preoccupied with the " + (bothKids ? "babies." : "baby."));
			output("\n\n<i>“Ehh, every few days or so. He’s talking to me every day right now. It’s a bit much but whatever, it’s nice having him around,”</i> she says offhand while she tickles " + (bothKids ? "Torri and Jenta" : (jentaBorn() ? "Jenta" : "Torri")) + " from behind.");
			processTime(2);
			flags["MIRRIN_MET_DAD"] = 1;
		}
		else output("\n\nMirrin’s dad is there, laughing along with the " + (bothKids ? "kids" : "kid") + " as the qilin herself plays airplane with the giggling " + (bothKids ? "tykes." : "tyke."));
	}
	output("\n\nYou spend a fair bit of time just playing with " + (bothKids ? "Torri and Jenta" : (jentaBorn() ? "Jenta" : "Torri")) + ". It’s so aimless and relaxing, filling your chest with more than a little pride at just how inquisitive and cute " + (bothKids ? "they are. Their" : "she is. Her") + " wings are barely developed and yet there’s movement and flexing when " + (bothKids ? "they swing their" : "she swings her") + " arms around. Even with all this cuteness flying around though, you can’t help but yawn: kids are also tiring...");
	if (mirrinWiffKiddos()) output("\n\nWhatcha gonna do?");

	clearMenu();
	if (mirrinWiffKiddos()) addButton(0,"Sit Back",letMirranHandleTheMirranKiddos,undefined,"Sit Back","Be there but take a more passive role as Mirrin does her thing. You remember that she wanted the bigger hand in all this, so...");
	if (mirrinDadWiffKiddos()) addButton(1,"Talk Dad",meetThatMirrinMakingFellow,false,"Talk With Her Dad","Ah why not, go talk to a sexy dad.");
	addButton(14,"Leave",doneWithDragonKiddosForNow,undefined,"Leave","You’re a little worn out by it all, you’ll come back later.");
	processTime(60);
}

public function letMirranHandleTheMirranKiddos():void
{
	clearOutput();
	showMirrin();
	author("SoAndSo");

	output("You shuffle up next to Mirrin and help put " + (torriBorn() ? (jentaBorn() ? "the kids" : "Torri") : "Jenta") + " in her lap. She points to some sort of musical instrument, a small keyboard by the looks of it and asks you to hand it over. " + (flags["MIRRIN_DID_SINGY_THING"] == undefined ? "You give her a quizzical look and ask what it’s for, but she just says ‘You’ll see’. You hand it over anyway." : "Oh here we go, more of that ‘pitch training’."));
	output("\n\n<i>“Good, good, nice, so... Aaaaaaaaaa. Beeeeeeeee. Seeeeeeee. Deeeeee....”</i>");
	output("\n\nShe goes along in sequence, matching the note played with her voice... relatively well. Almost as if she’d tried singing in the past but didn’t get very far.");
	output("\n\n<i>“It’s for perfect pitch. If you start young and continue until six years, they’ll have a life skill, give them something... interesting to try for,”</i> says Mirrin wistfully as " + (torriBorn() ? (jentaBorn() ? "the kids hug" : "Torri hugs") : "Jenta hugs") + " at her shirt. Although " + (torriBorn() ? (jentaBorn() ? "the two tykes are engaged, they" : "Torri is engaged, she") : "Jenta is engaged, she") + " can only really make baby noises. Mirrin’s a patient teacher however, going through a basic sequence of notes over and over until the " + (jentaBorn() && torriBorn() ? "babes get" : "babe gets") + " groggy and tired.");
	output("\n\nAww... they’re all done, looks like. Mirrin just sits there grinning and you give each other pecks on the cheek.");

	processTime(55+rand(6));
	flags["MIRRIN_DID_SINGY_THING"] = 1;
	clearMenu();
	addButton(0,"Next",doneWithDragonKiddosForNow);
}

public function meetThatMirrinMakingFellow(fromAppearance:Boolean):void
{
	clearOutput();
	showMirrinDad();
	author("SoAndSo");

	if (fromAppearance)
	{
		output("<i>“Uhh sorry, just spacing out for a little there,”</i> you say as you snap out of your little moment.");
		output("\n\n<i>“No worries, all the time you need,”</i> he says in his rich, Scandinavian accent.");
	}
	else
	{
		output("You know what? You do want to talk to her dad.");
		if (flags["MIRRIN_DAD_MET"] != 2) output(" She’s only mentioned him in passing, he seems very... ‘dad’-like. He knows Mirrin better than anyone.");
		output("\n\nWith a pat on her shoulders, you push yourself up and tell Mirrin that you’re going to catch up with her dad. She pats the back of your hand, smiles and lets you go about your way while she does something musical with the kids.");
		output("\n\nYou go down to the cafeteria and find her dad sitting with a steaming mug of black coffee. Something vaguely chocolatey hangs in the air: mocha?");
		output("\n\nHe hears you coming and waves you over, pulling a chair out just for you.");
		output("\n\n<i>“Oh thanks. " + (flags["MIRRIN_DAD_MET"] != 2 ? "So you’re...?" : "Needed a little break, kids are draining,") + "”</i> you begin, resting your elbows on the table.");
		output("\n\n<i>“" + (flags["MIRRIN_DAD_MET"] != 2 ? "Arkos Arkossonne, uhh, old man and construction magnate. Aheh, and you’re the one my daughter has been going crazy for. Must say, I’m not sure what I was expecting but uhh, I can see it, I can see it. So, want to chat? Not sure what I can say, really," : "Ahh, back for more ‘me’, eh? Kiddings. Perhaps talk about something for a little?") + "”</i> he begins as he reclines in his seat. You nod and figure out what to ask him. Jeez, where to begin...");
		flags["MIRRIN_DAD_MET"] = 2;
	}

	//repeatable. Moves PC to the canteen tile. Player only chooses one option per encounter except [Appearance]. 
	generateMapForLocation("NURSERYG12");
	processTime(1);
	clearMenu();
	addButton(0,"Appearance",lookAtMirrinsDad,undefined,"Appearance","Mirrin’s human dad. He’s a man, he’s a dad, he’s mandad, doodoodoo.");
	if (flags["MIRRIN_DAD_TALKED_DAD"] != undefined) addDisabledButton(1,"Him");
	else addButton(1,"Him",arkosArkossonneTalksAboutMrArkossone,undefined,"Him","Mirrin only mentions him, get the lowdown from the man himself.");
	if (flags["MIRRIN_DAD_TALKED_MIRRIN"] != undefined) addDisabledButton(2,"Mirrin");
	else addButton(2,"Mirrin",arkosArkossonneTalksAboutMsArkosduttir,undefined,"Mirrin","You’ve been let in on her life but not really her past. Who knows her better than her dad?");
	if (flags["MIRRIN_DAD_TALKED_KIDS"] != undefined) addDisabledButton(3,(jentaBorn() && torriBorn() ? "Babies" : "Baby"));
	else addButton(3,(jentaBorn() && torriBorn() ? "Babies" : "Baby"),arkosArkossonneTalksAboutMirrinsduttirs);
	addButton(14,"Leave",doneWithDragonKiddosForNow,undefined,"Leave","You’re a little worn out by it all, you’ll come back later.");
}

public function lookAtMirrinsDad():void
{
	clearOutput();
	showMirrinDad();
	author("SoAndSo");

	output("You take a moment to size him up.");
	output("\n\nMr. Arkossonne is a Terran male, free of any obvious transformative effect. He sits with a relaxed posture, two lumberjacks arms laid loosely on the table. From a guess alone, it’s hard to say what age he is: his hair greys in places but his light skin is taut and wrinkle free, clearly having seen some rejuvenation therapy.");
	output("\n\nWhen standing, he reaches about 6\' 2\" in height, relatively average. Yet his height is matched by his <i>width</i>: he has the body of a former strongman, or perhaps a lifetime laborer who smashed rocks with his fists for a living. His arms and shoulders bulge through his casual clothes while ‘barrel-chested’ would be an understatement. His limbs are a quartet of aged tree-trunks, pillars of raw mass and power kept modest by his choice of outfit. His bulky frame never seems to hinder him, despite his slow and more loose movements.");
	output("\n\nHis hair is a vibrant auburn shade with wisps of grey dotted about. Cut to a short-back-and-sides, it’s a very utilitarian style but one he pulls off. His face could be described as ‘dad handsome’: square jaw, caterpillar eyebrows, a little flab on his neck, a frizzy beard kept in check by a slightly sloppy razor. His eyes are a stoney blue, much older than the rest of his body by far. There’s a fatherly twinkle in his irises for every bit of dad humor he pulls off. For all this though, his face stays neutral, even contemplative. As he’s sitting there, you get the impression that he’s juggling something else when he talks with you.");
	output("\n\nConverse to his ‘magnate’ career, his dress sense is frugal or perhaps even kitsch. A simple flannel shirt in red and white plaid houses his upper half, buttoned so tight that a flex could probably rip it open. Now who does that remind you of...");
	output("\n\nAs for the rest of his outfit, it’s plain black jeans and black workmans boots. With all this, you’d have a hard time believing he and Mirrin were related what with her assertive, assessing words always delivered in a loud voice but this guy... he’s much more restrained, happy even. At peace. In contrast to his sexually provocative - even <i>aggressive</i> - daughter, Mr. Arkossone keeps himself modest in his tone and appearance.");
	output("\n\nWhat ties them together the most are their accents and mannerisms. Although they speak Standard Terran English, words and phrases from a specific language interrupts the flow of your translator. Sometimes they have to think of the right word and spin their fingers around in an attempt to summon it. Perhaps the cutest link is their preference for pet names: Mirrin tends to call Arkos her favourite ‘bjáni’ while to him, she’s his ‘skrimli’.");
	output("\n\nAnd now that you think you’ve sized him up...");

	processTime(1);
	clearMenu();
	addButton(0,"Next",meetThatMirrinMakingFellow,true);
}

public function arkosArkossonneTalksAboutMrArkossone():void
{
	clearOutput();
	showMirrinDad();
	author("SoAndSo");

	output("<i>“Mirrin doesn’t talk about her personal life too much. She’s told me you exist and that’s mostly it,”</i> you begin with a sheepish look on your face. Sounds almost rude when you put it like that. Arkos simply laughs.");
	output("\n\n<i>“Aheheh! That’s her alright. I’m a bit too much of a dad, asking her how she is all the time, a call every day, that sort of thing. I manage a third of her little ‘empire’ as we call it back home, mostly the manufacturing and uhhh, whatsitcalled, the uhhh, advertising. You ever see that advert for her new drink?”</i> he asks, a knowing and all-too-cheeky grin on his face.");
	if (flags["SUPA_DORAGON_JUZU_SEEN"] != undefined)
	{
		output("\n\n<i>“Oh, yep, yeah, I’ve seen it alright,”</i> you admit, trying to hold back your laughter as you visualize it. <i>Suuupa jyusuuuuu...</i>");
		output("\n\n<i>“Heheh, all my work. It’s a very, very old callback to Terran adverts but it seems to have worked. We might have to double production for the next two solar years because of it,”</i> he muses as he looks into space with his hand on his chin.");
	}
	else
	{
		output("\n\n<i>“Nnnooo I don’t think so? What should I expect?”</i> you ask slyly, wondering what he’s implying.");
		output("\n\n<i>“Oho, you’ll see, it’s quite a thing,”</i> he says with a wink.");
	}
	output("\n\nYou <i>tsk</i> and tut at his playful way but it’s still his turn to speak.");
	output("\n\n<i>“Anyway, uhh. Yeah, so I’m a bit of a self-made man. Say a century ago, Terra had economic troubles back home. When you grow up there, it’s hard to break out of ehhh, deadlocks like that. I had it in my head to just do anything I could, any bit of hard, physical work. Landed a welding job, then a qualification, then management, onto the board of directors. Lots of grit and sweat in between,”</i> he says as he rubs his shoulder.");
	output("\n\n<i>“Got very tired of it. A ship would come in for repairs and I’d have to spend weeks navigating the thing for any inch-sized hole. Management just meant more paperwork. Board of Directors meant <b>only</b> paperwork. So I took my rough knowledge, a few friends from the firm and a healthy savings account... started building things. It became exponential when we had an in-house consultant picking our battles for us. Contract after contract, hiring after hiring. Had to move it closer into U.G.C territory or risk a slow bleed of travel costs. Was lucky enough to land a ship contract, as in you know, make a ship. Prototype, unique hull design. That’s where I met uhhh... yeah, my first wife, aheh.”</i>");
	output("\n\nFirst wife...? You cock your head and squint in his direction.");
	output("\n\n<i>“Mirrin’s mother, of course! Eyy, what a woman. Tall, mysterious, flowing blue hair just... catching in the wind all the time. Gryvain, as you might have thought. We met when she and her team from... Pyrite, I think it was, yeah. They came down to fit their engine parts and she was a lead engineer. The brains on that woman, helvitis. Made my bumpkin mind spin,”</i> says Arkos. He quickly gets lost in this moment of nostalgia and you think it only fair for him to continue. After all, he makes her sound like a real bombshell...");
	output("\n\n<i>“We hit it off a little quick, aheh. Three months of working together in a tightly cramped hull will do that to people. At that point, I’d never slept with a non-Terran before but ohh, the things I could say... good thing skrimli isn’t here to hear it, aheh,”</i> he winks. That’s all well and good but he could actually <i>say</i> that stuff, the tease.");
	output("\n\n<i>“Damn, almost 40 years now... am I that old? Hah! You know, the de-aging stuff may make you live longer but you still feel things speed up a bit each couple of years. And being a dad for the first time was already pretty jarring back then, now I’m a grandfather? Eee, even my papa would’ve been knocked off his feet. But yeah, damn... Onsula is her name. Eh... <b>was</b> her name,”</i> he says with a sigh.");
	output("\n\n<i>“Ohh, I didn’t know, did she...?”</i> you ask softly as his voice lowers.");
	output("\n\n<i>“Oh no, not dead, no. I think, at least. Let’s just say that once Mirrin hit a certain age, the feisty-minded engineer I fell in love with vanished with nothing but a note on the table. ‘I’m not good enough’ it said. She’d left most of her things behind, taken her money, ID’s...”</i>");
	output("\n\nHe pauses before rubbing his brow.");
	output("\n\n<i>“All save one. It was a Heartland Republic I.D and it simply had Dr. Mairis on it. All her details were on there but no surname, no photo frame. A fake. For 30 years, I’ve never known what to make of it. I hid away for months, just torn up, making sure my daughter was alright, trying not to lose it. Business peaked. I didn’t care. We just got stronger through it. Ehhh, the dark stuff. You deserve to know though,”</i> he says, huffing air through his teeth as he finishes.");
	output("\n\n<i>“I’m so sorry,”</i> you say calmly. <i>“Perhaps I shouldn’t have pried.”</i>");
	output("\n\n<i>“Oh no no, is ancient news. We all moved on. Besides, now that you’re here, helping her out, giving her what she needs, sharing a life, it’s... just better,”</i> he says with a smile and a shrug.");
	output("\n\nYou chat a little more with him for a time, oddly absorbed in his casual approach to his life. You get the impression that he never quite left Terra behind. He gets up rather abruptly and excuses himself when his coffee runs out. <i>“Business never sleeps,”</i> are his parting words.");
	output("\n\nSomewhat satisfied, you swing back to the play area and find your " + (jentaBorn() && torriBorn() ? "prodigies" : "prodigy") + " in the arms of a big red momma dragoness.");
	output("\n\nAww...");

	processTime(55+rand(6));
	flags["MIRRIN_DAD_TALKED_DAD"] = 1;
	clearMenu();
	addButton(0,"Next",doneWithDragonKiddosForNow);
}

public function arkosArkossonneTalksAboutMsArkosduttir():void
{
	clearOutput();
	showMirrinDad();
	author("SoAndSo");

	output("<i>“So I have to ask a bit about Mirrin. Iunno, I’ve never had the chance to let her open up,”</i> you ask, pondering on the times you tried.");
	output("\n\n<i>“Aheh, yah, I imagine so. Mirrin, ohooo, Mirrin, what a child. My little skrimli. She’s my only daughter so I’m not sure how to frame it, really. Sleepless nights, noisy mornings, broken toys by the afternoon. Laughing all the way, all three of us, aheh. Yeah, I suppose it was normal, except, mmm... she was always strong for a baby, unusually so. No wings, didn’t need to take the Heartland gene therapy for breathing oxygen, we always just penned it on hybrid births. But anyway: I let the company go to some trusted friends - they’re still ploughing away at it - and me and Onsula... uhhh, we settled into domestic life,”</i> he begins, pausing after mentioning that name. " + (flags["MIRRIN_DAD_TALKED_DAD"] != undefined ? "Understandable, if curious. Might have to ponder on that..." : "Odd, perhaps a former lover or wife. Mirrin’s mom?"));
	output("\n\n<i>“First ten years were heavenly. A breeze. I had two beautiful girls in my life, I could nurture one during the day, spend all my time with the other during the night. Mirrin was a good kid, you know. Everything she learned, she wanted more. No time for paperwork though, it all had to be physical activity. We hired teachers for music lessons, artistry, made sure she went to an athletes school when she showed her genes. I guess all my years of uhhh, handiwork seeped in somehow, aheh...”</i>");
	output("\n\nAs he continues, you get the feeling that the last sentiment was riddled with doubt. Seems logical though: a strong dad makes a strong daughter through genes, it happens.");
	output("\n\n<i>“She never really liked singing much. Had the chords for it, so I was told. I’m fairly certain she still has perfect pitch... can’t be sure. Art, wasn’t her thing. She wasn’t patient enough. She’d spend all her time after school, in the gym. The adults gym, I should say. It was amazing, she could lift her own body weight by age 9 and then squat the same a year later. That’s when I knew she was a certain kind of special. Then uhh, then Onsula... yeah, well, that part is personal,”</i> he sighs, a note tinged with regret. " + (flags["MIRRIN_DAD_TALKED_DAD"] != undefined ? "You nod in understanding, remembering the tale he told before." : "That name again... you simply nod and let him continue."));
	output("\n\n<i>“It hit my girl pretty hard. And so did puberty, oh yoy, I’ve never seen someone change so quickly in the space of three years. She hit my height by age 12, beat me in all my weight records, spent 5 hours a day working out and the rest trying to ‘understand’ herself. She’d bring home boys - and girls - and they’d be around for a few days but uhhh, they couldn’t really handle her. Always mad all the time, stern, rough around the edges. It was far harder for her, having to deal with her mother’s genes coming out of nowhere. She was stronger than any of her training partners, probably than any of her idols but she couldn’t enter tournaments because of age. So when she was 16 I built her a private gym, with my own tools and such. Custom made weights, welded by hand. Nothing less for my daughter. I’d never seen her so happy.”</i>");
	output("\n\nHe bites back a tear and sniffs right before rubbing his face with his sleeve.");
	output("\n\n<i>“It’s okay if-”</i> you begin.");
	output("\n\n<i>“Ohhh nono, I’m just a softy. It was a great time, all the same. We trained together every day, spotting each other. She’d learned so much about it that she started <b>teaching</b> me, it was crazy. Then... well, I’m not sure how to put it. Second puberty? No, nothing that drastic. When she hit 20, she just... grew. Shot well past my height, massive muscle and skeletal growth. I just, well, I’ll show you,”</i> he says, reaching for something in his pocket. He pulls out a thick and well-used wallet then proceeds to rummage through the business cards and pieces of plastic for a photo.");
	output("\n\nHe lays it out in his hand and encourages you to look. You lean in, a little taken aback by it. That’s clearly Mirrin and her dad, the latter of which is unchanged from the man before you save his dark suit.");
	output("\n\nBut Mirrin... she’s making a peace sign with her fingers, a big ol’ grin across both of their faces. She’s leaning on his shoulder with an oversized, golden medal hanging from her neck. That’s the side stuff: what takes you in is that she’s <i>blue</i>. Not entirely blue, just... wow. That’s her face alright with the proud nose and skeptical look but that light blue hair, that pale skin... those yellow eyes. Young Mirrin stands shoulder to shoulder with her pa, looking closer to a seasoned personal fitness trainer rather than the behemoth sitting in the other room. Her one piece gymsuit - taut and skintight as it might be - is still more modest than the accentuating outfits she wears now.");
	showImage("MirrinYoung");
	output("\n\n<i>“So you see, that was a few months before the big changes. When they happened, it was nuts. She’d be out all day, bringing home new friends all the time, training, training, training. There was so little I could do to help aside cover costs and just be a dad. Sometimes she wouldn’t be back for a month, having taken a trip to some pleasure planet or something, eugh. A dad doesn’t want to think about what his daughter does to have fun, sorry. That aggression was there, always. She’d never sit still for long. Bought new clothes every week because she outgrew them too fast and never found something that worked. I couldn’t explain it, doctors couldn’t explain it. It’s like a freak gene that went crazy. All that aside, that’s when...”</i>");
	output("\n\n<i>“Oh is that when she did the modelling thing?”</i> you chime in, picking up on where the thread was going.");
	output("\n\n<i>“Exactly, yes. You don’t go around being that big without turning heads so I guess it would’ve only made sense. She got her first contract work within the week. That then blew up in the fitness circuit. The new ‘it’ girl, unmodded and all natural, putting everyone in her size and weight class to shame with a body to match. My little skrimli became... well, big skrimli. Then the actual modding came a long,”</i> he says with a huff. With his wallet still in hand, he pulls out a small list on a piece of cut card and shows it to you.");
	output("\n\n<i>“So yes, this was the list. ‘That’ list. Very expensive. Horns, hooves, pigments, scale cultures, tail growth, uhhh, genitals... took months for the finished effect. Yet I think it needed to happen. Her little forays into zen and all that, just to calm her inner dragon. And because of all these things, she’s more successful than I was, aheh. I’m more than happy to help her. But I’m also happy that she, uhhh, she found herself. And now you. I have to thank you,”</i> he says with a blush, <i>“she smiles more now.”</i>");
	output("\n\nOh... well he didn’t have to drop all those feelings on you all at once. Not really knowing what to say or do, you simply laugh and pat him on the arm. It’s then that a device beeps.");
	output("\n\n<i>“Ahhh, helvitis, more advertising nonsense. Hate to cut it short but, ehhh... anyway. Appreciate it, also I hope uh, I helped too,”</i> he says in a fluster as he gets up to leave. You hang around for a few minutes to think about what he says before heading back to the play area.");
	output("\n\nSomewhat satisfied, you swing back to the play area and find your " + (jentaBorn() && torriBorn() ? "prodigies" : "prodigy") + " in the arms of a big red momma dragoness.");
	output("\n\nAww...");

	processTime(55+rand(6));
	flags["MIRRIN_DAD_TALKED_MIRRIN"] = 1;
	clearMenu();
	addButton(0,"Next",doneWithDragonKiddosForNow);
}

public function arkosArkossonneTalksAboutMirrinsduttirs():void
{
	clearOutput();
	showMirrinDad();
	author("SoAndSo");

	var bothKiddos:Boolean = (jentaBorn() && torriBorn());

	output("<i>“So what d’you think of the " + (bothKiddos ? "kids" : "kid") + "?”</i> you ask, looking over your shoulder to see them playing with their dragon momma. ");
	output("\n\n<i>“Ahh, what joy! Never thought I’d be a grandfather, that’s for sure. I’m not going to be on Tavros for long so seeing " + (bothKiddos ? "them" : "her") + " before the hard work comes back is a treat. And " + (bothKiddos ? "they’re" : "she’s") + " so precious! Lil’ tiny arms, little flon... I took photos and everything. My brother is going to be quite happy too, I bet.”</i>");
	output("\n\nYou smile as he talks about your " + (bothKiddos ? "kids" : "kid") + ". Damn right " + (bothKiddos ? "they’re" : "she’s") + " cute, better " + (silly ? "recognize." : "believe it."));
	output("\n\nYou both spend a lot of time talking about kids stuff, perhaps a little too much. It turns into a showreel of all the baby pictures the Mirrin’s dad has on him. One of a toddler Mirrin wearing a onesie while mimicking karate moves on TV is a special sort of cute. ");
	output("\n\nIt takes a full hour to even realize just how long you’ve been talking about it. It’s then that a device beeps.");
	output("\n\n<i>“Ahhh, helvitis, more advertising nonsense. Hate to cut it short but, ehhh... anyway. Appreciate it, also I hope uh, I helped too,”</i> he says in a fluster as he gets up to leave. You hang around for a few minutes to think about what he says before heading back to the play area.");
	output("\n\nSomewhat satisfied, you swing back to the play area and find your " + (jentaBorn() && torriBorn() ? "prodigies" : "prodigy") + " in the arms of a big red momma dragoness.");
	output("\n\nAww...");

	processTime(55+rand(6));
	flags["MIRRIN_DAD_TALKED_KIDS"] = 1;
	clearMenu();
	addButton(0,"Next",doneWithDragonKiddosForNow);
}

public function doneWithDragonKiddosForNow():void
{
	clearOutput();
	showName("\nLEAVING");
	author("SoAndSo");

	output("You signal to a passing nurse droid and she trundles over with her arms outstretched.");
	output("\n\n<i>“Done for the day, " + pc.mf("Mr.", "Ms.") + " Steele?”</i> comes her synthetic voice as she deftly takes up " + (torriBorn() ? (jentaBorn() ? "Torri and Jenta" : "Torri") : "Jenta") + " in her arms. You simply nod and give the little " + (torriBorn() && jentaBorn() ? "tykes" : "tyke") + " a kiss on the cheek, ‘awww’ing as they quickly drift off to sleep.");
	output("\n\nWell that was fun. You look forward to seeing them again.");
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}