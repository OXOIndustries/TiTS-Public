//Bar Preview Blurb
public function kiroSetup(button:int = 0):void
{
	if(kiro.ballDiameter() <= 7) output("\n\nThe tanuki-girl pirate you saved, Kiro, is here sipping on a drink and thumbing idly through a data slate.");
	else if(kiro.ballDiameter() <= 14) output("\n\nThe tanuki-girl pirate you saved, Kiro, is here, casting lecherous looks over everyone else in the bar. She spots you and waves you over, but the look in her eyes is more hungry than friendly.");
	else output("\n\nThe tanuki-girl pirate you saved, Kiro, is here, looking lustily around the bar. Her swollen balls are obvious to anyone who looks. She very clearly needs some relief.");
	addButton(button,"Kiro",approachKiroAtTheBar,undefined,"Kiro","That tanuki pirate with the giant balls you rescued is here.");
}

public function roamingKiroAvailable():Boolean
{
	//flags["RESCUE KIRO FROM BLUEBALLS"] = 1;
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

public function approachKiroAtTheBar():void
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
		output("\n\nKiro extends a hand, and you shake it vigorously as she calls for a drink. At her invitation, you slip into the booth across from her as the waitress brings a pair of wine glasses filled to the brim with the house’s best. Classy as ever, Kiro swings her thigh-high boots up onto the table and downs the glass, <i>“So, what brings you out here, [pc.name]? Surely not to see little ol’ me, hmm? But while you’re here - and while my little friend here is under control,”</i> she says, patting the bulge in her clothes, <i>“I did say I’d love to show my appreciation if we ever met again. And I meant it. How about a drink?”</i>");
		processTime(2);
		//[Sure] [No Thanks]
		//Both Leads to mandatory exposition and drink buying scene.
		clearMenu();
		addButton(0,"Sure",kiroIntroductoryScene,true);
		addButton(1,"No Thanks",kiroIntroductoryScene,false);
	}
	//Full balls? Kiro'll drain 'em
	else if(pc.hasStatusEffect("Blue Balls") && pc.hasCock()) fluffilyWhorishPawjobs();
	//Talk to Kiro, Repeat
	//Savin
	else
	{
		author("Savin");
		//Bigger than Savin
		if(kiro.ballDiameter() > 14)
		{
			output("<i>“Welcome back,”</i> Kiro slowly drawls, obviously undressing you with her eyes as she does. One of her padded palms comes to rest on the small of your back, rubbing in slow circles as she admits, <i>“I’ve been saving up hoping that you’d come along again. I hope you’re ready for some fun....”</i>");
			output("\n\nThere's no hiding the greatly swollen orbs dangling between her legs. Their fuzzy undersides are actually visible beneath the hem of her too-short dress.");
		}
		else
		{
			output("<i>“Hey, " + pc.mf("handsome","gorgeous") + ",”</i> Kiro says, smiling warmly as you approach. <i>“Back again already? Come on, let’s have a drink.");
			if(kiroTrust() >= 35) output(".. unless you wanna get out of here, angel?");
			output("”</i>");
			if(kiro.ballDiameter() > 7) output("\n\nHer balls bulge beneath her dress like a pair of smuggled cantaloupes.");
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
	if(pc.lust() < 33) addDisabledButton(3,"Sex","Sex","You aren't really interested in sex at the moment.");
	else if(kiro.ballDiameter() > 14) addButton(3,"Sex",letsFuckKiro);
	else addButton(3,"Sex",letsFuckKiro);
	if(kiro.ballDiameter() > 7) addButton(4,"Relief BJ",giveKiroSomeRelief,undefined,"Relief BJ","Slink under the concealing surface above and give Kiro's poor balls the release they so desperately need. Besides, you were a little hungry, weren't you?");
	else addDisabledButton(4,"Relief BJ","Relief BJ","Kiro's balls don't look swollen enough to need the relief right now, though they are quite large.");
	addButton(14,"Leave",mainGameMenu);
}

//Kiro Buys You a Drink & Exposits a Bit About Herself.
//Learn about her spooginess and backstory somehow.
//Drink Intro
public function kiroIntroductoryScene(drank:Boolean = false):void
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
	output("\n\n<i>“Pshh, that was just an industrial accident. You know that if I can swell up that big and make so much.... Well, you know I could last, normally. I mean, look at what I’m packing!”</i> Kiro spreads her legs and pats her none-too-subtle package. It visibly twitches in response, and you swear it’s a little bigger than before she touched it. <i>“When I get as big as I was, a good cum wipes me out pretty hard, but I don’t let myself get anywhere near that. Instead, I have lots and lots of little orgasms. It helps that my little orgasms are bigger than three ausars’ put together.”</i> She knocks back a swig with a confident smile.");
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
public function tellKiroAboutTheCodex():void
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
public function dontTellKiroAboutTheCodex():void
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
public function definitelyDontTellAboutTheCodex():void
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
public function playWingmanWithKiro():void
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
public function embellishForKiro():void
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
public function playItStraightForKiro():void
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
		output("It isn’t as boring as you would have thought. The plain friend has a pretty solid sense of humor, and while she declines to joke about her airheaded friend, she winds up telling some real rip-roarers about some of the random passers-by in the bar. You’re both generally laughing and having a good time, not regretting your choice at all, even if you aren’t attracted to this woman.");
		output("\n\nKiro’s luck seems to be holding as well as your own! Her and her target are standing so close together than their hips are brushing together to tempo of the bone-quivering bass beats. The hippy little blonde’s nipples are hard through her practically sheer top, and Kiro’s cock is making an increasingly unseemly bulge through the middle of her outfit. If she waits much longer, she’s going to wind up growing right up into her tits. Seeing you watching, she proceeds to wink and do just that, letting a little of her flare peek between her tits as she flirts. Her conquest blushes hard, impressed, and they depart for the ship.");
		output("\n\nYou pass a good hour more hanging out with your new friend before letting the night wind down. Across from you, the plain friend looks a little worried, and she complains about her missing her friend, sorry she let her get picked up by a stranger. Apparently she had come along to help rein in her sluttier friend’s escapades and had failed. You console her by telling her that your friend is just as bad before asking for her number.");
		output("\n\nIt isn’t until she’s long gone that you realize it’s a fake.");
		//2.5 hours pass.
		processTime(135);
	}
	//Jackass
	else
	{
		output("Your assigned target is just so goddamned... plain! She has a face that has all the beauty of an oval. Her teeth are neat but unremarkable. Her complexion leaves a little to be desired, and she didn’t even bother with makeup! It’s no wonder her friend was alone, she had this dead-weight dragging her down all night. You sidle up to her and try your best pickup line... and get slapped.");
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
public function kiroDrankinConterst():void
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

	//Bein' drunk hurts!
	if(arg.isSmashed()) score -= 200;
	else if(arg.isDrunk()) score -= 100;
	else if(arg.isBuzzed()) score -= 50;

	if(arg.hasPerk("'Nuki Drunk")) score += 50;
	return score;
}

//Drinking Contest!
public function drinkingContestGo(cheated:Boolean = false):void{
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
			output("\n\nYou nod while standing, dragging her body with you as you both sway a little. You sink a hand into her plump ass, squeezing it enthusiastically as you start to lead her away. <i>“Come on Kiro, you have a bet to own up to.</i>”");
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
		output("\n\nYou nod while standing, dragging her body with you as you both sway a little. You sink a hand into her plump ass, squeezing it enthusiastically as you start to lead her away. <i>“Come on Kiro, you have a bet to own up to.</i>”");
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
public function lostTheDrinkingContestWithKiroAndTurnedIntoCocksleeve():void
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
	pc.shower();
	clearMenu();
	addButton(0,"Next",lostDrankinContestToKiroz);
}

//Unisex Loser Handjob
public function unisexLostToKiroAndGaveHerAHandJobBecauseDrunkenSluttery():void
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
public function lostDrankinContestToKiroz():void
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
	pc.shower();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Won the Contest
//Drunken Kiro Blowjobs - Slobbery Jaw-Filling Goodness
public function wonKirosContestLikeAChampAndGotBlown():void
{
	clearOutput();
	showKiro(true);
	output("<i>“Now,</i>” you say, leaning against the wood-paneled interior of her ship, <i>“I believe I was promised a hermaphrodite fuck-pet in exchange for winning our little wager....</i>”");
	output("\n\nMiss Tamahime, for all her previous bluster and confidence, drops onto her knees before you, her body pressing back against her huge, fluffy tanuki tail as it rests on the wall. She dazedly blinks her eyelashes and coos, <i>“What can your fuck-pet do for you, [pc.Master]?</i>”");
	output("\n\n");
	if(pc.isCrotchGarbed()) output("Pulling your [pc.cocks] out of your [pc.lowerGarments]");
	else output("Hefting [pc.oneCock] in your hand");
	output(", you shed your gear into a pile behind you. <i>“For starters,</i>” you begin, <i>“you can suck down something non-alcoholic. I know you’re a thirsty girl.</i>” You tap her on the nose with your [pc.cockBiggest], immediately getting a bit more erect from the skin-to-skin contact. <i>“A little protein supplement might do you some good.</i>” You let go to grab hold of her cinnamon-hued curls. The burnished brown tangles catch in your fingers as you pull her roughly towards your groin, pressing her face against your [pc.cockBiggest] hard enough that you feel her nose sniffing at it and her lips compressing softly against it, just above the [pc.cockHeadBiggest].");
	output("\n\nKiro noisily snuffs at your cock. The very tip is moist and cool as it drinks in your masculine organ’s musk. Her eyelids flutter closed, and her lips press harder on the veiny slab of tumescence, a warm, hot tongue slipping between them to lap at the sweat that girds the organ. She slurps her tongue back into her maw just in time to spool it out further, licking all the way down to your [pc.cockHeadBiggest] and back up again. Pressing back on you until you bump the polished panel behind you, Kiro lavishes your boner with affection, slobbering kisses and slurps down in between panting breaths, her plump, juicy lips compressing down in juicy, worshipful kisses. One hand grabs you just above your [pc.sheathBiggest], jerking it with gentle strokes, palm up and fingers squeezing.");
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
	if(pc.cockTotal() > 1) output(" Kiro’s hands stretch out to take up the unbound cockflesh, stroking and tugging, massaging your skin with steady strokes, the plush pads on her fingertips making love to your every inch.");
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
	output("\n\nKiro vibrates her way through increasingly vocal, muffled moans, the reverberations drawing groans of pleasure from you simultaneously. The halls of her ship echo with the paired vocalizations. It’s a good thing the ship is empty, because you don’t think you could keep from crying out in glee at the wonderous cock-worshipping you’re getting. The muscles in your [pc.legs] are twitching violently, spasming around. You’re getting closer and closer, drawn all the way to precipice of pleasure by the suckling tunnel that’s pulling you deeper and deeper, twining around your shaft with ribbons of hot, wet, bliss.");
	output("\n\nGrunting, Kiro accelerates the pace of throatfucking, bouncing herself up off her tail to maintain the vigorous throatfucking. Each time her lips press against your [pc.sheathBiggest], she sucks a little harder, practically pulling your oozing pre right out of your opening cumslit. Your whole shaft is thickening inside her, stretching her throat wider and wider. Kiro gurgles messily around it, but she keeps it up, meeting your gaze as she does so. Her eyes seem to be boring right into you, two pools of liquid lust just begging you to release into her mouth, asking you to pack her belly and coat her throat with your jism.");
	output("\n\nYou could not make her wait at this point if you wanted to. You grab hold of her rounded ears and pull her forward, planting your [pc.cockBiggest] as deeply into her maw as possible");
	if(pc.cockTotal() == 2) output(", your other cock slipping along her neck");
	else if(pc.cockTotal() > 2) output(", your other cocks slipping along either side of her neck");
	output(". The corners of Kiro’s mouth turn up in a smile, and her breasts turn into a blur of bouncing, jiggling, barely-contained titfuck. Pre-cum sloshes and spills out around the top of her clothing, announcing with lurid spurts of stickiness just how filled the tanuki-woman’s top has become. [pc.EachCock] surges with blissful heat, and you let out a low groan of ecstasy, feeling your urethra bulge and your meat flex in her throat, violently spurting ropes of [pc.cum] straight into the drunken hermaphrodite’s tummy. Her cheeks hollow encouragingly, and she winks, not even having to work to swallow thanks to her excellent technique.");
	output("\n\nKiro is sucking you through what feels like the longest, slowest orgasm of your life, greedily taking every single drop of [pc.cumColor] delight directly into her gurgling middle. Her climax arrives hot on the heels of your own, erupting through a gap in her clothing to splatter off her chin. The next floods between her top and her fur, slicking out her sleeves and down her thighs, thoroughly coating her in cum. She whimpers around your dick at this, twisting and writhing, letting you fill her while simultaneously soaking herself.");
	if(pc.cumQ() >= 1500) output(" The sheer amount of [pc.cum] you inject into her swells her belly into a noticeable bump. In turn, this causes her still-spurting shaft to bow out under the liquid weight, opening up more room for her own sperm to flood.");
	if(pc.cumQ() >= 3500) output(" By the time you finish, her middle is visibly pregnant, and her cock has been yanked from her tits to futilely erupt alone and unaided outside her cum-soaked enclosure.");
	output("\n\nPulling out, you drip a last, long strand of [pc.cum] across her tongue, which Kiro greedily gulps down. She opens wide after to show you that it has been swallowed");
	if(pc.cumQ() >= 3500) output(", and immediately belches, her stomache far beyond its normal capacity");
	output(". You can see that her throat has been stained [pc.cumColor], and it gives you a satisfied tingle throughout.");
	output("\n\nKiro sways drunkenly for a moment before sliding on her side, stroking her still-cumming cock until she finishes at last. She moans, <i>“Fuuuuck, [pc.name]. That was good!</i>”");
	output("\n\nTouching her chin with your [pc.foot], you turn her up to look at you. <i>“That’s [pc.Master]. I believe I have the rest of the day to use you.</i>” You may not have specified exactly as such in the terms of the wager, but it was definitely implied. Besides, she’s in no state to argue.");
	output("\n\nKiro burps and sighs, nodding, <i>“Forgiveness [pc.Master], but fuck-pet’s balls are going to swell up so big after this. It’s a Kui-tan quirk.</i>”");
	output("\n\nGrabbing the drunk, temporarily sated tanuki under the arm, you lift her up and start hauling her towards her shower. <i>“I suppose we had better get you cleaned up before you get all anxious for another fuck then, shouldn’t we?</i>”");
	output("\n\nFuck-pet nods.");
	//Pass 30m and reset lust.
	processTime(30);
	pc.orgasm();
	pc.shower();
	kiro.loadInMouth(pc);
	kiroVictoryDrinkEpilogueRouter(true);
}

//Drunken Kiro Twat Oral
public function youWinAContestAndKiroSlobbersYerPussy():void
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
	output("\n\n<i>“For starters,</i>” you begin, <i>“you could drink something down that’s nonalcoholic, for a change.</i>” You smile knowingly. <i>“I’ve got just the thing.</i>” You edge forward, hips swaying, and grab Kiro by the ears, tugging her face-first into [pc.oneVagina]. Her moist, button nose pressing gently against [pc.oneClit] while her lips inadvertently compress against your lower ones. A lusty flush rises through your frame, starting at your crotch and pouring down into your feet before flooding every crack and crevice of your being. You let out a moan of pleasure as you work your [pc.hips] in slow circles, dragging your heated entrance back and forth over her lips.");
	output("\n\nKiro flushes, mumbling, <i>“Yes, [pc.Mistress],</i>” as you avail yourself to her face. Your [pc.girlCum] soon gives her mouth a lovely slick sheen, and you pull her back by her fluffy, rounded ears to have a look at her. She’s panting, mouth agape and eyelids heavy, her expression unfocused and undoubtedly aroused. Lending even further credence to your assessment of her ardor, you spy a cylindrical distention straining through her outfit, outlined in stark relief by the elastic fabric. It has risen right up between her breasts, pushing them apart to make room for its pulsating mass. The top of it is capped by a flaring, blunted tip that pulsates and twitches whenever her breasts shift around it.");
	output("\n\n<i>“Is this what you want?</i>” Kiro asks while licking her lips. Her body sways a little as she asks. The ability to sensuously lap up [pc.girlCum] while simultaneously maintaining balance appears to be a little beyond her intoxicated state, but she’s trying anyway. Her tongue is slipping, sliding, and caressing the cunt-slicked curves of her mouth, her eyes locked on you, searching for approval.");
	output("\n\nMerely being in the presence of this hyper-sexed hermaphrodite is enough to send twinges of pleasure through [pc.eachVagina], but having her like this, on her knees and begging for another taste of you, is enough to make you sopping wet with excitement");
	if(pc.wettestVaginalWetness() >= 4) output(". Of course, you’re generally soaking most times. This girl just gets you a little wetter than normal");
	output(". You look down at her cute little face, her slightly-dilated eyes set in the middle of a darker, mask-like patch of fur, and smile. <i>“I didn’t tell you to stop, my little drunken fuck-pet.</i>”");
	output("\n\nNodding in feigned sobriety in the way that only the truly inebriated can, Kiro whispers, <i>“Yes, of course.</i>” She looks back down, inhales, and plunges forward. Immediately, you feel her back against your folds, but this time, she’s not simply letting you rub upon her face. She’s grabbing your hips and licking. Her fingers squeeze gently as her tongue extends, and she lovingly slobbers across the entirety of your entrance.");
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
	output("\n\nKiro tosses back her hair and looks at you, begging and pleading with her eyes. Her hands move faster, bringing with them lurid squelches that are firing off machine-gun fast, slick melons wrapped firmly around her twitching horse-cock, those ponderous jugs unable to slow or stop their polishing of Kiro’s lusty boner. She whimpers into your cooch, interrupting her own purr momentarily. It seems she’s trying to hold back from cumming herself until she gets you off, but she wants you to cum and soon.");
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
	pc.shower();
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
public function victoryEpilogueLazyOne():void
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
public function getTongueBathedEpilogue():void
{
	clearOutput();
	showKiro(true);
	author("QuietBrowser/LD");
	output("You are about to twist the knob and let water flow, but then a wicked idea comes to your mind. Kiro is your fuck-pet for the day and she’s responsible for all this, so she should be the one to clean it. And you just happen to know a fun way for her to do that. You turn to her and say, <i>“Fuck-pet, come here and kneel.”</i>");
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
	output(" and then finally to your [pc.feet]. <i>“Okay, [pc.Master], if that’s what you want,”</i> she croons, then opens her mouth and lets her tongue flop out, twisting it lewdly in the air with the practiced skill of someone very adept at oral. Her arms reach out and rest themselves comfortably on your hips before her head sinks towards your crotch, ");
	if(pc.hasCock())
	{
		output("her tongue caressing your [pc.cock] eagerly, making long, languid strokes that cover every inch of [pc.cockColor] skin, dabbing at the tip");
		if(pc.cockTotal() > 1) output("s");
		output(" in pursuit of your juices");
		if(pc.hasVagina()) output(" before ");
	}
	if(pc.hasVagina()) output("negotiating her way to [pc.oneVagina], where she begins to painstakingly lick and tease you, sliding her tongue inside and hungrily making out with your netherlips");
	output(".");

	output("\n\nYou moan at her ministrations. It feels good to have her cleaning you so diligently. However she won’t be able to reach your upper body from her current position, so you place a hand on her forehead and push her away a bit. She lets out a confused grunt at your actions, nearly sitting on her swollen balls as she falls to her ass, her huge horse-dick already half-erect itself. You take a seat on the floor, leaning back against the wall as you lift ");
	if(!pc.isNaga()) output("a foot for her.");
	else output("the tip of your coils for her.");

	output("\n\nConfusion momentarily flickers in her eyes before understanding dawns; this evidently isn’t a form of sex she’s used to, at least not on the giving end. Still, gamely she reaches out and takes your [pc.foot] and delicately brings it to her mouth where she begins lavishing kisses upon it, occasionally darting her tongue out to wipe it cleaner. She suckles upon your [pc.feet], making erotic moaning noises, her forgotten shaft rising up so that it is ");
	if(pc.legCount > 1) output("sliding between your [pc.legs].");
	else output("sweeping up against the side of your [pc.leg].");

	output("\n\nYou smile to yourself when you feel the tip of her shaft poking against your [pc.leg] and immediately move");
	if(pc.isNaga()) output(" your remaining coils to grip and stroke her shaft.");
	else if(pc.legCount > 1) output(" your other [pc.foot] to stroke her shaft.");
	else output(" to accommodate it.");
	output(" She gasps softly but continues to lavish her attention on your [pc.foot], licking it sparkling clean and clearly hoping you’ll attend to her needs. You slide your [pc.foot] lower, rubbing it against her balls, hefting them and weighting them. They are soft... and heavy with their liquid weight. You decide to return your attention towards her shaft, stroking it whilst only momentarily stopping to tease her balls and feel them churn with need.");
	output("\n\nA hiss of disappointment and frustration escapes her lips, and you realize you can hear a constant dripping noise as her over-excited balls leak a steady stream of pre-cum from her broad, round-headed horse-prick. Under your [pc.foot], you can feel that self-same gene-modded trouser-python stiffen to its full, magnificent length and girth. As you keep toying with her monstrous masculinity, her licks and kisses start becoming increasingly erratic; she’s panting for breath now as your efforts push the oversexed alien towards her own climax. You can almost hear the cum churning in her huge sac.");
	output("\n\nIn one final stroke you feel her groan as she finally steps over the edge, painting your ");
	if(pc.legCount > 1) output("[pc.feet] and your ");
	output("[pc.legs] with ropes of pent-up cum.");
	output(" You don’t make any effort to spare yourself from the onslaught of kui-tan seed and just let her cum herself out. Once done though, you smile at her and order her, <i>“Clean up this mess.”</i>");

	output("\n\nA lecherous, slightly drunk smile splits her face and she nods eagerly before bending back to work, hungrily slurping and sucking her own jizz off of your body, her tongue chasing every last stray drop and her lips messily kissing you to aid her in vacuuming it up. You let her work in silence for a few minutes, before reminding her that she still has plenty of you to care for. She lets out a muffled noise and stops, looking up at you. You point at your chest, still dry and without a single trace of the kui-tan’s licks. When you told her to tongue bathe you; you meant for her to bathe <b>all</b> of you. <i>“Get back to work, fuck-pet.”</i>");

	output("\n\nShe smiles eagerly, nodding her head, then practically swims up your body to her feet, kissing and licking and sucking every inch of you that she can reach. When she reaches your [pc.lowestBreasts], she lets out a pleased hum, your only warning before she plunges face-first into ");
	if(pc.breastRows[pc.bRows()-1].breastRating() >= 1) output("your cleavage");
	else output("flat chest");
	output(", nuzzling and kissing with a passionate hunger as she tries to smother herself");
	if(pc.breastRows[pc.bRows()-1].breastRating() >= 1) output(" in your boob-flesh")
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
public function justButtStuffForKiroNoAsslickery():void
{
	clearOutput();
	showKiro(true);
	author("QB & LD");
	output("<i>“What? Aw...”</i> she grumbles plaintively. She really seemed to be looking forward to rimming you... maybe she was hoping this would be a prelude to her cock going up your ass - she’s already hard again, you realize. Still, she has much work to do. So you order her to keep going until you are squeaky clean.");
	output("\n\nShe grumbles her agreement and then does as you order, her pace much more slow and steady now that she knows there’s no chance of her getting to bury herself in your ass afterwards. Long, languid strokes caress your ass until she deems you clean, then she keeps going, descending down towards your [pc.thighs]. You praise her for her dedication as you close your eyes, focusing on the pleasure of having an eager kui-tan fuck-pet cater to your needs....");
	processTime(13);
	clearMenu();
	addButton(0,"Next",rimOrNoRimVictoryEpilogueForKiro);
}

//[=Rim=]
public function getRimmedBecauseYouHaveBadTastesJustLikeSavin():void
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
public function rimOrNoRimVictoryEpilogueForKiro():void
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
	pc.shower();
	clearMenu();
	addButton(0,"Next",victoryEpilogueLazyOne);
}

