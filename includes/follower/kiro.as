public function kiroRecruited():Boolean
{
	return (flags["KIRO_RECRUITED"] == 1);
}
public function kiroIsCrew():Boolean
{
	return (flags["KIRO_ONBOARD"] == 1);
}
public function crewKiroBusy():Boolean
{
	return (flags["KIRO_DISABLED_MINUTES"] != undefined);
}
//Mitzi crew bonus and approach screen is clothing dependent:
public function kiroCrewBonus(btnSlot:int = 0, showBlurb:Boolean = true):String
{
	var buff:String = "";
	if(crewKiroBusy())
	{
		buff += "\n\nWhile Kiro is counted amongst your crew, she's too busy to be visited right now.";
		addDisabledButton(btnSlot,"Kiro","Kiro","Kiro's in no state to be interacted with right now. Check back later.");
		return (showBlurb ? buff : "");
	}
	var texts:Array = [];
	//<= 7 - smolballs. BehavedKiro.
	if(kiro.ballDiameter() <= 7)
	{
		texts = ["Kiro prowls around your ship for security flaws to tackle, keeping busy.","Kiro just finished eating a traditional kui-tan dish in the kitchen. The whole ship reeks of it.","Kiro's reading up on some of the latest Rush discoveries.","Kiro strolls back in with an armload of supplies. Most of the supplies are sexual in nature. Never change, Kiro.","Kiro passes by with an armload of soiled sheets for the wash. Messy girl!"];
		//GF only
		if(flags["KIRO_GF"] != undefined)
		{
			texts.push("Kiro squeezes your butt whenever she passes by you in the hallway, winking mischievously.");
			texts.push("Kiro sneaks up on you and plants a kiss on your cheek before vanishing down a corridor with a giggle.");
			texts.push("Kiro keeps herself busy helping out with the ship's maintenance, unwilling to risk her [pc.boyGirl]friend's safety for a moment.");
		}
	}
	//<= 14 - Big balls. Horny :3
	else if(kiro.ballDiameter() <= 14)
	{
		texts = ["You notice Kiro fidgeting more than normal - the cause is obvious when you see the bulge forming between her legs. The poor girl is starting to get pent up.","Kiro tries to help out around the ship, but she keeps popping open her codex's comms to answer messages from horny singles in her area.","Kiro keeps herself busy helping out, but any time you're in the area, she drops whatever she's doing to check you out. Somebody's horny!","Kiro lounges around, lazily paging through breedit's /r/RusherSluts board."];
		//GF
		if(flags["KIRO_GF"] != undefined)
		{
			texts.push("Kiro keeps 'accidentally' having wardrobe malfunctions that result in her flashing you her swelling nuts.");
			texts.push("Kiro likes to sneak up behind you and give you big hugs, her heavy, swelling balls pressing into you from behind.");
			texts.push("You catch Kiro in the middle of taking a 'nut-pic' to send your way. Instead of being ashamed, smiles and pulls down her top to flash the top deck too. Naughty girl.");
			texts.push("Kiro is actually cleaning up her room. It seems like having you as a [pc.boyGirl]friend is good motivation to start cleaning up after herself.");
			texts.push("Kiro admires a pair of your undies she put on her trophy wall. Yours are the only pair surrounded by heart stickers. When and where did she even get those?");
		}
	}
	//> 14: turbohorndog.
	else
	{
		texts = ["Kiro's not much good for anything with her balls as swollen as they are. She can't even sit down without spreading her legs so wide that the whole ship can see her package, not that her slinky dress ever did much to hide it.","Kiro lounges in her quarters, rubbing her nuts when she thinks nobody's looking - and sometimes when she thinks they are.","Kiro pops a boner the instant she sees you, or just about anyone else. The backed-up 'nuki really needs to let off some steam...","Kiro eats one-handed while browsing extreme extranet porn with the other, her cock more or less a permanent tent in her dress."];
		//GF
		if(flags["KIRO_GF"] != undefined)
		{
			texts.push("When Kiro's balls are this big, she's no good for anything except sending you love-dovey messages and the occassional unsolicited dick pic.");
			texts.push("Kiro's lips shine, and her lashes look longer than normal. The fact that she's wearing a bit of makeup shouldn't come as a surprise, given that her balls are swollen to an obscene level. Much bigger and she'll struggle to move...");
			texts.push("Kiro's balls are exceptionally swollen, a fact your girlfriend flaunts around you at every opportunity. Tease.");
		}
	}
	if(texts.length == 0) texts = ["AN ERROR IN KIROS CREW BLURB HAPPENED. NO TEXTS LOADED!"];
	buff = texts[rand(texts.length)];

	addButton(btnSlot,"Kiro",approachCrewKiro);
	
	return (showBlurb ? ("\n\n"+buff): "");
}

public function approachCrewKiro(back:Boolean = false):void
{
	clearOutput();
	showKiro();
	author("Fenoxo");
	//No special procs on "Back".
	if(back)
	{
		output("Kiro’s eyes twinkle. <i>“What now?”</i>");
		kiroCrewMenu();
		return;
	}
	//Full balls? Kiro'll drain 'em
	if(pc.hasStatusEffect("Blue Balls") && pc.hasCock())
	{
		fluffilyWhorishPawjobs();
		return;
	}
	//Orgy prompt!
	if((MailManager.isEntryUnlocked("kirofucknet") && flags["KIRO_ORGY_DATE"] == undefined) && pc.hasCock() && rand(4) == 0)
	{
		galLinkFuckMeetInvite();
		return;
	}

	if(kiro.ballDiameter() <= 7)
	{
		//BF approach
		if(flags["KIRO_GF"] != undefined)
		{
			output("Kiro’s face lights up at your approach. <i>“There you are, [pc.boyGirl]friend. Where have you been? Not lost in some ");
			if(rand(5) == 0) output("galotian’s cunt");
			else if(rand(4) == 0) output("myr’s plus-sized pussy");
			else if(rand(3) == 0) output("daynar’s eyes");
			else if(rand(2) == 0) output("leithan’s legs");
			else output("mad scientist's lair");
			output(" I hope!”</i> Pulling you into a hug, she gives you a peck on the cheek. <i>“What can I do for you, Captain?”</i> Her grin is as contagious as it is mischievous. <i>“Or to you?”</i>");
		}
		else
		{
			output("<i>“Hey there, Angel,”</i> Kiro says, smiling warmly as you approach. <i>“Back again already? Everybody needs a break now and again. Grab a drink out of the fridge, unless you’re planning to stay busy some other way...”</i>");
		}

	}
	else if(kiro.ballDiameter() <= 14)
	{
		output("<i>“Hello, Angel,”</i> Kiro throatily purrs as you approach. She shifts and twists, barely containing the poorly-smuggled cantaloupes below. <i>“Something you needed my help with?”</i>");
	}
	else
	{
		output("<i>“Welcome back,”</i> Kiro slowly drawls, obviously undressing you with her eyes as she does. One of her padded palms comes to rest on the small of your back, rubbing in slow circles as she admits, <i>“I’ve been saving up hoping that you’d want to help 'save' me again. I hope you’re ready for some fun....”</i>");
		output("\n\nThere’s no hiding the greatly swollen orbs dangling between her legs. Their fuzzy undersides are actually visible beneath the hem of her too-short dress.");
	}
	kiroCrewMenu();
}


