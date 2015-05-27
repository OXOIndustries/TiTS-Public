//Bar Preview Blurb
function kiroSetup(button:int = 0):void
{
	if(kiro.ballDiameter() <= 5) output("The tanuki-girl pirate you saved, Kiro, is here sipping on a drink and thumbing idly through a data slate.");
	else if(kiro.ballDiameter() <= 10) output("\n\nThe tanuk-girl pirate you saved, Kiro, is here, casting lecherous looks over everyone else in the bar. She spots you and waves you over, but the look in her eyes is more hungry than friendly.");
}


function approachKiroAtTheBar():void
{
	showKiro();
	//Talking to Kiro at the Bar {First Time}
	//Savin
	if(flags["KIRO_BAR_MET"] == undefined)
	{
		author("Savin");
		flags["KIRO_BAR_MET"] = 1;
		output("Seeing the over-hung tanuki-girl, you make your way over. Now that her... problem... has been sorted out, you can finally get a good look at what you assume is her normal form: a curvy woman with tits and hips that strain her obviously expensive clothes, her once-swollen balls neatly hidden into a compact package tucked into a dark red leotard, leaving her male endowments obvious but not so overstated as when you first met. Kiro looks up from her slate as you approach, a sly smile spreading on her black lips. <i>“Hey, look who it is. Thanks again for the timely rescue, " + pc.mf("handsome","gorgeous") + ". That was... well, let’s just say I’m pretty sure I’d have ruptured the hull before too long.”</i>");
		output("\n\nKiro extends a hand, and you shake it vigorously as she calls for a drink. At her invitation, you slip into the booth across from her as the waitress brings a pair of wine glasses filled to the brim with the house’s best. Classy as ever, Kiro swings her thigh-high boots up onto the table and downs the glass, <i>“So, what brings you out here, [pc.name]? Surely not to see little ol’ me, hmm? But while you’re here - and while my little friend here is under control,”</i> she says, patting the bulge in her clothes, <i>“I did say I’d love to show my appreciation if we ever met again. And I meant it. How about a drink?</i>\”</i>");
		//[Sure] [No Thanks]
		//Both Leads to mandatory exposition and drink buying scene.
	}
	//Talk to Kiro, Repeat
	//Savin
	else
	{
		author("Savin");
		//Bigger than Savin
		if(kiro.ballDiameter() > 10)
		{
			output("<i>“Welcome back,”</i> Kiro slowly drawls, obviously undressing you with her eyes as she does. One of her padded palms comes to rest on the small of your back, rubbing in slow circles as she admits, <i>“I’ve been saving up hoping that you’d come along again. I hope you’re ready for some fun....”</i>");
		}
		else
		{
			output("<i>“Hey, " + pc.mf("handsome","gorgeous") + ",”</i> Kiro says, smiling warmly as you approach. <i>“Back again already? Come on, let’s have a drink.");
			if(kiroTrust() >= 35) output(".. unless you wanna get out of here, angel?");
			output("”</i>");
		}
		//9999 kiro menu!
	}
}

//Kiro Buys You a Drink & Exposits a Bit About Herself.
//Learn about her spooginess and backstory somehow.
//Drink Intro
function kiroIntroductoryScene(drank:Boolean = false):void
{
	clearOutput();
	showKiro();
	if(drank)
	{
		output("Kiro nods and waves the bartender over, calling, <i>“A drink here for my savior, and put it on my tab.”</i> The corner of her mouth crooks up into a lopsided grin. <i>“I doubt you’ll be hearing me say that again.”</i>");
		output("\n\nThe bartender wipes a ring of accumulated condensation from the bar with a damp, none-too-clean towel while he takes your order. His voice and motions are cool and sure, indicating a long familiarity with his chosen occupation. He’s done this for years, maybe decades. Whatever the case, the result of his practiced efficiency slides across the smooth bar and into your grip in no time flat.");
		output("\n\nYou take your first sip of your drink. It’s a dozen times smoother than Kiro’s uncouth personality and only slightly more alcoholic than the buzzed tanuki- or raccoon-looking girl. Tipping your head to the bartender in thanks, you turn your attention back to the stacked hermaphrodite.");
		output("\n\n<i>“Hits the spot, huh?”</i> she offers. When she gets an answering nod, she continues, <i>“Good. I’m in the mood for a little bit of storytelling, and since you accepted the drink, you may as well sit around and learn a few things about the soon to be famous Miss Tamahime!”</i> She speaks with such a ring of heartfelt belief and clarity that it reminds you of a priest of the One God sermonizing on the corner, calling out to get attention before he launches into a tirade about the sins of the universe. Only, Kiro is gearing up to preach her own greatness instead, you wager.");
		//9999 apply alcohols!
	}
	//No drink
	else
	{
		output("Kiro shrugs and says, <i>“Suit yourself.”</i> A troubled look clouds her brow before clearing. Her eyes have lit up with an idea, and she conspiratorially suggest, <i>“Since you’re going to be staying fairly sober, let me tell you a little bit about myself, since the newscasters don’t seem to plan to.”</i> She jerks a thumb towards one of the flat viewscreens that adorns a wall. <i>“Then, if you’re still interested, maybe I can find another way to pay you back.”</i> A current of sensuous undertones lines that sentence like gold trim on a comfortable pillow.");
		output("\n\nYou nod; you may as well learn a little more about your proud rescuee.");
		output("\n\n<i>“Good. I’m in the mood for a little bit of storytelling. Sit around and learn a few things about the soon to be famous Miss Tamahime!”</i> She speaks with such a ring of heartfelt belief and clarity that it reminds you of a priest of the One God sermonizing on the corner, calling out to get attention before he launches into a tirade about the sins of our universe. Only, Kiro is gearing up to preach her own greatness instead, you wager.");
	}
	//Merge together
	output("\n\n<i>“The first and most important thing that you had better remember, for your own safety, is that I am no simpering strumpet just waiting to be wooed or casually fucked. I am a tornado of change, an elemental force of nature, if you will.”</i> Kiro puffs out her considerable chest. <i>“Sex is definitely part of that, but I do the ravaging. Me! I’m hung like a stallion and three times as lusty. I’ve yet to meet a girl who could keep up with me, and most boys’ prostates are so flattened that the jizz just runs out of their dicks as they make it. It’s fun to stay inside them and see how big a puddle I can fuck out of them.”</i>");
	output("\n\nYou smirk and point out that she didn’t look like she’d be ready to fuck any time soon after emptying her balls.");
	output("\n\n<i>“Pshh, that was just an industrial accident. You know that if I can swell up that big and make so much.... Well, you know I could last, normally. I mean, look at what I’m packing!”</i> Kiro spreads her legs and pats her none-too-subtle package. It visible twitches in response, and you swear it’s a little bigger than before she touched it. <i>“When I get as big as I was, a good cum wipes me out pretty hard, but I don’t let myself get anywhere near that. Instead, I have lots and lots of little orgasms. It helps that my little orgasms are bigger than three ausars’ put together.”</i> She knocks back a swig with a confident smile.");
	output("\n\n<i>“I got sidetracked again, huh?”</i> the striped she-pirate admits. <i>“So, like I was saying, I’m a force of nature and not just in bed. I’m a pirate. Some might call me a thief, aye, but I follow a code. I come in like a gale force wind, swooping down on those too rich to miss a few things or those who deserve a good pillaging, and I’m gone before the dust can settle.”</i>");
	output("\n\nYou ask, <i>“How can you judge who deserves it?”</i> The unspoken knowledge that no one is a perfect judge of character comes to mind.");
	output("\n\nKiro twirls a lock of curly hair around a finger, unbothered in the slightest. <i>“In this universe? There’s billions of terrible people out there and at least a few million </i>monsters<i>. There are psychopaths who would gas entire planets just to rip the ore out from under the crust. Slavers capture helpless girls under the UGC’s nose, calling it ‘indentured servitude’.”</i> Her look is plainly sardonic as she glances furtively your way. <i>“My ship belonged to one of those assholes.”</i> Immeasurably proud of that fact, Kiro’s easy smile returns. <i>“Some slavering asshole’s ship is now my pleasure yacht, and all the little modifications, hidden weapons, and smuggling compartments just make it that much easier to take from his ilk.”</i>");
	output("\n\nYou cannot help but grace her with a returning smile at that. Something about an");
	if(pc.isAss()) output("other");
	output(" asshole getting royally screwed by this puffed-up pirate is more than a little heartwarming.");
	output("\n\n<i>“I see ya smiling there,”</i> Kiro says. <i>“It makes me smile too, every damn time I climb onboard that ship. All that polished opulence turned on its head and used against types like its old owner. I’m not sure what your people call it, but among the Kui-Tan, we call that </i>ket-kua<i>.”</i> She scratches at her cheek, eyes brightening once more. <i>“Oh, I saw something on the ‘net that sounds right. Poetic justice or something?”</i>");
	output("\n\nThat sounds about right. You agree and ask her a bit more about the Kui-Tan. Do they all look like her? Huge horsecocks and all? Where’s their planet?");
	output("\n\n<i>“Whoah there, angel, slow down.”</i> Kiro is holding out one hand to implore to stop. The other finds her drink so that she can claim a few fortifying swigs. A satiated sigh escapes her lips as the drink clinks down, empty. <i>“Another!”</i> she calls, belching loudly before focusing in on you again.");
	output("\n\n<i>“I’ll try and hit all your questions in sequence, if I can,”</i> she explains. <i>“First up, my kin do all look like me, more or less. Thick, fluffy fur, big tails, mask-like bit across the eyes, stripes: they all come as part of the kui-tan kit. Now this? The horse-cock?”</i> Kiro squirms in her seat a little, and you see her concealing sheath swell up through the tight coverings over her crotch. <i>“We don’t usually have those. Our penises normally have a heart-shaped tip, and they sure as hell aren’t anywhere as awesome as my pet monster. The huge balls are standard of course. No girls, though, just herms and males. You have no idea how refreshing it is to plow a pretty, pink pussy without two giant balls bouncing around in front of it!”</i> A flat distention appears just above Kiro’s crotch, climbing up a few inches before slowly starting to sink back down as the topic shifts. <i>“And to top it all off, our balls go into overdrive if we drink cum, so blowjobs just wind up starting even more ball-emptying sex and masturbation. Stars above, I love getting blowjobs.”</i>");
	output("\n\n<i>“I suppose you could call Shadowajii a cock and ball fetishist’s paradise, really. It didn’t do it for me, though. Too much competition. It got overlooked during the last planet rush until recently, and the first chance I had to get off that backwater rock, I took it.”</i> Her eyes grow misty and distracted, perhaps remembering some past exploit she’s chosen not to share with you before the clinking of her refilling glass rouses her from her woolgathering. <i>“Anyway, if you want more info, look it up on the extranet. We’re on there.”</i>");
	output("\n\nYour codex beeps and announces, <i>“Kui-Tan. Sometimes referred to as ‘the tanuki race’.”</i> You tap the button to silence it before it can go any farther.");
	output("\n\nKiro gives you an appraising, impressed look. <i>“Quite the little toy you have there, [pc.name]. Will you tell me about it?”</i> As an afterthought, she adds, <i>“Don’t worry, I’m not looking to get arrested in one of my favorite bars, and I don’t think you fit bill to be one of my victims anyhow.”</i> Her reddish-brown eye gives you a wink.");
	output("\n\n<b>Do you tell Kiro about the Codex?</b>");
	//Pass 7 minutes
	processTime(7);
	//[Yes] [No]
	//9999
}

//Yes, Tell Kiro About Codex
function tellKiroAboutTheCodex():void
{
	clearOutput();
	showKiro();
	output("<i>“Sure,”</i> you say as you hoist the leather-bound ‘tome’ up onto the cleanest spot on the bar. You open it up to show off the screens, each so high resolution that neither of you can make out the constituent pixels. A list of races you’ve encountered appears in stark relief, each raised up slightly thanks to the device’s significant ability to provide real haptic feedback by altering its screen at will.");
	output("\n\n<i>“I got it from my dad,”</i> you explain, <i>“He left it for me when he died. I guess he figured it would help me out while I’m exploring. It automatically collates information on life forms I encounter as well as allowing extranet, voice, and video communications. It’s hard to imagine getting by without it.”</i>");
	output("\n\nWith surprising respect, Kiro doesn’t ask to see it. <i>“Quite a nice toy, but I think I’ll keep my mitts to myself for now. I know I wouldn’t trust somebody I barely knew to handle a gadget with that much oomph to it.”</i> She changes topic abruptly. <i>“Do you miss him? Your dad?”</i>");
	output("\n\nYou answer, <i>“I’d rather not talk about him, Kiro. Sometimes it’s better to look to the future rather than dwell in past pains.”</i>");
	output("\n\nBushy, soft fur wraps around your ");
	if(pc.tallness < 60) output("neck");
	else output("waist");
	output(" as Kiro lays her arm comfortingly on you. <i>“I hear you, [pc.name]. Maybe someday you’ll tell me about your father and I’ll tell you how I got off my rock. In the meantime, is there anything else you want to do?”</i> Kiro leans back grandiosely in her chair. <i>“This is a bar! Let’s have some fun!”</i>");
	//Pass 2 minutes
	//+5 Kiro trust!
	processTime(2);
	kiroTrust(5);
	//9999 kiro menu!
}

