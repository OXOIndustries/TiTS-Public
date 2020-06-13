import classes.Characters.PregnancyPlaceholder;
//Verusha the Hyena Mercenary
//by Doots (edited by Vio :3c and Ild.)

public function showVerusha(nude:Boolean = false):void
{
	var nudeS:String = (nude ? "_NUDE" : "");
	showBust("VERUSHA" + nudeS);
	showName("\nVERUSHA");
	author("Doots");
}

public function verushaPP():PregnancyPlaceholder
{
	var ppVerusha:PregnancyPlaceholder = new PregnancyPlaceholder();
	ppVerusha.removeCocks();
	ppVerusha.createCock(21, 1.2);
	ppVerusha.shiftCock(0,GLOBAL.TYPE_CANINE);
	ppVerusha.cocks[0].cockColor = "black";
	ppVerusha.balls = 2;
	ppVerusha.ballSizeRaw = 13;
	ppVerusha.createPerk("Fixed CumQ",27000,0,0,0);
	ppVerusha.removeVaginas();
	ppVerusha.createVagina();
	ppVerusha.vaginas[0].loosenessRaw = 1;
	ppVerusha.vaginas[0].wetnessRaw = 3;
	ppVerusha.vaginas[0].bonusCapacity = 40;
	return ppVerusha;
}
//Used for a few small mouthfuls of jizz and such
public function verushaSmolPP():PregnancyPlaceholder
{
	var ppVerusha:PregnancyPlaceholder = verushaPP();
	ppVerusha.removePerk("Fixed CumQ");
	ppVerusha.createPerk("Fixed CumQ",500,0,0,0);
	return ppVerusha;
}
public function verushaCapacity():Number
{
	return 100;
}
public function verushaCockVolume():Number
{
	return verushaPP().cockVolume(0);
}

//SEXED_VERUSHA
//[Appearance]
public function verushaAppearance():void
{
	clearOutput();
	showVerusha();
	//If PC has never met her: 
	if(flags["MET_VERUSHA"] == undefined) output("The hyena");
	else output("Verusha");
	output(" is nine feet and eight inches of strong");
	if(flags["SEXED_VERUSHA"] != undefined) output(", dominant");
	output(" hyena, towering above the raskvel and other patrons.");

	output("\n\nThe entirety of her body is covered in coarse, light brown fur, with dark brown stripes adorning her back and limbs. A pair of hyena-like ears swivel back and forth atop her head, and a tall black mohawk sits between them.");
	output("\n\nHer left eye is a metallic, softly glowing cybernetic replacement, while her remaining right eye is a deep, dark red. She stares right back at you, and her organic eye seems to bore straight into you. Her muzzle is covered in scars, even a piece of her lip is missing, showing the canine tooth below it.");
	output("\n\nHer right arm is replaced by a heavy looking metallic limb; and while her left arm is biological, it’s far from looking like the rest of her body. Instead of having the same dark brown stripes that cover the rest of her it’s covered in black tribalistic-looking lines that flow and course along her arm.");
	output("\n\nThe front of her chest is covered in light brown fur, starting from her collar bones and ending down at her crotch. Instead of wearing something to cover her E-cup breasts she keeps them in full view of anyone glancing her way, and from the way she’s sitting you doubt that she minds if you steal a glance of the black nipples capping of both breasts. Her body is heavily muscled, not that of a bodybuilder, but more akin to someone who spends days doing hard labor. While she has her torso on display she still wears pants. Desert camouflage cargo pants, to be exact. She has made a crude hole just below her belt allowing her brown tail to come through. She has ripped the left leg of her pants off, revealing a cybernetic limb similar to her right arm. The remaining part of the ripped pant leg covers up her thigh, leaving it to your imagination where it ends. She wears a combat boot on her right foot, probably to compensate for the difference in length between her cybernetic and real leg. Her pants are held up by a leather belt, which holds a sheathed knife and an weathered, old looking ballistic handgun.");
	output("\n\nBetween her legs you notice a quite sizable bulge, and it doesn’t take a genius to know why. You stare at the bulge until she brings her hand down to squeeze it, causing your eyes to shoot back up. Looking into her own, she has a broad grin on her face, which makes you ");
	if(pc.isBro()) output("grin, knowing that she appreciates your body");
	else output("blush");
	output(".");

	output("\n\n");
	if(flags["SEXED_VERUSHA"] != undefined) output("Having been in her pants you know that the bulge is created by a 21 inch long sheathed black canine dick, which is four inches thick. It’s accompanied by a six-inch uninflated knot. You know from experience that her knot reaches a whole eight inches upon climax. There is a row of golden piercings that run down the front of her prick along the urethra, starting at the head and ending right at the base. This creates a lewd, glimmering Jacob’s Ladder which happens to massage the insides of any hole it’s inserted into. The light brown fur reaches down to her sheath and hand-filling balls which fuel her canine dick, she also has a juicy black cunt hidden behind them.");
	clearMenu();
	addButton(0,"Next",approachVerusha);
}

public function verushaBonusFunc(butt:Number):Boolean
{
	if (flags["VERUSHA_APPEAR_DISABLE_TILL"] != undefined && flags["VERUSHA_APPEAR_DISABLE_TILL"] > GetGameTimestamp()) return false;
	//[Hyena] (Scene description before talking to her)
	if(flags["MET_VERUSHA"] == undefined)
	{
		output("\n\nThere is a topless hyena playing five-finger fillet at the bar and taking a shot between every round.");
		addButton(butt,"Hyena",approachVerusha,false);
	}
	//[Verusha] (Scene description after talking to her)
	else
	{
		output("\n\nVerusha is at the bar again. When she notices you she grins and makes a lewd gesture your way. It’s not hard to guess what she’s thinking.");
		addButton(butt,"Verusha",approachVerusha,false);
	}
	return false;
}

public function approachVerusha(back:Boolean = true):void
{
	clearOutput();
	showVerusha();
	//[First approach]
	if(flags["MET_VERUSHA"] == undefined)
	{
		output("You decide to check up on the hyena playing five-finger fillet at the bar. You walk up next to her and greet her. She ignores you until you greet her again only louder this time.");
		output("\n\nShe slams the knife next to your hand, looking directly into your eyes and growling at you, <i>“What do you want?”</i>");
		output("\n\n<i>“A bit aggressive, aren’t you? I’m not here to annoy you.”</i>");
		output("\n\n<i>“Whatever. As long as you’re not here to preach.”</i>");
		output("\n\n<i>“[pc.name] Steele,”</i> you introduce yourself.");
		output("\n\n<i>“Steele, huh? Yeah, I know you. Steele Tech’s CEO, right?");
		if(pc.characterClass == GLOBAL.CLASS_MERCENARY) output(" You used to be a merc, right? Looking at you, seems like you were a pretty good one, too. You’re alive, that’s more than some can say.");
		output("”</i>");
		output("\n\nShe’s quiet for a moment before opening her mouth. <i>“If you’re the " + pc.mfn("son","daughter","offspring") + " of a CEO, why are you here on the frontier? More accurately, why are you talking to a </i>filthy<i> merc? I’m not for hire right now.”</i>");
		output("\n\n<i>“I’m not looking to hire, and I’m on the frontier because my dad wanted me to have a similar experience to his so I can run the company in his footsteps. And you just happened to catch my eye.”</i>");
		output("\n\n<i>“It would be unfair if I didn’t at least tell you my name after that. Verusha. And now that you know my name you can piss off.”</i> Despite her telling you to piss off she openly leers at your body, her face flicking over your [pc.lipsChaste], [pc.breasts], and down to your groin. She isn’t being exactly subtle about wanting to fuck you.");
		output("\n\nNow that you’re on first name basis you could try to talk to her, or you could just leave her to her business.");
		flags["MET_VERUSHA"] = 1;
	}
	//Backing out of another menu:
	else if(back)
	{
		author("Fenoxo");
		output("Verusha taps a finger impatiently as you change your mind.");
		verushaMenu();
	}
	else if(pc.tallness > 9*12)
	{
		output("Verusha manages to catch your attention, so you walk up to her.");
		output("\n\nWhen you reach her she slightly nods with disinterest.");
		output("\n\nVery much like the first time, she’s very eager for a fuck and not so eager to talk, but you could at least try.");
	}
	//[Repeat approach]
	else
	{
		output("Verusha manages to catch your attention with her lewd gesture. So you walk up to her, bearing her gestures along the way.");
		output("\n\nWhen you reach her she grins and carelessly gropes at your groin.");
		if(flags["SEXED_VERUSHA"] != undefined) output(" <i>“Back for another round, are we?”</i>");
		else output(" <i>“So, are you going to let me tap that ass?”</i>");
		output("\n\nDespite the force behind her groping, she doesn’t take it further. She waits for you to decide where to take this.");
		output("\n\nVery much like the first time, she’s very eager to fuck and not so eager to talk, but you could at least try.");
	}
	processTime(2);
	verushaMenu();
}

public function verushaMenu():void
{
	clearMenu();
	addButton(14,"Leave",mainGameMenu);
	addButton(0,"Appearance",verushaAppearance);
	if(flags["VERUSHA_TALKS"] == undefined) addButton(1,"Talk",talkToVerusha,undefined,"Talk","Get her to talk about herself for a bit.");
	else if(flags["VERUSHA_TALKS"] == 1) addButton(1,"Talk",talkToVerusha,undefined,"Talk","Last time didn’t exactly go as planned but you’re not going to let that stop you.");
	else if(flags["VERUSHA_TALKS"] == 2) addButton(1,"Talk",talkToVerusha,undefined,"Talk","Some might call this being headstrong but you might as well try a third time.");
	else addButton(1,"Talk",talkToVerusha,undefined,"Talk","Talk to her some more, why not?");
	if(flags["VERUSHA_GROPED"] == undefined) addButton(2,"Grope",gropeVerusha,undefined,"Grope","This is probably a bad idea.");
	else addDisabledButton(2,"Grope","Grope","Even the galaxies most vapid, air-headed bimbo bunny would know this is a bad idea.");
	if(pc.lust() < 33) addDisabledButton(3,"Sex","Sex","You aren’t turned on enough for that.");
	else addButton(3,"Sex",sexWithVerusha);
}

//[Talk] (first time only)
//Tooltip: Get her to talk about herself for a bit.
public function talkToVerusha():void
{
	clearOutput();
	showVerusha();
	if(flags["VERUSHA_TALKS"] == undefined)
	{
		output("At the merest mention of talking about her, her muzzle twists into a scowl and she growls at you, <i>“That’s none of your business, Steele.”</i>");
		output("\n\nWell, that didn’t go as expected. Despite her reluctance, you could probably push the issue if you wanted to.");
		//(back to interaction menu and disable [Talk] for four hours)
		processTime(1);
		flags["VERUSHA_TALKS"] = 1;
		flags["VERUSHA_TALK_DISABLE_TILL"] = GetGameTimestamp() + 60*4;
		verushaMenu();
	}
	//Having talked to her within 24 hours
	else if(flags["VERUSHA_TALK_DISABLE_TILL"] != undefined && flags["VERUSHA_TALK_DISABLE_TILL"] > GetGameTimestamp())
	{
		output("<i>“Enough is enough Steele.”</i>");
		output("\n\nShe seems to be at her limit and her tone leaves no room for convincing her to continue talking. She even declines when you offer her a drink.");
		output("\n\nPerhaps you should try again tomorrow, give her time to open up again.");
		processTime(1);
		verushaMenu();
	}
	//[Talk] (second time only and disabled if pc has attempted to talk her during current interaction)
	//tooltip: Last time didn’t exactly go as planned but you’re not going to let that stop you.
	else if(flags["VERUSHA_TALKS"] == 1)
	{
		output("Despite her previous reluctance and her not so friendly way of telling that she’s not interested in talking about herself, you decide to push it further.");
		output("\n\n<i>“Didn’t I tell you that’s none of your business, Steele?”</i>");
		output("\n\nSeems like she won’t open up about herself to you yet, but you are making progress, or at least you think you are.");
		//(back to interaction menu and disable [Talk] for four hours)
		processTime(2);
		flags["VERUSHA_TALKS"] = 2;
		flags["VERUSHA_TALK_DISABLE_TILL"] = GetGameTimestamp() + 60*4;
		verushaMenu();
	}
	//[Talk] (Third time)
	//Tooltip: Some might call this being headstrong but you might as well try a third time.
	else if(flags["VERUSHA_TALKS"] == 2)
	{
		output("Giving it a third chance you approach the topic again.");
		output("\n\n<i>“How many times do I have to tell you, Steele? It’s none of your business.”</i> She seems to be getting exasperated at this point.");
		output("\n\nYou choose to push it: <i>“I’m going to keep asking until you answer.”</i>");
		output("\n\nShe sighs audibly, resting her head on her hand. <i>“You really are an annoying " + (pc.tallness < 116 ? "little " : "") + "thing, aren’t you?”</i>");
		if(pc.isAss()) output("\n\n<i>“Whether you like it or not, I want to get to know you. And I’m not taking a no for an answer.”</i>");
		else if(pc.isMischievous()) output("\n\n<i>“Oh, who knows? You said that it’s none of my business but I like making things my business.”</i>");
		else output("\n\n<i>“I actually want to get to know you. If I didn’t, why would I still ask you after what you said?”</i>");
		output("\n\n<i>“So, you actually want to know about me? You know that chatting up mercs isn’t really going to help you be a CEO, right?”</i>");
		output("\n\nMaybe, but why is she so hostile when talking about her?");
		output("\n\n<i>“It’s infuriating when people ask me something, but then don’t listen to a word I say. But if you want to know about me, I’ll take your word for it.”</i>");
		output("\n\n<i>“So, what do you want to know?”</i>");
		processTime(4);
		flags["VERUSHA_TALKS"]++;
		//[Her Past] [Pirates] [Mercenary] [Race]
		flags["VERUSHA_TALK_DISABLE_TILL"] = GetGameTimestamp() + 60*24;
		verushaTalkMenu();
	}
	//[Talk] (Fourth time and beyond)
	else
	{
		output("<i>“Again? If you wanted to fuck as much as you want to talk, you’d be the best [pc.race] ever. But I suppose I don’t have anything better to do than to satisfy your infinite curiosity. Well, we could be fucking, but someone is being drier than the wastes of Tarkus.”</i>");
		//[Her Past] [Pirates] [Mercenary] [Race]
		processTime(1);
		flags["VERUSHA_TALK_DISABLE_TILL"] = GetGameTimestamp() + 60*24;
		verushaTalkMenu();
	}
}