public function kiroCrewMenu():void
{
	clearMenu();
	addButton(0,"Appearance",kiroAppearanceScreen,undefined,"Appearance","Take a look at the fluffy 'nuki.");
	addButton(1,"Talk",talkToKiro,undefined,"Talk","Sit down with Kiro for a talk.");
	if(pc.lust() >= 33) addButton(2,"Sex",kiroCrewSexApproach,undefined,"Sex","Kiro has always been a creature of obscene sexual appetite. Just ask, and she'll be down for almost anything.");
	else addDisabledButton(2,"Sex","Sex","Kiro might be, but you aren't aroused enough for sex right now.");

	addButton(14,"Back",crew);
}
public function kiroCrewSexMenu():void
{
	// Her balls are too damn big!
	if(kiro.ballDiameter() > 14) return kiroCrewSexMenuBigBalls();
	//Pussfuckin funs~
	if(pc.hasCock())
	{
		if(pc.cockThatFits(kiro.vaginalCapacity(0) + 200) >= 0)
		{
			if(kiro.vaginas[0].hymen) addButton(0,"Fuck Vag.",takeKirosVirginity,undefined,"Fuck Her Vagina","Kiro seems excessively focused on her dick. Why not share the loving with her vagina?");
			else addButton(0,"Fuck Vag.",repeatVagFuckKiro,undefined,"Fuck her Vagina","You took her virginity; might as well see if she’s still just as tight.");
		}
		else addDisabledButton(0,"Fuck Vag","Fuck Her Vagina","You don’t have an appropriately-sized member for such an action. You’d split her in half!");
	}
	else addDisabledButton(0,"Fuck Vag.","Fuck Her Vagina","You need a penis to do this.");

	//Riding her dick
	if(pc.hasVagina()) addButton(1,"Get Fucked",vaginaRouter,[catchVaginalFromKiro,kiro.cockVolume(0),0,0,true],"Get Fucked","Let her bend you over her bunk and slam that thick dick home.");
	else addDisabledButton(1,"Get Fucked","Get Fucked","You need a vagina to access this scene.");

	if(kiroRoughButtfucks() > 0) addButton(5,"GetButtfuck",roughButtfuckFromKiroGo,false,"Get Buttfucked","Ask Kiro for another rough, buttfuck with plenty of spanking.");
	else addDisabledButton(5,"GetButtfuck","Get Buttfucked","You haven’t unlocked this scene yet. You’ll probably have to get her kinda irritated at you for this...");

	//Milking Stuff
	if(pc.hasCock()) addButton(2,"2xMilker",kiroMilkerDoubleTimeBySavin,undefined,"Milker Doubletime","Strap into Kiro’s milker with her for a fun, cock-draining evening.");
	else addDisabledButton(2,"2xMilker","2xMilker","You need a penis to participate in this scene.");
	addButton(3,"Hand Milk",manualMilkingFromSavin,undefined,"Hand Milk","Hand milk Kiro, and " + (kiro.canLactate() ? "you don't mean the lactic kind!":"she doesn’t lactate..."));

	//PUSSY PUMPIN~
	if(pc.hasItemByClass(SukMastr))
	{
		if(kiroTrust() >= 66)
		{
			if(pc.hasCock() && !pc.hasVagina() && (pc.cockThatFits(kiro.vaginalCapacity(0) + 200) < 0 && pc.biggestCockLength() < 20)) addDisabledButton(4,"PussyPump","PussyPump","You need a penis of a specific size or a vagina (in the usual location) to deal with the consequences of pumping up Kiro’s pussy.");
			else if(pc.hasCock() && !pc.hasVagina() && (pc.cockThatFits(kiro.vaginalCapacity(0) + 200) >= 0 && pc.biggestCockLength() < 20) && kiroTrust() < 75) addDisabledButton(4,"PussyPump","PussyPump","Kiro doesn’t trust you enough for this yet.");
			else if(pc.hasGenitals()) addButton(4,"PussyPump",treatedPussPumps,undefined,"PussyPump","Give Kiro’s pussy a thorough pumping up with the SukMastr 2000 you bought. She could spare to give her feminine side a little extra attention.");
			else addDisabledButton(4,"PussyPump","PussyPump","You need a penis or vagina (in the usual location) to deal with the consequences of pumping up Kiro’s pussy.");
		}
		else addDisabledButton(4,"PussyPump","PussyPump","Kiro doesn’t trust you nearly enough for that.");
	}
	else addDisabledButton(4,"PussyPump","PussyPump","You need a valid device for pumping up Kiro’s pussy.");

	if(kiro.ballDiameter() > 7) addButton(6,"Relief BJ",giveKiroSomeRelief,undefined,"Relief BJ","Slink under the concealing surface above and give Kiro’s poor balls the release they so desperately need. Besides, you were a little hungry, weren’t you?");
	else addDisabledButton(6,"Relief BJ","Relief BJ","Kiro’s balls don’t look swollen enough to need the relief right now, though they are quite large.");

	addButton(10,"Threesome",inviteAFriendForCrewKiroPlays,undefined,"Threesome Invite","Invite a friend to play with you and Kiro...");

	if(flags["KIRO_ORGY_DATE"] != undefined && flags["KIRO_ORGY_DATE"] + 2 < days && pc.hasCock()) addButton(13,"Fuckmeet",galLinkFuckMeetInvite,true,"GalLink Fuckmeet","Go to a GalLink Fuckmeet with Kiro - it'll be an orgy full of herms.")
	addButton(14,"Back",leaveCrewKiroSexMenu);
	/* OG VERSION REF:
	
	clearMenu();
	
	addButton(5,"Invite",inviteAFriendForCrewKiroPlays,undefined,"Invite","Invite a friend to play with you and Kiro...");

	if(kiroRoughButtfucks() > 0) addButton(5,"GetButtfuck",roughButtfuckFromKiroGo,false,"Get Buttfucked","Ask Kiro for another rough, buttfuck with plenty of spanking.");
	else addDisabledButton(5,"GetButtfuck","Get Buttfucked","You haven’t unlocked this scene yet. You’ll probably have to get her kinda irritated at you for this...");
	//THREESOMES~
	addButton(6,"Invite",inviteAFriendForCrewKiroPlays,undefined,"Invite","Invite a friend to play with you and Kiro...");
	addButton(14,"Back",kiroMenu);
	*/
}

public function kiroCrewSexMenuBigBalls():void
{
	clearMenu();
	//Pussfuckin funs~
	if(pc.hasCock())
	{
		if(pc.cockThatFits(kiro.vaginalCapacity(0) + 200) >= 0)
		{
			if(kiro.vaginas[0].hymen) addButton(0,"Fuck Vag.",takeKirosVirginity,undefined,"Fuck Her Vagina","Kiro seems excessively focused on her dick. Why not share the loving with her vagina?");
			else addButton(0,"Fuck Vag.",repeatVagFuckKiro,undefined,"Fuck her Vagina","You took her virginity; might as well see if she’s still just as tight.");
		}
		else addDisabledButton(0,"Fuck Vag","Fuck Her Vagina","You don’t have an appropriately-sized member for such an action. You’d split her in half!");
	}
	else addDisabledButton(0,"Fuck Vag.","Fuck Her Vagina","You need a penis to do this.");
	if(pc.hasCock()) addButton(1,"Balljob",balljobFromKiro,undefined,"Balljob","Stick your cock between those oversized balls and squeeze out an orgasm - maybe for both of you.");
	else addDisabledButton(1,"Balljob","Balljob","You need a penis to get a balljob from Kiro.");
	addButton(2,"Catch Anal",bodyBloatingButtObliteratingBowelBasting,undefined,"Catch Anal","One way or another, Kiro’s going to fill you up.");

	addButton(10,"Threesome",inviteAFriendForCrewKiroPlays,undefined,"Threesome Invite","Invite a friend to play with you and Kiro...");
}

