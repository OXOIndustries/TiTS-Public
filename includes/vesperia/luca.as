//Luca the VR lounge owner on Canadia
//RequiemForAMeme
/*Notes

Luca is a heavily modded Dzaan with some psionics, but we’ll get to that much later.
I want to establish the store first. Then work on her.
Hopes and dreams for later:
She has an extreme oral fetish and will have several scenes reflecting it.
Lots of face fucking.
Addiction and Submission towards her, probably make a bad end.
PC Perks.

Outline

Layout: Two tiles
First tile will be the main the lounge where Luca works.
Second tile will be Luca’s room which will be locked for now.
Options while in the store: Appearance. Talk. Business.
Talk: Store, Sign, Race
Business: Buy, VR Simulator
*/

//Encountering Luca
//Encounter when: Store is open all day
//Encounter where: New Canadia, a tile along Access Corridor Beta

public function showLuca(nude:Boolean = false):void
{
	showName("\nLUCA");
	var nudeS:String = "";
	if(nude) nudeS = "_NUDE";
	showBust("LUCA" + nudeS);
}

public function lucaVRsTried():int
{
	var total:int = 0;
	if (flags["VR_PIRATEQUEEN"] != undefined) total++;
	if (flags["VR_AMAZONIA"] != undefined) total++;
	return total;
}

//PC Finds Store
// PC is in Access Corridor Beta.

//Entering The Lotus Eater
public function lotusEaterBonus():void
{
	author("RequiemForAMeme");
	// PC enters
	output("The Lotus Eater feels more like a gaming lounge than a store. Chairs, couches, and recliners are spread throughout the place, most of which are filled with patrons wearing what appears to be VR equipment. There are booths that line the walls from front to back and nearly all of them are brimming with groups of people staring up at monitors. Said monitors appear to be displaying the rather sexually explicit simulations other patrons are having. The place is humming with dozens of small floating robotic drones in mini-tuxedos and mini-dresses flying around tending to the patrons. It is nicely warm and a heavy flowery aroma permeates the lounge. In the back you see a wooden counter with a few hardlight projected displays on top of it.");
	// First time.
	if(flags["MET_LUCA"] == undefined) 
	{
		output("\n\nA tall humanoid woman stands behind the counter, wearing an extravagant dress with a constantly changing pattern of stars and planets. A drone flies in front of you and informs you that all the booths are currently occupied. However if you wish to speak with the store owner you can.");
		addButton(0,"Owner",approachLuca);
	}
	// Repeat
	else 
	{
		output("\n\nLuca is standing behind the counter, wearing her extravagant dress. When she notices you she waves you over and gives you a welcoming smile.");
		addButton(0,"Luca",approachLuca);
	}
}

//Introduction
public function approachLuca(back:Boolean = false):void
{
	clearOutput();
	showLuca();
	author("RequiemForAMeme");

	var lucamission:int = lucaSubmission();

	if(back)
	{
		output("Is there something else you’d rather ask of Luca?");
		lucaMenu();
		return;
	}
	//First Time
	else if(flags["MET_LUCA"] == undefined)
	{
		output("As you walk towards the alien woman you see that the monitors have numbers at the bottom of them. At first glance, they seem to be prices and names. For a moment you think this place may be a gambling den. She stares at you with glistening emerald eyes before speaking. <i>“Welcome to The Lotus Eater.”</i> The alien woman greets you. Her voice is lower than you would have guessed. <i>“Call me Luca.”</i>");
		output("\n\n <i>“My name is [pc.name], [pc.name] Steele.");
		if(pc.isNice() || pc.isMischievous()) output(" It is a pleasure to meet you Luca.");
		output("”</i>");
		output("\n\n<i>“Wonderful. Normally you would be taken to a booth and one of my little helpers would tend to you, but all the booths are full. Instead I would be happy to answer any questions and take care of any needs you might have.”</i>");
		output("\n\nThat sounds reasonable. You ask her about her establishment.");
		output("\n\n<i>“My virtual reality simulations are my main attraction. The price is 500 credits across the board. You can choose private or public viewing. I also have some ‘energy’ supplements for sale.”</i>");
		flags["MET_LUCA"] = 1;
	}
	//Repeat
	else if (lucamission < 25)
	{
		output("Luca holds a warm smile as she waits for you to cross her establishment. You wonder for a moment how she keeps up with so many patrons. When you reach the counter she greets you immediately. <i>“Welcome back " + pc.mf("Mister","Miss") + " Steele, what fantasy can I interest you in today?”</i>");
	}
	else if (lucamission < 50)
	{
		output("Luca holds a warm smile as she waits for you to cross her establishment. Looking around, she’s just as busy as usual. When you reach the counter she greets you immediately. <i>“Welcome back, [pc.name]. What fantasy can I interest you in today?”</i>");
	}
	else if (lucamission < 75)
	{
		output("Luca’s face lights up as she waits for you to cross her establishment. Looking around, you see a few other regulars who give you a friendly wave. When you reach the counter, she greets you with a wide grin. <i>“Welcome back, [pc.name]. What fantasy can I interest you in today?”</i>");
	}
	else if (lucamission >= 80 && rand(5) == 0 && flags["LUCA_SWITCHED"] == undefined)
	{
		clearMenu();
		processTime(4);
		output("<i>“[pc.name]! I was just thinking about you,”</i> Luca says. <i>“I have an idea I want to run by you.”</i>");
		output("\n\n<i>“Yes Mistress?”</i>");
		output("\n\n<i>“I know you’re- no that’s not right.”</i> Luca looks away, trying to reorganize her thoughts. <i>“I think that we’ve- no that’s still not right. Ugh.”</i>");
		output("\n\n<i>“Mistress?”</i> you ask with confusion.");
		output("\n\nLuca looks at you and takes a deep breath. <i>“I love being a dom, [pc.name]. I love being in control and having you submit to me...”</i> She looks away again with embarrassment, her eyes cast down at the floor. <i>“And recently I’ve been thinking that it would feel pretty great if we tried switching roles.”</i>");
		output("\n\n<i>“Are you asking me to be on top?”</i>");
		output("\n\n<i>“Yeah. But not all the time.”</i> She turns her gaze back to you in a slight panic. <i>“Just every so often... I really like you, [pc.name], and I want to try something different with you. As long as you’re alright with it that is. If you want to try it, just let me know.”</i>");
		flags["LUCA_SWITCHED"] = 0;
		flags["LUCA_LAST_VISITED"] = GetGameTimestamp();
		addButton(0, "Next", approachLuca, true);
		return;
	}
	else if (lucamission < 100)
	{
		output("Luca’s face can’t contain her excitement when she see you walk to her. You receive a few knowing catcalls as you make your way across her establishment. When you reach the counter, she greets you with a lovely smile. <i>“Seeing you might be the best part of my day, [pc.name],”</i> she tells you. <i>“What fantasy can I interest you in today?”</i>");
	}
	else if (rand(3) == 0 && flags["LUCA_SWITCHED"] > 0 && flags["LUCA_GENTLE"] == undefined && flags["LUCA_DENIED"] > 0 && flags["LUCA_FUCKTOYD"] > 0 && flags["LUCA_CUMDUMP"] > 0 && flags["LUCA_ANAL"] > 0 && flags["LUCA_PUBLIC_ORAL"] > 0)
	{
		clearMenu();
		processTime(4);
		output("<i>“[pc.name]. I need to talk with you,”</i> Luca orders.");
		output("\n\n<i>“What is it, Mistress?”</i>");
		output("\n\nLuca looks at you. She seems happier than usual. <i>“I love our relationship, [pc.name], but I want... something a bit more.”</i> She looks away briefly before returning your gaze with a bright smile. <i>“I’ve been thinking a lot lately, and I want to have sex with you.”</i>");
		output("\n\n<i>“" + (pc.isMisch() ? "My entire life is a lie. What have we been doing this entire time?" : "I’m confused.") + "”</i>");
		output("\n\n<i>“" + (pc.isMisch() ? "Ha, ha. Jokes aside, what" : "What") + " I mean is we have different sex. No S and M. No toys. Just us. I want something else, something slow and gentle and passionate.”</i> She couldn’t hide her joy if she tried. <i>“I don’t know how else to say it... I want you, [pc.name]. I’ll understand if you don’t, but if you ever want to try something gentle just let me know.”</i>");
		flags["LUCA_GENTLE"] = 0;
		flags["LUCA_LAST_VISITED"] = GetGameTimestamp();
		addButton(0, "Next", approachLuca, true);
		return;
	}
	else
	{
		output("Luca’s face beams with joy as she watches you walk towards her. You receive a few knowing catcalls as you make your way across her establishment. When you reach the counter, she cups your cheek and gazes into your [pc.eyes]. <i>“Welcome back, [pc.name],”</i> she tells you cheerfully. <i>“");
	
		var lucaDeltaT:Number = GetGameTimestamp() - flags["LUCA_LAST_VISITED"];
	
		if (flags["LUCA_LAST_VISITED"] == undefined) { /* nothing! */ }
		//PC hasn't visited for 21+ days:
		else if (lucaDeltaT > 20*24*60) output("I know you’re an adventurer, but I get worried when you’re gone for so long. Please tell me you’re being safe.”</i>\n\n<i>“I’m sorry I made you worry about me, mistress. I promise I’m being careful.”</i>\n\n<i>“That’s good to hear, [pc.name]. I’ll have you know I get a pit in my stomach each time I watch you leave. I hate it. And I’m happy to see you again,");
		//PC hasn't visited for 11-20 days:
		else if (lucaDeltaT > 10*24*60) output("I missed you, you know. I get lonely when you don’t visit.”</i>\n\n<i>“I’m sorry mistress. I’ll try to visit more.”</i>\n\n<i>“You’d better visit me more, [pc.name]. No one makes me happier when I see them,");
		//PC hasn't visited for 11-20 days:
		else if (lucaDeltaT > 3*24*60) output("I missed you.”</i>\n\n<i>“I missed you too, mistress.”</i>\n\n<i>“It’s alright, [pc.name], and you’re here now, so I’m glad,");
		//PC hasn't visited for 11-20 days:
		else output("I was beginning to miss you.”</i>\n\n<i>“I’m sorry, mistress.”</i>\n\n<i>“It’s alright, [pc.name],");

		output("”</i> she says. <i>“Anyway what fantasy can I interest you in today?”</i>");
	}
	processTime(4);
	flags["LUCA_LAST_VISITED"] = GetGameTimestamp();
	lucaMenu();
}

public function lucaMenu():void
{
	clearMenu();
	addButton(0,"Appearance",lucaAppearance,undefined,"Appearance","What Luca looks like.");
	addButton(1,"Talk",lucaTalkChoices,undefined,"Talk","Talk with Luca about things.");
	addButton(2,"Business",lucaBusinessMenu,undefined,"Business","See what Luca has to offer.");
	lucaSexButton(3);
	addButton(14,"Leave",mainGameMenu);
	//[Appearance] [Talk] [Business] [Sex]
}

//Appearance
//Tooltip: What Luca looks like.
public function lucaAppearance():void
{
	clearOutput();
	showLuca();
	author("RequiemForAMeme");
	output("Luca is a six and a half foot tall modded");
	//if the PC hasn’t chosen to speak to her about her Race, or encountered a Dzaan before:
	if(!CodexManager.entryUnlocked("Dzaan")) output(" human?");
	else output(" Dzaan.");
	output(" She has enchanting emerald eyes. Bioluminescent hair that constantly shifts colors flows from her head in a thick braid ending below her hips. A set of crescent moon earrings adorn her elongated ears.");
	output("\n\nLuca’s perfectly feminine face displays her high cheekbones and a small button nose. Her lips are luscious, ample, and ever so slightly pursed. Her magenta colored skin looks smooth and polished like a doll. The only noticeable blemish, if you would call it that, of her otherwise perfect skin are the white freckles dotting her cheeks.");
	output("\n\nShe is wearing a dark blue and black dress with an ever changing pattern of stars and planets on it. The dress, though not skin tight, leaves little to the imagination of Luca’s curvaceous body. Her breasts, which could fill a E-cup bra, seem to support themselves.");
	output("\n\nDespite the distraction her ample breasts provide it is impossible to miss her other endowments. She displays a well defined hourglass figure with wide hips, voluptuous thighs, and a large round ass. Surprisingly, an inverted V cut in her dress puts her cock on clear display. It is darker in color than the rest of her skin and just an inch shy of being a foot long. It is nearly three inches wide, pushed forward by two large cum filled balls.");
	lucaMenu();
	addDisabledButton(0,"Appearance","Appearance","You’re already doing that.");
}