public function verushaTalkMenu():void
{
	clearMenu();
	addButton(0,"Her Past",verushaPastTalk);
	if(flags["VERUSHA_PAST_TALK"] != undefined) addButton(1,"Pirates",verushaPiratesTalk);
	else addDisabledButton(1,"Locked","Locked","You don’t know enough about her to ask this!");
	addButton(2,"Mercenary",verushaMercenaryTalk);
	addButton(3,"Race",verushaRaceTalk)
	addButton(14,"Back",approachVerusha);
}

//[Her Past]
public function verushaPastTalk():void
{
	clearOutput();
	showVerusha();
	output("<i>“Might as well start from the beginning.”</i>");
	output("\n\n<i>“From Terra, originally. Was born in a community that might as well be inbred with how much they shunned outsiders. Had a boyfriend once, didn’t last long. When dad found out, I was grounded for a month. And it wasn’t the no extranet kind of grounded, more like the locked in the basement kind of grounded.”</i>");
	output("\n\n<i>“Why were they so against outsiders?”</i> you wonder.");
	output("\n\n<i>“They thought that the outside world would corrupt their innocent little daughter, but look at me now.”</i> She gestures to her fur-covered, muscular form.");
	output("\n\n<i>“Did have its perks, all things considered. Dad hooked me up with a job in a corporation that I wouldn’t have been able to get otherwise. Nepotism at its finest, I guess? But my dad didn’t control the firm, he was in a high position but not that high. There were people outside the community working there. So, I got paired up with a handsome guy. Tanned, buff, blond hair, blue eyes, and a nice dick, though I learned that later. Eventually we grew close and started dating a while and I fell in love with him. Eventually, he suggested that we should move into the same apartment.”</i>");
	output("\n\n<i>“But after already having had a boyfriend before, I knew how my dad would react if he found out, so I was in a bit of a dilemma. On one hand I loved him, but on the other hand everyone I ever knew would denounce me and my parents would disown me and my dad would be looking for any excuse to fire me. But, in the end, I chose love and moved in with him and got a job in a different company. It was like a dream come true for the first few months, but then it came crashing down.”</i>");
	output("\n\n<i>“After a few months, he left me, glamour apparently wore off, and since the apartment was in his name I got kicked out on my ass. So, there I was: homeless, disowned, and stuck in a dead-end job. But I managed to hunt down a small apartment in a seedy neighborhood. The apartment room was the size of a broom closet, but at least it was dry. Unfortunately, it was the kind of neighborhood where if someone knocked on your door in the middle of the night, you were better off putting a bullet through the door and then seeing who was at it.”</i>");
	output("\n\nIf the neighborhood was so crime infested, how did she manage to get out and onto Tarkus?");
	output("\n\n<i>“Bought a gun and a personal shield and started looking for muggers, thieves, and other scums of society and took their ill-gotten gains for myself.”</i>");
	//Fen note: I still don't like this. It's not really a logical direction for your average PC to take
	if(pc.isNice()) output("\n\n<i>“I understand you defending yourself, but if you stole from them how were you any better?”</i>");
	else if(pc.isMischievous()) output("\n\n<i>“So, your plan was to sink to their level. Did they beat you with experience?”</i>");
	else output("\n\n<i>“So, instead of trying to do something about the problem you decide to perpetuate it? That’s real smart.”</i>");

	output("\n\n<i>“Well it made a better life for me, and it’s not like I feel sympathy for those people. Sure, I understood that they were in a desperate situation, but that doesn’t justify preying on the innocent. But, by living on the smallest budget i could manage and with the unorthodox source of extra income, I managed to scrounge up enough credits to buy a cheap ticket off-world. But that might have been the worst decision of my life. Since it was a shitty, cheap ship, it was easy picking for pirates.”</i>");
	output("\n\nShe pauses before ordering another drink. <i>“That’s enough for now. We’ll talk another time.”</i>");

	processTime(10);
	flags["VERUSHA_PAST_TALK"] = 1;
	clearMenu();
	addButton(0,"Next",approachVerusha);
}

//[Pirates] (requires having done [Her Past] before)
public function verushaPiratesTalk():void
{
	clearOutput();
	showVerusha();
	output("So, what happened to her after she left Terra?");
	output("\n\n<i>“Our ship got hijacked by pirates who snuck aboard the ship with concealed weaponry. They were looking for easy credits, anything to plunder, and slaves. Most of the people on the ship ended up as slaves, workers, or sex slaves. Some of the passengers were stupid enough to resist, earned a trip out of the airlock.”</i>");
	if(pc.isNice()) output("\n\n<i>“That must have been a horrible experience, but at least you’re alive.”</i>");
	else if(pc.isMischievous()) output("\n\n<i>“Hey, what doesn’t kill you makes you stronger, right?”</i>");
	else output("\n\n<i>“It was a mistake, the only thing you can do is learn from it.”</i>");
	output("\n\nShe ignores your comment, continuing without a pause. <i>“Apparently, I was pretty enough to be a sex slave, so I was treated better than the workers, but since I wasn’t a virgin the captain didn’t exactly forbid the crew from enjoying the slaves.”</i>");
	output("\n\n<i>“So, my plans for a new life were destroyed because of ");
	if(silly) output("the most evil and dangerous man in the world, Moo Manchu");
	else output("a group of scumbags who only cared about their own ass and a handful of credits");
	output(".”</i>");

	output("\n\n<i>“When we made it out from under the U.G.C’s nose, I, along with the other slaves, was brought to an auction to be sold like cattle.”</i>");

	output("\n\n<i>“I was bought by some business woman. She was almost like a twig, barely any fat or muscle on her. At first, I thought that she would be a better owner than some middle-aged, overweight businessman with a bald spot, but I was wrong. I have a hard time imagining a worse owner than her. She brought me to some sort of vacation home in the ass end of the galaxy.”</i>");
	output("\n\n<i>“The first thing she did when we arrived was force me down on my knees and make me suck her dick. It was almost twice as big as any of my exes and made me gag hard, not to mention the musk of it was strong enough to almost knock me out. Not that she cared, she just carelessly shoved it down my throat until I passed out.”</i>");
	processTime(10);
	clearMenu();
	addButton(0,"Next",verushaPiratesTalk2);
}

public function verushaPiratesTalk2():void
{
	clearOutput();
	showVerusha();
	output("<i>“When I woke up, I could taste the mixture of her cum and cock musk in my mouth, not that it was the most pressing matter on my mind, since she was balls-deep in my ass. Not that anal is a big deal to me now, but I was an anal virgin back then. Well, before she took it.”</i>");
	output("\n\n<i>“I would have tried to resist her, but she had hired some thugs to keep her safe. The kind of thugs that would put a New Texan bull to shame.”</i>");
	output("\n\n<i>“After she was done with me, she had her thugs throw me into a confined cell. It had bright white walls and a blaring sound that made it impossible to sleep, no doubt she tried to break me. She subjected me to the same treatment every time she wasn’t satisfied with me.”</i>");
	output("\n\nObviously she made it out of there, but how? If she was in the ass end of the galaxy in some businesswoman’s vacation home, surrounded by her thugs, how did she manage to escape?");
	output("\n\n<i>“Probably by luck. What I did was fucking stupid, but I made it.”</i> She chugs down the rest of her drink before ordering another and continuing.");
	output("\n\n<i>“After a few days, I realized that resisting her was a waste of time, so I bit my pride and started to play the role of a good bitch for her. Took a few years for her to fall for it, but eventually, she didn’t even keep her thugs around when she was fucking me, and even let me walk around the place freely.”</i>");
	output("\n\n<i>“She didn’t keep that many guards at the place during the night; who knows for what reason. Maybe they charged extra for night shifts? So, one night when she decided to take me out for one more round before turning in for the night, I pounced her and, uhh... opened up her mind a bit. Wasn’t hard since she was the smallest woman I’d ever seen. Took everything of use that she had on her and walked out. A few of the guards asked where she was. Told them she had gone to bed already and didn’t want to be disturbed. Good thing that they weren’t paid to think.”</i>");
	output("\n\n<i>“I took a bunch of shit from her office: creds, a key for some fancy-ass personal ship, jewelry, and an easy-to-conceal handgun and then booked it out of there as fast as I could. Thankfully, I didn’t run into any guards on my way to the ship, so I took the ship and a bunch of credits from her and made it out. Prayed to whatever higher being the entire way, and I made it, somehow.”</i>");
	processTime(10);
	clearMenu();
	addButton(0,"Next",verushaPiratesTalk3);
}

public function verushaPiratesTalk3():void
{
	clearOutput();
	showVerusha();
	output("<i>“Did you have any idea what you were going to do after you got out?”</i> you wonder.");
	output("\n\n<i>“No. I was basically winging it the whole way through.”</i>");
	output("\n\nSurely she didn’t just float through space with no destination in mind?");
	output("\n\n<i>“Well, of course I was trying to get under the watchful eye of the U.G.C., but beyond that I didn’t have a plan of what to do.”</i>");
	output("\n\n<i>“When I managed to get back to friendly space, I found my way to the nearest space station, where I found out that she had covered her tracks. Apparently, I was dead. Took me ages to deal with that shit; apparently seeing someone who is supposedly dead walking around isn’t convincing enough. When I got back to the book of the living, I sold the ship and the jewelry and bought a ticket to the nearest livable planet that wasn’t a total backwater shithole, this time making sure that the ship wasn’t pirate bait. It was an uneventful trip, thankfully.”</i>");
	output("\n\n<i>“When I made it planetside, I used the creds to buy a military-tier gun and a personal shield and looked up some work for hired muscle; no surprise that there was a lot of work for a hired gun on an untamed planet, every corporation was willing to throw credits at any two bit hack with a gun in order to try to get a leg up on the competition. After gaining a bit of a reputation for being a tough nut to crack with a death wish, my employer’s words not mine, my current company approached me with an offer: better jobs, bigger pay, but the jobs would be more dangerous. No more pushing around drunks from VIP’s, no more keeping the locals in line, instead jobs like hunting down pirates and dangerous criminals, securing important objectives, and other jobs that were fitting for an actual merc. When I realized that by working with them I could save someone from the fate I suffered, that was enough for me to sign up, well the credits certainly don’t hurt either.”</i>");
	output("\n\nShe orders a shot before waving you away. <i>“Now go suck some spacer’s dick or bury your face in some muff. I don’t care which, right now I want some time for myself.”</i>");
	//(end of interaction, talk option grayed out for 72 hours)
	flags["VERUSHA_TALK_DISABLE_TILL"] = GetGameTimestamp() + 60*72;
	flags["VERUSHA_PIRATES_TALK"] = 1;
	processTime(10);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Mercenary]
public function verushaMercenaryTalk():void
{
	clearOutput();
	showVerusha();
	output("How long has she been with her company?");
	output("\n\n<i>“Almost eleven years now. But I was an independent merc for about a year before joining.”</i>");
	output("\n\n<i>“So, you’re a mercenary. How has the life of a hired gun treated you?”</i>");
	output("\n\n<i>“Not well, considering that I’ve lost two limbs and an eye, but it’s better than what I had before I left Terra. Was on a job to secure some sensitive data, when we ran into resistance. Might have been other mercs or some militia for all I know, but they were some young kids, most of them didn’t even know how to handle a gun. Doesn’t really matter, they tried to stop us, that was all that mattered.”</i>");
	output("\n\n<i>“During the job, my shield took heavy punishment. It failed during the fight, and from what I had seen them using I thought that my armor could take it. Didn’t count on them being smart enough to prepare for an engagement. They had wired the place with some traps, nothing too nasty for the most part. But, one of them was a pretty heavy shrapnel bomb. It blew up in my face before I could do anything. Took off my arm and my eye with the shrapnel. Our medic had to drag me out with the help of few other guys. From what I hear, they had a ex-military sapper, gave us a whole lot of trouble, but he couldn’t stand alone against the rest of our men. The rookies faltered easily leaving him with no back-up.”</i>");
	output("\n\n<i>“You lost your arm and eye during an operation? How did you get your cybernetics then? I doubt that the your company has an intensive health care plan,”</i> you wonder while you look at her cybernetic arm.");
	output("\n\n<i>“Well, not exactly. We have a case-by-case basis where one of the commanders judges whether or not the investment’s going to be profitable. Since by that point I had been with them for long enough, they provided me with a basic cybernetic arm. Rookies almost never get cybernetics for free unless they show unprecedented talent in what they do.”</i>");
	output("\n\n<i>“When we were deciding the cybernetics, I chipped in with some credits since I wanted to have a sturdier cybernetic, something that I could use in close quarters.”</i> She turns it around, showing it to you. <i>“It doesn’t have a built-in knife, but it packs quite a punch.”</i>");
	output("\n\n<i>“Now, the eye was a son of a bitch since I could still work without an eye and it didn’t hamstring me as much as the missing arm did. The company didn’t pay for a replacement, I had to save up for it myself. Could have afforded a basic one on my average pay, but I decided to get an advanced one. It’s not a supercomputer or anything, but since it’s synced to my arm it can help me aim or calculate a grenade arc.”</i>");
	output("\n\n<i>“You lost your arm and eye in combat, but what happened to your leg? A similar story to your arm?”</i> You look at her metallic leg.");
	output("\n\n<i>“Not exactly. Was during a mission as well, but not in combat. Some corporate assholes hired us to retrieve some sensitive data from some banged up research building. Apparently, the reason they hired us was that the data could land them in some hot water. We were ordered to fire at scavengers, scavengers that took to that place like vultures to a corpse.”</i>");
	output("\n\n<i>“We had some rookie with us, a complete idiot. Tried to stab us in the back. Had him watch the entrance with the charges since the plan was to go in, grab the data, get out, and blow up the building.”</i>");
	output("\n\n<i>“The rookie thought that he could set off the charges and later come pick off anything worth selling. Where his plan failed is that our demolitionist didn’t fill the place with charges,the explosion only triggered a collapse, forcing us to retreat before we got the data.”</i>");
	output("\n\n<i>“During the retreat, part of the ceiling collapsed. Most of it was small rubble. But my leg got stuck under a large metal beam. We didn’t have the manpower nor the time to remove it. It was either get buried under the rubble or amputate the leg.”</i> She pats her metallic leg. <i>“It’s pretty obvious which one I went with.”</i>");
	output("\n\nWhat happened to the rookie who stabbed her team in the back? The company probably didn’t like him ruining the operation.");
	output("\n\n<i>“Obviously they didn’t like him fucking everything up, but failure doesn’t get you kicked out automatically. Either repeated failure or critical failure, essentially if your failure leads up to either severe injury or death of senior mercenary.”</i>");
	output("\n\n<i>“While I was in the hospital, some of our guys dealt with him. Decided to thank him properly for stabbing us in the back. Shame that he didn’t get a free leg from the company.”</i>");
	output("\n\n<i>“But now you know that I’m almost as much machine as hyena, so you can run along and think of something else to patronize me with.”</i>");
	flags["VERUSHA_MERCENARY_TALK"] = 1;
	//(back to interaction menu)
	processTime(30);
	clearMenu();
	addButton(0,"Next",approachVerusha);
}