//Invite a Friend 
public function inviteAFriendForCrewKiroPlays():void
{
	clearOutput();
	showKiro();
	
	var nFriends:int = 0;
	
	//[Holiday?] [Saendra][Reaha] [Literally Every other NPC. Hey ZilGirl, come fly with us!]
	processTime(1);
	clearMenu();
	// Celise
	if(flags["RECRUITED_CELISE"] != undefined)
	{
		if(!celiseIsCrew()) addDisabledButton(nFriends,"Celise","Celise","Celise isn’t aboard your ship for this to work.");
		else if(flags["GIGACELISE"] == undefined) addDisabledButton(nFriends,"Celise","Celise","Celise should probably be in her giga-goo form for this.");
		else if(flags["KIRO_CELISE_3SOME_REJECT"] != undefined && kiroTrust() < 80) addDisabledButton(nFriends,"Celise","Celise","Kiro doesn’t trust you enough to try this.");
		else if(kiro.ballDiameter() <= 7) addDisabledButton(nFriends,"Celise","Celise","Kiro doesn’t look bloated enough. You should probably wait until she’s really backed up before trying this.");
		else addButton(nFriends,"Celise",celiseKiroFunSekritShit,undefined,"Celise","Invite Kiro to meet with Celise.");
		nFriends++;
	}
	// Saendra
	if(flags["FALL OF THE PHOENIX STATUS"] >= 1)
	{
		if(flags["SAEN MET AT THE BAR"] != undefined)
		{
			if(rooms[shipLocation].planet != "TAVROS STATION") addDisabledButton(nFriends,"Saendra","Saendra","Saendra isn’t anywhere near this location. You’d have to catch Kiro on Tavros Station to have Saendra within easy reach.");
			else if(pc.hasCock()) addButton(nFriends,"Saendra",inviteSaenForKiroFilling,undefined,"Saendra","Invite Saendra over for a ball-draining good time.");
			else addDisabledButton(nFriends,"Saendra","Saendra","This scene requires a penis to participate in.");
		}
		else addDisabledButton(nFriends,"Saendra","Locked","You don’t know Saendra well enough to invite her.");
		nFriends++;
	}
	if(flags["PAIGE_TALK_SELF"] >= 4 && flags["SEXED_PAIGE"] != undefined && (paigeIsCrew() || (getPlanetName().toLowerCase() == "tavros station" && (hours >= 17 || hours < 9))))
	{
		if(flags["PAIGE_KIRO_THREESOMES"] == undefined) addButton(nFriends,"Paige",paigeThreesomeIntro,undefined,"Paige","The Ausar yoga instructor, Paige, once told you that she considers Kiro to be her closest friend. Maybe you should ask Kiro if the name sounds familiar to her?");
		else addButton(nFriends,"Paige",paigeThreesomeIntro,undefined,"Paige","Nothing says good time like a Paige, Kiro, and Steele sandwich.");
	}
	else if(flags["PAIGE_TALK_SELF"] < 4 || flags["PAIGE_TALK_SELF"] == undefined) addDisabledButton(nFriends,"Locked","Locked","You don’t know the right person well enough for this.");
	else if(flags["SEXED_PAIGE"] == undefined) addDisabledButton(nFriends,"Paige","Paige","You need a deeper relationship with Paige for this.");
	else addDisabledButton(nFriends,"Paige","Paige","Paige needs to be on your crew, or you need to meet Kiro after 17:00 and before 9:00 in Tavros Station to pursue Paige.");
	nFriends++;

	if(nFriends > 0) output("A sly smile creeps up the side of your lips and blossoms into a full blown grin. You press a finger to the Tanuki’s small, black nose and tell her that you might need a minute to summon a friend for you both to play with.\n\nShe barks out an angry protest, gesturing broadly as if to remind you that she’s ready to go. <i>“They’d better be worth it, you cock-tease. We could be fucking right now...”</i> she complains, her half-hard shaft throbbing between her legs. <i>“You just get me so horny!”</i>\n\nYou tweak one of her round, fluffy ears and give her a wink. Just a minute, you promise.");
	else output("Unfortunately, you don’t know of any available friends to invite...");
	
	addButton(14,"Back",kiroCrewSexMenu);
}

public function leaveCrewKiroSexMenu():void
{
	clearOutput();
	showKiro(true);
	author("Fenoxo");
	output("<i>“Actually... I changed my mind,”</i> you say, heading for the door.");
	output("\n\nKiro cocks her head. <i>“Really? Fucking </i>REALLY<i>?”</i> She snorts. <i>“Real cunty move, Angel. Fine.”</i> She heaves on her clothes angrily.");
	kiroTrust(-10);
	clearMenu();
	addButton(0,"Next",approachCrewKiro,true);
}

public function kiroCrewSexApproach():void
{
	// Pending panty event
	if(!pc.hasKeyItem("Panties - Kiro's - Lacy, black, and crotchless."))
	{
		if(pc.hasStatusEffect("Kiro Panties Event Queue") || (kiroTrust() >= 75 && !kiro.vaginas[0].hymen))
		{
			kiroginityEpilogue(true);
			return;
		}
	}
	clearOutput();
	showKiro();
	author("Fenoxo");
	
	output("As soon as you make the suggestion, Kiro leads you by the hand back to her quarters. At the door, she pulls you close, holding you so close that her [kiro.chest] press hard against your " + (pc.biggestTitSize() >= 1 ? "own":"your chest") + ", the growing bulge beneath her dress grinding itself against you. <i>“I thought you’d never ask, Angel,”</i> she says with a wink. <i>“C’mon in!”</i>");
	output("\n\nThe tanuki is naked by the time she’s three steps past the threshhold.");
	if(!pc.isCrotchExposed() && !pc.isChestExposed() && !pc.isAssExposed()) output(" You shed your garments in similar fashion, excitement mounting by the second.");
	else output(" You smirk knowingly at your own, pre-naked state. Today, it saves you time and affords you the chance to watch Kiro stripping down.");
	output("\n\n");
	showImage("SukebeKiroPoV");
	output("She winks back at you, mantling up onto a large, miraculously unstained cushion. Her horse-cock hangs out, proudly erect and well past the point of beginning to leak. <i>“Let’s have some fun,”</i> Kiro moans, giving herself a small stroke.");

	//[OPTIONS BITCH]
	kiroCrewSexMenu();
}

public function talkToKiro():void
{
	clearOutput();
	showKiro();
	author("Fenoxo");
	output("What do you want to talk about? Kiro is a receptive audience.");
	kiroCrewTalkMenu();
}
public function kiroCrewTalkMenu():void
{
	clearMenu();
	addButton(0,"Doctor Po",doctorPoHeadpats,undefined,"Doctor Po","Ask Kiro how she feels about Illustria Po now that all that unpleasantness is in the past.");
	addButton(1,"Po's Mods",askKiroAboutPosMods,undefined,"Po's Mods","Ask Kiro how she feels about the mods Doctor Po managed to make to her body before you could rescue her.");
	addButton(2,"Black Void",blackVoidTalkWithKiro,undefined,"Black Void","Ask Kiro about her feelings on the infamous pirate group known as the Black Void.");
	addButton(3,"FavBootyCall",kiroFavoriteBootyCall,undefined,"Favorite Booty Call","You know Kiro gets around. Sit down with a drink and ask her if she has any she'd like to tell you about.");
	if(flags["MET_URBOLG"] != undefined) addButton(4,"Zheng Shi",kiroZhengShiTalk,undefined,"Zheng Shi","Ask Kiro about Zheng Shi, now that you've been there.");
	else addDisabledButton(4,"Locked","Locked","This conversation requires you to visit the location of the fourth SteeleTech probe.");
	addButton(14,"Back",approachCrewKiro,true);
}

