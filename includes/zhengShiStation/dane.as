//Dane Returns: By Fenoxo Fenbutt
//Nearly 8’ tall. (7’11”</i>)
//Albino. Super white skin and fur.
//Piercing red eyes
//Short ponytail
//Competent merc but also a bit of a bro. Relies on force to solve most problems.
//Decent amount of wit but not a great planner.
//Doggo boi is level 11 now.
//Dane Plans/Ideas
//Dane only fucks feminine-presenting PCs with C+ cups.

public function daneAtZhengShi():Boolean
{
	if(daneIsCrew()) return false;
	if(!zhengCoordinatesUnlocked()) return false;
	return true;
}

public function daneCockVolume():Number
{
	return 250;
}

//Encountering Dane
public function daneBonus(buttLoc:Number = 0):void
{
	if(flags["DANE_PUNCHED"] == undefined) 
	{
		output("\n\nA four-armed ausar sits hunched over the bar, swirling an amber-colored drink in a tumbler that seems a bit too small for his meaty mitts. Judging by the white fur, short ponytail, and the glint of red in his eye... could it be Dane? What’s he doing here?!");
	}
	//Repeat Danestuff
	else
	{
		output(RandomInCollection(["\n\nDane is still here, still relaxing at the bar, and still sipping slowly at what looks like whiskey that’s sat out for too long and allowed all the ice melt.","\n\nThe four-armed figure of Dane, your cousin’s former bodyguard, hunches over the bar without much concern for the raucous pirates around him.","\n\nDane relaxes by the bar, sipping whiskey with a bored expression on his face.","\n\nSlouched in front of the bar is the familiar four-armed figure of the albino mercenary, Dane.","\n\nDane lounges by the bar and brushes off pirates’ attempts at smalltalk like swarms of gnats."]));
	}
	addButton(buttLoc,"Dane",approachDane);
}

public function daneMenu():void
{
	clearMenu();
	addButton(0,"Talk",talkToDaneIntro);
	if(flags["DANE_NO_SEX"] != 1)
	{
		if(flags["DANE_SEXED"] == undefined) addButton(1,"Flirt",daneSexIntro);
		else addButton(1,"Please Him",daneSexIntro,undefined,"Please Him","Dane’s going to take charge if you want to sleep with him, but that’s what you want, isn’t it?");
		if(pc.lust() < 33) setButtonDisabled(1);
	}
	else addDisabledButton(1,"Flirt","Flirt","You turned down Dane so hard that flirting isn’t really an option any more.");
	addButton(14,"Leave",mainGameMenu);
}

//[Dane]
public function approachDane(back:Boolean = false):void
{
	clearOutput();
	showDane();
	author("Fenoxo");
	if(flags["DANE_PUNCHED"] == undefined)
	{
		output("You step a little closer, sizing the ausar up to verify that you are indeed approaching Dane, your cousin’s former bodyguard, and there’s no other conclusion to come to: it’s him. He’s even wearing the same armor he wore on Mhen’ga, right down to the glowing shield booster nestled into his pecs.");
		output("\n\nWith the din of dozens of clamoring voices filling the air, Dane hasn’t noticed your approach just yet. You have the opportunity to choose how to handle this. Do you want to go for some cheap revenge and lay him out with a sucker punch or see if the mercenary is down to talk now that he’s lost his job?");
		processTime(1);
		clearMenu();
		addButton(0,"Punch",punchDanesSnoot);
		addButton(1,"Greet",greetDane);
	}
	else if(back)
	{
		output("Dane sits in companionable silence for the moment.");
		daneMenu();
	}
	else
	{
		//Approach
		output(RandomInCollection(["You pull up a seat next to Dane, and the albino bruiser shifts position to better regard you. <i>“Back again, I see. Here for a stiff drink, or just looking to pry some dirt on your cousin out of me?”</i>","You greet Dane as you slide yourself onto one of the stools.\n\n<i>“Take some time off from your quest to join my little pity party, huh?”</i> Dane swirls his glass before taking a discrete sip. <i>“Hearing you out’s the least I can do, I guess. What’s up?”</i>","Dane lifts his glass. <i>“Welcome back, [pc.name]. I see the pirates haven’t broken you yet. Best keep your wits about you, though. This lot isn’t exactly known for their honor.”</i> He gestures at a Jumper down the bar who is, at this very moment, slipping a pill into her neighbor’s drink. <i>“Guard your drinks if you don’t wanna be somebody else’s carnival ride.”</i> He snorts derisively. <i>“You got an intent look in your eye. Something you need?”</i>","Dane nods quietly in your direction. <i>“[pc.name]. What brings you my way?”</i>"]));
		daneMenu();
	}
}

//[PUNCH]
//Forks based on PQ%
public function punchDanesSnoot():void
{
	clearOutput();
	showDane();
	author("Fenoxo");
	output("You close the rest of the distance at a brisk pace, winding up as you go. The second your shadow falls across the merc mutt’s view, your fist is there to follow it straight into his cheekbone. Your suckerpunch takes Dane completely off guard");
	//PQ >= 90 - knock him off his chair and onto his ass
	if(pc.PQ() >= 90) 
	{
		output(", and with all your power and frustrations poured into it, it knocks the fluffy albino completely out of his chair. He spins halfway around on his way down, falling on his back. Acrid-smelling booze splashes over him when his cup shatters on the deck next to him.");
		output("\n\nA fitting place for him.");
		output("\n\n<i>“Who the f-”</i> Dane starts, rubbing his jaw and blinking a bit of sense back into his blearing eyes. <i>“Oh shit, it’s you!”</i> He springs up onto his feet with surprising swiftness, three fists upraised while the fourth extends outward, open-palmed.");
	}
	//PQ >= 70 - hit him halfway out of his chair
	else if(pc.PQ() >= 70)
	{
		output(", and with all your frustrations and strength poured into it, it knocks the fluffy albino halfway out of his chair. He saves himself at the last minute with a desperate grab for the bar, barely pulling himself back up while the tinkling shards of glass that were once his cup explode across the deck below.");
		output("\n\n<i>“Who the f-”</i> Dane starts, rubbing his jaw and instinctively lifting two of his arms defensively. <i>“Oh shit, it’s you!”</i> A third fist joins the first two while his free hand extends outward, open-palmed.");
	}
	//PQ >= 50 - solid ass hit
	else if(pc.PQ() >= 50)
	{
		output(", and with all your frustrations behind it, it staggers the fluffy albino, though not quite violently enough to roust him from his barside throne.");
		output("\n\n<i>“Who the f-”</i> Dane starts, rubbing his jaw in annoyance and whipping around. <i>“Oh fuck. It’s you!”</i> He puts two of his fists up into blocking position while the other two extend outward, placatingly.");
	}
	//else: barely budges
	else
	{
		output(", and despite the healthy load of frustration and anger behind it, the albino barely reacts. He sets his drink down and sighs heavily, turning with deliberate slowness. <i>“Look, buddy, do you really want to have a go, be-”</i> Crimson eyes widen in recognition. <i>“Fuck, it’s you!”</i> He chuckles, putting a hand up palm-first, trying to be disarming." + (flags["LOST_TO_DANE_ON_MHENGA"] == 1 ? " <i>“Never did learn how to throw a punch,”</i> he chuckles.":""));
	}
	//MERGE
	output("\n\n<i>“Look Steele, I " + (flags["LOST_TO_DANE_ON_MHENGA"] != 1 ? "probably":"definitely") + " deserved that, but I don’t think you wanna take this much further.”</i> He gestures over his shoulder at the casino’s security. <i>“They tend to take a real sour view on people who fuck up their establishments, and tangling with me? We’d tear up half the Rec Deck.”</i>");
	output("\n\n<i>“So?”</i>");
	output("\n\nDane pauses, crimson eyes flickering with barely suppressed irritation. <i>“It’s not my job to fight you anymore, dipshit.”</i> ");
	if(pc.PQ() >= 90) output("He eases himself back toward his chair, eyeing you warily.");
	else if(pc.PQ() >= 70) output("He eases himself the rest of the way back into his chair, eyeing you warily.");
	else if(pc.PQ() >= 50) output("He relaxes somewhat, still eyeing you warily.");
	else output("He leans back, a cocky smirk on his features.");
	output(" <i>“If I’m gonna throw down, I want to be paid for it.");
	if(flags["LOST_TO_DANE_ON_MHENGA"] != 1) output(" Don’t get me wrong, I’m still pretty torqued about you beating me on Mhen’ga, but there’s no point in getting enslaved by pirates over ancient history.”</i>");
	else output(" Don’t get me wrong, I get that you’re still pretty torqued about what went down on Mhen’ga. I would be too, but it ain’t worth getting enslaved by a bunch of pirates over.”</i>");
	output("\n\nA quick survey of the area confirms the alabaster ausar’s hypothesis: fighting here would be unwise.");
	output("\n\n<i>“Now between you and your cuz, I thought you were the more decent of the two, though my jaw’s suggesting I revise that opinion. Way I see it, you have two choices.”</i> He points at the bar. <i>“You could have a seat like anybody else would and get yourself a drink, maybe even talk out your beef, or you can storm off after sucker-punching a guy in a bar and be exactly what [rival.name] says you are.”</i> He spreads his lower arms wide. <i>“The choice is yours.”</i>");
	//Track if punched dane for reasons.
	flags["DANE_PUNCHED"] = 1;
	processTime(5);
	daneMenu();
}

public function greetDane():void
{
	clearOutput();
	showDane();
	author("Fenoxo");
	output("You pull up a chair next to Dane. <i>“");
	if(pc.isBro()) output("Yo.");
	else if(pc.isBimbo()) output("Heyyy there, Daney! Remember me?");
	else if(pc.isNice()) output("Hello, Dane.");
	else if(pc.isMischievous()) output("Long time no see, Daney-boy.");
	else output("Dane.");
	output("”</i>");
	output("\n\nDane glances over, then does a double-take that nearly spills him out of his chair ass-over-head. It takes a white-knuckle grip from his lower limbs to hold him steady as he looks you over. <i>“[pc.name]? [pc.name] Steele?”</i>");
	output("\n\n<i>“");
	if(pc.isBro()) output("Yep.");
	else if(pc.isBimbo()) output("Yep!");
	else if(pc.isNice()) output("Precisely the same.");
	else if(pc.isMischievous()) output("You guessed it.");
	else output("That’s me.");
	output("”</i>");
	output("\n\nSlowly nodding, the ausar mercenary takes a small sip from his drink. <i>“Surprised to see you here, to be honest. Didn’t figure your little race would take you to a blasted-out chunk of rock in the rim like this one, though if my foresight was worth a damn, I never would’ve taken that job with your cousin. Fuckin’ weirdo.”</i> He chuckles softly, still not quite sure of your intent. <i>“Look, I’m not much for conversating while there’s a good chance I’m gonna get punched in the face, so just in case you’re harboring a grudge, remember that the pirates won’t take too kindly to their little altar of greed getting trashed, and if it came to a tussle... I’m pretty sure I’d fuck up half the deck before we got done.”</i> The way he says it makes it clear that to him, this is a statement of fact.");
	output("\n\nYou glance over your shoulder to scope out the security, and sure enough, there’s more than a few eyes on the pair of you. <i>“So?”</i>");
	output("\n\n<i>“So,”</i> Dane continues, seeming bored, <i>“Whatever beefs we’ve got between us - float it. I was on a job with a boss who spent half my day filling my head with lies, and you - you’re too driven to let anything stand in your way. Not even a four-armed ausar.”</i> He pauses");
	if(flags["LOST_TO_DANE_ON_MHENGA"] != 1) output(", remembering his defeat at your hands");
	else output(", an apologetic look on his face as he recalls your previous encounters");
	output(". <i>“Any scrapping we do would just cost us both time and money we could be spending on drinks and sluts. ‘Way I see it, we’re both doing pretty good right now. You coulda hit me with a cheap shot, and you didn’t, which already puts you a few lightyears ahead of your cousin in the decent [pc.guyGirl] department.”</i> He grins, flashing teeth as white as his hair. <i>“So, drinks and sluts it is then, right?”</i>");
	output("\n\nYou suppress a chuckle and consider your options.");
	processTime(2);
	flags["DANE_PUNCHED"] = -1;
	clearMenu();
	daneMenu();
}

//Talk
public function talkToDaneIntro(back:Boolean = false):void
{
	clearOutput();
	showDane();
	author("Fenoxo");
	//Initial
	if(!back)
	{
		output("You signal that you’re just here to talk for the moment.");
		output("\n\n<i>“Talk’s cheap,”</i> Dane says. <i>“Cheaper than the drinks here, anyway.”</i> He glances disappointedly at his drink before looking back at you. <i>“So what do you wanna know?”</i>");
	}
	else
	{
		if(rand(2) == 0) output("Dane stretches during the break in conversation.");
		else output("Dane idly cracks his neck, watching you sidelong as you consider where to take the conversation.");
	}
	daneTalkMenu();
}

public function daneTalkMenu():void
{
	clearMenu();
	if(flags["LOST_TO_DANE_ON_MHENGA"] == 1) addButton(0,"TentacleD",talkToDaneAboutHisTentacle,undefined,"TentacleD","Ask Dane about the rather unique penis he savaged you with on Mhen’ga.");
	else addDisabledButton(0,"TentacleD","TentacleD","You need to have lost to Dane on Mhen’ga to discuss this topic.");
	addButton(1,"Your Cuz",talkDaneAboutYoCousin,undefined,"Your Cuz","Ask Dane what it was like to work for your cousin. Your guess? Awful.");
	addButton(2,"Other Jobs",askDaneAboutOtherJobs,undefined,"Other Jobs","Go digging to see if he’s got any stories to share.");
	if(flags["LOST_TO_DANE_ON_MHENGA"] == 1 || flags["DANE_JOBS_TALK"] == 1) addButton(3,"Harem",danesHaremTalk,undefined,"Harem","Dane has made mention of having a harem in the past. You don’t see any girls here. Where are they?");
	else addDisabledButton(3,"Locked","Locked","You’ll need to ask Dane about his previous jobs to unlock this topic.");
	addButton(4,"His Start",daneStartTalk,undefined,"His Start","How does a guy like Dane get his start in the merc game?");
	if(pc.hasItemByClass(ShockBlade)) addButton(5,"ReturnBlade",giveDaneShockblade,undefined,"Return Blade","Give Dane back the shock blade you took from him after defeating him on Mhen’ga.");
	else addDisabledButton(5,"ReturnBlade","Return Blade","You cannot give Dane back one of his swords if you do not have that sword to give.");
	addButton(14,"Back",approachDane,true);
}

//TentacleD - requires he fucked ya on mhenga
public function talkToDaneAboutHisTentacle():void
{
	clearOutput();
	showDane();
	author("Fenoxo");
	//Bimbo
	if(pc.isBimbo()) output("Suppressing a giggle, you ask, <i>“So like, why the tentacle cock thing?”</i>");
	//Bro
	else if(pc.isBro()) output("You quirk an eyebrow. <i>“So... tentacle junk?”</i>");
	//Nice
	else if(pc.isNice()) output("You sheepishly ask, <i>“Where’d you get that crazy tentacle cock anyway?”</i>");
	//Mischievous
	else if(pc.isMischievous()) output("You smirk. <i>“So they make you check that tentacle you call a dick at security? I’m pretty sure it could be classified as a garrote.”</i>");
	//Hard
	else output("<i>“So how’s an ausar end up with dick that’s the dog-cock equivalent of anal beads?”</i>");
	//Merge
	output("\n\nDane’s guffaw doubles him over, his clenching abdominals flexing with the force of his mirth. <i>“You... we fuck with you on two fucking planets, nearly fuck you on a third, and when we finally get a chance to talk like normal fucking people... you wanna know how I got the beast I buttfucked you with.”</i> He slowly shakes his head and wipes at the corner of his eye. <i>“Hoo boy, and I thought I had a one track mind. I guess you got me beat.”</i>");
	output("\n\nYou lean against the bar, propping your head up in the palm of your hand and waiting expectantly.");
	output("\n\n<i>“Okay okay! Keep your fucking panties on.”</i> Dane grins. <i>“Or off. Whichever.”</i> He scratches his scruff for a moment as his eyes go far away, searching through old memories. <i>“It could be a long story if I cared to tell the whole of it.”</i> He sips his whiskey. <i>“I don’t. You can have the short version. Turns out when you’re a young, dumb merc with an itch to prove to the whole galaxy what a badass you are, you’ll go for damn near any mod that’ll give you an advantage.”</i> He half-heartedly flexes a quartet of bulging biceps. <i>“Four arms with naturally heightened muscle formation? Sure. A little extra height? Alright. A dick that’s a dual purpose sex-toy and essentially an entire ‘nother limb? Sign me right the fuck up.”</i>");
	output("\n\nYou ask him where he got the mod from.");
	output("\n\n<i>“Xenogen.”</i> Dane rolls his eyes. <i>“Took a job from them to help gather some rare DNA from a rather reclusive species along the old rim, before the Rush. Mercenary work was a little harder to get back then, so I took what I could get, even if it meant wrangling with snotty tentacles. I’ll never forget what those gross little fuckers looked like - and those eyes!”</i> He shudders. <i>“Of course, as payment, my boss - Doctor Jazzswell or something - got me access to an early version of a mod they were making.”</i> He balls up a fist and slaps it into his thigh, miming depressing a plunger with his thumb. <i>“Passed out on the spot and woke up with the squirmiest, knottiest cock any ausar’s ever seen. At the time I was pretty excited.”</i>");
	output("\n\nYou tilt your head quizzically. <i>“You aren’t now?”</i>");
	output("\n\n<i>“Nah. I got tired of it. Waking up with your dick in your mouth might sound fun, but it can get pretty annoying.”</i> He leans closer, his next words a whisper, <i>“And between you and me, a cock burrowing into your ass of its own volition isn’t exactly pleasant.”</i> He jabs his thumb into his chest. <i>“And it sure as shit isn’t my scene. Don’t get me wrong - I’d bed a gryvain or kui-tan girl, dick and all, but I prefer to be the one dishing out the fun, ya know?”</i>");
	output("\n\nA slow nod is all it takes to egg the ausar on into continuing his tale.");
	output("\n\n<i>“Yeah, well after that job with your cousin, I had a pretty decent amount of credits squirreled away. Figured it was time to deal with that wiggling inconvenience and get myself the sort of cock that’d match the rest of me - you know, hunky mercenary-stud.”</i> Dane’s canines glint in the neon light as he flashes a wolfy grin. <i>“Course I couldn’t see completely abandoning my species, ya know? Doesn’t seem right, throwing out something as awesome as a knot. Bitches love getting knotted, and I love knotting bitches.”</i> Dane pats his groin, pleased as punch. <i>“So I got myself a real bitch-breaker of a horse-cock but kept the knot. Made me real popular with the Jumpers on station, let me tell ya.”</i>");
	output("\n\nYou pull your eyes back up to the white-furred ausar’s shit-eating grin.");
	output("\n\n<i>“");
	if(flags["DANE_SEXED"] == undefined) output("Let me know if you wanna take it for a spin.");
	else output("Let me know if you wanna take it for another spin.");
	output(" I got time to kill, and there’s plenty of booths with privacy screens.”</i> Dane winks.");
	processTime(15);
	clearMenu();
	addButton(0,"Next",talkToDaneIntro,true);
}

