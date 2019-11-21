/* Velta by Franks*/

/**
	 * ...
	 * @author DrunkZombie
	 */
/*

New Flags:

	[VELTA_MET] // 1 = met
	[VELTA_TALK_FAMILY] // 1 = talked
	[VELTA_TALK_COLLEGE] // 1 = talked
	[VELTA_TALK_HOBBIES] // 1 = talked
	[VELTA_FUCK_VAG] // counter
	[VELTA_FUCK_ANAL] // counter
	[VELTA_ANAL_TIMER] // counter

*/
//show nude or reg bust
public function showVelta(nude:Boolean = false):void
{
	if (flags["VELTA_MET"] == 1) showName("\nVELTA");
	else showName("\nJOGGER");
	showBust("VELTA" + (nude ? "_NUDE" : ""));
	author("FRANKS");
}
public function veltaIsJogging():Boolean
{
	if ((hours >= 5 && hours <= 7) || (hours >= 17 && hours <= 18)) return true;
	return false;
}
public function veltaIsSleeping():Boolean
{
	if (hours >= 22 || hours <= 4) return true;
	return false;
}
public function veltaAptOpen():Boolean
{
	if (flags["VELTA_MET"] == 1 && !veltaIsJogging() && !veltaIsSleeping()) return true;
	return false;
}
public function veltaSexOK():Boolean
{
	//cannot have vag, must have tone 60, 8 inch cock that fits and balls
	if (!pc.hasVagina() && pc.tone >= 60 && pc.tallness >= 72 && pc.biggestCockLength() >= 8 && pc.cockThatFits(chars["VELTA"].vaginalCapacity(0)) >= 0 && pc.balls > 0) return true;
	return false;
}
public function veltaAnalOK():Boolean
{
	if (flags["VELTA_ANAL_TIMER"] == undefined) return true;
	//24 hour cooldown
	if (GetGameTimestamp() > (flags["VELTA_ANAL_TIMER"] + (24 * 60))) return true;
	return false;
}
public function veltaAptBonus():void
{
	if (!veltaAptOpen()) flags["NAV_DISABLED"] = NAV_EAST_DISABLE;
}
public function veltaShowVeltaJogging():Boolean
{
	if (!veltaIsJogging()) return false;
	clearMenu();
	if (flags["VELTA_MET"] == 1)
	{
		output("\n\nVelta is exercising nearby, alternating between jogging, doing jumping jacks, pushups, and occasionally grabbing onto a ledge for an improvised pull-up bar.");
		addButton(0, "Velta", veltaApproach, undefined);
	}
	else
	{
		output("\n\nThere is a small, dark-skinned human woman exercising nearby, alternating between jogging, doing jumping jacks, pushups, and occasionally grabbing onto a ledge for an improvised pull-up bar.");
		addButton(0, "Jogger", veltaApproach, undefined);
	}
	
	return false;
}