//[Race]
public function verushaRaceTalk():void
{
	clearOutput();
	showVerusha();
	if(pc.isNice()) output("<i>“Did you have a particular reason for the mods you’ve taken?”</i>");
	else if(pc.isMischievous()) output("<i>“Did your company pay for your mods, too?”</i>");
	else output("<i>“How many credits did you sink into your mods?”</i>");
	if(pc.isMischievous()) output("\n\n<i>“Hah! They should have. A short tomboy isn’t exactly intimidating.”</i> She laughs boisterously. ");
	else output("\n\n");
	output("<i>“Yeah, it’s pretty obvious that I’ve taken mods. Don’t know of many humans that were born furred and grew up to be about ten feet tall.”</i>");
	output("\n\n<i>“I picked up the habit of living on MRE’s. So I didn’t really have a use for credits beyond buying old Terran guns, and at the point when you have more guns than actual fingers you start to think that maybe you are wasting your credits. So, I started to use the credits to sculpt my body to something I would be the most comfortable in.”</i>");
	output("\n\n<i>“First, I started to eat some Lemon Loftcakes. Had to redo my cybernetic leg since I doubled in height. The reason I wanted to stack up my height is that the bigger I am, the bigger gun I can carry without an issue. Covered a few more inches with the custom mod since.”</i>");
	output("\n\n<i>“Then, I started to think about mods that would change my body in more ways than just height. I really wasn’t sure what kind of mods to go with. Decided to go with the hyena look. I always liked hyenas and it has the whole indimitation value going for it. Had some difficulty finding mods that gave me what I wanted and I wouldn’t have to pay through the nose for.”</i>");
	output("\n\n<i>“I hooked up with a dealer who gave me a cheap rate after a certain favor. I </i>dissuaded<i> some of his competition, and he cut a nice chunk from the price. The mod included basically everything you see now: the fur, the muzzle, the tail, even this beast here.”</i> She pats her crotch with a wicked grin on her face.");
	output("\n\nWas her left arm part of the mod as well? Since that’s definitely not normal for an actual hyena.");
	output("\n\n<i>“No, it’s something that I had done after my first anniversary. It’s a bit of a tradition for year old mercs to get something to differentiate them from the rookies. One of the most common ones is a custom paint job on their primary.”</i>");
	output("\n\nHow did she get a tattoo to show through her fur?");
	output("\n\n<i>“Do you know how they dye fur? Had my entire arm dyed light brown, then dyed the lines and the dots with black. Was quite expensive, but worth it. Well, at least in my book.”</i>");
	output("\n\n<i>“Well, now you know me more intimately than some of the guys. I think that’s enough for now.”</i>");
	processTime(10);
	flags["VERUSHA_RACE_TALK"] = 1;
	clearMenu();
	addButton(0,"Next",approachVerusha);
}


//[Grope her] (can be done only once)
//Tooltip: This is probably a bad idea.
public function gropeVerusha():void
{
	clearOutput();
	showVerusha();
	output("With that soft, furry bosom so tantalizingly on display, how could you not grab a handful of boob?");
	output("\n\nThe moment your fingers grope her breasts, she grasps your wrist and twists it into a painful angle. She stands up and grabs you by your neck and slams you down to the counter.");
	output("\n\nShe looks down at you and growls, <i>“Did I tell you that you could touch me? If you want to keep your hands intact, you best keep them to yourself.”</i>");
	output("\n\nYou try to push her off you, but");
	if(pc.PQ() >= 80) output(" despite your considerable strength, you can’t push her off. The angle is too uncomfortable and her weight is too much to try.");
	else output(", it’s no use, she’s just too strong.");

	output("\n\n<i>“Now apologize! Unless you want me to hand your ass to you.”</i>");

	if(pc.isAss()) output("\n\nYou mutter her a dishonest apology.");
	else if(pc.isMischievous()) output("\n\n<i>“Hey, I just thought that you would like some appreciation of your tits,”</i> you say, trying to calm her down.");
	else output("\n\nYou quickly apologize to her for not asking permission.");

	if(pc.isAss() || pc.isMischievous()) output("\n\nIt doesn’t seem to appease her, the metallic digits of her arm pressing harder on your neck until you croak a genuine apology.");
	output("\n\nHaving gotten what she wants, she turns around and throws you to the direction of the door. You stumble, almost falling on your face. You turn, thinking about giving her a piece of your mind, but she’s already sitting down, her back to you.");
	output("\n\nYou realize that it’s best for you to back down. Even if you could stand against her in a fight, who knows what kind of aftermath it could cause. So you pick up your pride and walk away.");
	processTime(8);
	pc.changeHP(-1);
	flags["VERUSHA_GROPED"] = 1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Sex] (before having sex with her, requires PC height under nine feet)
public function sexWithVerusha():void
{
	clearOutput();
	showVerusha();
	//[Too tall] (PC height more than eight feet)
	if(pc.tallness > 9*12)
	{
		output("She takes one look at you before shooting you down. <i>“Sorry, but I prefer my partners to be shorter than you are. I’ve had tall fucks before and it’s a bother.”</i>");
		output("\n\n<i>“Go eat some Strawberry Shortcakes or something if you want to fuck. Maybe go take notes from the raskvel; best fuck I’ve ever had.”</i>");
		clearMenu();
		addButton(0,"Next",approachVerusha);
		return;
	}
	if(flags["SEXED_VERUSHA"] == undefined)
	{
		output("<i>“Now you’re speaking my language, Steele.”</i> She pulls you into her lap, pressing your face between her breasts.");
		output("\n\nBefore you can say anything she whispers in your ear, <i>“Now if we’re going to do this, you should know that I’m going to fuck you and I don’t care about your pleasure.”</i>");
		output("\n\n<i>“Last chance to back out,”</i> she growls before letting go of your head while ");
		if(pc.isAssExposed()) output("one of her metallic fingers rubs against your [pc.asshole].");
		else output("her metallic arm sneaks into your pants to grab at your ass.");
	}
	else
	{
		output("When you suggest that she should take you back to your ship, a lusty grin splits her muzzle. <i>“Ah, you really are the best [pc.race] ever. Not only do you let me have my way with you, you keep coming back for more.”</i>");
		output("\n\nShe continues while groping over your body, <i>“Of course, you can always back down if you think you’re getting in over your head.”</i>");
	}
	processTime(2);
	clearMenu();
	addButton(0,"Yes",yesSexWithVerusha);
	addButton(1,"No",noSexWithVerusha);
	if(flags["VERUSHA_ASSERTED"] == undefined) addButton(2,"Assert",verushaGetsAsserted);
	else addDisabledButton(2,"Assert","Assert","That didn’t end well last time. No reason to do it all over again!");
}

//[Yes]
public function yesSexWithVerusha():void
{
	clearOutput();
	showVerusha();
	output("Your arousal soars and your breath catches in your throat. It’s hard for you to say anything in the face of her dominant manhandling.");
	output("\n\nYou kiss and lick her black nipple, your hand trailing down to her pants to caress her rapidly engorging, knotted flesh.");
	output("\n\n<i>“I want to hear you beg to be my slutty cum rag for the night.”</i>");
	output("\n\nYou try to do as she says, you really do, but you can’t concentrate with her roaming hands all over your [pc.butt] and [pc.chest]. You manage to husk out a breathless <i>“please.”</i>");
	output("\n\nShe gives her finger provocative lick before pushing it into your asshole. <i>“That’s what I like to hear.”</i>");
	processTime(2);
	pc.changeLust(10);
	clearMenu();
	addButton(0,"Next",verushaSexWalkToShip);
}

//[No]
public function noSexWithVerusha():void
{
	clearOutput();
	showVerusha();
	output("<i>“Aww, is it too much for you? Come back when you’ve grown some balls.”</i> She pushes you back to your [pc.feet] before sending you on your way with a rough slap on your ass.");
	output("\n\nShe turns back to the bar, calling for a new drink.");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Assert]
