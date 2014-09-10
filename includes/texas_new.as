//Landing on New Texas (First Time)
function landOnNewTexas():void
{
	if(flags["LANDED_ON_TEXAS"] == undefined)
	{
		flags["LANDED_ON_TEXAS"] = 1;
		CodexManager.unlockEntry("The Treatment");
		output("A bright green world comes into view ahead: a planet of small, scattered oceans, rolling plains, and clear weather. At first glance, New Texas looks like a male paradise world, peaceful and idyllic. The space lanes around the planet are mostly clear, letting you punch in the auto-lander and sit back as your ship’s computers guide you down to the surface. The clouds roll past you as your ship cruises down toward the largest continent.");
		output("\n\nYour auto-nav guides you down toward the most popular tourist spot on the planet, a particularly large ranch owned by the planetary governor. You bring up a few articles on the place: the extranet is full of holo-pics of busty, bovine-like human girls milling about the ranch, as well as reviews of an amazing barbeque joint and a something simply called the Treatment, which has all but made the planet what it is today. A whole planetary society based on gene mods... interesting.");
		output("\n\nThe computer alerts you to imminent landing. You cast a glance out your viewscreen just in time to see a monolithic barn coming into view, easily the size of two city blocks back to back on each side. As you approach, the roof of the barn shudders and begins to split, separated by two massive hydraulic arms that create an opening wide enough for a frigate to pass through. Your ship slows, guided in by the automatic docking protocols as it passes between the raised slates of the barn-dock’s roof. Inside, you can see a handful smaller cargo haulers and touristy passenger ships docked below, each pulled into an oversized, self-contained “<i>stall.</i>” You feel a slight shudder in the deck as your ship lands on the hay-covered floor, quickly surrounded by several buff, burly dock workers, each with a pair of bull horns growing from his head. ");
		output("\n\nA heavy loader latches onto your ship, dragging it into a stall as you gather your gear and prepare to head out. Your docking ramp touches down just as the suit releases your ship. Several of the buff, bovine men working nearby give you ");
		if(pc.mf("dude","chick") == "dude") output("friendly nods");
		else output("askance, hungry looks");
		output(" as you disembark. A sign nearby points you to “<i>Customs and Visitor Check-in.</i>”");
	}
	else output("You fly to New Texas and step out of your ship.");
}



