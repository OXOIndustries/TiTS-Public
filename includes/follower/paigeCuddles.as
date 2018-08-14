/* THIS IS PAIGE AND SHE GETS CUDDLED AND B WROTE THIS AND IF YOU WANNA ASK ABOUT THE CODE GET lighterfluid ON DISCORD K THX
 * THINGS TO FIX: 
 * flags
 * PAIGE_SLEEPVITED
 * -invited paige to your bed (to sleep!)
 * SHIT TO FIX
*/

public function paigeRegardingTheBed(noMoreBedPaige:Boolean = true):void
{
	clearMenu();
	clearOutput();
	showPaige();
	processTime(5);

	if (noMoreBedPaige)
	{
		flags["CREWMEMBER_SLEEP_WITH"] = undefined;
		output("With some reluctance, you tell Paige that, when it comes to hot-bunking with each other, you two need to return to a more professional distance, and that she should go back to sleeping in her own bunk for the time being.");
		output("\n\n<i>“Aw, dang,”</i> she says, and although the disappointment is real in her voice, you can tell that she isn’t exactly too beat up about your call. <i>“I’m not going to try and argue with you, captain, so I guess it was fun while it lasted. Let me know if you ever change your mind, though; it’s not like I’m going anywhere.”</i>");
	}
	else if (flags["PAIGE_SLEEPVITED"] == undefined)
	{
		flags["PAIGE_SLEEPVITED"] = 1;
		flags["CREWMEMBER_SLEEP_WITH"] = "PAIGE";
		output("You look around Paige’s quarters and see how she has the place set up. She has a little desk with two chairs; a monitor that connects directly to Iddi, along with whatever programming a monitor can receive in these fringe areas of the universe; some books; and a bed that’s half as big as yours and probably not as comfy.");
		output("\n\nYou try and keep your expression as straight-laced as you can when you ask Paige if she’d like to spend the nights with you.");
		output("\n\n<i>“Do we not do that already?");
		if (crew(true) > 1) output(" You, me, and whoever else on the crew is okay with sharing?");
		output("”</i> she asks, not initially understanding your meaning. You explain more clearly that, while you’re the captain of the ship and that affords you some privileges, your bed can comfortably hold two, and that you’d like someone to hold when you sleep in it at night.");
		output("\n\n<i>“My goodness, that’s an</i> adorable <i>way to phrase it,”</i> she giggles. <i>“But hey,”</i> she continues, outstretching her hand for you to hold and with a warm smile on her face, <i>“I’d love to be your teddy for you to hold at night.”</i>");
		output("\n\nYou squeeze her hand affectionately. <i>“Two questions, though,”</i> she continues, <i>“first, am I still calling you ‘captain’ when we’re snug under the rugs? Or can I call you [pc.name]?”</i>");
		output("\n\nYou tell her that you’re okay with her calling you by your name. <i>“And second, is this</i> really <i>all about us holding each other like teddies? Or are you just trying to ask for a lay and you’re taking a weirdly roundabout way to it?”</i>");
		output("\n\nGrinning yourself, you answer by saying that you’ll let the night decide how you’re both feeling.");
		output("\n\n<i>“Okay, sweet thing,”</i> she says, blowing you a kiss and releasing your hand. <i>“I’ll see you tonight, then.”</i> ");
	}
	else
	{
		flags["CREWMEMBER_SLEEP_WITH"] = "PAIGE";
		output("You eye Paige’s bed. It’s clean and tidy, but the sheets look a little stiff, and the mattress doesn’t look any softer. Your bed is twice as large as her own, and you’re sure it’s quite a bit comfier. You tell Paige that if she wants to start sleeping with you again, the bed is open.");
		output("\n\n<i>“Gods, I was kind of hoping you’d ask,”</i> she says, laughing a bit. <i>“I love travelling with you and all, captain, but these bunks you’ve got leave a little something to be desired, at least compared to my bed back on Tavros.”</i>");
		output("\n\nShe continues before you can interject. <i>“And, of course, I’d love to spend the night cuddling with my favorite captain in the universe,”</i> she says, throwing her arms loosely around your shoulders and giving you a quick peck on the [pc.lipsChaste]. <i>“I’ll be seeing you tonight, sweet thing.”</i>");
	}
	
	paigeMenu();
}

//useful later
public function paigeJumpToSexFlowchart(args:Array):void
{
	IncrementFlag("SEXED_PAIGE");
	if (pc.hasCock())
	{
		addButton(0,"Be Bottom",SSVBB,args);
		addButton(1,"Be Top",SSVBT,args);
	}
	else
	{
		args.push("SSTI");
		if(pc.isNaga()) addButton(0,"Hip Thrust",SSTUT,args,"Hip Thrust","It’s not about who can fuck whom any ‘better;’ just get down to it and start humping, already!")
		else addButton(0,"Use Thigh",SSTUT,args,"Use Thigh","It’s not about who can fuck whom any ‘better;’ just get down to it and start humping, already!");
		addButton(1,"Use Fingers",SSTUF,args,"Use Fingers","What better way to assert yourself by shoving your fingers up Paige’s cooch? Of course, she’ll probably accept your challenge....");
	}
}

public function paigePostCuddles(args:Array):Boolean
{
	if (InCollection("PCSE3", args)
		|| InCollection("PCSE4", args)
		|| InCollection("PCSES", args))
	{		
		flags["PAIGE_WAKEY_FLAGS"] = args.concat();
		sleep(false);
		return true;
	}
	return false;
}

//PCSI
public function paigeSleepNodeOne():void
{
	clearMenu();
	clearOutput();
	showPaige(true);
	processTime(5);
	
	//Just in case the wake-up scene gets overriden or something
	flags["PAIGE_WAKEY_FLAGS"] = undefined;
	
	output("After another hard day’s work, you plop onto the bed and reach for the edge of the covers to pull them back. Just as you make ready to slip beneath the sheets, though, you hear a knock on the door to your quarters.");
	output("\n\nYou answer the door, and there’s Paige, right on time. She’s dressed in her casual, post-yoga outfit: a plain, sleeveless jumper-vest for a top, and grey sweatpants for bottoms. She has a pillow stuffed underneath her right armpit.");
	output("\n\n<i>“Uh, hi,”</i> she says sheepishly, rocking on her toes. You remember that you had asked Paige to join you in your bed for the night, and you invite her into your quarters.");
	output("\n\nWhile your personal quarters a slightly larger and more lavish than your crew’s, that’s ultimately not saying much: your room isn’t much more decorated than Paige’s, although your bed, like you had surmised, is a bit more than what she’s become accustomed to since she joined you.");
	output("\n\n<i>“Long day?”</i> Paige asks, mostly to make small talk as she approaches the right side of the bed. You reply positively, and say that you were just about to wrap it up when she came knocking.");
	output("\n\nPaige, after placing her own pillow on what she has apparently staked as her side of the bed, casually, and with some grace and flourish, removes her jumper vest, freeing her bare C-cup breasts to the air of your room. They aren’t anything you haven’t seen before, but you can’t help but ogle Paige’s form: from her boobs, to the tight-and-defined abs of her belly. And when she hooks her thumbs underneath the waistband of her pants, you know you’re about to see more.");
	if (pc.hasUpperGarment() || pc.hasLowerGarment())
	{
		output("\n\nNormally, you sleep in your");
		if(pc.hasUpperGarment()) output(" " + pc.upperUndergarment.longName);
		if(pc.hasUpperGarment() && pc.hasLowerGarment()) output(" and");
		if(pc.hasLowerGarment()) output(" " + pc.lowerUndergarment.longName);
		output(" – it’s easier and less hassle than it is to take everything off and put it all back on, at least, you think. But, given that Paige is about to get naked with you in your bed, you decide, it’d be rude if you didn’t return the favor. You strip naked and take your position on the other side of the bed.");
	}
	output("\n\n<i>“Let’s get some shut-eye, [pc.name],”</i> Paige invites as she flexes the waistband of her pants, letting them fall and pool around her ankles. You’re treated to the side of her mostly-naked body: starting from her abs, you drink in the sight of her tight, yoga-tuned legs and hips, holding up a flimsy, plain-white set of panties keeping what little modesty she had hidden. In a way, you’re disappointed when those don’t also fall away.");
	output("\n\n<i>“Come on,”</i> she says, her brilliant blue eyes on you as she pulls the covers on your bed back with a single, wide swing of her arms. She has a warm smile, the kind a lover gives their better-half, on her face as she pats the bed. <i>“The day’s finally over. Let’s just wrap each other around each other and call it in. We don’t have to do any more than that tonight, if you don’t want.”</i>");
	output("\n\nWith the flick of a switch, the room is dark, save for a set of low-power, low-frequency lights trailing from the bed to the door of your quarters. It’s more than dark enough to sleep if you wanted, but if you let your eyes adjust, you could find your way around the room, albeit with some difficulty.");
	output("\n\nYou get into your bed with Paige, letting your head hit the pillow with a low ‘fwump.’ Paige joins you, mimicking your action almost motion-for-motion; you both reach for the same spot on the sheets, your hand accidentally gripping onto Paige’s, and you both whip the sheets back over you both.");
	output("\n\nShe sighs deeply, her voice coming out as a light hum, as her torso presses against yours and her arms and legs drape around your body. You shuffle yourself a little closer to her, trying to get yourself more comfortable, and she does the same to you.");
	output("\n\nYour own arms and [pc.legs] intermingle with hers, until you’re good and properly entangled in each other. You’re face-to-face, torso-to-torso, and nearly crotch-to-crotch, but neither of you have any particular designs on making this cuddle session any more intense than that.");
	output("\n\nOf course... as your hand holds at her muscular back, then travels to her lower back, where her tail meets her spine... you could <i>introduce</i> some ‘variables’ into your snuggling, if you wanted.");

	addButton(0, "Sleep", paigeSleepForRealsies, undefined, "Sleep", "Select this if you’re not interested in games and just want to catch some shut-eye.");
	addButton(1, "Boop Nose", paigeBoopBoop);
	addButton(2, "Pinch Thigh", paigeDemThighs);
}

