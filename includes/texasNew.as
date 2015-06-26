import classes.Items.Miscellaneous.BBQToGo;

public function newTexasEmail():void
{
	flags["NEW_TEXAS_COORDINATES_GAINED"] = 1;
	eventBuffer += "\n\n<b>New Email!</b>\nCome on out to New Texas, Partner!\nFrom: Benjamin Tiberius Tee (NoReply@NewTexas.gov)\nTo: [pc.name]@SteeleTech.corp\n\n<i>This message opens with a 3D masthead depicting rolling green hills that stretch off into the beautiful blue horizon. Several incredibly chesty woman are cavorting across the field, each dressed in a cow-pattern leotard that hugs her almost inhumanly ample curves just right...</i>\n\nHowdy, " + pc.mf("Mr.","Mz.") + " [pc.name] Steele!\n\nMy name is Benjamin Tee, but you and yours can call me Big T. I'm the governor of New Texas, and I'd like to invite you and your crew to our beautiful planet! Enjoy fresh-from-the-tap milk and ice cream, relax in rolling fields unspoiled by civilization, and meet the most beautiful women the galaxy has to offer!\n\nAttached to this message are coordinates and exclusive landing access codes for my personal ranch. Speaking for all of New Texas: we hope to see you soon, partner!\n\n<i>Giddy-on-up to New Texas!</i>\n-Governor Benjamin Tiberious Tee";
}

//Landing on New Texas (First Time)
public function landOnNewTexas():void
{
	if(flags["LANDED_ON_TEXAS"] == undefined)
	{
		flags["LANDED_ON_TEXAS"] = 1;
		CodexManager.unlockEntry("The Treatment");
		output("A bright green world comes into view ahead: a planet of small, scattered oceans, rolling plains, and clear weather. At first glance, New Texas looks like a male paradise world, peaceful and idyllic. The space lanes around the planet are mostly clear, letting you punch in the auto-lander and sit back as your ship’s computers guide you down to the surface. The clouds roll past you as your ship cruises down toward the largest continent.");
		output("\n\nYour auto-nav guides you down toward the most popular tourist spot on the planet, a particularly large ranch owned by the planetary governor. You bring up a few articles on the place: the extranet is full of holo-pics of busty, bovine-like human girls milling about the ranch, as well as reviews of an amazing barbeque joint and a something simply called the Treatment, which has all but made the planet what it is today. A whole planetary society based on gene mods... interesting.");
		output("\n\nThe computer alerts you to imminent landing. You cast a glance out your viewscreen just in time to see a monolithic barn coming into view, easily the size of two city blocks back to back on each side. As you approach, the roof of the barn shudders and begins to split, separated by two massive hydraulic arms that create an opening wide enough for a frigate to pass through. Your ship slows, guided in by the automatic docking protocols as it passes between the raised slates of the barn-dock’s roof. Inside, you can see a handful of smaller cargo haulers and touristy passenger ships docked below, each pulled into an oversized, self-contained <i>“stall.”</i> You feel a slight shudder in the deck as your ship lands on the hay-covered floor, quickly surrounded by several buff, burly dock workers, each with a pair of bull horns growing from his head. ");
		output("\n\nA heavy loader latches onto your ship, dragging it into a stall as you gather your gear and prepare to head out. Your docking ramp touches down just as the suit releases your ship. Several of the buff, bovine men working nearby give you ");
		if(pc.mf("dude","chick") == "dude") output("friendly nods");
		else output("askance, hungry looks");
		output(" as you disembark. A sign nearby points you to <i>“Customs and Visitor Check-in.”</i>");
	}
	else output("You fly to New Texas and step out of your ship.");
}



//output("\n\nCustoms & Check-in");
//output("\n\nRoom Description");
public function customsAndCheckInOnNewTexas():Boolean
{
	clearOutput();
	author("Savin");
	showBust("OGRAM","AMMA");
	author("Savin");
	output("The Customs and Visitor Check-in office dominates the only passage between the spaceport and the ranch proper, ensuring anybody coming or going gets a proper screening. Two desks are set up, facing each other across the thoroughfare: one is labeled <i>“Customs and Weapons Check,”</i> the other, <i>“Visitor Check-in.”</i> Very straightforward. ");
	//{If First time going through:}
	if(flags["NEW_TEXAN_CUSTOMS_MET"] == undefined)
	{
		output("\n\nA broad-chested, muscular bull-man is sitting lazily behind the Customs desk, leaning back in his chair and staring off into space. When he sees you, he sits up a little straighter, though in so doing he gasps a bit. Something seems to be distracting him, though you can’t see what... <i>“Ah. Sorry, slow day. Come on over, let’s get you checked out.”</i>");
		//[Customs Officer]
		addButton(0,"Customs",approachCustomsFirstTime);
	}
	//Customs (Refused to Disarm)
	else if(flags["REFUSED_TEXAN_DISARM"] != undefined)
	{
		output("\n\n<i>“Changed your mind yet?”</i> Ogram says, picking up a clipboard full of paperwork for you.");
		//{Same options} as first time meeting
		addButton(0,"Customs",repeatOgramApproach);
	}
	//{If Repeat:}
	else
	{
		output("Ogram and Amma are sitting behind their desks, working hard at looking like they’re working hard. Every few seconds, Amma gives a tiny, muted gasp ");
		//if not sex’d: 
		if(flags["FUCKED_TEXAN_CUSTOMS"] == undefined) output("seemingly for no reason");
		else output("as the pair of vibrators constantly lodged inside her work their magic");
		output(". Sometimes when she does so, Ogram will flick a button on his holo terminal, which immediately causes Amma to squirm in her seat.");
		if(flags["FUCKED_TEXAN_CUSTOMS"] == undefined) output(" What kind of game are they playing?");
		addButton(0,"Ogram",repeatOgramApproach,undefined,"Ogram","Talk to the burly bull at the customs desk.");
		addButton(1,"Amma",approachDatCowGalRepeat,undefined,"Amma","Talk to the busty cow-girl at the visitor's desk.")
	}
	return false;
}

//Customs Officer (First Time)
public function approachCustomsFirstTime():void
{
	clearOutput();
	author("Savin");
	showName("\nOGRAM");
	showBust("OGRAM");
	output("You approach the bull-man behind the desk. He looks human enough at first glance, if abnormally tall, muscular, and broad-chested. Up close, though, you can get a good look at the massive pair of bull horns sticking up on either side of his blue cap, and the mat of thick, dark hair poking out from his long sleeves and over the hem of his undershirt. He’s dressed in old-school corporate security getup: blue pants and shirt, with a ballistic vest strapped tight to his barrel chest, barely hanging in there thanks to his size. Pinned to his vest is a tag reading, <i>“Hello, my name is Ogram.”</i>");
	output("\n\nSeeing you looking, he chuckles and sits up straighter behind his desk. <i>“What? Never seen a Texan before, or do I have something on my shirt?”</i>");
	output("\n\nYou apologize as he picks up a stack of forms, sticks them on a clipboard, and hands them to you. <i>“Basic stuff, here: just check to say that you don’t have any contagious diseases, you’re not bringing foreign foodstuffs in, and that you’re generally not going to be a dick on my planet. Oh, and there’s a weapons check. No firearms, bladed weapons, or other means of murder and mayhem beyond this point. Don’t worry, we’ll tag ‘em and hand ‘em back to you as soon as you’re ready to leave.”</i>");
	output("\n\n<i>“No weapons?”</i> you say, caught a bit off guard after your time on the frontier.");
	output("\n\nOgram shrugs apologetically. <i>“Sorry, " + pc.mf("buddy","beautiful") + ", them’s the rules.”</i>");
	processTime(2);
	//[Disarm] [No Way!] [No Weapons!]
	clearMenu();
	if(pc.hasEquippedWeapon()) addButton(0,"Disarm",disarmMeHoss,undefined,"Disarm","Allow Ogram to disarm you.");
	else addDisabledButton(0,"Disarm","Disarm","You don't have any weapons to disarm!");
	addButton(1,"No Way!",noWayTexasJose,undefined,"No Way!","Refuse to be disarmed.");
	if(pc.meleeWeapon is Rock && pc.rangedWeapon is Rock) addButton(2,"No Weapons!",noWeaponsInTexasHoss,undefined,"No Weapons!","Inform Ogram that you aren't carrying any real weapons. All you need are your fists or a rock to chuck, and you can find rocks anywhere.");
	else addDisabledButton(2,"No Weapons","No Weapons","You can't get by for having no weapons while actually carrying weapons. It just doesn't work. Come on, man.");

}

