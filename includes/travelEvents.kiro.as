//Bar Preview Blurb
function kiroSetup(button:int = 0):void
{
	if(kiro.ballDiameter() <= 7) output("\n\nThe tanuki-girl pirate you saved, Kiro, is here sipping on a drink and thumbing idly through a data slate.");
	else if(kiro.ballDiameter() <= 14) output("\n\nThe tanuk-girl pirate you saved, Kiro, is here, casting lecherous looks over everyone else in the bar. She spots you and waves you over, but the look in her eyes is more hungry than friendly.");
	else output("\n\nThe tanuki-girl pirate you saved, Kiro, is here, looking lustily around the bar. Her swollen balls are obvious to anyone who looks. She very clearly needs some relief.");
	addButton(button,"Kiro",approachKiroAtTheBar,undefined,"Kiro","That tanuki pirate with the giant balls you rescued is here.");
}

public function roamingKiroAvailable():Boolean
{
	flags["RESCUE KIRO FROM BLUEBALLS"] = 1;
	//Not yet rescued.
	if(flags["RESCUE KIRO FROM BLUEBALLS"] != 1) return false;
	//Kiro off doing something else...
	if(flags["KIRO_DISABLED_MINUTES"] != undefined) return false;
	//She can be there!
	return true;
}

public function roamingBarEncounter(button:int = 0):void
{
	//Build list of available NPCs
	var NPCs:Array = new Array();
	//66% chance Kiro could be there if available.
	if(roamingKiroAvailable() && rand(3) <= 1) NPCs.push(kiroSetup);

	//Pick available NPC, run setup func
	if(NPCs.length > 0)
	{
		NPCs[rand(NPCs.length)](button);
	}
}

public function kiroTrust(arg:Number = 0):Number
{
	//Initialize. Should only be called AFTER her rescue, to prevent any weirdness with the stolen weapon shit
	if(flags["KIRO_TRUST"] == undefined)
	{
		if (flags["RESCUE KIRO TOOK PISTOL"] == 1 || flags["RESCUE KIRO TOOK CUTLASS"] == 1) flags["KIRO_TRUST"] = 30;
		else flags["KIRO_TRUST"] = 40;		
	}
	//Modifying trust.
	if(arg != 0)
	{
		flags["KIRO_TRUST"] += arg;
		//Keep in bounds.
		if(flags["KIRO_TRUST"] > 100) flags["KIRO_TRUST"] = 100;
		else if(flags["KIRO_TRUST"] < 0) flags["KIRO_TRUST"] = 0;
	}
	return flags["KIRO_TRUST"];
}

function approachKiroAtTheBar():void
{
	clearOutput();
	showKiro();
	//Talking to Kiro at the Bar {First Time}
	//Savin
	if(flags["KIRO_BAR_MET"] == undefined)
	{
		author("Savin");
		flags["KIRO_BAR_MET"] = 1;
		output("Seeing the over-hung tanuki-girl, you make your way over. Now that her... problem... has been sorted out, you can finally get a good look at what you assume is her normal form: a curvy woman with tits and hips that strain her obviously expensive clothes, her once-swollen balls neatly hidden into a compact package tucked into a dark red leotard, leaving her male endowments obvious but not so overstated as when you first met. Kiro looks up from her slate as you approach, a sly smile spreading on her black lips. <i>“Hey, look who it is. Thanks again for the timely rescue, " + pc.mf("handsome","gorgeous") + ". That was... well, let’s just say I’m pretty sure I’d have ruptured the hull before too long.”</i>");
		output("\n\nKiro extends a hand, and you shake it vigorously as she calls for a drink. At her invitation, you slip into the booth across from her as the waitress brings a pair of wine glasses filled to the brim with the house’s best. Classy as ever, Kiro swings her thigh-high boots up onto the table and downs the glass, <i>“So, what brings you out here, [pc.name]? Surely not to see little ol’ me, hmm? But while you’re here - and while my little friend here is under control,”</i> she says, patting the bulge in her clothes, <i>“I did say I’d love to show my appreciation if we ever met again. And I meant it. How about a drink?</i>\”</i>");
		processTime(2);
		//[Sure] [No Thanks]
		//Both Leads to mandatory exposition and drink buying scene.
		clearMenu();
		addButton(0,"Sure",kiroIntroductoryScene,true);
		addButton(1,"No Thanks",kiroIntroductoryScene,false);
	}
	//Talk to Kiro, Repeat
	//Savin
	else
	{
		author("Savin");
		//Bigger than Savin
		if(kiro.ballDiameter() > 14)
		{
			output("<i>“Welcome back,”</i> Kiro slowly drawls, obviously undressing you with her eyes as she does. One of her padded palms comes to rest on the small of your back, rubbing in slow circles as she admits, <i>“I’ve been saving up hoping that you’d come along again. I hope you’re ready for some fun....”</i>");
		}
		else
		{
			output("<i>“Hey, " + pc.mf("handsome","gorgeous") + ",”</i> Kiro says, smiling warmly as you approach. <i>“Back again already? Come on, let’s have a drink.");
			if(kiroTrust() >= 35) output(".. unless you wanna get out of here, angel?");
			output("”</i>");
		}
		//kiro menu!
		kiroMenu();
	}
}

public function kiroMenu():void
{
	clearMenu();
	showKiro();
	addButton(1,"Wingman",playWingmanWithKiro,undefined,"Play Wingman","Hang out with Kiro and help her get laid. With balls like that, she probably needs it.");
	addButton(2,"DrinkOff",kiroDrankinConterst,undefined,"Drinking Contest","See who can hold their liquor better...");
	addButton(14,"Leave",mainGameMenu);
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
		pc.imbibeAlcohol(10);
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
	clearMenu();
	addButton(0,"Yes",tellKiroAboutTheCodex);
	addButton(1,"No",dontTellKiroAboutTheCodex);
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
	kiroMenu();
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
	clearMenu();
	addButton(0,"Yes",tellKiroAboutTheCodex);
	addButton(1,"No",definitelyDontTellAboutTheCodex);
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
	kiroMenu();
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
	processTime(3);
	clearMenu();
	addButton(0,"Embellish",embellishForKiro,undefined,"Embellish","Embellish for the kui-tan's benefit and see what you can get away with.");
	addButton(1,"PlayStraight",playItStraightForKiro,undefined,"Play It Straight","Stick to the truth as much as you can in your pursuit of a mate for the furry freelancer.");
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
	kiro.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
	//start kiro encounter cooldown!
	flags["KIRO_DISABLED_MINUTES"] = 130;
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
		pc.slowStatGain("intelligence",1);
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
	kiro.orgasm();
	//+5 Kiro trust
	kiroTrust(5);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
	flags["KIRO_DISABLED_MINUTES"] = 110;
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
	clearMenu();
	addButton(0,"Play Fair",drinkingContestGo,false,"Play Fair","Play it fair. Rely on your iron liver to see you through.");
	addButton(1,"Cheat",drinkingContestGo,true,"Cheat","All's fair in love and war, particularly when 24 hours of it are on the line.");
	addButton(2,"Nevermind",kiroMenu);
}

public function drinkContestScore(arg:Creature):Number
{
	//Calculating Score...
	var score:Number = 0;
	//Tolerance: 0-100, based on drinkitude...
	score += arg.tolerance();
	score += arg.WQ();
	score += arg.tallness * arg.thickness/50;
	score += rand(100);
	if(arg.hasPerk("'Nuki Drunk")) score += 50;
	return score;
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
	pc.imbibeAlcohol(100);
	var won:Boolean = true;
	//MONTAGE FOR NON CHEATERS
	if(!cheated)
	{
		output("\n\nThe next drinks in sequence are milky ways, engine cleaners, afterburners, supernovas, and after that your memory of the shots gets a bit hazy. You’re pretty sure you had something called a comet’s tail at some point too.");
		//Winning fork
		if(drinkContestScore(pc) >= drinkContestScore(kiro))
		{
			output("\n\nKiro seems far worse off than you, though. She’s wobbling back and forth on her barstool, practically hanging off your shoulders in order to stay upright as the bartender returns with two more shots. Kiro giggles down into hers, hefting it aloft and spilling a bit over the sides. <i>“Thish ish one of my favorites! Come on, [pc.name]! Let’s... knock ‘em... knock ‘em up. Wait... no, knock ‘em back!</i>” She throws the drink back and belts out a belch so powerful that some of the other patrons look her way. Gazing at the way her plush form is swaying and jiggling, utterly lost to the effects of alcohol, you realize that you’ve won, and the bartender confirms it when he lets you know that she’s cut off.");
			output("\n\n<i>“Shit, I lost?</i>” Kiro looks completely shell shocked. <i>“I was... I was winning!</i>” She leans her whole body against you, tits pressing on either side of you. <i>“Y-you... you think I’m a winner, right, [pc.name]?</i>”");
			output("\n\nYou nod while standing, dragging her body with you as you both sway a little. You sink a  hand into her plump ass, squeezing it enthusiastically as you start to lead her away. <i>“Come on Kiro, you have a bet to own up to.</i>”");
			output("\n\nShe purrs, <i>“Yesh, " + pc.mf("shir","ma’am") + "!</i>” while allowing herself to be lead back towards her ship. The front of her leotard abruptly begins to strain into an obscene tent long before you make it there, and Kiro’s drunken wobbles quickly turn into a sexy, horny sway.");
		}
		//Losing fork
		else
		{
			output("\n\nYou’re really feeling it! Fuck, these drinks are strong, and your center of balance is starting to slip a little if the way you keep bumping into Kiro is indication. You nearly fall off your stool after a particularly raucous joke, but Kiro catches you with her tail, bouncing you right back up onto your seat before you even realize you’re falling.");
			output("\n\n<i>“Whoah there, [pc.name]. You sure you’re good for another shot?</i>” Kiro asks with a note of concern in her voice.");
			output("\n\n<i>“Fuck yeah!</i>” You grab the waiting shot and down it, barely even tasting the stuff as it burns a path of fire straight into your gullet. <i>“That’s the shtuff!</i>” You lean over to your tanuki companion, meaning to put your arm around her, but somehow, you wind up grabbing a handful of her tit instead, squeezing and kneading her big, jiggly jug before you even have a chance to realize what you’re doing. Damn, those knockers are divine. You hand is still squeezing, still groping, and a drunken smile plasters itself across your face.");
			output("\n\nKiro gently grabs you by the wrist and moves your hand down to her thigh, where it resumes its pleasant squeezing. <i>“[pc.name], you’re drunk. I don’t even know if you could stand at this point.</i>” She turns to the bartender. <i>“Hey barkeep, is " + pc.mf("he","she") + " cut off yet? I don’t think " + pc.mf("he","she") + " can handle any more.</i>”");
			output("\n\nThe bartender nods to Kiro. <i>“A real shame too, I thought you might of found somebody who could out-drink you.</i>”");
			output("\n\nThe striped seductress smiles at you as she guides your reflexively squeezing hand into her crotch where it can find purchase, letting you get a good, firm feel of her filling sheath and bulbous balls. <i>“I hope you like what you feel, because you’re going to be getting a lot more familiar with each other for the rest of the day.</i>” She pulls you tight, dragging you out of your seat and towards the exit. <i>“Let’s get you back to the ship. You’ve got a cute look on your face and I know just what you can fill that mouth with.</i>”");
			output("\n\nAs she leads you stumbling through the corridors, you keep falling against her, every time getting a few handfuls of her curvy form before she pulls you up with a smile. By the time you’re halfway there, the tanuki-herm is pitching a tent big enough to house a circus, and you keep finding reasons to catch yourself on it or her breasts, squeezing and groping in equal measure.");
			won = false;
		}
	}
	//Cheat
	else
	{
		output("\n\nWhatever the case, Kiro can’t stop herself from telling tales in between drinks, and whenever she turns her back to embellish a detail to a neighbor or to stop off at the <i>“little herms room,”</i> you make sure to swap your drink for your neighbor’s empty glass. On one hand, this makes you rather popular patrons. On the other, there’s no way you’re going to lose this contest. It’s win-win. Kiro is drinking twice as many drinks and the effects soon show themselves upon the increasingly plastered tanuki’s face.");
		output("\n\nKiro is wobbling back and forth on her barstool, practically hanging off your shoulders in order to stay upright as the bartender returns with two more shots. Kiro giggles down into hers, hefting it aloft and spilling a bit over the sides. <i>“Thish ish one of my favorites! Come on, [pc.name]! Let’s... knock ‘em... knock ‘em up. Wait... no, knock ‘em back!</i>” She throws the drink back and belts out a belch so powerful that some of the other patrons look her way. Gazing upon the way her plush form swaying and jiggling, utterly lost to the effects of alcohol, you realize that you’ve won, and the bartender confirms it when he lets you know that she’s cut off.");
		output("\n\n<i>“Shit, I lost?</i>” Kiro looks completely shell shocked. <i>“I was... I was winning!</i>” She leans her whole body against you, tits pressing on either side of you. <i>“Y-you... you think I’m a winner, right, [pc.name]?</i>”");
		output("\n\nYou nod while standing, dragging her body with you as you both sway a little. You sink a  hand into her plump ass, squeezing it enthusiastically as you start to lead her away. <i>“Come on Kiro, you have a bet to own up to.</i>”");
		output("\n\nShe purrs, <i>“Yesh, " + pc.mf("shir","ma’am") +"!</i>” while allowing herself to be lead back towards her ship. The front of her leotard abruptly begins to strain into an obscene tent long before you make it there, and Kiro’s drunken wobbles quickly turn into a sexy, horny sway.");
	}
	processTime(73);
	//route win/loss conditions!
	clearMenu();
	if(won)
	{
		//Won the Contest
		//Drunken Kiro Blowjobs - Slobbery Jaw-Filling Goodness
		if(pc.hasCock() && (!pc.hasVagina() || rand(2) == 0)) addButton(0,"Next",wonKirosContestLikeAChampAndGotBlown);
		//Drunken Kiro Twat Oral
		else addButton(0,"Next",youWinAContestAndKiroSlobbersYerPussy);
	}
	else
	{
		pc.imbibeAlcohol(100);
		//Lost The Contest - LIKE A BITCH
		//Girls and Unsexed Turned Into a Drunken Cocksleeve
		if(rand(2) == 0) addButton(0,"Next",lostTheDrinkingContestWithKiroAndTurnedIntoCocksleeve);
		//Unisex Loser Handjob
		else addButton(0,"Next",unisexLostToKiroAndGaveHerAHandJobBecauseDrunkenSluttery);
	}
}