//No Fun Allowed
public function paigeSleepForRealsies():void
{
	clearMenu();
	clearOutput();
	showPaige(true);
	
	output("You wish Paige a good night.");
	output("\n\n<i>“Good night,”</i> Paige says back, as her head leans towards yours. She rests her chin on the crook of your neck, and goes to sleep.");
	output("\n\nIt’s not long that you follow suit.");
	
	sleep(false);
}

//PCSNB or PCSBN
public function paigeBoopBoop():void
{
	clearMenu();
	clearOutput();
	showPaige(true);
	processTime(5);
	
	output("<i>“Hey, Paige,”</i> you say, gently, but loudly enough to let her know that this is more than just a ‘good night.’");
	output("\n\n<i>“Yeah?”</i> she replies, her eyes open and on yours. The room’s light is very dim, but you can still see what little light there is reflect off her eyes.");
	output("\n\nYou say nothing for a moment, keeping her in suspense. You just watch each other for a time, admiring each other’s features without saying or doing anything to break the mood – and then, of course, you do exactly that: you lean forward slightly, and you touch your nose to hers. <i>“Boop!”</i> you loudly exclaim once your nose taps hers.");
	output("\n\n<i>“Nooooo!”</i> she wails, thrashing her limbs beneath the sheets of your bed in mock dismay, <i>“my nose has been booped! Gosh hecking darn it!”</i>");
	output("\n\nIn retaliation, her limbs tighten around yours, clutching you tighter to her body so that you can’t get away. <i>“This can’t go unpunished!”</i> she says, her tone angry, yet she can’t mask the occasional giggle. <i>“Prepare for some mutually-assured boopage, " + pc.mf("mister", "miss") + "!”</i>");
	output("\n\nShe closes the gap between you and meshes her wet ausar nose against yours, saying ‘boop!’ as she does so. But she doesn’t stop: she continues assaulting you, rubbing her nose back and forth against yours, sometimes pulling back just to press forward once more. She resists the urge to giggle every time she says the word ‘boop,’ and outwardly laughs whenever you return the assault with each ‘boop’ of your own.");
	output("\n\nYou run your fingers through the coarse hairs of her fur, feeling along her strong upper-back and her shoulders, keeping her clamped to your own body. Eventually, the booping assault slowly winds down into gentle, closed-mouth kisses along each other’s jawlines and cheeks – though, to establish dominance, you’re sure to kiss her on the nose at <i>least</i> once more for every time she kisses yours.");
	output("\n\nOver time, you’ve sunk into each other, and into the mattress of your bed, calming down from the war between you two. Paige still ‘hee!’s to herself as she leans into you, her neck resting on the crook of your own, while you two enjoy each other’s presence.");
	output("\n\nThere has never been a better time to capitalize on her vulnerability! Do you go in for the kill, or do you call this one a draw?");
	 
	addButton(0, "Hold Her", paigeHoldOn);
	addButton(1, "Tickle", paigeTickleTime);
}

//PCSPT
public function paigeDemThighs():void
{
	clearMenu();
	clearOutput();
	showPaige(true);
	processTime(5);
	
	output("The hand at Paige’s back splays its fingers, and you run her fur between them, enjoying how she keeps it all so short, sturdy, and orderly. You admire the thick, strong muscles at her upper back, and you trace their contours down her spine, mapping them out in your mind. It’s crazy to think that just a bit of yoga can do this to a body – although, of course, that’s selling Paige short. It certainly wasn’t a ‘bit’ of yoga.");
	output("\n\nPaige sighs in delight, leaning her body against yours as you feel along her back, making your way down to her lower-back. She says nothing and doesn’t tense: she’s comfortable being so vulnerable around you, and, in some part of your mind (and, you’re sure, in hers), you kind of expected that tonight might get a little touchy-feely, whether you started it or not.");
	output("\n\nYou detour your hand just as you get to her tail, knowing that that’s an erogenous zone for her, and it would escalate the mood pretty quickly if you started fondling around there. You withdraw slightly, dancing your digits over the hem of her thick, powerful thigh; the fur is equally thick-though-short, and her muscles, as big as they are, don’t yield to your touch.");
	output("\n\nYou decide to stress-test the tautness of her thigh by opening your thumb and index finger and fitting a chunk of her leg between them, giving it a pinch.");
	output("\n\n<i>“Hmm,”</i> Paige hums in delight, <i>“I was wondering if we were going to get to the meat-and-potatoes tonight.”</i> Her voice is sultry, but you wouldn’t call it ‘lustful’ – it’s more that she’s intrigued by your motions and that she’s curious where you’re going to take yourself.");
	output("\n\nWithout opening your fingers, you slide them down the thick of her thigh, towards her knee, until your elbow is straightened, then you start on your way back up from there. When her muscles predictably don’t yield or budge, you open your hand, rubbing the flat of your palm against her leg and massaging along her thick leg evenly, admiring how she maintains herself.");
	output("\n\nPaige, for her part, hasn’t been idle, either: once you started being more bold and brazen with your cuddling, her hands wrap and cross against your torso, doing the same thing to you as you had to her: massaging and prodding at your muscles, admiring the way you keep yourself. Her legs wrap tightly around your [pc.lowerBody], locking at the ankle behind your [pc.ass], keeping you trapped against her.");
	output("\n\n<i>“Hey,”</i> she says, blowing into your ear gently for your attention. <i>“Grab my ass, would you? I love it when people admire my hard work. Just go ahead and cop a good feel for me.”</i>");
	output("\n\nAnd who would you be to turn down an invitation like that? Still, that said, you could probably do more than just ‘grab’ it.");

	addButton(0, "Caress", paigeCaressDatAss);
	addButton(1, "Grab Her Ass", paigeGrabDatAss);
}