//Doctor Po
public function doctorPoHeadpats():void
{
	clearOutput();
	showKiro();
	author("Fenoxo");

	//Kiro killed
	if(flags["KQ_PO_DEAD"] == 2)
	{
		output("You ask Kiro how she feels about Doctor Po, now that she’s had some time away.");
		output("\n\n<i>“[pc.name]...”</i> Kiro slowly responds. <i>“I don’t. Or at least, I try not to.”</i> Her tail bristles. <i>“I’ve sometimes done things that cost people their lives, but never so directly. Never quite so... personally.”</i> Stepping away from you, Kiro places a paw over her forehead and huffs. <i>“She deserved it. That much I’m sure of.”</i> Her other hand balls into a fist, shaking slightly. <i>“That woman - no, that thing! She, it, whatever... they’re the reason the galaxy is so broken. People like her. People like her clients. I hate that I was the one to kill her, but would I do it again?”</i>");
		output("\n\nSilence falls during the longest, most pregnant pause of your life.");
		output("\n\n<i>“Fuck yes, I would.”</i> Kiro puffs out her chest" + (kiro.biggestTitSize() > 11 ? ", seemingly unaware of how the augmented mounds jostle against each other for what feels like a minute solid":"") + ". <i>“A lifetime in some jackbooted thug’s prison is preferable to being blanked into a mind-wiped slave." + (kiro.biggestTitSize() > 11 ? " I don’t care how much extra attention these boobs get.":"") + " By doing that... eroding my own humanity, heh, I saved dozens of other people from her clutches. You heard her numbering scheme. I was supposed to be 65. That means she’s brainfucked at least 64 other people into objects, maybe more if she didn’t start counting with her prototypes.”</i> Kiro viciously chops the air. <i>“I ended that. I did what the rest of the galaxy was afraid to do. I did something awful and made the galaxy a better place for it.”</i>");
		output("\n\nYou give her shoulder a friendly squeeze, mouthing, <i>“It’s okay,”</i> and the tanuki deflates a little. Her expression softens to a morose stare, and she wipes a hint of moisture from the corner of her eye.");
		output("\n\n<i>“Let’s talk about some other shit. Hot broads or big scores or why the fuck I’m a pirate in the first place. Just not that garbage fire bimbo-bot.”</i>");
	}
	//PC killed
	else if(flags["KQ_PO_DEAD"] == 1)
	{
		output("You ask Kiro how she feels about Doctor Po, now that all that unpleasantness is over with.");
		output("\n\nKiro smirks knowingly. <i>“Are you really asking how I felt about that mind-jacking trash can? Or are you fishing around to see if I’m okay with how efficiently you put an end to her little schemes?”</i> She puts a hand on her hip and stares intently in your direction.");
		output("\n\nYou spend a minute contemplating how to answer before simply shrugging. <i>“Which one would you rather talk about?”</i>");
		output("\n\n<i>“Oh, you offing her for sure,”</i> the kui-tan snaps back, wrapping her arm around your shoulders. <i>“I know it had to be hard, but trust me, you did the right thing.”</i> She squeezes you closer, rubbing your back with her tail. <i>“That woman broke more than sixty people into walking objects. People like her and her clients are a cancer on the galaxy - they’re the reason this universe is so broken. The reason why millions starve in gutters while fat-cat billionaires kidnap and reprogram any pretty girl they like, feasting on credits like gluttonous parasites. Po didn’t just live in that system, she perpetuated in it. She reveled in it. And you, you glorious bastard, you finally put an end to her delusions of grandeur.”</i> Kiro spits on the deck. <i>“Good riddance.”</i>");
		output("\n\nYou nod along with her, cheered up both by her faith in you and your actions, but now seems like a good time to shift topic.");
	}
	//PC defeated
	else if(flags["KQ_BUY_OFFER"] == undefined)
	{
		output("You ask Kiro how she feels about Doctor Po now that she’s been liberated and the mad doctor got knocked down a few pegs.");
		output("\n\nKiro’s face assumes a cruel scowl. <i>“I think she needed worse than that. I think we should’ve killed her. You, me, both - whatever. Somebody should’ve had their hand on a gun, pointed it at smug, shit-eating face, and pulled the trigger. A woman like that, even if we could find a reason to arrest her... she’d be out of prison in a year. She’s too well connected.”</i> She grabs your shoulder. <i>“You realize she’s going to be gunning for you now, right? Her and her connections. If they get a chance to inconvenience you in any way, or worse, bring you down to their level, they will. They’ll do it in a heartbeat. You need to be careful.”</i>");
		output("\n\nThat’s... a good point. You nod soberly.");
		output("\n\n<i>“That isn’t to say that I’m not proud of you. What you did for me... fuck, Angel. You walked through a heavily defended freighter like it was paper. You fucked and fought your way through an army brain-fucked bimbos to dethrone the queen bitch herself.”</i> Kiro smiles broadly, and her tail curls close, almost protectively. <i>“That you did all that, and went so far, and then had the ethical character to hold yourself back from murdering the cunt where she stood.... I’m still impressed, [pc.name]. You’re a better " + (flags["KIRO_GF"] != undefined ? "[pc.boyGirl]":"") + "friend than a scumbag like me probably deserves, you know that, right?”</i>");
		output("\n\nYou scratch the back of your head while you try to figure out how you want to answer that.");
		output("\n\n<i>“Oh don’t feel like you have to answer that loaded powder-banger of a question.”</i> Kiro sweeps you fully into a hug, holding you tight. <i>“You watched out for me when nobody else would. Now it’s my turn to watch out for you.”</i>");
	}
	//PC bought Kiro
	else
	{
		output("You ask Kiro how she feels about Po now that you’ve both put the events behind you.");
		output("\n\n<i>“Po?”</i> Kiro growls. <i>“You want to know what I think about that mind-fucking trash can of a woman?”</i> She spits on the deck. <i>“I think you shouldn’t have paid her off. You should’ve beat her into the deck and offed the bitch for the trouble, but I understand why you didn’t. Still...”</i> Taking a deep breath, the kui-tan unleashes a heaving sigh. <i>“People like her - and her clients - are the reason we live in such a broken galaxy. They feast on thousand credit chits like snack food and mindwipe pretty street girls - or boys - for the crime of being too attractive. Sure, Po made excuses about how she only brain-raped filthy, criminal pirates like myself, but she didn’t exactly provide any proof to back up that statement.”</i> She snorts. <i>“So what if she did, too. Prison? Sure, I probably deserve at least a dozen years in there for some of the shit I’ve pulled, but nobody deserves to have their desires, their wants, and their dreams rewritten... unless they want to, I guess." + (!pc.isTreated() ? " But who would want something that fucked up?":" I’ll never understand taking things like the Treatment myself, even if people like you did it and came out more or less okay.") + "”</i> She shakes her head.");
		output("\n\n<i>“Heavy stuff,”</i> you blithely comment.");
		output("\n\n<i>“Yeah,”</i> the kui-tan answers, stepping a little closer. Her tail circles around behind you to wrap its way up your back, pulling you into a hug. <i>“I’m still proud of you, Angel. You walked through an army of taint-maddened fuck-bots to get to me and kept your cool well enough to barter through a risky situation.”</i> She leans closer, planting a kiss on your cheek. <i>“Thank you for that.”</i> Stretching up to your ear, she whispers, <i>“And if you ever get the chance, kill the bitch next time, got it?”</i>");
		output("\n\nYou’ll think about it.");
	}
	processTime(5);
	if(kiroTrust() < 100) kiroTrust(5);
	clearMenu();
	addButton(0,"Next",talkToKiro);
}