//No, Don’t Tell Kiro About Codex
function dontTellKiroAboutTheCodex():void
{
	clearOutput();
	showKiro();
	output("<i>“Not today,”</i> you say as you tuck the leather-bound ‘tome’ securely away.");
	output("\n\nKiro rolls her eyes and sighs, more than a little disappointed. <i>“Not even a peek?”</i> Her tail sways back and forth like an eager puppy’s and her voice becomes high-pitched and wheedling. <i>“Pleeaaaaaaseeee?”</i>");
	//Pass 1 minute
	processTime(1);
	//Yes or no.
	//9999
}

//Definitely No.
function definitelyDontTellAboutTheCodex():void
{
	clearOutput();
	showKiro();
	output("Kiro pouts. <i>“Fine, that’s your right I suppose.”</i> She picks up her glass and considers the swirling amber liquid contained by the sparkling crystal vessel before taking a long, slow swill. When the emptied glass touches down, the kui-tan’s boisterous spirits have returned.");
	output("\n\n<i>“Fuck it,”</i> she announces, throwing her arms wide. <i>“We’re hanging out in a bar, and we should be having fun. What do you want to do?”</i>");
	//Pass 1 minute
	processTime(1);
	//-5 Kiro trust!
	kiroTrust(-5);
	//9999 kiro menu
}

//Play Wingman
function playWingmanWithKiro():void
{
	clearOutput();
	showKiro();
	output("You suggest to Kiro that you’ll play wingman and help her get some tail tonight.");
	output("\n\n<i>“Really?</i> she asks. <i>“You sure?”</i>");
	output("\n\nYou nod, a shit-eating grin visible on your face, saying, ");
	//Personality forks
	//Nice
	if(pc.isNice()) output("<i>“As horny as you are? You could use someone to help release all that pressure, and I’m not exactly keen on being turned into a creme-puff or getting hosed down right this minute.”</i>");
	//Mischievious
	else if(pc.isMischievous()) output("<i>“Sure. It’ll be a real kick getting to help pick a person to gift a few stretched orifices too.”</i>");
	//Jackass
	else 
	{
		output("<i>“Why not? I always wanted to see a walking fur carpet try to get laid.”</i>");
		output("\n\nKiro glares daggers at you.");
		output("\n\n<i>“Ahhh, get over it,”</i> you call. <i>“Pussy, remember?”</i> Kiro’s stormy expression morphs into a beatific, addict’s smile at that. Of course it does.");
	}
	//MERGE
	output("\n\nTogether, the two of you scan the periphery of the bar for a pretty target your hermaphroditic friend can win over. There’s dozens of alien women of all species, but most of them are already being chatted up by other guys, other girls, or sentient clouds of sparkling mist. The atmosphere is festive under the cacophonous, thumping music, and big, leering smiles slowly spread across you and Kiro’s faces as you take in the assembled crowd.");
	output("\n\n<i>“There!”</i> Kiro calls, pointing to a sweet-looking girl with a much less attractive friend. <i>“Look at her hips! They’re breeder’s hips! Oh, I cannot wait to feel her stretching around me. You butter up the one on the right, okay?”</i>");
	output("\n\nYou smile. <i>“Got it.”</i> <b>But how do you play it? Do you do exactly as she asks and entertain the friend or decide to go a little nuts with embellishments to entertain yourself.</b>");
	//9999
	processTime(3);
	clearMenu();
}

//Wingman - Embellished
function embellishForKiro():void
{
	clearOutput();
	showKiro();
	output("It turns out your assigned target is pretty damned gullible. At first, you convince her that you’re actually Kiro’s parole officer, here to make sure she doesn’t break any laws. Later, you convince her that you’re actually an secret agent, and Kiro is your partner. You’re on your way to stop a conspiracy, but you have a little downtime tonight, before your next mission. She buys that hook line and sinker.");
	output("\n\nMeanwhile, Kiro is playing the suave space-pirate role to a ‘T,’ and her companion is buying it hook line and sinker. The flirty girl’s hard nipples are as visible through her shirt as the projector behind a holo, obviously indicating just what she thinks of her new friend. Kiro’s cock has climbed up her middle and into the bottom of her cleavage. Both of them appear quite taken with each other, and once the hippy little thing sees her friend having a good time with you, she’s easily seduced back to Kiro’s ship.");
	output("\n\nYou get bored of the lies and pass a little time with your mark by buying her a few drinks and telling increasingly bawdy jokes. She’s demonstrably pleased by this turn of events, a heady grin breaking out on her average face. You get her number before you leave, but it winds up being a fake. Just how much of your bullshit did she actually see through, and was she putting up with for the attention?");
	output("\n\nA message from Kiro dings on your codex a little while later: <i>Good job, but I think I’m gonna need to think twice before I take you at your word in the future, huh? You silver tongued devil!");
	output("\n\n-Kiro</i>");
	//Two hours pass.
	processTime(123);
	//-5 Trust
	kiroTrust(-5);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
	//9999 start kiro encounter cooldown!
}

//Wingman - Played Straight
function playItStraightForKiro():void
{
	clearOutput();
	showKiro();
	//Nice
	if(pc.isNice()) 
	{
		output("It turns out your assigned target is actually pretty awesome. She’s something of a musician and artist, while her friend is little more than an empty head perched upon a pair of tits and cushy ass. Kiro doesn’t seem to mind. She’s playing the suave space-pirate role to a ‘T,’ and her companion is buying it hook line and sinker. The flirty girl’s hard nipples are as visible through her shirt as the projector behind a holo, obviously indicating just what she thinks of her new friend. Kiro’s cock has climbed up her middle and into the bottom of her cleavage. Both of them appear quite taken with each other, and once the hippy little thing sees her friend having a good time with you, she’s easily seduced back to Kiro’s ship.");
		output("\n\nInstead of ditching your new companion, you actually wind up having a pretty entertaining discussion about musical choices and affinities of various races. It’s... enlightening and far more refreshing than you thought.");
		//Three hours pass. Small intelligence training bonus.
		processTime(177);
		pc.slowStateGain("intelligence",1);
	}
	//Mischievous
	else if(pc.isMischievous())
	{
		output("\n\nIt isn’t as boring as you would have thought. The plain friend has a pretty solid sense of humor, and while she declines to joke about her airheaded friend, she winds up telling some real rip-roarers about some of the random passers-by in the bar. You’re both generally laughing and having a good time, not regretting your choice at all, even if you aren’t attracted to this woman.");
		output("\n\nKiro’s luck seems to be holding as well as your own! Her and her target are standing so close together than their hips are brushing together to tempo of the bone-quivering bass beats. The hippy little blonde’s nipples are hard through her practically sheer top, and Kiro’s cock is making an increasingly unseemly bulge through the middle of her outfit. If she waits much longer, she’s going to wind up growing right up into her tits. Seeing you watching, she proceeds to wink and do just that, letting a little of her flare peek between her tits as she flirts. Her conquest blushes hard, impressed, and they depart for the ship.");
		output("\n\nYou pass a good hour more hanging out with your new friend before letting the night wind down. Across from you, the plain friend looks a little worried, and she complains about her missing her friend, sorry she let her get picked up by a stranger. Apparently she had come along to help rein in her sluttier friend’s escapades and had failed. You console her by telling her that your friend is just as bad before asking for her number.");
		output("\n\nIt isn’t until she’s long gone that you realize it’s a fake.");
		//2.5 hours pass.
		processTime(135);
	}
	//Jackass
	else
	{
		output("\n\nYour assigned target is just so goddamned... plain! She has a face that has all the beauty of an oval. Her teeth are neat but unremarkable. Her complexion leaves a little to be desired, and she didn’t even bother with makeup! It’s no wonder her friend was alone, she had this dead-weight dragging her down all night. You sidle up to her and try your best pickup line... and get slapped.");
		output("\n\nKiro shoots you a look so violent you expect telekinetic force to push you through the wall. Turning on the charm, you apologize for the crudeness of your initial line. It’s time to make nice.");
		output("\n\nLuckily, your ploy works. The unremarkable broad wastes an hour of your time before her friend and Kiro say their goodbyes. Finally! You put up with another half hour or so of her worthless chatter to give your frisky friend time to get her conquest home and too busy to answer her phone, and then you excuse yourself to the bathroom. You don’t bother to go back to the girl.");
		//90 minutes pass
		processTime(90);
	}
	//ALL:
	output("\n\nYour codex beeps with a message from Kiro later that night. It’s a picture of a new pair of panties on her wall next to a bukkake’d girl.");
	//+5 Kiro trust
	kiroTrust(5);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
	//9999 make kiro unavailable a bit.
}

//Drinking Contest
function kiroDrankinConterst():void
{
	clearOutput();
	showKiro();
	output("<i>“How about a drinking contest?</i>” you suggest with a glance toward the bar.");
	output("\n\nKiro smirks, looking back at you evenly. <i>“");
	if(flags["KIRO_DRINKING_CONTEST_RESULTS"] == undefined) output("If you expect the space pirate to be a lightweight, you’re gonna have a bad time.");
	else output("If you wanted to take advantage of me sexually, all you had to do was ask. Keep this up, though, and you’re gonna be the one getting taken advantage of.");
	output("”</i> Her clothes visibly tent, starting to strain away from her body. <i>“If I win, you get to be my cock-milker for a day.</i>”");
	output("\n\nGrinning back, you ask, <i>“And if I win?</i>”");
	output("\n\n<i>“You get to have a drunken, hyper-sexed fuck-pet that will indulge your every sexual whim. What else?</i>” Kiro answers.");
	output("\n\nThis could be a bit of fun for you and the tanuki, but nothing says you have to play fair either. You bet you could cheat to assure your victory, if you wanted to.");
	//[Play Fair] [Cheat] [Nevermind] - goes back to main Kiro menu.
	processTime(3);
}