//PCSHH
public function paigeHoldOn():void
{
	clearMenu();
	clearOutput();
	showPaige(true);
	processTime(5);
	
	output("You decide to put an end to this silly debacle between you. It isn’t about who is more boopable or who is the boopinest between you. It’s about holding your ausar woman in your arms in your bed and embracing her, sharing the warmth between you. Booping is neither here nor there, in the grand scheme of things.");
	output("\n\nYou two hold each other, keeping your limbs tight around one-another, but not so hard as to be difficult or constraining. Once the giggles and laughter have calmed from Paige’s lungs, her breathing settles into a gentle, familiar pattern, one you can’t help but subconsciously match: in through the nose; hold for a second or two; then back out.");
	output("\n\nEach inhale gives you a good lungful of her scent, and you know the same is happening with her. You fret over the littlest, most inconsequential things – do you smell bad? Is it going to be your <i>scent</i> that imprints on her, or will it be your <i>stink</i>? You feel her hands shift across your back. Do you have zits on your back that you aren’t aware of, and what if she finds one? Gods, you’re breathing against her ear – is that annoying her? What about your breath, does <i>it</i> smell bad?");
	output("\n\nPaige’s body shifts, pulling away from you just enough so she can crook her head down, pressing her other ear against your chest. You’re more acutely aware than ever of your own heartbeat as it thump-thump-thump against your ribs; your every beat pulses throughout your body, practically bouncing Paige off of you.");
	output("\n\nAnd although you can’t hear it from where you are, you can feel Paige’s own heart against your body, particularly your arms and hands as they clamp against Paige’s back. You’re a bit off-sync with each other – hers is beating slower than yours, which you attribute to her yoga giving her a lower resting beat-per-minute – but that just makes you cherish the few seconds when your heartbeat and hers line up just perfectly.");
	output("\n\nWith a discerning hum, Paige pulls back, straightening her neck a bit. <i>“Hey, [pc.name],”</i> she says, nudging you with her nose to get your attention. When you open your eyes, you see her own, narrowed and focused on yours.");
	output("\n\n<i>“Tell me you love me,”</i> she implores. She doesn’t hesitate with the statement, but she does with the follow-up, stuttering for a second before catching her own tongue. <i>“I mean, I don’t</i> need <i>to hear it. But I want to hear it. Or... for you to show me, or something. Sometimes, a girl just wants to</i> know, <i>you know?”</i>");
	output("\n\nHow will you express yourself to Paige?");

	addButton(0, "Tell Her", paigeUWuvHer);
	addButton(1, "Kiss Her", paigeKissHerYouFool);
}

//PCST
public function paigeTickleTime():void
{
	clearMenu();
	clearOutput();
	showPaige(true);
	processTime(5);
	
	output("The opportunity is too tantalizing to pass up!");
	output("\n\nYou pull Paige closer to you, acting like you’re just keeping her close to allow for prime snuggling action. Paige, not sensing your ill-intent, sinks into you with a final, calming giggle, resting her chin on the crook of your neck. She suspects nothing when your hands gently run through the thick of her fur, towards the small of her back and against her love-handles.");
	output("\n\nYour strikes are swift and ferocious: your fingers crook and massage asymmetrically, worming against her sensitive spots and stimulating them with your quick, gentle pushes and prods.");
	output("\n\n<i>“Wait, no–!”</i> Paige tries to say when she realizes what you’re doing, but she’s far too late, and she’s powerless to resist as you tickle her relentlessly, reaching as high up as the underside of her ribs and as far down as her thighs. She can do nothing but laugh and try desperately to retain some form of upper-hand in this exchange, even as her limbs lose their strength in her laughter.");
	output("\n\n<i>“Stop, quit it!”</i> she chokes out through her laughs. You ignore her and push her onto her back so you have an easier angle of attack at her stomach; you tickle her in between her abs, dipping down to the V of her pelvis before rising back up to just beneath the swell of her breasts. You’re so familiar with her body at this point that you don’t need the light to see, not that it would have helped, with you both being beneath the sheets of your bed.");
	output("\n\nPaige laughs, giggles, guffaws, and sometimes snorts at your assault. Her hands weakly grip and push on you, trying to fight you off, but she has no strength in her arms. It’s relatively easy for you to flip her back over: when your fingers reach her sides, she reflexively lifts them away from your fingers, and with just a couple insistent pushes, she’s on her stomach, for you to resume.");
	output("\n\n<i>“Okay, you win!”</i> she admits through her laughs. Her nose sniffles a bit; you can probably guess that tears of laughter are matting her face and your pillow. <i>“I give, [pc.name]! No more, I surrender!”</i>");
	output("\n\nIt was all you needed to hear. You cease your attack immediately, and flatten your palms against her body, soothingly rubbing at each spot you had attacked in succession. You can feel her skin spasm beneath your touch, still overloaded with your ticklish sensations, and her fur is still standing on its bristly ends, poking against your [pc.skinFurScales].");
	output("\n\n<i>“Ahhhh,”</i> Paige sighs as you massage her, working your hands from her lower back, to her love-handles, to the underside of her ribs, exactly where you had tickled her. You’re careful not to resume your offense, and your touches are gentle as a lover’s should be.");
	output("\n\nBy the end of it, your hands have found their way back around to Paige’s front, rubbing at her stomach. She can’t help but laugh occasionally, still coming down from her tickling high. She doesn’t resist when you pull on her, to bring her back to you and press her back against your front. Instead, she exhales once and pushes against you, her butt against your [pc.crotch] and her shoulders pressing into your [pc.chest].");
	output("\n\nAs tired as you both are after a long, hard day, you can tell that you’re both still pretty awake after all that. You wonder to yourself: is it worth to keep the playing up, and maybe see if Paige is willing to take it somewhere a little more... <i>exciting</i>? Or do you simply lie there and spoon with your ausar lover, and try to wind down from the tickle attack and get some well-deserved shut-eye?");
	
	addButton(0, "Spoon", paigeForkIMeanSpoonHer);
	addButton(1, "Roll Over", paigeDoABarrelRoll);
}

//PCSC
public function paigeCaressDatAss():void
{
	clearMenu();
	clearOutput();
	showPaige(true);
	processTime(5);

	output("You tell Paige that you can’t just ‘grab’ a woman’s ass, especially not one as fine as hers.");
	output("\n\nYou demonstrate by softly rolling your hands, palms down, grip firm but not tight, across each of her furry cheeks; you tell her that a booty this rare needs to be <i>appreciated,</i> and <i>savoured</i>, like a fine, aged wine.");
	output("\n\n<i>“You calling my ass old?”</i> she jokes, pushing her lower end out and into your hands. You tell her that, if you’re calling her ass anything, it’s ‘venerable.’ Wine needs to age years and years before it can be truly appreciated, and you consider yourself very lucky to have a woman as... genetically gifted as Paige in your bed while you’re both still young and spry.");
	output("\n\nPaige hums, melting into you at your words, loving every single thing you tell her. You heft her butt, loving how taut, tight, and, well, <i>powerful</i> her glutes feel in your hands, and you tell her as much. The effort she had put into her body is apparent");
	if (pc.PQ() < 75) output(" and enviable. You should do more yoga with her, if it means having a body as impeccable as hers.");
	else output("; you can only hope your own ass can one day stand in the shadow of hers with some pride someday.");
	output("\n\n<i>“Can I tell you something?”</i> she says lowly. You tell her, with all sincerity, that she can tell you anything. You’re very good at keeping secrets, especially for her. <i>“I love having an ass this nice.”</i> She wriggles her hips, and you keep your hands still, as her butt flexes and shifts in your grip. Your fingers cross the threshold of her butt’s cleavage with every particularly-wide wiggle. <i>“Every time I bend down and touch my toes in class... I love it when people ogle it and stare. I know they do, because my ass gets all hot when it knows it’s being admired.”</i>");
	output("\n\nShe tilts her nose up, lining her mouth against your ear, to sultrily whisper into it. <i>“I have this fantasy,”</i> she says, her breath coming out sharply and warm. <i>“That, when I’m all exposed like that, someone gets their fingers into my yoga pants... gives ‘em a nice, hard yank... tears ‘em open... and then");
	if (pc.hasCock()) output(" fucks me like a feral, dumb animal");
	else output(" eats me out like a thirsty, five-credit whore");
	output(", right there in class.”</i>");
	output("\n\nYou ask the first, most obvious question: would she be against it if someone did that? <i>“Oh, absolutely,”</i> she laughs, causing her buttcheeks to jiggle slightly in your hands. <i>“Could you imagine the scandal? I’d lose my license to teach in a hot second!”</i> She resumes her earlier sultry whispers. <i>“But that doesn’t mean I don’t want it. We’ll always want what we can’t have.”</i>");
	output("\n\nThat last bit, about not getting what you want, sounds like a challenge to you. There’s one of the universe’s greatest asses in your hands <i>right now</i> - you could certainly get a little more handsy if you wanted. Or, alternatively, you could play along with her fantasy and try to rile her up: there’s definitely one or two things you could add to her imagery that would make it much hotter.");
		
	addButton(0, "Fantasize", paigeWonderBoutShagging);
	addButton(1, "Take Her", paigeJustShagAlreadyJeez);
}