//Po’s Mods
public function askKiroAboutPosMods():void
{
	clearOutput();
	showKiro();
	author("Fenoxo");
	output("<i>“How are the mods Doc. Po gave you holding up?”</i> you ask. <i>“No lingering desire to kneel and chant, ‘obedience is pleasure,’ is there?”</i>");
	output("\n\nLaughing, Kiro shakes her head. <i>“If I ever do that, do me a favor and blow my brains out with a plasma bolt. No, I’m still me, but I do feel flashes of her leftover programming from time to time, like there’s a little bit of my brain that’s still bought into her bullshit.”</i> She waves dismissively. <i>“It’s almost all bedroom related, like a little bit of a submission fetish that’s not quite appealing enough to indulge.”</i> A shrug works through her shoulders. <i>“Sometimes, if I’m somewhere public, I’ll get the urge to lift up my dress and flash my cock, or bend over and let it ride up reeeeeaally high. Put myself on display, ya know?”</i>");
	output("\n\nYou nod.");
	output("\n\n<i>“You know I’m anything but a prude about showing off my body, but exhibitionism is definitely more tempting now. Getting ogled over how hot I am, especially if I’m naked? Yeah, that bit stuck around a little.”</i> Kiro shifts, adjusting a cylindrical distention in her dress. <i>“But that doesn’t mean I want to go strip on cam for a handful of credits. I won’t give the cyber-bitch the satisfaction of changing my behaviors like that." + (flags["KIRO_MET_KALLY"] == undefined ? " I’ll just enjoy the extra thrill when I take a slut bareback in a bar.":" I’ll just enjoy the extra thrill of Sylvie sneaking glances at me and Kally when we fool around in her baths.") + "”</i>");
	//bimbo
	if(pc.isBimbo()) output("\n\nYou clap. <i>“That sounds kinda awesome. Like, fuck Po, but she gave you a real treasure there!”</i>");
	//bro
	else if(pc.isBro()) output("\n\n<i>“Nice,”</i> you observe with an approving grunt.");
	//Nice
	else if(pc.isNice()) output("\n\nYou observe, <i>“That doesn’t sound too bad, all things considered.”</i>");
	//Mischievous
	else if(pc.isMischievous()) output("\n\nYou grin. <i>“You know you can go nude on the ship if you want. Sometimes a curse can seem like a blessing.”</i>");
	//Hard
	else output("\n\nYou shrug. <i>“Some curses can be blessings in disguise.”</i>");
	//merge
	output("\n\nNodding along, the tanuki admits, <i>“Yeah, it isn’t entirely bad. That doesn’t mean I have to be thrilled about it.”</i> She glances down at her prick once more, now fully hard through her dress. <i>“Though she did do me one giant favor.”</i>");
	output("\n\n<i>“Oh?”</i> You ask her what it was.");
	output("\n\n<i>“I orgasm so easily now,”</i> Kiro admits. <i>“I’m like fucking a virgin about it. No matter how many girls I plow into a spunk-drenched messes, I still wind up close to the edge from a stroke or a pretty smile or a filthy-minded whore’s praise.”</i> She shudders, even more erect now. <i>“And my refractory period is even shorter than it used to be. I can basically bang for days if I want to expend the effort, not that there’s many out there that can keep up with me" + ((pc.libido() >= 75 || pc.isBimbo() || pc.isBro()) ? ", aside from maybe you":"") + ".”</i>");
	output("\n\n<i>“Sounds nice.”</i>");
	output("\n\nKiro giggles and slaps your arm roughly. <i>“It is, but fuck, don’t sound so excited about it. That’s my job!”</i> She sticks her tongue out, then continues on, <i>“It means no more getting stuck with balls swollen up to the size of leithans, but it also means that I wind up leaving two or three creampies before my partner even manages to cum once... and that can make for a hell of a mess.”</i> She gestures to a thick stack of condoms behind her. <i>“I’m being bled dry by my condom bill, especially now that solo piracy is off the menu. Surveying rare minerals and alien tech is way harder than emptying out a luxury yacht ever was.”</i>");
	output("\n\n<i>“Anything else?”</i> you hazard.");
	//No boobgrow
	if(kiro.biggestTitSize() == 11 && !kiro.canLactate())
	{
		output("\n\n<i>“Nah, that’s it,”</i> Kiro reports. <i>“Even went to the doctor and got a clean bill of health, aside from a little bit more genetic taint than I used to have. Nothing serious.”</i>");
		processTime(7);
		clearMenu();
		addButton(0,"Next",talkToKiro);
		return;
	}
	//Milky, no boobgrow:
	else if(kiro.biggestTitSize() == 11)
	{
		output("\n\n<i>“You got the messages from Po,”</i> Kiro grouses. <i>“You know I leak milk like a cow-girl if I’m not careful.”</i> She peels down the front of her dress to expose a nipple and gives it a small squeeze. Creamy white issues out in a dozen forking streams, making your ship smell like a dairy. <i>“It’s annoying when it happens by accident. It wouldn’t be that big a deal I was some kind of preggophile or had a huge lactation fetish.”</i> She tucks her boob away, but not before leaving three wet dots on the front of her dress. <i>“Could be worse. Getting to dodge all the normal milk-mom stuff is gonna come in handy if I ever want to have kids after the rush.”</i>");
	}
	//Med Boobgrow:
	else if(kiro.biggestTitSize() < 32)
	{
		output("\n\n<i>“Do you really need me to tell you that my tits are bigger, [pc.name]?”</i> The former pirate peels down the top of her dress to show off her nipples in their entirety. The firm up immediately, and upon seeing how you’re staring, Kiro reaches down to give her nipple a squeeze, spraying you with a half-dozen forking streams of creamy, delicious milk. <i>“And milkier, obviously. You saw Po’s message. I could probably retire with a breastpump on my tits and a smile on my face if I ever gave up on living my life and decided to become some kind of cow.”</i> She bounces the exposed, leaking mammary a few times to shake off the drops, then gingerly tucks it back into her dress. A wet patch appears almost immediately. <i>“Could be worse. Lactating could hurt instead of feeling good enough to give me a boner.”</i>");
	}
	//Large boobgrow
	else
	{
		output("\n\n<i>“Really, [pc.name]?”</i> The former pirate raises an eyebrow high. <i>“You didn’t notice these... mounds?”</i> She peels her dress down, and down... and further down still, wrapping it around her waist to fully expose the pornstar-grade pillows she’s carrying. When her hand brushes by a nipple, it leaks almost immediately, dribbling creamy milk onto the deck. <i>“Oh yeah, you noticed them.”</i> Stepping closer, the fiery ‘nuki doesn’t stop until her tits are smushed up against ");
		if(pc.tallness < 5*12) output("your face");
		else if(pc.tallness < 6*12) 
		{
			if(pc.biggestTitSize() >= 1) output("your own");
			else output("your chest");
		}
		else output("your [pc.belly]");
		output(". You can feel the warm, wet patches where her firm nips insistently leak against you.");
		output("\n\n<i>“You’re such a fucking tit-slut, [pc.name],”</i> Kiro purrs, squeezing down on the sides of her chest to push her cleavage even higher. <i>“She gave me huge, leaky, udders, Angel.”</i> Kiro licks her lips as she talks, running her fluffy fingertips across the curvy expanse. <i>“And milk that never runs out. And made it so milking it out feels almost as good as sex.”</i> She leans closer, not quite able to whisper in your ear because of the sheer voluminousness of the bosom between you, but she tries anyway, <i>“And if I use a pump... I can cum from it. Hands free.”</i> She steps back, regretfully replacing her clothing. <i>“Could be worse. They could hurt my back, or swell up if I forgot to milk myself. It pains me to admit that the cyber-bitch did good work where my body is concerned.”</i>");
	}
	//Merge
	//No more
	if(kiro.lipMod == 1)
	{
		output("\n\n<i>“You’re right. It could be. You could be stuck on a horny Rusher’s crew.”</i>");
		output("\n\nSquirming as her cock rockets right back up the front of dress, Kiro says, <i>“Mmm, and then what would I do with myself? Probably try to fuck my Captain every chance I got </i>and<i> sample all the local delicacies when [pc.heShe]’s too busy for a bang.”</i>");
	}
	//Lips
	else
	{
		output("\n\n<i>“You’re right. It could be. You could have even more kissable lips.”</i>");
		output("\n\nThrowing her hand up in front of her mouth, Kiro moans, <i>“Fuck I was hoping nobody noticed.”</i> She lets you pull her arm down, smiling shyly when she sees the affectionate expression on your face. <i>“These are blowjob lips, [pc.name]. The kind bimbosluts get to tempt boys and girls like me into rutting their face, balls-deep.”</i>");
		output("\n\n<i>“And you don’t want them?”</i>");
		output("\n\n<i>“Fuck no, I don’t!”</i> Kiro grouses. <i>“It’s hard enough getting all the chauvinists in this galaxy to listen to you when you’re a girl... or close enough. Now? I look in the mirror and I pop a boner. I wake up with my dick bumping my chin and lose twenty minutes sucking myself off before I can get out of bed.”</i> She rubs her fingers around her sluttified maw and shudders slightly. <i>“And... they’re more sensitive too. Kissing is... incredible - but I " + (silly ? "never asked for this":"don’t want you to think I wanted this. Far from it") + "! I’m just tolerating them until I have the downtime to get rid of them.”</i>");
		output("\n\nYou wince. <i>“Sorry it took me so long. Should I avoid kissing you then?”</i>");
		output("\n\n<i>“<b>No!</b>”</i> Kiro grabs you by the shoulders and shakes you. <i>“If I’m going to be saddled with these... caterpillars on my face, I’m damn sure gonna wring every bit of enjoyment out of them that I can. If anything, you should kiss me more. Really work give these pouty pillows a workout! Make the best of something bad, right?”</i> She doesn’t sound entirely convinced, especially now that she’s sucking on her lower lip.");
		output("\n\nMaybe it’s time to talk about something else...");
	}
	processTime(10);
	pc.lust(3);
	clearMenu();
	addButton(0,"Next",talkToKiro);
}