//Talk Options
//Tooltip: Talk with Luca about things.
public function lucaTalkChoices():void
{
	clearOutput();
	showLuca();
	author("RequiemForAMeme");
	output("What will you ask her about?");
	lucaTalkMenu();
}

public function lucaTalkMenu():void
{
	clearMenu();
	addButton(0,"Store",talkToLucaAboutHerStore,undefined,"Store","Ask Luca about her store.");
	addButton(1,"Sign",askLucaAboutHerSign,undefined,"Sign","Ask Luca about the hand written sign.");
	addButton(2,"Race",talkToLucasAboutRace,undefined,"Race","Ask Luca about her race.");
	lucasVRTalkButton(3);
	lucasJustTalkButton(4);
	addButton(14,"Back",approachLuca,true);
}

//Store
//Tooltip: Ask Luca about her store.
public function talkToLucaAboutHerStore():void
{
	clearOutput();
	showLuca();
	author("RequiemForAMeme");
	output("<i>“Not much to learn about it except a little history. I bought this place off a friend a couple years ago. She originally designed it like one of those night lounges in classic noir films. The kind where a private investigator interviews a widow whose husband died under mysterious circumstances; meanwhile a singer in a glittery dress sings softly in the background.”</i>");
	output("\n\nYou ask what happened to it.");
	output("\n\n<i>“Money happened. The idea itself brought customers, but it was just a novelty that lost value over time. Slowly she started losing credits faster than she could make them. I didn’t want to see my friend get trapped in debt, so I offered to buy the place from her. Aside from the ceiling I didn’t have to remodel all that much, so The Lotus Eater is almost the same as when I bought it.”</i>");
	output("\n\n<i>“Why a VR lounge?”</i> You ask her.");
	output("\n\n<i>“Well at first I was going to just let my friend keep her place running, but she was far too proud to let me do that. So I asked my friends and family what I should do and everyone told me to just make something I thought I would like. I like sex and classic terran films. So I started designing some VR equipment and explicit simulations. It all just evolved from there. Need anything else?”</i>");
	processTime(20);
	clearMenu();
	addButton(0,"Next",lucaTalkChoices);
}

//Sign
//Tooltip: Ask Luca about the hand written sign.
public function askLucaAboutHerSign():void
{
	clearOutput();
	showLuca();
	author("RequiemForAMeme");
	output("<i>“That’s out there because some people are fucking savages!”</i> Luca snaps at you.");
	output("\n\nYou reflexively move back.");
	output("\n\n<i>“I’m sorry. That was really unprofessional. I just get sensitive when my babies get mistreated. About once a week one of my drone helpers gets damaged by a rowdy patron; and it just feels like no matter what I do it keeps happening. It’s not a matter of money, it’s that I put time and effort into each of them and they need to be repaired because some asshole got ‘excited’, or ‘got up too fast’ or my personal favorite: ‘I’m sorry Luca, I didn’t see it beneath my fat fucking ass’.”</i>");
	output("\n\nSomeone sat on one of her drones?");
	output("\n\nLuca sighs exasperated. <i>“Yup. Tess is a regular though, so I couldn’t stay mad at her forever. She’s actually real sweet and keeps trying to pay me back for damaging it.”</i> She composes herself before continuing. <i>“Ever since I put the sign out people seem to have been more careful, which is nice. Can we talk about something else, please?”</i>");
	processTime(5);
	clearMenu();
	addButton(0,"Next",lucaTalkChoices);
}

//Race
// Tooltip: Ask Luca about her race.
public function talkToLucasAboutRace():void
{
	clearOutput();
	showLuca();
	author("RequiemForAMeme");
	output("<i>“I suppose that’s a fair question, given the amount of mod work I’ve had done.”</i> She slides her hands down her chest to her hips to illustrate. <i>“Most people assume I’m human with some sort of fantasy alien fetish, but I’m actually a Dzaan. We’re a race very similar to ");
	if(pc.humanScore() >= 4) output("yours");
	else output("humans");
	output(".”</i>");
	output("\n\nYou ask her what’s different.");
	output("\n\nLuca looks at you surprised. <i>“Our race is usually taller due to our spines... Umm, not gonna lie I was not expecting this line of questioning. We have Alphas and Betas which have different visual aspects, I guess?”</i>");
	output("\n\n<i>“You can take your time, I know it’s a strange question,”</i> you tell her.");
	output("\n\n<i>“You got that right. Everybody else is usually satisfied with just knowing what the name of my race is.”</i>");
	output("\n\n<i>“I’m not everybody else,”</i> you say.");
	output("\n\n<i>“Clearly...”</i> Luca pauses to think before continuing. <i>“Alphas, like myself, are hermaphrodites and Betas are fully female. There are far more Betas than Alphas, I’m not sure what the ratio is. Alpha’s were given the title because we tend to be more sexually dominant and have large harems filled with Betas. It’s easy for us Alpha’s, because our cum is chemically addictive.”</i>");
	output("\n\n<i>“Do you have a harem?”</i> you ask.");
	output("\n\n<i>“No, no, no. I uh... I don’t have a harem. I just, I just run this place. Speaking of which, can I interest you in a virtual fantasy?”</i>");
	processTime(8);
	
	CodexManager.unlockEntry("Dzaan");
	
	clearMenu();
	addButton(0,"Next",lucaTalkChoices);
}

//Business
// Tooltip: See what Luca has to offer.
// Buy: Luca sells a few items at retail price.
// VR Simulation: Luca allows people to experience a wide range of virtual fantasies.

public function lucaBusinessMenu():void
{
	clearOutput();
	showLuca();
	author("RequiemForAMeme");
	output("Which part of Luca’s business would you like to inquire about?");
	clearMenu();
	addButton(0,"Items",buyFromLuca,undefined,"Items","Luca sells a few items at retail price.");
	if(pc.credits >= 500) addButton(1,"VR Simulation",lucasVRSims,undefined,"VR Simulation","Luca allows people to experience a wide range of virtual fantasies.\n\n<b>Cost:</b> 500 credits");
	else addDisabledButton(1,"VR Simulation","VR Simulation","You cannot afford the 500 credits that this would cost.");
	if(flags["LUCAS_MINDWASH"] == -1) { /* Visor removed! */ }
	else if(flags["LUCAS_MINDWASH"] == undefined) addButton(2,"Broken Visor",mindwashBrokenVisor,undefined,"Broken Visor","One of the booths has an “Out of Order” sign over it. Damage from an overexcited guest, maybe?");
	else if(pc.credits >= 250) addButton(2,"Broken Visor",mindwashBrokenVisor,undefined,"Broken Visor","The damaged VR booth is still roped off, but you’re welcome to give it another try.\n\n<b>Cost:</b> 250 credits");
	else addDisabledButton(2,"Broken Visor","Broken Visor","Despite the heavy discount, you can’t use the weird, broken visor.");
	addButton(14,"Back",approachLuca,true);
}

//Buy
// Tooltip: Ask Luca if she has anything for sale.
// Doesn’t sell a lot, just some general items one would want here such as a Salty Jaw-Breaker or a Fizzy Fix. Maybe an energy drink?
public function buyFromLuca():void
{
	clearOutput();
	showLuca();
	chars["LUCA"].keeperBuy = "<i>“Can I see what you have for sale?”</i>\n\n<i>“Of course.”</i> Luca answers. She pulls out a tablet from beneath her desk and presents it to you. <i>“This is a list of everything The Lotus Eater has, pick what you want and I’ll have one of my little helpers get it for you.”</i>\n";
	//[Show Inventory]
	chars["LUCA"].inventory = new Array();
	chars["LUCA"].inventory.push(new FocusPill());
	chars["LUCA"].inventory.push(new FizzyFix());
	chars["LUCA"].inventory.push(new SaltyJawBreaker());
	chars["LUCA"].inventory.push(new TauricoVenidaeLight());
	
	if(flags["SLEEP_FAPNEA_INSTALLED"] == undefined) chars["LUCA"].inventory.push(new SleepFapnea());
	
	shopkeep = chars["LUCA"];
	//[Shop Menu Here]
	buyItem();
}

//VR Simulations
// Tooltip: Ask Luca about the Virtual Reality Simulators.
public function lucasVRSims():void
{
	clearOutput();
	showLuca();
	author("RequiemForAMeme");
	output("You ask Luca if you could use one of her virtual reality simulators.");
	//First Time:
	if(flags["VR_SIMMED"] == undefined)
	{
		output("\n\n<i>“Of course [pc.name].”</i> Luca spins a hardlight screen towards you displaying a Terms & Conditions screen. <i>“But first I need you to read this, then sign and accept.”</i>");
		if(pc.isBimbo() || pc.isBro()) output("\n\nYou quickly scroll down the document, sign your name and accept.");
		else 
		{
			output("\n\nYou read through the rather long document. It goes into intricate legal detail about how if something goes wrong you won’t sue.");
			output("\n\n<i>“Is your equipment dangerous?”</i> You ask.");
			output("\n\n<i>“Only as dangerous as the name brand stuff you can buy... I didn’t have customers sign this stuff before. But a couple months ago a few assholes came in and then a week later they came back with lawyers and a bunch of false claims about how my equipment caused them mental trauma. Cunts.”</i>");
			output("\n\nYou assume she won the case.");
			output("\n\n<i>“I wouldn’t be here if I didn’t. I personally test each and every simulation extensively before I offer it to a customer, even the ones I get from other developers.”</i>");
			output("\n\nSatisfied with her answer, you sign and accept the Terms & Conditions.");
		}
		flags["VR_SIMMED"] = 0;
	}
	// merge
	output("\n\nLuca spins a hardlight screen towards her and works on it briefly. When she’s finished she turns it back towards you. <i>“The price is 500 credits, and I can even set you up personally. I just need you to select which fantasy you would like to experience and if you want it private or public viewing. With private I’ll set you up in a private room and public you’ll be in the middle of the lounge with your simulation up on the screens for everyone in here to see.”</i>");
	clearMenu();
	addButton(0,"Pirate Queen",simmPubbiPrivateChoice,"pirateQueen","The Pirate Queen","Experience another chapter of the infamous space spy Stella Goodhead as she takes on a new and dangerous mission. Stella’s goal is to board the flagship of the Pirate Queen Titania Fucklaw and capture or eliminate her. Will Stella be able to complete her mission or will she suffer defeat yet again and be added to the Pirate Queen’s harem?\n\n<b>Contents:</b> Bad End! Mind Break, Anal, Bukake, Cum Bath, Deepthroat, Excessive Cum, Oral.");
	addButton(1,"Amazonia",simmPubbiPrivateChoice,"amazonia","Amazonia Prime","Are you ready for another episode of the great space explorer Dixon Cider? While enroute to his destination, his ship malfunctioned and he was forced to land it on the dangerous jungle world AMAZONIA PRIME. Will Dixon be able to fix his ship or will he succumb to the dangers of the planet?\n\n<b>Contents:</b> Bad End, Anal, Oral, Blowjob, Deep throat, Feminization");
	addButton(14,"Back",approachLuca,true);
}

//[Name of Simulation]
//[Private] [Public]