//PCSGHA
public function paigeGrabDatAss():void
{
	clearMenu();
	clearOutput();
	showPaige(true);
	processTime(5);

	output("When a woman with a tight body gets naked with you, gets in the same bed as you, and tells you to grab her ass, you don’t ask questions and you don’t play coy.");
	if (silly) output(" You play those luscious cheeks like a pair of bongos.");
	else output(" You grab those tight ass cheeks like they’re stress balls and you just put a million credits on a losing taur.");
	output("\n\nWith Paige’s invitation, you reach down without any preamble or hesitation, and you greedily clamp your hands on her butt. You feel her body tense and flex against you when your hands meet the smooth, fine fur of her rear end; your fingers pinch down and you massage her witlessly, working your thumbs along the broad meat of her ass, getting as much as you can in a single, hearty grope.");
	output("\n\n<i>“Yeah, that’s it,”</i> she implores, thrusting her rear end into your hands and encouraging you to really get two, thick handfuls. <i>“I’ve put a lot of effort into an ass like that, [pc.name]. Show me how much you like it.”</i>");
	output("\n\nNot that she needed to ask, but you keep going. She wraps her legs around your [pc.belly], and pulls herself closer to you, her crotch against your own. Every time you pull and lift on her ass, she slides just a little closer into you; she makes no effort to hide or mask her grinding into your [pc.crotch], looking for a reaction. You breath hotly against her ear, and she giggles, almost sweetly, to herself, knowing that she’s on the right track.");
	output("\n\n<i>“It makes me feel so...</i> powerful, <i>having a booty like this,”</i> she admits, whispering into your ear and hotly blowing on your neck as you manhandle her. <i>“I love it when I take a pose in class, and suddenly, the room gets all quiet. I know they’re all staring. It makes me feel like I’m in control of the room. It makes me feel like I’m in control of</i> you.<i>”</i>");
	output("\n\nYou play along with her fantasy and ask her to give you another command. What would she have her cuddle-toy do next?");
	output("\n\nShe hums deviously at your suggestion, and she chews her bottom lip in thought. Her thighs clench around your body, squeezing and grinding herself against you. <i>“Talk like that a bit more, [pc.name], and we’ll be doing a bit more than cuddling tonight,”</i> she cautions. <i>“But I get the feeling that you’re okay with that.”</i>");
	output("\n\nYou reiterate that you’re available to do whatever she wants. Of course, you don’t stop your ministrations on her ass: you don’t dare stop your groping and massaging those powerful cheeks, surrendering yourself to their power.");
	output("\n\n<i>“Well, I think I’ll leave that up to you, [pc.name],”</i> she says, her long, flat ausar tongue snaking out and licking across your [pc.lips]. <i>“I don’t know about you, but the longer, ooohhhh, that you keep this up, the less tired I’m getting. If you have any thoughts, I’m all ears, but if not....”</i>");
	output("\n\nAs a matter of fact, the first thing that comes to mind is–");
		
	addButton(0, "Let Her Lead", paigeTakesPoint);
	addButton(1, "Second Base", paigeAboutToGetFucked);
}

//PCSTH
public function paigeUWuvHer():void
{
	clearMenu();
	clearOutput();
	showPaige(true);
	processTime(5);
	
	output("Paige wants to know what she means to you. That sounds like a pretty simple no-brainer to you: the words come easily and naturally.");
	output("\n\n<i>“Paige,”</i> you say, placing your hand beneath her chin and angling her gaze upward, towards yours. You can’t make out the details of her face in the dim light of your quarters, but you can see the gleam of the room’s emergency lighting in her eyes. She’s completely focused on you and your next move – her breath is held and her heartbeat is going a mile a minute.");
	output("\n\n<i>“I love you,”</i> you say, cutting the tension with the phrase she had wanted you to say.");
	output("\n\nShe makes a few movements, but they’re all so slight that you wouldn’t have been able to tell if her body wasn’t currently wrapped around yours. She takes a sharp inward breath. Her hands tense on your back. Her arms and head shake, ever so slightly.");
	output("\n\nHer head lowers and she lays the crook of her chin against your neck. She’s tense, and you don’t think she realizes it. Her limbs wrap tighter around you, holding you closer to her; you can feel her heart press into you with each of its excited heartbeats. After a time, she remembers to exhale.");
	output("\n\n<i>“I love you too, [pc.name],”</i> she whispers into your ear.");
	output("\n\nYou think of a myriad of other things you could tell her. Like, when you first realized that you loved her, or if there’s more you could do for her. But every time you think you have a sentence formed in your mouth, it falls apart when another part of your mind reasons that you’ve said everything you could possibly say, and that adding to it would break the immersion she has into you.");
	output("\n\nJudging from the way her breath sporadically holds in her lungs, and the way you can feel her jaw move as she mouths silent words to herself, you get the feeling that she’s doing the exact same thing, and coming to the exact same conclusion.");
	output("\n\nThere’s nothing more to be said or done tonight. You have Paige in your arms, holding her tightly to your body in the warmth of your bed, in the security of your ship, and in the comfort and darkness of your quarters. You close your eyes. Sleep comes quickly and smoothly.");
	
	flags["PAIGE_WAKEY_FLAGS"] = ["PCSTH"];
	sleep(false);
}

//PCSKH
public function paigeKissHerYouFool():void
{
	clearMenu();
	clearOutput();
	showPaige(true);
	processTime(5);
	
	output("It’s easy to say that words are cheap. But the three, itty-bitty little words that Paige wants you to say... they simultaneously carry a ton of power behind them, and at the same time, they simply aren’t enough.");
	output("\n\nYou place your hand beneath Paige’s chin, tilting her gaze upward, towards yours. Her breath catches in her throat, and you can see the gleam of the room’s emergency lighting in her eyes. You can’t make out the finer details of her face in this light, but you can feel her heartbeat through her body, and you can see her lips quiver in nervousness. Hopefully you’re making the right move.");
	output("\n\nYou lean in the few millimetres separating you, and you press your [pc.lipsChaste] to hers. You try and visualize how you want your lips to feel as you kiss her, and the first thing you think of is the velvety-soft feel of a rose’s petals. You try to mimic that texture: not too hard, and not too insistent–");
	output("\n\nPaige leans into you, tilting her head to one side, as her lips move in sync with yours, kissing you back, and you realize that you’re overthinking it. There is no ‘secret’ or ‘technique’ to kissing your lover (at least, not when you aren’t trying to be sexy) – everything Paige needs to be shown or told is right there, on your lips, pressing against hers. You’re pouring your heart and feelings into this kiss, whether you realize it or not, and she’s matching your soul by the action.");
	output("\n\nThe two of you pull away amicably, a light ‘pop’ separating you as you pull apart. There isn’t anything left to be said or done between the both of you: Paige has gotten everything she had asked from you, just like that, and she couldn’t be more satisfied. With a light, airy, contented sigh, her limbs cling tighter to you and she rests her head against the crook of your neck.");
	output("\n\nYou stroke at her back. Some parts of your head worry that you had somehow made the wrong move, or that you hadn’t done enough to show your feelings for her. But, if Paige weren’t a happy, satisfied woman, you doubt she’d be here, in your bed, and kissing you like you meant the universe to her. Clearly, you’re doing something right.");
	output("\n\nYou sigh once yourself, and let your eyes drift closed. Sleep comes to you quickly and smoothly, your breathing unconsciously syncing with hers.");

	flags["PAIGE_WAKEY_FLAGS"] = ["PCSKH"];
	sleep(false);
}