//Drinking Contest!
function drinkingContestGo(cheated:Boolean = false):void{
	clearOutput();
	showKiro();
	output("Kiro smiles at that. <i>“You have no idea what you’re getting into, angel.</i>” She pats her tummy. <i>“This cute little tummy has handled more drinks than you could count. I hope you’re ready for a bit of stretching.</i>”");
	output("\n\nGesturing at the bartender, the curvy pirate orders a pair of drinks for the both of you. Her big, bushy tail wraps around your [pc.hips] causing you to lean over where she can wrap her arm around you, and she proudly announces, <i>“It’s on me!</i>”");
	output("\n\nYou smile back as a pair of sloshing star fuels slide back across the bar into your waiting hands, one for Kiro and one for you. Clinking them together, you both call, <i>“Bottoms up!</i>” in unison and tip back the fiery alcoholic drinks. As the name indicates, this drink tastes like liquid propellant that’s just waiting to explode, and it sears a path of pain the entire way straight into your belly. There it seems to go off like a bomb. The tanuki belches loudly a moment before you. Your own follows a moment later. The explosive warmth radiates through you, as the fiery blaze in your throat settles down to a dull, almost pleasant throb of alcoholic warmth.");
	output("\n\nSlamming your shot glasses down on the table, you look over in time to see Kiro giving you a cocky smile. <i>“You know it’s going to be your bottom up tonight, right?</i>”");
	output("\n\n<i>“You wish!</i>” you retort before the next set of drinks can arrive.");
	//MONTAGE FOR NON CHEATERS
	if(!cheated)
	{
		output("\n\nThe next drinks in sequence are milky ways, engine cleaners, afterburners, supernovas, and after that your memory of the shots gets a bit hazy. You’re pretty sure you had something called a comet’s tail at some point too.");
		//Winning fork
		if(9999)
		{
			output("\n\nKiro seems far worse off than you, though. She’s wobbling back and forth on her barstool, practically hanging off your shoulders in order to stay upright as the bartender returns with two more shots. Kiro giggles down into hers, hefting it aloft and spilling a bit over the sides. <i>“Thish ish one of my favorites! Come on, [pc.name]! Let’s... knock ‘em... knock ‘em up. Wait... no, knock ‘em back!</i>” She throws the drink back and belts out a belch so powerful that some of the other patrons look her way. Gazing at the way her plush form is swaying and jiggling, utterly lost to the effects of alcohol, you realize that you’ve won, and the bartender confirms it when he lets you know that she’s cut off.");
			output("\n\n<i>“Shit, I lost?</i>” Kiro looks completely shell shocked. <i>“I was... I was winning!</i>” She leans her whole body against you, tits pressing on either side of you. <i>“Y-you... you think I’m a winner, right, [pc.name]?</i>”");
			output("\n\nYou nod while standing, dragging her body with you as you both sway a little. You sink a  hand into her plump ass, squeezing it enthusiastically as you start to lead her away. <i>“Come on Kiro, you have a bet to own up to.</i>”");
			output("\n\nShe purrs, <i>“Yesh, " + player.mf("shir","ma’am") + "!</i>” while allowing herself to be lead back towards her ship. The front of her leotard abruptly begins to strain into an obscene tent long before you make it there, and Kiro’s drunken wobbles quickly turn into a sexy, horny sway.");
			processTime(73);
			//9999
		}
		//Losing fork
		else
		{
			output("\n\nYou’re really feeling it! Fuck, these drinks are strong, and your center of balance is starting to slip a little if the way you keep bumping into Kiro is indication. You nearly fall off your stool after a particularly raucous joke, but Kiro catches you with her tail, bouncing you right back up onto your seat before you even realize you’re falling.");
			output("\n\n<i>“Whoah there, [pc.name]. You sure you’re good for another shot?</i>” Kiro asks with a note of concern in her voice.");
			output("\n\n<i>“Fuck yeah!</i>” You grab the waiting shot and down it, barely even tasting the stuff as it burns a path of fire straight into your gullet. <i>“That’s the shtuff!</i>” You lean over to your tanuki companion, meaning to put your arm around her, but somehow, you wind up grabbing a handful of her tit instead, squeezing and kneading her big, jiggly jug before you even have a chance to realize what you’re doing. Damn, those knockers are divine. You hand is still squeezing, still groping, and a drunken smile plasters itself across your face.");
			output("\n\nKiro gently grabs you by the wrist and moves your hand down to her thigh, where it resumes its pleasant squeezing. <i>“[pc.name], you’re drunk. I don’t even know if you could stand at this point.</i>” She turns to the bartender. <i>“Hey barkeep, is " + player.mf("he","she") + " cut off yet? I don’t think " + player.mf("he","she") + " can handle any more.</i>”");
			output("\n\nThe bartender nods to Kiro. <i>“A real shame too, I thought you might of found somebody who could out-drink you.</i>”");
			output("\n\nThe striped seductress smiles at you as she guides your reflexively squeezing hand into her crotch where it can find purchase, letting you get a good, firm feel of her filling sheath and bulbous balls. <i>“I hope you like what you feel, because you’re going to be getting a lot more familiar with each other for the rest of the day.</i>” She pulls you tight, dragging you out of your seat and towards the exit. <i>“Let’s get you back to the ship. You’ve got a cute look on your face and I know just what you can fill that mouth with.</i>”");
			output("\n\nAs she leads you stumbling through the corridors, you keep falling against her, every time getting a few handfuls of her curvy form before she pulls you up with a smile. By the time you’re halfway there, the tanuki-herm is pitching a tent big enough to house a circus, and you keep finding reasons to catch yourself on it or her breasts, squeezing and groping in equal measure.");
			processTime(73);
		}
	}
	//Cheat
	else
	{
		output("\n\nWhatever the case, Kiro can’t stop herself from telling tales in between drinks, and whenever she turns her back to embellish a detail to a neighbor or to stop off at the <i>“little herms room,”</i> you make sure to swap your drink for your neighbor’s empty glass. On one hand, this makes you rather popular patrons. On the other, there’s no way you’re going to lose this contest. It’s win-win. Kiro is drinking twice as many drinks and the effects soon show themselves upon the increasingly plastered tanuki’s face.");
		output("\n\nKiro is wobbling back and forth on her barstool, practically hanging off your shoulders in order to stay upright as the bartender returns with two more shots. Kiro giggles down into hers, hefting it aloft and spilling a bit over the sides. <i>“Thish ish one of my favorites! Come on, [pc.name]! Let’s... knock ‘em... knock ‘em up. Wait... no, knock ‘em back!</i>” She throws the drink back and belts out a belch so powerful that some of the other patrons look her way. Gazing upon the way her plush form swaying and jiggling, utterly lost to the effects of alcohol, you realize that you’ve won, and the bartender confirms it when he lets you know that she’s cut off.");
		output("\n\n<i>“Shit, I lost?</i>” Kiro looks completely shell shocked. <i>“I was... I was winning!</i>” She leans her whole body against you, tits pressing on either side of you. <i>“Y-you... you think I’m a winner, right, [pc.name]?</i>”");
		output("\n\nYou nod while standing, dragging her body with you as you both sway a little. You sink a  hand into her plump ass, squeezing it enthusiastically as you start to lead her away. <i>“Come on Kiro, you have a bet to own up to.</i>”");
		output("\n\nShe purrs, <i>“Yesh, <i>“ + player.mf("shir”</i>,"ma’am”</i>) + <i>“!</i>” while allowing herself to be lead back towards her ship. The front of her leotard abruptly begins to strain into an obscene tent long before you make it there, and Kiro’s drunken wobbles quickly turn into a sexy, horny sway.");
		processTime(73);
	}
	//9999 route win/loss conditions!
}


//Lost The Contest - LIKE A BITCH
//Girls and Unsexed Turned Into a Drunken Cocksleeve
function lostTheDrinkingContestWithKiroAndTurnedIntoCocksleeve():void
{
	clearOutput();
	showKiro();
	output("The <i>“snap-hiss”</i> of a ship door sealing behind you shatters the drunken, groping stupor you slipped into, and you rouse yourself from your prison of breasts. Kiro had been dragging you along, your face pulled down into her sizeable chest, letting you drunkenly motorboat her on the way to her quarters. The closer you got, the slower the two of you were forced to travel, but you were in no condition to mind - not until now, anyway.");
	output("\n\nKiro’s heavy, tumescent horse-boner has risen to full size, stretching the material of her top to a ludicrous degree. Grabbing hold of your [pc.face], she pulls you ");
	if(pc.tallness < 55) output("up");
	else if(pc.tallness < 70) output("over");
	else output("down");
	output(" and into a forceful, alcohol-lubricated kiss. Your tongues twine together seemingly of their own volition, your own acting even before you become aware of the tanuki-girl’s thick oral organ slipping through your lips. You’re swaddled up in her plush, cushy form, enjoying the feel of her soft body around yours, sinking into her pillowy bosom as you give your tongue up to her ravishing kisses. Your mouth is getting fucked while Kiro’s boner grows harder against your [pc.belly]. It pulsates hotly, hungrily flaring against your [pc.chest], the equine column growing more excited in anticipation of plumbing you in the same way her tongue is.");
	output("\n\nThe room swims around you, and you hang on to Kiro for dear life, clinging tightly to her heavy breasts to keep from tipping over. Even with the plush tanuki’s form cradling you, you both nearly go end over end onto the floor. Kiro catches a handhold just in time to arrest your tipping forms, breaking the kiss to say, <i>“Whoah! Almost knocked me over, you eager little cock-sleeve.</i>” She ruffles your hair affectionately while slowly licking across your lips. <i>“Why don’t we get you off your feet so that you can put that mouth to work in safety.</i>” She undoes a snap, causing her top to pop open and free both the upper portion of her boner and her hard, black nipples.");
	output("\n\nForcing you onto her rigid nipple, Kiro begins to drag you back towards her chambers, and you’re just drunk enough to go along with it without much thought. You part your lips and let the pebbly little bud slip inside, licking and sucking at it encouragingly as you’re brought to a better place to fuck. Held like this, forced onto a nipple, you actually feel very warm, comfortable, and safe, but at the same time, you’re getting increasingly aroused. Your [pc.vagOrAss] is tingling in anticipation. There’s just something... enticing about this, something wonderful about being taken, dragged along and expected to serve whatever sensitive organ you’re presented with. You lick around the circumference of her puffy areola and sigh contentedly. You can’t wait to get to her bed.");
	output("\n\nKiro abruptly pushes you off, throwing you back with such force that you go flying away, a betrayed look painted across your face as you fall. {Pomf! }Your descent is arrested by super-soft cushions. Giggling inanely, you stretch out, sinking into the downy-soft surface of the captain’s bed.");
	output("\n\n<i>“Fuck, you’re drunk, angel,</i>” Kiro purrs as she climbs on atop you. <i>“Not that I mind at all. You seem so... willing when you’re drunk.</i>” She shimmies out of her outfit and allows her cock to flop down across your [pc.chest], drooling a clear stream of pre toward your neck. The potent, pheromone-laced musk makes your head spin twice as fast as before, your body flushing in uncontrollable response. She’s so... big and hard, so veiny and achey. She needs something wrapped around that cock, you realize, and you’re just the person to do it. That mammoth slab of meat – twenty inches or more and still seeming to grow somehow – gets closer to your mouth. Your eyes cross to watch it, taking in every detail of the pulsating phallus. Its head already twitching in little mini-flares, expanding in anticipation of the pleasure to come.");
	output("\n\nGiggling in excitement, you tip your head up to lick up the oozing precum, but instead, you wind up slipping along the outer edge of the growing flare. Your coordination isn’t quite what it would be sober. Trying again, you grab hold of the slippery, dark prick, clutching it in both hands as you try to get a taste of the drinking champion’s slick juice. This time, your [pc.tongue] makes contact with her urethra. It’s immediately coated in semi-transparent goo. The cockjuice floods out as soon as your slick protrusion slips against its blunted head, wicking down to your lips. You slobber all over it, letting your [pc.lips] kiss against it and your [pc.tongue] slip inside for more, polishing Kiro’s rod to a spit-shine. It feels so warm and wet and... well, sexual that a shiver runs down your spine.");
	output("\n\n<i>“That’s it. Get it nice and wet, [pc.name]. You keep licking until your throat is nice and slick with that pre. Get it all over.</i>” Your owner for the day sighs after that and begins to fondle herself, one hand playing with her still-moist teat and the other fondling the sensitive folds of her sheath, fingering the moist interior in a way that pleases the nerve endings on both sides. She moans, and a fresh flow of pre-cum erupts onto your [pc.tongue]. Obediently, you gulp it right on down. Her slippery release is getting all over your [pc.face], but most importantly, it’s filling your mouth and throat in a way that makes you feel warm. Drunken pride and love rise up within you, encouraging you to further acts of debauchery. Soon, you’re jacking off her length right into your mouth, your [pc.lips] stretched obscenely around the bulging flare as it paints a river of pre across every internal surface.");
	output("\n\nBusily swallowing, you’re oblivious to the way your actions are making Kiro’s hips twitch and lurch, barely stopping themselves from pistoning forward with enough force to jam her immense tool straight into the back of your throat. You gurgle as the flow of pre-cum thickens and wrap your hands around the shaft, touching fingertip to fingertip as you form your hands into a sleeve of pre-lubricated pleasure, pumping them back and forth to squeeze out even more of her delectable drink.");
	output("\n\nKiro groans, <i>“That’s a good slut, drink it up. I bet your throat is nice and slippery by now, huh?</i>” She’s got one hand stuffed up her sheath, playing with the sensitive, concealed portions of her prick, and the other cradling the bottom, stroking along with you.");
	output("\n\nNot thinking much of it, you nod; your throat is certainly thickly coated with the stuff, marked with her anticipatory pre-spooge in a way that makes you feel... less, perhaps even owned.");
	output("\n\nUrkh! As soon as you finish your thought, an orifice-gaping column of meat slides across your tongue and straight into your mouth, battering straight down your receptive throat with lubricated ease. Even now you can feel it burrowing down towards your stomach, the flare expanding somewhere deep inside you in a way that makes you doubt she could pull out if she tried. You’re too drunk and confused for your gag reflex to even work properly. One moment, you were guzzling thick, tangy cockslime down, the next, you’re choking on a three-inch thick, pulsating horse-cock. It fills you, each of its prick-distending heartbeats stretching your esophagus with pounding force.");
	output("\n\nSlapping against your face, Kiro’s [kiro.balls] come to rest against your chin and lower lip, the soft fur slicked down with sweat. They’re twitching up and down inside their [kiro.sack], eagerly working to disgorge the leaking pre. <i>“Lick,</i>” comes an imperious command. With nothing else to do and a calm sort of accepting haze settling over your oxygen-deprived mind, you reach forward to cup the ");
	if(kiro.ballDiameter() >= 7) output("huge");
	else output("nicely-rounded");
	output(" orbs, feeling their weighty heft in your hands while you extend your cock-smothered muscle to taste the taut skin surrounding them.");
	if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output(" Your [pc.tongue], thanks to its length, has no trouble wrapping around the entire package, squeezing it as it curls around,");
	else output(" Your [pc.tongue] roams over the portions of Kiro’s prodigious nutsack that it can reach, worshipping with powerful undulations,");
	output(" drawing pleasured moans from Kiro that you’re sure mean nothing but an impending climax.");
	output("\n\nThrowing her head back, mouth adorably agape, Kiro moans, <i>“That’s it! I’m cumming, [pc.name]! I’m gonna cum right into your belly, ");
	if(pc.tallness < 56) output("little ");
	output("cock-sleeve!</i>” Her flare stretches inside you, uncomfortably widening something that isn’t supposed to be widened. The entire length is completely locked inside of you, sealing itself into your belly, pulsating as bulge after bulge of thick seed travels down the trapped shaft deep into your gullet. It’s deposited, glob after glob, right into your belly. All you can feel is your heart going crazy due to oxygen deprivation, the immense arousal caused being used in such a way, and the subtle, growing feeling of fullness in your middle. That last feeling grows in rhythmic pulses until it overwhelms the other two, leaving you marvelling at the gentle swelling of your [pc.belly] and the tightness that seems to surpass all reason and sense.");
	output("\n\nYou close your eyes and gurgle, nearly blacking out around the cum-pumping rod in your throat, when the tanuki-girl decides to withdraw, yanking her still-spurting mast out of your well and truly violated throat.");
	if(kiro.ballSize() < 10) output(" A trickle of drooling dickslime pours out of the half-flared tip all over your [pc.face] as it spends the last of its lusts, sated for now.");
	else output(" Amazingly, Kiro’s swollen balls have enough inside them to keep cumming. Rope after rope launches out of the still-flared tip, painting first your face, then your [pc.hair], then your [pc.chest] in rapid succession. It even launches a wad so big that it bursts across your [pc.face] like a water-balloon, covering every inch of your head in Kiro’s powerful spunk. You swallow what little more you can, given your state, and try to breathe, rubbing her jizz into your [pc.skinFurScales] and more and more of it emerges to soak you from the waist up. You’re so busy enjoying the one-woman bukkake show that you don’t even register it stopping; you’re too absorbed with wallowing in her soupy cum too much.");
	output("\n\nKiro slaps you in the face with her receeding cock-tip, splattering some of the slowly-drying spooge onto the bedsheets. <i>“Come on, slut. Let’s get you a cold shower. I’ll have a load for your [pc.vagOrAss] soon enough, but I want you somewhere a bit easier to clean up first.</i>”");
	output("\n\nYou nod mutely and stagger up to your feet, cradling your bloated belly. You feel like a living cum-tank with how stuffed you’ve become, and it’s only going to get worse.");
	if(pc.hasVagina()) output(" That doesn’t stop [pc.eachVagina] from feeling so hot and wet that droplets are streaming down your [pc.legs].");
	else output(" That doesn’t stop your [pc.asshole] from tingling in anticipation of the creme-filling to come.");
	output(" Following obediently behind the mistress-for-a-day, you sheepishly burp on your way towards the next of many fucks to come.");
	pc.loadInMouth(chars["KIRO"]);
	processTime(25);
	kiro.orgasm();
	pc.lust(3000);
	clearMenu();
	//9999 route to loss epilogues!
}

