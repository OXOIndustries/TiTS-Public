import classes.Items.Miscellaneous.BBQToGo;
import classes.GameData.MailManager;

public function newTexasEmail():void
{
	flags["NEW_TEXAS_COORDINATES_GAINED"] = 1;
	MailManager.unlockEntry("newtexas", GetGameTimestamp());
	AddLogEvent("<b>New Email From Benjamin Tiberius Tee (NoReply@NewTexas.gov)!</b>");
}

//Landing on New Texas (First Time)
public function landOnNewTexas():void
{
	showBust("NEW_TEXAS");
	showName("NEW\nTEXAS");
	if(flags["LANDED_ON_TEXAS"] == undefined)
	{
		flags["LANDED_ON_TEXAS"] = 1;
		CodexManager.unlockEntry("The Treatment");
		output("A bright green world comes into view ahead: a planet of small, scattered oceans, rolling plains, and clear weather. At first glance, New Texas looks like a male paradise world, peaceful and idyllic. The space lanes around the planet are mostly clear, letting you punch in the auto-lander and sit back as your ship’s computers guide you down to the surface. The clouds roll past you as your ship cruises down toward the largest continent.");
		output("\n\nYour auto-nav guides you down toward the most popular tourist spot on the planet, a particularly large ranch owned by the planetary governor. You bring up a few articles on the place: the extranet is full of holo-pics of busty, bovine-like human girls milling about the ranch, as well as reviews of an amazing barbeque joint and a something simply called the Treatment, which has all but made the planet what it is today. A whole planetary society based on gene mods... interesting.");
		output("\n\nThe computer alerts you to imminent landing. You cast a glance out your viewscreen just in time to see a monolithic barn coming into view, easily the size of two city blocks back to back on each side. As you approach, the roof of the barn shudders and begins to split, separated by two massive hydraulic arms that create an opening wide enough for a frigate to pass through. Your ship slows, guided in by the automatic docking protocols as it passes between the raised slates of the barn-dock’s roof. Inside, you can see a handful of smaller cargo haulers and touristy passenger ships docked below, each pulled into an oversized, self-contained <i>“stall.”</i> You feel a slight shudder in the deck as your ship lands on the hay-covered floor, quickly surrounded by several buff, burly dock workers, each with a pair of bull horns growing from his head. ");
		output("\n\nA heavy loader latches onto your ship, dragging it into a stall as you gather your gear and prepare to head out. Your docking ramp touches down just as the exo-suit releases your ship. Several of the buff, bovine men working nearby give you ");
		if(pc.mf("dude","chick") == "dude") output("friendly nods");
		else output("hungry looks");
		output(" as you disembark. A sign nearby points you to <i>“Customs and Visitor Check-in.”</i>");
		
		generateMapForLocation(currentLocation);
		processTime(5);
	}
	else
	{
		output("You fly to New Texas");
		if(leaveShipOK()) output(" and step out of your ship.");
	}
}

//output("\n\nCustoms & Check-in");
//output("\n\nRoom Description");
public function customsAndCheckInOnNewTexas():Boolean
{
	//if brandy affection at 100, sexed at least once and pc does not yet have brandy's letter go to letter scene
	if (brandyAffection() >= 100 && brandySexed() > 0 && !pc.hasKeyItem("Brandy's Letter") && !pc.hasItemByClass(BrandyLetter))
	{
		getBrandysLetter();
		return true;
	}
	
	clearOutput();
	author("Savin");
	showBust("OGRAM","AMMA");
	author("Savin");
	output("The Customs and Visitor Check-in office dominates the only passage between the spaceport and the ranch proper, ensuring anybody coming or going gets a proper screening. Two desks are set up, facing each other across the thoroughfare: one is labeled <i>“Customs and Weapons Check,”</i> the other, <i>“Visitor Check-in.”</i> Very straightforward. ");
	//If First time going through:
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
		//Same options as first time meeting
		addButton(0,"Customs",repeatOgramApproach);
	}
	//If Repeat:
	else
	{
		output("Ogram and Amma are sitting behind their desks, working hard at looking like they’re working hard. Every few seconds, Amma gives a tiny, muted gasp ");
		//if not sex’d: 
		if(flags["FUCKED_TEXAN_CUSTOMS"] == undefined) output("seemingly for no reason");
		else output("as the pair of vibrators constantly lodged inside her work their magic");
		output(". Sometimes when she does so, Ogram will flick a button on his holo terminal, which immediately causes Amma to squirm in her seat.");
		if(flags["FUCKED_TEXAN_CUSTOMS"] == undefined) output(" What kind of game are they playing?");
		addButton(0,"Ogram",repeatOgramApproach,undefined,"Ogram","Talk to the burly bull at the customs desk.");
		addButton(1,"Amma",approachDatCowGalRepeat,undefined,"Amma","Talk to the busty cow-girl at the visitor’s desk.")
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
	else addDisabledButton(0,"Disarm","Disarm","You don’t have any weapons to disarm!");
	addButton(1,"No Way!",noWayTexasJose,undefined,"No Way!","Refuse to be disarmed.");
	if(!pc.hasEquippedWeapon()) addButton(2,"No Weapons!",noWeaponsInTexasHoss,undefined,"No Weapons!","Inform Ogram that you aren’t carrying any real weapons. All you need are your fists or a rock to chuck, and you can find rocks anywhere.");
	else addDisabledButton(2,"No Weapons","No Weapons","You can’t get by for having no weapons while actually carrying weapons. It just doesn’t work. Come on, man.");

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
	//Resume from Disarm, below
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

	//No weapons resumes here
	customsPassFinale();
}
public function customsPassFinale():void
{
	output("\n\nYou spend a minute or two filling in your signature or initials on a few forms. Eventually, you hand them over to Ogram, who stamps them. As he does so, you notice the bull-man wince, snaking a hand down under the desk. Maybe he’s got a cramp?");
	output("\n\n<i>“Alright. Just step on over to the visitor check-in desk. Somebody’ll be with you...”</i> He shudders a little bit, barely muting a curse. <i>“Uh, real soon.”</i>");
	pc.createStatusEffect("Disarmed",4,0,0,0,false,"Blocked","You’ve checked all forms of weaponry at New Texas’ customs.",false,0,0xFF0000);
	flags["CHECKED_GEAR_AT_OGGY"] = (pc.hasEquippedWeapon() ? 1 : 0);
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
	if(reahaIsCrew()) output(" Damn, Reaha’s got nothing on the cows here....");

	output("\n\n<i>“Sorry about the wait!”</i> the cow-girl says with a big smile. <i>“My name’s Amma, and I just need a few things from you before you can head on out to the fields. Trust me, you’re going to have so much fun!");
	if(pc.mf("dude","") == "dude") output(" There’s plenty of girls just like me who’re going to be so happy to meet you!");
	else if(pc.biggestTitSize() < 7) output(" I think New Texas’s got just what you need to spice up your life, cutie!");
	else output(" You look like you’d fit right in here, miss! A couple days on New Texas and you won’t ever want to leave!");
	output("”</i>");

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
	moveTo("TEXAS CUSTOMS");
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
	output("<i>“‘Sup, " + pc.mf("bro","beautiful") + "?”</i> Og says with a friendly nod. ");

	output("<i>“");
	//if PC is Disarmed: 
	if(pc.hasStatusEffect("Disarmed"))
	{
		output("Lemme know when you’re ready to go, and I’ll hand your weapons back over.");
	}
	//If PC is armed:
	else
	{
		output("If you want to go into the ranch, you’ll need to check your weapons with me.");
	}
	output("”</i>");
	//If sex’d:
	if(flags["FUCKED_TEXAN_CUSTOMS"] != undefined) output(" With a grin he adds, <i>“Or would ya rather double-team the cow again?”</i>");

	//[Talk] [Sex] [Rearm] [Disarm]
	clearMenu();
	
	if(pc.hasStatusEffect("Disarmed")) addButton(0,"Rearm",rearmAtOgram,undefined,"Rearm","Get your weapons back.");
	else addButton(0,"Disarm",getDisarmedRepeat,undefined,"Get disarmed so that you can explore the planet.");
	
	addButton(1,"Talk",talkToOggy,true);
	
	if(pc.lust() >= 33) addButton(2,"Sex",askOggyForSex,undefined,"Sex","See if the big bull is up for sex.");
	else addDisabledButton(2,"Sex","Sex","You aren’t quite aroused enough for sex.");
	
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
	
	returnAllItems(true);
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
		output("You casually inform him that you don’t have any weapons, watching as Og’s eyebrow climbs steadily higher.\n\n<i>“I’ll have to give you a quick check-over,”</i> he says while waving a portable scanner over your body. <i>“All right, you’re clear. Have a good one.”</i>");
		flags["CHECKED_GEAR_AT_OGGY"] = 0;
	}
	
	pc.takeMeleeWeapon();
	pc.takeRangedWeapon();
	pc.createStatusEffect("Disarmed",4,0,0,0,false,"Blocked","You’ve checked all forms of weaponry at New Texas’ customs.",false,0,0xFF0000);
	
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
	addButton(0,"TheTreatment",talkToOggyAbootTreatManz,undefined,"The Treatment","Ask the brute what his take on the Treatment is.");
	addButton(1,"CurrentJob",oggysCurrentJob,undefined,"Current Job","Ask him about his job now.");
	addButton(2,"Old Job",oggysOldJob,undefined,"Old Job","Ask him about his old job.");
	addButton(3,"Amma",askOggyAboutAmma,undefined,"Amma","Ask him about that hot cow-girl manning the visitor’s desk.");
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
	addDisabledButton(0,"TheTreatment","The Treatment","Seriously? You’re talking about that right now.");
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
	//If Ogram option unlocked in Amma’s menu:
	if(flags["OGRIM_UNLOCKED_FROM_AMMA_TALK_MENU"] != 0)
	{
		output("\n\nBehind you, Amma smirks and says, <i>“When’re you going to put </i>one<i> little Ogram in me, babe?”</i>");
		output("\n\n<i>“Shush, you,”</i> Og says, waving her off. <i>“I’ll get to you when I’m good and ready.”</i>");
		output("\n\nAmma pouts... right up until Og keys his terminal again, and she gives a little yelp.");
	}
	processTime(6);
	talkToOggy(false);
	removeButton(1);
	addDisabledButton(1,"CurrentJob","CurrentJob","Seriously? You’re talking about that right now.");
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
	output("\n\n<i>“Hey, don’t judge a guy for working hard to get his bonuses.”</i> He sighs, leaning back in his chair and propping his legs up. <i>“Could have had a worse gig. But I like what I do here. New Texas’s been good to me... wouldn’t go back to that for the world.”</i>");
	processTime(5);
	talkToOggy(false);
	removeButton(2);
	addDisabledButton(2,"Old Job","Old Job","Seriously? You’re talking about that right now.");
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
	addDisabledButton(3,"Amma","Amma","Seriously? You’re talking about that right now.");
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
	//Repeat
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
		else addDisabledButton(0,"Spit Roast","Spit Roast","You’re too big to spitroast her.");
	}
	else addDisabledButton(0,"Spit Roast","Spit Roast","Spitroasting Amma requires you to have a penis of some kind.");
	addButton(1,"ServiceOggy",worshipZeBullCawk, undefined, "Service Oggy","Help Amma orally service Ogram’s dick. Really get in there and give it the worship it deserves.");
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
	else addDisabledButton(1,"Sex","Sex","You aren’t aroused enough for sex.");
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
	addButton(0,"TheTreatment",askAmmaAbootZeTreatManz,undefined,"The Treatment","Ask the cow-girl what she thinks of the Treatment.");
	addButton(1,"In Charge?",whosInCharge,undefined,"Who’s In Charge Here?","Ask Amma about who runs this planet.");
	addButton(2,"Herself",askAmmaAboutHerSelf,undefined,"Herself","Ask Amma about herself.");
	if(flags["OGRIM_UNLOCKED_FROM_AMMA_TALK_MENU"] != undefined) addButton(3,"Ogram",askAmmaAboutOgram,undefined,"Ogram","Ask her about that big lug she’s been seeing, Ogram.");
	else addDisabledButton(3,"Locked","Locked","You’ll need to talk to Amma about something else in particular before this scene unlocks.");
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
	output("\n\nShe fidgets. <i>“Uh, well, I don’t think it is. Probably not. I dunno, nobody’s ever really wanted to! It’s so nice... I couldn’t imagine living without my Treatment. Life,”</i> she pauses, leaning in to whisper <i>“and sex... would be sooooo boring. It makes the pleasure-feelers in your brain go wild, and your endor... uh, endarfins...”</i>");
	output("\n\n<i>“Endorphins,”</i> Ograms says, not looking up from his terminal.");
	output("\n\n<i>“Endorphins! You get lots more of them, too. Did I mention that it made sex feel soooo good? And lactation! Oh, wow, giving milk is just the best... I feel bad for my poor bulls, who never get to do it!”</i>");
	processTime(7);
	talkToAmma(false);
	removeButton(0);
	addDisabledButton(0,"TheTreatment","The Treatment","You’re already talking about that.");
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
	addDisabledButton(1,"In Charge?","Who’sInCharge","You’re already talking about that.");
}

//Herself
public function askAmmaAboutHerSelf():void
{
	clearOutput();
	author("Savin");
	showName("\nAMMA");
	showBust("AMMA");
	//Unlocks “Ogram” talk option
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
	addDisabledButton(2,"Herself","Herself","You’re already talking about that.");
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
	addDisabledButton(3,"Ogram","Ogram","You’re already talking about that.");
}

//Sex
public function sexChatWithAmma():void
{
	clearOutput();
	author("Savin");
	showName("\nAMMA");
	showBust("AMMA");
	//First time:
	if(flags["FUCKED_TEXAN_CUSTOMS"] == undefined)
	{
		output("Pulling yourself up onto Amma’s desk, you lean in and ask the busty, bovine bimbo if she’d be willing to give you a more intimate introduction to her planet. She gives you a lusty grin and leans in, giving you a close-up view of her massive, bovine cleavage. Your mouth is all but watering already.");
		output("\n\n<i>“Maaaybe,”</i> she teases, inching closer.Those big swells of cowflesh are practically rubbing up against you, now.");
		output("\n\nJust as she’s about to make contact, a hand grabs your [pc.butt], squeezing hard. You just about jump out of your skin as Ogram growls into your ears, <i>“But we come as a pair, Amma and I. Think you can handle the two of us, " + pc.mf("buddy","beautiful") + "?”</i>");
		output("\n\nAmma grins, pressing her twin melons against you. <i>“Ready for the fuck of a lifetime, [pc.name]?”</i>");
	}
	//Repeat:
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
		else addDisabledButton(0,"Spit Roast","Spit Roast","You’re too big to spitroast her.");
	}
	else addDisabledButton(0,"Spit Roast","Spit Roast","Spitroasting Amma requires you to have a penis of some kind.");
	addButton(1,"ServiceOggy",worshipZeBullCawk,undefined,"Service Oggy","Help Amma orally service Ogram’s dick. Really get in there and give it the worship it deserves.");
	addButton(14,"Back",approachDatCowGalRepeat);
}