//Black Void? - get opinions on black void
public function blackVoidTalkWithKiro():void
{
	clearOutput();
	showKiro();
	author("Fenoxo");
	output("Since Kiro is a pirate, she probably knows something about the infamous Black Void, one of the largest pirate groups in the galaxy with one of the worst reputations.");
	output("\n\n<i>“What? You think just because I’m a pirate, I’m gonna know intimate details about other pirates?”</i> Leaning close, the outlaw kui-tan jabs a finger against your chest. <i>“Everybody’s heard of the ‘Void, or knows that they’re one of the vilest, scum-sucking groups you can run into on the fringe!”</i> Her feigned scowl brightens to a cocksure smirk. <i>“Of course, I guess I do know a little bit extra, not because I’m a pirate though.”</i>");
	output("\n\nYou lean closer. <i>“Why then?”</i>");
	output("\n\n<i>“Because I’m a kui-tan. Grew up in kui-tan controlled space, and the ‘Void... they’re thick as flies around some of our more remote colonies. It seems like we couldn’t go a week without hearing about the latest atrocity on the news - medicines stolen, villages burned, colleges razed to the ground with the students abducted for slavery or stars-know-what.”</i> Kiro may be looking at you, but her eyes are a thousand miles away. <i>“You name, they’ve done it. Once, they wiped out a planet - unintentionally, perhaps, but they did it.”</i>");
	output("\n\n<i>“A whole planet?”</i>");
	output("\n\nKiro curls her tail into her lap, petting it slowly. <i>“Yeah. A whole mining colony. Of course, the world was a hellhole. Terrans and ausars wouldn’t touch it. We did, though. Plunked down an enormous hardlight generator and capital ship-class air purification system. Built a whole city in a bubble, and it fucking worked like gangbusters. We were pulling enough Oxonium out of that rock to drop the prices across the entire galaxy. All gone like that.”</i> She snaps her fingers.");
	output("\n\nListening attentively, you ask what happened to it.");
	output("\n\n<i>“Black Void showed up one day. We never really understood why. We didn’t stockpile a ton of ore there - it got shipped off for refining on a more developed planet.”</i> Kiro shrugs. <i>“All we know are they cracked our hardlight shield from orbit - the one were using to keep the area habitable - and scoured what was left after most of the inhabitants were already dead.”</i> She pauses. <i>“My theory is that they wanted the hardlight shield and atmosphere systems for themselves, to set up a secret base on some other planet that nobody would ever think to check. Making off with a pile of Oxonium was likely a secondary benefit.”</i>");
	output("\n\n<i>“Cruel,”</i> you observe.");
	output("\n\n<i>“Yeah, that’s one word you could call them.”</i> Kiro shakes her head, then brushes a chocolate lock out of her eyes. <i>“They give pirates a bad name by every possible definition. A lot of us have scruples, Angel. We only go after targets that deserve it - or that can afford to take an ‘L’ on their cargo every now again. Megacorps and the mega rich - no offense. The Void? They’ll fuck anybody for anything. A ship could be hauling nothing and still get jumped. They’d sell the crew into slavery, the ship for scrap, and probably file an insurance claim on behalf ot eh missing captain while they’re at it. They’re bad news, and I’ll be damned but that isn’t even the worst part.”</i>");
	output("\n\nWhat could be worse? <i>“What?”</i>");
	output("\n\nKiro says, <i>“The worst part is how goddamned... </i>corporate<i> they are about everything.”</i> She snorts. <i>“Pirate crews are supposed to be about mutual cooperation and support - a team coming together to accomplish a common goal and divvying up the rewards in fair, equal shares. The Void’s different. They have ranks and commanders, not just a captain or team leader. Getting in requires an application of sorts.”</i> She waves dismissively. <i>“And I may not have that much insight into their inner workings, but I’d bet dollars to " + (rand(2) == 0 ? "juicy leithan donuts":"dullahans") + " that they generate a considerable amount of paperwork. Considerable... paperwork.”</i> The words hang in the air like a ghastly curse.");
	output("\n\n<i>“And that’s the worst part of them?”</i> you incredulously ask.");
	output("\n\n<i>“Well...”</i> Kiro lamely folds her hands into her lap. <i>“It is to me, [pc.name]. I got into the pirate game so I didn’t have to follow the laws of ‘polite society.’ I look at the universe and I see it rotting from the inside, most people so busy struggling to put food on their plate that they’ll gladly work themselves to death for their next meal. Anybody not firmly slotted in as a cog in the machine is too busy making it harder on those that are to fix anything, because they’ll get a bigger bonus if their indentured servants don’t cost as much in safety equipment or produce 1.35% more handwoven spinarran silk.”</i> She thumps her fist on a table. <i>“The whole system’s so broken that fucking with the top of it felt <b>good</b>, [pc.name]... and maybe even necessary.”</i>");
	output("\n\nYou thank her for sharing so much.");
	output("\n\n<i>“No problem, " + (flags["KIRO_GF"] != undefined ? "lover":"babe") + ",”</i> Kiro says, stroking your chin fondly. <i>“Hopefully you can secure your claim on your company. SteeleTech... they’re one of better ones, as much as any company can be. I’d hate to have to punch you in the nose after all of this.”</i>");
	output("\n\nYou’d hate that too.");
	processTime(12);
	clearMenu();
	addButton(0,"Next",talkToKiro);
}
//Zheng Shi
public function kiroZhengShiTalk():void
{
	clearOutput();
	showKiro();
	author("Fenoxo");
	output("You ask Kiro what she knows about Zheng Shi.");
	//Stole sidewinder
	if(pirateResearchVesselStolen())
	{
		output("<i>“Zheng Shi?”</i> Kiro’s smile turns playful. <i>“You mean the pirate base " + (flags["KIRO_HELPED_ZHENG"] != undefined ? "I helped you sneak into":"I could’ve helped you sneak into") + "? The one with the one-of-a-kind prototype ship that four or five decent-sized gangs actually came together to work on? The one that you stole for yourself" + (shits["SHIP"] is Sidewinder ? " that we’re standing inside of right now?":" and tossed in a hangar somewhere?") + " That pirate base?”</i>");
		output("\n\nYou scratch your neck nervously. <i>“Uh... yeah. You aren’t mad about that, are you?”</i>");
		output("\n\nKiro chortles. <i>“Mad? Angel, you pulled off one of the greatest pirate heists of all time. I’m fucking <b>proud</b> of you.”</i> She claps you on the back repeatedly, hard enough " + (pc.defense() >= 5 ? "that it would sting if you weren’t so armored":"to sting") + ". <i>“Besides, they deserved it for piling all their booty together in a single location. Not very smart. You were there for some kind of probe, right? Maybe if they hadn’t of stored it in their one-of-a-kind prototype, you would’ve found what you wanted and waltzed out without bothering it. Instead they lost almost everything. Bet it was the Star Vipers’ idea to keep it in there. Those venomous bitches think they’re smarter than the rest of the galaxy, but they’re really just sneaky and mean, and more sneaky than mean.”</i>");
	}
	//Didnt
	else
	{
		output("<i>“Zheng Shi?”</i> Kiro’s smile turns playful. <i>“You mean the pirate base " + (flags["KIRO_HELPED_ZHENG"] != undefined ? "I helped you sneak into":"I could’ve helped you sneak into") + "? The one with five different gangs collaborating to build a one-of-a-kind ship for a big job? The one you breezed onto as a solo act without a problem?”</i>");
		output("\n\nYou scratch your neck nervously. <i>“Uh... yeah. You aren’t mad about that, are you?”</i>");
		output("\n\nWaving dismissively, Kiro says, <i>“Nah. Don’t get me wrong, their security is lax by design. Accepting solo acts in gives them chances to recruit, trade, or acquire intel they might not otherwise come across. In your case, that worked to your favor. " + (flags["SHOCK_HOPPER_DEFEATED"] != undefined ? "You got to sneak right into the heart of their operation and secure your prize.":"You got to come and go as you pleased... though I guess you haven’t found what you were looking for yet. Maybe you’re due for another visit back.") + " You run into any Star Vipers on your trip? They’re the worst in the whole damn station, mark my words. Those venomous bitches think they’re the top of the food pyramid, but if you ask me they’re basically just a pack of galotians in scaly costumes.”</i>");
	}
	//Merge
	//Met slavebreakers or the overseer
	if(flags["MET_SLAVEBREAKERS"] != undefined || maikeEncountered()) output("\n\nYou nod. <i>“A pretty bad crew.”</i>");
	//Didnt meet them
	else output("\n\nYou shake your head. <i>“Not yet.”</i>");
	//merge
	output("\n\n<i>“The Corona Lords are the next turds on my Zheng Shi shit list.”</i> Kiro pauses to take a sip from a pocket flask, gasping with delight at the taste of her beverage. <i>“Buncha sun-sucking nutters if you ask me. They like to lurk close enough to stars to hide from most sensors, but their stupid theme doesn’t end there. They go nuts for flamethrowers, plasma weapons - anything that seems hot, and the hotter the better. It’s practically a fire cult at this point. Bet they’d snort thermite if you dared them.”</i> Her ears perk up as she recalls something else. <i>“Oh, and while I’ve never met the bitch, rumor is that they’ve got some kind of queen breeder tucked away somewhere on the station - and that she birthed damn near half their numbers, like some sorta gold myr queen.”</i>");
	output("\n\nThat’s impressive, even in a galaxy filled with fertility enhancers.");
	output("\n\n<i>“That leaves... the Jumpers.”</i> Kiro licks her lips, distracted by some inner thought. <i>“They’re... a handful. Not really good people but not super bad either. Have a real bad habit of getting into cheap, dirty sex-mods like Throbb, Gush, or Soak. Mostly Throbb given how prick and musk-fixated they can get.”</i> Her nostrils flare a little. <i>“See they’re almost all tweaked out hermaphrodites in airtight catsuits, so when they get naked... it’s almost as bad as being on New Texas in breeding season. Catch one in the wrong mood and she’ll chase you across a star system for a chance at your ass.”</i>");
	output("\n\nYou ask Kiro if she’s speaking from personal experience.");
	output("\n\n<i>“I’d be lying if I told you I never fucked one. I didn’t get forced into it or anything, though. It’s just easy to get worked up when you’re beating the pants off three horny, sweaty laquines in a game of strip-poker.”</i> Kiro fans herself, her prick visibly present through the fabric of her dress. <i>“Got some good intel out of them by the time all was said and done, though. Turns out the gang leader got herself seduced by some clever little twink, and the twerp’s been pulling her strings ever since. The gang’s putting up with it for now, but if the situation sours, I could see a mutiny happening in a hurry.”</i>");
	output("\n\n" + (flags["SHOCK_HOPPER_DEFEATED"] != undefined ? "You tell her the story of how you took down the pair - and how the L.D.C. has likely lost whatever authority he had as a result.":"You thank her for the information and make a note to keep your eyes peeled for small-statured laquines on the station.") + " <i>“There’s still some other gangs, right?”</i>");
	processTime(6);
	clearMenu();
	addButton(0,"Next",kiroZhengTalk2);
}
public function kiroZhengTalk2():void
{
	clearOutput();
	showKiro();
	author("Fenoxo");
	output("<i>“Yeah there’s more gangs. I just wanted to run down the worst of the bunch first, in case you had to go somewhere,”</i> Kiro says, leaning back with a smile. <i>“Next up would be the Cyber Punks. As the name might imply, they specialize in cybernetic augmentation and high tech jobs... which means I didn’t cross paths with them all that much. They’re in charge of the station security for the most part. A bit too orderly for my tastes, but I suppose that’s why I never got to run a space station.”</i> She glances at you sidelong, like she’s about to share a secret. <i>“I did get to hear about what they do with people that piss them off.”</i>");
	output("\n\n");
	if(flags["SECOP_SLIT_SLUTTINGS"] != undefined || flags["SECOP_WALLSLUTTINGS"] != undefined || flags["SECOP_TAURSLUTTINGS"] != undefined) output("You have a pretty good idea. ");
	output("<i>“What’s that?”</i>");
	output("\n\n<i>“Brainwash them.”</i> Kiro shivers at the memory of being in Doctor Po’s clutches. <i>“Just like that illustria bitch tried to do to me, but the fast and dirty version. See, they’ve got these virtual reality visors they can snap onto your face that tap straight into your brain. They can make you see and feel </i>anything<i> with one of those on, and if they want to hit you with some really hardcore stuff, there’s nothing you can do about it once you’re in there.”</i> She pauses. <i>“If you’re lucky, they’ll just use them to pacify you long enough to drag you out of the way.”</i>");
	output("\n\n<i>“Doesn’t sound very friendly,”</i> you observe.");
	output("\n\n<i>“Not at all. You want friendly? Go find some of Rat’s Raiders. They’ll greet you like old friends while they empty your pockets and maybe try to sweet talk their way into your pants while they’re at it. Not that unusual for pirates, except you almost always find them in groups.”</i> Kiro crosses her arms in annoyance. <i>“If you can’t handle yourself in a solo scrap, you probably shouldn’t be a pirate.”</i>");
	output("\n\nYou ask if she knows why they stay in groups.");
	output("\n\n<i>“Yeah. They’re Rodenians... which means they have certain... vulnerabilities. Look it up on your Codex if you want to know more.");
	if(silly) output("\n\nYour desire to know more intensifies.\n\n”</i>");
	else output(" ");
	output("Kiro sighs. <i>“They’re hard to stay mad at. Just make sure you have plenty of fodder in your pockets to pay them off with if you meet them. Fake gemstones, spoofed credsticks, that sort of thing. Give them something they want, and they’ll be your best friend. Your best fuckbuddies, if they fancy you.”</i>");
	output("\n\nIntriguing.");
	output("\n\n<i>“Just don’t underestimate them because they’re mousey-looking critters. They stick together in highly-coordinated teams that seem almost perfectly engineered to cover for each other’s weaknesses.”</i> Kiro taps her chin. <i>“My advice would be to avoid fighting them at all if you can help. If you can’t... carry grenades - preferably ones of multiple damage types. I’m pretty sure a few of them have some of the elementally defensive shields KihaCorp has been pushing lately.”</i>");
	output("\n\nYou verbally observe that they sound like capable opponents.");
	output("\n\nSparing you a wistful smile, Kiro nods. <i>“They are. Could probably steal the scrapheap crown from the Jumpers if they were more aggressive... or more numerous. I gotta respect their leader for holding back on that. If they tried, all they’d wind up doing is weakening both groups to the point where the Star Vipers or Corona Lords would consider making a play to take command. " + (pirateResearchVesselStolen() ? "Instead, they’ve endured, and the whole station is already pumping out a second Sidewinder if the rumors I hear are true.":"Instead they’re carving out a sweet little niche for themselves with four other gangs to help shield them from any law-bringing flak.") + "”</i>");
	output("\n\nYou thank her for the rundown.");
	//{unlock throbb/soak/gush/Rodenian codex}

	processTime(10);
	clearMenu();
	addButton(0,"Next",talkToKiro);
}