//Epilogue Scene: Ride Kiro’s Cock (QB/LD)
//By: QuietBrowser & LukaDoc
//Use the PC’s pussy/ass to ride Kiro like a bull.
//Not compatible with centaurs.
//Requires Kiro's balls be pretty big!
public function rideKiroDickVictoryDrunkScene(blowjobbed:Boolean = false):void
{
	clearOutput();
	showKiro(true);
	author("QB & LD");
	output("The bath is quick and uneventful, though your big-balled fuck-pet does try to entice you on more than one account. Once done, you dry yourself up and order Kiro to do the same. <i>“Yes, [pc.Master],”</i> she replies, taking the towel and wiping herself down, stroking the fluffy towel across her body in clearly seductive gestures, emphasizing her voluptuous breasts her shapely ass and her mighty masculinity as she does so.");
	output("\n\nOnce you’re both dry, you call out to her, <i>“Fuck-pet, rule number one: no clothes.”</i> She smiles drunkenly at that and nods, standing there with her tail swishing lazily behind her, breasts idly jiggling as she sways slightly, too sloshed to really stay upright. You motion for her to follow you back into her room. You look about, inspecting the unkempt surroundings, and spot something interesting hidden amongst the dirty magazines. You lift the object in your hands with a knowing smile. <i>“What a naughty girl you are, pet.”</i>");
	output("\n\n<i>“Really, [pc.Master]? Why, whatever do you mean?”</i> she asks, feigning innocence, but there’s a growing smirk on her lips as she sees the object in your hands, the mast-like bulk of her equine shaft already starting to rise again as her imagination goes to work about what you have in mind.");
	output("\n\n<i>“Put it on. Pets should always use their collars. Where’s the leash?”</i>");
	output("\n\n<i>“I think it’s under the bed with some of my clean panties, [pc.Master],”</i> she tells you, already sinking to her knees and raising her hands in front of her breasts, mimicking a dog begging for its master’s attention - a resemblance heightened by the fact her tail is definitely starting to wag behind her. You sift through her belongings and quickly find the aforementioned leash under some of her big-booty porn and some thankfully clean panties. She watches you, openly smiling as you approach, lifting her chin to better expose her neck so you can tie the collar around it and then attach the leash. <i>“What does [pc.Master] have in mind for [pc.hisHer] fluffy fuck-pet?”</i> she asks eagerly.");

	output("\n\nYou don’t grace her with a reply, you simply tug the leash and lead her for a walk around the ship interior. She takes the hint and goes beyond it, falling to all fours and walking doggy-style after you - a little awkwardly, given she’s built like a biped, but better than an unaltered human would. Her cock and balls drag along the floor as she goes, the friction clearly getting to her; her equine dick just keeps slipping further and further out of its sheath, and then starts to raise itself off of the floor, until it’s meatily smacking into the canyon of her cleavage with every awkward, waddling step she takes");
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
	output("\n\n<i>“" + pc.mf("M-master","M-mistress") + "? What are you - ooh! - doing?”</i> she asks, a touch of nervousness in her voice that is almost, but not quite, drowned out by her eagerness, her length slowly, steadily starting to stiffen inside of you. You force yourself to grip her inside you as you prepare yourself. With a seductive smile, you let her know you are just preparing yourself for round two. She didn’t think you were done, did she? You still have your whole day ahead of you. She grins in admiration and settles back, clearly ready to let you have your wicked way with her again... and again, and again too, if you want. You’re glad you won!");
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
public function cumSpikeKirosDrink():void
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
public function reduceKirosBallSize():void
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
public function letsFuckKiro():void
{
	clearOutput();
	showKiro();
	author("Savin");
	if(kiro.ballDiameter() <= 14)
	{
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
	//Big Ball Kiro Sex Menu
	else
	{
		output("At your first murmur of assent, Kiro’s body slides into yours, moulding around it as she encircles you in a tight, groping hug. Her hands rove across your [pc.chest] and [pc.butt], squeezing both with eager gropes. She grinds her crotch against your [pc.thigh], dragging her turgid length up and down your ");
		if(pc.isCrotchGarbed()) output("[pc.lowerGarments]");
		else output("[pc.skinFurScales]");
		output(" with quick little humps, her balls so big and heavy that they feel like a pair of seam-ripping cantaloupes that have been trapped in the hermaphrodite’s poor, disintegrating panties. She reaches ");
		if(pc.isCrotchGarbed()) output("into the front of your [pc.lowerGarments]");
		else output("towards your groin");
		output(" to ");
		if(pc.hasCock()) 
		{
			output("grab [pc.oneCock], stroking you off right here in the bar in front of everyone, her hand sliding vigorously along your length, encouraging you to give into her lusty affections with the ");
			if(silly) output("pawsome");
			else output("awesome");
			output(" handjob");
		}
		else if(pc.hasVagina()) output("touch [pc.oneVagina], dipping a finger right into your lusty delta in front of everyone, her digits stroking, entering, and spreading you, encouraging you to give in to her confident touches.");
		else output("stroke the bare [pc.skinFurScales], comfortingly caressing your featureless but nonetheless sensitive groin in a way that makes your [pc.asshole] clench in anticipation.");
		output("\n\n<i>“Mmmm, I was hoping to bump into you. I was saving up a hot, steaming load of cum to plug you with,”</i> Kiro purrs. Her immensely fluffy tail brushes your [pc.leg] as she pulls you away from the bar, hand still in your crotch, still touching and stroking and trying to turn your brain into a soup of lusty mush. <i>“My milker is good, but I want you, [pc.name]. I want to make you pregnant with cum until it backwashes out over my balls and makes me cum again. Then I want to pull out and bathe you in it.”</i> Kiro whimpers a little, and you feel her shaft jump inside its confinement.");
		output("\n\nShe wrangles you the whole way back to her ship");
		if(pc.tallness + 5 < kiro.tallness) output(" with ease, your smaller form eventually hefted entirely into her arms so that she can molest you more freely as she moves through the station. Curious looks are the only interference she receives along the way.");
		else if(pc.tallness < kiro.tallness + 5) output(", molesting you the entire way, making you pant and give up simpering little moans while passersby give the pair of you cross looks.");
		else output(" with quite a bit of difficulty. Your bigger, heavier form is a little difficult for her to manage while molesting you, but she makes do, fingers ceaselessly teasing your crotch. Curious looks line your passage through the station, watching the little kui-tan leading her latest, super-sized sexual conquest towards her ship.");

		output("\n\nHissing closed behind you, Kiro’s airlock shuts you into the blessed privacy of her cabin. You’re both panting heavily, leaning on each other. No longer are you simply on the receiving end. You’re reaching out and undoing the kui-tan’s garments, peeling confining fabrics off Kiro’s immense horse-cock until the whole thing spills out, dangling and half-hard. It erects completely almost immediately, rising up as you toss away the last of Kiro’s clothing and expelling a single drop of crystal-clear pre-cum. You’re equally naked by this point, ");
		if(pc.isNude()) output("your equipment");
		else output("the little equipment you wear on your mostly-nude form");
		output(" discarded in a pile so that Kiro can return to ravishing your body. She presses into you from behind, dick threading through your asscrack, and she whispers, <i>“Now, am I going to shove this thing straight up your ass and turn you into a cream-filled fuck-balloon or something else?”</i>");
		output("\n\nHer weighty balls throb as she considers her action, growing heavier by the second. They look almost as big as soccer balls now. <b>If you speak up, you can likely goad her into taking you a certain way...</b>");
		kiroBallsSexMenu();
	}
}

public function kiroBallsSexMenu():void
{
	clearMenu();
	showKiro(true);
	//[Done] Take Her Virginity - 3800 words
	//High trust only - get her panties.
	if(pc.hasCock())
	{
		if(pc.cockThatFits(kiro.vaginalCapacity(0)) >= 0)
		{
			if(kiro.vaginas[0].hymen) addButton(0,"Fuck Vag.",takeKirosVirginity,undefined,"Fuck Her Vagina","Kiro seems excessively focused on her dick. Why not share the loving with her vagina?");
			else addButton(0,"Fuck Vag.",repeatVagFuckKiro,undefined,"Fuck her Vagina","You took her virginity; might as well see if she's still just as tight.");
		}
		else addDisabledButton(0,"Fuck Vag","Fuck Her Vagina","You don't have an appropriately-sized member for such an action. You'd split her in half!");
	}
	else addDisabledButton(0,"Fuck Vag.","Fuck Her Vagina","You need a penis to do this.");

	if(pc.hasCock()) addButton(1,"Balljob",balljobFromKiro,undefined,"Balljob","Stick your cock between those oversized balls and squeeze out an orgasm - maybe for both of you.");
	else addDisabledButton(1,"Balljob","Balljob","You need a penis to get a balljob from Kiro.");
	addButton(2,"Catch Anal",bodyBloatingButtObliteratingBowelBasting,undefined,"Catch Anal","One way or another, Kiro's going to fill you up.");



	addButton(5,"Invite",inviteAFriendForKiroPlays,undefined,"Invite","Invite a friend to play with you and Kiro...");
	addButton(14,"Back",kiroMenu);
}

public function kiroSexMenu():void
{
	clearMenu();
	showKiro(true);
	//[Done] Take Her Virginity - 3800 words
	//High trust only - get her panties.
	if(pc.hasCock())
	{
		if(pc.cockThatFits(kiro.vaginalCapacity(0)) >= 0)
		{
			if(kiro.vaginas[0].hymen) addButton(0,"Fuck Vag.",takeKirosVirginity,undefined,"Fuck Her Vagina","Kiro seems excessively focused on her dick. Why not share the loving with her vagina?");
			else addButton(0,"Fuck Vag.",repeatVagFuckKiro,undefined,"Fuck her Vagina","You took her virginity; might as well see if she's still just as tight.");
		}
		else addDisabledButton(0,"Fuck Vag","Fuck Her Vagina","You don't have an appropriately-sized member for such an action. You'd split her in half!");
	}
	else addDisabledButton(0,"Fuck Vag.","Fuck Her Vagina","You need a penis to do this.");
	//[Done] Catch Vaginal - 4000 words!
	//Kiro bends you over your bunk and slams that nukicock home.
	if(pc.hasVagina()) addButton(1,"Get Fucked",catchVaginalFromKiro,undefined,"Get Fucked","Let her bend you over her bunk and slam that thick dick home.");
	else addDisabledButton(1,"Get Fucked","Get Fucked","You need a vagina to access this scene.");
	if(pc.hasCock()) addButton(2,"2xMilker",kiroMilkerDoubleTimeBySavin,undefined,"Milker Doubletime","Strap into Kiro's milker with her for a fun, cock-draining evening.");
	else addDisabledButton(2,"2xMilker","2xMilker","You need a penis to participate in this scene.");
	addButton(3,"Hand Milk",manualMilkingFromSavin,undefined,"Hand Milk","Hand milk Kiro, and she doesn't lactate...");
	//PUSSY PUMPIN~
	if(kiroTrust() >= 66)
	{
		if(pc.hasCock() || pc.hasVagina()) addButton(4,"PussyPump",treatedPussPumps,undefined,"PussyPump","Give Kiro's pussy a thorough pumping up with the SukMastr 2000 you bought. She could spare to give her feminine side a little extra attention. <b>Enabled by default until the item is actually made available.</b>");//9999
		else addDisabledButton(4,"PussyPump","PussyPump","You need a penis or vagina (in the usual location) to deal with the consequences of pumping up Kiro's pussy.");
	}
	else addDisabledButton(4,"PussyPump","PussyPump","Kiro doesn't trust you nearly enough for that.");
	//THREESOMES~
	addButton(5,"Invite",inviteAFriendForKiroPlays,undefined,"Invite","Invite a friend to play with you and Kiro...");
	addButton(14,"Back",kiroMenu);
}

//[Done] Take Her Virginity - 3800 words
//High trust only - get her panties.
//Tooltip: Kiro seems excessively focused on her dick. Why not share the loving with her vagina?
public function takeKirosVirginity():void
{
	clearOutput();
	showKiro(true);
	output("Looking up at her from the bed, you catch a glimpse of her shiny black pussy lips. They practically wink at you. Why haven’t you fucked those yet? You stretch out an arm, cradling her balls gently before slipping past to rub at the alluring entrance. <i>“How about a little cow-girl?”</i> you suggest with your fingers already beginning to explore her innermost places.");
	//Low trust
	if(kiroTrust() <= 75) 
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
	pc.shower();
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
	pc.createKeyItem("Panties - Kiro's - Lacy, black, and crotchless.");
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
	if(pc.cuntThatFits(kiro.cockVolume(0)) >= 0)
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
		if(pc.cuntThatFits(kiro.cockVolume(0)) >= 0) //FITS
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
		if(pc.bellyRating() >= 35) output(" to a greater degree than it already was");
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
	pc.shower();
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
	if(pc.perkv1("'Nuki Nuts") > 0) output(" You can’t wait to be doing to same, but dumping your giant load deep in Kiro’s tight little pussy.");
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
		if(pc.perkv1("'Nuki Nuts")) output(", squirting thick strands of pre into her pussy");
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
		if(pc.perkv1("'Nuki Nuts") > 0) output(", squirting thick strands of pre into her pussy");
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
	pc.shower();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Milker Doubletime, By Savin
public function kiroMilkerDoubleTimeBySavin():void
{
	clearOutput();
	showKiro(true);
	author("Savin");
	output("Grinning up at the amorous tanuki, you ask if instead of just rutting like animals, maybe the two of you could make use of that big, luxurious cockmilking station she’s got.");
	output("\n\n<i>“Oh, feeling as pent up as I am are you?”</i> Kiro teases, wrapping her softly-furred hands around your [pc.cockBiggest] - just tight enough to make you groan. <i>“As much as I was hoping to ravage that [pc.butt] of yours, I guess I can sympathize...”</i>");
	output("\n\nKiro’s grasp on your dick turns into a gentle tug, leading you up onto your ");
	if(!pc.isTaur()) output("[pc.feet]");
	else output("animalistic lower half");
	output(" and off of her bed. Giving you a wink from over her shoulder, the fluffy babe takes you out of her bedroom and down the corridor, leading you by the dick down to the front deck, and the ball-draining station she’s set up for herself there.");
	output("\n\nThe gigantic milking machine is much as you remember it: a gigantic metal pump hooked up to a tube and three big-screen holo-views, each with the main menu of some seriously illegal porno looping hypnotically. A sticker’s been planted on the side of the machine, saying <i>“0 days since last accident.”</i> Kiro gives you a wink, and guides your pre-slick pecker over to a second harness she’s got rigged up beside her own, just about your size. <i>“I figured you might wanna come play sometime,”</i> she laughs, giving you a little push toward the towering cum-silos. You set your kit aside, well out of the way of the huge tubes surrounding the berth you and your tanuki friend will soon be occupying. You pick up one of the suction tubes and start to fiddle with it, but before you can get it on you yelp as Kiro swings in behind you, giving you a sharp slap on the ass. Hands on her hips, cock flopping between her legs with sucker firmly affixed, she looks like ");
	if(!silly) output("some sort of cock-cyborg");
	else output("... I mean really she’s got a fucking pneumatic suction cup on a gigantic horsecock what the fuck else would it be, that’s pretty fuckin’ unique");
	output(". You go back to work, but with a grin she slaps your hand away, taking the sucker from you.");
	output("\n\n<i>“Hey, what gives?”</i> you growl, but the sultry look in the tanuki’s eyes says it all. She gives you a little push back against the steel cum-silo as she drops to her knees, taking your [pc.cockBiggest] in one hand, stroking it with her oh-so-soft, furry fingers. You stifle a low moan, eyes rolling back as the sexy vixen slowly strokes you off, thumb rolling around your [pc.cockHeadBiggest] as her mouth inches sinfully close, hot breath boiling across your sensitive flesh. Her tongue slips out, lapping across the engorged slit of your throbbing dick, her voice rising to a sexy purr as she tastes you, lips thrumming as they slip around your hard shaft, taking your cock into the warm, silky-wet sheath of her mouth. You lean back against the steel wall of the gigantic milker, basking in the sultry heat of Kiro’s mouth as she sucks you off. Your fingers go to her long, cinnamon hair, gently guiding the tanuki’s lips down your shaft. She grins up around your [pc.cockBiggest] with eyes full of lust, easily taking inch after inch of your prick. As she fellates you, though, you can see her hands deftly unfurling the straps and suckers on the milking tube, getting you nice and ready.");
	output("\n\nShe carries on longer than you’d have expected, and minutes pass by with your lust building, hips bucking gently against Kiro’s dark lips as she sucks and sucks. With eyes rolled back in pleasure, you barely notice the split second of transition as your [pc.cockBiggest] pops from Kiro’s mouth and into the tight, suckling embrace of the cock milker. That feels... nice... You let slip a groan of pleasure as the milker’s pressure builders, tugging on your spit-slick shaft with mind-numbing insistence, its force unrelenting. Your [pc.knees] practically buckle under the milker’s suction, forcing you to grab hold of the great big silo to steady yourself. Between pneumatic sucks, you watch as Kiro clambers over to her own berth, easily sliding her own sucker on; the face she makes when it activates is priceless, pure ecstasy that nearly barrels her over.\n\nShe catches herself on a pair of iron bars nearby, unable to stifle a lewd groan as the milker goes to work on her massive erection; her over-sized prick immediately responds by twitching and jumping to attention, still for the slightest moment before it erupts in a massive load of cum, whitewashing the transparent sucker with a flood of seed. Kiro throws her head back with a roar of sexual release, grabbing her big, soft tits and squeezing them as hard as she can. You slump back, [pc.knees] suddenly weak as you see your friend blast a massive load so easily; a moment later, you feel your prick twitching, cum rushing up your length. You grab the nearest bar and cry out, teeth gritting as you cum, painting the plastic [pc.cumColor] as the milker drains your [pc.cockBiggest] - and not for the last time.");
	output("\n\nYou stumble back as orgasm rocks your body, cock spasming as it's utterly drained of seed faster than you can blink, [pc.balls] withering as cum pours from your [pc.cockBiggest]. Across from you, Kiro yelps and moans, squeezing her dark nipples as her cock’s seemingly unending flood of sperm continues, backing up the throbbing veins of the milker until she’s finally given a moment to relax, slumping against the wall of the silo. You glance up, watching through transparent tubes as her cum and yours is sucked up by the powerful current, dumped into the great big silo that’s already half-full of the leftovers from Kiro’s morning wood. When you look back, you nearly scream as your vision is flooded with horny tanuki stalking up on you, barely able to make a waddle with the milker working her enormous horsecock. She grabs your shoulders, pushing you down to your [pc.knees] with mouth hovering just over one of her black nipples.");
	output("\n\nYou don’t have the chance to protest, as the milker suddenly turns it up a notch. You yell out, mouth locked in a ring of pleasure; Kiro takes that as submission and rams her tit in. You reflexively suckle, sucking on her puffy teat until you force a gasp of pleasure out of your tanuki lover. She groans, fingers slipping through your [pc.hair] to guide you further onto her breast as she bucks her pump-laden hips against the air, trying to get some modicum of friction from the merciless suckers. You groan and bare it, trying hard not to cum again as the milker works your [pc.cockBiggest] with rhythmically pulsing bursts of pressure that’s sure to have you cumming again. While you still have your faculties in control, though, you flash the pleasure-wracked tanuki a sly grin and slip a hand beneath her swollen, swinging sack to the slim, cum-slick slit of her sex.");
	output("\n\nShe stifles a gasp as you slip a finger into the tight channel of her cunt. Her muscles squeeze reflexively, clamping hard around your probing digit as another two of your fingers slip further back to the puckered hole of her ass. Kiro can’t help but cry out as you push into her asshole, spreading the much looser hole wide until you can feel the pulsing orb of her engorged cum-vein. She throws her head back and cums again at the slightest touch, her huge cock spasming as white-hot spunk floods the miker yet again, adding to your own orgasm that follows moments later. You cry out around the tit in your mouth, voice muffled by a mouthful of brown fur as your [pc.cockBiggest] lets loose another explosive orgasm, squirting seed right into the sucking vortex of the milker’s tube.");
	output("\n\nKiro flops back and cums again seconds after the first time, screaming as her muscles crush down on your delving digits as her prostate bulges, balls visibly deflating while she cums and cums, humping desperately against your hand and the pulsing milker. A moment later, you feel the pressure welling in your own prick and with a gasp and moan, flop overtop your lover, crying aloud into her soft bosom as your hips buck into hers, squirting and squirting your next load into the seemingly infinite vortex of the milker’s silo. Your hand works harder, pushing deep into Kiro’s bowels and cunt, as your orgasm and hers nearly sync, cum splashing into the veins of the towering milker overtop you both. Your other arm wraps around her waist, holding your tanuki lover close, her massive cock pinned between your bodies as you feel as if every last drop of semen is sucked from your [pc.balls].");
	output("\n\nYou just about black out as the milker works its unceasing magic on you, relentlessly sucking your cock like a legion of a thousand whores. You cum again and again, losing track of your myriad orgasms until finally, the unending suction stops, leaving your sore and spent prick flopping down as the sucker falls from your crotch. With a final gasp, your head flops into the valley of Kiro’s cleavage, gasping for breath, finally able to relax. With a wry chuckle, Kiro wraps her arms around your waist, holding you as her own cock slips back into its fuzzy sheath.");
	output("\n\n<i>“Niiiiice,”</i> she sighs, taking a deep breath of the musky air as she strokes your hair, <i>“It’s a lot more fun with someone else with you.”</i>");
	output("\n\nKiro gives you a wink and a quick kiss on the brow as the two of you struggle up, gathering your discarded gear, careful not to slip on the excess spooge leaking from the milker tubes.");
	processTime(35);
	pc.orgasm();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Manual Milking
//Savin - Paid
//{Any gender, needs moderate trust. Access from Sex menu}
public function manualMilkingFromSavin():void
{
	clearOutput();
	showKiro(true);
	author("Savin");
	output("Reaching across the bed to Kiro’s impressive collection of sex toys, you suggest she spread her cheeks for a little prostate milking. After all, what’s the fun of having a great big cock and a swollen sack if you can’t enjoy a little fun from behind from time to time? Kiro gives you a grin, letting her swollen erection flop onto your belly as she slowly crawls into bed over you, dragging her cock and swinging, furry sack up your prone form as she moves. You grab the long rod, teasing its flared tip as she slips up to the head of the bed, bracing an arm against the bulkhead, the other reaching back to spread her cheek invitingly, revealing the winking star of her luscious behind.\n\nPetting the soft, taut curve of Kiro’s backside, you look through her collection of dildos, carefully selecting your opening weapon. You decide to start off with the basics: a nice, long purple plastic rod you guess is about as thick around as two of your fingers: it looks like a perfect fit for Kiro’s puckered hole, just enough to giver her a nice little stretch.");
	output("\n\nYou reach under the bed and grab a bottle of Kiro’s elasticizing lube, squeezing out a thick glob of it onto the long shaft of the dildo. The sticky green lube spreads easily across the sheer plastic surface, and you take your time coating your tool until it practically drips with the stuff; with what’s still smeared on your fingers, your reach up to Kiro’s spread cheeks, gently rubbing it into the furry cleft of her expansive rear. She shudders visibly as you coat her hole, but the low, whining moan she lets slip when your finger presses in tells you that she’s more than eager for your touch.\n\nYou give her a playful swat on the behind with your free hand as your finger pushes in all the way, tickling the big lump of her engorged prostate. Kiro yelps, and between her spread legs you can see her big equine dong jump, spurting a white trickle across her pillow. Groaning, she reaches into her bed stand to pull out a wrapped condom and tears it open with her teeth. Holding her cock firmly between her tits, the tanuki wraps the nano-fiber sheath around her flared head, pulling it tightly down her half-rigid shaft; by the time she’s done, the reservoir is already filling with her trickling seed, massaged out by your finger buried deep in her behind.");
	output("\n\n<i>“Aaah, god, so good,”</i> she moans, stroking her shaft as your finger twists around in her, smearing her anal walls with her lube, <i>“Don’t mind the condom, do you? I don’t wanna clean the </i>entire<i> room...”</i>");
	output("\n\nYou answer her with an affectionate pat, just hard enough to make her taut assflesh jiggle as your finger pulls out. With a pleasured sigh, Kiro plants her hands back against the headboard, letting her twitching member bounce as she braces herself. Her tail sways rhythmically, swishing nervously in your face, the puffy tip brushing your nose as you try and line the dildo up.\n\nYou push it out of the way, only to have Kiro playfully swat you with it, making you miss your mark - the slick shaft of the dildo goes a bit low, sliding through the slit of her drooling cunt, just parting the lips of her labia to peek out the other side, rubbing her prominent bud. Kiro’s breath comes is a startled hiss, cheeks clenching as your plastic toy teases her clit. Her tail swishes in your face, blocking your view just long enough for Kiro to reach down and grab the flared head of the dildo and push it back just enough so that it, with a little push from you, it slides right up her crack, greasing her up one last time before it’s too late.");
	output("\n\nSo close to your goal.... You lean in, out of her tail’s way, so close you can almost smell the musky lust boiling off your lover as you cup one of her big teats, squeezing the black nipple until she gives a plaintiff yelp; with one little thrust, the dildo slips into her black hole, sliding in with practiced ease. Kiro stifles a little moan as the toy penetrates her, and you can see her cock jump to full hardness, thumping hard into the headboard as the reservoir is filled with a sudden gush of spunk. One little push and her tool’s already pouring out that much, filling the nano-fibre condom’s tip to the size of an apple before you’ve hilted the toy in her. Kiro’s fingers dig into the wood, teeth clenched as you fully bury her long, thick toy in her ass.\n\nThe toy vibrates in your hand, shivering ever so slightly to the beat of Kiro’s thumping heart as her big, cum-swollen prostate quakes under the thick shaft pushing up against it. You gingerly rock the plastic rod back, easing it out through her lube-slicked shaft until her tail hole is stretched open by just the thick, slimy crown before pushing back in right to the base. Kiro’s cock responds with a twitch as she whimpers her pleasure, jizz spurting from her tip like an uncorked bottle of the finest champagne, ballooning out the condom with every push and thrust you give her.");
	output("\n\nYour slow thrusts gradually pick up to a steady pace, milking the engorged bulb of her male organ just enough to make her cock twitch and spurt for you. In desperate need of release, Kiro wraps a furry hand around her monolithic member, trying to jerk herself off; you swat it away. <i>“Tsk, tsk. Just go with the flow,”</i> you tease, rubbing Kiro’s tight-clenched ass. Your affectionate caress turns into a harsh spank, eliciting a yelp of surprise and a jet of cum from the kui-tan. Her balls visibly shrink as the plain dildo penetrates her, and the tanuki is helpless to do anything but grit her teeth and hold on.");
	output("\n\nYou pull the dildo out after a few long, slow minutes of rectal reaming. Kiro whines, tail thrashing as you toss the used toy aside, searching for your next tool. As you do, you can’t help but smile at your work, already showing itself off for you: Kiro’s ass is agape and well-stretched thanks to her special lube, holding itself open wide enough for you to easily slide four fingers right on in, caressing the big, throbbing sack of her prostate through the thin wall of her ass. She groans, cum pouring out of her cockhead as you push it out from the source, gently teasing it as your other hand alights on the next toy: a thick, meaty horsecock. As wide around as your forearm, this beast’s nearly as impressive as Kiro’s own prick, and wobbles under its own weight as you pull it out.");
	output("\n\nKiro glimpses the mighty beast over her shoulder and gulps. <i>“I usually save that one for last...”</i> she says, stopping when you reach around and grab her cock. Her whole body shudders with shameless pleasure as you stroke her own shaft, bringing the half-flaccid member to full attention with a few skilled strokes, stopping only to pull it back between her legs, letting it flop upside-down behind her. She whines as your [pc.legs] lock around her shaft");
	if(pc.hasCock()) output(", your own [pc.cockBiggest] flopping on top of it");
	output(" while you lean down, aligning the horsecock toy with her behind. You want a front-row seat for this!");
	output("\n\nA quick splash of lube to add to the murky mess already drooling out the kui-tan’s stretched hole, and you’re ready to go. You press the flared head of the dildo up against Kiro’s dark pucker, letting her feel the massive girth of the thing pressing in against her for a long moment before pushing in. She screams in pleasure, back arching and cock spasming as you relentlessly thrust the plastic cock deep inside her. You watch giddily as her cock jumps and twitches as inch after inch of plastic pony passes over her most sensitive spot, milking the cum out of her in a steady stream. But the time you’ve hilted the equine member in her rectum, Kiro’s cock is wallowing in a beanbag chair’s worth of spooge. Confident in the condom’s durability under stress, you lean back against the sloshing bubble of her sheath and get comfortable.");
	output("\n\nFor her part, Kiro’s anything <i>but</i> comfortable. She groans and sighs with every breath, hips thrusting back against the over-sized horsecock toy spreading her ass wide. You rock the shaft back with her movements, working with the lovely herm to pull the toy back out until just the flare’s inside her, pressing hard against her pulsing prostate before shoving it back in again. Her stomach is bulging with the sheer mass of horsedong inside her before you’ve even hilted her, and her own slab of horsemeat can’t help but spew its load like a firehose, responding with quarts of spunk for every inch of latex inside its owner. Kiro’s back arches, hands cupping her breasts to knead the black teats atop them, trying to wring some control of her own pleasure as you tend to her overabundance of sperm.");
	output("\n\nYou hilt the toy pony in Kiro’s ass and take a moment to admire the sight of it, bulging the kui-tan’s belly with its sheer magnitude; the wild spasms of her rectum make it twitch and shudder, which only serves to put ever more pressure on her overburdened prostate. She’d probably twitch and shudder her way to orgasm on her own at this point, but where’s the fun in that? You plant a kiss just above her spasming pucker before leaning over to the pile of toys, looking for the next big thing you can shove up your lover’s bum.");
	output("\n\nA cute, pink vibrator catches your eye - doubly so when you pick it up and see the friendly, bright flower pattern of tiny ridges and bumps along its shaft. You squeeze out a healthy dose of lube onto the latex girth, but before you get to work with it, you let its slide up into Kiro’s stretched crack, giving her a little thrill thanks to the cool lubricant.");
	output("\n\n<i>“Uh... forget something, angel?”</i> Kiro whines, shaking her booty at you - which has the delightful effect of making what bits of horsecock aren’t inside her sway enticingly. You pat one of her fuzzy cheeks reassuringly, but do nothing to remove the horsecock in her ass, only nudge it aside with the tip of the pink toy. Kiro gives a sharp gasp as you push the crown of the pink toy into her pucker, which stretches deliciously thanks to the special lube your kui-tan uses; her ass can do nothing but submit to your will, held agape as you slide the next toy in and hit the vibrate setting.");
	output("\n\n<i>“O-oh shit,”</i> Kiro groans, biting her lip as you stretch her ass out, thrusting in and out with her vibrator to give her ass a nice fucking on top of it all . <i>“Too... too much. There’s too much!”</i>");
	output("\n\nYou watch giddily as the kui-tan’s oversized horsecock throbs and twitches, cum oozing out quicker into the beanbag-like condom behind you. Panting heavily, trying not to cum and failing beautifully, Kiro lets out a shrill, girlish cry as her dick erupts into the tight-wrapped sheath around it, flooding it with a sea of salty spunk with enough force to knock you right off, sending you toppling onto the bed beside her. Kiro’s hips buck and thrust as she comes, pounding an imaginary pussy full of her cum - or more likely, getting reamed from behind like a bitch in heat as she creams herself from the overwhelming anal pleasure.");
	output("\n\nThe condom on Kiro’s cock stretches and bloats as the tanuki slut pumps it with her seemingly endless supply of spooge, filling it until even its advanced material seems like it couldn’t take another spurt before popping. But thankfully, it holds, and Kiro’s able to flop face-down onto the bed, panting and moaning as the vibrator and horsecock continue to stimulate her even after orgasm. Chuckling, you remove the intruding members - which only gives Kiro another thrill, bloating the condom further. Her ass still agape, a perfect black <i>“O”</i> of ecstasy between her cheeks, you decide to leave her to recover... and find something to do with that cumbomb of hers.");
	processTime(25);
	kiro.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Kiro Fluffy Pawjobs - 3,000 twerds!
//PC has blue balls/swollen nuki nuts.
public function fluffilyWhorishPawjobs():void
{
	clearOutput();
	showKiro();
	output("<i>“Welcome back,”</i> Kiro slowly drawls, obviously undressing you with her eyes as she does. They flick to your crotch and back to your face, and a knowing, toothy smile breaks out. <i>“Somebody needs to cum, huh?”</i>");
	output("\n\nYou blanch. How could she possibly know?");
	if(pc.perkv1("'Nuki Nuts") > 0 && pc.balls > 0) output(" You look back down at your swollen loins and sigh. Being part kui-tan does make it pretty hard to hide.");
	else output(" It’s not like you puff up like she does just because you haven’t gotten laid!");
	output("\n\n<i>“Yeah, you need to cum <i>bad</i>.”</i> Kiro sips on her drink, looking like a cat that’s gotten the cream. <i>“I");
	if(pc.balls == 0 || pc.perkv1("'Nuki Nuts") <= 0) output(" can see it on your face");
	else output(" could see the bulge from here, even if I couldn’t read it on your face");
	output(". Void knows I’ve been there enough myself.”</i> Her eyes twinkle mischievously. <i>“I could help you out with that, you know. Nice and quick, under the bar. They’ve got a drain down there for spilled drinks. All you’d have to do is try not to draw attention to yourself.”</i>");
	output("\n\n<i>“In public?”</i> you ask");
	if(pc.exhibitionism() >= 66) output(", unable to contain your excitement.");
	else output(", a little nervously. What if you get caught?");
	output("\n\nKiro lifts a paw and presses against your ");
	if(!pc.isCrotchGarbed()) output("exposed member.");
	else output("[pc.lowerGarment]-covered member.");
	output(" It’s soft and warm, the supple leather of her paw’s pads cradling you like tiny pillows. You stiffen immediately, both below the belt and above, relaxing only when you realize the barkeep is giving you an odd look.");
	output("\n\n<i>“In public. It’s dark down there. Nobody will notice if my foot roams over and has a little fun.”</i> The chocolate-furred seductress rubs her toe back and forth, just below your [pc.cockHeadBiggest].");
	if(pc.isCrotchGarbed())
	{
		output(" Even through the intervening layer");
		if(!(pc.lowerUndergarment is EmptySlot) && !(pc.armor is EmptySlot)) output("s");
		output(", it still feels heavenly. <i>“All you’ve got to do is pop it out.");
	}
	else output(" It feels heavenly. <i>“All you’ve got to do is point it in my direction.");
	output(" Give me proper access. You can cum all over the floor and my feet, maybe even order a nice drink before you do it. Whaddya say?”</i>");
	output("\n\nIt is... tempting, to say the least. Her foot definitely has your full, unbridled attention, but someone could potentially see. Do you let Kiro relieve you?");
	pc.lust(35);
	processTime(4);
	//[Yes] [No]
	clearMenu();
	addButton(0,"Yes",yesKiroIDoWantPubbieFJ);
	addButton(1,"No",noIDontWantaPubbieFJKiro);
}

//No
public function noIDontWantaPubbieFJKiro():void
{
	clearOutput();
	showKiro();
	output("You grab hold of her ankle and reluctantly aim it back at the ground. <i>“N-n-not now.”</i> There’s no disguising the way you reacted to her touch, but you didn’t come here for a little public footsie.");
	output("\n\nKiro tilts her head and purrs, <i>“Interesting. What’ve you got in mind then, angel?”</i>");
	processTime(1);
	kiroMenu();
}

//Yes
public function yesKiroIDoWantPubbieFJ():void
{
	clearOutput();
	showKiro();
	output("<i>“");
	if(pc.isBimbo()) output("Sounds totally fun!");
	else if(pc.isNice()) output("It sounds wonderful. Go ahead.");
	else if(pc.isMischievous()) output("I say you’d better go ahead and start before I blow from the anticipation alone!");
	else output("Sounds fine by me. Just don’t make too much noise.");
	output("”</i>");
	if(pc.isCrotchGarbed()) output(" You open up your [pc.lowerGarments] as discretely as possible, fishing out your [pc.biggestCock] for service.");
	output("\n\nKiro leans back and laughs, calling to the barkeep, <i>“Can I get a quivering quasar? My friend here said " + pc.mf("he","she") + "‘d pay.”</i>");
	output("\n\nYou open your mouth to protest, but Kiro’s toes flutter beneath your [pc.cockHeadBiggest], caressing the already rigid surface, leaving you with the choice of closing your mouth or moaning to the approaching bartender. You wisely choose to shut your mouth.");
	output("\n\n<i>“Thanks,”</i> your furry footpal effortlessly pronounces while angling her thigh to slide her padded toes along either side of your excited length. <i>“Put it on my friend’s tab.”</i>");
	//POOR
	if(pc.credits < 100)
	{
		output("\n\nGrimly clamping your mouth closed, you hold up your Codex’s account management screen. The balance is so small you might as well use a magnifying glass to read it.");
		output("\n\nKiro giggles. <i>“Oh, my mistake. I’ll cover it when I leave. You know how it is when you meet a beautiful girl and all knowledge of your dire financial straits flies out your ears.”</i> She glowers your way, but her foot keeps sliding, back and forth... back and forth.");
		output("\n\nYou try your best not to look happy about the situation when the bartender looks your way. A disinterested shrug later and the two of you are more or less alone once more.");
		output("\n\n<i>“You should do something about that,”</i> Kiro drawls, ");
		if(pc.balls > 0) output("resting your [pc.sack] atop other foot, playfully wiggling her toes against your [pc.balls].");
		else output("bringing her other foot to press on your [pc.sheathBiggest], gingerly squeezing the supply flesh there.");
		output(" <i>“Talented [pc.guy] like you could probably hijack a small freighter, maybe even embezzle some funds from your uncle’s corporation.”</i> A warm sole presses against the meatiest part of your tool while a mischievous smile spread across Kiro’s lips. <i>“Or you could take this delicious");
		if(pc.biggestCockLength() < 10) output(" little");
		output(" sausage and go into whoring. Billionaire play[pc.boy] throws away inheritance to spend [pc.hisHer] nights fucking. Has a certain ring to it, doesn’t it?”</i>");
	}
	//HAVE MONIES
	else
	{
		output("\n\nGrimly clamping your mouth closed, you pull up the credit transfer app on your Codex and pay for the drink. It’s a pittance to pay for something as nice as this anyway.");
		output("\n\nKiro giggles, <i>“What a gentle" + pc.mf("man","lady") + ". Such genteel manners on this one!”</i> Her foot flows back and forth like the lapping of gentle waves, squirming against your hot flesh.");
		output("\n\nYou do your best to wear a mask of calm and sophistication, but your gut isn’t buying it. By the looks of it, neither is the bartender. A disbelieving smile later and the two of you are more or less along once more.");
		output("\n\n<i>“You really shouldn’t let pirates trick you into paying for their drinks. It’s a terrible habit to get into,”</i> Kiro drawls, ");
		if(pc.balls > 0) output("resting your [pc.sack] atop her other foot, playfully wiggling her toes against your [pc.balls].");
		else output("bringing her other foot to press on your [pc.sheathBiggest], gingerly squeezing the supply flesh there.");
		output(" <i>“A cute [pc.guy] like you could wind up broke and destitute, forced to turn tricks for horny kui-tan just to feed [pc.hisHer] footjob addiction! Billionaire play[pc.boy] throws away inheritance to spend [pc.hisHer] nights fucking. Has a certain ring to it, doesn’t it?”</i>");
	}
	output("\n\nYou drum your fingers impatiently on the countertop and try not to moan at the licentious situation she describes. It’s so wrong, and yet... and yet it’s making your [pc.cockBiggest] twitch beneath her feets gentle attention. You’re already flushed and starting to sweat. You first notice it by the way the fluid lubricates her stroking toes and fuzzy arches.");
	output("\n\n<i>“Think you could do it, slut?”</i> Kiro whispers in between sips on her glowing drink. <i>“Think you could, oh... I don’t know, fuck a big, hard kui-tan cock for a few credits. Or maybe you’d be more into butt stuff. Either way, I bet you could.”</i> The lawless raccoon-girl stops teasing you with her toes and presses her whole foot against your [pc.cockBiggest], pinning it to your [pc.belly]. A single droplet of pre-cum spills from the top, squeezed out by her all-too firm attentions. <i>“Could you see yourself doing that, [pc.name]? Could you see yourself answering a call from Kiro to come fuck, for fun and credits?”</i>");
	output("\n\nYou moan in the affirmative, only half-paying attention to the filth she’s spewing at your ears.");
	output("\n\nKiro’s chocolate eyes twinkle excitedly. <i>“I thought so. Such a ");
	if(pc.tallness >= 80) output("big, ");
	output("filthy ");
	if(pc.tallness < 60) output("little ");
	output("footjob " + pc.mf("gigolo","whore") + ".”</i> Spreading her toes to either side of your bulging urethra, she slides her sole along your whole length, lubricated by your lusty drippings and sweat. Her soft-padded heel presses in at your base from time to time, but during the upstrokes it wiggles back and forth, amplifying the exquisite foot-friction with another layer of textured pleasure.");
	output("\n\n<i>“W-what?”</i> you stammer, leaning heavily on the bar for support.");
	output("\n\nWinking, Kiro twirls her finger at the bartender and calls, <i>“A tallavarian tingler for my friend. I’ll pay.”</i>");
	output("\n\nYou’re barely conscious of the exchange, your mind wholly occupied by the salaciously stroking feel of her foot on your [pc.cockBiggest] and the disturbingly erotic imagery she’s filled your mind with. As soon as the bartender leaves, you scooch your [pc.hips] closer to Kiro to increase the pressure on yourself and give up a quiet moan of satisfaction.");
	if(pc.balls > 0) 
	{
		output(" Your [pc.balls] ");
		if(pc.balls == 1) output("feels");
		else output("feel");
		output(" so heavy on her other foot, and she never lets you forget it, juggling the sperm-filled orb");
		if(pc.balls > 1) output("s");
		output(" until ");
		if(pc.balls == 1) output("it feels");
		else output("they feel");
		output(" ready to release ");
		if(pc.balls == 1) output("its");
		else output("their");
		output(" sloshing cargo.");
	}
	else output(" The backed-up pressure inside of you seems to redouble against the lower foot’s probing toes, like the gentle massaging is pressing on a recessed storage tank that’s been left to overflow.");
	output("\n\nCondensation-coated glass is pressed into your hand. An orange drink glows from within, its surface roiling and spitting as if heavily carbonated or part angry viper. There’s not a lot of it, barely more than a single shot really, and Kiro is looking at you expectantly, batting her eyelashes in your direction when you pause to consider.");
	output("\n\nYou knock it back a second after her foot stops stroking, delighted at the swift return of pleasure once the glass clinks back down. It’s getting quite sloppy down there now, a seriously moist swamp of toe and cock sweat overlaid with a thin veneer of leaking excitement. She’s able to stroke you almost as easily as if she had upended a bottle of lubricant over the whole mess.");
	output("\n\nLicking your lips, you ask, <i>“Why?”</i>");
	output("\n\nKiro kisses you, tasting the residue of otherworldly fruits upon your [pc.lips]. You could almost pop your load right now, but somehow, it’s not quite enough to send you off. It doesn’t help that her strokes are slowly, becoming less forceful, more like a dancer pirouetting atop your misfiring nerves than a firm milking. Breaking away, the package-packing tanuki shifts her own increasingly rigid meat to the side and looks meaningfully at you.");
	output("\n\n<i>“Why? Because it’s a tallavarian tingler! Those things cost a few hundred creds, but they make your skin tingle like crazy. Annnnd, I thought it only fitting that I give my foot-fetishizing whore a proper payment for indulging me so.”</i> Kiro watches you expectantly.");
	output("\n\nLicking your lips once more while gathering your thoughts, you’re stunned by just how pleasant it feels. She’s right, you’re already starting to feel a little tingle, a little sensitive, like your body has little vibrators making their appearance wherever something is touching you. You manage to gasp, <i>“Not a whore.”</i>");
	output("\n\nKiro’s foot slows its attentions further, just fast enough to maintain your overly aroused state but slow enough that it’ll take forever to go off, even with the tingler’s effects beginning to show themselves in the flesh of your backed-up loins. She bats her eyelashes and leans in close, whispering into your ear, <i>“So you didn’t come in here, get propositioned for a footjob and drink, bare your cock where the whole bar could see, and ");
	if(pc.credits < 100) output("take payment in the form of two drinks");
	else output("take payment in the form of an exquisite, expensive beverage");
	output("?”</i>");
	output("\n\nClawed fingertips adjust the neckline of Kiro’s dress to reveal the edge of a glossy black nipple, adding another layer of distraction to your ardor-addled mind.");
	output("\n\n<i>“No,”</i> you protest");
	if(pc.isBimbo()) output(", not even knowing why. Whores have like, the best jobs. She’s just wrong is all!");
	else output(".");
	output(" <i>“Wouldn’t a whore");
	if(pc.isBimbo()) output(", like,");
	output(" be the one giving the footjob?”</i> You have to bite your lip to suppress the tingly excitement that talking conjures up in your palate.");
	output("\n\nShaking her head");
	if(pc.balls > 0) output(" and affectionately toe-squeezing your [pc.balls]");
	output(", Kiro sips at her own drink and tries to ignore the wet patch her cock is making in her dress. <i>“No dear, a whore does whatever her client wants, because [pc.heShe]’s a <i>whore</i>, and this client wants to watch someone else struggle with their ");
	if(pc.balls > 1) output("overloaded balls");
	else output("cummy overload");
	output(" for once. Hence, I’ve paid you in drink");
	if(pc.credits < 100) output("s");
	output(" for the pleasure of your very, very turgid company.”</i>");

	output("\n\nYou flush hotter at the realization and gently wobble on your stool. She’s right, and this drink is hitting you a little harder than you thought it would. It can’t all be alcohol; straight-up moonshine wouldn’t have you this buzzed this fast. Whatever it is, it packs a wallop. Sparks of tingling pleasure seem to be collecting in your [pc.cockBiggest] wherever her foot touches you, buzzing like the universe’s tiniest, best-designed vibrators. Your head lolls back, accepting it all, and Kiro’s foot resumes properly stroking you.");
	output("\n\n<i>“Don’t sweat it too much, angel. I’m just helping you play the whore because I think it’ll make you spurt that much harder. You caught me in a good mood with a full purse... and your own full");
	if(pc.balls <= 1) output(" dick");
	else output(" balls");
	output(", of course.”</i> Her tail wraps around your back, cradling you to keep you in your seat. Every fiber of your being wants you to lean back against it and violently thrust yourself between her toes over and over. <i>“But don’t forget that you’re still my whore, and you’re going to do whatever the client wants, right?”</i>");
	output("\n\nYou dreamily nod. Her tail feels good against you, so soft and padded. Why haven’t you laid on it before? You nuzzle your cheek against it. A few people are looking in your direction, discretely looking under the shaded counter to watch you get jacked off. More pre bubbles up, tinged white by the eager seed below. What else could she make you do? You doubt you’ll be up for anything but cumming on command. The desirous ache inside you redoubles as if summoned by your wandering thought.");
	output("\n\nKiro lets out a pleasured groan of her own, and you realize that one of her hands is gently caressing a cylindrical bulge beneath the straining fabric of her dress. <i>“Yeah, you make a pretty decent whore, all right.”</i> She presses down hard, wrapping her toes around either side of your [pc.cockBiggest] just below the [pc.cockHeadBiggest]. The soft, leathery texture of her padded paws combines with the constant tingling buzz to bathe your penis in more sensation than it has any business handling.");
	if(pc.balls > 0) output(" Your [pc.sack] twitches against her other foot, contracting meaningfully.");
	output("\n\nYour client’s gleaming eyes fixate on the pulsating bar of flesh that’s threatening to burst free from her confining toes. <i>“Now,”</i> Kiro says, pacing her words deliberately slowly, timed to the slithering caresses of her feet, <i>“be a dear and cum.”</i> Her tail flexes against your back to hold you in place as your pleasure instinctively mounts. <i>“And don’t you stop until you’ve given the underside of the bar a good painting.”</i>");
	output("\n\nTwitching powerfully, your " + possessive(pc.cockDescript(pc.biggestCockIndex())) + " pleasure suddenly redoubles. You can feel your cum setting off tingles inside you as it pumps through your phallus-powering plumbing, culminating in a wave of heavenly vibrations that accompany the first blissful blast of [pc.cum]. Internal muscles automatically clench, propelling the first rope exactly where Kiro predicted - against the underside of the bar. The sound of the splattering impact seems so loud to your ears that you can’t believe everyone isn’t staring your way.");
	if(pc.exhibitionism() >= 66) output(" You add a wanton moan, hoping to grow your audience in time for the explosive climax.");
	output("\n\nKiro’s toes aim your [pc.cumColor]-squirting cock around, drawing webs of wasted sperm into intricate patterns that none but you will ever be aware of. The location of the first blast is already beginning to coalesce into fat droplets, hanging down just above the kui-tan’s wriggling feet. You fire with ");
	if(pc.balls > 0) output("ball-draining");
	else output("prostate-draining");
	output(" force, splattering the second shot against your target hard enough to dislodge some of the hanging [pc.cum] and shower Kiro’s feet with it. Her toes visibly glisten in the place’s neon light as she continue to milk you, wringing less forceful but still voluminous blasts from your body.");
	//Low cum amount
	if(pc.cumQ() < 50) output("\n\nYour orgasm coats her toes in a solid layer, weaving [pc.cumVisc] lace up to her ankles. The excess drips down around them to the floor, collecting in small puddles, the only evidence of your indiscretions.");
	//Med cum amount
	else if(pc.cumQ() < 500) output("\n\nYour orgasm coats her feet from toe to heel in a solid layer, to say nothing of the battlefield that her shins have become, spattered with [pc.cumVisc] droplets that slowly dry on her fur. Thick puddles on the floor are slowly rolling toward the drain, the byproduct of your near-fountainous gushing. In a few moments, the only evidence of your whorish misdeeds will be the musky scent of your passion.");
	//High cum
	else output("\n\nThere’s no hiding the fruits of your orgasm, the way your gushing discharge gives Kiro thigh-high boots of molten [pc.cumNoun]. Even when your passion was winding down, you were still bathing her toes in a river of your milked-out sperm. The floor got it the worst. A drunken groom’s bachelor party could do the damage your single, Kiro-boosted climax did. The drains are choking and burbling on your thick [pc.cumNoun]-flood, and you dare not climb down without soaking your [pc.feet]. You’d have to make quite a leap to get free of the [pc.cumColor] lake.");
	if(pc.cumQ() >= 5000) output("\n\nBest of all, Kiro is still squeezing your [pc.cockBiggest], still wringing blobs of [pc.cum] out of the [pc.cockHeadBiggest] to roll over her playfully wiggling toes. She keeps milking you for what feels like an hour, extending your orgasm past the point where you feel you should’ve gone dry. You let her too, giving her her money’s worth.");
	//Merge
	output("\n\nBreathing heavily, you look around, meeting the eyes of a half-dozen blushing patrons before hanging your head to hide your shame");
	if(pc.exhibitionism() >= 66) output(" and just how horny it’s making you");
	output(". Kiro grabs your jaw and kisses you viciously before pulling away. The wet stain on the side of her dress has grown larger, but the fabric-bulging length beneath has begun to recede. Kiro seems firmly in control of herself, for now. Of course, her balls are visibly heavier as well.");
	output("\n\n<i>“Ahhh, that was fun, angel. You should load up like that more often so I can make you nut in public again.”</i>");
	output("\n\nYou wobble, slightly more sober after the extended climax but still feeling tingly and a little unbalanced.");
	output("\n\nKiro’s palm pats your [pc.butt] as she gets up to leave. She’s proudly wearing your [pc.cum] as footwear, daring someone to comment on it with an imperious gaze. <i>“I’ve got to tend to some things. I might be right back, I might not, but you’d better go get your fortune... unless you want to spend your days being my whore.”</i>");
	//Set alcohol to buzzed, add status affect that increases lust gain over time and makes you vulnerable to teases. <i>“Tallavarian Tingler”</i>
	pc.imbibeAlcohol(50);
	kiro.ballSizeRaw += 10;
	//Pass forty minutes or an hour if huge orgasm.
	//ORGASM! Complete balldrain if huge orgasm.
	if(pc.cumQ() < 5000) 
	{
		processTime(40);
		pc.orgasm();
	}
	else 
	{
		processTime(60);
		pc.orgasm();
		pc.orgasm();
		pc.ballFullness = 0;
	}
	pc.createStatusEffect("Tallavarian Tingler",0,5,0,0,false,"LustUp","This top-shelf alcohol generates troublesome tingles on contact, making it easy for your foes to arouse you.",false,280);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Balljob
public function balljobFromKiro():void
{
	clearOutput();
	showKiro(true);
	output("With a glance down at her sordidly swollen nutsuck, a lascivious idea rises up to the forefront of your mind right along with your swelling erection");
	if(pc.cockTotal() > 1) output("s");
	output(". You posit, <i>“That sack must make for an excellent nutjob.”</i>");

	//First time
	if(flags["KIRO_BALLJOBBED_YOU"] == undefined)
	{
		output("\n\n<i>“A what?”</i> Kiro asks with a confused tilt of her head.");
		output("\n\nYou explain to her that you’d like her to use her balls like some women use their breasts, wrapping them around your [pc.cockBiggest] to surround it in squishy softness. The cream her horse-cock seems to perpetually dribble when aroused would make lovely lube as well.");
		output("\n\nOne of Kiro’s eyebrows rises upward as she considers your offer. <i>“Let me get this straight. You want me to drip pre all over my balls and then jack you off with them?”</i>");
		output("\n\nAn eager grin splits your [pc.face], and you follow it with a slow, sure nod.");
		output("\n\nThe kui-tan woman’s brow levels, and her mouth quirks into a lewd little smile until she speaks, <i>“Angel... you have the best ideas. How’d you know that I love slathering love-juice all over my balls? Cum... pre... girlcum.... It’s all good!”</i> To show you just how much she enjoys it, Kiro gathers the growing wad of liquid lust over her hand and smears it down the middle of her sack, right between her [kiro.balls]. She shudders from head to toe in rampant pleasure, her cock pulsating, growing with need, letting a thick dollop of extra juice crest out of her cumslit. She points meaningfully towards her bed. <i>“Get in, if you still want it.”</i>");
	}
	//Repeats!
	else
	{
		output("\n\n<i>“Another one?”</i> she asks, cocking her head to the side. Her curly beige hair dangles around her face as her mouth gradually widens into a knowing smile. <i>“You like my balls that much, Angel? You like them so much that you’re already begging me to spill your spunk on them again?”</i> Kiro idly licks her upper lip as she waits for a response, her equine pillar of fuck already pulsing needfully, expressing a huge dollop of precum that she immediately gathers into her palm. <i>“Not that I mind,”</i> she muses, rubbing her moisture into the crevice between her titanic nuts. <i>“I love getting my balls bathed.”</i>");
		output("\n\nKiro points back to the bed. <i>“Get in it while I’m feeling magnanimous,”</i> She leers down at you, <i>“Before I change my mind and turn you into a cream-filled fucktoy.”</i> Judging by the look in her eye, you know she would too.");
	}
	//MERGE
	output("\n\nYou crawl and flop back into the soft comfort of her bed. Despite its less than impeccable appearance, the mattresses are as soft and cushy as venetian silk. Sinking down into the supple softness, you shiver in anticipation, [pc.eachCock] bouncing against your [pc.belly], swelling up from the sensation of slapping against your [pc.skinFurScales]. Kiro’s musky scent is thick down here in her bed, a pheromone-laced soup that makes your head swim and your body ache. You look up at Kiro, desperation clear in your eyes, and lift your hips, raising your [pc.cocks] up like an offering to a sexual goddess.");
	output("\n\n<i>“Such an eager " + pc.mfn("boy","girl","slut") + ",”</i> Kiro drawls while climbing in after you, straddling your legs, the weight of her balls pinning you to the sheets. Grabbing hold of her equine phallus, she presses it against her own chest, right between her tits, and she starts stroking the exposed, veiny underside, pawing herself off right there. Ribbons of her pre-spunk pour out of the distended tip, already flaring out a good bit wider than the girthy shaft, glossing the dark red-colored tool with free-flowing sex-juice that’s winding its way down toward her soft, wobbly nutsack. Kiro’s tail thwacks excitedly against the bed frame’s panel as she gets into it, one hand down at her sack now, spreading the sexual sludge across the growing, rounded mass of her super-sized testes.");
	output("\n\nYou start touching yourself while you wait, a hand closing around [pc.oneCock] to try and tame your growing but untapped excitement, squeezing the tender flesh to try and match the bliss that Kiro must be experiencing right now.");
	output("\n\n<i>“No,”</i> comes the command, curt and forceful, matched by a wet slap that interrupts your fapping and leaves your hand smelling faintly of Kiro’s cock. <i>“Just wait a moment,”</i> Kiro promises, <i>“I’ll make you cream all over my balls in a minute. Let me finish getting ready first - I want to know that when you spunk it’s entirely because of how much you love my sack.”</i>");
	output("\n\nThe pent-up tanuki strokes herself until the pre-cum is bubbling and frothing around her hands, pooling on the sheets between your [pc.legs] as it runs over her huge balls in rivers. Kiro’s other hand is spreading it across her fur-covered orbs, soaking them completely, readying them for the dick-embracing job they’re about to do. You arch your back encouragingly in an attempt to hurry her, but she shakes her head while polishing her sperm-filled reservoirs with their own excess.");
	output("\n\n<i>“Not yet, but almost.”</i> Kiro sighs, and her cock twitches, launching a glob of of milky-white juice in a parabolic arc. Watching the spherical blob fall, you plot its destination just in time to brace your crotch, lifting your [pc.cocks] up into its path. Spunk splatters over [pc.eachCock], wreathing them in warm, over-eager ejaculate. It feels so warm and wet and so unbelievably lewd all at the same time. Pulsating hotly, your [pc.cocks] leak");
	if(pc.cockTotal() == 1) output("s");
	output(" a little of ");
	if(pc.cockTotal() == 1) output("its");
	else output("their");
	output(" own, but the amount is little more than a drop in Kiro’s bucket.");

	output("\n\n<i>“I hope you’re ready,”</i> the cinnamon-colored hermaphrodite coos, sidling up closer to your kui-tan-polished crotch. <i>“We’re both going to need a shower after this.”</i> She touches a moist, softly padded fingertip to her chin in thought before commenting, <i>“Then again, when don’t we?”</i> She smiles, a gossamer strand hanging from where she touched herself. <i>“You’re going to cum for my balls, aren’t you?”</i>");
	output("\n\nNodding enthusiastically, you watch her shift the slippery bulk of her sack towards you.");
	output("\n\nKiro coos, <i>“Atta " + pc.mf("boy","girl") + ",”</i> before rolling the weighty masses up on other side of your [pc.cocks], pinning ");
	if(pc.cockTotal() == 1) output("it");
	else output("them");
	output(" in between the fully-packed testes. The soft fur that covers her pouch is utterly soaked, drenched in pre-spooge that turns it into a super-soft, velvet-soft cock-sheath. Their softness is actually quite surprisingly - her balls feel like full, heavy pillows, and they compress down quite noticeably under their own weight. This doesn’t seem to pain Kiro in the slightest; if anything, she seems to be getting off on feeling your [pc.cocks] against her sloshing sperm-reservoirs.");
	output("\n\nYou are smothered in hot, pillowy ball-flesh, sliding slickly through the cum-creating crevasse on your way toward the peak of pleasure. The heartbeat pounding through your compressing pleasure sleeve causes it to squeeze down on you in the most perfect way. With balls like this, you have to wonder why Kiro would ever waste her time trying to titfuck anyone. She’s got the perfect dick-pleasers right underneath her own.");
	output("\n\nGrabbing hold of [pc.oneCock] and yanking it upward, folding the skin of her sack deeper between her nuts, Kiro nestles you completely into the scintillatingly erotic embrace of her plush balls. ");
	if(pc.cockTotal() == 2) output("She guides your [pc.cockSmallest] in after, bringing it up alongside its other brother, the two pulsating penises rubbing against one another and the cushy-soft sack-skin.");
	else output("She guides each of your remaining [pc.cocks] in after, one at a time, bringing them up to nestle against their lucky siblings, pushing against one another and the cushy skin of Kiro’s sack.");
	output(" She lets her own dick go and grabs hold of her nuts in both hands, fingers sinking so deep into the sopping fur that they vanish into the malleable mass. She kneads herself with gentle pushes, shifting her balls so that they slip and slide back and forth along your length, squelching noisily, so heavy that they make her bed frame creek.");
	output("\n\nKiro moans, tumbling her nuts with faster pushes, her cock untouched and yet spilling forth a great torrent of liquid, soaking itself with a river of off-white enjoyment. She glances towards you, seeing your own face as rapturously pleased as hers was during that moan, and she lets go of herself long enough to extend a finger to your open, moaning mouth, painting your lips with a whorish coat of her juices before slipping a finger inside. You eagerly suckle her digit while lurching your hips against the confining spheres. Slurping lewdly, those ever-filling cumsacks match the sounds your mouth is making until the room seems full of lascivious suckling and nothing else.");
	output("\n\n<i>“You like that, don’t ya?”</i> Kiro asks, backing her question by pulling her finger free and pushing down on herself from both sides, increasing the pressure of the spunky vice surrounding you. She holds it there, tight against you but immobile. The only stimulation you’re getting is the slight bit of motion your paired heartbeats are causing and the gentle, constant thrum of jizz production. <i>“Well?”</i>");
	output("\n\nYou gasp, <i>“Yes, Kiro, I like it!”</i> and thrust, so anxious for friction that you lurch your [pc.hips] against her even while she’s trying to cut down on your stimulation.");
	output("\n\n<i>“Good,”</i> she praises, not upset by your petty rebellion in the slightest. <i>“Tell me how much you like this, and keep stroking you...”</i> She bites her lip as you continue to thrust, stifling a moan. <i>“...but you better not stop that either.... Ooooh....”</i> Kiro whimpers, cockhead flaring wildly, pulsating back and forth between its full size and normal size as it leaks out liters of pre, and all that cock-juice streams down over her balls and your suspended shaft");
	if(pc.cockTotal() > 1) output("s");
	output(".");

	output("\n\nYou groan, telling her just how much you love the feel of her silky-soft balls snuggled tight around your [pc.cocks], how much you enjoy being pinned in her bed underneath her productive sack, how much you can’t wait to paint her with your [pc.cumColor] load. Slowly, but with increasing rapidity, Kiro resumes stroking you, each slip of her squishy sperm-balls along your length faster than the last. You groan and grab big fistfuls of her blankets, arching your back and crying out, a paroxysm of pleasure temporarily paralyzes you, interrupting your thrusting rhythm. Gasping, you launch back into motion, slapping your crotch into the heavy orbs, humping them enthusiastically as the they slide and slosh back.... Until they stop. They’ve pulled back high enough that you’re struggling to get buried back inside that velvet enclosure.");
	output("\n\n<i>“Nuh uh,”</i> Kiro breathily pants, <i>“Keep talking, or I’ll stop and fuck your ass right now.”</i> At the words, ‘fuck your ass,’ her cock flares, and you know she means it.");
	output("\n\nYou start babbling about how much you love what she’s doing to you, how you love her weighty, pre-soaked orbs smothering you as you climb towards orgasm, and she pushes them back. Her cock-polishing ball-strokes resume once more, faster than before. There’s a jerkiness to them now, her hands shuddering with bliss from time to time, unable to maintain an even rhythm. Her copious, liquid ardor is flowing so freely that your [pc.belly] is soaked in it all the way up to ");
	if(pc.bRows() > 1) output("the lowest row of ");
	output("your [pc.chest], and a puddle of it is sticking in your [pc.butt]-crack. Through it all, you keep praising her efforts, verbally fellating your lusty mistress while she works her swollen cumsack over your tensed cock");
	if(pc.cockTotal() > 1) output("s");
	output(".");
	//Cocktail PG
	if(pc.hasCockTail()) output("\n\nUnable to hold back any longer, you arc [pc.oneTail] up and under the tanuki-girl’s bouncing testes, threading up towards your [pc.cocks]. Halfway there, it peels open to expose your [pc.cockTail], and you nearly cum on the spot. You keep it together, somehow, sliding that extra phallus back and forth, rubbing it against yourself and her, oozing fresh lubricants onto her and yourself in equal message. It’s a musky, lust-filled mess, and you wouldn’t want to be anywhere else right now. Hell, you doubt you could be anywhere else at this moment.");
	//Vagtail PG
	else if(pc.hasCuntTail()) output("\n\nUnable to hold back any longer, [pc.oneTail], acting entirely on its own, curls up and around Kiro’s hip, under her arm, to nuzzle up against her blunted tip. It rubs affectionately against it until the kui-tan shudders. Then your [pc.cuntTail] places itself puss-down against the bulging, leaky cumslit, capturing the oozing cock-juice as it stretches out, trying to wrap around the whole of her flaring tip and failing entirely. She rocks back and forth, bucking against an imaginary partner as your [pc.cuntTail] suckles her like a popsickle, capturing the juicy pre before it can get anywhere else. The sensation of that heat fluid filling you is exquisite, a combination of cool water on a hot day and getting flooded with cum while horny all at once.");
	//Merge
	output("\n\nKiro pants, <i>“Ready to blow yet, cock-pet? Or do I need to squeeze these a little tighter.”</i> She presses down on both sides before you can answer, bloated sperm-sacks swelling and distorting so that they completely cover your hips, locking your [pc.cocks] in a vice of tight pleasure. You try to control yourself, but it feels so good that you cry out an affirmation, swearing to her that fucking her balls is absolutely heavenly, telling her just how close to cumming you’ve come. And you <i>are</i> a hair’s breadth from climaxing, so very close now. Your body is trembling in between thrusts, and you’re just about to release when she coos, <i>“Cum pet, let out a little orgasm for me. Wash my balls with it.”</i>");
	output("\n\nThat does it. Your rhythmic thrusts devolve into spastic pumps and lunges, shaking in wild, ecstatic convulsions. The pleased warmth of orgasmic release crests somewhere inside your middle and blossoms through you, spreading with the muscular contractions your body makes as pumps your [pc.cum] out. You don’t even see the first jet of your release. It’s sprayed directly between Kiro’s compressed balls, out of sight but certainly not out of mind. She sure feels it, judging by the way she whimpers as you shoot, shuddering and squeezing down in a way that makes her cockhead flare and her urethra dilate. Her eyelids lower so far that they nearly close, her mouth parted in complete rapture.");
	output("\n\nApple-sized bulges appear on Kiro’s orgasmically trembling phallus, stretching her sheath wide as they roll up and out along her pulsating urethra, climbing her cock like a ladder to burst out ");
	//Kiro cock capture!
	if(pc.hasCuntTail())
	{
		output("and into your waiting [pc.tailVagina]. The heady sexual deluge is wicked straight up into your [pc.tail], making it bulge a bit with the liquid weight contained within. Kiro throws her head back as her balls are basted in your seed, and her cock spurts again and again. Your [pc.tailVagina] rapidly fills with her white pleasure-cream, stuffed beyond its capacity, the snake-like shape ballooned with fresh jism until it can take no more. It pops off, spraying excess spunk wildly over Kiro’s tits, hips, and ass. Freed from its bondage, the tremendous, pulsating horse-cock above launches huge ropes over the both of you. The perverse, alabaster rain drenches your bodies and the bed as it goes on and on.");
	}
	//Kiro not cock captured!
	else output("\n\ninto the air. The heady deluge spurts out in huge ribbons of white, hanging precipitously before falling, one huge, sticky strand that splatters across you like a burst water balloon on impact. Alabaster love splats across your [pc.skinFurScales] just in time for the next spunksplosion to erupt from Mount Kiro. Wave after wave of her sticky jism erupts, some firing high enough to hit the ceiling, some falling across her bust, and still more pouring down over you, flooding the bedsheets with spent spooge. The tremendously large horse-cock seems to cum without end. It is a font of spermy goodness, a reliable fountain of jizz. It drenches you with so much cum that your eyes feel glued shut and the bed squishes with every twitch and movement of your orgasmically writhing frame.");
	//PC cum epilogue.
	//Small cumshots
	if(pc.cumQ() < 20) output("\n\nYour meager contribution to Kiro’s soaked nutsack is drowned by the spunk-tsunamis that washed over her balls, your [pc.cumColor] mixing into the kui-tan’s thick deposits. Honestly, by the time her orbs shrink down and release you, you can’t even spot a single drop of your ejaculate. Kiro’s is all-consuming, a biblical flood compared to your droplets.");
	//Mediumsmall cumshots
	else if(pc.cumQ() < 100) output("\n\nYour orgasm would shame most human men, but compared to Kiro’s it is still just a drop in the bucket, or more appropriately ocean. The [pc.cumColor] you shot in between her hefty orbs is nowhere to be seen by the time her balls shrink down to a more normal size, releasing your [pc.cocks]. All you can see are the tsunami-like waves of thick, kui-tan seed coating everything from Kiro’s head down to your toes.");
	//Medium cumshot
	else if(pc.cumQ() < 1000) output("\n\nThe whole time you’re cumming into that slick crevice, you’re aware of just how much more potent Kiro’s explosive release is than your own. Your jets of distilled lust are swamped in the waves of ivory goo, but you produce enough that you leave a distinct, [pc.cumColor] stain on the kui-tan’s receding nutsack as her balls shrink down to a more natural size. The mixed, dripping spooge falls from her in thick curtains, yours potent enough to cling on as a visible reminder of your own virility.");
	//Medium-large cumshot
	else if(pc.cumQ() < 2000) output("\n\nYour powerful cumshot, while noticeably less voluminous than your hermaphroditic partner’s, is still quite mighty; it’s powerful enough to rock her swollen jizz-factories back, making them wobble even as they shrink and spurt forth their stored lusts to rain down upon you. Her heavy orbs are painted with your [pc.cumColor] love, wreathed in it so thoroughly that when her tsunami of jism rolls over them your own deposits remain powerfully identifiable and distinct. Some of it does mix together, and the aroma of two powerful, combined orgasms saturates the air of this room in spite of the ship’s potent air scrubbers.");
	//Large cumshot
	else if(pc.cumQ() < 3500) output("\n\nYour orgasm is so powerful and wonderful that it makes Kiro’s sloshing cumsacks wobble and rock with each mighty ejaculation, the [pc.cum] dripping down over your [pc.legs] and in the rapidly-moistening mattress. Together, you turn the pent-up herm’s bed into a sopping wet spunk-sponge and wallow in it, writhing together in absolute contentment and wonderful enjoyment, needlessly releasing so much baby-making love-juice that it’s dripping down the sides of the bed and onto Kiro’s already-splatted smut-books. Kiro’s ivory spunk mixes with your [pc.cumColor] juices as you both wind down. Her balls shrink and withdraw, painted with just slightly more of her virility than yours.");
	//Kiro-sized orgasm
	else if(pc.cumQ() < 7000) output("\n\nYour mighty ejaculations are so powerful that they match Kiro’s jet for jet, the immense spunk-torrents exploding out against her shuddering, shrinking sack, making her balls bounce and roll around each time you launch a powerful spear of [pc.cumColor] into the valley between them. She doesn’t seem to mind and watches with fascination as you flood the bed beneath you both, releasing so much over her weighty orbs that the curtains of falling fuckslime stain the sheets, fill the mattress, and run over the sides towards the floor. There seems no end to the cum you both produce, and you shoot until Kiro’s balls shrink and you go dry, producing similarly sized messes that glaze both of you in intermingled, distilled love.");
	//Beat Kiro’s cumshot - room flooder XL
	else 
	{
		output("\n\nYour explosively powerfully shots are so supremely virile and so potent that the sprays actually push Kiro’s trembling nutsack away from your [pc.cocks], pushing her further and further down the bed until she’s about to fall off. This frees you to shoot as you will, painting her nuts with a glossy sheen before arcing up to splatter her belly, tits, face, wall, and ceiling with goo, all before allowing your convulsing tool");
		if(pc.cockTotal() > 1) output("s");
		output(" to aim a little farther up to hit your [pc.face] and [pc.chest]. Kiro’s cum is everywhere, but so is yours. And there’s more of yours. ");
		if(pc.cumQ() >= 15000) output("Much more. ");
		output("Your [pc.cum] mixes with the gifted herm’s until the resulting spermy soup looks far more like a product of yours than anything to come out of her cock. Through it all, the mattresses soaked up their limit, and your combined release rolled out over the edge, covering Kiro’s piled-up porn with a [pc.cumColor] frosting before rising with the inevitability of a sexual tide. The nudie-mags are drowned in cum that reaches ");
		if(pc.cumQ() < 20000) output("a foot");
		else if(pc.cumQ() < 25000) output("several feet");
		else output("all the way");
		output(" up the bed.");
	}
	//Merge
	output("\n\nSpent, Kiro tumbles down into bed next to you, heedless of the hot, wet mess you’ve both turned into. She rubs noses with you and pulls back, giggling when a strand of collected cum dangles between you. Then, she kisses you square on the lips, long and slow. Her tongue burrows into your mouth to probe and kiss you without worry of sampling her own flavor. If anything, she seems to enjoy the taste of herself on your lips. She stops long enough to giggle, <i>“I suppose we had better get a shower, huh, angel?”</i>");
	output("\n\nYou nod, still blinking her liquid love from your eyes, and together, the two of you make your way out to clean yourselves up. She lets you go after with a nervous smile and an apology for getting so out of hand, promising she’ll try not to get so pent up and out of control if she can help it.");
	output("\n\nYou smile smugly. Knowing her, she’ll do this every chance she gets. Then again, she’s the one left to clean up the bedroom.");
	processTime(45);
	pc.orgasm();
	pc.shower();
	kiro.orgasm();
	clearMenu();
	flags["KIRO_BALLJOBBED_YOU"] = 1;
	addButton(0,"Next",mainGameMenu);
}

//Body-Bloating, Butt-Obliterating Bowel Basting
//Omnigender
public function bodyBloatingButtObliteratingBowelBasting():void
{
	clearOutput();
	showKiro(true);
	output("You turn around to face away from Kiro, your hands dipping down to your [pc.butt], each one grabbing a cheek and drawing apart, exposing your puckered rosebud to the pent-up herm. Kiro bites her lip in consternation, idly stroking her cock as she takes in the delectable view before her. Seeing such a nice, juicy ass on display has Kiro’s equine monster-cock pulsating in visible excitement. The head blossoms from a flat, blunted tip into a protruding, eager flare while it beads slick, increasingly off-white lubricants from the spreading cumvein just below its center.");
	var lubed:Boolean = false;
	//Butthole 2 small 4 Kiro
	if(kiro.cockVolume(0) > pc.analCapacity())
	{
		output("\n\n<i>“Nice as that is, angel, I’m not into ripping folks in half. Let me get some lube,”</i> the kui-tan offers, dipping down to grab a bottle of ‘Peggy’s Elasticizing Oil.’ <i>“This’ll do the trick.”</i>");
		output("\n\nCool slipperiness is spread across your [pc.skinFurScales] on one side, then the other. You look over your shoulder to see, catching a glance of two shining orbs and a handful of glossy material pressing against your [pc.asshole]. The cool temperature makes your ring contract on its own, but Kiro is persistent, rubbing the slickness against your hole until it warms. First, a finger slips inside, almost frictionless as it enters you. Then, another, and another... and another. You feel knuckles squeezing past your once-tight entrance, each one catching for a moment of delicious stretching before popping in. Your once-tight anus is blossoming into an elastic, stretchy asshole in preparation of the reaming to come, and you’re thankful for it.");
		output("\n\nYour [pc.asshole] seals around Kiro’s wrist, squeezing on it, goading her to go deeper, but she gently pulls out, her fist exiting with an audible ‘pop.’ It hangs open for a moment, long enough for Kiro to pour in an immense dollop of the stuff right into your exposed rectum. The chill makes you groan and contract, sealing it inside, pulling it up through your gut - right where Kiro wants it. She rubs your slick button, and says, <i>“Mmmm, now you’re ready...”</i>");
		lubed = true;
	}
	//Can handle it.
	else if(kiro.cockVolume(0) > pc.analCapacity() * .6)
	{
		output("\n\n<i>“Oh, angel, this is a nice little ring you’ve got here,”</i> Kiro says admiringly as she lets her hands play across your ass. One of them disappears behind her, coming back up with a bottle full of oil, and she upends it over your backside, drenching your bottom with the slippery stuff. She gathers up the dripping moisture and rubs it all over your [pc.skinFurScales]. Sometimes the herm is squeezing and kneading as she works. Other times she’s just intent on spreading it around, being sure to get plenty in your [pc.asshole] as she works. Your [pc.butt] is so well coated that its reflective gloss is almost hypnotizing to behold. Kiro pants, <i>“You’re going to be such a tight little cocksleeve for me.”</i> She squeezes one cheek hungrily, fingers sinking into your excited flesh. <i>“Mmmm, you are soo ready....”</i>");
	}
	//Can easily handle it.
	else 
	{
		output("\n\n<i>“Oh, angel, have you been training your ass just for me?”</i> Kiro marvels as she beholds your elastic, happily clenching pucker. <i>“Do you go around with a huge plug in there just so that when you walk into my bar you’ll be able to take me, or are you just that much of a helplessly cock-addicted butt-slut?”</i> Kiro almost purrs in delight. <i>“Don’t answer, hero. I like thinking about just how hard you work this little hole for my benefit.”</i>");
		output("\n\nShe upends a bottle of something cool and wet across your [pc.butt], fingering your [pc.asshole] at the same time in order to push some of that juicy oil inside. You whimper and push back, letting her paint your rear with a glossy, slick finish. You get so into the butt-massage that it actually startles you when she stops and pulls back to admire her handiwork. The whole of your backside is drenched with low-friction moisture, and the inside of you is well-lubricated as well, not that she needs it with how capacitative your backdoor has become.");
	}
	//Merge
	output("\n\nKiro mounts your [pc.butt], cock slipping and sliding through the lubricated valley of your anal cleavage. The ring of prepuce around the middle tickles at your [pc.asshole] when it slides past, followed in short order by the soft wrinkles of her supple sheath, bunching up behind you as she thrusts. She gasps in feral pleasure and growls in the back of her throat. ");
	if(silly) output("“<i>Now this is pod-racing!”</i> ");
	output("Back and forth, that slab of drooling cockmeat drags over your well-prepared entrance, teasing it with unsubtle grinds. The flare sometimes catches on your the wrinkled darkness of your entrance, a tiny bit of the lip of her expansive horse-cock widening you for just a second. Then, it drags on past, and you whimper; you wanted it inside.");
	output("\n\nKiro grabs your head and pulls you back so that she can whisper in your ear. <i>“You want this, don’t you slut? My dick inside you.... I’m going to fuck your ass so hard that you’re not going to be able to move without missing it - the fullness, the ache of my warm cum, soaking into you.”</i> Your [pc.asshole] clenches as you slide your [pc.butt] back, trying to get her to slip inside. <i>“Good " + pc.mf("boy","girl") + ".”</i>");
	output("\n\nYou aren’t kept waiting long. Kiro saws back through your cheeks, dragging her blunt-tipped prick into place, the engorged cock-tip oozing freely onto your eagerly spasming pucker. The aggressively dominant hermaphrodite’s swollen balls sway up against the back of your [pc.legs]. Each seems as big as a melon as it brushes by you, stretching the fuzzy sack so taut that it would shine were it not for the downy-soft fluff that coats it. You’ll have to ask her about how her skin is so elastic sometime, but right now, the more pressing concern is the rod pressing on your [pc.asshole].");
	output("\n\nKiro’s dusky, reddish fuck-pole vanishes into you like a wand from a magician’s act. Your body wasn’t meant to handle such an immense insertion by any means, but you’re taking it all the same. The kui-tan’s hands clamp down just above your hips, squeezing you as she pants a groan of utter satisfaction that’s perfectly mated to the speed at which her erection is sliding through your twitching anal star, her voice rising higher the closer she comes to bottoming out. You shiver and scream in pleasure as her medial ring pops through");
	if(pc.hasCock()) output(", scraping by your prostate");
	output(". She’s filling you up, completely and totally. That flaring tip is growing noticeably too, stretching outward to scrape along the sensitive nerve endings of your walls, rubbing every inch of your innards as they deform into an inverse mold of Kiro’s dick.");
	pc.buttChange(kiro.cockVolume(0));
	output("\n\nKiro ");
	if(pc.tailCount > 0) output("grabs [pc.oneTail] to");
	else output("flexes surprising strength to");
	output(" pull you further down her pole. <i>“Awww, yeaaahh.... This is what I needed, [pc.name]. This is what we were meant to do together.”</i> She forces your hips to wiggle back and forth, slipping three more inches of fat cock into your gut in the process. <i>“So warm and tight and slick...”</i> Kiro drawls, tongue hanging as she pauses to take a deep breath. <i>“Take it, angel. I should have known when we met that you’d always be there to save me whenever I needed an outlet for my cum.”</i> She grunts, exerting herself to thrust past the three quarter mark. ");
	if(pc.bellyRating() < 30) output("Her proud penis’ outstretched tip distends your [pc.belly] as it plows upwards, and you feel increasingly like Kiro’s organic condom.");
	else output("Her proud penis’ outstretched tip shifts your organs as it goes, but it isn’t visible through your expanded belly. You still feel like a tight wrapping around her rigid, equine tool - Kiro’s organic condom.");
	output("\n\nThe kui-tan’s balls slap firmly against you once more as she works her way towards bottoming out. You can feel blood or cum pulsing through those heavy orbs, making them pulse and swell against you, getting bigger, softer, and squishier as they inflate with seed. Colon-stretching length is plowed so deeply inside you that you feel your anal passage shift, but there’s no discomfort at all. ");
	if(!lubed) output("You’re immensely proud of how well your asshole can handle a good reaming, and you moan appreciatively at Kiro to show her how glad you are for her giant-sized phallus.");
	else output("The lubricants she pushed inside you must have something to do with that, and you moan appreciatively at your hung mistress to let her know how glad you are for her wonderful oil and immense, giant-sized phallus.");
	output("\n\nKiro moans, knees shaking so violently that you can feel the vibrations through her increasingly plush nuts, and thrusts powerfully, spearing the last few inches of her length into your [pc.asshole] at once. Her sheath compresses tightly against the seal your sphincter makes around her veiny rod. bunching up between your cheeks as your [pc.butt] presses on Kiro’s soft fuzz. The whole of her length bloats in response, gaining a good half-inch in thickness from one powerful beat of the herm-girl’s heart. Her body trembles, and she tries to thrust again with jackhammer-like force. She succeeds in rocking her length an extra quarter inch in before bouncing back, but that’s enough to make you both moan in inarticulate excitement.");
	output("\n\nRegaining her vocal capabilities first, the big-balled piratess growls, <i>“Yeah, take it, slut. Take it!”</i>");
	if(pc.hasHair() && pc.hairLength > 5) output(" She releases your [pc.hips] to grab up a fistful of [pc.hair], twisting it around to make you arch your spine as you’re plugged.");
	else output(" She releases your [pc.hips] to reach around for your [pc.chest], pinching a [pc.nipple] to help her guide you into arching your spine.");
	output(" The other hand playfully strokes the small of your back, caressing it as she feverishly bounces against your [pc.asshole], enjoying the tight bursts of ecstasy it sets off.");

	output("\n\nYou go from cradled and bouncing on Kiro’s cock to tumbling [pc.face]-first into a pile of stacked pillows. To be honest, the change in scenery and stance is far less jarring than the rapid exit Kiro’s slick boner makes as it drags out of you");
	if(pc.hasCock()) output(", bouncing off your prostate as it goes");
	output(", popping out of your temporarily but hugely gaped asshole.");
	output("\n\n<i>“Roll over,”</i> Kiro commands while stroking her cock. <i>“I want to see your face when I cum.”</i> Her flare actually shrinks a little, no longer so much thicker than the rest of her shaft. For all her boasting, Kiro’s hand doesn’t look to be anywhere near as pleasurable as your [pc.asshole]. You roll over as commanded and grab your asscheeks as you lift your [pc.butt], exposing the slowly-shrinking target to Kiro.");
	output("\n\n<i>“Go on then,”</i> you encourage, <i>“take it. Fill me up.”</i>");
	output("\n\nKiro climbs into bed after you, her huge balls slowly dragging up the bottom edge before rolling onto the soft mattress, her equally large dick pressing against your [pc.asshole] with an immediacy born of gallons of pent up seed. She bends down over you, [kiro.chest]");
	if(pc.hasFuckableNipples()) output(", her nipples sinking into yours, perfectly docked");
	else if(pc.biggestTitSize() >= 1) output("squishing against your own");
	else output("dragging over your [pc.chest]");
	output(", and kisses you square on the mouth. When she breaks it, her [kiro.cock] is perfectly positioned to enter you but still hanging outside, and she whispers, <i>“Thank you.”</i>");
	output("\n\nThe shocking tenderness wars with the shockingly fast thrust below, but Kiro’s bowel-stuffing plunge upward wins out by far, scattering your thoughts away in an avalanche of all-consuming anal enjoyment. You whimper, crying out in lust");
	if(pc.hasCock()) output(", [pc.eachCock] spouting what feels like rivers of liquid pleasure out onto your [pc.belly], the [pc.cumColor] stuff milked right out of you before you can even start to cum.");
	else if(pc.hasVagina()) 
	{
		output(", [eachVagina] twitching and squeezing, the motions so violent that Kiro can feel them through your walls.");
		if(pc.isSquirter()) output(" You gush [girlCum] all over your thighs, her middle, and her balls, and she doesn’t seem to mind in the slightest. You haven’t even cum yet, either!");
	}
	output(" Inside, you feel a river of white-hot juice flooding into your passages. It’s warm, wet, and sticky in all the right ways, and you’re sure Kiro hasn’t even cum yet; she’s still looking down at you with a knowing smile.");
	output("\n\nShe rolls her hips back and forth, setting an easy rhythm that leaves you gasping. Her cock is just sliding through your bowels, stretching, stroking, and addicting them to the feel of her mammoth horse-prick. You’re not sure you’ll ever be able to enjoy a small partner after this body-distending reaming. She’s just so... big! Kiro grabs your [pc.legs], lifting them up and redoubling her pace. She pounds your [pc.butt] like a jackhammer, slapping against it so forcefully that the sound of her crotch hitting your oiled-up asscheeks can be heard echoing down the halls of her ship. The bed is creaking with each hit, her balls are sloshing, and you’re utterly lost to lust, looking at Kiro with an expression that’s just begging her to release into you at last and give you the filling you deserve.");
	output("\n\nShuddering powerfully in between [pc.butt]-stretching impacts, Kiro struggles to control herself. <i>“I’m gonna cum soon enough, angel. You just lie there and keep making those faces. I love watching how your eyes half roll back when I-unghhh.... Uh, when I hit a good spot. Knowing I’m doing that to you, that’s the hottest thing. Fuck, it makes my dick hard.”</i> She pats your [pc.belly]. <i>“Can you feel how fucking hard you’re making me?”</i>");
	output("\n\nWhen you nod, feeling her flare expand so fast that’s practically exploding, Kiro plows home, stretching from just behind your pucker to somewhere nearly two feet inside your rectum, the incredible thickness of her flare scraping down the entire length before she erupts. You whimper, eyes rolling back, and Kiro cums. A wave of jism so voluminous that it makes your [pc.belly] noticeably expand pours straight into you. At the same time, Kiro’s balls shrink ever so slightly, their spunk-pudge diminishing slightly as they begin to vent. One pulse after another pushes into your vulnerable middle, filling you up with a meal of sticky alien-horse-cum. The stuff makes you feel instantly full and loved all at once, a combination of unexpected physical satiation combined with an uncontrollable, climax-induced emotion.");
	output("\n\nKiro slaps your [pc.thigh], calling, <i>“Take it, [pc.name]! Take the cum!”</i> You’re helpless to do anything but obey, held immobile on her girthy, lusty shaft as it pumps what feels like gallon after gallon of seed directly through your back door and into your stomach, which even now is gurgling noisily. You groan as your ass-induced climax ravages your capacity for rational thought. Your body is writhing around Kiro’s cock, sphincter clenching and gut squeezing down involuntarily. ");
	if(pc.hasCock()) 
	{
		output("All the while, [pc.eachCock] is fountaining its wasted load across your [pc.fullChest]");
		if(pc.hasVagina()) output(", and ");
		else output(".");
	}
	else if(pc.hasVagina()) output("All the while, ");
	if(pc.hasVagina()) output("[pc.eachVagina] hungers so powerfully that your hands find their way inside, stroking every twitching fold as ecstasy consumes your worldview.");
	output(" The kui-tan starts rocking back and forth as the heavy pulses of cum fill till you feel about to burst, your belly round and gravid as any long-impregnated woman’s");
	if(pc.isPregnant(x)) output(" - and then some");
	output(". Rivers of the stuff squeeze out around her cum-dilated dick, barely escaping between her veins and your abused asshole to stain her sheats.");
	output("\n\nAnd that’s just the opening salvo of her cumshot. By the time she finishes, her bedsheets are as white as her cum, and the mattress is completely soaked with the stuff. At some point, she slipped out of you, likely after you reached your limit and the pressure forced her out, chased by a geyser of slick, white love-juice. You both lie there, panting. Kiro has fallen into bed with you and snuggles against you, rubbing her nose affectionately against yours.");
	output("\n\nThe spent herm sighs, <i>“Thanks again, angel. You always know just when to show up, ya know?”</i> She blows a sticky lock of hair out of her eyes. <i>“I get a little bit crazy when my balls get that big, I know.... Thanks for putting up with me anyway.”</i> Kiro hugs you briefly, and surprisingly tenderly before realizing what she’s doing. She jolts and rolls out of bed, tender demeanor concealed under her confident exterior once more.");
	output("\n\n<i>“Come on, [pc.name]. Let’s go get cleaned up,”</i> she says as she pulls you out of the sexual muck. You follow the suddenly small-balled tanuki towards the showers with a grin, trying to hold in as much of the cum as you can while you waddle. You’re so... full.");
	processTime(60);
	pc.orgasm();
	pc.shower();
	kiro.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Invite a Friend 
public function inviteAFriendForKiroPlays():void
{
	clearOutput();
	showKiro();
	output("A sly smile creeps up the side of your lips and blossoms into a full blown grin. You press a finger to the Tanuki’s small, black nose and tell her to give you just a minute. She barks out an angry protest, gesturing broadly as if to remind you that she’s ready to go. <i>“You’d better not leave me hanging, you cock-tease,”</i> she complains, her half-hard shaft throbbing between her legs. <i>“I don’t want a repeat of that milker accident!”</i> You tweak one of her round, fluffy ears and give her a wink as you throw a robe over your body and step towards the door. Just a minute, you promise.");
	//[Holiday?] [Saendra][Reaha] [Literally Every other NPC. Hey ZilGirl, come fly with us!]
	processTime(1);
	clearMenu();
	if(flags["SAEN MET AT THE BAR"] != undefined)
	{
		if(rooms[currentLocation].planet != "TAVROS STATION") addDisabledButton(0,"Saendra","Saendra","Saendra isn't anywhere near this location. You'd have to catch Kiro on Tavros Station to have Saendra within easy reach.");
		else if(pc.hasCock()) addButton(0,"Saendra",inviteSaenForKiroFilling,undefined,"Saendra","Invite Saendra over for a ball-draining good time.");
		else addDisabledButton(0,"Saendra","Saendra","This scene requires a penis to participate in.");
	}
	else addDisabledButton(0,"Locked","Locked","You don't know Saendra well enough to invite her.");
	addButton(14,"Back",kiroSexMenu);
}

public function inviteSaenForKiroFilling():void
{
	clearOutput();
	showBust("SAENDRA_NUDE","KIRO_NUDE");
	showName("KIRO\n& SAENDRA");
	author("Adjatha");

	output("You step back into the pirate’s chambers, Saendra close at your heels, eager to check out the surprise you promised her. When the halfbreed’s eyes fall on Kiro’s nubile form, her eyes go wide. Yours go a little wide too, for that matter- though you were only gone for a short while, the anticipation must’ve done a number on the kui-tan’s libido. Though you left her with " + kiro.ballsDescript(false, true) + ", they’ve inflated well over the size of a pair of beachballs, hanging past her knees, her legs partly swallowed by the soft, supple surface. Her expression is one of impatience and annoyance.");
	//{First Time Intro Variant}
	if(flags["KIRO_X_SAEN_HAPPENED"] == undefined)
	{
		output("\n\n<i>“This is why you blew me off? To get some slut? You know I hate competing,”</i> she looks Saendra up and down with obvious disdain, <i>“even if it’s not much of a competition.”</i>");
		output("\n\nEither Saendra didn’t catch the barb or doesn’t care, her attention is entirely focused on the hyper-endowed Tanuki. <i>“Are those real?”</i> she boggles. <i>“How are you even standing up?”</i> You lift the half-breed’s jaw back up with a finger, and she shakes off the shock. Turning on you, she punches your shoulder. <i>“When were you going to tell me that you’ve got the fuckin’ Queen of Giant Balls on speed-dial?”</i>");
		output("\n\nKiro opens her mouth for some other acrid snipe but is caught off-guard by the praise. <i>“Well, I don’t know if I’d say ‘queen’ exactly. I mean, I’m pretty great, it’s true, but...”</i>");
		output("\n\n<i>“She’s hung like a fertility idol and you were gonna keep her all for yourself? This is the kind of lady they write epics about! Not sharing would be... well, criminal!”</i> The girl gushes, giving you another short, sharp punch for good measure.");
		output("\n\nThe raccoon-girl appears to be blushing under her chestnut fur, inordinately pleased by the flattering tribute your mongrel friend is slathering on her. <i>“Y- yeah, she’s right!”</i> Kiro echos. <i>“I’m a damned work of art. You should be on your knees worshipping me!”</i> Her voice wavers, lacking some of its normal force, suggesting that for all her bluster, she’s still not quite over the surprised delight of Saendra’s flattery.");
		flags["KIRO_X_SAEN_HAPPENED"] = 1;
	}
	//{Repeat Variant}
	else
	{
		output("\n\n<i>“Oho, my favorite acolyte, come back to worship at the altar of my cock?”</i> Kiro teases as Saendra enters. <i>“Kneel before my holy horsecock, and maybe I’ll bless you with a big, fertile load, hmm?”</i>");
	}
	output("\n\n<i>“Nah, being on your knees would be too good for a fiend like you,”</i> the halfbreed continues, laying it on as thick as she ever has. <i>“There’s only one real way to worship!”</i> She snatches the robe from your back and slides a thumb down the side of your jaw, her tails waving back and forth gleefully. <i>“Thanks for sharing,”</i> she whispers with a wink, before pressing her palms on your shoulders. Following her lead, you sink down to your ass and let the half-breed push you onto your back.");
	output("\n\nKiro doesn’t need another hint and waddles as best she can to stand over your prone form, padded paw-like feet straddling your hips as her swaying scrotum wobbles above you. Saendra, meanwhile, has already stripped and places her feet to either side of your shoulders, sinking to her knees. Her pert rump descends over your face, pressing her warm, soft pussy lips across your mouth, trickles of hot honey dribbling out already. She leans forward, both to squeeze her moist snatch against your mouth tighter and also to give you a view past her prodigious ass. You open your lips and draw your tongue across Saendra’s plump cunt, eager to see what the halfbreed has planned for the wholly unprepared kui-tan.");
	output("\n\nKiro’s hefty horsecock lays across the surface of her fuzzy sac, pulsing gently as her heart rate speeds up, her toes digging into the soft fabric of the carpet as she impatiently rises to the balls of her feet. Saendra stares deeply into the cum-heavy testicles before her, each half as large as she is and gurgling with deepening weight. A look of blissful devotion smoothes the playful features of her face and her ears tilt down in deference. She lifts her hands, palms up, to the dangling cusp of Kiro’s sac, fingertips just a hair’s breadth from actually touching their surface, as if afraid to sully such magnificence with her inadequate adoration. Kiro whines at the heat from the other girl’s hands and anxiously shifts her weight from one leg to the other, seizing her massive, fluffy tail and worrying it with both hands as the Ausar subtly teases the pirate with her reverent supplication.");
	output("\n\nYour own shaft hardens as you take in the show, your vigorous tongue-lashing egging the half-breed on. Saendra leans in closer and closer, taking great care to avoid actual contact, her hot breath murmuring inaudible exultations onto the appreciative tanunki’s sensitive orbs. The tantalizing nearness is too much for Kiro to resist and her body rewards the tribute by ballooning her tremendous nuts even larger, fresh waves of cum gushing into their supple confines. Saendra’s waiting hands are swiftly filled by the expanding globes, sinking into the pliant spheres with unrestrained relish. Her tails curl around to massage the far side of the kui-tan’s sac while her hands knead and stroke the front. Kiro bites her tail in bliss and the expanding scrotum quickly becomes more than Saendra can hold aloft, the softly fuzzy expanse of the tanuki’s overflowing testes descends on your lower body, molding around your hips and squeezing against your stiffening cock.");
	output("\n\nThe liquid pressure of the raccoon-girl’s inflated body is enough to send a delighted shudder through your body and you reward your diligent co-conspirator with some added attention. You slide your tongue between the junction of her now sopping wet labia and suck gently at the redhead’s warm, delicate folds. She grinds against your face in appreciation and you use the swaying motion to suck hungrily at her lips until the slight firmness of her clit peaks out of its hooded sheath.\n\nDrawing the pink button past your lips, you clamp down like a plush vice, holding her clit firmly inside your mouth. She coos in shivering delight, her trembling pleasure sending ripples through Kiro’s oceanic orbs which, in turn, rock back and forth across your straining length. You flick your tongue tip rapidly across Saendra’s pink buzzer, before stroking the full length of your rough taste buds along it, drinking in her flavor even as the muscled organ sends her into a full-blown orgasm, her thighs clamping down on the sides of your face as she hugs Kiro’s nuts desperately.");
	output("\n\nThe sudden, unexpected pressure of her full embrace is enough to leave the tanuki weak in the knees. She slumps down, resting atop her scrotum and putting renewed pressure on your lower body. Gouts of pre-cum bubble out of her throbbing shaft and splatter across her chest and tail, a steady stream of the goo pumping with every racing heart beat down the underside of her straining, ruddy equine endowment. The river of thin cream runs in glistening rivulets that drip into her tan sheath, filling the foreskin-like pouch with the hot, oily fluid. Her orgasm-rocked body still entwining her quivering quim with your honey-soaked lips, Saendra gurgles happily, forgetting her devotional role-play momentarily. She cranes her neck and seizes the Kui-Tan’s sheath between her teeth, tugging at the folds of fuzzy flesh enthusiastically.");
	output("\n\nKiro yelps in delight at Saen’s hunger and fresh waves of spooge fountain from the maroon pole, raining across the halfbreed’s face in heavy gouts. The rivers of leaking pre become torrents, the raccoon-girl’s jizz overflowing her pouch and drenching her scrotum. The fluid bounty gives her fuzzy nuts a glistening shine as her surplus rolls down the ballooned sac all the way down to your half-buried body. It’s difficult to see with Saendra’s thighs clamped so tightly around you, but you just barely make out Kiro’s lips curl as she grits her teeth and begins rocking back and forth atop her mammoth sac.");
	output("\n\nThe glistening curtain of her endless pre-cum washes under the girl’s swaying testes, soaking your [pc.chest] and abs while a second wave of fluid pours down the back of her balls, soaking your thighs in her helpless girl-cum. The wet motion of the Tanuki’s restless lust takes a moment to progress through the liquid contents of her couch-sized orbs, but when it does, you can feel it in the back of your spine. The swaying of her ponderous globes against your straining inches is nearly indescribable: it has all the soft malleability of sliding your cock through the sublime cleavage of truly titanic tits while also providing all the tight, lavish pressure of being stroked between the plush, juicy asscheeks of an ample posterior. You dig your fingers into the supple skin and add your own thrusts to her wobbling, wave-like shudders.");
	output("\n\nSaendra notices the ball-fucking you’re giving the kui-tan and follows your lead to finish the tanuki off. Leaning back, the redhead slides her tails from massaging the raccoon-girl’s testes to wrap around the straining girth of her shaft. Softly wrapping around the equine ring with a velvet grip, she begins jerking the bloated cock off, gradually pulling it down until the puffy, twitching head is eye-level to the lust-drunk girl. <i>“Here goes nothing,”</i> she giggles. Fearlessly, the halfbreed descends on Kiro’s turgid member with a lip-licking hunger. Firm, supple flesh vanishes into her maw as Saendra’s jaw widens to its utmost limit to swallow the fist-thick pole. She doesn’t even gag as the first six inches slides into her mouth, the copious lubrication of its gushing urethral spew easing the monstrous sword into her face like a sheath.");
	output("\n\nNever one to make things easy for your overeager friend, you tighten your grip on Kiro’s sac and begin thrusting between her nuts with renewed vigor as you nibble on Saendra’s swollen clit. The sudden pressure on her overtaxed pleasure button makes your lover lurch forward just as the edging kui-tan bucks involuntarily at your slippery hardness. Exactly as you intended, the girls riding you find themselves dancing to your rhythm, Kiro burying over a foot and a half of her cock in Saendra’s distended throat. The Tanuki gasps at the sudden deep-throat and her tail swings around to grip the back of Saen’s head as her hands seize the halfbreed’s ears. <i>“Ffffffffffuck! S-swallow! My! Cock!”</i> she screams between clenched teeth.");
	output("\n\nImpaled on the tanuki’s prick, her head being dragged inches at a time toward the girl’s pre-soaked sheath, Saendra’s eyes bulge, unable to do anything but swallow rapidly, instinctually. Her pussy spasms in powerless orgasm, flooding your mouth with her fragrant nectar. The girl’s aphrodisiac femme-cum floods your senses a second time and you can feel your restraint evaporating. Kiro’s short, rapid thrusts above you have set her balls to vibrating around your bucking organ. The cum bloating her nearly bed-sized sac gurgles ominously and you can feel the inexorable quivering of her now-unstoppable climax working its way through her whole body.");
	output("\n\nYour body is already drenched in the two girls’ sexual fluids, and warmed by their bodies until it seems like a fire rages in your chest. You pump harder and faster until the sensations assail Kiro so vigorously that she even forgets the tightness of Saendra’s throat around her cock. <i>“W-what are you doing down there?”</i> She demands, weakly, her voice little more than a whine. <i>“I’m in charge here! I’m the one who- ah! Ah! AHHHH! DON’T STOP! I’m ALL... MOST...!”</i> Your cock swells and throbs as your orgasm builds within you, held back only by your considerable force of will. Your straining muscles under her hyper-receptive pouch sends waves of pressure through her body as surely as if you had buried yourself balls deep in her taut pussy.");
	output("\n\nKiro gives a defeated wail and buries her fingers in Saendra’s hair, pulling the half-breed all the way down to the swollen medial ring of her horsecock before loosing her geyser-like orgasm down the redhead’s bulging throat. The fattened spout flares outward as the first load pumps recklessly down the her stretched neck, provoking a gurgling gag from the cum-dump mongrel-girl. Ropes of jet-propelled jizz arc out of her small nostrils and her pupils contract to pinpoints as an impossibly heavy pressure blasts her throat open and floods her stomach to capacity in an instant.\n\nThe sudden weight in her gut pushes Saendra off your face and you gasp a cold gulp of air as your own climax throbs between your legs. The taut skin of her cum-and-sweat drenched balls sucks lewdly at your avid hardness and your pace becomes unsustainable. Passion floods your vision and your balls-smothered body bursts the fetters of your straining commands.");
	output("\n\nAs your orgasm hits, the gushing heat of your spouting ejaculate overwhelms the exhausted Tanuki atop you, the pumping twitches of her slut-breaking loads obediently matching your pace. Every gout of spoo you spurt between her carnal testes is matched by a fresh gallon of raccoon-spunk that surges into the cum-bloated body of your halfbreed fuck-buddy. Her stomach expands far past ‘plump’ and even ‘fat’ until the only word for it is ‘bovine.’ She slumps, as paralyzed by the sea of tanuki-slime inside her as Kiro is by her worship-bloated balls. At the limits of her overburdened capacity, Kiro’s cum gushes between Saendra’s lips and out of her nose in gooey spurts that oil the front of her body as thickly as the raccoon-nuts she’s milking.");
	output("\n\nIt is quite a while before your orgasm ends and a bit longer still until Kiro gains the presence of mind to pull her now flaccid, but still drooling, equine prick from the halfbreed’s throat. A final wave of spoo runs down her breasts before she sputters and gasps for sweet air. <i>“Oh you little prick,”</i> Saen teases in a feeble voice. <i>“Don’t think I won’t get you back for that one.”</i> The girls sink to the ground next to you, resting their heads against your panting chest. They’re asleep almost immediately and you take a moment to enjoy the comfortable, fluffy fur rising and falling slowly, the two unconsciously breathing in harmonious unison. Saendra will probably want your help burning off all the calories from her unexpected feast, you muse idly, and knowing her, she’ll probably make Kiro help. Sleep eventually takes you and you drift off to the soft symphony of melodic exhaustion.");
	processTime(35+rand(5));
	pc.orgasm();
	kiro.orgasm();
	saendra.orgasm();
	processTime(55);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Trusted Pussy Pumpings - AKA, Kiro’s <i>“Heart”</i> Grew Three Sizes That Day
//Intro might need adjusted to lead into this at a later time. Not sure how exactly you get to this point.
//SukMastr 2000
public function treatedPussPumps():void
{
	clearOutput();
	showKiro();
	output("Kiro covers her mouth in ");
	//First time
	if(flags["PUMPED_KIRO_PUSSY"] == undefined)
	{
		output("genuine shock. Her voice is hushed and whispery. <i>“Is that... what I think it is?”</i> The tanuki-like alien glances down and wrings her crimson garments in her hands, her gaze firmly locked on her crotch and its immense masculinity. <i>“I don’t think that’s quite the machinery for me.”</i> Her uncertainty fades under a layer of her usual bluster as she masters herself. <i>\"I’ve got the cock milker. Why don’t I just whip you up remote access so that you can control it while I use it?”</i> Flicking over, her gaze falls back on the little pump, worry written across her face. <i>\"Come on, [pc.name].”</i>");
		output("\n\nYou smile, knowing now that you’ve found a chink in the saucy piratess’ emotional armor. She seems worried about her pussy");
		if(!kiro.vaginalVirgin) output(", even though she’s not a virgin anymore");
		output(", and nervousness is plain on her brow. All it took is this machine... with its little, clear plastic pump. You put a comforting arm around her fur-padded shoulders and hold the cup up in front of her, offering, <i>“");
		if(pc.isNice()) output("Please, Kiro? I think you’d look gorgeous splayed out with your pretty pussy all pumped-up and sensitive.");
		else if(pc.isMischievous()) output("Come on, Kiro! You’re a terror of the void. Surely you can handle a little feminine ecstasy with your lover?");
		else output("Come on, Kiro. If you don’t have the courage for a little vaginal play, I don’t see how you can be worthy of that beast between your legs. You might as well be a little, human girl.");
		output("”</i>");
		output("\n\nYou know your words have had the desired effect when the kui-tan’s spine straightens. Her tail seems even thicker and poofier than before, perhaps as an instinctive reflex to make her appear larger.");
		output("\n\nKiro growls, <i>“All right, [pc.name]. If anyone’s pussy can handle a little pumping, it’s mine, but I’m only doing this because I want to see how this sort of thing will help my cock get off.”</i> She snatches the machine out of your hand. <i>\"So this is it, huh? It doesn’t look that bad.”</i> Casually hefting the pump’s base, she turns it over in her hands, her tail curling around your waist possessively. <i>\"Come on, [pc.name]. You talked me into it - you can operate it.”</i> She smiles. <i>\"I trust you.”</i>");
		//output("\n\nYou walk with her towards her room, noting the way her cock seems to rise a little higher in her clothing with every step. By the time you reach the entry, she’s at full mast and dripping, though obviously trying to hide it.");
		output("\n\nYou watch her examine it with wide eyes, her cock rising a little higher with every passing second. By the time she's satisfied with her review of the hardware, she's at full mast and dripping, though trying her best to hide it.");
		output("\n\n<i>\"C-c-come on! I do-oh-on’t have all day!”</i> she pants while looking to the bed.");
	}
	//Repeat Version:
	else
	{
		output("feigned surprise. Her voice is quiet and conspiratorial. <i>\"You want me to... to use </i>it<i> again?”</i> Kiro shivers and looks at the device with an expression somewhere between apprehension and longing. <i>\"You know I’m all about having the biggest, most powerful sex organs already.”</i> She smiles. <i>\"I might as well be the biggest, most sensitive woman I can be too.”</i> Kiro hefts her sizable package for emphasis before wondering aloud, <i>\"Think you can find my pussy again under all these balls?”</i>");
		output("\n\nYou smile, knowing you’ve unleashed some kind of long-suppressed desire within the hermaphroditic pirate, saying, <i>\"");
		if(pc.isNice()) output("I’d love to try!");
		else if(pc.isMischievous()) output("I bet you I could find it before you could!");
		else output("It’d be easier if you drained the damn things a little more regularly. I’m trying to play with your pussy and you gotta wave your damn balls in my face.");
		output("”</i> You waggle the clear plastic end of the device under her nose, sidling up alongside her with one hand falling on her plush, rounded bottom. Her tail flicks this way, that way, and finally falls around your own [pc.hips] to pull you tightly against her plush, fuzzy form.");
		output("\n\n<i>\"Come on,”</i> Kiro purrs with a gentle tug from her tail, <i>\"I need you to run this for me. Who else would I trust to handle my pussy?”</i>");
		//output("\n\nWho else indeed. You walk along with her towards her room, noting the way her cock distends her garments more and more with every step. By the time you reach the entry to her ship, she’s at full mast and dripping, softly moaning with every exaggerated sway of her hips.");
		output("\n\nWho else indeed. You watch her examining the device, ensuring its proper function before attaching it to her genitals, noting that her cock is getting more and more distended with every passing second. By the time Kiro nods to you, she's at full mast and dripping, moaning softly with every antsy wiggle of her hips.");
		output("\n\n<i>\"Hurry,”</i> she moans while looking to the bed.");
	}
	processTime(10);
	pc.lust(14);
	//Next
	clearMenu();
	addButton(0,"Next",kiroPussPumpPartII);
}

//Both intros merge together here, though some variations remain!
public function kiroPussPumpPartII():void
{
	clearOutput();
	showKiro(true);
	//output("Kiro staggers into her room, tearing her way out of her sheer red dress as she goes. When the discarded garment lands next to the bed, you notice the obscene white smear her swollen shaft left on the garment, soaking a damp patch from just below the low-cut bust down to the racy hemline. ");
	output("Kiro staggers toward the bed, nearly tripping over her discarded dress as she goes. You note an obscene white smear on the inner surface of the apparently waterproofed garment, creating a damp patch from just below the low-cut bust to the bottom of the racy hemline. ");
	output("A shimmery strand of semi-transparent pre still hangs between the futanari’s tool, so large that even in its erect state it’s dangling down a bit. Shuddering, the alien pirate turns towards you, and the fragile rope of sexjuice snaps under the strain, half of it whipping up like a broken bungee cord to splatter against her length. She coos pleasantly at the sensation, her cock stiffening a little bit more with a fresh glob of pearly excess beading on her blunted tip once more.");
	output("\n\nSeating herself on the edge of her musky bed, the kui-tan grabs herself with one hand. Her fingers settle into place around the underside in a cupping shape, too small and nimble to properly encircle the whole of her girth, and she lifts it up to rest between her breasts as she lays back. Now on top, that hand begins to stroke, sliding up and down the length of the pulsating prick, oozing hot globules of excitement out into the middle of her considerable bosom, her busy balls jumping excitedly below as they brew her up a fresh batch of jism.");
	output("\n\nKiro lifts her balls up to expose the dewy black lips of her pussy. They look puffy with arousal and slick with a mixture of her accumulated ballsweat and feminine fluids. She offers, <i>“Go ahead, [pc.name].”</i> A nervous shudder works through her body as she strokes herself with long, slow motions, not really trying to cum so much as keep herself excited for ");
	if(flags["PUMPED_KIRO_PUSSY"] == undefined) output("your experiment");
	else output("what’s rapidly becoming one of her favorite toys");
	output(". <i>\"I can’t believe I’m doing this");
	if(flags["PUMPED_KIRO_PUSSY"] != undefined) output(" for you again");
	output("!”</i>");

	output("\n\nYou set the “SukMastr 2000” box down on a clear spot and turn it on. It makes a barely discernable whine as its internal motors power up, but it’s still nearly silent in comparison to the background whine of the ship. The pussy-molded cup in your hand isn’t doing anything just yet; you’ve got to push the buttons on the control in your hand for that, and the device isn’t even in place yet. Looking at Kiro’s face, you watch her expression closely as you push the clear plastic snugly over her womanhood, using her own sweat to help it achieve a good seal. She gasps as the cold lip presses against her vulnerable loins.");
	output("\n\n<i>\"Ready?”</i> you ask.");
	output("\n\nKiro bites her bottom lip and nods");
	if(flags["PUMPED_KIRO_PUSSY"] != undefined) output(" eagerly");
	output(". You flick the switch before she can change her mind, and the toy begins to do just what it was built for. Immediately, it snugs itself more tightly against her than you could manage with pressure alone. You let it go and watch as it settles into place, rhythmically rocking itself deeper into the soft flesh of crotch to the tempo of pulsating vacuum. It isn’t sucking very hard yet, but you can already see the kui-tan’s black-hued lips expanding and engorging beneath it. Her glistening skin rises up a little, just enough that you can see her puffy flesh pressing against the edges of the clear cup, staining it with slick sweat.");
	output("\n\nThe tanuki-like woman groans low in the back of her throat, ");
	if(flags["PUMPED_KIRO_PUSSY"] == undefined) output("<i>\"This... is actually kind of nice,”</i>");
	else output("<i>\"Ahhhh... this is nice,”</i>");
	output(" and actually stops masturbating for once. Her legs spread a touch wider as she settles into position. Lifting her dick away from her body, Kiro just... holds it there, letting it sit there like some kind of licentious totem. She whimpers just a little bit, and flecks of clear pussy-juice appear around the edges of the constantly-sucking cunt containment unit. Her thighs tremble and spread, opening up so completely that her knees hang over the edges, feet and calves dangling.");
	output("\n\nTurning the “SukMastr” up a notch, you suggest, ");
	if(flags["PUMPED_KIRO_PUSSY"] == undefined) output("<i>\"Not that bad, is it?”</i>");
	else output("<i>\"I think somebody’s starting to really enjoy it when I use this on her.”</i>");
	output("\n\n<i>\"Nu-noooo,”</i> Kiro’s voice drawls, husky with pleasure. Hearing her own voice, she shivers. Her hips lift up just a little, instinctively thrusting up at the surprisingly strong pulse of suction. They sag back a moment later as the vacuum dies down a bit, accompanied by a muffled whimper. Her ");
	if(kiro.ballDiameter() < 25) output("exquisitely");
	else output("immensely");
	output(" swollen sack trembles and jumps to the same rhythm, and thick strands of kui-tan pre-seed spill off her half-flared head in tiny rivers of uncontained sexual excitement. Kiro looks around her dick at you, pleading, <i>\"Can you turn it up? Please, [pc.name]. It isn’t enough!”</i>");
	output("\n\n<i>\"What isn’t enough?”</i> you reply. <i>\"Turn up the heat? You don’t look cold. You really should be more specific.”</i>");
	output("\n\nKiro’s legs spread until they’re almost opened up in a split, and her tail thrashes madly alongside her torso, thumping noisily against her bedsheets. Ropes of pre are splattering down over her wobbling tits, stiff nipples and all. Some of it is even getting on her bed, undoubtedly the beginnings of a plethora of new sex-stains. She shakes her head back and forth in denial before the urges emanating from her puffed-up puss overwhelm her meager willpower. <i>\"Turn up the pump! Give my wet p-p-pussy even more! I want your toy to suck on my twat harder, [pc.name]. It’s making me so wet! Don’t ever stop-don’teverstopdon’tstopplease!”</i>");
	output("\n\nYou smile, and with a gentle rub against the down-soft fur of the pirate-girl’s thigh, you click the Sukmaster up another notch. Kiro’s back arches, her vulva inflates, and a reedy-sounding wail escapes out the back of her throat, turning into a full-fledged screech of pleasure. The tanuki’s entirely female orgasm briefly floods the cup, though the suction tube is quick to drain it away. Her nether lips are blooming like the petals to a flower, and her vulva is plush, hugely expanded. You watch in fascination as her flesh grows to fill the cup, the slit slowly working open and closed, oozing hot trickles of fluid that are noisily suckled away. Cooing excitedly, the kui-tan pinches and tugs on one of her large, sable nipples. She rolls the sensitive skin between her fingers as she cums, pinching it a moment before each fresh gush of ladyspunk floods the cup.");
	output("\n\nMore than a little turned on yourself, you try your best to stay focused on the orgasmically twitching tanuki-girl. You place your hands on her quivering thighs and, with a gentle squeeze, begin to massage the sensitive skin there. Sometimes, you trail your fingers up to the very edges of her encapsulated, swelling box. Other times, you trace down to her knees, giving the overstimulated nerves around her crotch a brief moment to calm themselves before racing back up to bathe her moist skin in sensation. Her eyes roll back under her closing eyelids, and her body writhes sinuously against your probing touches.");
	output("\n\n<i>\"Fuuuuuuck!”</i> Kiro bubbles as she bonelessly squirms, turning it into a cadence: <i>\"fuckmefuckmefuckme!”</i> You notice her sack shudder, pulling tightly around her swollen cum-spheres in preparation. The egg-shaped testes lurch powerfully, shrinking a little bit in the process. You glance up to her throbbing cock expectantly, just in time to see it lurch, arching powerfully. The head flares out so drastically that it looks almost wide enough to hide two of her shafts beneath it, and her sheath bulges with her imprisoned load. Eventually, you’re treated to a view of her entire urethra expanding, pumped full of so much cum that it looks the size of a small hose.");
	output("\n\nYou briefly consider milking the kui-tan’s rampant, cum-fueled monster-cock, but when she cums, there’s so much force behind it that you’re sure squeezing it would only manage to slow the flow. Both her hands grab hold of the erupting shaft, one near the medial ring and the other just around the sheath. Kiro aims it so that the avalanche of alabaster goo is falling almost directly across her face. She holds her mouth open, waiting for it to be filled. Huge blobs of it collect in her mouth, turning her open orifice into a hungrily-gulping spunk dump. Her aim is far from perfect, and the deluge of sticky seed turns her face into a mask of white within the first two shots. Blind, she lets her cock spray over the rest of it, splattering sheets of the ivory goo across her heaving tits and taut belly. She whimpers, launching a last few spurts, swallowing some while the rest pools on her, rolling off to soak into her musky, cum-scented bed.");
	output("\n\nGroaning, Kiro licks her tongue around her mouth to collect the caked-on drippings, still twitching and shaking in the aftershocks of her orgasm. She savors the salty stuff with a satiated sigh. Her vulva ballooned in size while the two of you were distracted by her self-imposed bukkake. Her labia, both internal and external, are moulded into the shape of the rounded pump, protruding a full inch-and-a-half forward from their normal position. They look positively glazed in cunt-drippings, shiny as latex and undoubtedly many times more sensitive than normal.");
	output("\n\nThe blissed-out space pirate giggles, high pitched and feminine, a sound you’re not used to hearing from her. <i>\"My pussy feels so good, [pc.name]! My cock is great too, but this... it’s something else entirely. I want to... oh... oh yes.... I want to spread my legs and get fucked, one male after another. It’d be so wrong for me!”</i> She shivers, trying to collect her thoughts while most of them drip from her hugely swollen netherlips. <i>\"I know, I’m all about fucking the loose-legged cunts. But this thing... mmmm... I’m so wet, [pc.name]. I’m so wet and hot and I just want to lie there and frig myself until I’m full of cocks and cum.”</i>");
	output("\n\nKiro’s fingers curl into claws that dig into her spunk-splashed sheets. <i>\"I can feel my cunny lips dragging on the plastic when I clench, [pc.name]! Let it out! Let my huge, swollen pussy out and stuff it! Grab my lips and squeeze and lick and taste them! Snap a collar on me and drag me out into the bar like this. Bend me over and give everyone a run at me!”</i> By the end of her tirade, she’s cumming into the cup again, and this time, flooding it with so much femspunk so fast that the cup pops off with an explosion of fragrant female droplets.");
	output("\n\n");
	if(flags["PUMPED_KIRO_PUSSY"] == undefined) output("Stunned by the rapid change in demeanor");
	else output("Happy that Kiro has slipped right back into this state of mind");
	output(", you flick off the futilely sucking machine. She’s an absolute mess. The top half of her body is glazed in such a thick layer of cum that she appears albino from the waist up. Her sheets are caked with the salty stuff too. Even the sheets below her legs are sopping-wet with love, albeit a different kind. The scent of a long-suppressed, horny pussy fills the air, and Kiro’s plump, pouting pussy-lips seem to expand a bit more now that they’ve been freed from confinement. Her box is so hugely swollen that the act of walking would probably get her off. Every step would be pleasurable agony from her thighs grinding on her lips.");
	output("\n\n<i>\"Fuck me, please,”</i> Kiro begs. <i>\"I NEED it!”</i> Hefting her significantly smaller nutsack out of the way with one hand, she presents her thoroughly soaked slit to you. Her other is busy gathering up the cum that covers everything above her waist and bringing it to her mouth again and again. She looks at you with a mixture of desire and confusion, babbling, <i>\"Why does it taste so good ");
	if(flags["PUMPED_KIRO_PUSSY"] == undefined) output("all of a sudden");
	else output("after I let you pump me");
	output("?”</i>");

	output("\n\nThe kui-tan won’t accept anything but you and her fucking at this point. You created this pussy-pumped monster, and it’s your responsibility to please it. How do you take care of her over-sensitive lips?");
	processTime(20+rand(5));
	pc.lust(35);
	clearMenu();

	flags["PUMPED_KIRO_PUSSY"] = 1;

	//[FuckThem] [TribThem] [GrindFrot]
	if(pc.hasCock() && pc.biggestCockLength() < 20) addButton(0,"Fuck Them",fuckPumpedKiro,undefined,"Fuck Them","Fuck Kiro's plush, pumped-up lips. She's begging for it.");
	else if(pc.hasCock()) addDisabledButton(0,"Fuck Them","Fuck Them","Your dick is too large to fuck Kiro's pussy.");
	else addDisabledButton(0,"Fuck Them","Fuck Them","You need a penis in order to fuck Kiro's pussy.");
	
	if(pc.hasVagina()) addButton(1,"TribThem",tribDemLips,undefined,"TribThem","What better to please a pussy than another hot, wet cunt?");
	else addDisabledButton(1,"TribThem","TribThem","You need a vagina to trib with Kiro.");

	if(pc.biggestCockLength() >= 20) addButton(2,"GrindFrot",kiroGrindFrot,undefined,"GrindFrot","Grind your plus-sized dick against Kiro's until both of you pop your corks.");
	else addDisabledButton(2,"GrindFrot","GrindFrot","You need a big dick (at least 20 inches) for this scene.");
}

//Fuck Them [Pussy Pump Continued] [Done]
public function fuckPumpedKiro():void
{
	clearOutput();
	var x:int = pc.cockThatFits(kiro.vaginalCapacity(0));
	if(x < 0) x = pc.smallestCockIndex();
	showKiro(true);
	output("Smiling to yourself, you climb into bed with the sperm-sauced kui-tan and grab [pc.oneCock] in hand. Was there ever any doubt it would end this way - with the proud, cock-centered Kiro craving a dicking like a bitch in heat? All it took was getting her in touch with her feminine side, and now she wants nothing more than to have your cock buried in her sopping-wet, overly-engorged entrance. Her sodden lips part around you like a clinging, silken sleeve, sucking you in to the [pc.sheath " + x + "].");
	if(kiro.vaginalVirgin) output(" <b>The only evidence of Kiro's virginal hymen is a slight hitch in the penetration.</b>");
	pc.cockChange();
	output("\n\nThe lusty pirate hisses, <i>\"Yessssss...”</i> at the sudden fulness. Her walls squeeze down, gripping you with the firmness of a lover’s familiar hand, undulating softly around your length as you adjust to the steaming-hot sauna you’ve found yourself in.");
	output("\n\nAn unsubtle sigh of contentment slips from your lips at the pleasurable onslaught after so much sexual tension. Your [pc.hips] gently rock back and forth, stirring the kui-tan’s slick inner walls with your [pc.cock " + x + "], luxuriating in her honeyed, velvet softness. You’re sure from the look on her face that Kiro wants to say something, but all that comes out is a low, keening groan. Her hands claw futilely at her lust-lubricated sheets as she struggles to deal with the nigh-overwhelming sensations before finally mastering herself enough to gasp, <i>\"More!”</i>");
	output("\n\nYou don’t keep the lady waiting. Grabbing hold of her by her lush, cum-soaked hips, you hold her still as you slide out, admiring the way her plush, pumped lips have molded to the shape of your [pc.cock " + x + "] before thrusting back in, not too fast, not too slow, giving her a firm, well-planned push.");
	output("\n\nKiro lets out a throaty moan, babbling, <i>\"It’s so fucking sensitive, [pc.name]. My pussy is so fucking sensitive! Don’t stop!”</i> She wraps her fuzzy thighs around your back and pulls you in, taking you to the hilt and setting her pussy aflutter all over again. There’s still enough give for you to piston a few inches out in and out with short, jackhammer-like thrusts, and the lusty pirate rewards your efforts with explosive squirts of female ejaculate, splattering your crotch");
	if(pc.balls > 0) output(" and [pc.sack]");
	output(" with her glittering juices. Her balls quiver meaningfully above her increasingly well-used pussy. It’ll only take a little more to launch her over the edge.");
	output("\n\nYou reach down, shifting the quivering orbs out of the way, and press your thumb against her poor, pumped-up clit. Kiro’s velvet-lined vice squeezes your dick so hard that it almost hurts. Her swollen, partly-drained cum-factories lurch and pulse, and her cock is erupting all over her tits and face once more. Kiro sucks as much of her flaring monstrosity into her mouth as possible, but the stallion-sized tool is too big to take when it’s stretching so wide. All she succeeds in doing is puffing out her cheeks as they fill with jism.");
	output("\n\nMeanwhile, her cock-milking twat finally squeezes you <b>just</b> right, and you feel the blossoming warmth of your own climax spreading through your middle. [pc.EachCock] lurches, throwing a great, long rope of [pc.cum] out with force. You thrust as hard as you can, making the bed creek even though you were already close to hilted, your muscles straining to keep you as completely engulfed in pussy as possible. There, you spend the rest of your seed, pouring [pc.cum] directly into the unresisting kui-tan’s lovely, pumped up hole.");
	if(pc.cumQ() >= 1000)
	{
		output(" She doesn’t protest in the slightest when you ");
		if(pc.cumQ() < 2000) output("give her belly a slight cum-paunch");
		else if(pc.cumQ() < 5000) output("distend her belly into a pregnant-looking dome");
		else output("pack her so full that her belly rounds into a gravid, jiggling half-sphere");
		output(".");
	}
	if(pc.hasKnot(x)) output("\n\nShe doesn’t even mind that your knot stubbornly locks you inside her, or that you continue to shoot stray bits of [pc.cum] into her for the better part of an hour. Sometimes, having such a unique cock has its benefits. Eventually, your knot does shrink down enough for it to pop out, leaving her gaped and leaking trickles of your [pc.cumColor] essence onto her bed, truly looking the part of a well-fucked bitch.");
	output("\n\nKiro lazily draws you into a snuggly, messy hug before lavishing you with kisses and thanking you for making her feel so wonderful. It’ll be a while till the swelling in her crotch goes down, but she obviously liked every second of it.");
	if(kiro.vaginalVirgin) 
	{
		output("\n\n<b>You’ve taken Kiro’s virginity.</b>");
		kiro.cuntChange(0,pc.cockVolume(x),false,false,false);
	}
	processTime(22);
	pc.orgasm();
	processTime(22);
	clearMenu();
	if(!pc.hasKeyItem("Panties - Kiro's - Lacy, black, and crotchless.")) addButton(0,"Next",kiroginityEpilogue) 
	else addButton(0,"Next",mainGameMenu);
}

//Trib Them [Pussy Pump Continued] [Done]
public function tribDemLips():void
{
	clearOutput();
	showKiro(true);
	output("Laughing softly, you say, <i>\"Why Kiro, I think you’re starting to get an appreciation for sapphic delights,”</i> as you strip out of your [pc.gear], discarding it in one of the few remaining dry spots. The kui-tan has done an admirable job of completely soaking her bed with sex-juice, and the room hasn’t fared that much better: spots of white mar the walls, the floor, even the doorframe. There’s no way to get into the bed and start tribbing her without navigating the ocean of cum she’s flooded sheets with. Still, you knew things were likely to turn into a cummy mess when you decided to bed the big-balled hermaphrodite.");
	output("\n\nShe watches you climb in, splaying her legs as wide as she possibly can. <i>\"Just touch my pussy, [pc.name]! Hurry!”</i> She grabs her swollen lips and pulls them open, showing you how completely drenched she’s become, not just with pussy-juice but with alabaster spunk that’s dripping down from above. She shines in the artificial light, a sculpture of female lust painted white, and she’s all yours.");
	output("\n\nYou ignore the squishing of the mattress as you get into position below her, grabbing one of her legs and lifting it high, making her fuzzy nutsack bounce against a soaked thigh and putting her pussy on full display. Then, you lie back");
	if(pc.legCount > 1) output(", splitting your [pc.legs] to either side of the upraised one so that your [pc.vaginas] will line up");
	else output(", wrapping your [pc.leg] around her torso so that your [pc.vaginas] will line up");
	output(" with the kui-tan’s own super-sized entrance, the superheated pussies just inches apart and getting closer with every passing second. There’s so much sexjuice simmering in your soon-to-be-paired twats that the air practically fogs with it, saturated with what could only be the scent of two bitches locked firmly in the throes of sexual heat. Kiro’s length twitches and stiffens up once more as she wallows in it, vulnerable even to the scent of her own snatch.");
	output("\n\nKiro is whimpering with barely-contained need by this point. Her want is painted as clearly across her face as the ivory mask of spunk she’s spurted onto herself. The libidinous slut is trembling like a leaf in the wind, helpless before you, pleading with quiet whimpers and lewd looks. You reward her for her honesty by giving her exactly what she wants - [pc.oneVagina] pressed tightly against hers. Her pump-swollen lips dwarf your own to such a degree that you briefly imagine them bathing your entire crotch in their enhanced mass. Grinding back against you, Kiro moans helplessly as she’s tormented by her box’s extreme oversensitivity. Her slick, rubbery twat slides back and forth over you, and you return the favor by slowly undulating your hips, making your [pc.clits] catch on one side of her pussy and then the other.");
	output("\n\n<i>“F-f-f-fuck! It’s so good!”</i> the pirate bubbles. Her arms fly to her wobbling breasts and grab hold of her dusky nipples, tugging the rigid buds, pinching and pulling in excited spasms. <i>“They feel so good, [pc.name]!”</i> She rolls one of her nipples between her fingertips. <i>\"When the fuck did being girly start feeling so goddamn great?”</i> You feel a gush of girlhoney splatter against your netherlips, and with a skillful twist of your [pc.hips], you rub the fresh lubrication against her convulsing entrance, making her quiver in uncontrolled orgasm.");
	output("\n\nMashing her tits down around her length, Kiro pulls hard enough on her ebony nipples to distort her tits into teardrops while her cock erupts between them, adding a fresh coat of sticky bliss to her body as her orgasm claims her. The tanuki titfucks her wildly spasming member, dragging her well-rounded breasts up and down her length with rough tugs on her sore teats. Her pussy gushes against yours, so puffy and wet that you feel like you’re grinding against some kind of pillowy sextoy.");
	output("\n\nYou grab the lust-drunk pirate by her hips and push yourself down harder, trying to get more friction on your [pc.clits]. Judging by the spasms of tremendous pleasure that seem to be transforming your [pc.legs] into a puddle of jello, you’ve succeeded. You gasp loud enough to briefly drown out Kiro’s own frenzied, lust-filled howls. Her balls are bouncing against you as they pump out thick waves of kui-tan cream, and you do your best to guide your own pleasant spasms into bouncing into them with each body-soaking convulsion.");
	output("\n\nThe air fills with twinned calls of pleasure. Kiro has by far the messiest climax, but your calls of bliss are by far the louder.");
	if(pc.isSquirter()) output(" Gushes of [pc.girlCum] spray out,");
	else output(" Trickles of [pc.girlCum] leak out,");
	output(" mixing into the growing lake of spent spooge that’s rising up around your elbows and running down the side of the bed onto the floor. The room becomes so steeped in the scents of your sapphic ecstasy that you’re sure Kiro’s cabin is going to smell like wet pussy for a week, but neither of you seems to mind.");
	output("\n\nAfter what feels like minutes of tremendous pleasure, your climaxes finally abate, and your bodies slump down together into a spent, soaked puddle. Kiro recovers first, and she helpfully pulls you up and into her arms. There, she lavishes you with kisses until you come to, letting you feel the warmth of her embrace and sexual juices until it’s time to get a shower.");
	//Pass 2-2.5 hours.
	processTime(22);
	pc.orgasm();
	pc.shower();
	kiro.orgasm();
	processTime(120);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//GrindFrot [Pussy Pump Continued] [Done]
public function kiroGrindFrot():void
{
	clearOutput();
	showKiro(true);
	//Crotch-covered
	if(pc.isCrotchGarbed())
	{
		output("You shrug out of your [pc.gear] to free the stiff, compressed behemoth");
		if(pc.cockTotal() > 1) output("s");
		if(pc.legCount > 1) output(" between your [pc.legs]");
		else output(" hidden above your [pc.leg]");
		output(". With a few deft strokes, [pc.oneCock] is encouraged to expand to its full, immense size. It throbs hungrily");
		if(pc.cockTotal() > 1) 
		{
			output(", bigger than its brother");
			if(pc.cockTotal() > 2) output("s");
			output(",");
		}
	}
	else
	{
		output("You toss aside the little bit of gear you bother to carry, for once glad that your loins are bare. Your [pc.cocks] ");
		if(pc.cockTotal() > 1) output("are");
		else output("is");
		output(" totally exposed, able to wave back and forth before you like ");
		if(pc.cockTotal() == 1) output("a ");
		output("gigantic, tumescent limb");
		if(pc.cockTotal() > 1) output("s");
		output(". You idly stroke ");
		if(pc.cockTotal() == 1) output("it");
		else output("the largest");
		output(",");
	}
	output(" eager for a taste of Kiro’s supremely engorged twat. Climbing into her lust-slicked bed, you delicately try to maintain your balance over the lake of girlcum and spunk, barely managing to drop your [pc.cockBiggest] down across the herm’s puffed-up lips, ballsack, and rigid, equine phallus.");
	output("\n\n<i>“Oh fuck! Why are you so big? [pc.name], I need it inside! I need to be filled!”</i> Kiro cries. She wraps her legs around your length, crushing you against her, splitting her lips around the bulge of your urethra. Her complaints trail off into a satisfied groan as the sensation of having her hugely swollen cunt spread open by the giant slab of dick, and she vigorously starts to hump and grind, thrusting her squishy, lube-leaking lips against you as hard as possible. <i>\"Nevermind! You’re so big... mmmm.... I’ll fuck you like this. I’ll grind my big, pumped up pussy against you until you’re ready to cum for me, and then I’ll slide up so I can catch it all inside!”</i>");
	output("\n\nGrunting your assent, you grab hold of her fuzzy, padded feet and start to drag your [pc.cockBiggest] back and forth through her embrace. The slickness oozing from her slit is more than sufficient to turn the bottom half of your length into a well-oiled piston. On either side, her weighty nuts squeeze up alongside. You’re grinding on her cunt, receiving a squeezing ball-job, and getting to frot against dick while using her pussy-juice for lube. You twitch with eagerness, going faster and faster with each thrust through her soft-furred thighs, so overwhelmingly horny from the extended foreplay that you aren’t too far from cumming yourself.");
	output("\n\nKiro slobbers all over your ");
	if(pc.biggestCockLength() < 30) output("[pc.cockHeadBiggest]");
	else output("underside");
	output(", worshipfully tonguing her juices off your length and replacing them with bubbling saliva. Her hands press her cock into yours, and she slides it from side to side while you press down overtop of it.");
	output("\n\nLooming over your ecstatic, vaginally-obsessed lover, you pant out, <i>\"You want me to pull back and cum inside, Kiro?”</i> knowing the answer before the words leave your lips. You just want to hear her say it.");
	output("\n\n<i>\"Yes! Fill me up! Stuff me with cum from your over-sized bitch-breakers! Shove as much of yourself as you can inside me!”</i> Kiro clamors while dumping a slow trickle of jism out of her weakly-flaring cock-head. ");
	if(pc.balls > 0) output("The juices spraying from her netherlips coat your [pc.balls] in her silken bounty. ");
	else output("The juices spraying from her netherlips coat your [pc.sheathBiggest] in another coat of her silken bounty. ");
	output("At the same time, her thighs convulsively squeeze down around you into a tight ring. You do your best to hold out against the tight embrace until you can get in position, but it’s impossible not to resist the cum-splattered succubus below.");
	output("\n\nShe keeps egging you on, panting and whispering sweet, filthy nothings, intent on giving you the biggest orgasm possible. <i>\"Cram yourself inside! Make it fit! Train my pussy into a sleeve for your gigantic, cum-belching dick. Break me into a cunt-pumped fuckslut who’ll bind her horsecock down and beg you to fuck her until she leaks white submission onto all of the deckplates over your ship!”</i>");
	output("\n\nYou wince, heat wrenching through your middle as your climax nears, and try to pull back. You’ve got to get your [pc.cockHeadBiggest] in place before you waste your cumshot! Kiro’s body turns to jelly as another orgasm wracks her entire frame, and you’re abruptly freed to yank back, guiding yourself over her soaked sack and down to the sopping-wet crevasse below. You pry her lips open with a powerful thrust, splitting Kiro’s over-expanded, gigantic vulva apart around your [pc.cum]-flinging phallus. You spray your ropes inside her squeezing, [pc.cumNoun]-slicked quim, feeling her juices spray out around you mixed with your own. Her feet surround your length as she regains her composure, jacking you off into her fuck-hungry twat");
	if(pc.cumQ() > 500) output(" until the excess is spraying out around you");
	output(".");
	output("\n\nKiro holds you there, milking out every drop. Occasionally, she quivers and shakes with a miniature aftershock of ecstasy, moaning loudly to show you just how much she’s enjoying this. Her soft feet don’t stop until long after your ");
	if(pc.balls > 0) output("[pc.balls] ");
	else output("body");
	if(pc.balls > 1) output("have");
	else output("has");
	output(" gone dry, but eventually, she calms down enough to relent, gasping for breath as you collapse beside her on the sticky, sex-soaked mattress.");
	output("\n\nWrapping a tired arm around you, Kiro pulls you towards her lips, sharing a brief, tender kiss with you in the afterglow. <i>\"You know you can’t tell anyone about this, right, [pc.name]?”</i>");
	output("\n\nYou answer, <i>\"Just as long as you let me do it more often.”</i>");
	output("\n\nKiro eagerly nods, and the two of you take a long, hot shower to clean up.");
	//Pass 2-2.5 hours!
	processTime(100);
	pc.orgasm();
	pc.shower();
	kiro.orgasm();
	processTime(30);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Give Kiro Some Relief (AKA A Very Adjatha Birthday)
public function giveKiroSomeRelief():void
{
	clearOutput();
	showKiro();
	output("Smiling devilishly, a plan forms in your mind. It’s time this poor kui-tan got the relief she obviously needs. Girls like her really shouldn’t go so long without a proper ball-draining. How will she focus on surviving all the dangerous encounters in the frontier if she’s dragging two melons behind her full of distracting, potent need? If she’s not going to take care of herself, it’s up to you to do it for her.");
	output("\n\nWith a mischievous smirk, you shimmy down low in your seat, pouring yourself under the table with ");
	if(pc.isGoo()) output("the liquid grace only a goo-[pc.boy]");
	else output("as much liquid grace as you");
	output(" can manage. The only thing between you and your target is the table’s central support and a layer or two of clothing. You easily circle past the former in order to deal with the latter, grabbing hold of a handy seam and tugging. Kiro’s [kiro.balls] ");
	if(kiro.ballDiameter() > 14) output("practically tear their way out of confinement. Few materials this side of the core are built to take the kind of strain the hermaphrodite had them under.");
	else output("roll out to greet you. They’re plump and rounded, pulsing pleasantly as if to say ‘hello.’");
	output("\n\nKiro gasps, but her legs open all the same. <i>“[pc.name], are you sure you wouldn’t rather be on your knees back at my ship?”</i> She’s trying to speak quietly so as not to draw too much attention to herself; most people may not be the prudes they were thousands of years ago, but public sex is still frowned upon. Throbbing gently, her balls sway in their velvety sack, communicating in no uncertain terms just how much Kiro wants you to tend to them.");
	if(kiro.ballDiameter() > 14) output(" As big as they are, it’s definitely a need. The poor girl just isn’t taking taking care of herself.");
	output("\n\nHer sheath is just about level with your nose, and there’s no disguising its musky, oddly masculine aroma. It hasn’t disgorged its phallic cargo just yet, but the supple flesh is pulsating gently with every accelerating beat of your companion’s heart. You can see the soft folds of her sensitive skin slowly expanding before your eyes. The scent of her long-hidden, anxious cock thickens in the table’s ill-ventilated confines with the engorgement of the alien pirate’s eager genitals, and you’ve got a front row seat.");
	output("\n\n<i>\"Last chance to back out,\”</i> Kiro whispers.");
	output("\n\nYou can see a blunt, rounded distention in her sheath, and it’s clear the time for backing out as long since passed. It’s time to lick your lips, open wide, and give your lover a treat. Nuzzling your cheek against her soft skin, you heft her [kiro.balls] in your hands, rolling the heavy, liquid-filled masses back and forth gently. An exquisitely pleased sigh finds it way down from somewhere high above. You smile and rub a little more firmly. Twisting your head, you nibble gently at the edges of Kiro’s sheath before pressing yourself wholly into it.");
	output("\n\nKiro’s thighs twitch on either side of you. She gasps in delight, and her tail thumps noisily against her seatcushion. <i>\"It’s coming!\”</i>");
	output("\n\nYou have just enough time to lick around the inside of her pheromone-laden, flesh tube before her cock makes its appearance, driving your [pc.tongue] back into your mouth with steady but uncompromising force. And why shouldn’t it? It’s a big, thick cock, and it <b>needs</b> to cum. Your mouth is merely the temple dedicated to its pleasure. You open wide, and the thick, warm length pours into you, still soft but growing firmer with every passing second, rolling across your tongue with its salty, tangy flavor, thickening in your mouth until it’s impossible not to feel the veins rising against your [pc.lips].");
	output("\n\nIt’s impossible to tell, increasingly full of cock as you are, but your hands feel subtly fuller than a few moments ago. You let your mouth hang open, [pc.tongue] flat as you let yourself become her sheath, and heft the weight, comparing. Her balls are heavier... but softer too, more... liquid. You gently squeeze and marvel at just how much give the fleshy orb has. Human biology may not produce cum entirely from its testes, but you’re holding proof of a kui-tan difference in your hands - a difference that’s getting heavier and squishier the longer you handle it. Kiro’s nuts have gone into overdrive. If you don’t empty them, you’re not sure she’ll be able to walk out of here later.");
	output("\n\nA gush of seed splatters off the back of your throat thanks to the efforts of your busily kneading hands, forcing you to swallow instinctively. It takes more than one to handle tide of slick pre-ejaculate, but the amount of lubrication gathered in your maw makes it that much easier for Kiro’s expanding boner to slip the rest of the way into your mouth. A ridge bumps past your [pc.lips], marking the halfway point on your journey to a satisfied Kiro. You keep on swallowing long after the pre is gone; it’s the only way to keep Kiro’s ever-expanding horse-cock on track.");
	output("\n\nShuddering, the lusty pirate slouches down to better to thrust her hips forward, cramming three inches of passion-inflated flesh down your esophagus before you can so much as gurgle in protest. Spittle foams around the corners of your mouth as you struggle with the tumescent, equine phallus, feeling it grow firmer, harder, and larger inside you, keeping yourself sealed to her sheath like a natural extension of it, or maybe you’re more like a toy, fucked tight up against your owner’s crotch.");
	output("\n\nClosing your eyes, you let yourself focus entirely on the sensation and scents of your situation: the subtle tang of her alien skin on your tongue, the warm heat radiating into your maw, and even the lurid scent that tickles at your nostrils as they’re nestled into her sheath. Kiro’s throat-exploring cockhead presses on the sides your esophagus as she reaches full mast, nearly two feet of breeding mast embedded inside you. You luxuriate in the sheer debauchery of it all, choosing to be the kui-tan’s cum dump simply because she needs it almost as much as you.");
	output("\n\nKiro casually throws a leg over your shoulder, but even she can’t hide the feverish trembling that ripples down her thigh, betraying her excitement. With your senses sharpened by your self-imposed blindness, you can hear her quietly whimpering and sighing. Sometimes she even moans in contentment. You can imagine the look on her face: ecstatic and half unaware of her surroundings, maybe panting gently as a waitress walks by unaware.");
	output("\n\nHollowing your cheeks, you manage to suckle weakly around her turgid obstruction, earning a quiver and heavy pulsation for your efforts. Though she’s too deep for you to get a taste of it, you feel enough warmth in your belly to realize she’s geysering pre like a fountain. Her [kiro.balls] have gotten so heavy in your hands that you’ve stopped trying to support them on your own. Her taut sack can bear to help you out a little bit. After all, you’re helping her. You work your fingers on her sloshing balls, feeling each squeeze mirrored by a pulsing bulge through Kiro’s cock that ultimate leaves your belly gurgling.");
	output("\n\nThe hardscrabble sound of Kiro’s twitching fingernails against the table signals that your appetizer of milked-out ejaculate is almost over, and the main course is on its way. Your [pc.lips] strain as her obscene girth rhythmically swells, momentarily filled with highly-compressed splooge. You can see the muscles under Kiro’s fur flexing with the effort of pumping out all the cum, nevermind the way your gut goes from feeling empty to thoroughly inseminated. Kiro pants so loudly that you can hear it over the pounding of your own oxygen-starved heartbeats.");
	output("\n\nSurely someone has to notice the way the kui-tan’s back is arched or the way her erect nipples jut through the fabric of her garments. Smiling around your mouthful of exploding cock, you work her shrinking balls, feeling them firm up with every gut-splattering explosion of seed. You let - no, encourage her to fill you with salty, alien cum, to bulge your [pc.belly] with the inhuman quantity of spooge. Increasingly, you feel like a cream-filled pastry whose baker got a little overenthusiastic.");
	output("\n\nYou slide away before she can do any damage, gurgling weakly as she plugs your throat behind her exiting phallus. She leaves a cheek-bulging blast of jizz in your mouth as a parting gift, then proceeds to issue forth a half dozen weaker blasts across your [pc.hair], [pc.face], and neck as she gradually goes limp, soaked in spit and cum. You sit there, gasping for breath, soaked in sex, and totally used. Licking the jism and residual sheath-musk off your lips, you reach up to the table to grab some napkins, content in the knowledge that you’ve brought so much pleasure to such a magnificent specimen.");
	pc.loadInMouth(kiro);
	processTime(8);
	pc.lust(25);
	kiro.orgasm();
	output("\n\nKiro looks a little unsteadily, then meets your gaze and asks, <i>\"Now what?\"</i>");
	pc.exhibitionism(1);
	kiroMenu();
}