//Ogram and Amma Sex
//Spitroast Amma
//PC needs teh cock
public function spitRoastAmmoOnYerDicks():void
{
	clearOutput();
	author("Savin");
	showBust("AMMA_NUDE","OGRAM_NUDE");
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
	if(!pc.isCrotchExposed()) output(", finally freeing your turgid rod from the confines of your [pc.lowerGarment]");
	output(". Amma gasps happily as your prick flops onto her back and wiggles herself back against you, grinding your [pc.cock " + x + "] into the crack of her ass. You shudder with pleasure as she puts just the perfect amount of pressure on your cock, squeezing it between her plump cheeks and riding it up and down. You give her a sharp swat on the ass, making her jiggly butt bounce. Another spank, and she squeals in delight -- and quickly finds her mouth plugged full of Ogram’s lengthy bovine dong. Her cry of pleasure is muffled into a low, husky moan around Og’s dick, but she’s hardly complaining about it: indeed, her slim tail swishes faster as she starts to suckle on her lover’s rod.");

	output("\n\nYour own hand slips down between Amma’s legs, brushing across the wet gash between her legs. She shivers happily at your touch, spreading her legs nice and wide as a brace of your digits slide easily into her, spreading her slutty hole out for you. God <i>damn</i> she’s wet, almost like an ausar the way she’s all but drooling her excitement across your fingers. You pull them out and ");
	//if Treated:
	if(pc.isTreated()) output("eagerly lick them clean, eager for a taste of this cow ready to be bred");
	else output("wipe them clean across the shaft of your prick, giving yourself a slight coating of all natural cow-lube before you take the plunge");
	output(". You take a preparatory breath and grab Amma’s hips in both hands, steadying the rocking slab of rump and sliding your own [pc.hips] forward into her.");

	output("\n\nYou hear a muffled cry of pleasure belt out around Ogram’s throat-stuffing bullcock as your cock slides into the boiling, sodden slit between the buxom cow’s legs. Amma’s pussy easily parts to allow you entry, completely unresistant to your thrust -- but when you hilt yourself in the cow, your crotch pressed tight against her bubble butt, she squeezes hard: not enough to stop you, she’s much too wet for that, but enough to make it feel absolutely incredible when you pull out of her, every muscle in the bimbo bovine’s cunt massaging your rod until just the tip is still spreading her open.");
	pc.cockChange();
	output("\n\n<i>“Like that, huh?”</i> Og grins, taking the cow by the horns and pulling her face into his groin, hard enough to nearly rip her from your grasp. <i>“Come on, harder, slut! Put that tongue to work.”</i>");
	output("\n\nAmma moans, but a moment later wrings a grunt of pleasure from her lover as she apparently fulfills his wish. Her hands shift down from his waist to his balls, both hands cupping worshipfully around the bull’s massive, swinging nads, squeezing just enough that you can see the hefty balls inside the sack shift around under her ministrations. One of his hands moves from horn to head, gently stroking Amma’s hair as she sucks and fondles, clearly hitting just the right spots on her bull.");
	output("\n\nAnd on you, too. Amma’s cunt alternates between vice-like tightness and so loose you practically fall back into her, working you up into a pounding frenzy as you desperately try to get more of her bovine pussy, drowning in the sensation of her slit around your [pc.cock " + x + "]. You grab Amma’s tail, giving it just enough of a pull to make her cry out and clench down, using it to ram yourself deeper still inside the slutty cow, slapping into her ass hard enough to make the soft flesh bounce and jiggle madly as you hammer home again and again. Amma’s sexy moans devolve into feral, animalistic grunts of pleasure that come out wet and half-muffled as Ogram continues to forcefully face-fuck her, his own hips pistoning until his sack slaps against her drool-slathered chin.");
	output("\n\nSuddenly, Og grunts, slamming himself hilt-deep in Amma’s throat. The cow gags and squirms around on your cocks, unable to escape as the bull bellows loudly and cums; all you see is his heaving chest and a thick waterfall of backed-up spooge pouring back out around his cock, splattering on the floor. The cow-girl’s body reacts to the mouthful of cum on instinct, her hands and mouth working overtime to suckle out every drop of seed from the well-hung bullman. Despite her attention fixated on Og, the cow certainly isn’t ignoring you: spurred on by the taste of spunk, her cunt contracts hard around you, milking your [pc.cock " + x + "] like a machine as you thrust in, every second a different muscle squeezing or caressing your shaft as you glide through her sultry, sodden snatch.");
	output("\n\nWith a final groan of pleasure, Og pulls out of Amma’s face, slumping back against his desk and leaving the cow dripping his seed down her chin. She shoots a white-stained grin over her shoulder and winks at you. <i>“You too, cutey! Give it to me from both ends!”</i>");
	output("\n\nYou give her a swat on the ass, a sharp reminder that you’ll cum in your own time... but that time isn’t far off. You pick up the pace, driven on faster by the lustful look on the cowgirl and the amazing skill she’s putting on display around your thrusting cock. You’re going to make her work for it, though: you push her forward with a particularly potent thrust, shoving her against Og’s desk; she grabs it for support, fingers digging into the hardwood and giving her something to brace against as you drill her.");
	output("\n\nFucking her like that, you aren’t going to hold out much longer... and you can’t say you really want to. Amma’s cum-hungry look is practically begging for you to pump her full of jizz, and her pussy is all but demanding it, working hard to drain your [pc.balls] for all you’ve got. A few more thrusts are all you can manage before a sudden, urgent pressure in your [pc.cock " + x + "] surges up; you work on instinct to slam yourself deep into Amma’s backside, [pc.hips] pounding into her squishy behind and burying your cock as far in as you can before you cum. The cow lets outs a low, happy moo as you finally let loose, shooting a thick wad of spooge into the sultry depths of her slit.");
	output("\n\n<i>“Ah! Ooohhh yes! Just like that, [pc.name]! Feels so gooood,”</i> she moans, rocking her hips back against you to get every bit of dick into her sweltering hole as she can. She’s sucking the seed out of you, draining spurt after spurt from your spasming cockhead until your [pc.cumColor] seed is drooling out of her well-fucked cooch, pooling on the floor just like Og’s load before it. Amma clamps down hard around you, tighter than ever as you blow your load, keeping you fully lodged inside her until you’re utterly spent, left panting and shuddering as her muscles continue to massage your over-sensitive shaft.");
	output("\n\n<i>“Fuck. Keep that up and I’m gonna be hard again before you’re done,”</i> Og laughs, pulling himself up onto his desk beside the cow-girl and giving her a pat on the behind.");
	output("\n\nYou pull yourself out of Amma a moment later, taking a towel from Og when he offers and cleaning yourself up. You really got yourself messy, now that you look at yourself: all slathered in cum and Amma’s juices, sweat and milk staining your [pc.skinFurScales]. You sigh contentedly as you wipe up, occasionally glancing up at the drooling cow-cunt still bent over and stretched wide. Amma herself seems content to stay bent over, resting against her lover’s desk and looking up at him dreamily.");
	output("\n\n<i>“Well, thanks for sharing you two,”</i> you say");
	if(pc.hasStatusEffect("Disarmed") || flags["CHECKED_GEAR_AT_OGGY"] == 1) output(", getting on your way");
	else output(", grabbing your gear");
	output(".");
	output("\n\n<i>“Any time!”</i> Amma grins, giving you a parting butt-wiggling as you pass. <i>“We should do this again, next time you pass by!”</i>");
	output("\n\n<i>“Definitely,”</i> Og chuckles. <i>“See you around, " + pc.mf("buddy","beautiful") + ".”</i>");

	processTime(30+rand(15));
	pc.orgasm();
	IncrementFlag("FUCKED_TEXAN_CUSTOMS");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Worship Bullcock
public function worshipZeBullCawk():void
{
	clearOutput();
	showBust("AMMA_NUDE","OGRAM_NUDE");
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

	output("\n\nIt takes you minutes to work your way up to the crown of Ogram’s cock. Time blurs as you and Amma work, your bodies swaying like branches from the trunk of Og’s member as he guides you up and down his mammoth length, again and again until his crimson cockflesh is glistening with wetness, all but drooling as you and Amma slavishly shine him down. Only the sudden emptiness as your mouth closes around air breaks you out of your lustful trance, bringing you back to the realization that you’ve come to the pointed tip of Ogram’s manhood. You lock eyes with Amma for a split second, and get the cow’s approving nod. Looks like she really is willing to share her big ol’ bull with you! You give her the biggest, dopiest smile you can manage through your cockhungry haze and lock your lips around the head of his cock.");
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
	output("\n\nHe chuckles. <i>“She’s being modest, " + pc.mf("buddy","beautiful") + ". But seriously: if you suck cock that good, you’re welcome back any time.”</i>");
	if(pc.hasCock()) 
	{
		output(" Leaning in he adds, <i>“I might even share Amma with you, if you play your cards right.”</i>");
		output("\n\nShe swats him on the knee.");
	}
	output("\n\nYou give the pair a half-conscious nod as you’re helped up and start to");
	if(pc.hasStatusEffect("Disarmed") || flags["CHECKED_GEAR_AT_OGGY"] == 1) output(" get on your way");
	else output(" collect your gear");
	output(".");
	processTime(15);
	pc.lust(20+rand(10));
	var ppOgram:PregnancyPlaceholder = new PregnancyPlaceholder();
	ppOgram.createPerk("Fixed CumQ", 2000, 0, 0, 0);
	pc.loadInMouth(ppOgram);
	pc.loadInMouth(ppOgram);
	IncrementFlag("FUCKED_TEXAN_CUSTOMS");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function showCarrie(nude:Boolean = false):void
{
	showName("\nCARRIE");
	if(nude) showBust("CARRIE_NUDE");
	else showBust("CARRIE");
}
public function getCarriePregContainer():PregnancyPlaceholder
{
	var ppCarrie:PregnancyPlaceholder = new PregnancyPlaceholder();
	ppCarrie.breastRows[0].breasts = 2;
	ppCarrie.breastRows[0].breastRatingRaw = 24;
	ppCarrie.milkType = GLOBAL.FLUID_TYPE_MILK;
	ppCarrie.milkMultiplier = 100;
	ppCarrie.milkFullness = 100;
	if(!ppCarrie.hasVagina()) ppCarrie.createVagina();
	ppCarrie.vaginas[0].wetnessRaw = 5;
	return ppCarrie;
}

//Use Machine
public function useDaMilkar():void
{
	// Special scenes
	if(carrieSpecialChance())
	{
		if(carrieSoothingShowerChance())
		{
			if(carrieMilkerBadEndChance()) carrieMilkerBadEnd();
			else carrieSoothingShowerGo();
			return;
		}
	}
	
	clearOutput();
	author("Savin");
	showCarrie();
	
	//PC doesn't have a dick
	if(!pc.hasCock())
	{
		showName("MILKER\nOPERATOR");
		output("You step up to the cow-girl sitting on the stool and ask if you can use the machine here. The busty bovine looks up, looks you up and down, and giggles. <i>“Sorry, honey. I don’t think you... uh... have the right bits and pieces to use this machine.");
		if(pc.biggestTitSize() >= 1) output(" Why don’t you head on down to one of the other stalls? I’m sure the girls there will treat you right!");
		else output(" Maybe you ought to go down to the gift shop and ask Ellie for some enhancements, that way you can use the other machines, at least!");
		output("”</i>");
		processTime(1);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
		return;
	}
	//First time, PC has a dick
	if(StatTracking.getStat("milkers/prostate milker uses") == 0)
	{
		output("You step up to the cow-girl sitting on the stool and ask if you can use the machine here. The busty bovine hops up and beams at you. <i>“Hey there! Sure you can, all the milkers - even this big lug - are open to visitors. My name’s Carrie, and I’ll be taking care of you while you use it, okay? Before we get started, I gotta tell you: unlike the normal milkers, the boy-milker here’s pretty involved. You’re gonna have to have me walk you through using it the first time at least, so I hope you’re comfortable with a girl seeing you naked.”</i>");
		clearMenu();
		//[Okay] [No thanks]
		addButton(0,"Okay",okayEllieYaCuntLetsMilkMeFirstTime);
		addButton(1,"No Thanks",FirstManMilkUseNoThanks);
		if(!pc.hasPheromones()) addDisabledButton(2,"Blowjob","Blowjob","Only pheromone-emitting males can ask Carrie for a blowjob.");
		else addButton(2,"Blowjob",carrieBlowjobIntro,undefined,"Blowjob","Why have the harsh embrace of a machine when there’s a perfectly developed cow-girl close at hand?");
		addButton(14,"Leave",mainGameMenu);
	}
	//Repeat
	else
	{
		output("When you approach, Carrie hops up and flashes you a big, doe-eyed smile. <i>“Hey there, [pc.name]! You here to use the boy-milker again? If so, since you’ve used it before, you can go on ahead without me if you want... or would you rather I stick around and help you out? I don’t mind either way!”</i>");
		useDaMilkarMenu();
	}
}
public function useDaMilkarMenu():void
{
	clearMenu();
	//Use w/ Carrie
	addButton(0, "w/Carrie", okayEllieYaCuntLetsMilkMeFirstTime, undefined, "w/Carrie", "Ask Carrie to help you out in the milking stall. A little companionship never hurt, either.");
	//Use w/o Carrie
	addButton(1, "w/o Carrie", useTheMilkerWithoutCarrieYaSkag, undefined, "w/o Carrie", "Tell Carrie you can get yourself situated.");
	if(!pc.hasPheromones()) addDisabledButton(2, "Blowjob", "Blowjob", "Only pheromone-emitting males can ask Carrie for a blowjob.");
	else addButton(2, "Blowjob", carrieBlowjobIntro,undefined, "Blowjob", "Why have the harsh embrace of a machine when there’s a perfectly developed cow-girl close at hand?");
	if(pc.hasCockTail() && pc.hasCock() && pc.hasParasiteTail() && !pc.hasStatusEffect("NT_TAILCOCK_MILK_CD") && StatTracking.getStat("milkers/prostate milker uses") > 3) addButton(3,"Parasite Drop",carrieCockTailSneakyDeaky,undefined,"Parasite Drop","Convince Carrie that she can trust you to be alone with the machine -- then dump a load of parasites in the stud stock with your tail.");
	else if(!pc.hasTailCock() || !pc.hasParasiteTail() || !pc.hasCock()) addDisabledButton(3,"Parasite Drop","Parasite Drop","You need both a cock (to decoy) and a parasitic tail-cock to do this.");
	else addDisabledButton(3,"Parasite Drop","Parasite Drop","Carrie’s not supposed to take off and leave someone alone with the milker. If you want to drop a load of parasites into the stud stock without being caught, you should get more uses in so she trusts you.");
	addButton(14, "Leave", mainGameMenu);
}

//No Thanks
public function FirstManMilkUseNoThanks():void
{
	clearOutput();
	author("Savin");
	showCarrie();
	
	//PC will get First Time interactions until they decide to go through with it
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
	showCarrie();

	//if First time: 
	if(StatTracking.getStat("milkers/prostate milker uses") == 0) output("You nod and introduce yourself in turn. ");
	output("The auburn-tressed cow-girl grins and leads you into the stall, shutting the door behind you, flipping a little lock that turns on an OCCUPIED sign on the door. <i>“Not a lot of bulls need to use the boy-milker here - that’s a prostate milker if you want to get fancy - so you get to have some privacy, at least. Well, aside from me, anyway! Don’t worry, you’ll barely know I’m here. Unless you want to, anyway,”</i> Carrie says, giving you a little wink. <i>“");
	if(!pc.isNude()) output("Anyway, let’s get you out of those clothes, alright?");
	else output("I’ll hold onto your gear for you, alright?");
	output("”</i>");

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
	showCarrie();

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
	showCarrie();

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
	processTime(15);
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
	processTime(25);
	cumTotal += pc.cumQ();
	pc.orgasm();
	
	processTime(5);

	// Breaking the machine starts here!

	// The Price is Right: ONE MILLION DOLLARS!
	var iPriceThreshold:int = 150;

	// If threshold is surpassed before the cumming is done. 50% Chance:
	var cumEstimate:Number = cumMilkerCumEstimate();
	
	if (cumCreditValue(cumTotal + cumEstimate) > iPriceThreshold)
	{
		output("\n\nAll you can do is tightly grip the vaulting horse supporting you, groaning and crying in pleasure as the machine milks your prostate minute after minute.");

		output("\n\nSuddenly, after an audible disconcerted buzz, you see the machine visibly shake and stutter with laborious force. The tubes connected to [pc.eachCock] writhe and flail like agitated snakes. Something in the back of your mind tells you that if you allow the milking session to continue, you will be sacrificing the structural integrity of the machine.");

		// Branch out some options here:
		output("\n\nDo you let the machine continue pumping you until you are dry?");
		// Break it, you goof.
		addButton(0,"Yes",yesGoMilkarGo,cumTotal);
		// I'm sorry Dave, I'm afraid I can't do that.
		if(cumTotal > 320000000) addDisabledButton(1,"No","Too Much Cum to Stop!","Unfortunately, you cannot get off this wild ride...");
		// Nah, just stop milking, please.
		else addButton(1,"No",noStahpMilkarStahp,cumTotal);
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
	// Cap the value to prevent odd output
	if(x > 250000000) x = 250000000;
	
	clearOutput();
	author("Savin");
	showCarrie();
	
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
	showCarrie();
	
	output("<i>“I’d rather you didn’t,”</i> you say, rubbing your [pc.butt].");

	output("\n\n<i>“Aww, you sure?”</i> Carrie says, blinking her big doe-eyes at you. <i>“A lot of mommies would be so happy to get some of your cum!”</i>");

	output("\n\nYou shake you head, and she sighs, turning back to the machine and pressing a button labeled “DESTROY.”");

	output("\n\n<i>“Okay, off to the incinerator it goes.”</i>");

	output("\n\nYou thank the cow-girl before you stagger off.");
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}


public function showHerman(nude:Boolean = false):void
{
	if(!nude) showBust("HERMAN");
	else showBust("HERMAN_NUDE");
	if(flags["MET_HERMAN"] == undefined) showName("BULL\nCHEF");
	else showName("\nHERMAN");
}

//[Food]
public function getFoodAtBigTs():void
{
	clearOutput();
	author("Savin");
	showHerman();
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
	if(pc.credits >= 10) addButton(0,"Roast Beef",orderUp,"Roast Beef","Roast Beef","A delicious roast beef sandwich. It’ll hit the spot even if it won’t do much for your waistline.\n\n10 Credits.");
	else addDisabledButton(0,"Roast Beef","Roast Beef","You can’t afford a roast beef sandwich. You’d need 10 credits.");
	//[Ribs] - 20
	if(pc.credits >= 20) addButton(1,"Ribs",orderUp,"Ribs","Ribs","A plateful of awesome ribs - just what you needed for a pick-me-up. Of course ribs aren’t the healthiest meal.\n\n20 Credits.");
	else addDisabledButton(1,"Ribs","Ribs","You can’t afford ribs. You’d need 20 credits.");
	//[Burger] - 9
	if(pc.credits >= 9) addButton(2,"Burger",orderUp,"Burger","Burger","A big, greaser burger. Your belly will love you. Your belt will hate you.\n\n9 Credits.");
	else addDisabledButton(2,"Burger","Burger","You can’t afford a burger. You’d need 9 credits.");
	//[Salad] - 5
	if(pc.credits >= 5) addButton(3,"Salad",orderUp,"Salad","Salad","A meal designed for the body-conscious cow-girl on the go, it doesn’t fill you up too much, but it won’t add to your waistline.\n\n5 Credits.");
	else addDisabledButton(3,"Salad","Salad","You can’t afford a salad. You’d need 5 credits.");
	//[BBQ To-Go] - 20
	if(pc.credits >= 20) addButton(4,"BBQ To-Go",bbqToGo,undefined,"BBQ To-Go","Get some delicious BBQ for the road. Then you can grab a snack whenever you feel like it.\n\n20 Credits.")
	else addDisabledButton(4,"BBQ To-Go","BBQ To-Go","You need 20 credits to afford BBQ To-Go.");
	//If PC has Female Treatment/ is Bimbo/ has Fluid Addiction: 
	if((pc.isTreated() && pc.isBimbo()) || pc.isBimbo() || pc.isCumSlut()) addButton(5,"“SpecialOrder”",specialOrdersForTreatedGals,undefined,"“Special Order”","Get a meal with some of the Chef’s special sauce. It’s practically free food!");
	//["Special Order"]...
	addButton(14,"Back",mainGameMenu);

}

//Food Chosen (Except BBQ To-GO / Special Order)
public function orderUp(order:String = ""):void
{
	clearOutput();
	author("Savin");
	showHerman();
	output("You give Herman your order, which he punches in on the register. He hands you a numbered ticket: <i>“Be right up, " + pc.mf("buddy","missy") + ".”</i>");
	output("\n\nYou take your ticket and head over to one of the benches to wait. Before you can even sit down, though, you hear Chef Herman calling out your number. Damn, that’s fast! You return to the chef, pick up your order, complete with a side of fries and a big ol’ soda, and take your seat. A few bites is all it takes to convince you that Chef Herman’s cooking is finger-licking good!");
	//Energy Restored. Slight gain to thickness; salads slightly reduce thickness. 
	if(order == "Ribs")
	{
		pc.energy(100);
		pc.modThickness(3, false);
		pc.credits -= 20;
		output("\n\nYou feel a little thicker after. All that food probably isn’t good for you.");
	}
	else if(order == "Roast Beef")
	{
		pc.energy(75);
		pc.modThickness(2, false);
		pc.credits -= 10;
		output("\n\nYou feel a little thicker after. All that food probably isn’t good for you.");
	}
	else if(order == "Burger")
	{
		pc.energy(60);
		pc.modThickness(2, false);
		pc.credits -= 9;
		output("\n\nYou feel a little thicker after. All that food probably isn’t good for you.");
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
	showHerman();
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

//“Special Order”
//Requires feminine PC with the Treatment, Fluid Addiction, Bimbofication, etc. 
//Tooltip: You bet that chef’s got a nice, thick member that needs some relief, all pent up in those tight pants of his... and you bet it’d taste great with a little of his home cooking...
public function specialOrdersForTreatedGals():void
{
	author("Savin");
	showHerman();
	clearOutput();
	output("You lean over the counter, looking the chef up and down, your eyes drawn toward the thick, heavy bulge tenting the chef’s greasy apron. <i>“Uh, is there something I can get you, miss...?”</i> he starts to ask, before his gaze follows you down.");
	output("\n\nGrinning lasciviously, you point down to the suddenly-larger bulge and say, <i>“I’ll take a great big helping of that, Chef.”</i>");
	output("\n\nHe seems to think for a moment before nodding toward the little door behind the grill. You quickly hop out of line and through the door, scooting down onto your [pc.knees] beneath the counter. Your hands run up Herman’s tree-trunk legs, brushing across his jean-clad thighs as you push the hem of his apron aside, giving yourself access to the chef’s fly. Even as you’re getting busy, though, Chef Herman doesn’t stop working; he dutifully turns back to the grill after grabbing the next order up, starting to cook just as surely as if there wasn’t a cum-hungry whore trying to free his cock.");
	output("\n\nYour deft fingers lock around his zipper, carefully tugging it down and grabbing the meaty shaft of Herman’s cock. You roll his apron up to get a look at your prize: it’s as big as you’d hoped, more than a foot and a half of turgid meat expanding at your touch, filling out to its full length at your tender touches. It’s bear-like in shape, thicker around than you can wrap your fingers over and blunted at the tip, its thick gash of a urethra sitting in a basin-like depression between the flat mass of cockhead.");
	output("\n\nUnbeckoned, your hungry tongue slips out and laps along the underside of Herman’s rod. That finally gets a reaction out of the hard-working stud; he shudders, teeth gritting. He turns from the grill to the register, and you move with him, taking the opportunity to draw your tongue along the side of his freed willy. The taste is unbelievable, so good... musky, thick, manly. Like every male on this wonderful world, Herman seems to exude an aura of unwavering masculinity, the kind of men that spend their days breeding bitches, to whom sex is life itself. The flavor of his cock is electrifying, only spurring on your rampant, instinctual need for his cum. When Herman turns again, your lips lock around his flared, bearish cockhead, jaw straining to take the sheer girth of his blunted mast.");
	output("\n\n<i>“Eager, aren’t ya?”</i> Herman grunts under his breath, reaching down to ");
	if(pc.horns == 0) output("pat your head");
	else output("grab one of your bestial horns, pulling you down on his rod");
	output(". Your expertly-tamed gag reflexes subside utterly as his big, rough hand guides you down his bestial member, your throat expanding around the long, thick schlong being crammed down it. Herman turns again, all but dragging your limp, cock-craving body with him; you obediently follow the stud’s every motion, all conscious thought subsiding to the desperate need to suckle from his cock, to drain every drop of delicious, salty seed from his loins.");
	output("\n\nWhen his hand leaves your head, reaching for his spatula, your cock-sucking instincts take over from him, your head bobbing up and down his length on automatic. Herman grunts again, breath catching as your tongue swirls around his flared head, as your hands stroke the shaft when your mouth is elsewhere. When you slide yourself back down his length, your hands reach through his fly, cupping a pair of heavy, meaty nuts still inside, covered with a thick layer of fuzz. You cup the bull’s twin, churning balls, barely able to contain your own excitement as you feel them, feel how full they are, ready to flood your needy lips with semen if you work just a little bit harder.");
	output("\n\nYou gently squeeze and caress Herman’s hefty sack, moving your head along his cockflesh faster and faster, working yourself to a feverish pace of sucking and wanking, working as quick as you can to extract your salty meal from the chef’s meat. He grunts, a bull-like snarl as you work him over; his cock throbs and trembles with building need, so close to release you can taste the thick, creamy treat... or is that just the river of pre pouring down your throat?");
	output("\n\n<i>“Slow down, or I’m gonna... gonna...”</i> Herman starts to stay, his voice trailing off into a wordless, bestial groan. You can feel his cock expanding, the thick load moving through it, shooting towards the waiting reception of your [pc.lips]. Just before the moment of his release, the chef roughly pushes you off his cock, sending you back with a yelp of surprises and utter disappointment. Instead of your mouth, the chef leans down and catches his cockhead between the folds of a hot, greasy roast beef on rye right off the grill. His hips buck like a bronco’s as he blows his load across the open lips of the sandwich, slathering it with his own special topping.");
	output("\n\n<i>“Order up,”</i> Herman grunts, slapping the spunk-filled roast beef closed and handing it down to you. <i>“On the house.”</i>");
	output("\n\nTalk about eating cum. You giggle and take the sandwich, munching down on the savory, salty cock-based concoction. The taste sends shivers of pure ecstasy down your spine as you finally sate your hunger for cum... and also lunch. You slump back against the interior of the counter, feasting upon the creamy sandwich. Delicious!");
	pc.exhibitionism(2);
	pc.lust(15);
	processTime(23);
	pc.energy(100);
	//pc.thickness += (1);
	pc.modThickness(1);
	IncrementFlag("HERMAN_SPECIAL_ORDER");
	var ppHerman:PregnancyPlaceholder = new PregnancyPlaceholder();
	ppHerman.createPerk("Fixed CumQ", 2000, 0, 0, 0);
	pc.loadInMouth(ppHerman);
	pc.loadInMouth(ppHerman);
	pc.loadInMouth(ppHerman);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Grand Teh
//[Watch Screen]
public function stephIrsonBySavinWhoSaysHesTiredOfTreatedCowBimbosThenMakesHerATreatedCowGirlForShitsAndGigglesWhyIsThisFunctionNameSoLong():void
{
	clearOutput();
	stephHeader(3);
	
	flags["STEPH_WATCHED"] = 1;
	
	output("You seat yourself on one of the benches in the grill, kicking your [pc.feet] up onto the table and turning your attention to the sizable Super-HD Viewscreen mounted above the bar. As you sit, the last commercial break is just coming to an end, instructing you to purchase the Treatment from the gift shop in the lobby before the screen fades to a superimposed logo of <b>Steph Irson: Galactic Huntress</b>, a popular nature show. Beneath the title script, a warning appears in large red letters: <i>“This Show Rated X, Adults Only, by the Galactic Entertainment Ratings Board for Graphic, Sexual, and Disturbing Imagery. You Have Been Warned.”</i>");
	output("\n\nThe camera pans down from a wide-angled shot of the vast, sweeping plains of Grand Teh to finally focus on the hostess, Steph, sitting atop a simple wooden fence at the field’s edge, one leg crossed over the other, showing off the calves beneath her sheer short-shorts. To her right and left are a pair of prodigiously-endowed cow-girls, their massive breasts bare, resting atop the fence-posts as they look placidly off into the distance behind the camera, both chewing on what looks like lettuce.");
	output("\n\n<i>“Welcome to a special edition of </i>Galactic Huntress<i>,”</i> Steph Irson says, as ever in her strong New Brisbane accent. As the camera zooms in on her face, you’re treated to a close-up view of the perky cat-ears now resting atop her hair, as well as the odd, almost metallic-gray color of her lips and irises. Every time she blinks or speaks, the colors seem to shift and swim, as if alive and moving.");
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
	stephHeader(3);
	
	output("Steph sets her big bucket down, cracks her knuckles, and wipes the milk from her lips. <i>“Right, then. That’s a Tehan sheila for you. Now, we’re going to have to be a little more careful up ahead: we’re on a quest to find a Tehan male. Now, these bovine ladies we’ve met so far are typical of their sex here: quiet, content, eager to please. But the studs here on Grand Teh are a bit more aggressive. They’re slightly outnumbered by the females, with each bull able to sate his base urges on a whim, spreading their wild oats freely among all the girls. But the Treatment’s made ‘em big, burly, and eager to go toe-to-toe on a hairpin.”</i>");
	output("\n\nAs she’s talking, Steph’s walks out of the stall and back into the barn proper. Her “quest” takes her all the way to the other end of the barn, where in the background of her narration, you can see a huge, muscular man pounding away at one of the harnessed-up cowgirls, plunging his cock into her spread pussy as the automated milkers work their magic on her. Seeing the proceedings out of the corner of her gray eye, Steph freezes mid-step, hunching down and whispering to the camera drone, <i>“Alright, here we go. I’m going to have to be very, very careful not to earn this bull’s ire. Small words, a non-threatening tone.... I absolutely do not want to be seen as a threat, especially during what must be mating season here on Teh.”</i>");
	output("\n\nIn proper <i>Galactic Huntress</i> fashion, Steph starts to creep up toward the bull, stealthily making her way up behind his pistoning hips. The camera drone floats around to get a better picture of him: mostly human, but freakishly tall, with massive bull horns growing from his brow. The man’s muscular to the point of a bodybuilder, with a thick layer of body hair that clings tightly to his darkly tanned skin. His jaw is locked in a frown of effort, and he’s grunting deeply, almost like a real bull. Every powerful hip-thrust sends the cow-girl rocking in her harness, her assflesh rippling with the impacts.");
	output("\n\n<i>“G’day, mate!”</i> Steph says suddenly from the stud’s side, leaning against the stall wall.");
	output("\n\n<i>“‘Sup,”</i> he answers, not breaking pace nor looking up.");
	output("\n\nInching closer, Steph asks, <i>“Got a sec to answer some questions, big boy? For the viewers at home?”</i>");
	output("\n\n<i>“Working,”</i> he grunts, slapping the cow-girl on the ass. She shrieks, a large red-mark left on her behind.");
	output("\n\nSteph pouts. <i>“C’mon, you’re the first stud I’ve seen all day.”</i>");
	output("\n\nThe bull finally looks away from the jiggling cow-butt between his legs and glowers at the huntress. <i>“Lady, I’m balls-deep in a bitch right now. Can you wait like, five minutes?”</i>");
	output("\n\n<i>“That doesn’t make for exciting television, now does it?”</i> Steph says, arms crossed. As she does so, her camera drone shudders and re-focuses on the gap between the stud and his breeder, zooming in on his huge cock pounding her spread pussy and giving you a gloriously high-def view of the fem-cum spurting out around his rod. Now <i>that</i>’s some good television.");
	output("\n\n“You sure I can’t borrow you for a minute?” Steph purrs, her feline ears perking up atop her head as one of her arms reaches out to caress the thick, tense muscles on the Treated man’s arm.");
	output("\n\nThe stud hilts himself in the cow and grunts with bestial enthusiasm, his breath hot and heavy as the camera drone focuses in on him, and then on thoroughly-bred cow beneath him. With another feral grunt, the bull takes a step back from the well-fucked cow-slut and letts a torrent of spooge pour out of her packed pussy, a waterfall of white that very nearly splatters on the camera drone. When it recovers, you’re treated to a full-frontal view of the stud’s cock: a huge equine phallus almost as long as his arm dangling between his muscular legs.");
	output("\n\nHe turns to Steph with a toothy grin and grabs the Huntress’s ass in both hands, pulling the khaki-clad hostess up against himself. Steph makes a pathetic little yelp as she’s all but hauled off of her feet, her bare legs rubbing up against the bull’s half-hard prick - which immediately smears her tanned flesh with thick, white cream.");
	output("\n\nThe bull grabs the camera drone as it passes by, making it chirp and buzz at him as he pulls its camera around to look him right in the face. <i>“Want some exciting television, viewers? I hear this slut tapes live, don’tcha?”</i>");
	processTime(10);
	pc.lust(10);
	clearMenu();
	addButton(0,"Next",stephIrsonEp3Pt3);
}

public function stephIrsonEp3Pt3():void
{
	clearOutput();
	stephHeader(3, true);
	
	output("<i>“Hey, I’m not a-”</i> Steph starts to say, getting cut off when the bull bucks her onto the milker. His free hand all but rips her shirt off by the back, leaving tattered fragments of cloth hanging limply from Steph’s shoulders.");
	output("\n\n<i>“Why don’t you interview this?”</i> he chuckles, aiming the camera drone down to watch as he cranes Steph’s head into the thighs of the cow-girl he was just fucking, rubbing the huntress’s nose into the cream-packed slit between them. The cow immediately starts to moan, arching her back and clutching at her over-sized jugs - you can’t see the action up close, but something tells you Steph isn’t exactly resisting the bull’s direction.");
	output("\n\nThe stud chuckles and steps back, keeping one hand firmly planted on Steph’s back as he circles around, giving you - and the hundreds of thousands of other viewers across the galaxy - an ultra-HD panoramic of Steph Irson lapping up his cum from the cow’s twat. <i>“Always wanted to do a porno,”</i> he laughs, almost boomingly loud so close to the drone’s microphone.");
	output("\n\nHe lets go of Steph’s back, and grunts approvingly when she stays right where he put her, making his bovine bottom moan and squirm between the attentions of the milker and Steph’s apparently very talented tongue. The bull makes quick work of the rest of Steph’s clothing, yanking away her tattered top and pulling her khaki booty shorts down around her ankles, revealed a pussy with silver-grey lips.");
	output("\n\n<i>“Woah, what do we have here?”</i> the bull says, crouching down behind the bent-over huntress and focusing the drone in on her drooling sex. <i>“Nice and smooth and painted up...”</i> he reaches forward to tease a finger along her lips, tracing a thick digit around her sex before plunging a pair of them inside her... and then the rest in quick succession, burying himself to the wrist.");
	output("\n\n<i>“Damn, babe, that’s some fine work you’ve got done down her. Fuckin’ stretchy as hell... it’s like you were just </i>made<i> for takin’ big dicks, huh?”</i>");
	output("\n\nSteph yelps something, trying to sit up but finding herself trapped in the iron grasp of the cow-girl’s thighs. The bovine babe’s legs are wrapped around Steph’s shoulders, the camera reveals, pulling the huntress deeper and deeper into the cow’s cunny... and the growing lake of moisture pooling under her ass, drool and cum and feminine excitement mixing into what you can only imagine to be an heady aroma. Steph must be going insane down there...");
	output("\n\n<i>“Fuck it, guess I don’t need to get you warmed up after all,”</i> the bull laughs, pulling his fist out of Steph’s cunt and standing up, leaving her silver lips so agape it looks like you could just roll a bowling ball into her. The bull grabs his mammoth dick and hefts it up, flopping the hardening equine erection right onto Steph’s bubble butt. The huntress yelps and cries out - you’re not sure if in pleasure or alarm, as her words are drowned out in cow-girl pussy.");
	output("\n\nSpeaking of cow-girls, the babe Steph’s eating out takes the opportunity to let out a bellowing <i>“Mooooo!”</i> and throw her head back in a sign of ultimate pleasure, spraying Steph down with a geyser of fem-spunk and discharged bull-seed in what looks like an orgasm of legendary proportions.");
	output("\n\nA moment later and the cow flops heavily onto her back, completely still. <i>“Damn,”</i> the bull grunts, craning the camera up to look at the blissed-out look on his partner’s face, eyes rolled back up and mouth agape. <i>“Guess you know how to handle a cow... Heh, I bet you’d like some of that same treatment, wouldn’t you, slut?”</i>");
	output("\n\n<i>“I AM NOT A-”</i> Steph finally manages to say, digging her head out from the cow-girl’s thick, cum-splattered thighs. The camera automatically zooms in on her face, giving you a perfect look at her wet cheeks and the rivulets of white spilling down from her silver lips.");
	output("\n\nThe bull cuts her off with a rough spank that makes her ass jiggle under his heavy rod, and Steph’s words coil into a scream of pleasure.");
	output("\n\n<i>“Don’t think I heard you, slut,”</i> the bull grunts, digging his fingers into Steph’s behind and massaging her ample ass, squeezing and kneading until she’s moaning and quivering in his grasp. <i>“Ready for me to make you a real cow, yet?”</i>");
	output("\n\nSteph answers with a wordless moan, grinding back against the bull and wiggling her hips. The immense stud just laughs and starts to move his hips, sliding his still-slick shaft between her asscheeks. As he does so, he moves his hands from the huntress’s butt to the passed-out cow’s tits, yanking the milker pumps off of her plump breasts with a squirt of white cream that rains down all over Steph.");
	output("\n\n<i>“Smile for the camera, babe,”</i> the bull grunts, bringing the camera around to look Steph in her spunk-splattered face. As he does so, he reaches up and attaches to milkers to her perky handfuls of boobs. She immediately starts to moan, arching her back as the suction cups try and drain her of... nothing.");
	output("\n\nThe bull grunts and cocks an eyebrow, as if he can’t understand why there’s not a flood of white cream pouring out of Steph’s tits. It hits him a moment later, and he laughs heartily, giving her a smack on the ass for emphasis. <i>“Oh, right. Hah, been ages since I found a slut who didn’t just turn into a milky mess when I hooked her up. But I bet you wanna fix that, don’t ya? You want the whole New Texas experience... for your viewers at home.”</i>");
	output("\n\nHe reaches over to where several articles of clothing are hanging on the wall and fishes a small bottle out of the cow-girl’s purse, rolling in in his hand for the camera to reveal the big, friendly words <i>“BOVINIUM”</i> labeled on it. <i>“Some of the cows here take these if they’re not all the way satisfied with what the Treatment gives ‘em,”</i> the bulls says, opening the bottle and tipping out a cute little gummy cow into his hand. <i>“Just in case they want bigger tits or even more milk. Sounds about right up your alley.”</i>");
	output("\n\nSteph’s eyes go wide as the big, burly bull looms over her... but you notice she doesn’t seem to resist as he places his gummy-laden hand over her lips, tipping the candies into the Huntress’s mouth.");
	output("\n\nSeveral of the cow-folk who’ve gathered around you to watch the <i>Galactic Huntress</i> all cheer and bellow variations on <i>“yee-haw”</i> and <i>“moo!”</i> The whole restaurant seems to come alight with activity - everyone’s in an uproar as the Huntress starts to change bodily, her once-perky tits expanding, and her thighs and hips thickening like a proper New Texan cow. You watch with mounting arousal as Steph’s body changes in front of the camera, her tits growing and growing with added weight. They fill out to a pair of huge, jiggling jugs - perfect circles resting high on her chest, with tan skin only emphasizing the puffy pink teats at their tips.");
	output("\n\nTips that start to bud with moisture. Steph groans as the suction tubes latched onto her expanding bust start to coax out a trickle of... of milk! Those candies really are making her just like a good little cow, thick and milky and moaning as she’s drained of what her body’s now producing. The bull grins, reaching forward to sink his hand into Steph’s super-soft boob, squeezing until she cries out. And, you note, her hand starts to slip down towards her cunt, which the camera drone shows to be all but drooling with excitement.");
	output("\n\n<i>“What’s that, babe? Need a little attention down there?”</i> the bull growls, grabbing Steph’s hand before she can start to masturbate, making her moan as her body’s subjected to irresistible pleasure from the milker. She’s like a limp, leaking doll in his hands, tiny and helpless as the stud picks her up, turns her around so she’s facing her camera drone, and drops her down on his flared cockhead.");
	output("\n\n<i>“Alright, let’s finish this! You following me, camera drone?”</i> he laughs, slamming Steph down on his cock. The drone dutifully zooms in on the action, focused in as his massive shaft spreads Steph wide. You watch as the Huntress is bounced up and down by his bucking hips, her gut distending to make room for the sheer mass of cock inside her cunt, stretching and compacting as the bull fucks her brains out. Steph cries out, grabbing at the stud’s arms, her tits, anything she can to steady her bouncing, jiggling, orgasming body.");
	output("\n\nSteph’s climax is as loud as it is wet, heralded by a scream of pleasure at the bottom of one of the bull’s bucks, when every inch of cockflesh that can be is crammed into her. The camera watches close as her pussy sprays out a thick load of femcum, splattering the camera lens with that and a geyser of milk sloshing out from her heavy, bouncing tits and through the milker’s tubes.");
	output("\n\nSatisfied that he’s put the huntress in her place, the bull takes a step forward and presses Steph into the wall of the stall, squishing her between his body and the hard boards. With her immobilized, he’s free to grip her hips and start pounding, thrusting as hard and deep as he can to get himself off in the bovinified-Steph’s sodden box. He doesn’t take all that long to reach his peak when he puts his mind to it, and soon he’s grunting with effort, balls visibly clenching as he prepares to cum.");
	output("\n\nAt the last moment, the bull pulls out, leaving Steph’s pussy gaping. He grabs his cock and aims it over her like a hose, letting the mammoth tool loose to spray a torrent of thick seed over Steph’s back and ass, practically plastering her to the wall with his sticky load. By the time he’s done, Steph looks like a snow-woman, completely covered in white spunk. The bull grins, slaps her ass, and turns to leave...");
	output("\n\n... Only to turn back, grab the camera drone right out of the air, and give it a toothy grin. <i>“That’s it for this week’s episode of </i>Galactic Slutress<i>. Tune in next week to watch this big-titted bimbo get fucked by something else. Oh - and hi, mom!”</i>");
	output("\n\nThe camera feed cuts out, and a commercial break cuts in.");
	
	watchStephEpisodeBroadcast("STEPH_COWGIRL");
	
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
	
	output("\n\n<i>“Oh, hey, before you go: since we’ve collected your sperm properly, would you mind if we sold it? Plenty of people out there are real choosy about what genes they want, and you look like a " + pc.mf("prize winning stud","cute lil’ thing any girl would want to father their children") + "! I can even give you some money for it up front!”</i>");
	
	processTime(2);
	
	// Reset that flag so things can go back to normal again.
	if(flags["MILK_BARN_COCKMILKER_REPAIR_DAYS"] != undefined) flags["MILK_BARN_COCKMILKER_REPAIR_DAYS"] = undefined;
	
	//[Yes] [No]
	clearMenu();
	StatTracking.track("milkers/prostate milker uses");
	StatTracking.track("milkers/cum milked", cumTotal);
	addButton(0,"Sell It",sureSellMyCumBabiesFarAndWide,cumTotal);
	addButton(1,"Don’t Sell",noIDontWantToSellBabies);
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
	
	//honey worth more! (rare fluids vary in price!)
	x = fluidValue(pc.cumType, x);
	return x;
}

// You done broke the milker, son.
public function yesGoMilkarGo(amount:Number = 0):void
{
	clearOutput();
	showCarrie();

	output("Ignoring the milker’s obvious protest, you decide to stay strapped in and try to ride it out.");

	output("\n\nBad idea.");

	output("\n\nBefore you could utter your next moan, the machine bucks as the tubes break free from the casing inflating and tightening with the backed up flow of your seed. Looking down, you see the milker itself is straining but losing the fight. Like a broken hose, the tubes split themselves under the pressure. Streams of [pc.cumColor] spray out from the tiny pinprick holes, rapidly increasing in size. With a pressurized burst, a shot of cool air ejects and caresses your [pc.crotch]. The tubes then surrender and pop like balloons, sending [pc.cum] flying outward. The machine stutters and jumps again like a wild bull, landing with a reverberating crash. The alarm lights finally blink to life and the sirens ring.");

	output("\n\nHearing the loud boom, clanking machinery, and the blaring alarm, Carrie quickly jumps out of her stool, brightens the lights, and rushes over to the scene. The auburn-haired cow-girl looks at the milker, its tubes split open, with globs of [pc.cum] flowing out of them. <i>“What in tarnation?!”</i> she exclaims. <i>“Are you okay?”</i>");

	output("\n\nYou can only nod slightly as the dildo continues to ream your anus and prod your prostate, forcing you to arch your back and stiffen your limbs.");
	if(pc.isTreated()) output(" You can feel yourself mindlessly drooling in the moment, your [pc.tongue] lolling out from the corner of your mouth. This is just too good!");

	output("\n\nSeeing that you were not immediately hurt in the commotion, she instantly turns to the milker to see if she can stop it from completely breaking down. Turning the knobs to equalize the pressure, pumping levers to drop the excess back-flow, and pressing buttons to shut off the power supply sources in a systematical order. You can hear the milker’s engines slow to a halt, but the pressure around [pc.eachCock] is unabated. The machine lets out an angry internal thud right before its engines are completely silenced. <i>“Oh, no,”</i> Carrie mewls, and with graceful aptitude, the cow-girl presses the emergency release button on a panel. Releasing a hiss, the connected tubes unlatch and fall off your [pc.cocks].");

	output("\n\nIt takes a few more thrusts before Mister Floppycock finally manages to draw down to a creeping stop, still half-lodged in your [pc.asshole], the full brunt of the cock’s crown pressing down on your poor, battered prostate. You can’t take it anymore and flex your rectal muscles, launching the large pink dildo from your abused ass. Like a lewd pendulum, it pivots up and swings back, giving you a big, wet slap on your [pc.butts]. The impact is the proverbial straw that broke the camel’s back as you cannot hold the pressure any longer, letting the flood gates open and shooting");
	if(silly && pc.cumQ() >= 50)
	{
		output(" the rest of your [pc.cumColor] load right into Carrie’s face");
		if(pc.cumQ() >= 200 && pc.cumQ() < 500) output(" and");
		else if(pc.cumQ() >= 200) output(", lathering her");
		if(pc.cumQ() >= 200) output(" chest");
		if(pc.cumQ() >= 500) output(", and drenching her entire body");
		output("! You didn’t actually notice her in your range of fire, but it looks like she just got a faceful of your [pc.cum]!");
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
	var cumEstimate:Number = cumMilkerCumEstimate();
	
	// Uh-oh, silly mode
	if(amount + cumEstimate > 4000000)
	{
		output("\n\nSuddenly, a loud creak can be heard from the tanks on the side wall of the barn...");
		addButton(0,"Uh-Oh",ohNoSillyCumFloods);
	}
	// Fixit? [Yes] [No]
	else
	{
		output("\n\nThat’s a good question. Would you like to fix it?");
		
		addButton(0,"Yes",yesFixDaMilkar);
		addButton(1,"No",noFixDaMilkar);
	}
}
public function cumMilkerCumEstimate():Number
{
	if(pc.cumQ() * 3 >= pc.currentCum()) return (pc.cumQ() * 3);
	return pc.currentCum();
}

// Better safe than sorry--end it nao!
public function noStahpMilkarStahp(amount:Number = 0):void
{
	clearOutput();
	showCarrie();

	output("You decide to play it safe and holler for Carrie like she said, flailing your arms wildly to get her attention.");

	output("\n\nThe lights return to their normal brightness as the auburn-haired cow-girl steps from her stool and approaches you. <i>“What’s wrong, stud?”</i>");

	output("\n\nWith the floppy latex cock up your [pc.asshole] and the pressure on your prostate, you can’t gather much besides long exaggerated " + pc.mf("groans","moans") + ". Taking a deep breath, you try again, but only lewd noises escape your mouth.");

	output("\n\n<i>“There, there [pc.boy], just calm down. What is it you need?”</i> Noting the desperation in your voice she quickly sputters out some guesses, <i>“More lube?”</i>");

	output("\n\nYou shake your head.");

	output("\n\n<i>“Less lube?”</i> she ponders, <i>“No, wait - You want it deeper?”</i>");

	output("\n\nYou strain to to get the words out of your mouth, but a sudden creak in the milker and a blaring alarm with flashing lights make your situation apparent.");

	output("\n\n<i>“Oh, heavens to Betsy!”</i> Carrie jumps up and immediately turns the dials down, relieving you of the pressure on [pc.eachCock].");

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

	output("\n\nCarrie giggles, <i>“Seems like you were enjoying Mister Floppycock a little too much there. Then again, when I said you should be ready to cum buckets, I didn’t mean aerial firefighting buckets!”</i> After she presses the red button again, the milker shudders and withdraws back up into the ceiling. Carrie taps your ass again and comments, <i>“I didn’t think it was possible to overload the milkers, especially the ones here in the barn. Good thing you warned me when you did - we could have lost a milker back there!”</i> She pecks your cheek with a kiss of praise for your impressive virility. <i>“Here, let’s get you out of this...”</i>");

	output("\n\nNodding weakly, you use whatever strength you have left to stand high enough for her to access the restraints.");

	// Sell or not?
	carrieFinishedMilking(amount);
}

// Yes, try to fix it... if you can afford it!
public function yesFixDaMilkar(bGiannaScans:Boolean = true):void
{
	clearOutput();
	showCarrie();
	
	// How much does it cost to fix?
	var nCost:Number = 10000;
	
	output("You tell Carrie that you will repair the milker.");
	
	// For right after you borked it. Hello, Gianna!
	if(bGiannaScans)
	{
		output("\n\nShe sighs, <i>“Sorry hun, but I can’t let you fix it");
		if(pc.characterClass == GLOBAL.CLASS_SMUGGLER) output(" with any old part you can grab from the black market, you know");
		else if(pc.characterClass == GLOBAL.CLASS_MERCENARY) output(" with bullets and brute force - even if you are good with your hands");
		else if(pc.characterClass == GLOBAL.CLASS_ENGINEER) output(" yourself - no matter how smart or talented you may be with gadgets");
		else output(" if you are thinking about fixing it yourself");
		output(". There’s a policy here that says if you’re not an official farm hand, you’re not allowed to touch the equipment. Boss’s orders. Besides, we need to make sure there aren’t any troublemakers planning to sabotage the machinery and take off with the goods. I hope you understand.”</i>");
		
		output("\n\nYou nod and ask how much it will cost to pay for the damages.");
		
		output("\n\n<i>“Now you’re catching on,”</i> the auburn-headed bovine smiles. She turns her view to the far corner of the barn");
		
		// Ohnoes, Gianna isn't there!
		if(giannaAWOL())
		{
			output(" as if looking for someone. She furrows her brows and shakes her head, <i>“Aw darn, looks like ‘Anna isn’t around, so this scan might take a little longer than usual... I hope ya don’t mind a little wait!”</i> Carrie pulls out a device from her back pocket and unfolds it, revealing it to be a holo-tablet. She then glides her fingers across the projected screen to access a series of applications. A beam of light projects from the device and onto the milker. It oscillates up, down, left, and right as the device beeps and clicks - audible signs of it scanning and evaluating the machine’s damage. Keeping up her professionalism, Carrie flashes you a close-mouthed smile and focuses on the graphs and charts on the screen, rapidly checking boxes and filling out info as the prompts fly by.");
			
			output("\n\nYou sit on a nearby stool and wait... and wait... and wait. At one point, Carrie even props the scanner up on another stool and pulls out a");
			if(hours >= 10 && hours < 14) output(" lunchtime sandwich");
			else if(hours >= 22 && hours < 2) output(" midnight snack");
			else output(" bag of chips");
			output(" and a bottle of sarsaparilla and shares them with you. After a good hour, an affirming beep emanates from her tablet.");
			
			processTime(65);
			
			output("\n\nCarrie gives you a wink, <i>“Alrighty! Sorry that took a bit, but thanks for being a patient cow[pc.boy].”</i> Grabbing her data slate and tapping its screen, she carefully reads the numbers displayed on it, <i>“Hmm... Looks like, with all the internal moisture damage and broken specialty parts, the repairs are going to run you about " + nCost + " credits to get this machine working like brand spanking new again.”</i>");
		}
		else
		{
			output(" and calls, <i>“‘Anna, baby, can you give me some help over here?”</i> Not soon after, a");
			if(flags["MET_GIANNA"] != undefined) output(" familiar face");
			else output(" milky-white, woman-shaped android");
			output(" scurries over, her raven-black ponytail braid swishing behind her. Carrie pulls out a device from her back pocket and unfolds it, revealing it to be a holo-tablet. She carefully connects a thin cord to the fembot’s plug located on the seventh cervical vertebrae, feeding data directly to the tablet. Carrie then glides her fingers across the projected screen to access an application. She continues, <i>“I’ll need to assess any internal damages for that milker there,”</i> she points, <i>“Please give it a nice thorough scan.”</i>");
			output("\n\n");
			if(flags["MET_GIANNA"] != undefined) output("Gianna");
			else output("The gynoid");
			output(" nods obediently and heads to the broken milker with a cute, girlish skip in her step. Kneeling over, quite seductively so, she gently places the fingertips of one of her hands on the metal surface of the male milker. Her eyes light up and glow as Carrie’s tablet screen flickers with animated charts, rotating diagrams, and running various numerical meters. It only takes a minute or two and the scan is finally complete. After an acknowledging beep from the device,");
			if(flags["MET_GIANNA"] != undefined) output(" Gianna");
			else output(" the android");
			output(" removes her hand and stands up with a little hop");
			if(flags["MET_GIANNA"] != undefined) output(", her soft anatomy jiggling in response");
			output(".");
			
			processTime(5);
			
			output("\n\n<i>“Thanks sweetie, you’re a doll.”</i> With that, the perky android is disconnected from the device and dismissed, giving you a quick wave before continuing her other duties around the barn. Carrie then turns to you after reading the numbers displayed on the tablet. <i>“Looks like, with all the internal moisture damage and broken specialty parts, the repairs are going to run you about " + nCost + " credits to get this machine to function like new again.”</i>");
		}
		
		output("\n\nYou");
		if(pc.isBimbo()) output(" make a surprised pout in response.");
		else if(pc.isBro()) output("r face contorts into a unsurprising ‘huh?’ face after what you just heard.");
		else if(pc.isNice()) output(" gasp aloud, concerned about the amount of damage you caused.");
		else if(pc.isMischievous()) output("r smirk visibly melts into a discontented frown at the price tag.");
		else if(pc.isAss()) output(" curse under your breath as you let that number seep in.");
		else output("’re somewhat shocked by the bill. Must be some pretty unique parts, you figure.");

		// Keep track if price has been scanned!
		if(flags["MILK_BARN_COCKMILKER_SCANNED"] == undefined) flags["MILK_BARN_COCKMILKER_SCANNED"] = 1;
	}
	// For repeat scenes.
	else
	{
		output("\n\n<i>“Right, you know the drill, hun.”</i> Flipping out her tablet, she quickly reads the figure and reports the cost to you. <i>“That’ll be " + nCost + " credits for the repairs.”</i>");

		output("\n\nYou flip your wrist and look at your current funds. You");
		if(pc.credits <= 0) output(" are not sure you could afford anything, much less pay for the damages...");
		else if(pc.credits < nCost) output(" don’t quite have enough credits to pay for the damages...");
		else if(pc.credits == nCost) output(" have that exact amount, what a coincidence!");
		else if(pc.credits >= (nCost * 10)) output("’re not even phased by that. You have way more than enough to spend on repairs if you wanted to.");
		else if(pc.credits >= (nCost * 4)) output("r wallet can survive that, thankfully.");
		else if(pc.credits >= (nCost * 2)) output("’ll have to split your spending money, but it’s not too bad.");
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
	showCarrie();
	
	output("You shake your head, letting the cow-girl know that you can’t");
	if(!bForPay) output(" help her repair the milker");
	else output(" pay her");
	output(" at the moment.");
	
	output("\n\nCarrie replies with a frown, <i>“I guess it can’t be helped. Just know that I can’t");
	if(!bForPay) output(" allow you to use the milker again until it is fully repaired");
	else output(" do any repairs unless you hand in the payment first; so the sooner you pay the repair bill, the sooner you’ll be able to use the milker again");
	output(". Sorry for the inconvenience, babe.”</i>");
	
	processTime(1);
	
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

// The fixining!
public function fixDaMilkar(amount:Number = 0):void
{
	clearOutput();
	showCarrie();
	
	output("The cowbell around Carrie’s neck clunks as she switches her posture. She contorts her lips and blows upwards to get a loose bang of hair away from her face. Looking down, she quickly taps a few things on her tablet’s interface. Waving the scanner end of the control tablet above your Codex, it gives a couple beeps, alerting you that " + amount + " credits have been transferred over. ");
	
	if(pc.isBimbo()) output("You could have used that money for like, a manicure or something! Oh well, you guess you’ll have to make it up by sucking cocks for creds now. Ooh... that actually sounds yummy!");
	else if(pc.isBro()) output("Dude, what a waste of money. But you totally wrecked that machine with your splooge! Maybe you can get a higher score next time?");
	else if(pc.isNice()) output("Smiling nervously, you can’t help but feel a little embarrassed about the situation. Though you did pay back your debt, so you’ll no longer have that on your conscience to worry about.");
	else if(pc.isMischievous()) output("Well, that’s a prime example of how your sexual body organs could dig a deep hole through your cred wallet. Best be more careful next time....");
	else if(pc.isAss()) output("Damnit. This fucking machine was made for the expressed purpose of getting screwed, not the other way around!");
	
	// Take dat money
	pc.credits -= amount;
	if(flags["MILK_BARN_COCKMILKER_BROKEN"] != undefined) flags["MILK_BARN_COCKMILKER_BROKEN"] = undefined;
	
	// Set the flag! 5 days...
	flags["MILK_BARN_COCKMILKER_REPAIR_DAYS"] = 5;
	
	output("\n\nThe cow-girl gives you an approving glance and then winks, <i>“All set! Now you just need wait about " + num2Text(flags["MILK_BARN_COCKMILKER_REPAIR_DAYS"]) + " days until the milker is in working condition. Until then, try not to go blue balls on me, otherwise I’ll have to sic Mister Floppycock on you without the milker, okay sugar?”</i>");
	
	processTime(2);
	
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

// Silly mode: the floodining!
public function ohNoSillyCumFloods():void
{
	clearOutput();
	showCarrie();
	
	output("The creaks get louder as you and Carrie meet eye-to-eye, knowing all too well what is to come.");
	
	output("\n\n<i>“I’m not paid enough for this!”</i> are Carrie’s final words before an overloaded tank bursts behind her with " + indefiniteArticle(pc.cumColor()) + " explosion. As predicted, all the tanks simultaneously explode like New Years fireworks, the copious amounts of cum swirling and mixing into one giant semen tsunami. The wave of [pc.cum] barrels down on the two of you and the room quickly floods. You can see Carrie flail about, trying to find her bearings. When she is in swimming position, she finds the button to unlock the door. Punching it as hard as she can, the locked door opens without resistance. You and Carrie are swept up by the current and launched outside in a torrential river of cum!");
	
	output("\n\nYou close your eyes and your vision hazes...");
	
	processTime(5);
	pc.applyCumSoaked();
	pc.applyCumSoaked();
	pc.applyCumSoaked();
	pc.applyCumSoaked();
	pc.applyCumSoaked();
	
	clearMenu();
	addButton(0,"Next",ohNoSillyCumFloodsPtII);
}
public function ohNoSillyCumFloodsPtII():void
{
	clearOutput();
	showCarrie();
	
	processTime(300);
	
	output("You open your eyes and find that you are back in the milking stall again.");
	
	output("\n\n<i>“Hello there, stud!”</i>");
	
	output("\n\nYou turn to find Carrie with a towel around her neck. She has obviously taken a shower and dried herself off not too long ago. Looking at your Codex, you realize a good deal of time has passed.");
	
	output("\n\nYou try to ask what happened, but Carrie cuts you off, already expecting the question, <i>“Trust me, you really don’t want to know the details...”</i> She flashes a smirk. <i>“Let’s just say that varmints are horrible swimmers. Oh, and you owe me big time for getting your heiny off of Big T.’s roof.”</i>");
	
	output("\n\nShaking your head, you pull yourself together. You thank Carrie for the help and she allows you to wash off in her shower. As soon as you dry up, you wear your [pc.gear] and are on your way.");
	
	pc.shower();
	processTime(60);
	
	clearMenu();
	addButton(0,"Next",mainGameMenu,undefined,"Next","Welp, that happened...");
}

//Requirements: Male Treated, 0 < Cocks
//Intros
public function carrieBlowjobIntro():void
{
	clearOutput();
	showCarrie();
	author("Nonesuch");
	//First
	if(flags["CARRIE_BLOWJOBBED"] == undefined)
	{
		if(pc.isTreatedBull()) output("To you, the steel of the milking machine is a gray background detail next to the fleshy, milky curves of the machine’s operator, displayed brazenly in her skimpy, skin-tight cow outfit. They radiate summery, dreamy arousal to you, drowning everything else out, [pc.eachCock] hardening as you simply stand and drink her in. Carrie grins sheepishly, looking away; dimly you realize a good five seconds have crawled by in which you’ve simply stared at her.");
		else output("It’s difficult to care much about the severe steel of the milking machine when it’s being operated by a cow-girl, particularly one in the kind of outfit Carrie is sporting. You can actually feel your [pc.skinFurScales] relaxing, pores opening and exuding your hot, masculine musk when you gaze at her fleshy, milky curves. She grins sheepishly under your attention, looking down demurely.");
		output("\n\n<i>“You okay, " + pc.mf("guy","girl") + "?”</i> she says.");

		output("\n\n<i>“Yeah,”</i> you grin. You can practically feel the pheromones pouring off of you, and you" + (pc.isTreatedBull() ? "r heady tunnel vision allows you to" : " can actually") + " see the effect they are having on the auburn-headed cow - the way her lips slowly part, her pupils dilating, her smile growing softer.");
		output("\n\n<i>“Your machine is kinda cool,”</i> you declare offhandedly, stepping towards her and casually sliding a hand around her waist. <i>“but it’s a pretty brutal way to get milked, don’t you think? I’m sure a nice girl like you knows more enjoyable ways.”</i>");
		//Time is 09:00-17:00
		if(hours >= 9 && hours < 17)
		{
			output("\n\n<i>“Maybe,”</i> Carrie murmurs, before inhaling deeply and politely sliding out of your grasp. <i>“But I gotta job, big " + pc.mf("guy","girl") + ". Not fair on any of the other " + pc.mf("bulls","amazons") + " on vacation if I go off over the fields with you now, is it?”</i> She squeezes your hand apologetically. <i>“Come back later - if y’all can still remember little ol’ me after you’ve been to the barn.”</i>");
		}
		//Time is 17:05-08:55
		else
		{
			output("\n\n<i>“Maybe,”</i> Carrie murmurs. She looks slightly torn, turning her head away from you at the same time as she pushes her warm, ample breast into your side. <i>“But I gotta job, big " + pc.mf("guy","girl") + ". Even though it’s really dead at... this time...”</i> You slide your hand down further, over the soft rise of her butt, slipping your fingers beneath her spandex costume and across the parting of her plump, over-juiced pussy, tracing it slowly. <i>“Ahh! Alright, okay,”</i> she half laughs, half gasps. <i>“We can do the off-peak special to get at that sperm of yours, if you like. Since you’re obviously very pent up.”</i>");
			output("\n\nShe pulls away, retrieves a large glass jar from underneath the milking machine and then walks past it into the barn’s back lot, with her come-hither eyes, swishing tail and bouncing, heart-shaped ass beckoning you to follow. [pc.OneCock] eagerly leads the way.");
			processTime(4);
			clearMenu();
			addButton(0,"Next",carrieBlowjobsGo);
			return;
		}
	}
	//Repeat
	else
	{
		output("You simply stand and grin at Carrie, allowing the bonny, pink, red-headed vision in a leotard to get you aroused.");
		if(pc.isTreatedBull()) output(" This is one of the most wonderful things about the Treatment, you’ve found; you don’t have to say much to communicate with other Treated. And sometimes, you don’t have to say anything at all.");
		else output(" You don’t really need words to communicate to the Treated girl; the cloud of pheromones you naturally produce in her presence does all the talking required.");
		//Time is 09:00-17:00
		if(hours >= 9 && hours < 17)
		{
			output("\n\nCarrie grins back embarrassedly, squirming slightly. Her nipples are erect as cherries, rubbing against her tight top.");
			output("\n\n<i>“Nooooo,”</i> she whines. <i>“C’mon " + pc.mf("guy","girl") + ", don’t do that. You know I’m on shift!”</i> You move casually forwards so that she’s deep in your pheromone perfume, and you can feel her warm, bubblegum-flavored breath. You spread your hand over the orb of one of her fine butt-cheeks and smooth downwards to her cleft, tracing her plump pussy through her leotard, feeling for yourself how sodden it is.");
			output("\n\n<i>“Later, then,”</i> you tease, pulling away and stepping back.");
			output("\n\n<i>You’re terrible</i>, her eyes say.");
			output("\n\n<i>I know</i>, yours reply.");
			//+ Arousal
			pc.lust(15+rand(3));
		}
		//Time is 17:05-08:55
		else
		{
			output("\n\nCarrie grins back happily, inhaling deliberately, her lips slowly part, pupils dilating, her smile growing softer. She turns and dips down below the milking machine - displaying her almost bare, curvy rump to you - and fetches ");
			if(pc.cockTotal() == 1) output("the glass jar");
			else output("a multitude of glass jars");
			output(".");
			if(flags["CORA_SUCKED"] == undefined || rand(2) == 0) output("\n\n<i>“Off peak special time,”</i> she breathes.");
			else output("\n\n<i>“Snack time,”</i> she breathes.");
			processTime(4);
			clearMenu();
			addButton(0,"Next",carrieBlowjobsGo);
			return;
		}
	}
	processTime(3);
	clearMenu();
	addButton(0,"Next",useDaMilkar);
}

//Scenes
public function carrieBlowjobsGo():void
{
	clearOutput();
	author("Nonesuch");
	var x:int = pc.biggestCockIndex();
	var y:int = pc.biggestCockIndex2();
	var cumQ:Number = pc.cumQ();
	var doubleDickEnough:Boolean = false;
	if(pc.cockTotal() > 1 && y >= 0 && pc.cocks[y].cLength() >= 12) doubleDickEnough = true;
	
	//First
	if(flags["CARRIE_BLOWJOBBED"] == undefined)
	{
		showCarrie(true);
		
		output("A minute later you’re in the grassy back lot of the milking barn, back against an oak tree, getting [pc.oneCock] enthusiastically sucked. The ");
		if(hours >= 6 && hours < 20) output("sun");
		else output("moon");
		output(" shines on your [pc.face] and the sweet, verdant air fills your nostrils as Carrie’s auburn head bobs gently. A warm hand gripped around the base, wet lips traveling further and further down your length, your [pc.cockHeadBiggest] lavished and squeezed by her mouth until it’s radiating pure, straining pleasure, beading pre that is continuously whisked away by a hungry, dexterous tongue.");
		if(pc.isTreatedBull()) output(" You hazily wonder why you’re spending so much time and energy searching the stars when everything you could ever want is right here: a rampant bull’s true home.");
		if(pc.biggestCockLength() < 12) output("\n\n<i>“Hmm,”</i> says Carrie, surfacing momentarily to look up at you with a teasing smile, sliding her thumb up your bulging underside. <i>“It’s nice to see one that’s not so big, y’know? It looks really cute on you. Kinda want to take it home, look after it...”</i> You politely but firmly grip the back of her head and sink her back onto your boy-cock before she can unleash any more faint praise.");
		else if(doubleDickEnough)
		{
			output("\n\n<i>“Damn, " + pc.mf("guy","girl") + ",”</i> lilts Carrie, surfacing momentarily to turn her attention to your [pc.cock " + y + "]. She grins up at you teasingly as she encloses it in her grip and gently tugs it. <i>“You pack pretty heavily, don’cha? Can see why you were lookin’ for special treatment.”</i> Her brow crinkles slightly as she thoughtfully coils your bulging flesh. Everything in the universe being so wonderful, it’s impossible for you to fathom what is troubling her. <i>“Can’t really give it to ya though, can I?”</i> she sighs. <i>“Lotta good cum’s gonna go to waste today. Tell you what - we do this again, I’ll bring help. Sound good?”</i>");
			output("\n\n<i>“Oh hell fricking yes,”</i> you grunt. The pretty cow’s frown disappears and the next moment hot, sweet lips are spreading themselves over your [pc.cockHead " + x + "] again.");
		}
		else 
		{
			output("\n\nCarrie whuffs slightly in frustration and withdraws. Dreamily you look down to find her appraising your massive, bulging cock, around the girth of which her hand barely reaches.");
			output("\n\n<i>“This isn’t good enough, is it big " + pc.mf("guy","girl") + "?”</i> she sighs, running her smooth grip down and up its vast, veined length. Not even half of it is slick with the pretty girl’s saliva.");
			output("\n\n<i>“No, it’s fine,”</i> you grunt, intense lust pulsing behind your brow. <i>“Please go on...”</i>");
			output("\n\n<i>“It’s not fine,”</i> she replies with conviction. <i>“Big " + pc.mf("fella","chick") + " like you can give us so much cum - but you need special treatment if I’m gonna get it all. Tell you what - if we do this again, I’ll bring help.”</i> The thought of this coupled with your overriding need are too much. Wordlessly you grip the back of her head and push her sweet, hot mouth back onto your [pc.cockBiggest] again, opening her lips as far as they will go.");
		}
		output("\n\nCarrie’s cheeks hollow as she sucks your ragingly hard dick with increasing purpose, slurps, muffled hums of enjoyment and the soft clonk of a cowbell drifting out over the " + (hours >= 6 && hours < 20 ? "sun-plastered" : "night-shaded") + " field. You are more than happy to let her set the pace, leaning back against the tree and doing nothing but slowly flexing your [pc.hips] into her wet, silken squeeze and groaning your approval, coaxing her on.");
		if(pc.hasKnot(x) && pc.biggestCockLength() < 12) output(" Her lips press against the swollen knot at the base of your cock as she envelopes you whole, and pleasure blossoms as she slips out her tongue and caresses that hot ring of flesh.");
		if(pc.balls > 0) output(" She gently caresses your [pc.balls] as she blows you, tightening up inexorably between her loving, circling touch, preparing the load she so richly deserves.");

		if(cumQ < 500) 
		{
			output("\n\nYour [pc.cock " + x + "] swells and you exhale hoarsely as you orgasm, hot [pc.cumNoun] surging into the cow girl’s suck in heavy, juicy bursts. She swallows wetly, eyes closed as she aids your cascading high on with drags of her lips and close slides of her tongue. A single droplet of your seed works its way down her chin when you’ve pulsed your last and she pulls away, parting from your cock with a smooch; the rest of it has disappeared entirely down her gullet.");
			output("\n\n<i>“Mmm,”</i> she says happily, licking her lips. <i>“All for me. Deserve a reward for all the hard work I do with the milking machine, don’cha think?”</i>");
			if(pc.isTreatedBull()) output(" You grin down at her absurdly, feeling nothing but shining fondness and warmth for the auburn cock-polisher.");
			else output(" You grin down at the auburn cock-polisher, contentment throbbing through you.");
		}
		else if(cumQ < 1500) 
		{
			output("\n\nYour [pc.cock " + x + "] swells and you exhale hoarsely as you orgasm, hot [pc.cumNoun] surging into the cow girl’s suck in heavy, juicy bursts. She swallows wetly, eyes closed as she aids your cascading high on with drags of her lips and close slides of her tongue. You go on and on, riding your intense pulses, intent on pumping every last drop of your thick, generous seed into her; the next moment she pulls out, and carefully directs your throbbing dick at the large glass jar between her knees. You shudder and huff, blowing the last half of your load into it, coaxed on by her wringing, rubbing hand. You exhale with pure contentment when she tugs out the last of it, oozing into the almost-full container.");
			output("\n\n<i>“Mmm,”</i> she says happily, licking her lips as she slaps a lid down on your “donation”. <i>“A lil’ something for the bank... and a lil’ something for me. Deserve a reward for all the hard work I do with the milking machine, don’cha think?”</i>");
			if(pc.isTreatedBull()) output(" You grin down at her absurdly, feeling nothing but shining fondness and warmth for the auburn cock-polisher.");
			else output(" You grin down at the auburn cock-polisher, contentment throbbing through you.");
		}
		else
		{
			output("\n\nYour [pc.cock " + x + "] swells and you exhale hoarsely as you orgasm, hot [pc.cum] surging into the cow girl’s suck in heavy, juicy bursts. She swallows wetly, eyes closed as she aids your cascading high on with drags of her lips and close slides of her tongue... you are forced into overdrive, heart pounding as you hose a massive amount of thick, gooey seed down her throat. Even an eager, well-trained moo-hole cannot cope with it; Carrie parts from your throbbing sex with a gasp, cum spurting out of her mouth and nose, and she gets the next blast right in the face.");
			output("\n\nFeverishly, she grabs your [pc.cock " + x + "] and directs it at the large glass jar between her knees. You shudder and huff, and with three wonderful clenches you’ve filled it up to the top, coaxed on by her wringing, rubbing hand. The next pump simply splashes it everywhere, which feels to you like a waste; you take it in your own hand and direct it at Carrie. She laughs, half in disgusted exasperation and half in squealing delight, as with flexing grunts you paint her from top to bottom in musky slut-feed, paying particular attention to her plush boobs. She, and much of the nearby surroundings, look like they’ve been hit by " + indefiniteArticle(pc.cumDescript()) + " bomb by the time you finally finish.");
			output("\n\nYou stand over her, breathing heavily, semi-tumescent cock dangling, gently oozing the kind of cum an unmodded human would ejaculate in a single orgasm. A plump, eager set of lips wicks your throbbing head and slit quite clean.");
			output("\n\n<i>“Wow. Okay,”</i> she says at last, scooching back and wiping [pc.cum] out of her eyes. <i>“Gonna have to schedule some shower time afterwards if I do this with you again, ain’t I?”</i>");
			if(pc.isTreatedBull()) output(" You grin down at her absurdly. Heavy need satiated, you feel nothing but shining fondness and warmth for the auburn cock-polisher.");
			else output(" Heavy need satiated, you grin down at the auburn cock-polisher, contentment throbbing through you.");
		}
		output("\n\n<i>“Sure you don’t want anything?”</i> the euphoria");
		if(pc.isTreatedBull()) output(" of cooperation");
		output(" compels you to ask. <i>“Return the favor?”</i>");
		output("\n\n<i>“Oh, no!”</i> giggles Carrie, sounding honestly surprised by your question. <i>“Sucking dick is its own reward, silly. Well, maybe not for you,”</i> she goes on, brow crinkling " + (hours >= 6 && hours < 20 ? "as a gray cloud vaguely intrudes on an eternally sunlit mind" : "as crickets chirp in the night") + ". <i>“But for cows it’s... the taste, and... when it touches the back of your throat, and... how happy and sweet and relaxed it makes you bulls...”</i> her eyes have gone a bit vague.");
		output("\n\n<i>“Swing back around anytime ");
		if(pc.tallness >= 72) output("big ");
		else if(pc.tallness < 60) output("lil’ ");
		output(pc.mf("guy","girl") + ", least when I’m not on shift,”</i> she says at last with a grin, picking herself ");
		if(cumQ >= 500) output("and her full, gloopy jar ");
		output("up.");
		//Not big cock, small output: 
		if(pc.cocks[x].cLength() < 12 && cumQ < 500) output(" <i>“I don’t mind that y’all don’t cum like Moby Dick. A working gal always needs a snack, y’know?”</i>");
		//Big cock/1 < cock first time:
		else if((pc.cocks[x].cLength() >= 12 || doubleDickEnough) && flags["CORA_QUEUED"] == undefined) 
		{
			output("<i>“I’ll be ready for a real bull like you next time, I promise!”</i>");
			flags["CORA_QUEUED"] = 1
		}
		else output("<i>“I’ll make it even better for you next time. You deserve it, for giving me such a big load!”</i>");
		output("\n\nFeeling a warm glow which stretches from your mind right down to your groin, you ");
		if(!pc.isCrotchExposed()) output("tuck yourself back into your garments and ");
		output("walk slowly back to the milking machine with Carrie, leaving her with a fond squeeze of her soft ass.");
	}
	//Cora scenes? Big dick or multidick? I guess whatever results in requesting her help
	else if(flags["CORA_QUEUED"] == 1 && (pc.cocks[x].cLength() >= 12 || doubleDickEnough))
	{
		showName("CARRIE\n& CORA");
		showBust("CARRIE_NUDE", "CORA_NUDE");
		
		//First Cora intro
		if(flags["CORA_SUCKED"] == undefined)
		{
			output("<i>“This is my sis, Cora,”</i> says Carrie as you step into the yard behind the milking barn. Another cow girl dressed in denim gets up from tapping nails into a fence, smiles and wiggles the fingers of one hand at you. She’s got a more oval face than Carrie but is otherwise sweetly similar - red hair; curves that would be mesmerizingly ample anywhere but New Texas; button nose; glossy, cock-sucking lips.");
			output("\n\n<i>“She usually works in the milk-bottling place,”</i> Carrie goes on, pressing her soft weight into your side, <i>“but I had her come over cuz I thought maybe you’d drop by.”</i>");
			output("\n\n<i>“My sis has got the much cooler job,”</i> Cora says, her toothy smile widening as she eyes you up. <i>“Refrigerators’re heavy </i>and<i> dull.”</i>");
			output("\n\n<i>“T’ain’t usually interesting,”</i> replies Carrie gently. <i>“But...”</i> you finish the sentence by ");
			if(!pc.isCrotchExposed()) output("undoing your [pc.lowerGarments] and ");
			output("flourishing [pc.eachCock] with an easy grin.");

			output("\n\n<i>“Oh wow,”</i> coos Cora. <i>“You weren’t kiddin’ about needin’ help, were you? ");
			if(flags["BRYNN_INTRODUCED"] != undefined) output("Why, he looks even bigger than Brynn! ");
			if(pc.cockTotal() > 1) 
			{
				output("I don’t know any bulls round here that pack ");
				if(pc.cockTotal() == 2) output("double");
				else output("</i>that<i> many");
				output(". ");
			}
			output("You must get sooo pent up - how do you manage?”</i>");

			output("\n\n<i>“It’s difficult sometimes,”</i> you reply nobly. ");
			if(pc.cockTotal() == 1) output("It is");
			else output("They are");
			output(" getting harder and harder just looking at these two, their milky curves and flushed, eager faces. You can’t imagine how intense the pheromone reek must be, but their nipples are standing out underneath their garments and the scent of burst cherry is in the air. <i>“Most often it all goes to waste. But I dunno. Maybe you two could help with that?”</i>");
		}
		//Repeat intro
		//Cora repeats
		else
		{
			output("<i>“Hey, big " + pc.mf("guy","girl") + ".”</i> Cora gets up from her handiwork and gives you a bright smile as you step into the back yard with Carrie.");
			output("\n\n<i>“Fridges don’t seem to need much maintenance these days,”</i> you observe. Carrie’s hand is ");
			if(!pc.isCrotchExposed()) output("tracing the outline of your [pc.cock " + x + "] through your [pc.lowerUndergarment].");
			else output("gently stroking your bare, swinging [pc.cock " + x + "].");

			output("\n\n<i>“Not at this time of ");
			if(hours > 6 && hours < 20) output("day ");
			else output("night ");
			output(", no,”</i> Cora replies with a light bite of the lip, eyes traveling downward. You consider teasing them a little more, making them admit how much they look forward to this, but - drinking in their milky curves and flushed, eager faces, [pc.eachCock] hardening inexorably - you reflect that life is too damn short.");
		}
		//Into the meat of the scene
		//Big cock
		if(!doubleDickEnough)
		{
			output("\n\nA minute later you ");
			if(pc.isTaur()) output("rest ");
			else output("sit ");
			output("on the ground with your back to the tree, breathing in the sweet, warm air whilst two warm, wet, worshipful mouths travel up and down your [pc.cock " + x + "], licking every inch and tracing each bulging vein, soft boob flesh resting on your [pc.thighs], two sets of hands shifting and tightening around your trunk-like base. Cora and Carrie’s auburn heads move up and down, their plush, naked butts in the air, tails idly swinging. You had them take their clothes off aside from their cowbells beforehand");
			if(cumQ >= 1500) output(" - things are going to get very messy, after all - ");
			output(" and the view from here is just wonderful.");
			if(pc.tallness >= 81) output(" Your height is such that you can reach over and around their backsides as they work, dipping your fingers into the wetness of their exposed pussies, caressing their silky walls and nubby clits; this has the effect of transforming the hums and sighs of pleasure below you into succulent moos and moans of total abandonment.");

			output("\n\nThey take it in turns to suck your head, stretching their jaws heroically to get their lips around it whilst the other ");
			if(pc.balls <= 1) 
			{
				output("licks and lavishes your ");
				if(pc.hasKnot(x)) output("[pc.knot " + x + "]");
				else output("base with attention");
			}
			else output("licks and suckles your [pc.balls], making them thrum and swell with heat");
			output(". Carrie stays on the longer, forcing more and more of your mega-cock into her maw and into the incredible tightness of her throat, gazing up at you proudly as she does it. You groan lowly and award her with a long drizzle of pre, delivered straight to her gut.");
			output("\n\n<i>“Hey,”</i> murmurs Cora, pulling away ");
			if(pc.balls > 1) output("from polishing your balls ");
			output("and looking up hazily, <i>“don’t hog all of that. Swap.”</i>");

			output("\n\n<i>“No. Mine,”</i> hums Carrie wickedly, licking your wet slit closely. You nip this in the bud by tenderly gripping each bitch behind her silky hair and holding them together over your crown; you make them kiss and make up around your [pc.cockHead " + x + "], greedy lips and tongues mashing into your sensitive, dripping tap of concentrated cow-nip.");
			output("\n\nHands grasp your length and pump you steadily as they smooch and lap at the end, and you groan, stretching up the rough bark at your back as unstoppable orgasm tightens you up, your [pc.cock " + x + "] thickening until it feels like a rocket of pure lust.");
			if(cumQ < 500)
			{
				output("\n\nThe first succulent release of [pc.cum] feels huge, the release overwhelming - but almost all of it disappears into two horny, hungry mouths, fighting each other to latch on to the top and claim it all. They know the value of fraternal cooperation though, and the next two juicy blasts go down a cow girl’s throat each - Cora and then Carrie taking it in turns to fasten their hot mouth around your [pc.cockHead " + x + "] and intently dragging down a heavy spurt of cum each.");
				output("\n\nYou unsteadily get to your [pc.footOrFeet], and Carrie quickly grabs the glass jar between her knees. Clutching your massive cock, you growl and gasp as you unload again and again into the container until it is quite full. You sink back against the tree and wheeze when you are done, [pc.cock " + x + "] swinging between your [pc.hips], utterly satiated.");
				output("\n\n<i>“Mmm,”</i> says Cora, lounging on the ground, tracing her lips with her tongue. <i>“Shame there wasn’t more. Kinda flatters to deceive, that thing of yours, bull-" + pc.mf("boy","girl") + ".”</i>");
				output("\n\n<i>“You cheeky cow!”</i> laughs Carrie, tilting the stoppered jar in her hands, making it gloop. <i>“You can lick [pc.himHer] clean, since you’re that desperate.”</i>");
				output("\n\nYou grunt approval when Cora scooches over amicably and a plush, eager set of lips wicks your throbbing, oozing head and slit quite clean. You are left with an all-encompassing warm glow that stretches from your mind to your groin, kindness for everything in the universe beaming out of you, particularly for the two people at your [pc.feet]. What a wonderful, selfless pair of cock-polishers they are.");
			}
			else
			{
				output("\n\nThe first wonderful spout of [pc.cum] looks like it clears the height of the tree - and that is after it gets past two horny, hungry mouths. The next two juicy blasts swell a cow girl’s stomach each, first one sister then the other fastening their hot mouth around your [pc.cockHead " + x + "] and dragging down a hot stream of cum intently. After that you are able to unsteadily get to your [pc.footOrFeet]");
				output(", Carrie quickly grabbing one of the glass jars between her knees. Clutching your massive cock, you growl and gasp as you unload again and again into the containers which are whisked in front of you. It’s a remarkably efficient operation, all things considered; Cora passes Carrie an empty jar as soon as you’ve filled another one up to the brim and slapped down its lid.");
				output("\n\nYou’ve got more, plenty more coming by the time half a dozen jars have been filled with your virile seed, and there’s only one way to use it. The two cow-girls at your [pc.footOrFeet] flinch, gasp and giggle as you give them a heavy, well-deserved pasting each. Cora presents her plush tits, closes her eyes and opens her mouth and Carrie swiftly following suit, providing you with plenty of enjoyable targets. At long last, when their milky skin and red hair is absolutely dripping with [pc.cum], you sink back against the tree and wheeze, [pc.cocks] swinging, finally and utterly satiated.");
				output("\n\n<i>“Whew!”</i> says Carrie, wiping cum out of her eyes and stroking her slightly swollen belly. <i>“Well, we didn’t get it all. But, um, we did better.”</i> She clinks the full jars together happily. <i>“We should definitely try again sometime.”</i>");
				output("\n\n<i>“Beats repairing refrigerators,”</i> agrees Cora, sucking her finger. <i>“Very messy, but... productive.”</i>");
				output("\n\nYou grin down at them, a warm glow stretching from your mind to your groin blotting out everything else. What a wonderful, selfless pair of cock-polishers they are.");
			}
			output("\n\nEach arm laden with the soft");
			if(cumQ >= 1500) output(", gently dripping");
			output(" weight of a cow girl, you slowly head back to the barn, their warm chatter passing you by. They jerk and give a joint coo and squeal when you leave them - your taste in their mouths, your red handprint on their butts.");
		}
		//Double cock
		else
		{
			output("\n\nA minute later you’re in the grassy back lot of the milking barn, back against the oak tree, getting your [pc.cock " + x + "] and [pc.cock " + y + "] enthusiastically sucked. Cora and Carrie kneel side by side, tails lazily swishing above their plush, naked butts. You had them take their clothes off aside from their cowbells beforehand - things are going to get very messy, after all - and the view from here is just wonderful. Their warm, wet, worshipful mouths travel up and down your rods, licking every inch and tracing each bulging vein, both bell-ends lavished and squeezed until they are radiating pure, straining pleasure, two hands gently stroking and pulling at the straining bases. You find yourself trying to keep your breathing level, to scrape against the rough bark at your back, anything to not tip over the edge, anything to let this kind of oral ecstasy go on forever.");
			output("\n\nCora looks up leisurely and giggles at your expression.");
			output("\n\n<i>“Aww, is this a bit too much, big " + pc.mf("guy","girl") + "?”</i> she extends her tongue and teasingly drags it all the way up the underside of your [pc.cock " + y + "], holding your gaze all the while. You exhale as it makes a rivulet of pre dribble out of your [pc.cockHead " + y + "], which she laps up, eyes going dreamy.");
			output("\n\n<i>“Slow down sis, slow down,”</i> Carrie says softly. <i>“Can’t get a good load if you force [pc.himHer] like that...”</i>");
			output("\n\nThe two auburn cow-girls shift around your overgrown maleness, trying different things with vocal enjoyment, and you find if you gruff out instructions they follow them happily - both made incredibly pliant and sensitized by your presence and the taste of [pc.cum] on their tongues.");
			if(pc.balls > 1) output(" They take it in turns to lap and suckle your [pc.balls], making them thrum and bulge with heat, all the while the other licks and masturbates [pc.eachCock], keeping each teased and tightened to a fiery degree whilst your testicles are given the worshipful saliva gloss a flagrant alpha beast like you demands.");
			output(" You have Carrie splay herself on the grass before you, fingering her protuberant pussy and fondling her nipples whilst you grip her sister behind the head and firmly face fuck her, her hands tightening on your [pc.hips] as your [pc.cock " + x + "] spears into the wonderful tightness of her throat again and again.");
			if(pc.hasKnot(x) || pc.hasKnot(y)) 
			{
				output(" You make sure ");
				if(pc.hasKnot(x) && pc.hasKnot(y)) output("each knot");
				else output("your knot");
				output(" gets plenty of attention - so important that it remains lubed and ready to use, you explain, the two cow-girls agreeing with muffled moos and sighs, pretty, glossy cock-pillows mashing around ");
				if(pc.hasKnot(x) && pc.hasKnot(y)) output("those angry, swollen rings");
				else output("that angry, swollen ring");
				output(" of meat, searching for every last trace of musk.");
			}
			output(" The high smell of overripe cherry becomes more and more pronounced.");
			// Not high output:
			if(cumQ < 500) 
			{
				output("\n\nYou exhale hoarsely as your [pc.cock " + x + "] and [pc.cock " + y + "] swell up with a heavily stoked, unstoppable orgasm, each mired deep once again in a wet, rhythmic suck. They bulge up and release, blowing a simultaneous surge of [pc.cum] into two horny, hungry mouths that coax you on with drags of the lips and pushes of the tongue. Carrie swallows wetly and pulls off, bats at Cora to do the same, quickly grabbing at the glass jars left on the ground. You’re barely aware of it; the single throbbing impulse you have is to clutch [pc.eachCock] and orgasm again and again, working out every last drop of your thick, generous seed that has been built up by the luxurious blowjob. When you shudder and huff your last and open your eyes again, you find you’ve done a reasonably good job of filling the two jars Carrie and Cora are clutching in front of you.");
				output("\n\n<i>“Mmm,”</i> says Cora, lounging on the ground, tracing her lips with her tongue. <i>“Shame there wasn’t more. Kinda flatters to deceive, those things of yours, bull-" + pc.mf("boy","girl") + ".”</i>");
				output("\n\n<i>“You cheeky cow!”</i> laughs Carrie, tilting the stoppered jar in her hands, making it gloop. <i>“You can lick [pc.him] clean, since you’re so desperate.”</i>");
				output("\n\nYou grunt approval when Cora scooches over amicably and a plush, eager set of lips wicks your throbbing, oozing head and slit quite clean. You are left with an all-encompassing warm glow that stretches from your mind to your groin, kindness for everything in the universe beaming out of you, particularly for the two women at your [pc.footOrFeet]. What a wonderful, selfless pair of cock-polishers they are.");
			}
			else
			{
				output("\n\nYou exhale hoarsely as your [pc.cock " + x + "] and [pc.cock " + y + "] swell up with a heavily stoked, unstoppable orgasm, each mired deep once again in a wet, rhythmic suck. They bulge up and release, blowing a simultaneous surge of [pc.cum] into two horny, hungry mouths that coax you on with drags of the lips and slides of the tongue. You are forced into overdrive, heart pounding as you hose a massive amount of thick, gooey seed down each throat. Cora copes poorly, cum spurting out of her nose as she coughs. She gets the next blast from your [pc.cock " + y + "] in the face as a result. Carrie is better prepared; eyes closed, pussy dripping, she swallows her stomach-swelling share of musky slut-feed down like a hero.");
				output("\n\nThe next moment she pulls off and quickly grabs one of the glass jars between her knees. Cora follows suit. Clutching your cocks, you growl and gasp as you unload again and again into the containers which are whisked in front of you. It’s a remarkably efficient operation, all things considered; they both slap down lids and grab the next empty as soon as one is full.");
				output("\n\nYou’ve got more, plenty more coming by the time half a dozen jars have been filled with your virile seed, and there’s only one way to use it. The two cow-girls at your [pc.footOrFeet] flinch, gasp and giggle as you give them a heavy, well-deserved pasting each. Cora presents her plush tits, closes her eyes and opens her mouth and Carrie swiftly following suit, providing you with plenty of enjoyable targets. You generously make sure Cora gets more having missed out to begin with, and her midriff has taken on a noticeable swell by the end as well. When their milky skin and red hair is absolutely dripping with [pc.cum], you sink back against the tree and wheeze, [pc.cocks] swinging, finally and utterly satiated.");
				output("\n\n<i>“Whew!”</i> says Carrie, wiping cum out of her eyes and stroking her slightly swollen belly. <i>“Well, we didn’t get it all. But, um, we did better.”</i> She clinks the full jars together happily. <i>“We should definitely try again sometime.”</i>");
				output("\n\n<i>“Beats repairing refrigerators,”</i> agrees Cora, sucking her finger. <i>“Very messy, but... productive.”</i>");
				output("\n\nYou grin down at them, a warm glow stretching from your mind to your groin blotting out everything else. What a wonderful, selfless pair of cock-polishers they are.");
			}
			//merge
			output("\n\nEach arm laden with the soft");
			if(cumQ < 1500) output(", gently dripping");
			output(" weight of a cow girl, you slowly head back to the barn, their warm chatter passing you by. They jerk and give a joint coo and squeal when you leave them - your taste in their mouths, your red handprint on their butts.");
		}
		IncrementFlag("CORA_SUCKED");
	}
	//Regular
	else
	{
		showCarrie(true);
		
		output("A minute later you’re in the grassy back lot of the milking barn, back against the oak tree, getting your [pc.cock " + x + "] enthusiastically sucked. The ");
		if(hours >= 6 && hours < 20) output("sun");
		else output("moon");
		output(" shines on your [pc.face] and the sweet, verdant air fills your nostrils as Carrie’s auburn head bobs gently. Warm hand gripped around the base, wet lips traveling further and further down your length, your [pc.cockHead] lavished and squeezed by her mouth until it’s radiating pure, straining pleasure, beading pre that is continuously whisked away by a hungry, dexterous tongue. You hazily wonder why you’re spending so much time and energy searching the stars when everything you could ever want is right here: a rampant bull’s true home.");
		if(pc.balls > 0) 
		{
			output("\n\nShe sinks down lower between your [pc.hips], hand lazily coiling your cock as she licks your [pc.balls], lavishing ");
			if(pc.balls == 1) output("it");
			else output("them");
			output(" backwards and forwards with the lathe of her tongue before taking ");
			if(pc.balls == 1) output("it");
			else output("each");
			output(" sensitive orb into her mouth and compressing gently, making sparks shimmer up your spine and stars swim in your eyes.");
			output("\n\n<i>“Wow,”</i> you manage to croak when she emerges.");
		}
		output("\n\n<i>“Not going to get it all if they ain’t given the attention they deserve, am I?”</i> she says, looking up at you with a coquettish smile, ball sweat shining on her plush lips.");
		if(doubleDickEnough)
		{
			output("\n\n<i>“Damn, " + pc.mf("guy","girl") + ",”</i> lilts Carrie, surfacing momentarily to turn her attention to your [pc.cock " + y + "]. She grins up at you teasingly as she encloses it in her grip and gently tugs it. <i>“You pack pretty heavily, don’cha? Can see why you were lookin’ for special treatment.”</i> Her brow crinkles slightly as she thoughtfully coils your bulging flesh. Everything in the universe being so wonderful, it’s impossible for you to fathom what is troubling her. <i>“Can’t really give it to ya though, can I?”</i> she sighs. <i>“Lotta good cum’s gonna go to waste today. Tell you what - we do this again, I’ll bring help. Sound good?”</i>");
			output("\n\n<i>“Oh hell fricking yes,”</i> you grunt. The pretty cow’s frown disappears and the next moment hot, sweet lips are spreading themselves over your [pc.cockHead " + x + "] again.");
		}
		//Small cock first time: 
		else if(pc.cocks[x].cLength() < 12 && flags["CARRIE_SMALLCOCK_SUX"] == undefined)
		{
			flags["CARRIE_SMALLCOCK_SUX"] = 1;
			output("\n\n<i>“Hmm,”</i> says Carrie, surfacing momentarily to look up at you with a teasing smile, sliding her thumb up your bulging underside. <i>“It’s nice to see one that’s not so big, y’know? It looks really cute on you. Kinda want to take it home, look after it...”</i> You politely but firmly grip the back of her head and sink her back onto your boy-cock before she can unleash any more faint praise.");
		}
		//Small cock repeat:
		else if(pc.cocks[x].cLength() < 12)
		{
			output("\n\n<i>“Mmm,”</i> she coos, gazing fondly at your urgently erect prick, encircling it with her thumb and index finger. <i>“My cute little soldier.”</i> She gazes up at you teasingly as she easily engulfs it whole, making you gasp and arch your back as she drags on the sensitive flesh incredibly closely.");
		}
		//BIGUS DICKUS
		else 
		{
			output("\n\nCarrie whuffs slightly in frustration and withdraws. Dreamily you look down to find her appraising your massive, bulging cock, the girth of which her hand barely reaches.");
			output("\n\n<i>“This isn’t good enough, is it big " + pc.mf("guy","girl") + "?”</i> she sighs, running her smooth grip down and up its vast, veined length. Not even half of it is slick with the pretty girl’s saliva.");
			output("\n\n<i>“No, it’s fine,”</i> you grunt, intense lust pulsing behind your brow. <i>“Please go on...”</i>");
			output("\n\n<i>“It’s not fine,”</i> she replies with conviction. <i>“Big fella like you can give us so much cum - but you need special treatment if I’m gonna get it all. Tell you what - if we do this again, I’ll bring help.”</i> The thought of this coupled with your overriding need are too much. Wordlessly you grip the back of her head and push her sweet, hot mouth back onto your [pc.cock " + x + "] again, opening her lips as far as they will go.");
		}
		//merge
		output("\n\nCarrie’s cheeks hollow as she sucks your ragingly hard dick with increasing purpose, slurps, muffled hums of enjoyment and the soft clonk of a cowbell drifting out over the " + (hours >= 6 && hours < 20 ? "sun-plastered" : "night-shaded") + " field. You are more than happy to let her set the pace, leaning back against the tree and doing nothing but slowly flexing your [pc.hips] into her wet, silken squeeze and groaning your approval, coaxing her on.");
		//Knot, not massive cock
		if(pc.hasKnot(x) && pc.cocks[x].cLength() < 12) output(" Her lips press against the swollen knot at the base of your cock as she envelopes you whole, and pleasure blossoms as she slips out her tongue and caresses that hot ring of flesh.");
		if(pc.balls > 0) output(" She gently caresses your spit-shone [pc.balls] as she blows you, tightening up inexorably between her loving, circling touch, preparing the load she so richly deserves.");
		if(cumQ < 500) 
		{
			output("\n\nYour [pc.cock " + x + "] swells and you exhale hoarsely as you orgasm, hot [pc.cumNoun] surging into the cow girl’s suck in heavy, juicy bursts. She swallows wetly, eyes closed as she aids your cascading high on with drags of her lips and close slides of her tongue. A single droplet of your seed works its way down her chin when you’re pulsed your last and she pulls away, parting from your cock with a smooch; the rest of it has disappeared entirely down her gullet.");
			output("\n\n<i>“Mmm,”</i> she says happily, licking her lips. <i>“All for me. Deserve a reward for all the hard work I do with the milking machine, don’cha think?”</i>");
			if(pc.isTreatedBull()) output(" You grin down at her absurdly, feeling nothing but shining fondness and warmth for your auburn cock-polisher.");
			else output(" You grin down at the auburn cock-polisher, contentment throbbing through you.");
		}
		else if(cumQ < 1500)
		{
			output("\n\nYour [pc.cock " + x + "] swells and you exhale hoarsely as you orgasm, hot [pc.cumNoun] surging into the cow girl’s suck in heavy, juicy bursts. She swallows wetly, eyes closed as she aids your cascading high on with drags of her lips and close slides of her tongue. You go on and on, riding your intense pulses, intent on pumping every last drop of your thick, generous seed into her; the next moment she pulls out, and carefully directs your throbbing dick at the large glass jar between her knees. You shudder and huff, blowing the last half of your load into it, coaxed on by her wringing, rubbing hand. You exhale with pure contentment when she tugs out the last of it, oozing into the almost-full container.");
			output("\n\n<i>“Mmm,”</i> she says happily, licking her lips as she slaps a lid down on your “donation”. <i>“A lil’ something for the bank... and a lil’ something for me. Deserve a reward for all the hard work I do with the milking machine, don’cha think?”</i>");
			if(pc.isTreatedBull()) output(" You grin down at her absurdly, feeling nothing but shining fondness and warmth for the auburn cock-polisher.");
			else output(" You grin down at the auburn cock-polisher, contentment throbbing through you.");
		}
		else
		{
			output("\n\nYour [pc.cock " + x + "] swells and you exhale hoarsely as you orgasm, hot [pc.cumNoun] surging into the cow girl’s suck in heavy, juicy bursts. She swallows wetly, eyes closed as she aids your cascading high on with drags of her lips and close slides of her tongue... you are forced into overdrive, heart pounding as you hose a massive amount of thick, gooey seed down her throat. Even an eager, well-trained moo-hole cannot cope with it; Carrie parts from your throbbing sex with a gasp, cum spurting out of her mouth and nose, and she gets the next blast right in the face. Feverishly she grabs your [pc.cock " + x + "] and directs it at the large glass jar between her knees. You shudder and huff, and with three wonderful clenches you’ve filled it up to the top, coaxed on by her wringing, rubbing hand. The next pump simply splashes it everywhere, which feels to you like a waste; you take it in your own hand and direct it at Carrie.");
			output("\n\nShe laughs, half in disgusted exasperation and half in squealing delight, as with flexing grunts you paint her from top to bottom in musky slut-feed, paying particular attention to her plush boobs. She, and much of the nearby surroundings, look like they’ve been hit by " + indefiniteArticle(pc.cumDescript()) + " bomb by the time you finally finish. You stand over her, breathing heavily, semi-tumescent cock dangling, gently oozing the kind of cum an unmodded human would ejaculate in a single orgasm. A plump, eager set of lips wicks your throbbing head and slit quite clean.");
			output("\n\n<i>“Wow. Okay,”</i> she says at last, scooching back and wiping [pc.cum] out of her eyes. <i>“Gonna have to schedule some shower time afterwards if I do this with you again, ain’t I?”</i>");
			if(pc.isTreatedBull()) output(" You grin down at her absurdly. Heavy need satiated, you feel nothing but shining fondness and warmth for the auburn cock-polisher.");
			else output(" Heavy need satiated, you grin down at the auburn cock-polisher, contentment throbbing through you.");
		}
		//merge
		output("\n\n<i>“Swing back around anytime ");
		if(pc.tallness >= 72) output("big ");
		else if(pc.tallness < 60) output("lil’ ");
		output("guy, least when I’m not on shift,”</i> she says at last with a grin, picking herself ");
		if(cumQ >= 500) output("and her full, gloopy jar ");
		output("up.");
		//Not big cock, small output:
		if(pc.cocks[x].cLength() < 12 && cumQ < 500) output(" <i>“I don’t mind if y’all don’t cum like Moby Dick. A working gal always needs a snack, y’know?”</i>");
		//Big cock/1 < cock first time:
		else if((pc.cocks[x].cLength() >= 12 || doubleDickEnough) && flags["CORA_QUEUED"] == undefined) 
		{
			output(" <i>“I’ll be ready for a real bull like you next time, I promise!”</i>");
			flags["CORA_QUEUED"] = 1;
		}
		else output(" <i>“Cute " + pc.mf("bulls","amazons") + " with heavy loads like you are always welcome in the quiet hours!”</i>");
		output("\n\nFeeling a warm glow which stretches from your mind right down to your groin, you ");
		if(!pc.isCrotchExposed()) output("tuck yourself back into your garments and ");
		output("walk slowly back to the milking machine with Carrie, leaving her with a fond squeeze of her plump ass.");
	}
	if(cumQ >= 500) StatTracking.track("milkers/cum jarred", Math.min(1500, (cumQ - 250)));
	IncrementFlag("CARRIE_BLOWJOBBED");
	processTime(34);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

// A Soothing Shower
//PC has dick and is male Treated
//Has done a scene with Cora in it
//Scene has 20% chance of proccing when PC approaches milker. 0% chance if scene procced in last 24 hours, 50% chance if scene hasn’t procced in 72 hours.

public function carrieSpecialChance():Boolean
{
	return (!pc.hasStatusEffect("NT Male Milker Disabled") && pc.hasPheromones() && pc.hasCock() && flags["CARRIE_BLOWJOBBED"] != undefined && flags["CORA_SUCKED"] != undefined);
}
public function carrieSoothingShowerChance():Boolean
{
	if(pc.getStatusMinutes("Cora Showered") >= ((72 - 24) * 60)) return false;
	if(flags["NT_BUILD_BOTTLE_PLANT"] != undefined) return true;
	if(pc.hasStatusEffect("Cora Showered") && rand(5) == 0) return true;
	if(rand(2) == 0) return true;
	return false;
}
public function carrieSoothingShowerGo(response:String = "intro"):void
{
	clearOutput();
	author("Nonesuch");
	
	var x:int = 0;
	var y:int = 1;
	var i:int = 0;
	
	switch(response)
	{
		case "intro":
			showName("CARRIE\n& CORA");
			showBust("CARRIE", "CORA");
			
			output("The busy, frenetic sound of female conversation meets your ears as you approach the milker. Leant back on the looming apparatus, Carrie is chatting with her sister Cora. Her eyes and smile widen as you mosey up; the chatter dries up and the expression is mirrored when Cora turns around.");
			output("\n\n<i>“Sup, girls?”</i> you grin.");
			output("\n\n<i>“Nothing,”</i> they reply almost simultaneously, and then titter self-consciously. You let a long second go by.");
			output("\n\n<i>“Looking for another sample?”</i> you ask");
			if(!pc.hasArmor() && !pc.isCrotchExposed()) output(", hooking your thumbs into your [pc.lowerUndergarment] as you do so");
			output(".");
			output("\n\nThe two cow-girls look at each other and burst into laughter again.");
			output("\n\n<i>“I think you’ve given us enough for now, big [pc.guy],”</i> Carrie sighs. <i>“" + (pc.isTreatedBull() ? "Bull s" : "S") + "perm, it’s... not exactly in short supply around here, y’know? I had to dr- throw away some of th’ last batch.”</i>");
			output("\n\n<i>“Dunno about you though, sis,”</i> murmurs Cora, not taking her eyes off you. <i>“Long");
			if(hours > 23 || hours < 13) output(" morning");
			else output(" afternoon");
			output(" shift, it’s gotten me... mighty sticky. Think I need a shower.”</i> She stretches languorously - the stuffed, upper part of her dungarees creaks in protest - and pauses. <i>“What do you think, big [pc.guy]?”</i>");
			
			processTime(3);
			// [A Shower] [Nah]
			clearMenu();
			if(flags["CARRIE_SHOWER_THREESOME"] == undefined) addButton(0, "A Shower", carrieSoothingShowerGo, "shower intro", "Accept Shower", "This could be fun...");
			else addButton(0, "A Shower", carrieSoothingShowerGo, "shower repeat", "Accept Shower", "Take a shower with the sisters...");
			addButton(1, "Nah", carrieSoothingShowerGo, "nah", "Refuse Shower", "Maybe next time.");
			break;
		// Nah
		case "nah":
			showName("CARRIE\n& CORA");
			showBust("CARRIE", "CORA");
			
			output("<i>“I’ll catch up with you later,”</i> you say. This is met with a shared, disappointed groan which dissolves, once again, into giggling.");
			output("\n\n<i>“Get outta here then, ya big dumb tease,”</i> sighs Carrie, turning back to her sister.");
			
			processTime(1);
			//Milker option ghosted for half an hour
			pc.createStatusEffect("NT Male Milker Disabled", 0, 0, 0, 0, true, "", "", false, 30);
			clearMenu();
			addButton(0, "Next", mainGameMenu);
			break;
		// A Shower
		// First / Threesome
		case "shower intro":
			rooms["516"].removeFlag(GLOBAL.NPC);
			moveTo("NT SHOWER HOUSE");
			
			showLocationName();
			showBust("CARRIE_NUDE", "CORA_NUDE");
			
			if(flags["CARRIE_SHOWER_THREESOME"] == undefined)
			{
				if(pc.isTreatedBull()) output("You don’t have to say anything; all you have to do is go across, curl each arm around a warm, giggly cow-girl, breathe in their sweet, milky scent and give their plump butts a good, healthy squeeze. The Treatment makes everything so straightforward.");
				else output("You’re getting the hang of how the Treated roll by now, so you don’t say anything at all; simply going across, curling an arm around a warm, giggly cow-girl, breathing in their sweet, milky scent and giving their plump butts a healthy squeeze is all that’s required. It’s all so happily straightforward.");
				output("\n\nThey lead you to a quiet shower-block, detached from the main barn. It is monitored, rather cutely, by a cow-mazon and faux-cow couple; the former huge, black and short-haired, the latter blonde, winsome and with an impudent smirk begging for an ass-fuck. The amazon raises an eyebrow when you walk in with your arms full of Carrie and Cora, but says nothing when you sashay past into the warm, wet mist. Evidently this place is as communal and bonk-happy as anywhere else on New Texas.");
				output("\n\n");
			}
			
			// merge from repeat Threesome
			output("Once inside a spacious cubicle of your own, you");
			if(!pc.isNude()) output(" take off your [pc.gear] and then");
			output(" sit back and watch the two cow-girls eagerly strip, [pc.eachCock] easily becoming hard and pressingly erect watching their plush flesh loll out of their clothes, their heavy, erect nipples bursting out of their bras. Carrie turns away - displaying her full, naked butt to you - and twists the metal nozzles on the wall. Heavy, hot water cascades from the ceiling.");
			output("\n\n<i>“What have you got, big [pc.guy]?”</i> husks Cora, caressing a swollen nipple and gazing at you through the steam.");
			
			processTime(2);
			// [pb]
			clearMenu();
			addButton(0, "Next", carrieSoothingShowerGo, "shower threesome p1");
			break;
		case "shower threesome p1":
			showBust("CARRIE_NUDE", "CORA_NUDE");
			
			output("These two are made for pleasure, and every moment their soft, sensitive bodies are not being used to experience it at its keenest edge seems like an outrage. With that in mind, you push Carrie against the wall");
			if(pc.tallness > 42) output(", kneel");
			output(" and thrust your [pc.tongue] deep into her muff, reaching beyond her soft, puffy lips to take long, hungry drags at her sopping, elastic tunnel until her shocked laughs turn to gasps, then to high moans, slippery hands clutching at your shoulders and [pc.hair]. You finger Cora at the same time, curling into her wet, velvet sex and easily finding her plump button, stroking at it more and more firmly as sweet, horny cherry begins to freely oil your mouth and [pc.lips].");
			output("\n\nYou could be absolutely terrible at pleasuring pussy and you wouldn’t be able to tell with these two. Just being in this hot intimate space with you seems to be an almost unbearably sensual experience for them; just touching or stroking their damp, pliant skin makes them gasp, tense or coo. You like to think the volume of the moos and squeals you draw out of them by burying your head between first one pair of soft thighs and then the other to rasp your [pc.tongue] over their protuberant clits and attack their soaking pink with little flicks of the tip speaks of your prowess, though. Certainly their thighs and wonderfully elastic tunnels flex and clench up around you many, many times, and by the time you");
			if(pc.hasLegs()) output(" stand");
			else output(" rise");
			output(" up to give them a temporary respite, your mouth and jaw are absolutely glazed in girl fruit.");
			output("\n\n<i>“Ooh my,”</i> quivers Carrie, panting and leaning on the wall for support. <i>“Maybe - might need a bit of a wash now...”</i>");
			output("\n\nYou’re happy to oblige. There’s plenty of wall-mounted gel dispensers in here, and you pool plentiful amounts of it in your hands before spooning into the rosy-skinned cow-girl and letting them roam over her splendid, tender body - over the slight rise of her tummy, between her generous ass-cleft, through her wet hair... Cora joins in, her heavy boobs plumping into her sister’s side as she cheekily sends one hand drifting into Carrie’s delta at the same time and wrapping the other around your [pc.cock " + x + "].");
			output("\n\nCarrie’s breathy, sensual sighs change to squeals when you enclose the softness of her boobs and squeeze, gently tweaking her nipples until they jet milk as freely as water batters down on your [pc.hair]. Cora laughs, but she moos even louder when you do the same to her a few moments later, seizing up in your strong arms as you knead her full, juicy tits closely from behind, her soft, full ass juddering around your bulging dick.");
			
			processTime(2 + rand(4));
			pc.girlCumInMouth(getCarriePregContainer());
			pc.applyPussyDrenched();
			// [pb]
			clearMenu();
			addButton(0, "Next", carrieSoothingShowerGo, "shower threesome p2");
			break;
		case "shower threesome p2":
			showBust("CARRIE_NUDE", "CORA_NUDE");
			
			var superCum:Boolean = false;
			
			output("Once you’re done soaping them they return the favor, their gentle, slender hands gliding over your [pc.chest], your [pc.ass], and of course [pc.eachCock]. It’s been a struggle for you to keep a lid on your lust through all of this, but it’s here where it becomes too much to bear any more. With a heavy grunt you grip Cora beneath the knees, pin her to the wall and plough your urgently erect [pc.cock " + x + "] into her well-unfurled cunt with a single, liquid movement.");
			
			pc.cockChange();
			
			output(" You kiss her roughly and then descend to her milk-leaking nipples, biting and pulling at them, intent on using every inch of her as you thrust your cock home into that wonderful, clinging, kneading softness again and again.");
			output("\n\n<i>“Fuck yes,”</i> moans Cora deliriously, hands clutching at your water-dappled back, tail flicking against your [pc.legOrLegs]. <i>“Fill me up you unstoppable beast, breed me and stuff me full of your calves!”</i> You couldn’t last long even if you wanted to;");
			if(pc.balls > 0) output(" your [pc.balls] tighten inexorably and");
			output(" your cock bulges up and surges one load of [pc.cum] after another into her silken squeeze with wonderful, heavy pulses.");
			output("\n\nAs hard as it is though, you pull away before you give her everything you got, because it never left your mind that you’re not done here. You withdraw and carefully lay Cora down, letting her pool onto the wet floor as a gurning, eye-rolling, cum-leaking mess, and then turn to Carrie, [pc.eachCock] still urgently erect. She’s lounged on the puddled floor as well, having watched you screw her sister insensate whilst leisurely diddling herself.");
			output("\n\n<i>“Got any left for me, big [pc.guy]?”</i> she asks demurely, sucking on her finger. You answer that question by turning her around and bending her over, the flesh of her round, fat behind jiggling wonderfully as you slap your [pc.thighs] into it, pumping every inch of your");
			if(pc.cockTotal() == 1) output(" [pc.cock]");
			else output(" [pc.cock " + y + "]");
			output(" into the wet, tight ecstasy that is cowgirl cunt a dozen times, then two dozen, then four... even if the gasps and then wails of ecstasy that you draw out of Carrie weren’t enough to alert anyone listening in to what you are doing, you’re pretty sure the energetic slap-slap-slap of your");
			if(pc.balls > 0) output(" [pc.balls]");
			else output(" [pc.thighs]");
			output(" against her thighs would. Or maybe your husky groan when you finally reach your second orgasm, the plush flesh of Carrie’s boobs squeezing between your fingers, packing her flexing, clinging fuck hole full of bull cream too.");
			
			processTime(3 + rand(4));
			pc.lust(50);
			// Super cum output only:
			if(pc.cumQ() >= 10000) superCum = true;
			for(i = 0; i < 2; i++) { pc.orgasm(); }
			// [pb]
			clearMenu();
			if(superCum) addButton(0, "Next", carrieSoothingShowerGo, "shower threesome super cum");
			else addButton(0, "Next", carrieSoothingShowerGo, "shower threesome end");
			break;
		case "shower threesome super cum":
			showBust("CARRIE_NUDE", "CORA_NUDE");
			
			output("Of course, the girls know even then that’s not everything you’ve got to give. After only a few moments of rest under the beat of the hot water, drifting fingers and cooing exultations force you to get back to your role as " + pc.mf("papa bull", "alpha bitch") + ".");
			output("\n\n<i>“Why don’t you come and live here, [pc.name]?”</i> murmurs Cora, breaking off momentarily to gaze up at you. <i>“We could do this every single day.”</i>");
			output("\n\n<i>“I need time away from you,”</i> you explain gruffly, closing your eyes as Carrie’s wet, rough tongue slides over the cumslit of your [pc.cock " + x + "] <i>“You two are... insatiable.”</i>");
			output("\n\n<i>“We’d be gentler if you were always around,”</i> she giggles slyly, caressing");
			if((pc.cockTotal() > 1 && pc.balls > 0 && rand(2) == 0) || pc.balls > 0) output(" your [pc.balls]");
			else if(pc.cockTotal() > 1) output(" your [pc.cock " + y + "]");
			else output(" the base of your dick");
			output(".");
			output("\n\n<i>“Concentrate, girl,”</i> you huff, heat pulsing in your brow. <i>“Or I’ll give it all to Carrie.”</i>");
			output("\n\n<i>“Meanie,”</i> she pouts, before returning to");
			if(pc.cockTotal() == 1) output(" helping her sister polish your [pc.cock " + x + "]");
			else output(" sucking your [pc.cock " + y + "]");
			output(" with long, worshipful drags of her lips and mouth. A final, crashing orgasm isn’t far behind, and you exhale in gratification as the final yard of pent up [pc.cum] shoots up [pc.eachCock] and down into its rightful berth: a cow slut’s stomach. You imagine your thick seed metabolizing and giving them milkier boobs, fatter rumps, glossier hair, needier pussies, plumper and more sensitive lips... it’s a fantasy that energizes you to grip each auburn head");
			if(pc.cockTotal() == 1) output(" in turn");
			output(" and slide every hard, tender inch into their wet mouths and then the closeness of their throats, ensuring they drink down every last thick drop.");
			
			processTime(5 + rand(6));
			pc.lust(50);
			for(i = 0; i < 4; i++) { pc.orgasm(); }
			// [pb]
			clearMenu();
			addButton(0, "Next", carrieSoothingShowerGo, "shower threesome end");
			break;
		case "shower threesome end":
			moveTo("516");
			
			showLocationName();
			showBust("CARRIE_NUDE", "CORA_NUDE");
			
			output("After you clean yourselves up one last time and then towel yourselves down, you");
			if(!pc.isNude()) output(" re-dress and");
			output(" depart the shower arm-in-arm again, a wonderful, exultant throb permeating your whole body. The couple attending the shower block are nowhere to be seen; although there’s a brisk, wet, rhythmic sound coming from a back office, accompanied by the odd, trappy moan. Evidently your shamelessly long and loud threesome provided some inspiration.");
			output("\n\nStill laughing away at the thought, Carrie and Cora unfasten themselves from your back at the milker with a certain amount of reluctance.");
			output("\n\n<i>“Don’t be a stranger, big [pc.guy],”</i> coos Carrie as you step away. <i>“It’s important" + pc.mf(" prize bulls", " amazon studs") + " get regular showers, you know...”</i>");
			
			processTime(15 + rand(11));
			pc.shower();
			IncrementFlag("CARRIE_SHOWER_THREESOME");
			clearMenu();
			addButton(0, "Next", carrieSoothingShowerDone);
			break;
		// Repeat
		case "shower repeat":
			rooms["516"].removeFlag(GLOBAL.NPC);
			moveTo("NT SHOWER HOUSE");
			
			showLocationName();
			showBust("HORISHA_AND_PECK");
			
			output("You don’t have to say anything; all you have to do is go across, curl each arm around a warm, giggly cow-girl, breathe in their sweet, milky scent and give their plump butts a good, healthy squeeze. Once again, they lead you to the showers detached from the main barn.");
			output("\n\n");
			
			if(flags["CARRIE_SHOWER_FIVESOME"] == undefined) output("The intimidatingly beautiful ebony amazon");
			else output("Horisha");
			output(" raises an arch eyebrow when you mosey into her shower block again, arms full of Carrie and Cora.");
			output("\n\n<i>“Another");
			if(hours > 23 || hours < 13) output(" morning");
			else output(" afternoon");
			output(" session?”</i> she says");
			if(flags["CARRIE_SHOWER_FIVESOME"] == undefined || rand(2) == 0) output(" in a deep, musical voice");
			else output(" in her clarinet-like voice");
			output(". <i>“I should be telling T. why his water bill is so high.”</i> She’s grinning, though.");
			
			processTime(1);
			// [Join us] [Threesome]
			clearMenu();
			addButton(0, "Join Us", carrieSoothingShowerGo, "shower fivesome intro", "Join Us", "See if you can’t persuade the amazon and her pet faux-cow to join you and make it a five-way!");
			addButton(1, "Threesome", carrieSoothingShowerGo, "shower intro", "Threesome", "Do it with Carrie and Cora.");
			break;
		// Join Us
		case "shower fivesome intro":
			showBust("HORISHA_AND_PECK");
			
			output("<i>“Why don’t you join us?”</i> you offer with a rakish grin. <i>“You know it’ll be fun.”</i>");
			output("\n\nThe cow-mazon leans back on her chair for a long moment, drinking the three of you in with the same, leisured grin.");
			output("\n\n<i>“Sure, why not,”</i> she says easily. <i>“Nothing goin’ on here anyway.”</i> She raps her desk smartly.");
			output("\n\n<i>“Peck! Come.”</i>");
			output("\n\n<i>“We’re supposed to be on duty though, Horisha,”</i> replies the pert, blonde faux-cow in a breathy voice.");
			output("\n\n<i>“Don’t make me beat your impertinent ass in front of everyone,”</i> replies Horisha coolly, ushering him in front of her. <i>“You’re up 12 whups for the day as is.”</i>");
			
			processTime(2);
			pc.lust(50);
			clearMenu();
			addButton(0, "Next", carrieSoothingShowerGo, "shower fivesome p1");
			break;
		case "shower fivesome p1":
			showBust("HORISHA_AND_PECK", "CARRIE_NUDE", "CORA_NUDE");
			
			if(pc.isTreatedBull()) output("Your bullish impulses seethe in the presence of so many plush, willing cows, and once within the enclosed, steamy space of the communal shower, their sweet, fruity smell heavy in your nostrils, they make demands of you that you cannot resist. The presence of another male - even such a male as Peck, half the size of his owner, girly shoulders, hairless on his body and lips every bit as glossy and perfect for cock-sucking as Carrie’s - demands you step up and make it clear who the alpha here is.");
			else output("It’s here, in the presence of so many plush, willing cows in the enclosed, steamy space of the communal shower, that you appreciate the pheromonal thing is actually a two-way street. The sweet, fruity smell of them hangs heavy in your nostrils and your masculine impulses seethe, making demands of you that you cannot resist. The presence of another male - even such a male as Peck, half the size of his owner, girly shoulders, hairless on his body and lips every bit as glossy and perfect for cock-sucking as Carrie’s - demands you step up and make it clear who the alpha here is.");
			output("\n\nThe moment he takes his tight clothes off, displaying an ass as pert, cute and provoking as his features, you’re on top of him, sliding your [pc.cock] between his pale cheeks, letting one hand trail down his flat front and the other firmly clutch his thick, eight-inch horse dick. He whimpers but doesn’t pull away, simply shifts his soft buttocks up your water-slicked shaft and looks over his shoulder at you with a butter-wouldn’t-melt expression. Pulse thudding in your temple, you push him against the enamel wall of the shower and use it as stanchion to inexorably open his pink fuck-hole with your [pc.cockHead] and push your dripping cock into the tight, hot tunnel of his ass, intent on reshaping it in your own throbbing, dominant dick’s image. His breathy little gasps, little tenses of the muscles and his slim fingers grasping at your [pc.hips] spur you on.");
			
			pc.cockChange();
			
			output(" Behind you, Horisha hums her musical approval of your gross manhandling of her piece of candy.");
			if(flags["CARRIE_SHOWER_FIVESOME"] == undefined) output("\n\n<i>“So you are Carrie, and you are - Cora?”</i> she says, in the tones of a manager orienteering some employees. <i>“Pleased to meet you. Carrie, get on your knees and eat my muff. Cora - come here.”</i>");
			else output("\n\n<i>“How are we today, Carrie, Cora?”</i> she says in her business-like tones. <i>“Excellent. So pleased. Carrie, get on your knees and eat my muff. Cora - come here.”</i>");
			
			output("\n\nYou aren’t missing this. With strong sweeps of your arms and [pc.legOrLegs] you shift Peck around, getting him on his hands and knees with his penetrated butt in the air, so you can watch what Horisha is doing. The tall amazon, with her perfect, leonine physique, all tight muscle and broad, feminine curves resplendent underneath the water cascading off of it, is stood up and has the first auburn cowgirl between her thighs, nose buried in her small pubic thatch and dutifully lapping away, tail slowly swinging. Following Horisha’s instruction and firm hands, Cora has straddled her sister, turned around and bent over, presenting her big, New Texan-bred bottom to the dominant woman. Her slight nervousness doing this melts when Horisha reaches down and clasps her breasts, kneading their softness with assured movements of her fingers. A blissful, moaning <i>“moo”</i> escapes her pretty lips as the amazon finds her cherry-like nipples and gently squeezes.");
			output("\n\nIt’s an amazing scene to drink in whilst you’ve got your [pc.cock] firmly embedded in the wonderfully tight ass of a faux-cow bitch boi, and you can’t help but begin to pump into him demandingly, sliding out towards his stretched anus and then ramming your bulging, burning length home,");
			if(pc.balls > 0 && !pc.hasStatusEffect("Uniball")) output(" [pc.balls] swinging ponderously,");
			output(" each thrust claiming more and more of his lithe body for your own pleasure. Your hand whips down his outsized erection, each tough jerk of your wrist forcing a slutty bleat past his lips and making him shiver around your [pc.cock] beautifully.");
			output("\n\nHorisha evidently feels the same way you do about her menagerie; she bites her lips as her wide eyes trail over you and Peck, and thrusts her thighs into Carrie’s face with increasing need, who holds onto her taut muscular legs, determinedly limpeted to the bigger woman’s crotch. The amazon’s fingers pinch Cora’s swollen nipples and presses her fingers deep into her softness, causing milk to spurt into the air and Cora to wail, seizing up in her arms and dribbling copious amounts of femcum all over her sister’s head. In response, you shove as much of your cock into Peck’s tight, buttery squeeze as you can; he arches his back with a shuddering gasp, his own dick spasms in your hand, and then next thing you know he’s sprayed lines of cum the length of his own body on the puddled floor.");
			output("\n\n<i>“Cumming without instruction, boy?”</i> laughs Horisha, cruel, delighted brown eyes on Peck. <i>“I don’t care how good that thick");
			if(pc.isTreatedBull()) output(" bull");
			output(" dick in your lily ass feels - you know that’s another 10 whups.”</i>");
			output("\n\n<i>“M-mistress...”</i> is all the faux-vine can stammer in response, and he watches, your [pc.hips] still clapping a steady rhythm against said cute, rosy bottom, as she reaches her own high, crying out in joy as Carrie tongues her to it relentlessly. Your eyes are on Horisha’s huge, bouncing boobs as you allow yourself to rush into delicious, juicy orgasm as well, your [pc.cock] tightening up gloriously, your cum-slit dilating and then fountaining cum deep into Peck’s colon. ");
			// If low output:
			if(pc.cumQ() < 500) output(" A nice, thick, hot reminder of your domination of his scrumptious candy ass. You try and hold yourself back a bit though, pull out before you go too far - no way is this party over.");
			// If else:
			else
			{
				output("\n\nYou pump one load into him - a nice, thick, hot reminder of your domination of his scrumptious candy ass - and then pull out and spray the next right up the curve of his back with a breathless grunt. May as well go to town here... it’s all going to be washed away in a few moments.");
				output("\n\nHorisha hoots with laughter, releasing Carrie and Cora and standing back as you stand over them and shower their faces and breasts with the rest of your hot packet of [pc.cum], reward for being so amenable to this ridiculous orgy. They react dozily, utterly dazed with sex and heat, this sudden rain of jizz from their favorite source simply another slightly perplexing paragraph in their life-stories of sunny, cock-addicted pleasure. Once they cotton on though they sigh and laugh in that wonderful cadence somewhere between exasperation and delight, and once you’ve spurted your last they put on a little show of licking oozing cum off each other’s flush, naked boobs and cheeks, looking at you slyly as they finish with a lascivious, incestuous kiss, trying to coax you on. You’re holding some of your prestigious load back though - no way is this party over.");
			}
			
			processTime(7 + rand(6));
			// Lust decreased by 50%
			pc.lust(-50);
			// [pb]
			clearMenu();
			addButton(0, "Next", carrieSoothingShowerGo, "shower fivesome p2");
			break;
		case "shower fivesome p2":
			showBust("HORISHA_AND_PECK", "CORA_NUDE", "CARRIE_NUDE");
			
			output("You relax back on a wooden bench, [pc.eachCock] throbbing satisfyingly, reveling in the soundtrack of gently panting cowgirls and bois. With your immediate lust and bestial imperatives seen to, you’re happy to let somebody else take the lead. It’s no surprise who that is.");
			output("\n\n<i>“Nice dick,”</i> Horisha observes, her ebony muscle, palpitating F-cups and white teeth looming over you. <i>“Mind if I use it?”</i> You signal your sentiments to this idea by shifting your grip along your [pc.cock], instantly becoming erect again, [pc.eyes] fixed upon her luscious body.");
			output("\n\nThe gloriously naked horned woman climbs on top of you, knees tightening around your [pc.hips] as she rests the slightly-parted lips of dewy pussy against your [pc.cockHead]. She raps out instructions as she does so.");
			output("\n\n<i>“Carrie, come here and straddle [pc.himHer]. Yes, near my hands, exactly. Cora - give [pc.himHer] something to eat, will ya?”</i> She pauses and bites her lip as she sinks downwards, her lips parting around your tender erection and gloving it inch by inch in hot, slick, muscular cowmazon cunt.");
			
			pc.cockChange();
			
			output(" Your own lusty groan is muffled by Cora swinging a jiggling thigh over your face and excitedly plopping her leaking, puffy pussy onto your [pc.lips]. You start slightly when Horisha pumps her thighs and the muscled walls of her sex <i>seize</i> your [pc.cock] and jerk it within her energetically.");
			output("\n\n<i>“Mooooo,”</i> she moans throatily. Carrie’s slutty lowing tells you that Horisha is, once again, translating her lust into mauling a pair of full, sensitive cow tits. Seeing the need to follow suit, you grasp Cora’s supple sides, you part her lips and dart your [pc.tongue] across her pink, greedily tasting the plentiful cherry juice that’s already there, making her squeal in delight.");
			output("\n\n<i>“Peck,”</i> Horisha barks, riding your cock with firm, wet pumps, <i>“You can see I’m busy - why I gotta tell you to tongue my ass, huh?”</i> There’s a murmured <i>“sorry mistress”</i>, and a moment later Horisha sighs. <i>“That’s better - nice and deep. Honestly. Calls himself a bitch...”</i>");
			output("\n\nScrewing the towering amazon is like being trapped in a particularly wet and aggressive cock milker, but that’s not the worst thing in the world, particularly when you’ve got damp, warm cowgirl plentifully draped across your [pc.chest] and face, gasping and energetically bouncing on top of you to every dart and curl of your fingers and tongue. You have no idea how many times Horisha cums - her thighs firmly molded around yours, her pussy is a constant, rippling clamp shifting up and down your cock - but her litany of throaty gasps and growls tell you she’s having a pretty good time riding you senseless. Milk and girl cum dribble down your cheeks and sides to a chorus of ecstatic moos, and get washed away by the battering water - and then yet more of it dribbles down 20 seconds later. Cowgirls are unbelievably juicy creatures.");
			output("\n\nEventually, after a particularly wet and shrill orgasm caused by you sticking your [pc.tongue] as far into her sucking wetness as it would go and wiggling it furiously, Cora rolls off you, utterly nerveless. This enables you to lock eyes with Horisha, who still has hold of Carrie. The cowmazon’s proud mouth is open and fire is in her eyes, thrusting her hips on top of you with heavy slaps.");
			output("\n\n<i>“Oh Peck, you dirty, wonderful boy...”</i> she cries. <i>“Right there! Yes!”</i> She flings her head and wails in delight, her twat flushing lubricant down your [pc.cock] and tightening up around it ecstatically. ");
			output("\n\nThe cum is practically vacuumed out of you, jetting filthily into that wonderful, kneading fuck-tunnel of hers. Carrie flops down on top of you, pillowy tits pressing into your [pc.chest] and you find her mouth, mashing your lips into hers, making her taste her sister by passionately twining your tongue with hers. Hot [pc.cum] cannons out of you until it dribbles out over your [pc.hips] and stars are swimming in your vision.");
			output("\n\nYou could see yourself getting used to this.");
			
			processTime(10 + rand(3));
			// Maybe Twins?
			var ppCora:PregnancyPlaceholder = getCarriePregContainer();
			pc.girlCumInMouth(ppCora);
			pc.applyPussyDrenched();
			pc.applyPussyDrenched();
			// Lust decreased by 50%
			pc.lust(-50);
			// [pb]
			clearMenu();
			addButton(0, "Next", carrieSoothingShowerGo, "shower fivesome p3");
			break;
		case "shower fivesome p3":
			showBust("HORISHA_AND_PECK", "CORA_NUDE", "CARRIE_NUDE");
			
			output("It’s a little while later. You sit back and bask in a well-earned glow next to Horisha, water drizzling down your [pc.chest]. Your hand lazily curls between her muscular thighs. In front of you Carrie and Peck are putting on a little show for you two, hands running over each other’s bare, heat-blushed bodies, constantly stealing lusty, snickering looks at their alphas. Cora’s being put to good use.");
			output("\n\n<i>“Should bring some stuff in here next time,”</i> you murmur. The fauxcow’s fingers stroke hard in Carrie’s twat and the two french wetly. <i>“Couple of dildos, bullet vibes, maybe a paddle... really go to town.”</i>");
			output("\n\n<i>“That’s a tourist talkin’,”</i> replies Horisha. <i>“Um. Bit further up. Right there. Right there...”</i> Her eyes close blissfully and her hands go to her blimp-like breasts, kneading the chocolate nipples forcefully as you curl at that hidden spot in her sodden, silky tunnel. <i>“Treatment means never needin’ sexy equipment. Interna-thingies it, see? Uff. Now the clit. Niiiiice. You spend a few moments with sluts like these three and you’ll never need vibrators.”</i> She sighs dreamily as she watches Carrie hold Peck down and gleefully bounce on his out-sized cock.");
			output("\n\n<i>“Still, a dildo would be nice. For when I’m watching you fuck the everlovin’ daylights out of my boi there.”</i>");
			output("\n\nYou laugh, and then groan slightly yourself, shifting your grip on the head between your open thighs.");
			output("\n\n<i>“Bit deeper, girl. That’s it...”</i> With a wet smack Cora’s plump lips advance a little further down your [pc.cock], and you feel the stirrings of orgasm tighten up your");
			if(pc.balls > 0) output(" [pc.balls]");
			else output(" body");
			output(" again...");
			
			processTime(20 + rand(6));
			// [pb]
			clearMenu();
			addButton(0, "Next", carrieSoothingShowerGo, "shower fivesome p4");
			break;
		case "shower fivesome p4":
			moveTo("516");
			
			showLocationName();
			showBust("CARRIE_NUDE", "CORA_NUDE");
			
			output("After you clean yourselves up one last time and then towel yourselves down, you");
			if(!pc.isNude()) output(" re-dress and");
			output(" depart the shower block arm-in-arm with Carrie and Cora, a wonderful, exultant throb permeating your whole body.");
			output("\n\n<i>“Well... that was pretty interesting,”</i> says Carrie once you get back to the milker, still looking slightly dazed.");
			output("\n\n<i>“Gonna be late for my next shift now,”</i> pouts Cora.");
			output("\n\n<i>“Worth it though, don’cha think?”</i>");
			output("\n\n<i>“Yeah...”</i> coos Cora, coyly twirling a damp red lock and looking at you. <i>“I guess so.”</i>");
			output("\n\nThey seem to be waiting for something, turned from you but looking over their shoulders cheekily, backs slightly arched. It takes you a moment to work out what it is. You leave them with a big grin on your face, their parting gasp and squeal reverberating in your ear, your handprint freshly reapplied to one soft ass cheek each. Those two really are the absolute best.");
			
			processTime(15 + rand(11));
			for(i = 0; i < 8; i++) { pc.orgasm(); }
			pc.shower();
			IncrementFlag("CARRIE_SHOWER_FIVESOME");
			clearMenu();
			addButton(0, "Next", carrieSoothingShowerDone);
			break;
	}
}
public function carrieSoothingShowerDone():void
{
	if(pc.hasStatusEffect("Cora Showered")) pc.setStatusMinutes("Cora Showered", (72 * 60));
	else pc.createStatusEffect("Cora Showered", 0, 0, 0, 0, true, "", "", false, (72 * 60));
	mainGameMenu();
}

// “Bad” End
/*
Requirements
* Has activated the shower scene
* Big dick plus at least medium cum output
* Has the Pher Cloud perk
*/
public function carrieMilkerBadEndChance():Boolean
{
	if(flags["CARRIE_SHOWER_THREESOME"] != undefined && pc.biggestCockLength() >= 12 && pc.cumQ() >= 1000)
	{
		//if(rand(2) == 0) return true;
		if(hours >= 6 && hours < 18) return true;
	}
	return false;
}
//Scene has 50% chance of proc whenever shower scene would be available
public function carrieMilkerBadEnd(response:String = "intro"):void
{
	clearOutput();
	author("Nonesuch");
	
	switch(response)
	{
		case "intro":
			showName("CARRIE\n& CORA");
			showBust("CARRIE", "CORA");
			
			if(flags["NT_BUILD_BOTTLE_PLANT"] == undefined)
			{
				output("The busy, frenetic sound of female conversation meets your ears as you approach the milker. Leant back on the looming apparatus, Carrie is chatting with her sister Cora. Her eyes and smile widen as you mosey up; the chatter dries up and the expression is mirrored when Cora turns around.");
				output("\n\n<i>“Sup, girls?”</i> you grin.");
				output("\n\n<i>“Nothing,”</i> they titter almost simultaneously, sharing a look as they do. Cows aren’t capable of slyness, but something does pass between the two busty redheads there; a soft thoughtfulness, perhaps.");
				output("\n\n<i>“Reckon I’m gonna go for a walk,”</i> says Carrie. <i>“Stretch my hooves a little.”</i>");
				output("\n\n<i>“I’ll look after your post,”</i> Cora offers.");
				output("\n\n<i>“Wanna come with, big " + pc.mf("guy","girl") + "?”</i> Carrie smiles brightly.");
				
				processTime(2);
				flags["NT_BUILD_BOTTLE_PLANT"] = 0;
				
				// [Sure] [Nah]
				clearMenu();
				addButton(0, "Sure", carrieMilkerBadEnd, "sure");
				addButton(1, "Nah", carrieMilkerBadEnd, "nah");
			}
			// Repeats
			// If Carrie ‘n Cora both at station when PC has chosen to go for walk but has not chosen [Build It!]
			else if(flags["NT_BUILD_BOTTLE_PLANT"] == 0)
			{
				output("The busy, frenetic sound of female conversation meets your ears as you approach the milker. Leant back on the looming apparatus, Carrie is chatting with her sister Cora. Her eyes and smile widen as you mosey up; the chatter dries up and the expression is mirrored when Cora turns around.");
				output("\n\n<i>“Sup, girls?”</i> you grin.");
				output("\n\n<i>“Nothing,”</i> they titter almost simultaneously, sharing a look as they do. Cows aren’t capable of slyness, but something does pass between the two busty redheads there; a soft thoughtfulness, perhaps.");
				output("\n\n<i>“I could use a walk,”</i> says Carrie casually. <i>“Or maybe there’s something else fun you’d like to do, big " + pc.mf("guy","girl") + "?”</i>");
				
				processTime(2);
				
				// [Shower] [Walk] [Nah]
				clearMenu();
				addButton(0, "Walk", carrieMilkerBadEnd, "sure");
				addButton(1, "Nah", carrieMilkerBadEnd, "nah");
				addButton(3, "Shower", carrieSoothingShowerGo, "shower repeat", "Shower", "Take a shower with the sisters...");
			}
			// If PC has chosen [Build It!]
			else
			{
				output("<i>“Hey [pc.name],”</i> says Carrie, as you mosey up to her corner of the barn. <i>“");
				if(hours >= 9 && hours < 17) output("Wanna earn some credits?");
				else output("Wanna off-peak special?");
				output(" Or you fixin’ to go look at the building site, maybe.”</i> She casts her eyes down demurely, but doesn’t keep the hopefulness out of her voice.");
				
				processTime(1);
				
				// [Reg options] [Build]
				useDaMilkarMenu();
				addButton(3, "Shower", carrieSoothingShowerGo, "shower repeat", "Shower", "Take a shower with the sisters...");
				addButton(4, "Build", carrieMilkerBadEnd, "build it repeat");
			}
			break;
		case "nah":
			showName("CARRIE\n& CORA");
			showBust("CARRIE", "CORA");
			
			output("<i>“Just want to use the machine,”</i> you reply.");
			output("\n\n<i>“One track mind,”</i> pouts Carrie.");
			
			processTime(1);
			
			// Display regular options
			useDaMilkarMenu();
			break;
		case "sure":
			moveTo("NT BOTTLE TRAIL");
			
			showLocationName();
			showBust("CARRIE");
			
			output("You slip your hand into Carrie’s own small, warm mitt and stroll with her beyond the barn and up a little trail leading eastwards.");
			output("\n\nIt really is extremely pleasant on New Texas. There’s a timeless quality to the prairies and vast sky stretching out in all directions, as if nothing could possibly trouble you so long as you empty your mind and let your thoughts drift into the dusty green and powdery blue. Every huge, widely spaced building you can see looks well used, cared for... well, except <i>that</i> one.");
			output("\n\n<i>“What’s that?”</i> you ask, pointing at the derelict skeleton of concrete and leaning wood.");
			output("\n\n<i>“It was gonna be the semen bottling facility for Big T’s ranch,”</i> sighs Carrie, kicking at a pebble. <i>“We export the stuff you know, it’s almost as prized as our milk in the Beyond. But the bulls who were constructing it got transferred to Berylhead and nobody’s picked it up since, cuz there aren’t really enough bulls ‘round here to justify it. So now it’s just me and my dinky lil’ milker.”</i>");
			// Male Treated:
			if(pc.isTreatedBull()) output("\n\nIt hurts you on some deep, profound level to see a heavy lifting job like that left unfinished...");
			
			processTime(25 + rand(11));
			
			// [Build It!] [Shame]
			clearMenu();
			addButton(0, "Build It!", carrieMilkerBadEnd, "build it", "Build It!", "You can’t let that just stand there half-complete. And you can “justify” it on your own!");
			addButton(1, "Shame", carrieMilkerBadEnd, "shame", "Shame", "Damn shame.");
			break;
		case "shame":
			moveTo("516");
			
			showLocationName();
			showBust("CARRIE", "CORA");
			
			output("<i>“Oh well,”</i> you say, squeezing her hand. <i>“Maybe one day.”</i>");
			output("\n\n<i>“Yeah...”</i> the cowgirl smiles at you wistfully. <i>“One day.”</i>");
			output("\n\nYou carry on your pleasant stroll, gallantly chaperoning the cowgirl against non-existent Varmints, and see her back to her post safe and sound.");
			output("\n\n<i>“Nice walk?”</i> asks a distinctly bored-looking Cora.");
			output("\n\n<i>“You didn’t miss any lovin’, don’t worry,”</i> her sister assures her.");
			output("\n\n<i>“Good.”</i> Cora wriggles her shoulders, making her plush boobs tremble, barely constrained by her dungarees. <i>“Imagine you probably need a shower, after all that exercise.”</i>");
			
			processTime(25 + rand(11));
			// + Lust
			pc.lust(15);
			
			// [Shower] [Later]
			clearMenu();
			addButton(0, "Shower", carrieSoothingShowerGo, "shower repeat", "Shower", "Take a shower with the sisters..."); // Standard shower scenes
			addButton(1, "Later", carrieMilkerBadEnd, "later");
			break;
		case "later":
			showBust("CARRIE", "CORA");
			
			output("<i>“I’ll catch up with you later,”</i> you say. This is met with a shared, disappointed groan which dissolves, once again, into giggling.");
			output("\n\n<i>“Get outta here then, ya big dumb tease,”</i> sighs Carrie, turning back to her sister.");
			
			processTime(1);
			
			clearMenu();
			addButton(0, "Next", mainGameMenu);
			break;
		case "build it":
			moveTo("NT BOTTLE PLANT");
			
			showLocationName();
			showBust("CARRIE");
			
			output("Puffing your [pc.chest] out, you proclaim that you will complete the bottling facility. Hell, it might take a while - and you don’t know where you’re going to get the equipment--");
			output("\n\n<i>“No! I can take care of that,”</i> says Carrie excitedly, pushing her soft boob into your side. <i>“Big T will happily dole out a loan if he knows it’s going to be paid back, and if </i>you’re<i> in charge and pitching in the labor...”</i>");
			output("\n\nShe trots off in the direction of the ranch, and you roll up your sleeves.");
			
			processTime(2);
			
			clearMenu();
			addButton(0, "Next", carrieMilkerBadEnd, "build it p1");
			break;
		case "build it p1":
			showLocationName();
			clearBust();
			
			output("You measure the existing framework with your codex and then take an inventory of the rot-resistant wood, tools, polymers and fasteners that are propped against the half-finished walls and scattered around the site. Seems as if most of what you need is already here, but there’s still umpteen things that need to be replaced and ordered, planks that have to be hauled, concrete that has to be mixed... you just tinker with little things, deliberately not looking at the size of the job you’ve taken on to begin with, but eventually - as you sketch and hoist and hammer and fit - the building takes shape in your mind, and you see how all the little things will fit together into a hugely satisfying whole.");
			output("\n\n");
			// Male Treated:
			if(pc.isTreatedBull()) output("Being hard at work like this, getting sweaty under New Texas’s " + (hours >= 6 && hours < 20 ? "beaming sun" : "night sky") + ", fills you with a contentment that’s almost beyond words. You forget for long spells that there is anything beyond this, the profound satisfaction of using your bullish strength and technical ability to make something appear in front of you, and when you do it’s with a sense of irritation.");
			// Not Treated:
			else output("Satisfying. That’s the word. For a serene amount of time you completely lose yourself in the work, sweating away to slowly make something appear in front of you, and there is a deep contentment to be found in it. Is this how it is for Male Treated?");
			
			// + 4 hours, - 40 energy
			processTime(225 + rand(31));
			pc.energy(-40);
			sweatyDebuff(1);
			pc.lust(50);
			
			// [pb]
			clearMenu();
			addButton(0, "Next", carrieMilkerBadEnd, "build it p2");
			break;
		case "build it p2":
			showBust("CARRIE");
			
			if(!pc.hasStatusEffect("NT Build Bottle Plant Repeat")) output("Carrie comes back");
			else
			{
				output("Carrie comes over");
				pc.removeStatusEffect("NT Build Bottle Plant Repeat");
			}
			output(" with a loaded hamper basket after... how long has it been? Sweat is pouring down your back, but when you stand back from the building site you see you’ve barely even begun. You just want to keep going.");
			output("\n\n<i>“Steady now, big " + pc.mf("guy","girl") + ",”</i> Carrie laughs, sitting herself down on the grass. <i>“Have a bite to eat.”</i> As it transpires, almost all of the cold picnic lunch she’s brought is for you. <i>“Course! I’ll be getting my vitamins a different way.”</i>");
			output("\n\nYou lean back upon a half-constructed wall a little bit later, gazing beatifically up at the giant sky as Carrie hollows her cheeks around your [pc.cockBiggest], pulling and kneading at it in her warm, saliva-coated embrace with ardent bobs of her auburn head. Her slurps and lusty hums meld with your approving groans the further she manages to get her lips down your throbbing length, and you scritch her behind a flat ear every time her rough, wet tongue slides over a particularly good spot, a tactic that makes her flop at the grass with her tail happily. You glove your [pc.cockHeadBiggest] in her unresisting throat with firm, gentle pushes time and again, glorying in the tightness there");
			if(pc.balls > 0) output(" whilst her tongue flicks over your [pc.balls]");
			output(" until it eventually becomes too much, and you unload gloriously, fluming [pc.cum] directly into her gut with heavy, juicy pulses.");
			output("\n\nYou plump the cowgirl’s belly out, withdraw to fill her mouth with [pc.cumVisc] approval, and when she can’t swallow anymore she milks the rest out with firm kneads of her smooth hands.");
			output("\n\n<i>“Yeah,”</i> she says, after she’s obediently licked your sensitive cum-slit clean, <i>“I don’t think output is gonna be a concern. Why don’t you go catch a shower now?”</i>");
			
			// + 2 hours, - 20 energy, + sweaty perk, + Lust
			processTime(105 + rand(31));
			pc.energy(-20);
			sweatyDebuff(1);
			pc.orgasm();
			
			// [pb]
			clearMenu();
			addButton(0, "Next", carrieMilkerBadEnd, "build it p3");
			break;
		case "build it p3":
			moveTo("NT SHOWER HOUSE");
			
			showLocationName();
			showBust("CARRIE");
			
			output("You do so, luxuriating under the hot water in the shower block. Void, this is all just so gratifying. You do good work in the " + (hours >= 6 && hours < 20 ? "sunshine" : "moonlight") + " and then you get a blow job from a bouncy cowgirl and then you can work in the " + (hours >= 6 && hours < 20 ? "sunshine" : "moonlight") + " some more. The prospect stretches out in front of you, as glorious and endless as the prairies themselves...");
			output("\n\nYou pause as you leave, grinning at the muffled strains of Horisha ruthlessly going at Peck with a strap-on (they put it on just for you, you’re sure). In the near distance, you can see your half-constructed building. A dozen things immediately stand out to you that need doing. You could go back. I mean, you haven’t got anything else that needs doing, do you?");
			
			// + 40 energy, - sweaty perk, - Lust
			processTime(35 + rand(16));
			pc.energy(40);
			pc.shower();
			
			// [Go Back] [Do You?]
			clearMenu();
			addButton(0, "Go Back", carrieMilkerBadEnd, "go back");
			addButton(1, "Do You?", carrieMilkerBadEnd, "do you");
			break;
		case "do you":
			showBust("CARRIE");
			
			output("You frown. Oh yeah. The quest thing. With your cousin and your dad and the rest of it. Funny how easily you forgot about all that.");
			output("\n\nReluctantly, you tear your eyes away from the tantalizing sight of the half-built bottling plant, and head back to the main barn.");
			
			processTime(25 + rand(11));
			
			if(flags["NT_BUILD_BOTTLE_PLANT"] < 1) flags["NT_BUILD_BOTTLE_PLANT"] = 1;
			currentLocation = "516";
			
			clearMenu();
			addButton(0, "Next", mainGameMenu);
			break;
		case "go back":
			moveTo("NT BOTTLE PLANT");
			
			showLocationName();
			showBust("CORA");
			
			output("Nope. Building that bottling plant is obviously the most important thing right now, and you’ve got the muscles and the will to do it. You nod with deep satisfaction, a certain indefinable tension falling away from you, as if something complicated and boring was being brushed out of your life.");
			output("\n\nYou work away at the building, the structure taking shape around you, deepest content filling your mind and body for hours on end. This time it’s Cora who comes to visit you, dragging a cask of iced tea with her. In-between necking it, you point out that you’re at the stage where cock milking machines could begin to be installed.");
			output("\n\n<i>“We talked to T about it,”</i> she replies, lying on her side, eyes traveling up and down your sweat-glazed frame. <i>“He’s ready to order some in, but he says he’s waiting on something.”</i>");
			output("\n\n<i>“On what?”</i> you grunt, [pc.eachCock] engorging as you watch her slowly unbutton her dungarees, allowing her milk-heavy tits to flop out, bumping into each other mesmerizingly.");
			output("\n\n<i>“Hmm... not entirely sure.”</i> Cora squeezes her nipples, a sigh escaping her full, glossy lips as she pools milk into her hands before carefully cupping it down her cleavage. She kneels in front of you, and without a word you slap your [pc.cockBiggest] into the river of warm cream now running between those full, luscious orbs. She looks up at you with a coy smile, fingers pressed into her soft flesh, reaching down to lick your [pc.cockHeadBiggest]. <i>“Commitment, I think.”</i>");
			
			// - 40 energy, + 4 hours
			processTime(225 + rand(31));
			pc.energy(-40);
			//sweatyDebuff(1);
			pc.lust(100);
			
			clearMenu();
			addButton(0, "Next", carrieMilkerBadEnd, "go back p1");
			break;
		case "go back p1":
			showBust("CORA_NUDE");
			
			output("After a long, luscious titjob ends with you spurting a [pc.cumColor], [pc.cumVisc] fountain right up her face and over her hair, you bend Cora over a wall and rail her plump, silky pussy until your name dissolves into wordless moos, wet walls tightening around the surge of your [pc.cockBiggest] again and again, fruity juices spattered right across your groin. You explode into fresh orgasm with a breathless groan, her big round ass jiggling with every forceful slap of your [pc.hips], pumping your flexing dick into her elastic squeeze until [pc.cum] is drooling onto the floor and your");
			if(pc.balls == 1) output(" [pc.balls] is");
			else if(pc.balls > 0) output(" [pc.balls] are");
			else output(" semen gland is");
			output(" achingly dry.");
			
			pc.cockChange();
			pc.orgasm();
			
			output("\n\n<i>“Mmm... such a stud,”</i> the auburn cow purrs, once her eyes have rolled back down and she’s located a towel. <i>“Do you need somewhere to sleep?”</i> she asks, standing with you in front of the construction site, looking at it as she buckles her dungarees back up. <i>“There’s plenty of spare bunks back behind the barn, ‘n you can get back to it after you’ve had a rest.”</i> A kind hand rests in the small of your back. <i>“C’mon, don’t want you over-exerting yourself - least not on something that isn’t me.”</i>");
			output("\n\nThat sounds wonderful. A nice long sleep - followed by a thrash in bed with some soft, pleasant someone, perhaps - then right back to all this work that needs doing. There’s so much of it, and it’s so pleasant to set your hands to it. And there is nothing more important to do. Nothing at all.");
			
			processTime(20 + rand(6));
			//sweatyDebuff(1);
			
			// [Yes] [Absolutely] [Definitely] [Lead the Way] [...wait]
			clearMenu();
			addButton(0, "Yes", carrieMilkerBadEnd, "bad end");
			addButton(1, "Absolutely", carrieMilkerBadEnd, "bad end");
			addButton(2, "Definitely", carrieMilkerBadEnd, "bad end");
			addButton(3, "Lead the Way", carrieMilkerBadEnd, "bad end");
			addButton(4, "...Wait", carrieMilkerBadEnd, "wait");
			break;
		case "wait":
			showBust("CORA_NUDE");
			
			output("You frown. There is something, isn’t there? You have to really work to pull your mind away from all that delicious manual labor and curvy cow girl in front of you, but grindingly you manage it, and when you do, you sigh in exasperation. Damnit. That whole quest thing. How tedious. How <i>complicated</i>. Still, yes - however reluctant you are to face up to it, it probably is a bit more important than building a semen storing facility singlehanded. You explain to Cora that you really should head back to your ship now. Her face falls, and a fresh blanket of heavy-heartedness descends.");
			output("\n\n<i>“Aww. You sure? Well - it will always be here, when you choose to come back,”</i> she says. <i>“Do kinda think we need a big, strong " + pc.mf("bull", "cowmazon") + " here for a while before T is willin’ to give his blessing to it, though.”</i>");
			output("\n\nYou head back to the main barn with her. The overwhelming reluctance does fade - but the memory of the unfinished building lingers.");
			
			processTime(25 + rand(11));
			
			if(flags["NT_BUILD_BOTTLE_PLANT"] < 2) flags["NT_BUILD_BOTTLE_PLANT"] = 2;
			currentLocation = "516";
			
			clearMenu();
			addButton(0, "Next", mainGameMenu);
			break;
		case "build it repeat":
			moveTo("NT BOTTLE PLANT");
			
			showLocationName();
			clearBust();
			
			output("<i>“I’ll come over with somethin’ nice when it’s my break,”</i> Carrie says with a big, happy smile as you stride purposefully eastwards. <i>“See ya soon!”</i>");
			output("\n\nIt takes you a while to familiarize yourself again with the tools and where the semen bottling facility-to-be is at, but once you do, you quickly fall into a familiar rhythm. Measure and haul and position and hammer and fit and smooth and screw and measure and haul and... it’s so satisfying, doing this out here in the green fields that seem to stretch out forever.");
			output("\n\n");
			// Male Treated:
			if(pc.isTreatedBull()) output("Being hard at work like this, getting sweaty under New Texas’s " + (hours >= 6 && hours < 20 ? "beaming sun" : "night sky") + ", fills you with a contentment that’s almost beyond words. You forget for long spells that there is anything beyond this, the profound satisfaction of using your bullish strength and technical ability to make something appear in front of you, and when you do it’s with a sense of irritation.");
			// Not Treated:
			else output("Satisfying. That’s the word. For a serene amount of time you completely lose yourself in the work, sweating away to slowly make something appear in front of you, and there is a deep contentment to be found in it. Is this how it is for Male Treated?");
			
			// + 4 hours, - 40 energy
			processTime(225 + rand(31));
			pc.energy(-40);
			sweatyDebuff(1);
			pc.lust(50);
			
			// scene carries on as from first
			pc.createStatusEffect("NT Build Bottle Plant Repeat");
			
			// [pb]
			clearMenu();
			addButton(0, "Next", carrieMilkerBadEnd, "build it p2");
			break;
		case "bad end":
			moveTo("NT BUNKHOUSE");
			
			showName("A NEW\nSTUD");
			showBust("CORA");
			
			if(pc.isMale() && !pc.isShemale()) output("Cora leads you to a male bunk house, adjoining the main barn on west side, before heading off with a squeeze of your hand to get herself cleaned up. The place is roomy and spacious by necessity, and sparsely populated - the young bulls there affirm that there aren’t all that many of them on T’s Ranch, and the ones that are mostly out getting laid. They are of course an amiable if not amazingly talkative bunch, and it’s easy to get on with them. The fittings are spartan and the smell of a number of bulls all together in one room leaves something to be desired, however. Spending a night there fills you with resolve - to build a suite for yourself into the bottling station. It will have a private bathroom and room for a king-sized bed. And a patio with a hot tub will adjoin it...");
			else output("Cora leads to a bunk house designed specifically for cowmazons. The place is roomy and spacious by necessity, and sparsely populated - the handful of giant women that work on T’s ranch mostly have their own places. The three here accept you but make it pretty damn clear where your territory ends and theirs begin; it’s obvious this strain of the Treated doesn’t take kindly to close competitors. Spending a night there fills you with resolve - to build a suite for yourself into the bottling station. It will have a private bathroom and room for a king-sized bed. And a patio with a hot tub will adjoin it...");
			
			processTime(45 + rand(16));
			// [pb]
			clearMenu();
			addButton(0, "Next", carrieMilkerBadEnd, "the end");
			break;
		case "the end":
			currentLocation = "NT BOTTLE PLANT";
			rooms["NT BOTTLE PLANT"].northExit = "NT BOTTLE PLANT NORTH";
			rooms["NT BOTTLE PLANT"].eastExit = "NT BOTTLE PLANT EAST";
			rooms["NT BOTTLE PLANT"].southExit = "NT BOTTLE PLANT SOUTH";
			rooms["NT BOTTLE PLANT"].addFlag(GLOBAL.NPC);
			rooms["516"].removeFlag(GLOBAL.NPC);
			generateMap();
			
			showName("A NEW\nSTUD");
			showBust("CARRIE_NUDE", "CORA_NUDE");
			
			output("Days stretch into weeks stretch into months, out and out towards the endless horizon. The bottling station expands and expands; with you in charge, Big T is happy to order in whole rows of dick milking machines, and you supervise their fitting. Whenever the thought of the quest to claim your father’s fortune intrudes, it’s an irritation, a gnat you bat away. Would all that money and running a mega-corporation really make you happy? Absolutely nowhere near as happy as you are putting the final touches to your sprawling New Texan estate, or getting [pc.eachCock] enthusiastically milked by Carrie and Cora every single night. Let your cousin have it. You know for a fact it won’t bring [rival.him] joy. Or make [rival.him] any less of an asshole.");
			if(!pc.isTreated()) output("\n\nOf course, after a short while, T himself visits and almost apologetically brings up the fact that in order to live here, you have to get Treated. No biggie. You’ve been here long enough, rubbing shoulders and sleeping with the Treated for so long, you practically feel like one anyway. You apply the medpen yourself, and the vague worry that you might " + ((pc.isMale() && !pc.isShemale()) ? "become a sissy fauxcow is quickly washed away in the glorious, muscular, horned glory of becoming a bull. Void, did manual labor feel good before? You had NO idea." : "become a regular cow is quickly washed away in the glorious if slightly febrile joy of becoming a big, toned, horned cowmazon. Because of <i>course</i> you did."));
			output("\n\nNaturally, you become the manager of the semen milking plant. You weren’t misinformed, it’s a pretty highly sought-after substance in a protein-hungry galaxy, and most of it gets lost down cowgirl holes. Fortunately you and your extremely productive");
			if(pc.balls > 0)
			{
				if(pc.balls == 1) output(" testicle");
				else output(" balls");
			}
			else
			{
				output(" dick");
				if(pc.cocks.length > 1) output("s");
			}
			output(" can step in whenever there’s a shortfall; you and your two pet redheads, with their expertise at wringing every last virile spurt out of you. Although New Texans play fast and loose with each other Carrie and Cora never find much call to wander far from the estate of a particularly popular, energetic and fecund " + ((pc.isMale() && !pc.isShemale()) ? "bull" : "amazon") + ", particularly after you swell both of their bellies with the first of many children. They are delighted with the silver “Property of Steele” bell collars you get them over the first Wintermess. It all turns out to be pretty profitable, and the parties you throw with all the other residents of the outsized ranch become the stuff of NT legend - so much so that T-Bone himself is often in situ, staggering around your veranda with a beer stein the size of a barrel in one hand and Ellie in the other.");
			output("\n\nThe very last time you think about your father’s quest is several years later. You are generously demonstrating the finer qualities of your factory’s output to a wealthy zel’rahn visitor interested in investing. Your eyes are fixed upon her red, upturned, jiggling bottom as you vigorously rail her across your desk, when the thought flies across your mind. You have to stop and laugh at the absurdity of it. There’s a sound of parting suction underneath the desk.");
			output("\n\n<i>“What is it, dear?”</i> asks Carrie curiously.");
			output("\n\n<i>“Oh, nothing, sweetheart,”</i> you sigh. You play with the remote in your hand, and are rewarded with a gasp and a coo from the cowgirl. Such a thoughtful gift that was from Ogram. <i>“Nothing at all. Carry on.”</i>");
			output("\n\nCarrie");
			if(pc.balls > 0) output(" slides her lips and tongue back over your [pc.balls]");
			else if(pc.cocks.length > 1) output(" parts her lips around the head of your [pc.cock " + (1 + rand(pc.cocks.length - 1)) + "]");
			else if(pc.hasVagina()) output(" slips her tongue back between the lips of your [pc.vagina]");
			else output(" parts her lips around the head of the rahn’s extended ovi-cock");
			output(" and you return to firmly slotting your [pc.cock] into the investor’s slick, oozing cunt, drawing a cooing moan from the quivering, partially clothed blancmange lady. The silly, over-complicated thought slips out of the window into the endlessly blue sky, never to return.");
			
			pc.removeEquipment();
			if(pc.credits < 9000) pc.credits = 9000 + rand(2000);
			
			if(pc.refractoryRate < 900) pc.refractoryRate = 900;
			if(pc.cumMultiplierRaw < 1000) pc.refractoryRate = 1000;
			pc.boostCum(9000);
			
			days += 1215 + rand(31);
			processTime(1440 + rand(1440));
			
			if(flags["NT_BUILD_BOTTLE_PLANT"] < 3) flags["NT_BUILD_BOTTLE_PLANT"] = 3;
			
			badEnd("THE END.");
			break;
		default:
			output("Oh no, something went wrong!");
			clearMenu();
			addButton(0, "Next", mainGameMenu);
			break;
	}
}

//trick Carrie into leaving and deposit a dose of parasitic seed for distribution
//daydream about creating a random cockvine foothold scenario while you do
	//meeting certain milestones on other planets unlocks new fantasies
//adds mean point(s) to personality score
//limit once per day; only available after noon
//requires both a cock @ crotch and a cockvine-type tail-cock (exclude non-cockvine types if added)
//requires PC has unlocked the cockvine entry in codex
//requires PC has used milker several times to indicate his prowess -- may require new flag?
	//at coder discretion, access may also require that the PC has seen Carrie's shower scene
	//at coder discretion, breaking the machine may reset the 'prowess' flag or put it into the negative
//button goes in same milker menu as the 'Use w/Carrie' and 'Use w/oCarrie' buttons
//button name: Parasite Deposit
//tooltip: Convince Carrie that she can trust you to be alone with the machine -- then dump a load of parasites in the stud stock with your tail.
//tooltip disabled, missing genitals: You need both a cock (to decoy) and a parasitic tail-cock to do this.
//tooltip disabled, not enough previous uses: Carrie's not supposed to take off and leave someone alone with the milker. If you want to drop a load of parasites into the stud stock without being caught, you should get more uses in so she trusts you.

//note motes:
//-Carrie usually stays during, even if PC asks her not to be involved
//-Carrie starts and stops the machine via a button on the wall
//-there's an 'occupied' sign on the door that Carrie turns on when in-session

public function carrieCockTailSneakyDeaky():void
{
	clearOutput();
	author("Zeikfried");
	pc.addHard(1);
	showName("MILKER\nMISCHIEF");
	if(pc.isBro()) output("<i>“Ya look tired,”</i> you say.");
	else if(pc.isBimbo() || pc.isNice()) 
	{
		output("<i>“You look tired, ");
		if(pc.isBimbo()) output("hon’");
		else output("Carrie");
		output(",”</i> you say. <i>“Have you had a break recently?”</i>");
	}
	else output("<i>“You’re looking worn out, Carrie. Have they been working you hard?”</i> you ask.");

	output("\n\nCarrie smiles patiently. <i>“I could use a gap and stretch for sure,”</i> she answers. <i>“I been cooped up in here a while.”</i>");
	if(pc.isBro()) output("\n\n<i>“‘How about starting me and taking off?”</i>");
	else
	{
		output("\n\n<i>“So");
		if(pc.isBimbo()) output(", like,");
		output(" why don’t you get me started and then you can step out?”</i>");
	}
	output(" you ask, trying to sound earnest and well-intentioned.");
	output("\n\n<i>“Haha, nah.”</i> She sighs. <i>“I wish I could, but I’m supposed to stay with the machine when someone’s using it.”</i>");
	output("\n\n<i>“Well, </i>I<i> know that,”</i> you reply. ");
	if(pc.isBro()) output("<i>“But I know where the off switch is, too.”</i>");
	else if(pc.isBimbo()) output("<i>“But, like, you’ve seen me use it enough that you know I can handle it, right?”</i>");
	else output("<i>“You say it all the time. But </i>you<i> know I’ve used the machine enough to know how it works by now, and how to cut it off if there’s trouble. So it’s not like there’s a real danger.”</i>");
	output("\n\nThe cowgirl hems and haws for a minute, but her face starts to soften. <i>“Well... I suppose I could lock the door so no one can see or come in. Would you be okay with that?”</i>");
	output("\n\nYou pretend to consider, then nod.");
	if(pc.isBro()) output(" <i>“Sure.”</i>");

	output("\n\nCarrie smiles bashfully. <i>“Okay. I’m counting on you,”</i> she says. She gestures at you, and you quickly ");
	if(!pc.isCrotchExposed() && !pc.isAssExposed()) output("strip and ");
	output("insert your cock");
	if(pc.cockTotal() > 1) output("s");
	output(", already erect, into the receiver. Carrie doesn’t let your arousal pass without comment. <i>“Been lookin’ forward to this, have you?”</i>");

	output("\n\nWithout waiting for an answer, she engages the milker. The imposing mechanical arm swings into position behind you, bringing the absurd dildo affectionately called ‘Mr. Floppycock’ right up to your [pc.asshole].");
	//(low ass wet)
	if(pc.ass.wetness() < 1) output(" Thoughtfully, Carrie pauses the action to apply a bit of lubrication to the massive prong before she shoves it into you.");
	else output(" Carrie watches carefully, ready to pause and apply lubrication, but you take the dildo without a peep; the stunned cowgirl’s finger hovers over the control dumbly as the toy hilts in your welcoming asshole.");
	//anal stretch check here
	pc.buttChange(Math.round(pc.analCapacity()/2),true,true,false);
	output(" As soon as you look comfortable with the penetration, she turns on the strokes.");

	output("\n\n<i>“Um, you’re set up, so... have fun and be safe, I guess!”</i> Carrie cheers, as the robotic arm ramps up. <i>“I’ll be back in fifteen minutes to turn you off.”</i> The cowgirl switches the room’s sign to ‘Occupied’ and then, glancing back nervously, slips out. A ‘click’ sounds from the door - she’s just locked it. Perfect.");

	output("\n\nYou push through the machine-induced fog of pleasure, reaching out to your tail, extending the perverted parasite and forcing it inside one of the ports before you abandon yourself to the soft, synthetic pussy and smooth strokes. Strange desires trickle into your thoughts unbidden - images of your parasitic seed impregnating faces and places you know - and you relax and allow yourself to daydream while the machine extracts your tainted load.");

	//pick a fantasy randomly from the following list
	//New Texas fallback if PC does not qualify for other scenes
	//Tavros Station fallback if PC does not qualify for other scenes
	var fantasies:Array = [2,3];
	var x:int = 0;
	var cumTotal:Number = pc.cumQ();
	//Mhen’gan fantasy requires PC knows about Penny’s crush on Flahne and both are still on Mhen’ga (not followers)
	if(flags["FLAHNE_TALKED_ABOUT_CUMSLUTPENNY"] != undefined && flags["PENNY_IS_A_CUMSLUT"] != undefined && !pennyIsCrew()) fantasies.push(0);
	//Myrelli fantasy requires PC has toured the Gildenmere thollum
	if(flags["THOLLUM_TOURED"] != undefined) fantasies.push(1);
	
	//store the fantasy chosen in memory until the entire scene ends
	x = rand(fantasies.length);
	fantasyOutput(fantasies,x);
	//Remove used fantasy
	fantasies.splice(x,1);

	//after first fantasy ends, resume here
	output("\n\nYour fantasy makes you cum, hard. [pc.EachCock]");
	if(pc.cumQ() < 10) output(" sprinkles a few drops");
	else if(pc.cumQ() < 200) output(" spurts a few ropes");
	else output(" sprays a flood");
	output(" of [pc.cum] into the collector; alongside ");
	if(pc.cockTotal() == 1) output("it");
	else output("them");
	output(", your tail jerks and unloads, dumping a stream of parasites. The flexible toy in your ass continues pounding at your pucker, stroking your prostate and keeping you hard; after a few minutes of non-restful rest, the strokes begin to stir your lusts again. New, arousing images begin to swim through your thoughts, syncretizing into more fantasies.");
	pc.orgasm();
	cumTotal += pc.cumQ();
	//pick and output another, different fantasy from the list above (i.e. excluding the first fantasy chosen in this session)
	//store this fantasy in memory until scene ends as well
	var y:int = rand(fantasies.length);
	fantasyOutput(fantasies,y);
	//Remove used fantasy
	fantasies.splice(y,1);

	//after 2nd fantasy ends
	output("\n\nAgain the machine and your perverted imagination bring you to climax, and again a double load of seed spills from you. You dump stroke after stroke of [pc.cum]; your [pc.tailCock] works overtime and spurts a load of parasites almost as large as the first, ");
	if(pc.cumQ() < 20) output("much more resilient than your spent [pc.balls]");
	else output("though it’s still nowhere near the volume produced by your [pc.balls]");
	output(". As the joy recedes, more quickly this time, you suspect that your alone time is almost up.");

	output("\n\nThe machine continues to pound; it’s a struggle to pull your tail free and force the parasite back into concealment. You’re at the robot arm’s mercy for a couple minutes more, drawn part-way toward another orgasm, until a click from the door interrupts your troubled, sore bliss.");

	output("\n\n<i>“Hey,”</i> Carrie says, slipping into the stall again. <i>“Ready to stop?”</i>");
	output("\n\nYou agree, and Carrie turns the machine off. The floppy synthetic withdraws, freeing you to extract your chafed cock and collapse gratefully on the receiver.");
	output("\n\n<i>“Wow,”</i> Carrie remarks, looking at the machine’s display. <i>“You came ");
	if(pc.cumQ() < 1000) output("a lot");
	else output("a little");
	output(" more than usual. I’m almost jealous of the machine....”</i>");

	if(x == 2 || y == 2)
	{
		output("\n\n<i>“I was thinking about you,”</i> you flirt, brazenly.");
		output("\n\nThe cowgirl’s fair skin blushes red. <i>“Oh yeah? Maybe next time I’ll stick around and you can tell me what’s on your mind.”</i>");
	}
	else output(" She brings up the disposal option and looks at you hopefully. <i>“You thinkin’ to destroy this load, or are you gonna let me make some lucky girls very, very happy?”</i>");
	output("\n\nYou smile and nod. Carrie will never find out the reason you’re eager for her to distribute your sperm... at least, probably not.");
	processTime(20);
	IncrementFlag("NT_TAILCOCK_MILKINGS");
	pc.orgasm();
	pc.lust(10);
	//end
	//do two pc orgasms, place pc wherever he goes after male milking
	//add some lust since Carrie wasn't there to shut off the machine right after orgasm
	//set the timer/flag that limits scene to once per day
	pc.createStatusEffect("NT_TAILCOCK_MILK_CD", 0, 0, 0, 0, true, "", "", false, 24*60);
	StatTracking.track("milkers/prostate milker uses");
	StatTracking.track("milkers/cum milked", cumTotal);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function fantasyOutput(fantasies:Array,x:int):void
{
	//Mhen’gan fantasy requires PC knows about Penny’s crush on Flahne and both are still on Mhen’ga (not followers)
	if(fantasies[x] == 0)
	{
		output("\n\nYou imagine your parasitic offspring arriving on Mhen’ga, carried perhaps by single immigrants who bought New Texas kits, yearning to start a family. Impossible to contain, the seedlings escape the primitive settlement and establish a population in the lush jungle. From there, they prey on natives and inexperienced rushers alike until the UGC, inundated with demands, orders their local enforcers to make a token effort at control.");
		output("\n\nYou fantasize about Penny, reading the directive and sighing as she picks up her weapon, and fast forward to the poor girl surrounded by cockvines, defeated and penetrated, infested by a seedling that takes root in her gorgeous, plush tail; you picture her watching initially with horror and then with arousal as the thick, drooling phallus emerges from her brush for the first time and makes a beeline for her gaping pussy, to fill Penny with pleasure and parasites alike. The proud ");
		if(penny.hasCock()) output("herm");
		else output("woman");
		output(" would insist on keeping her infestation secret, of course, embarrassed but unwilling to give up the pleasure.");

		output("\n\nOf course, a secret is no fun unless shared... Penny wouldn’t be able to endure it if she couldn’t use her new cock with Flahne, fucking whenever she can get time off, dumping load after load into the slutty rahn. And most of the seed would be digested harmlessly, yes, but... you imagine a few hardy mutations among the billions and billions of Penny’s spores managing to take root after months of lovemaking, growing like bacteria in agar, combining with the gooey woman. You picture her translucent body discolored by verdant growth deep inside that slowly forces out the orange, blossoming and spreading until her goopy locks turn leafy and green. And then, one day, a cute female rusher blunders into the office while cockvine-Flahne is playing with herself, and the shameless rahn coaxes the blithe girl into a one-night stand. As the two climax together, Flahne’s ovipositor unloads the first of a new generation of hybrids into her lover....");
	}
	//Myrelli fantasy requires PC has toured the Gildenmere thollum
	else if(fantasies[x] == 1)
	{
		output("\n\nYou imagine your seed piggybacking all the way to Myrellion itself, undoing at a stroke the governments’ efforts to keep cockvines out of the cities as pregnant off-worlders unleash seedlings in the streets and hospitals. You imagine the citizens so infested that the ruling myr give up on containment and try to control the damage by restricting the vines like a recreational drug. A counter-culture springs up among the myr youth; cultish sex parties where the infested introduce their parasites to curious myr girls just recently graduated from under their teachers’ thumbs.");
		output("\n\nMost of the graduates are nervous and stiff, still as statues as they experience their first penetration, but a few impatient and adventuresome girls have clearly been sneaking out on their own. Their body language is relaxed and welcoming and they shift in time with their partners, enjoying the sex. You imagine one slutty young lady in particular that’s so bloated with ‘impregnations’ that her abdomen is almost perfectly round, swollen with incubating parasites until it strains at her chitin. She lies on her back, too cumbersome to be taken from behind, gazing affectionately up at her lover. On her chest, two tiny, flat breasts are growing in beneath the larger first pair - her body, confused by the sheer number of false pregnancies, is developing into a queen’s. The lewd girl rubs her puffy nipples with all four hands and drools nectar between her fingers, giggling as her lover tenses up and drops another load into her gaped pussy.");
		output("\n\nNext to the false queen is a nervous virgin myr, on hands and knees. Though her own lover is curled over her abdomen, working her tight pussy with a veiny vine prick, the virgin’s eyes are firmly fixed on the parasite queen. You imagine her watching with honest admiration and envy as the horny queen locks her legs around her mate, demanding another fuck even as the seed of the first spills from her overstuffed cunt. As she watches the queen’s lover haltingly begin to move again, the virgin girl’s hips shift in time, giving vent to her secret perversions. Before long, her partner bends over her back and twitches; the ex-virgin’s eyes shut tight and she bites her lip in anxious pleasure as the parasite ejaculate hits her cervix....");
	}
	//New Texas fallback if PC does not qualify for other scenes
	else if(fantasies[x] == 2)
	{
		output("\n\nYour mind wanders to a fantasy of your spawn overtaking New Texas, distributed to a brood of eager wannabe mothers, ‘birthing’ in such numbers that wildlife control officers can’t stay on top of the rooting vines. With nearly everyone on New Texas sporting a cow-tail, the immature specimens have no shortage of hiding places either; a low-level struggle develops as common sense and government try to maintain control over Treated brains high on the rushes of pleasure that vines provide. You picture an uprising of Treated and tainted sex addicts wresting control from the ranch managers, content to indulge their parasites and genitals rather than work all day. The dominant business model shifts from agriculture to exotic sex tourism, and the fields grow over with cockvines to the point that a new industry actually springs up to figure out what to <i>do</i> with all this cockvine sperm....");
		output("\n\nYou imagine yourself returning to New Texas after a year and taking in the changes. A new health food store-<i>cum</i>-sex club is the center attraction; ‘healthy’ cockvine salads and veggie-sperm-seasoned drinks are advertised prominently. Rowdy tourists of both sexes catcall and solicit the cowgirls standing outside, who no longer even bother to hide their throbbing vine-cocks; they accept propositions with very little negotiation. Several couples are making love in the open, exerting the barest effort to stay out of the walkways. You see Treated whores with both male and female tourists, taking cock or fucking pussy with their parasites. New medical tents have been set up outside the spaceport, for visitors who don’t want to carry their cockvine pregnancies off-world, but many of the departing women walk right by - after all, it takes a very specific type of pervert to choose <i>this</i> brochure when planning a sexcapade. Strangely, most of the native males are missing... until you look over to the fields. The men are ‘working’ among orderly rows of cockvine plants; each one is naked from the waist down and stroking a cock and balls swollen too big to fit even a queen leithan. When one stops next to a cockvine, he slips his tail-cock inside his ass, stimulating his prostate until he blows a huge, nourishing load over the plant’s roots. Alternatively, behind each tailless male, a woman or herm follows, doing the same job with moans of pleasure. Several new faces are among the workers... tourists who enjoyed themselves so much they took the Treatment and stayed.");
		output("\n\nThe blur of activity dies down near the old barn. All of the milking stalls but Carrie’s are empty - her door is slightly ajar, and you can hear a loud moan building within that dies back as you get close. You find the cowgirl nude, bent over her male milker with her ass high, taking the huge dildo in her vagina and shaking out an orgasm. You hit the cutoff, and the dildo pulls out, covered in a thick sheen of pussy juice. Her eyes take a while to focus; you wonder just how long she’s been using the machine.");
		output("\n\nWhen she finally engages with reality, Carrie bashfully grins and explains that nobody uses the male milkers anymore since all the men are in the fields. She’s been putting off taking a parasite and is trying to keep the traditional business running, but it’s such rough going that, well... Carrie pulls halfway away from the machine and you see the shaft of a red, chafed cock jutting from her crotch. Looks like she’s been supplementing the deposits herself, with the help of ");
		if(CodexManager.entryUnlocked("Throbb")) output("illegal Throbb injections");
		else output("some drug");
		output(". She offers you a session for old times’ sake, but her swollen, gaped pussy stirs an urge of another kind. As Carrie tries to push off of the machine with her limp arms, you step in and hold her down. The cowgirl understands quickly when your [pc.cockHead] rubs against her puffy labia - she nods and her eyes begin to glaze over again. You slip inside, but even your [pc.cockBiggest] can’t fill her after a year with ‘Mr. Floppycock’... your tail easily slips inside too, double-teaming her. If Carrie notices that you’ve put in one of the parasites she’s been trying to avoid, she says nothing. You ride her hard, mashing her breasts against the milker receiver, and feel the oversexed nu-herm cum under you. As she dumps yet another load into the tank, you deposit your own in her pussy... along with a squirt from the grand-daddy parasite that started the whole mess.");
	}
	//Tavros Station fallback if PC does not qualify for other scenes
	else if(fantasies[x] == 3)
	{
		output("\n\nYour mind wanders to your last time on Tavros station... to all the well-to-do women, artificially young and beautiful, vacationing in the high-class residential sections for a taste of the spacer’s life and studiously avoiding the opportunity to mingle with actual explorers. One spoiled young Venus walks from your vault of memory, with gorgeous blue eyes and straight brown hair, slim and elegant in her million-" + (isAprilFools() ? "dogecoin" : "credit") + " sundress. You’re sure you must’ve caught a brief glimpse of her on the streets; a woman like that sniffs at bars and would never look twice at a lowly rusher. A child of high finance; a trust fund baby, killing time by breaking hearts and playing at adventure until daddy dies and leaves her a company to run.");
		output("\n\nYou imagine your spoiled princess ordering an insemination kit from New Texas, fooling herself that she’s doing it to continue the family name but really just wanting a baby to entertain her. When your parasite spawn pops out several months earlier than a child, it takes her by surprise in her nice bed. Before she can do anything, it attaches. Pull and pull as she might, her new tail won’t come off - and when the nerve connection establishes, her pulling takes on a different urgency. Her first cumshot is truly world-changing; daddy’s girl spends a week inside, blowing off dates and phone calls and just masturbating until her hands chafe, flooding her brain with the parasite’s hormones and fantasies.");
		output("\n\nIn your daydream, jerking off can only satisfy for so long; soon your convert goes on the prowl. Where she used to avoid the low dives full of spacers, now she seeks them out. In a cute, slutty halter top and hip-hugger pants, green vine curling excitably over her ass, she chats up planet rushers at the bar, charming them with her boughten beauty and selecting only those women and herms headed off-station before the parasitic pregnancies will show. ");
		if(pc.hasVagina()) output("You imagine catching her eye in one such bar. She gives you the flirty smile of a shyster spotting a mark and saunters over to your table, making small talk and ensuring you see the string of her skimpy thong rising above her pant waist. When you tell her that you’ll be blasting soon, she leans in and breathlessly offers a night of pleasure before you go. She takes you to a room rented under a fake name and there shows you her gorgeous body. Your tainted princess expects surprise when her tail blooms to reveal the throbbing phallus attached to her lovely female form, and you play along, letting her romance you and convince you to lie back and allow her to do all the work. As she idly strokes your neglected [pc.cockNounSimple] and it spurts over her teardrop breasts, her first load of many hits your cervix....");
		else output("Giving out a fake name, she brings her mark to a rented room. She becomes a very talented liar, passing off the throbbing cock in her tail as an exotic body mod. As the poor rusher girl reclines and shudders in orgasm, your tainted princess deposits a load of your parasitic grandchildren in the girl’s pussy... the first load of many.");
	}
	//end of fantasy list
}

public function cameronCockMilker():void
{
	clearOutput();
	clearMenu();
	author("Savin");
	showName("CARRIE\n& CAMERON");
	showBust("CAMERON_NUDE", "CARRIE");
	
	output("As you open the door to head into the milker’s stall, you hear voices inside: Carrie’s, of course, and another feminine voice. At first, you think it might be ");
	if (flags["CORA_SUCKED"] != undefined) output("her sister");
	else if (flags["MET_ZEPHYR"] != undefined) output("Zephyr");
	else output("a futa cow-girl");
	output(", but when you throw open the door and saunter in, you find the familiar figure of an effete cow-boi bending over with his overalls half-off, his thick, spankable booty pushed out in your direction.");
	output("\n\n<i>“O-oh! Hey, uh, howdy [pc.name],”</i> Cameron half-chuckles, winking at you between his legs. His slender bovine tail swishes, rising submissively as you draw near.");
	output("\n\n<i>“Oh shucks, I guess I forgot to lock the door. Hi, [pc.name],”</i> Carrie says, bouncing on her heels. <i>“Gonna have to wait for a bit if you wanna use the milker. Cam here’s just about to strap in.”</i>");
	output("\n\nCam blushes a little, though you can see the slab of meat between his legs twitching as he pulls his overalls down, showing his dark donut to you and Carrie. The milker attendant dutifully grabs a bottle of lube and snaps on a glove, telling Cameron to climb onto the machine. She gives you a saucy look while the little faux-cow gets ready, and uses her thumbs to pry apart his soft ass-cheeks, almost invitingly...");
	
	pc.lust(10);
	pc.createStatusEffect("Cameron Milker Cooldown", 0, 0, 0, 0, true, "", "", false, 24*60);
	
	addButton(0, "Participate", megaMilkCameron, undefined, "Participate", "You’re sure Cam wouldn’t mind you spending a little quality time together, just the three of you.");
	addButton(1, "Leave", imLactoseIntolerant, undefined, "Leave", "You’ll come back later...");
}

public function imLactoseIntolerant():void
{
	clearOutput();
	clearMenu();
	author("Savin");
	showName("CARRIE\n& CAMERON");
	showBust("CAMERON_NUDE", "CARRIE");
	
	output("You shake your head and turn to leave. You’ve got better things to do than watch Cameron get reamed.");
	output("\n\n<i>“Oh well,”</i> Carrie sighs, before delivering a sharp slap to the faux-cow’s ass. <i>“Don’t even think about getting soft, mister!”</i>");
	
	//Disable entering male milker while he's getting his bum beaten up
	processTime(5);
	pc.createStatusEffect("Cameron Getting Milked", 0, 0, 0, 0, true, "", "", false, 60);
	currentLocation = "511";
	addButton(0, "Next", mainGameMenu, undefined, "", "");
}

public function megaMilkCameron():void
{
	clearOutput();
	clearMenu();
	author("Savin");
	showName("CARRIE\n& CAMERON");
	showBust("CAMERON_NUDE", "CARRIE_NUDE");
	
	output("You take her up on the invitation, locking the stall door behind you and sauntering on over to the milker station. Cameron looks at you over his shoulder, eyes wide in surprise, until Carrie reaches down and grabs his cock, wrapping her slender, gloved fingers around his thick equine shaft. ");
	output("\n\n<i>“Stop squirmin’, Cam,”</i> she chides, her voice taking on a much more authoritative, matronly tone than you’re familiar with. <i>“Or that trappy little pony cock of yours is gonna end up shootin’ all over.”</i>");
	output("\n\nCameron whines, but eventually Carrie’s able to guide his semi-hard shaft into the proper receptacle. Once she’s fastened the suction cup to his flared crown, Carrie squirts a healthy glob of lube onto the palm of her glove and starts spreading it around Cam’s ass, swirling two fingers around his tailhole to make sure it’s nice and coated. When it is, Carrie handily slides her digits right into Cameron’s pucker, making the cow-boi squeal and buck his hips against the harness. ");
	output("\n\n<i>“Good boy,”</i> Carrie whispers, starting to move her hand. <i>“Just relax that little cock-hole for me, ‘kay?”</i>");
	output("\n\nTurning to you with a little smirk, she adds, <i>“Cam here’s one of my most regular donors,”</i> she tells you, still thrusting her fingers into Cameron’s ass. <i>“His ass is more sensitive than my pussy, and I’m pretty sure his Treatment got rid of his refractory. These balls of his are my succulent little cum-pumps until they’re drained so dry, you’d think he’s got a pair of raisins down there.”</i>");
	output("\n\nAs she’s speaking, Carrie’s other hand reaches down and cups Cam’s balls, caressing the plump black orbs as tenderly as her other hand is rough. As if on cue, Cameron’s body tenses, he sucks in a sharp breath, and lets it out with a long, lurid moan. You look under the rig and see his dick throbbing in the sheath, spilling a thick wad straight down the collection tube. You her a wet sound from his butt, and look back to see his donut clinging to Carrie’s fingers like he’s trying to pull her whole fist in there. ");
	output("\n\n<i>“I think he’s ready for something more... masculine,”</i> Carrie purrs, reaching over and running her other hand over your crotch. <i>“Think you can help him out with that?”</i>");
	output("\n\nYou’re already " + (pc.isCrotchExposed() ? "slapping Carrie’s bare thigh with your rock-hard erection," : "fishing out your cock out, throbbing with need and") + " raring to go. Grinning devilishly, the milker-maid guides you by the dick over to the whimpering cow-trap, lining your [pc.cockHead] up with his lube-slathered hole. You swing a [pc.leg] over the machine and grab Cameron’s girly hips, rolling your [pc.hips] forward spreading that slutty cock-hole of his open around your crown. Cam whimpers and leaks more of his juicy dickmilk into the sucker attached to his shaft, pushing his ass back against you until you feel a wet, silky grip start sliding up your own length, and your cock starts sinking into Cam’s boypussy.");
	if (pc.cocks[0].cLength() >= 18) output("\n\n<i>“You’re way thicker than the stimulator,”</i> Carrie giggles, patting your dick as you pump it into Cameron. <i>“I bet you’ll get his biggest load ever, [pc.name]!”</i> ");
	else output("\n\n<i>“A real dick’s always better than a milker,”</i> Carrie giggles, patting your [pc.butt] as you pump Cameron’s ass. <i>“He’s been teasing me about getting a dick of my own so I could treat him like this, but like, why when I’ve got big studs like you to come in here and ream this little cow for me?”</i>");
	output("\n\nWordlessly, you grab Carrie by the waist and pull her against your [pc.chest], thrusting your [pc.tongue] into her mouth. She moans and unlaces her cow-pattern corset, letting those big, milky hugs of hers spill out. One of her hands slips down around your [pc.butt] in turn, finding its way to your ass. She’s still got some slick lube clinging to her fingers, and you feel the rush of cold around your own hole before a finger slips in.");
	output("\n\n<i>“It’s still my job,”</i> Carrie titters, moving her digits to find your anal g-spot. <i>“Besides, Cam’s not the only one here who likes a little attention back here, is he?”</i>");
	output("\n\nYou grin and bear it, feeling her fingers worm their way in to the third knuckle. She happily teases your prostate with little rubs and caresses until you feel that familiar, churning pressure in your [pc.balls], and your dick throbs inside the faux-cow’s lurid hole. ");
	output("\n\n<i>“I-I can feel it coming!”</i> Cam whines, pushing his plush booty back against your crotch. <i>“It’s leakin’ out already!”</i>");
	output("\n\nYou’re not sure if Cameron’s talking about his orgasm or yours, but you guess it doesn’t really matter -- either way, you’re soon pouring your [pc.cumNoun] into his gaping backside, and he’s squealing and leaking his own second -- or is it third now? -- orgasm into the milker. Carrie coos delightedly and pats his butt, telling him what a good little cum-dump he is, and how much nice, juicy spunk he’s making for her. The cow’s practically drooling, watching both of you orgasming together, blowing so much musky boy-goo into Cam and the milker machine that any good New Texan girl would probably cream herself on the spot just from smelling it.");
	output("\n\n" + (pc.isTreated() ? "Knowing you’re right" : "Just to see if you’re right") + ", you shift your hand down from her hip and into her little thong, sliding two fingers straight into her quim. Your digits sink into depths that are the perfect mix of hot, juicy, and tight, and you can feel the bovine-morphed beauty squeeze for you, massaging your fingers with the same insistent tenderness that she’s working your ass with. You eventually pick the lusty bovine up and plant her on Cam’s back, pushing the poor trap deeper into the milker’s clutches while you spread his attendant’s legs over his ass, making it easy to pull from one clenching kiester into another" + (pc.totalCocks() > 1 ? ", plugging Cam’s hole with your second dick" : "") + ". Carrie gasps, yelps, and then moans as your dick slides into her butt" + (pc.cocks[0].cLength() >= 18 ? ", making her belly swell with the girth of cockflesh barreling into her body" : "") + ".");
	output("\n\n<i>“Little treat for a hard-workin’ girl,”</i> you tell her, easing yourself in to the hilt. Carrie can only moan breathlessly, unable to form words as pleasure rocks her plush, curvy body. ");
	output("\n\nUnderneath her, the faux-cow leaks your seed back onto the milker’s harness" + (pc.totalCocks() > 1 ? " from around your second schlong" : "") + ", prompting you to " + (pc.totalCocks() > 1 ? "start moving your hips, fucking his spunk-lubed ass and Carrie’s at the same time" : "thrust a few fingers into his winking donut, pleasuring it while you start thrusting into Carrie") + ". Before long, the two cows are moaning in unison, undulating atop one another and cumming their collective Treated brains out. The milker machine whirs and pumps loudly, sucking away the bull-boi’s many loads into its processing tanks. You can see the veins pulsing in Cameron’s taut black ballsack; the two cum-swollen orbs twitch and contract with every messy orgasm, pumping what seems like gallons of bull-cream down the funnel. And his ass... oh, that sweet hole’s clenching like mad, squeezing down on you like his life depends on it. The faux-cow’s got a prostate that feels as big as a pea, pressing against your " + (pc.totalCocks() > 1 ? "dick" : "fingers") + ", and letting you rub on it with every little motion. And every caress on that anal clit of his works out a thicker wad of cum, shooting from Cam’s turgid pony shaft to the beat of your thrusts. You’re not even sure if he’s having separate orgasms anymore, the way he’s unloading those nuts: it seems more like one continuous climax that’s slowly draining him dry.");
	output("\n\nAnd Carrie’s about to drain <i>you</i> dry! The cow-girl plush rump has perfectly molded itself to your [pc.cock], and her pussy’s squirting arcs of fem-cum, splattering your dick with more and more lube at the nadir of every thrust. Of course, every New Texan girl’s a pro at taking dick -- thanks to the Treatment, if not from thousands of hours of practice -- and Carrie’s obviously no exception. Even if she’s not able to get at your [pc.asshole] anymore, she’s still able to milk you to orgasm with her own. ");
	output("\n\nWith a feral growl, you slam yourself into the hilt in the cow " + (pc.totalCocks() > 1 ? "and the faux-cow " : "") + "before another parting orgasm hits, flooding " + (pc.totalCocks() > 1 ? "their assholes" : "Carrie’s ass") + " with [pc.cum]. A jet of milk erupts from the cow-girl’s swollen breasts, followed by an undulating moo of pleasure as she cums in your wake.");
	output("\n\n<i>“Whew, you two really... cum... words... mmm,”</i> Carrie moans as you pull out, reaching down and scooping up a handful of cum leaking out of her gaping hole. She licks it up with a blissful, contented smile on her full lips, eyes drooping heavily with cum-fueled contentment. You step back, admiring your spunk-soaked work: two cows sprawling atop one another, leaking your seed and quivering with lingering orgasms. You deliver a parting slap to Cam’s ass, causing the mewling trap to bust yet another nut into the milker as you turn and head out.");
	
	IncrementFlag("CAMERON_MILKED");
	processTime(30 + rand(10));
	pc.orgasm();
	currentLocation = "511";
	addButton(0, "Next", mainGameMenu, undefined, "", "");
}