//output("\n\nCustoms & Check-in");
//output("\n\nRoom Description");
function customsAndCheckInOnNewTexas():Boolean
{
	clearOutput();
	author("Savin");
	output("The Customs and Visitor Check-in office dominates the only passage between the spaceport and the ranch proper, ensuring anybody coming or going gets a proper screening. Two desks are set up, facing each other across the thoroughfare: one is labeled “<i>Customs and Weapons Check,</i>” the other, “<i>Visitor Check-in.</i>” Very straightforward. ");
	//{If First time going through:}
	if(flags["NEW_TEXAN_CUSTOMS_MET"] == undefined)
	{
		output("\n\nA broad-chested, muscular bull-man is sitting lazily behind the Customs desk, leaning back in his chair and staring off into space. When he sees you, he sits up a little straighter, though in so doing he gasps a bit. Something seems to be distracting him, though you can’t see what... “<i>Ah. Sorry, slow day. Come on over, let’s get you checked out.</i>”");
		//[Customs Officer]
		addButton(0,"Customs",approachCustomsFirstTime);
	}
	//Customs (Refused to Disarm)
	else if(flags["REFUSED_TEXAN_DISARM"] != undefined)
	{
		output("\n\n“<i>Changed your mind yet?</i>” Ogram says, picking up a clipboard full of paperwork for you.");
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
function approachCustomsFirstTime():void
{
	clearOutput();
	output("You approach the bull-man behind the desk. He looks human enough at first glance, if abnormally tall, muscular, and broad-chested. Up close, though, you can get a good look at the massive pair of bull horns sticking up on either side of his blue cap, and the mat of thick, dark hair poking out from his long sleeves and over the hem of his undershirt. He’s dressed in old-school corporate security getup: blue pants and shirt, with a ballistic vest strapped tight to his barrel chest, barely hanging in there thanks to his size. Pinned to his vest is a tag reading, “<i>Hello, my name is Ogram.</i>”");
	output("\n\nSeeing you looking, he chuckles and sits up straighter behind his desk. “<i>What? Never seen a Texan before, or do I have something on my shirt?</i>”");
	output("\n\nYou apologize as he picks up a stack of forms, sticks them on a clipboard, and hands them to you. “<i>Basic stuff, here: just check to say that you don’t have any contagious diseases, you’re not bringing foreign foodstuffs in, and that you’re generally not going to be a dick on my planet. Oh, and there’s a weapons check. No firearms, bladed weapons, or other means of murder and mayhem beyond this point. Don’t worry, we’ll tag ‘em and hand ‘em back to you as soon as you’re ready to leave.</i>”");
	output("\n\n“<i>No weapons?</i>” you say, caught a bit off guard after your time on the frontier.");
	output("\n\nOgram shrugs apologetically. “<i>Sorry, " + pc.mf("buddy","beautiful") + ", them’s the rules.</i>”");
	processTime(2);
	//[Disarm] [No Way!] [No Weapons!]
	clearMenu();
	addButton(0,"Disarm",disarmMeHoss,undefined,"Disarm","Allow Ogram to disarm you.");
	addButton(1,"No Way!",noWayTexasJose,undefined,"No Way!","Refuse to be disarmed.");
	if(pc.meleeWeapon.shortName == "" && pc.rangedWeapon.shortName == "") addButton(2,"No Weapons!",noWeaponsInTexasHoss,undefined,"No Weapons!","Inform Ogram that you aren't carrying any real weapons. All you need are your fists or a rock to chuck, and you can find rocks anywhere.");
	else addDisabledButton(2,"No Weapons","No Weapons","You can't get by for having no weapons while actually carrying weapons. It just doesn't work. Come on, man.");

}

//No Way!
function noWayTexasJose():void
{
	clearOutput();
	flags["REFUSED_TEXAN_DISARM"] = 1;
	output("\n\n“<i>Not happening,</i>” you say, throwing the clipboard down on Ogram’s desk.");
	output("\n\nHe shrugs and takes the paperwork back. “<i>Hey, whatever. There’s the door back to fuck-off. Let me know if you change your mind.</i>”");
	output("\n\nWith a heavy sigh, the bull-man leans back in his chair and pulls his cap down over his eyes. He seems to be enjoying himself...");
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//No Weapons
function noWeaponsInTexasHoss():void
{
	clearOutput();
	flags["REFUSED_TEXAN_DISARM"] = undefined;
	output("\n\n“<i>I’m unarmed anyway,</i>” you say with a shrug.");
	output("\n\nOgram blinks. “<i>Huh. Did somebody actually read the FAQ on the website for once, or do you just prefer to lay in with your fists? Anyway, just sign the paperwork and you’re all good.</i>”");
	//{Resume from Disarm, below}
	customsPassFinale();
}

//Disarm
function disarmMeHoss():void
{
	clearOutput();
	flags["REFUSED_TEXAN_DISARM"] = undefined;
	output("“<i>Alright,</i>” you say warily, handing over your armaments.");
	output("\n\nTrue to his word, Ogram hooks a paper tag over your gear and stows it in a small container behind his desk. “<i>Thankya kindly. Now just finish off that paperwork, and you’re all good.</i>”");

	//{No weapons resumes here}
	customsPassFinale();
}
function customsPassFinale():void
{
	output("\n\nYou spend a minute or two filling in your signature or initials on a few forms. Eventually, you hand them over to Ogram, who stamps them. As he does so, you notice the bull-man wince, snaking a hand down under the desk. Maybe he’s got a cramp?");
	output("\n\n“<i>Alright. Just step on over to the visitor check-in desk. Somebody’ll be with you...</i>” He shudders a little bit, barely muting a curse. “<i>Uh, real soon.</i>”");
	pc.createStatusEffect("Disarmed",4,0,0,0,false,"Disarmed","You've checked all forms of weaponry at New Texas' customs.",false,0);
	processTime(2);
	clearMenu();
	addButton(0,"Next",visitorDeskApproach);
}

//Visitor Desk (First Time)
function visitorDeskApproach():void
{
	clearOutput();
	output("As Ogram said, you step across the hall to the desk marked for visitor check-in, though there’s still nobody sitting there. You shrug and ");
	if(!pc.isTaur() && !pc.isNaga()) output("take a seat");
	else if(pc.isTaur()) output("sit down on your haunches");
	else output("coil yourself up");
	output(" in front of the desk, waiting.");

	output("\n\nBehind you, as silence descends over the office, you begin to hear Ogram grunting. Softly, barely audible, clearly restrained... you look over your shoulder, seeing his hand tucked under his desk as Ogram leans back in his chair, breath hot and hard. Is he...? Before you can decide on a course of action, you hear Ogram’s breath catch for a second, followed by a long, contented sigh. He slumps back in his chair, a look of lazy fulfilment on his face. As he relaxes, he’s pushed ever so slightly back in his swivel chair, and a head pokes out from under his desk. A quick glance tells you it’s a woman, platinum blonde, with a pair of tiny, cute nubs of horns growing from her brow. She looks up at you and gasps.");
	output("\n\n“<i>Oh no! Oggy, why didn’t you tell me somebody was waiting!</i>”");
	output("\n\nHe shrugs. “<i>I saw you first.</i>”");
	output("\n\nShe pouts and hops up from under Ogram’s desk, wiping what’s pretty obviously cum from her lips. “<i>Sorry... I was on my break. I’ll be with you in just a sec, sugar!</i>”");
	output("\n\n“<i>Uh,</i>” you say as the cow-girl crawls out from under Ogram’s desk, taking a moment to straighten her skirt and flick some excess spooge off from the tops of her breasts before turning her attention to you, coming over to sit at her desk.");
	output("\n\nJust like her partner, the visitor check-in girl’s got distinctly bovine traits, with horns and cow-ears and an absolutely massive rack. She’s easily sporting H-cup tits, barely restrained by her blouse -- it seems to be coming apart at the seams, the buttons ready to pop off at any moment. Her long, slender tail swishes as she walks, topped with a silver tuft of hair that manages to distract you somewhat from the huge, gropable behind.");
	//if PC has Reaha on crew:
	if(reahaIsCrew()) output("Damn, Reaha’s got nothing on the cows here....");

	output("\n\n“<i>Sorry about the wait!</i>” the cow-girl says with a big smile. “<i>My name’s Amma, and I just need a few things from you before you can head on out to the fields. Trust me, you’re going to have so much fun!");
	if(pc.mf("dude","") == "dude") output(" There’s plenty of girls just like me who’re going to be so happy to meet you!</i>”");
	else if(pc.biggestTitSize() < 7) output(" I think New Texas’s got just what you need to spice up your life, cutie!</i>”");
	else output(" You look like you’d fit right in here, miss! A couple days on New Texas and you won’t ever want to leave!</i>”");

	output("\n\nShe picks up a holo-slate with a few blanks on it and hands it over to you. “<i>Just sign the register here and you’re all set. Oh! And if you want the Treatment, just go to the gift shop in the ranch house. You can even get a delicious salad from the restaurant while you’re getting treated. Or a steak or something, I guess. Or you could go play with the " + pc.mf("studs","girls") + " in the barns: they’re always open to visitors!</i>”");
	output("\n\nAs she’s speaking, you sign your name and ship ID. Once done, a green light flickers on the screen, and a banner announces that you’re done - welcome to New Texas! “<i>Great! All done, sugar! Just head on out through the door there, and have lots of fun. If you have any questions, Oggy and I are always here to answer ‘em.</i>”");
	flags["NEW_TEXAN_CUSTOMS_MET"] = 1;
	processTime(10);
	//[Talk] [Leave]
	clearMenu();
	addButton(0,"Talk",talkToAmma,true,"Talk","Talk with the chesty cow-gal.");
	addButton(14,"Leave",mainGameMenu);
}

//output("\n\nTrying to Go Through Customs while Armed");
function customsFucksYourShitUp():void
{
	currentLocation = "TEXAS CUSTOMS";
	var map:* = mapper.generateMap(currentLocation);
	this.userInterface.setMapData(map);
	clearOutput();
	output("“<i>Hey, " + pc.mf("buddy","beautiful") + ", where do you think you’re going?</i>” Ogram says, standing up behind his desk. “<i>No weapons past this point. Come over here and check ‘em, or you’re going nowhere.</i>”");
	output("\n\nWhoops.");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Ogram (Repeat)
function repeatOgramApproach():void
{
	clearOutput();
	output("You step over to the customs desk and clear your throat to get Ogram’s attention. ");
	output("“<i>Sup, " + pc.mf("bro","beautiful") + "?</i>” Og says with a friendly nod. ");

	//if PC is Disarmed: 
	if(pc.hasStatusEffect("Disarmed"))
	{
		output("“<i>Lemme know when you’re ready to go, and I’ll hand your weapons back over.");
	}
	//If PC is armed:
	else
	{
		output("“<i>If you want to go into the ranch, you’ll need to check your weapons with me.");
	}
	output("</i>”");
	//If sex’d:
	if(flags["FUCKED_TEXAN_CUSTOMS"] != undefined) output(" “<i>Or would ya rather double-team the cow again?</i>”");

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
function rearmAtOgram():void
{
	clearOutput();
	output("“<i>Alright, let’s see what we’ve got here,</i>” Ogram says, popping open the container behind his desk and pulling out your gear. He compares the bundle to the tag attached to it, checks something on his holo-terminal, and hands it over to you. “<i>Just sign here, and you’re all set.</i>”");
	output("\n\nYou do so, and are promptly handed a bundle with your weapons in it. “<i>Cool. Take care out there, " + pc.mf("buddy","beautiful") + ".</i>”");
	pc.removeStatusEffect("Disarmed");
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Disarm (Repeat)
function getDisarmedRepeat():void
{
	clearOutput();
	output("“<i>Ready to check your weapons? Cool, just hand ‘em over and put your Hancock on this form here,</i>” Ogram says, handing over a dataslate. You fill out the form and hand your gear over, watching as Og tags it and stows your armaments away in the container behind his desk.");
	output("\n\n“<i>Alright, good to go,</i>” he says, closing the container and checking the forms. “<i>Have a good one.</i>”");
	pc.createStatusEffect("Disarmed",4,0,0,0,false,"Disarmed","You've checked all forms of weaponry at New Texas' customs.",false,0);
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Talk
function talkToOggy(display:Boolean = false):void
{
	if(display)
	{
		clearOutput();
		output("“<i>Got a minute to chat?</i>”");
		output("\n\n" + pc.mf("“<i>Guess I’m not doing anything important. What’s up, buddy?</i>”","“<i>For a beautiful gal like you? Absolutely,</i>”") + " Og says, leaning back in his chair.");
	}
	clearMenu();
	addButton(0,"The Treatment",talkToOggyAbootTreatManz,undefined,"The Treatment","Ask the brute what his take on the Treatment is.");
	addButton(1,"CurrentJob",oggysCurrentJob,undefined,"Current Job","Ask him about his job now.");
	addButton(2,"Old Job",oggysOldJob,undefined,"Old Job","Ask him about his old job.");
	addButton(3,"Amma",askOggyAboutAmma,undefined,"Amma","Ask him about that hot cow-girl manning the visitor's desk.");
	addButton(14,"Back",repeatOgramApproach);
}

//The Treatment
function talkToOggyAbootTreatManz():void
{
	clearOutput();
	output("“<i>So, tell me about this Treatment.</i>”");
	output("\n\nOgram shrugs, “<i>Hey, if you want the tourist pitch, talk to Amma. I just live here.</i>”");
	output("\n\n“<i>But you got the Treatment,</i>” you suggest, indicating his bulging muscles and bull-horns.");
	output("\n\n“<i>Heh. Yeah. Kind of a snap decision, but... well, it’s actually pretty cool, you know. I was pretty ripped before -- kind of a requirement when you’re a bodyguard -- but </i>damn<i> that stuff jacked my muscles out. Could bend bars, these guns,</i>” he says, flexing. “<i>Plus I put on another foot of height and got these love-handles.</i>” He jerks a thumb towards his enormous horns.");
	output("\n\n“<i>Pretty weird how different it works on guys and gals, though. When I got it, I figured I was gonna get huge tits and turn into a bimbo. Never actually occurred to me to talk to a bull around here, I guess. Didn’t see one till after I ran into the gift shop and Treated up.</i>”");
	output("\n\nOg leans back in his chair, locking his fingers behind his head. “<i>Can’t complain, really. After I got it, they let me have the run of the place. Any girl I wanted spread her legs for nothing. Especially if you catch ‘em in the milk barns... they practically beg for it, all hooked up to their milkers. Should hear Amma when she’s getting milked... any cock in a storm, that girl.</i>”");
	output("\n\n“<i>Especially if it’s yours!</i>” she calls over with a wink.");
	output("\n\nOgram grins, his pants visibly straining.");
	processTime(6);
	talkToOggy(false);
	removeButton(0);
	addDisabledButton(0,"The Treatment","The Treatment","Seriously? You're talking about that right now.");
}

//Current Job
function oggysCurrentJob():void
{
	clearOutput();
	output("“<i>So, tell me about what you do here.</i>”");
	output("\n\n“<i>Customs? C’mon, " + pc.mf("buddy","beautiful") + ", it’s the same shit as anywhere. ‘Oh, no, you can’t take that horribly poisonous Evaxi cactus here;’ ‘Please stop trying to take your power armor through the gate, you don’t need it here;’ ‘Yeah, we can all see you’ve got contraband stuffed up your ass. Drop trou, buddy. It’s Mr. Gloves time.’ Least NT’s pretty peaceful. Not a lot of scum try and come through, since all we’ve got is milk and the Treatment. Worst we have to worry about is the occasional slaver trying to steal our cows, but that’s Fleet’s problem most of the time.</i>”");
	output("\n\nHe shrugs. “<i>Honestly, it’s pretty boring. At least compared to my old job. I remember digging through the ground levels of the biggest hive worlds, pulling security at planetary conventions... that was exciting. Even stopped an assassin, once. Head-butted her when she came ‘round a corner; went down like a </i>bitch<i>. Less getting shot at now, though. That’s pretty nice. Haven’t even had to draw down since I got the job.</i>”");
	output("\n\n“<i>So what made you pick customs?</i>”");
	output("\n\n“<i>Eh,</i>” Og says, leaning back and looking right past you. “<i>It’s got a great view, for starters.</i>”");
	output("\n\nYou follow his gaze over to Amma, who’s currently resting her heavy rack on her desk while she types. Seeing the two of you looking, she gives you an exaggerated wink.");
	output("\n\nOgram hits a key on his terminal as you turn your attention back to him. Amma gives a muted little gasp, barely audible behind you. “<i>Not much else to do for someone with my skill set, either. We don’t exactly need cops around here, you know. Guess I could have been a breeder bull... gotta say, that actually has a lot of appeal, sticking your dick in a dozen different sluts every day... but then I’d have a million little Ograms running around calling me daddy. That’d be pretty fucking weird.</i>”");
	//{If Ogram option unlocked in Amma’s menu:}
	if(flags["OGRIM_UNLOCKED_FROM_AMMA_TALK_MENU"]  != 0)
	{
		output("\n\nBehind you, Amma smirks and says, “<i>When’re you going to put </i>one<i> little Ogram in me, babe?</i>”");
		output("\n\n“<i>Shush, you,</i>” Og says, waving her off. “<i>I’ll get to you when I’m good and ready.</i>”");
		output("\n\nAmma pouts... right up until Og keys his terminal again, and she gives a little yelp.");
	}
	processTime(6);
	talkToOggy(false);
	removeButton(1);
	addDisabledButton(1,"CurrentJob","CurrentJob","Seriously? You're talking about that right now.");
}

//Old Job
function oggysOldJob():void
{
	clearOutput();
	output("“<i>So, care to talk about your old gig?</i>”");
	output("\n\nOg laughs. Behind you, Amma groans, “<i>Don’t get him started... he’ll go on all day!</i>”");
	output("\n\n“<i>Hey, " + pc.mf("my friend here","the pretty lady") + " asked!</i>” Ogram says defensively. “<i>Don’t mind her. Before I came to New Texas and got Treated, I worked private security. Joined Nova way back, ended up mostly doing personal escorts. Not </i>that<i> kind. Amma.</i>”");
	output("\n\n“<i>I didn’t say anything!</i>”");
	output("\n\n“<i>Bodyguarding. I was a bodyguard, basically. Got to wear the black suit and sunglasses, carry a machine pistol in my briefcase. It was pretty great. People I worked for were mostly scum, big corp. executives with enough creds to build their mansions out of their tax return slips. Kiha, JoyCo, Steele, you name it. But I got to go all over the galaxy, see cool aliens. Blow some up. Fucked others. Sometimes even fuck the people I was escorting.</i>”");
	output("\n\n“<i>So you </i>were<i> a...</i>” Amma starts to laugh, cut off when Og pushes a button on his console. She shudders. ");
	output("\n\n“<i>Hey, don’t judge a guy for working hard to get his bonuses.</i>” He sighs, leaning back in his chair and propping his legs up. “<i>Could have had a worse gig. But I like what I do here. New Texas’s been good to me.... wouldn’t go back to that for the world.</i>”");
	processTime(5);
	talkToOggy(false);
	removeButton(2);
	addDisabledButton(2,"Old Job","Old Job","Seriously? You're talking about that right now.");
}

//Amma
function askOggyAboutAmma():void
{
	clearOutput();
	output("“<i>What can you tell me about your partner there,</i>” you whisper, nodding back to the busty cow behind you.");
	output("\n\nOgram chuckles. “<i>Other than that she’s the reason I stick around here? Hell, I even got Treated just to get her to give me a chance. What more do you need to know than that?</i>”");
	output("\n\n“<i>Come on,</i>” you coax, “<i>You gotta tell me more than that.</i>”");
	output("\n\n“<i>Heh. She’s cute, funny, sexy as hell... and those tits are worth dying for, let me tell you. Amma was the first person I saw here on NT, and I just... I dunno,</i>” he shrugs, and you’re almost sure his tanned skin’s flushed a bit redder. “<i>I didn’t think twice about staying here... leaving everything behind... when I met her. Can’t explain it, but I just knew she was worth it. This whole planet is, really: all the women are like Amma. It’s a paradise for perverts like ");
	if(flags["FUCKED_TEXAN_CUSTOMS"] == undefined) output("me");
	else output("us");
	output(".");
	processTime(3);
	talkToOggy(false);
	removeButton(3);
	addDisabledButton(3,"Amma","Amma","Seriously? You're talking about that right now.");
}

//Sex
function askOggyForSex():void
{
	clearOutput();
	//First time:
	if(flags["FUCKED_TEXAN_CUSTOMS"] == undefined)
	{
		output("Leaning over the bull-man’s desk, you ask if he’d be up for showing you those guns of his up close. Maybe take ‘em out of their holsters for you to get... hands on with?");
		output("\n\nHe grins up at you, leaning back enough in his chair that you can see his crotch, and the rising tent coming from it. “<i>For a " + pc.mf("handsome guy","cute girl") + " like you, I wouldn’t mind.</i>”");
		output("\n\n“<i>But,</i>” Amma says from behind you, her hand suddenly on your [pc.butt], “<i>Oggy and I come as a pair.</i>”");
		output("\n\nOgram grins, standing up and reaching for his zipper. “<i>Think you can handle the two of us, " + pc.mf("buddy","beautiful") + "?</i>”");
		output("\n\nAmma grins, pressing her twin melons against you. “<i>Ready for the fuck of a lifetime, [pc.name]?</i>”");
	}
	//{Repeat}
	else
	{
		output("“<i>So... how about you and Amma take a break. You’re working too hard.</i>”");
		output("\n\nOgram grins. “<i>I was wonder when you were gonna ask.</i>”");
		output("\n\n“<i>Ready for the fuck of your life, [pc.name]?</i>” Amma grins, hopping out from behind her desk.");
	}
	processTime(1);
	clearMenu();
	if(pc.hasCock())
	{
		if(pc.cockThatFits(chars["AMMA"].vaginalCapacity(0)) >= 0) addButton(0,"Spit Roast",spitRoastAmmoOnYerDicks,undefined,"Spit Roast","Spitroast Amma. Ogrim gets her mouth, you get her pussy.");
		else addDisabledButton(0,"Spit Roast","Spit Roast","You're too big to spitroast her.");
	}
	else addDisabledButton(0,"Spit Roast","Spit Roast","Spitroasting Amma requires you to have a penis of some kind.");
	addButton(1,"ServiceOggy",worshipZeBullCawk, undefined, "Service Oggy","Help Amma orally service Ogram's dick. Really get in there and give it the worship it deserves.");
	addButton(14,"Back",approachDatCowGalRepeat);
}

//Amma (Repeat)
function approachDatCowGalRepeat():void
{
	clearOutput();
	output("You take a seat at the visitor’s desk across from the well-endowed cow-girl.");
	output("\n\n“<i>Hey there, sugar! Welcome back! Anything I can help you with?</i>” Amma asks with a warm smile. As she does so, she fidgets slightly, her thick legs shifting under the desk");
	if(flags["FUCKED_TEXAN_CUSTOMS"] == undefined) output(" like she’s got an itch");
	else output(" as Ogram fiddles with her vibrator settings");
	output(".");
	//if sex’d:
	if(flags["FUCKED_TEXAN_CUSTOMS"] != undefined) output(" “<i>Or did you just want to have a little fun? For you, Oggy and I are always on break.</i>”");
	//[Talk] [Sex]
	processTime(1);
	clearMenu();
	addButton(0,"Talk",talkToAmma,true,"Talk","See if the cow-girl wants to talk about anything.");
	if(pc.lust() >= 33) addButton(1,"Sex",sexChatWithAmma,undefined,"Sex","See if the lusty cow-girl is up for a quickie.");
	else addDisabledButton(1,"Sex","Sex","You aren't aroused enough for sex.");
	addButton(14,"Leave",mainGameMenu);	
}


//Talk
function talkToAmma(display:Boolean = false):void
{
	if(display)
	{
		clearOutput();
		output("“<i>Got a minute to chat?</i>”");
		output("\n\n“<i>Sure thing, sugar,</i>” the cow beams. “<i>Anything I can help you with, let me know!</i>”");
	}
	clearMenu();
	addButton(0,"The Treatment",askAmmaAbootZeTreatManz,undefined,"The Treatment","Ask the cow-girl what she thinks of the Treatment.");
	addButton(1,"Who'sInCharge",whosInCharge,undefined,"Who's In Charge Here?","Ask Amma about who runs this planet.");
	addButton(2,"Herself",askAmmaAboutHerSelf,undefined,"Herself","Ask Amma about herself.");
	if(flags["OGRIM_UNLOCKED_FROM_AMMA_TALK_MENU"] != undefined) addButton(3,"Ogrim",askAmmaAboutOgram,undefined,"Ogrim","Ask her about that big lug she's been seeing, Ogrim.");
	else addDisabledButton(3,"Locked","Locked","You'll need to talk to Amma about something else in particular before this scene unlocks.");
	addButton(14,"Back",approachDatCowGalRepeat);


}

//The Treatment
function askAmmaAbootZeTreatManz():void
{
	clearOutput();
	output("“<i>Could you tell me a little about this Treatment?</i>”");
	output("\n\nAmma grins and nods, a little too eagerly. “<i>I’d be happy to! The Treatment’s what makes New Texas such a great, fun place. It’s a special gene-therapy developed right here on NT; everyone gets it when they reach maturity, and have for the last couple hundred years. The Treatment makes sex super fun -- that’s the really important part. But it also gives us girls these,</i>” she says, jiggling her shirt-straining chest, “<i>and just plain makes us sexier!");
	output("\n\n“<i>Boys like Oggy over there get all muscley and big, plus some other awesome benefits...</i>” she winks, pointing a finger down between her legs. “<i>Without the Treatment, New Texas would just be any other rural colony. With it, we’ve got ourselves a pleasure paradise!</i>”");
	output("\n\nShe sure seems excited about it, that’s for sure.");
	output("\n\n“<i>Even better, the Treatment’s free in the gift shop. You should try it: you’ll never regret it!</i>”");
	output("\n\n“<i>Is it reversible?</i>”");
	output("\n\nAmma blinks, completely taken by surprise. “<i>Why would you want to stop being Treated? It’s the best!</i>”");
	output("\n\n“<i>That’s not an answer,</i>” you say.");
	output("\n\nShe fidgets. “<i>Uh, well, I don’t think it is. Probably not. I dunno, nobody’s ever really wanted to! It’s so nice... I couldn’t imagine living without my Treatment. Life,</i>” she pauses, leaning in to whisper “<i>and sex.... would be sooooo boring. It makes the pleasure-feelers in your brain go wild, and your endor... uh, endarfins...</i>”");
	output("\n\n“<i>Endorphins,</i>” Ograms says, not looking up from his terminal.");
	output("\n\n“<i>Endorphins! You get lots more of them, too. Did I mention that it made sex feel soooo good? And lactation! Oh, wow, giving milk is just the best... I feel bad for my poor bulls, who never get to do it!</i>”");
	processTime(7);
	talkToAmma(false);
	removeButton(0);
	addDisabledButton(0,"The Treatment","The Treatment","You're already talking about that.");
}

//Who’s in Charge?
function whosInCharge():void
{
	clearOutput();
	output("“<i>So, who’s in charge around here?</i>”");
	output("\n\nAmma points out the door and northward. “<i>That’d be Big T. He’s the planetary governor. His ranch house is the big one up the road a little way, you can’t miss it. He loves meeting visitors, so you should totally go say ‘hi.’</i>”");
	output("\n\n“<i>Tell me about him.</i>”");
	output("\n\nHer big lips purse in thought. “<i>Hmm. Well, he’s a big stud... even bigger than Oggy here!</i>”");
	output("\n\n“<i>Hey!</i>” Ogram barks.");
	output("\n\n“<i>I meant size, babe! Uh, er, height! Height!</i>”");
	output("\n\nOgram scowls, but turns back to his holo-terminal. A moment later, Amma gasps, biting her lip to mute a little squeak trying to tear its way out of her. Slowly, she adjusts her collar and shakily begins speaking again. “<i>Uh, a-anyway, Big T.’s in charge of the planet’s Treatment production and -- oh! -- helps us cows ship our milk all o-o-ooooohver the galaxy.</i>”");
	output("\n\nAmma stops, pausing for breath. ");
	//if not sex’d: 
	if(flags["FUCKED_TEXAN_CUSTOMS"] == undefined) output("What’s up with her?");
	else output("Ogram must have that vibe up to max by now.");
	output(" “<i>H-he’s been governor for as long as I’ve been alive. It’s a hereditary position, so his family’s been running New Texas since it w-w-waaaaaas first colon...colonized. They’ve been good to us... gave us the Treatment, peace... lives full of </i>fun<i> and milk...</i>” Before she can get much farther, Amma’s hands clamp around the edge of her desk, steadying her as she moans quietly, her tits wobbling with her heaving breath.");
	//if not sex’d:
	if(flags["FUCKED_TEXAN_CUSTOMS"] == undefined)
	{
		output("\n\n“<i>Ex-excuse me. I need to, um.. bathroom...</i>” she mumbles, jumping up from her desk and scampering off, her bovine tail tucked tight.");
		output("\n\nOgram grunts as she vanishes into the restroom. “<i>Bigger </i>that<i>, slut.</i>”");
	}
	//if sex’d:
	else
	{
		output("\n\n“<i>O-oggy! Stop! It’s too... too much. Too much!</i>” Amma groans, biting her lip, trying not to just moan like a whore.");
		output("\n\nOgram chuckles, “<i>Just a little more, slut. Hang in there....</i>”");
		output("\n\n“<i>Aaaaah. Stopitstopitstopit,</i>” Amma moans, finally breaking down and crying out, her hand disappearing under her skirt. It doesn’t take much more before her voice reaches a crescendo and her tits erupt in a little squirt of milk that soaks right through her shirt, drenching her in her own lactic lust. With a grunt, Amma face-plants on her desk, her big, pillowy tits cushioning the fall. ");
		output("\n\n“<i>Bigger </i>that<i>, slut,</i>” Ogram laughs as the cow-girl cums her brains out.");
		pc.lust(4);
	}
	processTime(6);
	
	talkToAmma(false);
	removeButton(1);
	addDisabledButton(1,"Who'sInCharge","Who'sInCharge","You're already talking about that.");
}

//Herself
function askAmmaAboutHerSelf():void
{
	clearOutput();
	//{Unlocks “<i>Ogram</i>” talk option}
	flags["OGRIM_UNLOCKED_FROM_AMMA_TALK_MENU"] = 1;
	output("“<i>So, tell me about yourself,</i>” you say, inching a little closer to the cow-girl.");
	output("\n\n“<i>Aw, you’re sweet,</i>” Amma says with a big smile. “<i>I’m just a lil’ native cow. Born and raised on NT! My ancestors came over with the first colonists, even, so I’m as pure Texan as you can get.</i>” She beams, swelling with pride at her family lineage.");
	output("\n\n“<i>Let’s see... I got the Treatment when I was eighteen. Even before that, though, I was a little cow-ish. We’ve been gene-modding ourselves for ages, you know? Ever since we came to NT. I had my horns and a pretty great rack just naturally... through the Treatment really made a woman out of me!</i>” she says, puffing out her prodigious chest. One of the buttons on her shirt pops off, rolling across the desk. “<i>Oopsie! Anyway, I didn’t really want to be just a dairy cow, so... I got a job here with Oggy as a greeter. Big T. says I do a great job of making newcomers feel super welcome here!</i>”");
	output("\n\nOgram chuckles. “<i>I’ll say. One look at those tits and any man’d want to stay here forever.</i>”");
	output("\n\n“<i>Yep!</i>” Amma smiles. “<i>I even had one guy propose to me, right on the spot. He was so cute... he even got the Treatment later!</i>”");
	output("\n\n“<i>He’s right here, too,</i>” Ogram grunts.");
	output("\n\nAmma looks over your shoulder and blows him a kiss. “<i>Love you, babe!</i>”");
	output("\n\n“<i>Yeah, yeah,</i>” he says with a little chuckle, catching it out of the air.");
	processTime(6);
	talkToAmma(false);
	removeButton(2);
	addDisabledButton(2,"Herself","Herself","You're already talking about that.");
}

//Ogram
function askAmmaAboutOgram():void
{
	clearOutput();
	output("You whisper so as not to be overheard, “<i>So... you and Ogram?</i>”");
	output("\n\nAmma nods. “<i>Uh-huh! He was a big ol’ mercenary or something who came through with some kind of important, snooty executive-type. We got to talking while they were coming through customs, and I guess Oggy just fell in love! He couldn’t even get out of the building before he was asking me to marry him! He got down on a knee and everything! It was soooo cute. He’s such a romantic, under all that grumpy.</i>”");
	output("\n\n“<i>So, did you say yes?</i>”");
	output("\n\n“<i>Weeeelllll,</i>” Amma says coyly, “<i>We don’t really do the whole marriage thing on NT. But I told him if he got the Treatment, and he wanted to be with me... I couldn’t believe he actually did it! Just to stay with me.</i>”");
	output("\n\nAmma rests her chin in her hands, staring past you to the burly bull-man behind you. “<i>He’s a great big sweetheart, my Oggy.</i>”");
	processTime(4);
	talkToAmma(false);
	removeButton(3);
	addDisabledButton(3,"Ogram","Ogram","You're already talking about that.");
}

//Sex
function sexChatWithAmma():void
{
	clearOutput();
	//{First time:}
	if(flags["FUCKED_TEXAN_CUSTOMS"] == undefined)
	{
		output("Pulling yourself up onto Amma’s desk, you lean in and ask the busty, bovine bimbo if she’d be willing to give you a more intimate introduction to her planet. She gives you a lusty grin and leans in, giving you a close-up view of her massive, bovine cleavage. Your mouth is all but watering already.");
		output("\n\n“<i>Maaaybe,</i>” she teases, inching closer.Those big swells of cowflesh are practically rubbing up against you, now.");
		output("\n\nJust as she’s about to make contact, a hand grabs your [pc.butt], squeezing hard. You just about jump out of your skin as Ogram growls into your ears, “<i>But we come as a pair, Amma and I. Think you can handle the two of us, " + pc.mf("buddy","beautiful") + "?</i>”");
		output("\n\nAmma grins, pressing her twin melons against you. “<i>Ready for the fuck of a lifetime, [pc.name]?</i>”");
	}
	//{Repeat}:
	else
	{
		output("“<i>So... how about you and Ogram take a break. You’re working too hard.</i>”");
		output("\n\n“<i>I’m up for it,</i>” Ogram says, standing.");
		output("\n\n“<i>Awesome!</i>” Amma grins, already starting to pull her shirt off. “<i>I was hoping you’d ask.</i>”");
	}
	processTime(1);
	clearMenu();
	if(pc.hasCock())
	{
		if(pc.cockThatFits(chars["AMMA"].vaginalCapacity(0)) >= 0) addButton(0,"Spit Roast",spitRoastAmmoOnYerDicks,undefined,"Spit Roast","Spitroast Amma. Ogrim gets her mouth, you get her pussy.");
		else addDisabledButton(0,"Spit Roast","Spit Roast","You're too big to spitroast her.");
	}
	else addDisabledButton(0,"Spit Roast","Spit Roast","Spitroasting Amma requires you to have a penis of some kind.");
	addButton(1,"ServiceOggy",worshipZeBullCawk,undefined,"Service Oggy","Help Amma orally service Ogram's dick. Really get in there and give it the worship it deserves.");
	addButton(14,"Back",approachDatCowGalRepeat);
}

//Ogram and Amma Sex
//Spitroast Amma
//PC needs teh cock
function spitRoastAmmoOnYerDicks():void
{
	clearOutput();
	author("Savin");
	var x:int = pc.cockThatFits(chars["AMMA"].vaginalCapacity(0));
	if(x < 0) x = pc.smallestCockIndex();
	output("At the cow-girl’s invitation, your hands quickly find their way onto Amma’s hips, pulling the ditzy cow up against you. She gives a gasp of a moo, her spankable ass grinding into your [pc.crotch] while her long, slender tail wraps affectionately around one of your [pc.legs]. Your wandering hands sink into her fleshy figure, caressing her wide hips before slipping up under her blouse, tracing along her bare, hot flesh and up to the shirt-straining mounds of her milky tits.");
	output("\n\nAmma’s breath catches as your fingers squeeze around her huge breasts. “<i>Aaah! You go right for it, don’t ya?</i>” she giggles as your fingers dig into her pliant titflesh, a slight moan escaping her lips, growing louder as you work your fingers into her bosom.");
	output("\n\nAs you do, Ogram finally steps up and makes short work of Amma’s shirt, pulling it off her with practiced, easy motions. You flash the big bull a grin as your hands are laid bare, just in time for the first little trickle of milk to spurt out of Amma’s jugs, spilling across your digits and onto the floor. Her voice crescendos into a high, blissful moo as you go from groping to milking, her lactic lust pouring onto the floor - and into convenient drains beneath her desk. As you work around her big, teat-like nipples, Ogram grabs the undersides of her tits, giving them just enough squeeze to make her cry out. He silences her with a kiss, pulling the cow away from you and into his powerful grasp.");
	output("\n\nStill, in his arms, she’s bent over and wiggling her ass and tail. You release the cow’s breasts and move down to her other big, fleshy mounds, slipping your hands up under her skirt and grabbing her ass. Her tail swerves as you hike her skirt, finally getting a good look at her big, plump derriere");
	//if repeat:
	if(flags["FUCKED_TEXAN_CUSTOMS"] != undefined) output(" and the buzzing pair of vibrators still teasing her holes");
	else output(". And now you finally see why Amma’s always looking so uncomfortable: there’s a pair of tiny bullet vibrators buzzing away, one in each hole. Seeing your face, Ogram laughs: “<i>What, surprised? I can’t be plowing her cunt all the time, can I?</i>”");
	output(" You pull the bullet vibes out of her, earning a sharp gasp from the passive little cow and a slick spurt of excitement from her clearly ready cunt.");
	output("\n\nAmma breaks her kiss with Ogram to give you a wink over her shoulder. “<i>Go ahead and fuck me, [pc.name]. Oggy’s got me soooo ready for you!</i>”");

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
	output("\n\n“<i>Like that, huh?</i>” Og grins, taking the cow by the horns and pulling her face into his groin, hard enough to nearly rip her from your grasp. “<i>Come on, harder, slut! Put that tongue to work.</i>”");
	output("\n\nAmma moans, but a moment later wrings a grunt of pleasure from her lover as she apparently fulfils his wish. Her hands shift down from his waist to his balls, both hands cupping worshipfully around the bull’s massive, swinging nads, squeezing just enough that you can see the hefty balls inside the sack shift around under her ministrations. One of his hands moves from horn to head, gently stroking Amma’s hair as she sucks and fondles, clearly hitting just the right spots on her bull.");
	output("\n\nAnd on you, too. Amma’s cunt alternatives between vice-like tightness and so loose you practically fall back into her, working you up into a pounding frenzy as you desperately try to get more of her bovine pussy, drowning in the sensation of her slit around your [pc.cock " + x + "]. You grab Amma’s tail, giving it just enough of a pull to make her cry out and clench down, using it to ram yourself deeper still inside the slutty cow, slapping into her ass hard enough to make the soft flesh bounce and jiggle madly as you hammer home again and again. Amma’s sexy moans devolve into feral, animalistic grunts of pleasure that come out wet and half-muffled as Ogram continues to forcefully face-fuck her, his own hips pistoning until his sack slaps against her drool-slathered chin.");
	output("\n\nSuddenly, Og grunts, slamming himself hilt-deep in Amma’s throat. The cow gags and squirms around on your cocks, unable to escape as the bull bellows loudly and cums; all you see is his heaving chest and a thick waterfall of backed-up spooge pouring back out around his cock, splattering on the floor. The cow-girl’s body reacts to the mouthful of cum on instinct, her hands and mouth working overtime to suckle out every drop of seed from the well-hung bullman. Despite her attention fixated on Og, the cow certainly isn’t ignoring you: spurred on by the taste of spunk, her cunt contracts hard around you, milking your [pc.cock " + x + "] like a machine as you thrust in, every second a different muscle squeezing or caressing your shaft as you glide through her sultry, sodden snatch.");
	output("\n\nWith a final groan of pleasure, Og pulls out of Amma’s face, slumping back against his desk and leaving the cow dripping his seed down her chin. She shoots a white-stained grin over her shoulder and winks at you. “<i>You too, cutey! Give it to me from both ends!</i>”");
	output("\n\nYou give her a swat on the ass, a sharp reminder that you’ll cum in your own time... but that time isn’t far off. You pick up the pace, driven on faster by the lustful look on the cowgirl and the amazing skill she’s putting on display around your thrusting cock. You’re going to make her work for it, though: you push her forward with a particularly potent thrust, shoving her against Og’s desk; she grabs it for support, fingers digging into the hardwood and giving her something to brace against as you drill her.");
	output("\n\nFucking her like that, you aren’t going to hold out much longer... and you can’t say you really want to. Amma’s cum-hungry look is practically begging for you to pump her full of jizz, and her pussy is all but demanding it, working hard to drain your [pc.balls] for all you’ve got. A few more thrusts are all you can manage before a sudden, urgent pressure in your [pc.cock " + x + "] surges up; you work on instinct to slam yourself deep into Amma’s backside, [pc.hips] pounding into her squishy behind and burying your cock as far in as you can before you cum. The cow lets outs a low, happy moo as you finally let loose, shooting a thick wad of spooge into the sultry depths of her slit.");
	output("\n\n“<i>Ah! Ooohhh yes! Just like that, [pc.name]! Feels so gooood,</i>” she moans, rocking her hips back against you to get every bit of dick into her sweltering hole as she can. She’s sucking the seed out of you, draining spurt after spurt from your spasming cockhead until your [pc.cumColor] seed is drooling out of her well-fucked cooch, pooling on the floor just like Og’s load before it. Amma clamps down hard around you, tighter than ever as you blow your load, keeping you fully lodged inside her until you’re utterly spent, left panting and shuddering as her muscles continue to massage your over-sensitive shaft.");
	output("\n\n“<i>Fuck. Keep that up and I’m gonna be hard again before you’re done,</i>” Og laughs, pulling himself up onto his desk beside the cow-girl and giving her a pat on the behind.");
	output("\n\nYou pull yourself out of Amma a moment later, taking a towel from Og when he offers and cleaning yourself up. You really got yourself messy, now that you look at yourself: all slathered in cum and Amma’s juices, sweat and milk staining your [pc.skinFurScales]. You sigh contentedly as you wipe up, occasionally glancing up at the drooling cow-cunt still bent over and stretched wide. Amma herself seems content to stay bent over, resting against her lover’s desk and looking up at him dreamily.");
	output("\n\n“<i>Well, thanks for sharing you two,</i>” you say, grabbing your gear.");
	output("\n\n“<i>Any time!</i>” Amma grins, giving you a parting butt-wiggling as you pass. “<i>We should do this again, next time you pass by!</i>”");
	output("\n\n“<i>Definitely,</i>” Og chuckles. “<i>See you around, " + pc.mf("buddy","beautiful") + ".</i>”");

	processTime(30+rand(15));
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Worship Bullcock
function worshipZeBullCawk():void
{
	clearOutput();
	output("“<i>What do you two " + pc.mf("","girls ") + "say about giving this bad boy a little love, huh?</i>” Ogram says, his fingers eagerly working his belt off. He pulls it, and Amma almost instantly has her hands around his pants, tugging them down with aplomb to reveal the huge swell of her lover’s growing bovine erection, the long, slender pole of cow-meat rapidly rising to its full, intimidating height. Amma takes a long, full whiff of him, her overburdened chest swelling as she drinks in the potent, masculine scent of her lover’s animalistic erection.");
	output("\n\nAmma’s fingers wrap around Og’s cock, holding the lengthy pole at full mast as she runs her nose across it from stem to crown. Her eyes all but roll up in her head, lids fluttering as she succumbs to the meaty, earthy musk of pheromones radiating off of Ogram’s manhood. ");
	//if PC is Treated-feminine:
	if(9999 == 0) output("You smell them too, your heightened fuck-dar going on high alert as Amma starts to gently stroke Ogram’s cock. You nearly fall to your [pc.knees] as his virile scent, the scent of a breeder ready and eager to fuck, nearly overwhelms your lust-addled, Treated mind.");
	else output("You can’t deny the odor, either: the air’s soon thick with it, now that Ogram’s cock is out and being gently caressed by the busty bimbo before him: an aroma that nearly makes your [pc.knees] wobble with mounting desire.");

	output("\n\nAs Amma slides down onto her knees before him, you’re treated to a front-row view of her big, plump asscheeks poking out from under her too-sheer skirt, totally shameless as she bares her cheeks to you. ");
	//if not sex’d before:
	if(flags["FUCKED_TEXAN_CUSTOMS"] == undefined) output("And under her skirt, you finally see why she’s always looking so damn uncomfortable: from her stocking, you can see a pair of tiny wires creeping up her thigh and spreading apart, vanishing up both her holes: looks like Ogram’s got her rigged up with a pair of bullet vibes!");
	else output("Her pair of buzzing bullet vibes are on proud display, teasing her holes like a pair of drilling fingers as she handles Ogram’s meat.");
	output(" Flashing you a knowing look, Og reaches back around his desk as presses a key on his holo-terminal. Amma instantly gasps, biting her lip to contain a sexual moan as her pair of vibrators kick into high gear, tormenting her drooling pussy and tight little ass even as she’s lavishing affection on her lover’s shaft.");

	output("\n\n“<i>Come on, cutie!</i>” Amma says, pulling herself off Og’s dick long enough to look back at you. “<i>Or do I have to do this all myself?</i>”");

	output("\n\nOg laughs. “<i>Maybe [pc.he] just likes to watch.</i>”");

	output("\n\nBetween their teasing and the mounting musk pouring from between Og’s legs, your willpower finally snaps. You slip down beside Amma, gently pushing the cow aside and taking hold of Ogram’s rod. The cow-girl giggles as she surrenders her post to you, shifting herself off to one side of her lover’s enormous rod while you take the other. Like her, you spend a moment letting the intoxicating aroma fully strip away what remains of your willpower");
	//treated
	if(9999 == 9999) output(", your sense of self and decency, all hints of civilized behavior from your former, pre-Treated life crumble away");
	output(". Your mind is left with only one, overpowering and all-consuming thought: cock.");

	output("\n\nYour fingers brush across the hard, hot length of Ogram’s shaft, tracing down along the veiny tool until you find the thick, densely-packed mound of pubic hair surrounding its sheath and, below that, the meaty sacks of his balls. Og’s breath catches in a pleasured gasp as your " + pc.mf("","<i>dainty</i> ") + "fingers circle his apple-sized nads, gently cupping and hefting them. God, they’re so <i>full</i>... you can practically hear them sloshing with pent-up seed as you caress the swollen sack, gently rolling the heavy orbs between your worshipful fingers. With a grunt, Ogram slumps back against the desk, supporting himself as sensation washes across his rod and sack as both you and Amma explore the mass of cockflesh on offer. ");

	output("\n\n“<i>Take it easy down there, " + pc.mf("buddy","beautiful") + ",</i>” Og says, planting one of his huge, powerful hands atop your head");
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
	output("\n\n“<i>That’s how you do it!</i>” Amma cheers, giving you a sultry wink from across the bull’s bow before leaning in to work on the other nut. Between the two of you, you’re soon slathering Ogram’s balls in licks, kisses, and gentle nibbles, watching with bated breath as his massive cock dangles between you, so long that it can’t properly stand on its own. The magnificent manhood throbs powerfully as you suckle Og’s nuts, excitedly jumping up by inches to the quickening beat of its owner’s heart.");
	output("\n\nSlowly, you start to make your way upwards from the heavy, fleshy orbs of Ogram’s balls, leaving the spit-slick, glistening black sack for harder pastures. Amma joins you in an oral pilgrimage upwards to the base of Og’s sheath, your tongues burying into the fuzzy pubic mound between his legs and eliciting a grunt of approval from the big bull. You lick up and around the thick base of his cock, meeting Amma’s tongue halfway across; your tongues briefly intertwine, letting you taste Og’s balls once again, still fresh on his lover’s salivating tongue, before you begin you arduous journey up his shaft.");
	output("\n\n“<i>Fuck... that’s the stuff....</i>” Ogram breathes huskily as you and Amma almost kiss around his cock, his hands guiding each of you gently upwards when you part. You eagerly obey him, letting the bull guide you slowly along the long, fist-thick bovine member suspended between yourself and the bimbo cow opposite you. You can’t suppress a shudder as you finally get your first taste of Og’s cock, the thick, animalistic flavor sending ecstatic shivers through your eager body. It feels... it feels <i>right</i> to service this cock, to worship it.");
	//???
	if(9999 == 0) output(" Some part of your mind still rebels against this cow-like mentality, until you get another full, deep breath of Ogram’s potent musk, and happily simmer back into a puddle of fuck all too happy to spitshine the beautiful animalistic manhood at your lips.");
	else if(9999 == 9999) output(" Your Treated mind revels in its new purpose, easily accepting your place of devotion to Ogram’s cock, simmering in the pheromone-induced puddle of fuck that you’ve become, all too eager to lick and kiss your way up his animalistic prick.");
	output("\n\nYou mewl with desire as your [pc.lips] lock around the half-cock allotted to you, almost kissing Amma, so close that you can feel her breath hot on your lips... or maybe that’s just the heat welling off of Ogram’s member? You can’t tell anymore... and frankly, you’re not sure if you care. Your eyes flutter as your [pc.tongue] teases across the sweltering underside of the bull’s masculinity, drowning you in his salty, musky taste. You could almost cum just from his member on your lips, his thick pre on your tongue.");
	//if not Treated:
	if(9999 == 0) output(" Is this what it’s like to be Treated? God, you almost want to find out....");

	output("\n\nIt takes you minutes to work your way up to the crown of Ogram’s cock. Time blurs as you and Amma work, your bodies swaying like branches from the trunk of Og’s member as he guides you up and down his mammoth length, again and again until his crimson cockflesh is glistening with wetness, all but drooling as you and Amma slavishly shine him down. Only the sudden emptiness as your mouth closes around air breaks you out of your lustful trance, bringing you back to the realization that you’ve come to the pointed tip of Ogram’s manhood. You lock eyes with Amma for a split second, and get the cow’s approving nod. Looks like she really is willing to share her big ol’ bull with you! You  give her the biggest, dopiest smile you can manage through your cockhungry haze and lock your lips around the head of his cock.");
	output("\n\n“<i>Just open wide and hold still, babe!</i>” Amma says, shifting behind you, her big milky tits pressing into your back, arms locking around you to hold you steady as Ogram begins to press his hips forward into your waiting [pc.lips]. Your gag reflexes cut in, nearly choking you on the incredibly lengthy cock being fucked into your mouth until ");
	if(9999 == 9999) output("you desperately suppress it, too eager for a taste of Ogram’s seed to be deterred");
	else output("your Treated instincts kick in, and you suddenly relax at the masculine intrusion");
	output(". The sheer force of his insertion nearly pushes you back, but Amma’s quick to catch you, resting your head into her pillowy-soft chest, letting you ease back into the squishy cow-tits as Ogram spreads your throat wide on his cock.");

	output("\n\n“<i>Nice and tight,</i>” he says with a grunt of approval as his hefty nads knock against your chin. “<i>Awesooome.</i>”");
	output("\n\n“<i>[pc.He]’s pretty great, huh?</i>” Amma teases, shifting her tits around your head. “<i>Don’t hold on for me, Oggy! I can get a load any time, after all...</i>”");
	output("\n\nHe laughs, and plants his big hands on your shoulders. “<i>So generous today. Alright, " + pc.mf("buddy","beautiful") + ", just stay still a minute more.</i>”");
	output("\n\nYou’re not sure you can wait that long... but by God you’ll try. Anything is worth the sweet release of your bullish mate. He starts to thrust, fucking your mouth like an onahole, pounding you back into the soft buffer of his lover’s udders, her flesh rippling with every impact as his speed mounts. Faster and harder, each thrust carrying his titanic cock deeper inside you until your stomach feels like it’s bulging with his sheer length, your throat stretching like a well-trained pussy around him. You can feel every pulse of his heartbeat through his cock now, every shudder he makes as you pleasure him, the swelling of his member as your tight throat brings him to orgasm.");
	output("\n\n“<i>Deep breath!</i>” he shouts, moments before he cums. You have just enough time to do so before he rams his cock down to the hilt and unloads, bypassing your mouth entirely and shooting his wad right into your gut. You gasp and gag, unable to breathe as he cums, bloating your belly with a monstrous load of seed. You’re all but seeing stars by the time he starts to withdraw, still spewing spunk into you from his visibly lightening balls. The tip pops out of your mouth just at the tail end of his climax, blasting your tongue with a thick spray, following by your face and Amma’s, marking you both as Ogram’s bitches. You both eagerly open wide for the bull’s load, happily accepting his seed as it sprays across your faces until you’re dripping with it.");
	output("\n\nYou’d probably have collapsed if not for Amma behind you, gently rocking you as Ogram finishes with you. “<i>You did good, honey!</i>” she coos, her breath hot and heavy against your [pc.ear]. “<i>Oggy hasn’t shot a load like that in ages!</i>”");
	output("\n\nHe chuckles. “<i>She’s being modest, " + pc.mf("buddy","beautiful") + ". But seriously: if you suck cock that good, you’re welcome back any time.\</i>”");
	if(pc.hasCock()) 
	{
		output(" “<i>I might even share Amma with you, if you play your cards right.</i>”");
		output("\n\nShe swats him on the knee.");
	}
	output("\n\nYou give the pair a half-conscious nod as you’re helped up and start to collect your gear.");
	processTime(15);
	pc.lust(20+rand(10));
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Use Machine
function useDaMilkar():void
{
	clearOutput();
	author("Savin");
	showName("\nCARRIE");
	showBust("CARRIE");
	//{PC doesn't have a dick}
	if(!pc.hasCock())
	{
		showName("\nMILKER");
		output("\n\nYou step up to the cow-girl sitting on the stool and ask if you can use the machine here. The busty bovine looks up, looks you up and down, and giggles. “<i>Sorry, honey. I don’t think you... uh... have the right bits and pieces to use this machine.");
		if(pc.biggestTitSize() >= 1) output(" Why don’t you head on down to one of the other stalls? I’m sure the girls there will treat you right!</i>”");
		else output(" Maybe you ought to go down to the gift shop and ask Ellie for some enhancements, that way you can use the other machines, at least!</i>”");
		processTime(1);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
		return;
	}
	//{First time, PC has a dick}
	if(StatTracking.getStat("milkers/prostate milker uses") == 0)
	{
		output("You step up to the cow-girl sitting on the stool and ask if you can use the machine here. The busty bovine hops up and beams at you. “<i>Hey there! Sure you can, all the milkers - even this big lug - are open to visitors. My name’s Carrie, and I’ll be taking care of you while you use it, okay? Before we get started, I gotta tell you: unlike the normal milkers, the boy-milker here’s pretty involved. You’re gonna have to have me walk you through using it the first time at least, so I hope you’re comfortable with a girl seeing you naked.</i>”");
		clearMenu();
		//[Okay] [No thanks]
		addButton(0,"Okay",okayEllieYaCuntLetsMilkMeFirstTime);
		addButton(1,"No Thanks",FirstManMilkUseNoThanks);
	}
	//Repeat
	else
	{
		output("When you approach, Carrie hops up and flashes you a big, doe-eyed smile. “<i>Hey there, [pc.name]! You here to use the boy-milker again? If so, since you’ve used it before, you can go on ahead without me if you want... or would you rather I stick around and help you out? I don’t mind either way!</i>”");
		clearMenu();
		//Use w/ Carrie
		addButton(0,"w/Carrie",okayEllieYaCuntLetsMilkMeFirstTime,undefined,"w/Carrie","Ask Carrie to help you out in the milking stall. A little companionship never hurt, either.");
		//Use w/o Carrie
		addButton(1,"w/o Carrie",useTheMilkerWithoutCarrieYaSkag,undefined,"w/o Carrie","Tell Carrie you can get yourself situated.");
		addButton(14,"Leave",mainGameMenu);
	}
}

//No Thanks
function FirstManMilkUseNoThanks():void
{
	clearOutput();
	author("Savin");
	showName("\nCARRIE");
	showBust("CARRIE");
	//{PC will get First Time interactions until they decide to go through with it}
	output("If that’s the case, no thank you.");

	output("\n\nCarrie shrugs. “<i>Suit yourself, sugar. I’m sure there’s plenty of girls who’d be happy to take care of you if you get too pent up, so no worries!</i>”");
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Okay
function okayEllieYaCuntLetsMilkMeFirstTime():void
{
	clearOutput();
	author("Savin");
	showName("\nCARRIE");
	showBust("CARRIE");

	//if First time: 
	if(StatTracking.getStat("milkers/prostate milker uses") == 0) output("You nod and introduce yourself in turn. ");
	output("The auburn-tressed cow-girl grins and leads you into the stall, shutting the door behind you, flipping a little lock that turns on an OCCUPIED sign on the door. “<i>Not a lot of bulls need to use the boy-milker here - that’s a prostate milker if you want to get fancy - so you get to have some privacy, at least. Well, aside from me, anyway! Don’t worry, you’ll barely know I’m here. Unless you want to, anyway,</i>” Carrie says, giving you a little wink. “<i>");
	if(!pc.isNude()) output("Anyway, let’s get you out of those clothes, alright?</i>”");
	else output("I’ll hold onto your gear for you, alright?</i>”");

	output("\n\nA little nervously, you do as the cow asks, stripping off your [pc.gear] and handing your equipment over piece by piece. Carries lays it all out on a small table inside the stall before turning back to you, giving you a reassuring smile even as her wandering eyes take in your nude form. “<i>Alrighty then! Let me help you get strapped into the machine here,</i>” she says, practically skipping back to your side and indicating ");
	if(!pc.isBiped()) output("for you to just step up onto and over the machine, putting the weight of your belly onto it -- “<i>don’t worry, it can take your weight, no problem!</i>”");
	else output("a pair of stirrups at one end, and a handlebar at the other. With a little help from your bovine assistant, you’re able to hop onto the machine and, at her instruction, lay face-down atop it.");
	output(" Thankfully, a lining of wool padding separates most of your bare [pc.skinNoun] from the cold hard steel of the machine. Carrie adjusts the straps around your [pc.legs], making sure you’re nice and snug.");

	output("\n\n“<i>Pretty as a picture, stud!</i>” she cheers, taking a step back. “<i>Now, let’s get your bits and pieces tucked away down here,</i>” she adds, stepping behind you and reaching between your [pc.legs]. Your breath catches as her slender, strong fingers wrap around your [pc.cock], hefting your flaccid length and guiding it into the nearest of the many padded holes in the machine.");
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
	output(" in, she gives you a couple friendly tugs until you’re nice and rigid before turning to you and saying “<i>There we go, " + pc.mf("handsome","cutie") + "! There’s a little dial on the side of the machine - just twist it up and down to set how snug your little ");
	if(pc.cockTotal() == 1) output("buddy is");
	else output("buddies are");
	output(" down there. You want a nice, tight grip, but not uncomfortable. Trust me, you’ll be bucking your hips into ");
	if(pc.cockTotal() == 1) output("that hole");
	else output("those holes");
	output(" like crazy when we get started!</i>”");

	output("\n\nYou give her a nod and adjust the dials as she instructed, making sure your [pc.cocks] ");
	if(pc.cockTotal() == 1) output("is");
	else output("are");
	output(" nice and cozy in the softly padded, almost slick, holes. Once you’re finished and give Carrie the thumbs up, she steps back up to you with a big pink bottle in her hand. “<i>Almost set, sugar. I’m just gonna make sure you’re nice and ready for Mister Floppycock up there, and you’ll be ready for the ride of your life!</i>”");
	output("\n\nCarrie snaps on a latex glove and squirts a nice, thick handful of what can only be lube into her gloved palm. She rubs it between her fingers before reaching back to your [pc.butt] and wiping them through the crack of your ass. You wince at the sudden cold sensation, but manage to make yourself relax as a pair of her fingers begin circling, and then incessantly pressing in against, your [pc.asshole]. “<i>Just relax, babe. You’ll be glad you had a little help when we get started,</i>” Carrie coos soothingly, gently working a pair of her fingers into your ass. You bite your lip, trying not to groan too much as she gently spreads a nice, thick coat of lube through your anal passage.");
	output("\n\n“<i>If you ask me, this is how it ought to be,</i>” Carrie says conversationally as she fingers your behind. “<i>No need for this crazy ol’ machine, when you’ve got a cow with talented fingers at your beck and call! But that’s just me,</i>” she adds with a giggle, one of her fingers putting just enough pressure on your prostate to make your [pc.cocks] jump in ");
	if(pc.cockTotal() == 1) output("its restraint.");
	else output("their restraints.");

	output("\n\n“<i>All set!</i>” she says after another minute, pulling her lube-drenched fingers from your now equally-soaked behind. “<i>That ought to keep you nice and comfy while Mister Floppycock does his business. If you feel like you need more, don’t hesitate to ask, okay? This is supposed to be fun and, more importantly, feel really good. Just holler if you need something, okay? I’ll be right here with you the whole time, sugar. So lie back, relax, and get ready to cum buckets!</i>”");

	output("\n\nWith that, Carrie step back to her stool, dims the lights to a dark, moody hue, and presses a big red button next to the door. “<i>Have fun!</i>”");

	pc.lust(15);
	processTime(5);
	//[Continue to PROSTATE ABUSE WHOO]
	clearMenu();
	addButton(0,"Next",savinAbusesYerButtBecauseThatsHowHeLikesIt);
}

//Use w/o Carrie
//Tell Carrie you can get yourself situated.
function useTheMilkerWithoutCarrieYaSkag():void
{
	clearOutput();
	author("Savin");
	showName("\nCARRIE");
	showBust("CARRIE");

	output("You tell Carrie that you’ll be fine without her help.");

	output("\n\n“<i>You sure, babe? Okey-dokey, then. Job says I have to sit in the room with you, but you can get ahead and get yourself sat down and lubed up. Don’t hesitate to holler if you need help, though - that’s what I’m here for!</i>”");

	output("\n\nYou thank the red-headed cow and step into the stall with her. She closes and locks the door behind you, then sits herself down and hands you a bright pink bottle of lube from the table. You spend a moment ");
	if(!pc.isNude()) output("dressing down, ");
	output("setting your equipment aside on the table before mounting the milking machine. You shift your weight onto it and adjust the straps around your [pc.legs], leaving yourself nice and spread open. You lean back, squirt a nice thick dollop of lube into your palm, and spend a couple minutes getting yourself nice and ready. Your fingers find your [pc.asshole] easily, and with a little breathing exercise, you relax enough to slip yourself inside and slather your inner walls until they’re absolutely drooling with moisture. Perfect!");

	output("\n\nYou set the bottle aside and look back to your bovine attendant, giving her a thumbs up. “<i>Alright babe, just hold on and spread ‘em wide for Mister Floppycock!</i>” Carrie says, flashing you a grin before dimming the lights to a sultry haze of darkness and pushing the big red button next to her stool.");

	pc.lust(5);
	processTime(5);
	//[To Prostate Abuse Whoo!]
	clearMenu();
	addButton(0,"Next",savinAbusesYerButtBecauseThatsHowHeLikesIt);
}

//Prostate Abuse Whoo!
function savinAbusesYerButtBecauseThatsHowHeLikesIt():void
{
	clearOutput();
	author("Savin");
	showName("\nCARRIE");
	showBust("CARRIE");

	output("With a little mechanical buzz, the machine over your head rumbles to life. You watch with wide eyes as the steel arm slowly lowers from the ceiling, all the lights in the room seeming to concentrate on the long, hard rod. It’s almost majestic - or at least, as majestic as something can be when it has an almost comically oversized pink dildo hanging off of it. The prostate milker’s long arm extends well behind you, almost to the door, before steadily making its way back, finishing its descent at just the right speed so that it reaches you from above and behind at the same moment, coming in at something of a downward angle.");

	output("\n\nA moment later, the machine shifts ever so slightly until the crown of the thick, soft equine dong is pressed against your [pc.asshole]. You wince as a slight pressure builds against your hole, but penetration doesn’t follow... at least for now. Just when you’re about to complain, a booming mechanical voice from one of the machines on the wall announces: “<i>APPROXIMATING MEASUREMENTS. CALCULATING IDEAL VOLUME FOR MAXIMUM PENETRATION. PLEASE WAIT.</i>”");


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

	output("\n\nThe machine doesn’t care, though: it mechanically continues its ceaseless advance. Only when you feel the wide, cold steel base of the mechanical arm does the gut-filling pressure finally abate, giving you a moment to catch your breath. Your breath is already coming shallow and ragged as your body struggles to adjust to the overwhelming girth inside you. Your [pc.legs] strain against the straps, muscles going wild, desperate to escape. All you can consciously do is grip the handlebars at the head of your body-rest and brace yourself.");

	output("\n\nAll that in the span of no more than five seconds, before the machine begins to move again. You try to scream, but your voice fails to come, leaving your mouth agape in a silent “<i>O</i>” of ecstasy as the latex cock inside you pulls back, almost to the crown, before thrusting back in. One long, hard push inwards until it’s hilted inside you. Faster this time, taking only a couple of seconds to bury all twelve inches up your [pc.asshole]. You’re given no time to adjust, and the moment the dildo hilts you, it begins to withdraw again, keeping the same steady speed in, out, and in again. Your [pc.cocks] squirm");
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

	output("\n\nAll you can do is tightly grip the vaulting horse supporting you, groaning and crying in pleasure as the machine milks your prostate minute after minute, orgasm after orgasm until your [pc.balls] ");
	if(pc.balls <= 1) output("is");
	else output("are");
	output(" completely drained, cock");
	if(pc.cockTotal() > 1) output("s");
	output(" just drooling trickles of watery spooge into the unabating suction of the collecting pump. Only when you manage to cum on pretty much empty, your [pc.cocks] only shuddering and drooling in response to another anal orgasm, does the machine begin to slow. It takes six more thrusts before it finally manages to draw down to a creeping stop, still half-lodged in your ass, the full brunt of the cock’s crown pressing down on your poor, battered prostate. With agonizing sluggishness, the milker withdraws from you, making sure you feel every inch of vibrating latex prick rumble out of your abused, gaping [pc.asshole]. You’re not going to walk straight for days after this.... ");

	output("\n\n“<i>All done!</i>” Carrie announces, hopping off her stool and pressing the red button again. With a satisfied whir, the milker shudders and withdraws back up into the ceiling. Carrie walks over to you and puts a reassuring hand on your battered, bare butt. “<i>Poor thing. I hope Mister Floppycock wasn’t too rough on you. C’mon, let’s get you out of those straps...</i>”");
	//Doing this stuff early so display will have the full total:
	processTime(45);
	cumTotal += pc.cumQ();
	pc.orgasm();
	cumTotal += pc.cumQ();
	pc.orgasm();
	cumTotal += pc.cumQ();
	pc.orgasm();

	output("\n\nIt takes a minute for Carrie to help you out of the harness and onto your [pc.feet]. You’re a bit wobbly at first, but your bovine attendant steadies you and helps you collect and don your [pc.gear]. As you’re getting kitted up, Carrie wanders over to the spooge-collecting machine on the wall and punches a button labeled “<i>RESULTS.</i>” The display immediately lights up with the amount you produced: <b>" + cumTotal + "mLs</b>");

	output("\n\n“<i>Oh, hey, before you go: since we’ve collected your sperm properly, would you mind if we sold it? Plenty of people out there are real choosey about what genes they want, and you look like a " + pc.mf("prize winning stud","a cute lil’ thing any girl would want to father their children") + "! I can even give you some money for it up front!</i>”");
	
	//[Yes] [No]
	clearMenu();
	StatTracking.track("milkers/prostate milker uses");
	StatTracking.track("milkers/cum milked", cumTotal)
	addButton(0,"Yes",sureSellMyCumBabiesFarAndWide,cumTotal);
	addButton(1,"No",noIDontWantToSellBabies);
}

//Yes
function sureSellMyCumBabiesFarAndWide(amount:Number = 0):void
{
	var x:int = 2;
	x += Math.round(amount/100);
	if(x > 50) x = 50 + Math.round((amount-5000)/200);

	//honey worth more!
	if(pc.cumType == GLOBAL.FLUID_TYPE_HONEY) x *= 2;

	clearOutput();
	author("Savin");
	showName("\nCARRIE");
	showBust("CARRIE");
	output("“<i>Sure,</i>” you say, rubbing your [pc.butt].");

	output("\n\n“<i>Great!</i>” Carrie beams, pushing another button. A credit chit pops out of the machine. “<i>Here you go! You ");
	if(amount > 10000) output("gave us so very, very much");
	else if(amount > 1000) output("gave so much");
	else if(amount > 500) output("gave a pretty good amount");
	else output("gave enough");
	output(" that you’ll get " + x + " credits.");
	if(amount > 1000) output(" I’m sure you’ll have a whole bunch of little yous running around the galaxy in no time!");

	output("</i>”\n\nYou thank the cow-girl and take the chit before you stagger off.");

	pc.credits += x;
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//No
function noIDontWantToSellBabies():void
{
	clearOutput();
	author("Savin");
	showName("\nCARRIE");
	showBust("CARRIE");
	output("“<i>I’d rather you didn’t,</i>” you say, rubbing your [pc.butt]. ");

	output("\n\n“<i>Aww, you sure?</i>” Carrie says, blinking her big doe-eyes at you. “<i>A lot of mommies would be so happy to get some of your cum!</i>”");

	output("\n\nYou shake you head, and she sighs, turning back to the machine and pressing a button labeled “<i>DESTROY.</i>”");

	output("\n\n“<i>Okay, off to the incinerator it goes.</i>” ");

	output("\n\nYou thank the cow-girl before you stagger off.");
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}



/*
output("\n\n");
output("\n\nThe Ranch House");

output("\n\nPorch Room Description");
output("\n\nBig T.’s ranch house is like a super-sized version of an old Texas one, complete with a longhorn skull hanging over the door and a pair of rocking chairs on the front porch. An electric mosquito net hangs around the doorframe, the only sign of advanced technology around. Several cow-girls, bull-boys, and more human tourists are making their way in and out, many with black-and-white-splotched bags from the gift shop. ");

output("\n\nFoyer Room Description");
output("\n\nThe central room of the ranch house is a huge, wood-paneled affair, with old-school lever guns, tribal totems, and stuffed animals adorning the walls in between advertisements for the Treatment and for Texan Milk. A huge staircase in front of you leads upwards to the second floor, helpfully labeled “<i>Manager’s Office.</i>” A door to the right leads to the gift shop, which seems to be pretty busy {for the time of day}; to the left is a wide open set of double doors leading into what looks like a steakhouse, complete with a longhorn skull and horseshoes nailed to the barn-like door. ");

output("\n\nGift Shop Room Description");
output("\n\nThe gift shop looks like every other gift shop in the ‘verse, with racks of memorabilia ranging from ten-gallon hats to holographic greeting cards. There’s a pretty good line leading up to the cashiers, and the most popular item going out seems to be a small white needle labeled “<i>The Treatment.</i>” ");

output("\n\nBig T.’s Barbeque Pit");
output("\n\nThe restaurant attached to the ranch house is a smoky, meaty-smelling BBQ joint, advertising authentic terran steaks, ribs, and roast beef sandwiches. An open grill dominates the far northern wall of the restaurant, with several tourists and cow-folk lined up to order some delicious barbeque. {Herman the chef // The chef} is busily trying to fill the orders as they come in, clearly swamped with customers. ");

output("\n\nSecretary’s Room Description");
output("\n\nAt the top of the stairs is a small, cozy room decorated with several hunting trophies, swords, old-earth guns, and a large wooden desk with a subtly built-in holoterminal. Behind is sits an abnormally flat-chest cow-girl, barely sporting D-cups, dressed much more conservatively than the scantily (if at all) clad cows on the ranch proper. “<i>Are you here to see Mr. T.?</i>” she asks, looking up from her work, “<i>He’d be happy to see you. Go on through.</i>”");

output("\n\nBig T.’s Office Description");
output("\n\nThe office of the planetary governor, Big T., is a warm, spacious office with plenty of seats and couches and several bookshelves, looking more like an aristocrat’s study than a government office. The room is dominated by a huge, oaken desk facing the door, a semi-circle of wood alight with monitors, holo-displays, and other readouts, all angled towards a huge, comfy-looking chair. {if T isn’t dead/broken: “<i>The towering bull-like governor is sitting at his desk, busily talking and typing, managing the world’s affairs all from his desk.</i>”}");

output("\n\nBig T.’s Barbeque Pit");

output("\n\n//Fen: This’d be as good a place as any to stick Dane. ");

output("\n\nThe restaurant attached to the ranch house is a smoky, meaty-smelling BBQ joint, advertising authentic terran steaks, ribs, and roast beef sandwiches. An open grill dominates the far northern wall of the restaurant, with several tourists and cow-folk lined up to order some delicious barbeque. {Herman the chef // The chef} is busily trying to fill the orders as they come in, clearly swamped with customers.");

output("\n\n[Food]");

output("\n\nFood (First Time)");
output("\n\nYou queue up in line, glancing up the menu hanging over the grill: chalk on a blackboard, about as old-school as the rest of the decor. The line’s pretty quick-moving despite there only being one man at the grill: a towering, meaty bull-man who looks like he’s enjoyed quite a bit of his own cooking on top of the Treatment’s effects, leaving him looking like a brick house of muscle and belly. At the sweltering heat of the grill, you can see he’s not wearing much more than a pair of jeans and his great big “<i>Kiss the Cook</i>” apron. His arms are a blur as he flips burgers, sauces ribs, and pulls fries out of the deep-fryer.");

output("\n\nFinally, you’re up in line. Now that you’re closer, you can see why the chef’s able to go so fast through the orders: several robotic arms are working alongside him, tending to the orders a little further back, operating in concert with the chef so that even the one man can cook for dozens. The chef turns to you with a big grin. “<i>Hey! You’re new here, aren’t ya? Name’s Herman, and I run the place. What can I get you?</i>”");

output("\n\nFood (Repeat)");
output("\n\nYou queue up in line for the Barbeque Pit once again. The line moves fast, and pretty soon you’re face to face with Chef Herman again. “<i>Welcome back!</i>” he grins, “<i>What can I get you?</i>”");

output("\n\nGetting Fed");
output("\n\n[Roast Beef] [Ribs] [Burger] [Salad] [BBQ To-Go] ");
output("\n\n{If PC has Female Treatment/ is Bimbo/ has Fluid Addiction: ["Special Order</i>”]...}");

output("\n\n//Food Chosen (Except BBQ To-GO / Special Order)");
output("\n\nYou give herman your order, which he punches in on the register. He hands you a numbered ticket: “<i>Be right up, {buddy / missy}.</i>”");

output("\n\nYou take your ticket and head over to one of the benches to wait. Before you can even sit down, though, you hear Chef Herman calling out your number. Damn, that’s fast! You return to the chef, pick up your order, complete with a side of fries and a big ol’ soda, and take your seat. A few bites is all it takes to convince you that Chef Herman’s cookin is finger-licking good! ");

output("\n\n{Energy Restored. Slight gain to thickness; salads slightly reduce thickness}. ");

output("\n\n//BBQ To-GO");
output("\n\n“<i>One to-go box, please,</i>” you say, pulling out your cred stick. ");

output("\n\n“<i>Good choice! These babies will keep good for ages, but pop the top and it’ll be hot like it was right off the grill and as tasty as the day I cooked it,</i>” Herman says proudly as he rings you up. From under the counter, he hands over a big, black-and-white mottled box that’s ever-so-slightly warm to the touch and smells delicious. ");

output("\n\nBBQ To-Go");
output("\n\n//Tooltip: A tasty packaged meal from the Barbeque Pit on New Texas, this ever-fresh BBQ meal comes with fries and soda. Probably not great for your figure, but it’s guaranteed to give you a boost of energy in the middle of a long day at the office... or of galactic adventuring. ");
output("\n\n//Effect: %Chance +thickness, +25 Energy");
output("\n\n//Use: You pop open the packaged BBQ To-Go meal and quickly munch down a nice, hot, fresh-tasting roast beef sandwich and fries, washing it down with a swig of sweet bottled orange soda. Delicious!");


output("\n\n“<i>Special Order</i>”");
output("\n\n//Requires feminine PC with the Treatment, Fluid Addiction, Bimbofication, etc. ");
output("\n\n//Tooltip: You bet that chef’s got a nice, thick member that needs some relief, all pent up in those tight pants of his... and you bet it’d taste great with a little of his home cooking...");

output("\n\nYou lean over the counter, looking the chef up and down, your eyes drawn toward the thick, heavy bulge tenting the chef’s greasy apron. “<i>Uh, is there something I can get you, miss...?</i>” he starts to ask, before his gaze follows you down. ");

output("\n\nGrinning lasciviously, you point down to the suddenly-larger bulge and say, “<i>I’ll take a great big helping of that, Chef.</i>” ");

output("\n\nHe seems to think for a moment before nodding toward the little door behind the grill. You quickly hop out of line and through the door, scooting down onto your [pc.knees] beneath the counter. Your hands run up Herman’s tree-trunk legs, brushing across his jean-clad thighs as you push the hem of his apron aside, giving yourself access to the chef’s fly. Even as you’re getting busy, though, Chef Herman doesn’t stop working; he dutifully turns back to the grill after grabbing the next order up, starting to cook just a surely as if there wasn’t a cum-hungry whore trying to free his cock. ");

output("\n\nYour deft fingers lock around his zipper, carefully tugging it down and grabbing the meaty shaft of Herman’s cock. You roll his apron up to get a look at your prize: it’s as big as you’d hope, more than a foot and a half of turgid meat expanding at your touch, filling out to its full length at your tender touches. It’s bear-like in shape, thicker around than you can wrap your fingers over and blunted at the tip, its thick gash of a urethra sitting in a basin-like depression between the flat mass of cockhead. ");

output("\n\nUnbeckoned, your hungry tongue slips out and laps along the underside of Herman’s rod. That finally gets a reaction out of the hard-working stud; he shudders, teeth gritting. He turns from the grill to the register, and you move with him, taking the opportunity to draw your tongue along the side of his freed willy. The taste is unbelievable, so good... musky, thick, manly. Like every male on this wonderful world, Herman seems to exude an aura of unwavering masculinity, the kind of men that spend their days breeding bitches, to whom sex is life itself. The flavor of his cock is electrifying, only spurring on your rampant, instinctual need for his cum. When Herman turns again, your lips lock around his flared, bearish cockhead, jaw straining to take the sheer girth of his blunted mast. ");

output("\n\n“<i>Eager, aren’t ya?</i>” Herman grunts under his breath, reaching down to {if no horns: pat your head //else// grab one of your bestial horns, pulling you down on his rod}. Your expertly-tamed gag reflexes subside utterly as his big, rough hand guides you down his bestial member, your throat expanding around the long, thick schlong being crammed down it. Herman turns again, all but dragging your limp, cock-craving body with him; you obediently follow the stud’s every motion, all conscious thought subsiding to the desperate need to suckle from his cock, to drain every drop of delicious, salty seed from his loins. ");

output("\n\nWhen his hand leaves your head, reaching for his spatula, your cock-sucking instincts take over from him, your head bobbing up and down his length on automatic. Herman grunts again, breath catching as your tongue swirls around his flared head, as your hands stroke the shaft when your mouth is elsewhere. When you slide yourself back down his length, your hands reach through his fly, cupping a pair of heavy, meaty nuts still inside, covered with a thick layer of fuzz. You cup the bull’s twin, churning balls, barely able to contain your own excitement as you feel them, feel how full them are, ready to flood your needy lips with semen if you work just a little bit harder. ");

output("\n\nYou gently squeeze and caress Herman’s hefty sack, moving your head along his cockflesh faster and faster, working yourself to a feverish pace of sucking and wanking, working as quick as you can to extract your salty meal from the chef’s meat. He grunts, a bull-like snarl as you work him over; his cock throbs and trembles with building need, so close to release you can taste the thick, creamy treat... or is that just the river of pre pouring down your throat? ");

output("\n\n“<i>Slow down, or I’m gonna... gonna...</i>” Herman starts to stay, his voice trailing off into a wordless, bestial groan. You can feel his cock expanding, the thick load moving through it, shooting towards the waiting reception of your [pclips]. Just before the moment of his release, the chef roughly pushes you off his cock, sending you back with a yelp of surprises and utter disappointment. Instead of your mouth, the chef leans down and catches his cockhead between the folds of a hot, greasy roast beef on rye right off the grill. His hips buck like a bronco’s as he blows his load across the open lips of the sandwich, slathering it with his own special topping.");

output("\n\n“<i>Order up,</i>” Herman grunts, slapping the spunk-filled roast beef closed and handing it down to you. “<i>On the house.</i>”");

output("\n\nTalk about eating cum. You giggle and take the sandwich, munching down on the savory, salty cock-based concoction. The taste sends shivers of pure ecstasy down your spine as you finally sate your hunger for cum... and also lunch. You slump back against the interior of the counter, feasting upon the creamy sandwich. Delicious!");
*/