//Your Cousin
public function talkDaneAboutYoCousin():void
{
	clearOutput();
	showDane();
	author("Fenoxo");
	output("You ask Dane about what it was like to work for your cousin.");
	output("\n\n<i>“Shitty.”</i> The answer is sharper than the canine man’s electrified blades and nearly as short as a shot from the dual pistols he favors. <i>“Your cuz is a walking pile of ego wrapped in skin thinner than tissue paper. [rival.HeShe] blames [rival.hisHer] problems and shortcomings on everybody but [rival.himHer]self. Forgot to fuel up before a trip? It’s my fault for distracting [rival.himHer] with my “filthy mutt fur.” Get thrown out of a shop for being an entitled cunt? No it’s not because of how [rival.heShe] acted. How could it be? It’s Victor’s fault for slandering [rival.hisHer] good name.”</i> Dane snorts. <i>“If I was meaner or smarter... or maybe both, I would’ve airlocked [rival.himHer] the second [rival.heShe] tried dictating when and where I could masturbate.”</i>");
	output("\n\n<i>“[rival.HeShe] did that?”</i> you ask, incredulous.");
	output("\n\n<i>“Oh yeah.”</i> Dane sighs. <i>“You’ve been on Mhen’ga. You know what the zil </i>smell<i> like, and what venus pitcher pollen’ll do to your head.”</i> He scowls. <i>“Didn’t even let me fuck the zil I took down, and they wanted it. Practically begged me, but nooo. I had to take the high paying job from the asshole and get stuck blowing half my profits on Chill Pills.”</i> A heavy shrug works its way through his beefy shoulders. <i>“By the time we bumped into you, I would’ve fucked a hole in the ground if I got the chance... and when [rival.name] gave me the all clear to do whatever I wanted with you...”</i> Dane scratches the back of his head, just beneath his ponytail. <i>“" + (flags["LOST_TO_DANE_ON_MHENGA"] != 1 ? "It’s a lucky thing you bested me. If you hadn’t, I’d have fucked your ass so hard you’d be tasting my dick in the back of your throat.":"It’s not my proudest moment, that’s for sure.") + "”</i>");
	//Got fucked
	if(flags["LOST_TO_DANE_ON_MHENGA"] == 1)
	{
		output("\n\n");
		if(pc.isBimbo()) output("<i>“I dunno. You fucked like a champ!”</i>");
		else if(pc.libido() >= 66) output("<i>“I don’t think anyone else has come close to fucking me like that.”</i>");
		else if(pc.libido() >= 33) output("<i>“Well... I came too.”</i>");
		else output("You chew your lip for a second before deciding not to comment on how hard you came.");
	}
	//No fucked
	else
	{
		output("\n\n");
		if(pc.isBimbo()) output("<i>“Awww... that would’ve been fun!”</i>");
		else if(pc.isNice()) output("You slap him on the back. <i>“But you didn’t.”</i>");
		else if(pc.isMischievous()) output("You shrug. <i>“Woulda had to win the fight to worry about that.”</i>");
		else output("<i>“Better luck next time, big guy.”</i>");
	}
	//Merge
	output("\n\nDane knocks back a much more sizeable sip of his whiskey than you’ve seen him take before. <i>“Yeah so after that mess, we hit up Tarkus. Didn’t have as much trouble with you over there, but your cousin was just as insufferable. Not only did I lose a gun to a sydian and my favorite codex to a raskvel, but I had to pound those pretty silver bimbos into paste for [rival.himHer] - not that it did much permanent harm. I watched one slither right back into shape the moment we stepped a few paces away.”</i> His pointed ears flick in irritation. <i>“What really ruffles my fur was how pointless it all was. We didn’t need to step outside the Nova. We could’ve just sat around getting drunk until the little junk-rat put the probe up for sale.”</i>");
	output("\n\n<i>“And on Myrellion?”</i> you ask.");
	output("\n\nDane growls. <i>“Fucking Nyrea. If I never see another one of those as long as I live, I’ll be happy. They put me in a cage and took my weapons, but I don’t need weapons to rip through a self-righteous shitsack.”</i> He lifts his glass to you. <i>“Maybe someday I’ll get a chance to fuck up your cousin the same way I did those snide bug-cunts. Probably better than [rival.heShe] deserves after putting me through that and stiffing me on that planet’s payment.”</i>");
	output("\n\n<i>“[rival.HeShe] didn’t pay you?”</i>");
	output("\n\n<i>“No, [rival.heShe] didn’t.”</i> Dane’s lip curls back as his brow sets in anger. The veins on his biceps stand out a little bit more as fingers go white around his glass. <i>“[rival.name] thought that since we got captured, I had “failed” at my job, even though I took a half dozen wounds fighting our way out of that hellhole barehanded.”</i> He presents one of his right arms, displaying a long scar just above his elbow. <i>“They don’t fuck around with those spears of theirs.”</i> After a moment he rests it back upon the polished bartop. <i>“I had to claw my way out of that hellhole, trying not to bleed out the entire time, and by the time we finally get back to the DMZ, I find out that [rival.name] stiffed me </i>and<i> stranded me on that bug-infested shitheap.”</i>");
	output("\n\nNow this is interesting. <i>“How’d you get here?”</i>");
	output("\n\nDane scowls at you. <i>“That’s a real fuck of a question, isn’t it? In my ship, same as you. Just because I was riding shotgun in [rival.name]’s cozy little pleasure yacht doesn’t mean I don’t have my own slick ride.”</i> He waves dismissively. <i>“The Starlight Sonata gets me where I need to be, even if it’s through somebody else. Trust me. I fly about as well as an unmodded terran fucks, but that ship still cuts through better pilots like a plasma knife through tinfoil. ‘Course that’s a different matter altogether. Got nothing to do with your shitbag relation.”</i> Dane slouches over onto the bar with all the quiet confidence of a resting predator. <i>“Any more asks?”</i>");
	processTime(15);
	clearMenu();
	addButton(0,"Next",talkToDaneIntro,true);
}

//Other Jobs?
public function askDaneAboutOtherJobs():void
{
	clearOutput();
	showDane();
	author("Fenoxo");
	output("<i>“Any other jobs of note?”</i>");
	output("\n\nDane looks over his shoulder, then turns back, apparently puzzled. <i>“Is there a two-bit merc behind me? The question you meant to ask was, ‘Dane, could you tell me the dozen other jobs you’ve done that were better than dealing with my shit-licking cousin?’”</i>");
	//Bambi
	if(pc.isBimbo()) output("\n\n<i>“Of course, Dane.”</i> You bat your eyelashes and lean a little closer, wrapping yourself around the closest arm. <i>“Tell me all about ‘em.”</i>");
	//Ass
	if(pc.isAss()) output("\n\nYou answer, <i>“Sure, that’s what I said.”</i>");
	//Mischiev
	else if(pc.isMischievous()) output("\n\nYou retort, <i>“Are you sure? I think I’d only say something like that after a badass story or two.”</i>");
	//Nice
	else if(pc.isNice()) output("\n\nYou say, <i>“Sure,”</i> as if that was exactly what you meant to say all along.");
	//Merge
	output("\n\nA booming laugh echoes out of the mercenary’s rippling abdominals. <i>“Sure, sure. I’ve been through enough shit to turn my fur white, if it wasn’t already.”</i> Dane pauses, tapping his chin while his spare arms fidget with his glass. <i>“Not all of ‘em strictly legal either. See my last one, pre-shitbag, seemed like it was a simple job: guard a trader while he closes an important deal with his associate. Of course it wasn’t.”</i>");
	//Nonbimbo
	if(!pc.isBimbo()) output("\n\n<i>“They never are,”</i> you add.");
	//Bimbo
	else output("\n\n<i>“It wasn’t?”</i> You gasp. <i>“Oh no!”</i>");
	//Merge
	output("\n\nBobbing his head in a slow nod, Dane says, <i>“See, as it turns out, sometimes a trader isn’t just a trader, and sometimes the business deal is actually a massive drug deal. I’m not talking small potatoes. This isn’t some guy getting Throbb for his frat brothers. I’m talking bonafide drug kingpin moving enough Dumbfuck to turn half a planet into sex-crazed sluts. They had tanks of the stuff hyper-concentrated in cryonic suspension.”</i> Shaking his head, Dane explains, <i>“Never seen the point of the stuff myself. You don’t need to drug a girl to get in her panties, just walk and take charge. She’ll be eating out of your hand in no time or run off. No point in wasting time with half-measures.”</i>");
	output("\n\n<i>“What’d you do?”</i>");
	output("\n\nDane leans back. <i>“Do I look like an amateur? I did my fuckin’ job, and I did it like a pro.”</i> His ears swivel around as he recounts the details. <i>“I kept my eyes open because I’m not just hired muscle - I’m the total package,”</i> Dane says, clapping his chest boastfully. <i>“And sure enough, I spotted movement where there shouldn’t be movement. Something big creeping around outside a window: quadrupedal and scaling the outside of the building like a slug on a spire.”</i>");
	output("\n\nYou ask what it was.");
	output("\n\n<i>“Never got to find out exactly. I went to radio it in to the other guards and got static. Realized we were being jammed and raised a ruckus about it.”</i> He laughs, <i>“I’ve never seen so many toughs in suits shit bricks at once. Right away, it was obvious the seller didn’t know what was going on either. His goons took a second longer than ours to start racking slides and prepping for a fight. I slid into cover behind one of the canisters - not my brightest move, I know - and just stuck there, waiting.”</i>");
	output("\n\nToo late you realize that you’re leaning closer now that you’re invested in the tale. <i>“And?”</i>");
	output("\n\n<i>“And everything went to hell in a handbasket. Virtually every window in the place shattered at once.”</i>");
	output("\n\n<i>“Cops?”</i>");
	output("\n\n<i>“Cops.”</i> Dane nods. <i>“Smart ones. They didn’t come through the windows - not with everyone and their grandsire spraying lead like a teenager with his first powder banger. No, they came through the floor. You shoulda seen it. One second, empty space. The next? A spike tipped piston rips open a hole right next to you and spits out a local attempt at a peacekeeper.”</i> The ausar mutters. <i>“I got lucky. One of the other mercs, a new kid, was in the wrong place at the wrong time. I don’t envy his next of kin or the cop that had to step out into that mess.”</i> He shudders.");
	output("\n\nYou ask him how he got out.");
	output("\n\n<i>“Almost didn’t. The lead was really flying by that point, but my boss was right next to me, and I still needed to get paid.”</i> Grinning at the remembered thrill of battle, Dane continues, <i>“I dragged the creep into cover with me. The idiot tried to gouge my eyes out. Guess he thought I was one of the peacekeeper wannabes at first. Lucky for me, I already had all four arms - plenty enough to pin up down with two to spare.”</i> The smug mercenary takes a drink. <i>“I knew the fuzz was all over our level and the level below judging by their insertion method. I also knew they had </i>something<i> outside and above, so heading for the roof for a pickup by ship was out of the question. We only had one option: the elevator shaft.”</i>");
	output("\n\n<i>“So you escaped the police by calling an elevator?”</i>");
	output("\n\n<i>“Hardly.”</i> Dane scowls. <i>“They were locked down already. No, I pried open the doors - still holding drugfuck mcgee - and climbed down like my life depended on it. Thirteen floors,”</i> he recounts. <i>“Thirteen floors I carried that humanoid sphincter down, all the way into the sub basement - below the cops. Then I just had to break into a utility access corridor and escape to the streets.”</i>");
	output("\n\nYou question if he’s really comfortable saving somebody like that.");
	output("\n\nDane stares at you for a few seconds, crimson eyes narrowed. <i>“Comfort has nothing to do with it. A man’s gotta put food on the table, and if I betray a client, even an awful one, I’ll never get a legit job again.”</i> He leans closer. <i>“Besides, I had a harem to feed back then. Whole other story, that one.”</i> He waves dismissively. <i>“Nah, I didn’t like saving somebody like that, but the cops were already on to him. I thought they’d have him in cuffs in no time.”</i>");
	output("\n\nA harem huh? You might have to ask about that.");
	output("\n\nThe albino ausar sips a bit of whiskey, grimacing from the aftertaste. <i>“‘Course I was wrong. The weaselly little snake hooked up with the Black Void. Can’t touch him now.”</i> He cracks his knuckles. <i>“Who knows. Maybe I’ll bump into him in my next job and get the chance to play at being a lawman myself. That’s the nice part about being a mercenary - you get to do a little bit of everything.”</i> Glancing your way, the hound for hire remarks, <i>“A bit like being a Rusher, I suppose.”</i>");
	processTime(15);
	//UNLOCKS HAREM TOPIC
	flags["DANE_JOBS_TALK"] = 1;
	clearMenu();
	addButton(0,"Next",talkToDaneIntro,true);
}