//PCSS
public function paigeForkIMeanSpoonHer():void
{
	clearMenu();
	clearOutput();
	showPaige(true);
	processTime(5);
	
	output("That’s enough for one night: it’s been a long, exhausting day, and you’ve established your dominance by booping and tickling Paige into submission in your own bed. No need to spice the night up any more than it is.");
	output("\n\nYou rest your chin against Paige’s shoulder, relaxing your breath as you calm down from the attack. Your fingers still feel a little jittery, like they want to keep going, so you busy them: you lightly scratch and feel at Paige’s impressive stomach, admiring the way you can count her crunched, taut abdominals with only your fingertips. And when you’ve covered as much surface area as they can, you shift your hands, one going higher, beneath the swell of her breasts, and the other going lower, to the bridge of her pelvis.");
	output("\n\nPaige murmurs no words in particular and she melds into you, drawing out one, lazy, contented hum as she does so. Her right hand reaches up, over her shoulder, towards your cheek; she lightly caresses it, rubbing at your [pc.face], while she angles her own face to nuzzle into yours from the other side.");
	output("\n\n<i>“I love you, [pc.name],”</i> she says suddenly. Your motions, including your breath, stutter at the declaration – those three little words carry a ton of weight to them, and you’re somewhat surprised (and, at the same time, not really) that Paige would just whip them out like that. <i>“You’re so good to me.”</i>");
	output("\n\nIt would be rude, and somewhat heartless, of you to not say <i>something</i> in response to that. You lean over her and bring your [pc.lipsChaste] to her neck, lightly kissing at it and relishing in the soft moan you illicit from her.");
	output("\n\n<i>“I love you too, Paige,”</i> you reply. Despite the strength behind those words, you find them to be easier and more natural to say than you had expected – maybe Paige felt the same way, given how easily she said them.");
	output("\n\nThere’s nothing more that needs to be said or done between you two. You’ve had your fun, between the boop war and the tickle attack: there’s nothing left for you in this bed than to hold your lover close to you and shut your eyes.");
	output("\n\nSubconsciously, your breathing evens out and syncs with Paige’s, as sleep takes you quickly and smoothly.");

	flags["PAIGE_WAKEY_FLAGS"] = ["PCSS"];
	sleep(false);
}

//PCSRO
public function paigeDoABarrelRoll():void
{
	clearMenu();
	clearOutput();
	showPaige(true);
	processTime(5);
	pc.lust(30);
	
	output("Paige has made the mistake of ceding the control over the bed to you. That said, you aren’t a cruel bedmaster, but you <i>do</i> have one more thing you want to do with Paige before you call it a night.");
	output("\n\nYour grip on her body shifts, wrapping your forearms around her belly and your [pc.legs] around her own, locking her to you. With a heave, you roll to your right side, putting yourself on your back, and with Paige on top of you, her back to you. She doesn’t stop her girlish giggling the entire time, and once you’re settled on your back, she excitedly disengages and rolls herself over, until she’s face-to-face with you.");
	output("\n\n<i>“Gods, but do you know how to show a girl a good time in the sack,”</i> she giggles, enjoying her own double-entendre. You tell her that you try.");
	output("\n\nPaige ‘mmmm’s in response as she puts her head down, her ear against your chest. Her right hand rubs gentle circles on your torso, as high up as your shoulder and as low down as your pelvis; her legs lay spread across your " + (pc.hasLegs() ? "own" : "[pc.legs]") + ", her clothed crotch pressed onto yours");
	if (pc.hasCock()) output(", laying her body against your currently-flaccid [pc.cock].");
	else if (pc.hasVagina()) output(", her cooch laying atop your currently-unaroused [pc.vagina].");
	else output(", grinding itself against the blank slate that is your pelvis.");
	output("\n\nPlayfully, Paige’s left hand walks its way up your body, her index and middle fingers imitating a pair of legs as they traverse your [pc.belly] up to your [pc.chest]. Without any forewarning, her fingers find your");
	if (pc.breastRows.length > 1) output(" topmost");
	output(" [pc.nipple]; she gives it a press and a flick");
	if (pc.biggestTitSize() > 2) output(", watching your titflesh jiggle at the stimulation");
	output(". You coo in mock-arousal, knowing what response she was looking for.");
	output("\n\n<i>“Mmm, [pc.name]?”</i> she begins, not bothering to turn her head back up to look at you. You say nothing, awaiting her next words. <i>“Tonight doesn’t have to end with some snugglin’, if you don’t want.”</i>");
	output("\n\nKnowing full-well what she means, you ask her to go on.");
	output("\n\n<i>“I’m saying, if you want to show me an even</i> better <i>time in bed... I mean, the only thing I’m wearing right now are some panties. I wouldn’t miss them if you wanted to cap tonight off with... a bang.”</i>");
	output("\n\nYou feel the familiar tingle in your [pc.crotch] as she spurs on your arousal. You aren’t horny <i>yet,</i> but that can change in a hurry if you wanted. But, on the other hand, Paige is giving you the option to back out, and you doubt she’d hold it against you if you said you wanted to save it until morning. Hell, the sex might even be <i>better</i> if you put it off until then.");

	addButton(0, "Sex", paigeWhyNotShag, ["PCSRO"]);
	addButton(1, "Sleep", paigeINeedMyEightHoursBish, ["PCSRO"]);
}

//PCSF
public function paigeWonderBoutShagging():void
{
	clearMenu();
	clearOutput();
	showPaige(true);
	processTime(5);
	pc.lust(30);
	
	output("You tell her that that sounds like a really kinky fantasy, and you ask her which part of it is the sexiest for her.");
	output("\n\nPaige hums gently, her head rocking from side to side as she thinks about it. <i>“I wanna say... it’s the part where I’m so irresistible that someone would lose all control of themselves and... dig themselves into my pants and have me, right there in the classroom.”</i>");
	output("\n\nYour hand rubs slow, sensual circles on the fat of her asscheek as she explains. Her tone is whimsical, like she’s already dreaming, and her hips quake and lean into your hand with your every pass.");
	output("\n\nYou egg her on. You tell her to imagine it: she’s on a yoga mat, in the center of the room, surrounded by her classmates. She starts doing some warm-up stretches, and she bends over and touches her toes–");
	output("\n\nAs you speak, your hand travels down her thigh, starting at her knees, and then it makes its way back up, towards her butt. You continue the fantasy by saying that, suddenly, she feels a hand clap onto her ass, loud enough to echo off the walls. And, to add to the imagery, you launch your hand onto her butt, giving yourself a nice, huge grope on the taut, muscly buttock.");
	output("\n\nPaige moans in sexual delight as she listens along. You continue the fantasy: her mystery assailant <i>rips</i> into her stretched-thin yoga pants. Accentuating your story, you rake your nails across the fine fur of her butt. You say that there’s suddenly a nose in between her cheeks, and a tongue across her pussy.");
	output("\n\nOne of your fingers daringly dips further in, teasing at the quim of her vagina. Paige tenses in pleasure, and she chews on her bottom lip in barely-restrained pleasure. Someone else in her class gets emboldened, seeing you bent over and being taken advantage of.");
	if (pc.hasCock()) output(" They have their thick, nine-inch dick in front of you, hard as could be, leaking their pre, needing some lip-service from their favorite yogi.");
	else if (pc.hasVagina()) (" They have their moist, sopping pussy out, their fingers jostling at their clit; drips of her juices slip down between their legs. She can smell them. They need their yogi to teach them something else.");
	output("\n\nYour hand teasingly slips away from Paige’s ass, quickly trailing up her belly and the swell of her boobs, until your fingertips are against her nose. Paige takes a deep, thick sniff, smelling herself on your fingers; unquestioningly, she opens her mouth, and you slip your fingers in for her to suck clean.");
	output("\n\nPaige is lost in her fantasy. You push her the last little bit: the tongue in her cunt withdraws, leaving her empty, but then she feels two hungry hands on her ass, and then a wanton, leaking dick frotting between her cheeks, its bloating knot bumping against the underside of her butt. The whole class has forgotten about yoga. They’ve all slipped off their pants, and they’re lining up in a circle around her. None of them can control themselves around their teacher.");
	output("\n\n<i>“[pc.name],”</i> Paige moans, her tongue licking between your fingers one final time. <i>“I’m... I’m not going to last much longer, sweet thing. Either fuck me or don’t.”</i>");
	output("\n\nYou’ve gotten Paige all hot and bothered, but she’s still giving you an out, if all you want to do is catch some shut-eye. It might be a little cruel of you, of course, but who’s to say that a case of blue-balls wouldn’t just make the ‘good morning’ after all the better?");

	addButton(0, "Sex", paigeWhyNotShag, ["PCSF"]);
	addButton(1, "Sleep", paigeINeedMyEightHoursBish, ["PCSF"]);
}