//Favorite Booty Call
public function kiroFavoriteBootyCall():void
{
	clearOutput();
	showKiro();
	author("Fenoxo");
	output("After a gentle request for Kiro to share some of her personal booze stash with you, you finally manage to ask, <i>“You get around. Got any favorite booty call stories?”</i>");
	output("\n\n<i>“Ah, see this is what I was hoping for when I realized you wanted to talk. Pass me some of that, would you?”</i> Kiro snatches the drink out of your hand and pounds down a third of it before setting it down. A ship-rattling belch emerges in the aftermath. <i>“Talking bedroom’s always easier with a bit of the old terran firewater in ya.”</i> She nudges your ribs with her elbow. <i>“It figures your species biggest contribution to galactic culture was fermented neurotoxin.”</i> She picks up the drink for another, smaller sip, slamming it back down in front of you. <i>“Okay. Now, uh, I know you said booty call, but I’m gonna take that to mean sex stories in general. Now, where to begin...”</i>");
	output("\n\nYou take the glass back before the pirate steals any more. Nevermind that it’s hers to begin with.");
	output("\n\nKiro lights up, back straightening as one particular memory swims out of the smutty soup of her mind. <i>“I don’t know if she’s necessarily ‘the best,’ per-se. I’ve had a lot of different bests in a lot of different ways, and I’m not the girl to keep a meticulous grading system, even if I snag trophies where I can.”</i> Sighing happily, the tanuki continues, <i>“");
	if(flags["KIRO_X_SAEN_HAPPENED"] != undefined) output("You ought to know who I'm about to talk about, since you've fucked her with me before, ");
	else output("Maybe I shouldn’t tell you her name, in case you ever meet her, ");
	output("but she was the cutest little bitch-kitten I ever met. Half ausar, half kaithrit, all the best parts of both.”</i>");
	output("\n\nYou gesture for her to go on.");
	output("\n\n<i>“Ran into her at Anon’s on Tavros. I’d just gotten through a particularly rough job and was busy consoling myself at the bottom of a barrel. She must have been in a similar situation, because when she sat down next to me, she was already half-way sauced and pounding on the bar to finish the job.”</i> Giggling to herself, Kiro recounts, <i>“You should’ve seen the look on her face when I offered her a drink.”</i> She pauses, grinning wider, then shaking her head in feigned embarrassment. <i>“Or mine when she bought me one back. The damned drink was stiffer than I was.”</i>");
	output("\n\nYou take a swig from the drink and listen intently. <i>“Hard already, Kiro?”</i>");
	output("\n\n<i>“Damn right I was!”</i> Kiro snatches the cup away from you and finishes it in one long pull. <i>“Like I said, I just got back from a shitty job. My definition of a shitty job? One where I don’t get laid, so I was already pretty pent up when I saw her. When she smiled at me? My cock nearly ripped my whole damn dress off my body. Absolutely rigid. If she asked me to fuck her right there, in front of everyone in the bar, I would’ve done it.”</i> She tosses the emptied vessel over her shoulder. " + (flags["KIRO_GF"] == undefined ? "It lands in a pile of similar detritus.":"It lands in a newly installed trash bin. It would seem you’re a good influence on the tanuki."));
	output("\n\n<i>“And the sex was good?”</i> you ask.");
	output("\n\n<i>“The sex was mind-blowing, [pc.name].”</i> Kiro’s grin is nearly as big as the dick-shaped bulge in her dress. <i>“You get that she was ausar, right? Ausar bitches are always <b>wet</b>, not galotian wet or nothing but compared to unmodded human women, their twats are swamps of slickness. If I actually slid into her cunt, it’d probably feel like swimming up a river. As it was, she glassed my cock in girlcum just rubbing me between her thighs. And when ausar cum? They cum hard. A lot of them are squirters, and those that aren’t can still dribble fierce enough to glaze your nuts with girlcum. It’s a good thing too, because if she wasn’t so wet, I never would’ve settled for a thighfuck. She made it work, [pc.name]. Better than half the pussies I’ve fucked, and I was actually fucking those.”</i>");
	output("\n\nYou ask if they did it in the bar, then.");
	output("\n\n<i>“Oh no, back on my ship. I’m not a total hedonist, Angel.”</i> Kiro goes silent for a moment of self-reflection, then thinks to add, <i>“Most of the time, anyway. Nah, we got to talking about all the other dumb sluts in the bar - people watching and whatnot. And my chatty, drunk ass got to bragging about my ship and my jobs. I guess I must not have been too obnoxious, because she was smiling at me the entire time. You know the look - how when you’re into someone, you’ll smile and laugh at nearly anything they say, no matter how stupid?”</i>");
	output("\n\n<i>“Yeah.”</i>");
	output("\n\n<i>“Well, I think we both had that look.”</i> Kiro runs her claws through her hair while she gathers her thoughts. <i>“For a drunk girl, she asked me some really insightful questions about my ship and job - like, really smart shit. I’m pretty sure I biffed at least one of the answers, but she stumbled back to the ship with me anyway.”</i> Kiro winks. <i>“I may have spoiled you about the wetness of the act already, but my stars, the flexibility! She’s a kaithrit too, [pc.name]! I could damn near fold her in half if it wouldn’t mean doing the same to my dick when it was inside her. And she had two fluffy tails! TWO OF THEM!”</i> Kiro balls her hands into fists like she’s grabbing both of them. <i>“Twice the tail-pulling, twice the leverage for slamming myself home. I left her with the mother of all thigh creampies - and then she asked me to do her backdoor too.”</i>");
	output("\n\n<i>“Did you?”</i> you ask.");
	output("\n\n<i>“Fuck yes I did!”</i> Kiro proudly declares, thumping a pre-balled fist into her chest" + (kiro.biggestTitSize() > 11 ? ". Her hand nearly vanishes into the squishy mass of expanded tit":"") + ". <i>“That bitch managed to get me off twice in one night - no easy feat back then. I left her looking like a glazed donut about to burst with creme filling, and the slut loved it - that or her orgasm was still going. Or she was just too drunk to care. Whichever. She was still fooling around in the shower too, though by the time we got toweled off were ready to pass out for the night.”</i>");
	output("\n\nYou say, <i>“Did you get a second round in the morning?”</i>");
	output("\n\n<i>“Nah. She was gone when I got up. Left me a little note with a heart, a kiss, and a pair of panties. I guess she saw the wall and figured she’d leave a contribution to it.”</i> The grinning tanuki rubs her brow and admits, <i>“Didn’t her contact information either. " + (flags["KIRO_X_SAEN_HAPPENED"] == undefined ? "Who knows. Hopefully I bump into Saendra again someday.":"But you took care of that for me, you sneak. I’m glad you got a chance to reintroduce us.") + "”</i>");
	processTime(11);
	pc.lust(5);
	clearMenu();
	addButton(0,"Next",talkToKiro);
}