//Unisex Loser Handjob
function unisexLostToKiroAndGaveHerAHandJobBecauseDrunkenSluttery():void
{
	clearOutput();
	showKiro();
	output("Hissing pneumatics fill your ears with the sharp sound of an airtight door sealing behind you. Pulling your face out from between Kiro’s pillowy tits, you let your drunkenly wavering attention sway across the metal deck plates and up the wood-paneled walls. The realization that this is <i>her</i> ship and not your own takes its sweet time swimming through your booze-saturated consciousness. Remembering that you lost over being a cocksleeve for a day... That takes a little longer - about the same amount of time it takes Kiro to push you");
	if(pc.isTaur()) output(" over");
	output(" onto her bed.");
	output("\n\nUnwashed sheets thick with her unique sexual scent rumple around you as you touch down. It isn’t body odor you smell; at least, you don’t think so. No, there’s something else that her sheets exude: a musky, fragrant odor backed by a hint of feminine tang.");
	if(pc.hasCock()) output(" You realize that it smells a bit like your own sheets did after a particularly wet dream.");
	output(" Filling the air around you, the cloying, pheromone-filled aroma tickles its way down your nasal passages with every breath. The pirate-herm’s inexhaustible libido has been vented here innumerable times, and as you sink down into the cushiony bed and its sexual musk, you resign yourself to being subsumed in them.");
	output("\n\n<i>“Hey!</i>” A hand slaps your [thigh] to get your attention. <i>“");
	if(!pc.isNude()) output("Lose the gear.");
	else output("Get naked.");
	output("</i>”");
	output("\n\nYou blink through bleary eyes to regard the owner of that unwelcome hand. It’s Kiro, of course. Right... you lost a bet to to that impressively endowed Kui-Tan. Her pillar of equine fuckmeat is already exposed, towering over you and expanding with powerful need, pulsing hotly at your supine form. It’s ready to take you, to you use as a.... What did she say? Oh, right. A cock-milker. She’s going to use you as a cum-squeezing dick-sleeve until her balls go dry or twenty four hours pass, whichever happens first. You lick your lips without meaning to, her smell stronger in your nostrils. The air is thick with the scent of fuck, and your body is responding powerfully to it.");
	output("\n\n<i>");
	if(!pc.isNude()) output("Get naked.");
	else output("Lose the gear.");
	output("</i> That’s what you need to do. It’s surprisingly easy to do, even so inebriated. After all, you’ve had a lifetime of practice at undressing to go to bed. Your limbs move with almost automatic efficiency, even slowed by a nerve-deadening substance poisoning your bloodstream. One possession after another is tossed off the side of the bed. The last thing to go is the codex. It slips through your near-nerveless fingers to fall the few inches onto your other things, piled up in an untidy bird’s nest upon an even bigger mess of clothes, sex-toys, and trashy porno mags.");
	output("\n\nYou’re so focused on getting ready for bed that all thoughts of Kiro and her looming stallion slip your mind, at least, until you rise up with your labors complete, intend on dropping back after a quick stretch. Instead of the open air you expect, your cheek comes into contact with a turgid, slobbering mare-filler, the ridgy tip oozing a trickle of slick heat across your [pc.skinFurScales] in excitement.");
	output("\n\nYour surprise is as complete as Kiro’s cock is hard, and you fall back onto her pillow, arms windmilling. One slips across the side of the bouncing, throbbing tool and you twist violently, your other hand wrapping it further down in an instinctive bid to right yourself. The only thing you succeed in doing is drawing a low, lewd moan out of the back of Miss Tamahime’s throat and coaxing a droplet the size of baseball out of her flare. The gathered pre-cum falls straight onto your [pc.chest], splattering everywhere. It coats you from belly to nipple in a solid sheen of sex-juice so slick that butter could envy you.");
	output("\n\nGetting your bearings, you stop your spastic attempts to master the situation and settle in for the long haul, one hand already in place and the other coming up to join it, fingers trembling in anticipation. The electric contact of skin on skin, slippery dick sliding through your hands, causes an involuntary flush to wind its way up through you. And why shouldn’t it? You’re on your back in a strange woman’s bed with a debt to settle. Your strokes are tentative and slow at first, perhaps even a little experimental. Kiro doesn’t seem to mind. She bites a pouty lower lip, muffling her groan and shifting her hips back and forth with slow motions, encouraging or begging you to speed up. You aren’t sure which.");
	output("\n\nThis really isn’t that bad. Sure, the room is swaying, and your internal organs are likely to be forcibly shifted before long, but everything about this woman seems sexual in the low light of her quarters: her lusty, roving eyes, the subtle shifts of her hips as passion overwhelms her. Hell, even the sway of her churning balls seems oddly enticing and erotic. Your eyes lock onto her tits as Kiro squirms in your grip, and you’re treated to the sight of her lovely melons jiggling ever so slightly along with her motions. They’re big enough to be more than noticeable - big enough to titfuck too, but they aren’t so big that they sag or look like the cartoonishly-endowed women you’d see in certain types of pornos.");
	output("\n\nNow humping your hands, Kiro purrs, <i>“Now this is the kind of service I expect in a milker. Even with a rig like mine, nothing beats the feel of another person’s hands on you, stroking and rubbing and mmm.... I could stay like this all day.</i>” A river of pre is oozing out of her dilated cum-slit now, some running down your arms while the rest drips off her sack and thighs. <i>“Do me a favor and put one of these on it. My sheets are sticky enough,”</i> she bids as she tosses a reflective package onto the growing puddle ");
	if(pc.biggestTitSize() >= 3) output("between your [pc.fullChest]");
	else output("on your [pc.chest]");
	output(".");
	output("\n\nIt’s a condom. A big, honking condom. The wrapper is covered with a printed image of some furry fox with a giant horse-cock. The thing must have cost a fair few credits, judging by size and assurances stamped upon its packaging. <i>“Ultra strong,”</i> says one such endorsement. Another spouts, <i>“Guaranteed not to rupture from anything short of a supernova!”</i> Musing that the last promise is a bit over-the-top, you bite down on the corner and tear. Your hands are too slick with Kiro’s fuck-juices to get a proper grip anyway. The pre-packaged prophylactic falls right out onto your palm. It’s almost three inches across, and it still looks a bit too small for your mistress-for-the-night’s boner. You roll the rubbery nano-woven condom across her anyways, struggling a bit as her constantly-leaking pre-cum starts filling the reservoir, causing you to slip and slide while massaging the edge of the condom over the lip of her flare.");
	output("\n\nKiro’s [Kiro.nipples] jut out hard above you, erotic silhouettes haloed by the dim flare of artificial light. Her hands reach for them as you roll the rubbery-feeling sheath past the first foot of her length, not stopping until it contacts an entirely different sheath, and even then, you roll it down inside her musky, organic cock-sock, ensuring the whole of her mammoth meat is shrink-wrapped for maximum freshness. You stifle a drunken giggle.");
	output("\n\nRubbery texture glides past your fingertips without even an ounce of friction thanks to the soaking Kiro gave your hands. Her thick pre is still dripping off of them onto the covers and your upper body - the same one that’s still drenched from the cannon-like discharge she dropped on you earlier. You’re a drunken, sloppy, wet mess whose sole job is to lie there and pleasure the cock above it, and that knowledge actually excites you. You playfully caress one of her veins, feeling it pulsate in your grip before you slide lower, rubbing and squeezing and just stroking that big fat prick as the reservoir starts filling, every passing second seeming to bloat it bigger, faster than before.");
	output("\n\nThe expanding orb at the tip of the prick-toting pirate’s member is all the encouragement you need to increase the pace of your cock-pleasing ministrations. Audible sloshing mixes with the sound of the condom expanding at every stroke, and you’re going faster now. Your hands are wrapped around Kiro’s tree-sized tool, thumbs connected and fingers not quite able to meet at the top, pumping it hard and fast. The lubricating pre-cum froths into a heady foam from your stroking, and Kiro’s scent seems to thicken into a fog in the air. You’re so turned on that, honestly, if you were to leave the room and walk into a purified chamber you’d miss her pheromone filled sex-musk. You’d crave it, just as you crave watching that expanding bubble bloat into a waterbed’s worth of jism.");
	output("\n\nKiro throws her head back and openly ruts against your palms. The muscles of her thighs flex and squeeze, visible even through her thick fur as she throws her pelvis to and fro in a frenzy, fucking your hands even as you stroke her off. Her chestnut curls bounce wildly as her visage lolls a little to the side and her mouth droops open, tongue hanging out as she pants. Bouncing behind her, her tail thumps hard into the deck plates, smacking down to punctuate the apexes of her hips’ fuck-crazed undulations.");
	if(silly) output(" You swear that if she were to hit it any harder, she’d likely launch into flight.");
	else output(" You swear that if you fucked like this anywhere else, you’d have half a city block leveling noise complaints with U.G.C. peacekeepers.");
	output("\n\nAll the while, the condom’s reservoir is stretching... filling. Already, it’s as big as a grapefruit. The fluid contained within is mostly clear with a hint of white to stain it; she’s not even cumming and yet Kiro’s grown a cantaloupe worth of pre-cum at her tip so heavy that it’s dragging her length down towards your [pc.face]. The pre-orgasmic twitchings of the tanuki-girl’s mast struggle mightily with the increasing weight. Each time the trapped juices threaten to bounce against your nose, they lurch back upwards, but at some point, even the potent force of Kiro’s lust cannot hold them aloft alone.");
	output("\n\nIt’s up to you to keep the lusty Kui-Tan’s cock in prime cumming position, so you flex your arms and push, helping to hold Kiro’s swollen dong aloft, even with the basketball-sized ball of anticipatory jism dangling from its equine-shaped head. Her thanks is a whimpered moan of delight and an uptick in both her motions and the filling of the condom. The extra pressure on the bottom of her cock must be exquisite, because her sack is tightening and relaxing with such powerful, rhythmic contractions that you’re sure she’s going to cum soon. Even her urethra is stretching out, bulging against your hands, expanding to handle a wave of onrushing juices that’s going to spray out any second now.");
	output("\n\nThe woman you’re going to spend the next day servicing moans, not as a quiet whimper but as a loud, unconditional announcement of pleasure, and somehow, she manages to cry, <i>“I’m cumming, [pc.name]! Get a good look at this condom, because I’m doing it to your ass next!");
	if(pc.hasVagina()) output(" And maybe your pussy, if you’re lucky.");
	output(" Yessss!</i>” The last word trails off into a hiss, and explosively, that drooping sphere of pre-cum stretches horizontally, a torrential liquid gushing doubling it in size and turning it a creamy, opaque white all at once.");
	output("\n\nAs the first of jet of Kiro’s hyper-productive lust slacks off, the drooping spunk-bubble surrenders to gravity, sagging right down across your eyes to block off your vision. You scooch down a bit to get out from under it and keep stroking, feeling the way the meaty girth between your fingers expands and contracts as it disgorges the next wave of jism above you. The syrup-thick spooge roils wildly as it expands up against your [pc.hair]. You do the only sensible thing you can do in such a situation and lean forwards so that you can use the burgeoning cum-sack as a squishy pillow. Only this pillow is expanding out to either side in huge squirts of motion wrapping around your shoulders as you empty Kiro’s quaking nuts straight into the artificial enclosure.");
	output("\n\nThere’s one last titanic ‘splort’ into the roiling nano-weave package. Giving Kiro a few tentative squeezes, you test to make sure she’s finished. The way she sighs at your touches tells you that yes, she did cum, and she feels very, very good right now. A soft, padded hand pats you on your head a moment before Kiro tumbles into bed with you, resting her head against the jiggling, white pillow.");
	output("\n\nThe space-pirate sighs, a trace of alcohol faint on her breath as she pants, <i>“Rest up. Once I get this off and clean up a little, I’m going to use you again. I’m going to have you get me off until you can’t move without me dripping down your legs and tainting your breath. I’m going to leave you looking like a pregnant woman who just filmed bukkake porn. And then I’m going to clean you up and do it again.</i>” She strokes your jaw. <i>“You’re going to smell like my cum no matter how many showers you take for weeks, [pc.name]. Aren’t you glad you took that bet?</i>”");
	processTime(33);
	pc.lust(3000);
	kiro.orgasm();
	//9999 epilogue shiiiiiz
}