public function simmPubbiPrivateChoice(arg:String):void
{
	clearOutput();
	showName("PUBLIC\nOR PRIVATE");
	output("Do you want a public or private experience?");
	clearMenu();
	addButton(0,"Private",simmRouting,[arg,false]);
	addButton(1,"Public",simmRouting,[arg,true]);
}

public function simmRouting(args:Array):void
{
	var arg:String = args[0];
	var exhibition:Boolean = args[1];
	clearOutput();
	showLuca();
	author("RequiemForAMeme");
	output("After selecting the simulation and paying her, Luca leads you to ");
	if(!exhibition) output("a private room with a cushiony reclining chair.");
	else output("a soft couch in the middle of her establishment.");
	output(" She quickly sets you up and tells you to simply relax and enjoy yourself.");
	
	pc.credits -= 500;
	
	processTime(2);
	clearMenu();
	addButton(0,"Next",simmPlaying,args);
}

public function simmPlaying(args:Array):void
{
	var arg:String = args[0];
	var exhibition:Boolean = args[1];
	if(arg == "pirateQueen") thePirateQueenScenario(exhibition);
	else if(arg == "amazonia") theAmazoniaScenario(exhibition);
	
	flags["VR_" + arg.toUpperCase()] = 1;
}

//Simulation End Text
// put at the end of a simulation based on choice of private or public.
public function simmOutro(exhibition:Boolean):void
{
	clearOutput();
	showLuca();
	author("RequiemForAMeme");
	if(!exhibition) output("The simulation shuts down and you begin to regain your normal senses. As you try to remove your headset Luca places a warm hand on your shoulder and carefully removes the VR equipment. She makes sure your senses and perception of time have re-adjusted properly. Once you have fully rested you leave.");
	else output("The simulation shuts down and you begin to regain your normal senses. You receive several cheers and hollers as Luca carefully removes the VR equipment. She makes sure your senses and perception of time have re-adjusted properly. Once you have fully rested, you leave.");
	processTime(3);
	IncrementFlag("VR_SIMMED");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Starting VR Simulations
//The Pirate Queen
// The Pirate Queen is a three part short story; beginning, middle, and end. The Pirate Queen takes four hours to complete. If the PC bails early skip one hour for each part that was completed.
//Tooltip:
//Experience another chapter of the infamous space spy Stella Goodhead as she takes on a new and dangerous mission. Stella’s goal is to board the flagship of the Pirate Queen Titania Fucklaw and capture or eliminate her. Will Stella be able to complete her mission or will she suffer defeat yet again and be added to the Pirate Queen’s harem?
//Contents: Bad End! Mind Break, Anal, Bukake, Cum Bath, Deepthroat, Excessive Cum, Oral.
//Experience another chapter of the infamous space spy Stella Goodhead as she takes on a new and dangerous mission. Stella’s goal is to board the flagship of the Pirate Queen Titania Fucklaw and capture or eliminate her. Will Stella be able to complete her mission or will she suffer defeat yet again and be added to the Pirate Queen’s harem?
public function thePirateQueenScenario(exhibition:Boolean):void
{
	clearOutput();
	showName("AUSAR\nGUARD");
	author("RequiemForAMeme");
	// Part 1 - Ausar Guard
	output("You begin to lose feeling in you body as the VR Simulation loads up. As you feel like you’re about to black out the simulation activates. Your avatar is Stella Goodhead, an agent for the Space League of United Terrestrial Species. Stella is an ausar with white fur, a hefty rack, and a large ass. As her, you are wearing a tight latex body suit emblazoned with the emblem of the Space League of United Terrestrial Species.");
	output("\n\nYou take a moment to get used to moving, and then proceed with your mission. Your first obstacle is a burly amazonian ausar standing guard at a door. She is wearing a ball gag and keeps getting distracted by a large bulge in her pants.");
	output("\n\nA quick scan of the guard reveals she has not ejaculated in three days. You deduce that you can incapacitate her with a simple blow job. However she appears to have been injected with the Pirate Queen’s ‘Cum Addiction’ serum. Before this mission, the S.L.U.T.S inventor, Agent 69, gave you an experimental counter serum to fight off the effects. You don’t know how many times you will be able to ingest the altered cum before the counter serum is no longer effective.");
	//Public:
	if(exhibition) output(" A series of numbers and letters are displayed above the door: Views - " + (15+rand(4)));
	output("\n\nYou stealthily approach the guard. Once you’re within reach you gently place your hands over her eyes and seductively whisper: <i>“Oral Relief Service, how can I help you today?”</i> The ausar guard whimpers and you hear her pants strain against her bulge. You tell her to lie down and keep her eyes shut. She does so without hesitation. You quickly undo her pants to find a mechanical cock ring around her knot, and her balls incredibly swollen.");
	output("\n\nYou begin licking her doggy dick to full, throbbing hardness and find the release switch on the ring. You don’t press it yet; you need to make sure she fully enjoys what’s about to happen. You take her length into your mouth; she’s actually kind of small which makes it easier to kiss and suckle her knot.");
	output("\n\nIf it weren’t for the ball gag you wonder what kind of sounds she would be making. All you can hear is her uncontrollable whimpering and the wet sounds of your mouth. You take as much of her as you can, and then remove the cock ring to take in the rest. As she touches the back of your throat, she lets out a cry and begins cumming. You make sure you’re enveloping her knot as her balls empty themselves.");
	output("\n\nHer cum tastes sweet, so you take your time milking her for all she’s worth. You cup her balls and massage them as they pump their load out and into you. Eventually though she inevitably runs out of cum. With a sigh you plop her dick out of your mouth. She looks completely worn out by the ordeal. You caress her cheek and tell her to rest for a while.");
	output("\n\nWith that done you wipe away any cum on your lips and check out your figure. Your belly is still slim and yet you feel so full. Weird. You proceed onwards towards your goal.");
	output("\n\nMoving through the ship you find yourself caught between a forked hallway and the heavy footsteps of patrolling guards. The left hall leads to ‘Testing Center 34-N.’ The right hall leads to ‘Nutrient Stalls 12-N.’ You can’t let yourself get caught by the guards and there isn’t an immediate alternative, so which hallway do you take?");
	processTime(55 + rand(11));
	pc.changeLust(30);
	clearMenu();
	// Left Hallway follows A path and Right Hallway follows B path.
	//[Left Hallway] [Right Hallway] [Bail]
	//Tooltip Left Hallway: Go into Testing Center 34-N.
	//Tooltip Right Hallway: Go into Nutrient Stalls 12-N.
	//Tooltip Bail: You’ve had enough of this simulation and you want out.
	addButton(0,"Left Hallway",testingChamberAhoy,exhibition,"Left Hallway","Go into Testing Center 34-N.");
	addButton(1,"Right Hallway",nutrientStallsWheee,exhibition,"Right Hallway","Go into Nutrient Stalls 12-N.");
}

// Part 2A - Testing Center
public function testingChamberAhoy(exhibition:Boolean):void
{
	clearOutput();
	showName("TESTING\nCENTER");
	flags["SIMM_PATH"] = "A";
	author("RequiemForAMeme");
	output("Having gone down the left hallway you quickly slip into ‘Testing Center 34-N’. The room is filled with robot arms dangling from the ceiling, each ending in various types of dildos and onaholes. There are medical beds lining the walls, most occupied with various people and all of them being tended to by at least two robotic arms. Their moans and cries of passion resound through the room.");
	output("\n\nBefore anyone notices you, you find a changing room with accompanying sanitation station. Searching the area, you manage to acquire a nurse’s outfit. You quickly slip out of your latex suit with a button press. A second push causes it to fold up into a small, palmable package, allowing you to swap outfits in record time. You’re not sure how large this Testing Center is, but you need to get to the other end fast.");
	output("\n\nAs you exit the changing room, a poofy furred ausar in a doctor’s coat confronts you. <i>“Nurse! Thanks to the One,”</i> he exclaims. <i>“I need your help immediately.”</i>");
	output("\n\n<i>“Of course Doctor.”</i> You say, trying to blend in.");
	output("\n\nThe doctor brings you to a Kaithrit who has the ends of two robot arms lodged into her pussy and asshole, the end of a third arm shoved down her gullet, and a sizable onahole at the end of a fourth arm surrounding a bouquet of kitty dicks. He needs you to remove the arms filling her bottom holes while he holds her down. When he tried earlier, the Kaithrit tried to maul him, he explains.");
	output("\n\nThe doctor grabs her while you get to work. The arms come out easily. The end of each arm looks like a six-inch rubber tongue covered with round bumps, lubricated with some kind of lubricant. The Kaithrit tries to thrash about, but the doctor holds her in place. He tells you to take the arms to the other end of the Testing Center.");
	output("\n\nWalking across the Testing Center with two, weighty robot arms takes nearly half an hour. With each step, you are surrounded by more and more perverse patients with different doctors and nurses attending to them. The sights, sounds, and smells of sex, aphrodisiacs, and the Pirate Queen’s addiction serum have you drowning your stolen panties by the time you reach the end.");
	output("\n\nIt takes all your willpower not to use some unfortunate patient’s penis or face to get yourself off. When you finally see a door that you can use to escape, you nearly moan in relief. Before you move towards the door however, the ausar doctor catches up to you. He pants out of breath as he talks to you.");
	output("\n\n<i>“Nurse I need- I need a big favor from you.”</i>");
	output("\n\n<i>“What is it doctor?”</i> You ask.");
	output("\n\n<i>“I need at least one more hour of testing with those arms you have, and all of the other patients are fully booked.”</i> He explains. <i>“I would be in your debt if you used them for me. I don’t have much time before I have to submit my results to our Cap - I mean our Queen.”</i>");
	output("\n\nYou think for a moment. Your body is burning with desire, and you fantasize of jumping the ausar doctor and milking his doggy dick till his knot goes soft. It’s not like anyone on the ship knows you’re here. <i>“Of course </i>sexy<i>.”</i> You say.");
	output("\n\nThe doctor thanks you profusely and begins preparing the arms. You find a bed near the door, that way you can escape as soon as you’re finished. You lie down and remove your soaked panties, mentally apologizing to their owner. The doctor then brings the arms towards your bed.");
	//Public:
	if(exhibition) output(" A series of numbers and letters are displayed in front of the arms: Views - " + (26+rand(4)));
	output("\n\nThe first tongue slips into your needy pussy easily, and instantly begins working your inner walls. You grab hold of the bed as you spasm in your first orgasm. The robot tongue keeps moving while your tongue hangs from your mouth and you close your eyes. You eagerly await the next hour of your life.");
	output("\n\nThe second tongue takes a little more finesse to get going. But the doctor was patient and with it’s self lubrication it eventually fills your backdoor. Both tongues alternate between long slow motions and wildly fast thrusts. Your favorite is when they both switch to long and slow at the same time, feeling the bumps glide along your insides in perfect unison is amazing.");
	output("\n\nThe doctor monitors you through all of your orgasms. He tries to explain how the tongues work, but between the noises of the Testing Center and your own moans, you only hear bits and pieces. He said something about how the tongues react to the user and what they need, and how the lubricant is a variation of some addiction thingy. You stopped paying attention about halfway through.");
	output("\n\nAs the tongues continue to work your lower holes, you start to fantasize about the ausar doctor and his naughty knotty doggy dick, just arm’s reach away from your face. He could just ask you to suck it, and you would. Or even better, he could force it into your mouth. <i>You feel so thirsty.</i> Just a few licks and you’re sure he would be pouring wonderfully salty precum into your mouth.");
	output("\n\nAs you’re about to lean towards his amazing-smelling cock, the doctor exclaims that he’s finished. He flips a switch on both the arms and suddenly both tongues swell up. You lift your hips as the tongues expand, and cry out as they pump some kind of thick slime into you. You fall onto the medical bed spasming from your unending orgasm. The doctor seems to still be talking, but you can’t make out the words as you black out.");
	output("\n\nFortunately, you awaken some time later, still on the medical bed. The Testing Center is still filled with noise as you get your bearings. You look at your belly expecting to see yourself bloated, but you’re as slim as ever. Though you are still thirsty. You quickly get off the bed and slip out of the room. You’ve wasted enough time... well maybe not wasted, because it felt sooo good.");
	processTime(55 + rand(11));
	pc.lust(100);
	pc.orgasm();
	pc.lust(30);
	clearMenu();
	// Next Scene
	//[Next] or [Bail]
	addButton(0,"Next",part3ADoorDildo,exhibition,"Next","Proceed with the simulation.");
	addButton(14,"Bail",simmOutro,exhibition,"Bail","You’ve had enough of this simulation and you want out.");
}

public function part3ADoorDildo(exhibition:Boolean):void
{
	clearOutput();
	showName("DOOR\nDILDO");
	author("RequiemForAMeme");
	output("Having got through the Testing Center you change back into your latex suit, dispose of the nurse’s outfit, and continue your mission. You move through the ship in search of the Pirate Queen, this time more carefully. You don’t want any guard patrols cornering you. Eventually, your patience pays off as you reach a side door to the command deck. The door doesn’t have a control panel, instead there is a sign that reads: <i>“Suck Me, Open Me.”</i> A long ribbed dildo with a thick head is protruding from the wall.");
	output("\n\nA quick scan of the door reveals that you will have to use your mouth on the dildo. When it releases it’s load it will cause the door to open. However the load is nearly a gallon of serum-infused cum. The dildo also appears to be coated with some sort of aphrodisiac. You don’t know how many more times you can ingest cum before the counter-serum is no longer effective, but you’re feeling pretty thirsty and the last load was delightful, so it can’t be all that bad.");
	if(exhibition) output("\n\nA series of numbers and letters are displayed above the door: Views - " + (42+rand(4)));
	output("\n\nYou get onto your knees and lick the head of the dildo. The aphrodisiac tastes like some sort of fruit. A second lick tastes slightly different. The third and fourth all taste different too. Before you know it, the head of the dildo is in your mouth and you’re rolling your tongue all around it. The longer you taste it, the more powerful and delicious it is.");
	if(silly) output(" It tastes like snozzberries!");
	output("\n\nYou lose yourself in tasting the aphrodisiac for some time. A small spurt of cum snaps you back into focus. It’s even more delicious than the aphrodisiac, so sweet and thick. You thrust your head forward in hopes of coaxing more out of the dildo. The ribbed texture massages your throat and makes it easier to go down.");
	output("\n\nSuddenly the dildo begins vibrating, and the ribbed sections pulse outward. You instinctively try to pull it out, but it feels so good as you pull your head back. You immediately thrust forward again. You face fuck yourself with the dildo, and it rewards you with cum every time the head is in your mouth. You don’t even wonder how it knows, you just want more.");
	output("\n\nThen you cum. You didn’t even realize how wet you made yourself. You stop moving as you deep throat the dildo. Your body seizes up as it cums from the face fucking you’ve given yourself. The dildo, sensing your orgasm, then releases its full load down your throat. You internally cry out, knowing you won’t be able to taste all of the delicious cum being pumped down your throat.");
	output("\n\nEventually your oral orgasm subsides and you slide off of the dildo. The door opens up and you shakily walk through it.\n\nYou have to complete your mission.");
	processTime(55 + rand(11));
	pc.orgasm();
	pc.(20);
	clearMenu();
	// Next Scene
	// Go to Part 3 - The Bad End
	//[Next] or [Bail]
	clearMenu();
	// Next Scene
	//[Next] or [Bail]
	addButton(0,"Next",theBadEndHappensNow,exhibition,"Next","Proceed with the simulation.");
	addButton(14,"Bail",simmOutro,exhibition,"Bail","You’ve had enough of this simulation and you want out.");
}


// Part 2B - Nutrient Stalls
public function nutrientStallsWheee(exhibition:Boolean):void
{
	clearOutput();
	flags["SIMM_PATH"] = "B";
	showName("NUTRIENT\nSTALLS");
	author("RequiemForAMeme");
	output("Having gone down the right hallway, you quickly slip into ‘Nutrient Stalls 12-N’. The room is filled with former crew members set up in mechanical stalls. All of them have gigantic cocks and accompanying testicles. A mechanical cocksleeve is set up on each stall to milk their shafts. Meanwhile a dildo, hooked up to a vat in the ceiling, is lodged in their mouths. There are drains and troughs set up below the stalls. You slip into one before anyone sees you.");
	output("\n\nYou scan the room to figure out what your next move should be. You assume that the crew members in the stalls are fed and provided nutrients through the dildo in their mouth. Meanwhile their cocks are milked for their serum infused semen which flows through the drains and troughs into some processing room on the deck below. You then realize that you’re sitting in a stream of cum.");
	output("\n\nYou reflexively take a long whiff of the stench. The aroma is intoxicating, and you are filled a sudden urge to lap up as much spooge as you can. You fight the urge and scan for an exit. The room is quite large and the stalls go for a long way in multiple directions. You’re left trying to hold your breath as your scan finishes.");
	output("\n\nYour equipment plots the fastest path to an exit. You’ll have to crawl through the drainage system on your stomach until you get to the main trough in the center of the room. Once there you can get on your knees and B-line it straight to an exit. You mentally whine and pop your head out of the drain for a quick breath before proceeding.");
	output("\n\nThe first few minutes are relatively easy as you crawl through the drains. You use many of the breathing techniques you learned during training to take as few breaths as possible. You turn a few corners and realize that your suit is probably going to smell like cum for a while after this. Hopefully you can find a sanitizer of some kind after getting out of this room.");
	output("\n\nWhen you reach the main trough you find that it’s between two long rows of filled stalls. The occupants appear to be constantly in a state of climax, their cocks and balls showing no, or barely any, refractory period. You’re thankful that the trough is several feet below the floor as you squeeze out of the drain.");
	if(exhibition) output("\n\nA series of numbers and letters are displayed above the other drain opposite you: Views - " + 27+rand(4));
	output("\n\nAs you free yourself from the drain you end up nearly falling out head first. You reach for the floor of the trough to catch yourself, but you don’t find it in time. You slip and fall face first into a stream of cum. You’re immediately filled with the taste and smell of serum infused semen. You pull yourself up on your hands and knees, gasping for air.");
	output("\n\nBefore you can gather yourself, veritable buckets of cum are poured down on you from above. You push yourself forwards on your hands and knees, but soon you begin to feel dizzy. Your senses are being overwhelmed by the sheer amount of semen you’re essentially bathing in. Somehow you keep moving forward.");
	output("\n\nYou don’t know how far you made it before your tongue started lapping up the alabaster slime you’re wading in. Somehow you manage to keep moving straight despite your body slowly betraying you. You begin to revel in the flavor and fragrance as you continue to crawl.");
	output("\n\nYou wonder how anyone could hate this sensation. How could this vulgar scene possibly be considered awful? All you need now are two burly guards or some double dicked partner to fill your empty cunt and anus. Both of your holes start feeling more and more painfully hollow as you keep moving.");
	output("\n\nEventually though you manage to reach the end of the trough. You feel heavy as you pull yourself out of the heavenly gunk. Once you’re fully out, you book it to the door and out of the Nutrient Stalls. You quickly find a safe corner to rest in and plan your next move.");
	output("\n\nAs you catch your breath you wonder just how much cum you drank. No matter how much you ingested, it wasn’t enough. Your body craves more, but your stomach must be bloated by now. Upon examination however, your belly is nice and flat; kind of empty when you think about it.");
	processTime(55 + rand(11));
	// Next Scene
	pc.changeLust(100);
	clearMenu();
	// Next Scene
	//[Next] or [Bail]
	addButton(0,"Next",showersSimmScene,exhibition,"Next","Proceed with the simulation.");
	addButton(14,"Bail",simmOutro,exhibition,"Bail","You’ve had enough of this simulation and you want out.");

}

// Part 3B - Showers
public function showersSimmScene(exhibition:Boolean):void
{
	clearOutput();
	showName("THE\nSHOWERS");
	author("RequiemForAMeme");
	output("Before continuing your mission, you decide to clean yourself. The stench will definitely distract you and it might even attract guards or other crew members. Luckily you find some showers close to the Nutrient Stalls. You carefully check to make sure they’re empty before going in though.");
	output("\n\nOnce you’re satisfied the coast is clear, you go in and immediately start cleaning your suit, inside and out. You spend nearly ten minutes trying to overcome the cum stench with soap. As you remove the last of the stains you absent mindedly start fondling your clit and lower lips. You hum contentedly while cleaning and pleasuring yourself.");
	output("\n\nThen the main door to the showers open. You seize up in a panic. Quickly, you condense your suit into a small gadget and look for a place hide it away. As you find a good hiding spot for your suit, you hear two sets of voices moving towards you.");
	output("\n\nTwo members of the pirate crew round the corner. Are they guards? You can’t tell, as they are already fully nude. One of them is a short, hermaphroditic ausar with small breasts, a tiny but very thick looking doggy dick and two grapefruit sized balls. You force yourself to stop wondering what it would look like fully erect. The other one is a hermaphrodite kaithrit, much taller than your or her companion. She has full, beach-ball sized breasts, a ribbed, prehensile dick swaying between her knees, and four full-looking testicles.");
	if(exhibition) output("\n\nA series of numbers and letters are displayed above them: Views - " + (43 + rand(4)));
	output("\n\n<i>“What do we have here?”</i> The kaithrit purs. <i>“I told you I could smell a cum covered bitch who wasn’t you.”</i>");
	output("\n\nThe ausar looks away from both of you and does her best to cover her growing erection. Your throat feels dry as no words come to mind.");
	output("\n\n<i>“I’m just guessing, but I’d bet you’re one of the dumbass nurses that fell into one of the semen troughs right?”</i> The kaithrit jokes. <i>“Am I right?”</i>");
	output("\n\nShe approaches you, pulling you into a deep kiss. Your body relaxes instantly, and the empty feeling from the Nutrient Stalls returns in full force. You wrap your arms around her and hump her leg.");
	output("\n\nThe kaithrit pulls you away with her big, strong, <i>sexy</i> arms. <i>“Looks like I was right again Su. I think we could definitely help our new friend out. What do you think Su?”</i>");
	output("\n\n<i>“I think we uh-”</i> Her voice trails off as her doggy shaft becomes fully erect. You let go of the Kaithrit and stumble towards the ausar, Su. You tremble as you push her down onto the floor.");
	output("\n\n<i>“Viv!”</i> Su calls out.");
	output("\n\nYou place a finger to her lips as you begin to mount her stout, but girthy, shaft. Viv, the kaithrit, says something, but you don’t care. You lean down and kiss Su passionately and slam your hips onto her marvelously thick doggy dick. You moan into her mouth as you thrust up and down.");
	output("\n\nBefore you can find a good rhythm, Viv grabs your hips and holds them in place. <i>“Don’t get too far ahead without me now.”</i> She says. Her pre-leaking cockhead presses against your pucker and forces itself forward. She quickly fills your ass with her tentacle-like cock.");
	output("\n\nThe three of you find a good tempo of thrusting back and forth and rocking your hips. Su whines and whimpers from the pleasure, which makes her so adorably <i>cute</i>. You just want to see her squirm even more. Viv, on the other hand, is a master of playing with your ass. Her prehensile dick works your back door for all it’s worth. She alternates between long thrusts in and out, then has it twist and turn while she bottomed out.");
	output("\n\n<i>“Are you ready for the real fun part, slut?”</i> Viv whispers in your ear.");
	output("\n\n<i>“Fun part?”</i> you ask.");

	output("\n\nViv grabs your hands and places them on two squishy and expanding nuts. <i>“Su’s been given a few kui-tan enhancements. She actually produces more cum than me most of the time. Combine that with our Queen’s serum, and you’ll be a giggling mess after this. So, are you ready?”</i>");
	output("\n\nYour mind tells you to stop, but you <i>need</i> to be filled so badly. You can only cry out: <i>“Yes!”</i>");
	output("\n\nViv grabs your hips and rocks you back and forth on Su’s knot. Then she lifts you up and off her. Before either of you can complain Viv slams your hips back down on Su and her doggy dong, with her knot firmly spreading your pussy and locking you in place on her shaft.");
	output("\n\nSu screams in pleasure as her dick starts injecting her seed right into your womb. Viv pops off shortly after, flooding your rectum with her own serum infused seed. You climax in tandem with them, but you keep moving your hips to draw out your orgasm for as long of possible. This time for sure you can feel your body swell with semen.");
	output("\n\nOnce their orgasms die down, Su and Viv are left panting, but you’re still not satisfied. Not yet anyway. You need more. So you start moving your hips again.");
	output("\n\n<i>“Hey, now.”</i> Viv says. <i>“Just wait a little bit, slut.”</i>");
	output("\n\nYou pull Viv’s head over your shoulder and into a kiss. Quickly both their cocks become erect once again. <i>“I’m not done with you two yet,”</i> you tell them.");
	output("\n\nThree hours later, you leave Su and Viv numb, quivering and covered in their own semen. You briefly wonder if they can become addicted to their own seed. You check yourself out in a mirror, hoping to see your stomach nice and bloated from semen, but your body doesn’t show any signs of your recent rut. You feel angry and unfulfilled, like if you’re not <i>sucking dick or being fucked full of cum</i> what’s the point?");
	output("\n\nYou push the thought out of your head. If you can’t be fulfilled by some good double pen, then you might as well continue your mission. You grab your suit from it’s hiding place and quickly change. You then sift through Su and Viv’s belongings. They have keycards to the command deck!");
	output("\n\nYou nab one of the cards and continue your journey through the ship. You stay alert, making sure that none of the guard patrols corner you, though you feel sad and empty with each patrol you sneak by. Eventually your patience pays off as you reach a side door to the command deck and use the keycard.");
	// Next Scene
	//[Next] or [Bail]
	//Tooltip Next: Proceed with the simulation.
	//Tooltip Bail: You’ve had enough of this simulation and you want out.
	processTime(55 + rand(11));
	pc.orgasm();
	pc.lust(20);
	clearMenu();
	addButton(0,"Next",theBadEndHappensNow,exhibition,"Next","Proceed with the simulation.");
	addButton(14,"Bail",simmOutro,exhibition,"Bail","You’ve had enough of this simulation and you want out.");
}

public function theBadEndHappensNow(exhibition:Boolean):void
{
	clearOutput();
	showName("PIRATE\nQUEEN");
	author("RequiemForAMeme");
	output("You manage to sneak onto the command deck, but it’s quiet. Looking around, there doesn’t seem to be anyone else here besides you. Then you see the captain’s chair. Sitting there is Titania Fucklaw, the Pirate Queen herself. The crimson-skinned alien sits upon her throne looking incredibly bored. Her head rests in one hand while the other lightly strokes her cock.");
	output("\n\nYou don’t bother to hide yourself as you approach her. <i>“Hello Miss Goodhead, did you enjoy yourself on the way here?”</i> She teases. She drags a single finger up her engorging cock, and you focus solely on it as it becomes fully erect. Precum oozes thickly from the tip and the smell makes your legs almost give out.");
	output("\n\nYou can’t stop yourself from whimpering as you approach her. Your lips seem to swell as you walk and your mouth can’t stop salivating. Your tongue lolls out as you wobble forward.");
	if(exhibition) output("\n\nA series of numbers and letters are displayed above Titania: Views - " + (88+rand(6)));
	output("\n\n<i>“I can see you tasted my special serum.”</i> Titania says. <i>“It took a while, but I finally managed to find a way to mass produce it.”</i>");
	output("\n\n<i>“H-how?”</i> You ask just a few feet before her. You struggle to keep your eyes off her throbbing cock.");
	output("\n\n<i>“One day while I was busy fucking my harem silly, filling them with my cum until they overflowed-”</i>");
	output("\n\n<i>“O-over f-flowed?”</i> You interrupt her. The idea of her filling all your holes until her seed is streaming out of them makes you fall to your knees.");
	output("\n\n<i>“Yes, Miss Goodhead. I was utterly filling my harem when I thought it would be great if some of them, or even my crew, could spread my serum. So I created a way to spread the addiction serum when anyone ingests my cum... Oh what was I saying? I could keep talking, but I can’t concentrate when my cock is so dry.”</i>");
	output("\n\nYou lunge forward, spearing your mouth and throat on her cock. You savor the intoxicating aroma and taste of her precum. You take her length as deep as you can, ");
	//Path A:
	if(flags["SIMM_PATH"] == "A") output("thanking that huge door dildo that loosened your throat earlier");
	else output("feeling pain turn to pleasure as your throat stretches around her");
	output(". Titania hums in delight and caresses your head.");

	output("\n\n<i>“When someone ingested my cum before, they would simply become addicted. But now if that someone has a cock, or gets one later, they spread my addiction.”</i> She gently pets you and scratches your ears. <i>“Nearly everyone on this ship is now addicted to cum, mine can set off orgasms just by the smell of it. Ooh, put the head in your mouth and suck.”</i>");
	output("\n\nYou do as instructed, and she begins cumming in your mouth. But it doesn’t overflow like you were promised. It slowly pumps and glides down your pliant throat. <i>“Don’t spill a drop and I’ll reward you with more, Miss Goodhead.”</i> You look up at her pleadingly, it’s just so slow and you want, no you <i>need</i> more of her cum.");
	output("\n\n<i>“Don’t worry my dear, I know that look all too well. I can control how my seed is released and right now I just want this moment to last forever.”</i> She smiles down at you sincerely, her cock releasing her spunk slightly faster. You double your efforts to make her feel as good as possible, you know she’ll give you more than you can take anyway.");
	output("\n\n<i>“Now I just need to finish turning my crew and harem into cum addicted herms. Would you like to join them?”</i> All you can do is moan as she pulls your head forward. Her cock diving deep into your throat. You can feel her cock pulsating in your mouth; she is having an orgasm. The cum is expelled in light bursts at first, then gradually turns into an unstoppable torrent. Soon she fills your stomach completely and then your mouth until you can’t keep it closed. You lose consciousness as you experience an unending chain of oral orgasms.");
	output("\n\nSeveral months have passed since then. After you awoke Titania filled your pussy and ass with her seed, and you accepted it like the good cumslut you were. She then ordered two members of her harem with thick knotted doggy dicks to fill your holes while she was away. Their cum wasn’t as good as your new mistresses’, but it was enough for you. You became a favorite cocksleeve of the crew and harem alike for a few months.");
	output("\n\nThen one day, Titania gave you a cock all your own, and doted on you with gene mod after gene mod. You can cum rivers with your swollen quadruple nuki nuts now. She even made it so that you can survive off of cum alone. Now you don’t even need to eat or drink anything other than your favorite thing in the universe. One day, months later, as you take in your mistress’s eleventh load you remember you were once spy of some sort, but as she face fucks you for a twelfth load the thought fades away.");
	processTime(55 + rand(11));
	pc.orgasm();
	pc.orgasm();
	// End Scene
	// Simulation End Text
	// Return PC to lobby
	clearMenu();
	addButton(0,"Next",simmOutro,exhibition);
}

public function theAmazoniaScenario(exhibition:Boolean):void
{
	clearOutput();
	showName("\nEXPLORATION");
	author("RequiemForAMeme");
	//Part 1 - Exploration
	output("You begin to lose feeling in you body as the VR Simulation loads up. You feel like you’re about to black out once the simulation activates. Your avatar is Dixon Cider, a renowned space explorer. Dixon is a terran with fair, slightly tanned skin, a heroic muscle toned body, and an eight inch penis. You are wearing a white shirt, a leather vest, cargo pants filled with gadgets, and combat boots.");
	output("\n\nThe first thing you do is make sure your small crew is alive and unharmed. After you’re done with the roll call you ask your mechanic, a cat-girl named Chris, what the hell happened to your ship. Unfortunately until the crew completes their damage assessment, she can only guess.");
	output("\n\nYou check on the rest of the crew again before going to your cabin. There you test which of your ship’s systems are still operational. Fortunately most of them are still working to some degree. You pull up the ship’s auto-cartography function. It reveals that there is some sort of structure nearby, but it is about a six hour hike away.");
	output("\n\nYou plot out the path and gather the supplies you’ll need. The sun is rising, and the ship informs you that days last roughly thirty two hours on this planet. You tell the crew about your plan, either the structure means help of some kind, or it will be another place for Dixon Cider to explore thoroughly. As you’re about to leave, you tell them to send a search party if they don’t hear from you at least once every four hours. Then you embark into the dense jungle of Amazonia Prime.");

	if("exhibition") output("\n\nA series of numbers and letters are displayed along the trees as you enter the jungle: Views - " + (15+rand(4)));
	output("\n\nYou are surprised by how much sunlight shines through the canopy. Most of the trees are as tall and thick as old colonial skyscrapers, their branches as broad as buses, and the length of trains. Then there are the vines growing everywhere, which makes you thankful you brought your vibro machete.");
	output("\n\nOn your journey you make sure to document the local flora and fauna you encounter, though you make sure the wildlife stays a safe distance away. You get pictures of twenty seven new species of birds, nearly all them beautifully colored. You eventually find a green, six legged jungle cat with black stripes, but it escapes into the thick vegetation before you can get a good picture.");
	output("\n\nAfter a few more hours of travel you come to a clearing which reveals the large structure. It’s a pyramid adorned with gold and exceedingly large precious gems. Crystal clear water flows from ducts all around the pyramid, going down into a wide but shallow moat. At the very top is a statue of a woman, one hand holding a spear above her head and the other holding up her huge breasts.");
	if(silly) output(" Perhaps this is an ancient temple to the forbidden goddess Oxonef?");
	output("\n\nYou quickly take pictures and document the outside of the pyramid. At the entrance is some sort of altar in the shape of a bowl. It is filled with various fruits, meats, and vegetables; some new and some old. You walk past the altar and up into the pyramid.");
	output("\n\nYou explore the insides of the pyramid for some time. You discover the walls are richly marked with an alien language and murals, that the entire structure is lit by luminescent crystals, and the humanoid inhabitants appear to be hermaphrodites. Using your translator you learn that the pyramid is actually a temple built in honor of a god and the inhabitants of the area use the temple as a place of worship and ceremony.");
	output("\n\nFurther exploration leads you to private and public areas of the temple. One of two areas that stand out to you is an inner chamber blocked by large stone doors, which you believe you could force open with enough time. The second one is a gigantic bath chamber that lies in the center of the temple. After your trek through the jungle you could use a nice soak.");
	// End Scene
	// Inner Chamber follows A path and Bath Chamber follows B path.
	//[Inner Chamber] [Bath Chamber] [Bail]
	//Tooltip Inner Chamber: Pry open the doors to the inner chamber and see what’s inside.
	//Tooltip Bath Chamber: Go take a nice relaxing soak in the bath chamber.
	//Tooltip Bail: You’ve had enough of this simulation and you want out.
	processTime(55 + rand(11));
	clearMenu();
	addButton(0,"Inner Chamber",goddessDildoTiems,exhibition,"Inner Chamber","Pry open the doors to the inner chamber and see what’s inside.");
	addButton(1,"Bath Chamber",amazoniaBathTime2B,exhibition,"Bath Chamber","Go take a nice relaxing soak in the bath chamber.");
	addButton(14,"Bail",simmOutro,exhibition,"Bail","You’ve had enough of this simulation and you want out.");
}

// Part 2A - Dildo of the Goddess
public function goddessDildoTiems(exhibition:Boolean):void
{
	clearOutput();
	showName("DILDO OF\nTHE GODDESS");
	author("RequiemForAMeme");
	output("You mess with the doors using a variety of gadgets and ingenuity. Eventually, your efforts pay off when you manage to slide them open, the heavy stone gliding across the top of the floor. You step into the inner chamber and are greeted with what appears to be a twelve inch silver sculpture of a ribbed cock and balls sitting upon a pedestal.");
	output("\n\nYou stifle a laugh, knowing you’ve seen stranger things in your career. You quickly scan the silver dildo and it’s pedestal for traps. You’re actually a bit disappointed when you find none. You quickly snatch the sculpture and leap out of the room hoping for some sort of danger to present itself. Unfortunately nothing happens.");
	output("\n\nYou place your prize into your satchel. Prize? You sigh, annoyed at the situation and its anticlimactic reward. As you leave the temple, you prepare for a horde of burly amazonian warriors to ambush you, but no one does. As you enter the jungle you keep your eyes peeled for big cats trained to attack trespassers, but no animal comes. When you return to your ship, you expect something to be wrong, but the repairs went smoothly, and you along with the crew should be able to leave tomorrow morning.");
	output("\n\nOver dinner, you tell the crew of your adventure into the amazon’s temple and the strange object you found within. All of you share a long laugh over the absurdity of your ‘prize.’ Chris in particular mocks its extreme proportions. After food and conversation, you tell the crew to lock down the ship and get some rest.");

	if(exhibition) output("\n\nA series of numbers and letters are displayed in on your cabin ceiling: Views - " + (26+rand(4)));
	output("\n\nYou retire to your cabin with your <i>astounding</i> prize. You can’t stop thinking about the thrill you had exploring the temple <i>and seeing the beautiful silver sculpture for the first time.</i> You sigh content and allow yourself to drift off into a deep sleep.");
	output("\n\nOr at least you try. You try counting as high as you can, but numbers make you think of <i>how long and girthy</i> the schlong in your satchel is. You try thinking of what other treasures that temple may hold, but then <i>the image of the smooth, lustrous silver and bulbous crown</i> enters your mind. You try thinking of the one night stands you’ve had with Chris, only for you to imagine her riding you while she thrusts a certain <i>beautiful ribbed silver dildo in and out of your ass.</i>");
	output("\n\nThe thought of such a <i>wonderfully thick object massaging your prostate</i> keeps you awake and achingly hard. You decide a good fap will get your mind off the strange <i>but exotic and alluring, sculpture.</i> You grab hold of your eight inch meatstick and get to work. You were already erect from your lustful thoughts, so you dive straight into the good part.");
	output("\n\nAfter a few minutes you find yourself bored of just stroking your shaft. When there is <i>such a helpful and erotic tool</i> just a few feet away, why should you keep using your hands? You quickly fetch your satchel and a bottle of lube you keep near your bed.");
	output("\n\nYou slather the <i>divine silver cock</i> in lubrication. You get lost in your preparations, absentmindedly stroking the idol. When you realize how silly you’re acting, you look down at the cock in your hands and forget all about it. <i>It will fit so perfectly inside you.</i> You begin preparing your pucker for your new friend. You take your time stretching your backdoor. It won’t be the first time you’ve had something in your ass, but it will be the largest by far.");

	output("\n\nWhen you place the head of the fake phallus against your rectum, you realize your own penis is throbbingly hard. You may cum just by inserting it. <i>More than once if you do it right.</i> You press the silver dildo upwards and force it into your now pliant, expecting asshole.");
	output("\n\nEach ribbed section that passes into you makes you squirt a little precum from your cock. Once it’s fully inside, you look down to see your spooge ooze from your head in one long connected stream. The sight and your arousal makes you start moving the <i>wonderfully filling dildo.</i>");
	output("\n\nEach self-inflicted thrust against your prostate brings you closer and closer to what is going to be your best orgasm. You need to fuck yourself faster with the silver cock. Faster and faster until your own dick is spasming and your ass is irreversibly stretched. With one long thrust you slam the fake penis deep into yourself and climax.");
	output("\n\nYou cover your chest, sheets, and bed with seed as you keep plunging the silver dildo in and out. You thrash about until you feel utterly spent, until you feel like you can’t milk any more semen from your balls. When you collapse upon your baby batter covered bed, you nearly pass out.");
	output("\n\nBut something tells you rise up. You feel drawn outside. You gather your things and prepare for another journey to the amazon temple. You don’t bother to wipe the cum from your chest. <i>The smell is kind of nice.</i> You make sure the prize you stole from the temple is firmly secured in your ass before leaving the ship; you don’t even bother to close the door.");
	output("\n\nOnly a few minutes into your delirious journey, you find yourself panting and burning with need. You unbuckle your pants and fall to the ground trying to thrust the silver cock into your rectum, but it is getting hard to think or move. You lie down breathless and black out with unfulfilled need.");
	processTime(55 + rand(11));
	pc.orgasm();
	pc.lust(25);
	// Next Scene
	clearMenu();
	//[Next] [Bail]
	//Tooltip Next: Proceed with the simulation.
	//Tooltip Bail: You’ve had enough of this simulation and you want out.
	clearMenu();
	addButton(0,"Next",simmCaged3A,exhibition,"Next","Proceed with the simulation.");
	addButton(14,"Bail",simmOutro,exhibition,"Bail","You’ve had enough of this simulation and you want out.");
}

// Part 3A - Caged
public function simmCaged3A(exhibition:Boolean):void
{
	clearOutput();
	showName("\nCAGED!");
	author("RequiemForAMeme");
	output("You awaken some time later naked, stripped of your clothes and gear. You stand up in a cage made of wood, metal, and leaves. The sun is high, and you appear to be in the center of what seems to be an amazon village. The bronze skinned hermaphrodites walking by look upon you with a mix of wonder and disgust. In the distance you hear what sounds like either a sexy bar fight or a rough orgy.");
	output("\n\nA few minutes after you wake up, an amazon approaches your cage. She stands a few inches shorter than you, her golden hair is cut short, and her eyes are the color of precious amber. Her body is covered by a dress made of flowers and leaves, but little is hidden. Her breasts are easily D cups, her hips are wide, and her ass firmly round. Her body is curvy and thick with muscle. But what really draws your gaze is her foot long, fully erect and ribbed cock. Your eyes are locked onto it, and you can’t seem to look away.");
	output("\n\nShe tosses your translator into the cage then speaks once you seem to have it working. <i>“I am Seylia. You are?”</i>");
	output("\n\n<i>“I’m Dixon.”</i> You say. <i>“Dixon Cider, a renowned explorer.”</i> <i>You can’t seem to look away from her ribbed rod.</i>");
	output("\n\n<i>“You are a thief and a criminal Dixon.”</i> Seylia tells you. <i>“You must pay for your crimes.”</i>");
	output("\n\n<i>“Of course. I’m sure we can come to-”</i>");
	output("\n\n<i>“Speak only when I am finished!”</i> Seylia shouts at you. <i>A nice shiver runs down your spine.</i> <i>“You are our prisoner. Our prisoners are given a choice. You may choose to die for you heinous deed. Do you wish to die thief?”</i>");
	output("\n\n<i>“Not particularly.”</i> You answer.");
	output("\n\n<i>“Then you have two other choices. First you serve our tribe until you are forgiven. If you are forgiven you will be given opportunity to join the tribe or remain as a servant.”</i>");
	output("\n\n<i>“What does ‘serving the tribe’ entail? Manual labor? Slave work?”</i>");
	output("\n\n<i>“Manual work is an option yes. Other work includes being used by members of the tribe for relief. Need I explain that further?”</i>");
	output("\n\n<i>You lick your lips when your eyes drift back towards her dick.</i> You don’t need her to explain. <i>“What’s the second option?”</i> You ask.");
	output("\n\n<i>“You will be given the opportunity to fight for your freedom in ceremonial combat. If you win you’ll be given your freedom and one request of the tribe, as long as that request is within reason.”</i>");
	output("\n\n<i>“And if I lose?”</i>");
	output("\n\n<i>“Your life will belong to your opponent. She’ll decide what to do with you, including whether you live or die.”</i>");
	output("\n\n<i>“I think I’ll choose the trial by combat.”</i> You say confidently. You know something weird is happening to you, and that you need to escape as soon as possible.");
	output("\n\n<i>“As you wish. I will return to tell you who your opponent will be. It may take some time, as many in the tribe will wish to face you. After your opponent has been decided, you will be given one opportunity to withdraw your request for combat.”</i>");
	output("\n\nSeylia leaves with an abrupt twirl. As you watch her asscheeks bounce, you realize just how hungry you are. Looking around your cage, you see a basket filled with fruit has been provided for you to eat. You lunge upon them like a predator, each bite into the alien fruit is unique and reminds you of the great things you can find as an explorer. After you satiate your hunger you lie down on some makeshift bedding for nice nap.");
	output("\n\nHours later you awaken under a clear night sky, giving you a breathtaking view of three faintly blue moons. You marvel at the sight for a few minutes before looking around for more food. Your fevered masturbation session must have taken more out of you than you thought.");
	output("\n\nThere’s no food though. You see a guard nearly a full foot taller than you nearby. <i>“Psst. Psst. Hey.”</i> You call out in a whisper. <i>“Hey guard.”</i>");
	if(exhibition) output("\n\nA series of numbers and letters are displayed above the guard: Views - " + (43 + rand(4)));
	output("\n\nShe turns to you, giving you a nice view of her tattooed muscular body. Her ribbed cock hangs freely for you to see. She’s at least ten inches <i>and you wonder if she’s a grower or a shower.</i> <i>“Speak up prisoner.”</i>");
	output("\n\n<i>“I’m hungry. Are you or someone else able to get me some more food?”</i>");
	output("\n\nShe eyes you silently.");
	output("\n\n<i>“Well?”</i> You ask.");
	output("\n\n<i>“At dawn you will be given more fruit, which will feed you for the day. You already ate.”</i>");
	output("\n\nYou mentally scream at the guard in your mind. You know shouting out loud won’t help. <i>“What can I do to get more food? I don’t know how long I’ll be in this cage and I’m very hungry.”</i>");
	output("\n\nThe guard looks you up and down, judging you. She smiles and walks towards the cage. <i>“I have been standing here guarding you shortly after you awoke and spoke with priestess Seylia. I haven’t been able to do anything but stand here and make sure you don’t try to escape.”</i>");
	output("\n\nShe takes her flaccid cock into her left hand. With a few gentle strokes it rises to a full <i>yummy looking twelve inches.</i> <i>“You will bring me pleasure with your mouth and I will in turn bring you food. Deal?”</i>");
	output("\n\nSo you give her a blowjob and she gives you food? <i>That sounds like a tasty and mouth watering win-win!</i> <i>“Deal.”</i>");
	output("\n\nYou get onto your knees and move to the edge of the cage. The guard puts her ribbed length through the wooden bars. You’re too hungry to give her any foreplay. You take as much of her into your mouth as you can and start sucking. She stifles a low moan as she presses herself against the cage.");
	output("\n\nYou pull her deeper into your mouth and start tasting her precum. In only a minute her crown starts to tickle the back of your throat. That’s when two hands grasp the back of your head and slam you forward. Her ribbed meaty length forcing itself down your gullet. The guard takes the lead assailing your oral cavity. Before long she climaxes and injects her cum directly into your stomach.");
	output("\n\nThe guard releases her hold on your skull and you fall backwards onto your butt. She chuckles and walks away. You blissfully start sucking a finger in and out of your mouth. Tasting what little cum you didn’t swallow, you start rolling it around with your tongue.");
	output("\n\nThe guard eventually returns with a plate of cold fruit and warm meat. She hand feeds each piece to you like a pet, one bite at a time. Once or twice you catch a finger between your lips, sucking on them as she pulls her hand away. When you’re finished you lie down full of food and semen and try to get a real night’s worth of sleep.");
	processTime(55 + rand(11));
	pc.changeLust(100);
	// Next Scene
	//[Next] [Bail]
	//Tooltip Next: Proceed with the simulation.
	//Tooltip Bail: You’ve had enough of this simulation and you want out.
	clearMenu();
	addButton(0,"Next",fightNight4A,exhibition,"Next","Proceed with the simulation.");
	addButton(14,"Bail",simmOutro,exhibition,"Bail","You’ve had enough of this simulation and you want out.");
}

// Part 4A - The Bad End Fight Night Edition
public function fightNight4A(exhibition:Boolean):void
{
	clearOutput();
	showName("FIGHT\nNIGHT");
	author("RequiemForAMeme");
	output("The next morning Seylia returns to you with news of your trial by combat.");
	output("\n\n<i>“You will fight against our chieftain.”</i> Seylia tells you. <i>“Do you wish to withdraw?”</i>");
	output("\n\n<i>“That’s sounds interesting. Do you mind telling me the details of the fight?”</i> You ask. <i>You don’t hide the fact you’re staring at her dick.</i> <i>“I doubt it’s a fight to the death, seeing as life as a slave is an outcome. You even referred to it as ceremonial.”</i>");
	output("\n\n<i>“There is an arena built upon a shallow, but wide, river. The waters remain clear despite any blood or other fluids that enter it. You and our chieftain will fight there.”</i>");
	output("\n\n<i>“Is there anything special about the fight?”</i> <i>You wonder is Seylia tastes differently than the guard you serviced last night.</i>");
	output("\n\n<i>“Your goal will be to pin your opponent and mark them with your seed... Each of you will be prepared for the fight beforehand.”</i> Seylia sees you focusing solely on her dick. <i>“Dixon!”</i>");
	output("\n\n<i>“Yes? I’m sorry. Can you explain it again?”</i> <i>It’s not your fault her dick looks so distracting.</i>");
	output("\n\n<i>“You must pin our chieftain and mark either her lower entrances with your seed. You must ejaculate fully and completely to succeed as well. Anything less and the fight will continue. Now do you accept the terms of the fight?”</i>");
	output("\n\n<i>“Yes.”</i>");
	output("\n\n<i>“The fight will be several hours from now. You will be given one last meal then brought to the arena as the sun reaches it’s zenith.”</i>");
	output("\n\nWith nothing else to say Seylia leaves. A couple hours later you are brought a full course dinner of various foods. After eating just enough to keep your energy up, but not enough to slow you down, you are freed from the cage and moved to the arena. The journey is long, but you were brought by some kind of windowless carriage pulled by who knows what.");
	output("\n\nWhen you arrive at the arena, you are brought to a private room with several guards to watch you. Seylia enters some time later. <i>“I am here to prepare you for the fight. Each combatant undergoes this preparation in front of witnesses. In your case the guards to make sure you do.”</i>");
	output("\n\nWithout another word, four guards lift and suspend you by your limbs. Seylia then gets to work first by grabbing a nearby urn and pouring out a handful of purple lotion. She applies the lotion to her hands then massages your cock until you’re hard. She continues to rub the lotion into your shaft until it throbs painfully.");
	output("\n\n<i>“The fuck you doing?”</i>");
	output("\n\nSeylia says nothing. She cleans her hands and grabs another urn. This time she applies some kind of blue gunk to her hands. The guards then spread your legs for her to reach your taint. Before you can protest a gag is placed in your mouth and Seylia starts applying the gunk to your anus.");
	output("\n\nYou moan in protest even as she fingers your needy ass. She starts with one digit and works her way up to four. With each extra finger added your moans become less pain filled and more lustful. You feel the strange gunk begin working as you feel your ass loosen up accept more of Seylia’s hand. Your cries are muffled as she prepares your rectum. <i>You need a cock in you ass right now!</i>");
	output("\n\nSeylia then finishes and motions for the guards to take you away. They carry you to a closed wooden gate and remove your gag. They tell you not to touch yourself or it will be easier for their chieftain to win.");
	if(exhibition) output("\n\nA series of numbers and letters are displayed on the gate: Views - " + (88 + rand(5)));
	output("\n\nYou dryly swallow and muster up what little willpower you have left. This is your one chance to escape, <i>or get fucked like a needy anal slut.</i> The gate lifts open, and the guards usher you outside. You step into a shallow river surrounded by viewing stands on either side.");
	output("\n\nOn the other side of the river is giantess of an amazon. He long golden hair flows in the wind, her muscles glisten with sweat and water, and her ribbed cumleaking cock is a fully erect eighteen inches. You hear a voice shout: <i>“BEGIN!”</i>");
	output("\n\nYour eyes snap onto the two bouncing titanic melons charging at you. The amazon immediately grapples you. <i>“I am Hippolyta, Chieftain of the Amazons,”</i> she declares.");
	output("\n\nYou manage to slip out of her grasp and roll into the sandy river. However as you get up, a single arm wraps around your torso. With her free hand Hippolyta, grabs your shaft and starts rubbing. You feel your hollow ass squeze down upon nothing as you quickly cum from Hippolyta’s handjob.");
	output("\n\nShe drops you unceremoniously into the river as she receives cheers from the stands. As she basks in their attention, you take the moment to trip her and force her onto her knees. With one swift motion you manage to get her on all fours and mount her. You instantly see her pussy and ass are ready for you, all you have to do is decide. <i>But how is your ass supposed to feel good if you’re only using your cock?</i>");
	output("\n\nIn your moment of indecision, Hippolyta turns and throws you back. She abruptly grabs you by your legs, lifts, and twists you around until you’re upside down. She pins your waist with her arms and turns you towards one of the stands. As you try to regain focus and think of a way to escape the grapple you feel something long and limber enter your ass.");
	output("\n\nBy the time you realize Hippolyta’s tongue is deep in your backdoor you’re already bucking your hips and wailing lustfully. With her perfect tongue-work you cum again just from having your ass teased. You splatter your own face with your semen and yet you’re still achingly hard.");
	output("\n\nDelirious from two back to back orgasms, you offer no resistance as Hippolyta flips you back upwards. Hippolyta walks you towards the other stands, all the while keeping the head of her ribbed majesty teasing your deprived rear. When she finally reaches the stands, she lowers you just enough for the crown of her dick to firmly press against your pucker.");
	output("\n\nAs you’re about to cry out for her to fuck your ass when you see your crew in the stands. Each of them are mounted atop an amazon, their faces caught in pleasure and agony, their bellies distended from being fucked full of cum. Though they see you being grappled by Hippolyta all they do is howl like animals in heat.");
	output("\n\nYou relax in Hippolyta’s grip, which she takes as a signal to lower you all the way down. Her ribbed length stretches your rectum and you feel completely full before she even bottoms out. When you finally stop sinking, her cock engorges as a flood of baby batter surges up from her hefty balls.");
	output("\n\nShe’s not even finished with her first ejaculation by the time your abdomen starts to swell. She leans in close and whispers. <i>“You’re not leaving this river till I’m satisfied. In fact, you might not even leave my dick unless I’m about to fuck someone else.”</i> You spasm as she uses you as a human cock sleeve. She parades you all around the river while she fucks you full of her second, third, fourth, and fifth load.");
	output("\n\nAfter the fight Hippolyta decided to keep you and your crew around for the tribe to use as cum dumps. Though Hippolyta and a certain guard use you more than the others; and you love every moment of it.");
	processTime(55 + rand(11));
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	// End Scene
	// Simulation End Text
	// Return PC to lobby
	clearMenu();
	addButton(0,"Next",simmOutro,exhibition);
}

// Part 2B - Bath Time
public function amazoniaBathTime2B(exhibition:Boolean):void
{
	clearOutput();
	showName("BATH\nTIME");
	author("RequiemForAMeme");
	output("You enter the bath chamber and notice the walls and murals seem to indicate that the bath is used for a coming of age ritual. You believe it says something along the lines of young girls are not considered a mature women until they complete the ritual. Sometimes they enter with an entourage of guests and other times it’s only them. Apparently during times of celebration the temple opens up to all the tribe and all of the chambers are used for a great festival... which appears to be a giant orgy.");
	output("\n\nAs you finish cataloguing the room you send a report back to the ship and rest for a while. You strip yourself of your gear and enter the bath, but you make sure that your trusty laser revolver is nearby. You don’t want to be caught unarmed after all.");
	if(exhibition) output(" A series of numbers and letters are displayed along one of the murals: Views - " + (26 + rand(4)));
	output("\n\nYou submerge yourself up to your neck. The cool water removes the layers of sweat you built up on your way to the temple. Your muscles quickly relax as you drift about the bath. Eventually you find a good spot near the edge to rest and close your eyes.");
	output("\n\nYou daydream about the discovery you’ve made today, and about how it will make you even more famous. You also think about what you should do to treat your crew; a simple party is out of the question. It needs to be huge, but intimate. Maybe dinner, drinks, and then <i>come back here</i> for one long celebratory fuck. Yeah, that sounds great...");
	output("\n\nAs you are daydreaming about an orgy starring you and your crew you realize that your cock is fiercely erect. You lazily open your eyes to see your body floating in the water and your dick swaying in the water with it. You move your oh-so-heavy arms and begin stroking, but after the first few it just doesn’t feel right.");
	output("\n\nYou let go of your manhood and allow your arms to just float in the water. That feels right. You stare mesmerized at the sight of your schlong as it seems to thrust up with your hips. Huh? You’re not moving your body, you’re way too tired for such physical stress. You strain your neck and tear your eyes away from your magnificent cock to look below the water.");
	output("\n\nSome kind of strange black snake thing is between your legs. <i>The way it wiggles is just so mesmerizing.</i> Your eyes dart back and forth between the sway of your cock and the black snake. It must be massaging your prostate! That’s so nice of it. You didn’t even feel it enter your anus. How weird. What a coincidence too, here you were just thinking how nice it would be to get your prostate - No, how <i>amazing it would be to get your ass fucked.</i>");
	output("\n\nAs you think you couldn’t feel any better the black snake disappears from view and your cock spasms as you climax. Seed gushes from your dick as your hips buck up and down. Your mind goes blank as you stare at your phallus pump out more and more of it’s load. Your eyelids grow heavy and close as your balls continue to empty themselves.");
	output("\n\nAs sleep begins to take you, you hear the voices of women approaching. But you just know that they’ll take <i>good</i> care of you.");
	processTime(55 + rand(11));
	pc.orgasm();
	// Next Scene
	//[Next] [Bail]
	//Tooltip Next: Proceed with the simulation.
	//Tooltip Bail: You’ve had enough of this simulation and you want out.
	clearMenu();
	addButton(0,"Next",trainingWith3B,exhibition,"Next","Proceed with the simulation.");
	addButton(14,"Bail",simmOutro,exhibition,"Bail","You’ve had enough of this simulation and you want out.");
}

// Part 3B - Training
public function trainingWith3B(exhibition:Boolean):void
{
	clearOutput();
	showName("\nTRAINING");
	author("RequiemForAMeme");
	output("Your eyelids feel like lead as you struggle to open them. Your thoughts are cloudy. It’s really hard to think after such a long nap. You lie up on a wooden cot and look around the hut you’re in. You see your clothes in a pile next to the cot, but the pockets all appear to be empty.");
	output("\n\nYou <i>giggle</i> as you realize that you’re naked. You begin to put on your shirt, but realize someone made it bigger. It ends a bit below your waist now and doesn’t cling against your chest or muscles like it used to. You then put on your pants, luckily you never needed a belt. You pull your pants up above your waist, then watch them fall to the ground as you let go. Wait, of course you need a belt, but it doesn’t hurt to check. You pull your pants up and drop them several more times, each time giggling as they hit the ground.");
	if(exhibition) output("\n\nA series of numbers and letters are displayed around the ceiling of your hut: Views - " + (42+rand(4)));
	output("\n\nThat’s when a bronze skinned beauty enters the hut. She stands a few inches taller than you, her golden hair is cut short, and her eyes are the color of precious amber. Her body is covered by a dress made of flowers and leaves, but little is hidden. Her breasts are easily D cups, her hips are wide, and her ass firmly round. Her body is curvy and thick with muscle. But what really draws your gaze is her foot long, fully erect, and ribbed cock.");
	output("\n\nShe hands you your translator then speaks once you seem to have it working. <i>“I am Seylia. You are?”</i>");
	output("\n\n<i>“I’m Dixon,”</i> you say. Is your voice higher?");
	output("\n\n<i>“You trespassed. You entered our sacred temple without permission. You would normally have been put to death.”</i>");
	output("\n\nYou gasp, that’s not good. <i>“But I’m here? Alive and well?”</i> you ask.");
	output("\n\n<i>“Yes. The Goddess chose you. We priestesses determined you were sent by the Goddess to be our Chieftain’s. I am to train you and your body to be worthy of her.”</i>");
	output("\n\nYou have so many questions. You have so many reasons to tell her and their tribe no. But as you continue to stare at her rigid dick all that comes out of your mouth is: <i>“That sounds great! When can we start?”</i>");
	output("\n\nSeylia smiles and says: <i>“At once! But it will take some time as you body fully adjusts.”</i>");
	output("\n\nTrue to her word, your ‘training’ started immediately. First you were forbidden from touching your shrinking six inch dick. If you wanted to ejaculate you needed to request a priestess to suck you off. Given your small, size most of the priestesses would tease you before performing their duty. Each time it felt more and more pleasurable, and each time you would pop off earlier and earlier. You were told it had to do with their saliva.");
	output("\n\nSecond, you were to eat only what they provided you; specific fruits and meats, along with a special brew which smelled heavily of semen. Quickly your skin became soft and smooth and your breasts grew into B cups. Sadly your chest didn’t come close to any of the amazons, especially the priestess’, but you well up with pride when you look at them.");
	output("\n\nThird was the training of your body. Your ass and mouth were stuffed with cock or dildos day and night. Seylia explained that their chieftain is the largest in the tribe and she required properly trained holes to fulfill her needs. But no matter how hard you were fucked in the ass you weren’t able to climax like you first did in that bath so long ago.");
	output("\n\nWeeks and months passed as you were trained to suck and fuck. Each time you were fucked into the ground by a priestess you rode a pleasure high, but never had an orgasm. You always need your four inch prick to be gobbled up by one of the priestesses to get off. Then you realize one day that none of the priestess have ever cum inside you, not even in your mouth.");
	output("\n\nThe question bothered you for days until you decided to just ask. <i>“Seylia?”</i> you say.");
	output("\n\nSeylia looks up at you, her lips firmly sucking the base of your tiny tool. She drags her mouth up allowing your cute little cock to plop out. <i>“Yes? Are you close? Did you want me to slow down?”</i>");
	output("\n\n<i>“No, it’s not that.”</i> You say as you shift positions. <i>“Why haven’t any of the priestesses marked me with their seed? Is it part of my training?”</i>");
	output("\n\nSeylia looks at you with surprise. <i>“Only the chieftain is allowed to mark you. We are all forbidden,”</i> she explains.");
	output("\n\n<i>“What do you all do then? I know from how you’ve all fucked me that you have to be close when you stop.”</i>");

	output("\n\n<i>“We uh, we use one of our prisoners to relieve ourselves. They can, volunteer, for different services and if they do enough for the tribe they can be released and join us.”</i>");
	output("\n\n<i>“But not even my mouth pussy?”</i> You plead with a sudden thirst overtaking your mind. <i>“I know you feed me different semen when I eat. So why not mark my throat?”</i>");
	output("\n\nSeylia turns her face away. She stutters and tries to speak, but can’t find the words. Without looking at you she tries to get up and leave.");
	output("\n\n<i>“No you don’t!”</i> You say mischievously. You wrap your arms around her waist and twist her back onto your cot. You have her lay down, while you crawl towards her crotch.");
	output("\n\n<i>“What are you doing?”</i> Seylia calls out.");
	output("\n\nYou don’t answer her, at least not with words. You drag your tongue up her ribbed length and kiss the crown with your puckered lips. Seylia gasps as you take her cock into your mouth. You expertly play with the head using your lips and tongue. You keep teasing her until she’s panting and her voice turns into hushed whispers. <i>“More. Please more. Don’t stop,”</i> she stutters quietly.");
	output("\n\nYou plunge her cock down your throat. Each ribbed section that passes down elicits a moan from the both of you. You move your head up and down her rigid pleasure stick, slowly increasing in speed. Each time you reach the crown you let it slip from your mouth only to kiss it and slam your face back down into her crotch.");
	output("\n\n<i>“Goddess, forgive me!”</i> Seylia cries out as she grabs your head and holds it in place. Her cock expands and erupts, pumping her seed down your throat. She thrusts her hips in tandem with the climax.");
	output("\n\nYou slide your wonderfully abused maw off of her cock. A thrill rushes through your body. In a daze you watch Seylia sit and stand up; her dick is still rigid despite your oral affection. Seylia caresses your cheeks and pulls your lips back towards her cock head.");
	output("\n\nSeylia continued to use your mouth and throat as her personal cum dump for the next several hours. Eventually another priestess caught her pumping her sixth or seventh load down your gullet; your stomach distended and looking many months pregnant. Seylia was taken away and the only time a priestess would visit you afterwards was to provide you with food.");
	// Next Scene
	//[Next] [Bail]
	//Tooltip Next: Proceed with the simulation.
	//Tooltip Bail: You’ve had enough of this simulation and you want out.
	processTime(55 + rand(11));
	clearMenu();
	addButton(0,"Next",badEndBedBitch,exhibition,"Next","Proceed with the simulation.");
	addButton(14,"Bail",simmOutro,exhibition,"Bail","You’ve had enough of this simulation and you want out.");
}

// Part 4B - The Bad End Bottom Bitch Edition
public function badEndBedBitch(exhibition:Boolean):void
{
	clearOutput();
	showName("BOTTOM\nBITCH");
	author("RequiemForAMeme");
	output("You awaken from a fitful, lust filled sleep. Nearly two weeks have passed since you last saw Seylia. Your short penis aches with the need for release, but you can’t bring yourself to touch it. It’s taken what little willpower you have left to not break, you know if you start masturbating you won’t be able to stop.");
	output("\n\nBefore your mind begins to wander too far a priestess enters your hut. Her cock bounces at attention, <i>it looks so good!</i> She says something, but all you care about is how good it would feel to get your mouth and ass reamed by her. She grabs your chin and stares into your eyes. She smells like sweat and sex. You feel your mini dick squirt a little precum as her scent overwhelms you.");
	output("\n\nYou think you hear her say: <i>“You’re ready.”</i>");
	output("\n\nThe priestess places a blindfold over your eyes and then calls for assistance. Shortly after you feel yourself being carried away from your hut. It’s been so long since you’ve felt the sun on your skin. You think about how pale and blinding your skin must be compared to the amazons carrying you.");
	output("\n\nThere’s some kind of festival going on as you keep moving. Hours pass in utter agony as they carry you. The further you go the more voices you hear. You’re surrounded by the noise of revelry and screams of sex. Each moan and gasp resonates through the crowd and makes you squirm with need.");
	output("\n\nSuddenly the noise grows quiet and all you hear are the sounds of footsteps. You’re in some hallway, it doesn’t take long to reach your destination either. You hear the sound of stone being dragged against stone. Some large door opening? You’re then brought into a room filled with the sounds of groups of people fucking, and set down upon a soft cushion.");
	output("\n\nThe blindfold is removed and in front of you is Seylia. She is mounted on the lap of an amazon nearly two heads taller than her. Seylia’s face is caught in a mix of pain and pleasure; her mouth hangs open, her tongue lolls out, and tears stream down her face. Her body is covered with semen and seeing her fervently pump her shaft it’s not hard to guess where it came from. Her stomach is bloated to the point that she looks like she’s in the final stages of pregnancy.");
	output("\n\nThe amazon with her dick lodged in Seylia grabs her and slowly lifts her up. Seylia thrashes about while letting out incoherent whines of displeasure. You gaze up, mesmerized at the majesty of the cock that Seylia is pulled off of. A full eighteen inches of beautifully ribbed meat slathered with cum. Seylia is handed off to two other amazons who quickly plug her cunt and ass with their cocks.");
	if(exhibition) output("\n\nA series of numbers and letters are displayed above the Amazon: Views - " + (88 + rand(5)));
	output("\n\n<i>“Greetings.”</i> The giantess with the perfect tool says. <i>“I am Hippolyta, chieftain of the Amazons.”</i>");
	output("\n\n<i>“I- I- I am...”</i> you stumble over your words as you stare transfixed at Hippolyta’s throbbing rod.");
	output("\n\n<i>“You will need a new name now that you’ll be a member of the tribe.”</i>");
	output("\n\n<i>A new name? That sounds great!</i>");
	output("\n\n<i>“You will be known as Diana,”</i> Hippolyta decrees.");
	output("\n\n<i>Hearing her give you your new name sends a wave of pleasure through your body. Now all you need is for her to command you to get on your knees with your ass up high.</i>");
	output("\n\n<i>“Come closer Diana. It is time you took your place in the tribe.”</i>");
	output("\n\nYou stumble forward into Hippolyta’s lap, your legs feeling like rubber. Your ass burns with a need to be filled by her. Your face stops just out of tongue’s reach of her ribbed cock. Her aroma nearly overpowers you, nearly causing you to black out from all the sensations.");
	output("\n\nHippolyta lifts you from the floor, her rough hands carefully caressing your soft skin. With one hand she slips a finger into your painfully hollow backdoor. You clench down and nearly orgasm right then.");
	output("\n\n<i>“You poor thing.”</i> She says stroking your face. <i>“You must feel like you’re ready to burst.”</i>");
	output("\n\nYou can only nod as your hips rock back and forth on her hand.");
	output("\n\n<i>“You needn’t worry about that any longer, Diana.”</i>");
	output("\n\nHippolyta withdraws her finger from your pucker, eliciting a whine from you. She lifts you up once again and angles you above the tip of her pulsating cock. You look at her, pleading with your eyes as all words escape you in the heat of the moment. She guides you down her girthy pole, one ribbed section at a time. Even with all the training your ass received, she still feels far too large.");
	output("\n\nYou let out one incoherent babble after another as she drags you downward. When she bottoms out and is fully inside you, you climax. You ejaculate sending your seed all over each others breasts. Hippolyta howls in a fit of lust as she brings you in for a deep kiss and starts bouncing you on her lap.");
	output("\n\nHer cock milks your prostate for all it has. Each time you slam back down more of your spooge is forced out of your cute little phallus. You become lost in pleasure as Hippolyta drills into your rear end. Although she fondles your body carefully, it is clear that you are her personal cock sleeve, <i>now and forever.</i>");
	output("\n\nHer first orgasm distends your stomach as you ride atop her lap through it all. Each thrust and pulse of warm cum into your rectum causes your dick to spray more of your own alabaster goo. When she’s finished she turns you around and starts again.");
	output("\n\nFor the rest of that day and night Hippolyta had her way with you and the tribe. Her lust seemed insatiable, she would fuck one hole after another. But in the end she would become frustrated as no one else could get her off as much as you. She always returned to you to take the edge off and experience a proper orgasm. By the end of the night you were completely filled and covered with her seed.");
	output("\n\nUp until that point, you had forgotten about your crew. At least until you saw them in orgasmic bliss, relieving members of the tribe. They looked like they were having so much fun that you asked your chieftain if she would fuck you in front of them. As the months pass, you become dependent on Hippolyta and her cock. Eventually she just started carrying you around mounted on her dick. <i>You couldn’t care less about being an explorer, this life suits you so much more.</i>");
	// End Scene
	// Simulation End Text
	// Return PC to lobby
	processTime(55 + rand(11));
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",simmOutro,exhibition);
}