//Tooltip: You’re really not into being dominated.
//Locked Tooltip: This didn’t play out well last time, so better not trying it again.
public function verushaGetsAsserted():void
{
	clearOutput();
	showVerusha();
	output("Fuck NO! This is not what you had in mind, and you tell her as much.");
	output("\n\nShe pushes you off from her lap, sending you straight to the floor. You land on your ass, and before you can get up she presses a foot down on your chest and exclaims, <i>“Then don’t waste more of my time, Steele. I’m the boss here; if you can’t take it then piss off.”</i>");
	output("\n\nShe then lifts her leg and begins walking towards the bar, but halfway through turns around and barks at you. <i>“And don’t waste my time with this again.”</i>");
	output("\n\nYou can do nothing but watch as she goes back to the bar, sits down, pulls out a tablet and starts to flip through it, paying you no mind.");
	if(!(pc.armor is EmptySlot) || !(pc.lowerUndergarment is EmptySlot)) output("\n\nYou dust off your [pc.lowerGarmentOuter]");
	else output("\n\nYou dust off your [pc.ass]");
	output(" and walk off, telling yourself that you’re better off letting it go.");
	flags["VERUSHA_ASSERTED"] = 1;
	processTime(3);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[To ship] (not an option, just a scene before the sex)
//(Gain few points towards mild exhibitionism)
public function verushaSexWalkToShip():void
{
	clearOutput();
	currentLocation = "201";
	generateMap();
	showVerusha();
	output("Wasting no time, she hoists you over her shoulder, still playing with your ass. Her spit slathered finger glides along you passage and she pushes another finger in, stretching your rim open. With you bent over her shoulder and ass in the air she walks out of the bar and onto the busy street.");
	output("\n\nShe is in no hurry to make it over to your ship. You’re starting to think that she’s showing you off, and the occasional raskvel with a hard-on isn’t helping.");
	output("\n\n");
	if(flags["SEXED_VERUSHA"] == undefined) 
	{
		output("She stops, even pulling her fingers out of your [pc.asshole]. <i>“Umm, as much as I like showing your [pc.ass] to the raskvel and the occasional rusher, I’d rather take you to your ship now.”</i> She has no idea where your ship actually is. After you give her a workable description of your ship, she plugs your [pc.asshole] again with her metal digits.");
		pc.exhibitionism(1);
	}
	else 
	{
		output("She takes a detour, showing you off to the citizens of Novahome, deliberately walking past the largest crowds.");
		if(pc.exhibitionism() >= 66) output(" Not that you mind, just the thought of the horny raskvel staring at your [pc.ass] gets you hot and bothered.");
		output(" She keeps wandering around Novahome until she grows bored and heads towards your ship.");
		pc.exhibitionism(2);
		pc.changeLust(10);
	}
	processTime(20);
	pc.changeLust(10);
	clearMenu();
	if(rand(6) == 0 && flags["MET_VERUSHAS_FRIEND"] == undefined) addButton(0,"Next",randomMercEncounterWivVerusha);
	else addButton(0,"Next",verushaInShipPresexFluff);
}

//Random Merc Encounter Scene (happens only once with a random chance)
public function randomMercEncounterWivVerusha():void
{
	clearOutput();
	showVerusha();
	flags["MET_VERUSHAS_FRIEND"] = 1;
	showName("VERUSHA’S\nFRIEND!");
	output("<i>“So, you’re going off the call again?”</i> a stranger calls out at her. You struggle to turn your head to see who’s talking. When you’ve turned your head enough, you see a gryvain behind you. You assume that she is one of the mercs Verusha works with.");
	output("\n\n<i>“Yeah, such is the burden of the well endowed. Sluts just fall into your lap.”</i> She chuckles.");
	output("\n\n<i>“I know, probably didn’t notify commander about that, did you? You never do.”</i>");
	output("\n\nShe shakes her head, <i>“No. Could you notify her? I have business to take care of.”</i> She pats your ass.");
	output("\n\n<i>“You really should start doing it yourself,”</i> she sighs wearily.");
	output("\n\n<i>“I know, but you never know when a cock-hungry slut’ll fall in your lap.”</i>");
	output("\n\nYou came to be fucked, not listen to her talk to other mercs. You wiggle in frustration, letting her know that you aren’t interested in her business.");
	output("\n\n<i>“Hey, I gotta get going. Someone is getting impatient.”</i> She walks past her friend without another word.");
	output("\n\nAfter walking for a bit longer, the familiar hiss of your ship’s door informs you that you are finally are back at your ship.");
	pc.exhibitionism(1);
	processTime(10);
	pc.changeLust(10);
	clearMenu();
	addButton(0,"Next",verushaInShipPresexFluff);
}

//[More fluff before the sex]
public function verushaInShipPresexFluff():void
{
	clearOutput();
	currentLocation = "SHIP INTERIOR";
	generateMap();
	showVerusha(true);
	output("You realize that you’re in the bedroom when you find yourself ");
	if(!pc.isCrotchExposed() || !pc.isAssExposed() || !pc.isChestExposed()) output("naked and on the ");
	else output("on your ");
	output("bed.");

	output("\n\nShe wastes no time getting rid of her own pants, quickly crawling on top of you, nipping at your [pc.ears] and neck. She straightens up, showing off her naked form for you.");
	output("\n\nHer twenty-one inch, pitch black canine dick produces from a furry sheath and is standing erect, dripping pre steadily. Roughly estimating, you would say that it’s about four inches thick. Its length is adorned by golden piercings running down its cumvein. The knot, even in its uninflated state, is almost six inches thick.");
	if(flags["SEXED_VERUSHA"] != undefined) output(" Having spent intimate time with her knot you know that it’s roughly eight inches in its inflated state.");
	output("\n\nBeneath her rock hard length hangs a pair of hand-filling, furry balls. They seem to be heavy and plump with cum, and she is eager to empty them inside you. She gives one of them a small squeeze and a heavy spurt of pre shoots out from her tip.");
	output("\n\nShe pulls her testes up, showing the black pussy behind them, seeping and lips puffy with arousal. She gives herself a quick finger-fuck before licking off the juices that are coating her fingers.");
	output("\n\nAfter giving you a crash course of her body she bends down again, this time leaning right in front of your face. <i>“Now, what to do with my bitch for the night?”</i> She runs her broad tongue along the side of your face to punctuate her point.");

	//[Sex] (scene chosen at random, rut takes priority over rest of the scenes and heat takes priority over rut)
	processTime(20);
	pc.changeLust(10);
	clearMenu();
	addButton(0,"Next",verushaSexRouter);
}

public function verushaSexRouter():void
{
	IncrementFlag("SEXED_VERUSHA");
	var choices:Array = [];
	if(pc.hasGenitals()) choices.push(verushaDrillsYourButt);
	if(pc.inHeat() && pc.hasVagina() && (flags["VERUSHA_HEAT_SEX"] == undefined || (flags["VERUSHA_HEAT_SEX"] != undefined && flags["VERUSHA_HEAT_SEX"] + 48*60 < GetGameTimestamp()))) choices.push(verushaHeatSex,verushaHeatSex,verushaHeatSex,verushaHeatSex,verushaHeatSex,verushaHeatSex);
	choices.push(verushaOralScene);
	if(pc.hasCock() && flags["VERUSHA_ORALED"] != undefined) choices.push(verushaRimming);
	if(pc.hasCock() && pc.cockThatFits(verushaCapacity()) >= 0 && pc.inRut() && (flags["VERUSHA_RUT_SEX"] == undefined || (flags["VERUSHA_RUT_SEX"] != undefined && flags["VERUSHA_RUT_SEX"] + 48*60 < GetGameTimestamp()))) choices.push(verushaRutScene,verushaRutScene,verushaRutScene);
	if(pc.hasCock() && pc.smallestCockLength() <= 6) choices.push(verushaSPH);
	//NOW DO THE THING!
	choices[rand(choices.length)]();
}

//[Anal] (requires PC to be able to take her anally and genitalia of some sort)
public function verushaDrillsYourButt():void
{
	clearOutput();
	showVerusha(true);
	output("She flips you onto your stomach and gropes your [pc.ass]. She leans down, whispering in your ear, ");
	if(silly) output("<i>“I am the one who fucks.”</i>");
	else output("<i>“I’m going to fuck you. <b>Hard</b>.”</i>");
	output(" She spits on her hand, rubbing it on her length and mixing it with her ample pre. She plunges two fingers into you, spreading your pucker wide.");

	output("\n\nYou clench instinctively, trying to keep her fingers from invading your asshole. With how slick her fingers are from both her pre and spit, it’s a fruitless effort. <i>“I appreciate you making your ass nice and tight for me, but it’s better if you just relax.”</i> She continues fingering your hole and gives your ass a rough slap, making you clench around her fingers all the harder.");

	output("\n\nShe doesn’t wait for you to relax, instead pressing the narrow tip of her length against your pucker. Taking a deep breath, you try to relax before she plunges inside you. ");
	if(pc.ass.looseness() < 2) output("With the first thrust she manages to shove her cock only halfway in, but with the second she’s balls-deep inside you.");
	else output("Without a warning, she sheaths herself inside you fully with a single push.");
	output(" The sudden intrusion knocks the breath out of your lungs. Her furry sheath and balls press against your [pc.ass].");
	pc.buttChange(verushaCockVolume());

	output("\n\nShe puts her arm around your neck, hugging you tightly against her. She nips your [pc.ear], <i>“Is my bitch ready for this?”</i> Whether you’re ready or not doesn’t matter since you’re breathless and you can’t move your head.");

	output("\n\nShe pulls all the way out before slamming back in, causing a moan to escape your lips. The piercings along her cock rub your anal walls all the while. She settles to a butt-breaking force from the very start, ramming all twenty-one inches of her flesh into you without a pause for breath.");

	if(pc.hasVagina() && !pc.hasCock())
	{
		output("\n\nShe pinches your [pc.clit] between her fingers, rubbing it softly before slipping her fingers between your folds. <i>“You’re wet enough to drown a galotian, Steele. Would you like me to fuck this nice, wet pussy? Well too bad, I’m here for your ass.”</i>");
	}
	else if(pc.hasCock() && !pc.hasVagina())
	{
		output("\n\nShe gives [pc.eachCock] a soft caress before grasping your [pc.cockBiggest], firmly stroking your length with her furred digits. She squeezes your [pc.cockHeadBiggest] between her fingers, pressing out some of your pre onto her fingers. <i>“Damn, Steele. You’re harder than I am right now.”</i>");
	}
	else 
	{
		output("\n\nShe fiddles with your feminine slit, lubing her fingers with your pussy juices before plugging your mouth with her wet fingers. You lavish her fingers with your tongue, making sure to completely clean them of your juices. Once she’s satisfied in your cleaning of her fingers, she strokes your [pc.cockBiggest].");
		if(pc.biggestCockLength() > 12) output(" <i>“Why do you have a beast like this between your legs? Someone like you has no use for a cock of this size.”</i>");
		else output(" <i>“At least you know your place at some level. A bitch like you doesn’t need a big dick.”</i>");
	}
	output("\n\nPulling out from your ass she flips you onto your back. <i>“I prefer you this way so you can’t bite a pillow.”</i> She thrusts balls-deep inside your ass without an issue");
	if(pc.ass.looseness() >= 4) output(", not that you were necessarily tight before but");
	output(" she has stretched you out enough to freely pump your [pc.ass].");

	output("\n\nThe constant railing of your ");
	if(pc.hasCock()) output("prostate");
	else output("ass");
	output(" has you clinging on to your voice. Noticing that you’re holding back moans, she bends down and nips your throat lightly. <i>“Let me hear those screams.”</i> When she doesn’t get what she wants, she bites on your ear");
	if(pc.hasCock()) output(" and starts to grope your [pc.cock]");
	else if(pc.hasVagina()) output(" and flicks and rubs your [pc.clits]");
	output(". You can’t hold on anymore, another moan escaping from your [pc.lips]. <i>“That’s it, Steele. Moan for me,”</i> she whispers in your ear while hammering her semi-inflated knot against your ring. She seems to get off on hearing you moan, as she begins to roughly –almost painfully– grope your ");
	if(pc.biggestTitSize() > 1) output("[pc.breasts].");
	else output("[pc.butt].");

	output("\n\nShe flips you to your hands and knees and grasps your [pc.hips] tightly, pulling you back into every thrust. The forceful fucking of your behind and the occasional groping has you teetering on the edge. Noticing that your breath has quickened, she slaps your ass hard. <i>“Cum for me, Steele!”</i> she yells like a madwoman.");

	output("\n\nYou can’t help but obey, eyes crossing, a whorish moan leaving your lips, ");
	if(pc.hasCock()) output("your [pc.cocks] bobbing, sputtering [pc.cum] on the sheets, ");
	if(pc.hasVagina()) output("[pc.eachVagina] fluttering and squeezing a nonexistent cock, ");
	output("and your ass clenching around her black, canine dick.");

	output("\n\nWhen you come down from your orgasm, you feel her cock inside your ass; she’s still rock hard and throbbing. <i>“Let’s see if I can make you cum a second time,”</i> she whispers in your ear before thrusting inside you again. You whimper as she once more starts fucking you roughly.");

	processTime(30);
	clearMenu();
	addButton(0,"Next",verushaDrillsYourButt2);
}

public function verushaDrillsYourButt2():void
{
	clearOutput();
	showVerusha(true);
	output("You whimper and moan weakly as she splits your ass open again, and you’ve lost count of how many times you have ");
	if(pc.isHerm()) output("stained the sheets with your mixed fluids");
	else if(pc.hasCock()) output("spilled your seed on the sheets");
	else if(pc.hasVagina()) output("leaked your feminine fluids down your [pc.thighs]");
	output(". <i>“Still sane, Steele?”</i> she calls down from what seems very high up to your addled mind. You stop drooling on the pillow long enough to answer. Well you try, but the only thing you can get from your lips is incoherent mumbling.");

	output("\n\n<i>“Eh, good enough.”</i>");

	output("\n\nShe slams her knot against your pucker, trying to force it in ");
	if(pc.ass.looseness() >= 5 || pc.analCapacity() >= 1000) output("and having no problem, your well-trained ass swallowing her fleshy bitch breaker easily.");
	else output(", your ass refusing to swallow the meaty bulb immediately. She refuses to let your ass keep her knot outside. Grabbing you by your wrists, she pulls you back against her knot. You see white from the mix of pain and pleasure of her massive breeder’s bulb stretching you to your limits");
	output(".");
	pc.buttChange(verushaCockVolume()*1.5);

	output("\n\nHer knot swells inside your ass, locking her inside. Your clenching passage and a few last short thrusts are enough to set her off, her cumvein bulging with cum she bites down on the back of your neck, strong enough to leave a bruise. Surge after surge of spunk shoots from her massive dick, pooling inside your stomach, swelling it with her thick and plentiful cum.");
	if(!pc.hasAnalPregnancy()) output(" When you start looking six months pregnant her output starts to die down.");
	else output(" Due to your pregnant form her cum has nowhere to go, so it ends up backwashing around her, despite the best efforts of her knot trying to keep it all inside you.");
	output(" Finally, having claimed your asshole thoroughly, she slumps down on your back. Even if you weren’t just fucked silly you wouldn’t be an able to keep her immense weight up, so you crash down onto the bed. Sleep takes the both of you quickly.");

	processTime(45);
	pc.loadInAss(verushaPP());
	for(var x:int = 0; x < 7; x++) { pc.orgasm(); }
	//[Next] (move time by half hour)
	clearMenu();
	addButton(0,"Next",verushaDrillsYourButt3);
}

public function verushaDrillsYourButt3():void
{
	clearOutput();
	showVerusha(true);
	output("Soft tugging wakes you from sleep. Verusha is still knotted inside your ass. Her knot isn’t completely deflated, but enough to possibly escape. With one more hearty tug, her knot escapes your ass like some sort of perverse bottle cork, even a loud pop sounds through the bedroom. Her cum runs freely from your gaped asshole, staining the sheets further along with both of your legs. She jumps out of bed before her fur is stained any more. <i>“Sorry to just fuck and run, but cleaning dry cum from fur is a bitch.”</i> She pulls up her pants before walking out from the bedroom, but at the door she turns. <i>“I’ll be at the bar if you want me to split you open again.”</i> Without another word she is out the door and gone.");
	output("\n\nDoubtlessly, she’ll be back at the bar, but for now you’ll wait for feeling to come back to your legs before you’ll go anywhere.");
	processTime(10);
	verushaQuickwalkOption();
}
//[Heat] (requires the PC to be in heat, a pussy and to be able to take her, and not having done [Heat] in 48 hours)
public function verushaHeatSex():void
{
	clearOutput();
	showVerusha(true);
	flags["VERUSHA_HEAT_SEX"] = GetGameTimestamp();
	var x:int = pc.biggestVaginaIndex();

	output("She bends down to your [pc.pussy " + x + "] and you jump when her cold, wet nose bumps against your [pc.clit]. She drinks deeply of the aroma of your [pc.pussy " + x + "]. <i>“I know this smell: the smell of a needy bitch with an empty womb just begging to be filled with cum.”</i> She pushes her broad tongue inside your folds, lapping at the inside of your pussy, seeking out all the sensitive spots.");
	output("\n\nOn some level, you try to resist the animalistic instinct to do nothing more than getting filled with cum day in and day out. But it’s hard with her tongue constantly massaging your inner tunnel and flicking over your [pc.clits].");
	output("\n\nYou can’t take it anymore. Your cock-needy mind quickly zeroes in on the heady musk of her dick; you can even smell the pre-cum leaking from it. She’s right, your pussy wants cum – <i>needs</i> cum. You need to get pregnant; your womb is achingly empty and you can’t bear it any longer. You moan out loud, begging her to fuck you, to pump you full of her cum, to knock you up.");
	output("\n\n<i>“You really want to get pregnant, huh? You sure that you want to get knocked up by someone who might be gone tomorrow, by someone who might leave you to raise your kid alone?”</i> She rubs the tip of her thick, canine cock against your pussy lips.");
	output("\n\n<i>“Yes, yes, YES!”</i> you scream out loud, unable to contain yourself any longer. Every second she’s rubbing her tip against your pussy lips is agony. With every breath you take you can smell her pre; it’s like ambrosia to your fuzzy mind.");
	output("\n\nWith a cocky grin she sinks her weighty cock inside you with a slow thrust, spreading your pussy around her girth. <i>“Damn, I love bitches in heat.”</i>");
	pc.cuntChange(x,verushaCockVolume());
	output("\n\n");
	showImage("VerushaFuck");
	output("You moan deeply in the pure bliss of having her inside you. It feels so good having her tapered length inside your cunt, but it is a mere distraction to what you truly desire: her hot cum filling up your womb.");
	output("\n\nBut working for it makes it all the better. Well, she’s the one really working for it, a point she all too happy to punctuate by burying herself balls-deep again before withdrawing and repeating it all over again.");
	output("\n\nShe brings one hand to your mouth, pulling it open. She bends down and starts to sloppily make out with you while ");
	if(pc.biggestTitSize() > 1) output("groping your [pc.breasts]");
	else output("stroking your sides affectionately");
	output(", all the while pumping her dick into you in a firm, yet gentle rhythm.");

	output("\n\nThe way she firmly pokes and prods against all of your sensitive spots has you moaning and whimpering under her in no time. You wrap your [pc.legs] around her waist, pulling her deeper into your pussy and bury your face in her neck.");
	output("\n\nYour pussy starts to milk her length with needful efficiency, trying to coax a hot load solely for your empty womb. With your effort, it doesn’t take long for Verusha to unload a hot serving of baby batter into you. She starts to hammer her knot against your pussy lips, trying to work it into you before she cums.");
	if(pc.vaginalCapacity(x) > verushaCockVolume()) output("\n\nShe has no problem fitting the bulb of her knot inside your pussy, making sure that none of her precious jizz escapes your womb.");
	else output("Because of how tight you are, she can’t fit her knot into your pussy, so you bite your lip and push against her on her second thrust and her knot slips into your sloppy cunt. After all, you need that breeder’s bulb inside you to ensure that none of her precious sperm escapes.");
	output("\n\nShe twitches once, twice inside you, thrusting just a little bit deeper, arching her back and pulling your head into her cleavage. Her balls twitch against your [pc.ass], spilling their content inside you. The feeling of her cum flooding your womb is enough to bring you to a mindblowing orgasm. A deeply content moan from the bottom of your lungs is all you hear, as your [pc.girlCum] squirts between your vaginal walls and the bitch breaking girth blocking the entrance of your tunnel and down her furry balls.");
	output("\n\nHer cum just keeps flowing into your womb, ");
	//pc sterile: 
	if(pc.fertility() <= 0) output("claiming your body to her");
	else output("claiming home to your fertile grounds");
	output(". Some of it escapes your depths despite the clenching of your pussy and the meaty knot blocking your entrance. The satisfaction you get from the feeling of her cum flowing around inside you almost knocks another orgasm into you. You sigh into her cleavage and hug her tighter against you.");
	output("\n\nWhen you come down from your afterglow, you notice the distinct lack of softness her dick is exhibiting. Pulling yourself from Verusha’s furry cleavage you look up at her, and she’s grinning down at you.");
	output("\n\n<i>“We need to make sure you’re properly knocked up now don’t we?”</i> She chuckles before pulling her cum smeared cock from your pussy, her knot slipping free from the grasp of your cunt.");
	output("\n\nShe drags her broad tongue across your neck before viciously thrusting back into your [pc.pussy " + x + "], fucking your cum-filled pussy all over again. Her slick cum lubes the both of you up so she can fuck you all the harder.");
	output("\n\n<i>“I never understood why some people have a problem with sloppy seconds. I mean what’s wrong with fucking a well-fucked slut? When they’re well stretched and cum-filled you can fuck them just that much harder.”</i>");
	output("\n\nShe punctuates her point by pulling out her cock to her tip before thrusting balls-deep again. Her knot, while not completely deflated, is still small enough to slam into your pussy without trouble. Her weighty balls slap against your ass, inflaming a strong lust inside you again.");
	output("\n\nShe gets back up before grabbing you by your ankles, leveraging your legs to pull you back into each of her thrusts. She makes quick, full-length thrusts into you, quickly building towards another orgasm.");
	output("\n\nShe turns her oral attention from your neck to your nipples, circling one of your [pc.nipples] with her tongue, nipping on it before switching to the other.");
	if(pc.biggestTitSize() > 1) output("Her hands knead your [pc.breasts]");
	else 
	{
		output("Her hands twist and rub ");
		if(pc.totalNipples() > 2) output("one of your [pc.nipples]");
		else output("your other [pc.nipple]");
	}
	output(". She pulls roughly on your [pc.nipples], sending you over the edge, weakly clenching around her length to try and milk her for more of her precious, fertile seed.");
	output("\n\nIt’s not enough to pull her over the edge with you. Instead, she fucks you through your orgasm, making small thrusts into your spasming pussy.");
	output("\n\nOnce you come down from your orgasm, she hilts herself inside you, pausing to rub her still-full balls against your [pc.ass], teasing you again with her virile cargo.");
	output("\n\nShe sits upright, pulling you into her lap and thrusting up into you, bouncing you in her lap. Her cum leaks down out of your pussy, but you try to clench to stop the cum from escaping from between your lips.");
	output("\n\nHer knot swelling clearly signaling her imminent orgasm, she pulls you down onto her knot. Your pussy swallows the fleshy bulb, even without the aid of gravity. Her knot swells locking her inside your pussy before flooding your already stuffed womb with more of her fertile cum.");
	output("\n\nWhen she is finally done with filling you with cum to pregnant proportions, she lays back on the bed, pulling the blanket over the both of you. You’re both pretty exhausted from the fucking, and you quickly fall asleep while her cock is still buried inside you.");
	processTime(40);
	pc.orgasm();
	pc.orgasm();
	pc.loadInCunt(verushaPP(),x);
	clearMenu();
	addButton(0,"Next",verushaHeatSex2,x);
}

//[Next] (move time by roughly 8 hours)
public function verushaHeatSex2(x:int):void
{
	clearOutput();
	showVerusha(true);
	output("The 400lb hyena snoring half on top of you is enough to wake you up, and you wiggling from under her also wakes her up. Her soft dick flops from your [pc.pussy " + x + "], some of her cum leaking out, though most of it has stained her fur and your lower body and it has dried during the night. She takes a one look at her lower body and grumbles something about dry cum.");
	output("\n\nShe notices that you’ve awoken as well, and she reaches to plug your leaking pussy with her fingers, jilling your cum-filled cunt. <i>“Well, we made quite a mess last night.”</i> She stands up before pulling you out of the bed.");
	if(pc.isAss()) output("\n\n<i>“You made most of the mess, not me,”</i> you retort.");
	else if(pc.isMischievous()) output("\n\n<i>“Now, now, don’t go shifting blame. I think it was you who made the mess.”</i>");
	else output("\n\n<i>“If I recall correctly, you’re the one who made the mess, not me.”</i>");
	output("\n\n<i>“Well, you were the one who was begging for it.”</i> She bends down to pick up her pants, giving you a show of her black pussy. Instead of putting on her pants, she slings them over her shoulder. <i>“Oh, and you won’t be getting pregnant, I’m on Sterilex. Can’t have a bunch of little hyenas running around.”</i>");
	if(pc.fertility() <= 0) output("\n\nAlready knowing that you won’t be impregnated her you realize that you will have to wait out your heat.");
	else output("\n\nA little dismayed that your heat won’t be satisfied by her, you miss her departure.");
	output(" You’re left standing in your bedroom, naked and leaking cum. You’d best get that shower unless you want to walk around with cum leaking out of your pussy.");
	processTime(7*60);
	//Wake up satisfied, whynot!
	pc.changeLust(-50);
	verushaQuickwalkOption();
}

//[Oral]
public function verushaOralScene():void
{
	clearOutput();
	showVerusha(true);
	output("She spends some time thinking what to do; seemingly, she didn’t think ahead. After roughly a minute she pipes up.");
	output("\n\n<i>“I think you should put those pretty lips of yours to good use. As in wrapping them around my cock.”</i> She sits back, spreading her legs to give you full view and access to her crotch.");
	output("\n\nThe narrow tip of her canine dick is slightly poking from her sheath, beckoning you towards it. Seems that she lost her erection in the time that it took her to decide what to do. You crawl towards her on your hands and knees, plopping your ass between her legs.");
	output("\n\nYou give her tip a kiss before licking the sensitive flesh inside her sheath, earning a shudder from Verusha and inches of dick flesh pouring into your mouth for your effort. You rub her sheath, encouraging more of her member out from her sheath, working over her balls with your other hand.");
	output("\n\n");
	showImage("VerushaBJ");
	output("When she’s fully out of her sheath and throbbing impatiently, she pushes some breathing room between you and her dick.");
	output("\n\n<i>“Just saying to wrap your lips around my cock is just enough, is it? Yeah, you seem like the kind of [pc.boyGirl] that sucks cock for fun.”</i> She slaps you in the face a couple of times with her erect length.");
	output("\n\nYou catch her tapered head into your mouth on a down swing, quickly enveloping multiple inches of her dick with your [pc.lips].");
	output("\n\nBefore you can swallow more of her prick she yanks it away, out of your reach.");
	output("\n\n<i>“Oops, almost forgot something.”</i> She climbs out of bed, going over to rummage through her stuff. She takes something from her pants’ pocket before walking back to the bed with a confident grin, a chrome cylinder in one hand and a tablet in other.");
	output("\n\nSitting back down, she sets the tablet aside for now. Taking the chrome cylinder in hand, she pulls your head back with her free hand before popping the cap off from the cylinder with her thumb and twists it. It’s a tube of dark crimson lipstick.");
	output("\n\n<i>“Purse your lips dear.”</i> She strokes your cheek.");
	output("\n\nYou do as she tells you, pursing your lips in such a way that she can apply the lipstick easily. She steadily applies the crimson make-up onto your [pc.lips]. Once she’s done with prettying up your lips, she quickly caps off the makeup before chucking it away.");
	if(pc.lipColor != "red" && pc.lipColor != "scarlet" && pc.lipColor != "crimson") output("\n\n<i>“I’m sure you don’t mind me prettying up your lips.”</i>");
	else
	{
		output(" Even though your lips are already crimson you don’t say anything, but you must be making a face, since she squeezes your lips into a cute pout.");
		output("\n\n<i>“It’s not the color, my dear, it’s for smearing the lipstick all over my dick.”</i>");
	}
	output("\n\nWith your lips to her perverse standards, she gets back to what she came here for: her canine dick between your lips.");
	output("\n\nShe grabs the back of your head, pulling you towards her towering erection. You purse your lips softly, giving her a perfect hole to thrust into. She does so with great relish, spreading your [pc.lips] around her cock. She keeps pushing into your throat, feeding you inch after inch of her dick. She doesn’t slow down ");
	if(!pc.canDeepthroat()) output("despite your occasional gags, steadily pushing through any resistance your throat instinctively puts up.");
	else output("since your throat is as accepting as a sloppy cunt, allowing her to fuck your face without an issue.");

	output("\n\nOnce her balls bump against your jaw, she relents and lets out a sigh of content. Looking down at you, she rubs her sheath against your nose, the fur itching against your face.");

	output("\n\nWith her eyes laden over with lust, she starts to pull out of your mouth, only reversing the direction halfway and starting to push back in, building up a steady rhythm. As she pulls out, you cross your eyes to look at her dick and see what kind of job the lipstick has done: her cock is coated in red, and there’s a more noticeable ring of it at the top of her knot. Wherever your lips have stopped is a ring of red, contrasting the dark, black color of her cock meat. She’s leaking pre into your mouth and throat, lubricating the way for rougher thrusting that she’s doubtlessly going to get to.");

	output("\n\nYou take her balls into your hand, fondling over them. It’s somewhat difficult to hold her balls in one hand, her sack spilling over the both sides of your hand.");

	output("\n\nYour other hand has more pressing matters on hand ");
	if(silly) output("– no pun intended – ");
	output("mainly her leaking cunt behind her balls. You stroke her lips with two fingers before spreading them slightly. You get a murmuring of appreciation while her metallic hand bobs you up and down her length.");
	output("\n\nHer slit has leaked enough of her feminine lubricant onto your fingers for you to be confident that she’s ready to take your fingers into her folds. You slowly push them inside her black cunt while thumbing her clit.");
	output("\n\nA");
	if(!pc.isMischievous()) output("n");
	output(" fiendish");
	output(" idea crosses your mind: maybe she has a nice, big prostate to go with her big dick that you could give a nice massage to. If she’s going to pleasure herself using your mouth, you might as well have some fun yourself. With how slick your fingers are with her feminine fluids, you decide to sneak a finger into her ass. Pulling your fingers from her cunt sends no alarm bells through her head, but you decide to rather be safe than sorry. You fondle her balls just that much more lovingly, softly squeezing and rubbing them.");
	output("\n\nYou suckle on her tip and circle her head with your [pc.tongue], occasionally plunging her prick deep into your throat, licking her knot with your tongue. She moans out loud, grasping the back of your head tightly. Your amazing blowjob skills have her completely lost in pleasure, so you bring your still slick fingers to her pucker.");
	output("\n\nWithout a warning you thrust two fingers into her ass, burying them up to the knuckle. ");
	if(silly) output("You would yell surprise, but your mouth is so stuffed with dick that you can’t. ");
	output("She yelps in surprise, her asshole clenching tightly around your exploring digits. She looks down at you with the kind of look that makes you think that she’s plotting some kind of revenge. That might have been a mistake, but it’s too late to pull out now. Her pucker quickly relaxes around your fingers, allowing you to start thrusting into her ass. At least she seems to enjoy it, so hopefully her revenge won’t be too harsh.");

	processTime(30);
	clearMenu();
	addButton(0,"Next",verushaOral2);
}

public function verushaOral2():void
{
	clearOutput();
	showVerusha(true);
	output("You try to mellow her out by focusing on her shaft again, bobbing up and down its length and dragging your tongue against her studded cum vein. She growls softly when you cease your ball-squeezing, until you squeeze her still uninflated knot, stimulating the bulk of flesh and nerves in between swallowing more of her meat.");
	output("\n\nYou can’t forget about her prostate since you already are knuckle deep in her ass. You wiggle your fingers, searching for her prostate. Your fingers bump into something firm and round, and her dick surges and shoots pre down your throat in response. Seems you found her prostate.");
	output("\n\nYou press down on the dense bundle of nerves, earning more pre-cum down your throat. Her knot starts to swell, and she grabs the back of your head with both hands. You look up at her to find out that she’s not even looking at you anymore: her head is thrown back and her tongue is hanging out the side of her muzzle, and she’s panting heavily.");
	output("\n\nShe slams her member down your throat, pushing her knot against your lips before withdrawing and slamming back down your throat. Her balls repeatedly slap against your chin as she keeps fucking your throat without another thought.");
	if(pc.hasCock()) output("\n\nYou grasp your [pc.cock], gathering some of the pre that it has been leaking during its negligence. You run your hand up and down its length, and it doesn’t take long to speed towards the edge since you have been aroused for so long.");
	else if(pc.hasVagina()) output("\n\nYou bring your hand down to your [pc.pussy] and rub [pc.oneClit] with your hand before sinking three fingers between your feminine folds, fingering yourself towards the edge.");

	output("\n\nHer knot swells more and her whole dick throbs powerfully, more of her pre-shooting in your mouth and down your throat. She tightens her grip on your head and pulls you against her knot, mashing the meaty bulb against your lips.");

	output("\n\nHer balls pulling against your jaw tells you that she’s about to cum. You thrust your fingers hard into her prostate hard before she does so, hoping to milk her for as much cum as she can shoot. She puts one hand on the bed and the other on your head and pushes her hips into your face, shoving her knot into your maw, stretching your jaw open. Once the entirety of her knot is inside your mouth and she’s tied with you, her cock pulses and throbs, and her cum vein bloats, spreading your lips just a bit more before a torrent of cum rushes down your throat. Even if you wanted to get a taste of her cum, you couldn’t since it’s ending up straight into your stomach.");

	output("\n\nYou moan into the cock in your throat and your eyes roll into the back of your head as the sweet sensation of orgasm washes over you.");
	if(pc.hasCock()) 
	{
		output(" Your [pc.cocks] shoots ");
		if(pc.cockTotal() > 1) output("their loads onto the bed");
		else output("its load onto the bed");
		output(", ropes of [pc.cum] landing wetly on the sheets.");
	}
	if(pc.hasVagina()) 
	{
		output(" Your [pc.legs] twitch and shake as your [pc.vaginas] ");
		if(!pc.isSquirter()) output(pc.totalVaginas() > 1 ? "spray" : "sprays");
		else output(pc.totalVaginas() > 1 ? "leak" : "leaks");
		output(" your [pc.girlCum] down your thighs.");
	}
	output("\n\n");
	if(pc.hasAKnot() || pc.originalRace == "half-ausar" || pc.race() == "ausar") output("Her knot doesn’t last as long as an ausar’s would, but you do have to wait for it to go down. ");
	output("Being tied to her manhood forces you to breathe in the smell of her musk, which reinvigorates your lust somewhat.");

	output("\n\nLooking down she chuckles, patting your head. <i>“You look surprisingly appropriate like that. Your nose buried in my sheath, like a proper whore.”</i> She keeps up commenting on your state and you have no choice but to bear her degrading remarks, not that they aren’t accurate with her meat as deep down your throat it will go. After a few more minutes, her knot deflates to the degree that she can pull out of your mouth.");
	output("\n\nShe pulls back, resting her tapered tip on your [pc.tongue], shooting the rest of her plentiful load into your mouth, filling it with her salty cum. You have to swallow a mouthful before her output stops, but she manages to fill your mouth so that your cheeks bulge a little bit.");
	output("\n\nAfter swallowing the last mouthful of her cum, you’re quite full, your stomach bloated with her cum. She pulls her dick from your mouth, still smeared with cum and lipstick, and she slaps it on your face, letting her cum smear your face");
	if(pc.hasHair()) output(" and [pc.hair]");
	output(".");
	output("\n\nYou remember that she picked up the tablet, and you have an inkling of what she’s planning to do with it. When she brings it above your head, she confirms what you thought. There is a sound of a digital camera, but no flash. She turns the tablet to you and your thoughts are confirmed. You’re staring at an immortalisation of your face with her spunk and lipstick-smeared canine cock resting on it.");

	output("\n\n<i>“Wasn’t that nice? Yes, it was.”</i> She softly strokes ");
	if(pc.hasHair()) output("your [pc.hairNoun]");
	else output("the back of your head");
	output(" before bringing her softening member back to your [pc.lips]. She’s expecting you to clean her up, which you do, licking the remaining cum off her dick, gathering the remainings of her cum with your [pc.tongue] before bringing it into your mouth and swallowing it down, joining the rest of her jizz in your stomach.");
	output("\n\n<i>“You don’t mind if I crash the night here, right? No, you don’t. You should feel happy that you get to sleep with your mistress for the night.”</i> She yawns before smushing your nose into her furry sack.");
	output("\n\nWell, you’re a bit tired yourself since you just came and have her load sloshing around in your stomach, so you agree, starting to lift your head and crawl next to her. When your nose leaves her balls, she wraps her metallic leg around your neck.");
	output("\n\n<i>“You can stay right there,”</i> she grunts. You roll your eyes but wiggle, trying to find a comfortable position without having her tug you back to her balls. Once you settle into a comfortable position, you eventually fall asleep.");

	processTime(30);
	pc.orgasm();
	pc.loadInMouth(verushaPP());
	IncrementFlag("VERUSHA_ORALED");
	clearMenu();
	addButton(0,"Next",verushaOral3);
}

public function verushaOral3():void
{
	clearOutput();
	showVerusha(true);
	output("When you wake, you’re still basically bathing in her cock musk. You’re not exactly glued to her balls like you were when you fell asleep, but you’re still very close to the source of the heady musk. You give her sack a kiss and a few licks, waking her up, too.");
	output("\n\nShe sits up and stretches her arms before offering you a hand, pulling you onto your [pc.feet].");
	output("\n\n<i>“Remind me to throat fuck you next time.”</i> She steals a grope of your ");
	if(pc.biggestTitSize() > 1) output("[pc.breasts]");
	else if(pc.hasCock()) output("[pc.cock]");
	else output("[pc.ass]");
	output(" before pulling up her pants, putting away her things and walking out of your bedroom. You stretch your own limbs, stifling a burp. Her load is still sloshing in your stomach.");

	output("\n\nYou’re left standing in your bedroom to decide what to do now.");
	processTime(7*60);
	verushaQuickwalkOption();
}

//[Rimming] (requires a dick and have done [Oral] once)
public function verushaRimming():void
{
	clearOutput();
	showVerusha(true);
	output("She turns around, presenting her backside to you. She pulls her buttcheek to the side, showing both her black rim and pussy to you.");
	output("\n\n<i>“I think you should put that tongue of yours to good use.”</i> She starts to lower her muscular ass down at you, but before her pussy gets into your tongues reach she suddenly pulls away.");
	output("\n\n<i>“Damn it! I always forget these things,”</i> she growls before walking to where she chucked her pants, digging through her pockets again. And not to your surprise, she picks up the lipstick and her tablet.");
	output("\n\n<i>“You know the deal, purse your lips.”</i> You do, and quickly your lips are covered in the crimson lipstick again.");
	output("\n\nWasting no further time, she climbs over you and brings her muscular rear end over your face. Her black-lipped pussy is puffy and leaking moisture, which drips onto your forehead.");
	output("\n\nYou reach out with your [pc.tongue] and lick her outer lips. When you make contact with her feminine folds, she pulls away.");
	output("\n\n<i>“I wasn’t thinking about that hole, [pc.boyGirl],”</i> she snides. She moves forward a bit, placing her black rim right above your [pc.lips]. <i>“Now give me a nice, big kiss.”</i> She spreads her cheeks with both hands.");
	output("\n\nFaced with her black pucker, you do as she commands and press your crimson-colored lips against her rim. You pull back and see a red imprint of your [pc.lips] surrounding her pucker.");
	output("\n\n<i>“Are you done making out with my asshole?”</i> she jeers at you.");
	output("\n\nYou put your hands to her ass cheeks, keeping them spread as she puts her hands down on your sides. Your hands are suddenly brought under quite the pressure. " + (pc.physique() > 30 ? "The surprise of her weight on your arms is quite sudden, but you can manage." : "The sudden massive weight on your arms is almost too much, but thankfully she is supporting herself with her own arms, too, so it’s not all on you."));
	output("\n\nHer furry toes start rubbing your [pc.cock] suddenly. You shudder in surprise as she rubs her padded foot against your dick.");
	if(pc.cocks[0].thickness() < 4) output(" She pinches your dick between her toes, jerking it with her foot until you’re completely erect.");
	output("\n\nIn response to her jerking, you push your [pc.tongue] inside her, penetrating her ass. You lick around her pucker, relaxing her rim, allowing you to push deeper.");
	output("\n\nYou push as deep as you can, your lips pressed against her ass and your tongue deep in it.");
	if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output(" Your [pc.tongue] manages to reach deep enough inside her for your tongue to bump against her prostate");
	output(". You feel a wetness spreading on your [pc.chest], undoubtedly her pre-cum.");
	output("\n\n<i>“Ahh, you’re doing a good job, Steele,”</i> she moans before sandwiching your [pc.cockNounSimple] between her feet.");
	output("\n\nYou flinch as she presses her metallic leg against your sensitive flesh. It’s so cold and hard against you, but the way she presses your length against it doesn’t hurt and allows her to more effectively to rub her furred toes against you, and in short order you’re staining her feet with your own pre-cum.");
	output("\n\nYou moan into her ass, pausing for a moment. When you stop, she stops running her feet up and down your cock, pressing your [pc.cockHead] between her feet. You realize what she’s doing and plunge your tongue back inside her, thrusting it in and out as if it were a dick.");
	output("\n\nShe picks up on rubbing your pecker again, sliding her feet from your [pc.sheath] up to your [pc.cockHead], squeezing it between her feet, another drop of pre smearing onto her feet. She pushes your dick against your [pc.belly]");
	if(pc.balls > 0) 
	{
		output(", rubbing your [pc.balls] with her toes, massaging and squeezing ");
		if(pc.balls == 1) output("it");
		else output("them");
	}
	output(".");

	output("\n\nSeeing how she’s upping her game, you start licking around her pucker between thrusting into her. If you weren’t supporting her weight you would do something a bit more involved, but you can only grope her buttcheeks.");
	if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output(" You repeatedly poke into her prostate with your [pc.tongue], pushing more pre-cum from her tapered dick onto your [pc.chest].");
	else output(" You wish you could reach her prostate; it would make it easier for you. To make up for your lack of a long tongue you double your effort, ramming your tongue into her ass even harder, getting her to leak more pre-cum onto your [pc.chest].");

	output("\n\nVerusha throws her head back and starts to pant out loud, clenching around your tongue. She’s getting close, but before she can blow her load she clenches her teeth. <i>“I’m not cumming before you, bitch.”</i> She pays you back for your efforts, rubbing her pre-soaked feet all over your [pc.cock], jerking you off faster than before.");
	output("\n\nShe alternates between quick and light strokes and tightly gripping your cock between her feet, dragging them all the way to your [pc.cockHead] before smushing it between them.");
	output("\n\nYou can’t hold back anymore. Curbing your moans as your [pc.balls] pump [pc.cumColor] cum from your dick, shooting ropes of it into the air, with most of it landing on Verusha’s feet.");
	if(pc.cumQ() >= 1000) output(" You keep shooting more and more ropes of your [pc.cum] until her feet are soaked with spunk.");
	output("\n\n<i>“There we go, don’t you dare to hold out on me,”</i> she murmurs, jerking you with her feet through your orgasm, encouraging you to empty your [pc.balls] thoroughly.");
	output("\n\nOnce you’re completely empty, she puts her feet on the bed, taking the pressure away from your arms. <i>“My turn now, bitch.”</i> She grinds her erect canine dick against your [pc.chest]. Now that you’re not under the threat of being smothered by her ass, you can do something more productive with your hands. You grasp her tapered length with both hands, jerking it with efficiency, milking her as best you can. Combining that with your tongue thrusting into her ass, you quickly manage to double the amount of pre she is leaking onto your chest.");
	output("\n\nYou grasp her knot with both hands and squeeze it, and it’s all it takes to break an orgasm out of her. Arching her back, she thrusts hard against your hands. You feel her cum splattering against your body; your [pc.feet], [pc.belly], and [pc.chest] end up soaked in her cum.");
	output("\n\nWhen you withdraw your [pc.tongue], she sits down next to you, but unlike you thought she nudges you down to the floor. Just as you start to get into sitting position she presents her cum covered feet to you.");
	output("\n\n<i>“Clean me up, little [pc.boyGirl].”</i> She presses her cum covered toes against your lips urgently. You open your mouth, taking her toe inside. You lick and suckle on it until it’s clean of cum and push it It of mouth with a pop, only to be replaced by another. You spend minutes sucking on her toes, licking all around her foot, making sure that none of your [pc.cum] remains on her foot.");
	output("\n\nOnce her foot is completely clean you let go of it and look up at her with expectant eyes. She only smirks and presents you with her metallic leg, still covered in your [pc.cum].");
	output("\n\nYou meekly take hold of the cybernetic leg and start licking the cum off it. You don’t spend as much time on it as you did with her real leg because she doesn’t feel what you’re doing, and it’s also easier to lick your [pc.cum] off from it since it’s not sticking to any fur.");
	output("\n\nWhen you are done cleaning her feet, she squats down");
	if(silly) output(", her heels touching the floor, and");
	output(" before you can say anything she pulls your head into a kiss, invading your mouth with her tongue. She doesn’t give you the time to realize what’s going on before she pulls free from your tongue lock.");
	output("\n\nShe stands back up, picking up the tablet from the corner of your bed before lifting her other leg onto the bed. She spreads her other butt cheek with one hand, brings the tablet behind her and snaps a picture with the other. She turns the tablet, allowing you to see the picture: her asshole is surrounded by the crimson imprints of your [pc.lips]. Putting the tablet away she turns her attention back to you.");
	output("\n\n<i>“If you want to make out with my ass again, I’ll be at the bar.”</i> She picks up her pants and leaves you kneeling at the side of your bed. You snicker when you notice that she left wet footprints on the floor.");
	output("\n\nPicking up your own gear, you’re left with the choice of whether to take a shower or to go out like this. You’re covered in cum, but some people might find that sexy.");
	processTime(35);
	pc.applyCumSoaked();
	pc.orgasm();
	verushaQuickwalkOption();
}

//[Rut] (require pc dick girth no more than 2.5 and not done [Rut] in 48 hours)
public function verushaRutScene():void
{
	clearOutput();
	showVerusha();
	var x:int = pc.cockThatFits(verushaCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	flags["VERUSHA_RUT_SEX"] = GetGameTimestamp();
	output("You can still see her juicy pussy hidden away behind her balls, arousing your animalistic breeding needs. Your hips thrust upwards subconsciously, seeking to bury your meat in that pussy.");
	output("\n\n<i>“I think someone is in rut.”</i> She smirks before smelling the air in the room. <i>“Oh, yes, you’re definitely rutting.”</i> She sits back before continuing in an innocent sounding way, <i>“Please breed me, knock me up, give me strong pups,”</i> she spreads her legs and lifts her balls out of the way, showing her black pussy lips to you before begging once more. <i>“You’re such a strong alpha; please give me your strong seed.”</i>");
	output("\n\nWell, how could you refuse such a request? Getting onto your hands and knees, you crawl towards her. When you get close to her she suddenly wraps her legs around your neck, pulling you against her black dick.");
	output("\n\n<i>“But you need to work for the privilege to fuck me, so get sucking.”</i> Her voice is far more mischievous now. Your rut-fogged mind demands you to fuck that pussy, and if sucking dick is what it takes, then you shall suck dick like a ");
	if(silly) output("vacuum cleaner.");
	//been on New Texas:
	else if(CodexManager.entryUnlocked("The Treatment")) output("New Texan cow.");
	else output("starved galotian.");
	output("\n\nYou wrap your [pc.lips] around her tapered tip, sucking on it, swallowing the pre-cum she leaks into your mouth. She puts her hands on the back of your head, urging you to take her dick deeper into your throat.");
	output("\n\nYou do, plunging it deeper into your throat until your lips press against her knot. Trying to suppress your gag reflex, you reach out with your tongue, licking her knot.");
	output("\n\n<i>“Now, let’s see if you’re more than just a useless cock holster. Put that pecker of yours to use.”</i> You jump at the opportunity to fuck her pussy, crawling atop her. You give her balls a soft squeeze before lifting them out of the way. You take your [pc.cock " + x + "] in hand and press it against her lips.");
	output("\n\nShe could be wetter for your purposes, and you doubt that she’s going to suck your [pc.cock " + x + "] for extra lubrication, so you go for the next best thing.");
	output("\n\nGrabbing both your and her cocks in hand, you thrust your [pc.hips], rubbing your cocks together, spreading the mixture of pre-cum along your [pc.cockNounSimple " + x + "].");
	if(pc.balls > 1) output(" Your [pc.balls] slap repeatedly against her own furry sack.");

	output("\n\nYour [pc.cock " + x + "] is now soaked in pre-cum and ready for her pussy, but before you can do anything Verusha puts her leg onto your chest, gently pushing you back. You look at her, confusion clearly painted on your face, but before you can say anything she turns to her hands and knees, giving you an angle to fuck her without her balls getting in the way.");
	output("\n\nGrasping her hips tightly, you start to push yourself forwards in a steady manner until you’re inside her up to your [pc.sheath " + x + "].");
	pc.cockChange();

	if(pc.cocks[x].cLength() < 6) output("\n\n<i>“Is that all? I guess I overestimated you. I hope you at least know how to use that little thing,”</i> she mocks you.");
	else if(pc.cocks[x].cLength() <= 10) output("\n\n<i>“Nice piece of meat you got there, let’s see if you know how to use it, too,”</i> she moans lustfully.");
	else output("\n\n<i>“Fuck!”</i> she moans out loud. <i>“With a dick like that, you’d make a fine fuck toy for some golddigger. Now’s your turn to prove yourself a worthy toy,”</i>");

	output("\n\nFinally being inside her pussy and her teasing pushing your mind deeper into your rut, you pull out until your [pc.cockHead " + x + "] rests at her pussy lips.");
	output("\n\n<i>“Quit stalling and start fucking me!”</i> she growls while pushing her hips back.");
	output("\n\nDoing as she commands, you start to push back in until your [pc.hips] bump against her muscular cheeks, giving her a chance to get used to your size.");
	output("\n\nOnce she relaxes around your length, you pull back and push back in before she starts to growl at you again.");
	output("\n\nYou’re fucking her at a steady rhythm now, seeking out all those spots that make her moan and make her even wetter. She’s gripping your [pc.cock " + x + "] tightly, urging you to fuck her harder. As you keep pumping your dick into her pussy, she lowers her head, wiggling her hips, looking back at you with a teasing grin. She doesn’t say anything but her body language speaks volume. She’s taunting you to go harder.");
	output("\n\nYou roughly slap her ass before thrusting as deep as you can. When your hand connects with her furry butt cheek, she moans out loud, clenching hard around your dick. Her cock surges, leaking more pre-cum onto the bed.");
	output("\n\nShe looks at you again, tongue lolling out of her mouth. She swallows and pulls her tongue back into her mouth before panting, <i>“Come on!! I survived a grenade, fuck me HARDER!”</i>");
	output("\n\nRefusing her is the farthest thing from your mind at the moment, so you grab a fistful of her black mohawk, pulling her head back and muster all of the strength you can, fucking her in a hard and fast rhythm");
	if(pc.balls > 1) output(", your [pc.balls] colliding with hers with every thrust");
	output(".");

	output("\n\n<i>“Ahh, that’s it bitch, cum for me,”</i> she moans. You let go of her hair and grab her hips with both hands, pulling her tightly against your crotch before submitting to both your pleasure and her orders. Your cock surges");
	if(pc.cocks[x].cLength() > 6) output(", stretching her just a little bit more");
	output(".");

	var cumQ:Number = pc.cumQ();
	output("\n\n");
	//pc normal amount of cum: 
	if(cumQ < 250) output("You give it your all, pumping all of your [pc.cum] that your [pc.balls] can give into the depths of her pussy.");
	else if(cumQ < 3000) output("You grasp her hips tighter, managing in just a bit more of your dick into her pussy before you begin unloading your [pc.cum] into her pussy, her belly swelling a bit from the productivity of your [pc.balls].");
	else output("You moan through your teeth, and your mind goes blank as your fall over the edge. [pc.cumVisc] pumps into her pussy, and she moans as her belly swells. It stops once she actually looks three months pregnant.");
	output("\n\nYou pull out from her pussy, earning a displeased grunt from Verusha and ");
	if(cumQ < 3000) output("some of your [pc.cum] leaking onto your bed");
	else output("a flood of your [pc.cum] from her pussy");
	output(".");

	output("\n\nShe turns around, lying on her back, and before you can do anything she pulls your [pc.lipsChaste] to her muzzle, invading your mouth with her tongue. She grasps your softening [pc.cock " + x + "], giving it a couple of rough strokes that make you wince. Her rough handling of your member has you hard again in short order.");

	output("\n\nShe plugs her pussy with your dick again, and you moan into her mouth with how sensitive it is, giving her an opportunity to plunge her tongue deeper into your mouth.");
	output("\n\nWhen you are distracted by her roving tongue, she takes the opportunity to grab your wrists and brings your hands to her throbbing member, still erect and raring to go. You tighten your grip around her cock, stroking along her pre-cum-coated cock.");
	output("\n\nYou break your lip-lock with her, and, sitting upright, you suckle on her tip, swallowing her pre while squeezing her knot. It doesn’t take long to bring her to an orgasm. She holds on to the back of your head as she pushes more inches of dick into your throat.");
	output("\n\nHer cum surges into your mouth, filling it to the brim before you swallow it down, just in time for another mouthful of spunk. When her balls run dry you feel like you ate a seven-course meal, and then some.");
	output("\n\nYou stifle a small burp, before she pulls you between her boobs before whispering into your ear, <i>“Let’s stay like this for a while, and don’t expect me to be this nice next time.”</i> She envelops you in her arms, holding you tightly against her chest. It’s quite comfortable, resting your head on her soft boobs, and the warmth of her body. You find yourself drifting to sleep softly.");

	processTime(50);
	pc.loadInMouth(verushaPP());
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",rutSexEpilogue);
}

public function rutSexEpilogue():void
{
	clearOutput();
	showVerusha(true);
	output("The fertile girl in front of you makes you completely hard, and with the way she’s presenting herself to you can’t say no. Grasping her hips in both hands, you start to....");
	output("\n\nYou blink your eyes a couple of times before realizing you were dreaming. Why do dreams always end at the good part? You’re still sleeping on Verusha’s chest. You nudge her shoulder, rousing her from her sleep. She bolts upright, her hand jolting to her hip, sending you flying towards the end of the bed and barreling to the floor.");
	output("\n\n<i>“Sorry, I’m a bit jumpy sometimes.”</i> She gets up, offering you a hand, and pulls you to your feet. <i>“I’m going to go take a shower. Now, be a good [pc.boyGirl] and let me shower in peace.”</i>");
	output("\n\nYou’re left alone in the bedroom, wondering whether you should let her shower alone. The way she spoke left you with the impression that she wouldn’t actually be mad at you if you interrupted her shower, but knowing her she doesn’t have your best interest at heart.");
	processTime(4*60);
	clearMenu();
	//[Nah] [Shower]
	addButton(0,"Nah",nahNoRutSexShowerEpilogue);
	addButton(1,"Shower",showerTimesWivVerushaBruv);
}

//[Nah]
public function nahNoRutSexShowerEpilogue():void
{
	clearOutput();
	showVerusha(true);
	output("You’ll let her take her shower in peace. You lie back on the bed with your feet kicked over the edge. You stare at the ceiling while listening to the running water. After a while it stops abruptly; clearly she’s done showering. It takes a while before she steps out from the bathroom with a towel in one hand, drying her head off with it.");
	output("\n\n<i>“Some nice towels you got, Steele. Well-absorbent.”</i> By the look on her face, she seems to be a bit disappointed that you didn’t interrupt her shower time, but she doesn’t mull over it and throws the wet towel at your face.");
	output("\n\n<i>“Right, I’ll be at the bar if your rutting need gets out of hand, again.”</i>");
	output("\n\nAt the last minute, she turns around. <i>“Oh, and don’t think that I’ll be swelling with cubs in a couple of months.”</i> Having said her final piece, she walks away, leaving you sitting on the bed with a wet towel in your lap. Maybe you should get a shower, too.");
	processTime(20);
	verushaQuickwalkOption();
}

//[Shower] (tooltip: Warning: rougher sex than normally)
public function showerTimesWivVerushaBruv():void
{
	clearOutput();
	showVerusha(true);
	output("Well, you only live once. You wait until you hear the water running, and make your way to the bathroom as quietly as you can. The hydraulic hissing of the door certainly doesn’t help, but Verusha seemingly hasn’t noticed anything.");
	if(pc.IQ() > 50) output(" You notice that her ears twitch when the door slides open, but she acts like she didn’t hear anything.");
	if(!pc.isNude()) output(" You take off your things before tiptoeing into the shower.");
	output("\n\nWhen you’re right next to the shower, she still shows no sign of reacting.");
	if(pc.IQ() < 50) output(" Either she’s playing it up for you or she’s incredibly oblivious");
	else output(" The impact of her trick is lessened somewhat, since you already noticed it that she’s faking it");
	output(". Once you’re at arm’s distance from her, she suddenly pulls you under the shower, and you’re soaking wet in a few moments.");
	output("\n\nShe presses your back to the wall and holds you firmly in place. she grabs your ass and lifts you up, still keeping one hand on your shoulder. She leans forward, growling into your ear, <i>“My turn.”</i> She grabs the back of your neck before flipping you around, pressing your face against the wall.");

	output("\n\nShe lets you down enough that your feet are able to touch the floor, but without relaxing her grip on your neck.");
	output("\n\nYou gasp as she suddenly plunges two fingers into your ass before you can get your breath back. She starts to finger fuck you at a fast pace. <i>“I’m not in the mood to be gentle right now, but I still need to work you loose so you don’t break,”</i> she growls into your ear.");
	output("\n\nShe adds a third finger into your ass, turning them while finger fucking you. ");
	if(pc.analCapacity() < 200) output("You bite your lower lip, not sure if you can take anymore.");
	else output("This is nothing to your experience. You can take three of her fingers and more without an issue.");

	output("\n\nShe adds a fourth finger into the fray, stretching you open. She presses down on your prostate, before spreading her fingers.");
	if(pc.analCapacity() < 400) output(" You whimper, fearing that you will break. Before you can worry any further, she pulls her hand out from your ass");
	else output(" You moan happily while having your ass filled once again. When she pulls her fingers out, you know that she’s going to replace it with something better");
	output(".");

	output("\n\nShe grabs your hip and lines her cock tip with your pucker. You will yourself to relax before she splits your ass open. In the blink of an eye your ass is filled with cock, and her balls slap against your thighs.");
	//pc ass tight: 
	if(pc.analCapacity() < verushaCockVolume()) output(" You see white as she fills your tight ass with inches and inches of dick.");
	else output("You whimper as she stuffs your ass with cock. You fear that you have bitten off more than you can chew, but too late for second-guessing now.");
	pc.buttChange(verushaCockVolume());

	output("\n\nShe widens her stance a bit, before pulling out quickly. Taking her heavy dick in hand she slaps your [pc.ass] with it. She takes her hand off your neck, before spreading your ass wider with both hands and thrusting up to her sheath. The second time is much easier since you’re already spread wide, something that she takes great liberties with. She starts ramming her cock into you with punishing force, ramming over your prostate as if she’s trying to flatten it.");
	output("\n\nYou bite your lip hard, trying to not cum this early in. When she takes her hands off from your ass cheeks she grabs hold of [pc.oneCock] and starts to roughly jerk it, squeezing it very hard.");
	if(pc.balls > 0) 
	{
		output(" She grabs your [pc.sack] with her other hand, squeezing and pulling your [pc.balls].");
	}
	output(" You can barely take it anymore; the sweet mixture of pain and pleasure is pushing you towards the edge.");
	output("\n\nWhen she bites down at the side of your neck you can’t take it anymore. Your muscles clench around her canine cock, and with a breathless moan your [pc.cock] shoots your load all over the wall.");
	if(pc.cumQ() >= 100) output(" As the water keeps washing away your [pc.cum], you keep shooting rope after rope of it over the wall.");
	output(" She continues fucking your ass through your orgasm, completely ignoring you and only focusing on taking her pleasure from your [pc.asshole].");

	output("\n\nShe picks you up, spins you around and slams you against the wall again, keeping her cock inside your now-welcoming asshole. She seems to be getting close herself, her breath quick, her knot swollen. Her muzzle is right next to your ear but she’s beyond words now, heavy panting is all you hear as she keeps plowing your ass without a pause for breath.");
	output("\n\nWhen you come down from the afterglow of your orgasm, she hasn’t even slowed down, yet. As she keeps railing against your sensitive prostate you whimper pitifully from the punishing your prostate is taking. The moment the sound escapes your lips you jump as her jaw snaps shut right next to your ear. She grabs both of your wrists and pulls you down on her knot. ");
	//pc ass tight: 
	if(pc.analCapacity() < verushaCockVolume() * 1.5) output("You whimper and moan as she tries to force her knot into your ass, but your tired muscles can’t stand against both gravity and her soaking wet bitch breaker. After a while your ass gives up and swallows the meaty bulb of flesh");
	else output("She pulls you on her knot hard, almost harder than you expected, smushing her soaked wet sheath against your rim in the process");
	output(". With an almost feral growl, she starts pumping her cum into your ass. It floods every nook and cranny of your ass her knot keeping all of it where it belongs: inside you. Looking down, you see your belly swelling with her seed, stopping when it looks roughly eight months pregnant.");
	pc.buttChange(verushaCockVolume());

	output("\n\nShe isn’t pumping any more cum into you but she’s still standing there, panting into your [pc.ear]. You wiggle a bit, trying to get comfortable in the position.");

	output("\n\nEventually, her knot goes down, allowing her to withdraw from your ass. Her knot leaves your ass with a mighty pop and a cascade of spunk. She lets go of you out of the blue, and you fall ass first onto the shower floor. You look up at her, your face twisted into a scowl, and you’re about to demand her what’s going on before you see her face. You have never seen her like that. There is something about the way she looks at you that makes you decide against saying anything. She grabs ");
	if(pc.hasHair()) output("your [pc.hairNoun]");
	else output("the back of your head");
	output(" before shoving your face against her balls, rubbing her furry sack and soft dick all over your face. This treatment lasts for a moment before she abruptly stops, turning the shower off. She lifts you up from the shower, grabs a towel, and starts to roughly to rub you down with it, drying you off. It feels like she’s maintaining something after use, like you aren’t anything but something to be used for her pleasure that she doesn’t want to break.");
	output("\n\nShe picks you up again when you’re dry and carries you back to the bedroom laying you on the bed, before asking, <i>“Are you alright, Steele?”</i> You nod, pulling up the covers, exhausted from the fucking she gave you. She walks back to the bathroom before you fall asleep.");
	processTime(30);
	pc.orgasm();
	pc.shower();
	pc.loadInAss(verushaPP());
	clearMenu();
	addButton(0,"Next",verushaShowerReamEpilogue);
}

public function verushaShowerReamEpilogue():void
{
	clearOutput();
	showVerusha();
	output("When you wake up, Verusha is nowhere to be seen, but you have a message on your codex. Flipping it open you see that it’s from her. <i>Sorry if I was too rough, but I get like that when I get a proper fucking. Next time leave me alone for the shower, but if you want me to fuck you like that again feel free to bother me in the shower again.</i> You close your codex before laying back on the bed.");
	output("\n\nAfter a moment you get up, still sore from her fucking. You put your [pc.gear] back on before getting ready for another day on the frontier.");
	processTime(6*60);
	verushaQuickwalkOption();
}

//[Humiliation] (requires PC cock length no more than 6)
public function verushaSPH():void
{
	clearOutput();
	showVerusha(true);
	var x:int = pc.smallestCockIndex();
	output("She sits up, looking down at your [pc.cock]. She snickers, <i>“What a cute little morsel you have.”</i> She bends down, running her broad tongue up your length. <i>“But I don’t think this little piece of meat could possibly satisfy my hunger. Maybe a tight-pussied virgin, but someone like me? No.”</i> She licks your [pc.cock] again. You whimper as she grins widely, her sharp teeth a breath away from your sensitive member.");
	output("\n\nShe wraps her lips around your [pc.cockHead], sucking on it before taking your whole length into her muzzle, her nose touching your [pc.sheath]. She bobs her head along your length in an agonizingly slow manner. You try to resist the urge to grab her head and fuck her face. You know that she wouldn’t like it and she would probably pull out if you did, but the urge to do so is overwhelming.");
	output("\n\nYou can’t resist your urges anymore, and when she starts to pull back again you grab onto the back of her head and pull her down on your dick while thrusting upwards. She doesn’t do anything while you thrust into her mouth repeatedly, she just looks at you while you keep at it. Once you realize what you are doing you let go of her head with a yelp.");
	output("\n\nShe slowly pulls off of your cock with a slurp, looking you straight in the eye with a wicked grin on her face. Before you can offer any kind of apology, she speaks up. <i>“Don’t worry about it. I understand that your dick doesn’t get that much attention. Besides, you couldn’t bring me any discomfort with a bitch clit like this.”</i>");
	output("\n\nShe pushes the flat of her palm against your pecker, pressing it down against your crotch before grinding it softly. <i>“Isn’t it nice to get some attention for this tiny thing every now and then?”</i> She chuckles before extending her middle finger. <i>“My finger is almost bigger than your bitch boner. What kind of woman would be satisfied by this?”</i> She wraps her fingers around your [pc.cock], starting to stroke it lazily.");
	output("\n\nHer pace is so slow that it doesn’t bring you any real pleasure, just keeps you hard. After a while you start to beg for her to go faster. At first the sound barely escapes your lips. She ignores you and continues slowly rubbing her hand up and down your dick. Your whines and pleas keep getting louder until you’re almost screaming your lungs out.");
	output("\n\n<i>“Oh, you wanted me to go faster? Why didn’t you say so?”</i> she teases you before tightening her grip and starting to stroke faster.");
	output("\n\nJust as you start to get into it, she lets go of your dick, slapping her own canine cock on your [pc.cock], pinning it under the weight of her erection. <i>“This is a proper dick, dear, not like that puny thing you have.”</i> She gives a few thrusts of her hips, rubbing your cocks together.");
	output("\n\n");
	if(pc.isNice()) output("You reach out, grabbing her tapered tip, rubbing it between your fingers. <i>“It’s definitely a nice cock. But don’t you think it’s a bit too large? I mean, how many girls can take this beast?”</i>");
	else if(pc.isMischievous()) output("<i>“Hmm, I don’t know. Are you sure that you’re not overly big?”</i> You circle her tapered tip with one finger.");
	else output("<i>“Hmm, I don’t think so. I mean, what are you going to do with a ridiculously large cock like this? It’s basically useless.”</i> You lift the tip of her cock with your finger.");

	output("\n\n<i>“Hah! Says the bitch who gave me permission to bend you over and fuck you anyway I want.”</i> She laughs before dropping down, her hands next to your head, your cocks sandwiched between you both. She thrusts her hips again, rubbing your erect lengths together. With you both leaking pre and her quick blow job earlier, your crotches are a mess of spit and pre, making it easy for her to keep thrusting against your prick. She keeps at it until you’re moaning softly, starting to make your way to orgasm.");
	output("\n\nAs if her sucking your dick, jerking it and rubbing her own erection against it wasn’t enough, she starts to pull and twist your [pc.nipples]. She keeps tormenting your sensitive buds, a streak of pain running through the pleasure. She lets go of your other nipple and instead brings it to her mouth, circling it with her tongue and nibbling on it.");
	output("\n\nSuddenly, she lifts your legs above her shoulders, making your [pc.ass] a prime target for her. She gathers some of her pre from her tapered tip, slathering her fingers with it. It doesn’t take a genius to know what’s she’s planning to do, you think to yourself, before she pierces your ass with her fingers. She grabs onto your [pc.cock] and jerks it rather roughly. Shortly after this, she plugs your [pc.asshole] with her fingers, pressing them deep inside you, searching for your prostate. Once she locates it, she presses down on it mercilessly, squeezing out a drop of pre from your [pc.cockHead].");
	output("\n\nYou can’t withstand the assault on both your [pc.cockNounSimple] and your prostate. With a final hard press on your prostate, you cum with a whimpering moan, your [pc.cum] shooting forth from your [pc.cockHead], landing on your [pc.chest]. ");
	var cumQ:Number = pc.cumQ();
	if(cumQ < 100) output("You give yourself a nice, [pc.cumColor] coating before your output starts to die down.");
	else if(cumQ < 2000) output("You manage to coat most of yourself in [pc.cumVisc] cum, and then some.");
	else output("Once the tide breaks, there is no stopping it; your [pc.cum] just keeps coming, coating you from waist up in your own jizz. There is so much that it overflows onto your bed, creating a pool of your own cum to lie in.");
	output(" She directs the last rope of your cum straight into your own mouth, and before you can even think she presses her hand over your mouth, non-subtly urging you to swallow. Once you do, she removes her hand from your maw.");
	if(cumQ < 100) output(" <i>“Tch, I was kind of hoping for more.”</i>");
	else output(" <i>“What a mess you made! I have to hand it to you, pretty impressive show for someone with a puny member like yours.”</i>");

	if(pc.biggestTitSize() >= 5) output("\n\nShe grabs onto your [pc.breasts], mauling your tits. <i>“Now, I could find a use for these.”</i> Licking her lips, she spreads your [pc.breasts] and places her manhood between them. She presses your tits together, sandwiching her cock between your boobs. She begins to thrust into your breasts, jerking off with your tits. Your cleavage turns wet and slippery as she keeps thrusting her spit- and pre-covered cock into your lush chest. You start licking her tip everytime it gets close enough, occasionally kissing it. You occupy your hand on her balls and knot, massaging two of the orbs below her cock and the one on it.");
	else output("\n\nYou grab onto her cock with both hands, one at her tip the other at her knot. You bring it closer to your mouth, wrapping your [pc.lips] around her tapered tip. She fills your mouth with pre cum as you squeeze her knot. Paying her back for her two-sided assault earlier, you start to stroke the flesh between your lips and her knot, your hand sliding easily along the slick length.");

	output("\n\nDespite what she said, she seemingly did like seeing you cum, since she isn’t that far off from orgasm. Her knot pulses in your hand and pre-cum leaks faster than before. Swallowing her tip deeper into your greedy mouth is all it takes to set her off. You feel each surge of her cum surging through her dick on your lower lip.");

	output("\n\nAfter swallowing a couple mouth fulls of her cum, she pulls out, covering your already messy face in more cum. When she’s done painting you in cum your face is behind a mask of white");
	if(cumQ > 1000) output(", not that it wasn’t already, but now just more so");
	output(". When you wipe the cum from your eyes you’re faced with a broad, wet tongue. You barely manage to close your eyes before she licks some cum off your face.");

	output("\n\nShe keeps lapping up the mixture of cum, and once your face is clean she urges you to open your mouth. When you do, she invades your mouth with her tongue, snowballing the mixture of her cum and yours into your mouth. You end up swallowing a lot more cum by the end since she’s intent on leaving you spotless. Once she’s done, you aren’t clean, per say, as you’re covered in her spit.");

	output("\n\nHaving gotten her rocks off she still seems intent on teasing you. She places her dick, which is semi-erect again, on your flaccid dick. <i>“You don’t need to feel bad about your inferiority. I happen to like pathetic " + pc.mf("bitch boys","bitches") + " like you.”</i> She spends a few minutes stroking your [pc.cock], teasing your [pc.nipples], and nipping on your neck, teasing you until you’re hot and bothered once more. She gives your erect shaft a final stroke before giving you a teasing smile and a wave of her hand, and walks off.");
	output("\n\nAfter a while, you decide to get up. Gathering your [pc.gear] you to get back out into the world.");
	processTime(50);
	pc.orgasm();
	pc.applyCumSoaked();
	pc.loadInMouth(verushaSmolPP());
	verushaQuickwalkOption();
}

public function verushaQuickwalkOption():void
{
	output("\n\n<b>You can choose to stay in your ship, if you’d like. Otherwise, you’ll amble back to the bar.</b>");
	clearMenu();
	addButton(0,"Next",moveToTarkusBar);
	addButton(1,"Stay",mainGameMenu);
}
public function moveToTarkusBar():void
{
	processTime(5);
	//Run this before clearing the text buffer for sneaky-deaky update of current bar patrons.
	roamingBarEncounter(0);
	clearOutput();
	currentLocation = "302";
	generateMap();
	output("Traveling back to Tarkus’s Bar takes little more than a handful of minutes.");
	if(flags["BAR_NPC"] == verushaBonusFunc) output(" Verusha is still there. She smirks at your rapid return and pats her lap encouragingly.");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}