public function veltaApproach():void
{
	clearOutput();
	showVelta(false);
	
	clearMenu();
	if (flags["VELTA_MET"] == 1)
	{
		veltaMainMenu();
	}
	else
	{
		flags["VELTA_MET"] = 1;
		output("Seeing the woman stretching after finishing a set of pushups, you decide now is a good chance to approach her. She looks up as you approach, standing and taking her earphones out. Planting her hands on her hips, she cocks her head at you curiously. <i>“Hey, you. Guess you’re looking for an introduction, then? I’m Velta. Velta Krievs. And you...?”</i>");
		output("\n\nYou introduce yourself, and the mocha woman blinks a few times, recognition flitting over her features briefly. <i>“Oh. Nice to meet you! I’m on Tavros for college. I’m studying to be a body mod researcher, and I’m probably gonna work for you in a few years,”</i> she says, pouting suddenly. <i>“I wanted to be an officer in the U.G.C. Marines like my cousin, but she wouldn’t let me. Can you believe she even threatened to stop paying for my college!?”</i> she says indignantly, sighing. <i>“Oh, well. Science was my next choice anyway,”</i> she grumbles, clearly displeased.");
		output("\n\n<i>“That’s weird,”</i> you say - why wouldn’t her cousin want her to follow in her footsteps?");
		output("\n\n<i>“I dunno. Something about me being too sweet to survive there - like I can’t take care of myself,”</i> she says indignantly, pausing and looking you in the eyes, mismatched orbs glinting.");
		output("\n\n<i>“</i>You<i> think I can take care of myself, right?”</i>");

		processTime(5);
		addButton(0, "Yes", veltaApproachTakeCareYes,undefined, "Yes", "Whatever you say, lady.");
		addButton(1, "No", veltaApproachTakeCareNo,undefined, "No", "Rude, but probably honest.");
	}
}
public function veltaApproachTakeCareYes():void
{
	clearOutput();
	showVelta(false);
	
	output("Of course she can take care of herself! You can’t believe her cousin would ever think otherwise. Such a strapping young lass - of <i>course</i> you’re serious!");
	output("\n\nShe looks suspicious for a brief moment, then just sighs. <i>“Yeah, I know. You know I’m a black belt in Judo? I’m a qualified instructor too! Not that it matters. Every time I try to talk to the Tavros recruiters they look like they’re gonna piss themselves. Of <i>course</i> she got to them first,”</i> she ends morosely. <i>“So yeah, I’m studying to be a scientist. Hey, it’s a good living and a good job! I’ll be making credits hand over fist, even if it’s not what I wanted to do at first.”</i> she says, sounding like she’s trying to convince herself more than anyone else.");
	
	processTime(1);
	clearMenu();
	addButton(0, "Next", veltaMainMenu);
}
public function veltaApproachTakeCareNo():void
{
	clearOutput();
	showVelta(false);
	
	output("Well... you look away, then up at the ceiling, then down at the floor, then back at her sheepishly.");
	output("\n\nWell, you begin, mustering all of your patented Steele tact... she is rather small. And small people don’t tend to be very good at fighting big people. You’re sure her cousin doesn’t mean any harm, she just doesn’t want her to get hurt! And there’s no shame in admitting you can’t do something. Sometimes you’re just not made for something. Like being a U.G.C. Marine.");
	output("\n\nVelta blinks at you... once, then twice...");
	output("\n\nAnd then you see the tears forming at the corners of her multicolored eyes, her cute face screwing up in a mixture of impotent rage and humiliation. She sniffles ominously, blinks a few more times, sniffles again, and then the waterworks really start, the tiny woman going from zero to a hundred in the blink of a tear-filled eye. <i>“");
	if (silly) output("What the fuck did you just fucking say about me, you little bitch? I’ll have you know I graduated top of my class in the Navy Seals, and I’ve been involved in numerous secret raids on the Black Void, and I have over 300 confirmed kills. I am trained in gorilla warfare and I’m the top sniper in the entire UGC armed forces. You are nothing to me but just another target. I will wipe you the fuck out with precision the likes of which has never been seen before in this galaxy, mark my fucking words. You think you can get away with saying that shit to me over the Internet? Think again, fucker. As we speak I am contacting my secret network of spies across the UGC and your IP is being traced right now so you better prepare for the storm, maggot. The storm that wipes out the pathetic little thing you call your life. You’re fucking dead, kid. I can be anywhere, anytime, and I can kill you in over seven hundred ways, and that’s just with my bare hands. Not only am I extensively trained in unarmed combat, but I have access to the entire arsenal of the United Galactic Confederacy and I will use it to its full extent to wipe your miserable ass off the face of the continent, you little shit. If only you could have known what unholy retribution your little “clever” comment was about to bring down upon you, maybe you would have held your fucking tongue. But you couldn’t, you didn’t, and now you’re paying the price, you goddamn idiot. I will shit fury all over you and you will drown in it. You’re fucking dead, kiddo,");
	else output("You-you’re-you’re MEAN! I’LL HAVE YOU KNOW I’M A BLACK BELT IN JUDO!! YOU COULD AT LEAST <b>PRETEND</b>, YOU JERK!” she bawls, tears suddenly pouring down her cocoa cheeks. “I CAN’T BELIEVE THIS! SOMETIMES A GIRL JUST WANTS TO BE TOLD WHAT SHE WANTS TO HEAR, YOU <b>JERK</b>! I KNOW I’D BE A BAD MARINE, OKAY!? YOU DON’T GOTTA RUB MY FACE IN IT LIKE THIS! JERK! JERK! JERK!"); 
	output("”</i> she chants petulantly, pumping her fists up and down at her sides. You suppose you know now why her cousin doesn’t want her in the military... well, at least the motion is making her chest bounce.");
	output("\n\nAs you frantically try to calm the hysterical girl down, she continues to comically berate you - she’s certainly giving you an earful, but she’s managing to do so without uttering a single foul word. Quite an accomplishment, in this galaxy.");
	output("\n\nUnfortunately, not drawing attention to the two of you isn’t one of her talents. Numerous busybodies are shaking their heads disapprovingly at you, taking the cute brown girl’s side without having any idea what’s going on. You’re innocent! ...but not in the court of public opinion. Finally, you manage to quiet the childish college student, but not before an elderly Ausar woman with her gray ears pinned back against her skull berates you for ‘playing games with lovely young women’s hearts’, leaving the jogging teen smug as can be as the crone hobbles off, leaning heavily on her cane and ranting about how cruel young folk can be.");
	output("\n\nVelta one, Steele zero...");
	
	processTime(10);
	clearMenu();
	addButton(0, "Next", veltaMainMenu);
	
}
public function veltaMainMenu():void
{
	clearOutput();
	showVelta(false);
	
	output("<i>“Yeah?”</i> Velta says, looking at you curiously. <i>“What’s on your mind?”</i>");

	clearMenu();
	addButton(0, "Talk", veltaTalkMenu);
	if (flags["VELTA_TALK_FAMILY"] == 1 && flags["VELTA_TALK_COLLEGE"] == 1 && flags["VELTA_TALK_HOBBIES"] == 1) addButton(1, "Sex", veltaSexMenu);
	else addDisabledButton(1, "Sex", "Sex", "You should get to know her a little better first.");
	addButton(2, "Appearance", veltaAppearance);
	addButton(14, "Leave", mainGameMenu);
}
public function veltaTalkMenu(apt:Boolean = false):void
{
	clearOutput();
	showVelta(false);
	
	output("<i>“Yeah?”</i> Velta says, looking at you curiously. <i>“What’s on your mind?”</i>");
	
	processTime(10);
	addButton(0, "Family", veltaTalkFamily, apt);
	addButton(1, "College", veltaTalkCollege, apt);
	addButton(2, "Hobbies", veltaTalkHobbies, apt);
	if (apt) addButton(14, "Back", veltaApartmentFunc);
	else addButton(14, "Back", veltaMainMenu);
}
public function veltaTalkFamily(apt:Boolean = false):void
{
	clearOutput();
	showVelta(false);
	
	output((apt ? "Y" : "As Velta begins her exercise regimen again, starting on a set of jumping jacks, y") + "ou ask what her family is like, prompting a pleased little <i>‘hmm’</i> from the girl. <i>“They’re pretty nice. There’s me, my mom and dad, and I have two sisters and two brothers. My dad is from Latvia, and my mom is from India - mom was a cop back when they met. She said she pulled my dad and his buddies over for speeding while he was on vacation in India with his friends, and that’s how they met; she loves telling that story. She says he got out of the backseat, looked her dead in the face, and said ‘I’m not as think as you drunk I am, officer.’”</i> she says, giggling uncontrollably as she recounts the story. <i>“And then she said he threw up all over her boots!”</i>");
	output("\n\nShe outright cackles at this, but you’re finding yourself dumbfounded; just how in the hell did dear old dad manage to pull off a marriage and five kids after <b>that</b>!? Velta keeps laughing for a moment" + (apt ? "" : ", halting her jumping jacks to double over, curious passerby glancing over") + " before she continues. <i>“Well, mom took down his cell number and hotel room. Then she waited until the next day when he was sober, went to his room while she was off-duty, and gave him the receipt for getting her boots cleaned. He paid back double the cost, and then he asked her out. She’s always said she still doesn’t know why she said yes, but here I am, so I guess it worked out!”</i>");
	output("\n\nYou guess so too, as strange of a love story as it is. But Velta isn’t quite done yet");
	if (apt) output(".");
	else output("; stopping her jumping jacks, she starts into another round of stretches, huffing and puffing as the sheen of sweat she’s picked up from her exercise becoming obvious now that she’s taking a break. She pulls her canteen from her waist, taking a few small gulps from it before continuing. She must be pretty serious about her workout routine - you don’t know how long she’s been out here, but she looks pretty tired and she’s still plugging away! And well, if you even needed any more proof of her dedication, you might just look at those washboard abs, glistening with sweat. Hot chocolate, goddamn... Swallowing hard, you force yourself to pay attention to what she’s saying.");
	output("\n\n<i>“I’m the youngest, too! My oldest sibling is my brother - he’s a Naval cryptologic officer stationed out of Ausaril. Then after him is another brother - he’s a librarian back home on Earth. Works in the Grand Archive of the Terran Coalition!”</i> she says proudly" + (apt ? "" : ", wiping some sweat from her brow") + ". <i>“Then there’s my older sister, she’s a firefighting instructor for a safety firm. My youngest sister is an armed security guard for my uncle’s freight company, and then there’s me, still in college.”</i> she says" + (apt ? "" : ", taking another swig of water before replacing her canteen at her waist") + ". <i>“But I’ll beat them all one day. I’m gonna be the best damn researcher in the <b>galaxy</b>!”</i>");
	
	flags["VELTA_TALK_FAMILY"] = 1;
	processTime(5);
	addDisabledButton(0, "Family","Family","You just talked about this.");
}
public function veltaTalkCollege(apt:Boolean = false):void
{
	clearOutput();
	showVelta(false);
	
	output((apt ? "Y" : "Seeing Velta stop and go into another round of stretches, y") + "ou figure this is the best time to spring your next question; what is college life like? Being privately tutored yourself, you’ve never been in a college, or really any school with other students." + (apt ? "" : " She shrugs, starting on a set of squats."));
	output("\n\n<i>“It’s okay, I guess? I don’t have anything to compare it to, really. I have the option to live in a dorm, but I rent a room from my cousin instead. It’s pretty nice. I just pay utilities, no rent. Sucks trying to squeeze my workout schedule in around classes, but I’m managing.”</i>");
	output("\n\n<i>“How many years you in for?”</i> you ask next, drawing a snicker out of Velta" + (apt ? "" : " as she finishes her squats and immediately drops onto all fours") + ".");
	output("\n\n<i>“You make it sound like I’m in prison or something,”</i> she jokes" + (apt ? "" : ", tucking one arm behind her back and effortlessly beginning a set of one-armed pushups. Impressive") + ". <i>“Four years. I’m a freshman - just started a month ago,”</i> she says" + (apt ? "" : ", grunting quietly as she hits her tenth pushup") + ".");
	output("\n\n<i>“So you’re... how old are you?”</i> you ask.");
	output("\n\n<i>“Am I being detained, officer? I don’t think I’ve been read my rights. Are you gonna cuff me next? Push me up against a wall and do a cavity check? Why are you interrogating me?”</i> she fires back, laughing.");
	if (!apt) output(" Then she throws herself up with her arm, it’s partner snapping out from behind her back to catch her. She resumes her pushups without a moment’s pause, every muscle on her shoulder and arm standing out in high definition as the sweat glistens on her cocoa skin...");
	output("\n\n<i>“I’m eighteen.”</i> she says next" + (apt ? "" : ", grunting again") + ". That’s... young. Younger than you, actually.");
	
	flags["VELTA_TALK_COLLEGE"] = 1;
	processTime(5);
	addDisabledButton(1, "College","College","You just talked about this.");
}
public function veltaTalkHobbies(apt:Boolean = false):void
{
	clearOutput();
	showVelta(false);
	
	output("<i>“So what do you do in your free time?”</i> you ask" + (apt ? "" : " as Velta starts stretching again, pulling her canteen off her hip and taking a few deep gulps before replacing it") + ".");
	output("\n\n<i>“Working out is a big one, obviously.”</i> she says");
	if (!apt) output(" as she plants her feet wide apart and squats in place, holding the position with her arms extended straight out from her torso.");
	else output(".");
	output("\n\n<i>“I play some video games too - </i>Occiyre<i> is a big one, if you’ve ever heard of that, but I’m not into it like my cousin is. She usually ends up carrying me every time we play together. I only even hit level cap because she carried me. I’m way more into </i>Ships of the Grand Battlefleet<i>.”</i> she says, noting your obvious confusion before going on to explain the nature of the game. It’s a VR game, unsurprisingly; First, the players of each team select various obsolete spacefaring warships. Then the game puts them in the shoes of a commander on the bridge, giving them a first-person view of their bridge and officers. The player commands their vessel from there, ordering course changes, calling targets and evasive maneuvers, and various other duties. Maybe the two of you can play it sometime, maybe not...");
	
	flags["VELTA_TALK_HOBBIES"] = 1;
	processTime(5);
	addDisabledButton(2, "Hobbies","Hobbies","You just talked about this.");
}
public function veltaSexMenu(apt:Boolean = false):void
{
	clearOutput();
	showVelta(false);
	
	processTime(5);
	clearMenu();
	output("Turning on the patented Steele charm, you ask the fitness-loving girl if she’d like to do some intense cardio with you.");
	if (veltaSexOK())
	{
		output("\n\n<i>“Weeelllll...”</i> she purrs as she looks you up and down, <i>“I’m sure I could fit you in, muscles.”</i>");
		addButton(0, "Vag", penisRouter,[veltaSexVag,chars["VELTA"].vaginalCapacity(0),false,6]);
		if (veltaAnalOK()) addButton(1, "Anal", veltaSexAnal, apt);
		else addDisabledButton(1, "Anal","Anal","You need to wait a day before doing this again.");
		if (apt) addButton(14, "Back", veltaApartmentFunc);
		else addButton(14, "Back", veltaMainMenu);
	}
	else
	{
		output("\n\nShe takes a good look at you before shaking her head slowly. <i>“Sorry, [pc.name]. You’re just not my type. Tall, strong, and handsome is more my speed. We can still be friends, though - if you want, I mean.”</i>");
		
		// Specs
		output("\n\n<b>It seems she’s looking for a");
		if(pc.tallness < 72) output(" taller");
		output(" ma" + (pc.hasVagina() ? "le" : "n"));
		if(pc.tone < 60) output(" with high muscle tone");
		var hasCock:Boolean = (pc.hasCock());
		var hasBigCock:Boolean = (hasCock && pc.biggestCockLength() >= 8);
		var hasCockThatFits:Boolean = (hasCock && pc.cockThatFits(chars["VELTA"].vaginalCapacity(0)) >= 0);
		var hasBalls:Boolean = (pc.balls > 0);
		if(!hasBigCock || !hasCockThatFits || !hasBalls)
		{
			output(" who possesses");
			if(!hasBalls)
			{
				output(" testicles");
				if(!hasBigCock || !hasCockThatFits) output(" and");
			}
			if(!hasBigCock || !hasCockThatFits)
			{
				output(" a");
				if(!hasBigCock) output(" large enough");
				output(" penis");
				if(!hasCockThatFits) output(" that fits her");
			}
		}
		output(".</b>");
		
		if (apt) addButton(14, "Back", veltaApartmentFunc);
		else addButton(14, "Back", veltaMainMenu);
	}
}
public function veltaSexVag(kok:int=0):void
{
	clearOutput();
	showVelta(true);
	var firstTime:Boolean = true;
	if (flags["VELTA_FUCK_VAG"] > 0) firstTime = false;
	if (kok < 0) kok = 0;
	var apt:Boolean = false;
	if (currentLocation == "RESIDENTIAL DECK VELTA") apt = true;
	else moveTo("RESIDENTIAL DECK VELTA");

	if (!apt)
	{
		output("Taking your hand, the human girl turns and begins leading you swiftly towards the station elevator. Not wasting any time, is she?");
		output("\n\nAs the pair of you enter the elevator, her assault is already beginning - the tiny woman presses herself against your side, one hand groping your [pc.ass] while the other fondles your [pc.balls] through your gear. You look down at her to see her shamelessly staring back up at you. She winks as you meet her gaze, mouth opening to speak.");
		output("\n\n<i>“What? You’re the one who came onto me. I have a right to know what I’m working with!”</i>");
		output("\n\nWell, you’re not <i>really</i> complaining.");
		if (pc.isCrotchExposed()) output(" Definitely not while your prick is standing to attention in the open air");
		else output(" Definitely not while your prick is stiffening inside your [pc.crotchCovers]");
		output(", Velta’s petite hand expertly massaging and teasing it...");
		output("\n\nYou jump almost a foot into the air as something pokes into your asshole through your clothes - you’d almost forgotten about her other hand! She snickers mischievously at your startled expression, her hand going back to groping and squeezing your buns. It looks like she’s about to say something else, too... before the elevator door opens, revealing a pale, scrawny-looking ausar girl with messy brown hair wearing baggy jeans and a t-shirt that looks multiple sizes too large for her. Her face is practically glued to the handheld game she’s playing, so much so that she doesn’t notice the two of you or the compromising position you’re in until she almost walks into you. She stops suddenly, face reddening she starts to back away... but Velta is already dragging you past her with frightening strength considering her size. As the two of you step onto the residential deck, you hear a mournful wail from the closing elevator behind you.");
		if (firstTime) output("\n\n<i>“GOD DAMN IT, NOW I HAVE TO START THIS LEVEL OVER FROM THE BEGINNING!”</i>");
		else output("\n\n<i>“GOD DAMN IT, NOT AGAIN!”</i> you hear the Ausar nerd cry out; you have to idly wonder why you keep running into her.");
		output("\n\nVelta actually looks a bit remorseful, but that doesn’t stop her from continuing to drag you through the residential deck,");
		if (pc.isCrotchExposed()) output(" only now with your [pc.cocks] bouncing along as you go.");
		else output(" only now with a rather distinct bulge distending your [pc.crotchCovers].");
		output(" People are staring...");
		output("\n\nYou reach her apartment not long after that; she has the door open with impressive speed, and you’re in soon after, the tiny woman locking the door after you. Before you can react, she’s on you again, this time pinning your back against the nearest wall and practically tearing your gear and clothes off.");
	}
	else output("Before you can react, she’s on you, pinning your back against the nearest wall and practically tearing your gear and clothes off.");
	
	if (pc.isChestExposed()) output(" Her hands trace down your hard body");
	else output(" First your top, revealing your hard body");
	output(", then she goes to her knees");
	if (pc.isCrotchExposed()) output(", trails feather-light fingers over your [pc.thighs]...");
	else if (!pc.isCrotchExposedByArmor()) output(" and starts on your pants...");
	else (".");
	
	if (pc.isCrotchExposedByLowerUndergarment()) output("\n\n");
	else output("\n\nShe wastes no time tugging your [pc.crotchCoverUnder] down, your steele-hard prick springing free in front of her face. ");
	output("Her sports bra is gone not long after, the young human reaching behind her back to unclasp it; her palmable tits are out a moment later as the garment hits the floor, dark brown nipples already stiff with arousal.");
	
	output("\n\nShe licks her lips and pops your cockhead into her mouth, swirling her tongue around the tip expertly before pushing her head further down. She’s... you shiver in pleasure as the wet warmth of her mouth envelops your [pc.cock " + kok + "]. She’s swallowing it slowly, steadily, <i>easily</i>.");
	if (pc.cocks[kok].cLength() >= 12) output(" Even as she reaches the midway point of your monster dong, she shows no sign of stopping, her steady pace unhampered by your length. If anything she seems to be savoring it, even as you feel your prick entering the constricting heat of her throat.");
	else output(" She’s having no trouble at all swallowing your length, her head moving smoothly up and down your shaft as she braces her hands against your thighs.");
	output("\n\nShe’s pretty damn good at this, especially for being so young. You look down to see her mismatched eyes gazing back up at you, lidded with lust as she impales her face on your prick again and again... she pushes her head down to your crotch again as she notices your gaze, maintaining eye contact. You feel her throat begin to constrict around your cock, hot and tight, massaging you... she’s swallowing, you realize as pleasure courses through your body. ");
	output("\n\nIf she keeps up like this, you’re gonna blow pretty damn quick - but she doesn’t, not for long at least. Possibly sensing your approaching orgasm, your dark-skinned lover pulls back, wrapping her lips around the head of your cock in a parting kiss before she stands and grips your wrist again, leading you further into her apartment.");
	output("\n\nHer bedroom is <i>pink</i>, so much so that it almost hurts your eyes. The walls are pink with white hearts and flower designs painted on them, the blankets, sheets, even the massive assortment of stuffed animals arrayed around the room are all pink. The only thing you readily notice that isn’t necessarily pink is her pillows; bright red and heart-shaped, they’re only barely a step away from the color of the rest of the room. You don’t have much time to focus on it though, not with Velta pushing you onto her bed, onto your back... she shimmies out of her pants and climbs onto the bed, straddling your hips and staring down at you, hunger in her heterochromatic eyes. She sits down slowly, resting her snatch - which you see now is unshaven, covered in soft black hair - atop the underside of your [pc.cock " + kok + "], slowly grinding her wet slit back and forth over your sensitive member.");
	output("\n\n<i>“Ready, [pc.name]?”</i> she coos, sliding her right hand up her washboard abs to trap one of her dark chocolate nipples between her thumb and forefinger. She keeps teasing you like that for what feels like an eternity, slowly rocking her hips back and forth, sliding her glistening slit over your almost painfully hard prick, staring down at you with that smug little grin...");
	output("\n\nJust when you’re about to throw her off you, bend her over the bed and teach her not to be such a fucking tease... she stops, sits up off your member and smiles, her right hand leaving her chest to grab your prick. Her smug grin turns into a full-on smile as she lowers herself onto you, her eyes fluttering shut. You can’t help but let out a groan of pleasure as you feel your tool pass through her soft black cunthairs to be enveloped by warm, wet heat - which revives your dark-skinned lover’s smug grin, her mismatched eyes snapping open to stare at you.");
	
	pc.cockChange();
	
	output("\n\n<i>“Too much for you, [pc.name]?”</i> she croons, sinking another inch of you into her clenching depths, rocking herself back and forth slowly to ease more dick into her body. <i>“You’re not gonna pop early, are you? That’d be bad. You’re not bad, are you?”</i> She leans down and forward, trapping each of your nipples between her slender fingers as she sinks fully onto your lap, exhaling sharply as she does so. <i>“Well? Are you a good [pc.boyGirl]?”</i> she asks imperiously, pinching your [pc.nipples] hard enough to make you squeal involuntarily. Nodding quickly, you tell her that yes, you are a good [pc.boyGirl]. She plants a kiss on your chest, unable to fully reach your face, and starts to slowly rock her hips, dragging you slowly in and out of her sweet, tight love tunnel. She’s clearly savoring this, and well... following her lead, so are you.");
	output("\n\nShe keeps toying with your [pc.chest] throughout, pinching and tweaking your poor nipples mercilessly, teasing them until every touch sends electric shivers through you. She stops her assault on your chest, raking her nails down your abs instead, then running her fingers over the hard muscles lining your torso, exploring them. <i>“Look at you.”</i> she croons, inhaling sharply as she rocks herself up and down your prick a bit faster, her breasts bouncing with every impact. <i>“So big and strong, but I still fucking </i>own<i> you. Isn’t that right, [pc.name]?”</i>");
	output("\n\nYou open your mouth to reply, but all that comes out is a groan of pleasure. You see her thighs twitch and feel her insides suddenly gripping you almost painfully tight, the tiny woman grinning as she rides you.");
	output("\n\n<i>“Like that, Steele? All those squats pay off, right? Feel those kegels working?”</i> she flexes and releases her thighs again and again as she says this, her insides massaging your length as she rides you to her heart’s content. An especially powerful flex drags another groan out of you and Velta sits fully on your lap, eyes shut. She’s breathing hard now, a light sheen of sweat covering her lean, sculpted form as she grinds herself back and forth on your crotch. She reaches out and grips your wrists, guiding your hands up her firm thighs, over her lean abs and up onto her chest. <i>“I... m’close.”</i> she mumbles, clumsily pushing one of your hands onto her modest tits. <i>“Play with ‘em. Now. G-good[pc.boyGirl].”</i> The other one... she pulls up to her soft, slender throat, placing your palm securely over her windpipe.");
	output("\n\n<i>“And fucking <b>choke me, bitch</b>.”</i> she orders, her hands settling on your chiseled abs.");
	output("\n\nYou comply, of course. One hand closes around her neck hard enough to make her gag and sputter for breath, her nails digging furrows into the skin of your stomach - she makes no move to stop you or escape, though. The other grips her chocolate nipples between your fingers just as she did to you, pinching and rolling them, kneading her breasts in your powerful hand as the nubile collegiate lets her head roll back to stare at the ceiling, mindlessly grinding her hairy cunt into your crotch. The effect of your actions becomes readily apparent a few moments later; Velta seizes up, head snapping forward. Her mismatched eyes are crossed now, you see, her body twitching and shaking with increasing violence - and then her insides practically crush your cock, contracting and releasing rhythmically as her biological programming kicks in, her body milking yours for seed with no input from her.");
	output("\n\nOf course, you can’t resist for long, not as close as you already are... not after you’ve already been brought this close. You feel pressure building in the pit of your stomach, your [pc.balls] tightening against your shaft as your own instincts kick in, countless thousands of generations of instincts telling - <i>ordering</i> you to seed your mate.");
	output("\n\nYour nut comes rushing up your shaft seconds later as your orgasm overwhelms you, your cock swelling and twitching as sperm rockets out of it and into the dark, warm, wet confines of Velta’s cunt.");
	var cumQ:Number = pc.cumQ();
	if (cumQ >= 3000)
	{
		output(" Your lover’s body is powerful and trim, and she’s clenching on you so hard it aches wonderfully - but not nearly hard enough to stop the cascade of jizz that pushes her belly out a few inches and widens her eyes with shock right before it gushes out of her overwhelmed twat, ruining the sheets below and thoroughly covering you.");
		pc.applyCumSoaked();
	}
	else if (cumQ >= 1000) output(" Some of your copious load overflows out of her despite the seal your [pc.cock " + kok + "] naturally forms, dribbling back down onto your crotch and hips as Velta whimpers at the intense sensation.");
	else output(" Not a drop of your alabaster virility is wasted, every swimmer you have trapped in her fit body as their quest to create life begins. Velta purrs happily at the sensation of being creampied, flexing her powerful kegels to milk even more of your seed out of you.");
	
	output("\n\nThe girl leans over you, slumping onto your chest as she comes down from her orgasmic high and catches her breath. She rolls off you after a moment, a bead of off-white cum leaking out of her well-fucked twat. Then, yawning, she shifts onto her side and wraps her arms around one of yours, her titties squishing up against the muscle. <i>“Mmnnnnnaptime.”</i> she mumbles, nuzzling her head into your shoulder. She’s snoring peacefully moments later... smiling, you pull a blanket over the two of you and allow yourself to drift off as well.");
	output("\n\nYour eyes slowly open an hour later to the sight of Velta with a towel wrapped around her chest, her black hair still soaked to her skull from the shower she clearly just took. <i>“Hey, sleepyhead. Take a shower and leave whenever you’re ready.”</i> she says amiably, wandering off towards her kitchen. Yawning as you rise, you do just that, the tiny collegiate standing on her tiptoes to give you a goodbye kiss as you walk out the door.");

	IncrementFlag("VELTA_FUCK_VAG");
	processTime(15 + rand(15));
	pc.orgasm();
	chars["VELTA"].loadInCunt(pc, 0);
	processTime(120);
	restHeal();
	pc.shower();
	clearMenu();
	addButton(0, "Next", move,"RESIDENTIAL DECK 17");
}
public function veltaSexAnal(apt:Boolean = false):void
{
	clearOutput();
	showVelta(true);
	var firstTime:Boolean = true;
	if (flags["VELTA_FUCK_ANAL"] > 0) firstTime = false;
	
	var kok:int = rand(pc.cockTotal());
	
	if (!apt) moveTo("RESIDENTIAL DECK VELTA");

	if (firstTime) output("Leaning down, you whisper into Velta’s ear that you want to try something - anal, specifically - if she’d be up for it, of course. She looks at you for a moment, blinking, before a lopsided, shit-eating grin" + (flags["MET_RIYA"] != undefined ? " that seems eerily familiar" : "") + " crawls across her face, her dual-tone eyes twinkling. <i>“Sure thing, Steele!”</i> she chirps, taking you by the hand and leading you off to her " + (apt ? "bedroom" : "apartment") + ".");
	else output("<i>“Sure thing, Steele!”</i> she chirps, taking you by the hand and leading you off to her " + (apt ? "bedroom" : "apartment") + ".");
	if (!apt)
	{
		output("\n\nThe trip is mostly uneventful; aside from wrapping her arms around one of your biceps and leaning her head(adorably) into your arm as you walk, she seems satisfied to simply walk you to her apartment.");
		output("\n\nWhen you get inside though, she instantly zips off into her bathroom, yelling back at you as the door shuts behind her. <i>“Get in the bedroom and get ready! I’ll be in in a minute.”</i>");
	}
	else output("\n\nWhen you get inside though, she instantly zips off into her bathroom, yelling back at you as the door shuts behind her. <i>“Get ready! I’ll be in in a minute.”</i>");
	if (firstTime) output("\n\nIt’s more like five, during which you hurry" + (apt ? "" : " into the bedroom") + " to undress, wondering what your diminutive lover has in store. You’re on your back on the bed, stroking your [pc.cock " + kok + "] in anticipation of what’s to come. And in comes Velta, leering at you and stroking the... rather large strapon she’s wearing. It’s shaped like a human cock, ten inches long, complete with balls, and glistening with what you can only assume is lube. Well... now you know why she was so enthused about anal.");
	else output("\n\nIt’s more like five, but you already know what it is she’s preparing, so you simply lay on your back on the bed, stroking yourself steadily. And sure enough, in comes Velta, smiling wickedly and stroking her strapon, lube glistening on the false veins of the toy’s surface.");
	
	processTime(10);
	clearMenu();
	addButton(0, "Yes", veltaSexAnalYes);
	addButton(1, "No", veltaSexAnalNo);
}
public function veltaSexAnalYes():void
{
	clearOutput();
	showVelta(true);
	var firstTime:Boolean = true;
	if (flags["VELTA_FUCK_ANAL"] > 0) firstTime = false;
	
	var kok:int = rand(pc.cockTotal());
	var dildoVol:int = 23;
	
	if (firstTime) output("This is... unexpected, but you’re not about to complain. On the contrary, your [pc.cocks] " + (pc.cockTotal() > 1 ? "are" : "is") + " even stiffer than before, beading pre onto your hand.");
	else output("Just like last time, you’re not about to complain. On the contrary, your [pc.cocks] " + (pc.cockTotal() > 1 ? "are" : "is") + " even stiffer than before, beading pre onto your hand.");
	output("\n\nHer smile widening, Velta steps up to you, wasting no time positioning herself between your legs, her left hand reaching up to tweak one of her pebbled, dark brown nipples, pulling a whimper from her mouth. Then she looks at you, her other hand stroking up your stomach, back down to your navel, then down to your [pc.cock " + kok + "], wrapping around the base of your member and giving it a few slow pumps.");
	output("\n\n<i>“Ready, buttslut?”</i> she purrs, her left hand now leaving her breast and moving to her crotch, guiding her strapon... you can’t help but jump slightly as you feel it poking up against your [pc.asshole]. Velta giggles, increasing the pressure incrementally. <i>“Aww, you nervous? Don’t be. I’m only gonna make you my bitch.”</i>");
	output("\n\nThen she’s really pushing, applying steady, measured pressure until, with a gasp from you, the head of her faux cock wins it’s battle with your sphincter and ventures into your warm, dark bowels. Your cocoa lover pulls back just the tiniest bit, then pushes back in, burrowing another few inches of strapon into your guts. <i>“You know, I always thought about getting one of those fancy hardlight rigs,”</i> she muses as she cocks her hips back, <i>“or I could just grow a dick of my own. It’d feel way better, I know... but I think I like this anyway. Gotta stick with the classics, you know? Besides, I don’t need a dick to be in charge.”</i> she pushes deeper into you as she speaks, hands sliding to your hips. She’s about halfway in now, and your");
	if (pc.ass.looseness() >= 3) output(" well-used asshole is opening up around it, your bowels squeezing and caressing the toy.");
	else output(" poor asshole is struggling to stretch around it, your bowels clenching and flexing powerfully as they work fruitlessly against the invader.");
	
	pc.buttChange(dildoVol);
	
	output("\n\nShe’s a practiced hand at this, you can tell immediately - her hips move smooth, fast and hard as she ruthlessly pushes her strapon deeper and deeper into your guts. You feel your [pc.balls] resting atop the toy as it starts to move more smoothly in and out of you, Velta wrapping her right hand around your [pc.cock " + kok + "] as she fucks you. She starts stroking you slowly, mismatched eyes gazing at your member now. ");
	output("\n\n<i>“So big, so hard... and so helpless. Look at you.”</i> she purrs as she gives you a particularly deep thrust, her thumb grazing over the slit of your cockhead. <i>“Perfect. My big, strong, hunky <b>bitch.</b> Do you like being my bitch, [pc.boyGirl]?”</i> she says, pressing your cock into your stomach with the heel of her palm. <i>“Well?”</i>");
	output("\n\nWell... if you didn’t, you probably wouldn’t be here. You nod quickly, telling her that yes, you <i>love</i> being her bitch. She strokes the underside of your dick in response, fingers gliding up and down as she raises her left hand, reaching out to you wordlessly. You take the proffered hand and she pulls you further in, letting your hand go and instead whipping hers to the back of your neck, pulling you closer with surprising strength while she spreads your asshole on her faux cock. She’s so damn <i>short</i> that you’re bent almost double, your spine screeching at you in protest... but when her pretty face presses into yours, soft lips possessively molding against yours as her tongue invades your mouth, it’s suddenly not that big of a deal.");
	output("\n\nHer right hand is still toying with your [pc.cock " + kok + "] through all this, even as her hips ram into yours with ever-increasing force - the sound of your bodies meeting is filling the room with a chorus of wet slapping, the human’s dark skin shining with sweat as she pummels you. She’s got a <b>lot</b> of power in that tiny body, as your poor [pc.ass] is swiftly finding out... ");
	output("\n\nShe breaks your kiss, though her hand doesn’t leave your neck; her forehead comes to bump into yours, her sweat mingling with yours as the lemon-scented warmth of her breath washes over your face. <i>“");
	if (firstTime) output("I think you and I are going to get along </i>famously<i>.");
	else output("I knew you’d be back for more.");
	output(" Because you’re a good [pc.boyGirl], right?”</i> she teases, her hand scritching the back of your neck gently, a sharp contrast to the ruthless, jackhammer pounding she’s giving you.");
	
	output("\n\n<i>“And you know who your mommy is, right?”</i> she continues, stroking your [pc.cock " + kok + "] more vigorously now, <i>“Right? Tell me who your mommy is, [pc.boyGirl].”</i>");
	output("\n\n<i>“You! It’s you!”</i> you whine as one of her thrusts glides over your prostate, a glob of pre beading onto the top of your prick in response. Where did she learn to fuck like this? ");
	output("\n\n<i>“That’s right, [pc.name]. I’m your mommy,”</i> she says... right before she suddenly stops hammering you and pulls out, standing back from the bed and leaving you feeling decidedly empty. What...? Did you do something wrong? Although... whether or not you did, this isn’t a bad view at all. She’s just standing there now, dripping sweat and staring at you with mismatched eyes, large and in charge despite her diminutive stature... you could get used to this. She shifts her weight onto one foot, dark skin shining with sweat in the light of the room as her breasts rise and fall steadily - she’s... not even breathing hard.");
	output("\n\nThen she raises her hand to her mouth, and a sharp whistle pulls you out of your admiring daze. <i>“Roll over, [pc.boyGirl].”</i> she orders, and of <i>course</i> you obey. <b>Quickly</b>, you reposition yourself, legs planted now on the floor and bent over the bed, [pc.ass] presented for inspection. The next thing you feel is your <s>mistress</s> lover slamming her hands into your [pc.ass], kneading and squeezing your cheeks possessively, her sharp nails digging into your [pc.skin] hard enough to make you whimper.");
	output("\n\n<i>“Aww, sorry! Am I being too rough with my poor little bitch-[pc.boyGirl]?”</i> she coos as she starts to hotdog her strap through your cheeks, laying another brutal slap on you. You’re going to be sore... but she shows no signs of stopping. If anything she’s getting into the spirit of things; her hands are slamming into your ass every few seconds now, and her hotdogging is reaching a fever pitch. <i>“Want me to fuck you again?”</i> she asks, and you can almost feel the smugness in her voice. Do you want her to keep fucking you - does she even have to ask? <i>“Say it,”</i> she orders, her right hand landing between your shoulder blades and dragging down your spine, nails leaving angry, burning lines in your flesh.");
	output("\n\n<i>“No, don’t say it. <b>Scream it, bitch,</b>”</i> she snaps, and you feel the tip of her faux cock teasing your poor asshole. ");
	output("\n\nYou scream it, of course. What else is there to do? You put yourself here, you let her take you like this, you obediently bent over the bed for this pint-sized woman - why would you stop now, or even slow down? You howl that you need her to fuck you, you beg her to put you in a wheelchair, to pound you like the big, muscular bitch you so clearly are - and nothing happens. Velta just giggles, still prodding your asshole with her strapon. Did you do something wrong?");
	output("\n\n<i>“You know, maybe I’m not in the mood after all. Maybe I’ll just leave you high and dry. You’re such a little bitch you’d probably still enjoy it, too.”</i>");
	output("\n\nShe pauses on the end of that sentence, and her faux hardon leaves your ass entirely, a bored little sigh accompanying it. You’re not sure what to feel - anger, humiliation... but you’re definitely still hard as diamonds. Why wouldn’t you be? You agreed to let her have her wicked way with you after all, and she’s doing exactly that. If she were to just kick you out on your ass right now, impossibly horny... your cock gives a little twitch at the thought. Maybe she could put your [pc.cock] into a nice cage so only she can use it? You shiver, and then jump as your train of thought is interrupted by the head of her strapon pressing against your asshole again.");
	output("\n\nYou’ve mostly closed up at this point, and so there’s a moment of pressure before her strap pops back inside, a low groan of submissive pleasure escaping your [pc.lips]. Who knew such a small woman could be so large and in charge? And she fucks like a machine to boot... <i>“Lift your hips up a bit,”</i> she snaps suddenly, cracking her palm across your ass for no particular reason. You obey dutifully and find your [pc.cock] being held to your stomach by your lover, her other hand pressing down on your ass as the tip of her strapon shifts inside you. What is she trying to... ah. Aha.");
	output("\n\nShe’s pressing you back down and you get it now; your cock is trapped between your belly and the bedsheets, and every time she thrusts, burying that strapon back into your guts, your prick rubs just the tiniest bit closer... this is just devious. She’s forcing herself fully back into you now, your already-opened ass yielding easily to her insistent thrusting. She’s picking up speed again and your legs are shaking, your tortured [pc.cock " + kok + "] twitching and swelling ominously as it grinds itself to orgasm with nothing but the thrusting power of the pint-sized cutie behind you.");
	output("\n\nMeanwhile she’s mercilessly spanking your [pc.ass] and loosing demented giggles in between grunts and groans of exertion and pleasure...");
	output("\n\nYou’re already sore, but at this rate you’re going to be walking funny for at least a day or so after your miniature mocha mistress is done with you. But on the flip side, it won’t be long now if the familiar sensation building in your gut is any indicator. Your [pc.hips] start rocking back into her thrusts desperately, your mind blank as your body takes over in anticipation of your coming orgasm.");
	output("\n\nYou still find yourself unprepared when it hits you, though. A well-timed thrust from Velta manages to glide right over your poor abused prostate and fireworks go off in your brain, an animal grunt leaving your lips as your cock twitches, swells, and belches your hot cum onto your belly and the bedsheets beneath you, Velta suddenly grabbing your wrists and using them as leverage for one, two, three... four especially devastating thrusts into your guts, each one milking increasingly larger shots of jism from your [pc.cock " + kok + "] as you moan, twitch and whimper like a whore beneath her.");
	output("\n\nShe stops after the last throes of your orgasm die out, another sweet moan escaping your lips as she slowly pulls her strapon out of your asshole, breathing hard. The room reeks of sweat and sex, your ass is glowing with pain, your sphincter has given up the ghost, and your belly is slick with your own [pc.cum]. ");
	output("\n\nAll in all, a good time.");
	output("\n\nVelta flops onto the bed next to you, the mocha beauty dripping with sweat, her dusky skin shining in the room’s light as she brushes her damp hair out of her eyes. She flashes you a toothy smile, rolling onto her side and pinching your cheek. <i>“That was pretty fucking great, Steele,”</i> she says, releasing your cheek and slapping you lightly as you whimper your agreement, too fucked-out to do much else. You see your lover wiggling about on the bed, her hands vanishing from your line of sight as she removes her strapon, and then she’s moving over to your head, sitting her naked ass further up on the edge of the bed.");
	output("\n\n<i>“Good [pc.boyGirl]s get napnaps and head scritchums,”</i> she teases you, patting her glistening thighs invitingly. How could you turn this down? Besides, you’re not sure she’s asking. You crawl up and obediently lay your head down on her thighs. She responds by starting to stroke your head and back with surprising gentleness, humming contentedly. <i>“Don’t worry, [pc.name],”</i> she coos, <i>“Mommy’s here. Just go to sleep in a puddle of your own cum...”</i> She snickers at that, but you’re still too worn out to offer much in the way of a retort. So instead, you just lay there and bask in it all; her smell mixing with the strong aroma of your cum, how warm her thighs are, how good it feels to have her nails gently dragging up and down your head and back, her quiet humming...");
	output("\n\nWhen you wake up, Velta is laying on her back, snoring like a chainsaw as her still-bare chest gently rises and falls. Chuckling (and wondering how exhausted you must have been to sleep through that), you watch the brown cutie doze for a few minutes and then nudge her awake, her multicolored eyes glazed with sleep as she slowly raises her head.");
	output("\n\n<i>“Whuzat? Idunhaveclassyetfugoff...”</i> she says, nearly going right back to sleep before her eyes fix on you, gradually opening as she blinks herself awake. <i>“Oh. That’s right, I turned this stud right here into my bitch,”</i> she gloats, reaching down and patting your cheek. <i>“Come take a shower with me,”</i> she orders, yawning and sitting up, stretching luxuriously.");
	output("\n\nThe shower itself is pretty uneventful; she makes you lather her up from head to toe with lemon-scented soap and then returns the favor for you, clearly enjoying rubbing her hands all over your muscles. Then the two of you hop out and surprisingly, Velta orders you (she’s getting very comfortable giving you orders...) to sit at her kitchen table in nothing but a fluffy pink bathrobe that’s made for, well... for someone her size (she breaks into a fresh fit of giggling every time she sees you in it). It hurts to sit...");
	output("\n\nShe quickly tosses your clothes and her sheets into her washing machine, then sets herself to work in the kitchen in a fluffy pink bathrobe of her own, making small talk with you while she whips up a plate of pancakes for the two of you, complete with maple syrup. After your home-cooked meal and laundry is done she finally releases you from her care, stopping you at the door to yank your head down for a parting kiss, deep and full of tongue. Then as you turn to go, she cracks her hand across your sore [pc.ass] and slams the door before you can react, cackling.");
	
	IncrementFlag("VELTA_FUCK_ANAL");
	processTime(15 + rand(15));
	pc.orgasm();
	processTime(300);
	soreDebuff(4);
	restHeal();
	pc.shower();
	eatHomeCooking(30);
	flags["VELTA_ANAL_TIMER"] = GetGameTimestamp(); 
	clearMenu();
	addButton(0, "Next", move,"RESIDENTIAL DECK 17");
}
public function veltaSexAnalNo():void
{
	clearOutput();
	showVelta(true);
	
	output("<i>“Aww, that’s too bad. I guess I’ll just have to keep my interests vanilla for now...”</i> she says, pouting adorably.");
	
	clearMenu();
	processTime(5);
	if (veltaAptOpen()) addButton(0, "Next", veltaApartmentFunc, undefined);
	else addButton(0, "Next", move,"RESIDENTIAL DECK 17");
}