//PCSTH2
public function paigeJustShagAlreadyJeez():void
{
	clearMenu();
	clearOutput();
	showPaige(true);
	processTime(5);
	pc.lust(30);
	
	output("‘We always wants what we can’t have,’ she says. Well, she hasn’t met someone like you – someone daring enough to take what it is they want.");
	output("\n\nWith some quick, forceful movements, you wrap your arms around Paige, getting a surprised huff from her lungs as you bear-hug her, and you roll onto your back, bringing her atop you, pressing you both chest-to-chest. You explain that there are few things in this universe that you can’t have if you want it – and right now, you want your sexy yogi on top of you, and her ass in your hands.");
	output("\n\nPaige whimpers giddily as your busy hands go to work, massaging and pulling and squeezing and pulling and pushing at her glutes, taking as much pleasure from them, from every angle and avenue of attack as they can. Your fingers search and delve into the cleavage of her butt; your palm flatly grinds and presses against the hills of each cheek; your thumbs each quest upward, towards the underside of the base of her tail, knowing that that’s her weak spot.");
	output("\n\nAnd, proving your point, Paige lets you. She gets quite into it, herself: her hips rock into your hands, then they thrust forward, humping wetly against your");
	if (pc.hasCock()) output(" [pc.cock].");
	else if (pc.hasVagina()) output(" [pc.vagina].");
	else output(" [pc.crotch].");
	output(" She moves her hips in gentle, sensual circles atop your body and against your hands, and when your thumbs hit her erogenous zone, her back arches and she sharply inhales, billowing her breasts out into your face.");
	output("\n\n<i>“Easy for you to say, fucker,”</i> she admonishes, although from her tone, the crude language was meant to be endearing. <i>“You’re the " + pc.mf("heir", "heiress") + " to one of the richest and most powerful companies in the universe. I doubt there’s anything you can’t have.”</i>");
	output("\n\nYou reply that money and status have nothing to do with it. Would she be here, naked, on top of you, and submitting to your busy hands, if you <i>weren’t</i> all those things? Sometimes, all it takes is a little initiative.");
	output("\n\n<i>“Mmmm,”</i> Paige moans, unable to argue further. Her sly, sensual humping has become dry and fervent: she’s wantonly grinding herself against you, using her powerful hips to draw as much pleasure through her pussy with every drag as she can. You let her, and all the while, your hands grope and squeeze at her ass, particularly on her backswing, when she fills them out better.");
	output("\n\n<i>“Prove it to me,”</i> she nearly begs you as her back arches high into the air. Your bedsheets trickle off her shoulders until they pool at the small of her back, and in the dim light of the room, you can make out her every naked curve, her every sensual flow as she begs you to pleasure her with her with her body. <i>“Show me some of that initiative, [pc.name].”</i>");
	output("\n\nThe only thing stopping you from taking her right here and now is a thin, satiny layer of her soaked panties pressing against your body. It would be a simple thing, to get them out of the way and take what you can decide is rightfully yours, right here and now.");
	output("\n\nOr, you could show initiative in another way, and leave her hanging. Her body could belong to you, but you could take your time in taking it. Her horny mewling could be your lullaby as you drift to sleep tonight. Hell, it could very well make the morning after all the better for you both.");
		
	addButton(0, "Sex", paigeTooHornyToSleep, ["PCSTH2"]);
	addButton(1, "Sleep", paigeINeedMyEightHoursBish, ["PCSTH2"]);
}

//PCSLHL
public function paigeTakesPoint():void
{
	clearMenu();
	clearOutput();
	showPaige(true);
	processTime(5);
	pc.lust(30);
	
	output("–is to grab her by the wrists and lean backward. She giggles, excited and horny, as she lets you tumble her onto you, chest-to-chest and nose-to-nose. With you on your back and her on top of you, you tell her that you’re completely under her control. Whatever she wants, you’re at her service.");
	output("\n\n<i>“That’s what I like about you, [pc.name]. Well, certainly one of the reasons,”</i> she says, her hands twisting around to grab onto your wrists in response. <i>“You’re so flexible in bed. If I want to be held, you hold me. If I want you to love me, you love me. If I want you to let me fuck you, you’re</i> all <i>for it.”</i>");
	output("\n\nShe sits upright, your bedsheets draping off her shoulders and pooling around her waist, revealing her naked upper body to you in the dim light. With a coy grin, she brings your right hand to her breast, and she directs your left hand to her tight ass. <i>“I’m going to ride you,”</i> she instructs, pressing your hand flatly against her nipple. <i>“And I want you to feel me.”</i>");
	output("\n\nShe does, and you do: her hips press hard against yours, her soaked panties pressing hard against your pelvis as she makes elongated, exaggerated thrusts of her hips, drawing wet streaks across your own crotch. It’s tough to tell in the dim light, but you can feel her eyes on you the entire time, drinking in the sight of you beneath her, touching her, as she has her fun with you and your body.");
	output("\n\nAnd far be it from you to ignore a direct order: you grope, touch, and squeeze at her respective body parts. Your fingers tweak at her nipple while you palm spanks her ass, reverberating the loud clap of your skin on her fur through the dark room. You worm your right hand in between her cleavage, squeezing at one boob from its side, and she lifts her palms to her chest, squeezing them together and trapping your hand in their warm, silky flesh.");
	output("\n\n<i>“Hmm,”</i> Paige moans; you can feel her legs tighten on either side of your waist as she rides you. Her movements are slow, sensual, and deliberate, designed to eke out as much pleasure for herself without driving her too wild.");
	output("\n\nBut it’s more than just the feeling and the groping for her, you know: it’s that <i>she</i> is on top of <i>you,</i> in your bed, in your quarters, in your ship. There’s a sense of control that you’ve surrendered to Paige here: she’s put a lot of effort into her body, and its lead to this moment, where she uses her raw sexual attraction to overpower you. She’s not the type to rub your face in your submission – but she <i>is</i> the type to revel and wallow in herself.");
	output("\n\nShe may be a bit narcissistic like that, but hell, with a body like hers, you think you would be too.");
	output("\n\nPaige leans down, bending at the hips, until her face is flush with yours once again. She leans forward, closing the gap – her tongue snakes out between your [pc.lips], imploring you to suck on it, and you do, pursing them against her wriggling pink muscle and giving it a gentle, but firm, suck. Your tongues play together as she rides you, her panties becoming more and more redundant over time.");
	output("\n\n<i>“Still feel like sleeping?”</i> she asks when she pulls away, her breath coming out in short, horny pants. <i>“I’m not so horny yet that I’ll lose sleep if you want to. But something tells me that you’re not exactly ready to count some sheep,”</i> she giggles, her hips thrusting against you, noting how you shiver under her and how ready you are yourself.");
	output("\n\nPaige is giving you an option. You could call it a night here if you wanted, and if you do, chances are, you’re going to be pretty pent up in the morning. Hell, that might actually make the sex better.");
	output("\n\nOr you can just fuck Paige until you both fall asleep right here and now.");
	
	addButton(0, "Sex", paigeTooHornyToSleep, ["PCSLHL"]);
	addButton(1, "Sleep", paigeINeedMyEightHoursBish, ["PCSLHL"]);
}