//Appearance Screen
public function kiroAppearanceScreen():void
{
	clearOutput();
	showKiro();
	author("Fenoxo");
	output("Kiro Tamahime is a <i>mostly</i> typical kui-tan. She stands five feet six inches tall by ancient imperial measurements and 1.67 meters in the more accepted metric system. Like the rest of her species, she shares many features with terran tanukis and raccoons. Her body is curvaceous by human standards but surprisingly packed with muscle, even if any potential definition is well-concealed by her fluffy, full-body fur. A lifetime as an outlaw amongst the stars has hardened her otherwise cushy body into a weapon as comfortable breaking arms as breaking in bed partners.");
	output("\n\nWavy hair wreathes Kiro’s short-muzzled features in a bouquet of shimmery, meticulously coiffed chocolate. Her eyes, muted crimson, " + (kiro.ballDiameter() > 14 ? "seem glazed with arousal, any intelligence buried beneath her body’s unrepentant needs":"shine bright with predatory intelligence.") + (flags["KIRO_GF"] != undefined ? " Her gaze is different when it lands on you: more open and unguarded. Lust is still there but softened by more powerful affection. She loves you. This much is clear.":" When her gaze lands on you, it can be difficult to tell if she’s sizing you up for a job or a bang, but once you’re talking to her, those scarlet orbs always soften with clear friendship.") + " You could lose yourself in the darker ‘mask’ stretched across her visage if there weren’t so many other intriguing places to look - like Kiro’s lips.");
	if(kiro.lipMod <= 1) output(" They’re jet-black and just plump enough to draw your eye when a bit of light reflects off their moistened surfaces.");
	else output(" Once merely nice-looking, they’ve been plumped into an obscene pout by mad science and left to rest in a cock-sucking pucker. It’s impossible to look at her and not wonder what those plush onyx pillows would feel like mashed against your " + (pc.hasGenitals() ? "crotch":"asshole"));
	output(".");
	output("\n\nQuite a bit further beneath her rounded, raccoon-like ears is Kiro’s well-endowed chest, something she’s quite proud to present with an arched back and a smile.");
	//Normie chest.
	if(kiro.biggestTitSize() <= 11)
	{
		output("\n\nF-cups aren’t an easy fit for the skintight dress the tanuki favors. A slash down the center ensures that the middle valley of her cleavage is always fully exposed, all the way down to her belly button. It doesn’t take much for her nipples to rise to the occasion and present themselves through the intervening layer of fabric, proof that the pirate prefers to leave outdated garments like bras in storage.");
	}
	//Middle big chest
	else if(kiro.biggestTitSize() < 32)
	{
		output("\n\n[kiro.cupSize]s are frankly many sizes too large for the red dress that the tanuki favors, but she’s compensated for that by making alterations to fully expose the grand curves of her enhanced chest. Skull and crossbones pasties, seemingly painted on, are the only things to keep her puffy, frequently turgid nips decent. The pirate prefers not to bother with garments like bras, not when she can flaunt her seemingly sagless mounds in the open air. She’s fond of winking when she catches someone staring.");
	}
	//Beeg Chest
	else output("\n\n[kiro.cupSize]s seem almost too large for her comparatively small frame. The bouncy mounds are always threatening to pull her off balance. They completely obscure the fuzzy, flat field of her tummy and the upper expanse of her hips from view. Stylized, pirate-themed pasties keep her plate-sized nipples from being completely exposed, but they do nothing to conceal the shape or frequent rigidity that those embiggened buds love to reveal. Like tempting, hypnotic targets, they lend the tanuki’s movements a rhythmic quality that’s so easy for your eyes to follow.");
	//merge
	output("\n\nBelow the outlaw’s squeezable hips lies her pride and joy: a horse-cock of singular size and quality. Large enough to star in a porno all its own, Kiro’s ruddy equine tool stretches a significant 21 inches at full hardness with a passively flared tip that only balloons wider in the moments of her orgasms. She does little to hide it. Her dress comes with a pouch for her balls and contains some kind of interior guide mechanism to thread her easily-induced erections behind the concealing fabric.");
	//Smoll balls
	if(kiro.ballDiameter() <= 14)
	{
		output("\n\nFortunately for her, Kiro must have gotten off recently. Her balls are about as small as they ever get, snugly wrapped in the elastic pouch in her dress. It’s times like this that her outsized horse-meat can actually retreat the entire way into its sheath, leaving her as decent-looking as you’ve ever seen her. The tanuki moves more lightly on her feet right now, and she’s clearly got a clearer head when it comes to helping out around the ship.");
	}
	//>14 <=24 big balls
	else if(kiro.ballDiameter() <= 24)
	{
		output("\n\nUnfortunately for her, Kiro’s balls can’t really be contained by that elastic pouch, no matter how far she stretches the dress’s bottom hem. The kui-tan is left to walk around with melon-sized orbs swaying against one another, not that she seems to mind. You know for a fact that she’ll make a show of reaching down to stroke one when a pretty girl glances her way. Right now, her mind is always a least a little bit on sex...");
	}
	//Hueg balls.
	else output("\n\nImpressively, Kiro’s balls have swollen to ridiculous size. She could seat herself on her own fluffy testes if she wanted, and it probably wouldn’t even hurt. Kui-tan nuts are quite durable when swollen so large, and a little pressure might actually go a long way toward milking her back to a reasonable size. The tanuki herself is clearly affected by how pent up she’s become. She’ll stand there and claim it doesn’t effect her in the slightest, all while nibbling her lower lip and repeatedly pulling her hand away from her sheath. Like this, Kiro is a complete slut.");
	//Merge
	output("\n\nA flexible, well-used pucker rests between Kiro’s well-rounded asscheeks, though you’ll have to pry the fluffy glutes apart for a look at the crinkly sable star.");
	processTime(2);
	clearMenu();
	addButton(0,"Next",approachCrewKiro,true);
}