//Lose Epilogue Stand-in
function lostDrankinContestToKiroz():void
{
	clearOutput();
	showKiro();
	output("Kiro uses you for hours upon hours. When you’re awake, she claims every single hole as her own, multiple times. When you’re asleep, she snuggles with you, clinging protectively to you with her immense tool plugging you from behind. She leaves at least one nocturnal protein snack for you in the morning. After that, you both shower, and she eats breakfast. You wind up sucking her off under the table for your meal, even though you aren’t really hungry at this point. Your Kui-Tan Mistress insists on it.");
	output("\n\nIt is a long, sexually exhausting day, but when you leave, it’s as sexually sated as you’ve ever been. Unfortunately, you find yourself thinking of sex a little more readily afterward, almost eager to sink back into the constant depravity you’ve just escaped.");
	pc.loadInMouth(chars["KIRO"]);
	pc.loadInMouth(chars["KIRO"]);
	pc.loadInAss(chars["KIRO"]);
	pc.loadInAss(chars["KIRO"]);
	if(pc.hasVagina()) 
	{
		pc.loadInCunt(chars["KIRO"],rand(pc.totalVaginas()));
		pc.loadInCunt(chars["KIRO"],rand(pc.totalVaginas()));
	}
	processTime(1380);
	pc.orgasm();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Won the Contest
//Drunken Kiro Blowjobs - Slobbery Jaw-Filling Goodness
function wonKirosContestLikeAChampAndGotBlown():void
{
	clearOutput();
	showKiro();
	output("<i>“Now,</i>” you say, leaning against the wood-paneled interior of her ship, <i>“I believe I was promised a hermaphrodite fuck-pet in exchange for winning our little wager....</i>”");
	output("\n\nMiss Tamahime, for all her previous bluster and confidence, drops onto her knees before you, her body pressing back against her huge, fluffy tanuki tail as it rests on the wall. She dazedly blinks her eyelashes and coos, <i>“What can your fuck-pet do for you, [pc.master]?</i>”");
	output("\n\n");
	if(pc.isCrotchGarbed()) output("Pulling your [pc.cocks] out of your [pc.lowerGarments]");
	else output("Hefting [pc.oneCock] in your hand");
	output(", you shed your gear into a pile behind you. <i>“For starters,</i>” you begin, <i>“you can suck down something non-alcoholic. I know you’re a thirsty girl.</i>” You tap her on the nose with your [pc.cockBiggest], immediately getting a bit more erect from the skin-to-skin contact. <i>“A little protein supplement might do you some good.</i>” You let go to grab hold of her cinnamon-hued curls. The burnished brown tangles catch in your fingers as you pull her roughly towards your groin, pressing her face against your [pc.cockBiggest] hard enough that you feel her nose sniffing at it and her lips compressing softly against it, just above the [pc.cockHeadBiggest].");
	output("\n\nKiro noisily snuffs at your cock. The very tip is moist and cool as it drinks in your masculine organ’s musk. Her eyelids flutter closed, and her lips press harder on you the veiny slab of tumescence, a warm, hot tongue slipping between them to lap at the sweat that girds the organ. She slurps her tongue back into her maw just in time to spool it out further, licking all the way down to your [pc.cockHeadBiggest] and back up again. Pressing back on your until you bump the polished panel behind you, Kiro lavishes your boner with affection, slobbering kisses and slurps down in between panting breaths, her plump, juicy lips compressing down in juicy, worshipful kisses. One hand grabs you just above your [pc.sheathBiggest], jerking it with gentle strokes, palm up and fingers squeezing.");
	output("\n\nPulling back, still connected by a hanging strand of spittle, Kiro whispers, <i>“Like this, [pc.Master]?</i>” Her eyes look a little glazed, but her voice is steady and husky with passion. Bet or no, she’s into it.");
	output("\n\nYou give a slow, deliberate nod and gently recline back against the polished wall, jutting your hips slightly forward to press your [pc.cockBiggest] back against Kiro’s cock-hungry face. She grabs hold of your penis with both hands, squeezing it, and she gulps nervously, perhaps eagerly. You can’t really be sure, but what you can be sure of is that when she opens her mouth and slurps her lips down around your [pc.cockHeadBiggest], it feels like being immersed in a puddle of distilled heaven. [pc.EachCock] thickens perceptibly from the incredible sensation");
	if(pc.cockTotal() > 1) 
	{
		output(", even the one");
		if(pc.cockTotal() > 2) output("s that aren’t");
		else output(" that isn’t");
		output(" being handled at the moment");
	}
	output(".");
	if(pc.cockTotal() > 1) output(" Kiro’s hands stretch out to take up the unbound cockflesh, stroking and tuggling, massaging your skin with steady strokes, the plush pads on her fingertips making love to your every inch.");
	output(" She never quite takes you inside her mouth, instead polishing the tip, licking and teasing until you express the first drop of pre onto her her tongue.");
	output("\n\n<i>“Mmmmm,</i>” the well-endowed herm purrs. <i>“Such a lovely cock.</i>” Her own erection, mast-like in stature, has tented up between her tits, distending the elastic fabric that comprises her outfit in such a way that leaves little to the imagination. In fact, you can see ribbons of clear-colored pre bubbling right out through the pores of the cloth, staining it as it runs down the front of her obstructed cleavage. Kiro moans, squeezing her immense mammaries down into a crushingly-tight titfuck, sliding her silky-soft fuckpillows along her girthy shaft with enthusiastic bounces, driving herself into a lusty frenzy that soon manifests itself in her oral actions.");
	output("\n\nKiro’s kissable black lips open to reveal a vortex of pleasant suction, grabbing hold of your [pc.cockBiggest] and pulling it in. The vacuum-tightness of her inviting opening causes your [pc.cockHeadBiggest] to swell up inside her, followed rapidly by the excited inches chasing in after. You gasp out loud when she groans. Her vocal revelation of enjoyment vibrates right through your shaft even as it is gobbled down, sucked so deeply that your [pc.cockHeadBiggest] is pressing into the back of her throat. She doesn’t slow or pause in the slightest. Tipping her head back, Kiro lets it slide right on into her throat, using the whole of her upper body as a cock-pleasing vessel: her face and neck for your tool and her tits for her own endowment.");
	output("\n\nFingers spasming in pleasure, you lamely stroke her hair and shudder against her lustrous cockpillows, feeling them glide along your sensitive veins all the way up to your [pc.sheathBiggest]. Kiro shudders around your ecstatically trembling tool for a few hammering heartbeats and abruptly reverses direction, easing off your [pc.cockBiggest] while meeting your eyes. Her gaze fixedly locks on yours, making love to you while her suckling kissers cling to your departing length with tightness a condom would envy. They pop off your [pc.cockHeadBiggest] with an audible slurp, though her tongue reaches out to gather a droplet of precum from the departing phallus.");
	output("\n\nGasping for breath, Kiro pants, <i>“Did fuck-pet please [pc.Master]?</i>” Her warm breath washes across your [pc.cockHeadBiggest], and you struggle to keep yourself from ramming straight back into that oral vice.");
	output("\n\nInstead, you nod and babble, <i>“");
	if(flags["KIRO_DEEPTHROATED_YOU"] == undefined) 
	{
		output("Does your race not have a gag reflex or something?</i>”");
		output("\n\nKiro smiles beatifically, giggling. <i>“Nooope!</i>” She affectionately strokes herself through her bodysuit, her leaky pre turning white as excitement thrums through her body. <i>“I just happen to have the best blowjob teaching tool a girl could ask for.</i>”");
		flags["KIRO_DEEPTHROATED_YOU"] = 1;
	}
	else
	{
		output("\n\nHow do you get better at this every time?</i>”");
		output("\n\nKiro giggles, rubbing herself through her bodysuit and your [pc.cockBiggest] at the same time. Leaking, white-tinted pre escapes from her flaring tip as she works, tainted with sperm thanks to her excitement immense cum production. <i>“Lots of practice.</i>”");
	}
	output("\n\nParting her spit and pre-soaked lips wide once more, she guides you right back into her cum-hungry maw. The passage into her throat is even smoother and slicker than the last time thanks to the liberal coating of saliva now lubricating it. That constricting tightness squeezes tight around your [pc.cockHeadBiggest] while her tongue slips and slides across your urethral bulge, polishing the underside of your rod with lusty strokes. Her hands stay busy down below, bouncing her breasts up and down repeatedly around herself. A wet stain is spreading through her strained garment. By now, the entire front half is soaked in sticky, musky pre-cum, and she’s still dripping more.");
	output("\n\nYou’re in a similar situation. As soon as her plump, wet lips touch down against your [pc.sheathBiggest], your internal muscles clench spastically and spurt a tiny droplet of [pc.cum] straight into her throat, bypassing Kiro’s tongue entirely. The drunk, cock-sucking tanuki doesn’t even get to taste the preview of your oncoming ejaculation. Your dripping, constantly leaking pre-cum escapes her tongue’s taste buds as well, at least until she slips back off, starting up a rhythm that has her bouncing her onyx cockpillows off your crotch with excited-sounding slurps, only interrupting the staccato suck-symphony with occasional gasping breaths.");
	output("\n\nKiro vibrates her way through increasingly vocal, muffled moans, the reverberations drawing groans of pleasure from you simultaneously. The halls of her ship echo with the paired vocalizations. It’s a good thing the ship is empty, because you don’t think you could keep from crying out in glee and the wonderous cock-worshipping you’re getting. The muscles in your [pc.legs] are twitching violently, spasming around. You’re getting closer and closer, drawn all the way to precipice of pleasure by the suckling tunnel that’s pulling you deeper and deeper, twining around your shaft with ribbons of hot, wet, bliss.");
	output("\n\nGrunting, Kiro accelerates the place of throatfucking, bouncing herself up off her tail to maintain the vigorous throatfucking. Each time her lips press against your [pc.sheathBiggest], she sucks a little harder, practically pulling your oozing pre right out of your opening cumslit. Your whole shaft is thickening inside her, stretching her throat wider and wider. Kiro gurgles messily around it, but she keeps it up, meeting your gaze as she does so. Her eyes seem to be boring right into you, two pools of liquid lust just begging you to release into her mouth, asking you to pack her belly and coat her throat with your jism.");
	output("\n\nYou could not make her wait at this point if you wanted to. You grab hold of her rounded ears and pull her forward, planting your [pc.cockBiggest] as deeply into her maw as possible");
	if(pc.cockTotal() == 2) output(", other cock slipping along her neck");
	else output(", other cocks slipping along either side of her neck");
	output(". The corners of Kiro’s mouth turn up in a smile, and her breasts turn into a blur of bouncing, jiggling, barely-contained titfuck. Pre-cum sloshes and spills out around the top of her clothing, announcing with lurid spurts of stickiness just how filled the tanuki-woman’s top has become. [pc.EachCock] surges with blissful heat, and you let out a low groan of ecstasy, feeling your urethra bulge and your meat flex in her throat, violently spurting ropes of [pc.cum] straight into the drunken hermaphrodite’s tummy. Her cheeks hollow encouragingly, and she winks, not even having to work to swallow thanks to her excellent technique.");
	output("\n\nKiro is sucking you through what feels like the longest, slowest orgasm of your life, greedily taking every single drop of [pc.cumColor] delight directly into her gurgling middle. Her climax arrives hot on the heels of your own, erupting through a gap in her clothing to splatter off her chin. The next floods between her top and her fur, slicking out her sleeves and down her thighs, thoroughly coating her cum. She whimpers around your dick at this, twisting and writhing, letting you fill her while simultaneously soaking herself.");
	if(pc.cumQ() >= 1500) output(" The sheer amount of [pc.cum] you inject into her swells her belly into a noticeable bump. In turn, this causes her still-spurting shaft to bow out under the liquid weight, opening up more room for her own sperm to flood.");
	if(pc.cumQ() >= 3500) output(" By the time you finish, her middle is visibly pregnant, and her cock has been yanked from her tits to futilely erupt along and unaided inside cum-soaked enclosure.");
	output("\n\nPulling out, you drip a last, long strand of [pc.cum] across her tongue, which Kiro greedily gulps down. She opens wide after to show you that it has been swallowed{, and immediately belches, her stomache far beyond its normal capacity}. You can see that her throat has been stained [cumColor], and it gives you a satisfied tingle throughout.");
	output("\n\nKiro sways drunkenly for a moment before sliding on her side, stroking her still-cumming cock until she finishes at last. She moans, <i>“Fuuuuck, [pc.name]. That was good!</i>”");
	output("\n\nTouching her chin with your [pc.foot], you turn her up to look at you. <i>“That’s [pc.Master]. I believe I have the rest of the day to use you.</i>” You may not have specified exactly as such in the terms of the wager, but it was definitely implied. Besides, she’s in no state to argue.");
	output("\n\nKiro burps and sighs, nodding, <i>“Forgiveness [Master], but fuck-pet’s balls are going to swell up so big after this. It’s a Kui-tan quirk.</i>”");
	output("\n\nGrabbing the drunk, temporarily sated tanuki under the arm, you lift her up and start hauling her towards her shower. <i>“I suppose we had better get you cleaned up before you get all anxious for another fuck then, shouldn’t we?</i>”");
	output("\n\nFuck-pet nods.");
	//Pass 30m and reset lust.
	processTime(30);
	pc.orgasm();
	kiro.loadInMouth(pc);
	clearMenu();
	//9999 epilogue
}

//Drunken Kiro Twat Oral
function youWinAContestAndKiroSlobbersYerPussy():void
{
	clearOutput();
	showKiro();
	output("<i>“Now,</i>” you say, leaning against the wood-paneled interior of her ship, <i>“I believe I was promised a hermaphrodite fuck-pet in exchange for winning our little wager....</i>”");
	output("\n\nMiss Tamahime, for all her previous bluster and confidence, drops onto her knees before you, her body pressing back against her huge, fluffy tanuki tail as it rests on the wall. She dazedly blinks her eyelashes and coos, <i>“What can your fuck-pet do for you, [pc.Master]?</i>”");
	output("\n\n");
	if(pc.isNude())
	{
		if(pc.legCount > 1) output("Spreading your [pc.legs], you pat ");
		else output("Adjusting your [pc.leg], you pat ");
		if(pc.totalVaginas() > 1) output("one of ");
		output("your exposed vagina");
		if(pc.totalVaginas() > 1) output("s");
		output(" enticingly, making sure the pirate’s eyes are nice and settled on your needy cleft");
		if(pc.totalVaginas() > 1) output("s");
		output(".");
	}
	else 
	{
		output("Kicking off your [pc.lowerGarments], you expose your moist vagina");
		if(pc.totalVaginas() > 1) output("s");
		output(", patting ");
		if(pc.totalVaginas() > 1) output("them");
		else output("it");
		output(" with your fingertips to make sure the pirate’s eyes are nice and settled on your needy cleft");
		if(pc.totalVaginas() > 1) output("s");
		output(".");
	}
	output("\n\n<i>“For starters,</i>” you begin, <i>“you could drink something down that’s nonalcoholic, for a change.</i>” You smile knowingly. <i>“I’ve got just the thing.</i>” You edge forward, hips swaying, and grab Kiro by the ears, tugging her face-first into [pc.oneVagina]. Her moist, button nose pressing gently against [pc.oneClit] while her lips inadvertently compress against your lower ones. A lusty flush rises through your frame, starting at your crotch and pouring down into your feet before flood every crack and crevice of your being. You let out a moan of pleasure as you work your [pc.hips] in slow circles, dragging your heated entrance back and forth over her lips.");
	output("\n\nKiro flushes, mumbling, <i>“Yes, [pc.Mistress],</i>” as you avail yourself to her face. Your [pc.girlCum] soon gives her mouth a lovely slick sheen, and you pull her back by her fluffy, rounded ears to have a look at her. She’s panting, mouth agape and eyelids heavy, her expression unfocused and undoubtedly aroused. Lending even further credence to your assessment of her ardor, you spy a cylindrical distention straining through her outfit, outlined in stark relief by the elastic fabric. It has risen right up between her breasts, pushing them apart to make room for its pulsating mass. The top of it is capped by a flaring, blunted tip that pulsates and twitches whenever her breasts shift around it.");
	output("\n\n<i>“Is this what you want?</i>” Kiro asks while licking her lips. Her body sways a little as she asks. The ability to sensuously lap up [pc.girlCum] while simultaneously maintaining balance appears to be a little beyond her intoxicated state, but she’s trying anyway. Her tongue is slipping, sliding, and caressing the cunt-slicked curves of her mouth, her eyes locked on you, searching for approval.");
	output("\n\nMerely being in the presence of this hyper-sexed hermaphrodite is enough to send twinges of pleasure through [pc.eachVagina], but having her like this, on her knees and begging for another taste of you, is enough to make you sopping wet with excitement");
	if(pc.wettestVaginalWetness() >= 4) output(". Of course, you’re generally soaking most times. This girl just gets you a little wetter than normal");
	output(". You look down at her cute little face, her slightly-dilated eyes set in the middle of a darker, mask-like patch of fur, and smile. <i>“I didn’t tell you to stop, my little drunken fuck-pet.</i>”");
	output("\n\nNodding in feigned sobriety in the way that only the truly inebriated can, Kiro whispers, <i>“Yes, of course.</i>” She looks back down, inhales, and plunges forward. Immediately, you feel her back against your folds, but this time, she’s not simply letting you rub upon her face. She’s grabbing your hips and licking. Her fingers and squeezing gently as her tongue extends, and she lovingly slobbers across the entirety of your entrance.");
	if(pc.totalVaginas() > 1)
	{
		output(" Her thumbs squeeze in to press in on your other ");
		if(pc.totalVaginas() == 2) output("entrance");
		else output(num2Text(pc.totalVaginas()-1) + " entrances");
		output(", rubbing and squeezing across the slickening flesh, bumping repeatedly against your clit");
		if(pc.totalClits() > 2) output("s");
		output(" with slow circling motions.");
	}
	output(" She tips her head back just far enough to slip your ");
	if(pc.vaginas[0].clits > 1) output("uppermost ");
	output("clit into her mouth and starts to suck.");

	//Huge clit bonus!
	if(pc.clitLength > 6)
	{
		output("\n\nKiro’s cheeks bulge as the feminine organ puffs and swells up inside her mouth. Before she knows it, your stiff clit has swollen to a thick, throbbing pole. Panting around in excitement, she lets it push her off of your [pc.vagina], though her lips stretch out, as if they could still maintain contact with your netherlips by force of will alone. Smooth, nigh-infinite pleasure wicks up along the underside of your [pc.clit] when Kiro’s tongue goes to work. The sides of it fold up on either side to to try and encircle it, not quite able to cover the top but still managing to make your dense nerve endings fire off like firecrackers thrown into a bonfire. You start to slip into her throat one gasping breath later, and the curvaceous raccoon-girl’s lips glide closer to your [pc.vagina], finally making contact once your [pc.clit] is lodged securely in her throat.");
	}
	output("\n\nHumming as she works, your lusty fuck-pet seems perfectly happy to slurp away at your quim. Her eyes have closed, and she seems utterly and completely fixated on getting you off, gulping and swallowing all the [pc.girlCum] she can get, her tongue never slowing in its attempts to get more. The hum she’s making turns into a decidedly feline purr, and the ensuing pleasure nearly knocks you off your [pc.feet]. Somehow you hold on, both hands planted on the back of Kiro’s head, and let yourself slowly ease down towards the metallic floor as the strength ebbs from your [pc.legs] and into your [pc.vaginas].");
	output("\n\nThe masked, cunt-hungry maiden stays firmly sealed against your crotch as you sink lower, her plush pillows suckling hungrily, drawing ever more of your liquid lust from your shuddering form. Your [pc.butt] touches down just in time. You’re so close to cumming that you can’t help but thrust your [pc.hips] upward and grind yourself hard upon Kiro’s lady-glazed face. Spread out in a veil, her curly, cinnamon-colored tangles tickle across your [pc.belly] while she works, hiding her face.");
	output("\n\nFurther below the silky hair, you can see that Kiro’s hands have not been idle. They’re pressing in on either side of her chest, compressing her breasts so mightily that they’re likely to pop out of her top at any moment. A thick pillar of pre-slime is oozing out onto the floor beneath her, spreading into a sticky puddle of pent up lust. Her hands aren’t immobile either. They’re sliding up and down, sometimes together, sometimes back and forth in an alternating manner. She’s titfucking herself inside her own clothing - clothing that is even now filling with more of her copious fuckslime, drenched in the creamy stuff and soaking it up with every pore.");
	output("\n\nKiro tosses back her hair and looks at you, begging and pleading with her eyes. Her hands move faster, bringing with them lurid squelches that are firing off machine-gun fast, slick melons wrapped firmly around her twitching horse-cock, those ponderous jugs unable to slow or stopped their polishing of Kiro’s lusty boner. She whimpers into your cooch, interrupting her own purr momentarily. It seems she’s trying to hold back from cumming herself until she gets you off, but she wants you to cum and soon.");
	output("\n\nGrabbing hold of her by the hair, you push her harder into your [pc.vagina] and moan lustily. Your passage");
	if(pc.totalVaginas() > 1) output("s flutter");
	else output(" flutters");
	output(" in delight, and Kiro does her best to let her tongue explore the spasming tunnel before her, coming back out with fresh slickness to wrap around [pc.oneClit]. Her eyelids close once more as she sinks back into being your fucktoy, still masturbating herself but intently and completely fixated on your [pc.vagina]. The quivering of your lips, the taste of your juices - these are her world. Slipping and sliding in a spreading puddle of your pet’s making, you twitch your hips intentionally one last time and push yourself past the point of no return.");
	output("\n\nYour lower body goes into overdrive, bucking and humping, twitching with wild undulations; it’s completely beyond control, and the sounds coming out of your mouth confirm it. You’re moaning and screaming in ecstasy. As soon as one frenzied exaltation of pleasure dies down, the next tears its way out of your throat. Admirably, Kiro does not let your state distract her from her task. Her plush black lips stay glued to your ");
	if(pc.isSquirter()) output("gushing pussy");
	else output("[pc.vagina]");
	output(", hanging on with such determination that it seems she’s clinging on for dear life, tongue lodged deep inside like a vibrating pleasure-anchor.");
	if(pc.isSquirter()) output(" Your gushing juices flood her mouth. Kiro’s cheeks puff out as they fill with your [pc.girlCum], but then the pressure eases. She’s opened up her throat to allow your prodigious estrus to pass straight into her belly in order to better serve.");
	else output(" Her mouth works a few times to swallow the out rushing liquid glee, and she doesn’t spill a single drop. At least, not at first.");
	output("\n\nKiro’s cock explodes a moment later. Having your taste completely saturate her mouth has provided all she needs to climax, and judging by the way you can feel her cum splattering everywhere below your waist, you’re sure it’s a messy one. Your own climax is winding down, and you master yourself enough to watch the mess happen, noting that a powerful stream of white is actually hitting Kiro square in the chin before deflecting off in a million directions at once. The deck plates turn white, and Kiro’s tits slow their quick stroking as they join everything else being drenched with alabaster cockpaint. She finally loses her grip on your crotch and slides off, facedown and screaming, your [pc.girlCum] drooling down the corners of her mouth while she covers her face in a mask of sticky drippings.");
	output("\n\nWhimpering one last time, Kiro’s oversized shaft drools a huge wad of jism into her top, causing the stuff to run out everywhere. She shudders weakly one last time, gasping for breath and breathing nothing but sex-laced fumes, her body and mind completely spent by the inebriated orgasm. Even her tongue is dangling out, too tired to pull back inside for now, and drooping down into the ivory pool.");
	output("\n\nAfter a moment, you rise, satiated for the moment. Kiro tries to climb up after, swaying drunkenly before collapsing back onto her side, stroking her still-oozing tool to coax out the last few drips of pleasure. She moans, <i>“Fuuuuck, [pc.name]. That was good!</i>”");
	output("\n\nTouching her chin with your [pc.foot], you turn her up to look at you. <i>“That’s [pc.Master]. I believe I have the rest of the day to use my fuck-pet.</i>” You may not have specified exactly as such when setting the terms of the wager, but it was definitely implied. Besides, she’s in no state to argue.");
	output("\n\nGrabbing the drunk, temporarily sated tanuki under the arm, you lift her up and start hauling her towards her shower. <i>“I suppose we had better get you cleaned up before you we play some more, huh?</i>”");
	output("\n\nFuck-pet nods.");
	//Pass 30m
	processTime(30);
	pc.orgasm();
	kiro.orgasm();
	clearMenu();
	//9999 epilogue shit
}

output("\n\nVictory Epilogue Stand-in");
output("\n\nYou spend the day enjoying Kiro’s attentions, having her service you each and every time she becomes aroused. You forbid her from wearing clothing after the shower. Instead, she’s forced to follow you around on all fours, collared with her meat dragging on the floor until it gets hard enough from the friction to rise between her breasts. She’s an eager little fuck-pet, and honestly, you’re immensely glad you won the bet.");
output("\n\n//Pass 23.5 hours, then rest lust.");

output("\n\nEpilogue Scene: Get tongue-bathed [QB/LD]");
output("\n\n//Set PC up to get some rimming. Paragraphs that deal with cocks and pussies");

output("\n\nYou are about to twist the knob and let water flow, but then a wicked idea comes to your mind. Kiro is your fuck-pet for the day and she’s responsible for all this, so she should be the one to clean it. And you just happen to know a fun way for her to do that.  You turn to her and say, <i>“Fuck-pet, come here and kneel.”</i>");

output("\n\nThe kui-tan gives you a puzzled look before she belches loudly, but obeys your command, shuffling towards you and then kneeling, staring up at you with bemusement on her face as she tries to figure out what you have in mind, and clearly comes up with nothing. You take a step closer to her{, bringing her head level {with your slowly erecting {cocks}} / {with your rapidly moistening {pussies}}}  <i>“It’s time to bathe. So start licking.”</i>");

output("\n\nShe looks you over, starting at your {face} and then working her way down, blatantly ogling your {breastRow} {breasts} before sliding lower, down to your crotch {[PCGender NOT ‘neuter] - where she leers at your {cockNumber} {cock} [and/or] {vaginaNumber} {pussies} -} and then finally to your {feet}.  <i>“Okay, {Master}, if that’s what you want,”</i> she croons, then opens her mouth and lets her tongue flop out, twisting it lewdly in the air with the practiced skill of someone very adept at oral. Her arms reach out and rest themselves comfortably on your hips before her head sinks towards your crotch, {her tongue caressing your {cock} eagerly, making long, languid strokes that cover every inch of {cockColour} skin, dabing at the tip{s} in pursuit of your juices} {before} {negotiating her way to your {pussy}, where she begins to painstakingly lick and tease you, sliding her tongue into your pussy and hungrily making out with your netherlips}.");

output("\n\nYou moan at her ministrations. It feels good to have her cleaning you so diligently. However she won’t be able to reach your upper body from her current position, so you place a hand on her forehead and push her away a bit. She lets out a confused grunt at your actions, nearly sitting on her swollen balls as she falls to her ass, her huge horse-dick already half-erect itself You take a seat on the floor, leaning back against the wall as you lift {a foot for her.} / {the tip of your coils for her}.");

output("\n\nConfusion momentarily flickers in her eyes before understanding dawns; this evidently isn’t a form of sex she’s used to, at least not on the giving end. Still, gamely she reaches out and takes your {foot}/{tail} and delicately brings it to her mouth, where she begins lavishing kisses upon it, occasionally darting her tongue out to wipe it cleaner. She suckles upon your {feet}, making erotic moaning noises, her forgotten shaft rising up so that it is {sliding between your {legNumber} legs}/{sweeping up against the side of your coils}.");

output("\n\nYou smile to yourself when you feel the tip of her shaft poking against your {leg / coils} and immediately move {your other [pc.foot] to stroke her shaft} / {your remaining coils to grip and stroke her shaft.}  She gasps softly, but continues to lavish her attention on your {foot} / {the tip of your lower end}, licking it sparkling clean and clearly hoping you’ll attend to her needs.  You slide your {foot/coils} lower, rubbing it against her balls, hefting them and weighting them.  They are soft... and heavy with their liquid weight. You decide to return your attention towards her shaft, stroking it whilst only momentarily stopping to tease her balls and feel them churn with need.");

output("\n\nA hiss of disappointment and frustration escapes her lips, and you realise you can hear a constant dripping noise as her over-excited balls leak a steady stream of precum from her broad, round-headed horse-prick. Under your {foot}/{coils}, you can feel that self-same gene-modded trouser-python stiffen to its full, magnificent length and girth.  As you keep toying with her monstrous masculinity, her licks and kisses start becoming increasingly erratic; she’s panting for breath now as your efforts push the oversexed alien towards her own climax. You can almost hear the cum churning in her huge sac.");

output("\n\nIn one final stroke you feel her groan as she finally steps over the edge, painting {your [pc.feet] and your legs with ropes of pent-up cum.} / {your coils with ropes of pent-up cum.} You don’t make any effort to spare yourself from the onslaught of kui-tan seed and just let her cum herself out. Once done though, you smile at her and order her, <i>“Clean up this mess.”</i>");

output("\n\nA lecherous, slightly drunk smile splits her face and she nods eagerly before bending back to work, hungrily slurping and sucking her own jizz off of your body, her tongue chasing every last stray drop and her lips messily kissing you to aid her in vacuuming it up. You let her work in silence for a few minutes, before reminding her that she still has plenty of you to care for. She lets out a muffled noise and stops, looking up at you.  You point at your chest, still dry and without a single trace of the kui-tan’s licks.  When you told her to tongue bathe you; you meant for her to bathe <b>all</b> of you. <i>“Get back to work, fuck-pet.”</i>");

output("\n\nShe smiles eagerly, nodding her head, then practically swims up your body to her feet, kissing and licking and sucking every inch of you that she can reach. When she reaches your {lowestBreasts}, she lets out a pleased hum, your only warning before she plunges face-first into {your cleavage} / {flat chest}, nuzzling and kissing with a passionate hunger as she tries to smother herself {in your boob-flesh}. Her lips instinctively close around your {nipples}, mischievously nipping and suckling, teasing and caressing with her lips and tongue.");

output("\n\nYou shudder at her little love-nips and instinctively loop an arm around her head to press her closer. She snickers softly and hugs you, continuing her little ‘games’ with your {nipples} before her questing tongue grows bored and slides out of your {breast-flesh} / {nipples}, dancing across the rest of your chest before she wriggles free of your arms and makes her way back down to your {belly}, homing in on your belly-button like an iron filing to a magnet. Her tongue caresses your belly-button, rubbing and teasing it with all the expertise she was just lavishing upon your breasts, and her eyes flick upwards to catch your expression.");

output("\n\nYou laugh at her ticklish licks as you fight to move her head away. She protests by forcing her head back against you, clearly having too much fun to want to stop, her status as your fuck-pet be damned. Unable to fight back, you submit yourself to her treatment until she lifts her head, licking a stray strand of saliva from her lips as she smiles mischievously at you. Clever girl.... Still, she isn’t done. Just a bit more to go now. <i>“Step away.”</i> She lets go of you and does as you tell her, clearly waiting to see what you have in mind.");

output("\n\nYou roll around, presenting your {butt} to her. <i>“Fuck-pet like,”</i> she growls throatily, her tail waving eagerly behind her. ");

output("\n\n<i>“Well? Are you going to get started or what?”</i> She starts at that, then smirks, and then all but throws herself at you, her arms winding themselves around your waist to ensure you can’t get anywhere. Once that happens, she descends upon your {butt} like a herm possessed, her tongue sliding rapaciously across and around each asscheek, circling your outer curves before sliding into your crack and then insinuating itself downwards, thick and deep until her tongue tip is brushing insistently over your puckered back passage.");

output("\n\nYou jump slightly as you feel her lick your {butthole}. You wonder if you should have her clean in there too or stick just to your butt.");

output("\n\n[Rim][JustButt]");

output("\n\n[=JustButt=]");
output("\n\n<i>“What? Aw...”</i> she grumbles plaintively. She really seemed to be looking forward to rimming you... maybe she was hoping this would be a prelude to her cock going up your ass - she’s already hard again, you realise. Still, she has much work to do. So you order her to keep going until you are squeaky clean.");

output("\n\nShe grumbles her agreement and then does as  you order, her pace much more slow and steady now that she knows there’s no chance of her getting to bury herself in your ass afterwards. Long, languid strokes caress your ass until she deems you clean, then she keeps going, descending down towards your {thighs}. You praise her for her dedication as you close your eyes, focusing on the pleasure of having an eager kui-tan fuck-pet cater to your needs....");

output("\n\n[=Rim=]");
output("\n\nShe needs no further encouragement; she practically buries her face in your asscrack, her tongue ravishing your asshole, slurping across every puckered inch before worming its way insistently inside you; no matter how you might clench your rosebud to keep her out, her tongue is too strong and forces its way in{, as if trying to lick your very prostate}.");

output("\n\nYou moan at the sensation of having your {ass} invaded by the kui-tan’s worming tongue and revel in it as she thoroughly ‘cleans’ you. You instruct her on where and how to lick, commands the kui-tan pirate follows eagerly. Every once in awhile, you buck back against her, a reflex to the pleasure she is inflicting upon you. The more you display your enjoyment, the more rapaciously she assaults you. You’re dimly aware of her cock, rock-hard and drooling once again, butting against your {thighs}; it looks like somebody’s got dreams of being allowed to fuck your ass once this is over. Still, if it makes her this enthusiastic, why not let her cherish her hopes, however false they may ultimately be?");

output("\n\nYou relax and continue to enjoy her ministrations, closing your eyes and letting time pass as you focus on the pleasure of having your rosebud licked clean by your eager fuck-pet....");


output("\n\n//Both variants converge here.");
output("\n\nIt takes quite a while, and by the time you are done, both of you are sweaty and horny. And in your case, you are also matted with kui-tan saliva. But it was worth it. Looking at Kiro, she seems to think so too; though her mouth is a bit dry. <i>“Let’s bathe for real now, pet.”</i>");

output("\n\nShe gives you a nod, croaking softly at the lack of water in her mouth, already turning her head up towards the showerhead and opening her lips in anticipation of a nice deluge of water. As you watch her, you wonder what else you should do with your slave-for-a-day. The possibilities are endless. And from the looks of it, Kiro is really enjoying herself. Perhaps even more than you are. Winning feels good!");
output("\n\nEpilogue Scene: Ride Kiro’s Cock (QB/LD)");
output("\n\n//By: QuietBrowser & LukaDoc");
output("\n\n//Use the PC’s pussy/ass to ride Kiro like a bull.");
output("\n\n//Not compatible with centaurs.");

output("\n\nThe bath is quick and uneventful, though your big-balled fuck-pet does try to entice you on more than one account. Once done, you dry yourself up and order Kiro to do the same. <i>“Yes, {Master},”</i> she replies, taking the towel and wiping herself down, stroking the fluffy towel across her body in clearly seductive gestures, emphasizing her voluptuous breasts her shapely ass and her mighty masculinity as she does so.");

output("\n\nOnce you’re both dry, you call out to her, <i>“Fuck-pet, rule number one: no clothes.”</i> She smiles drunkenly at that and nods, standing there with her tail swishing lazily behind her, breasts idly jiggling as she sways slightly, too sloshed to really stay upright. You motion for her to follow you back into her room. You look about, inspecting the unkempt surroundings, and spot something interesting hidden amongst the dirty magazines. You lift the object in your hands with a knowing smile. <i>“What a naughty girl you are, pet.”</i>");

output("\n\n<i>“Really, {Master}? Why, whatever do you mean?”</i> she asks, feigning innocence, but there’s a growing smirk on her lips as she sees the object in your hands, the mast-like bulk of her equine shaft already starting to rise again as her imagination goes to work about what you have in mind.");

output("\n\n<i>“Put it on. Pets should always use their collars. Where’s the leash?”</i>");

output("\n\n<i>“I think it’s under the bed with some of my clean panties, {Master},”</i> she tells you, already sinking to her knees and raising her hands in front of her breasts, mimicking a dog begging for its master’s attention - a resemblance heightened by the fact her tail is definitely starting to wag behind her. You sift through her belongings and quickly find the aforementioned leash under some of her big-booty porn and some thankfully clean panties. She watches you, openly smiling as you approach, lifting her chin to better expose her neck so you can tie the collar around it and then attach the leash. <i>“What does {Master} have in mind for {his} fluffy fuck-pet?”</i> she asks eagerly.");

output("\n\nYou don’t grace her with a reply, you simply tug the leash and lead her for a walk around the ship interior. She takes the hint and goes beyond it, falling to all fours and walking doggy-style after you - a little awkwardly, given she’s built like a biped, but better than an unaltered human would. Her cock and balls drag along the floor as she goes, the friction clearly getting to her; her equine dick just keeps slipping further and further out of its sheathe, and then starts to raise itself off of the floor, until it’s meatily smacking into the canyon of her cleavage with every awkward, waddling step she takes, balls brushing heavily along and dragging behind her.");

output("\n\nYou step back into her room and look at your pet, panting in lust. That fat cock of hers pointing accusingly at you gives you an idea. You relay the instructions to Kiro. A hungry grin splits her face and she licks her lips before scrambling across the floor as fast as she can on all fours, cursing to herself as she slips on a particularly loose porno magazine and yelping once as she drags her balls over a rather sharp-cornered case for a holo-vid. She moves amongst the garbage with purpose and lets out a triumphant bark as she holds up a yellow bottle, the words <i>“Peggy’s Elasticizing Oil”</i> written on it plainly. She puts the bottle between her teeth and trots triumphantly back to you, still on all fours, circling around behind you and sitting up on her knees. Her hands reach out and caress your {ass} with greedy eagerness, her squeezing, groping, lavishing touches showing just how much practice she has as a connoisseur of fine butts. You smile and bend over; just enough to allow her easy access.");

output("\n\n//Check for presence of pussy//");

output("\n\n{No Pussy:");
output("\n\nFingers slick and dripping with oil press themselves against your {analTightness} pucker, circling appreciatively around your ring, sliding smoothly through the cheeks of your {ass}, gently massaging the oily lube into your sensitive flesh. You let out a sigh of pleasure as your pet primes you for you for a good round of ‘ride the tanuki’. Once you’re relaxed, her fingers lift themselves away for a moment, then return with more, worming their way into your back passage, smearing the lube inside of you, rubbing it around your interior and stroking with practiced motions until you’re nice and lubed.");
output("\n\n}");

output("\n\n{Else:");
output("\n\nDripping wet, lube-slick fingers begin to tease your {pussy} lips, sliding gently and regularly along your outer labia, coating them thoroughly in the oily substance before sliding in and out of your depths, eagerly finger-fucking you in an effort to apply the lube inside of you and help your pussy stretch to fit the monster rising up from between Kiro’s legs. You shudder in pleasure as you feel her fingers massaging the lube on your entrance.");
output("\n\n}");

output("\n\nOnce she’s done, you tug at her collar, coaxing Kiro to stand. She quickly clambers to her feet, cock slapping against her belly, drooling thick rivers of shiny precum down its length to drip wetly onto the floor. You spin her around and send her off towards her bed with a resounding slap on her butt. She smirks back at you but scampers eagerly toward her bed, clambering onto it and positioning herself comfortably upon the king-sized mattress, belly up and prick pointing impatiently towards the ceiling.");

output("\n\nYou take your time as you walk towards her, straddling her and letting her flared tip brush against your {butthole} / {vagina}. She grins hungrily, but is still sober enough to adhere to her bet, so she lets you set the pace, rather than simply taking you right there and then like she probably would under normal circumstances. You tease her by gyrating your hips, grinding against her and letting her massage your entrance with her pre-spewing tip, gasping in enjoyment as the lube you had her apply earlier mixes with her pre. Sometimes she nearly slips in, but you make it a point of not rushing things.");

output("\n\nShe grunts and whimpers plaintively, eyes shining with the desire for you to stop teasing, but she bites her lip and refuses to beg. Instead, she tries coaxing you, groaning luxuriantly at the friction of her cock-head between your {thighs}/{ass-cheeks}, arching her back and writhing slowly on the stained sheets of her bed. You smirk at her eagerness and slowly let gravity help you take her equine-prick.");

output("\n\nYou moan as the tip pushes past your {entrance / sphincter}, stretching you {widely} as you accept her. She lets loose a throaty growl, licking her lips eagerly as she feels herself slipping inside of you at last.  Slowly you begin bucking against her, taking inch after inch at every hump. She grunts with each impact, tail stroking across the sheets in a quick pace that conveys her excitement, clearly fighting not to reach up, grab your hips, and reverse your positions. It doesn’t take long before you find yourself seated on a sloshy soft cushion. She groans with longing, tongue momentarily hanging out with pleasure at the feeling of being all the way inside of you. Unable to help herself, her hands reach up and caress the bulge her mammoth man-meat makes inside of you, visibly distending your belly. Her pride at stretching you out like this is palpable.");

output("\n\nYou can feel her twin orbs churning with cum as she starts panting. You watch with great enjoyment as her tongue lolls out and she begins thrusting herself into you. Small, shallow thrusts, that barely stimulate you. You wave a finger at her. <i>“Restraint, pet.”</i>");

output("\n\n<i>“S-sorry, {Master},”</i> she replies, forcing herself to be still, unable to help a tiny whimper at being so deeply inside you but unable to <i>move</i>. Slowly you rise, until only her tip remains inside you, then you fall back with a satisfying slap. She reaches up and takes hold of your {legs}, helping position you so that you can balance better; the last thing she wants at this critical juncture is for you to fall off!");

output("\n\nYou look at her appreciatively as you speed up, working towards a quick but steady pace. You moan in enjoyment as her massive dick presses all your sensitive spots. She gasps and grunts rapturously, burbling spurts of precum shooting inside of you, swirling around your depths and making you nice and slippery so you can take it faster and easier with every bounce. A groan of enjoyment slips past your lips and you find yourself leaning over Kiro, watching her breasts bounce to the rhythm of your bucks. You can’t resist grabbing at them, supporting yourself as well as toying with her vulnerable body. She growls, deep and low in her throat, but the sound is one of pleasure, her whole body shuddering and a particularly large spurt of fluid wringing itself out of her cock as you tweak her nipples - it’s obvious she liked that.");

output("\n\n<i>“W-wha? Hey, {Name}, what gives?”</i> she complains, realising you’ve suddenly stopped your pistoning on her prick. <i>“Things were just starting to get good!”</i> she growls, clearly not happy in the slightest about this break in <i>“procedure”</i>. You release her breasts and take her hands away from your hips, interlacing your fingers together as you hold her hands. Slowly you adjust yourself so you’re squatting over her, {{legs} bent} / {{lowerBody} adjusted} in a position that will allow you to quickly ride her pony. <i>“Ohh...”</i> she replies, a wide, cat-that-got-the-cream grin splitting her features, which quickly changes to a wicked smirk of anticipation as she starts bracing herself with legs and tail, propping her arms up against the mattress to ensure she’s providing the maximum support for what’s coming...");

output("\n\nYou become a blur on top of her, working with all your might as you take her to the ride of her life. Beneath you, the kui-tan is left as little more than a fluffy, mushy pile of pure fuck; the rough, blistering pace with which you are moving leaves her shaft stimulated endlessly. First the warm depths of your {bowels / nethers} caresses her length, squeezing her for all you’re worth, then she feels the comparatively freezing cold as you rise up off of her, exposing her to the frigid air outside of your bodies, only to plunge her back inside before she can shiver even once at the chill. She gasps and grunts and whimpers, rolling and heaving underneath you as you ride her to the breaking point. <i>“D-damn... oh, gods, thanks be for lube... still gonna be so <b>sore</b> after this...”</i> she huffs at you. <i>“Totally fucking worth it!”</i> she declares, though. Her balls are churning, almost audibly sloshing around in her frenzied state - she’s going to cum, and <b>soon</b>.");

output("\n\nYou don’t think you can take this much longer. Having her shaft buried inside you as you use her like a cheap toy is too good. And with your accelerated pace, you feel you don’t have long before you pop. All of a sudden, she throws her head back and lets out a lusty roar as she climaxes, the cock-wielding pirate queen exploding inside you as her spooge-volcano of a dick unleashes its cascade of seed. The sudden eruption of kui-tan cream leaves you stunned; too stunned to stop as you buck against her. She shudders and quakes in the grip of a huge climax, pushed beyond her limits by your ministrations. Her eyes roll back in her head and her tongue lolls out in a classic ahegao pose, heaving for breath as she just keeps cumming and cumming...");

output("\n\nHer seed paints your insides completely, and your bucks ensure that whatever flows from her load winds up leaking in a perverted fountain around the seal of her dick. As you finally regain control of your body, you slam yourself one last time onto her horse-cock. You can feel her balls nearly vibrating as the spunk stored in them is pushed out of her cumvein and into your accepting {{ass} / {vagina}}. She moans an incoherent plea and a worshipful praise all in one. Your face contorts in pleasure as her orgasm triggers your own, and you find yourself constricting her within you, milking her for all she’s worth and more. {Your own juices mix with hers, adding to the mixture that escapes you and mats her crotch.} {Your {cocks}, all but forgotten until now, throb as {they/it} shower{s} her with rope after rope of {cumColor} {cumType} over your lovely kui-tan fuck-pet.");

output("\n\nShe slowly pulls her tongue inside her mouth and bites her lip as she shudders and quakes with the effort of launching her last belly-bulging load of cum into you. However, it looks like you’ve worn her out, as no more shots come gurgling their way into you. You slump down over her, not yet falling on top of her thanks to the support provided by her hands and legs. Your {butt} presses against her balls. {They feel much smaller now, though you get the feeling it won’t be long before they grown back to their original size.} {They’re, surprisingly, almost as full as when you started! If not fuller.... Kiro’s body must’ve already started processing the load you fed her earlier.}");

output("\n\nShe lets out a long, sated, pleased sigh. <i>“Fuck-pet likes...”</i> she dreamily tells you. You recompose yourself and laugh at her comment. Yes she’d better like it....");

output("\n\nYou caress her face and say, <i>“{Master} is pleased.”</i> She nods and smiles deeply, clearly just as proud of herself. Or just proud that she got such great sex even though she lost the contest. You take a few moments to catch your breath and let her catch hers, equine-prick still deeply embedded within you as you wait for a few moments more. You can feel it slowly growing flaccid after all the intense workout you put it through; though your contractions do manage to keep if from going limp as fast as it would if you released her. She sighs and absently cuddles you in her arms; apparently the big tough pirate isn’t above snuggling when she’s sated. You allow her to embrace you for a moment before you pull yourself out of her grasp and sit yourself right back onto her shaft. Pressing your butt against her {massive} balls. {Already full despite you helping her empty out earlier.} {Big enough to cushion you. Seems like she’s done processing all the ‘food’ you gave her.}");

output("\n\n<i>“{M-Master}? What are you - ooh! - doing?”</i> she asks, a touch of nervousness in her voice that is almost, but not quite, drowned out by her eagerness, her length slowly, steadily starting to stiffen inside of you. You force yourself to grip her inside you as you prepare yourself. With a seductive smile, you let her know you are just preparing yourself for round two. She didn’t think you were done, did she? You still have your whole day ahead of you. She grins in admiration and settles back, clearly ready to let you have your wicked way with her again... and again, and again too, if you want. You’re glad you won!");
output("\n\n✓K");






output("\n\nSpike With Cum");
output("\n\n// Savin");
output("\n\n{Tool Tip: Put some cum in Kiro’s drink - as a Kui-Tan, her balls will swell way faster when she consumes spunk, so be ready for big balled tanuki loving!}");
output("\n\n{Requires some kind of bottled spooge}");

output("\n\nAs you and Kiro enjoy your drinks, you decide it’s time to get Kiro in touch with her big-balled {dominant side, demanding your submission until she reaches orgasm // submissive side, desperately begging for your help to let her cum}. Looking over toward the door, you call out, <i>“LOOK OVER THERE!”</i> and point urgently toward the corridor. Kiro glances over, just long enough to grab a bottle of preserved spooge and dump it into Kiro’s drink. She turns back just as you put the bottle away, giving you a questioning look - right before she knocks back her entire drink.");

output("\n\nYou watch with a wicked grin as Kiro’s eyes widen, her stomach gurgling... and her balls swell, surging outwards so quickly they nearly tear her clothes open. She doubles over, groaning as her erection grows, spilling out of her leotard to THUNK against the underside of the table. <i>“Y-you little {bitch / bastard},”</i> she growls, looking up at you with lust-filled eyes, <i>“{If mid-balls: I hope you’re ready to spread those cheeks for this bad boy, cuz ‘ve got a lot of cum that needs milking.”</i> // if GIANT BALLZ: <i>“O-oh fuck. Just... take me back home and fuck me, will ya? I gotta cuuummmm.”</i>}");
output("\n\n✓K");
output("\n\nReduce Ball Size");
output("\n\n// Savin");
output("\n\nLooking down to Kiro’s swollen sack, you ask the lusty tanuki if she wouldn’t mind blowing off some steam. You’re not really in the mood for a super-{dominant / submissive} partner right now. She gives you a look you can’t quite read, but with a long suffering sigh says, <i>“Alright, alright, I guuueeessss I could go plug myself into my milker. Shame I’m not gonna get a {handsome / beautiful} {boy / girl} to help me out, though,”</i> she teases, giving you a wink as she slips out of the boot, dragging her engorged sack back to the ship to milk herself out.");