//Harem
//DANE HAD A HAREM - Had two half-sisters and a real subby rahn. Skipped town with some kaithrit musician named "Astrokat" or some shit.
public function danesHaremTalk():void
{
	clearOutput();
	showDane();
	author("Fenoxo");
	//Got fucked:
	if(flags["LOST_TO_DANE_ON_MHENGA"] == 1) output("<i>“So where’s that harem you mentioned?”</i>");
	else output("<i>“You had a harem?”</i>");
	//Merge
	output("\n\nDane scratches the back of his head. <i>“Guess I did mention that, didn’t I?”</i>");
	//Bimbo
	if(pc.isBimbo()) output("\n\n<i>“Uh-huh!”</i> You wiggle closer, leaning into the big galoot. <i>“Sounds hot.”</i>");
	//Bro
	else if(pc.isBro()) output("\n\nYou nod, deciding to add a verbal ‘yep’ after it becomes clear that Dane wasn’t looking.");
	//Nice
	else if(pc.isNice()) output("\n\n<i>“Yep!”</i> You give the burly ausar an encouraging pat on the back. <i>“Come on. You can’t drop a detail like that and </i>not<i> talk about it!”</i>");
	//Mischiev
	else if(pc.isMischievous()) output("\n\nYou elbow him in the side of the ribs. <i>“Damn right you did. Don’t even think about holding back on the details either.”</i>");
	//Hard
	else 
	{
		output("\n\n<i>“Fuck yes you did.”</i> You lean hard on the bar, saying, <i>“And not telling me all about it could be considered an act of war by some cultures.”</i>");
		output("\n\nDane raises an eyebrow. <i>“Which cultures?”</i>");
		output("\n\n<i>“Doesn’t matter. Dish.”</i>");
	}
	//Merge
	output("\n\nDane shrugs all four of his shoulders at once. <i>“Guess I might as well start at the beginning. Didn’t set out to put together a harem or nothing. I was just a normal guy doing normal things - working out, making credits, and trying to find hot pieces of tail to bang on the weekends, you know?”</i> He shakes his head in amusement. <i>“Sure was a fuck of a lot simpler back then. ‘Course you can’t really beat having three cuties in your bed, even if it does get complicated quick.”</i>");
	output("\n\nYou ask how it started.");
	output("\n\n<i>“Chydi’s how it started,”</i> Dane grumbles. <i>“Lithe little piece of ausar tail. She worked out at my gym, so I saw a fair amount of her with my own comings and goings. I didn’t even know she was into me at first.”</i> He snorts. <i>“I was so busy worrying about my own workout that I didn’t spare more than a glance at anyone else. Physique like this doesn’t just happen - even with mods helping. It still takes work, and lots of it, to sculpt yourself into a work of art.”</i> The grinning ausar flexes an arm and plants a kiss upon his own bulging bicep. <i>“Chydi understood that. She liked these beauties almost as much as I do.”</i>");
	//Bimbo
	if(pc.isBimbo()) output("\n\nYou coo adoringly, eyes riveted to male’s bulging slab of muscle.");
	//Bro
	else if(pc.isBro()) output("\n\nYou grunt in acknowledgement.");
	//Else
	else output("\n\nYou nod in understanding.");
	//Merge
	output("\n\n<i>“Anyway, one day my usual errant glance noticed her full-on leering at me. You could’ve pulled her face from the cover of ‘Girl-Boners Monthly.’ I’d have to be blind not to notice.”</i> A sharp canine glints as the corner of his mouth lifts in pleasant memory. <i>“I did a few more sets to finish up my workout, only this time I stole glances at her every chance I could get. Caught her peeking a few times, and even when she wasn’t, I got an eyeful of a woman in peak form, shrink-wrapped in lycra. It was a lucky day to be wearing baggy shorts, I’ll tell you that.”</i>");
	output("\n\n<i>“How’d you ask her out?”</i> you ask.");
	output("\n\nA sheet of crimson works across Dane’s cheeks. <i>“I didn’t. Not really. Well... I meant to.”</i> He takes a fortifying sip of whiskey and sighs heavily before resuming his tale. <i>“We were both getting ready to leave when I walked up to her, and... fuck. She smelled so good that I forgot what I was going to say to her, and she... she was about the same. She just stared at me for a few seconds, breathing heavily. There was a damp patch in her bottoms, and my shorts weren’t baggy enough to completely conceal what I was thinking about.”</i> Dane leans back and shakes his head. <i>“I picked her up, and we started making out right there. I couldn’t stop myself, and she didn’t want me to. I fucked her in the gym’s bathroom. And then we fucked again in my car. And again in my shower.”</i>");
	output("\n\nYou let out a slow whistle of approval.");
	output("\n\n<i>“Yeah it was pretty great. Needless to say, we got real serious real fast. She brought me over to meet her family one day... and she had a sister that smelled just amazing as she did.”</i> Dane flashes a toothy grin. <i>“Not a hardbody like Chydi of course. No, this girl was thick in all the right places. If you had told me she was part huskar, I’d have believed you. You could smell the fertility pouring off of her, and I... what red-blooded guy wouldn’t want to fuck her?”</i> Dane fidgets. <i>“I’ve never been that hard through an entire meal before or since.”</i>");
	output("\n\nDane gestures vaguely behind him. <i>“So of course I make for the bathroom first chance I get. The last thing I want to do is accidentally rip a hole in my pants while her parents are watching. I’m in there, wanking up a storm, when the door pops open. In comes Chydi’s sister, Kythi, smiling up a storm. I’m fumbling and apologizing, but she just closes the door behind her and drops to her knees. Starts servicing me like a pro, and before I can pull my brain out of my dick, I’m dumping what feels like a gallon of cum down her throat.”</i> He leans back, fluttering his eyes for a moment before laughing out loud at his own orgasm-face. <i>“That girl could suck-start a capital ship, no problem. Had me hooked in one blowjob.”</i>");
	//Bimbo
	if(pc.isBimbo()) output("\n\n<i>“So that’s all it takes?”</i> you ask, licking your lips. <i>“" + (flags["DANE_SEXED"] == undefined ? "I’ll remember that.":"Guess I’m well on my way then.") + " But you still have to tell me how you got yourself a sister-harem!”</i>");
	//Bro
	else if(pc.isBro()) output("\n\n<i>“Sure she wasn’t from New Texas?”</i> You ask. <i>“All the best cock-suckers come from New Texas. Same for bangable sisters. Usually takes a cow-girl for that sort of sharing.”</i>");
	//Else
	else output("\n\nRaising an eyebrow, you ask, <i>“How’d you handle Chydi finding out about Kythi?”</i>");
	//Merge
	output("\n\nThe four-armed alpha drums his fingertips on the table with a hint of nervousness. <i>“To this day I’m not entirely sure how I pulled it off. I started fucking Kythi on the side when her sister wasn’t around, but it’s real hard to keep your screwing a secret when you’re banging two adjacent branches of the same family tree. If I had to guess, Chydi probably figured it out by smell. Girl was always into my scent, and a few hours of lovemaking leaves pretty obvious scent markers to any ausar with half a nose.”</i> Dane pauses. <i>“I guess she decided that she’d catch us red handed before she started slinging accusations. Smart girl, that one.”</i>");
	output("\n\nPressing on, the merc sets the scene, <i>“So there I am, sprawled out in bed with Kythi bouncing in my lap, huge tits jiggling and bouncing in my palms. I’m basically in heaven.”</i> He smirks. <i>“Then the door bursts open. Chydi’s got a holocam out, snapping footage, her face all screwed up with rage. She’s screaming and yelling while Kythi and I are falling all over ourselves to cover up. Not my most graceful moment, I’ll tell you that.”</i>");
	output("\n\n<i>“And then?”</i> Your curiosity bids you to lean in.");
	output("\n\n<i>“And then we had a good hour of crying, screaming, and arguing.”</i> He waves wildly with his upper arms. <i>“Chydi can’t decide whether she wants to kill me or her sister more, so she slices us to pieces with that razor tongue of hers. Meanwhile I’m trying to salvage something from this, explaining that I didn’t start anything, but then Kythi feels like I’m throwing her under the bus and cries even harder.”</i> Dane shudders. <i>“I’ve been in hopeless battles before, but they’re nothing next to being caught between two sisters - like trying to fly through an Ausaril hurricane. None of your usual instrumentation works, you’re getting slapped from every angle, and you’re not sure when you’re gonna break out into clear skies - or if you ever will again.”</i> Wiping his brow, the former antagonist throws up his hands. <i>“I gave up. Figured both relationships were a total loss and started for the door with nothing but my boxers and the tattered pieces of my pride.”</i>");
	output("\n\nThe bartender swings by to offer Dane a refill.");
	output("\n\nHe waves the help away and continues, <i>“Made it halfway before both of them yelled for me to wait at the same time, in practically the same voice.”</i> His cocksure grin returns. <i>“I realized that the reason they were fighting so hard was because they both wanted to be the one to come home with me at the end of the day, even with my wandering dick.”</i> He gestures at the half-mast he’s sporting. <i>“So I steered the conversation to the root of the problem and suggested an amicable solution.”</i> His ears flatten. <i>“I got screamed at for that, so I asked them what their solutions would be - how to keep everyone happy at the end of the day.”</i> Dane chuckles. <i>“Kythi saw it my way after a few wasted minutes. Chydi took a lot longer... but she came around.”</i>");
	output("\n\n<i>“Wow.”</i> You rack your brain for some appropriate response. <i>“Lucky dog.”</i>");
	output("\n\n<i>“Yeah,”</i> Dane agrees. <i>“Fucked them both back to back that night. Maybe it was all the hostility from beforehand getting worked out in the bedroom, but I still rate that as one of the best evenings of my life. Those girls. Just... wow.”</i>");
	output("\n\n<i>“I can imagine.”</i>");
	output("\n\nThe albino wolf-man nods and takes another sip from his drink. <i>“Yeah, so that’s how my little harem started. Added a go’rahn later, but that’s a whole other story.”</i> He huffs, <i>“Besides, I don’t have any of them now. While your cousin kept me on a tight leash licking [rival.hisHer] boot-heels, they went to a concert... and got to meet Astrokat backstage - I’m talking dressing room backstage.”</i> He pounds the table in irritation. <i>“Long story short, when I finally get a chance to check in at home, all three of ‘em are long gone, off to suck kaithrit dick, and I’m left all alone with the galaxy’s biggest case of blue balls.”</i>");
	output("\n\n<i>“Oof.”</i>");
	output("\n\n<i>“You’re damned right!”</i> Dane barks. <i>“So not only did your shitstick family buttfuck me financially, [rival.heShe] left the door hanging open on the way out so all my bitches could run off.”</i> He snarls. <i>“So that’s the long, sordid story of my once-harem.”</i> Knocking back the last of his whiskey, Dane signals the bartender for another. <i>“Now I’m getting drunk with pirates and trying to find some easy work... and pouring my guts out to [pc.name] Steele. What a universe.”</i>");
	output("\n\nThe ausar falls silent as a fresh whiskey is delivered.");
	processTime(20);
	flags["DANE_HAREM_TALKED"] = 1;
	clearMenu();
	addButton(0,"Next",talkToDaneIntro,true);
}

//His Start
//[8:39 PM] Slab Bulkhead: Dane’s past and how he got into the merc business could be interesting.
public function daneStartTalk():void
{
	clearOutput();
	showDane();
	author("Fenoxo");
	output("You ask Dane about how he got into the mercenary game in the first place.");
	output("\n\n<i>“Not much to tell on that front, I’m afraid. Standard ‘boy is pretty strong and not that smart’ story. Signed up for the military right out of academy and spent three years wishing I hadn’t. I doubt you will, but if you were considering it, let me state it clear: enlisting in any military is a dumbshit decision, especially for a [pc.guyGirl] in your situation.”</i> Dane cracks his knuckles. <i>“I should’ve gotten into the merc game right away. There’s plenty of old pros that’ll take on younger wards for a fraction of the usual pay. Sort of an apprenticeship system. I could’ve learned all the same things without having some jackass mandating when and where I was allowed to take a leak.”</i>");
	output("\n\n<i>“But you didn’t.”</i>");
	output("\n\n<i>“I didn’t.”</i> Dane bobs his head. <i>“But I still came out of it stronger than when I went in, and I got plenty of opportunities to work over loudmouthed dipshits with my fists.”</i> His face flashes with feral delight. <i>“Both skills are essential in merc work, and I guess it would be fair to say that I developed a certain taste for violence while I was in the service.”</i> He shrugs. <i>“A whole lotta people like to talk a whole lot of shit about traits like that, but they all come running to men like me when the chips are down. The way I see it, there’s nothing wrong with enjoying a bit of justified violence. Hell, you remember how I was grinning that first time we fought, right? [rival.name] had my head so full of shit I was halfway convinced I was about to take down one of the galaxy’s greatest villains.”</i>");
	output("\n\nHis smile was rather... unnerving.");
	output("\n\n<i>“The great thing about violence is that it doesn’t really matter all that much as long as you don’t get too stupid with it. Broken bones and bullet holes? Neither takes that long to patch up. Hell, losing a limb is more of a financial penalty than a genuine life-ruiner. A few injections, maybe a little cloning, and you’re back on your feet and good as new.”</i> Dane nods. <i>“So the way I see it, there’s absolutely nothing wrong with smashing somebody’s face black and blue for being a shitdick. And getting paid to do it? Well, that’s a wet dream in the making right there.”</i> Dane chortles, <i>“And I’m living it.”</i>");
	output("\n\nRather than making an argument about his take on his baser urges, you try to dial the conversation back toward his start.");
	output("\n\n<i>“Right, right...”</i> Dane drawls, <i>“I guess I did get a little off topic there, but only because there’s not much to tell. Most mercenary work is done through independent contracts and extranet job boards. All I did was sign myself up for rating with the Mercenary Consortium and Reaper Industries, then start accepting contracts that seemed ‘on the level.’ Say what you want about our dystopian corporate overlords - no offense - but the ones that set up merc regulations did a pretty swell job of it.”</i> Dane puffs out his chest as he explains, <i>“Up until your cousin tanked my ratings, I was one of the highest rated contractors in the quadrant.”</i> He seems to visibly deflate in the wake of that statement. <i>“Fucking cuntrag.”</i>");
	output("\n\nYou can’t quite suppress your chuckle.");
	output("\n\n<i>“Yeah... tell you what. I don’t really do the whole bounty hunting-slash-hitman thing, but " + (!daneRecruited() ? "if you ever need a hand taking down your cousin down a few pegs, I promise I won’t charge too much for the effort.":"I can’t wait till we get a chance to knock that shit-eating grin off that twat-waffle’s face.") + "”</i>");
	//Unlocks bodyguard hire!
	flags["DANE_START_TALKED"] = 1;
	processTime(20);
	clearMenu();
	addButton(0,"Next",talkToDaneIntro,true);
}

//Give Shockblade
//Track this shit for suresies. Might come into play later.
//[8:39 PM] Lestia Urufuhando: You could add an option to give him back his shockblade as a peace offering, if he doesn’t start on a friendly term by that point in the story
public function giveDaneShockblade():void
{
	clearOutput();
	showDane();
	author("Fenoxo");
	output("Reaching into your pack, you produce the security check tag for Dane’s shockblade, the one you looted from him so long ago. A holographic display of the weapon spins in the air above it.");
	//No new PG, personality fork
	//Bimbo
	if(pc.isBimbo()) output(" <i>“Remember this thing you tried to stab me with? I figured you might want it back since I’m like, done with it.”</i> You smile happily at the surprised look on Dane’s face. <i>“I always remember when a pretty boy gives me his sword~”</i>");
	//Bro
	else if(pc.isBro()) output(" <i>“Figured you might want this back.”</i>");
	//Nice
	else if(pc.isNice()) output("<i>“Just to show that there’s no hard feelings,”</i> you announce.");
	//Misch
	else if(pc.isMischievous()) output(" <i>“I’m gonna give you back this thing on the condition that you promise not to use it on me.”</i> You yank it away from Dane’s hand when he reaches for it. <i>“I’m also gonna need a crisp high-five, and maybe a pony.”</i> With a chuckle, you let it fall onto the bar in front of him. <i>“Just fucking with you bro. I thought you might want it back.”</i>");
	//Hard
	else output(" <i>“I think you might need this more than me.”</i>");
	//Merge
	output("\n\nDane raises an eyebrow. <i>“I already wrote this off as a business expense, you know.”</i> He leans down, watching the sword’s tip slowly trace a circle above the countertop. <i>“If I took this, they might come after me for tax fraud.”</i> He pauses, looking up at you with a lopsided grin. <i>“But I’d have to be an idiot not to take one of my favorite swords back.”</i> He snatches the tag up faster than you can blink. <i>“Of course I’ll have to have the edge redone and the voltage regulators swapped out. Maybe get a new battery to push out all that power.”</i> His eyes crinkle with genuine happiness. <i>“I guess I’ll have some more tax deductions to file for soon. Thank you, [pc.name].”</i> He grabs your hand and shakes it firmly in two of his own. <i>“Whatever our past differences, you have my respect.”</i>");
	output("\n\nAfter five seconds of his crushing grip, you finally pry your hand free, but Dane’s not paying attention any longer. He’s smiling at the holographic representation of his sword and daydreaming about all the ways he’s going to improve it for his next job.");
	output("\n\nTime for a new topic.");
	processTime(5);
	pc.destroyItemByClass(ShockBlade);
	pc.addNice(5);
	clearMenu();
	addButton(0,"Next",talkToDaneIntro,true);
}

//Flirt
public function daneSexIntro():void
{
	clearOutput();
	showDane();
	author("Fenoxo");
	if(flags["DANE_SEXED"] == undefined)
	{
		output("Working up your courage, you lean over with your best set of bedroom eyes and ask Dane if there’s somewhere more private he’d like to continue this conversation.");
		output("\n\nEasing himself out of his chair, the burly ausar turns his crimson eyes to you. They seem to almost ablaze in the flickering, inconsistent casino lighting, looming over you like baleful orbs. Dane rounds on you while you’re fixed in the proverbial headlights, pulling your chair out from under you with two hands and slamming your back to the bar with the other two. He steps into the space he’s created such that you’re pinned between immobile drinking surface and the mercenary’s powerful abdominals. With that done, he drinks up the remainder of your personal space like rich whiskey, leaning so close that his breaths wash across your cheeks.");
		output("\n\n<i>“If you wanna get fucked, then say so.”</i> Dane’s tail lashes back and forth behind him hard enough to make his vacated seat wobble. <i>“Don’t pussyfoot around about it, and don’t get any ideas in your " + pc.mf("silly","pretty") + " little head about taking this albino mutt for a ride.”</i> He leans to the side, closely examining your facial structure, lips less than an inch from your cheek. <i>“I screw from on top, so don’t fucking toy with me unless you’re keen to be my personal playtoy-slash-cumdump for the night.”</i> Sausage-thick fingers wrap around your skull and twist your face to stare into his own. <i>“Is that what you want?”</i>");
		output("\n\nYou gulp.");
		output("\n\nDane’s canines glint. <i>“I won’t mind if you say no, but if you want fucked... just go ahead and say it. Say you want to be my cumdump.”</i>");
		processTime(2);
		clearMenu();
		//[Cumdump] [No] [Fat Chance]
		addButton(0,"Cumdump",suckDaneOffYaWanker,undefined,"Cumdump","Say what he wants for a piece of that Dane D.");
		addButton(1,"No",noDaneSexRightNowPlease,undefined,"No","Turn him down, but not so hard that you’ll never get another chance at his dick.");
		addButton(2,"Fat Chance",fatChanceDaneImNoCumdump,undefined,"Fat Chance","Shoot him down so hard that he’ll need some ointment for the burn.");
	}
	//Repeat Sex Intro
	//[Please Him]
	//Dane’s going to take charge if you want to sleep with him, but that’s what you want, isn’t it?
	else
	{
		//Bimbo
		if(pc.isBimbo()) output("<i>“So I was thinking...”</i> You glance to the sizeable bulge between Dane’s thighs, the rest of your prepared words falling away. <i>“Ummm... do you wanna fuck me?”</i> You lick your lips as the memory of the taste tingles across your tongue. <i>“Or whatever. I can still be your fuck-doll, right?”</i> You bounce excitedly.");
		//Bro
		else if(pc.isBro()) output("Knowing actions speak louder than words, you slide yourself onto Dane’s thigh, resting one hand gently against his bulge. With your free hand, you gesture to one of the private booths.");
		//Nice
		else if(pc.isNice()) output("You lean closer to Dane and ask, <i>“Do you have a minute to" + (pc.libido() < 50 ? "...”</i> you blush. <i>“...":" ") + "fuck me into my place?”</i>");
		//Mischievous
		else if(pc.isMischievous()) output("Unable to entirely conceal a sly grin, you ask Dane, <i>“You know... are you sure you have what it takes to pound a [pc.guyGirl] like me into place? With all these slutty pirates around, I find myself thinking it can’t be that hard to top a big softie like Dane...”</i>");
		//Hard
		else output("<i>“I’m horny, and I think you know how to handle that better than these idiot pirates.”</i> You gesture to the private booths. <i>“What do you say?”</i>");
		//Merge
		output("\n\nThe white-furred sellsword reacts exactly as you’d expect - by grabbing you with all four hands and pulling you close, face to face. <i>“I’m going to ruin you for other ausar.”</i> He leans down, letting out a long canine tongue, and licks you from your chin to the tip of your ear. <i>“And you’re going to be thanking me for treating you like the cum-dump you are.”</i>");
		//Bimbo
		if(pc.isBimbo())
		{
			output("\n\n<i>“Ohhh yes please!”</i>");
			output("\n\nYou squeal in delight as Dane slings you over his shoulder and drags you into a booth. You spend the time in training kissing his back and stroking his muscles.");
		}
		//Bro
		else if(pc.isBro())
		{
			output("\n\nYou answer with a smile and grunt of approval as you’re slung across Dane’s shoulder and bodily carried toward a booth. While you travel, you pass the time by caressing his muscles and marveling at how they shift and move beneath his creamy skin.");
		}
		//Nice
		else if(pc.isNice())
		{
			output("\n\n<i>“Yes,”</i> you cheer, pumping one hand into the air as Dane throws you over and enormous shoulder. <i>“I’ll thank you right now, big guy.”</i> There’s not many places you can kiss while draped over someone’s back, so a quick smooch on the back of an arm will have to do.");
			output("\n\nIt seems like you reach the private booths in record time.");
		}
		//Misch
		else if(pc.isMischievous())
		{
			output("\n\n<i>“Am I though?”</i> You don’t protest when Dane slings you over his shoulder and hauls you bodily toward the privacy booth. <i>“You’ll have to fuck me really hard to do that, I think.”</i> You bite your lips, sprawling your fingertips across the ausar’s heaving muscles. <i>“And I guess I can’t stop you if that’s what you want to do...”</i>");
		}
		//Hard
		else
		{
			output("\n\n<i>“That’s what I’m talking about!”</i>");
			output("\n\nDane slings you over a shoulder and hauls you toward the familiar site of your first tryst, giving you exactly what you want. You stretch a bit to reach for his taut ass, grabbing one powerful cheek to give it a friendly squeeze as fantasies of just how he’ll use you filter through your increasingly depraved mind.");
		}
		//[Next] - into Dane-selected scene. Maybe add a variant later where you can pick sometimes~!
		processTime(2);
		pc.lust(5);
		clearMenu();
		addButton(0,"Next",repeatDaneFuckSceneRouter);
	}
}