//PCSSB
public function paigeAboutToGetFucked():void
{
	clearMenu();
	clearOutput();
	showPaige(true);
	processTime(5);
	pc.lust(30);

	output("–to direct your fingers a little lower, snaking them into the cleavage of her ass. You wriggle them gently, but specifically, a little further south, underneath the hem of her panties, to her pussy.");
	output("\n\nYou gently rake your fingers across the rim of her sex, feeling their spongy, wet texture. Paige hisses in pleasure as you toy with her; she bites into her bottom lip and her hips thrust unconsciously downward, imploring your fingers to penetrate her. You do no such thing, of course.");
	output("\n\nNow that Paige is distracted, you worm your left hand down in between you, feeling its way across the ridges of her abs and the V of her pelvis, homing in with practiced precision on her clit. They dig into the waistband of her underwear, and your fingertips nudge at her nub, at first a little more intensely than you had meant. With her clit found, you press and tweak it, gently at first, but with increasing intensity over time.");
	output("\n\nShe huffs in pleasure, her chin resting on the crook of your neck. Her hips don’t know which way to thrust: either down, into the fingers playing with her vulva in an attempt to swallow them, or up, to encourage you to frig her button some more.");
	output("\n\n<i>“Fuck, what are you doing to me?”</i> Paige asks dumbly, her cognizance slowly dripping out of her pussy and onto your fingers. You reply that you thought it’d be rather obvious. <i>“Fuck,”</i> she says again, her hips rocking this way and that, arrhythmic to your hands, which are arrhythmic to themselves, just to torture her some more.");
	output("\n\n<i>“Two can play at that game,”</i> she says venomously; suddenly, her left hand wraps around your body, clapping down on your own cheek so she can get a good fistful of your [pc.ass], while the other dips in between you two, beelining for your naked crotch.");

	if (pc.hasCock())
	{
		output("\n\nShe finds your [pc.cock]");
		if (pc.longestCockLength() >= 12) output(", without much effort at all");
		output("; you’re already leaking [pc.precum], which takes you for a surprise at first: you were so focused on pleasuring Paige that you hardly paid any attention to how solid you are yourself. The skin of your shaft is taut and hot; Paige wraps her fingers around you and gives you several experimental strokes, rising as high as your [pc.cockHead] to swipe at your fresh dollop of pre, as low as your [pc.base]");
		if (pc.balls > 0) output(", giving your [pc.sack] a quick fondle on the way down");
		output(". And after those first few ‘experimental’ strokes, she really starts fucking you with her hand.");
	}
	else if (pc.hasVagina()) output("\n\nShe finds your [pc.vagina]; you’re already soaked through, which surprises you at first: you were so focused on pleasuring Paige that you hardly paid any attention to how wet you were yourself. Your petals are bloated and sensitive; Paige mimics your earlier actions and splays her fingers, one for each of your vulva, teasing you and collecting your [pc.femCum] without actually penetrating you. Her palm presses inward, sliding the butt of her hand against your [pc.clit], to give you that extra bit of stimulation.");
	else output("\n\nThere’s not much there to find, and she knew that, but she knows you enjoy the sensation anyway: her open, flat palm rubs at your blank crotch, stimulating and warming the [pc.skinFurScales] there, as if you had genitals for her to play with. Although you don't, she makes the best of what she has – and she takes extra care to play with your [pc.ass] to make up for it.");

	output("\n\nThe two of you lay panting and breathless in your bed as you sexually stimulate each other with your hands. She’s wetter than a Galotian in a pool, and");
	if (pc.hasCock())
	{
		if (silly) output(" Steele Jr. is harder than, well, then steel.");
		else output(" you’re so hard that all it’d take is a shallow thrust, and you’d be inside her.");
	}
	else if (pc.hasVagina()) output(" you’re likewise: you could drown a parched man.");
	else output(" although you don’t have genitals for her to play with, you nonetheless reciprocate her excitement with the way she touches you.");
	output("\n\nSomething tells you that, if you wanted to actually get some sleep tonight, you might have made all the wrong choices.");

	output("\n\n<i>“That’s it,”</i> Paige says with some finality, pushing her body into yours. You roll onto your side, and Paige is on top of you, her panties soaked through the cotton and wetly squeezing against you. <i>“We’re gonna fuck, you hot " + pc.mf("bastard", "bitch") + ",”</i> she declares, and to show you she really means business, she hooks her fingers into the waistband of her panties and, with a rough, strong pull, she rips them right off her body.");
	output("\n\nWith a flick of the wrist, she tosses her destroyed underwear behind her, her exposed sex grinding hotly and wetly against");
	if (pc.hasGenitals()) output(" you.");
	else output(" your blank crotch.");
	output("\n\nYou’ve got a hot, riled-up and sexually-aggravated ausar on top of you, grinding her sopping snatch onto your pelvis. What’s " + indefiniteArticle(pc.race()) + " to do?");

	paigeJumpToSexFlowchart(["PCSSB"]);
}

//PCSE3
public function paigeWhyNotShag(args:Array):void
{
	clearMenu();
	clearOutput();
	showPaige(true);
	processTime(5);
	pc.lust(30);
	args.push("PCSE3");
	
	output("The arousal is mutual. You tell Paige that, if she’s in the mood for a good time, you won’t be the one between you to deny you both.");
	if (InCollection("PCSF", args)) output("\n\nThankful for your permission, Paige thrusts her body into yours, rolling you onto your back. She");
	else output("\n\nPaige leans up and");
	output(" straddles your [pc.hips], bearing her naked chest to you in the light of the room; you use your hands to ‘see’ the curves of her body and the swell of her breasts, accepting her unspoken invitation to touch her as she excitedly grinds on you.");
	output("\n\n<i>“I figured from the start that this is what you wanted, [pc.name],”</i> she says breathlessly. When one of your palms meets the hard nipple of her boob, she grabs your hand and keeps it there.");
	output("\n\nYou respond that you sincerely meant to actually get some shut-eye with Paige – you couldn’t help it if things got a little saucier in the meantime.");
	output("\n\n<i>“Rest assured, you’ll be getting what you want, sweet thing,”</i> Paige says as she dexterously uses her free hand to hook through the waistband of her panties, her legs shimmying them off her hips and to her ankles. With a flick of the wrist, they’re tossed clear across the room. <i>“We’ll just be entertaining each other until then, is all.”</i>");
	output("\n\nYou grin. That sounds like a great time to you.");
	
	paigeJumpToSexFlowchart(args);
}

//PCSE4
public function paigeTooHornyToSleep(args:Array):void
{
	clearMenu();
	clearOutput();
	showPaige(true);
	processTime(5);
	pc.lust(30);
	args.push("PCSE4");
	
	output("After everything that’s happened so far, you think you wouldn’t be able to get to sleep if you tried, not with");
	if (pc.hasCock())
	{
		output(" the hard-on that you’ve both been nurturing for the past couple of minutes");
		if (pc.hasVagina()) output(", and");
	}
	if (pc.hasVagina())output(" the soaking wet cunt that’s been staining your bed ever since the games between you really got started");
	output(". You express doubt that Paige wouldn’t just jill herself to sleep, either.");
	output("\n\n<i>“Wouldn’t that be pretty hot, though?”</i> Paige asks, sensually biting into her fingernail as she fantasizes about it. <i>“A mutual jay-oh session in between the sheets? We could even give each other a hand. Or a mouth. Or a pussy");
	if (pc.hasCock()) output(" and a dick");
	output(". Whatever we need. Just a couple of friends helping each other to sleep by masturbating each other with their genitals. You know, like what friends do.”</i>");
	output("\n\nHer grinding atop you grows more insistent; her body has pressed");
	if (pc.hasCock()) output(" your [pc.cock] flat against your pelvis, even as it floods with your pumping blood and actively pushes back against her");
	else if (pc.hasVagina()) output(" against your [pc.vagina], stimulating your [pc.clit] and making all the juicier; she uses your horny lube as grease to make her glides longer and smoother");
	else output(" against you, dragging her wet, supple cunt against your pelvis and marking it with her juices, making her rides longer and smoother against you");
	output(". You couldn’t stop what’s about to happen between you two even if you wanted.");
	output("\n\nSo, you hurry it along: impatiently, you hook your fingers around the waistband of her plain white panties and give it a fierce tug.");
	if (pc.physique() <= 3) output(" The fabric holds on the first yank, and, somewhat embarrassed, you give it a second, stronger, fiercer tug.");
	output(" The panties rip apart, the fabric loosely flopping around your clenched fist, until you give it a careless toss across the room.");
	output("\n\nPaige looks over her shoulder, to where you threw her underwear, and when she looks back at you, she leans down with a sort of aggressive, horny fervor she hadn’t shown yet tonight. <i>“Fuck, that’s</i> hot,<i>”</i> Paige says, her fingers working between your bodies to align you two more appropriately. <i>“Fuck me right now, [pc.name]!”</i>");
	output("\n\nYou heard the lady.");
	
	paigeJumpToSexFlowchart(args);
}