public function veltaApartmentFunc():void
{
	clearOutput();
	showVelta(false);
	
	output("<i>“Yeah?”</i> Velta says, looking at you curiously. <i>“What’s on your mind?”</i>");

	clearMenu();
	addButton(0, "Talk", veltaTalkMenu, true);
	if (flags["VELTA_TALK_FAMILY"] == 1 && flags["VELTA_TALK_COLLEGE"] == 1 && flags["VELTA_TALK_HOBBIES"] == 1) addButton(1, "Sex", veltaSexMenu, true);
	else addDisabledButton(1, "Sex", "Sex", "You should get to know her a little better first.");
	addButton(2, "Appearance", veltaAppearance, true);
	addButton(14, "Leave", mainGameMenu);
}

public function veltaAppearance(apt:Boolean=false):void
{
	clearOutput();
	showVelta(false);
	
	output("Velta is short for a human woman, standing only 5 feet tall by ancient Imperial measurements. She has cocoa skin, short, jet-black hair, and a round face with an adorable button nose, complemented by the red bindi in the center of her forehead. But probably the most notable thing about her face is her eyes; one is a brilliant, lively shade of blue, while the other is a deep, warm brown. She is in excellent shape, having slim hips, toned, slender arms and legs, a chiseled set of abs and two smallish, perfectly formed B-cups sitting proudly on her chest, capped with dark brown nipples. There is a single beauty mark on the left side of her neck, just above the collarbone.");
	//currently the same, but created this if statement just in case she wears a different outfit in her apartment in the future
	if (apt) output(" In her apartment, Velta wears much the same clothing, with some minor changes; her shorts have been swapped out for plain black sweatpants, comfy and easy to move in, while her sweatband and canteen are nowhere to be seen, presumably stowed away somewhere until she actually needs them. She has a " + RandomInCollection(["personal comm device in one hand and is idly flipping through what appears to be an image sharing site, giggling or cooing every so often when she sees something funny or cute.","nutrition shake in one hand, idly sipping at it every few seconds as she enjoys your company.","stress ball in one hand and is idly kneading it as she enjoys your company."]));
	else output(" The jogging outfit she wears consists of a pair of skintight black running shorts that emphasize the musculature of her thighs and sculpted rear, a white sweatband around her left wrist, and a tight - fitting sports bra that keeps her bust from jiggling as she runs. There is a military - issue canteen hanging off her waist as well, water sloshing within.");
}