//Lost The Contest - LIKE A BITCH
//Girls and Unsexed Turned Into a Drunken Cocksleeve
function lostTheDrinkingContestWithKiroAndTurnedIntoCocksleeve():void
{
	clearOutput();
	showKiro(true);
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
	output("\n\nGiggling in excitement, you tip your head up to lick up the oozing pre-cum, but instead, you wind up slipping along the outer edge of the growing flare. Your coordination isn’t quite what it would be sober. Trying again, you grab hold of the slippery, dark prick, clutching it in both hands as you try to get a taste of the drinking champion’s slick juice. This time, your [pc.tongue] makes contact with her urethra. It’s immediately coated in semi-transparent goo. The cockjuice floods out as soon as your slick protrusion slips against its blunted head, wicking down to your lips. You slobber all over it, letting your [pc.lips] kiss against it and your [pc.tongue] slip inside for more, polishing Kiro’s rod to a spit-shine. It feels so warm and wet and... well, sexual that a shiver runs down your spine.");
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
	if(kiro.ballSize() <= 14) output(" A trickle of drooling dickslime pours out of the half-flared tip all over your [pc.face] as it spends the last of its lusts, sated for now.");
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
	addButton(0,"Next",lostDrankinContestToKiroz);
}

//Unisex Loser Handjob
function unisexLostToKiroAndGaveHerAHandJobBecauseDrunkenSluttery():void
{
	clearOutput();
	showKiro(true);
	output("Hissing pneumatics fill your ears with the sharp sound of an airtight door sealing behind you. Pulling your face out from between Kiro’s pillowy tits, you let your drunkenly wavering attention sway across the metal deck plates and up the wood-paneled walls. The realization that this is <i>her</i> ship and not your own takes its sweet time swimming through your booze-saturated consciousness. Remembering that you lost over being a cocksleeve for a day... That takes a little longer - about the same amount of time it takes Kiro to push you");
	if(pc.isTaur()) output(" over");
	output(" onto her bed.");
	output("\n\nUnwashed sheets thick with her unique sexual scent rumple around you as you touch down. It isn’t body odor you smell; at least, you don’t think so. No, there’s something else that her sheets exude: a musky, fragrant odor backed by a hint of feminine tang.");
	if(pc.hasCock()) output(" You realize that it smells a bit like your own sheets did after a particularly wet dream.");
	output(" Filling the air around you, the cloying, pheromone-filled aroma tickles its way down your nasal passages with every breath. The pirate-herm’s inexhaustible libido has been vented here innumerable times, and as you sink down into the cushiony bed and its sexual musk, you resign yourself to being subsumed in them.");
	output("\n\n<i>“Hey!</i>” A hand slaps your [pc.thigh] to get your attention. <i>“");
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
	output("\n\nKiro’s [kiro.nipples] jut out hard above you, erotic silhouettes haloed by the dim flare of artificial light. Her hands reach for them as you roll the rubbery-feeling sheath past the first foot of her length, not stopping until it contacts an entirely different sheath, and even then, you roll it down inside her musky, organic cock-sock, ensuring the whole of her mammoth meat is shrink-wrapped for maximum freshness. You stifle a drunken giggle.");
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
	clearMenu();
	addButton(0,"Next",lostDrankinContestToKiroz);
}