//No Way!
public function noWayTexasJose():void
{
	clearOutput();
	author("Savin");
	showName("\nOGRAM");
	showBust("OGRAM");
	flags["REFUSED_TEXAN_DISARM"] = 1;
	output("<i>“Not happening,”</i> you say, throwing the clipboard down on Ogram’s desk.");
	output("\n\nHe shrugs and takes the paperwork back. <i>“Hey, whatever. There’s the door back to fuck-off. Let me know if you change your mind.”</i>");
	output("\n\nWith a heavy sigh, the bull-man leans back in his chair and pulls his cap down over his eyes. He seems to be enjoying himself...");
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//No Weapons
public function noWeaponsInTexasHoss():void
{
	clearOutput();
	author("Savin");
	showName("\nOGRAM");
	showBust("OGRAM");
	flags["REFUSED_TEXAN_DISARM"] = undefined;
	output("<i>“I’m unarmed anyway,”</i> you say with a shrug.");
	output("\n\nOgram blinks. <i>“Huh. Did somebody actually read the FAQ on the website for once, or do you just prefer to lay in with your fists? Anyway, just sign the paperwork and you’re all good.”</i>");
	//{Resume from Disarm, below}
	customsPassFinale();
}

//Disarm
public function disarmMeHoss():void
{
	clearOutput();
	author("Savin");
	showName("\nOGRAM");
	showBust("OGRAM");
	flags["REFUSED_TEXAN_DISARM"] = undefined;
	output("<i>“Alright,”</i> you say warily, handing over your armaments.");
	output("\n\nTrue to his word, Ogram hooks a paper tag over your gear and stows it in a small container behind his desk. <i>“Thankya kindly. Now just finish off that paperwork, and you’re all good.”</i>");

	//{No weapons resumes here}
	customsPassFinale();
}
public function customsPassFinale():void
{
	output("\n\nYou spend a minute or two filling in your signature or initials on a few forms. Eventually, you hand them over to Ogram, who stamps them. As he does so, you notice the bull-man wince, snaking a hand down under the desk. Maybe he’s got a cramp?");
	output("\n\n<i>“Alright. Just step on over to the visitor check-in desk. Somebody’ll be with you...”</i> He shudders a little bit, barely muting a curse. <i>“Uh, real soon.”</i>");
	pc.createStatusEffect("Disarmed",4,0,0,0,false,"Blocked","You've checked all forms of weaponry at New Texas' customs.",false,0);
	if(pc.hasEquippedWeapon()) flags["CHECKED_GEAR_AT_OGGY"] = 1;
	processTime(2);
	clearMenu();
	addButton(0,"Next",visitorDeskApproach);
}

//Visitor Desk (First Time)
public function visitorDeskApproach():void
{
	clearOutput();
	author("Savin");
	showName("OGRAM &\nAMMA");
	showBust("OGRAM","AMMA");
	output("As Ogram said, you step across the hall to the desk marked for visitor check-in, though there’s still nobody sitting there. You shrug and ");
	if(!pc.isTaur() && !pc.isNaga()) output("take a seat");
	else if(pc.isTaur()) output("sit down on your haunches");
	else output("coil yourself up");
	output(" in front of the desk, waiting.");

	output("\n\nBehind you, as silence descends over the office, you begin to hear Ogram grunting. Softly, barely audible, clearly restrained... you look over your shoulder, seeing his hand tucked under his desk as Ogram leans back in his chair, breath hot and hard. Is he...? Before you can decide on a course of action, you hear Ogram’s breath catch for a second, followed by a long, contented sigh. He slumps back in his chair, a look of lazy fulfilment on his face. As he relaxes, he’s pushed ever so slightly back in his swivel chair, and a head pokes out from under his desk. A quick glance tells you it’s a woman, platinum blonde, with a pair of tiny, cute nubs of horns growing from her brow. She looks up at you and gasps.");
	output("\n\n<i>“Oh no! Oggy, why didn’t you tell me somebody was waiting!”</i>");
	output("\n\nHe shrugs. <i>“I saw you first.”</i>");
	output("\n\nShe pouts and hops up from under Ogram’s desk, wiping what’s pretty obviously cum from her lips. <i>“Sorry... I was on my break. I’ll be with you in just a sec, sugar!”</i>");
	output("\n\n<i>“Uh,”</i> you say as the cow-girl crawls out from under Ogram’s desk, taking a moment to straighten her skirt and flick some excess spooge off from the tops of her breasts before turning her attention to you, coming over to sit at her desk.");
	output("\n\nJust like her partner, the visitor check-in girl’s got distinctly bovine traits, with horns and cow-ears and an absolutely massive rack. She’s easily sporting H-cup tits, barely restrained by her blouse -- it seems to be coming apart at the seams, the buttons ready to pop off at any moment. Her long, slender tail swishes as she walks, topped with a silver tuft of hair that manages to distract you somewhat from the huge, gropable behind.");
	//if PC has Reaha on crew:
	if(reahaIsCrew()) output("Damn, Reaha’s got nothing on the cows here....");

	output("\n\n<i>“Sorry about the wait!”</i> the cow-girl says with a big smile. <i>“My name’s Amma, and I just need a few things from you before you can head on out to the fields. Trust me, you’re going to have so much fun!");
	if(pc.mf("dude","") == "dude") output(" There’s plenty of girls just like me who’re going to be so happy to meet you!”</i>");
	else if(pc.biggestTitSize() < 7) output(" I think New Texas’s got just what you need to spice up your life, cutie!”</i>");
	else output(" You look like you’d fit right in here, miss! A couple days on New Texas and you won’t ever want to leave!”</i>");

	output("\n\nShe picks up a holo-slate with a few blanks on it and hands it over to you. <i>“Just sign the register here and you’re all set. Oh! And if you want the Treatment, just go to the gift shop in the ranch house. You can even get a delicious salad from the restaurant while you’re getting treated. Or a steak or something, I guess. Or you could go play with the " + pc.mf("studs","girls") + " in the barns: they’re always open to visitors!”</i>");
	output("\n\nAs she’s speaking, you sign your name and ship ID. Once done, a green light flickers on the screen, and a banner announces that you’re done - welcome to New Texas! <i>“Great! All done, sugar! Just head on out through the door there, and have lots of fun. If you have any questions, Oggy and I are always here to answer ‘em.”</i>");
	flags["NEW_TEXAN_CUSTOMS_MET"] = 1;
	processTime(10);
	//[Talk] [Leave]
	clearMenu();
	addButton(0,"Talk",talkToAmma,true,"Talk","Talk with the chesty cow-gal.");
	addButton(14,"Leave",mainGameMenu);
}

//output("\n\nTrying to Go Through Customs while Armed");
public function customsFucksYourShitUp():void
{
	currentLocation = "TEXAS CUSTOMS";
	var map:* = mapper.generateMap(currentLocation);
	this.userInterface.setMapData(map);
	clearOutput();
	author("Savin");
	showName("\nOGRAM");
	showBust("OGRAM");
	output("<i>“Hey, " + pc.mf("buddy","beautiful") + ", where do you think you’re going?”</i> Ogram says, standing up behind his desk. <i>“Nobody passes the checkpoint without a search, even repeat VIPs.”</i>");
	output("\n\nWhoops.");
	currentLocation = "TEXAS CUSTOMS";
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Ogram (Repeat)
public function repeatOgramApproach():void
{
	clearOutput();
	author("Savin");
	showName("\nOGRAM");
	showBust("OGRAM");
	output("You step over to the customs desk and clear your throat to get Ogram’s attention. ");
	output("<i>“Sup, " + pc.mf("bro","beautiful") + "?”</i> Og says with a friendly nod. ");

	//if PC is Disarmed: 
	if(pc.hasStatusEffect("Disarmed"))
	{
		output("<i>“Lemme know when you’re ready to go, and I’ll hand your weapons back over.");
	}
	//If PC is armed:
	else
	{
		output("<i>“If you want to go into the ranch, you’ll need to check your weapons with me.");
	}
	output("”</i>");
	//If sex’d:
	if(flags["FUCKED_TEXAN_CUSTOMS"] != undefined) output(" <i>“Or would ya rather double-team the cow again?”</i>");

	//[Talk] [Sex] [Rearm] [Disarm]
	clearMenu();
	addButton(0,"Talk",talkToOggy,true);
	if(pc.lust() >= 33) addButton(1,"Sex",askOggyForSex,undefined,"Sex","See if the big bull is up for sex.");
	else addDisabledButton(1,"Sex","Sex","You aren't quite aroused enough for sex.");
	if(pc.hasStatusEffect("Disarmed")) {
		addButton(3,"Rearm",rearmAtOgram,undefined,"Rearm","Get your weapons back.");
		addDisabledButton(4,"Disarm","Disarm","You've already been disarmed.");
	}
	else 
	{
		addDisabledButton(3,"Rearm","Rearm","You can't pick up any weapons here - they don't have yours.");
		addButton(4,"Disarm",getDisarmedRepeat,undefined,"Get disarmed so that you can explore the planet.");
	}
	addButton(14,"Leave",mainGameMenu);

}

//Rearm
public function rearmAtOgram():void
{
	clearOutput();
	author("Savin");
	showName("\nOGRAM");
	showBust("OGRAM");
	output("<i>“Alright, let’s see what we’ve got here,”</i> Ogram says, popping open the container behind his desk and pulling out your gear. He compares the bundle to the tag attached to it, checks something on his holo-terminal, and hands it over to you. <i>“Just sign here, and you’re all set.”</i>");
	output("\n\nYou do so, and are promptly handed a bundle with your weapons in it. <i>“Cool. Take care out there, " + pc.mf("buddy","beautiful") + ".”</i>");
	pc.removeStatusEffect("Disarmed");
	flags["CHECKED_GEAR_AT_OGGY"] = undefined;
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Disarm (Repeat)
public function getDisarmedRepeat():void
{
	clearOutput();
	author("Savin");
	showName("\nOGRAM");
	showBust("OGRAM");
	output("<i>“Ready to check your weapons? Cool, just hand ‘em over and put your Hancock on this form here,”</i> Ogram says, handing over a dataslate. ");
	if(pc.hasEquippedWeapon())
	{
		output("You fill out the form and hand your gear over, watching as Og tags it and stows your armaments away in the container behind his desk.");
		output("\n\n<i>“Alright, good to go,”</i> he says, closing the container and checking the forms. <i>“Have a good one.”</i>");
		flags["CHECKED_GEAR_AT_OGGY"] = 1;
	}
	else
	{
		output("You casually inform him that you don't have any weapons, watching as Og's eyebrow climbs steadily higher.\n\n<i>“I'll have to give you a quick check-over,”</i> he says while waving a portable scanner over your body. <i>“All right, you're clear. Have a good one.”</i>");
	}
	pc.createStatusEffect("Disarmed",4,0,0,0,false,"Blocked","You've checked all forms of weaponry at New Texas' customs.",false,0);
	
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Talk
public function talkToOggy(display:Boolean = false):void
{
	if(display)
	{
		clearOutput();
		author("Savin");
		showName("\nOGRAM");
		showBust("OGRAM");
		output("<i>“Got a minute to chat?”</i>");
		output("\n\n" + pc.mf("<i>“Guess I’m not doing anything important. What’s up, buddy?”</i>","<i>“For a beautiful gal like you? Absolutely,”</i>") + " Og says, leaning back in his chair.");
	}
	clearMenu();
	addButton(0,"The Treatment",talkToOggyAbootTreatManz,undefined,"The Treatment","Ask the brute what his take on the Treatment is.");
	addButton(1,"CurrentJob",oggysCurrentJob,undefined,"Current Job","Ask him about his job now.");
	addButton(2,"Old Job",oggysOldJob,undefined,"Old Job","Ask him about his old job.");
	addButton(3,"Amma",askOggyAboutAmma,undefined,"Amma","Ask him about that hot cow-girl manning the visitor's desk.");
	addButton(14,"Back",repeatOgramApproach);
}

//The Treatment
public function talkToOggyAbootTreatManz():void
{
	clearOutput();
	author("Savin");
	showName("\nOGRAM");
	showBust("OGRAM");
	output("<i>“So, tell me about this Treatment.”</i>");
	output("\n\nOgram shrugs, <i>“Hey, if you want the tourist pitch, talk to Amma. I just live here.”</i>");
	output("\n\n<i>“But you got the Treatment,”</i> you suggest, indicating his bulging muscles and bull-horns.");
	output("\n\n<i>“Heh. Yeah. Kind of a snap decision, but... well, it’s actually pretty cool, you know. I was pretty ripped before -- kind of a requirement when you’re a bodyguard -- but </i>damn<i> that stuff jacked my muscles out. Could bend bars, these guns,”</i> he says, flexing. <i>“Plus I put on another foot of height and got these love-handles.”</i> He jerks a thumb towards his enormous horns.");
	output("\n\n<i>“Pretty weird how different it works on guys and gals, though. When I got it, I figured I was gonna get huge tits and turn into a bimbo. Never actually occurred to me to talk to a bull around here, I guess. Didn’t see one till after I ran into the gift shop and Treated up.”</i>");
	output("\n\nOg leans back in his chair, locking his fingers behind his head. <i>“Can’t complain, really. After I got it, they let me have the run of the place. Any girl I wanted spread her legs for nothing. Especially if you catch ‘em in the milk barns... they practically beg for it, all hooked up to their milkers. Should hear Amma when she’s getting milked... any cock in a storm, that girl.”</i>");
	output("\n\n<i>“Especially if it’s yours!”</i> she calls over with a wink.");
	output("\n\nOgram grins, his pants visibly straining.");
	processTime(6);
	talkToOggy(false);
	removeButton(0);
	addDisabledButton(0,"The Treatment","The Treatment","Seriously? You're talking about that right now.");
}

//Current Job
public function oggysCurrentJob():void
{
	clearOutput();
	author("Savin");
	showName("\nOGRAM");
	showBust("OGRAM");
	output("<i>“So, tell me about what you do here.”</i>");
	output("\n\n<i>“Customs? C’mon, " + pc.mf("buddy","beautiful") + ", it’s the same shit as anywhere. ‘Oh, no, you can’t take that horribly poisonous Evaxi cactus here;’ ‘Please stop trying to take your power armor through the gate, you don’t need it here;’ ‘Yeah, we can all see you’ve got contraband stuffed up your ass. Drop trou, buddy. It’s Mr. Gloves time.’ Least NT’s pretty peaceful. Not a lot of scum try and come through, since all we’ve got is milk and the Treatment. Worst we have to worry about is the occasional slaver trying to steal our cows, but that’s Fleet’s problem most of the time.”</i>");
	output("\n\nHe shrugs. <i>“Honestly, it’s pretty boring. At least compared to my old job. I remember digging through the ground levels of the biggest hive worlds, pulling security at planetary conventions... that was exciting. Even stopped an assassin, once. Head-butted her when she came ‘round a corner; went down like a </i>bitch<i>. Less getting shot at now, though. That’s pretty nice. Haven’t even had to draw down since I got the job.”</i>");
	output("\n\n<i>“So what made you pick customs?”</i>");
	output("\n\n<i>“Eh,”</i> Og says, leaning back and looking right past you. <i>“It’s got a great view, for starters.”</i>");
	output("\n\nYou follow his gaze over to Amma, who’s currently resting her heavy rack on her desk while she types. Seeing the two of you looking, she gives you an exaggerated wink.");
	output("\n\nOgram hits a key on his terminal as you turn your attention back to him. Amma gives a muted little gasp, barely audible behind you. <i>“Not much else to do for someone with my skill set, either. We don’t exactly need cops around here, you know. Guess I could have been a breeder bull... gotta say, that actually has a lot of appeal, sticking your dick in a dozen different sluts every day... but then I’d have a million little Ograms running around calling me daddy. That’d be pretty fucking weird.”</i>");
	//{If Ogram option unlocked in Amma’s menu:}
	if(flags["OGRIM_UNLOCKED_FROM_AMMA_TALK_MENU"]  != 0)
	{
		output("\n\nBehind you, Amma smirks and says, <i>“When’re you going to put </i>one<i> little Ogram in me, babe?”</i>");
		output("\n\n<i>“Shush, you,”</i> Og says, waving her off. <i>“I’ll get to you when I’m good and ready.”</i>");
		output("\n\nAmma pouts... right up until Og keys his terminal again, and she gives a little yelp.");
	}
	processTime(6);
	talkToOggy(false);
	removeButton(1);
	addDisabledButton(1,"CurrentJob","CurrentJob","Seriously? You're talking about that right now.");
}

//Old Job
public function oggysOldJob():void
{
	clearOutput();
	author("Savin");
	showName("\nOGRAM");
	showBust("OGRAM");
	output("<i>“So, care to talk about your old gig?”</i>");
	output("\n\nOg laughs. Behind you, Amma groans, <i>“Don’t get him started... he’ll go on all day!”</i>");
	output("\n\n<i>“Hey, " + pc.mf("my friend here","the pretty lady") + " asked!”</i> Ogram says defensively. <i>“Don’t mind her. Before I came to New Texas and got Treated, I worked private security. Joined Nova way back, ended up mostly doing personal escorts. Not </i>that<i> kind. Amma.”</i>");
	output("\n\n<i>“I didn’t say anything!”</i>");
	output("\n\n<i>“Bodyguarding. I was a bodyguard, basically. Got to wear the black suit and sunglasses, carry a machine pistol in my briefcase. It was pretty great. People I worked for were mostly scum, big corp. executives with enough creds to build their mansions out of their tax return slips. Kiha, JoyCo, Steele, you name it. But I got to go all over the galaxy, see cool aliens. Blow some up. Fucked others. Sometimes even fuck the people I was escorting.”</i>");
	output("\n\n<i>“So you </i>were<i> a...”</i> Amma starts to laugh, cut off when Og pushes a button on his console. She shudders. ");
	output("\n\n<i>“Hey, don’t judge a guy for working hard to get his bonuses.”</i> He sighs, leaning back in his chair and propping his legs up. <i>“Could have had a worse gig. But I like what I do here. New Texas’s been good to me.... wouldn’t go back to that for the world.”</i>");
	processTime(5);
	talkToOggy(false);
	removeButton(2);
	addDisabledButton(2,"Old Job","Old Job","Seriously? You're talking about that right now.");
}

//Amma
public function askOggyAboutAmma():void
{
	clearOutput();
	author("Savin");
	showName("\nOGRAM");
	showBust("OGRAM");
	output("<i>“What can you tell me about your partner there,”</i> you whisper, nodding back to the busty cow behind you.");
	output("\n\nOgram chuckles. <i>“Other than that she’s the reason I stick around here? Hell, I even got Treated just to get her to give me a chance. What more do you need to know than that?”</i>");
	output("\n\n<i>“Come on,”</i> you coax, <i>“You gotta tell me more than that.”</i>");
	output("\n\n<i>“Heh. She’s cute, funny, sexy as hell... and those tits are worth dying for, let me tell you. Amma was the first person I saw here on NT, and I just... I dunno,”</i> he shrugs, and you’re almost sure his tanned skin’s flushed a bit redder. <i>“I didn’t think twice about staying here... leaving everything behind... when I met her. Can’t explain it, but I just knew she was worth it. This whole planet is, really: all the women are like Amma. It’s a paradise for perverts like ");
	if(flags["FUCKED_TEXAN_CUSTOMS"] == undefined) output("me");
	else output("us");
	output(".");
	processTime(3);
	talkToOggy(false);
	removeButton(3);
	addDisabledButton(3,"Amma","Amma","Seriously? You're talking about that right now.");
}

//Sex
public function askOggyForSex():void
{
	clearOutput();
	author("Savin");
	showName("OGGY &\nAMMA");
	showBust("OGRAM","AMMA");
	//First time:
	if(flags["FUCKED_TEXAN_CUSTOMS"] == undefined)
	{
		output("Leaning over the bull-man’s desk, you ask if he’d be up for showing you those guns of his up close. Maybe take ‘em out of their holsters for you to get... hands on with?");
		output("\n\nHe grins up at you, leaning back enough in his chair that you can see his crotch, and the rising tent coming from it. <i>“For a " + pc.mf("handsome guy","cute girl") + " like you, I wouldn’t mind.”</i>");
		output("\n\n<i>“But,”</i> Amma says from behind you, her hand suddenly on your [pc.butt], <i>“Oggy and I come as a pair.”</i>");
		output("\n\nOgram grins, standing up and reaching for his zipper. <i>“Think you can handle the two of us, " + pc.mf("buddy","beautiful") + "?”</i>");
		output("\n\nAmma grins, pressing her twin melons against you. <i>“Ready for the fuck of a lifetime, [pc.name]?”</i>");
	}
	//{Repeat}
	else
	{
		output("<i>“So... how about you and Amma take a break. You’re working too hard.”</i>");
		output("\n\nOgram grins. <i>“I was wonder when you were gonna ask.”</i>");
		output("\n\n<i>“Ready for the fuck of your life, [pc.name]?”</i> Amma grins, hopping out from behind her desk.");
	}
	processTime(1);
	clearMenu();
	if(pc.hasCock())
	{
		if(pc.cockThatFits(chars["AMMA"].vaginalCapacity(0)) >= 0) addButton(0,"Spit Roast",spitRoastAmmoOnYerDicks,undefined,"Spit Roast","Spitroast Amma. Ogram gets her mouth, you get her pussy.");
		else addDisabledButton(0,"Spit Roast","Spit Roast","You're too big to spitroast her.");
	}
	else addDisabledButton(0,"Spit Roast","Spit Roast","Spitroasting Amma requires you to have a penis of some kind.");
	addButton(1,"ServiceOggy",worshipZeBullCawk, undefined, "Service Oggy","Help Amma orally service Ogram's dick. Really get in there and give it the worship it deserves.");
	addButton(14,"Back",approachDatCowGalRepeat);
}

//Amma (Repeat)
public function approachDatCowGalRepeat():void
{
	clearOutput();
	author("Savin");
	showName("\nAMMA");
	showBust("AMMA");
	output("You take a seat at the visitor’s desk across from the well-endowed cow-girl.");
	output("\n\n<i>“Hey there, sugar! Welcome back! Anything I can help you with?”</i> Amma asks with a warm smile. As she does so, she fidgets slightly, her thick legs shifting under the desk");
	if(flags["FUCKED_TEXAN_CUSTOMS"] == undefined) output(" like she’s got an itch");
	else output(" as Ogram fiddles with her vibrator settings");
	output(".");
	//if sex’d:
	if(flags["FUCKED_TEXAN_CUSTOMS"] != undefined) output(" <i>“Or did you just want to have a little fun? For you, Oggy and I are always on break.”</i>");
	//[Talk] [Sex]
	processTime(1);
	clearMenu();
	addButton(0,"Talk",talkToAmma,true,"Talk","See if the cow-girl wants to talk about anything.");
	if(pc.lust() >= 33) addButton(1,"Sex",sexChatWithAmma,undefined,"Sex","See if the lusty cow-girl is up for a quickie.");
	else addDisabledButton(1,"Sex","Sex","You aren't aroused enough for sex.");
	addButton(14,"Leave",mainGameMenu);	
}


//Talk
public function talkToAmma(display:Boolean = false):void
{
	if(display)
	{
		clearOutput();
		author("Savin");
		showName("\nAMMA");
		showBust("AMMA");
		output("<i>“Got a minute to chat?”</i>");
		output("\n\n<i>“Sure thing, sugar,”</i> the cow beams. <i>“Anything I can help you with, let me know!”</i>");
	}
	clearMenu();
	addButton(0,"The Treatment",askAmmaAbootZeTreatManz,undefined,"The Treatment","Ask the cow-girl what she thinks of the Treatment.");
	addButton(1,"Who'sInCharge",whosInCharge,undefined,"Who's In Charge Here?","Ask Amma about who runs this planet.");
	addButton(2,"Herself",askAmmaAboutHerSelf,undefined,"Herself","Ask Amma about herself.");
	if(flags["OGRIM_UNLOCKED_FROM_AMMA_TALK_MENU"] != undefined) addButton(3,"Ogram",askAmmaAboutOgram,undefined,"Ogram","Ask her about that big lug she's been seeing, Ogram.");
	else addDisabledButton(3,"Locked","Locked","You'll need to talk to Amma about something else in particular before this scene unlocks.");
	addButton(14,"Back",approachDatCowGalRepeat);


}

//The Treatment
public function askAmmaAbootZeTreatManz():void
{
	clearOutput();
	author("Savin");
	showName("\nAMMA");
	showBust("AMMA");
	output("<i>“Could you tell me a little about this Treatment?”</i>");
	output("\n\nAmma grins and nods, a little too eagerly. <i>“I’d be happy to! The Treatment’s what makes New Texas such a great, fun place. It’s a special gene-therapy developed right here on NT; everyone gets it when they reach maturity, and have for the last couple hundred years. The Treatment makes sex super fun -- that’s the really important part. But it also gives us girls these,”</i> she says, jiggling her shirt-straining chest, <i>“and just plain makes us sexier!”</i>");
	output("\n\n<i>“Boys like Oggy over there get all muscley and big, plus some other awesome benefits...”</i> she winks, pointing a finger down between her legs. <i>“Without the Treatment, New Texas would just be any other rural colony. With it, we’ve got ourselves a pleasure paradise!”</i>");
	output("\n\nShe sure seems excited about it, that’s for sure.");
	output("\n\n<i>“Even better, the Treatment’s free in the gift shop. You should try it: you’ll never regret it!”</i>");
	output("\n\n<i>“Is it reversible?”</i>");
	output("\n\nAmma blinks, completely taken by surprise. <i>“Why would you want to stop being Treated? It’s the best!”</i>");
	output("\n\n<i>“That’s not an answer,”</i> you say.");
	output("\n\nShe fidgets. <i>“Uh, well, I don’t think it is. Probably not. I dunno, nobody’s ever really wanted to! It’s so nice... I couldn’t imagine living without my Treatment. Life,”</i> she pauses, leaning in to whisper <i>“and sex.... would be sooooo boring. It makes the pleasure-feelers in your brain go wild, and your endor... uh, endarfins...”</i>");
	output("\n\n<i>“Endorphins,”</i> Ograms says, not looking up from his terminal.");
	output("\n\n<i>“Endorphins! You get lots more of them, too. Did I mention that it made sex feel soooo good? And lactation! Oh, wow, giving milk is just the best... I feel bad for my poor bulls, who never get to do it!”</i>");
	processTime(7);
	talkToAmma(false);
	removeButton(0);
	addDisabledButton(0,"The Treatment","The Treatment","You're already talking about that.");
}

//Who’s in Charge?
public function whosInCharge():void
{
	clearOutput();
	author("Savin");
	showName("\nAMMA");
	showBust("AMMA");
	output("<i>“So, who’s in charge around here?”</i>");
	output("\n\nAmma points out the door and northward. <i>“That’d be Big T. He’s the planetary governor. His ranch house is the big one up the road a little way, you can’t miss it. He loves meeting visitors, so you should totally go say ‘hi.’”</i>");
	output("\n\n<i>“Tell me about him.”</i>");
	output("\n\nHer big lips purse in thought. <i>“Hmm. Well, he’s a big stud... even bigger than Oggy here!”</i>");
	output("\n\n<i>“Hey!”</i> Ogram barks.");
	output("\n\n<i>“I meant size, babe! Uh, er, height! Height!”</i>");
	output("\n\nOgram scowls, but turns back to his holo-terminal. A moment later, Amma gasps, biting her lip to mute a little squeak trying to tear its way out of her. Slowly, she adjusts her collar and shakily begins speaking again. <i>“Uh, a-anyway, Big T.’s in charge of the planet’s Treatment production and -- oh! -- helps us cows ship our milk all o-o-ooooohver the galaxy.”</i>");
	output("\n\nAmma stops, pausing for breath. ");
	//if not sex’d: 
	if(flags["FUCKED_TEXAN_CUSTOMS"] == undefined) output("What’s up with her?");
	else output("Ogram must have that vibe up to max by now.");
	output(" <i>“H-he’s been governor for as long as I’ve been alive. It’s a hereditary position, so his family’s been running New Texas since it w-w-waaaaaas first colon...colonized. They’ve been good to us... gave us the Treatment, peace... lives full of </i>fun<i> and milk...”</i> Before she can get much farther, Amma’s hands clamp around the edge of her desk, steadying her as she moans quietly, her tits wobbling with her heaving breath.");
	//if not sex’d:
	if(flags["FUCKED_TEXAN_CUSTOMS"] == undefined)
	{
		output("\n\n<i>“Ex-excuse me. I need to, um.. bathroom...”</i> she mumbles, jumping up from her desk and scampering off, her bovine tail tucked tight.");
		output("\n\nOgram grunts as she vanishes into the restroom. <i>“Bigger </i>that<i>, slut.”</i>");
	}
	//if sex’d:
	else
	{
		output("\n\n<i>“O-oggy! Stop! It’s too... too much. Too much!”</i> Amma groans, biting her lip, trying not to just moan like a whore.");
		output("\n\nOgram chuckles, <i>“Just a little more, slut. Hang in there....”</i>");
		output("\n\n<i>“Aaaaah. Stopitstopitstopit,”</i> Amma moans, finally breaking down and crying out, her hand disappearing under her skirt. It doesn’t take much more before her voice reaches a crescendo and her tits erupt in a little squirt of milk that soaks right through her shirt, drenching her in her own lactic lust. With a grunt, Amma face-plants on her desk, her big, pillowy tits cushioning the fall. ");
		output("\n\n<i>“Bigger </i>that<i>, slut,”</i> Ogram laughs as the cow-girl cums her brains out.");
		pc.lust(4);
	}
	processTime(6);
	
	talkToAmma(false);
	removeButton(1);
	addDisabledButton(1,"Who'sInCharge","Who'sInCharge","You're already talking about that.");
}

//Herself
public function askAmmaAboutHerSelf():void
{
	clearOutput();
	author("Savin");
	showName("\nAMMA");
	showBust("AMMA");
	//{Unlocks <i>“Ogram”</i> talk option}
	flags["OGRIM_UNLOCKED_FROM_AMMA_TALK_MENU"] = 1;
	output("<i>“So, tell me about yourself,”</i> you say, inching a little closer to the cow-girl.");
	output("\n\n<i>“Aw, you’re sweet,”</i> Amma says with a big smile. <i>“I’m just a lil’ native cow. Born and raised on NT! My ancestors came over with the first colonists, even, so I’m as pure Texan as you can get.”</i> She beams, swelling with pride at her family lineage.");
	output("\n\n<i>“Let’s see... I got the Treatment when I was eighteen. Even before that, though, I was a little cow-ish. We’ve been gene-modding ourselves for ages, you know? Ever since we came to NT. I had my horns and a pretty great rack just naturally... through the Treatment really made a woman out of me!”</i> she says, puffing out her prodigious chest. One of the buttons on her shirt pops off, rolling across the desk. <i>“Oopsie! Anyway, I didn’t really want to be just a dairy cow, so... I got a job here with Oggy as a greeter. Big T. says I do a great job of making newcomers feel super welcome here!”</i>");
	output("\n\nOgram chuckles. <i>“I’ll say. One look at those tits and any man’d want to stay here forever.”</i>");
	output("\n\n<i>“Yep!”</i> Amma smiles. <i>“I even had one guy propose to me, right on the spot. He was so cute... he even got the Treatment later!”</i>");
	output("\n\n<i>“He’s right here, too,”</i> Ogram grunts.");
	output("\n\nAmma looks over your shoulder and blows him a kiss. <i>“Love you, babe!”</i>");
	output("\n\n<i>“Yeah, yeah,”</i> he says with a little chuckle, catching it out of the air.");
	processTime(6);
	talkToAmma(false);
	removeButton(2);
	addDisabledButton(2,"Herself","Herself","You're already talking about that.");
}

//Ogram
public function askAmmaAboutOgram():void
{
	clearOutput();
	author("Savin");
	showName("\nAMMA");
	showBust("AMMA");
	output("You whisper so as not to be overheard, <i>“So... you and Ogram?”</i>");
	output("\n\nAmma nods. <i>“Uh-huh! He was a big ol’ mercenary or something who came through with some kind of important, snooty executive-type. We got to talking while they were coming through customs, and I guess Oggy just fell in love! He couldn’t even get out of the building before he was asking me to marry him! He got down on a knee and everything! It was soooo cute. He’s such a romantic, under all that grumpy.”</i>");
	output("\n\n<i>“So, did you say yes?”</i>");
	output("\n\n<i>“Weeeelllll,”</i> Amma says coyly, <i>“We don’t really do the whole marriage thing on NT. But I told him if he got the Treatment, and he wanted to be with me... I couldn’t believe he actually did it! Just to stay with me.”</i>");
	output("\n\nAmma rests her chin in her hands, staring past you to the burly bull-man behind you. <i>“He’s a great big sweetheart, my Oggy.”</i>");
	processTime(4);
	talkToAmma(false);
	removeButton(3);
	addDisabledButton(3,"Ogram","Ogram","You're already talking about that.");
}

//Sex
public function sexChatWithAmma():void
{
	clearOutput();
	author("Savin");
	showName("\nAMMA");
	showBust("AMMA");
	//{First time:}
	if(flags["FUCKED_TEXAN_CUSTOMS"] == undefined)
	{
		output("Pulling yourself up onto Amma’s desk, you lean in and ask the busty, bovine bimbo if she’d be willing to give you a more intimate introduction to her planet. She gives you a lusty grin and leans in, giving you a close-up view of her massive, bovine cleavage. Your mouth is all but watering already.");
		output("\n\n<i>“Maaaybe,”</i> she teases, inching closer.Those big swells of cowflesh are practically rubbing up against you, now.");
		output("\n\nJust as she’s about to make contact, a hand grabs your [pc.butt], squeezing hard. You just about jump out of your skin as Ogram growls into your ears, <i>“But we come as a pair, Amma and I. Think you can handle the two of us, " + pc.mf("buddy","beautiful") + "?”</i>");
		output("\n\nAmma grins, pressing her twin melons against you. <i>“Ready for the fuck of a lifetime, [pc.name]?”</i>");
	}
	//{Repeat}:
	else
	{
		output("<i>“So... how about you and Ogram take a break. You’re working too hard.”</i>");
		output("\n\n<i>“I’m up for it,”</i> Ogram says, standing.");
		output("\n\n<i>“Awesome!”</i> Amma grins, already starting to pull her shirt off. <i>“I was hoping you’d ask.”</i>");
	}
	processTime(1);
	clearMenu();
	if(pc.hasCock())
	{
		if(pc.cockThatFits(chars["AMMA"].vaginalCapacity(0)) >= 0) addButton(0,"Spit Roast",spitRoastAmmoOnYerDicks,undefined,"Spit Roast","Spitroast Amma. Ogram gets her mouth, you get her pussy.");
		else addDisabledButton(0,"Spit Roast","Spit Roast","You're too big to spitroast her.");
	}
	else addDisabledButton(0,"Spit Roast","Spit Roast","Spitroasting Amma requires you to have a penis of some kind.");
	addButton(1,"ServiceOggy",worshipZeBullCawk,undefined,"Service Oggy","Help Amma orally service Ogram's dick. Really get in there and give it the worship it deserves.");
	addButton(14,"Back",approachDatCowGalRepeat);
}

//Ogram and Amma Sex
//Spitroast Amma
//PC needs teh cock
public function spitRoastAmmoOnYerDicks():void
{
	clearOutput();
	author("Savin");
	showBust("AMMA","OGRAM");
	author("Savin");
	showName("AMMA &\nOGGY");
	var x:int = pc.cockThatFits(chars["AMMA"].vaginalCapacity(0));
	if(x < 0) x = pc.smallestCockIndex();
	output("At the cow-girl’s invitation, your hands quickly find their way onto Amma’s hips, pulling the ditzy cow up against you. She gives a gasp of a moo, her spankable ass grinding into your [pc.crotch] while her long, slender tail wraps affectionately around");
	if(pc.legCount > 1) output(" one of");
	output(" your [pc.legOrLegs]. Your wandering hands sink into her fleshy figure, caressing her wide hips before slipping up under her blouse, tracing along her bare, hot flesh and up to the shirt-straining mounds of her milky tits.");
	output("\n\nAmma’s breath catches as your fingers squeeze around her huge breasts. <i>“Aaah! You go right for it, don’t ya?”</i> she giggles as your fingers dig into her pliant titflesh, a slight moan escaping her lips, growing louder as you work your fingers into her bosom.");
	output("\n\nAs you do, Ogram finally steps up and makes short work of Amma’s shirt, pulling it off her with practiced, easy motions. You flash the big bull a grin as your hands are laid bare, just in time for the first little trickle of milk to spurt out of Amma’s jugs, spilling across your digits and onto the floor. Her voice crescendos into a high, blissful moo as you go from groping to milking, her lactic lust pouring onto the floor - and into convenient drains beneath her desk. As you work around her big, teat-like nipples, Ogram grabs the undersides of her tits, giving them just enough squeeze to make her cry out. He silences her with a kiss, pulling the cow away from you and into his powerful grasp.");
	output("\n\nStill, in his arms, she’s bent over and wiggling her ass and tail. You release the cow’s breasts and move down to her other big, fleshy mounds, slipping your hands up under her skirt and grabbing her ass. Her tail swerves as you hike her skirt, finally getting a good look at her big, plump derriere");
	//if repeat:
	if(flags["FUCKED_TEXAN_CUSTOMS"] != undefined) output(" and the buzzing pair of vibrators still teasing her holes");
	else output(". And now you finally see why Amma’s always looking so uncomfortable: there’s a pair of tiny bullet vibrators buzzing away, one in each hole. Seeing your face, Ogram laughs: <i>“What, surprised? I can’t be plowing her cunt all the time, can I?”</i>");
	output(" You pull the bullet vibes out of her, earning a sharp gasp from the passive little cow and a slick spurt of excitement from her clearly ready cunt.");
	output("\n\nAmma breaks her kiss with Ogram to give you a wink over her shoulder. <i>“Go ahead and fuck me, [pc.name]. Oggy’s got me soooo ready for you!”</i>");

	output("\n\nThat’s an invitation that’s hard to turn down. You shrug yourself out of your [pc.gear] and grab [pc.oneCock]");
	if(pc.isCrotchGarbed()) output(", finally freeing your turgid rod from the confines of your [pc.lowerGarment]");
	output(". Amma gasps happily as your prick flops onto her back and wiggles herself back against you, grinding your [pc.cock " + x + "] into crack of her ass. You shudder with pleasure as she puts just the perfect amount of pressure on your cock, squeezing it between her plump cheeks and riding it up and down. You give her a sharp swat on the ass, making her jiggly butt bounce. Another spank, and she squeals in delight -- and quickly finds her mouth plugged full of Ogram’s lengthy bovine dong. Her cry of pleasure is muffled into a low, husky moan around Og’s dick, but she’s hardly complaining about it: indeed, her slim tail swishes faster as she starts to suckle on her lover’s rod.");

	output("\n\nYour own hand slips down between Amma’s legs, brushing across the wet gash between her legs. She shivers happily at your touch, spreading her legs nice and wide as a brace of your digits slide easily into her, spreading her slutty hole out for you. God <i>damn</i> she’s wet, almost like an ausar the way she’s all but drooling her excitement across your fingers. You pull them out and ");
	//if Treated:
	if(9999 == 0) output("eagerly lick them clean, eager for a taste of this cow ready to be bred");
	else output("wipe them clean across the shaft of your prick, giving yourself a slight coating of all natural cow-lube before you take the plunge");
	output(". You take a preparatory breath and grab Amma’s hips in both hands, steadying the rocking slab of rump and sliding your own [pc.hips] forward into her.");

	output("\n\nYou hear a muffled cry of pleasure belt out around Ogram’s throat-stuffing bullcock as your cock slides into the boiling, sodden slit between the buxom cow’s legs. Amma’s pussy easily parts to allow you entry, completely unresistant to your thrust -- but when you hilt yourself in the cow, your crotch pressed tight against her bubble butt, she squeezes hard: not enough to stop you, she’s much too wet for that, but enough to make it feel absolutely incredible when you pull out of her, every muscle in the bimbo bovine’s cunt massaging your rod until just the tip is still spreading her open.");
	pc.cockChange();
	output("\n\n<i>“Like that, huh?”</i> Og grins, taking the cow by the horns and pulling her face into his groin, hard enough to nearly rip her from your grasp. <i>“Come on, harder, slut! Put that tongue to work.”</i>");
	output("\n\nAmma moans, but a moment later wrings a grunt of pleasure from her lover as she apparently fulfils his wish. Her hands shift down from his waist to his balls, both hands cupping worshipfully around the bull’s massive, swinging nads, squeezing just enough that you can see the hefty balls inside the sack shift around under her ministrations. One of his hands moves from horn to head, gently stroking Amma’s hair as she sucks and fondles, clearly hitting just the right spots on her bull.");
	output("\n\nAnd on you, too. Amma’s cunt alternates between vice-like tightness and so loose you practically fall back into her, working you up into a pounding frenzy as you desperately try to get more of her bovine pussy, drowning in the sensation of her slit around your [pc.cock " + x + "]. You grab Amma’s tail, giving it just enough of a pull to make her cry out and clench down, using it to ram yourself deeper still inside the slutty cow, slapping into her ass hard enough to make the soft flesh bounce and jiggle madly as you hammer home again and again. Amma’s sexy moans devolve into feral, animalistic grunts of pleasure that come out wet and half-muffled as Ogram continues to forcefully face-fuck her, his own hips pistoning until his sack slaps against her drool-slathered chin.");
	output("\n\nSuddenly, Og grunts, slamming himself hilt-deep in Amma’s throat. The cow gags and squirms around on your cocks, unable to escape as the bull bellows loudly and cums; all you see is his heaving chest and a thick waterfall of backed-up spooge pouring back out around his cock, splattering on the floor. The cow-girl’s body reacts to the mouthful of cum on instinct, her hands and mouth working overtime to suckle out every drop of seed from the well-hung bullman. Despite her attention fixated on Og, the cow certainly isn’t ignoring you: spurred on by the taste of spunk, her cunt contracts hard around you, milking your [pc.cock " + x + "] like a machine as you thrust in, every second a different muscle squeezing or caressing your shaft as you glide through her sultry, sodden snatch.");
	output("\n\nWith a final groan of pleasure, Og pulls out of Amma’s face, slumping back against his desk and leaving the cow dripping his seed down her chin. She shoots a white-stained grin over her shoulder and winks at you. <i>“You too, cutey! Give it to me from both ends!”</i>");
	output("\n\nYou give her a swat on the ass, a sharp reminder that you’ll cum in your own time... but that time isn’t far off. You pick up the pace, driven on faster by the lustful look on the cowgirl and the amazing skill she’s putting on display around your thrusting cock. You’re going to make her work for it, though: you push her forward with a particularly potent thrust, shoving her against Og’s desk; she grabs it for support, fingers digging into the hardwood and giving her something to brace against as you drill her.");
	output("\n\nFucking her like that, you aren’t going to hold out much longer... and you can’t say you really want to. Amma’s cum-hungry look is practically begging for you to pump her full of jizz, and her pussy is all but demanding it, working hard to drain your [pc.balls] for all you’ve got. A few more thrusts are all you can manage before a sudden, urgent pressure in your [pc.cock " + x + "] surges up; you work on instinct to slam yourself deep into Amma’s backside, [pc.hips] pounding into her squishy behind and burying your cock as far in as you can before you cum. The cow lets outs a low, happy moo as you finally let loose, shooting a thick wad of spooge into the sultry depths of her slit.");
	output("\n\n<i>“Ah! Ooohhh yes! Just like that, [pc.name]! Feels so gooood,”</i> she moans, rocking her hips back against you to get every bit of dick into her sweltering hole as she can. She’s sucking the seed out of you, draining spurt after spurt from your spasming cockhead until your [pc.cumColor] seed is drooling out of her well-fucked cooch, pooling on the floor just like Og’s load before it. Amma clamps down hard around you, tighter than ever as you blow your load, keeping you fully lodged inside her until you’re utterly spent, left panting and shuddering as her muscles continue to massage your over-sensitive shaft.");
	output("\n\n<i>“Fuck. Keep that up and I’m gonna be hard again before you’re done,”</i> Og laughs, pulling himself up onto his desk beside the cow-girl and giving her a pat on the behind.");
	output("\n\nYou pull yourself out of Amma a moment later, taking a towel from Og when he offers and cleaning yourself up. You really got yourself messy, now that you look at yourself: all slathered in cum and Amma’s juices, sweat and milk staining your [pc.skinFurScales]. You sigh contentedly as you wipe up, occasionally glancing up at the drooling cow-cunt still bent over and stretched wide. Amma herself seems content to stay bent over, resting against her lover’s desk and looking up at him dreamily.");
	output("\n\n<i>“Well, thanks for sharing you two,”</i> you say, grabbing your gear.");
	output("\n\n<i>“Any time!”</i> Amma grins, giving you a parting butt-wiggling as you pass. <i>“We should do this again, next time you pass by!”</i>");
	output("\n\n<i>“Definitely,”</i> Og chuckles. <i>“See you around, " + pc.mf("buddy","beautiful") + ".”</i>");

	processTime(30+rand(15));
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Worship Bullcock
public function worshipZeBullCawk():void
{
	clearOutput();
	showBust("OGRAM","AMMA");
	author("Savin");
	showName("OGGY &\nAMMA");
	output("<i>“What do you two " + pc.mf("","girls ") + "say about giving this bad boy a little love, huh?”</i> Ogram says, his fingers eagerly working his belt off. He pulls it, and Amma almost instantly has her hands around his pants, tugging them down with aplomb to reveal the huge swell of her lover’s growing bovine erection, the long, slender pole of cow-meat rapidly rising to its full, intimidating height. Amma takes a long, full whiff of him, her overburdened chest swelling as she drinks in the potent, masculine scent of her lover’s animalistic erection.");
	output("\n\nAmma’s fingers wrap around Og’s cock, holding the lengthy pole at full mast as she runs her nose across it from stem to crown. Her eyes all but roll up in her head, lids fluttering as she succumbs to the meaty, earthy musk of pheromones radiating off of Ogram’s manhood. ");
	//if PC is Treated-feminine:
	if(pc.isTreated() && pc.isBimbo()) output("You smell them too, your heightened fuck-dar going on high alert as Amma starts to gently stroke Ogram’s cock. You nearly fall to your [pc.knees] as his virile scent, the scent of a breeder ready and eager to fuck, nearly overwhelms your lust-addled, Treated mind.");
	else output("You can’t deny the odor, either: the air’s soon thick with it, now that Ogram’s cock is out and being gently caressed by the busty bimbo before him: an aroma that nearly makes your [pc.knees] wobble with mounting desire.");

	output("\n\nAs Amma slides down onto her knees before him, you’re treated to a front-row view of her big, plump asscheeks poking out from under her too-sheer skirt, totally shameless as she bares her cheeks to you. ");
	//if not sex’d before:
	if(flags["FUCKED_TEXAN_CUSTOMS"] == undefined) output("And under her skirt, you finally see why she’s always looking so damn uncomfortable: from her stocking, you can see a pair of tiny wires creeping up her thigh and spreading apart, vanishing up both her holes: looks like Ogram’s got her rigged up with a pair of bullet vibes!");
	else output("Her pair of buzzing bullet vibes are on proud display, teasing her holes like a pair of drilling fingers as she handles Ogram’s meat.");
	output(" Flashing you a knowing look, Og reaches back around his desk as presses a key on his holo-terminal. Amma instantly gasps, biting her lip to contain a sexual moan as her pair of vibrators kick into high gear, tormenting her drooling pussy and tight little ass even as she’s lavishing affection on her lover’s shaft.");

	output("\n\n<i>“Come on, cutie!”</i> Amma says, pulling herself off Og’s dick long enough to look back at you. <i>“Or do I have to do this all myself?”</i>");

	output("\n\nOg laughs. <i>“Maybe [pc.he] just likes to watch.”</i>");

	output("\n\nBetween their teasing and the mounting musk pouring from between Og’s legs, your willpower finally snaps. You slip down beside Amma, gently pushing the cow aside and taking hold of Ogram’s rod. The cow-girl giggles as she surrenders her post to you, shifting herself off to one side of her lover’s enormous rod while you take the other. Like her, you spend a moment letting the intoxicating aroma fully strip away what remains of your willpower");
	//treated
	if(pc.isTreated() && pc.isBimbo()) output(", your sense of self and decency, all hints of civilized behavior from your former, pre-Treated life crumble away");
	output(". Your mind is left with only one, overpowering and all-consuming thought: cock.");

	output("\n\nYour fingers brush across the hard, hot length of Ogram’s shaft, tracing down along the veiny tool until you find the thick, densely-packed mound of pubic hair surrounding its sheath and, below that, the meaty sacks of his balls. Og’s breath catches in a pleasured gasp as your " + pc.mf("","<i>dainty</i> ") + "fingers circle his apple-sized nads, gently cupping and hefting them. God, they’re so <i>full</i>... you can practically hear them sloshing with pent-up seed as you caress the swollen sack, gently rolling the heavy orbs between your worshipful fingers. With a grunt, Ogram slumps back against the desk, supporting himself as sensation washes across his rod and sack as both you and Amma explore the mass of cockflesh on offer. ");

	output("\n\n<i>“Take it easy down there, " + pc.mf("buddy","beautiful") + ",”</i> Og says, planting one of his huge, powerful hands atop your head");
	if(pc.earType == GLOBAL.TYPE_FELINE || pc.earType == GLOBAL.TYPE_CANINE) 
	{
		output(", right between your ");
		if(pc.earType == GLOBAL.TYPE_CANINE) output("canid");
		else output("feline");
		output(" ears");
	}
	output(". It takes a moment to settle in just how right that feels, you on your [pc.knees] before a towering male, worshipping at the aromatic altar of his manhood, his strong arm guiding you gently to your task; by now, it’s impossible to ignore just how ");
	if(pc.hasCock()) output("hard");
	else if(pc.hasVagina()) output("wet");
	else output("hot");
	output(" you are. You shudder at the thought... and the wafting, masculine fragrance now so close to your nose, assaulting your every sensation until your body reacts on instinct, your [pc.tongue] reaching out to caress the massive swell of the male’s testes, licking up from bottom to top, almost drawing one of the hefty orbs into your mouth.");
	output("\n\n<i>“That’s how you do it!”</i> Amma cheers, giving you a sultry wink from across the bull’s bow before leaning in to work on the other nut. Between the two of you, you’re soon slathering Ogram’s balls in licks, kisses, and gentle nibbles, watching with bated breath as his massive cock dangles between you, so long that it can’t properly stand on its own. The magnificent manhood throbs powerfully as you suckle Og’s nuts, excitedly jumping up by inches to the quickening beat of its owner’s heart.");
	output("\n\nSlowly, you start to make your way upwards from the heavy, fleshy orbs of Ogram’s balls, leaving the spit-slick, glistening black sack for harder pastures. Amma joins you in an oral pilgrimage upwards to the base of Og’s sheath, your tongues burying into the fuzzy pubic mound between his legs and eliciting a grunt of approval from the big bull. You lick up and around the thick base of his cock, meeting Amma’s tongue halfway across; your tongues briefly intertwine, letting you taste Og’s balls once again, still fresh on his lover’s salivating tongue, before you begin you arduous journey up his shaft.");
	output("\n\n<i>“Fuck... that’s the stuff....”</i> Ogram breathes huskily as you and Amma almost kiss around his cock, his hands guiding each of you gently upwards when you part. You eagerly obey him, letting the bull guide you slowly along the long, fist-thick bovine member suspended between yourself and the bimbo cow opposite you. You can’t suppress a shudder as you finally get your first taste of Og’s cock, the thick, animalistic flavor sending ecstatic shivers through your eager body. It feels... it feels <i>right</i> to service this cock, to worship it.");
	//???
	if(!pc.isTreated() && !pc.isBimbo()) output(" Some part of your mind still rebels against this cow-like mentality, until you get another full, deep breath of Ogram’s potent musk, and happily simmer back into a puddle of fuck all too happy to spitshine the beautiful animalistic manhood at your lips.");
	else output(" Your Treated mind revels in its new purpose, easily accepting your place of devotion to Ogram’s cock, simmering in the pheromone-induced puddle of fuck that you’ve become, all too eager to lick and kiss your way up his animalistic prick.");
	output("\n\nYou mewl with desire as your [pc.lips] lock around the half-cock allotted to you, almost kissing Amma, so close that you can feel her breath hot on your lips... or maybe that’s just the heat welling off of Ogram’s member? You can’t tell anymore... and frankly, you’re not sure if you care. Your eyes flutter as your [pc.tongue] teases across the sweltering underside of the bull’s masculinity, drowning you in his salty, musky taste. You could almost cum just from his member on your lips, his thick pre on your tongue.");
	//if not Treated:
	if(!pc.isTreated() && !pc.isBimbo()) output(" Is this what it’s like to be Treated? God, you almost want to find out....");

	output("\n\nIt takes you minutes to work your way up to the crown of Ogram’s cock. Time blurs as you and Amma work, your bodies swaying like branches from the trunk of Og’s member as he guides you up and down his mammoth length, again and again until his crimson cockflesh is glistening with wetness, all but drooling as you and Amma slavishly shine him down. Only the sudden emptiness as your mouth closes around air breaks you out of your lustful trance, bringing you back to the realization that you’ve come to the pointed tip of Ogram’s manhood. You lock eyes with Amma for a split second, and get the cow’s approving nod. Looks like she really is willing to share her big ol’ bull with you! You  give her the biggest, dopiest smile you can manage through your cockhungry haze and lock your lips around the head of his cock.");
	output("\n\n<i>“Just open wide and hold still, babe!”</i> Amma says, shifting behind you, her big milky tits pressing into your back, arms locking around you to hold you steady as Ogram begins to press his hips forward into your waiting [pc.lips]. Your gag reflexes cut in, nearly choking you on the incredibly lengthy cock being fucked into your mouth until ");
	if(!pc.isTreated() && !pc.isBimbo()) output("you desperately suppress it, too eager for a taste of Ogram’s seed to be deterred");
	else output("your Treated instincts kick in, and you suddenly relax at the masculine intrusion");
	output(". The sheer force of his insertion nearly pushes you back, but Amma’s quick to catch you, resting your head into her pillowy-soft chest, letting you ease back into the squishy cow-tits as Ogram spreads your throat wide on his cock.");

	output("\n\n<i>“Nice and tight,”</i> he says with a grunt of approval as his hefty nads knock against your chin. <i>“Awesooome.”</i>");
	output("\n\n<i>“[pc.He]’s pretty great, huh?”</i> Amma teases, shifting her tits around your head. <i>“Don’t hold on for me, Oggy! I can get a load any time, after all...”</i>");
	output("\n\nHe laughs, and plants his big hands on your shoulders. <i>“So generous today. Alright, " + pc.mf("buddy","beautiful") + ", just stay still a minute more.”</i>");
	output("\n\nYou’re not sure you can wait that long... but by God you’ll try. Anything is worth the sweet release of your bullish mate. He starts to thrust, fucking your mouth like an onahole, pounding you back into the soft buffer of his lover’s udders, her flesh rippling with every impact as his speed mounts. Faster and harder, each thrust carrying his titanic cock deeper inside you until your stomach feels like it’s bulging with his sheer length, your throat stretching like a well-trained pussy around him. You can feel every pulse of his heartbeat through his cock now, every shudder he makes as you pleasure him, the swelling of his member as your tight throat brings him to orgasm.");
	output("\n\n<i>“Deep breath!”</i> he shouts, moments before he cums. You have just enough time to do so before he rams his cock down to the hilt and unloads, bypassing your mouth entirely and shooting his wad right into your gut. You gasp and gag, unable to breathe as he cums, bloating your belly with a monstrous load of seed. You’re all but seeing stars by the time he starts to withdraw, still spewing spunk into you from his visibly lightening balls. The tip pops out of your mouth just at the tail end of his climax, blasting your tongue with a thick spray, following by your face and Amma’s, marking you both as Ogram’s bitches. You both eagerly open wide for the bull’s load, happily accepting his seed as it sprays across your faces until you’re dripping with it.");
	output("\n\nYou’d probably have collapsed if not for Amma behind you, gently rocking you as Ogram finishes with you. <i>“You did good, honey!”</i> she coos, her breath hot and heavy against your [pc.ear]. <i>“Oggy hasn’t shot a load like that in ages!”</i>");
	output("\n\nHe chuckles. <i>“She’s being modest, " + pc.mf("buddy","beautiful") + ". But seriously: if you suck cock that good, you’re welcome back any time.\”</i>");
	if(pc.hasCock()) 
	{
		output(" <i>“I might even share Amma with you, if you play your cards right.”</i>");
		output("\n\nShe swats him on the knee.");
	}
	output("\n\nYou give the pair a half-conscious nod as you’re helped up and start to collect your gear.");
	processTime(15);
	pc.lust(20+rand(10));
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Use Machine
public function useDaMilkar():void
{
	clearOutput();
	author("Savin");
	showName("\nCARRIE");
	showBust("CARRIE");
	//{PC doesn't have a dick}
	if(!pc.hasCock())
	{
		showName("MILKER\nOPERATOR");
		output("You step up to the cow-girl sitting on the stool and ask if you can use the machine here. The busty bovine looks up, looks you up and down, and giggles. <i>“Sorry, honey. I don’t think you... uh... have the right bits and pieces to use this machine.");
		if(pc.biggestTitSize() >= 1) output(" Why don’t you head on down to one of the other stalls? I’m sure the girls there will treat you right!”</i>");
		else output(" Maybe you ought to go down to the gift shop and ask Ellie for some enhancements, that way you can use the other machines, at least!”</i>");
		processTime(1);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
		return;
	}
	//{First time, PC has a dick}
	if(StatTracking.getStat("milkers/prostate milker uses") == 0)
	{
		output("You step up to the cow-girl sitting on the stool and ask if you can use the machine here. The busty bovine hops up and beams at you. <i>“Hey there! Sure you can, all the milkers - even this big lug - are open to visitors. My name’s Carrie, and I’ll be taking care of you while you use it, okay? Before we get started, I gotta tell you: unlike the normal milkers, the boy-milker here’s pretty involved. You’re gonna have to have me walk you through using it the first time at least, so I hope you’re comfortable with a girl seeing you naked.”</i>");
		clearMenu();
		//[Okay] [No thanks]
		addButton(0,"Okay",okayEllieYaCuntLetsMilkMeFirstTime);
		addButton(1,"No Thanks",FirstManMilkUseNoThanks);
	}
	//Repeat
	else
	{
		output("When you approach, Carrie hops up and flashes you a big, doe-eyed smile. <i>“Hey there, [pc.name]! You here to use the boy-milker again? If so, since you’ve used it before, you can go on ahead without me if you want... or would you rather I stick around and help you out? I don’t mind either way!”</i>");
		clearMenu();
		//Use w/ Carrie
		addButton(0,"w/Carrie",okayEllieYaCuntLetsMilkMeFirstTime,undefined,"w/Carrie","Ask Carrie to help you out in the milking stall. A little companionship never hurt, either.");
		//Use w/o Carrie
		addButton(1,"w/o Carrie",useTheMilkerWithoutCarrieYaSkag,undefined,"w/o Carrie","Tell Carrie you can get yourself situated.");
		addButton(14,"Leave",mainGameMenu);
	}
}

//No Thanks
public function FirstManMilkUseNoThanks():void
{
	clearOutput();
	author("Savin");
	showName("\nCARRIE");
	showBust("CARRIE");
	//{PC will get First Time interactions until they decide to go through with it}
	output("If that’s the case, no thank you.");

	output("\n\nCarrie shrugs. <i>“Suit yourself, sugar. I’m sure there’s plenty of girls who’d be happy to take care of you if you get too pent up, so no worries!”</i>");
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Okay
public function okayEllieYaCuntLetsMilkMeFirstTime():void
{
	clearOutput();
	author("Savin");
	showName("\nCARRIE");
	showBust("CARRIE");

	//if First time: 
	if(StatTracking.getStat("milkers/prostate milker uses") == 0) output("You nod and introduce yourself in turn. ");
	output("The auburn-tressed cow-girl grins and leads you into the stall, shutting the door behind you, flipping a little lock that turns on an OCCUPIED sign on the door. <i>“Not a lot of bulls need to use the boy-milker here - that’s a prostate milker if you want to get fancy - so you get to have some privacy, at least. Well, aside from me, anyway! Don’t worry, you’ll barely know I’m here. Unless you want to, anyway,”</i> Carrie says, giving you a little wink. <i>“");
	if(!pc.isNude()) output("Anyway, let’s get you out of those clothes, alright?”</i>");
	else output("I’ll hold onto your gear for you, alright?”</i>");

	output("\n\nA little nervously, you do as the cow asks, stripping off your [pc.gear] and handing your equipment over piece by piece. Carrie lays it all out on a small table inside the stall before turning back to you, giving you a reassuring smile even as her wandering eyes take in your nude form. <i>“Alrighty then! Let me help you get strapped into the machine here,”</i> she says, practically skipping back to your side and indicating ");
	if(!pc.isBiped()) output("for you to just step up onto and over the machine, putting the weight of your belly onto it -- <i>“don’t worry, it can take your weight, no problem!”</i>");
	else output("a pair of stirrups at one end, and a handlebar at the other. With a little help from your bovine assistant, you’re able to hop onto the machine and, at her instruction, lay face-down atop it.");
	output(" Thankfully, a lining of wool padding separates most of your bare [pc.skinNoun] from the cold hard steel of the machine. Carrie adjusts the straps around your [pc.legOrLegs], making sure you’re nice and snug.");

	output("\n\n<i>“Pretty as a picture, stud!”</i> she cheers, taking a step back. <i>“Now, let’s get your bits and pieces tucked away down here,”</i> she adds, stepping behind you and reaching");
	if(pc.legCount > 1) output(" between");
	else output(" around");
	output(" your [pc.legOrLegs]. Your breath catches as her slender, strong fingers wrap around your [pc.cock], hefting your flaccid length and guiding it into the nearest of the many padded holes in the machine.");
	if(pc.cockTotal() > 1) 
	{
		output(" Carrie repeats the process for your remaining cock");
		if(pc.cockTotal() > 2) output("s");
		output(", guiding ");
		if(pc.cockTotal() == 2) output("it");
		else output("them each");
		output(" into one of the other holes beneath you.");
	}
	output("\n\nOnce ");
	if(pc.cockTotal() == 1) output("it’s");
	else output("they’re");
	output(" in, she gives you a couple friendly tugs until you’re nice and rigid before turning to you and saying <i>“There we go, " + pc.mf("handsome","cutie") + "! There’s a little dial on the side of the machine - just twist it up and down to set how snug your little ");
	if(pc.cockTotal() == 1) output("buddy is");
	else output("buddies are");
	output(" down there. You want a nice, tight grip, but not uncomfortable. Trust me, you’ll be bucking your hips into ");
	if(pc.cockTotal() == 1) output("that hole");
	else output("those holes");
	output(" like crazy when we get started!”</i>");

	output("\n\nYou give her a nod and adjust the dials as she instructed, making sure your [pc.cocks] ");
	if(pc.cockTotal() == 1) output("is");
	else output("are");
	output(" nice and cozy in the softly padded, almost slick, holes. Once you’re finished and give Carrie the thumbs up, she steps back up to you with a big pink bottle in her hand. <i>“Almost set, sugar. I’m just gonna make sure you’re nice and ready for Mister Floppycock up there, and you’ll be ready for the ride of your life!”</i>");
	output("\n\nCarrie snaps on a latex glove and squirts a nice, thick handful of what can only be lube into her gloved palm. She rubs it between her fingers before reaching back to your [pc.butt] and wiping them through the crack of your ass. You wince at the sudden cold sensation, but manage to make yourself relax as a pair of her fingers begin circling, and then incessantly pressing in against, your [pc.asshole]. <i>“Just relax, babe. You’ll be glad you had a little help when we get started,”</i> Carrie coos soothingly, gently working a pair of her fingers into your ass. You bite your lip, trying not to groan too much as she gently spreads a nice, thick coat of lube through your anal passage.");
	output("\n\n<i>“If you ask me, this is how it ought to be,”</i> Carrie says conversationally as she fingers your behind. <i>“No need for this crazy ol’ machine, when you’ve got a cow with talented fingers at your beck and call! But that’s just me,”</i> she adds with a giggle, one of her fingers putting just enough pressure on your prostate to make your [pc.cocks] jump in ");
	if(pc.cockTotal() == 1) output("its restraint.");
	else output("their restraints.");

	output("\n\n<i>“All set!”</i> she says after another minute, pulling her lube-drenched fingers from your now equally-soaked behind. <i>“That ought to keep you nice and comfy while Mister Floppycock does his business. If you feel like you need more, don’t hesitate to ask, okay? This is supposed to be fun and, more importantly, feel really good. Just holler if you need something, okay? I’ll be right here with you the whole time, sugar. So lie back, relax, and get ready to cum buckets!”</i>");

	output("\n\nWith that, Carrie step back to her stool, dims the lights to a dark, moody hue, and presses a big red button next to the door. <i>“Have fun!”</i>");

	pc.lust(15);
	processTime(5);
	//[Continue to PROSTATE ABUSE WHOO]
	clearMenu();
	addButton(0,"Next",savinAbusesYerButtBecauseThatsHowHeLikesIt);
}

//Use w/o Carrie
//Tell Carrie you can get yourself situated.
public function useTheMilkerWithoutCarrieYaSkag():void
{
	clearOutput();
	author("Savin");
	showName("\nCARRIE");
	showBust("CARRIE");

	output("You tell Carrie that you’ll be fine without her help.");

	output("\n\n<i>“You sure, babe? Okey-dokey, then. Job says I have to sit in the room with you, but you can get ahead and get yourself sat down and lubed up. Don’t hesitate to holler if you need help, though - that’s what I’m here for!”</i>");

	output("\n\nYou thank the red-headed cow and step into the stall with her. She closes and locks the door behind you, then sits herself down and hands you a bright pink bottle of lube from the table. You spend a moment ");
	if(!pc.isNude()) output("dressing down, ");
	output("setting your equipment aside on the table before mounting the milking machine. You shift your weight onto it and adjust the straps around your [pc.legOrLegs], leaving yourself nice and");
	if(pc.legCount > 1) output(" spread open");
	else output(" secure");
	output(". You lean back, squirt a nice thick dollop of lube into your palm, and spend a couple minutes getting yourself nice and ready. Your fingers find your [pc.asshole] easily, and with a little breathing exercise, you relax enough to slip yourself inside and slather your inner walls until they’re absolutely drooling with moisture. Perfect!");

	output("\n\nYou set the bottle aside and look back to your bovine attendant, giving her a thumbs up. <i>“Alright babe, just hold on and spread ‘em wide for Mister Floppycock!”</i> Carrie says, flashing you a grin before dimming the lights to a sultry haze of darkness and pushing the big red button next to her stool.");

	pc.lust(5);
	processTime(5);
	//[To Prostate Abuse Whoo!]
	clearMenu();
	addButton(0,"Next",savinAbusesYerButtBecauseThatsHowHeLikesIt);
}

//Prostate Abuse Whoo!
public function savinAbusesYerButtBecauseThatsHowHeLikesIt():void
{
	clearOutput();
	author("Savin");
	showName("\nCARRIE");
	showBust("CARRIE");

	output("With a little mechanical buzz, the machine over your head rumbles to life. You watch with wide eyes as the steel arm slowly lowers from the ceiling, all the lights in the room seeming to concentrate on the long, hard rod. It’s almost majestic - or at least, as majestic as something can be when it has an almost comically oversized pink dildo hanging off of it. The prostate milker’s long arm extends well behind you, almost to the door, before steadily making its way back, finishing its descent at just the right speed so that it reaches you from above and behind at the same moment, coming in at something of a downward angle.");

	output("\n\nA moment later, the machine shifts ever so slightly until the crown of the thick, soft equine dong is pressed against your [pc.asshole]. You wince as a slight pressure builds against your hole, but penetration doesn’t follow... at least for now. Just when you’re about to complain, a booming mechanical voice from one of the machines on the wall announces: <i>“APPROXIMATING MEASUREMENTS. CALCULATING IDEAL VOLUME FOR MAXIMUM PENETRATION. PLEASE WAIT.”</i>");


	output("\n\nYou feel the pressure on your backdoor mount, and the thick cock seems to adjust its size, ");
	if(pc.ass.looseness() >= 4) output("increasing in thickness to suit your gaping, well-used asshole");
	else if(pc.ass.looseness() <= 1) output("shrinking down to better fit your tight backdoor");
	else output("making a few minor corrections to better suit your altogether average pucker");
	output(". When the machine is satisfied, and the dildo pressing in on your [pc.asshole] feels like it’s exactly the biggest dick you could ever possibly hope to take, the arm begins to slide it into you. You give a little cry as you’re penetrated, but the mechanical arm is surprisingly gentle at first, if relentless, as it slowly slides inch after agonizing inch into your lubed-up asshole, steadily feeding you the full foot of its length. Your [pc.cocks] jump");
	if(pc.cockTotal() == 1) output("s");
	output(" in response to the pressure on your backdoor, and again when the crown of the latex cock rubs against the little nub of your prostate. You can’t help but let out a long, low moan as the machine shifts a little weight behind the dildo once it hits your rectal pleasure-bud, making sure that every inch of robotic cock that follows it rubs and teases you through the thin muscles of your anus. Your rod");
	if(pc.cockTotal() > 1) output("s swell");
	else output(" swells");
	output(" to full hardness, straining against the padded hole");
	if(pc.cockTotal() > 1) output("s");
	output(" beneath you.");

	pc.buttChange(Math.round(pc.analCapacity()/2),true,true,false);

	output("\n\nThe machine doesn’t care, though: it mechanically continues its ceaseless advance. Only when you feel the wide, cold steel base of the mechanical arm does the gut-filling pressure finally abate, giving you a moment to catch your breath. Your breath is already coming shallow and ragged as your body struggles to adjust to the overwhelming girth inside you. Your [pc.legOrLegs] strain");
	if(pc.legCount == 1) output("s");
	output(" against the straps, muscles going wild, desperate to escape. All you can consciously do is grip the handlebars at the head of your body-rest and brace yourself.");

	output("\n\nAll that in the span of no more than five seconds, before the machine begins to move again. You try to scream, but your voice fails to come, leaving your mouth agape in a silent <i>“O”</i> of ecstasy as the latex cock inside you pulls back, almost to the crown, before thrusting back in. One long, hard push inwards until it’s hilted inside you. Faster this time, taking only a couple of seconds to bury all twelve inches up your [pc.asshole]. You’re given no time to adjust, and the moment the dildo hilts you, it begins to withdraw again, keeping the same steady speed in, out, and in again. Your [pc.cocks] squirm");
	if(pc.cockTotal() == 1) output("s");
	output(" in the soft, tight grip of the hole");
	if(pc.cockTotal() > 1) output("s");
	output(", reacting to the steadily increasing ass-fucking you’re getting by swelling to full size and starting to drool a bit, little droplets of pre beading on your [pc.cockHeadBiggest].");

	output("\n\nThe machine only moves faster after that, picking the pace up until you feel like a jackhammer’s having its way with you. All the while, pressure continues to shift downwards as the machine hones in on your prostate, massaging it through the thin wall of your ass. The sensation is heavenly, and absolutely overwhelming. You cling to the vaulting horse, clutching at the straps and stirrups binding your limbs for dear life. Over the mechanical whirring and droning of the arm pounding you, you start to hear a high scream of pleasure, growing louder with every second until it nearly drowns out the machine. It takes a moment to recognize the voice as your own, wrent from your mouth in gasps and cries of unadulterated anal bliss.");
	output("\n\nYou can’t hold on long against the unabating force of the prostate milker. Another few thrusts into your abused backdoor, and you feel the sudden rush of orgasm leaping up to claw at your mind. [pc.EachCock] throbs as your prostate is stimulated to climax, sending a thick gout of [pc.cum] rushing into the pussy-tight grip of the cockholster");
	if(pc.cockTotal() > 1) output("s");
	output(" beneath you. You clutch and claw at the rest beneath you as you’re mechanically fucked to orgasm, but the machine doesn’t ease up at all as it drains the first load from you, but steadily continues to fuck your [pc.asshole]. A slight vacuum pressure builds up around your cock");
	if(pc.cockTotal() > 1) output("s as they discharge");
	else output(" as it discharges");
	output(", draining your spooge out of the bodyrest and down through a single thick tube connecting it to another machine on the wall.");
	var firstCum:Number = pc.cumQ();
	var cumTotal:Number = pc.cumQ();
	//if PC has a huge cum volume:
	if(pc.cumQ() >= 5000) output(" You watch as the tube strains and stretches to accommodate your inhumanly massive load, sucking it out as quick as you can produce it.");
	//elseif moderate cumVol:
	else if(pc.cumQ() >= 500) output(" You watch as the tube sucks down your hefty load of spunk, draining it away with mechanical efficiency just as quickly as you can produce it.");
	else output(" You watch as your unremarkable load of spunk is carried away in the blink of an eye by the machine, sucking so quickly that you almost feel like it’s trying to suck another wad out of you on the heels of the first - the dildo still pumping your ass sure is!");
	//Do the first two orgasms now so we can check if the PC has cum left for a third.
	pc.orgasm();
	cumTotal += pc.cumQ();
	pc.orgasm();
	output("\n\nYour orgasm is drawn out by the thrusting latex cock, as if the waves of pleasure will never abate. Worse, when your orgasmic bliss starts to die down, the machine changes tactics: you feel a tiny rumble in your ass, which quickly grows into an outright vibration at the apex of a deep, colon-stretching thrust, sending shivers up your spine. The milker’s turned on a vibe setting, and starts to move even faster, now. A scream tears from your throat as the shivering schlong rams twelve inches deep into you, and you’re barely given time to blink before it hammers back again. The machine never tires, never falters, never skips a beat: it just relentlessly pounds your [pc.asshole] until it wrings another orgasm from you. ");

	output("\n\nYour [pc.balls] churn");
	if(pc.balls > 0) output("s");
	output(" as the mechanical milker pushes you over the edge once again, making you bust a second nut into the waiting mouth");
	if(pc.cockTotal() > 1) output("s");
	output(" of the vacuum-sucker machine. Your cum is spirited away as fast as you can spurt it out, leaving your ");
	if(pc.cockTotal() == 1) output("cock a drooling, half-hard mess to be gently suckled on by the insatiable milker");
	else output("cocks a mass of drooling, half-hard members, gently suckled on by the hungry milkers");
	output(". You don’t even have time to go soft before a third orgasm is wrung from you, your cock");
	if(pc.cockTotal() > 1) output("s");
	output(" spurting ");
	if(pc.cumQ() < 8) 
	{
		output("a few trickles of spunk, which the machine quickly sucks away from your quivering, half-hard member");
		if(pc.cockTotal() > 1) output("s");
		output(". You don’t have much left to give, but the machine continues to relentlessly fuck you, not satisfied until it’s drained every drop");
	}
	else if(firstCum > pc.cumQ()) 
	{
		output("another load, much smaller than the last ones, as your [pc.balls] ");
		if(pc.balls <= 1) output("is");
		else output("are");
		output(" drained one busted nut at a time");
	}
	else output("a third thick, creamy load of virile spunk");
	output(".");
	cumTotal += pc.cumQ();
	pc.orgasm();

	// Breaking the machine starts here!

	// The Price is Right: ONE MILLION DOLLARS!
	var iPriceThreshold:int = 3500;

	// If threshold is surpassed before the cumming is done. 50% Chance:
	var cumEstimate:Number = 0;
	if(pc.cumQ() * 3 >= pc.currentCum()) cumEstimate = pc.cumQ() * 3;
	else cumEstimate = pc.currentCum();
	if ((cumCreditValue(cumTotal + cumEstimate) > iPriceThreshold) && rand(2) == 0)
	{
		output("\n\nAll you can do is tightly grip the vaulting horse supporting you, groaning and crying in pleasure as the machine milks your prostate minute after minute.");

		output("\n\nSuddenly, after an audible disconcerted buzz, you see the machine visibly shake and stutter with laborious force. The tubes connected to [pc.eachCock] writhe and flail like agitated snakes. Something in the back of your mind tells you that if you allow the milking session to continue, you will be sacrificing the structural integrity of the machine.");

		// Branch out some options here:
		output("\n\nDo you let the machine continue pumping you until you are dry?");
		// Break it, you goof.
		addButton(0,"Yes",yesGoMilkarGo,cumTotal);
		// Nah, just stop milking, please.
		addButton(1,"No",noStahpMilkarStahp,cumTotal);
	}
	// Default response:
	else
	{
		output("\n\nAll you can do is tightly grip the vaulting horse supporting you, groaning and crying in pleasure as the machine milks your prostate minute after minute, orgasm after orgasm until your [pc.balls] ");
		if(pc.balls <= 1) output("is");
		else output("are");
		output(" completely drained, cock");
		if(pc.cockTotal() > 1) output("s");
		output(" just drooling trickles of watery spooge into the unabating suction of the collecting pump. Only when you manage to cum on pretty much empty, your [pc.cocks] only shuddering and drooling in response to another anal orgasm, does the machine begin to slow. It takes six more thrusts before it finally manages to draw down to a creeping stop, still half-lodged in your ass, the full brunt of the cock’s crown pressing down on your poor, battered prostate. With agonizing sluggishness, the milker withdraws from you, making sure you feel every inch of vibrating latex prick rumble out of your abused, gaping [pc.asshole]. You’re not going to walk straight for days after this... ");

		output("\n\n<i>“All done!”</i> Carrie announces, hopping off her stool and pressing the red button again. With a satisfied whir, the milker shudders and withdraws back up into the ceiling. Carrie walks over to you and puts a reassuring hand on your battered, bare butt. <i>“Poor thing. I hope Mister Floppycock wasn’t too rough on you. C’mon, let’s get you out of those straps...”</i>");
		//Doing this stuff early so display will have the full total:
		processTime(45);
		cumTotal += pc.cumQ();
		pc.orgasm();
		cumTotal += pc.cumQ();
		pc.orgasm();
		cumTotal += pc.cumQ();
		pc.orgasm();

		// Moving the final blurb for modding:
		carrieFinishedMilking(cumTotal);
	}
}

//Yes
public function sureSellMyCumBabiesFarAndWide(amount:Number = 0):void
{
    // Ahm moovin' nis!
    /*
    var x:int = 2;
    x += Math.round(amount/100);
    if(x > 50) x = 50 + Math.round((amount-5000)/200);

    //honey worth more!
    if(pc.cumType == GLOBAL.FLUID_TYPE_HONEY) x *= 2;
    */
    
    // Insert modular function for cum value:
    var x:int = cumCreditValue(amount);

    clearOutput();
    author("Savin");
    showName("\nCARRIE");
    showBust("CARRIE");
    output("<i>“Sure,”</i> you say, rubbing your [pc.butt].");

    output("\n\n<i>“Great!”</i> Carrie beams, pushing another button. A credit chit pops out of the machine. <i>“Here you go! You ");
    if(amount > 10000) output("gave us so very, very much");
    else if(amount > 1000) output("gave so much");
    else if(amount > 500) output("gave a pretty good amount");
    else output("gave enough");
    output(" that you’ll get " + x + " credits.");
    if(amount > 1000) output(" I’m sure you’ll have a whole bunch of little yous running around the galaxy in no time!");

    output("”</i>\n\nYou thank the cow-girl and take the chit before you stagger off.");

    pc.credits += x;
    processTime(2);
    clearMenu();
    addButton(0,"Next",mainGameMenu);
}

//No
public function noIDontWantToSellBabies():void
{
	clearOutput();
	author("Savin");
	showName("\nCARRIE");
	showBust("CARRIE");
	output("<i>“I’d rather you didn’t,”</i> you say, rubbing your [pc.butt]. ");

	output("\n\n<i>“Aww, you sure?”</i> Carrie says, blinking her big doe-eyes at you. <i>“A lot of mommies would be so happy to get some of your cum!”</i>");

	output("\n\nYou shake you head, and she sighs, turning back to the machine and pressing a button labeled <i>“DESTROY.”</i>");

	output("\n\n<i>“Okay, off to the incinerator it goes.”</i> ");

	output("\n\nYou thank the cow-girl before you stagger off.");
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Food]
public function getFoodAtBigTs():void
{
	clearOutput();
	author("Savin");
	showBust("HERMAN");
	showName("\nHERMAN");
	//Food (First Time)
	if(flags["MET_HERMAN"] == undefined)
	{
		flags["MET_HERMAN"] = 1;
		output("You queue up in line, glancing up the menu hanging over the grill: chalk on a blackboard, about as old-school as the rest of the decor. The line’s pretty quick-moving despite there only being one man at the grill: a towering, meaty bull-man who looks like he’s enjoyed quite a bit of his own cooking on top of the Treatment’s effects, leaving him looking like a brick house of muscle and belly. At the sweltering heat of the grill, you can see he’s not wearing much more than a pair of jeans and his great big <i>“Kiss the Cook”</i> apron. His arms are a blur as he flips burgers, sauces ribs, and pulls fries out of the deep-fryer.");
		output("\n\nFinally, you’re up in line. Now that you’re closer, you can see why the chef’s able to go so fast through the orders: several robotic arms are working alongside him, tending to the orders a little further back, operating in concert with the chef so that even the one man can cook for dozens. The chef turns to you with a big grin. <i>“Hey! You’re new here, aren’t ya? Name’s Herman, and I run the place. What can I get you?”</i>");
	}
	//Food (Repeat)
	else
	{
		output("You queue up in line for the Barbeque Pit once again. The line moves fast, and pretty soon you’re face to face with Chef Herman again. <i>“Welcome back!”</i> he grins, <i>“What can I get you?”</i>");
	}
	clearMenu();
	//[Roast Beef] - 10
	if(pc.credits >= 10) addButton(0,"Roast Beef",orderUp,"Roast Beef","Roast Beef","A delicious roast beef sandwich. It'll hit the spot even if it won't do much for your waistline.\n\n10 Credits.");
	else addDisabledButton(0,"Roast Beef","Roast Beef","You can't afford a roast beef sandwich. You'd need 10 credits.");
	//[Ribs] - 20
	if(pc.credits >= 20) addButton(1,"Ribs",orderUp,"Ribs","Ribs","A plateful of awesome ribs - just what you needed for a pick-me-up. Of course ribs aren't the healthiest meal.\n\n20 Credits.");
	else addDisabledButton(1,"Ribs","Ribs","You can't afford ribs. You'd need 20 credits.");
	//[Burger] - 9
	if(pc.credits >= 9) addButton(2,"Burger",orderUp,"Burger","Burger","A big, greaser burger. Your belly will love you. Your belt will hate you.\n\n9 Credits.");
	else addDisabledButton(2,"Burger","Burger","You can't afford a burger. You'd need 9 credits.");
	//[Salad] - 5
	if(pc.credits >= 5) addButton(3,"Salad",orderUp,"Salad","Salad","A meal designed for the body-conscious cow-girl on the go, it doesn't fill you up too much, but it won't add to your waistline.\n\n5 Credits.");
	else addDisabledButton(3,"Salad","Salad","You can't afford a salad. You'd need 5 credits.");
	//[BBQ To-Go] - 20
	if(pc.credits >= 20) addButton(4,"BBQ To-Go",bbqToGo,undefined,"BBQ To-Go","Get some delicious BBQ for the road. Then you can grab a snack whenever you feel like it.\n\n20 Credits.")
	else addDisabledButton(4,"BBQ To-Go","BBQ To-Go","You need 20 credits to afford BBQ To-Go.");
	//If PC has Female Treatment/ is Bimbo/ has Fluid Addiction: 
	if((pc.isBimbo() && pc.isTreated()) || pc.isBimbo()) addButton(5,"\"SpecialOrder\"",specialOrdersForTreatedGals,undefined,"\"Special Order\"","Get a meal with some of the Chef's special sauce. It's practically free food!");
	//["Special Order”</i>]...
	addButton(14,"Back",mainGameMenu);

}

//Food Chosen (Except BBQ To-GO / Special Order)
public function orderUp(order:String = ""):void
{
	clearOutput();
	author("Savin");
	showBust("HERMAN");
	showName("\nHERMAN");
	output("You give Herman your order, which he punches in on the register. He hands you a numbered ticket: <i>“Be right up, " + pc.mf("buddy","missy") + ".”</i>");
	output("\n\nYou take your ticket and head over to one of the benches to wait. Before you can even sit down, though, you hear Chef Herman calling out your number. Damn, that’s fast! You return to the chef, pick up your order, complete with a side of fries and a big ol’ soda, and take your seat. A few bites is all it takes to convince you that Chef Herman’s cookin is finger-licking good!");
	//{Energy Restored. Slight gain to thickness; salads slightly reduce thickness}. 
	if(order == "Ribs")
	{
		pc.energy(100);
		pc.modThickness(3, false);
		pc.credits -= 20;
		output("\n\nYou feel a little thicker after. All that food probably isn't good for you.");
	}
	else if(order == "Roast Beef")
	{
		pc.energy(75);
		pc.modThickness(2, false);
		pc.credits -= 10;
		output("\n\nYou feel a little thicker after. All that food probably isn't good for you.");
	}
	else if(order == "Burger")
	{
		pc.energy(60);
		pc.modThickness(2, false);
		pc.credits -= 9;
		output("\n\nYou feel a little thicker after. All that food probably isn't good for you.");
	}
	else
	{
		pc.energy(40);
		pc.credits -= 5;
	}

	processTime(12);
	clearMenu();
	addButton(0,"Next",getFoodAtBigTs);
}

//BBQ To-GO
public function bbqToGo():void
{
	clearOutput();
	author("Savin");
	showBust("HERMAN");
	showName("\nHERMAN");
	output("<i>“One to-go box, please,”</i> you say, pulling out your cred stick.");
	output("\n\n<i>“Good choice! These babies will keep good for ages, but pop the top and it’ll be hot like it was right off the grill and as tasty as the day I cooked it,”</i> Herman says proudly as he rings you up. From under the counter, he hands over a big, black-and-white mottled box that’s ever-so-slightly warm to the touch and smells delicious.");
	pc.credits -= 20;
	eventQueue[eventQueue.length] = lootBBQ;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function lootBBQ():void {
	clearOutput();
	var foundLootItems:Array = new Array();
	foundLootItems[foundLootItems.length] = new BBQToGo();
	//Set quantity!
	
	itemScreen = mainGameMenu;
	lootScreen = mainGameMenu;
	useItemFunction = mainGameMenu;
	//Start loot
	itemCollect(foundLootItems);
}

//<i>“Special Order”</i>
//Requires feminine PC with the Treatment, Fluid Addiction, Bimbofication, etc. 
//Tooltip: You bet that chef’s got a nice, thick member that needs some relief, all pent up in those tight pants of his... and you bet it’d taste great with a little of his home cooking...
public function specialOrdersForTreatedGals():void
{
	author("Savin");
	showBust("HERMAN");
	showName("\nHERMAN");
	clearOutput();
	output("You lean over the counter, looking the chef up and down, your eyes drawn toward the thick, heavy bulge tenting the chef’s greasy apron. <i>“Uh, is there something I can get you, miss...?”</i> he starts to ask, before his gaze follows you down.");
	output("\n\nGrinning lasciviously, you point down to the suddenly-larger bulge and say, <i>“I’ll take a great big helping of that, Chef.”</i>");
	output("\n\nHe seems to think for a moment before nodding toward the little door behind the grill. You quickly hop out of line and through the door, scooting down onto your [pc.knees] beneath the counter. Your hands run up Herman’s tree-trunk legs, brushing across his jean-clad thighs as you push the hem of his apron aside, giving yourself access to the chef’s fly. Even as you’re getting busy, though, Chef Herman doesn’t stop working; he dutifully turns back to the grill after grabbing the next order up, starting to cook just a surely as if there wasn’t a cum-hungry whore trying to free his cock.");
	output("\n\nYour deft fingers lock around his zipper, carefully tugging it down and grabbing the meaty shaft of Herman’s cock. You roll his apron up to get a look at your prize: it’s as big as you’d hope, more than a foot and a half of turgid meat expanding at your touch, filling out to its full length at your tender touches. It’s bear-like in shape, thicker around than you can wrap your fingers over and blunted at the tip, its thick gash of a urethra sitting in a basin-like depression between the flat mass of cockhead.");
	output("\n\nUnbeckoned, your hungry tongue slips out and laps along the underside of Herman’s rod. That finally gets a reaction out of the hard-working stud; he shudders, teeth gritting. He turns from the grill to the register, and you move with him, taking the opportunity to draw your tongue along the side of his freed willy. The taste is unbelievable, so good... musky, thick, manly. Like every male on this wonderful world, Herman seems to exude an aura of unwavering masculinity, the kind of men that spend their days breeding bitches, to whom sex is life itself. The flavor of his cock is electrifying, only spurring on your rampant, instinctual need for his cum. When Herman turns again, your lips lock around his flared, bearish cockhead, jaw straining to take the sheer girth of his blunted mast.");
	output("\n\n<i>“Eager, aren’t ya?”</i> Herman grunts under his breath, reaching down to ");
	if(pc.horns == 0) output("pat your head");
	else output("grab one of your bestial horns, pulling you down on his rod");
	output(". Your expertly-tamed gag reflexes subside utterly as his big, rough hand guides you down his bestial member, your throat expanding around the long, thick schlong being crammed down it. Herman turns again, all but dragging your limp, cock-craving body with him; you obediently follow the stud’s every motion, all conscious thought subsiding to the desperate need to suckle from his cock, to drain every drop of delicious, salty seed from his loins.");
	output("\n\nWhen his hand leaves your head, reaching for his spatula, your cock-sucking instincts take over from him, your head bobbing up and down his length on automatic. Herman grunts again, breath catching as your tongue swirls around his flared head, as your hands stroke the shaft when your mouth is elsewhere. When you slide yourself back down his length, your hands reach through his fly, cupping a pair of heavy, meaty nuts still inside, covered with a thick layer of fuzz. You cup the bull’s twin, churning balls, barely able to contain your own excitement as you feel them, feel how full them are, ready to flood your needy lips with semen if you work just a little bit harder.");
	output("\n\nYou gently squeeze and caress Herman’s hefty sack, moving your head along his cockflesh faster and faster, working yourself to a feverish pace of sucking and wanking, working as quick as you can to extract your salty meal from the chef’s meat. He grunts, a bull-like snarl as you work him over; his cock throbs and trembles with building need, so close to release you can taste the thick, creamy treat... or is that just the river of pre pouring down your throat?");
	output("\n\n<i>“Slow down, or I’m gonna... gonna...”</i> Herman starts to stay, his voice trailing off into a wordless, bestial groan. You can feel his cock expanding, the thick load moving through it, shooting towards the waiting reception of your [pc.lips]. Just before the moment of his release, the chef roughly pushes you off his cock, sending you back with a yelp of surprises and utter disappointment. Instead of your mouth, the chef leans down and catches his cockhead between the folds of a hot, greasy roast beef on rye right off the grill. His hips buck like a bronco’s as he blows his load across the open lips of the sandwich, slathering it with his own special topping.");
	output("\n\n<i>“Order up,”</i> Herman grunts, slapping the spunk-filled roast beef closed and handing it down to you. <i>“On the house.”</i>");
	output("\n\nTalk about eating cum. You giggle and take the sandwich, munching down on the savory, salty cock-based concoction. The taste sends shivers of pure ecstasy down your spine as you finally sate your hunger for cum... and also lunch. You slump back against the interior of the counter, feasting upon the creamy sandwich. Delicious!");
	pc.exhibitionism(2);
	pc.lust(15);
	processTime(23);
	pc.energy(100);
	//pc.thickness += (1);
	pc.modThickness(1, false);
	if(pc.thickness > 100) pc.thickness = 100;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Grand Teh
//[Watch Screen]
public function stephIrsonBySavinWhoSaysHesTiredOfTreatedCowBimbosThenMakesHerATreatedCowGirlForShitsAndGigglesWhyIsThisFunctionNameSoLong():void
{
	clearOutput();
	showName("STEPH\nIRSON");
	showBust("STEPH_2");
	
	flags["STEPH_WATCHED"] = 1;
	
	output("You seat yourself on one of the benches in the grill, kicking your [pc.feet] up onto the table and turning your attention to the sizable Super-HD Viewscreen mounted above the bar. As you sit, the last commercial break is just coming to an end, instructing you to purchase the Treatment from the gift shop in the lobby before the screen fades to a superimposed logo of <b>Steph Irson: Galactic Huntress</b>, a popular nature show. Beneath the title script, a warning appears in large red letters: \"<i>This Show Rated X, Adults Only, by the Galactic Entertainment Ratings Board for Graphic, Sexual, and Disturbing Imagery. You Have Been Warned.</i>\"");
	output("\n\nThe camera pans down from a wide-angled shot of the vast, sweeping plains of Grand Teh to finally focus on the hostess, Steph, sitting atop a simple wooden fence at the field’s edge, one leg crossed over the other, showing off the calves beneath her sheer short-shorts. To her right and left are a pair of prodigiously-endowed cow-girls, their massive breasts bare, resting atop the fence-posts as they look placidly off into the distance behind the camera, both chewing on what looks like lettuce.");
	output("\n\n<i>“Welcome to a special edition of </i>Galactic Huntress,”</i> Steph Irson says, as ever in her strong New Brisbane accent. As the camera zooms in on her face, you’re treated to a close-up view of the perky cat-ears now resting atop her hair, as well as the odd, almost metallic-gray color of her lips and irises. Every time she blinks or speaks, the colors seem to shift and swim, as if alive and moving.");
	output("\n\nShe continues: <i>“Today we’re coming back toward the core for a look at some more domesticated species. It’s always important to remember that, though the frontier is a wild and untamed place, full of wonders and mysteries and strange new life, each of the worlds you and I would call the Core were, once upon a time, just as wild as Mhen’ga or Tarkus. Today we’re on Grand Teh, once an inhospitable world that humanity carved out into an idyllic paradise. Rather than relying on advanced technology as many colonies do, Grand Teh’s retained its peaceful, farm-like appearance. This planet’s green fields and friendly farm-hands go on for as far as the eye can see.”</i>");
	output("\n\nSmiling at the camera as it zooms back out, Steph puts a friendly hand on the shoulders of the two cow-girls beside her. One of them moos quietly, looking up at her. <i>“Here we’ve got Grand Teh’s native inhabitants, the Tehans. Generations of traditional genetic modifications have given them a cute, bovine appearance -- and a whole new meaning to sexual dimorphism. Males and females of Grand Teh are pretty different physically and mentally. We’re going to see just how so!”</i>");
	output("\n\nSteph hops nimbly from the fence post and takes one of the cow-girls by the arm, giving her a gentle tug towards the camera’s left. The cow moos, her floppy ears perking up. <i>“Milk time?”</i> she asks, obediently following along behind Steph.");
	output("\n\n<i>“Milk time, big girl!”</i> Steph coos, petting the cow on the head. Turning back to the camera, Steph explains, <i>“Human milk is Grand Teh’s primary export. The slightly modified milk produced here is excellent for your health, highly nutritious, and if I’m in luck in a few minutes, absolutely delicious! Gotta admit, never tried cow-girl milk before, so I guess I’m in for a new experience today. Isn’t that right, cutie?”</i>");
	output("\n\n<i>“Moo!”</i> the cow-girl cheers as the camera follows the pair of them into a barn at the end of the fence. The pair of them step through a small side door and into what looks like a stable full of cow-girls just like the one on Steph’s arm, all bent over harness-like apparatuses with long tubes leading from their breasts to pumpers in the stall corners. The audio is temporarily drowned out with loud moos, low groans, and cries of pleasure. More than one cow the huntress passes has a vibrator or other toy lodged in her cunt, helping her along towards the orgasmic pleasure of milk release.");
	output("\n\nEventually, Steph leads the cow to an empty stall, followed dutifully by her camera drone. <i>“Now, let’s take a gander at the milking tech at this particular ranch. These lovely ladies produce more milk in their chests than an old-Earth dairy cow per day, and that all has to go somewhere: and that somewhere is here. C’mon, sweetheart, let’s get you saddled up!”</i>");
	output("\n\nThe cow grins and hurriedly steps up into the harness hanging down from the ceiling. With a little help from Steph, she’s soon putting almost all of her weight on the two cords of the harness, one under her chest and the other just above the groin, which leaves her bent-over with her big, milky breasts hanging down for easy access. The cow moos in excitement as Steph moves to her side and crouches down; the camera finds itself angled just perfectly to catch a glistening bead of excitement pearling on the lips of the cow’s sex.");
	output("\n\n<i>“Right. Now, normally milking here’s done by pneumatic suction,”</i> Steph says, pulling a pair of blue gloves on over her hands, <i>“But I like to get a bit more hands-on, don’t I?”</i>");
	output("\n\nFlashing the camera a grin, Steph drags a bucket underneath the cow’s hanging bosom and reaches up to up one of the cow-girl’s tits. The cow groans, her fluff-tipped tail swishing happily as Steph’s hands work onto both her boobs, squeezing and massaging the huge, soft mounds. Steph’s quickly rewarded with a little spurt of milk trickling from the cow’s teat, a pair of white streams pouring down into the bucket. The cow-girl shudders and moos quietly while her body sways in the harness as she’s milked and her legs tremble with pleasure.");
	output("\n\n<i>“The girls on Teh just love getting milked,”</i> Steph narrates as her hands continue to rhythmically massage the cow’s tits. <i>“Generations of selective breedings, genetic manipulation, and a special, top-secret drug called the Treatment have made Teh’s women into the ultimate milk-cows. Just a couple minutes of this, and I’ll have a full bucket of creamy, delicious milk. Won’t I, cutie?”</i>");
	output("\n\n<i>“Uh-huh!”</i> the cow smiles, eyes almost crossed. Steph works the swollen teats harder, pumping squirt after squirt into the steel bucket until, as the camera drone zooms in on it, you can see the white sea nearly cresting the lip of the bucket. For every tug and squeeze Steph lavishes on the cow’s teats, the bovine beauty answers with a quiet whimper or low moo of pleasure, groaning and gasping until you’re sure the busty cow’s about to cream herself.");
	output("\n\nWhen she does, you’re treated to a shrill cry of ecstasy as the cow cums, her whole body wracked with spasmic shudders that nearly send milk spraying everywhere. And what milk there is! As she climaxes, the cow’s tits work themselves into high gear, spraying what looks like gallons into the over-laden bucket. After several minutes of orgasmic milking, Steph steps back and hefts the bucket up from under the twitching, blissed-out cowgirl.");
	output("\n\n<i>“Now, let’s take a taste, shall we?”</i> she grins, bringing the bucket up to her lips and drinking deep. When she lowers it, she’s grinning from kitty-ear to kitty-ear, a great big milk moustache on her upper lip.");
	output("\n\n<i>“Croickey! That’s amazing!”</i> Steph says, clearly surprised. <i>“I think I’ll be switching brands at home if all the girls have your talented teats!”</i>");
	output("\n\n<i>“Glad you liked it,”</i> the cow-girl murmurs, half asleep in her afterglow.");
	processTime(10);
	pc.lust(10);
	clearMenu();
	addButton(0,"Next",stephIrsonEp3Pt2);
}

public function stephIrsonEp3Pt2():void
{
	clearOutput();
	author("Savin");
	showName("STEPH\nIRSON");
	showBust("STEPH_2");
	output("Steph sets her big bucket down, cracks her knuckles, and wipes the milk from her lips. <i>“Right, then. That’s a Tehan sheila for you. Now, we’re going to have to be a little more careful up ahead: we’re on a quest to find a Tehan male. Now, these bovine ladies we’ve met so far are typical of their sex here: quiet, content, eager to please. But the studs here on Grand Teh are a bit more aggressive. They’re outnumbered ten to one by females, with each bull able to control his own harem of females or, as is the case on many ranches, spread their wild oats freely among all the girls. But the Treatment’s made ‘em big, burly, and eager to go toe-to-toe on a hairpin.”</i>");
	output("\n\nAs she’s talking, Steph’s walks out of the stall and back into the barn proper. Her <i>“quest”</i> takes her all the way to the other end of the barn, where in the background of her narration, you can see a huge, muscular man pounding away at one of the harnessed-up cowgirls, plunging his cock into her spread pussy as the automated milkers work their magic on her. Seeing the proceedings out of the corner of her gray eye, Steph freezes mid-step, hunching down and whispering to the camera drone, <i>“Alright, here we go. I’m going to have to be very, very careful not to earn this bull’s ire. Small words, a non-threatening tone.... I absolutely do not want to be seen as a threat, especially during what must be mating season here on Teh.”</i>");
	output("\n\nIn proper <i>Galactic Huntress</i> fashion, Steph starts to creep up toward the bull, stealthily making her way up behind his pistoning hips. The camera drone floats around to get a better picture of him: mostly human, but freakishly tall, with massive bull horns growing from his brow. The man’s muscular to the point of a bodybuilder, with a thick layer of body hair that clings tightly to his darkly tanned skin. His jaw is locked in a frown of effort, and he’s grunting deeply, almost like a real bull. Every powerful hip-thrust sends the cow-girl rocking in her harness, her assflesh rippling with the impacts.");
	output("\n\n<i>“G’day, mate!”</i> Steph says suddenly from the stud’s side, leaning against the stall wall.");
	output("\n\n<i>“’Sup,”</i> he answers, not breaking pace nor looking up.");
	output("\n\nInching closer, Steph asks, <i>“Got a sec to answer some questions, big boy? For the viewers at home?”</i>");
	output("\n\n<i>“Working,”</i> he grunts, slapping the cow-girl on the ass. She shrieks, a large red-mark left on her behind.");
	output("\n\nSteph pouts. <i>“C’mon, you’re the first stud I’ve seen all day.”</i>");
	output("\n\nThe bull finally looks away from the jiggling cow-butt between his legs and glowers at the huntress. <i>“Lady, I’m balls-deep in a bitch right now. Can you wait like, five minutes?”</i>");
	output("\n\n<i>“That doesn’t make for exciting television, now does it?”</i> Steph says, arms crossed. As she does so, her camera drone shudders and re-focuses on the gap between the stud and his breeder, zooming in on his huge cock pounding her spread pussy, giving you a gloriously high-def view of the fem-cum spurting out around his rod. That’s some good television, right there.");
	output("\n\nThe stud blinks at Steph. <i>“You’re not too bright, are you?”</i>");
	output("\n\n<i>“So... interview?”</i>");
	output("\n\nThe stud grunts, taking a step back from the well-fucked cow-slut and letting a torrent of spooge pour out of her packed pussy, a waterfall of white that nearly splatters the camera drone. When it recovers, you’re treated to a full-frontal view of the stud’s cock: a huge equine phallus almost as long as his arm dangling nearly to the ground between his legs. He takes one massive stride over to Steph, grabs her head, and shoves her down onto her knees.");
	processTime(10);
	pc.lust(10);
	clearMenu();
	addButton(0,"Next",stephIrsonEp3Pt3);
}

public function stephIrsonEp3Pt3():void
{
	clearOutput();
	author("Savin");
	showName("STEPH\nIRSON");
	showBust("STEPH_3_NUDE");
	output("<i>“I’ll give you some exciting footage, slut. How about two of them?”</i> the stud grunts, forcing Steph’s face into a crotch that is still glistening with cow-lube and his own cum. Steph grunts, struggling against his grasp, but it’s much too strong for the slight young woman. The camera drone, too dumb to realize what’s going on, dutifully follows its master’s face down to crotch-level with the stud, getting a great angle on Steph’s face as the bovine man grinds his heavy, oversized balls along her face, his massive shaft hanging half-hard overtop her head");
	if(silly) output(" like a great big cock-hat");
	output(". She grunts and gasps, fighting for breath as his huge nads all but smother her. You can only imagine the musky smell mixed with fresh sex. The mere thought makes you shudder.");
	output("\n\nEventually, Steph’s struggles subside into hopeless submission, and her tongue rolls out onto the taut skin of his bullish sack. <i>“Yeah,”</i> the stud groans, patting Steph between her cat-ears. <i>“Just like that, slut. Worship them like gods.”</i>");
	output("\n\nObediently, Steph starts to lavish the stud’s sack, licking, kissing, and even nibbling the thick skin of his bullnuts. She opens wide, jaw straining to wrap around even one of his balls. She sucks hard, slurping at the black underside of the stud’s testicles until she finally manages to wrap her lips around one of them, head bent at an awkward angle just to get at it.");
	output("\n\n<i>“You’re a natural</i>,”</i> the bull grunts, grabbing his own cock and starting to stroke it. <i>“Too bad about your tits, though. Too damn small for this thing.”</i>");
	output("\n\nIn the corner of the camera, you can just see the swells of Steph’s cleavage under her shirt. By human standards, she’d be considered pretty damn buxom: she’s easily cramming D-cups under that khaki shirt of hers, and they’re already straining a bit against the fabric. Then again, compared to the cowgirls you’ve seen so far...");
	output("\n\n<i>“Then again, maybe I’ll just fix that for you,”</i> the bull says, pulling a small syringe packet from his pocket. With one hand still pinning Steph into his crotch, the bull uses his teeth to tear the package open. When he’s freed the needle from its wrapper, the bull wastes no time in jabbing it down right through Steph’s shirt and into one of her heaving tits. The huntress yelps, letting the stud’s sack fall free of her lips as she’s injected with what looked like a white liquid.");
	output("\n\nGrinning, the bull steps back, still holding Steph steady by her head. From this new angle, he lets his massive cock fall onto her chest, the elephantine member cresting her tits and falling over her shoulder. Good heavens, it’s enormous! With a grunt, the bull starts to shift his hips, smearing Steph’s face with the still-wet slickness of cow-girl cum and his spunk coating his rod. She gasps, this time not in revulsion but... pleasure? Her mouth lolls open lazily as his huge, flared head nears her mouth, and with little enough fuss the bull pushes his cockhead into her welcoming maw, her jaw straining to take its thickness. As she does so, the bull releases her head, reaching down to rip her shirt off with one easy tear, baring her breasts to the camera.");
	output("\n\nThey’re GROWING.");
	output("\n\nEven as Steph’s force-fed inch after inch of cock, her bust seems to grow a commensurate size, her flesh swelling out to pornstar lengths. She groans around her mouthful of horsedick, her hands reaching up to cup her burgeoning bosom. They’re easily F-cups... no, G-cups before they start to slow. Suddenly endowed like a proper cow, her tits easily envelop the tree-trunk of a cock being rammed into her mouth, squeezing tight around it as the bull starts to thrust.");
	output("\n\nThe added pressure on her super-sized bust brings another change to before too long: a thick, white stream spurts from one of Steph’s nipples, squirting onto the bull’s thigh. Steph only moans, eyes rolling up into her head as she starts to lactate to the beat of the titfucking she’s giving, her mammaries ejaculating every time the bull hammers his cock through her cleavage. She doesn’t help matters as she grips her tits, squeezing them together around his pistoning rod and even starting to hump back against him.");
	output("\n\nThe camera, always looking for the best angle, zips around behind Steph and angles down to the dark, wet splotch between her legs. Her shorts are practically soaked in her lust, and she clearly knows it. One of her hands slinks down, pulling her too-short shorts down and revealing her lacey pink panties, now a whole darker shade of red as they’re drenched in girl-cum. Her fingers delve down beneath them, furiously working into her slit.");
	output("\n\n<i>“What’s that, slut? Need a little attention down there?”</i> the bull growls, pulling his cockhead out of Steph’s mouth, letting it stand erect on its own for a moment. He reaches forward, grabs Steph under her arms, and hefts her up. She’s like a limp, leaking doll in his hands, tiny and helpless as the stud picks her up, turns her around so she’s facing her camera drone, and drops her down on his flared cockhead.");
	output("\n\n<i>“You following me, camera drone?”</i> he laughs, slamming Steph down on his cock. The drone dutifully zooms in on the action, focused in as his massive shaft spreads Steph wide. Looks like her lips down there are steel-gray too, showing through the tatters of her panties as they fall around her waist, torn asunder by turgid horsemeat. You watch as Steph is bounced up and down by his bucking hips, her gut distending to make room for the sheer mass of cock inside her cunt, stretching and compacting as the bull fucks her brains out. Steph cries out, grabbing at the stud’s arms, her tits, anything she can to steady her bouncing, jiggling, orgasming body.");
	output("\n\nSteph’s climax is as loud as it is wet, heralded by a scream of pleasure at the bottom of one of the bull’s bucks, when every inch of cockflesh that can be is crammed into her. The camera watches close as her pussy sprays out a thick load of femcum, splattering the camera lens with that and a geyser of milk spraying from her heavy, bouncing tits.");
	output("\n\nSatisfied that he’s taught the huntress her place, the bull takes a step forward and presses Steph into the wall of the stall, squishing her between his body and the hard boards. With her immobilized, he’s free to grip her hips and start pounding, thrusting as hard and deep as he can to get himself off in the bovinified-Steph’s sodden box. He doesn’t take all that long to reach his peak when he puts his mind to it, and soon he’s grunting with effort, balls visibly clenching as he prepares to cum.");
	output("\n\nAt the last moment, the bull pulls out, leaving Steph’s pussy gaping. He grabs his cock and aims it over her like a hose, letting the mammoth tool loose to spray a torrent of thick seed over Steph’s back and ass, practically plastering her to the wall with his sticky load. By the time he’s done, Steph looks like a snow-woman, completely covered in white spunk. The bull grins, slaps her ass, and turns to leave...");
	output("\n\n... Only to turn back, grab the camera drone right out of the air, and shove it between Steph’s spread legs and... oh, lord. The camera feed cuts out, and a commercial break cuts in.");
	pc.lust(10);
	processTime(29);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

// Default finish text:
public function carrieFinishedMilking(amount:Number = 0):void
{
    var cumTotal:Number = amount;
    
    output("\n\nIt takes a minute for Carrie to help you out of the harness and onto your [pc.feet]. You’re a bit wobbly at first, but your bovine attendant steadies you and helps you collect and don your [pc.gear]. As you’re getting kitted up, Carrie wanders over to the spooge-collecting machine on the wall and punches a button labeled <i>“RESULTS.”</i> The display immediately lights up with the amount you produced: <b>" + cumTotal + "mLs</b>");

    output("\n\n<i>“Oh, hey, before you go: since we’ve collected your sperm properly, would you mind if we sold it? Plenty of people out there are real choosey about what genes they want, and you look like a " + pc.mf("prize winning stud","a cute lil’ thing any girl would want to father their children") + "! I can even give you some money for it up front!”</i>");
    
    processTime(2);
    
    // Reset that flag so things can go back to normal again.
    if(flags["MILK_BARN_COCKMILKER_REPAIR_DAYS"] != undefined) flags["MILK_BARN_COCKMILKER_REPAIR_DAYS"] = undefined;
    
    //[Yes] [No]
    clearMenu();
    StatTracking.track("milkers/prostate milker uses");
    StatTracking.track("milkers/cum milked", cumTotal);
    addButton(0,"Sell It",sureSellMyCumBabiesFarAndWide,cumTotal);
    addButton(1,"Don't Sell",noIDontWantToSellBabies);
}

// Cum value calculation:
public function cumCreditValue(amount:Number = 0):int
{
    var x:int = 2;
    //Payout = 1/100th of volume for first 5000.
    if(amount < 5000) x = Math.round(amount/100);
    else x = 50;
    amount -= 5000;
    //Next 15000 - 1/500th
    if(amount >= 0)
    {
		
		if(amount < 15000) x += Math.round(amount/500);
		else x += 30;
		amount -= 15000;
	}
	//Next 100L - 1/2000
	if(amount >= 0)
	{
		if(amount < 100000) x += Math.round(amount/2000);
		else x += 50;
		amount -= 100000;
	}
	//Super low payouts now
	if(amount >= 0) x += Math.round(amount/20000);
  	
    //honey worth more!
    if(pc.cumType == GLOBAL.FLUID_TYPE_HONEY) x *= 2;
    return x;
}

// You done broke the milker, son.
public function yesGoMilkarGo(amount:Number = 0):void
{
	clearOutput();
	showName("\nCARRIE");
	showBust("CARRIE");

	output("Ignoring the milker's obvious protest, you decide to stay strapped in and try to ride it out.");

	output("\n\nBad idea.");

	output("\n\nBefore you could utter your next moan, the machine bucks as the tubes break free from the casing inflating and tightening with the backed up flow of your seed. Looking down, you see the milker itself is straining but losing the fight. Like a broken hose, the tubes split themselves under the pressure. Streams of [pc.cumColor] spray out from the tiny pinprick holes, rapidly increasing in size. With a pressurized burst, a shot of cool air ejects and caresses your [pc.crotch]. The tubes then surrender and pop like balloons, sending [pc.cum] flying outward. The machine stutters and jumps again like a wild bull, landing with a reverberating crash. The alarm lights finally blink to life and the sirens ring.");

	output("\n\nHearing the loud boom, clanking machinery, and the blaring alarm, Carrie quickly jumps out of her stool, brightens the lights, and rushes over to the scene. The auburn-haired cow-girl looks at the milker, its tubes split open, with globs of [pc.cum] flowing out of them. <i>“What in tarnation?!”</i> she exclaims. <i>“Are you okay?”</i>");

	output("\n\nYou can only nod slightly as the dildo continues to ream your anus and prod your prostate, forcing your to arch your back and stiffen your limbs.");
	if(pc.isTreated()) output(" You can feel yourself mindlessly drooling in the moment, your [pc.tongue] lolling out from the corner of your mouth. This is just too good!");

	output("\n\nSeeing that you were not immediately hurt in the commotion, she instantly turns to the milker to see if she can stop it from completely breaking down. Turning the knobs to equalize the pressure, pumping levers to drop the excess back-flow, and pressing buttons to shut off the power supply sources in a systematical order. You can hear the milker's engines slow to a halt, but the pressure around [pc.eachCock] is unabated. The machine lets out an angry internal thud right before its engines are completely silenced. <i>“Oh, no,”</i> Carrie mewls, and with graceful aptitude, the cow-girl presses the emergency release button on a panel. Releasing a hiss, the connected tubes unlatch and fall off your [pc.cocks].");

	output("\n\nIt takes a few more thrusts before Mister Floppycock finally manages to draw down to a creeping stop, still half-lodged in your [pc.asshole], the full brunt of the cock’s crown pressing down on your poor, battered prostate. You can't take it anymore and flex your rectal muscles, launching the large pink dildo from your abused ass. Like a lewd pendulum, it pivots up and swings back, giving you a big, wet slap on your [pc.butts]. The impact is the proverbial straw that broke the camel's back as you cannot hold the pressure any longer, letting the flood gates open and shooting");
	if(silly && pc.cumQ() >= 50)
	{
		output(" the rest of your [pc.cumColor] load right into Carrie's face");
		if(pc.cumQ() >= 200 && pc.cumQ() < 500) output(" and");
		else if(pc.cumQ() >= 200) output(", lathering her");
		if(pc.cumQ() >= 200) output(" chest");
		if(pc.cumQ() >= 500) output(", and drenching her entire body");
		output("! You didn't actually notice her in your range of fire, but it looks like she just got a faceful of your [pc.cum]!");
		output("\n\nEmbarassed by the sudden facial, she wipes the [pc.cumVisc] fluid off her face with a spare rag. ");
	}
	else
	{
		if(pc.cumQ() <= 0) output(" blanks");
		else output(" the rest of your");
		if(pc.cumQ() < 50) output(" [pc.cum] in the air.");
		else output(" load across the floor,");
		if(pc.cumQ() < 200) output(" leaving streaks of [pc.cumColor] behind.");
		else output(" covering it in a pool of [pc.cumColor].");
		output("\n\n");
	}

	// Take the stats before orgasming and stuff! Milker didn't collect any semen though.
	StatTracking.track("milkers/prostate milker uses");

	// Cum thrice!
	processTime(45);
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();

	output("Still a bit excited by the whole event, Carrie takes one final look at the milker before concluding, <i>“Well, this milker is definitely out of commission. These pumps are made to handle a herd of Treated studs in rut, how you managed to break it is beyond me!”</i> Pressing the red button, the gears audibly grind and squeak and the broken milker retracts back into the ceiling from whence it came. Recovering from her disbelief that such an industrial-grade machine could be destroyed by one person, she regains her composure and calmly turns to you. <i>“Now what are we going to do with a broken milker?”</i>");

	// Set the flag!
	if(flags["MILK_BARN_COCKMILKER_BROKEN"] == undefined) flags["MILK_BARN_COCKMILKER_BROKEN"] = 1;
	// Just broke, probably needs to be scanned!
	if(flags["MILK_BARN_COCKMILKER_SCANNED"] != undefined) flags["MILK_BARN_COCKMILKER_SCANNED"] = undefined;

	clearMenu();
	var cumEstimate:Number = 0;
	if(pc.cumQ() * 3 >= pc.currentCum()) cumEstimate = pc.cumQ() * 3;
	else cumEstimate = pc.currentCum();
	// Uh-oh, silly mode
	if(amount + cumEstimate > 4000000)
	{
		output("\n\nSuddenly, a loud creak can be heard from the tanks on the side wall of the barn...");
		addButton(0,"Uh-Oh",ohNoSillyCumFloods);
	}
	// Fixit? [Yes] [No]
	else
	{
		output("\n\nThat's a good question. Would you like to fix it?");
		
		addButton(0,"Yes",yesFixDaMilkar);
		addButton(1,"No",noFixDaMilkar);
	}
}

// Better safe than sorry--end it nao!
public function noStahpMilkarStahp(amount:Number = 0):void
{
	clearOutput();
	showName("\nCARRIE");
	showBust("CARRIE");

	output("You decide to play it safe and holler for Carrie like she said, flailing your arms wildly to get her attention.");

	output("\n\nThe lights return to their normal brightness as the auburn-haired cow-girl steps from her stool and approaches you. <i>“What's wrong, stud?”</i>");

	output("\n\nWith the floppy latex cock up your [pc.asshole] and the pressure on your prostate, you can't gather much besides long exaggerated " + pc.mf("groans","moans") + ". Taking a deep breath, you try again, but only lewd noises escape your mouth.");

	output("\n\n<i>“There, there [pc.boy], just calm down. What is it you need?”</i> Noting the desperation in your voice she quickly sputters out some guesses, <i>“More lube?”</i>");

	output("\n\nYou shake your head.");

	output("\n\n<i>“Less lube?”</i> she ponders, <i>“No, wait - You want it deeper?”</i>");

	output("\n\nYou strain to to get the words out of your mouth, but a sudden creak in the milker and a blaring alarm with flashing lights make your situation apparent.");

	output("\n\n<i>“Oh, heaven's to Betsy!”</i> Carrie jumps up and immediately turns the dials down, relieving you of the pressure on [pc.eachCock].");

	output("\n\nWhen the alarm subsides and the milking machine powers down, Carrie pats your [pc.butt] and your rectum reflexively launches the dildo from your ass. Like a lewd pendulum, it pivots up and swings back, giving you a big, wet slap on your ass cheeks. The impact triggers you to");
	if(pc.cumQ() <= 0) output(" shoot blanks into the empty air.");
	else if(pc.cumQ() < 50) output(" spurt some [pc.cum] into the air.");
	else if(pc.cumQ() < 200) output(" launch streams of [pc.cumColor] onto the floor.");
	else output(" cum the pent-up deluge of [pc.cumVisc] [pc.cumColor] baby batter onto the ground.");

	// Cum thrice!
	processTime(45);
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();

	output("\n\nCarrie giggles, <i>“Seems like you were enjoying Mister Floppycock a little too much there. Then again, when I said you should be ready to cum buckets, I didn't mean aerial firefighting buckets!”</i> After she presses the red button again, the milker shudders and withdraws back up into the ceiling. Carrie taps your ass again and comments, <i>“I didn't think it was  possible to overload the milkers, especially the ones here in the barn. Good thing you warned me when you did - we could have lost a milker back there!”</i> She pecks your cheek with a kiss of praise for your impressive virility. <i>“Here, let's get you out of this...”</i>");

	output("\n\nNodding weakly, you use whatever strength you have left to stand high enough for her to access the restraints.");

	// Sell or not?
	carrieFinishedMilking(amount);
}

// Yes, try to fix it... if you can afford it!
public function yesFixDaMilkar(bGiannaScans:Boolean = true):void
{
	clearOutput();
	showName("\nCARRIE");
	showBust("CARRIE");

	// How much does it cost to fix?
	var nCost:Number = 10000;

	output("You tell Carrie that you will repair the milker.");

	// For right after you borked it. Hello, Gianna!
	if(bGiannaScans)
	{
		output("\n\nShe sighs, <i>“Sorry hun, but I can't let you fix it");
		if(pc.characterClass == GLOBAL.CLASS_SMUGGLER) output(" with any old part you can grab from the black market, you know");
		else if(pc.characterClass == GLOBAL.CLASS_MERCENARY) output(" with bullets and brute force - even if you are good with your hands");
		else if(pc.characterClass == GLOBAL.CLASS_ENGINEER) output(" yourself - no matter how smart or talented you may be with gadgets");
		else output(" if you are thinking about fixing it yourself");
		output(". There's a policy here that says if you're not an official farm hand, you're not allowed to touch the equipment. Boss's orders. Besides, we need to make sure there aren't any troublemakers planning to sabotage the machinery and take off with the goods. I hope you understand.”</i>");

		output("\n\nYou nod and ask how much it will cost to pay for the damages.");

		output("\n\n<i>“Now you're catching on,”</i> the auburn-headed bovine smiles. She turns her view to the far corner of the barn and calls, <i>“'Anna, baby, can you give me some help over here?”</i> Not soon after, a");
		if(flags["MET_GIANNA"] != undefined) output(" familiar face");
		else output(" milky-white, woman-shaped android");
		output(" scurries over, her raven-black ponytail braid swishing behind her. Carrie pulls out a device from her back pocket and unfolds it, revealing it to be a holo-tablet. She carefully connects a thin cord to the fembot's plug located on the seventh cervical vertebrae, feeding data directly to the tablet. Carrie then glides her fingers across the projected screen to access an application. She continues, <i>“I'll need to assess any internal damages for that milker there,”</i> she points, <i>“Please give it a nice thorough scan.”</i>");
		output("\n\n");
		if(flags["MET_GIANNA"] != undefined) output("Gianna");
		else output("The gynoid");
		output(" nods obediently and heads to the broken milker with a cute, girlish skip in her step. Kneeling over, quite seductively so, she gently places the fingertips of one of her hands on the metal surface of the male milker. Her eyes light up and glow as Carrie's tablet screen flickers with animated charts, rotating diagrams, and running various numerical meters. It only takes a minute or two and the scan is finally complete. After an acknowledging beep from the device,");
		if(flags["MET_GIANNA"] != undefined) output(" Gianna");
		else output(" the android");
		output(" removes her hand and stands up with a little hop");
		if(flags["MET_GIANNA"] != undefined) output(", her soft anatomy jiggling in response");
		output(".");

		processTime(5);

		output("\n\n<i>“Thanks sweetie, you're a doll.”</i> With that, the perky android is disconnected from the device and dismissed, giving you a quick wave before continuing her other duties around the barn. Carrie then turns to you after reading the numbers displayed on the tablet. <i>“Looks like, with all the internal moisture damage and broken specialty parts, the repairs are going to run you about " + nCost + " credits to get this machine to function like new again.”</i>");

		output("\n\nYou");
		if(pc.isBimbo()) output(" make a surprised pout in response.");
		else if(pc.isBro()) output("r face contorts into a unsurprising 'huh?' face after what you just heard.");
		else if(pc.isNice()) output(" gasp aloud, concerned about the amount of damage you caused.");
		else if(pc.isMischievous()) output("r smirk visibly melts into a discontented frown at the price tag.");
		else if(pc.isAss()) output(" curse under your breath as you let that number seep in.");
		else output("'re somewhat shocked by the bill. Must be some pretty unique parts, you figure.");

		// Keep track if price has been scanned!
		if(flags["MILK_BARN_COCKMILKER_SCANNED"] == undefined) flags["MILK_BARN_COCKMILKER_SCANNED"] = 1;
	}
	// For repeat scenes.
	else
	{
		output("\n\n<i>“Right, you know the drill, hun.”</i> Flipping out her tablet, she quickly reads the figure and reports the cost to you. <i>“That'll be " + nCost + " credits for the repairs.”</i>");

		output("\n\nYou flip your wrist and look at your current funds. You");
		if(pc.credits <= 0) output(" are not sure you could afford anything, much less pay for the damages...");
		else if(pc.credits < nCost) output(" don't quite have enough credits to pay for the damages...");
		else if(pc.credits == nCost) output(" have that exact amount, what a coincidence!");
		else if(pc.credits >= (nCost * 10)) output("'re not even phased by that. You have way more than enough to spend on repairs if you wanted to.");
		else if(pc.credits >= (nCost * 4)) output("r wallet can survive that, thankfully.");
		else if(pc.credits >= (nCost * 2)) output("'ll have to split your spending money, but it's not too bad.");
		else output(" know this will make a pretty sizable dent in your wallet, but at least you can afford it.");

		processTime(1);
	}

	output("\n\n<i>“So, what do you say?”</i>");

	// Pay if you got enough.
	clearMenu();
	if(pc.credits >= nCost) addButton(0,"Pay2Fix",fixDaMilkar,nCost,"Pay to Repair","Pay " + nCost + " credits to fix the milker.");
	else addDisabledButton(0,"Pay2Fix","Pay to Repair","You do not have enough credits to pay for this!");
	addButton(1,"Nevermind",noFixDaMilkar,true,"Nevermind","Maybe next time.");
}

// Nah, ain't nobody got time fo' dat!
public function noFixDaMilkar(bForPay:Boolean = false):void
{
	clearOutput();
	showName("\nCARRIE");
	showBust("CARRIE");

	output("You shake your head, letting the cow-girl know that you can't");
	if(!bForPay) output(" help her repair the milker");
	else output(" pay her");
	output(" at the moment.");

	output("\n\nCarrie replies with a frown, <i>“I guess it can't be helped. Just know that I can't");
	if(!bForPay) output(" allow you to use the milker again until it is fully repaired");
	else output(" do any repairs unless you hand in the payment first; so the sooner you pay the repair bill, the sooner you'll be able to use the milker again");
	output(". Sorry for the inconvenience, babe.”</i>");

	processTime(1);

	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

// The fixining!
public function fixDaMilkar(amount:Number = 0):void
{
	clearOutput();
	showName("\nCARRIE");
	showBust("CARRIE");

	output("The cowbell around Carrie's neck clunks as she switches her posture. She contorts her lips and blows upwards to get a loose bang of hair away from her face. Looking down, she quickly taps a few things on her tablet's interface. Waving the scanner end of the control tablet above your Codex, it gives a couple beeps, alerting you that " + amount + " credits have been transferred over. ");

	if(pc.isBimbo()) output("You could have used that money for like, an manicure or something! Oh well, you guess you'll have to make it up by sucking cocks for creds now. Ooh... that actually sounds yummy!");
	else if(pc.isBro()) output("Dude, what a waste of money. But you totally wrecked that machine with your splooge! Maybe you can get a higher score next time?");
	else if(pc.isNice()) output("Smiling nervously, you can't help but feel a little embarrassed about the situation. Though you did pay back your debt, so you'll no longer have that on your conscience to worry about.");
	else if(pc.isMischievous()) output("Well, that's a prime example of how your sexual body organs could dig a deep hole through your cred wallet. Best be more careful next time...");
	else if(pc.isAss()) output("Damnit. This fucking machine was made for the expressed purpose of getting screwed, not the other way around!");

	// Take dat money
	pc.credits -= amount;
	if(flags["MILK_BARN_COCKMILKER_BROKEN"] != undefined) flags["MILK_BARN_COCKMILKER_BROKEN"] = undefined;

	// Set the flag! 5 days...
	flags["MILK_BARN_COCKMILKER_REPAIR_DAYS"] = 5;

	output("\n\nThe cow-girl gives you an approving glance and then winks, <i>“All set! Now you just need wait about " + num2Text(flags["MILK_BARN_COCKMILKER_REPAIR_DAYS"]) + " days until the milker is in working condition. Until then, try not to go blue balls on me, otherwise I'll have to sick Mister Floppycock on you without the milker, okay sugar?”</i>");

	processTime(2);

	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

// Silly mode: the floodining!
public function ohNoSillyCumFloods():void
{
    clearOutput();
    showName("\nCARRIE");
    showBust("CARRIE");
    
    output("The creaks get louder as you and Carrie meet eye-to-eye, knowing all too well what is to come.");
    
    output("\n\n<i>“I'm not paid enough for this!”</i> are Carrie's final words before an overloaded tank bursts behind her with " + indefiniteArticle(pc.cumColor()) + " explosion. As predicted, all the tanks simultaneously explode like New Years fireworks, the copious amounts of cum swirling and mixing into one giant semen tsunami. The wave of [pc.cum] barrels down on the two of you and the room quickly floods. You can see Carrie flail about, trying to find her bearings. When she is in swimming position, she finds the button to unlock the door. Punching it as hard as she can, the locked door opens without resistance. You and Carrie are swept up by the current and launched outside in a torrential river of cum!");
    
    output("\n\nYou close your eyes and your vision hazes...");
    
    processTime(5);
    
    clearMenu();
    addButton(0,"Next",ohNoSillyCumFloodsPtII);
}
public function ohNoSillyCumFloodsPtII():void
{
    clearOutput();
    showName("\nCARRIE");
    showBust("CARRIE");
    
    processTime(300);
    
    output("You open your eyes and find that you are back in the milking stall again.");
    
    output("\n\n<i>“Hello there, stud!”</i>");
    
    output("\n\nYou turn to find Carrie with a towel around her neck. She has obviously taken a shower and dried herself off not too long ago. Looking at your Codex, you realize a good deal of time has passed.");
    
    output("\n\nYou try to ask what happened, but Carrie cuts you off, already expecting the question, <i>“Trust me, you really don't want to know the details...”</i> She flashes a smirk. <i>“Let's just say that varmints are horrible swimmers. Oh, and you owe me big time for getting your heiny off of Big T.'s roof.”</i>");
    
    output("\n\nShaking your head, you pull yourself together. You thank Carrie for the help and she allows you to wash off in her shower. As soon as you dry up, you wear your [pc.gear] and are on your way.");
    
	pc.shower();
    processTime(60);
    
    clearMenu();
    addButton(0,"Next",mainGameMenu,undefined,"Next","Welp, that happened...");
}