//PCSES
public function paigeINeedMyEightHoursBish(args:Array):void
{
	clearMenu();
	clearOutput();
	showPaige(true);
	processTime(5);
	args.push("PCSES");
	
	output("As horny as you two are getting, and as easy as it would be to let things spiral out of control, you think it’d be best for you both if you left it at the teasing. It’s been a long day, and, hell, if you’re both looking for a good time, a bit of blue-balling might actually make the morning after all the more intense for you both.");
	output("\n\n<i>“Aww,”</i> Paige whines, rotating her hips slightly to try and coerce you to change your mind. <i>“I’m not much of a morning person, though. You’re not using that lame headache excuse, are you?”</i>");
	output("\n\nYou tell Paige that you’d never do that to her. It’s not that you’re disinterested, far from it. It’s that you’re sleepy, and you want to be energetic and attentive when making love to your ausar.");
	output("\n\nWhen you frame it that way, Paige reconsiders. <i>“Well,”</i> she says, clearly still disappointed, but convinced nonetheless, <i>“I wouldn’t want you to fall asleep at the wheel, for sure.”</i>");
	output("\n\nAt that, she leans into you, wrapping herself tightly around your body and settling comfortably into the bed. <i>“You’ve got a big debt to fill tomorrow, though,”</i> she breathes into your ear, licking at your neck. <i>“Don’t leave me horny and waiting, sexy.”</i>");
	output("\n\nYou aren’t about to dream of it.");

	flags["PAIGE_WAKEY_FLAGS"] = args.concat();
	sleep(false);
}
	
//PCSA
public function paigeWakeyWakey():void
{
	clearMenu();
	clearOutput();
	showPaige(true);
	var args:Array = flags["PAIGE_WAKEY_FLAGS"].concat();
	flags["PAIGE_WAKEY_FLAGS"] = undefined;
	if (InCollection("PCSES", args)) pc.lust(30);
	
	var hadSex:Boolean =	InCollection("PCSE3", args)
							|| InCollection("PCSE4", args)
							|| InCollection("PCSBN", args);

	output("You wake to the sensation of a soft, yet insistent, vibration from your bed’s mattress and its headboard, serving as your alarm. Lazily, you reach for one of the alarm’s settings, also built into the headboard, so you can slap the snooze button and drift off for another ten minutes.");
	output("\n\nHowever, your arms and legs are all tangled up, and it takes you a moment to realize, and then remember, that Paige is in the bed with you. She’s clamped to your limbs, her head resting gently against your [pc.chest]");
	if (pc.biggestTitSize() >= 6) output(", using your boob like a pillow");
	output(".");
	if (hadSex) output(" Her fur is still matted with a combination of her sweat, your own sweat, and, you’re sure, some mix of other fluids, after the exciting night you two had");
	else output(" She nuzzles against you gently, a thin, content smile on her lips, and she clutches you tighter to her whenever you try to move.");
	output("\n\nThe vibration comes through a second time, and it wrests Paige awake just enough to loosen her grip on you, so that you can hit a button. You aren’t sure which one you pressed, but the alarm stops, and you two are awake.");
	output("\n\nPaige moans sleepily, nuzzling herself against your [pc.skinFurScales]. Her eyes don’t open. <i>“Mmmmmmnnnnot yet,”</i> she says, chewing at the cottonmouth that’s built up overnight. You tell her that you need to; it’s time to wake up. <i>“Nnnnnoooooo,”</i> she whines, her hands pawing at your sides to get you to stop moving, <i>“you’re the captain. Work some captainly privileges or something.”</i>");
	output("\n\nYou laugh and kiss her forehead. Fraternizing with the crew is about as ‘privileged’ as it gets; you’d both be better off not pressing your luck.");
	output("\n\nPaige sighs, then loosens enough to let you sit up. She takes a bit longer, but sits up with you – then promptly flops her head onto your shoulder, her eyes shutting closed again.");
	if (hadSex)
	{
		output("\n\n<i>“Fuck, last night was great,”</i> she says dreaily, rubbing her cheek on your shoulder. <i>“A girl could get used to her captain ‘privileging’ her every night, yes " + pc.mf("sir", "ma'am") + ".”</i>");
		output("\n\nNow that she mentions it, you ask her if she’s awake and rowdy enough for a second round.");
		if (pc.hasCock()) output(" You certainly are.");
		output(" <i>“Mmmmm,”</i> she moans, <i>“maybe... give me ten minutes to wake up, maybe eat some breakfast.”</i> Impishly, you push your luck and suggest that she could get her breakfast in bed right here and now. <i>“Come on,”</i> she says, knowing you mean well, <i>“I’m not a morning person, [pc.name]... I need a minute.”</i>");
		output("\n\nYou acquiesce and don’t push it any further.");
	}
	else
	{
		output("\n\n<i>“Hey,”</i> Paige says lowly, still trying to voice her words through the overnight cotton. You say nothing, knowing that she knows you're listening. <i>“");
		if (InCollection("PCSTH", args) || InCollection("PCSKH", args)) output("I love you, [pc.name].”</i> You tell her that you love her too. <i>“I don’t feel like I tell you that often enough. ");
		output("I’m glad you invited me to sleep with you. What we have is a bit deeper than just a captain and [pc.hisHer] crewmate.”</i>");
		if (InCollection("PCSES", args))
		{
			output("\n\nYou ask Paige if she’s still in the mood to take advantage of all that teasing from last night. After everything you two did to each other, you wouldn’t mind a throw while you’re still in the blankets");
			if (pc.hasCock()) output(", especially with this wood you’re sporting");
			output(". <i>“Mmmmm, tempting, sweet thing,”</i> Paige says with a smile, <i>“but... gimme a couple minutes. I need to wake up and I need something in my stomach.”</i>");
			output("\n\nImpishly, you push your luck and say that she can get some breakfast in bed right now if she wanted. <i>“Hah, I wouldn’t exactly call a load of " + (pc.hasCock() ? "jizz" : "ladyjizz") + " the breakfast of champions. Come on, I’m not a morning person, quit teasing me.”</i>");
		}
		else output("\n\nYou say nothing in response, and simply enjoy the morning with her, in the privacy of your quarters.");
	}
	output("\n\nThe two of you make your way off the bed; Paige gets dressed while you reset the sheets.");
	if (InCollection("PCSE4", args) || InCollection("PCSES", args)) output(" Paige searches the room confusedly for her panties, then, when she finds a shredded, destroyed patch of white cloth, she laughs and says ‘oh, right,’ under her breath.");
	output(" You keep stealing glances towards Paige while she redresses, and");
	if (!pc.isNude()) output(" when you reach for your own things,");
	output(" you feel Paige’s eyes on you, returning the sneaky sentiment.");
	output("\n\n<i>“So, hey,”</i> she says when you’re both halfway presentable and standing at the door to your quarters. <i>“Um... same time tonight?”</i>");
	output("\n\nYou tell her that you’ll be sure to keep your schedule open. She smiles, and leans in to peck your [pc.lipsChaste], before opening the lock to your door.");
	if (InCollection("PCSES", args)) output(" <i>“You know where to find me, especially if you want to... make good on that offer later.”</i>");
	else output(" <i>“You know where to find me.”</i>");
	output("\n\nThen, she’s on the way to her own quarters, and you’re left alone to greet the new day.");
	
	addButton(0, "Next", mainGameMenu);
}