public function repeatDaneFuckSceneRouter():void
{
	var choices:Array = [];
	//Thirsty cunttails need big boy feeding!
	if(pc.hasCuntTail() && pc.hasCuntSnake() && flags["DAYS_SINCE_FED_CUNT_TAIL"] != undefined && flags["DAYS_SINCE_FED_CUNT_TAIL"] >= 5)
	{
		daneTailjerkScene();
		return;
	}
	//Populate the list of possible scenes. Real short now, I know.
	choices.push(suckDaneOffYaWanker);
	if(pc.isTaur()) choices.push(daneTaurfukky);
	else if(pc.hasVagina()) choices.push(daneCuntfucks);
	//Roll dice on scene if needed
	choices[rand(choices.length)]();
}

//Fat Chance
public function fatChanceDaneImNoCumdump():void
{
	clearOutput();
	showDane();
	author("Fenoxo");
	output("<i>“Fat chance,”</i> you growl, slipping low and twisting free from the mouthy merc’s greasy mitts before he decides verbal consent isn’t necessary for his twisted fantasies. <i>“I’m nobody’s bitch");
	if(ardiaIsCrew()) output(", except Ardia’s");
	else if(seraIsMistress()) output(", besides Sera’s");
	else if(siegwulfeIsDom()) output(", besides " + (pc.isBimbo() ? "my big titty robot mistress":"[wulfe.name]’s"));
	output(".”</i>");
	output("\n\nLaughter answers your bold declaration. Most of Dane’s hands are on his hips, but one pounds the countertop to the tempo of his sudden mirth. <i>“You...”</i> He coughs and staggers, flopping back into his chair as he struggles with his twitching diaphragm. <i>“You had me fuckin’ going there, Steele. Damn.”</i> Clearing his throat, the white-furred merc reaches for his glass with fumbling fingers. He knocks back a heavy swig and sighs, <i>“Got me ready to rip a hole in the old codpiece for nothing. Guess cock-blocking runs in the family after all, huh?”</i> He elbows you. <i>“Won’t make that mistake again, don’t you worry... unless you wanna take a crack at double-teaming one of these floppy eared bitches later. Let me know.”</i>");
	flags["DANE_NO_SEX"] = 1;
	//disable "flirt" choice 5ever.
	//Back to main menu
	daneMenu();
}

//No
public function noDaneSexRightNowPlease():void
{
	clearOutput();
	showDane();
	author("Fenoxo");
	output("<i>“No,”</i> you answer, placing one hand on his chest. It’s like slapping a brick wall. <i>“My interests are a little less... one-dimensional.”</i>");
	output("\n\nDane’s nostrils flare. His breath washes across you like hot steam, but he steps back all the same. The corners of his eyes crinkle into the ocular equivalent of a smile, and he offers you a hand to help you back into your seat. <i>“No problem then. You know my score, and I know yours. Shame though.”</i> He cracks a predatory grin, canine fangs glinting. <i>“I was ready to go - and I mean ready.”</i> Shifting in his chair, he admits, <i>“I was about to tear a hole in the old codpiece if you said the words. Still...”</i> He knocks back a small sip of whiskey. <i>“...you can change your mind, if you want. Just ask me about privacy again.”</i> He leans closer. <i>“I dare ya.”</i>");
	processTime(2);
	clearMenu();
	addButton(0,"Next",approachDane,true);
}

//Suck Him Off
//All Danesubmits start with this before unlocking other scenes. Gotta get familiar with the dongus.
public function suckDaneOffYaWanker():void
{
	clearOutput();
	showDane(true);
	author("Fenoxo");
	//FIRST TIME
	if(flags["DANE_SEXED"] == undefined)
	{
		//Bimbo:
		if(pc.isBimbo()) output("<i>“I don’t wanna be your cum-dump, silly.”</i> You pout. <i>“I </i>need<i> to be your cumdump.”</i>");
		//Bro
		else if(pc.isBro()) output("<i>“Fuck yeah, gimme that cum.”</i> Your eyes twinkle with delight at the rough treatment.");
		//Else
		else output("<i>“I wanna be your cum-dump,”</i> you announce" + (pc.exhibitionism() >= 66 ? ", loud enough for everyone in the bar to hear":", though not so loudly as for anyone else to hear."));
		output("\n\nDane’s smile widens. <i>“Then let’s put you to work.”</i> Lifting you as easily as a doll, the ausar pulls you away from the bar and carries you bodily into one of the secluded, privacy screen-equipped alcoves. Your vision goes momentarily black when you cross into the dim booth, but that doesn’t stop Dane from setting you down like a sack of potatoes. <i>“You look so much better down there,”</i> he confides, working at his belt and codpiece in a sudden hurry. <i>“Fuck, I shoulda sprung for a bigger one of these.”</i>");
	}
	//REPEAT!
	else
	{
		output("The door to the stall slams behind you, and Dane tosses you to the ground with feigned indifference that’s revealed to be rough play by how softly your [pc.butt] comes to rest on the hard floor. You can’t see much with how dark it is, but you can hear Dane struggling to disrobe. The familiar clink of shield belt’s latch snaps. The metallic snake clinks onto the cushion, followed in short order by Dane’s codpiece.");
	}
	//MERGE FIRST TIME/REPEAT
	output("\n\nYour vision returns in the nick of time to see the discarded cock-guard falling into the floor by your ");
	if(pc.hasKnees()) output("[pc.knees]");
	else output("[pc.footOrFeet]");
	output(". Deeper shadow falls across your face as you turn back toward the mercenary, so close that his exposed dong nearly slaps into your nose. It’s a meaty, veiny thing, easily a foot long and not even hard yet. Its musk boils out into the air like steam from a teapot. You can’t avoid breathing it in, not that you want to. His concentrated pheromones tickle your nose and dizzy your mind. It takes every ounce of willpower you have not to nuzzle up for a kiss and a second sniff.");
	output("\n\nA thick-fingered hand falls gently to your head, idly stroking your " + (!pc.hasHair() ? "[pc.skinFurScales]":"[pc.hair]") + ". <i>“");
	if(pc.isBuzzed()) output("You sure you weren’t the one drinking?");
	else output("You sure you can handle your liquor?");
	output("”</i> Dane asks. <i>“You look like a real cock-drunk bitch right now.”</i> He tips your head back so that you have to look him in the eyes, then presses your cheek against his ballooning prick. <i>“This is what you needed, isn’t it?”</i>");
	//Bimbo
	if(pc.isBimbo()) output("\n\n<i>“Ohhh yes,”</i> you purr, eyelashes fluttering. <i>“I need this dick in my mouth like, right now.”</i>");
	//Bro
	else if(pc.isBro()) output("\n\n<i>“Hell yes,”</i> you groan, smiling from beneath his cock. <i>“I need to suck this dick.”</i>");
	//Else
	else output("\n\n<i>“Yes,”</i> you " + (pc.mf("moan","groan")) + ". <i>“");
	if(pc.libido() >= 66) output("I needed this fucking cock.");
	else if(pc.libido() >= 33) output("This is what I needed.");
	else output("I need you.");
	output("”</i>");
	//merge
	output("\n\nReaching up, you heft Dane’s balls. They’re almost the size of oranges but so much heavier. Just holding one nut, you’re amazed by how warm the weight is in your palm, gaining a sense for its virility. Dane’s balls are positively <b>ripe</b>. You swear you can feel it wobbling with how full of spunk it is, the little swimmers straining to make their escape into the warm confines of your throat.");
	output("\n\nSmooth, veiny dickskin slides against your cheek while you examine the goods behind. By the time you’re done handling the mercenary’s lust-fattened sack, his cock is most of the way hard. The beastly member is clearly not human in shape or smell. It’s a gnarled, primitive thing with all the features of a canine and equine welded together into a prick of singular presence. The chubby, flat tip pulsates against your collarbone while your thumbs reach up to prod at the slight distention of his knot, just now easing out of a straining, glossy sheath.");
	output("\n\nWith the appearance of an ausar’s trademark feature comes the full force of his nearly cloying pheromones. You swoon as you unintentionally take in the fullness of his masculine scent, whimpering softly when the knot grinds against your forehead. You know you’ll be catching whiffs of him for the rest of the day, and you haven’t even sucked him off yet!");
	if(pc.hasVagina())
	{
		output(" Your girlish delta" + (pc.hasVaginas() ? "s":"") + " feel" + (!pc.hasVaginas() ? "s":""));
		if(!pc.isSquirter()) output(" almost instantly soaked.");
		else output(" even more soaked than normal, dumping streams of arousal down your [pc.thighs].");
	}
	if(pc.hasCock())
	{
		output(" Sensations of stiffness invade the Dane-centric forefront your mind to remind you that you have " + (!pc.hasCocks() ? "a ":"") + "[pc.cocks] of your own" + (pc.hasCocks() ? ", unanimously turgid over what you’re about to do.":", declaring its approval of what you’re about to do with incredible tumescence."));
	}
	output(" Allowing yourself to turn your head to the side to plant a kiss on this magnificent hybrid seems the most natural thing in the world" + (pc.isBimbo() ? ", and for a cock-thirsty bimbo like you, it is. A sort of all-encompassing giddiness bathes your brain in happy pink bubbles as you do what sluts do best":"") + ".");
	output("\n\nDragging itself up the side of your face a heartbeat at a time, Dane’s now full-sized schlong begins its inexorable rise, no longer content to hang submissively at the floor. No, it rapidly ascends to thrust all 18 inches of lust-inflated length assertively forward. It’s a dick that isn’t content to be passively worshipped any longer, you realize. It needs <i>sucked</i> and it needs sucked <i>now</i>.");
	output("\n\nRunning your tongue up the underside, feeling every veiny bump and crevice, absorbing the salty notes of cock-taste like the flavor of a fine wine, you climb up to the head, unable to resist kissing it one more time. A dollop of pre oozes out onto your [pc.lips] as you break away, hanging in glossy strand between the strangely shaped prick and your own whorish mouth. You suck in your breath, crossing your eyes to watch Dane’s dick pulsate, the urethra practically quivering in anticipation of all the cum it’s going to pump out, then you open wide to take him inside.");
	//Normal:
	if(!pc.isBimbo() && flags["USED_SNAKEBYTE"] == undefined)
	{
		output("\n\n" + (!pc.hasFaceFlag(GLOBAL.FLAG_MUZZLED) ? " Your jaw wasn’t made for sucking fat, equine dicks, but you’re":" Your muzzle may be ideal for sucking on fat, equine dicks like this one, but even if it wasn’t, you’d still be") + " intent on swallowing as much as you absolutely can. You flick your eyes up to look at Dane as your [pc.lipsChaste] make contact with his sensitive apex but close close them a moment later. Making sure you’re opened wide enough to take him in without scraping him with your teeth takes a surprising amount of muscle control. Somehow, you get him inside, sliding the mercenary’s pulsating prong across your tongue.");
		output("\n\nFat globs of pre-cum leak and drip onto your taste buds as you ease another inch inside, allowing you to sample not just the sweat and skin taste of dick but its heady liquid offerings as well. It throbs powerfully whenever you move, and you aren’t quite content with the progress so far. You suck deeper, hollowing your cheeks, feeling his fat horse-like head bumping up against the back of your throat.");
		if(!pc.canDeepthroat()) output(" A full " + (!pc.hasFaceFlag(GLOBAL.FLAG_MUZZLED) ? "six":"ten") + " inches is inside of you, and you can already feel your gag reflex shivering on the edge of going off. Your mouth floods with saliva, but you wisely ease off a little bit to work with what you can manage.");
		else output(" A gag reflex isn’t exactly a problem for you any more, and with a little concentration, you push the rest of Dane into you in a rush, thrilling at the ecstatic groan he can’t contain when you bottom out against his sweaty sheath.");
	}
	//SnakeByte
	else if(flags["USED_SNAKEBYTE"] != undefined)
	{
		output("\n\nNothing could prepare the dommy ausar for your hungry maw. Your jaw nearly unhinges in its hurry to welcome Dane’s fat fucking cock inside. The slick surface of your tongue lays itself out like a red carpet, sliding along the brute’s urethral bulge as you lean forward to devour ever increasing amounts of dick. Your throat is no obstacle, as a normal [pc.manWoman]’s might be. It’s another erogenous zone for Dane to lay claim to. You guide him into your esophagus with muscular contractions, tugging him so deep that you’re kissing his knot in no time. It takes a little additional effort to open wide enough to accept the bulbous organ, but straining your lips into an obscene, prick-worshipping ‘O’ is exactly the kind of challenge you love.");
		output("\n\nSwallowing him down proves nearly too much for you. Your eyes cross in pleasure to the feeling of having your throat invaded, and you barely notice yourself sucking down the far side of Dane’s knot until your tongue slips into the bottom of his sheath and your lips come to rest against the fragrant, folded skin of his sheath. Your eyes drift closed to savor the feeling of being completely filled; something about stretching your mouth around a dick makes you indescribably happy and contented. It isn’t until Dane cries out in shocked pleasure that you dare to open your eyes once more and stare adoringly up at him.");
		output("\n\nIf you weren’t completely full of cock, you’d be begging him for more.");
	}
	//Bimbo
	else
	{
		output("\n\nLooking up at him before you suck him inside seems like the perfect idea to your sluttified mind. Instinctively acting upon your sex-enabling impulses, you stare up at the albino ausar with nothing but adoration in your practically heart-shaped eyes and slide forward. Cock meets [pc.lipsChaste] with an almost electric sizzle. Your head lights up with pinkened pleasure, and it gets real hard to keep looking at Dane with your eyes crossing all fucked-silly-like. That doesn’t stop your body from continuing on autopilot, sucking down horse-hybrid cock like it was built to, and in a way, you are now.");
		output("\n\nThe back of your throat proves little obstacle for the ausar mercenary’s member. You just swallow once, guiding in into your esophagus, and your bimbofied instincts take over, working your throat muscles to gulp him deeper and deeper. Enveloping the bulb of his knot with your plush lips proves so easy that you don’t even how carefully you controlled your jaw to keep your teeth at bay. Sucking cock is just like, totally natural. Your lips flutters out to lick the tasty sweat-and-sex flavor from the inside edges of his sheath a moment before your straining oral pucker pops into place against it.");
		output("\n\nIt’s almost fifteen seconds later when you remember to breathe through your nose and look up at the wonderful man who gave you all this dick to suck.");
	}
	//Merge
	var sexed:Boolean = (flags["DANE_SEXED"] != undefined);
	//Bimbo/Snakebyte
	if(pc.isBimbo() && flags["USED_SNAKEBYTE"] != undefined)
	{
		output("\n\n<i>“Oh wow,”</i> the mountain of muscle and turgid dick mouths. <i>“" + (!sexed ? "You suck dick better than a galotian.":"I swear you’re the universe’s best cock-sucker.") + "”</i> His hips tremble against you, and he can’t resist using the hand on your head to swivel you this way and that, rolling his length around the inside of your maw and the throat. His dick flexes and strains; you can feel faint warmth when thicker dribbles of pre splash into your belly. <i>“" + (!sexed ? "You’re making me glad I turned down the slyveren girls that came in earlier. I’d fuck all that cum into you.":"You keep this up, and I’ll have to stop sleeping around entirely. I can let you take care of it whenever my balls get this full.") + "”</i>");
		output("\n\nYou cup his balls without even thinking about it, gently kneading them. All that cum inside... and he saved it for you? A blush colors your cheek while you roll the heavy, fattening cum-tanks around in your hands, stroking his sack with your thumbs. There isn’t a single thought in your head besides the desire to suck him deep and make him cum. The taste and feel of Dane’s dong fills the space in your brain that might otherwise think of shame or worry. Right now, you’re a cock-stuffed cum-dump.");
	}
	//Deepthroat
	else if(pc.canDeepthroat()) 
	{
		output("\n\n<i>“Oh wow,”</i> the mountain of muscle and turgid dick mouths. <i>“" + (!sexed ? "You suck dick like a real pro.":"You’re a real devoted cock-sucker...") + "”</i> His hips shudder slightly, and he can’t resist using his hand to press you a little deeper into his sheath, smothering you in the scent of his musky cock-pocket. <i>“Really trained away that gag reflex, didn’t you?”</i> He grunts, flinging warm pre into your belly. <i>“" + (!sexed ? "Blink once if you did it for me.":"Blink once if you masturbate thinking about this.") + "”</i> He tips your head back to see your eyes better.");
		output("\n\nYou don’t even think about it, you just blink, long and slow. Whether it’s true or not doesn’t matter - you know that doing it is going to make him feel even better, and right now, that’s all you want to do - make Dane feel as good as possible. You’re being a slutty little cum-dump and loving it.");
	}
	//Normal
	else
	{
		output("\n\n<i>“Not bad,”</i> the mountain of muscle and turgid dick mutters. <i>“It’s not easy for a normal [pc.boyGirl] to suck a dick this big, I know.”</i> He can’t resist stroking the back of your head with his fingers, gently encouraging you to keep at it. <i>“" + (!sexed ? "If this is going to be a regular thing, I can see about finding you a mod to take care of that pesky little gag reflex.":"I really need to get you a mod to get rid of that pesky gag reflex.") + "”</i> His prick surges, dribbling pre onto your tongue at the thought. <i>“Get you some SnakeByte, and you’ll suck cock like a pro. You’d be able to take all this.”</i> He gestures at his dick and smiles when you cross your eyes to look at the still-exposed length. <i>“Fuck that’d be hot.”</i>");
		output("\n\nYou nod, unable to stop yourself from imagining what that might feel like. You’d be so full, and without an ounce of discomfort. Dane could probably grab you back the back of the head and just jack-hammer your throat until your eyes are watering and you’re twitching with pleasure, just a limp-bodied cum-dump for him to use.");
	}
	//Merge
	//Deepthroat
	if(pc.canDeepthroat())
	{
		output("\n\nResisting the subtle guidance from Dane’s hand when he pulls you back seems... unnecessary. When a second joins it, all but immobilizing you, you let him, passively wiggling your tongue beneath his glorious dick. You’re dizzy with arousal and pleasure. Everything smells like dick, even your own breath when it wafts back into you. So you do the smart thing and keep your jaw just slack enough to provide the well-endowed mercenary with some friction when he slams your head the whole way back down into his crotch.");
		output("\n\nYour nose is practically flattened into his firm abdominals. Sweat smears the tip of it, and when he reverses direction, you get a chance to admire how beautifully your spit shines that lovely beast-cock before swallowing it once more. When you don’t struggle or fight it in the slightest, Dane grins toothily and doubles his pace, fucking your face like he owns it, which you suppose, he basically does for the moment. Spittle flies from the corners of your [pc.lips]");
		if(pc.hasVagina()) output(" while [pc.girlCum] dribbles from your other pair" + (pc.hasVaginas() ? "s":""));
		else if(pc.hasCock()) output(" while pre-cum dribbles from your [pc.cocks]");
		output(".");
		if(flags["USED_SNAKEBYTE"] != undefined) output(" Such thickness sliding through your throat fills you with ecstasy to the point where it gets harder and harder to control your new muscles there, but their passionate quivering only spurs Dane to pound away with even firmer strokes, his cockhead fattening obscenely.");
		else if(pc.isBimbo()) output(" Feeling his thickness swelling in your throat, especially his obscenely fattening flare, fills you with a small orgasm’s worth of satisfaction. Bringing pleasure to others, especially sexual pleasure, floods your mind with so much dopamine that you wouldn’t mind in the slightest if he pulled out, painted your face, and left you gasping on the floor. You’d just be thrilled that <i>he nutted to you</i>.");
		else output(" Thickness strains your throat more and more as he uses you, his flare ballooning to obscene proportions as orgasm nears. You feel filthy and degraded in all the best ways, drooling pre and spit all over yourself Dane mounts your mouth like a man possessed.");
	}
	//Normal
	else
	{
		output("\n\nThe fantasy fades away when Dane taps your chin expectantly, but the degraded thrill and cock-attuned excitement remains. You wiggle your tongue against him and slide back, revealing a nicely glossed length of dick for your fingers to wrap around. Jerking him off is easy with all that spit. You don’t even notice that you’re drooling while you smear the slick fluids lower, massaging them into every exposed inch. Dane pushes your unresisting maw back down when your fingers reach his sheath, and you respond by hollowing your cheeks with a loving suck.");
		output("\n\nYour hands aren’t idle, however. You use both of them in a two-handed grip, barely surrounding a decent chunk of dick, and pump up and down to the tempo Dane sets with your head. He’s oddly considerate for someone who’s pushing your face back and forth on his dick, never forcing you any lower than you ventured on your own, sure to give you a moment here or there to inhale a long drag of dick-scented air.");
		output("\n\nThen it’s back to polishing his knob.");
		output("\n\nMentally, you’re almost entirely shut down. There’s a sort of single-minded focus on pleasing Dane, sure, but you aren’t really thinking about anything for a few minutes straight. You just suck, and jack, and leak spit like a pussy dribbles cum. It’s the sudden expansion of Dane’s flare that spurs your brain into action once more: <i>He’s going to cum!</i> Your tongue slithers into action once more" + (pc.hasTongueFlag(GLOBAL.FLAG_LONG) ? ", stretching out of your mouth to loop around Dane’s dick like a barbershop pole’s red stripe, then straining further to slide down the crease of his balls":"") + ". A little extra slobber allows your hands to flow back and forth at obscene speed to coax him to his peak all the faster.");
	}
	//Merge
	//Dane cummies time!
	//Deepthroat
	if(pc.canDeepthroat())
	{
		output("\n\nA jaw-stretching throb is the only warning you get that Dane’s cumming. Well, that and a small grunt. Then there’s a sudden churning gurgle in your gut, accompanied by a slow, seeping sense of warmth. Strong muscles pull you forward so hard that it hurts your ears");
		if(flags["USED_SNAKEBYTE"] != undefined) output(", but your own oral climax blends the pain into even greater pleasure");
		else if(pc.isBimbo()) output(", but your own fuzzy sense of satisfaction smothers into nothing but more pink brain-fluff");
		else output(", but the tears welling at the corners of your eyes make it seem worse than it is");
		output(".");
		if(pc.hasCock())
		{
			output(" Your [pc.cocks] fling" + (!pc.hasCocks() ? "s":"") + " your own climax " + (pc.isCrotchExposed() ? "out across the floor":"into your [pc.crotchCoverUnder]"));
			if(pc.hasVagina()) output(" while y");
			else output(".");
		}
		else if(pc.hasVagina()) output(" Y");
		if(pc.hasVagina())
		{
			output("our [pc.vaginas] clench" + (!pc.hasVaginas() ? "es":""));
			if(pc.isSquirter()) output(" and squirt" + (!pc.hasVaginas() ? "s":""));
			output(" imploringly, begging you to let him fuck you there next time.");
		}
		output(" Eyes rolling back from lack of breath and pure, erotic contentment, you sit, light-headed and weak, and let the cum pump into you. Your nose is buried so deep into his sheath that you can’t breathe anything but his heavy, masculine scent. Dreamily, you wonder how you’ll manage to get anything done while smelling nothing but Dane-dick for the rest of the day.");
		output("\n\nYou feel so full, but Dane isn’t done quite yet. You’re held in place for a dozen more tummy-gurgling cum-shots. Each muted splash leaves you more aware of just how fully you’ve been treated like his personal cum-dump. You feel your tummy rounding as blackness creeps into the edges of your vision, and your eyelids are so heavy...");
	}
	//Normal
	else
	{
		output("\n\nA jaw-stretching throb is the only warning that you get that Dane’s cumming. The only problem is that his flare stretches your jaw so wide that you couldn’t possibly pull him out. His equine anatomy has locked him into your mouth for the duration of his orgasm, forcing you to deal with the flood of salty jism by swallowing as fast as he can spurt. You do your best to gulp down the thick love-syrup, your throat bobbing almost as fast as your hands are stroking, but Dane’s a very virile boy. Those heavy nuts didn’t just seem packed full of cum; they were.");
		output("\n\nThere’s no time to breathe. If you tried, you’d wind up breathing nothing but spunk, so you focus entirely on chugging his spooge, feeling it filling your belly. Your stomach gurgles warningly long before he’s done, and all the slutty swallowing soon leaves you with a little bit of " + (pc.bellyRating() < 10 ? "cum-packed pudge in your middle":"extra cum-pudge in your middle") + ". If only you could get some oxygen! The edges of your vision are getting dark, and it’s hard to remember to swallow with your heartbeat thundering in your ears. Your arms fall away from the dog-man’s cock as you grow tired.");
		output("\n\nYou feel like a passenger in your own body, wrapped around a dick you can only react to.");
	}
	//Merge
	output("\n\nDane threads himself out of your " + (!pc.canDeepthroat() ? "mouth":"throat") + " so abruptly that you don’t even remember to breathe right away. You just sit there, taking the last lance of spunk across your features, dumbly waiting to pass out until a stray trickle of cum hits your sensitive [pc.nippleNoun] and reminds you that you’re capable of gasping. The world blasts back to full color, but your brain lags behind while you suck in fresh air, more aware of how " + (flags["USED_SNAKEBYTE"] == undefined ? "oddly":"totally") + " satisfying the encounter was than the feel of Dane wiping his dick off on your " + (pc.hasHair() ? "[pc.hair]":"shoulder") + ".");
	output("\n\n<i>“" + (!sexed ? "Fuck, you’re a good slut, [pc.name].":"You’re always good for a facial, aren’t you, slut?") + "”</i> Dane gingerly slips his codpiece on with a bit of effort, clipping his shield belt on just after. He pats your head. <i>“Maybe next time, I’ll " + ((flags["LOST_TO_DANE_ON_MHENGA"] == 1 || flags["DANE_BUTTFUCKED_U"] != undefined) ? "hit your ass again":"try your ass") + ". You’d like that, wouldn’t you?”</i>");
	output("\n\nYou nod, covered in cum and drool, still trying to catch your breath.");
	output("\n\nThe swaggering mercenary walks out while you’re still " + (pc.hasKnees() ? "on your knees":"on the floor") + ", though you note that his tail is wagging rapidly enough to thump both sides of the door.");
	output("\n\nIt’s a good thing someone left a roll of paper towels in here or you’d have to walk back out with your face covered in spunk... unless you want to look like a total slut?");
	processTime(35);
	pc.loadInMouth(chars["DANE"]);
	pc.orgasm();
	clearMenu();
	addButton(0,"Clean Up",cleanUpYaSkank);
	addButton(1,"Dirty Slut",beDanesDirtySlut);
}

