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

//Placeholder func. Move to ardia when she's in.
public function ardiaIsCrew():Boolean { return false; }

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
	//9999
}

/*
output("\n\n[UNF] Harem");
output("\n\n//DANE HAD A HAREM - Had two half-sisters and a real subby rahn. Skipped town with some kaithrit musician named <i>“Astrokat”</i> or some shit.");
output("\n\n//Got fucked:");
output("\n\n<i>“So where’s that harem you mentioned?”</i>");
output("\n\n//Else");
output("\n\n<i>“You had a harem?”</i>");
output("\n\n//Merge");

output("\n\n[UNF] His Start");
output("\n\n8:39 PM] Slab Bulkhead: Dane’s past and how he got into the merc business could be interesting.");
output("\n\n[UNF] Give Shockblade");
output("\n\n8:39 PM] Lestia Urufuhando: You could add an option to give him back his shockblade as a peace offering, if he doesn’t start on a friendly term by that point in the story");
*/

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
		addButton(0,"Next",suckDaneOffYaWanker);
	}
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
	else if(siegwulfeIsDom()) output(", besides " + (pc.isBimbo() ? "my big titty robot mistress":"[siegfloof.name]"));
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
	IncrementFlag("DANE_SEXED");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