//Lose Epilogue Stand-in
function lostDrankinContestToKiroz():void
{
	clearOutput();
	showKiro(true);
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
	kiro.orgasm();
	kiro.orgasm();
	kiro.orgasm();
	kiro.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Won the Contest
//Drunken Kiro Blowjobs - Slobbery Jaw-Filling Goodness
function wonKirosContestLikeAChampAndGotBlown():void
{
	clearOutput();
	showKiro(true);
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
	output("\n\nFingers spasming in pleasure, you lamely stroke her hair and shudder against her lustrous cockpillows, feeling them glide along your sensitive veins all the way up to your [pc.sheathBiggest]. Kiro shudders around your ecstatically trembling tool for a few hammering heartbeats and abruptly reverses direction, easing off your [pc.cockBiggest] while meeting your eyes. Her gaze fixedly locks on yours, making love to you while her suckling kissers cling to your departing length with tightness a condom would envy. They pop off your [pc.cockHeadBiggest] with an audible slurp, though her tongue reaches out to gather a droplet of pre-cum from the departing phallus.");
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
	kiroVictoryDrinkEpilogueRouter(true);
}

//Drunken Kiro Twat Oral
function youWinAContestAndKiroSlobbersYerPussy():void
{
	clearOutput();
	showKiro(true);
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
	kiroVictoryDrinkEpilogueRouter(false);
}

public function kiroVictoryDrinkEpilogueRouter(blowjobbed:Boolean = false):void
{
	clearMenu();
	//Epilogue Scene: Ride Kiro’s Cock (QB/LD)
	//By: QuietBrowser & LukaDoc
	//Use the PC’s pussy/ass to ride Kiro like a bull.
	//Not compatible with centaurs.
	addButton(0,"RideHer",rideKiroDickVictoryDrunkScene,blowjobbed,"RideHer","Jump on her dick and ride it like it's going out of style.");
	//Epilogue Scene: Get tongue-bathed [QB/LD]
	//Set PC up to get some rimming. Paragraphs that deal with cocks and pussies
	addButton(1,"TongueBath",getTongueBathedEpilogue);
	addButton(2,"UseHer",victoryEpilogueLazyOne,undefined,"Use Her In a More General Sense","This one won't be nearly as detailed as the others.");
}

//Victory Epilogue Stand-in
function victoryEpilogueLazyOne():void
{
	clearOutput();
	showKiro(true);
	output("You spend the day enjoying Kiro’s attentions, having her service you each and every time she becomes aroused. You forbid her from wearing clothing after the shower. Instead, she’s forced to follow you around on all fours, collared with her meat dragging on the floor until it gets hard enough from the friction to rise between her breasts. She’s an eager little fuck-pet, and honestly, you’re immensely glad you won the bet.");
	//Pass 23.5 hours, then rest lust.
	processTime(1380);
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	kiro.orgasm();
	kiro.orgasm();
	kiro.orgasm();
	kiro.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Epilogue Scene: Get tongue-bathed [QB/LD]
//Set PC up to get some rimming. Paragraphs that deal with cocks and pussies
function getTongueBathedEpilogue():void
{
	clearOutput();
	showKiro(true);
	author("QuietBrowser/LD");
	output("You are about to twist the knob and let water flow, but then a wicked idea comes to your mind. Kiro is your fuck-pet for the day and she’s responsible for all this, so she should be the one to clean it. And you just happen to know a fun way for her to do that.  You turn to her and say, <i>“Fuck-pet, come here and kneel.”</i>");
	output("\n\nThe kui-tan gives you a puzzled look before she belches loudly, but obeys your command, shuffling towards you and then kneeling, staring up at you with bemusement on her face as she tries to figure out what you have in mind, and clearly comes up with nothing. You take a step closer to her");
	if(pc.hasCock() || pc.hasVagina())
	{
		output(", bringing her head level ");
		if(pc.hasCock()) output("with your slowly erecting cock");
		if(pc.cockTotal() > 1) output("s");
		if(!pc.hasCock() && pc.hasVagina()) 
		{
			output("with your rapidly moistening puss");
			if(pc.totalVaginas() == 1) output("y");
			else output("ies");
		}
	}
	output(". <i>“It’s time to bathe. So start licking.”</i>");

	output("\n\nShe looks you over, starting at your [pc.face] and then working her way down, blatantly ogling your [pc.fullChest] before sliding lower, down to your crotch");
	//[PCGender NOT ‘neuter]
	if(pc.hasCock() || pc.hasVagina()) output(" - where she leers at your [pc.groin]");
	output(" and then finally to your [pc.feet].  <i>“Okay, [pc.Master], if that’s what you want,”</i> she croons, then opens her mouth and lets her tongue flop out, twisting it lewdly in the air with the practiced skill of someone very adept at oral. Her arms reach out and rest themselves comfortably on your hips before her head sinks towards your crotch, ");
	if(pc.hasCock())
	{
		output("her tongue caressing your [pc.cock] eagerly, making long, languid strokes that cover every inch of [pc.cockColor] skin, dabing at the tip");
		if(pc.cockTotal() > 1) output("s");
		output(" in pursuit of your juices");
		if(pc.hasVagina()) output(" before ");
	}
	if(pc.hasVagina()) output("negotiating her way to [pc.oneVagina], where she begins to painstakingly lick and tease you, sliding her tongue inside and hungrily making out with your netherlips");
	output(".");

	output("\n\nYou moan at her ministrations. It feels good to have her cleaning you so diligently. However she won’t be able to reach your upper body from her current position, so you place a hand on her forehead and push her away a bit. She lets out a confused grunt at your actions, nearly sitting on her swollen balls as she falls to her ass, her huge horse-dick already half-erect itself You take a seat on the floor, leaning back against the wall as you lift ");
	if(!pc.isNaga()) output("a foot for her.");
	else output("the tip of your coils for her.");

	output("\n\nConfusion momentarily flickers in her eyes before understanding dawns; this evidently isn’t a form of sex she’s used to, at least not on the giving end. Still, gamely she reaches out and takes your [pc.foot] and delicately brings it to her mouth where she begins lavishing kisses upon it, occasionally darting her tongue out to wipe it cleaner. She suckles upon your [pc.feet], making erotic moaning noises, her forgotten shaft rising up so that it is ");
	if(pc.legCount > 1) output("sliding between your [pc.legs].");
	else output("sweeping up against the side of your [pc.leg].");

	output("\n\nYou smile to yourself when you feel the tip of her shaft poking against your [pc.leg] and immediately move");
	if(pc.isNaga()) output(" your remaining coils to grip and stroke her shaft.");
	else if(pc.legCount > 1) output(" your other [pc.foot] to stroke her shaft.");
	else output(" to accommodate it.");
	output(" She gasps softly but continues to lavish her attention on your [pc.foot], licking it sparkling clean and clearly hoping you’ll attend to her needs.  You slide your [pc.foot] lower, rubbing it against her balls, hefting them and weighting them.  They are soft... and heavy with their liquid weight. You decide to return your attention towards her shaft, stroking it whilst only momentarily stopping to tease her balls and feel them churn with need.");
	output("\n\nA hiss of disappointment and frustration escapes her lips, and you realize you can hear a constant dripping noise as her over-excited balls leak a steady stream of pre-cum from her broad, round-headed horse-prick. Under your [pc.foot], you can feel that self-same gene-modded trouser-python stiffen to its full, magnificent length and girth.  As you keep toying with her monstrous masculinity, her licks and kisses start becoming increasingly erratic; she’s panting for breath now as your efforts push the oversexed alien towards her own climax. You can almost hear the cum churning in her huge sac.");
	output("\n\nIn one final stroke you feel her groan as she finally steps over the edge, painting your ");
	if(pc.legCount > 1) output("[pc.feet] and your ");
	output("[pc.legs] with ropes of pent-up cum.");
	output(" You don’t make any effort to spare yourself from the onslaught of kui-tan seed and just let her cum herself out. Once done though, you smile at her and order her, <i>“Clean up this mess.”</i>");

	output("\n\nA lecherous, slightly drunk smile splits her face and she nods eagerly before bending back to work, hungrily slurping and sucking her own jizz off of your body, her tongue chasing every last stray drop and her lips messily kissing you to aid her in vacuuming it up. You let her work in silence for a few minutes, before reminding her that she still has plenty of you to care for. She lets out a muffled noise and stops, looking up at you.  You point at your chest, still dry and without a single trace of the kui-tan’s licks.  When you told her to tongue bathe you; you meant for her to bathe <b>all</b> of you. <i>“Get back to work, fuck-pet.”</i>");

	output("\n\nShe smiles eagerly, nodding her head, then practically swims up your body to her feet, kissing and licking and sucking every inch of you that she can reach. When she reaches your [pc.lowestBreasts], she lets out a pleased hum, your only warning before she plunges face-first into ");
	if(pc.breastRows[pc.bRows()-1].breastRating() >= 1) output("your cleavage");
	else output("flat chest");
	output(", nuzzling and kissing with a passionate hunger as she tries to smother herself");
	if(pc.breastRows[pc.bRows()-1].breastRating() >= 1) output("in your boob-flesh")
	output(". Her lips instinctively close around your [pc.nipples], mischievously nipping and suckling, teasing and caressing with her lips and tongue.");

	output("\n\nYou shudder at her little love-nips and instinctively loop an arm around her head to press her closer. She snickers softly and hugs you, continuing her little ‘games’ with your [pc.nipples] before her questing tongue grows bored and slides out of your ");
	if(!pc.hasFuckableNipples()) output("breast-flesh");
	else output("[pc.nipples]");
	output(", dancing across the rest of your chest before she wriggles free of your arms and makes her way back down to your [pc.belly], homing in on your belly-button like an iron filing to a magnet. Her tongue caresses your belly-button, rubbing and teasing it with all the expertise she was just lavishing upon your breasts, and her eyes flick upwards to catch your expression.");
	output("\n\nYou laugh at her ticklish licks as you fight to move her head away. She protests by forcing her head back against you, clearly having too much fun to want to stop, her status as your fuck-pet be damned. Unable to fight back, you submit yourself to her treatment until she lifts her head, licking a stray strand of saliva from her lips as she smiles mischievously at you. Clever girl.... Still, she isn’t done. Just a bit more to go now. <i>“Step away.”</i>");
	output("\n\nShe lets go of you and does as you tell her, clearly waiting to see what you have in mind.");
	output("\n\nYou roll around, presenting your [pc.butt] to her.");
	output("\n\n<i>“Fuck-pet like,”</i> she growls throatily, her tail waving eagerly behind her.");
	output("\n\n<i>“Well? Are you going to get started or what?”</i>\n\nShe starts at that, then smirks, and then all but throws herself at you, her arms winding themselves around your waist to ensure you can’t get anywhere. Once that happens, she descends upon your [pc.butt] like a herm possessed, her tongue sliding rapaciously across and around each asscheek, circling your outer curves before sliding into your crack and then insinuating itself downwards, thick and deep until her tongue tip is brushing insistently over your puckered back passage.");
	output("\n\nYou jump slightly as you feel her lick your [pc.asshole]. You wonder if you should have her clean in there too or stick just to your butt.");
	processTime(25);
	pc.lust(33);

	//[Rim][JustButt]
	clearMenu();
	addButton(0,"JustButt",justButtStuffForKiroNoAsslickery,undefined,"Just Butt","She only needs to lick the cheeks. No reason to make her get nasty.");
	addButton(1,"Rim",getRimmedBecauseYouHaveBadTastesJustLikeSavin,undefined,"Rim","Put her to work rimming your asshole. The dirty girl would probably like it.");
}

//[=JustButt=]
function justButtStuffForKiroNoAsslickery():void
{
	clearOutput();
	showKiro(true);
	author("QB & LD");
	output("<i>“What? Aw...”</i> she grumbles plaintively. She really seemed to be looking forward to rimming you... maybe she was hoping this would be a prelude to her cock going up your ass - she’s already hard again, you realize. Still, she has much work to do. So you order her to keep going until you are squeaky clean.");
	output("\n\nShe grumbles her agreement and then does as  you order, her pace much more slow and steady now that she knows there’s no chance of her getting to bury herself in your ass afterwards. Long, languid strokes caress your ass until she deems you clean, then she keeps going, descending down towards your [pc.thighs]. You praise her for her dedication as you close your eyes, focusing on the pleasure of having an eager kui-tan fuck-pet cater to your needs....");
	processTime(13);
	clearMenu();
	addButton(0,"Next",rimOrNoRimVictoryEpilogueForKiro);
}

//[=Rim=]
function getRimmedBecauseYouHaveBadTastesJustLikeSavin():void
{
	clearOutput();
	showKiro(true);
	author("QB & LD");
	output("She needs no further encouragement; she practically buries her face in your asscrack, her tongue ravishing your asshole, slurping across every puckered inch before worming its way insistently inside you; no matter how you might clench your rosebud to keep her out, her tongue is too strong and forces its way in");
	if(pc.hasCock()) output(", as if trying to lick your very prostate");
	output(".");

	output("\n\nYou moan at the sensation of having your [pc.butt] invaded by the kui-tan’s worming tongue and revel in it as she thoroughly ‘cleans’ you. You instruct her on where and how to lick, commands the kui-tan pirate follows eagerly. Every once in awhile, you buck back against her, a reflex to the pleasure she is inflicting upon you. The more you display your enjoyment, the more rapaciously she assaults you. You’re dimly aware of her cock, rock-hard and drooling once again, butting against your [pc.thighs]; it looks like somebody’s got dreams of being allowed to fuck your ass once this is over. Still, if it makes her this enthusiastic, why not let her cherish her hopes, however false they may ultimately be?");
	output("\n\nYou relax and continue to enjoy her ministrations, closing your eyes and letting time pass as you focus on the pleasure of having your rosebud licked clean by your eager fuck-pet....");
	processTime(13);
	clearMenu();
	addButton(0,"Next",rimOrNoRimVictoryEpilogueForKiro);
}

//Both variants converge here.
function rimOrNoRimVictoryEpilogueForKiro():void
{
	clearOutput();
	showKiro(true);
	author("QB & LD");
	output("It takes quite a while, and by the time you are done, both of you are sweaty and horny. And in your case, you are also ");
	if(pc.hasFur()) output("matted");
	else output("soaked");
	output(" with kui-tan saliva. But it was worth it. Looking at Kiro, she seems to think so too; though her mouth is a bit dry. <i>“Let’s bathe for real now, pet.”</i>");

	output("\n\nShe gives you a nod, croaking softly at the lack of water in her mouth, already turning her head up towards the showerhead and opening her lips in anticipation of a nice deluge of water. As you watch her, you wonder what else you should do with your slave-for-a-day. The possibilities are endless. And from the looks of it, Kiro is really enjoying herself. Perhaps even more than you are. Winning feels good!");
	processTime(15);
	clearMenu();
	addButton(0,"Next",victoryEpilogueLazyOne);
}

//Epilogue Scene: Ride Kiro’s Cock (QB/LD)
//By: QuietBrowser & LukaDoc
//Use the PC’s pussy/ass to ride Kiro like a bull.
//Not compatible with centaurs.
//Requires Kiro's balls be pretty big!
function rideKiroDickVictoryDrunkScene(blowjobbed:Boolean = false):void
{
	clearOutput();
	showKiro(true);
	author("QB & LD");
	output("The bath is quick and uneventful, though your big-balled fuck-pet does try to entice you on more than one account. Once done, you dry yourself up and order Kiro to do the same. <i>“Yes, [pc.Master],”</i> she replies, taking the towel and wiping herself down, stroking the fluffy towel across her body in clearly seductive gestures, emphasizing her voluptuous breasts her shapely ass and her mighty masculinity as she does so.");
	output("\n\nOnce you’re both dry, you call out to her, <i>“Fuck-pet, rule number one: no clothes.”</i> She smiles drunkenly at that and nods, standing there with her tail swishing lazily behind her, breasts idly jiggling as she sways slightly, too sloshed to really stay upright. You motion for her to follow you back into her room. You look about, inspecting the unkempt surroundings, and spot something interesting hidden amongst the dirty magazines. You lift the object in your hands with a knowing smile. <i>“What a naughty girl you are, pet.”</i>");
	output("\n\n<i>“Really, [pc.Master]? Why, whatever do you mean?”</i> she asks, feigning innocence, but there’s a growing smirk on her lips as she sees the object in your hands, the mast-like bulk of her equine shaft already starting to rise again as her imagination goes to work about what you have in mind.");
	output("\n\n<i>“Put it on. Pets should always use their collars. Where’s the leash?”</i>");
	output("\n\n<i>“I think it’s under the bed with some of my clean panties, [pc.Master],”</i> she tells you, already sinking to her knees and raising her hands in front of her breasts, mimicking a dog begging for its master’s attention - a resemblance heightened by the fact her tail is definitely starting to wag behind her. You sift through her belongings and quickly find the aforementioned leash under some of her big-booty porn and some thankfully clean panties. She watches you, openly smiling as you approach, lifting her chin to better expose her neck so you can tie the collar around it and then attach the leash. <i>“What does [pc.Master] have in mind for [pc.hisHer] fluffy fuck-pet?”</i> she asks eagerly.");

	output("\n\nYou don’t grace her with a reply, you simply tug the leash and lead her for a walk around the ship interior. She takes the hint and goes beyond it, falling to all fours and walking doggy-style after you - a little awkwardly, given she’s built like a biped, but better than an unaltered human would. Her cock and balls drag along the floor as she goes, the friction clearly getting to her; her equine dick just keeps slipping further and further out of its sheathe, and then starts to raise itself off of the floor, until it’s meatily smacking into the canyon of her cleavage with every awkward, waddling step she takes");
	if(kiro.ballDiameter() > 14) output(", balls brushing heavily along and dragging behind her.");

	output("\n\nYou step back into her room and look at your pet, panting in lust. That fat cock of hers pointing accusingly at you gives you an idea. You relay the instructions to Kiro. A hungry grin splits her face and she licks her lips before scrambling across the floor as fast as she can on all fours, cursing to herself as she slips on a particularly loose porno magazine and yelping once as she drags her balls over a rather sharp-cornered case for a holo-vid. She moves amongst the garbage with purpose and lets out a triumphant bark as she holds up a yellow bottle, the words <i>“Peggy’s Elasticizing Oil”</i> written on it plainly. She puts the bottle between her teeth and trots triumphantly back to you, still on all fours, circling around behind you and sitting up on her knees. Her hands reach out and caress your [pc.butt] with greedy eagerness, her squeezing, groping, lavishing touches showing just how much practice she has as a connoisseur of fine butts. You smile and bend over; just enough to allow her easy access.");
	var x:int = -1;
	//Check for presence of pussy//
	if(!pc.hasVagina()) output("\n\nFingers slick and dripping with oil press themselves against your [pc.asshole], circling appreciatively around your ring, sliding smoothly through the cheeks of your [pc.butt], gently massaging the oily lube into your sensitive flesh. You let out a sigh of pleasure as your pet primes you for you for a good round of ‘ride the tanuki’. Once you’re relaxed, her fingers lift themselves away for a moment, then return with more, worming their way into your back passage, smearing the lube inside of you, rubbing it around your interior and stroking with practiced motions until you’re nice and lubed.");
	//Else:
	else 
	{
		x = rand(pc.totalVaginas());
		output("\n\nDripping wet, lube-slick fingers begin to tease your [pc.vagina " + x + "] lips, sliding gently and regularly along your outer labia, coating them thoroughly in the oily substance before sliding in and out of your depths, eagerly finger-fucking you in an effort to apply the lube inside of you and help your pussy stretch to fit the monster rising up from between Kiro’s legs. You shudder in pleasure as you feel her fingers massaging the lube on your entrance.");
	}
	output("\n\nOnce she’s done, you tug at her collar, coaxing Kiro to stand. She quickly clambers to her feet, cock slapping against her belly, drooling thick rivers of shiny pre-cum down its length to drip wetly onto the floor. You spin her around and send her off towards her bed with a resounding slap on her butt. She smirks back at you but scampers eagerly toward her bed, clambering onto it and positioning herself comfortably upon the king-sized mattress, belly up and prick pointing impatiently towards the ceiling.");
	output("\n\nYou take your time as you walk towards her, straddling her and letting her flared tip brush against your [pc.vagOrAss " + x + "]. She grins hungrily, but is still sober enough to adhere to her bet, so she lets you set the pace, rather than simply taking you right there and then like she probably would under normal circumstances. You tease her by gyrating your hips, grinding against her and letting her massage your entrance with her pre-spewing tip, gasping in enjoyment as the lube you had her apply earlier mixes with her juices. Sometimes she nearly slips in, but you make it a point of not rushing things.");
	output("\n\nShe grunts and whimpers plaintively, eyes shining with the desire for you to stop teasing, but she bites her lip and refuses to beg. Instead, she tries coaxing you, groaning luxuriantly at the friction of her cock-head between your [pc.butts], arching her back and writhing slowly on the stained sheets of her bed. You smirk at her eagerness and slowly let gravity help you take her equine-prick.");
	output("\n\nYou moan as the tip pushes past your ");
	if(x >= 0) output("entrance");
	else output("sphincter");
	output(", stretching you wide as you accept her. She lets loose a throaty growl, licking her lips eagerly as she feels herself slipping inside of you at last. Slowly you begin bucking against her, taking inch after inch at every hump. She grunts with each impact, tail stroking across the sheets in a quick pace that conveys her excitement, clearly fighting not to reach up, grab your hips, and reverse your positions. It doesn’t take long before you find yourself seated on a sloshy, soft cushion. She groans with longing, tongue momentarily hanging out with pleasure at the feeling of being all the way inside of you. Unable to help herself, her hands reach up and caress the bulge her mammoth man-meat makes inside of you, visibly distending your belly. Her pride at stretching you out like this is palpable.");
	//Only half stretch - Kiro used magic oil~
	if(x >= 0) pc.cuntChange(x,chars["KIRO"].cockVolume(0));
	else pc.buttChange(chars["KIRO"].cockVolume(0));
	output("\n\nYou can feel her twin orbs churning with cum as she starts panting. You watch with great enjoyment as her tongue lolls out and she begins thrusting herself into you. Small, shallow thrusts, that barely stimulate you. You wave a finger at her. <i>“Restraint, pet.”</i>");

	output("\n\n<i>“S-sorry, [pc.Master],”</i> she replies, forcing herself to be still, unable to help a tiny whimper at being so deeply inside you but unable to <i>move</i>. Slowly you rise, until only her tip remains inside you, then you fall back with a satisfying slap. She reaches up and takes hold of your [pc.legs], helping position you so that you can balance better; the last thing she wants at this critical juncture is for you to fall off!");

	output("\n\nYou look at her appreciatively as you speed up, working towards a quick but steady pace. You moan in enjoyment as her massive dick presses all your sensitive spots. She gasps and grunts rapturously, burbling spurts of pre-cum shooting inside of you, swirling around your depths and making you nice and slippery so you can take it faster and easier with every bounce. A groan of enjoyment slips past your lips and you find yourself leaning over Kiro, watching her breasts bounce to the rhythm of your bucks. You can’t resist grabbing at them, supporting yourself as well as toying with her vulnerable body. She growls, deep and low in her throat, but the sound is one of pleasure, her whole body shuddering and a particularly large spurt of fluid wringing itself out of her cock as you tweak her nipples - it’s obvious she liked that.");
	output("\n\n<i>“W-wha? Hey, [pc.name], what gives?”</i> she complains, realizing you’ve suddenly stopped your pistoning on her prick. <i>“Things were just starting to get good!”</i> she growls, clearly not happy in the slightest about this break in \"procedure\". You release her breasts and take her hands away from your hips, interlacing your fingers together as you hold her hands. Slowly you adjust yourself so you’re squatting over her in a position that will allow you to quickly ride her pony. <i>“Ohh...”</i> she replies, a wide, cat-that-got-the-cream grin splitting her features, which quickly changes to a wicked smirk of anticipation as she starts bracing herself with legs and tail, propping her arms up against the mattress to ensure she’s providing the maximum support for what’s coming.");
	output("\n\nYou become a blur on top of her, working with all your might as you take her to the ride of her life. Beneath you, the kui-tan is left as little more than a fluffy, mushy pile of pure fuck; the rough, blistering pace with which you are moving leaves her shaft stimulated endlessly. First the warm depths of your ");
	if(x < 0) output("bowels");
	else output("nethers");
	output(" caresses her length, squeezing her for all you’re worth, then she feels the comparatively freezing cold as you rise up off of her, exposing her to the frigid air outside of your bodies, only to plunge her back inside before she can shiver even once at the chill. She gasps and grunts and whimpers, rolling and heaving underneath you as you ride her to the breaking point. <i>“D-damn... oh, gods, thanks be for lube...”</i> she huffs at you. <i>“Totally fucking worth it!”</i> she declares, though. Her balls are churning, almost audibly sloshing around in her frenzied state - she’s going to cum, and <b>soon</b>.");

	output("\n\nYou don’t think you can take this much longer. Having her shaft buried inside you as you use her like a cheap toy is too good. And with your accelerated pace, you feel you don’t have long before you pop. All of a sudden, she throws her head back and lets out a lusty roar as she climaxes, the cock-wielding pirate queen exploding inside you as her spooge-volcano of a dick unleashes its cascade of seed. The sudden eruption of kui-tan cream leaves you stunned; too stunned to stop as you buck against her. She shudders and quakes in the grip of a huge climax, pushed beyond her limits by your ministrations. Her eyes roll back in her head and her tongue lolls out in a classic ahegao pose, heaving for breath as she just keeps cumming and cumming...");
	output("\n\nHer seed paints your insides completely, and your bucks ensure that whatever flows from her load winds up leaking in a perverted fountain around the seal of her dick. As you finally regain control of your body, you slam yourself one last time onto her horse-cock. You can feel her balls nearly vibrating as the spunk stored in them is pushed out of her cumvein and into your accepting ");
	if(x < 0) output("ass");
	else output("vagina");
	output(". She moans an incoherent plea and a worshipful praise all in one. Your face contorts in pleasure as her orgasm triggers your own, and you find yourself constricting her within you, milking her for all she’s worth and more.");
	if(x >= 0) output(" Your own juices mix with hers, adding to the mixture that escapes you and mats her crotch.");
	if(pc.hasCock()) 
	{
		output(" Your [pc.cocks], all but forgotten until now, throb as ");
		if(pc.cockTotal() > 1) output("they shower");
		else output("it showers");
		output(" her with rope after rope of [pc.cum] over your lovely kui-tan fuck-pet.");
	}
	output("\n\nShe slowly pulls her tongue inside her mouth and bites her lip as she shudders and quakes with the effort of launching her last belly-bulging load of cum into you. However, it looks like you’ve worn her out, as no more shots come gurgling their way into you. You slump down over her, not yet falling on top of her thanks to the support provided by her hands and legs. Your [pc.butt] presses against her balls.");
	if(blowjobbed) output(" They’re, surprisingly, almost as full as when you started! If not fuller.... Kiro’s body must’ve already started processing the load you fed her earlier.");
	else output(" They feel much smaller now, though you get the feeling it won’t be long before they grown back to their original size.");

	output("\n\nShe lets out a long, sated, pleased sigh. <i>“Fuck-pet likes...”</i> she dreamily tells you. You recompose yourself and laugh at her comment. Yes she’d better like it.");
	output("\n\nYou caress her face and say, <i>“[pc.Master] is pleased.”</i> She nods and smiles deeply, clearly just as proud of herself. Or just proud that she got such great sex even though she lost the contest. You take a few moments to catch your breath and let her catch hers, equine-prick still deeply embedded within you as you wait for a few moments more. You can feel it slowly growing flaccid after all the intense workout you put it through; though your contractions do manage to keep if from going limp as fast as it would if you released her. She sighs and absently cuddles you in her arms; apparently the big tough pirate isn’t above snuggling when she’s sated. You allow her to embrace you for a moment before you pull yourself out of her grasp and sit yourself right back onto her shaft. Pressing your butt against her ");
	if(blowjobbed) output("increasingly massive ");
	output(" balls.");
	//{Already full despite you helping her empty out earlier.} {Big enough to cushion you. Seems like she’s done processing all the ‘food’ you gave her.}");
	output("\n\n<i>“{M-Master}? What are you - ooh! - doing?”</i> she asks, a touch of nervousness in her voice that is almost, but not quite, drowned out by her eagerness, her length slowly, steadily starting to stiffen inside of you. You force yourself to grip her inside you as you prepare yourself. With a seductive smile, you let her know you are just preparing yourself for round two. She didn’t think you were done, did she? You still have your whole day ahead of you. She grins in admiration and settles back, clearly ready to let you have your wicked way with her again... and again, and again too, if you want. You’re glad you won!");
	if(x >= 0) pc.loadInCunt(chars["KIRO"],x);
	processTime(35);
	pc.orgasm();
	kiro.orgasm();
	clearMenu();
	addButton(0,"Next",victoryEpilogueLazyOne);
}

//Spike With Cum
// Savin
//Tool Tip: Put some cum in Kiro’s drink - as a Kui-Tan, her balls will swell way faster when she consumes spunk, so be ready for big balled tanuki loving!
//{Requires some kind of bottled spooge}
function cumSpikeKirosDrink():void
{
	clearOutput();
	showKiro();
	author("Savin");
	output("As you and Kiro enjoy your drinks, you decide it’s time to get Kiro in touch with her big-balled submissive side, desperately begging for your help to let her cum. Looking over toward the door, you call out, <i>“LOOK OVER THERE!”</i> and point urgently toward the corridor. Kiro glances over, just long enough to grab a bottle of spooge and dump it into Kiro’s drink. She turns back just as you put the bottle away, giving you a questioning look - right before she knocks back her entire drink.");
	output("\n\nYou watch with a wicked grin as Kiro’s eyes widen, her stomach gurgling... and her balls swell, surging outwards so quickly they nearly tear her clothes open. She doubles over, groaning as her erection grows, spilling out of her leotard to THUNK against the underside of the table. <i>“Y-you little " + pc.mf("bastard","bitch") + ",”</i> she growls, looking up at you with lust-filled eyes, <i>“");
	kiro.ballSizeRaw += 30;
	//If mid-balls: 
	if(kiro.ballDiameter() <= 14) output("I hope you’re ready to spread those cheeks for this bad boy, cuz ‘ve got a lot of cum that needs milking.”</i>");
	else output("O-oh fuck. Just... take me back home and fuck me, will ya? I gotta cuuummmm.”</i>");
	processTime(2);
	//special kiro menu
	kiroMenu();

}

//Reduce Ball Size
// Savin
function reduceKirosBallSize():void
{
	clearOutput();
	showKiro();
	output("Looking down to Kiro’s swollen sack, you ask the lusty tanuki if she wouldn’t mind blowing off some steam. You’re not really in the mood for unleashing any floods right now. She gives you a look you can’t quite read, but with a long suffering sigh says, <i>“All right, all right, I guuueeessss I could go plug myself into my milker. Shame I’m not gonna get a " + pc.mf("handsome boy","beautiful girl") + " to help me out, though,”</i> she teases, giving you a wink as she slips out of the boot, dragging her engorged sack back to the ship to milk herself out.");
	processTime(2);
	flags["KIRO_DISABLED_MINUTES"] = 89;
	kiro.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Let's Fuck
//Savin
function letsFuckKiro():void
{
	clearOutput();
	showKiro();
	author("Savin");
	output("<i>“Wanna get out of here?”</i> you ask, extending a hand to the pretty tanuki. She grins, taking it and hauling herself up, pulling so close that her big breasts press against your [pc.chest], the growing bulge under her leotard grinding against you.");
	output("\n\n<i>“I thought you’d never ask, angel,”</i> she says with a wink. <i>“C’mon, I’m parked just down the way.”</i>");
	output("\n\nAn invite to a beautiful woman’s place is hardly something you’re going to turn down, especially as she takes the lead, letting you watch her swaying hips and gropable ass jiggling under her tight clothes with every step. She brings you down the corridor from the bar toward the docks and then into the maze of ships surrounding the station until the great big green leaf comes into view.");
	output("\n\nThe airlock only just closes behind you before you find yourself slammed up against the bulkhead, back pressed into wood panelling as Kiro’s lips press into yours, her soft hands trailing across your body. You let slip a quiet moan as her fingers brush across your crotch");
	if(pc.hasCock()) output(", squeezing [pc.oneCock]");
	else if(pc.hasVagina()) output(", circling [pc.oneVagina]");
	else output(", rubbing down the bare, sensitive flesh");
	output(" as you pull your kit off, tossing your [pc.gear] aside. When the airlock’s done processing you, the two of you tumble into the hallway, barely making it to Kiro’s cabin before her great big cock spills out of her undergarments as she tears them off, letting her massive horsemeat swing free. With a push, you’re thrown down onto her bed, surrounded by dirty mags and condom packs. Looming over you, Kiro idly strokes her cock, already fucking you with her eyes as you roll over, facing her and her huge endowment.");
	//[OPTIONS BITCH]
	kiroSexMenu();
}

public function kiroSexMenu():void
{
	clearMenu();
	//9999
}

//[Done] Take Her Virginity - 3800 words
//High trust only - get her panties.
//Tooltip: Kiro seems excessively focused on her dick. Why not share the loving with her vagina?
function takeKirosVirginity():void
{
	clearOutput();
	showKiro(true);
	output("Looking up at her from the bed, you catch a glimpse of her shiny black pussy lips. They practically wink at you. Why haven’t you fucked those yet? You stretch out an arm, cradling her balls gently before slipping past to rub at the alluring entrance. <i>“How about a little cow-girl?”</i> you suggest with your fingers already beginning to explore her innermost places.");
	//Low trust
	if(kiroTrust() <= 80) 
	{
		output("\n\nWide-eyed, Kiro bats your hand away with enough force to make your wrist ache. <i>“No!”</i> Her jaw works, and she repeats the word more softly, a little nervously even. <i>“Angel, no. I’m saving that for when I meet the right person. The last thing I need is to be saddled down with a kid I’m not ready for. All I have to do is keep my legs closed and use this big ol’ bitch-breaker whenever I get a little lusty.”</i>");
		output("\n\n<i>“Come on,”</i> you cajole. <i>“It’ll feel way better. I promise.”</i>");
		output("\n\nThe determined pirate grabs her tremendous dick by the root and slaps it against your [pc.belly]. <i>“No. Now quit trying to spoil the mood, wouldja? I’ve still got balls I’d like to empty while I’ve got my angel around.”</i>");
		output("\n\nDamn. Well, she’d probably let you put it in her butt.");
		//Sex menu, no text.
		processTime(2);
		kiroSexMenu();
		return;
	}
	//High Trust
	output("\n\nWide-eyed, Kiro nervously bats your hand away. <i>“Come on, angel. You’ve got know I’m saving that for someone special. The last thing I want is to get stuffed up with some " + pc.mf("stud","slut") + "’s cum, then blow up so big that I have to waddle around hunting jobs a pregnant woman can do.”</i> She shakes her head. <i>“No, that’s not entirely true. It’s not that I wouldn’t mind having a few pups, someday. I just...”</i> She trails off, blushing a little under her fur.");
	output("\n\n<i>“Just what?”</i>");
	output("\n\nKiro looks pointedly at you, her big brown eyes misting. <i>“I just want it to be with someone I trust implicitly. Someone that won’t run off if it makes things serious. Someone who’ll be gentle - who won’t hurt me the first time.”</i> She looks down and breathes a heavy sigh. <i>“Fuck, that’s you, isn’t it?”</i>");
	output("\n\nYou ");
	if(pc.isBimbo()) output("giggle happily. <i>“You know it, babe!”</i>");
	else if(pc.isNice()) output("smile warmly at her and lift her chin to bring her gaze back to level with your own. <i>“Of course. As gentle as you need.”</i>");
	else if(pc.isMischievous()) output("lift her chin to bring her eyes back level with your own. <i>“Of course. I put up with this goofy thing, don’t I?”</i> You playfully stroke her cock, earning a little moan from the nervous tanuki.");
	else output("smirk. <i>“You’d be hard-pressed to find someone better.”</i>");

	output("\n\nThe kui-tan’s huge horse-cock actually wilts a little as Kiro smiles down at you. <i>“You saved me, back then, when we met. A few days and I would’ve probably starved or worse, if it weren’t for you, my angel.”</i> She grabs your hand and squeezes almost too firmly. She’s got quite the grip. <i>“And you stuck around after that, met up with me, kept me company - kept me out of trouble, really. If you weren’t busy with your own work, I could probably get by with just you, no sharing, no high-tech jerk-off machines.”</i> She licks her lips, her dick stiffening once more. <i>“Just you.”</i>");
	output("\n\n<i>“Maybe someday you could join my crew,”</i> you suggest, watching her dick-tip slowly climb up your [pc.belly]. <i>“So long as you could stomach not being the infamous Captain Tamahime.”</i>");
	output("\n\nShaking her head, Kiro laughs. <i>“Don’t go making me outlandish offers just to get in my pants now, [pc.name].”</i> She straddles ");
	if(pc.legCount > 1) output("a");
	else output("your");
	output(" [pc.leg] and rubs her dewy lips back and forth across it. <i>“You’re already there. If you’re serious about this, taking my virginity... I guess it would be okay.”</i> She scoots forward, sliding her way to the top of your thigh. <i>“If you think you’re " + pc.mf("man","woman") + " enough.”</i>");
	output("\n\nYou shift her mammoth member aside to ");
	var x:int = pc.cockThatFits(kiro.vaginalCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	if(pc.cockVolume(x) * .75 > kiro.cockVolume(0)) output("get the petite thing off of");
	else output("reveal");
	output(" your");
	if(x == pc.biggestCockIndex() && pc.cockTotal() > 1) output(" largest");
	else if(pc.cockTotal() > 1) output(" most appropriately-sized");
	else output(" own");
	output(" prick, already hard at the thought of claiming this rebellious hermaphrodite as your own. <i>“Somehow, I think I’ll manage.”</i>");
	output("\n\n<i>“Will you now?”</i> Kiro wraps her padded palm around you, her fur as warm and soft as the fluffiest down. <i>“You think this ");
	if(pc.cockVolume(x) < kiro.cockVolume(0) * 0.5) output("little");
	else if(pc.cockVolume(x) > kiro.cockVolume(0) * 1.5) output("huge");
	else output("rigid");
	output("... thing... will satisfy me when I’ve got this?”</i> She gestures at her own member but doesn’t stop the back and forth caresses of her fingers. <i>“Ohhh,”</i> she coos. <i>“I think I felt it twitch. I can’t blame it. If I was going to fuck your ");
	if(pc.hasVagina()) output("pussy");
	else output("ass");
	output(", I’d be twitching too.”</i>");

	output("\n\n<i>“Maybe you should bend over the bed then, let me take you properly,”</i> you suggest.");
	output("\n\nKiro leans low, her breasts brushing past your [pc.cockHead " + x + "]. <i>“You know I’ve never been the prim and proper type of girl. I’d rather take charge, given the chance.”</i> She slides further up, releasing your [pc.cock " + x + "] so that her slippery, alien slit can drag across the bottom half of it. <i>“You talked me into giving you my virginity, you silver-tongued devil, but I’m still going to fuck you.”</i>");
	output("\n\nYou stretch back, putting your hands behind your head. <i>“");
	if(pc.isBimbo()) output("I bet I make you feel so good you like, fall off!");
	else if(pc.isNice()) output("Somehow, I think my pride can survive getting ridden by the hottest girl this side of the Milky Way.");
	else if(pc.isMischievous()) output("I think I’ll survive as long as you don’t crush me with those big ol’ balls of yours.");
	else output("So in other words, you’re going to do all the work. ‘Kay.");
	output("”</i>");

	output("\n\nSliding back and forth, the blushing kui-tan coats you in a thick layer of feminine arousal, gyrating her plush-furred hips in undisguised excitement. Her predatory smile widens, and she leans down to kiss you, pressing her breasts down against your ");
	if(pc.biggestTitSize() >= 1) output("own");
	else output("chest");
	output(", her hard onyx nipples");
	if(!pc.hasScales()) output(" leaving furrows in your [pc.skinFurScales]");
	else output(" sliding smoothly across your scales");
	output(". The kiss is fairly demure as far as Kiro’s attentions go: soft, slow, and wholly devoid of tongue. She breaks it off, tracing the side of your [pc.face] with a thumb, staring deeply into your [pc.eyes]. Her pupils are wide-open, almost drugged.");
	output("\n\n<i>“I can’t believe I’m going to finally do this!”</i> she pants, kissing you with short, rapid-fire smooches. <i>“It’s so weird not knowing what to do. LIke how do I angle it properly? What’s going to feel the best?”</i> She brushes one of her chocolate locks out of the way, nuzzling at the nape of your neck. <i>“Even my machine never did much down there.”</i> Her hips jerk, catching the edge of her wantonly drooling slit upon your [pc.cockHead " + x + "]. She’s even speaking differently - higher pitched and throaty. <i>“Stars, [pc.name], I’m going to ride you so goddamned hard!”</i> She wiggles again, and you feel the rigid lump of her clit sliding against your tender flesh.");
	output("\n\nYou stop leaning on your hands and put them to better use, wrapping them around the kui-tan’s back and running your hands through her fluffy fur, embracing her wholeheartedly. She’s equal parts soft and warm. If you weren’t so determined to leave a dick-shaped imprint in her pussy, you could snuggle in for a nap.");
	output("\n\n<i>“Are you ready, angel?”</i> Kiro asks, shuddering atop you. She props herself up so that her ");
	if(pc.biggestTitSize() < 1) output("tits can sway back and forth, barely scraping you with their nubby nipples.");
	else output("tits aren’t squashed quite so firmly against your own. The pairs of orbs can freely slide and jiggle against one another.");
	output(" <i>“It’s so tingly and hot... I could fucking melt right now, and it isn’t even inside yet!”</i> Remarkably, her dick isn’t at full stiffness either; kind of spongy against your [pc.belly] but still more than capable of drooling a bit of thin band of arousal across your [pc.skinFurScales].");

	output("\n\nYou shift slightly underneath her, feeling the most sensitive parts of your [pc.cock " + x + "] grinding against the sodden slit. Both of you release eager moans. Are you ready for this?");
	processTime(12);
	pc.lust(3000);
	clearMenu();
	addButton(0,"Yes",yesImTakingKirosVcards);
	addDisabledButton(1,"No","No","You consider throwing out a <i>“no”</i>, but change your mind. You’re more than ready for this and have no desire to spoil the mood.");
}

public function yesImTakingKirosVcards():void
{
	clearOutput();
	showKiro(true);
	var x:int = pc.cockThatFits(kiro.vaginalCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	output("<i>“Yes,”</i> you tell her. <i>“I’m ready if you are.");
	if(pc.isBimbo() && pc.hasVagina()) output(" You’re gonna love it! Having your pussy fucked is like, the best feeling in the universe!");
	output("”</i>");
	output("\n\nKiro nods, and, with a shuddering quiver, she reaches down to angle your [pc.cock " + x+ "] upward, toward the too-moist interior. A single droplet catches on your [pc.cockHead " + x + "], slowly rolling around to begin sliding down the shaft, much as the pirate’s pussy is about to do.");
	output("\n\nLuminous brown eyes look your way, hooded with lust. <i>“Here goes.”</i>");
	output("\n\nWet heat envelops you from tip to root");
	if(pc.hasSheath(x)) output(", netherlips rubbing sinfully against the folds of your sheath");
	output(", the pleasure forcing you to close your eyes and gasp from the delight of it all. The kui-tan’s slippery interior only offers a brief moment of token resistance, then caves wholly into your body’s pernicious demands for penetration. She’s smooth as silk and yet somehow textured with folds that hug your [pc.cock " + x + "] like a long-lost love.");
	output("\n\n<i>“Ah-ahhh!”</i> Kiro’s tongue flops out, panting. <i>“It’s so sensitive, and your cock is so... so </i>hard<i>.”</i> She shudders. <i>“I can feel it pushing on me, whenever I shift or move, and I keep squeezing it tighter without meaning to. N-no wonder girls keep coming back to me.”</i> One of her hands grabs her oozing cock and rapidly pumps it. <i>“It hurt a little going in, but it’s like a good hurt, you know?”</i> Looking down at you, the tanuki beams at you. <i>“I’m going to try moving now. Hold onto your dick.”</i>");
	pc.cockChange();
	output("\n\nYou let your arms play down the small of her back until each hand is cradling a well-rounded butt-cheek. <i>“How about I hold onto the next best thing?”</i>");
	output("\n\nWiggling a little, the impaled hermaphrodite lifts her hips, jerking at first and then smoothing out into a more controlled motion. <i>“Oooh, it feels so much better when you move.”</i> She starts laughing good-naturedly. <i>“Fuck, I sound like such a blushing virgin. If some girl was going on like this, I’d probably just stick it in her mouth to shut her up.”</i> Dropping back down, she gives up the narration and lets out a full-bodied moan. <i>“Yeeesss...”</i>");
	output("\n\nHer tits jiggle from the impact while her ass bounces in your hands, but all you can truly focus on is the wet sound her cunt makes the second time it devours your [pc.cock " + x + "]. Kiro doesn’t stop there. Repeatedly moaning, she rises up, arching her back to put her bounding boobs on full display. One of her hands roughly squeezes and teases a nipple, groping the tit more for its owner’s benefit than the show she’s inadvertently providing. She’s still jacking on her cock too, pumping it with earnest strokes, squeezing larger and larger dollops of pre onto your [pc.skinFurScales].");
	output("\n\nThe cock-stuffed tanuki is truly riding you now, her body on autopilot, clutching on your dick as she gyrates around it. Mostly, she focuses on up and down strokes that make her curvy body quiver like jello in your hands, but from time to time she’ll swivel her hips, twisting her tunnel around your [pc.cock " + x + "] like some kind of girl-cum-precipitating fuck-tornado. Her eyes are filled with pure joy, two hooded, chocolate orbs that radiate the kind of happiness that chases hot on the heels of new romantic entanglements.");
	output("\n\n<i>“You’re gorgeous,”</i> you say, the words slipping unbidden from your lips. It’s true, though. She looks radiant there, straddling you, beading sweat that drips from her nipples as she rides you. Her pussy clenches tightly around your [pc.cock " + x + "], massaging it gleefully, trying to coax a heavy load from it.");
	output("\n\nKiro stops bouncing long enough to wipe a tear from her eyes, but her body sees to your needs regardless, making her hips hitch back and forth enough to keep the friction going. Her cheeks are blushing pink beneath her muzzle’s fur. <i>“Y-you’re just saying that cause you’re gonna cum, aren’t you?”</i> she stammers, trying to hold in a moan.");
	output("\n\nYou leave off squeezing her ass and start groping at one of her tits, palming the heavy orb. Kiro shivers in your grip. <i>“Please, you’re way closer than me. Listen to your voice.”</i> You gently pinch her nipple, not enough to truly hurt but just enough to squeeze a high-pitched whine of pleasure from her throat.");
	output("\n\nKiro drops down onto her elbows, trading her cow-girl in for missionary, her face just above yours. She kisses you sharply, hard enough that you feel the pressure of your teeth against the back of your [pc.lips]. Her hips lurch into motion, rocking back and forth powerfully, rubbing her clit against your [pc.belly] on the downstroke. The muscles beneath her oh-so-squeezable ass ripple beneath your clutching fingertips, an echo of the clutching tightness of Kiro’s recently-claimed cunt.");
	output("\n\nShe couldn’t maintain the kiss if she wanted to. Breaking it, she gasps for breath, moaning like a whore and writhing atop you. Her eyes are half-vacant and distracted, unimportant next to the sensations of blissful fullness that her stuffed, slobbery twat and firm clit provide. All the girl-cum slicking you from the navel down provides a handy slip n’ slide for her quivering balls to slide over, darkening her sack with the slippery moisture. It’s the kind of wet, body-drenching fuck that you know is going to leave you both smelling richly of sex, though most of the scent will undoubtedly be from her own frenetically-leaking fluids.");
	output("\n\nPerhaps best of all, Kiro’s cock is pinned between your bodies, jutting up into ");
	if(pc.biggestTitSize() < 1) output("her cleavage");
	else output("your compressed cleavages");
	output(", leaking liquid on everything it manages to rub against. The added friction is clearly too much. Her movements grow erratic but stronger. Her hips slam into yours with bruising force. The upstrokes thrust her cock into her soaked tits hard enough to make them bounce out and clap back down around it. Inside, her pussy spasms wildly, all muscular cohesion subsumed by orgasmic tremors.");
	output("\n\n<i>“Oh-oh-oh... FUCK!”</i> Kiro cries, arching her back and pressing her engorged mons against your crotch. Hot fluid splatters your loins as she cums, released in hot, convulsing jets that the tanuki seems almost unaware of. Her cock detonates a second later, spewing thick globules of equine-morphed seed ");
	if(pc.biggestTitSize() < 1) output("into her tits and over your chest");
	else output("into your squished-together racks");
	output(". Her copious sexual fluids easily soak most of your body, to say nothing of the sheets below, and she just keeps going, even when her arms go slack.");
	output("\n\nYou kiss the nape of her neck while she cums, clutching her ass with one hand and stroking her shimmering waves of chocolate-brown hair with the other. The moaning kui-tan trembles bonelessly, jetting more and more wasted jizz onto your body while her pussy clutches weakly at your rod, unable to do anything but writhe in the grip of long-forbidden passion. You hold her throughout, letting her fully expend her ardor, and then, once she goes fully limp, slumped against your shoulder, you have your opportunity.");
	pc.lust(3000);
	processTime(14);
	//[Next]
	clearMenu();
	addButton(0,"Next",kiroginityTakingPartII);
}

public function kiroginityTakingPartII():void
{
	clearOutput();
	showKiro(true);
	var x:int = pc.cockThatFits(kiro.vaginalCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	output("Rolling the fucked-out kui-tan into her own sperm-drenched sheets, you switch positions, pinning her underneath you. Puddles of cum run out of her cleavage and down her neck as she looks up at you in confusion, babbling, <i>“A-angel?”</i>");
	output("\n\nYou put a finger to her lips to shush her and bend low, nibbling at the underside of her jaw, tasting traces of her too-voluminous ejaculate in her fur. How the hell did she hit herself there? It doesn’t matter. You move your kisses up to her lips and gently begin to rock your hips, taking over the fuck now that she’s caved into her own bliss.");
	output("\n\nKiro’s licentious groan seems to radiate through your ears and down into your [pc.cocks], stirring your passion and desire to new heights. You can actually feel yourself grow firmer inside her, more ready to give her the second vaginal orgasm of her young life. Smiling at the dazed kui-tan, you explain, <i>“This is why I suggested I be on top,”</i> moments before plunging powerfully into her sopping-wet honeypot, the black lips gleaming as they’re spread.");
	output("\n\nKiro mouths a simple <i>“oh”</i>, unable to articulate much else. Her fingers twitch, but it doesn’t stop her from gathering her puddled spooge and smearing it into her fuzzy tits, making her inky nipples glisten with a layer of white. Her roaming hands seem to have minds of their own, rubbing and caressing her own body with unrestrained enthusiasm. Similarly, her thighs spread further and further the more you plow her. They never quite make it to a split; Kiro’s not <i>that</i> flexible, but they do welcome you inside her depths in the most unambiguous terms her body can provide.");
	output("\n\n<i>“So sensitive,”</i> the cummy kui-tan moans. <i>“So hot. H-how? It just keeps getting better and-ohhhhgod!”</i> Her eyes roll back. Her bouncing balls clench, visibly shrinking, and she unloads a thick, musky load of spooge across her face. The rope of jism is so thick that it covers her face from one cheek to the other and paints a white road across her liberally splattered tits as well. Inside her newly cock-obsessed channel, she squeezes down on you, begging you for you to add your cum to the mix.");
	output("\n\nYou don’t cum, not yet. You’re getting close, and seeing her writhing beneath you does wonderful things for ");
	if(pc.balls > 1) output("your full-feeling balls");
	else output("your own pleasure");
	output(". Yet you’ve only just begun. You fuck her faster and harder, increasing mid-Kirogasm. Her voice jumps so high that you swear it’s going to pass beyond the range of your hearing. Her toes curl to either side of you, framed by weakly quivering thighs.");
	output("\n\nAnd you keep fucking her. Hard. She gibbers sounds of pleasure and need, and you provide her with the deflowering of a lifetime, letting her taste what it feels like to be vigorously taken, to lie there, bound helpless by her own pleasure, as she’s used by her mate. Her body adores it. If her nipples were any harder, they’d slice into your fingers while you rubbed them. Even her dick signals its enthusiastic, unflagging support. The flare is almost continually engorged, pulsating with every beat of its owner’s heart and drooling a steady stream of thick, white cum.");
	output("\n\nYou can’t hold back any more. Rocking forward powerfully, you plant your [pc.cock " + x + "] deep into her folds");
	if(pc.cockTotal() > 1) 
	{
		output(", your other member");
		if(pc.cockTotal() > 2) output("s");
		output(" nestling squarely between her passion-slicked nuts");
	}
	output(".");
	if(pc.hasKnot(x)) output(" The canine parts of your prick launch into action exactly as you would expect, inflating a thick knot near your base that quite effectively arrests your movement, locking you inside Kiro’s tunnel with such pleasure that you nearly pass out. Stars, you love knotting a girl.");
	if(pc.hasCockFlag(GLOBAL.FLAG_FLARED,x)) output(" Your own flare expands, sealing your tip against her cervix just in time for the first wave of your inevitable ejaculation.");
	if(pc.cumQ() <= 6) output(" If only you had a decent amount of stored-up cum to offer her. Despite the waves of bliss rolling through your crotch, you don’t offer more than a few token drops of [pc.cum].");
	else if(pc.cumQ() <= 100) output(" The resulting jets of [pc.cum] are far more forceful than you would have expected. Maybe it’s how long it’s taken you to get here or the knowledge that yours is the first cum to ever grace this vagina. Whatever the case, you do a damned fine job of giving Kiro a creampie to remember.");
	else if(pc.cumQ() < 1500)
	{
		output(" The torrent of [pc.cum] you unleash floods the inside of her canal, bathing the quivering folds in enough spunk to make her black lips glisten with a layer of white");
		if(pc.hasKnot(x)) output(" despite your knot’s attempts at interdiction");
		output(". You feel like a firehose, pouring seemingly endless amounts into her womb, spurred on by the knowledge that yours is the first [pc.cumNoun] to meet her most tender flesh.");
	}
	else
	{
		output(" The resulting geyser of [pc.cum] could easily have come from Kiro. It’s volume floods her tunnel with the first blast and her womb with the second, distending the kui-tan’s belly to near-pregnancy with a few more shots. Again and again, you dump your too-virile passion into her preferred pussy, stuffing her with so much [pc.cum] that waves of it start to backwash out");
		if(pc.hasKnot(x)) output(" around your bloated knot");
		output(". The [pc.cumColor] stuff mixes with Kiro’s own leavings to complete the act of drenching her bed.");
		if(pc.cumQ() >= 10000) output(" And when it floods over the side in a waterfall, neither of you can protest, too busy moaning at how good it feels to climax almost unendingly. Fortunately there’s a drain in the floor, lest you manage to drown yourselves.");
	}
	processTime(9+rand(4));
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",tookKiroginityPartIII);
}

public function tookKiroginityPartIII():void
{
	clearOutput();
	showKiro();
	var x:int = pc.cockThatFits(kiro.vaginalCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	output("Spent, you collapse on Kiro. She doesn’t recover for a few minutes, giving you both time to catch your breath and enjoy the simple pleasure of your warm bodies cuddling against one another. When her eyes finally blink open, she looks at you and smiles, then gently kisses you. You kiss her back, slowly and sensually twisting your tongue around her own, expressing your feelings in simple physical contact rather than with any words.");
	output("\n\nShe eventually pushes on your chest, breaking the kiss. <i>“Wow... I didn’t... wow.”</i> She licks a little of her cum from her face and admits, <i>“I didn’t know it could feel that good. No wonder girls always wind up ringing me back.”</i> She squeezes your ");
	if(pc.libido() >= 70) output("still-hard");
	else output("gradually wilting");
	output(" length with her [pc.cumNoun]-oozing pussy. <i>“It was all hot and fluttery, like I couldn’t control myself and I just wanted you to ravish me with that... that");
	if(pc.cockVolume(x) >= kiro.cockVolume(0) * 1.5) output(" huge fuck-stick of yours. I’m going to feel so empty without it’s weight inside me...");
	if(pc.cocks[x].cType != GLOBAL.TYPE_EQUINE) output(" delectable cock of yours.");
	else output(" beautiful horse-cock of yours. We’ve got good taste, don’t we?");
	output("”</i>");

	output("\n\n<i>“So, would you want to do that again sometime?”</i>");
	output("\n\nKiro’s grin is filled with almost child-like glee. <i>“Fuck yes. You can fuck me whenever, wherever, as long as I’m not busy with a job or something.”</i> She shudders and lets out a dreamy sigh. <i>“I’m so glad I’ve been taking birth control just in case. I’d have hated to make you wear a condom.”</i> She rubs gently at her own dick. <i>“About all they’re good for is makin’ handjob balloons.”</i>");
	output("\n\nYou chuckle.");
	output("\n\n<i>“Don’t worry, [pc.name]. I’m on pretty high-end stuff. I shouldn’t swell up with pups unless we’re horribly unlucky or you start stacking virility enhancements like some kind of breeder superhero.”</i> Kiro pushes on your chest. <i>“Oof, you’re heavy. Now get out of me so we can clean up, and if you do a good job, I’ll let you inside in the shower...”</i>");
	output("\n\nYour crotch gives a happy little twitch at the suggestion.");
	output("\n\n<b>You’ve taken Kiro’s virginity.</b>");
	kiro.vaginas[0].hymen = false;
	kiro.vaginalVirgin = false;
	processTime(7);
	clearMenu();
	addButton(0,"Next",kiroginityEpilogue);
}

public function kiroginityEpilogue():void
{
	clearOutput();
	showKiro(true);
	output("While drying off after a surprisingly hot shower, Kiro offers you a pair of lacy black panties. There’s a none-too-discrete hole in the front and underwire reinforcements below.");
	output("\n\n<i>“What’s this?”</i> you ask, confused.");
	output("\n\nKiro puts them in your hand. They smell richly of her, her soap, and the potent aroma of her double genitals. <i>“They’re my panties, silly.”</i>");
	output("\n\n<i>“And...?”</i>");
	output("\n\n<i>“A trophy, silly. I’ve collected quite a few from my conquests. It seems only fitting that you get to keep mine for conquering me.”</i> She playfully pinches your [pc.butt]. <i>“...Or coming as close to conquering me as anyone’s ever going to get.”</i> She grins, showing off canines that look a little sharper than any human’s. <i>“Now get going, and make sure to think of me if you jack off into them!”</i>");
	pc.createKeyItem("Panties - Kiro's - Lacy, black, and crotchless.")
	//scene over!
	processTime(15);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Done] Catch Vaginal - 4000 words!
//Kiro bends you over your bunk and slams that nukicock home.
public function catchVaginalFromKiro():void
{
	clearOutput();
	showKiro(true);
	var x:int = pc.cuntThatFits(kiro.cockVolume(0));
	if(x < 0) x = rand(pc.totalVaginas());
	output("Judging by the look in Kiro’s eyes and the rigidness of her pre-drooling horsemeat, she’s way past the point of talking, and you don’t blame her. Rather than try, you roll over, putting your ass up in the air and proudly displaying the liberally ");
	if(pc.wettestVaginalWetness() <= 1) output("moistened");
	else if(pc.wettestVaginalWetness() <= 3) output("soaked");
	else output("dripping");
	output(" cleft");
	if(pc.totalVaginas() > 1) output("s");
	output(" beneath. An unsubtle back-and-forth waggle has the tanuki’s wide-eyed gaze riveted to your [pc.butt] and her giant python so rigid that the veins might as well be steel cables.");
	output("\n\n<i>“Angel,”</i> Kiro says with a zombie-like stagger in your direction, <i>“I don’t think... Ahh, fuck it!”</i> She grabs your [pc.butts] in her hands, kneading your pliant flesh like a woman entranced, the softly padded fingertips contrasting against the silky fur of her fingers in the most pleasant of ways. You could lie here for hours with your ass up, being massaged by a lover too libidinous to do anything but worship your body. The kui-tan giggles and squeezes, spreading your cheeks to give her a better view. <i>“Gosh.”</i> The word is two parts breathy pant and one part joyful wonder. <i>“I don’t think I’ll ever get tired of this view.”</i>");
	output("\n\nYou press back against her, letting her claw-tipped fingers sink deeper into your flesh. <i>“You can do more than look, you know.”</i> You bite your lip and look over your shoulder at her. <i>“You can </i>fuck<i> me.”</i>");
	if(pc.hasLipples()) output(" Stars, your [pc.lipples] want to suck off the entire universe right now; they're so hot and tingly from dragging back and forth against Kiro's cum-scented sheets.")
	else if(!pc.hasDickNipples()) output(" Stars, your [pc.nipples] could cut diamonds, and dragging the hard tips against Kiro’s cum-scented sheets isn’t helping!");
	else output(" Stars, your [pc.nippleCocks] are pressing hard on your [pc.nipples], demanding to pop out and jizz all over Kiro’s sheets. One shuddering whimper later, and they’re out, sending tingles of fizzing excitement to distract your Kiro-focused brain from the all-consuming need for her dick.");

	output(" Your [pc.vaginas] ");
	if(pc.totalVaginas() == 1) output("is");
	else output("are");
	output(" almost weeping with need. Looking the soft-furred alien straight in her glazed, brown eyes, you whisper <i>“Fuck me”</i> once more, your voice husky with desire.");

	//Of course it’ll fit.
	if(9999)
	{
		output("\n\nKiro looks down at your [pc.vagina " + x + "] with glee. <i>“I’ll never get tired of hearing that,”</i> she admits while sending a finger down to probe your passage. It slips in almost too easily, your muscles squeezing down tight around it. Another fuzzy digit follows it without issue, spreading your lips wide enough to feel a touch of cool, cabin air on your inner entrance. <i>“Well, you really do want this, don’t you?”</i> She adds a fourth finger, spreading them so that she can actually look inside you.");
		output("\n\nYou note that her cock violently lurches at the sight. <i>“Of course. Look at how wet I am!”</i>");
		output("\n\nWith her other hand, the lecherous tanuki gathers a drop of your [pc.girlCum] on a fingertip and suckles it. She gives your [pc.butt] a gentle swat. <i>“You’re so wet I can taste it, angel.”</i>");
		output("\n\nIf you weren’t so turned on, you’d give her a tongue-lashing. As it is, you barely manage a sour look. It’s tough to be intimidating when you’re bent over a bed with the better part of a fist rubbing your insides. <i>“Come on Kiro, fuck me!”</i>");
		output("\n\nThe furry pirate gives your behind a far less gentle swat. <i>“Simmer down, slut. I’m just making sure I don’t hurt you. Some girls’ll hit the mod store and make themselves virgin-tight.”</i> She rubs you comfortingly. <i>“I just want you to feel as good as I’m going to. Nothing, absolutely nothing, is hotter than a girl" + pc.mf("y-boy","") + " who wants you hammering [pc.hisHer] pussy.”</i> She squeezes both buttcheeks at once. <i>“That’s what makes me harder than anything.”</i>");
		output("\n\nPropping your head up with your hand on your cheek and your elbow on the bed, you ask, <i>“Then how come a waitress in a slinky dress can get you hard enough for your dick to flip a table?”</i>");
		output("\n\nKiro blushes, lining her crown up with your weeping");
		if(pc.vaginas[x].looseness() >= 4) output(", gaped");
		output(" slit. <i>“A lot of things get me hard, I guess, but that won’t get me </i>this<i> hard.”</i> She shows you what she means by pressing the biggest, hardest cock against your vulva. Your sensitive labia squish down under the blunt instrument, slowly spreading around the flared head as they realize they have nowhere else to go. She’s so hard, she could probably crush diamonds with that thing.");
		output("\n\nYou want to say something back, but all you manage is a gasp of pleased surprise. You sound like someone who just opened a Christmas present to discover the perfect gift.");
		output("\n\n<i>“See,”</i> the tumescent tanuki says while leaning over you, her hands falling to either side of you, <i>“I told you - knowing that you want me to ram this bad boy up inside you - that’s the best turn-on.”</i> She arches her back to put a little more pressure on your slowly-yielding pussy. It’s so close to crossing the threshold and just popping inside. <i>“Well, that and seeing you bent over like this.”</i>");
		output("\n\nShe hovers on the edge of penetration for what feels like an age, the universe distilled down to the too-slow feeling of your flower opening to allow Kiro inside, to allow her free reign over your juiced-up tunnel.");
		if(pc.isSquirter()) output(" [pc.GirlCum] is already running unimpeded down your [pc.thighs] in anticipation.");
		output(" You try to relax, try to wait for your well-prepared body to accept her immense totem of virility, but it’s so hard when she’s <i>right there</i>. Your empty insides clench eagerly, demanding something warm and hard to wrap around.");

		output("\n\nThe change between pending penetration and impalement is instantaneous. One moment you’re empty and clenching, the next you’re feeling the sudden pressure of a hot, veiny organ butting into you, wedging your netherlips apart with all the subtlety of a breaching charge on a vault door. You’re stretched powerfully, wrapped tightly around an intruding mass whose entrance leaves you equal parts aching and thrilled. She’s just so... so big and hard. It feels like your whole body is reshaping to wrap around it, your very essence congealing into an inverse mold of Kiro’s equine cunt-wrecking hammer.");
		//Cunt stretch check!
		pc.cuntChange(x,kiro.cockVolume(0));
		output("\n\nThe moan that flows from your lips is so heartfelt, so soulful and desirous, that you can <i>feel</i> Kiro thicken inside you from the sound alone. The thudding, powerful pulsations make your already-stretched quim give way. She’s far too firm for anything else, too... potent to have any control over. It doesn’t help that you’re bent over underneath her like this, submissively offering her the too-wet prize. You have no control. The best you can offer are the weak, fluttery caresses of your internal muscles against her mammoth member.");
		output("\n\n<i>“That’s the best kind of pussy,”</i> Kiro teases at last. Her hand firmly squeezes on your haunches while she savors the way your body presses down on her from all sides. <i>“One that really wants the dick inside, that’ll just open up nice and wide and let it slide in until every nook and cranny is wrapped around the big, fat dick. It’s divine, isn’t it, angel?”</i>");
	}
	//No way it’ll fit.
	else
	{
		output("\n\nKiro looks at your [pc.vagina " + x + "], down at her drooling horse-cock, then back at your ");
		if(pc.vaginas[x].wetness() <= 1) output("dewy");
		else if(pc.vaginas[x].wetness() <= 3) output("sodden");
		else output("dripping");
		output(" mound. Obligingly, she lines her fat, slightly flared dicktip up with your proferred entrance and pushes forward, smearing your outermost lips and [pc.clits] with a thick layer of tanuki pre. No matter how that fat crown rubs against you, it just can’t quite find purchase, slipping and sliding across arousal-swollen vulva, spreading you totally open and yet hopelessly unable to enter your too-tight flower.");
		if(pc.totalVaginas() == 2) output(" Your other pussy spasms");
		if(pc.totalVaginas() > 2) output(" Your other pussies spasm");
		if(pc.totalVaginas() >= 2) output(" sympathetically, equally unable to handle your alien lover’s girth.");
		output("\n\nThe lawless kui-tan slaps your [pc.butt]. <i>“If you visited me more, this wouldn’t be a problem.”</i>");

		output("\n\nYou wiggle your [pc.hips] to further tease the too-big tanuki. <i>“If you didn’t have such an ogre cock, you’d be able to enjoy all this.”</i> You motion along your flanks with your hands, curling ");
		if(pc.legCount > 1) output("a");
		else output("your");
		output(" [pc.foot] up to wiggle against the underside of Kiro’s balls");
		if(pc.hasToes()) output(", gently jostling them from toe to toe");
		output(".");
		output("\n\nGrabbing a bottle from her nightstand and upending it over your ass, the fuzzy futanari laughs. <i>“If I didn’t have an ogre cock, I wouldn’t have " + pc.mf("cuntboys","eager sluts") + " like you bending themselves over my bed and begging for it.”</i>");
		output("\n\nThe oil is hot on your [pc.skinFurScales], making your [pc.asshole] and [pc.vaginas] tingle and clench.");
		output("\n\nWhen Kiro’s thumb thrusts into your backdoor, it does so with an audible pop and nary a hint of resistance. <i>“");
		if(pc.vaginas[x].wetness() < 3) output("A little more of this and I could wreck your ass, let alone that perky little pussy.");
		else
		{
			output("Maybe I should’ve tried this hole. It looks like it gets a lot more action than ");
			if(pc.totalVaginas() == 1) output("that slobbery little slit");
			else output("those slobbering little slits");
			output(".");
		}
		output("”</i> Two fingers dip below, hook inside your canal, and spread you open... and open... and open.");
		output("\n\nIt isn’t uncomfortable anymore, not with those padded fingertips rubbing that magic oil into you. You might as well be made of rubber for how pliable you feel, so flexible that she could probably cram three or four horse-cocks right past your cervix and into your womb. A shudder wracks your nethers at the thought, but it comes out as little more than gentle undulations along Kiro’s fingertips, massaging the intruding digits even as she adds a few more.");
		output("\n\n<i>“Now <i>that</i> is a properly loosened pussy,”</i> Kiro declares as you feel her knuckles slip inside you, rubbing against nerves that should register pain, but instead only radiate ever-increasing pleasure. <i>“A nice...”</i> She pushes deeper and twists, pressing fingertips against the roof of your passage until you see stars. <i>“...wet...”</i> Dancing delicately across your internal folds, she begins to withdraw her fist. <i>“...slutty...”</i> The fist pops out one side of you while a lurid moan pours out the other, accompanied by a string of drool. <i>“...cunt.”</i>");
		output("\n\n<i>“Yesss,”</i> you hiss into her pillow, pushing back. <i>“More.”</i> You had a nice little cum from the warm up, but nothing like what you need, like what your [pc.vaginas] crave");
		if(pc.totalVaginas() == 1) output("s");
		output(". You need to be fucked, and fucked hard, plowed so roughly that your twat’ll rattle bliss all the way up to your teeth. And maybe, just maybe, you’ll manage to stay conscious the entire time Kiro floods your ");
		if(pc.isPregnant(x)) output("tunnel");
		else output("womb");
		output(" with her sticky pirate-spunk. If you’re lucky.");

		output("\n\n<i>“Oh, I’ll give you more,”</i> Kiro adds, rubbing more of the oil onto her rigid horse-cock. <i>“I’ll give you more than you can handle, babe.”</i> She nudges her pulsating flare against your netherlips. You may have more elasticity than a galotian matron, but the fat, flat tip isn’t really made for spreading anything open, let alone your dewy delta. It rubs up and down your slit, bumping");
		if(pc.vaginas[x].clits == 1) output(" against your [pc.clit]");
		else
		{
			output(" against one [pc.clit] and then ");
			if(pc.vaginas[x].clits == 2) output("the other");
			else output("another");
		}
		output(", making you quiver and gasp.");
		output("\n\n<i>“Just fuck me!”</i> your voice calls out irrespective of your brain’s reasoning. Even if you had stopped to consider your words, you would’ve said roughly the same thing. <i>“I can take it!”</i>");
		output("\n\nYou don’t get any warning from the pirate, just the sudden pressure of a hot, veiny organ butting against you, wedging your netherlips apart with all the subtlety of a breaching charge on a vault door. One second, you’re empty and eager, the next, stretched powerfully, wrapped tightly around an intruding mass whose entrance leaves you equal parts aching and thrilled. She’s just so... so big and hard. It feels like your whole body is reshaping to wrap around it, your very essence congealing into an inverse mold of Kiro’s equine cunt-wrecking hammer.");
		//Cunt stretch check! (Maybe go easy-ish on this one? Count as ½ Kiro’s size?)
		pc.cuntChange(x,kiro.cockVolume(0)/2);
		output("\n\nThe moan that flows from your lips is so heartfelt, so soulful and desirous, that you can <i>feel</i> Kiro thicken inside you from the sound alone. The thudding, powerful pulsations make your already-stretched quim give way. She’s far too firm for anything else, too... potent to have any control over. It doesn’t help that you feel so weak there from the oil she’s poured on. It may have made you elastic and tingly, but it robbed your muscles of any real heft. Your best clenches are little more than a fluttery massage for the diamond-hard horse-cock inside you.");
		output("\n\n<i>“That’s how you tame a pussy,”</i> Kiro teases at last. Her hand firmly squeezes on your haunches while she savors the way your body presses down on her from all sides. <i>“It just needs a proper filling, doesn’t it? A big fat dick to rub on every nook and cranny until it can’t imagine ever going without, right, Angel?”</i>");
	}//MERGE FITS/NOT FITS!
	output("\n\nYou ball up fistfuls of her blankets and moan again, smitten by the sensation.");
	if(pc.isTreated()) output(" No wonder the girls on New Texas are always bending over for their bull-boys! You never want this to stop.");

	output("\n\nThe soft pads on her fingertips dig deeper into your [pc.butt], but your big-balled lover doesn’t move an inch, not even when you squeeze down on her, begging her to fuck your [pc.vagina " + x + "].");
	output("\n\n<i>“You still want more?”</i> Kiro asks while daring to fondle your other cheek. <i>“You sound like you’re going to melt.”</i> Her fondles turn harsher, roughly squeezing and groping at your supple flesh, pressing the rest of her body to your form while she waits for your elasticized pussy to adapt to the intruder.");
	output("\n\n<i>“Y-yes please,”</i> you husk, interrupting yourself with a whimper. <i>“I’m ready.”</i> You wiggle your [pc.hips] to eke out a sliver of insidiously satisfying friction, showing her just how ready you are. <i>“Just do it.”</i>");
	output("\n\nLeaning down, the cocky privateer ");
	if(pc.tallness - 20 > kiro.tallness) output("kisses the small of your back");
	else output("nips at your ear");
	output(". <i>“Your wish is my command.”</i>");
	output("\n\nSlowly, that feeling of wondrous, delicious fullness recedes, leaving a hot, wet, squishy sensation deep in your core. The passage of her every vein and ridge sets your nerves alight, to say nothing of the way her flare seems to massage every part of you on its way out. The motion is slow and steady as if with great effort or care. Void, it’s so easy and natural, so right. You grab hold of the edges of the bed when her crown stops, just inside you, holding your entrance open for the column behind it.");
	output("\n\n<i>“What an ass you’ve got, " + pc.mf("boy","girl") + ".”</i> Kiro’s thrust forward lacks any of the subtlety or gentleness of her measured withdrawal. It’s a powerful, forceful stroke, slamming itself through your stretchy tunnel like a well-oiled piston.");
	if(pc.buttRating() >= 10 && pc.tone < 60) output(" Your [pc.butt] actually ripples from the impact, giving the tanuki a bouncy show for the lovely fuck she’s doling out.");
	output(" It’s so hot and wet. Even if you weren’t drenched with your own [pc.girlCum], Kiro’s prodigious pre-cum leaves a bigger oilslick inside of you with each pass, transforming a demure, tight pussy into a dripping-wet cock-holster.");
	//Cunt stretch! FULL POWAH
	pc.cuntChange(x,kiro.cockVolume(0));
	output("\n\nYou can only imagine how obscene your pussy-lips must look, stretched to their limit around a cock almost too big for the imagination.");
	if(pc.exhibitionism() >= 66) output(" The girls in ultraporn would be getting some serious competition if you and Kiro had had the forethought to rig up her quarters with a few high-resolution holocams.");
	output(" The bedframe squeals with you when Kiro draws back. Droplets of mixed fuckbatter spatter the sheets, adding another stain to Kiro’s old leavings, filling the air with the musky scent of rutting.");
	output("\n\n<i>“Yes!”</i> seems to be the only word left in your lust-circumscribed vocabulary, but you put it to work like it’s going out of style, saying it and screaming it, trying it out as a high pitched squeal and a whispery invitation.");
	output("\n\nKiro slaps your [pc.butt] hard enough to rock you sideways, making your [pc.vagina " + x + "] twist slightly around her genetically engineered beastcock. She’s grinning deliriously at you, enjoying herself every bit as much; she’s just more restrained about it. You can feel how she’s loving it in the way her pole throbs inside you and the little splatters of liquid anticipation she gives your cervix when she bottoms out. Her eyes are a little unfocused, a little hazy, as if she’s too turned on to think straight.");
	output("\n\nYou know how she feels.");
	//TREATED GETS SPECIAL PARAGRAPH! NOT BIMBO - TREATED. Need that magic puss. (No new PG)
	if(pc.isBimbo() && pc.isTreated())
	{
		output("\n\nHer rapid-fire thrusts make all your sensitive places jiggle and tingle, the way they’re meant to feel, to say nothing of the volleys of percussive pleasure launching from your [pc.vagina " + x + "] one after another. Lucky for you, you prepared for such an event by taking the Treatment! A dopey grin devours your features as you wallow in ecstasy from your enhanced vagina. A normal girl would probably have passed out by now, but you? Your body knows what to do.");
		output("\n\nThe enhanced muscles inside you coax Kiro’s cock to even greater feats of debauchery, begging it to pound you harder... faster. Your [pc.butt] wiggles back and forth to provide her with an enticing target for her hands, and the whole time, you’re practically creaming yourself. Sure, you’re not, like, orgasming yet or anything, but it feels better than any of your old, boring, pre-Treatment cums. How did you live without getting plowed like this?");
	}
	//Untreated
	else output("\n\nIf it weren’t for the bed propping you up, you’d have collapsed minutes ago. You’re lucky that the most you need to do is offer Kiro your ass and try to stay conscious, because if you had any responsibilities - even a single one - you’d utterly disappoint. The pleasure is too good, too all-consuming, for you to manage to do anything but squeal and moan, your passage artlessly fluttering around the too-big cock impaling you.");
	//Merge treated/untreats!
	//Futa bonus
	if(pc.hasCock()) 
	{
		output("\n\nIt’s bad enough that she’s putting pressure on your prostate through your insides, making your [pc.cocks] squirt ribbons of [pc.cum] all over her sheets - ribbons that your [pc.belly] is forced to drag back and forth through, slickening you in your own misfiring goo. The fact that you keep squirting out a little more whenever she bottoms out doesn’t help.");
		output("\n\nKiro giggles almost drunkenly, <i>“Claiming your territory, slut?”</i> ");
		if(9999) //FITS
		{
			output("She swats your [pc.butt] again, this time leaving a handprint on the other side. ");
			if(pc.hasFur() || pc.hasScales()) output("A shame no one will ever see it under your [pc.skinFurScales]. ");
		}
		output("<i>“You’re going to have to wash these now.”</i> She bottoms out particularly hard, forcing you to squirt what feels like a gallon of [pc.cum] against the far edge of the bed. <i>“But not until I’ve wrung out every drop.”</i>");
	}
	//Merge
	output("\n\nYou cum way before she does, but then again, you’re not so desensitized from constant masturbation that you need a special machine to get yourself off. One moment, you’re moaning like a wanton whore, the next, your moans are pitched up an octave and your ");
	if(pc.legCount == 1) output("[pc.leg] is flailing and twitching on the floor.");
	else output("[pc.legs] are flailing wildly on the floor.");
	output(" Your eyes roll up behind your eyelids, forcing you to focus almost entirely on touch - and the exquisite bliss that it provides.");
	
	//Gusher
	if(pc.isSquirter()) 
	{
		output("\n\n[pc.GirlCum] splatters Kiro’s crotch again and again, slicking the fur on her weighty balls down and making her shine. The puddle beside the bed deepens significantly, wicking into a nearby pile of laundry. All you can smell is your own lusty cunt");
		if(pc.totalVaginas() > 1) output("s");
		output(" and Kiro’s musky rod, like they’re the only things in the room that matter.");
	}
	processTime(23);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",kiroFucksYourCuntPartII,x);
}

public function kiroFucksYourCuntPartII(x:int = 0):void
{
	clearOutput();
	showKiro();
	output("You come to a little later. Kiro’s still plowing you with vigorous force, and your [pc.vaginas] ");
	if(pc.totalVaginas() == 1) output("is");
	else output("are");
	output(" still clenching from the aftershocks of a recent orgasm, though it got hard to count after the second landed right on the first’s heels. It isn’t a change in tempo that drew your attention; it’s the way the hermaphrodite’s balls are slapping against [pc.oneClit] and mound. They’re getting bigger, swelling even.");
	output("\n\nKiro’s eyes are closed, and she’s panting breathily, her hands still mindlessly groping and squeezing at your ass as if it was her only anchor to this world.");
	output("\n\nYou look back over your shoulder, watching her through your own delirious haze as you try to remember how to move your lips - the ones that aren’t bucking and dripping around a dick. <i>“Kiro.”</i> Your voice sounds hoarse and raw from too much screaming and moaning. <i>“Cum. Please.”</i> ");
	if(pc.isBimbo()) output("Your face effortlessly flows into a perfectly enticing fuck-me look, the kind your sex-obsessed mind flashes at guys without thinking.");
	else output("You’re too orgasm-addled to give her your lustiest look, but the fucked-out look on your features is probably good enough.");
	output("\n\nHowling in relief, Kiro plunges herself in to the hilt and stays there, her jizz-swollen balls clapping wetly against you one last time. Her dick surges, swelling from top to bottom, especially the top. Her blossoming flare seals itself off inside you, just in time for you to feel her length distend from the sheer volume of cum travelling through her urethra, taking you to your limit. Your eyes meet hers briefly, before they roll halfway up and lose all ability to focus. Somehow, it makes you even wetter.");
	output("\n\nA tide of cum washes into the deepest parts of your passage as the kui-tan cums, bathing your every fold in her musky, animalistic jism. Her hips jerk and rock gently, pushed by the violent muscle spasms that are even now flooding you with more and more of her slick spunk.");
	if(!pc.isPregnant(x)) 
	{
		output(" You can feel your cervix yield before the building pressure, allowing her to vent her backed-up balls directly into your womb, turning your uterus into a spoogey swimming pool and your fallopian tubes into stops on a pearl-colored highway. It doesn’t take long for your [pc.belly] to swell up with the extra mass, rounding out");
		if(9999) output(" to a greater degree than it already was");
		output(".");
	}
	else output(" You can feel it splatter off your sealed cervix, building in pressure until jets backwash out around the head, slipping out in hot, pearly gushes from your distended netherlips. Kiro’s spent cum splatters out of you with each wave of her ejaculation, soaking her feet and legs in her own virility. If she cares at all, she doesn’t show it. She’s too busy moaning and smiling as her balls shrink.");

	output("\n\nUtterly spent, Kiro half-collapses against your back, her rigid nipples digging into you, pressed down by the weight of her heavy breasts. ");
	if(pc.hasHair()) 
	{
		output("She fondly strokes your hair");
		if(pc.earType == GLOBAL.TYPE_CANINE || pc.earType == GLOBAL.TYPE_FELINE || pc.earType == GLOBAL.TYPE_KUITAN || pc.earType == GLOBAL.TYPE_EQUINE) output(" and scratches your ears");
		output(". ");
	}
	output("She gives a satiated sigh, nuzzling into your ");
	if(pc.tallness - 20 > kiro.tallness) output("back");
	else output("neck");
	output(". <i>“Now that’s... a proper fucking.”</i>");
	output("\n\nYou twist back to look at her again. <i>“I don’t think I’m going to ");
	if(pc.isNaga()) output("be able to slither properly");
	else if(pc.isBiped() || pc.isTaur()) output("walk straight");
	else output("be able to move right");
	output(" for a week.”</i>");
	output("\n\n<i>“Right,”</i> Kiro replies, standing back up, her cock still hard inside you. <i>“Like I said, a proper fucking.”</i> She slowly withdraws from you. The moans and mews you make are entirely outside your control; you’re far too sensitive after all that not to enjoy one last bit of friction.");
	output("\n\nHer wilting flare escapes with an audible pop, freeing her musky cum from your imprisoning nethers like a cork from a champagne bottle. She even catches some of the flow on her fingers and offers the mixed juices to you. Of course, they’re more Kiro’s than yours.");
	if(pc.isBimbo()) output(" Yummy! If you didn’t have other stuff to do, you’d prop yourself up on your shoulders and let the rest drip into your mouth, but it’s better fresh anyway. Maybe you can suck her off next time. Yeah, that’d be awesome!");
	else output("If you didn’t feel so wonderful, you’d probably give her a snarky remark. Instead, you let her feed you a sample of her cum. It’s about as salty as you’d expect, but somehow, it hits the spot.");
	processTime(43);
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	kiro.orgasm();
	clearMenu();
	addButton(0,"Next",kiroFucksYourCuntPartIII,x);
}

public function kiroFucksYourCuntPartIII(x:int = 0):void
{
	clearOutput();
	showKiro(true);
	output("One shared, giggling shower later and the two of you are getting dressed, ");
	if(pc.isNice()) output("cracking jokes about the mess you’ve made. Of course, you help her clean it up. You helped make it, after all.");
	else if(pc.isMischievous()) output("studiously avoiding the topic of who is going to have to clean up her bedroom after all this. Kiro caves first, sending you off so that she can deal with the mess. It is her place, after all.");
	else output("trying not to get turned on enough for round two. You’ve got a busy day ahead of you, and she has a mess to clean up.");
	output("\n\nThe trip back to the bar is blessedly short, at least.	");
	processTime(16);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Repeat Vaginal]
//Tooltip: You've already claimed Kiro's pussy for yourself. Time to tread familiar ground, and let the kui-tan beauty ride you like a beast in heat.
//By Savin
public function repeatVagFuckKiro():void
{
	clearOutput();
	showKiro(true);
	author("Savin");
	var x:int = pc.cockThatFits(kiro.vaginalCapacity(0));
	if(x < 0) x = pc.smallestCockIndex();
	if(kiro.ballDiameter() <= 7) output("Kiro shoves you back against the bed, forcing you to lay flat with the weight of her own body crawling over you, trailing kisses across your [pc.belly] and [pc.chest]. Her furry fingers tease your [pc.nipples] before running over your [pc.hair] and pulling you into a fierce kiss.");
	//If ModerateSack!Kiro:
	else if(kiro.ballDiameter() <= 14) 
	{
		output("Kiro's furry fingers dig into your shoulders, holding you down on the bed as she mounts you, straddling your [pc.hips] and dragging her huge, dark slab of horsemeat across your [pc.belly]. Her cum-swollen nads follow a moment later, nice and big and swollen with pent-up spunk. The feeling of them brushing against your [pc.legs] makes you tremble with anticipation. <i>\"What do you say, Angel... why don't you just sit back and worship this big fuckin' cock of mine while I ride yours? I wanna feel that [pc.cock " + x + "] of yours fucking my twat so bad...\"</i>");
		output("\n\nWhen she breaks it, the kui-tan beauty sidles up onto her knees, giving you an awesome view of her big, black-tipped tits and the reddish-brown slab of meat growing hard between her legs. She leans back, letting it flop down on your belly and balancing her balls just over your [pc.cock " + x + "], rubbing the crown of your member through the lips of her pussy. <i>“Just lay back and let me take care of everything,”</i> she purrs. <i>“You already claimed my cunt all for yourself... now it’s time to let me enjoy it.”</i>");
	}
	else output("<i>“Oh, stars, I need you Angel,”</i> the kui-tan moans, running a hand along the bronze curve of a furry breast. Her huge, cum-swollen nuts tremble against your [pc.legs], sloshing with pent-up seed. You can feel the massive buildup rolling just under the taut skin of her sack, and every movement of hers seems to make her cock throb and drool, splattering horse-cream onto your [pc.belly]. <i>“Wanna just lay back and let me ride you? I’ve been dreaming about that [pc.cock] of yours pounding my pussy ever since... ever since the first time.”</i>");
	output("\n\nYou can’t argue with that plan. Giving Kiro an affirming wink, you lay back on her lavish bed and let the tanuki-girl have her way with you, contenting yourself with running your hands over her flared hips and fluffy nuts while she works. Kiro grins down at you, starting to angle herself back towards your prick... until your wandering hands urge out a particularly potent spurt of pre that cakes your chest in sticky heat. She moans, but the accident quickly reminds the tanuki of her unique situation... and the fact that she’s going to have to clean up whatever mess she makes.");
	output("\n\nShe gives you an apologetic smile and grabs one of the unopened condom wrappers lying haphazardly about. Her small, sharp teeth make quick work of the wrapping, and she deftly stretches out the nanofiber sheathe inside around the head of her equine equipment. You shiver at the sensation of ");
	if(pc.biggestTitSize() >= 1) output("her wrapped prick gliding on a glaze of cum between your tits.");
	else output("her hefty meat flopping onto your cum-stained chest.");

	output("\n\n<i>“Much better!”</i> she says, running her fingers from crown to medial ring, and watching as a spurt of pre quickly fills the reservoir with a sloshing load. <i>“As much as I’d have liked to see that all over your face, I don’t wanna spend all day cleaning up after myself.");
	if(kiro.ballDiameter() > 14) output(" Besides, I’d just end up swollen and horny again by the time I was done. I wish I could just spend all day jerking off and cleaning cum, but...");
	output("”</i>");

	output("\n\nYou chuckle, and give one of Kiro’s meaty nuts a gentle squeeze - just enough to urge her ogre-sized dick to keep spurting and drooling for you. The sight of her just constantly <i>cumming</i> is enough to make your heart hammer with excitement.");
	//if PC has full-ish nuki’ nuts:
	if(9999) output(" You can’t wait to be doing to same, but dumping your giant load deep in Kiro’s tight little pussy.");
	else output(" You roll your lover’s sack in your hands, feeling the nice heft of her masculine enhancements... and loving every one of her quiet little moans.");
	if(kiro.ballDiameter() >= 14) output(" You squeeze Kiro’s bean-bag sized nuts between your hands, grinning to yourself as her huge dick unleashes enough cum just from your gentle teasing to make a whole pack of porn studs jealous.");

	output("\n\nKiro reaches behind herself, wrapping her fingers around your [pc.cock " + x + "] and angling your shaft towards the dark, wet lips of her deflowered sex. You chew a lip, trying to contain your anticipation as your lover slowly - tantalizingly - lowers herself down on your prick. You gasp as her pussylips tease your [pc.cockHead " + x + "], heat and sultry wet excitement enveloping the first inch of your shaft.");
	output("\n\nShe stays there for a moment, holding you hostage just on the edge of penetration, and grins down at you.");
	if(kiro.ballDiameter() > 14) output(" <i>“Oh, stars, I want it so bad,”</i> the tanuki girl moans, one hand gripping your dick, the other pinching one of her black nipples so hard she almost squeals.");
	//if moderate balls:
	else if(kiro.ballDiameter() > 7) output(" <i>“You want this as bad as I do, huh? My pussy’s all yours, Angel... I hope you enjoy it as much as I’m going to.”</i>");
	else output("<i>“You ready for this, Angel?”</i> Kiro coos, running her other hand across her breast and pinching a black nipple. <i>“I know I am. The anticipation’s killing me.”</i>");

	output("\n\nYou smile at her, running your hands across her hips, gently guiding her down.");

	output("\n\nOf course, Kiro’s never been about subtlety. Rather than easing down your cock, the tanuki all but impales herself on your [pc.cock " + x + "], taking you ");
	if(pc.cockThatFits(kiro.vaginalCapacity(0)) >= 0) output("to the hilt, burying you into a velvet vice of wet heat");
	else output("as deep as she can - God damn she’s tight! Your back arches, and her belly bulges with the sheer mass of cockmeat you’re stuffing into the once-virginal kui-tan");
	output(". Kiro’s voice is a high-pitched cry, echoing her exaltation off the bulkheads around you. Her hips buck in your hands, grinding on your dick; her cock, on the other hand, is much less feminine in the way it shows its pleasure. Were it not for the industrial-strength sheath wrapped around it, you’d be absolutely <i>basted</i> in Kiro’s spunk: she floods her condom with pre, making the reservoir bubble out like a water balloon that presses into your chin.");
	pc.cockChange();

	//If PC has D+ cup tits:
	if(pc.biggestTitSize() >= 4) 
	{
		output("\n\nThere’s nothing like a little dickgirl-on-dickgirl action, you tell yourself as Kiro spears herself on your cock, and her own mammoth horsewang flops wetly between your [pc.boobs]. You trace your hands up from Kiro’ sexy little hips, up the gargantuan shaft of her cock, and then down to your own tits. A little pressure has them squeezed together, wrapping around Kiro’s horsecock and starting to massage her shaft.");
		output("\n\n<i>“Oooh, that’s the stuff, Angel,”</i> Kiro moans, chewing a lip and squeezing her tit a little harder, growing more and more desperate to wring every bit of pleasure from her body. <i>“You really know how to worship a cock, huh? Well, lemme show you how I do it...”</i>");
		output("\n\nKiro starts to move her hips, dragging your [pc.cock] through the tight, slick slit of her sex until your crown is all that’s straining her lips open");
		//if nuki nuts:
		if(9999) output(", squirting thick strands of pre into her pussy");
		output(". Rivulets of feminine excitement drool down your cock, a tiny mirror to the deluge flooding her cock-sheath. Her hands fall down to yours, lacing her fingers with your own and squeezing your [pc.boobs]; you groan and snuggle into her grasp, letting the kui-tan tease your nipples and squish your breasts even tighter around her cock.");

		output("\n\nHer hips start to move after that, drawing your cock back in, and dragging her dick through your spunk-lubed cleavage. <i>“Ah, yeah,”</i> she moans, digging her fingers harder into you. Her hips rock forward and back, picking up speed as she goes - rising off your cock and thrusting back between your boobs. Double the pleasure, double the fun! Even the feeling of Kiro sliding her schlong through your rack is immensely pleasurable, nice and slippery and hot...");
		output("\n\nBut it’s nothing compared to Kiro’s tight, wringing pussy clenching around your [pc.cock " + x + "], desperately milking you for all you’ve got.");
	}
	//PC has tiny/no tits:
	else
	{
		output("\n\nKiro’s pussy really does feel like it’s molded just for you, the perfect holster for your [pc.cock " + x + "]. Maybe it’s because you took the tanuki’s virginity, or maybe because the two of you just fit so well together, but her cunt just seems to perfectly conform to your cock.");
		output("\n\nHer own arm-sized horsewang drops heavily onto your chest, the cum-slogged reservoir bounces like a water balloon. You laugh and grab it, running your fingers through the rapidly-swelling ball and down to her flared cockhead. Kiro groans and arches her back, grinding her cock against your chest. <i>“Unf, that feels too good,”</i> she grins, rubbing her dick a little faster. You trace your hands up from Kiro’ sexy little hips, up the gargantuan shaft of her cock, and wrap your hands around the girthy horsemeat.");
		output("\n\nYou start stroking her, slowly at first, but picking up speed nice and quickly. Kiro matches your speed all the while, starting to bounce in your lap. <i>“Oooh, that’s the stuff, Angel,”</i> Kiro moans, chewing a lip and squeezing her tit a little harder, growing more and more desperate to wring every bit of pleasure from her body. <i>“You really know how to worship a cock, huh? Well, lemme show you how I do it...”</i>");
		output("\n\nKiro moves faster, dragging your [pc.cock " + x + "] through the tight, slick slit of her sex until your crown is all that’s straining her lips open");
		//if nuki nuts: 
		if(9999) output(", squirting thick strands of pre into her pussy");
		output(". Rivulets of feminine excitement drool down your cock, a tiny mirror to the deluge flooding her cock-sheath. Her hips come back down a moment later, spearing her again and eliciting a squeal of excitement from the lusty kui-tan. You stroke her, she rides you, and you both let your voices echo off the walls in a chorus of pleasure.");
	}
	//Combine:
	output("\n\n<i>“Oh yeah, that’s the stuff babe,”</i> Kiro groans, riding your dick about as fast as she can");
	if(kiro.ballDiameter() > 14) output(", at least with her huge balls weighing her down");
	output(". <i>“Mm, never thought I’d love getting vag-fucked like this!”</i>");

	output("\n\nFrom where you’re lying, you’re pretty sure she’s the one fucking you!");

	if(kiro.ballDiameter() >= 14)
	{
		output("\n\nSpeaking of getting fucked, you’re starting to get a little crushed by the weight of Kiro’s cum balloon pressing down on your chest, sloshing around with every motion.");
	}
	else output("\n\nKiro’s cum balloon is growing bigger and bigger with every movement. You only imagine what that feels like, pumping out such a huge amount of cum without actually orgasming, just leaking it like a hose while she rides you.");
	output(" Kiro’s moans start to take on a higher, more frantic pitch; her hips sway faster, and your [pc.cock " + x + "] is treated to the most wonderfully wet squeeze as Kiro rockets towards her climax.");

	output("\n\n<i>“C’mon, Angel. Cum with me!”</i> she purrs, and suddenly Kiro’s condom becomes a geyser of liquid pressure blasting across your chest.");

	//if hugebawls:
	if(kiro.ballDiameter() > 14) 
	{
		output("\n\nKiro’s huge balls seem to undulate under her, the massive weight of backed-up cum rushing all at once towards her winking cumslit. You ");
		if(pc.biggestTitSize() < 4) output("stroke her faster");
		else output("titfuck her faster");
		output(", trying to make the mass-hosing of cum easier for her. She shrieks, and the constant spray of spunk from her horsecock hits a crescendo, and explodes in a burst of spunk of epic proportions.");
		
		output("\n\nKiro’s balls visibly deflate as she cums, discharging the gallons and gallons of backed-up spunk through the throbbing shaft of her modded dick and into the straining reservoir of her condom. She looks like there’s a beach ball attached to her dick, bouncing up and down on your chest as it bloats with hot, musky horse-juice.");
		output("\n\nYou’re afraid even the industrial-strength sheath is going to burst when Kiro finally gives a defeated sigh and slumps forward, dropping her exhausted weight onto the soft, hot bulb of cum-ball. That least little movement is just what you needed to send you over the edge too, it turns out - you grab Kiro’s hips and thrust yourself up into her drooling pussy, blowing your load deep in Kiro’s dark-lipped twat. She gasps, mewling as she feels your [pc.cumNoun] splash into her sex, ");
		if(pc.cumQ() <= 200) output("smearing her pussy’s walls with seed");
		else if(pc.cumQ() <= 5000) output("bloating her womb with a thick load of spunk");
		else output("pumping her with so much cum that she looks like all the weight in her balls has just transferred to her belly");
		output(".");
	}
	//if moderatebawls:
	else if(kiro.ballDiameter() > 7)
	{
		output("\n\nKiro’s hefty nuts clench, rubbing vigorously against your [pc.belly] as their owner finally relieves the pressure that’s been building up in them since God knows when. You stroke her dick faster, using your whole body to ease the cataclysmic climax of tanuki-spunk billowing into her condom’s bloating tip. Kiro grunts and hammers her hips down on you harder and faster, apparently deciding that if she’s going to cum, you’re damn well going to join her.");
		output("\n\nYour back arches, voice breaking with pleasure as Kiro milks your dick for all it’s worth. A rush of [pc.cumNoun] barrels through your [pc.cock] and into Kiro’s cunt, ");
		if(pc.cumQ() <= 200) output("smearing her pussy’s walls with seed");
		else if(pc.cumQ() <= 5000) output("bloating her womb with a thick load of spunk");
		else output("pumping her with so much cum that she looks like all the weight in her balls has just transferred to her belly");
		output(".");
	}
	//if normalbawls:
	else
	{
		output("\n\nKiro’s back arches, and she thrusts her whole weight into ");
		if(pc.biggestTitSize() >= 4) output("fucking your tits");
		else output("grinding on your chest");
		output(", and you watch as her condom’s reservoir is bloated by jets of hot, musky spunk. <i>“Fuck yeah!”</i> she cries out, bouncing and grinding and cumming like mad. The sensation quickly pushes you over the edge, and with a grunt of pleasure you end up hilting yourself inside the orgasming tanuki and ");
		if(pc.cumQ() <= 200) output("smearing her pussy’s walls with seed");
		else if(pc.cumQ() <= 5000) output("bloating her womb with a thick load of spunk");
		else output("pumping her with so much cum that she looks like all the weight in her balls has just transferred to her belly");
		output(". She screams in pleasure as you join her in climax, eyes rolling up in her head like the blissed-out cum-slut she is.");
	}
	output("\n\n<i>“Ohh, you treat me so good, Angel,”</i> Kiro coos, still gyrating her hips ever so slightly, making sure to drain you of every drop. <i>“Couldn’t have picked a better person to pop my cherry... keep this up, and maybe I’ll let you be my one and only. Just let you keep my pussy all for yourself...”</i>");
	output("\n\nOh, you’d <i>definitely</i> like that...");
	processTime(33);
	pc.orgasm();
	kiro.orgasm();
	//[Next]
	clearMenu();
	addButton(0,"Next",repeatFillingKirosCuntEpilogue);
}

public function repeatFillingKirosCuntEpilogue():void
{
	clearOutput();
	showKiro(true);
	author("Savin");
	output("One shared, giggling shower later and the two of you are getting dressed. Kiro’s condom is a huge, bloated ball of hot spunk in the trash can beside her bed, you note.");
	if(pc.isBimbo()) output(" Mmm, you wouldn’t mind having that as a to-go snack...");
	output(" Your lover offers you her arm, and the two of you make your way quickly back to the bar.");
	processTime(10);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}