//Dirty Slut
public function beDanesDirtySlut():void
{
	clearOutput();
	showName("BEING\nA SLUT");
	output("Striding back into the casino with Dane’s approval painted upon your features seems like a great idea, so it’s exactly what you do. Who cares if you look like a slut? You are.");
	pc.applyCumSoaked();
	IncrementFlag("DANE_SEXED");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Clean up
public function cleanUpYaSkank():void
{
	clearOutput();
	showName("TIDYING\nUP");
	output("You make yourself as presentable as you can");
	if(pc.cumflationEnabled()) output(", but there’s no cleaning up all the cum in your belly");
	output(".");
	pc.simpleClean();
	IncrementFlag("DANE_SEXED");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Dane Tailjerk [2200 werdz]
//Happens if tail hasn't been proper fed. If this scene has happened twice, fed status stops mattering and just randomly occurs in the future.
public function daneTailjerkScene():void
{
	clearOutput();
	showDane(true);
	author("Fenoxo");
	output("You can’t quite control your enthusiasm - or your " + (pc.tailCount == 1 ? "tail’s":"tails’") + ". " + (pc.tailCount > 1 ? "One of them":"It") + " gleefully wraps itself around Dane’s body as you’re carried, nuzzling its slit-vented tip against the ausar’s weighty bulge. Each contact is wetter than the last, and by the time you reach the entrance to the booth, Dane’s crotch guard is frosted in your parasite’s eager juices.");
	output("\n\nHis heavy bootfalls come to an abrupt stop, but your slobbering tail won’t stop. It rubs its slick flesh against Dane’s still-contained cock with increasing ardor. You whimper softly, as much a prisoner to erotic sensation as to the ausar’s arms and helpless to do anything about either - not that you have any mind to. Whatever he has planned for you will be fine, you muse while relishing your hungry orifice’s sensations. The room whirls around, but Dane’s walking again, carrying you somewhere.");
	output("\n\nProbably somewhere sexy. Maybe he’s going to fuck your tail? That big bitch-breaker of a knot at its base would feel so good spreading you out from inside... maybe it’d even get stuck, forced to fire every load directly into your suckling parasitic twat.");
	output("\n\nWalls spin by drunkenly as you are plunked back into your original seat. It’s still warm, the cushion vaguely retaining its previous imprint of your [pc.butts]. Somehow your tail is still affixed to Dane’s tender, throbbing loins, but only barely. You blink a few times, whimpering slightly, and ask, <i>“Wh-what? I thought we were...”</i>");
	output("\n\nDane, shifting awkwardly into his own seat, gently removes your tail from his crotch. Webs of slime drizzle from the winking entrance. It writhes softly, straining to get closer to his delicious cock. The ausar watches your face closely, bringing a finger up to the sodden entrance. He prods the rim, circling slowly around the fleshy lips before diving in without warning. His fingertip is just so <i>thick</i> and <i>strong</i> that you can’t contain your whimpering, nor can you stop your tail from squeezing down on the intruder or worshipfully massaging it.");
	output("\n\n<i>“Ah,”</i> Dane remarks, pulling his finger free to leave you achingly vacant once more. <i>“I was going to fuck you, but this little slut...”</i> He shakes the tail in front of your face. <i>“She couldn’t wait... and she made some very persuasive arguments.”</i> Shaded beneath the bar, Dane’s free hands go work around his crotch. <i>“Besides, it’ll be fun to watch you try to keep it together while I’m playing with her.”</i> Dane hands you his codpiece, the fabric lining slick and musky with sweat and who knows what else.");
	if(pc.libido() <= 33) output(" You feel dirty just handling it.");
	else if(pc.libido() <= 66) output(" You don’t really know what else to do with it, so you hold onto it for now.");
	else output(" You sneak a wanton sniff before clutching it to your chest, your heart hammering in excitement at the idea of some public play.");
	output("\n\n<i>“This is going to be fun,”</i> the mercenary dryly remarks. He roughly handles your [pc.tailCunt], tugging it under the bartop to somewhere just above his blunt-tipped dick. You can almost feel the turgid flesh below, only a few inches away, but his grip is too tight to allow you to wrench free. He squeezes so hard that it feels like you’re being juiced. Streams of girlish anticipation pour out of you as inner folds are forced to squeeze against one another. It’s a wonderful feeling, but it’s not quite penetration. It doesn’t carry a shiver of satisfaction up your spine, only a greater craving for more.");
	output("\n\nNow that something has woken those nerves up, they refuse to go silent, filling the back of your mind up with their pernicious demand for cock - their need for endless pulsating waves of warm, creamy jism. It’s like an itch that only thick, white spooge can relieve.");
	output("\n\nDane slaps your cheek, drawing you back to the present. <i>“Hey, you still with me?”</i>");
	output("\n\nYou nod, blushing hotly.");
	output("\n\n<i>“Keep it together, or I’m not gonna let you be my cum-dump.”</i> He’s looking at you so severely, but there’s a smile woven through in the stern timbre of his voice. <i>“Okay?”</i>");
	output("\n\nYou nod, biting your lip. <i>“Okay.”</i>");
	output("\n\n<i>“Atta [pc.boyGirl].”</i> Dane says. <i>“Just keep your eyes open and look at me. If you close them or let them roll back, I won’t cum inside.”</i> One of his hands produces a small holocam, already flashing red to indicate it’s recording. <i>“Ready?”</i>");
	output("\n\nYour head flops up and down like a dashboard bobblehead during re-entry.");
	output("\n\nGrinning roguishly, Dane relaxes his grip and guides your rebellious (but oh so pleasant!) appendage down until its slobbering lips make contact with his blunt-tipped apex. The full weight of your cunttail’s muscles pushes downward, and the ausar allows it. He lets you smush your cunt’s cum-hungry folds against his prickhead so hard that you can feel his heartbeat through them. His fingers loosen, and at long last, you’re allowed to spread yourself wide enough to swallow the first inch of hard mercenary dick.");
	output("\n\nYour eyes cross from the pleasure, but you keep yourself from letting your head loll back or closing your eyes. It’s just so... intense! Hot, hard cock is spearing inside you! It’s spreading your folds so thigh-shudderingly wide. Your tailcunt pumps so much pleasure up your spine that there’s scarcely room for any other sensation. You may forget what the seat feels like, but you know every vein and ridge on Dane’s first two inches.");
	output("\n\n<i>“Look at you, holding it together... mostly,”</i> your four-armed mate says, grabbing you by the chin and tilting your head this way and that.");
	output("\n\nInches of dick-starved cunt slither through Dane’s fingertips, taking him to the knot with a few wet-sounding gulps. Explosions of ecstasy detonate behind your fluttering eyes. Fluids splatter the floor, and a bit of drool trickles down to your chin. Wantonly rippling contractions bombard you with hellishly pleasurable friction until that spec of drool seems about a thousand miles away.");
	output("\n\n<i>“Ohhh yeah,”</i> he sighs, watching you through heavy lidded eyes. <i>“How are you doing, [pc.name]? Just relaxing and enjoying yourself, right?”</i>");
	output("\n\n<i>“Mmm-huh,”</i> you mutter, not quite looking at Dane (or much of anything). You just want to wrap yourself around him and let your tail go wild. Of course, if you did that... he’d probably pull out. He’d pull out and not let you have any of that cum...");
	output("\n\nThe whimper that began in the back of your throat is silenced by the sudden appearance of Dane’s thumb, filling your lips. <i>“Yeah... you don’t need to talk much. Don’t need to have the whole bar hearing you squeak, do we?”</i>");
	output("\n\nA muffled hum is the best you can manage.");
	output("\n\n<i>“Thought so. Here, let me help.”</i> Dane grabs your [pc.tailCunt] just behind its swollen lips and tugs it the rest of the way down. Feeling like it’s about to split in two, your strained channel transmits the barest flash of pain before something inside gives way, allowing Dane’s ballooning knot to pop back inside, your sore entrance vacuum-tight against its sloping underside. <i>“Hoo-fuuuck,”</i> the canine brute grunts, squeezing tighter. <i>“Tight.”</i> His face scrunches up with the effort of holding back.");
	output("\n\nYou’re no better. You suck on Dane’s finger with ravenous intensity, your [pc.tailCunt]’s hunger bleeding into your perception of almost every bodily orifice. You want to be full of dick. Full of <b>cum</b>. You ache for it. You crave it. That big, hard hybrid cock inside you is only dribbling, but you want it to spurt. You suck harder from both ends, feeling the rippling in your tail accelerating, so fast and so tight that you’re nearly vibrating. You’re basically Dane’s condom at this point, and it feels <i>so good</i>.");
	output("\n\nThe red-eyed ausar doesn’t announce his climax with a grunt or a moan or a whine. No, his dick does that for him. It <b>throbs</b> so large that your tail feels like it’s about to tear in half. His heartbeat slams against your inner surfaces like a stimmed-up drummer. Somehow, all the extra blood flow makes him even warmer - no, hotter, almost incandescent. You imagine that if you could see it, wisps of steam would rise from its gnarled flesh, but you’ll have to get by on the amplified sensations your tail provides. Even if you were a blushing virgin, the parasitic prick-hunter on your spine would tell you that Dane is less than a second away from giving up his virile prize.");
	output("\n\nMind-whitening bliss hits you harder than the galaxy’s most potent drug. The thick tide of ausar cum flooding your [pc.tailCunt] feels better than anything should. It’s like having one gigantic clit wrapped around his dick and cumming from the sensation of jism drizzling across every inch of it. His turgid, hybridized schlong flings pussy-drenching gouts of spunk deep into your butt-mounted cunt’s recesses - so deep that automatic, muscular response used for swallowing it up mostly just coaxes the spurting pole to cum harder. Staying cogent (or even upright) in the face of such incredible pleasure is impossible.");
	output("\n\nThe camera records your eyes going unfocused and far away, then rolling halfway back as your head empties and your pussy fills. An arm around your shoulder keeps you from toppling out of your seat, but it comes at the expense of Dane pulling his finger out of your mouth, leaving your jaw to gape and tongue to spill out");
	if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output(" onto the bar");
	output(". Feverish-sounding whimper-moans stutter up out of your throat as your brain struggles to cope with entire orgasms worth of pleasure, synced perfectly to the tempo of Dane’s seemingly endless ejaculations.");
	output("\n\nTears of joy soak your cheeks, and drool hangs from your chin. Dane, meanwhile, breathes a series of increasingly satisfied sighs. He pulls you closer, tucking your cheek against a bicep moistened by the slightest hint of sweat, giving you all the license you need to give up on maintaining your appearance so that you can focus on the ecstatic sensation of getting your tailcunt absolutely stuffed with the knotty merc’s cream.");
	output("\n\nWith the bar little more than a fuzzy backdrop, your senses narrow down to focus almost entirely on what’s going on in your tail. The lone exception is the aromatic hint of Dane’s scent tickling your nostrils, ensuring that every blissful new memory is just as tied with his scent as you are with his dick. However augmented the muscle-bound ausar may be, he’s no kui-tan. His prodigious load tapers down to a steady trickle of fresh-brewed sperm, but true to his canine nature, it does not stop there. Dane’s knot ensures that he’s going to be lodged inside your tail for some time to come, and the frequent dribbles of semen oozing out of him ensure that you won’t be thinking of anything but how good it feels to get your tail flooded for the rest of the hour.");
	output("\n\nWhen Dane asks you if you’re his filthy little cum-rag, you agreeably nod, half kissing at his pecs. When the bartender asks him if he needs anything, he smiles wolfishly and pets the back of your head, answering, <i>“Nah. [pc.HeShe] got me satisfied for the moment.”</i>");
	processTime(30);
	pc.orgasm();
	pc.loadInCuntTail(chars["DANE"]);
	clearMenu();
	addButton(0,"Next",daneTailFuckOutro);
}

public function daneTailFuckOutro():void
{
	clearOutput();
	showDane();
	author("Fenoxo");
	output("Of course, the intoxicating pleasure your tail pumps out has to come to end, just like Dane’s load, and as you become more lucid, the big guy holds up the camera and asks you once more, <i>“How do you feel about taking ausar loads?”</i>");
	//First time
	if(flags["DANE_TAILCUNTED"] == undefined) output("\n\nYou smile, too satisfied for words, and flash a thumbs up.");
	else if(flags["DANE_TAILCUNTED"] == 1) output("\n\nMaybe you’re starting to get used to the rough treatment, but this time you manage to answer, <i>“I love it.”</i>");
	else if(flags["DANE_TAILCUNTED"] == 2) output("\n\nFully expecting this, you smile broadly. <i>“It makes me cum soooo hard. Thanks, Dane!”</i>");
	else if(flags["DANE_TAILCUNTED"] == 3) output("\n\nYour answer spills out almost automatically. <i>“Fuck yes, I love it when you cum in me!”</i> It feels almost like a trained response at this point - cum super hard on Dane’s dick, then gush about how much you love it... but you do love it.");
	else if(flags["DANE_TAILCUNTED"] < 7) 
	{
		output("\n\n<i>“I love it,”</i> you gush, entirely honestly. <i>“I love making you bust big, fat, filthy nuts in my greedy little tailcunt.");
		if(flags["DANE_TAILCUNTED"] >= 5) output(" I love letting you use me in public like some slutty fucktoy.");
		if(flags["DANE_TAILCUNTED"] >= 6) output(" You don’t even need to wait for me to ask. Just grab it and use me. Whenever you want.");
		output("”</i> The placid bliss radiating from your tail makes it hard to be anything but happy about that course of events.");
	}
	//8+
	else if(flags["DANE_TAILCUNTED"] >= 7)
	{
		output("\n\n<i>“I love it!”</i> you proclaim wholeheartedly. <i>“Nothing makes me happier than draining your balls, Dane.”</i> You reach down to brazenly fondle him beneath the bar, smiling licentiously at the camera. <i>“You got me hooked on that thick, ausar dick.”</i> You thrill at how pleasant it feels to be openly cum-thirsty, and the narcotic thrill of pleasure leaves you to wonder when you can do this again...");
	}
	//Merge
	output("\n\nWith his knot’s swelling finally going down, Dane is at last able to pry himself free from your rapacious parasite. The wet sucking sound it makes as it’s removed seems loud enough for the whole bar to hear it, even over the din of the slot machines casino patrons, but nobody spares you a second glance.");
	output("\n\nMiraculously, your tail doesn’t so much as release a single drop. Every drip of virile ausar cum is safely tucked away inside for your parasite to digest. The feeling of calm warmth it radiates into you is going to linger for hours, longer after you’ve left the casino behind.");
	output("\n\n...assuming you can pry yourself away from Dane. Now that you’re able to move under your own power, he releases your wobbly form back into your seat with a smile and a muttered, <i>“Good [pc.boyGirl].”</i>");

	//If pc.hasCock && !crotch exposed && pc.cumQ() > 50 OR vagina+squirter
	if(((pc.hasCock() && pc.cumQ() >= 50) || (pc.hasVagina() && pc.isSquirter())) && !pc.isCrotchExposed()) output("\n\nClimaxing that hard is not without cost. The inside of your [pc.crotchCoverUnder] is absolutely drenched with the proof of your passion, leaving you smeared with own sexual juices from the waist down.");
	//+libido
	pc.libido(1);
	//+feeding happened at climax of previous scene.	
	IncrementFlag("DANE_SEXED");
	IncrementFlag("DANE_TAILCUNTED");
	processTime(25);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Dane Cuntfuxx [4400]
//Seated reverse cow-girl. Hands everywhere. Lots of comments on tit size/config? Neck biting for 1 damage.
public function daneCuntfucks():void
{
	var x:int = rand(pc.totalVaginas());
	clearOutput();
	showDane(true);
	author("Fenoxo");
	//Clothed
	if(!pc.isCrotchExposed()) output("Dane strips you bare before he bothers to close the booth" + (pc.exhibitionism() >= 66 ? ", giving you a lovely exhibitionist thrill":"") + ". ");
	//Merge no new pg!!!!
	output("Your possessions come to form a lovely little pile in the corner at the behest of " + (pc.isCrotchExposed() ? "Dane’s":"his") + " omnipresent hands. This leaves you with naught but your [pc.skinFurScales] for protection, and even that seems a flimsy shield against his furry mits and heated breath.");
	output("\n\nGravity goes crazy as Dane takes his seat. You blink your eyes closed and try to fight off the dizziness as best you can. When you open them once more, you’ve come to rest in the burly ausar’s lap with your [pc.butts] graced by the increasingly warm throbs of Dane’s augmented erection. It threads up" + (pc.tailCount > 0 ? " past your [pc.tails]":"") + " to rub against the small of your back, slightly greasy with sweat from long hours of being hidden away in his codpiece. You wiggle back against it, nausea forgotten for the moment as your body reacts to his presence with ");
	if(pc.vaginas[x].wetness() < 3) output("a trickle of wetness into your slit" + (pc.hasVaginas() ? "s":""));
	else if(pc.vaginas[x].wetness() < 5) output("a stream of pussy-moistening lubrication");
	else output("a flood of pussy-soaking moisture");
	if(pc.hasCock()) output(" and " + (pc.cockTotal() == 1 ? "a ":"") + "useless erection" + (pc.hasCocks() ? "s":""));
	output(".");
	output("\n\nYour wrists are grabbed and restrained to the side while your [pc.butt] is groped and explored with ever-greated levels of force and attention. Dane’s fingertips knead deeply, spreading your cheeks apart before slapping them back together again around his cock. For a second, he savors the experience, but the greedy mutt won’t be satisfied with your heiny alone. The same hands that groped you lift you up with seeming ease, guiding you back so that you’re hovering just above the blunt head of his prick.");
	output("\n\nYou can see it when you look down. The glossy, bestial crown twitches in eagerness, welling up a crystalline droplet at its apex as you float above. From here it seems massive - impossible even");
	if(pc.tallness < 5*12) output(", like it’ll be jabbing all the way into your ribcage by the three quarter mark");
	output(".");
	if(pc.vaginalCapacity(x) >= daneCockVolume() * 2) 
	{
		output(" You know better, of course. Your cunt is prepared to take 18”</i> monsters like this");
		if(pc.wetness(x) >= 4) output(" - so prepared, in fact, that your dribbling sex" + (pc.hasVaginas() ? "es have":" has") + " already coated his crotch in " + (!pc.hasVaginas() ? "its":"their") + " constant, dribbling slickness");
		else if(pc.wetness(x) >= 3) output(" - so prepared, in fact, that your leaky sex" + (pc.hasVaginas() ? "es have":" has") + " begun to share " + (pc.hasVaginas() ? "their":"its") + " sopping bounty in the form of dribbling dick-lube");
		output(".");
	}
	else if(pc.vaginalCapacity(x) >= daneCockVolume()) output(" You’re fairly confident that you can take this monster - or at least you were a minute ago. Now the second thoughts just make you hotter, wetter, and even more eager to give it a try.");
	else output("It’s too late to turn back now. Whether it’ll fit or not, Dane has the look of a man that’s going to try, and the thought of taking such a monster has your heart fluttering with anxious lust.");

	output("\n\nHot breath washes over your [pc.ear] as Dane leans close. With his grip on your arms, he pulls you the rest of the way back, nibbling a little before he announces, <i>“I’m going to ruin you for other men.”</i>");
	output("\n\nEquine prick forcefully slaps into cuntlips, not hard enough to hurt but hard enough to leave you exquisitely aware of just how <i>firm</i> you’ve made the mercenary. His cock feels like it’s made out of iron, and as it slides back and forth, gathering moisture from your channel, it thumbs its rim past your [pc.clit]" + (pc.totalClits() > 1 ? "s one at a time":"") + ". With no control over your descent, you’re left a shuddering wreck. Each brush against " + (pc.totalClits() > 1 ? "a":"your") + " buzzer makes you gasp and twitch. Each forced gyration of your hips makes you wonder if it’ll be the one that finally pries your " + (pc.looseness(x) >= 4 ? "loose ":"") + "lips open and welcomes him inside.");
	output("\n\nDane’s warning rings " + (flags["DANE_VAGFUCKS"] != undefined ? "just as true as last time.":"true as you hang there.") + " He has complete control over your entire body, and that enormous, cunt-wrecking dick is right there, grinding against you. It’s maddening! Without conscious thought, you spread your [pc.thighs] wider in an attempt to welcome it inside" + (flags["DANE_VAGFUCKS"] != undefined ? ", on some level aware that you got him to thrust that way last time":"") + ".");

	var oldCapacity:Number = pc.vaginalCapacity(x);

	//Gaped
	if((pc.isTaur() || pc.looseness(x) >= 4 || oldCapacity >= 4*daneCockVolume()) && oldCapacity >= daneCockVolume())
	{
		output("\n\nRight on cue, Dane thrusts himself into your welcoming twat. There’s no pain to the act. Your pussy has been trained to take dicks like this. As you sink down his seemingly endless inches, you swoon from the rising pleasure. The more the ausar’s thick cock fills you, the more wonderful the pleasure. It flattens interior folds as it presses by, somehow still finding the girth to make you stretch the tiniest bit. You know that he’s turning your cunt into an inverse mold of his dick, at least for the moment, and it makes your pussy absolutely molten with desire. Rivulets of [pc.girlCum] stream down Dane’s length up until the moment your lips kiss his balls.");
	}
	//Smolcunt
	else if(oldCapacity < daneCockVolume())
	{
		output("\n\nNothing could prepare you for the sensation of that huge, ausar-equine dick abruptly forcing its way into you. Your lips spread so wide so fast that it feels like you’re on the verge of tearing something, but at the same time, that first inch of prick-head fills you so blissfully full that you can’t help but wonder how much more you can take. Dane answers for you by pulling you further down. His fingers dig into your thighs as he grunts and lays his claim to your passage, transforming it from a taut channel to an inverse mold of his thick beast-cock.");
	}
	//Not toosmol but not gaped
	else
	{
		output("\n\nThere’s nothing quite like having a nice, fat cock spreading you open. When Dane’s dick slides inside, it pins your lips wide around its veiny girth, burrowing in with only a little additional help from your Dane and your own bodyweight. The sensation of it slithering through your folds, stretching them out and reshaping the inside of your body into a mold of his dick, is intoxicating. You swoon as you are filled, your whole body blushing" + (pc.bellyRating() < 30 ? " as Dane’s imprint appears on your stomach":" as Dane’s dick lays claim to you in the most primal of ways") + ".");
	}
	//Merge
	//Stretchuchekku!

	pc.cuntChange(x,daneCockVolume());
	output("\n\n<i>“Ohh yeah...”</i> Dane sighs in sudden ecstasy, your juices as pleasant as the universe’s best salve. <i>“");
	if(oldCapacity < daneCockVolume()) output("Fuuuck, I can’t believe I’m not splitting you in half! Look at it, [pc.name]. Look at how badly my dick is breaking-in that tight little puss of yours.");
	else if(oldCapacity < daneCockVolume() * 2) output("Look down, [pc.name]. Look at what my dick’s doing to that slutty little cunt of yours. Look at good it nice it looks split open by a nice, big cock.");
	else if(pc.looseness(x) < 4) output("Damn, [pc.name]. You’ve got a fucking magic little twat on you, clutching me all nice, but it doesn’t fight me in the slightest. I could probably pop a couple of Throbbs, and that slut-cunt of yours wouldn’t mind in the least.");
	else output("Fuuuck, you’re such a filthy slut, [pc.name]! Look at that cunt! Look at how easy it sucks down my dick. Bet I could invite a Jumper over, and you’d have room for both of us.”</i> He groans. <i>“But damn it feels nice to take a pussy that knows what it’s doing.");
	output("”</i>");
	//No tit mocking
	if(pc.biggestTitSize() < 1)
	{
		output("\n\nHowever you intended to retort doesn’t matter. Dane’s hands find your chest, cupping and stroking their way across your bare [pc.skinFurScalesNoun] to find your [pc.nipples]. He growls, <i>“Usually I prefer my cum-rags to have something for me play with up top.”</i> His fingernails prick sharply, dizzying you with mixed pain and pleasure. <i>“Nothing says fertile, breeding bitch like a pair of slutty, jiggling tits,”</i> he growls into your ear, nipping at its underside. <i>“But you don’t have that. You came here with a wet cunt and these pathetic little nubs.”</i> He twists one. <i>“You should be ashamed of yourself, begging for my dick when you don’t even bother to get proper tits.”</i> His growled insult seems to vibrate through your entire body, radiating playful displeasure. <i>“But I guess when you’re a pocket pussy on legs, you aren’t expected to have tits, is that it? Is that what you think?”</i>");
		output("\n\nHeld tightly and fucked completely full... you’re in no place to think anything through. You just know that he’s so fucking hot inside you, and what he’s doing to your nipples is making you leak like a faucet. Your whimpered ‘Yesssss’ seems a formality at this point. You’ve already volunteered to be his cum-dump.");
		output("\n\nHow bad can being his personal pocket pussy be?");
		output("\n\n<i>“That’s what I thought. Lazy bitch.”</i> Dane bites you, hard. Hard enough to bruise, though not enough to leave you bloody. <i>“I’ll just have to torture these little bitch-nubs, then. Maybe if I pinch them enough, they’ll swell up into proper tits.”</i> He pinches harder, scissoring his hips upward at the same time to leave you seeing stars. <i>“We’ll make you a properly fuckable cunt in no time.”</i>");
		output("\n\n<i>“Yesss, Dane,”</i> you mumble through gritted teeth, not intending to sound quite so... fawning, but not exactly minding either.");
	}
	//Small tid
	else if(pc.biggestTitSize() < 4)
	{
		output("\n\nWhatever your intended reply, it vanishes with the sudden appearance of Dane’s hands on your [pc.fullChest]. His meaty, calloused palms and grubby fingers feel like they belong on a giant when compared to your modest bosom. He cups the entirety of a pert swell in a single palm with plenty of room leftover to reach for your [pc.nipple]. True to his canine nature, Dane’s claws prick at your tender buds while they explore. Sparks of intermingled pain and pleasure dance through your captive chest with increasing frequency - until at last, Dane is squeezing and tuggle upon your tender peaks.");
		output("\n\nIt’s clear that the mercenary has taken full possession of your chest. Though it is attached to your body, it’s Dane’s hands that control it, that force sensation after sensation through it until you’re squirming on his dick like, well... his personal cum-rag.");
		output("\n\n" + (flags["DANE_VAGFUCKS"] == undefined ? "Why does that thought make you so wet?":"The rush of moisture that thought brings to your channel always leaves you smiling... that and the big, thick dick inside of it."));
	}
	//(Not big tit) Deece tit groping (sub F-cup. Boy we have a skewed scale!)
	else if(pc.biggestTitSize() < 11) 
	{
		output("\n\nHowever your thoughts on his words, they’re scattered the moment his palms appear against the undersides of your [pc.fullChest]. His calloused hands squeeze you roughly, the tips of his fingers grazing your [pc.nipples] with their cursory exploration. He’s just so... <b>strong</b>, his grip so solid. You feel equal parts claimed and protected by his grip. The cords of his muscles flex against you while he explores your bosom, providing a calm reassurance that while you are his, no harm will come to befall you. When he squeeze harder, enough to twinge at the edge of pain, the rush of endorphins leaves you quivering like a taut bowstring.");
	}
	//Big tiddy groping commence - prereq for fingering/milking/jerking
	else
	{
		output("\n\nWhatever reply you were about to make is stolen by the sudden appearance of Dane’s hands on your [pc.fullChest]. No longer needed to hold your ass aloft, they’ve taken full possession of your chesty swells. Strong fingertips dig furrows into the vulnerable flesh as they explore, pricking where his nail dig in. You moan at their eager touch, then let out a full-throated groan of pleasure when those pointed tips wiggle up to your [pc.nipples], gently scratching small circuits of blazing sensation across the tender surfaces.");
	}
	//Big enough tids get maybe bonus funzies!
	if(pc.biggestTitSize() >= 4)
	{
		//Fingering
		if(pc.hasFuckableNipples())
		{
			output("\n\nYou arch your back to better present your breastly treasures, in turn forcing the ausar’s fingers deeper into your [pc.nipplesNoun]." + (pc.hasLipples() ? " They slide inside as easily as you might expect thanks to the forgiving nature of your oral-endowed nips, forcing the pillowy breast-toppers into wide, whorish ‘o’s. It looks almost like your chest is greedily sucking Dane’s digits inside, but he’s solely responsible - and happy to violate every supple hole you present him with. He fingerfucks your tit-mounted mouths until the various penetrations all blend together into a chorus of satisfying <i>fullness</i>.":" He seems surprised to find himself knuckle deep in tit, but with a shrug, Dane sets himself to taking full advantage of the opportunity you’ve presented with, plunging his digits in and out to fully explore the depth and elasticity of your nipple-cunts. Neither disappoints him. Your fuckable bosom is as tight as it is slick, and it welcomes the four-armed alien inside just as eagerly as you welcome the pleasure it brings with it. Dane <i>fills</i> you in three places at once. It feels fantastic, suspended in his lap as he avails himself of every perverse orifice you have to offer."));
		}
		//Titty jerking
		else if(pc.hasDickNipples()) 
		{
			output("\n\nLetting your [pc.nippleCocks] surge free from your tits feels almost like an extravagance in a situation like this. You’re already getting the fucking you want. It would be easy to hold in your rapidly engorging, boob-mounted pricks, but you can feel so much more! You can feel them slide into Dane’s befuddled fingers. After being stuffed up for so long, being allowed to expand to full tumescence is heavenly. You revel in the sensation of his callouses exploring your freshly revealed phalli, gasping and panting in sublime glee like the decadent slut you are.");
			output("\n\nIt’s fortunate that the pup-for-hire is a fast learner. He grabs your [pc.nippleCocks] when he realizes just how much you love his touch, gathering their fragrant drippings into his hands to smear over their trembling surfaces. Dane pumps them casually, almost effortlessly - like he’s done this before. He doesn’t ask how you got them or where, he merely uses the bounties he’s been given.");
			output("\n\nIt’s difficult for you to process. Having dicknipples jerked while impaled upon the universe’s loveliest cock isn’t something anyone of any race was meant to experience. But you don’t have to understand the bursts of ecstasy you experience. You don’t have to react. All you have to do is sit in Dane’s lap, well and truly fucked, cooing out noises of approval while he does whatever he wants to you.");
			output("\n\nYou’re pretty sure he’s going to make you cum.");
		}
		//Titty milking
		else if(pc.canLactate())
		{
			output("\n\nYou arch your back to better present your milktanks, and just in time too! Dane grabs your [pc.nipplesNoun] as the first [pc.milkVisc] droplet emerges. Though you can’t see it, you can feel his grin weighing on you from behind every bit as firmly as his corded pecs. Rough, near-painful tugs goad your [pc.milkNoun] into letting down, at first in steady dribbles, then in higher-pressure sprays as he the ausar settles into an easy rhythm. He milks you like a cow" + (pc.isTreated() ? ", groaning when his business-like tit-massage earns him a rewarding squeeze from your twat.\n\nYou moo, which clearly convinces Dane to milk you even more thoroughly. He yanks hard on your [pc.nipples], and you nearly cry out from the mix of pain, pleasure, and relief. The feeling of it steals what little strength is left in your [pc.legOrLegs]. You’re a [pc.milkNoun]-spraying puppet for the four-armed ausar, mostly unaware that you’re mooing louder and longer by the minute":"") + ".");
		}
		//Mega titty groping - added on to big titty gropes. Actually lowest priority behind fingering/milk/etc
		else if(pc.biggestTitSize() >= 40)
		{
			output("\n\nDane seems amazed by the sheer amount of breastflesh you’ve given him to play with. Not even nipples can hold his attention with such a buffet of boob on display. His hands roam across your expansive bosom in apparent wonder, stopping here or there for an awed grope or squeeze. His hands aren’t big enough to take a true measure of their heft, so the dog-eared albino is forced to satisfy himself by worshipping them piecemeal. It’s cute, how he tries to keep up with tits like these... right up until he lifts one up so he can lick your [pc.nipple] from over your shoulder. That nearly propels you into orgasm all on its own.");
			output("\n\nNearly.");
		}
	}
	//Bouncing dicksquelching love
	output("\n\nThe booth bounces. No, wait. <i>You</i> bounce. The change was too rapid for your sex-addled mind to grasp at first, but now that Dane has given your [pc.vaginaNoun " + x + "] time to adjust to his presence, he has begun to fuck it in earnest. With his hands still on your [pc.chest], he bounces you in his lap with almost casual ease. ");
	if(pc.libido() < 33) output("You might not be the kind of full-blown slut that rides dicks like strippers ride poles, but even you find yourself flexing your thighs to assist in your rhythmic violation.");
	else if(pc.libido() < 66) output("You find yourself going along for the ride with the instinctive support of your thighs, gyrating your [pc.hips] to vary how you squeeze and delight you both.");
	else output("You gyrate in carnal delight, working your [pc.hips] in wide figure eights designed to stimulate his pole from all sides. Dane may be fucking you, but you’re going to make the most of it for the both of you. You’re going to clutch his cock with such loving adoration that he’ll be having wet-dreams of about your pussy for the rest of the week.");
	output("\n\n<i>“Atta [pc.boyGirl],”</i> Dane murmurs, licking the sweat from your neck. His breath falls on your [pc.skinFurScales] as ruinously hot puffs of steam. <i>“Don’t be afraid to moan now.”</i>");
	//Bimbo
	if(pc.isBimbo()) output("\n\nYou moan on the spot, openly and happily, pitching your voice upward into a squeal as you bottom out on the ausar’s enormous, cunt-wrecking cock. <i>“Ohhh yes, Daney-baby!”</i> You cover up the sound of his hips crashing into your crotch with joyous exultations. His every twat-creaming thrust makes you wetter and your voice higher. You’re not just his cock-sock! You’re his little songbird too, wailing out your pleasure for the entire casino to hear. The way his dick swells when you chirp out more wordless pleasure leaves you a molten, gooey mess - but a vocal one.");
	//Bro
	else if(pc.isAmazon() || pc.isBro())
	{
		output("\n\nYou grunt back, <i>“Then you’d better fuck harder,”</i> with a wry smile of your own.");
		output("\n\nDane takes up your challenge with gusto. Shifting his grip, he begins to truly jackhammer at your [pc.vagina " + x + "], not just bouncing you in his lap any longer. He lifts you up, holding you in the air so that his cock can be a slick, soaked blur between your thighs, plowing your quim so firmly that the liquid squelching is doubtless audible beyond the confines of the booth. Your head spins as a dopey smile spreads across your [pc.lips].");
		output("\n\nIt does not take much of that treatment to make you moan and shake, but now that Dane has begun to rut you so, he shows no signs of stopping. You ragdoll, unable to contribute in any meaningful way to the fuck any longer. You bounce and squelch and dribble and squeal like the slut that he’s treating you as, and beneath it all is the quiet knowledge that it was your words that coaxed him into fucking you so pleasantly.");
	}
	//Exhib >= 66
	else if(pc.exhibitionism() >= 66)
	{
		output("\n\nAs if you needed his permission to let everyone in the immediate vicinity know that you’re getting the dicking of a lifetime! You do as you are bid, not only because he asked so nicely but because you want to. You moan loud and throatily, sure it’ll carry through the walls and into the casino proper. You punctuate every thrust with a rapturous cry. When Dane’s fingers on your [pc.chest] rub you the right way, you announce your approval with a chirpy squeak of delight. And you just know that somewhere outside the walls, there are pirates listening in, hearing you lose your mind for this big, knot-equipped horse-cock and loving it. Part of you wants to throw open the door so they can see, but Dane’s fucking you far too hard for you to concern yourself with anything but the rising crest of pleasure he’s pounding into your twat.");
	}
	//Else
	else
	{
		output("\n\nYou haven’t exactly been quiet through this experience, but you doubt you could stay quiet if you wanted to. Dane’s handling of your body wracks you with paroxysms of pleasure no matter which part of you he’s touching, and his dick is pretty much <i>always</i> touching your inner channel, bashing into sensitive nerve clusters with sufficient rapidity to make you screech and moan. A hint of shame surfaces at the back of your mind when you think of how the other patrons might be able to hear you beyond the booth’s walls, but Dane’s fucking you far too hard for you to concern yourself with anything beyond the crests of pleasure he pounds into your twat.");
	}
	//PC cums first
	output("\n\nOrgasm grabs your [pc.vaginas] and squeezes" + (pc.hasVaginas() ? " one":"") + " down on Dane’s cock in a moment of instinctual passion. You ragdoll, safe and secure in the ausar’s hands. He keeps his firm grip on you as he continues to pound away, your " + (pc.wetness(x) < 4 ? "increasingly sodden cunt fluttering in the throes of pure pleasure. Dribbles of your [pc.girlCum] slide down the curvature of his slowly tightening sack, but he doesn’t cum just yet.":"juicing slut-cunt exploding with liquid relief, spraying cascades of [pc.girlCum] down Dane’s tightening balls and thighs. Inside, you’re fluttering in mad pleasure, but outside there is only the stuttering bursts of fragrant delight."));
	var cumQ:Number = 0;
	//Dicks paint a wall
	if(pc.hasCock())
	{
		cumQ = pc.cumQ();
		output("\n\nYour long-neglected [pc.cocks] go" + (!pc.hasCocks() ? "es":"") + " off with " + (!pc.hasCocks() ? "its":"their") + " sister" + (pc.hasVaginas() ? "s":"") + ", spraying ropes of [pc.cum] at the door.");
		if(cumQ < 500) output(" Thick ribbons of the stuff emerge in rapid succession, forming into a slowly spreading heap of wasted jism on the floor.");
		else if(cumQ < 5000) output(" Huge deluges of the stuff emerge in urethra-straining loads, splattering into a wide, growing pool of wasted jism on the floor.");
		else output(" Those enormous discharges slap into the door with hinge-rattling force, waterfalling down the inside edge to join the slowly growing lake around Dane’s ankles. If he cares, he shows no sign of it, simply letting you waste every ounce your jism on the floor.");
		output(" You look down at the last second, blissed out and gleeful, watching your [pc.cocks] bob and twitch out the last few [pc.cumGem] dribbles.");
	}
	//Merge
	output("\n\nThe scent of your climax must please your ausar lover, because you can feel his nose wrinkle and his breath grow heavier. He pants, still fucking you, slapping his heavy nuts against your slit with authoritative force. Leaning you back" + ((!pc.isBro() && !pc.isAmazon()) ? " and rising up":"") + ", he drives his knot into your [pc.vagina " + x + "] with every ounce of his strength. It pops inside, seating itself just as your orgasm had begun to fade, a channel-straining reminder that ausar hasn’t actually cum quite yet - but he’s about to.");
	output("\n\nDane licks you, dragging his knotted dick back and forth as quickly as his hips will let him. His grunts shift slightly upward in pitch, and his fingers clutch your " + (pc.biggestTitSize() >= 4 && pc.hasDickNipples() ? "[pc.dickNipples]":"[pc.nipples]") + " harder, digging in as his knot balloons further. You feel like your [pc.hips] are creaking with how wide he spreads you, but the resulting splash of cervix-kissing warmth soothes any discomfort to enjoyable levels. Dane growls louder. It’s an almost feral sound. A howl wouldn’t be out of the question, but his vocals grow no longer. He grunts like a beast as he unloads " + (!pc.isPregnant(x) ? "into your womb":"into your cunt") + ". The size of his big, equine dick ensures that every droplet is delivered to the deepest parts of you while the flaring head does what it can to keep it stopped up there.");
	output("\n\nThe few dribbles that leak past there have no hope of escaping the cunt-straining girth of his knot. Salty seed sloshes around inside you while Dane squirms. His balls quiver, and you slackly accept every ounce of their offering. It feels sort of like he’s stoking a fire in your belly. Successive, pussy-distending ejaculations fill you fuller and further - and more and more aware of just how warm his canine semen is.");
	output("\n\nIf this is how Dane fucks, he must be leaving quite a trail of bastards across the galaxy. You cradle your middle, feeling it bulge slightly as Dane finishes flexing and sags back down to seated position, breathing heavily.");
	output("\n\nThe mercenary doesn’t seem interested in cuddling, however. He scoots forward to the edge of his seat and gently pushes you down to the floor. Still joined to his crotch by the anchor of his knot, your [pc.butt] is lifted up into the air. You pant for breath");
	if(pc.hasCock() && cumQ >= 500) output(" just above the pool of your own cum" + (pc.biggestTitSize() >= 10 ? ", dragging your [pc.nipples] through it":"") + ". Dane slaps one cheek in apparent approval.");
	else output(".");
	output("\n\n<i>“Now you look like a proper, bred bitch.”</i> His fingers rove higher, sliding across sweat-slickened [pc.skinFurScales] to trace the curvature of your spine. His other hands join it soon after, caressing and squeezing you as you’re trapped " + (pc.legCount == 2 ? "on all fours":"in post-coital doggie-style") + ". <i>“Lower.”</i> He pushes down on your neck but holds your hips where they are, and deep inside yourself, you can feel the accumulated spunk puddling against your cervix" + (!pc.isPregnant(x) ? ", forcing egg-seeking missiles through in dribs and drabs":"") + ". Your cheek ");
	if(pc.hasCock() && cumQ >= 500) output("smears through your [pc.cumNoun].");
	else output("rubs on the ground.");
	output("\n\n<i>“Just like that. Now tell me how much you love being my cumrag.”</i> From seemingly nowhere, a finger appears against the side of your clitoral hood.");

	output("\n\n<i>“");
	if(flags["DANE_VAGFUCKS"] != undefined && flags["DANE_VAGFUCKS"] >= 4) output("I fucking love it!”</i> you scream. <i>“I love the feel of your spunk inside me, and how you hold me down to make sure it all flows into my womb. I can barely think it feels so good!”</i> True to your words, you squirm around while still embedded on his big, drooling dick. <i>“Fuck me " + (pc.isPregnant() ? "even pregnanter!":"pregnant!") + "”</i>");
	else if(flags["DANE_VAGFUCKS"] != undefined && flags["DANE_VAGFUCKS"] >= 1) output("It’s so fucking good,”</i> you whine, briefly trying to lift yourself up to look at him before accepting the inevitability of your position. <i>“You fill me so full, and there’s so much cum trapped inside.”</i> Blushing, you add, <i>“I’d probably be down for a second round the moment your balls filled back up.”</i>");
	else output("I... uh... umm. Who am I kidding, it’s fucking great!”</i> you babble. <i>“Are you always like this?”</i> You vainly try to lift yourself up to look at him, but he holds you in place that much firmer, his pressure only making you more aware of how <i>taut</i> you are around his cock. <i>“Mmm, I guess that does make me your cum-rag, doesn’t it?”</i> You wiggle against him. <i>“I almost wish that knot wouldn’t go down.”</i>");
	output("\n\nThe ausar’s fingers tease your clit in slow circles, speading up the sluttier your speech becomes. Soon, you’re babbling about how he can nut in every hole you have as much as he wants, barely listening to his whispered <i>‘Good [pc.boyGirl].’</i> Time seems a blur of post-orgasmic pleasure and warm, comforting decadance that only comes to end when your [pc.vagina " + x + "] abruptly pops free from Dane’s softening knot, leaking a trickle of white across your [pc.belly].");
	output("\n\n<i>“Thanks for the fuck, [pc.name],”</i> Dane says, stepping past you to open the door. <i>“I’ll be at the bar when you’re ready for " + (flags["DANE_VAGFUCKS"] == undefined ? "round two":"another round. Don’t keep me waiting") + ".”</i> He steps out, and the door swings closed.");
	output("\n\nYou’re still on the floor with your ass in the air, only now beginning to leak the ausar’s cooling jism.");
	output("\n\nGathering your possessions and your recovering your full faculties takes a minute.");
	processTime(45);
	pc.orgasm();
	pc.loadInCunt(chars["DANE"],x);

	IncrementFlag("DANE_VAGFUCKS");
	IncrementFlag("DANE_SEXED");
	//If PC got milking scene, empty tits
	if(pc.biggestTitSize() >= 4 && !pc.hasDickNipples() && !pc.hasFuckableNipples() && pc.canLactate()) pc.milked();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Outline
//Dane guides TaurPC into a booth for a fuck. It's cramped, and he has to push you roughly up against a wall to make room. Rough, hot, and sweaty mating ensues. Two intros; one is the default, the other accommodates for the PC asking for a repeat of their own accord later.
//18" knotted horsecock

//Taurfuck
//Intro
public function daneTaurfukky(volunteered:Boolean = false):void
{
	clearOutput();
	showDane(true);
	author("Wsan");
	//Pick a hole at random. Sometimes, buttfucks. More often vag if vag.
	var x:int = -1;
	if(pc.hasVagina() && rand(3) > 0) 
	{
		x = pc.findEmptyPregnancySlot(1);
		if(x == -1) x = rand(pc.totalVaginas());
	}
	if(!volunteered) 
	{
		output("Dane pushes and gropes you from behind as you enter the booth, his ");
		if(pc.balls > 1) output("fingers lightly wrapping around your [pc.balls] and giving them a gentle squeeze that makes you gasp in delight.");
		else if(x >= 0) output("thick fingers brushing up your winking, " + (pc.wetness(x) < 4 ? "dripping":"streaming") + " pussy and making you gasp in delight.");
		else output("hand squeezing your hindquarters hard enough to make you gasp in delight at such possessiveness.");
		output(" It’s like he thinks he owns you, and the thought of it");
		if(pc.isHerm()) output("brings both your [pc.cocks] to full hardness and your [pc.pussies] to an anticipatory tightness you hadn’t thought possible.");
		else if(pc.hasCock()) output(" brings your [pc.cocks] to full hardness with stunning rapidity.");
		else if(pc.hasVagina()) output(" has your [pc.pussies] quivering in anticipation.");
		else output("makes your [pc.asshole] clench in anticipation.");
		output(" You want this. Wild, unbidden thoughts of the powerful ausar riding you, mounting you with that immense cock like it was <i>meant</i> to be, run through your mind as you glance back at him.");

		if(x >= 0)
		{
			output("\n\n<i>“Very nice,”</i> Dane murmurs admiringly, his fingers tracing" + (pc.hasVaginas() ? " the inflamed lips of one of your pussies. You shudder in pleasure - seems like he’s picked out which one to use for himself.":" your inflamed pussylips."));
			if(pc.looseness(x) < 2) output(" <i>“Looks tight as fuck, just how I like them. Been keeping yourself just for me this whole time, [pc.name]?”</i>");
			else if(pc.looseness(x) < 4) output(" <i>“Looks tight enough to have your entire body wrapped around me, [pc.name]. I like it.”</i>");
			else output(" <i>“I bet you’ve learned a lot about pleasing cocks since we first met, [pc.name]. I’m gonna enjoy this.”</i>");
		}
		else if(pc.hasCock())
		{
			output("\n\n");
			if(pc.ass.looseness() < 2) output("<i>“Looks tight as a motherfucker,”</i>");
			else if(pc.ass.looseness() < 4) output("<i>“Looks tight enough that I’m gonna have to do some work,”</i>");
			else output("<i>“This is a whore’s hole,”</i>");
			output(" Dane murmurs admiringly, his fingers tracing the outline of your asshole.");
			//no anusoft:
			if(pc.analPuffiness() == 0) output(" <i>“Gonna enjoy making it gape for me, [pc.name].”</i>");
			//slight pump: 
			else if(pc.analPuffiness() == 1) output(" <i>“Nice and puffy, too. You put a lot of thought into who’d be fucking your ass, huh? I appreciate the effort, [pc.name].”</i>");
			//pumped
			else if(pc.analPuffiness() == 2) output(" <i>“Puffy as fuck, too, you taurslut. Not hard to imagine what was going through your mind at the time, [pc.name]...”</i>");
			else output(" <i>“So pumped and puffy, too, [pc.name]. You like winking at all the boys until they grab your rear and pound you?”</i>");
		}
		else
		{
			output("\n\n<i>“Ha, no genitals, [pc.name]? That’s really cute,”</i> Dane murmurs admiringly. <i>“You usually only see that on the most <b>depraved</b> of sluts out here, the ones that know their true self-worth. That know their own pleasure is meaningless, and their owner is the only one who matters. Hell of a way of ingratiating yourself to me. But I like it.”</i>");
		}
		output("\n\n<i>“Now then,”</i> he growls in a low voice, his lower pair of arms grabbing your hindlegs and the upper your [pc.ass]. <i>“This booth is fucking cramped with the both of us in here.”</i> He’s right - it clearly wasn’t built with a coupling between an eight foot, quad-armed ausar and a ‘taur in mind. You’re already beginning to sweat in the enclosed space, your [pc.skinFurScales] damp with it. <i>“So let’s get inventive.”</i>");
	}
	else
	{
		if(pc.isBimbo()) 
		{
			output("<i>“That time you like, fucked me almost unconscious was totes hot as fuck,”</i> you say, curling your [pc.tongue] and grinning at Dane as you lean in closer. <i>“Can you take your lil’ cumdump ‘taur for another ride? Pretty please?”</i>");
			output("\n\n<i>“Yeah, just for you, y’dumb slut,”</i> Dane grunts, rolling his eyes and nodding at a booth. <i>“Get in there and spread your legs.”</i>");
			output("\n\nYou practically skip into the privacy of the booth, joyously laying your front against the wall, your [pc.nipples] hard already. Dane’s going to fuck you! That big, tasty, <i>bulging</i> horsecock and the fat, swollen knot too... you can hardly wait! By the time he steps inside the booth himself, his hands on your [pc.ass], ");
			if(pc.isHerm()) output("both your [pc.cocks] and your [pc.pussies] are dripping with anticipation.");
			else if(pc.hasCock()) output("your [pc.cocks] " + (!pc.hasCocks() ? "is":"are") + " already hard and dripping with anticipation.");
			else if(pc.hasVagina()) output("your [pc.pussies] " + (!pc.hasVaginas() ? "is":"are") + " already dripping with anticipation, gleaming and winking at him.");
			else output("your [pc.asshole] is relaxed and winking at him, ready to get fucked.");
		}
		else
		{
			output("<i>“So, I might have <b>really</b> enjoyed you using me as your cumdump...”</i> you whisper to him, hand running up his bicep and stroking his upper arm. <i>“Any chance you’d like to take a booth and do that again?”</i>");
			output("\n\n<i>“Get in there, you leggy cumrag,”</i> Dane grunts, nodding at a booth.");
			output("\n\nYou happily sashay into the privacy of the booth, carefully laying your front against the wall, your [pc.nipples] already hardening. You can hardly wait to feel that thick, strong horsecock widening your fuckhole once more, pounding you like nothing else, and finishing you off with the enormous knot at its base. By the time he steps inside the booth himself, laying his hands on your [pc.ass], ");
			
			if(pc.isHerm()) output("both your [pc.cocks] and your [pc.pussies] are dripping with anticipation.");
			else if(pc.hasCock()) output("your [pc.cocks] " + (!pc.hasCocks() ? "is":"are") + " already hard and dripping with anticipation.");
			else if(pc.hasVagina()) output("your [pc.pussies] " + (!pc.hasVaginas() ? "is":"are") + " already dripping with anticipation, gleaming and winking at him.");
			else output("your [pc.asshole] is relaxed and winking at him, ready to get fucked.");
		}
	}
	//merge
	output("\n\nHe lifts your rear [pc.legsNoun] and pushes you roughly up against the wall, a squeak escaping your lungs as he drives himself forward and savagely shoves his swollen dick into your " + (x >= 0 ? "slavering cunt.":"squeezing asshole.") + " You scream in both surprise and bliss, <i>oh</i> so much bliss, taken from behind and roughly dominated. One of your rear legs held apart for easy access, the other three manhandle you until you don’t know which way is up and soon find you don’t even care - Dane could fuck you upside down if he wanted as long as he never stopped!");
	output("\n\nIt’s rare enough that someone can " + (x >= 0 ? "bottom out in your rear-mounted pussy’s canal":"grant your tauric behind the sensation of fullness") + " but Dane fits into you so beautifully you can hardly resist a short, shuddering sigh of complete carnal satisfaction. It’s like his giant cock was made for your " + (x >= 0 ? "squelching, dripping pussy":"tight, clenching asshole") + ", sliding in with every rapid thrust of his hips. No, that’s not right - <i>your [pc.vagOrAss] was made to sheathe his cock</i>. That feels far better to think.");

	if(x >= 0) pc.cuntChange(x,daneCockVolume());
	else pc.buttChange(daneCockVolume());

	output("\n\n<i>“You’re loving this, aren’t you, whore?”</i> Dane grunts, squeezing your ");
	if(pc.hasFur()) output("furred ");
	else output("scaled ");
	output("flanks as he drives himself balls-deep. You let loose a scream of primal ecstasy by way of reply, a high-pitched moan following his withdrawal. Your usually-steady body is buffeted by his reinsertion, ass bouncing as his swollen nuts slap you hard between your legs. <i>“Tell me.”</i>");
	output("\n\n<i>“It f- fuh! It feels- so good!”</i> you gasp, panting and moaning, your eyes squeezed shut in mounting bliss. You can feel your control over your body slipping further away with every thrust but it doesn’t matter, Dane is too strong to let you fall, and his stupendous cock is pumping your " + (x >= 0 ? "taurpussy":"stretched-out ring") + " so hard you couldn’t save yourself anyway. <i>“Oh, g-god! Stars! S-so hard!”</i>");
	output("\n\n<i>“That’s right,”</i> Dane growls, pushing into you so deeply your eyes roll back in your head and your [pc.tongue] lolls from your lips. " + (flags["DANE_TAURFUKKS"] == undefined ? "You hadn’t even known how sensitive you were from that angle!":"Every time he pushes from that angle your entire body shivers and convulses!") + " <i>“Good little cumdump!”</i>");
	output("\n\nBeing a taur it’s not often that you get called ‘little’ but fuck if it doesn’t feel right coming from Dane. That massive chiselled ausar body and the tremendous cock pumping into your " + (x >= 0 ? "spread-open slit":"lubed-up asshole") + " make you feel <i>right</i> where you belong. He’s barely finished his sentence before");
	if(pc.isHerm() && x >= 0)
	{
		output(" your " + (!pc.hasCocks() ? "cock is":"cocks are") + " throbbing with need, pre-cum dripping and spurting from " + (!pc.hasCocks() ? "its tip":"their tips") + ". Not even a second goes by before you let out a massive groan and [pc.cum] jets out, splattering loudly against the ground and running down the drain while Dane continues to plow your sloppy pussy like a madman.");
		output("\n\nHe’s stimulating your convulsing walls so violently you can’t seem to escape orgasm - crying out like the most depraved of whores, you empty your" + (pc.balls > 0 ? " [pc.balls]":"self") + " into the gurgling floordrains over and over while Dane grunts and growls, slamming you full of enormous equine cock. [pc.CumVisc] semen shoots from the end of your pulsing cock" + (pc.hasCocks() ? "s":"") + " until there’s nothing left to give, your slutty pussy clenching around him every time your aggressive ausar lover bottoms out inside you.");
	}
	else if(pc.hasCock()) 
	{
		output(" your " + (!pc.hasCocks() ? "cock is":"cocks are") + " throbbing with need, precum dripping and spurting from " + (!pc.hasCocks() ? "its tip":"their tips") + ". Not even a second goes by before you let out a massive groan and [pc.cum] jets out, splattering loudly against the ground and running down the drain while Dane continues to steadily plow you to bits.");
		output("\n\nHe’s stimulating your prostate so violently you can’t seem to escape orgasm - crying out like the most depraved of whores, you empty your");
		if(pc.balls > 0) output("[pc.balls]");
		else output("self");
		output(" into the gurgling floordrains over and over while Dane grunts and growls, slamming you full of enormous equine cock. [pc.CumVisc] semen shoots from the end of your pulsing cock" + (pc.hasCocks() ? "s":"") + " until there’s nothing left to give, your [pc.cockHeadBiggest] still throbbing with pleasure every time your aggressive ausar lover bottoms out inside you.");
	}
	else if(x >= 0)
	{
		output(" you cum so hard your eyes cross, a deep, desperate groan emanating from your throat while [pc.girlCum] " + (pc.isSquirter() ? "squirts":"drips") + " down your shaking hindlegs. Dane doesn’t let up at all, slamming into your convulsing cunt and driving your voice an octave higher with every thrust until you’re screaming so loudly you’re sure everyone on the ");
		//Nonfollower:
		if(!daneIsCrew()) output("base");
		else output("ship");
		output(" can hear how hard you’re getting fucked. Drool runs from the corner of your mouth while you orgasm your brains out, shaking and shuddering.");
		output("\n\nHe’s stimulating your oversensitive pussy so violently you can’t seem to escape cumming - crying out like the most depraved of whores, you clench up and clamp down on Dane while he grunts and growls, slamming you full of enormous equine cock. You can hardly believe how <i>wild</i> he is with you, rutting you with the intensity of a stallion and the stamina of a god. The sheer ecstasy coursing through your body tells you to stay, to be good, and to let him fuck you however he wants. You’re only too happy to sluttily comply.");
	}
	else
	{
		output(" you cum so hard your eyes cross, a deep, desperate groan emanating from your throat while your hindlegs violently shake. Dane doesn’t let up at all, slamming into your slippery ass and driving your voice an octave higher with every thrust until you’re screaming so loudly you’re sure everyone on the " + (!daneIsCrew() ? "base":"ship") + " can hear how hard you’re getting fucked. Drool runs from the corner of your mouth while you orgasm your brains out, shaking and shuddering.");
		output("\n\nHe’s stimulating your oversensitive insides so violently you can’t seem to escape cumming - crying out like the most depraved of whores, you clench up and clamp down on Dane while he grunts and growls, slamming you full of enormous equine cock. You can hardly believe how <i>wild</i> he is with you, rutting you with the intensity of a stallion and the stamina of a god. The sheer ecstasy coursing through your body tells you to stay, to be good, and to let him fuck you however he wants. You’re only too happy to sluttily comply.");
	}
	output("\n\nYou’re slammed into the wall again and again, your " + (pc.biggestTitSize() >= 1 ? "[pc.breasts] squished up":"cheek pressed") + " against it while you scream in lust, begging him to cum inside you. Instead he swats you across the ass hard, your forelegs crumpling while he grunts and holds your rear half in the air to fuck. You’re too busy marvelling at his strength to notice the way his giant cock is throbbing until you feel his growing knot pressing at your " + (x >= 0 ? "swollen pussylips.":"gaped fuckhole."));
	output("\n\n<i>“Knot me! Knot your slutty cumdump!”</i> you cry out, possessed by insatiable desire. You <i>need</i> that swollen, pulsing knot inside you, to feel him cum and cum and not let you go.");
	output("\n\nDane obliges you in spades. Straining with the effort, veins stand out on his rippling biceps as he pulls you onto his engorged knot and roars in release. Your tightening orifice sucks and grasps at his pulsating cock, the gargantuan flare " + (x >= 0 ? "kissing your cervix":"deep in your bowels") + " as it flexes and unloads streams of thick, virile seed into your channel. You milk every last drop of him inside you, moaning like his slut all the while, and you love it.");
	output("\n\nThe throbbing of his knot gives you one orgasm after another, stretching and stroking your insides until you’re soaked in sweat and gasping in bliss. By the time he’s done and gives you a hard spank across your [pc.ass] you’re almost delirious with the pleasure.");
	output("\n\n<i>“Nice, [pc.name],”</i> he grunts, dropping you to the ground. <i>“As far as using a cumrag goes, you make it pretty easy. All the extra weight makes it simpler to keep you in place. See me again if you want to get taken for another ride.”</i>");
	output("\n\nHe steps out of the booth and leaves you there, cum pouring from your abused " + (x >= 0 ? "cunt":"asshole") + ", running down your shaking hindlegs" + (pc.balls > 0 ? " and dripping from your balls":"") + ". It takes you a good while to shakily get back to your feet, using the wall to steady yourself. That was fucking <i>amazing</i>... you’ll have to see about getting another round of that. Cleaning yourself off, you step out of the booth.");
	processTime(30);
	IncrementFlag("DANE_TAURFUKKS");
	IncrementFlag("DANE_SEXED");
	if(x >= 0) pc.loadInCunt(chars["DANE"], x);
	else pc.loadInAss(chars["DANE"]);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
