//Overview:

//This document is for a new character for Paige, a female Ausar yoga instructor that lives on Tavros Station. I heard through a game of Telephone with Shou that Savin wanted me to write “Space Brooke,” and hell, getting a request from one of the project leads is quite flattering, so why not?
//
//Paige is full-blooded Ausar, but she’s used gene mods on herself to make her full-fledged furry, not just half-and-half. She works as a yoga instructor on Tavros Station, holding classes on the residential floor. She lives in one unit and rents out another one for the classes; the income from her classes is enough to cover the rent. She is in the peak of her physical condition, but she’s not overly muscle-bound; her abs are solid and her biceps are clear through her clothing, but she isn’t huge and burly like Yancy.
//
//Being Space Brooke, Paige has similar themes. Her backstory is that she used to be a pirate that worked alongside Kiro, but one of their marks was simultaneously hit by the Black Void, and she took a debilitating injury in the resulting scuffle. She is bisexual and will have sex with any gender, provided the player is willing to sit through her backstory.
//
//There are some plans to include threesome scenes between the PC, Paige, and Kiro. I also have an idea to make Paige a combat encounter: if you agree to removing your weapons (but you can keep the armor), the PC can spar with Paige in one-on-one hand-to-hand combat. She specializes in grapples that keep you immobilized, like being coiled by a Naleen. I had a similar idea with Brooke but never got around to writing it. All in good fun, with happy endings, of course.
//
//While Paige is a gentle, if domineering, lover, she, unlike Brooke, is not especially sexually active and she doesn’t enjoy social areas, such as the Merchant Deck. She doesn’t have sex with any of her students, and in fact, she cautions you that if you have sex with her, she can’t have you as her client any further. Which just means that she no longer charges you for yoga and all your future sessions with her are one-on-one.
//
//She runs her yoga class between 09:00 and 17:00, and she’s available in her private unit between 17:01 to 00:00. She’s also available between 00:01 and 08:59 after you’ve first had sex with her. The PC can only attend one class per day, because Paige advises that too much in one day isn’t healthy for the ligaments. Interacting with Paige in her quarters will unlock her conversation trees, such as her history.
//
//While Paige’s instructions are very clear and she’s very attentive in her classes, she’s also very touchy, in a literal sense: she constantly touches the arms, legs, and bodies of her students as they exercise. After taking her classes twice, the PC can confront Paige about this, where they learn that Paige’s injury is that she’s blind. She doesn’t wear dark-tinted glasses and she carries herself very well in her class and around her home, but nobody can tell she’s blind because she wears a special earpiece that acts as both a microphone and a projector that covers her eyes and her scar.
//
//She has extremely heightened senses and can sense objects and people about a body’s-length around her, part because of her attunement to her injury, and part because she has a helper droid named Iddi. This attunement to her environment is what allows her to keep up with you in combat despite being blind.
//
//The PC can have sex with Paige after listening to Paige’s entire, five-part backstory, which they can access in Paige’s unit either after they attend a yoga class for the day, or if they bribe her with her favorite drink: a bottle of Honey Wine. When it comes to love-making, Paige prefers to be in control, keeping you pinned while she toys with your body as she likes. She’s very sensual and gentle, knowing how important a light touch can be in the right spots: being allowed to touch every part of your body is important to her, because she uses her fingers to see, and being allowed to touch everything, and therefore ‘see’ everything, makes it more than just sex to her. That said, when she knows what she wants, she’s not afraid to take it.
//
//If the PC has had sex with both Paige and Kiro, and they’ve learned about how Paige got her injury (and therefore learns of the connection between the two), she can offer to take Kiro to meet with Paige. This will naturally result in the threesome. That’s just me throwing ideas at the wall and seeing what sticks, though.
//
//If the player listens to enough of her backstory, and they have the credits to help Paige afford surgery for her eyes, they can take her on as a crewmate.
//
//As of this writing, there are no plans to include a Bad End with Paige.

//Sex Scenes:
//While the player can choose how to have sex with Paige (oral, anal, etc), the PC takes a very passive role in the lovemaking while Paige does most of the exploring. When the PC takes a more active role, it’s usually because Paige has asked/allowed them to. Paige is always in control, but she actively makes sure it’s as good and important to you as it is to her.
//While she’s not against the PC using transformative items, she’s sensitive about the body she’s spent most of her adult life sculpting and will not accept any transformative items from the PC, no matter how much fun they would be. No dickgirls this time.

public function yogaToning(arg:Number):void
{
	if(pc.tone + arg > 85) arg = 85 - pc.tone;
	if(pc.tone >= 85) arg = 0;
	pc.modTone(arg);
	if(flags["PAIGE_YOGA_DAY"] == undefined || flags["PAIGE_YOGA_DAY"] != days) flags["PAIGE_YOGA_DAY"] = days;
	soreDebuff(4);
	//This should do nothing if Paige isn't crew
	if (!pc.hasStatusEffect("Paige Showering")) pc.createStatusEffect("Paige Showering");
	pc.setStatusMinutes("Paige Showering", 12 * 60);
}

public function paigeBlind():Boolean
{
	return (flags["PAIGE_CREW"] == undefined);
}

public function showPaige(nude:Boolean = false):void
{
	showBust(getPaigeBustString(nude));
	
	if(flags["MET_PAIGE"] != undefined) showName("\nPAIGE");
	author("B");
}

public function getPaigeBustString(nude:Boolean = false):String
{
	if(nude) return "PAIGE_NUDE";
	if(currentLocation == "PAIGE_HOUSE") return "PAIGE_CASUAL";
	else return "PAIGE_YOGA";
}

public function showIddi():void
{
	showBust("IDDI");
	showName("\nIDDI");
	author("B");
}

public function paigeIsCrew():Boolean
{
	return (flags["PAIGE_CREW"] == 1);
}

public function paigeRecruited():Boolean
{
	return (flags["PAIGE_CREW"] != undefined);
}

public function moveSouth():void
{
	if(InShipInterior(pc)) mainGameMenu();
	else if(rooms[currentLocation].southExit == "") mainGameMenu();
	else move(rooms[currentLocation].southExit);
}

public function paigeCost():Number
{
	return 500000;
}
public function paigeRoomsUpdate():void
{
	// During operation
	if(pc.hasStatusEffect("PAIGE_COMA_CD")) 
	{
		rooms["RESIDENTIAL DECK 14"].northExit = "";
		rooms["YOGA_HOUSE"].removeFlag(GLOBAL.COMMERCE);
		return;
	}
	//Paige house open :3
	//Paige house unlocked after yoga lesson 3 and between specific hours :3
	if(flags["PAIGE_VISIT_DAY"] != days && flags["PAIGE_YOGA"] != undefined && flags["PAIGE_YOGA"] >= 3 && (hours >= 17 || (hours < 17 && flags["SEXED_PAIGE"] != undefined && hours < 9)))
	{
		rooms["RESIDENTIAL DECK 14"].northExit = "PAIGE_HOUSE";
	}
	//Paige house closed:
	else
	{
		rooms["RESIDENTIAL DECK 14"].northExit = "";
	}
	//Gym closed:
	if((hours >= 17 || hours < 9))
	{
		rooms["YOGA_HOUSE"].removeFlag(GLOBAL.COMMERCE);
	}
	//Gym open
	else
	{
		//Clear the paige day lockout since you COULD visit her at 3am, then be locked out at 9pm the next night.
		flags["PAIGE_VISIT_DAY"] = undefined;
		rooms["YOGA_HOUSE"].addFlag(GLOBAL.COMMERCE);
	}
}

public function yogaIntro():Boolean
{
	// During operation
	if(pc.hasStatusEffect("PAIGE_COMA_CD"))
	{
		output("You approach Paige’s Yoga Class & Seminar, but with the door locked and the closed sign, you remember that Paige is currently undergoing her operation. It might be best to return after she has recovered from the procedure.");
		return false;
	}
	if(paigeIsCrew())
	{
		output("You approach Paige’s Yoga Class & Seminar, but with the door locked and the closed sign, you recall that Paige is unable to hold her seminars while she is employed as a crew member of your ship!");
		if(hours >= 17 || (hours < 17 && flags["SEXED_PAIGE"] != undefined && hours < 9)) output(" You may be able to find her taking a break at her house, however.");
		return false;
	}
	// PC finds Paige’s Yoga Class in the Residential Deck for the first time, between the hours of 17:01 and 08:59 (scene: Pre-Intro)
	if((hours >= 17 || hours < 9))
	{
		if(flags["MET_PAIGE"] == undefined)
		{
			output("You’ve never been in this area of the Residential Deck before. One of the units in this wing has a plaque on its door: <i>Paige’s Yoga Class & Seminar,</i> it reads. It also has a short paragraph about who Paige is and what she offers to teach as a yoga instructor. Beneath that is a list of prices and hours available.");
			output("\n\nLooks as though the class is over for the day, but <b>the class is in session between the hours of 09:00 and 17:00 every day.</b> You make a note to check it out sometime between those hours.");
		}
		// The PC approaches Paige’s Yoga Class between the hours of 17:01 and 08:59 after having had the class at least once (scene: Invalid Hours)
		else
		{
			output("You approach Paige’s Yoga Class & Seminar, ready to do some more yoga. Who knew yoga could be so much fun, and so relaxing! Now you see why some yoga practitioners are so Zen all the time.");
			output("\n\nYou reach out to the knob and give it a twist – and it doesn’t yield. A twist a few more times, but it’s locked as locked could be. You read the message on the door, and you look over the hours listed. No wonder: class is over for the day. You missed the boat.");
			output("\n\nWell. You blush in embarrassment. You’ll be sure to not make the same mistake again by <b>coming between the hours of 09:00 and 17:00.</b>");
		}
		return false;
	}
	// The PC finds Paige’s Yoga Class in the Residential Deck for the first time, between the hours of 09:00 and 17:00 (scene: intro 1)
	else
	{
		if(flags["MET_PAIGE"] == undefined)
		{
			// The PC attempts to enter Paige’s Yoga Class during valid hours, but is not bipedal (Naga, Taur, etc) or if PC has the ‘Gel Body’ perk (scene: Invalid Form)
			if((pc.isGoo() || pc.isNaga() || pc.isTaur() || pc.hasPerk("Gel Body")) && flags["PAIGE_GOO_WARNING"] == undefined)
			{
				showPaige();
				flags["PAIGE_GOO_WARNING"] = 1;
				output("You approach Paige’s Yoga Class & Seminar, checking the plaque on the door and the time on your codex to confirm that you’ve arrived during working hours. You show yourself into the classroom.");
				output("\n\nThere are a number of students around the classroom, each at a mat, all of them facing toward the door you just entered. They’ve all contorted themselves into a number of strenuous positions, flexing and stretching their muscles to their teacher’s instructions. Standing among them is a tall, modded Ausar woman, helping one of her students with their position, and floating at one end of the classroom is a monitor displaying what appear to be eyes.");
				output("\n\nThe teacher stands and looks in your direction when she hears you enter. <i>“Hello!</i> she says, waving towards you. You respond with your own greeting – and as you do, you notice that the monitor in the back of the room has shifted its visage somewhat.");
				output("\n\nSuddenly, the teacher’s face grows concerned. <i>“Um, would you mind speaking with me outside for just a moment?”</i> That’s a confusing request, but you oblige, and you step out of the classroom, the Ausar close behind.");
				// continue scene here if PC has ‘Gel Body’ perk, even if they are also taur/naga
				if(pc.isGoo() || pc.hasPerk("Gel Body"))
				{
					output("\n\n<i>“Um,”</i> she says gently, <i>“this is, uh... I’m going to be totally honest, but I don’t think I’m capable of teaching a Galotian, or a Rahn, or any of the goo subtypes. I can only teach solid bipeds.”</i>");
					output("\n\nYou reel in surprise. She <i>can’t</i> teach Galotians yoga? Or she <i>won’t</i>?");
					output("\n\n<i>“Let’s not be unfair,”</i> she says, defensive at your implication. <i>“Yoga is about stretching muscles and ligaments to make the form limber and flexible. I mean this as... politically-correctly as possible, sweet thing, but you have no muscles or ligaments to stretch. Your body is liquid; by definition, you’re as limber as you’re ever going to get.”</i>");
					output("\n\nYou counter by replying that you can make your body solid if you desire. To demonstrate, you increase the viscosity of your gooey body, until it’s, by every definition, solid. <i>“Yeah, but if you can do that, you can also</i> undo <i> that, as often as you like, as many times as you like. Look, if you really, really want to, I’ll take you on as a student. But you won’t be accomplishing much. I’ll teach you how to perform yoga, and you can do what you want with that knowledge, but I’m afraid that’s about all you’ll get.”</i>");
					output("\n\nYou harrumph at her argument, but you can’t deny it. You suppose that yoga is better meant for people that, well, have a body to improve, but with how malleable you are, your body is basically a puddle with a face. <i>“I’ll be here if you decide you’re interested,”</i> Paige says, and she disappears back into her classroom.");
					output("\n\nJust one of the difficulties of having taken those pills one too many times.");
					// end scene (scene: Invalid Form); play (scene: intro 1) during the player’s next valid visit
				}
				// continue scene here if PC’s form is not bipedal (Taur, Naga, etc)
				else 
				{
					output("\n\n<i>“I have to bring this up with every naga or centaur that wants to learn yoga,”</i> she says. <i>“I can teach you if you want, but I’m afraid it’ll be a bit tougher for someone of your</i> particular <i>musculature.”</i>");
					output("\n\nYou reply that you’re honestly not that surprised. Being a ");
					if(pc.isNaga()) output("monoped");
					else output("tauric creature");
					output(" in today’s modern, bipedal-dominated universe has always been kind of tough going.");

					output("\n\n<i>“I’m glad you understand, but that’s not to say I</i> can’t <i>teach you,”</i> she insists. <i>“It’s just that, yoga is a practice that requires a bipedal form. Every pose requires the lower body to affect the upper body, and most stretches involve legs and the gap between them. Have you ever heard of a horse or a snake doing yoga?”</i> You frown. <i>“There are some poses that use only the upper body, but you won’t be getting the most out of my class, I’m afraid. I’ll have you if you’ll have me, of course. I’m just letting you know that it’ll be a little less rewarding for you.”</i>");
					output("\n\nYou sigh. Well, you have to admit, you <i>haven’t</i> ever heard of a horse or a snake doing yoga, so you’re not frustrated with her. You tell her that you’ll mull it over. <i>“I hope to see you in my class all the same!”</i> she says, trying to cheer you both up, before disappearing into her classroom.");
					// end scene (scene: Invalid Form); play (scene: intro 1) during the player’s next valid visit
				}
				clearMenu();
				addButton(0,"Next",moveSouth);
				return true;
			}
			else
			{
				showPaige();
				output("You’ve never been in this area of the Residential Deck before. One of the units in this wing has a plaque on its door: <i>Paige’s Yoga Class & Seminar,</i> it reads. It also has a short paragraph about who Paige is and what she offers to teach as a yoga instructor. Beneath that is a list of prices and hours available.");
				output("\n\nYou hear some voices coming from inside, along with the general noise of movement. You gingerly twist the knob and open the door, showing yourself uninvited into the classroom.");
				output("\n\n<i>“Now, point your toes,”</i> you hear a woman say, <i>“as straight as you can, and keep your back straight at a perpendicular angle. Now, grip onto your knees without bending any part of your body. We call this pose the ‘Boat.’”</i>");
				output("\n\nThe class consists of about twelve other patrons of all different shapes, species, body-types, and genders. Some of them are veteran yoga practitioners, flexing into the pose easily, while others are having some difficulty, struggling to maintain their position.");
				output("\n\nA tall Ausar woman walks between her students silently. When she passes one of them that’s having difficulty, she kneels beside them, feeling her hand across the student’s legs, pausing where their knees bend. <i>“It’s alright,”</i> she says reassuringly, placing a hand beneath the bent leg and straightening it. <i>“It’s not the easiest pose. You’ll get it if you keep at it.”</i>");
				output("\n\nYou clear your throat, still standing in the doorframe. The Ausar woman stands up and faces you. She has dirty brown hair with streaks of black through her mane, and she has perky, triangular, wolfish ears pointing straight up a whole twelve centimeters from her scalp. Attached to her right ear is an earpiece with a small antenna extending to her eyes – likely a microphone of some kind. She’s wearing a sleeveless, flexible jumper vest on her torso and a pair of yoga shorts covering her waist, then nothing down to her toes. Her fur is coloured brown, like her hair, and she has black and white splotches all throughout her body. Unlike a typical Ausar, her entire body is covered head-to-toe in fur, like some modded humans, and she has the appropriately elongated face to match. She has a long, bushy-but-not-fluffy tail, all black fur on top and all beige-brown on the bottom, reaching to just above her tendons. Even though she’s across the room, you can tell just how stunningly blue her eyes are when they meet yours.");
				output("\n\nFloating around the room is a monitor, displaced in the air by a glowing, thrumming device. On the monitor is a disarming, cutesy picture of a face, drawn with cartoonish eyes and a tiny mouth. It’s silent as it goes between practitioners; it stops at one and whispers to them to straighten their knees and elbows, then displays an image of the position’s proper form. Maybe it’s some kind of assistant for the teacher? A literal, mechanical teacher’s pet?");
				output("\n\nYou introduce yourself and say that you’re interested in giving the class a try. <i>“Of course!”</i> she says. <i>“");
				//if {PC is not goo and is bipedal}
				if(!pc.isGoo() && !pc.isTaur() && !pc.isNaga()) output("My name is Paige. I don’t recognize you, sweet thing... you must be new to my class. The first session is free. Just pick a mat and follow along with us");
				else output("You’re that potential student from earlier, right? My name is Paige. I’m glad you decided to join us! Your first session is free; just pick a mat and follow along");
				output(".”</i>");
				output("\n\nYou undress slightly, just enough to make yourself a bit more flexible, and pick a mat closest to the far wall. <i>“And, breathe out,”</i> Paige instructs. <i>“And breathe in...”</i>");
				flags["MET_PAIGE"] = 1;
				//[=Next=]
				clearMenu();
				addButton(0,"Next",mainPaigeIntroPart2);
				return true;
			}
		}
		//Already met paige!
		else
		{
			showPaige();
			// if the PC attempts to enter the yoga class after having done one class earlier that day (scene: invalid attendance)
			if(flags["PAIGE_YOGA_DAY"] != undefined && flags["PAIGE_YOGA_DAY"] == days)
			{
				showImage("PaigeYoga");
				output("You twist the knob to Paige’s yoga class, eager to get back into the swing of her session. She’s busy with her current class and is helping one student correct their posture, and she doesn’t rise to greet you. <i>“Hello!”</i> she calls out.");

				output("\n\nYou respond your greeting. At that, Paige gets up, spinning towards you. <i>“[pc.name]?”</i> she asks. <i>“No no, I’m afraid you’ve already had your session today, sweet thing. You mustn’t do another!”</i>");

				output("\n\nYou ask her what the harm is. <i>“You risk hyperextending your ligaments if you do too much yoga in one day. Your body needs to rest! There is too much of a good thing, [pc.name]. For your own safety, I won’t have you in my class for the rest of the day. Came back after you’ve had a good night’s rest.”</i>");

				if(pc.isGoo()) output("\n\n<i>“But...,”</i> you protest.\n\nPaige ignores you.");

				output("\n\nYou sigh. You were kind of looking forward to another round of yoga. But, on Paige’s insistence, you leave her class. You’ll just have to come back tomorrow.");
				processTime(5);
				clearMenu();
				addButton(0,"Next",moveSouth);
				return true;
			}
			else if(paigeRecruited())
			{
				showImage("PaigeYoga");
				output("You show yourself into Paige’s yoga classroom and are greeted by the all-too-familiar sight of Paige personally instructing a student on how to hold their form properly. It’s a little nostalgic for you – it seemed like just yesterday when you first walked into her class and introduced yourself. You two have come an awfully long way.");
				output("\n\nPaige looks up from her student, her eyes locking onto yours, and she smiles brightly. <i>“Hey there, [pc.name],”</i> she calls, snickering a little bit at the fact that she doesn’t have to call you ‘captain’ while she’s on shore-leave. <i>“It’s good to see you here! Are you interested in joining my class today? You know what to do if you are.”</i>");
				output("\n\nYou consider it.");
				//[=Easy Mode=][=Medium Mode=][=Hard Mode=][=Other=][=Leave=]
				// end scene (scene: Tavros (Crewmate) – Yoga Class)
				// If the PC attempt to enter between the hours of 17:01 and 08:59, just include a short sentence about the door being locked in the square outside the class’s description.
				processTime(2);
				clearMenu();
				if(pc.legCount != 2 || pc.isGoo())
				{
					addDisabledButton(0,"Easy Mode","Easy Mode","You’d need to be both a biped and non-gooey for this.");
					addDisabledButton(1,"Medium M.","Medium M.","You’d need to be both a biped and non-gooey for this.");
					addDisabledButton(2,"Hard Mode","Hard Mode","You’d need to be both a biped and non-gooey for this.");
					addButton(3,"Other",otherWorkSlooootNonGoo,undefined,"Other","As a non-traditional creature, your yoga options are limited.");
				}
				else
				{
					addButton(0,"Easy Mode",paigeYogaEasyMode);
					addButton(1,"Medium M.",yogaMediumMode);
					if(flags["YOGA_MEDIUM"] != undefined && flags["YOGA_MEDIUM"] >= 4) addButton(2,"Hard Mode",yogaHardMode);
					else addDisabledButton(2,"Hard Mode","Hard Mode","That is still beyond your capabilities.");
					addDisabledButton(3,"Other","Other","This is for non-bipeds and creatures made of goo.");
				}
				return true;
			}
			// any valid lesson; PC has 19 credits or less (scene: invalid credits)
			else if(pc.credits < 20)
			{
				showImage("PaigeYoga");
				output("You twist the knob to Paige’s yoga class, eager to get back into the swing of her session. She’s busy with her current class and is helping one student correct their posture, and she doesn’t rise to greet you. <i>“Hello!”</i> she calls out.");
				output("\n\nYou respond with your greeting. <i>“Oh, hello [pc.name]!”</i> she says, standing to greet you properly. <i>“You’re right on time for our next lesson! Just take an open mat anywhere.”</i>");
				output("\n\nThe monitor floats silently at the front of the room, quietly watching some of the practitioners. When your eyes meet its wide, colourful, cartoony eyes, you hear the faintest of beeps from its speakers.");
				output("\n\n<i>“Oh,”</i> Paige says suddenly. She approaches you in a hurry and leans in close to you. <i>“[pc.name],”</i> she whispers, <i>“my buddy is telling me that... you can’t afford today’s lesson.”</i>");
				output("\n\nYou pause, then smile, embarrassed. Couldn’t even afford twenty credits for a yoga lesson. You apologize, then leave the room hastily. Maybe you can offload some excess cargo in the Merchant Deck for a quick buck?");
				processTime(5);
				clearMenu();
				addButton(0,"Next",moveSouth);
				return true;
			}

			// next valid lesson (scene: intro 2)
			else if(flags["PAIGE_YOGA"] == undefined)
			{
				pc.credits -= 20;
				showImage("PaigeYoga");
				output("You twist the knob to Paige’s yoga class, eager to get back into the swing of her session. She’s busy with her current class and is helping one student correct their posture, and she doesn’t rise to greet you. <i>“Hello!”</i> she calls out.");
				output("\n\nYou respond with your greeting. <i>“Oh, hello [pc.name]!”</i> she says, standing to greet you properly. <i>“You’re right on time for our next lesson! Just take an open mat anywhere.”</i>");
				output("\n\nYou strip off your effects and do as instructed, taking an open mat nearer to the front of the class. You notice that the monitor from the other day is now at the front of the classroom, its disarming eyes quietly watching the room. <i>“The position we’re doing now is called the ‘staff.’ Sit on your bum and stretch your legs directly in front of you, toes up. Be sure to keep your back straight, and place your palms flat on the floor by your sides.”</i>");
				output("\n\nA simple sitting position, but not something you do when sitting leisurely. You follow Paige’s instructions to the word and you quickly feel the stretch in your arms and legs as you hold.");
				output("\n\n<i>“Breathe in,”</i> Paige instructs as she approaches you. You glance up to her, for her confirmation if you’re holding the position correctly – and instead, Paige places her own hands on you, slowly caressing up your arms and down your legs, being careful not to break your rigor in holding the pose. The fur on her hands is moderately ticklish to you. Paige doesn’t even look you in the eye. <i>“No bending your knees, [pc.name],”</i> she whispers to you, and you straighten your legs again. <i>“And breathe out.”</i>");
				output("\n\nThat was weird.");
				processTime(5);
				flags["PAIGE_YOGA"] = 2;
				clearMenu();
				addButton(0,"Next",yogaLesson2Cont);
				return true;
			}
			// next valid lesson (scene: intro 3)
			else if(flags["PAIGE_YOGA"] == 2)
			{
				pc.credits -= 20;
				flags["PAIGE_YOGA"] = 3;
				showImage("PaigeYoga");
				output("You enter Paige’s yoga classroom once more. The familiar scene of the mats of the room occupied by other practitioners taking a difficult-looking pose greets you once again. You can see Paige closer to the front, helping out another student in keeping their elbows straight, and off in the distance is the monitor, gently reminding another student to keep their toes pointed straight.");
				output("\n\nYou’ve been here enough times to not need the instruction to remove your effects. Paige and the monitor both glance in your direction for a moment. <i>“[pc.name], good to see you!”</i> says Paige. <i>“Not that I was to presume anything, but I’m sure you’re here for another lesson?”</i> When you confirm, you hear a beep from your codex, and you know you’ve been deducted the regular twenty credits.");
				output("\n\nYou take a position at an open mat, and you begin trying to mimic what everyone else is doing. <i>“Today we’re doing a pose called the back-bend. It’s not an advanced position, but it’ll challenge your sense of balance.”</i>");
				output("\n\nEveryone is bent backward, their bodies stretched into a wide, broad C-shape with their arms straight and over their heads. It looks like the idea is to take up as much horizontal space as possible while bending backwards and with both feet on the ground. You can understand how it might be a bit challenging on the balance");
				var boobers:Number = pc.biggestTitSize();
				if(boobers >= 4 && boobers <= 9) output(", and there are some additional obstacles in the way, with your chest as heavy as it is");
				else if(boobers >= 10) output(", and considering a chunk of your body weight is in your chest, this might be a bit tougher than you thought");
				if(boobers >= 30) output(". But hey, so should most other tasks at this point");
				output(".");

				output("\n\n<i>“Keep your arms and legs straight,”</i> Paige instructs you, <i>“and reach as high as you can, like you’re trying to get to the highest shelf in your cupboard. Then slowly bend backwards as far as you can. Thrust out your hips to help keep your forward balance. Nice, slow, and easy.”</i>");
				output("\n\nYou do your best to follow Paige’s instructions to the word, but she’s on you soon enough to inspect your form. You wince in effort, then gasp in surprise as you feel her hands on your body. She feels along your legs first, making sure they’re straight as can be, then up your laterals and across your [pc.belly]. One hand travels across your pit and up your arm, while the other boldly rakes across your [pc.chest]!\n\n");
				if(pc.tone <= 9) output("Paige hums to herself as she examines your body with her hands. <i>“I appreciate that you’re here, [pc.name]. We can make you a solid, fit-for-a-" + pc.mf("king","queen") + " body before you know it.”</i> You’re rather insulted, after the brazen invasion of your personal bubble, to be given such a negative review.");
				else if(pc.tone <= 49) output("Paige ‘humphs’ to herself as she appraises what she finds, then gives you another once-over. <i>“Remember to keep your limbs straight,”</i> she reminds you. <i>“Follow my instructions to the letter and we’ll be keeping this body in tip-top shape, I guarantee.”</i> While your personal space <i>has</i> been invaded, Paige was far from the worst thing to invade it.");
				else if(pc.tone <= 89) output("Paige’s breath catches in her throat as her fingers bounce off the ridges of your abs and explore the definition in your arms. She tries to hide it, but you can see her bite the corner of her lip. She examines your body once again, although you doubt it was to make sure your form was correct. <i>“Your form is perfect, [pc.name],”</i> she says. She sounds dehydrated. <i>“Practically flawless. I wish I had your body.”</i> Her fingers go over your [pc.belly] a second time, dipping a little further down the lowest set of abs then she should have. She stops eventually, and you almost wish she hadn’t.");
				else output("Paige runs her fingers gently over every facet of your body. You’ve put a lot of effort into it – frankly, you don’t mind if a pretty lady like Paige helps herself a little. But to your surprise, she frowns. <i>“Yoga is about being loose and keeping your body flexible,”</i> she says, almost not to you. <i>“Try not to make yourself so tense all the time, [pc.name]. Breathe in.”</i> And like that, she’s done, off to another student. That was, uh...");
				processTime(5);
				clearMenu();
				addButton(0,"Next",yogaLesson3Cont);
				return true;
			}
			// The PC goes to Paige’s Yoga Class any valid time it’s open, with enough credits, and after scene: intro 3 is completed (scene: Difficulty Select 1)
			else
			{
				showImage("PaigeYoga");
				output("You show yourself into Paige’s Yoga class. She’s busy helping one of her other students work their way into a different position, making sure their knees are bent where they’re supposed to and that their backs are completely straight. ");
				//if PC has completed scene: Paige 1
				if(flags["MET_IDDI"] != undefined) output("Paige’s robotic helper Iddi");
				else output("The floating monitor with eyes");
				output(" flits about the room, working as her assistant, and when it notices you enter the room, it makes a light beeping noise.");
				output("\n\n<i>“Ah, [pc.name]!</i> says Paige once she’s done with her first student. <i>“Welcome back to my classroom! You know the drill and the rates.”</i>");
				output("\n\nYou shuffle your effects off your body and you take a position on one of the empty mats. Before you get started mimicking the other students on their position, Paige is by your side.");
				if(flags["PAIGE_YOGA"] == 3) output("\n\n<i>“You know what?”</i> she asks you. <i>“You’ve been to enough of my classes that I think you might be ready for something a little more advanced. If you’d like, we can try to get you into some more... exotic poses, to really give those limbs a good stretch. You into it?");
				else 
				{
					output("\n\n<i>“So, what’s our goal today?”</i> she asks you. <i>“Want to relax with the easy stuff? Or do you want something a little tougher?");
					//[if PC has done Medium Mode at least four times]
					if(flags["YOGA_MEDIUM"] != undefined && flags["YOGA_MEDIUM"] >= 4) output(" Or... do you really want to test your limits? You’re ready for the intense stuff.");
					output("”</i>");
				}
				processTime(5);
				if(flags["PAIGE_YOGA"] == 3) flags["PAIGE_YOGA"] = 4;
				//[=Easy Mode=][=Medium Mode=][=Hard Mode=][=Other=][=Leave=]
				// end scene (scene: Difficulty Select 1)
				clearMenu();
				if(pc.legCount != 2 || pc.isGoo())
				{
					addDisabledButton(0,"Easy Mode","Easy Mode","You’d need to be both a biped and non-gooey for this.");
					addDisabledButton(1,"Medium M.","Medium M.","You’d need to be both a biped and non-gooey for this.");
					addDisabledButton(2,"Hard Mode","Hard Mode","You’d need to be both a biped and non-gooey for this.");
					addButton(3,"Other",otherWorkSlooootNonGoo,undefined,"Other","As a non-traditional creature, your yoga options are limited.");
				}
				else
				{
					addButton(0,"Easy Mode",paigeYogaEasyMode);
					addButton(1,"Medium M.",yogaMediumMode);
					if(flags["YOGA_MEDIUM"] != undefined && flags["YOGA_MEDIUM"] >= 4) addButton(2,"Hard Mode",yogaHardMode);
					else addDisabledButton(2,"Hard Mode","Hard Mode","That is still beyond your capabilities.");
					addDisabledButton(3,"Other","Other","This is for non-bipeds and creatures made of goo.");
				}
				return true;
			}
		}
	}
	return false;
}

//First time meeting parg 2
public function mainPaigeIntroPart2():void
{
	clearOutput();
	showPaige();
	output("An hour passes. You’ve done the best you can to follow along with Paige’s instructions, breathing when she told you to and holding all the different positions she spelled out for you. By the end of it, your body aches in places that never ached before, but you have to admit, if nothing else, you certainly feel looser.");
	output("\n\n<i>“That’s enough for today,”</i> Paige says, clapping her furry hands together once. <i>“Wonderful work today everyone, I’m very proud of you all. Hopefully you’ll all grace me with your talent again tomorrow!”</i>");
	output("\n\nHer other students thank her for the lessons as they pass her on the way out of the unit. You’re the last one to leave as you put your effects back on.");
	output("\n\n<i>“You said your name was [pc.name]?”</i> Paige asks you. You confirm. <i>“Thank you for being a part of my class today, sweet thing. How did you enjoy it?”</i>");
	output("\n\nYou tell her that you’ve never felt the pains your body is going through before, but it’s a good kind of pain, the type you get after a hearty workout. Paige laughs. <i>“Yoga can be pretty intense, especially if you’ve never done it before. But I’m glad to hear that you enjoyed it!”</i> You tell her that you’ll definitely consider coming back for another lesson or two in the future.");
	output("\n\n<i>“My regular rate is twenty credits per lesson. If you have a codex or a personal tablet, my buddy in the corner,”</i> she says, pointing to the monitor with the face in the corner of the room, <i>“can take payments automatically, so don’t worry about making them yourself. If it’s not too expensive, I’ll be waiting for you here!”</i>");
	// end scene (scene: intro 1); advance the clock by one hour; place PC one square outside of Paige’s Yoga Class
	processTime(60);
	yogaToning(2);
	pc.energy(-20);
	clearMenu();
	addButton(0,"Next",moveSouth);
}

//Lesson2 cont
public function yogaLesson2Cont():void
{
	clearOutput();
	showPaige();
	output("The lesson winds down, and Paige walks your class through some less-demanding stretches to ease you back into your average life. By the end of her class, though you’re tired and your muscles are hurt from their unusual exertions, you feel very limber. It’s only been two classes and you think you can tell the difference already!");
	output("\n\nPaige personally sees all her students out of the class, and her students thank her for another lesson as they leave. By the time you strap all of your effects back to your body, you are the last one to leave. <i>“And that just leaves you, [pc.name],”</i> says Paige, placing the backs of her wrists on the waist of her yoga shorts. <i>“How was your second class? Can I expect you for a third?”</i>");
	output("\n\nYou reply that, like before, ");
	if(!pc.isGoo()) output("you had never before experienced such a tightness – or a looseness – in some of your muscles, but you definitely are feeling something.");
	else output("you don’t really feel any physically different, but you enjoy the atmosphere of her class and the lessons she’s teaching you all the same.");
	output(" <i>“That’s good to hear. A lot of people give yoga a try only once, but I appreciate that you’re giving it its fair shot, sweet thing. How are you enjoying the lessons? Is there anything you might be stopped up on?”</i>");
	output("\n\nYou hesitate. You kind of want to bring up the touching during the Staff pose, but you decide against it. Paige is the expert, after all. You tell her that there’s nothing you can think of right off the bat. <i>“Perfect! Sometimes I feel like I might not be doing enough for my students.”</i>");
	output("\n\nIf you’re feeling <i>this</i> different after only two lessons, you tell Paige that she’s definitely getting something right. She laughs good-naturedly. <i>“I have to get ready for my next class, but hopefully I’ll be seeing you sometime tomorrow.”</i>");
	output("\n\nYou tell her that it’s a safe bet.");
	// end scene (scene: intro 2); place PC one square outside of Paige’s Yoga Class; increase Physique by 1 (max of 90% of cap)(if PC is goo, do nothing); increase Tone by 5 (maximum of 85)(if PC is goo, do nothing); deduct 20 credits; deduct 20 energy (if PC is goo, do nothing); advance clock one hour
	//Fen note: I'm chopping off dese stat gains with an axe. Dealwithit.jpg.
	yogaToning(5);
	pc.energy(-20);
	clearMenu();
	addButton(0,"Next",moveSouth);
}

public function yogaLesson3Cont():void
{
	clearOutput();
	showPaige();
	output("Another hour passes, and your lessons are done for the day. Like before, Paige is at the door, waving all of her students out and wishing them a good day. Like before, you are the last one to leave – you have more effects to put away than most, usually. Besides, you’d like to talk to Paige about something this time.");
	output("\n\nYou approach the modded Ausar non-threateningly. She doesn’t get a read on your body language at all. <i>“Good work again today, [pc.name],”</i> she tells you, smiling warmly. <i>“You’re making great progress, sweet thing. I’m looking forward to your next visit!”</i>");
	output("\n\n<i>“Yeah, about that,”</i> you interrupt. Paige’s expression softens and her ears perk.");
	output("\n\nYou ask her about the way she’s been conducting herself in her own classroom. Twice now, she’s shoved herself into your personal space and started touching you and pressing at you. The first time wasn’t quite so bad, and you chalked it up to her just trying to confirm good posture, but today, she was a little more... invasive than you appreciated");
	if(pc.tone >= 50 && pc.tone <= 89) output(" even if you kinda liked it");
	output(". Frankly, it wasn’t behavior you had come to expect from a professional.");

	output("\n\n<i>“I’m just trying to make sure your form is correct, that’s all,”</i> she assures you, taking a submissive tone in her voice. <i>“Yoga is a very physical practice, and sometimes I need to take a more hands-on form of teaching to make sure my students don’t hurt themselves.”</i>");
	output("\n\nYou reply that the floating monitor-thing helps just as well, and it doesn’t have hands to touch people with. Paige becomes visibly nervous, and you consider backing down – you didn’t want to start a fight or anything, but she may be getting the wrong message.");
	output("\n\n<i>“Look, sweet thing, I have another class coming up very shortly. Can you do me a favor and stop by my unit later tonight, after 17:00 but before midnight? I live in the unit directly next to this classroom. We can pick up from there.”</i>");
	output("\n\nThat wasn’t the response you were expecting, but it’s a modest request. You tell her to expect you there later tonight. <i>“Thanks a lot,”</i> she says, and you’re soon out of her classroom.");
	// end scene (scene: intro 3); place PC one square outside of Paige’s Yoga Class; increase Physique by 1(if PC is goo, do nothing); increase Tone by 5(if PC is goo, do nothing); deduct 20 credits; deduct 20 energy(if PC is goo, do nothing); advance clock one hour; reveal Paige’s Unit directly beside Paige’s Yoga Class
	//No stat gains as mentioned
	yogaToning(5);
	pc.energy(-20);
	clearMenu();
	addButton(0,"Next",moveSouth);
}

//[=Other=]
// Only available if the PC is not bipedal and/or is goo. Grey out all options if true; grey this option out if false
// (scene: Next Yoga (non-biped)
public function otherWorkSlooootNonGoo():void
{
	clearOutput();
	showPaige();
	if(!pc.isGoo())
	{
		output("Paige walks you through some rudimentary, upper-body poses to work as much of your form as you both can, considering your unique attributes. There are some simple arm-crosses, and she has you twist at the hip to work your spine and lower back.");
		output("\n\nAfter a quick warm-up, she first has you bend back, as far as you can without losing your balance or becoming dizzy. She then has you bend forward in an attempt to touch the floor, and though your body makes that a little challenging, you do your best. To wrap up the session before cooling down, she has you hug yourself as tightly as you can, and then cross your arms as far as they allow behind your back, to work your pectoral muscles and get them nice and limber.");
		output("\n\nBy the end of the session, though your lower body feels understandably stiff and unused, your upper body has gotten a much more intense workout than you had expected, coming into a yoga class.");
		// end scene (scene: Next Yoga (non-biped))
	}
	else
	{
		output("Paige walks you through some rudimentary poses first, getting you accustomed to her incoming lessons, and you ace every single pose without any effort. She walks you through some stretches for your back, and some arm-crosses and twists, but because of your malleable body, there is no effort to be spent and no reward to be gained.");
		output("\n\nNonetheless, you are respectful towards your teacher and you perform every task as asked of you, and she doesn’t ask you to do something ridiculous for her benefit, whatever those benefits might have been. She teaches you some poses, not necessarily so that you can perform them, but so that you have the knowledge of them. Knowing is half the battle, after all!");
		output("\n\nBy the end of the session, you feel no different as when you first came in. But you at least feel a little more knowledgeable on the topic of yoga, and you also feel a little more in-sync with your teacher.");
		// end scene (scene: Next Yoga (goo))
	}
	if(currentLocation == "YOGA_HOUSE") pc.credits -= 20;
	pc.energy(-20);
	yogaToning(0);
	clearMenu();
	addButton(0,"Next",moveSouth);
}

//[=Easy Mode=]
// Randomly play one of the following scenes
public function paigeYogaEasyMode():void
{
	clearOutput();
	showPaige();
	// (scene: Easy Mode 1)
	if(rand(3) == 0)
	{
		output("You tell Paige that you’re thinking of just taking it easy for today with some of the simpler stretches. <i>“Right on,”</i> she says encouragingly. <i>“The position for today is called the ‘Balancing Stick.’ Stand on one leg, and align your body parallel with the ground, your belly facing the floor, raising your other leg straight behind you.”</i>");
		output("\n\nYou follow her instructions as well as you can. This position puts a lot of stress on the joints of the leg you’re standing on, but the familiar burn of your muscles stretching all along the limb tells you that it’s working already, and then some.");
		if(pc.biggestCockLength() >= 25) output(" You entertain the idea of using your [pc.cockBiggest] as a kickstand to help you out, but you doubt Paige would find it as funny as you.");
		output("\n\n<i>“Now raise your arms,”</i> she instructs you, <i>“and point straight ahead with both. You want to form a straight line from the tips of your toes on your raised leg to your fingers.”</i>");
		output("\n\nAs you do this, you feel Paige’s fingers run across your body, making sure that your body is as straight as you can. She supports your raised leg when she feels it wobbling slightly in the strain. <i>“Breathe in... and breathe out.”</i> You hold this position for another moment, and then she instructs you to switch legs.");
	}
	// (scene: Easy Mode 2)
	else if(rand(2) == 0)
	{
		output("You tell Paige that you’re okay with just sticking with some of the usual poses that you’ve been working on up until now. <i>“That’s cool. Be sure to tell me when you’re ready to move up.”</i> You tell her that you absolutely will.");
		output("\n\n<i>“Our specialty for today is called the ‘Bridge.’ It’s one of the more popular poses. First, lay flat on your back.”</i> You do so. <i>“Then, place your palms flat on the mat, above your shoulders. Your elbows should be sticking straight up.”</i> As you follow along, Paige kneels beside you, running her hands along your arms to make sure that you’re performing correctly. <i>“Now, with your feet flat on the mat as well, lift your whole body straight up into the air.”</i>");
		output("\n\nYou do so");
		if(pc.biggestTitSize() >= 10) output(". The extra weight on your chest makes it a bit more of a struggle than you anticipated");
		output(". Your body contorts into a wide arch, and you definitely resemble a bridge of the same name. The burn is distributed equally through your whole body: from your wrists, across your [pc.chest] and [pc.belly], down to your [pc.feet]. Every part of you is stretched to hold this pose, but you also know that it could be worse.");
		output("\n\nPaige is by your side again, feeling along your [pc.skinFurScales] to make sure every part of your body is holding the position. Once she’s satisfied, she gives you a warm smile and stands. <i>“Breathe in,”</i> she instructs. Your body begins to vibrate in effort as you do so.");
	}
	// (scene: Easy Mode 3)
	else
	{
		output("You tell Paige that you don’t think you want to try any of the harder poses today, and you’re fine with something a little milder. <i>“You got it,”</i> she says. <i>“In that case, today’s pose is something called the ‘Bow.’ It’s hard to get into, but it’s easy to hold. First, lay flat on your stomach.”</i>");
		output("\n\nYou do so. <i>“Now, bring your legs straight up, as close to your shoulders as you can. It’ll feel weird because your knees are pointing the wrong way for this, but you can tough it out.”</i> She’s definitely correct in that it feels weird, trying to bring your legs up and behind your back like that. <i>“And for the hard part,”</i> she laughs, <i>“you’ll want to reach behind you with your arms and grip onto your ankles. You can bend your knees a little, but you must keep your arms straight.”</i>");
		if(pc.biggestTitSize() <= 39) output("\n\nYou rock back and forth a couple of times, trying to grip onto your own ankles as per her instruction. It’s pretty tough and more than a little awkward, but after a few rocks, you finally slip your feet into your own grip and you hold steady. You really feel the pull along your lower abdomen and all across your shoulders, but Paige was also right in that it’s actually a pretty easy position to hold onto now that you’ve got it.");
		else output("\n\nYou’re sure this wasn’t what the yoga teachers of old had intended when they came up with this position, but your prodigious [pc.chest] has propped your upper body up and off the floor, assisting you with your stretch. You grip onto your ankles rather easily from this position. The twins are pulling their weight this time!");
		output("\n\n<i>“Now hold this position,”</i> instructs Paige. <i>“And breathe in...”</i>");
	}
	if(currentLocation == "YOGA_HOUSE") pc.credits -= 20;
	processTime(10);
	clearMenu();
	if(currentLocation != "YOGA_HOUSE") addButton(0,"Next",easyModeEndingInApartment);
	else addButton(0,"Next",easyModeYogaEnd);
}

// connect all (scene: Easy Mode) endings here (scene: Easy Mode Ending 1)
public function easyModeYogaEnd():void
{
	clearOutput();
	showPaige();
	output("An hour passes, and Paige begins to wrap up her session with your class. You go through some ‘cool down’ poses that relax your muscles from their workout and prepare them for the rigors of your everyday life.");
	output("\n\n<i>“Well done today, everybody,”</i> says Paige, congratulating every student individually as she walks down the aisles of mats in the room. <i>“You’re all getting the hang of it rather quickly. I’m impressed!”</i>");
	output("\n\nThe general consensus is that they couldn’t have gotten as good as they are without her teaching and support. <i>“Aw, shucks, you guys,”</i> she says bashfully. <i>“You guys make it worth being a teacher. Hope to see you all again tomorrow!”</i>");
	output("\n\nYou wind down the class by taking your time putting your effects back on. You thank Paige personally as you pass her on the way out. She gives you a wink, and then you’re out her door and back into Tavros.");
	// end scene (scene: Easy Mode Ending 1); advance time by one hour; place PC one square outside of Paige’s Yoga Class; increase Physique by 1(if PC is goo, do nothing); increase Tone by 5(if PC is goo, do nothing); deduct 20 credits; deduct 20 energy(if PC is goo, do nothing)
	//No stat gains, u fux.
	yogaToning(5);
	processTime(50);
	pc.energy(-20);
	clearMenu();
	addButton(0,"Next",moveSouth);
}

//[=Medium Mode=]
// Randomly play one of the following scenes
public function yogaMediumMode():void
{
	clearOutput();
	showPaige();
	if(rand(3) == 0)
	{
		output("Something a little more exotic, she says? You’re game. No pain, no gain, and all that. <i>“Now that’s what I’d like to hear,”</i> Paige says happily, thrilled that you’re so open to the idea of pushing yourself. <i>“Alright, I think I have just the position in mind.”</i>");
		output("\n\n<i>“You ever touch your toes at all? Maybe recently; maybe as a kid? Sounds like a pretty basic stretch, right?”</i> You confirm all of her questions positively. Touching your toes is not what you would call an ‘exotic’ stretch. <i>“We’ll see about that. Sit on your butt.”</i> You comply. <i>“Now touch your toes.”</i> You do so, keeping your legs straight. You feel the familiar burn in your legs behind your knees as you do so. <i>“Now bend at the waist and touch your ankles with your forehead.”</i> You look up to Paige and grunt in surprise. <i>“You heard me. The position is called the ‘seated forward fold.’”</i>");
		output("\n\nYou take a deep breath (sure to exhale first, of course), and comply. You bend forward as far as you can");
		var boobers:Number = pc.biggestTitSize();
		if(boobers >= 20 && boobers < 40) output(". Your [pc.chest] squash against your legs and into the floor with your exertions, but you do your best to work through the obstacles and you continue forward");
		else if(boobers >= 40) output(", but it’s just not happing with your chest as... endowed as it is. You struggle and you strain, but there’s just no way you’re pulling it off with all that titflesh in the way. You sigh in resignation and simply do your best");
		if(boobers >= 60) output(", which amounts to little more than a slight lean than a full-blown stretch with [pc.chest] like yours");
		output(".");
		if(boobers <= 39) 
		{
			output(" You immediately feel the burn in your lower back as you bend forward to comply with Paige’s instruction. At first, the new sensation is a bit unpleasant, but it really starts to melt into something more pleasant after a moment");
			if(boobers >= 20) output(", which, after having breasts as large as yours for as long as you have, is a wonderful relief");
			output(".");
		}
		output("\n\n<i>“Now, hold that pose,”</i> Paige trills as she runs her hands over your back, confirming that your position is correct");
		if(boobers >= 40) output(". She frowns at your curvature, but when she gets to your neckline and the base of your breasts, she immediately realizes your struggle and doesn’t push further");
		output(". <i>“Now, breathe in. Slowly.”</i>");
	}
	else if(rand(2) == 0)
	{
		output("You think you can handle something a little tougher. You’re feeling the effects from all of Paige’s yoga classes already, so turning up the heat will get you where you’re going all the faster. <i>“That’s a great mindset to have,”</i> Paige says. <i>“Alright, let’s get you started on something a little more upscale.");
		output("\n\nFirst, take a wide step forward with your right foot. We’re looking to make a right-angle triangle between the floor and your crotch.”</i> You step forward, adjusting yourself according to her instruction. <i>“Now, without bending your knees, touch your right foot with your left hand. At the same time, turn your body and reach for the ceiling with your right hand.”</i>");
		output("\n\nWith some effort, you accomplish every step as Paige describes them. Paige feels along your legs and arms as you hold the pose, adjusting your limbs as she finds your errors. <i>“All four limbs need to be completely straight. Don’t make any bends anywhere!”</i> You grunt in effort as you hold the position. You feel the tension along your waist and all along your back, twisting every muscle there and some you never knew you had");
		if(pc.tailCount > 0) output(". You find it difficult to flex your [pc.tails]; the muscles at the base are tensed and strung up in this pose, restricting its movement");
		output(".");
		output("\n\n<i>“This pose is called the ‘twisting triangle,’ and for good reason.”</i> You grunt in agreement. <i>“It really helps with unwinding knots all throughout your back, especially towards the bottom. Hold that pose, and breathe in. We’ll switch legs in a moment.”</i>");
	}
	else
	{
		output("You’re not one to turn down the opportunity for some self-improvement. It’s one of the main reasons you keep coming back to Paige’s class in the first place. <i>“That’s the spirit,”</i> she says encouragingly. <i>“Alright then, I think I have just the pose for you to try.");
		output("\n\nFirst, lay flat on your back.”</i> You shuffle forward so that your whole body remains on the mat, and gently set yourself onto your back, as per her instruction. <i>“Bend your left knee and put it over your right leg as far as you can, without moving your right leg and without lifting either of your shoulders from the mat.”</i>");
		output("\n\nIt’s a surprisingly difficult instruction to follow! Your upper body wants to follow your lower body and tries to twist with it, but you maintain both your shoulders onto the mat. The stretch pulls hard on your left thigh and lower back, so much that you find it uncomfortable for a moment, but as with all yoga poses, you know it’ll pass.");
		output("\n\n<i>“This pose is called the ‘supine twist,’”</i> she says as she runs both her hands over your body, particularly along your left, stretched leg, making sure it’s in the correct position. <i>“It’s one of yoga’s stricter poses; if you lift your knee too close to your chest, you risk pulling a gluteal muscle. Nobody likes damaged glutes!”</i> You laugh politely. <i>“Okay, now breathe in...”</i>");
	}
	// connect all (scene: Medium Mode) endings here (scene: Medium Mode Ending 1)
	if(currentLocation == "YOGA_HOUSE") pc.credits -= 20;
	processTime(10);
	clearMenu();
	if(currentLocation != "YOGA_HOUSE") addButton(0,"Next",mediumModeEndingInApartment);
	else addButton(0,"Next",mediumModeYogaEnd);
}
public function mediumModeYogaEnd():void
{
	clearOutput();
	showPaige();
	output("After an hour of some of the more rigorous exercises, Paige finally, blissfully calls it a day. You immediately unwind and spread into a person-shaped puddle on the floor, each of your muscles aching from the foreign exertions. Paige laughs, but convinces you to go through a number of ‘cool down’ stretches, so you can properly relax your body.");
	output("\n\n<i>“You’re all making great progress,”</i> Paige congratulates, patting some of her students on the shoulder. <i>“I’m very proud of all of you. It takes real gumption to stick with yoga as long as you all have.”</i>");
	output("\n\nThe class unanimously thanks Paige for her efforts as a teacher, and they tell her that they couldn’t have done it without her. <i>“You absolutely could!”</i> she encourages. <i>“I’m just telling you what to do. Whether or not you do it is totally up to you. And you’re doing it! Give yourselves a pat on the back when you get the time.”</i>");
	output("\n\nYou wind down by putting your effects back on. Your exercises were a little more intense than the rest of the class’s, so you’re a bit slower than usual putting everything on. Paige chats you up as you work, congratulating you on your efforts and praising your willingness to keep at it. You thank her as you put on the last of your things, and Paige gives you a warm, almost loving smile as you leave her classroom.");
	// end scene (scene: Medium Mode Ending 1); advance time by one hour; place PC one square outside of Paige’s Yoga Class; increase Physique by 2; increase Tone by 7; deduct 20 credits; deduct 40 energy
	processTime(50);
	IncrementFlag("YOGA_MEDIUM");
	yogaToning(7);
	pc.energy(-40);
	clearMenu();
	addButton(0,"Next",moveSouth);
}

//[=Hard Mode=]
// Grey this option out until the PC has done Medium Mode at least 4 times
// Randomly play one of the following scenes
public function yogaHardMode():void
{
	clearOutput();
	showPaige();
	if(rand(3) == 0)
	{
		output("’The intense stuff,’ she says? Hell, why not? You feel pretty limber, and with Paige’s tutelage, you feel like you could take anything she tries to throw at you. <i>“You sure about that sweet thing? Last chance to back out.”</i> You assure her that you’re ready. <i>“Alright. Let’s find your breaking point.”</i>");
		output("\n\nRather than stand beside you as she usually does, Paige pushes you aside and stands on your mat with you. <i>“This pose is meant for two. This will give me a better idea of what your limits are, as well.”</i> You suddenly feel a little self-conscious; it feels like Paige is challenging you, and you don’t know if you can compare to a yoga master with years of experience.");
		output("\n\nPaige lies on the mat, flat on her back and her arms extended up above her head. She takes a deep breath, and then, in one fluid motion, brings both her legs up and over her body, folding herself in half. She keeps her legs straight, and seemingly without much effort, she grips onto her own ankles without bending her arms.");
		output("\n\n<i>“This is called a ‘forward bend,’”</i> she says, stuttering through her breaths. While she can breathe normally, it must be difficult to hold a conversation in such a pose. <i>“[pc.name], sit on your knees in front of me, facing away.”</i> You do so awkwardly, finding it difficult to get comfortable");
		if(pc.tailCount > 0) output(", especially with your [pc.tails] getting squished between you");
		output(". <i>“Align your toes with my armpits.”</i> A bit of a crass instruction, but you comply. <i>“Now, without moving your legs, I want you to grip my ankles.”</i>");
		output("\n\nYou look behind you, seeing just how far away Paige’s feet are from your position. You have to bend backward to reach them, effectively folding yourself over her already-folded form. They’re only a half-body-length away, but she may as well have asked you to stretch your arms a country mile.");
		output("\n\nYou stop your complaining and do as she told you. You lean back, your spine folding the wrong way over Paige’s upturned rump, her");
		if(pc.tailCount > 0) output(" own");
		output(" tail painfully pushing down between you. You run your hands along her legs behind you, trying to find her ankles. <i>“Keep going,”</i> she says comfortingly whenever you pause because you think you’re at your limit.");
		output("\n\nYou find her knees, then her calves, and finally, with your back bent like a horseshoe and your chest feeling like it’s going to burst out of your skin, you find the talus bone of her ankle. Every breath comes out forced, because your upper body is stretched so thin, there’s barely any room for oxygen. This pose puts the stretch on your knees, hips, shoulders and elbows, but more importantly, on every bone and muscle in your whole torso.");
		output("\n\n<i>“Calm, easy breaths, [pc.name],”</i> says Paige, feeling you stutter with strain. <i>“Your pose is called the ‘backward bend.’ Just hold it for another few seconds.”</i>");
		output("\n\nThey pass torturously, but you feel a type of elation and self-accomplishment you don’t often feel anymore when Paige orders you off her.");
		output("\n\n<i>“Don’t get too relaxed,”</i> she warns, <i>“because we’re switching positions.”</i>");
		output("\n\nOh.");
	}
	// (scene: Hard Mode 2)
	else if(rand(2) == 0)
	{
		output("You smile confidently at the challenge of doing something a little more intense, and you tell Paige that you’re more than game to take on anything she can give you. <i>“That’s big talk,”</i> she says, matching your bravado. <i>“We’ll see how long you can keep that attitude.”</i>");
		output("\n\nUnexpectedly, Paige shoos you off the mat, taking the whole thing for herself. She stands on it, facing directly away from you, your eyes to her back. <i>“This position is a twofer, so I’ll be your buddy for today. I’m going to take a position called ‘downward-facing dog.’ I know that’s a real hoot, coming from an Ausar, so get your giggles out now.”</i>");
		output("\n\nAs she says that, she falls onto her hands, taking a triangular position. She keeps her legs and her whole upper body completely straight, her rump being the highest point of her body. You help yourself to a glance or two. It’s quite a sight, after all.");
		if(pc.hasCock() && !pc.hasVagina()) 
		{
			output(" Your [pc.cock] enjoys the sight as well");
			if(pc.lust() <= 49) output(". You feel like an insecure teenager in middle school, desperately trying to fight getting a boner in class. You win – this time.");
			else output(". Your hormones were already in overdrive, and now you have a sexy, fit yoga instructor wagging her ass at you. You wonder how mad she would be if... no, she’d get pissed. You’d better not.");
		}
		else if(pc.hasVagina() && !pc.hasCock())
		{
			output(" Honestly, Paige rocks the ‘sexy yoga instructor’ angle really well");
			if(pc.lust() <= 49) output(". Well enough to turn gay men straight and straight women gay, if the tingling in your [pc.vaginas] is any indication.");
			else output(". You were already fighting a fire in your [pc.vaginas] before class had started, and this is doing nothing to help. You know better than to try anything in the middle of class, but hot damn, the shit you’d do to her would make a pornstar blush.");
		}
		else if(pc.isHerm())
		{
			output(" You wonder how it would feel against your... particular toolset");
			if(pc.lust() <= 49) output(". You clear your throat in an attempt to distract yourself from the mess your [pc.cocks] and [pc.vaginas] are threatening to make. You control yourself, but that was closer than you’d like to admit.");
			else output(". You’re sure, with a body as flexible as hers, she would have no trouble making sure your [pc.cock] is given as much attention as your [pc.vagina]. You can just imagine it now... and with some effort, you pull yourself back to reality.");
		}
		output("\n\nThat’s enough of that. Paige has aligned herself into a perfect triangle with the ground. The only thing out-of-place is her head, hanging low and between her arms. <i>“Now, and this is going to be a real test, [pc.name],”</i> she begins. <i>“You’re going to put both of your hands next to mine, and you’re going to align your chest with my back. Then, lift your legs up and over your head, putting your body into a C-shape.”</i>");
		output("\n\nIt’s a very difficult command to follow. You start easy, with the hands, then you try to follow the next set of instructions to the letter, but you start by draping your body over hers, your waist to butt. <i>“Don’t get too comfortable up there,”</i> she whispers sultrily");
		if(pc.hasCock()) output(". There’s no way she doesn’t know about the boner she <i>just</i> gave you. In fact, from the way she’s ‘struggling’ to maintain her own position, she may even be egging you on");
		output(".");

		output("\n\nYou");
		if(pc.hasCock()) output(" nonetheless");
		output(" attempt to follow with the rest of Paige’s instruction, and you lift your lower body off hers, contorting yourself into a C-shape, just as she had said. <i>“This pose depends on you, [pc.name], because if you put too much weight on me, we’re going to fall.”</i>");
		var boobers:Number = pc.biggestTitSize();
		if(boobers <= 4) output("\n\nShould be simple! You’re not especially top-heavy, so putting your balance on your lower body isn’t difficult, especially with all the yoga practice you’ve had up until now.");
		else if(boobers < 20) output("\n\nYou grunt in effort. The weight in your [pc.chest] is pulling you down, onto Paige, putting pressure on her form and keeping you from staying upright. It’s difficult, but you prevail, holding the C-shape without relying too much on Paige’s own stability.");
		else
		{
			if(silly && boobers >= 60) output("\n\nYou strain to hear her through the muffles of your own titflesh, which has encapsulated her body completely. No part of Paige is visible through the roiling sinews of your [pc.chest] as she maintains (you think) her position within the cavernous valley of your cleavage, and every sound she makes comes out as a nonsensical bumble to your ears. But damn, however this ends, Paige’s furry body sure does feel great against your boobs. Maybe you’ll just keep her there.");
			else output("\n\nPaige talks through gritted teeth, already wincing and breathing hard, trying to keep you both up without collapsing under the immensity of your [pc.chest]. Your job is hardly any easier, with how your boobs are fighting to pull you back down and out of position. You’ll have to apologize to her later.");
		}
		output("\n\n<i>“Now, deep breath in.”</i> You breathe in, your arms struggling in your awkward handstand against Paige’s back. Your position really works the whole curvature of your spine, and the way you rely on your lower body for your balance is really pulling the kinks out of your waist and it’s putting a ton of demand on your abdominal muscles. <i>“Breathe out.”</i> When you exhale, you feel just a few grams lighter, and every single one makes a difference. <i>“Your position is called the ‘scorpion.’ A couple more breaths, and then we’ll switch positions.”</i>");
		output("\n\nThere’s <i>more?!</i>");
	}
	else
	{
		output("You tell Paige that you’re not afraid of a little more challenge. She’s gotten you pretty limber and able-bodied at yoga so far, and you’re ready for whatever she can throw at you. <i>“‘Anything,’ you say?”</i> she asks deviously. <i>“I have just the thing in mind for you.");
		output("\n\n<i>“First, lay flat on your back.”</i> You do so on the mat, laying at rest. Unexpectedly, Paige stands over you, her feet against your shoulders. You have a direct line of sight up her naval, to the underside of her breasts, and directly at her crotch");
		if(pc.hasCock()) output(". You don’t need a view to your own to know the signals you’re now sending out");
		output(". <i>“I want you to wrap your arms up my legs, your hands against my knees.”</i> This is getting kind of weird and sexy, but you do as she asks.");
		output("\n\n<i>“I’m going to keep my back straight, and I’m going to fall forward. Your job is to keep me from falling.”</i> As she promised, she falls forward stiffly, and suddenly her body weight is resting on your arms and shoulders. Her body is held diagonally from the floor, at an awkward forty-five degree angle – and she doesn’t stop, leaning farther forward. If it weren’t for you, she absolutely would have lost her balance and fallen.");
		output("\n\nIn fact, she leans so far forward, that in order to compensate for the combination of her body weight and gravity fighting against you, you have to lift your own lower body off the ground as a counterweight. <i>“I can feel that,”</i> Paige says, her eyes forward. <i>“It’s good that you’ve figured that out. Far as I’m aware, these positions aren’t called anything, but you can certainly feel it work, can’t you?”</i>");
		output("\n\nPaige’s body is supported only by your arms and your shoulders, and you certainly feel the stress on them as she keeps totally still. Your lower body is supported by your torso, and you feel the tightening in your pectorals in order to maintain some semblance of equilibrium. You breathe in slowly and exhale a little raggedly, but you maintain.");
		output("\n\n<i>“Well done,”</i> Paige congratulates you. <i>“Just hold this position for a bit longer, and then we’ll switch.”</i>");
		output("\n\nAt first, that sounds like a good idea to you – but then you realize just how much pressure is on Paige’s abs to keep her back straight at her angle. This is going to be a tough one.");
	}
	// end scene (scene: Hard Mode 3)
	processTime(10);
	if(currentLocation == "YOGA_HOUSE") pc.credits -= 20;
	//CUE HARDMODE GAINS
	if(!pc.hasPerk("Limber"))
	{
		if(eventQueue.indexOf(hardmodePaigePerkGain) == -1) eventQueue.push(hardmodePaigePerkGain);
	}
	else
	{
		//RESET THE TIMER, THE MOVE ON WITH LIFE.
		pc.setStatusMinutes("LimberTime",24*60*14);
	}
	clearMenu();
	if(currentLocation != "YOGA_HOUSE") addButton(0,"Next",apartmentYogaEndings);
	else addButton(0,"Next",yogaHardEnding);
}

public function yogaHardEnding():void
{
	clearOutput();
	showPaige();
	output("The class session ends. You collapse into a puddle of [pc.skinFurScales], your muscles aching and your bones feeling as though they had been bent out of and into their positions time and again. You lay splayed on the floor, your feet about shoulder-width apart and your arms detached from your body.");
	if(flags["YOGA_HARD"] == undefined) output(" Paige tells you that the pose you’re in is actually considered more yoga; a pose called ‘savasana.’ Whatever. As long as you’re not stretching anything.");
	else output(" The savasana pose is easily the best, most practical part of yoga, especially right this second. You feel like you could sleep right then and there.");
	output("\n\nYou hear the rest of the class leave the room, thanking Paige for another session, and her thanking them for being her students. Your eyes are shut closed for all of it, and you don’t pay attention to any of the sounds. You’re only concerned with the sinking feeling that’s over your whole body as you relax and absorb the work you’ve done today.");
	output("\n\nYou hear Paige’s footsteps as she approaches you. Then you hear her take a seat beside you on the floor. <i>“I’m impressed, [pc.name],”</i> she says gently, rubbing her palm over your forehead. <i>“You kept up quite well. You’re taking to yoga naturally.”</i> You bumble your way through a sentence; even your mouth is too tired and strained to put much effort into anything.");
	output("\n\nShe giggles. <i>“Been there.”</i> She gets up. <i>“I have another class coming in a few minutes, so you can’t stay here, [pc.name]. But when you leave, hold yourself high! I’ve been practicing yoga for years, and you toughed out a one-on-one with me. You’ll be on my level, eating those harder positions for breakfast, in no time flat at this rate.”</i>");
	output("\n\nIt takes you minutes more to pull yourself together and put your effects onto your body. By the time you’re out of Paige’s classroom, some of her other students are arriving for their own session. You contemplate taking tomorrow off, but Paige’s warm smile as she sees you out pulls you out of that. There are plenty of reasons to come back tomorrow.");
	// end scene (scene: Hard Mode); place PC one square outside of Paige’s Yoga Class; increase Physique by 2; increase Reflexes by 1; increase Tone by 10; deduct 20 credits; deduct 70 energy; if (scene: Hard Mode 2), increase Lust by 20; inflict Sore on PC
	processTime(50);
	//Fuck yo stat gains, B. -Fen
	pc.energy(-70);
	pc.lust(20);
	yogaToning(10);
	clearMenu();
	addButton(0,"Next",moveSouth);
}

public function paigesUnitDurhurrrrrrrrrrFenWroteUNIT():Boolean
{
	clearOutput();
	showPaige();
	// PC goes to Paige’s Unit any time between 17:01 and 00:00 (scene: Paige 1)
	if(flags["MET_IDDI"] == undefined)
	{
		output("You check your codex for the time as you approach the unit next to Paige’s classroom. It’s the right time, and it’s the right place. The door is made of an opaque type of glass that conceals everything behind it in a thick fog. You knock on it and wait.");
		output("\n\nIn a moment, the glass becomes clear and you can see into the unit, but the door remains shut. Instead of Paige, the little floating monitor that helps her in her class shows instead. It regards you for a moment before turning back into the apartment. <i>“Momma!”</i> you hear it shout with its young-boy vocals as it turns back into the apartment. <i>“[pc.name] is here!”</i>");
		output("\n\nIt vanishes around the corner, and soon Paige arrives, the monitor close behind her. She opens the door and shows you in. <i>“Thanks for coming by,”</i> she says. She’s wearing casual clothing: a purple cotton top with a folded collar, with sleeves that go halfway down her biceps, and a set of jeans that go to her ankles. Aside from the earpiece in her right ear, this is the first time you’ve seen her out of her yoga set. <i>“I, uh, didn’t want to risk an argument or anything in the classroom.”</i>");
		output("\n\nYou assure her that you didn’t intend to get overly confrontational from the beginning; just that you were a bit concerned about how touchy she got in the last lesson. You didn’t mind all that much");
		if(pc.tone <= 9) output(" (you lie)");
		output(", but there isn’t any guarantee that every student will be as... receptive.");
		output("\n\nPaige’s apartment is modest: a spacious living room with a loveseat and a lounging leather chair facing a coffee table and a large flatscreen television meshed into the far wall, along with a narrow strip of kitchen and a door leading to her bedroom off in one corner. The unit is about the same size as her classroom, but much better furnished.");
		output("\n\nPaige takes a seat on the loveseat and waits for you to take a seat yourself. You opt for the lounger next to the couch.");
		processTime(5);
		clearMenu();
		addButton(0,"Next",firstPaigeHousemeet);
		return true;
	}
	if(flags["PAIGE_TALK_SELF"] != undefined && flags["PAIGE_TALK_SELF"] >= 4 && flags["SEXED_PAIGE"] == undefined) 
	{
		paigeSexPrologue();
		return true;
	}
	//Halloween stuff
	if(isHalloweenish() && flags["PAIGE_GHOSTED"] == undefined && flags["SEXED_PAIGE"] != undefined)
	{
		flags["PAIGE_VISIT_DAY"] = days;
		//Halloween event intro!
		if(flags["HALLOWEEN_REJECTED_1"] == undefined)
		{
			paigeHalloweenerIntro();
			return true;
		}
		//If not yet completed, repeat variant!
		if(flags["HALLOWEEN_REJECTED_1"] + 60*24*7 >= GetGameTimestamp())
		{
			paigeHalloweenIntroRedux();
			return true
		}
	}
	if(paigeIsCrew())
	{
		paigeUnitAsCrewmate();
		return true;
	}
	// PC enters Paige’s Unit any time between 17:00 and 00:00 after scene: Paige 1 (scene: Paige Select 1)
	if(flags["SEXED_PAIGE"] == undefined)
	{
		output("You knock on Paige’s glass door. Iddi answers it before turning back into the apartment to holler for its momma; very soon, Paige is there, opening the door and showing you into her home.");
		output("\n\n<i>“It’s good to see you again, sweet thing.”</i> She laughs. <i>“Well, you know, figure of speech with me. Go ahead and make yourself at home! I’ll be with you in just a moment.”</i>");
		output("\n\nPaige vanishes into her bedroom while you take your seat at the lounger next to the loveseat. She’s back after a moment, her hair done up into a ponytail and the projection is on, hiding her scar from your view. Despite her disability, she seems to know exactly where you’re sitting, and she deftly walks around you and the rest of her furniture to take a seat on the couch.");
		output("\n\n<i>“So what’s cookin’, good lookin’?”</i> she says, laughing again.");
		//[=About Paige=][=About Iddi=][=Her Eyes=][=Appearance=][=Leave=]
		processTime(4);
		paigeMenu();
	}
	// PC enters Paige’s Unit any time between 17:00 and 08:59 after PC has had sex with Paige once (scene: Paige Select 2)
	else
	{
		output("You show yourself into Paige’s unit and holler her name, letting her know that you’re there. Iddi, as usual, is there to greet you first, confirming that you are who you say you are, before it rushes off to find its momma.");
		output("\n\nPaige is with you shortly. ");
		if(hours >= 17) output("She’s wearing some casual, done-up clothing that hugs her tight yoga body very well, and her hair is done up in a cute ponytail between her ears. She has a warm smile on her lips as she approaches you, her arms out and open, looking for you to embrace her. The projection on her eyes is on, hiding her scar from your sight.");
		else output("She’s down to her underwear; her bra pressing into her C-cups and deepening their natural cleavage for you. She has nothing covering her abs, gloriously displaying her tight six-pack for you to marvel over, and her panties cling to every facet of her hips and ass as she sashays towards you sexily, her tail swishing against her lower calves as she does. Her hair is let down, dropping to her shoulder blades, and her projector has been shut off, displaying the scar across her face. Her arms are open and her mouth is curled into a sultry grin, waiting for you to embrace her.");
		output("\n\n<i>“Hey there, sexy,”</i> she says when you finally meet her hug. She gives you a quick kiss on the lips – no tongue, and not for long, but just long enough. <i>“It’s good to see you again. Metaphorically,”</i> she snickers.");
		output("\n\nShe grabs you by the hand and leads you back into her bedroom. She takes a seat on the edge of the bed and waits for you to join her. You do.");
		output("\n\n<i>“So what’s the plan for tonight, good lookin’?”</i> she asks you.");
		processTime(7);
		//[=About Paige=][=About Iddi=][=Her Eyes=][=Appearance=][=Yoga=][=Sex=] [=Rest=][=Spar=][=Leave=]
		paigeMenu();
	}
	flags["PAIGE_VISIT_DAY"] = days;
	return true;
}

public function paigeMenu():void
{
	clearMenu();
	addButton(0,"About Paige",askPaigeAbootHerself,undefined,"About Paige","Ask Paige for more of her story.");
	addButton(1,"About Iddi",aboutIddiTalk,undefined,"About Iddi","Ask Paige about her robotic companion Iddi.");
	//[=About Iddi=]// If the PC is currently on their ship, grey this option out and display the following tooltip. Otherwise, continue as normal from the original scene.
	if(currentLocation == "SHIP INTERIOR") addDisabledButton(1,"About Iddi","About Iddi","It’d be awkward to ask for more details about Iddi when it’s not here. You can always head back to Tavros and meet Paige in her unit if you’re really curious.");

	if(flags["PAIGE_TALK_SELF"] != undefined && flags["PAIGE_TALK_SELF"] >= 3) 
	{
		if(paigeIsCrew()) addButton(2,"Her Eyes",crewPaigeEyeholes,undefined,"Her Eyes","Ask Paige about her new eyes.");
		else addButton(2,"Her Eyes",askPaigeAboutHerEyes,undefined,"Her Eyes","Ask Paige about her eyes. She mentioned that she was interested in synthetic implants?");
	}
	else addDisabledButton(2,"Locked","Locked","You don’t know enough about her for this.");
	addButton(3,"Appearance",paigeAppearance,undefined,"Appearance","Give Paige the once-over with your eyes. She’s been sculpting her body for years – she’d probably enjoy the attention.");

	if(flags["SEXED_PAIGE"] != undefined)
	{
		//[=Yoga=][=Sex=] [=Rest=][=Spar=]
		if(flags["PAIGE_YOGA_DAY"] == days) addDisabledButton(4,"Yoga","Yoga","It’s not a good idea to do extended yoga sessions more than once a day. You might hurt yourself!");
		else if(pc.isPregnant() && pc.bellyRating() >= 90) addDisabledButton(4,"Yoga","Yoga","It’s not a good idea to do extended yoga sessions while you are heavily pregnant!");
		else addButton(4,"Yoga",paigeAtHomeYoga,undefined,"Yoga","Even though you’re not ‘officially’ a student of hers, you could still try asking Paige if she’s willing to do some yoga.");

		if(pc.lust() >= 33) addButton(5,"Sex",sexWithPaige,undefined,"Sex","You could really do with some release, and something tells you yoga’s not gonna cut it.");
		else addDisabledButton(5,"Sex","Sex","You’re not aroused enough to have sex with Paige. There are several ways to fix that, of course.");

		if(currentLocation == "PAIGE_HOUSE")
		{
			if(hours >= 20 || hours < 6) addButton(6,"Rest",restOnSomeSchtuff,undefined,"Rest","No yoga and no sex – just some cuddling with Paige for a good night’s rest.");
			else addDisabledButton(6,"Rest","Rest","Who goes to bed in the middle of the day? Come on.");
		}

		if(flags["PAIGE_TALK_SELF"] >= 5)
		{
			if(hours >= 17 || paigeIsCrew()) 
			{
				if(paigeBlind()) addButton(7,"Spar",sparWithPaige,undefined,"Spar","Paige mentioned that she would like a sparring match against you. Even though she’s blind, don’t expect an easy fight!");
				else addButton(7,"Spar",sparWithPaige,undefined,"Spar","Paige mentioned that she would like a sparring match against you. Given her strength and her fixed eyes, she might be your toughest challenge yet!");
				if(pc.HP() <= 1) addDisabledButton(7,"Spar","Spar","You’re a little too hurt to do any sparring right now.");
			}
			else addDisabledButton(7,"Spar","Spar","Tonight’s not the night for fighting. You might cause a disturbance with the noise among the other units, besides.");
		}
		else addDisabledButton(7,"Locked","Locked","You don’t know her well enough for this.");
	}
	if(flags["PAIGE_GHOSTED"] != -1 && flags["PAIGE_GHOSTED"] != undefined) addButton(8,"Ghost",paigeGhostGhost,undefined,"Ghost","Ask Paige if she’s willing to let her dickgirl passenger take over this time.");
	
	if(paigeRecruited())
	{
		if(!paigeIsCrew()) addButton(13, "Recruit", paigeCrewToggle, true, "Recruit", "Recruit Paige to your ship.");
		else addButton(13, "Dismiss", paigeCrewToggle, false, "Dismiss", "Dismiss Paige from your ship.");
	}
	
	if (currentLocation == "SHIP INTERIOR")
	{
		if (flags["CREWMEMBER_SLEEP_WITH"] == "PAIGE") addButton(9, "Sleep Alone", paigeRegardingTheBed);
		else if (flags["CREWMEMBER_SLEEP_WITH"] == undefined) addButton(9, "Sleep With", paigeRegardingTheBed, false, "Sleep With Paige", "Ask Paige if she’d be willing to spend the nights with you. In a purely non-sexual way, of course. Purely.");
		else addDisabledButton(9, "Sleep With", "Sleep With Paige", "You promised someone else that they could share your bed with you! Go and break it off with them first if you want Paige warming your bed at night.");
	}
	
	addButton(14,"Leave",leavePaige);
}
public function paigeCrewToggle(recruit:Boolean = true):void
{
	clearOutput();
	showPaige();
	author("Jacques00");
	
	if(recruit)
	{
		output("You ask Paige if she is able to join your crew. With a smile, she " + (currentLocation != "YOGA_HOUSE" ? "quickly" : "wraps up her session, closes her classroom,") + " gathers her things and heads toward your ship.");
		
		flags["PAIGE_CREW"] = 1;
		
		output("\n\n(<b>Paige has rejoined your crew!</b>)");
	}
	else
	{
		output("You ask Paige if she is willing to move out to make room on your ship. With a quick salute, she compiles some of her belongings and " + (shipLocation == "TAVROS HANGAR" ? "quickly heads" : "calls for a transport shuttle") + " home.");
		
		flags["PAIGE_CREW"] = 0;
		
		output("\n\n(<b>Paige is no longer on your crew. You can find her again in Tavros Station.</b>)");
	}
	
	processTime(2);
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function firstPaigeHousemeet():void
{
	clearOutput();
	showPaige();
	output("<i>“I was telling the truth when I said my teaching requires a bit more of a hands-on approach than most other teaching subjects,”</i> she says. You’re quick to say that you believed her from the start. <i>“But you’re also right in that my teaching tends to get a little more... explorative than you might think is necessary. And you’re right in that Iddi doesn’t need hands to help my other students like I do.”</i>");
	output("\n\nYou interrupt her by asking her who ‘Iddi’ is. <i>“He’s the floating TV that’s been helping me with the class.”</i> She turns towards Iddi’s direction and calls his name.");
	output("\n\n<i>“Yes, momma?”</i> Iddi says, floating itself until the projected cartoony eyes are level with hers.");
	output("\n\n<i>“Introduce yourself to our guest,”</i> she instructs.");
	output("\n\nIddi floats up to you, the eyes on its screen shrinking into crescent lines as a mouth forms on its pixels, spreading into a wide, open-mouthed, toothless grin. <i>“My name is Iddi!”</i> it says. <i>“What is your name?”</i>");
	output("\n\nYou introduce yourself to the monitor. <i>“Hello, [pc.name]! Have a good day!”</i> Iddi then makes its way back to Paige’s side, the mouth disappearing to make way for the eyes again. Iddi apparently isn’t much for conversation.");
	output("\n\n<i>“Iddi is a personal droid for elderly and disabled people. Technically, Iddi is designated as a ‘Personal Accessibility Assistant,’ but I think ‘PAA’ was a lame name for him, so I named him Iddi.”</i>");
	output("\n\nYou look Paige over and mention that she appears neither elderly nor disabled. She chuckles nervously. <i>“I like to tell people that I got Iddi just because I’m really lazy. Iddi does a lot of shopping for me down in the Merchant Deck. But, the truth is...”</i>");
	output("\n\nShe clenches her left fist and takes a deep breath. She reaches for her earpiece and then clicks an unseen button somewhere closer to the canal of her ear. Then, suddenly, the area around her eyes seems to flicker.");
	output("\n\nA green light going across both eyes and over the bridge of her nose flashes twice, and then the battery light in her earpiece shuts off. Where before Paige had stunningly beautiful blue eyes and a perfect complexion (as perfect a complexion a furry face can get, anyway), her eyes become nearly egg-white shells with barely any hint of a colored iris, and the pitch-black pupils are replaced with light-grey dots.");
	output("\n\nBut, more shockingly, there’s a massive scar going across both her eyes, reaching practically ear-to-ear. The fur you thought was there had been cut away to reveal her dead, scarred skin, about a centimeter wide, reaching all the way across her face, over her nose, and through her eyes.");
	output("\n\n<i>“I’m blind as a bat,”</i> she finishes.");

	flags["MET_IDDI"] = 1;
	processTime(13);
	clearMenu();
	addButton(0,"Next",firstPaigeHousemeet2);
}
public function firstPaigeHousemeet2():void
{
	clearOutput();
	showPaige();
	output("You stumble your way through an apology. You had never seen such a vicious scar on anyone before. You had no idea she was in such a condition. <i>“And I’d prefer to keep it that way,”</i> she says. <i>“Not a lot of people know about my condition.”</i>");
	output("\n\nYou say that her behavior in the classroom makes total sense now, and it does. Paige can’t see anything at all, so she has to use her hands to make sure your posture is correct.");
	output("\n\n<i>“You got it,”</i> she smiles. <i>“You’re actually not the first person to complain to me about my hands-on approach, and I doubt you’ll be the last. Most people are fine with me just telling them that it’s because of the subject. Sometimes people don’t buy it and they get flustered and walk out after a class or two. But not only do you keep coming back, but you’ve been very patient about the whole thing. So, I figure, I could probably trust you with a secret.”</i>");
	output("\n\nYou ask her how she got such a bad wound, and why she needs to keep it a secret so badly. Is she just too proud to admit that she needs help? <i>“That</i> is <i>one part of it, for sure,”</i> she nods. <i>“I was always raised to not be co-dependent on anyone. Honestly, even admitting that I need Iddi around is a bit of a blow.”</i>");
	output("\n\n<i>“Momma?”</i> Iddi asks, apparently wounded by her words.");
	output("\n\n<i>“Hey, I don’t mean anything by that, baby,”</i> she says soothingly, rubbing her hand across the top of Iddi’s chrome frame. <i>“You’re definitely the best thing that’s happened to me after the fact. I’d be totally lost without you.”</i> She plants a soft kiss on Iddi’s screen; its pixels turn bright pink, and then back to baby blue, taking its place beside her again.");
	output("\n\n<i>“As for the whole story, like how I got this sucker,”</i> she says, drawing a line all the way from one side of the wound to the other with her finger, <i>“that’s a story you’ll have to work for.”</i> She places a finger on your chest playfully, just underneath your collarbone. <i>“My favorite drink in the galaxy is Honey Wine, found only on the planet of Myrellion. Or you can keep coming to my classes. Come back to my unit after we’ve done a class, or if you have a bottle of wine, and I’ll yak your ears off.”</i>");
	output("\n\nShe seems to be in good spirits. You talk a bit more, about her yoga class and about the Honey Wine drink, but ultimately it’s just chatter. You’ve got what you wanted from her, so after an hour passes, you show yourself out of her unit, promising her that you’ll be back soon, either for another lesson, or for some of that sweet honey she wants.");
	// end scene (scene: Paige 1); advance clock by one hour; place PC one square outside of Paige’s Unit
	processTime(20);
	clearMenu();
	addButton(0,"Next",moveSouth);
}

//[=About Paige=]
// Tooltip: <i>“Ask Paige for more of her story.”</i>
public function askPaigeAbootHerself():void
{
	// Play the following scene if the PC did not attend class for the day and does not have Honey Wine in their inventory.
	if(flags["PAIGE_YOGA_DAY"] != days)
	{
		clearOutput();
		showPaige();
		if(!pc.hasItemByClass(HoneyWine))
		{
			output("You sit with Paige and ask her to tell you more of her story. You’re interested in learning more about your Ausar instructor.");
			output("\n\nShe squints her eyes at you and her lips curl into a mischievous smirk. <i>“Now now, what did I tell you before, sweet thing?”</i> she asks playfully, batting you on the nose. <i>“If you want to know a little more about me, you gotta come to my classes for some exercise. Or you can bribe me with some Honey Wine. I can’t give away</i> all <i>my secrets just because one of my favorite students asks. It’s give-and-take between us. You visit me at work, and I tell you what you want.");
			if(!silly) output(" Quid Pro Quo, I think is the saying");
			else output(" Skid Row Bro, I think is the saying.”</i> You try to tell her that it’s not. <i>“No no, I know my pop culture references, and it’s definitely that");
			output(".”</i>");
			output("\n\nLooks like you’re not getting anything out of Paige this time. May as well try something else while you’re here?");
			// end scene (scene: Denied)
			// Return to Paige Select, no other penalty
			processTime(2);
			clearMenu();
			addButton(0,"Next",backToPaigeMenu);
		}
		// Play the following scene if the PC did not attend class for the day, but has Honey Wine in their inventory.
		else
		{
			output("You sit with Paige and ask her to tell you more of her story. You’re interested in learning more about your Ausar instructor.");
			output("\n\nShe squints her eyes at you. <i>“I don’t recall seeing you in my class today, sweet thing”</i> she growls playfully. <i>“Well, figuratively speaking, you know what I mean.”</i> She smiles at you mischievously. <i>“These sexy lips are staying sealed. But, you know, you could always bribe them open...”</i>");
			output("\n\nAs a matter of fact, you happen to have some of her favorite drink handy. It’s admittedly a bit of an expensive bribe, but hell, you’re a sucker for a face as cute as Paige’s. Do you give her your Honey Wine?");
			//[=Yes=][=No=]
			processTime(5);
			clearMenu();
			addButton(1,"No",paigingDrHoneyWine);
			addButton(0,"Yes",givePaigHoneyWine);
		}
	}
	else askPaigeAbootHerself2();
}

//[=No=]
// (scene: Honey Wine: No)
public function paigingDrHoneyWine():void
{
	clearOutput();
	showPaige();
	output("You elect to not mention the wine to Paige and keep it to yourself. It’s quite a bit more expensive to get Paige to talk with the wine than it is to just go to a class during the day. Hopefully she doesn’t find out that you’re holding out on her...");
	processTime(1);
	paigeMenu();
}

//[=Yes=]
// (scene: Honey Wine: Yes)
public function givePaigHoneyWine():void
{
	clearOutput();
	showPaige();
	pc.destroyItemByClass(HoneyWine);
	output("You grin in response. <i>“Don’t suppose I can bribe them open with money?”</i>");
	output("\n\n<i>“‘fraid not, sweet thing.”</i>");
	output("\n\nYou sigh. <i>“In that case,”</i> you say as you withdraw your bottle of Honey Wine, <i>“I guess this Honey Wine will have to do instead.”</i>");
	output("\n\nHer ears perk straight up when she hears the viscous sloshing of the alcohol in its bottle. <i>“Hot damn!”</i> she shouts, her grabby hands reaching for the wine. You let her snatch it from your grip. Within moments, her practiced yoga grip has the cork out, but she takes her time gargling it down and instead takes a heady whiff of the drink.");
	output("\n\n<i>“That’s the stuff,”</i> she says dreamily. <i>“Tonight’s gonna be a great night.”</i> She puts the cork back in the neck of the bottle and faces you attentively, a sweet, sincere smile on her face. <i>“Fair’s fair! So, where did we leave off?”</i>");
	IncrementFlag("PAIGES_WINES");
	processTime(3);
	clearMenu();
	//[=Next=]
	// end scene (scene: Honey Wine: Yes)
	// remove one Honey Wine from the PC’s inventory
	// continue to whichever scene the PC is queued for next
	addButton(0,"Next",askPaigeAbootHerself2);
}

// Play the following scenes if the PC attended the class for the day, or has bribed Paige with the Honey Wine.
// (scene: Paige 2)
public function askPaigeAbootHerself2(arg:Number = -1):void
{
	clearOutput();
	showPaige();
	if(flags["PAIGE_TALK_SELF"] == undefined || arg == 0)
	{
		if(flags["PAIGE_TALK_SELF"] == undefined) output("You ask Paige about herself. You could jump right to conclusions and ask how she got such a devastating scar, but apparently it’s a big secret, and you don’t want to rush her. You instead ask her how she came to be a yoga instructor.\n\n");
		output("Paige reels in surprise suddenly. It wasn’t the question she was expecting, clearly. <i>“Well, it’s not too complicated. I was a tumbler when I was a kid – I liked to roll and flip and contort myself into all sorts of shapes. A lot of kids are like that, but,”</i> she giggles, <i>“I guess I never really grew out of it.”</i>");
		output("\n\n<i>“You ever build a couch fort when you were younger?”</i> You answer positively – what kid hasn’t built a couch fort at least once? <i>“Couch forts weren’t really my thing, but what I liked to do was arrange the cushions so that there was only a small space between them, and then I’d curl myself small enough to fit into it. I’d keep making the hole smaller and smaller, even as my body got bigger and bigger. It’s not yoga, but the contortionist-thing was a good stepping stone toward it.”</i>");
		output("\n\n<i>“Then, when I was a teenager, my mom enrolled me in gymnastics.”</i> Her eyes wander as she recalls her halcyon years fondly. <i>“She thought it was the next logical step. It was a fun time! Met some of my closest friends today back then. It was my first introduction to some of the wilder species’ in our universe, like the Kui-Tan, too. I dropped out after a year, though. While I</i> did <i>have the sense of balance for it, I was better at stretching and contortion, not at prolonged spinning. To this day, I can’t do a cartwheel more than three times in a row.”</i> She laughs sheepishly. <i>“Being blind does not help. You’d think it would!”</i>");
		output("\n\n<i>“For my adult life, I tried a handful of jobs first. My first job was a desk job doing data entry for JoyCo. Pretty mindless stuff, just putting forms into computers. That didn’t really have a future, so the next thing I tried was photography – something that was artsy and had something of a future for me. I enjoyed it plenty: I was hired for weddings and some nature magazines hired me to go to some distant planets for some shots of their local fauna, but it was inconsistent and didn’t have benefits.”</i>");
		output("\n\nPaige trails slightly as she recounts her next occupation. <i>“My third job is what got me my injury,”</i> she admits somberly. <i>“I... It’s....”</i> She puts quite a lot of effort into vocalizing her next sentence, stopping and starting twice more. <i>“I... don’t regret taking it. I mean, I kind of do? I was friends with my employer. The job was fine. But, you know, it kind of sucks not being able to see anything. I was trying to help out a friend. I... don’t know if I would have taken the job if I knew what was going to happen.”</i>");
		output("\n\n<i>“Anyway, the money I got from that whole business,”</i> she continues, perking back up, <i>“was enough for me to get this suite in Tavros, with more than enough left to rent out the next door one and use it as a yoga class. I had been doing yoga as an exercise since before working at JoyCo, so I had plenty of years of experience in the field. It wasn’t hard getting a license and becoming a fully-fledged fitness instructor right here in the station. The money I get from the classes is more than enough to float two rents, and my savings and the benefits checks I get from the UGC are enough to keep me going for quite a while yet.”</i>");
		processTime(14);
		if(flags["PAIGE_TALK_SELF"] == undefined) flags["PAIGE_TALK_SELF"] = 1;
		//[=Next=]
		// (end scene: Paige 2)
		clearMenu();
		addButton(0,"Next",paigeStoryEpilogue);
	}
	// (scene: Paige 3)
	else if(flags["PAIGE_TALK_SELF"] == 1 || arg == 1)
	{
		if(flags["PAIGE_TALK_SELF"] == 1) output("You ask Paige to tell you more about her past. She talked about her professional life last time you asked, and she told you that one of her jobs is what caused her injury. You also remember that she had a hard time talking about it... so, instead, you ask her about her family.\n\n");
		output("<i>“Ah yes, the fam,”</i> she says cheerily. <i>“Well, I got a mom and a dad, and they love each other very much, I’m told. My mom’s a full-blown Ausar like myself, and I inherited the fur coloring from my granddad on her side. And on the other hand, my dad is pure-blood human.”</i>");
		output("\n\n<i>“My dad was a bit of a workaholic; he was never too far from his ledger or from his codex or communicator. I never saw him on the weekdays – he was gone before I left for school and he was back when I was in bed – but he made the most out of every minute we had on the weekends. When I was really young, and still did a lot of tumbling, he would tumble all over the place with me.”</i>");
		output("\n\nShe laughs softly to herself as she reminisces. <i>“He’s the one who introduced me to yoga. Probably because it was pretty tough for a man in his mid-thirties to do as much tumbling and somersaulting as a five-year-old, but he still wanted to be a part of my interests. At his peak, he was about as good at yoga as I am now, but... well, arthritis makes fools of us all, it turns out.”</i>");
		output("\n\n<i>“Now, my mom,”</i> she began, changing her tone. <i>“She’s the calculating sort: she likes to plan four or five steps ahead for anything. She’s the type that tries to get as many things done in one single move as possible. Putting me in gymnastics class killed a bunch of birds with one stone: it was social; it got me lots of exercise; it gave my poor dad’s back a break; and it may have just paved the way for my future, since I loved to tumble anyway. She even had contingencies for if it didn’t work out. She is</i> impossible <i>to beat at chess.”</i>");
		output("\n\n<i>“My mom was the sort to push me to be the best I could be, but that’s not to say she was stiff or controlling. She always let me decide what it was I wanted to be, and she worked with me to achieve them. When I told her I didn’t want to be a gymnast because I couldn’t handle the motion sickness, she was completely supportive. When I tried being a photographer, she...”</i> Paige pauses for a moment, blinking hard. <i>“She took out a pretty big loan to get me the best camera on the market. I still have it, and you better believe I paid her back, but the price tag on it was astronomical. And we’re in space right now!”</i>");
		output("\n\n<i>“And finally, I got myself a little brother. His name’s Mason.”</i> She rubs at the bottom of her muzzle as she remembers him. <i>“He’s not the whole-nine-yard furry like yours truly: he’s half-Ausar and he looks like it. We actually don’t keep in touch all that often anymore. He’s got himself a job on our home planet Ausaril as a miner. Specifically, gold. But he doesn’t like it when I call him a gold digger, and he prefers I just call him a miner. He was promoted to senior something-or-other back before my third job. He likes to act aloof and distant, but only because he thinks it’s cool. If you know him well enough, it’s pretty easy to get him to laugh or cry.”</i>");
		output("\n\nOnce Paige is done describing her family, you broach another topic on a whim: if her mother is an Ausar and if she and her brother are only half-Ausars, why is Paige covered in fur from top to bottom? <i>“Gene mods. Duh.”</i> Well, okay, you concede, but <i>why</i> did she take gene mods? She opens her mouth to answer, but then quickly reconsiders. <i>“You know, I could tell you,”</i> she says. <i>“But I won’t. We can save that one for some other time.”</i>");
		output("\n\nYou sigh in defeat. Well, if she’s not in the mood to talk about her gene mods, maybe you’ll get it out of her next time.");
		//[=Next=]
		// end scene (scene: Paige 3)
		if(flags["PAIGE_TALK_SELF"] == 1) flags["PAIGE_TALK_SELF"] = 2;
		clearMenu();
		addButton(0,"Next",paigeStoryEpilogue);
	}
	// (scene: Paige 4)
	else if(flags["PAIGE_TALK_SELF"] == 2 || arg == 2)
	{
		if(flags["PAIGE_TALK_SELF"] == 1) output("You ask Paige if she’s willing to talk more about herself. The last time you chatted, she told you about her family. She’s been inching towards what her third job was and how she got her scar, but you’re not ready to push her to that just yet. You ask her what challenges she’s had to overcome since becoming blind.\n\n");
		output("<i>“Oh man, what challenges</i> aren’t <i>there?”</i> she laughs. <i>“It’s gotten easier, for sure. It’s been years since... since then, and I’ve had plenty of time to adjust. Getting Iddi early on was definitely a big plus as well!”</i>");
		output("\n\n<i>“Well, to answer your question, the first challenge was coping with my new spatial awareness. I used to have a lot more furniture than I do now, but I got rid of most of it when I both couldn’t appreciate them, and when I kept stumbling over them. Getting dressed in the morning was difficult. Couldn’t find bras; shirts would be inside-out; pants would go on backwards. Doing my hair up was stressful.”</i>");
		output("\n\n<i>“As the months went on, I learned how to sort of ‘understand’ my environment. My other senses started to get sharper; I developed a way to notice people or objects if they’re about a body’s-length away from me by... sort of ‘feeling’ the air and listening to the sounds. I don’t do well in open areas or in especially noisy or crowded ones, but places like my own home, or my yoga studio, it’s</i> almost <i>as good as sight.”</i>");
		output("\n\n<i>“Like I said, getting Iddi was a huge help. The little guy paid for himself within the week! Couldn’t have asked for a better helper. He helped me get around my unit; he helped me get dressed; he helped me with cooking and cleaning; he still reads me my mail and my emails. He taught me how to be independent within my own unit – how to walk around without keeping my arms stretched all the time for obstacles. He taught me how to read braille. And he’s just the sweetest little thing, too!”</i> She leans in close and lowers her voice to a whisper. <i>“If I’m honest, [pc.name], I kind of hope that, if I ever had a kid, they take after Iddi a little.”</i>");
		output("\n\nYou ask her about the projector she wears to hide her scar. Did that come with Iddi? <i>“Yes, as a matter of fact. It’s both a projector and a communicator – one way, from Iddi, on an encrypted channel. The projector hides my scar and it colors my eyes so people don’t assume anything, and if I’m out-and-about and Iddi isn’t with me, he can be my eyes and he can tell me if I’m about to walk into a person, or he can tell me what the going rate for vegetables is, or whatever.”</i>");
		output("\n\n<i>“It’s gotten to the point that I’m</i> fairly <i>autonomous. I can dress myself; I know my way around my units; and I can cook my own food. As long as it’s my own burner. I know where the dials are on mine.”</i> She laughs and slaps her knee. <i>“Like I said, my hearing has gotten so good that I can reasonably tell where a person is if they make noise within a body’s length of me. If I need to leave for anything, I prefer to not have Iddi with me if I can help it. Iddi can see everything through the earpiece, so he doesn’t</i> need <i>to be with me, but if I’m, like, going down to a planet or to someplace with lots of stairs or uneven footing, he kind of has to tag along.”</i>");
		output("\n\n<i>“I’m not going to pretend that it’s not hard,”</i> she finishes. <i>“Every day is still a unique challenge that I have to tackle one step at a time. And I miss... seeing. I miss looking at my parent’s photo on my dresser. I don’t even know what Iddi looks like. I’m trying to save up some cash for synthetic eyes, but it’s, uh, it’s going to be a while yet.”</i>");
		output("\n\nYou tell her that, whether her disability is difficult or not, that she’s overcome so many difficulties with it is an inspiration. And, autonomy and independence is always sexy. She laughs and gives you a friendly slug on the shoulder. <i>“I don’t need to be told I’m sexy. Anyone doing yoga for as long as I’ve been would have an amazing body.”</i> Her hand trails down your arm and finds your hand. She grips yours in hers and gives you a loving squeeze. <i>“But it’s nice to hear it.”</i>");
		//[=Next=]
		// end scene (scene: Paige 4)
		// Unlock [=Her Eyes=] button in (scene: Paige Select)
		if(flags["PAIGE_TALK_SELF"] == 2) flags["PAIGE_TALK_SELF"] = 3;
		clearMenu();
		addButton(0,"Next",paigeStoryEpilogue);
	}
	// (scene: Paige 5)
	else if(flags["PAIGE_TALK_SELF"] == 3 || arg == 3)
	{
		if(flags["PAIGE_TALK_SELF"] == 3) output("You sit with Paige as you gear yourself to ask her more about her life. The last time you spoke, she mentioned that she’s trying to save up for synthetic eye transplants, but that she doesn’t have enough cash to afford it. You take the plunge and ask her about the job that caused her blindness. Why would it not pay benefits for such a devastating work-related injury?\n\n");
		output("Paige’s earlier demeanor slowly fades. She breathes through her nose as she considers whether to answer the question. Though she’s not looking directly into your eyes, her stare is piercing into you as she judges the question.");
		if(flags["PAIGE_TALK_SELF"] == 3) output("\n\n<i>“[pc.name]...”</i> she begins, hesitating on her syllables. She takes some more breaths, one of them rather deep. <i>“At this point... I want you to know that I consider you to be more than a student to me. You’re a friend.”</i> You keep silent. <i>“I don’t have a lot of friends. In fact, my life has been pretty lonely since my injury. I haven’t drunk a drop since then and I haven’t had any lovers. I’m worried that if I do, I might blab to someone I don’t trust. And at this point,”</i> she says, smiling as she places a hand on your shoulder, <i>“I trust you. You’ve been very patient and selfless so far.”</i>");
		else output("\n\n<i>“[pc.name],”</i> she says with a heavy sigh, and then quickly loses her thought process. She chews on her lip slightly as she considers your request. <i>“I guess I don’t mind. I like to think that, as much as I hate what’s happened to me, I’ve made some peace with my past. Enough to recount it, in any case.”</i> She laughs lightly. <i>“How can I say no to you?”</i>");
		output("\n\nYou wait patiently for her to continue. It takes her another moment to steel her resolve. <i>“I was a pirate for my third job,”</i> she says, her voice dropping an octave halfway through the sentence. <i>“Piracy doesn’t have health benefits.”</i>");
		output("\n\nYou reel. Her face is smooth as glass; she’s not kidding, but you still have a hard time believing that Paige – your <i>yoga instructor</i> and such a wonderful woman to spend some nights talking with – was, at one point in her life, a pirate. But, now that you think about it, it answers some questions: why she was so hesitant to talk about it, for one.");
		output("\n\n<i>“Officially speaking – or, as ‘officially’ as piracy gets – I was a navigator. I plotted our courses and made sure our way went between galactic patrols and stayed clear of a planet’s airspace. My captain was a Kui-Tan lady named Kiro Tamahime.”</i> She laughs. <i>“Maybe ‘lady’ is a bit of a strong word to describe any Kui-Tan. Have you met her?”</i>");
		//if {PC has rescued Kiro}
		if(flags["RESCUE KIRO FROM BLUEBALLS"] == 1) output("\n\nYou reply that, um, you have. Yes, you have met Kiro. Paige’s expression twists just slightly. She probably knows what ‘meeting’ Kiro entails.");
		else output("\n\nYou reply that you aren’t familiar with the name. <i>“Oh, really? I thought she’d be halfway famous by now. You’d probably love her, she’s a real hoot at parties.”</i>");
		output("\n\n<i>“Kiro is my closest friend. We actually met at gymnastics class. She dropped out earlier than I did, though. Turns out, being a maturing Kui-Tan and constantly surrounded by gymnasts kind of, uh, threw off their balance, considering their species’ attributes");
		if(flags["RESCUE KIRO FROM BLUEBALLS"] != 1) output(". You’ll probably know what I mean as soon as you meet her");
		output(".”</i>");
		output("\n\n<i>“It was a three-man operation: myself, my captain, and my brother, the gold miner. It was Kiro’s idea to begin with. I don’t know when she got into piracy or how she got so good at it, but after seeing some of the spoils a single haul could bring in, it was pretty hard to say no to the job offer. I couldn’t convince my brother, but Kiro could. I don’t know what she did and I don’t</i> want <i>to know, but after a weekend on Ausaril and a promise of a bigger cut, he was in.”</i>");
		output("\n\n<i>“We had a pretty smooth thing going on. Every month I’d visit the family on Ausaril, including Mason. He’d give me handwritten times and coordinates for shipments of unprocessed gold to be sent from Ausaril to anywhere in the galaxy. When Kiro and I picked one, my job was to decide where along the caravan’s route was farthest and safest from any planet’s jurisdictional airspace, and Kiro’s job was to make sure the caravan didn’t cross paths with any patrol and to make sure we were geared appropriately for the mission.”</i>");
		output("\n\nPaige wrings her hands together, nervous about continuing. She closes her eyes tightly – so tight, it’s almost as if she’s trying to hide from something, and shutting her eyes would make it easier. <i>“I loved it,”</i> she said through stuttering breaths. <i>“We lived like royalty. It was exhilarating. I could afford anything I wanted.”</i>");
		output("\n\nHer eyes open slowly. She pulls her hands apart, and with her left, reaches out for yours. She feels along your arm and finds it, and when she does, she grips it tightly. <i>“It was " + (days+2414) + " Solar days ago,”</i> she says. <i>“It was a routine pick. The caravan was small and unguarded. It had just enough gold to last us the month. It didn’t have an escort. Its arms weren’t enough to deter us. In and out.”</i> She takes a deep breath through her nose.");
		output("\n\n<i>“The Black Void thought so, too.”</i>");
		// end scene (scene: Paige 5)
		clearMenu();
		addButton(0,"Next",paigePirateTalk2);
	}
	// (scene: Paige 6)
	// Once Paige 6 is unlocked, the PC no longer requires going to yoga class (since she won’t accept them as a student anymore) and they no longer require Honey Wine to ask Paige more about herself.
	else if(flags["PAIGE_TALK_SELF"] == 4 || arg == 4)
	{
		//[=About Paige=]
		// (scene: Crewmate: Paige 6)
		// This scene is a minor variant of the original Paige 6 scene, to be played if the PC hasn’t seen Paige 6 before fixing her eyes.
		if(!paigeBlind())
		{
			output("There isn’t much more you can think to ask Paige to elaborate on when it comes to her personal life. You know about her professional lives; her personal lives; and the injury and how it transformed her. Frankly, there isn’t a whole lot left for you to ask about, especially now that your relationship has progressed so far that she’s now your ship’s navigator.");
			output("\n\nPaige, in the meantime, takes the initiative as you juggle your potential questions. <i>“I got a question to ask you,”</i> she says, surprising you out of your stupor. <i>“It’s gonna sound pretty dumb, but I think you can handle pretty and dumb, can’t ya, sweet thing?”</i> You tell her that there are no dumb questions. <i>“Ha! What a load.”</i>");
			output("\n\nPaige clears her throat, but otherwise doesn’t seem too apprehensive. <i>“So, I’m coming up on my next anniversary since my injury. It’s been a long while since I’ve lost my eyes, and I felt like I got a hang of my new life once I lost them, before you came along.”</i> You listen attentively. <i>“My yoga has kept me in great shape all my life. And, you know, I used to be a swashbucklin’, scallywaggin’ space scoundrel once upon a time.”</i> You wonder where she might be going with this.");
			output("\n\n<i>“Let me make one thing clear, sweet thing,”</i> she says, placing a finger on your nose. <i>“If there’s any one thing I love about my romantic and sexual partners, it’s that they keep up with me. You’re alright at yoga. And you’re pretty great at fuckin’, absolutely no qualms there. But I want more.”</i>");
			output("\n\nYou ask her what more she could possibly want. No challenge is too great.");
			output("\n\n<i>“I want you to fight me.”</i>");
			output("\n\nYou don’t respond.");
			output("\n\n<i>“I guess that wasn’t really a question, was it?”</i> she asks, laughing. <i>“Look, I’m not gonna lie, not to you. I’ve always kind of blamed myself for losing my eyes. I’ve always tried to tell myself that it wasn’t my fault; that we were outnumbered and outgunned; that the Black Void bitch just got lucky. But the fact is, I lost my eyes, and Kiro won the fight against three other Black Void pirates by herself. It’s made me feel like a third wheel; like a lame horse, you know? If I had Kiro’s skill, I could have avoided my, uh, my predicament.”</i>");
			output("\n\nYou want to tell her not to think like that, but it’s pretty clear from her demeanor that she isn’t looking for pity. Still, you tell Paige that fighting your navigator was... kinda on the bottom of your expectations when you brought her on. <i>“Hah!”</i> she laughs spitefully. <i>“Afraid you’ll lose, Captain? I wouldn’t want any of this either!”</i> she flexes both arms, showing off what years and years of intense yoga have done for her definition. To further her point, she crunches her belly, and her abs accentuate themselves hard enough to file metal.");
			output("\n\nShe pushes you onto her bed and squats herself onto your lap, both of her arms wrapping around your shoulders. Her breasts press into your [pc.chest] as she closes the gap between your face and hers. <i>“But seriously,”</i> she says, lowering her tone. <i>“It’s just an honest sparring match. All those years being blind have left me out-of-practice, and, really, I</i> do <i>want to make sure my skills haven’t gotten rusty. I was tough enough to take out three Black Void pirates by myself before Kiro had to clean up. Let me make sure that it was just a lucky hit, and not because I wasn’t good enough.”</i>");
			output("\n\nShe grins, then begins to grind her crotch against you. Her toned, strong body moves and roils in front of you, her every muscle in her stomach and chest flexing in an erotic way, a way that you can’t help but taste with your eyes. Y");
			if(pc.hasCock()) output("ou weren’t erect before, but Paige is working quickly to change that");
			if(pc.isHerm()) output(", and just centimetres south, y");
			if(pc.hasVagina()) output("our [pc.vagina] stirs from its slumber, lubing not enough to make you horny, but enough to put you in the mood");
			output(".");

			output("\n\n<i>“I’ll make the deal sweeter for you, sweet thing,”</i> she says huskily. <i>“The winner gets it however they want it, wherever they want it.”</i>");
			output("\n\nYour own hands raise and trail her body, from her arms to her ribs, to the curve of her belly and the swell of her hips, until you grab yourself two fistfuls of tight, furry ass. <i>“That sounds like a fight with no losers,”</i> you say to her, pressing your nose to hers.");
			output("\n\n<i>“Then what’s the problem?”</i> she asks, licking her lips. <i>“We don’t have to go at it right this red hot second. But just keep in mind.”</i> She flexes her ass and pushes her lower body out, filling your hands with more of herself. <i>“The offer’s on the table.”</i>");
			output("\n\nShe disengages from you, leaving you teased and tempted. You’re still not too thrilled with the idea of fighting a crewmate, but that said, something tells you that even if you did, it wouldn’t be the easiest lay of your life.");
			// end scene (scene: Crewmate: Paige 6)
		}
		else
		{
			output("There isn’t much more you can think to ask Paige to elaborate on when it comes to her personal life. You know about her professional lives; her personal lives; and the injury and how it transformed her. Frankly, there isn’t much more that you’re curious about, and you’re worried that asking irresponsibly might come off as prying or creepy.");
			output("\n\nPaige, in the meantime, takes the initiative as you juggle your potential questions. <i>“I got a question to ask you,”</i> she says, surprising you out of your stupor. <i>“It’s gonna sound pretty dumb, but I think you can handle pretty and dumb, can’t ya, sweet thing?”</i> You tell her that there are no dumb questions. <i>“Ha! What a load.”</i>");
			output("\n\nPaige clears her throat, but otherwise doesn’t seem too apprehensive. <i>“So, I’m coming up on my next anniversary since my injury. It’s been a long while since I’ve lost my eyes, but I’ve gotten really good at dealing with my surroundings since then.”</i> You listen attentively. <i>“My yoga has kept me in great shape all my life. And, you know, I used to be a swashbucklin’, scallywaggin’ space scoundrel once upon a time.”</i> You wonder where she might be going with this.");
			output("\n\n<i>“Let me make one thing clear, sweet thing,”</i> she says, placing a finger on your nose. <i>“I haven’t had many lovers, and I don’t just let anyone between my legs. They gotta be able to keep up with me. You’re alright at yoga. And you’re pretty great at fuckin’, absolutely no qualms there. But I want more.”</i>");
			output("\n\nYou ask her what more she could possibly want. No challenge is too great.");
			output("\n\n<i>“I want you to fight me.”</i>");
			output("\n\nYou don’t respond.");
			output("\n\n<i>“I guess that wasn’t really a question, was it?”</i> she asks, laughing. <i>“Look, I’m not gonna lie, not to you. I’ve always kind of blamed myself for losing my eyes. I’ve always tried to tell myself that it wasn’t my fault; that we were outnumbered and outgunned; that the Black Void bitch just got lucky. But the fact is, I lost my eyes, and Kiro won the fight against three other Black Void pirates by herself. It’s made me feel like a third wheel; like a lame horse, you know? If I had Kiro’s skill, I could have avoided my, uh, my predicament.”</i>");
			output("\n\nYou want to tell her not to think like that, but it’s pretty clear from her demeanor that she isn’t looking for pity. Still, you tell Paige that you’re not comfortable fighting a blind woman, even if Iddi is coaching or whatever she has planned. <i>“Hah!”</i> she laughs spitefully. <i>“Afraid you’ll lose, Steele? I wouldn’t want any of this either!”</i> she flexes both arms, showing off what years and years of intense yoga have done for her definition. To further her point, she crunches her belly, and her abs accentuate themselves hard enough to file metal.");
			output("\n\nShe squats herself onto your lap, both of her arms wrapping around your shoulders. Her breasts press into your [pc.chest] as she closes the gap between your face and hers. <i>“But seriously,”</i> she says, lowering her tone. <i>“It’s just an honest sparring match. I may be blind, but I know my way around a crowded floor or a busy room. And, really, I</i> do <i>want to make sure my skills haven’t gotten rusty. I was tough enough to take out three Black Void pirates by myself before Kiro had to clean up. Let me make sure that it was just a lucky hit, and not because I wasn’t good enough.”</i>");
			output("\n\nShe grins, then begins to grind her crotch against you. Her toned, strong body moves and roils in front of you, her every muscle in her stomach and chest flexing in an erotic way, a way that you can’t help but taste with your eyes. Y");
			if(pc.hasCock()) output("ou weren’t erect before, but Paige is working quickly to change that");
			if(pc.isHerm()) output(", and just centimetres south, y");
			if(pc.hasVagina()) output("our [pc.vagina] stirs from its dry slumber, lubing not enough to make you horny, but enough to put you in the mood");
			if(!pc.hasGenitals()) output("ou breathe faster at the mere suggestion.");
			output(".");
			output("\n\n<i>“I’ll make the deal sweeter for you, sweet thing,”</i> she says huskily. <i>“The winner gets it however they want it, wherever they want it.”</i>");
			output("\n\nYour own hands raise and trail her body, from her arms to her ribs, to the curve of her belly and the swell of her hips, until you grab yourself two fistfuls of tight, furry ass. <i>“That sounds like a fight with no losers,”</i> you say to her, pressing your nose to hers.");
			output("\n\n<i>“Then what’s the problem?”</i> she asks, licking her lips. <i>“We don’t have to go at it right this red hot second. But just keep in mind.”</i> She flexes her ass and pushes her lower body out, filling your hands with more of herself. <i>“The offer’s on the table.”</i>");
			output("\n\nShe disengages from you, leaving you teased and tempted. You’re still not too thrilled with the idea of fighting a blind woman, but that said, something tells you that even if you did, it wouldn’t be the easiest lay of your life.");
		}
		//[=Next=]
		// end scene (scene: Paige 6)
		// unlock [=Spar=] option in (scene: Paige Select 2)
		if(flags["PAIGE_TALK_SELF"] == 4) flags["PAIGE_TALK_SELF"] = 5;
		processTime(30);
		clearMenu();
		addButton(0,"Next",backToPaigeMenu);
	}
	// (scene: Paige 7)
	else
	{
		// (scene: Crewmate: Paige 7)
		// This scene is a minor variant of the original Paige 7 scene, to accommodate the fact they aren’t in Paige’s Unit.
		if(!paigeBlind())
		{
			output("You and Paige sit at her desk, barely large enough to seat two, for the moment just enjoying your time with her. While there isn’t much more you want to ask her, Paige is nonetheless a good storyteller. Maybe she won’t mind retelling one of her stories?");
			//[=Yoga=][=Family=][=Blindness=][=Piracy=][=Never Mind=]
			// Display the tooltips and go to the scenes as described in (scene: Paige 7)
			// end scene (scene: Crewmate: Paige 7)
		}
		else
		{
			output("You sit across from Paige silently, for the moment just enjoying your time with her. While there isn’t much more you want to ask her, Paige is nonetheless a good storyteller. Maybe she won’t mind retelling one of her stories?");
		}
		processTime(1);
		//[=Yoga=][=Family=][=Blindness=][=Piracy=][=Never Mind=]
		clearMenu();
		addButton(0,"Yoga",askPaigeAbootHerself2,0,"Yoga","Ask Paige about how and why she became a yoga instructor after her previous occupations.");
		addButton(1,"Family",askPaigeAbootHerself2,1,"Family","Ask Paige about her father, her mother, and her younger brother.");
		addButton(2,"Blindness",askPaigeAbootHerself2,2,"Blindness","Ask Paige about the challenges her blindness have had on her life, and how her helper robot Iddi has alleviated them.");
		addButton(3,"Piracy",askPaigeAbootHerself2,3,"Piracy","Ask Paige about her piratical life with her brother and Kiro, as well as how she received her injury.");
		addButton(4,"Never Mind",backToPaigeMenu,undefined,"Never Mind","Then again, maybe not?");
	}
}

public function backToPaigeMenu():void
{
	clearOutput();
	showPaige();
	output("Is there something else you’d like to do with Paige?");
	paigeMenu();
}

// (scene: Paige epilogue)
// play this scene after Paige 2 through 4
public function paigeStoryEpilogue():void
{
	clearOutput();
	showPaige();
	output("You both lose track of time as Paige retells her life story for you. You finally get the sense to glance at your codex for the hour, and, with some reluctance, pull yourself away from Paige. <i>“Yeah, we’ve been going at it for a while, haven’t we, sweet thing?”</i> she asks. <i>“You go on out of here. I’m sure there’s more to the universe for you than some yoga on Tavros. But I better see you back here again before you leave, you hear me?”</i>");
	output("\n\nYou assure her that it’s a promise. She sees you off with a smile and, to your surprise, a quick kiss on your [pc.lipsChaste]. No tongue, but with some passion, and then you’re back on the residential deck of the Tavros station.");
	// end scene (scene: Paige epilogue); place the PC one square outside of Paige’s Unit; advance the clock two hours
	processTime(20);
	clearMenu();
	addButton(0,"Next",moveSouth);
}

// (scene: Paige 5-2)
public function paigePirateTalk2():void
{
	clearOutput();
	showPaige();
	output("<i>“Kiro and I were halfway done looting the place. We had a... slightly less chivalrous Robin Hood thing going on. We didn’t kill anybody. We generally leave ships intact – no guns or communications, but with enough juice to make it home.”</i> Her eyes trail around the room, focusing on nothing. <i>“The Black Void crashed the party. Outnumbered us three to one. They demanded our gold, our weapons, our armor, and our ship. We fought back.”</i> She trails her fingers across the scar on her face, from one eye to the other. <i>“Three each. I took down my three. Then one of Kiro’s came at me with a knife. Got me across the eyes.”</i> She smiles, but only faintly. <i>“Kiro won the fight.”</i>");
	output("\n\nShe faces you and looks you in your eyes so precisely that you’d wouldn’t have believed she was blind. <i>“To this day,”</i> she says somberly, <i>“my biggest fear, [pc.name], is that they find me. They find me, and through me, they find Mason, and they find my mom and dad. So, I’m hiding.”</i>");
	output("\n\n<i>“You asked me once before why I took gene mods. They’re a disguise. I took them to throw off anyone that might be looking for me, whether they’re Black Void or UGC");
	if(hours >= 17) output(".”</i> She removes her earpiece and holds it in her hand gently");
	else output(".”</i> She glances towards her bedroom door warily");
	output(". <i>“I haven’t said any of this to Iddi. He records absolutely everything he hears. It’s to help him understand me better, but if I told him and he gets lost or captured or something, they could pull it all from his head. I was very careful to make sure that the earpiece was one-way. It’s also custom-fitted with a projector to hide the scar because it’s easily my most identifiable feature – I had hoped that the gene mods would cover it, but because the tissue is dead, they can’t be modified. I try not to take Iddi anywhere because a ‘perfectly healthy’ Ausar with a helper droid might raise suspicions.”</i>");
	output("\n\nYou stay silent together for a while. Your hand is still in hers, and she still squeezes it occasionally. You have no words to respond with, and in a way, you think that’s the best response. Paige sighs in the comfortable silence between you two. <i>“The only other people that know all this are Kiro and Mason,”</i> she said. <i>“I told my parents that it was a rock-climbing injury from my job as a photographer. My life has been pretty lonely since my injury. I couldn’t trust anyone with it, not even Iddi.”</i>");
	output("\n\nWithout letting go of your hand, Paige leans into you, using her other hand to feel your face. When she finds your cheek, she leans in and kisses it gently. <i>“Like I said, you’re more than a student to me.”</i>");
	output("\n\nYou stay together in the silence of her unit for a while, enjoying each other while you digest her story. You’ve remained silent the whole time, and from the way she’s leaning into you, your hand in hers, you’re convinced that that’s what she wants.");
	output("\n\n<i>“Um,”</i> Paige says, cutting the silence. <i>“As much as I’m having a good time right now, we’ve got some other things to do. I have some work to do for my yoga classes tomorrow.”</i> You tell her that you don’t mind staying for a while longer if she doesn’t. <i>“I don’t, but... I also kind of want some time to myself for now. We both have a lot to think about.”</i>");
	output("\n\nYou understand, but you take your time pulling away from her. When you stand, she pulls you back down, giving you another kiss, this one on your [pc.lipsChaste]. It lasts a bit longer than the other one did. Then, she lets you go.");

	if(flags["PAIGE_TALK_SELF"] == 3) flags["PAIGE_TALK_SELF"] = 4;
	processTime(50);
	// end scene (scene: Paige 5-2)
	// place PC one square outside of Paige’s Unit
	clearMenu();
	addButton(0,"Next",moveSouth);
}

// Play the following scene when the PC enters Paige’s Unit after they’ve seen scene: Paige 5 for the first time
// (scene: Sex Prologue)
public function paigeSexPrologue():void
{
	clearOutput();
	showPaige();
	output("You knock on the door to Paige’s ");
	if(InShipInterior(pc)) output("quarters");
	else output("unit. Iddi is normally there within moments to greet you – but today, he isn’t");
	output(". There’s no response at all for some time. You knock again, in case ");
	if(InShipInterior(pc)) output("she");
	else output("they");
	output(" just didn’t hear you the first time. After a moment, ");
	if(InShipInterior(pc)) output("Paige");
	else output("Iddi");
	output(" finally arrives to answer the door.");

	if(InShipInterior(pc))
	{
		output("\n\n<i>“[pc.name]?”</i> Paige asks, and you confirm. You hear her take a deep breath, and she opens the door.");
	}
	else
	{
		output("\n\n<i>“" + pc.mf("Mister","Missus") + " [pc.name]!”</i> Iddi exclaims, allowing you in. <i>“I’m sorry for the wait. Momma is expecting you in the living room. She told me that once you got here, I should go to my dock and shut off for the day.”</i> Iddi is its usual, helpful self. You wonder what Paige has in mind for giving Iddi such specific instructions. <i>“Enjoy your stay!”</i> And then Iddi is off, going down a hallway towards its charging station.");
		output("\n\nYou walk to the living room, and contrary to Iddi, Paige isn’t there. Her bedroom door is open just slightly, and you can hear her busying herself with her dresser. <i>“[pc.name]?”</i> she asks, and you confirm. You hear her take a deep breath, and she opens the door.");
	}
	output("\n\nShe’s wearing a black one-piece of sheer lingerie, with a loose camisole going from her neck to just below her stomach. It has a gridded pattern that dots across her body. The camisole sags enough to allow for a bra, but she’s not wearing one. The piece’s panties cover her whole waistline, but, with the rest of the fabric, do nothing to hide anything. She may as well be naked with how little the piece is concealing: you can see everything from her pink nipples to her privates. She isn’t wearing her projector, and her scar is in full view.");
	output("\n\nPaige waits for your reaction and laughs nervously when you don’t audibly give one. You’re too surprised to remember that Paige is blind and she can’t see the way your eyes are drinking every contour of her body. ");
	if(pc.tone <= 79) output("You can’t help but feel a bit inadequate, seeing such a toned, impressive body wearing such sexy clothes in front of you.");
	else output("It’s not so much the definition that’s got you gob-smacked – you see something similar every time you stand naked in front of a mirror – but the fact that it’s <i>Paige</i>.");
	output("\n\n<i>“Uh,”</i> she says sheepishly, toying with the loose fabric between her fingers. <i>“The lady at Mi Amour down in the merchant deck said this was one of the most seductive pieces they had. Without being ‘stripperific.’ Do you like it? Do I look good in it?”</i>");
	output("\n\nYou stammer out how it couldn’t look better on anyone else");
	if(pc.femininity >= 65) output(", which you say with some jealousy. You doubt you’d look cuter in it");
	output(". Paige bites her lip nervously, enjoying your review. <i>“Look, um, [pc.name],”</i> she begins apprehensively. <i>“I, uh... where do I begin?”</i> She stutters a bit. Seeing her difficulty, you grab her by the hand and lead her to the nearby couch, where you two normally sit, and tell her to start from the beginning.");
	output("\n\n<i>“The beginning?”</i> she asks. <i>“It wasn’t so long ago that you first walked into my yoga class. You were just another student back then.”</i> She rubs your hand in hers. <i>“You were a little critical of my methods, which, well, which lead us to here. I’ve never had a friend like you, [pc.name]. You’ve been very patient and you always seem so interested in me. Most people that want to get close to me just want me for my body. And don’t get me wrong,”</i> she laughs cockily, <i>“it’s a pretty wicked body. But you were the only person that’s been interested in</i> learning <i>about me.”</i>");
	output("\n\n<i>“At first, I didn’t know what to feel,”</i> she continued, frowning. <i>“At first I thought you were from the Black Void, and you were sent to get close to me to find Kiro and Mason before you hit me. Then I thought that maybe you were from the UGC, ready to do the same thing in the name of ‘justice’ or some shit. Hell, maybe you</i> are, <i>and I’m just letting my guard down.”</i> You remain silent, as you usually do.");
	output("\n\n<i>“But I wouldn’t have told you anything if I didn’t trust you.”</i> She smiles warmly at you, and you squeeze her hand in reciprocation. <i>“You haven’t tried to slip me any truth-serum drugs or whatever, and I was talking with Mason an hour ago – things are going fine in Ausaril, no threats or anything. I think I’m making the right choice with you. At least, I like to think so.”</i>");
	//[=Next=]
	// end scene (scene: Sex Prologue)
	processTime(20);
	pc.lust(30);
	clearMenu();
	addButton(0,"Next",paigeSexPrologue2);
}

// (scene: Sex Prologue 2)
public function paigeSexPrologue2():void
{
	clearOutput();
	showPaige();
	output("<i>“Now, what we’re about to do, [pc.name]?”</i> she says, taking a more aggressive tone with her words. <i>“Let’s not call this ‘love.’ That’s a strong word to be throwing around</i> just <i>yet. But the truth is that I haven’t had sex since my injury because I was afraid I might not be able to keep my mouth shut if I screw just any ole’ body. Coming up on however many years without some lovin’, now. I trust you as a friend, and I need to get laid</i> pretty <i>fucking badly.”</i>");
	output("\n\nShe stands up, your hand still in hers, and she pulls you up with her. <i>“I appreciate the compliment on my lingerie, but let’s be honest,”</i> she says, <i>“we’re both more concerned with how I’ll look </i>out<i> of it.”</i>");
	output("\n\nPaige eagerly shows you into her room. You can smell vanilla in the air and you see faint streams of smoke wafting from some scented candles placed on her dresser – it’s clear that she considers this to be more than just sex. She throws you onto the bed, your [pc.legOrLegs] still draped over the side");
	if(pc.isNude() || (pc.isChestExposed() && pc.isCrotchExposed() && pc.isAssExposed()))
	{
		if(pc.isChestExposed()) output(",");
		output(" and reacts with surprise at your exposed nature");
		output(". <i>“I hope you don’t just walk around naked all day!”</i>");
	}
	else
	{
		if(!pc.isChestExposed()) output(", and tells you to remove your [pc.upperGarments]");
		if(!pc.isAssExposed() && !pc.isCrotchExposed()) 
		{
			if(pc.isChestExposed()) output(",");
			output(" while she feels around your [pc.lowerGarments]");
			output(" and works to slide them off your body");
		}
		output(".");
	}
	output("\n\n<i>“There’s another reason why I took up yoga,”</i> she admits breathlessly. <i>“The stretching; the flowing; that’s all well and good and good for you. But it’s also pretty sexy. I love the way how I can flaunt my ass and my legs and call it a ‘stretch,’ and nobody will ask any questions. Some poses-for-two could have come from the Kama Sutra. I’m very nearly flexible enough to eat my own pussy. I know it’s possible.”</i>");
	if(pc.hasCock()) 
	{
		output(" She fondles your [pc.cocks]");
		if(!pc.isCrotchExposed()) output(" through your [pc.crotchCovers]");
		output(" while she licks her lips. <i>“Sometimes, I kind of wish I had one of these. I wonder how it would feel? How would I taste?”</i>");
	}
	output("\n\n<i>“You know what yoga and sex have in common?”</i> she asks rhetorically. <i>“They’re best done with a friend. Maybe two. ");
	//if {the PC has given Paige zero Honey Wines}
	if(flags["PAIGES_WINES"] == undefined)
	{
		output("And I’m lucky enough to have landed myself a friend that knows their way around a yoga mat");
		if(flags["YOGA_HARD"] != undefined) output(", and then some. If you can fuck as well as you can do yoga, I might not let you leave");
		output(".");
	}
	//if {the PC has given Paige between one and three Honey Wines}
	else if(flags["PAIGES_WINES"] <= 3)
	{
		output("You’ve shown me you’re not such a slouch at yoga, but we’ll see if you can keep up with </i>these<i> stretches, sweet thing.");
	}
	else output("Which you’d know if you hadn’t been skipping classes to buy me Honey Wine. But that’s okay. I’ll make sure we make up for lost time tonight.");
	output("”</i>\n\n");
	
	var i:int = 0;
	var upperClothesList:Array = [];
	var lowerClothesList:Array = [];
	
	if(!pc.isChestExposedByArmor()) upperClothesList.push(pc.armor.longName);
	if(!pc.isChestExposedByUpperUndergarment()) upperClothesList.push(pc.upperUndergarment.longName);
	
	if(upperClothesList.indexOf(pc.armor.longName) == -1 && (!pc.isCrotchExposedByArmor() || !pc.isAssExposedByArmor())) lowerClothesList.push(pc.armor.longName);
	if(!pc.isCrotchExposedByLowerUndergarment() || !pc.isAssExposedByLowerUndergarment()) lowerClothesList.push(pc.lowerUndergarment.longName);
	
	if(upperClothesList.length > 0)
	{
		output("You finish removing your");
		for(i = 0; i < upperClothesList.length; i++)
		{
			if(i > 0)
			{
				if(i + 1 == upperClothesList.length) output(" and");
				else output(",");
			}
			output(" " + upperClothesList[i]);
		}
		output(", exposing your [pc.chest] and [pc.belly] to the warm air of her bedroom, just as ");
	}
	output("Paige is ");
	//if {the PC is wearing lower garments}
	if(lowerClothesList.length > 0)
	{
		output("done removing your");
		for(i = 0; i < lowerClothesList.length; i++)
		{
			if(i > 0)
			{
				if(i + 1 == lowerClothesList.length) output(" and");
				else output(",");
			}
			output(" " + lowerClothesList[i]);
		}
		output(", revealing your naked [pc.crotch] to her. She’s ");
	}
	output("finished talking – knowing there’s nothing between her and all of you, she stalks her way forward to claim you for herself.");

	processTime(20);
	pc.lust(50);
	// end scene (scene: Sex Prologue 2)
	// refer to Sex With Paige document (scene: First Time) to proceed
	clearMenu();
	addButton(0,"Next",paigeFirstTimeIntro);
}

//[=About Iddi=]
// Tooltip: Ask Paige about her robotic companion Iddi.
// (scene: About Iddi)
public function aboutIddiTalk():void
{
	clearOutput();
	showPaige();
	output("Paige’s robotic companion droid is a very interesting piece of tech. You don’t recall ever seeing it before in your travels across the universe. You’d certainly like to learn a little more about Iddi – but the question is, what to ask? Where to begin?");
	processTime(1);
	//[=Purchase=][=Customizations=][=Earpiece=][=Appearance=][=Back=]


	// end scene (scene: About Iddi)
	clearMenu();
	addButton(0,"Purchase",iddiPurchaseTalk,undefined,"Purchase","Ask Paige if droids like Iddi are available to purchase in the general market. Maybe having one to clean around the ship or something wouldn’t be so bad.");
	if(flags["SEXED_PAIGE"] != undefined) addButton(1,"Customizations",iddiCustomizationsTalk,undefined,"Customizations","Ask Paige if Iddi could be customized, either as an assistant or just its personality.");
	else addDisabledButton(1,"Customizations","Customizations","You don’t want to delve too deep into Iddi’s workings just yet. Paige might think you’re prying.");
	if(flags["SEXED_PAIGE"] == undefined) addDisabledButton(2,"Earpiece","Earpiece","Knowing exactly what the earpiece is hiding, you don’t want to be too brazen and ask something out-of-turn. Better hold off until you and Paige are more comfortable with each other.");
	else addButton(2,"Earpiece",earpiecePage,undefined,"Earpiece","Ask Paige about the earpiece she uses to maintain a connection with Iddi.");
	addButton(4,"Appearance",iddisAppearance);
	addButton(14,"Back",backToPaigeMenu);
}

//[=Purchase=]
// Tooltip: Ask Paige if droids like Iddi are available to purchase in the general market. Maybe having one to clean around the ship or something wouldn’t be so bad.
// (scene: Purchase)
public function iddiPurchaseTalk():void
{
	clearOutput();
	showPaige();
	output("You ask Paige about her robotic companion Iddi. You’ve never seen a helper droid like it before. Where did she get it?");
	output("\n\n<i>“Iddi is a brand of robot that’s designed to help people with special needs,”</i> Paige replied. <i>“Iddi’s actual name is ‘Personal Accessibility Assistant,’ or ‘PAA,’ but you can designate them as anything you want. You can get one for just about any sort of disability you have. For instance, Iddi is specially designed to be my eyes: he communicates to me by the earpiece to guide me without being loud or disruptive to the rest of the world.”</i>");
	output("\n\n<i>“I’ve heard of models for just about anything. One model, for deaf users, has the projector attached to the earpiece display speech-to-text. Another model, for people with bum legs, is designed to be a sort of floating wheelchair; rather than a monitor, it’s basically a seat with antigravity pulsers and a personality. One really cool model for mute users doesn’t have an earpiece; they wear a special sort of brace on their teeth, like a retainer, and the model synthesizes speech based on the air flow in their throat and the way they’re moving their mouth.”</i>");
	output("\n\nAre the PAAs available for purchase by the general public?\n\n<i>“I dunno for sure,”</i> she responds. <i>“But I think you need to be legally disabled in order to get one. They come free depending on your health insurance, but if you don’t have any, like I didn’t, then their price varies depending on what disability, or how</i> many <i>disabilities, you have, but they generally don’t run for more than a couple hundred credits because of some universal healthcare laws.”</i>");
	// end scene (scene: Purchase)
	processTime(7);
	clearMenu();
	addButton(0,"Next",aboutIddiTalk);
}

//[=Customizations=]
// keep this scene inaccessible until the PC has had sex with Paige once
// Tooltip (accessible): Ask Paige if Iddi could be customized, either as an assistant or just its personality.
// Tooltip (inaccessible): You don’t want to delve too deep into Iddi’s workings just yet. Paige might think you’re prying.
// (scene: Customizations)
public function iddiCustomizationsTalk():void
{
	clearOutput();
	showPaige();
	output("You ask Paige how customizable the PAAs are. Can Iddi be programed to handle any other tasks besides the ones it’s been assigned as a visual aide? <i>“Nope,”</i> she answers simply. <i>“Iddi’s only any good to handle blindness; if I were to wind up deaf and mute too, I’d need to get some more droids. I can’t even trade Iddi with another blind person because Iddi has been training these past years to be</i> my <i>assistant, not anyone else’s. Not that I’d ever want to.”</i>");
	output("\n\nFor your next question, you ask how customizable Iddi in particular is. Can it have other personalities? A different voice? <i>“Yep! Every PAA can do all those things. They can speak other languages, too.”</i> Paige leans forward and cups her hands around her mouth. <i>“Iddi!”</i> she hollers. <i>“Could you come here, please?”</i>");
	output("\n\nWithin moments, the floating monitor is before you both. Its screen is filled with baby-blue pixels surrounding two tall, thin, pixelated, cartoony eyes. When it stops in front of Paige, its eyes shrink and turn to happy crescents to make way for a wide smile.");
	output("\n\n<i>“How can I help today, momma?”</i> Iddi asks joyfully, its young, boyish voice accentuating its cutesy look.");
	output("\n\n<i>“Gimme administrative access, sweet thing. The password thirty-one four-five-seven decimal one.”</i> She gives you a sweet smile. <i>“That’s my birth date. You better not forget it, sweet thing.”</i>");
	output("\n\nIddi’s face goes blank and every pixel turns black. It’s as if someone had found its remote and switched it off. <i>“Administrator access granted,”</i> Iddi says – taking a far more masculine, yet robotic and monotonous voice. <i>“Awaiting input.”</i>");
	output("\n\n<i>“I want to change your personality. Gimme... gimme a sultry, sexy and submissive mature momma droid.”</i>");
	output("\n\n<i>“Current profiles will be permanently overwritten after five minutes,”</i> Iddi warns. <i>“Confirm?”</i>");
	output("\n\nPaige stops momentarily, taken by surprise. <i>“I’ll lose my Iddi forever if I don’t change him back after five minutes?”</i>");
	output("\n\n<i>“Affirmative.”</i>");
	output("\n\n<i>“Why?”</i>");
	output("\n\n<i>“Current PAA profile is built and catered toward the administrator. Older profiles must be overwritten so that newer profiles have adequate harddrive space to familiarize with the administrator of the PAA.”</i>");
	output("\n\nPaige says nothing at first. The thought of losing Iddi forever was a bit more than she had expected. But, apparently feeling adventurous, Paige smiles. <i>“Confirm the switch,”</i> she says. <i>“I’ll switch you back after just one minute. Promise.”</i>");
	output("\n\nIddi’s screen remains completely black. <i>“Processing,”</i> it says, then, after a tense moment, sounds a single, robotic beep. <i>“Complete.”</i>");
	output("\n\n<i>“Resume operation,”</i> Paige commands.");
	output("\n\nIddi’s screen turns back on, but except for the baby-blue pixels with cartoony eyes, it’s a pair of highly detailed, feminine eyes with long eyelashes and deep blue irises on top of a violet background. Iddi blinks once, and, seeing its ‘momma,’ flutters up to Paige.");
	output("\n\n<i>“Ooooooh, momma,”</i> Iddi says with its new, deep, feminine voice. <i>“What can your... ‘personal assistant’ do for you today, baby?”</i> Each syllable drips from Iddi’s speakers like butter, and Iddi lingers just a bit on every word, making sure that no meaning, literal or not, is lost on Paige.");
	output("\n\nPaige laughs heartily. <i>“I didn’t expect it would work so well!”</i> she guffaws. <i>“I knew this was an option, but damn, JoyCo really wanted to cover every base with their clientele!”</i> Paige leans towards Iddi, turning one cheek towards the monitor’s screen. <i>“Give your momma a big kiss.”</i>");
	output("\n\nThe eyes on the monitor vanish, replaced by a large pair of ruby-red human lips. Iddi, as instructed, gently places the cold glass of its screen against Paige’s cheek, and then makes a long, enunciated and exaggerated kissing noise. Paige can’t stop laughing through the whole debacle.");
	output("\n\n<i>“Now, be a</i> good <i>girl,”</i> Paige says, <i>“and tend to our guest.”</i>");

	output("\n\nPaige motions to you, and then Iddi is on you like a bee on honey, its lips replaced with the eyes from earlier. <i>“Hello, " + pc.mf("handsome","gorgeous") + ",”</i> Iddi purrs. <i>“My name is Iddi. I just</i> love <i>being helpful. Is there anything I can do for you? Anything... at all? I</i> am <i>a personal assistant, and I’d be more than happy to ‘assist’ you with anything. You’d be surprised what my parameters have made me capable of.”</i>");
	if(pc.lust() <= 19) output("\n\nYou laugh along with Paige. Getting hit on by a floating television is not something you anticipated with your relationship with her! You hadn’t expected Iddi’s voice and mannerisms to turn as sexy as they did, but still, it’s all in good fun.");
	else if(pc.lust() <= 59) output("\n\nYou laugh, but not as much as Paige. Having a floating monitor hit on you was funny at first, but then, with its words and how close it’s hovering to you, it’s made it kind of awkward. Honestly, it’s a good thing Paige is blind, or else she may have been able to read your expressions a little too well.");
	else if(pc.lust() <= 98) output("\n\nThis is not the sort of action you were hoping for today. You laugh just raucously enough to mask the sound of you adjusting your pants. Iddi’s insistent proximity is making you a little uncomfortable, but if you’re honest to yourself, the way it’s talking <i>is</i> sexy. Maybe you could convince Paige to talk to you like that later.");
	else output("\n\nAdmittedly, you came into Paige’s unit ragingly horny, and the way Iddi’s voice sounds and the way it’s talking, you’re an errant stroke away from cumming then and there. But you have some goddamn dignity and you refuse to allow yourself to fall so low as to be seduced into a hands-free orgasm by an <i>accessibility droid,</i> of all the things in the universe.");
	output(" <i>“That’s enough,”</i> you say to Paige. <i>“You should probably switch it back. We only have four minutes left.”</i>");
	output("\n\nPaige wipes a tear from her eye from all her laughing. <i>“Yeah, you’re right,”</i> she admits. <i>“It was funny as hell, though! Iddi, give me administrative access. Password is thirty-one four-five-seven decimal one.”</i>");
	output("\n\nAnother moment of instruction later, and Iddi is back to its original, childish, cartoony self. <i>“Can I do anything more, momma?”</i> it asks innocently. You wonder if Iddi recalled anything of its alternate personality, but you doubt it – the new profile was probably deleted immediately.");
	output("\n\n<i>“No thanks, Iddi,”</i> Paige says, still laughing. <i>“You’ve done plenty already.”</i>");
	output("\n\n<i>“Okay!”</i> And then Iddi is gone from the room, back to its dock.");
	// end scene (scene: Customizations)
	// increase Lust by 1
	processTime(10);
	pc.lust(5);
	clearMenu();
	addButton(0,"Next",aboutIddiTalk);
}

//[=Earpiece=]
// keep this scene inaccessible until the PC has had sex with Paige once
// Tooltip (accessible): Ask Paige about the earpiece she uses to maintain a connection with Iddi.
// Tooltip (inaccessible): Knowing exactly what the earpiece is hiding, you don’t want to be too brazen and ask something out-of-turn. Better hold off until you and Paige are more comfortable with each other.
// (scene: Earpiece)
public function earpiecePage():void
{
	clearOutput();
	showPaige();
	output("You ask Paige about the earpiece. You know that it’s also a projector to cover the scar on her face, but it’s also a communicator?");
	output("\n\n<i>“It’s a one-way communicator with Iddi, going from him to me,”</i> she responds. <i>“Almost every PAA comes with one, but what they do depends on the model. The one to help mutes doesn’t come with an earpiece at all.”</i>");
	output("\n\n");
	if(hours >= 17) output("She removes the piece from her ear, and the projector disguising her scar vanishes in a blink.");
	else if(hours < 9) output("She reaches to her dresser and pulls the earpiece from its top, holding it in her hand.");
	output(" <i>“Most earpieces have the projector for one reason or another: it’s usually because the PAA is trying to communicate visually. Mine is a one-of-a-kind: it didn’t come with a projector, you know, me being blind and all, but I had mine modded and jailbroken specifically so it would hide my scar.”</i>");
	output("\n\nYou ask Paige something a bit silly. Could... could you try wearing it? She laughs. <i>“Fuck it, why not? Try not to break it, of course. JoyCo will always replace earpieces for free, no questions asked, but the mods take time and money.”</i>");
	output("\n\nShe hands you the gear. It’s a little bit lighter than you expected. You lift it to your right [pc.ear] – it’s custom-fitted for Paige, but you manage to fight it in, if a bit uncomfortably. <i>“So now what?”</i> you ask.");
	output("\n\n<i>“Along the stem of the projector are two buttons,”</i> she instructs. <i>“The one closest to your ear will start the projector on your eyes. The other one will call Iddi, but he won’t come here unless you actually yell out for him.”</i>");
	output("\n\nShutting your eyes, you press the first button. You can see a dim light through your eyelids; you slowly squint your eyes open, getting used to the light being sprayed from the stem of the earpiece. It’s not as bad as you thought: it’s some kind of ‘soft’ light that rapidly overlays a moving image over your eyes, updating every time you blink or look in another direction. It moves so quickly over your eyes and the bridge of your nose that you barely register it as a light flashing in your eyes. It’s as if the earpiece is a printer, and you are the paper.");
	output("\n\n<i>“How do you look?”</i> she asks. You look around the room for a mirror, but there isn’t one (obviously). Instead, you pull out your codex, and you put the screen to sleep, so you can look at its glossy screen and use that as a mirror instead.");
	output("\n\nYour face is largely the same, except around the eyes. Where your usual [pc.skinFurScales] was around your eyes and just above your nose, was fine, brown ‘fur,’ or some facsimile of it. Due to the nature of the projector, it ‘bleeds’ into your actual [pc.skinFurScales] perfectly and seamlessly – you run your finger along where you end and the projector begins, just to make sure that it’s not real. But moreover, the projector also changes your eye color: your [pc.eyes] are replaced with Paige’s stunning, immersive blue. The projector even matches your eyes: it tracks the movement of your pupils and iris’ to ensure that the projection is as accurate as possible. It’s like you’re looking right into her eyes rather than your own.");
	output("\n\n<i>“It works,”</i> you tell her. She giggles as you remove the earpiece and hand it back to her. <i>“Did you mod it yourself?”</i>");
	output("\n\n<i>“I’m blind, [pc.name],”</i> she answered, deadpan. Well... yeah, that was a dumb question. <i>“I knew a guy from my piracy days. It took him a while and it cost a small chunk of change, but I’m not complaining about the results.”</i>");
	output("\n\nAs she shouldn’t, you tell her. It was like your eyes were hers. <i>“Well, good. Money well spent.”</i>");
	// end scene (scene: Earpiece)
	processTime(20);
	clearMenu();
	clearMenu();
	addButton(0,"Next",aboutIddiTalk);
}

//[=Appearance=]
// (scene: Iddi’s Appearance)
public function iddisAppearance():void
{
	clearOutput();
	showIddi();
	output("Iddi is a floating computer monitor. It’s one-hundred centimeters across and fifty-six-and-one-quarter centimeters high, with a definition of 7680 by 4320 pixels – somewhat low-resolution for the modern year, but Iddi <i>is</i> only a helper droid, and for the blind, no less. It has a chrome metal frame and a glass screen protecting its liquid crystal imagery. Iddi floats and flits through the air using a pair of antigravity pulsars built into the bottom of its frame.");
	output("\n\nIddi’s physical appearance is unremarkable – you could purchase a similar monitor at any electronics store and the antigravity pulsars, while high quality, aren’t difficult to find. The meat of what makes Iddi remarkable is its programming: it’s an ever-learning, if low-priority, artificial intelligence, designed to work with Paige and constantly learn from her. After having been with Paige for many years, Iddi’s personality is fairly set in stone, but every day is a new experience for it and her.");
	output("\n\nBy default, the image on the screen is a pair of cartoonish, pixelated eyes on top of an opaque, baby-blue background. What’s on the screen can change depending on the scenario: Iddi can make a smile; a pair of rosy, human lips; it can gesture with hands on the screen; anything you can imagine, Iddi can do. As Iddi was designed for the visually impaired, it’s not for Paige’s benefit, but for anyone and everyone around her.");
	output("\n\nIddi has a charging station, called a ‘dock,’ elsewhere in Paige’s unit. Whenever Iddi is not immediately required, you can usually find it resting there. There’s a jack on the lower end of Iddi’s chrome frame that connects directly to the dock, and that’s how it keeps its battery charged.");
	output("\n\nIddi has a pair of small speakers on the bottom of its frame, between the glass screen and the antigravity pulsars. Though there is no visible attachment or anything, Iddi is capable of communicating directly to Paige in private via the earpiece she’s always wearing. Other than the charging jack, there are no openings on Iddi’s body: no slots or attachment ports – not so much as video- or audio-out. While it’s capable of receiving hardware upgrades, Iddi would have to be sent back to the factory for them, and Paige is in no rush.");
	// end scene (scene: Iddi’s Appearance)
	clearMenu();
	addButton(0,"Next",aboutIddiTalk);
}

//[=Her Eyes=]
// Tooltip: Ask Paige about her eyes. She mentioned that she was interested in synthetic implants?
// Keep this option greyed out (or hidden entirely, is possible) until the PC has done (scene: Paige 4) at least once
public function askPaigeAboutHerEyes():void
{
	clearOutput();
	showPaige();
	output("You ask Paige about her eyes. She frowns, so you hurriedly elaborate: she once mentioned that she’s trying to save her money to get some synthetic eyes to replace her own, but that it’ll ‘be a while yet.’ You ask her if there was anything more she could tell you.");
	output("\n\n<i>“Well, I was in the market to get some synthetic eyes about as soon as I got Iddi. Don’t get me wrong, I love Iddi with all my heart, but I’d love nothing more than to not need him.”</i> She scratches at her chin as she recalls the day. <i>“The ‘job’ that I was working on when I got my injury didn’t provide any medical benefits, and while I do have health insurance</i> now, <i>it doesn’t retroactively cover injuries or disabilities, especially not ones as extreme as mine. I’m not a corporation; I can’t get any health insurance deals with anybody just working as a yoga instructor out of my home. I have to pay for them out of my pocket. Iddi!”</i> she calls suddenly. <i>“Could you come here, please?”</i>");
	output("\n\nIn a flash, the floating robot is before you both, the eyes on its pixelated screen turning into crescents, overjoyed that it could be of use to Paige. <i>“Hello, momma!”</i> Iddi chirps.");
	output("\n\n<i>“Hello, Iddi,”</i> she says, then addresses you again. <i>“I asked JoyCo what my options were. My first option was to get</i> prosthetic <i>eyes: basically, machines that do the seeing for me. Using the modern magic of technology, they could fit me with two itty-bitty robots that plug directly into the cortex of my brain–”</i> She laughs a sort of uneasy chortle once. <i>“I’ve heard lots of stories about how prosthetic limbs or eyes or tongues or dicks or whatever are many times better than the real thing, but I’m not into the idea of my limb having a company logo on it. I don’t like that my vision would depend on some copper. It... just wouldn’t feel right.”</i>");
	output("\n\n<i>“The second option, they told me, was</i> synthetic <i>eyes. They could rebuild my eyes from scratch using my DNA as their base. The eyes would be</i> mine: <i>they wouldn’t be from a donor and they wouldn’t be made of metal or have any wires. They would be all organic, all natural, and all</i> mine. <i>It would be as if my accident had never happened.”</i> She turns towards Iddi’s direction. <i>“Iddi, display the quote the nice nurse at JoyCo gave us for the synthetic eyes for our friend.”</i>");
	output("\n\n<i>“Okay, momma!”</i> Iddi says, and the eyes on the television screen break into thousands of pixels. Each pixel bounces around the monitor as Iddi constructs the quote they were given, followed by the final price tag.");
	output("\n\nWow. That’s, uh. That’s a six-digit number. A five, followed by five zeroes. They expect a yoga instructor to afford that?");
	output("\n\n<i>“Is there anything else I can do?”</i> Iddi asks after a moment.");
	output("\n\n<i>“You’ve done plenty, baby,”</i> says Paige, blowing Iddi a kiss. <i>“Go back to what you were doing. Love you, Iddi.”</i>");
	output("\n\n<i>“Love you too, momma!”</i> And then Iddi’s gone.");
	output("\n\n<i>“So, yeah. That’s a bit of a number, isn’t it? That’s for the eyes and for the surgery together.”</i> She frowns before continuing. <i>“At the rate I’m going, I should be able to afford it by the time I’m in my late sixties. That’s a long way away. But, you know, like I said, I’d love nothing more than to see again. I can be patient.”</i>");
	if(pc.credits < paigeCost()) 
	{
		output("\n\nYou hum in thought. You’re the heir" + pc.mf("","ess") + " to Steele Tech, one of the richest companies in the universe. Is there nothing you can do? You don’t like the thought of Paige having to wait so long and save so much money, but you can’t exactly get the company to float her, and you don’t have that sort of cash in your pocket...");
	}
	else
	{
		output("\n\nYou say nothing as the number flashes in your mind. Five hundred thousand credits – one half of one million. You could afford that. Paige doesn’t have to wait until she’s old.");
	}
	//Paige is meant to be a late- or end-game recruit and is only supposed to be sexable until then, which is why the barrier to fix her eyes is so high. As I don’t have any authority when it comes to game balancing and I just write the content, the total cost to repair her eyes is totally up to FenCo, although keeping in the spirit of her being an end-game recruit I’d still appreciate it if it were high.

	processTime(20);
	clearMenu();
	//[=Offer=][=Back=]
	if(pc.credits >= paigeCost()) 
	{
		if(flags["PAIGE_TALK_SELF"] >= 4 && flags["SEXED_PAIGE"] != undefined) addButton(0,"Offer",confirmThePayment,undefined,"Offer","Offer to pay for Paige’s synthetic eyes and for the surgery.");
		else addDisabledButton(0,"Offer","Offer","Maybe you should get to know her a little more intimately before you offer to pay for her synthetic eye surgery.");
		addButton(14,"Back",backToPaigeMenu,undefined,"Back","Five hundred thousand credits is no small number. You’ll need some time to think about it.");
	}
	else
	{
		addDisabledButton(0,"Offer","Offer","You don’t have enough credits to pay for Paige’s synthetic eyes. Not yet, anyway.");
		addButton(14,"Back",backToPaigeMenu,undefined,"Back","There’s nothing you can do for her yet. But maybe, if you’re a little more frugal...");
	}
}

// (scene: Confirm)
public function confirmThePayment():void
{
	clearOutput();
	showPaige();
	output("Are you sure? Five hundred thousand credits is not a small amount of money. Are you <i>certain</i> you want to spend it on Paige?");
	processTime(1);
	clearMenu();
	//[=Yes=][=Uhh...=]
	
	if(silly) addButton(0,"Yes",confirmTheHalfMilMoron,undefined,"Yes","Let’s be real, you can just hack them back in later.");
	else addButton(0,"Yes",confirmTheHalfMilMoron,undefined,"Yes","She’s worth every single one.");
	if(silly) addButton(1,"Uh...",dontConfirmTheHalfMilMoron,undefined,"Uh...","Apparently, she’s not worth any. Dick move.");
	else addButton(1,"Uh...",dontConfirmTheHalfMilMoron,undefined,"Uh...","Maybe you can come back when you have a bit of float to work with.");
}

public function confirmTheHalfMilMoron():void
{
	// Continue at (scene: Her Eyes 2); because the following content is so long and disconnected from the rest of Paige’s conversation options, I’ll be continuing it after the [=Spar=] scene.
	herEyes2();
}


public function dontConfirmTheHalfMilMoron():void
{
	clearOutput();
	showPaige();
	output("You speedily backpedal, much to Paige’s chagrin. Maybe now would be a good time to leave...");
	clearMenu();
	addButton(0,"Next",moveSouth);
}


//[=Appearance=]
// Tooltip: Give Paige the once-over with your eyes. She’s been sculpting her body for years – she’d probably enjoy the attention.
// (scene: Paige’s Appearance)
public function paigeAppearance():void
{
	clearOutput();
	showPaige();
	output("Paige is a tall Ausar woman, standing just shy of 180 centimeters, or just below six feet. She has very little fat on her body, but she’s also not especially musclebound – the years of yoga have sheered the fat off her body and left nothing but tone and definition. That said, holding all those unique poses have done wonders for her muscle mass: the muscles on her arms and legs are quite pronounced and her abs have been sculpted into perfect six-pack abs after all those crunches. While she’s no bodybuilder and she won’t win any strongwoman competitions, she’s no doubt stronger than your average Ausar, man or woman. ");
	if(pc.PQ() <= 50) output("She’s quite a bit stronger than you, that’s for sure.");
	else if(pc.PQ() <= 75) output("You’re not a slouch when it comes to muscle mass, but Paige probably still has your number.");
	else if(pc.PQ() <= 99) output("You’ve got quite a bit of muscle yourself, but it wouldn’t be fair to say which of you two would have more.");
	else output("Still, compared to you, she doesn’t <i>quite</i> stack up.");

	output("\n\nPaige’s fur coloration is dark brown, with large pools of black, especially along her limbs and back, and long streaks of white, especially along her front, from her neck to her groin. She’s taken gene mods for her fur to cover every bit of skin, and her nose has elongated into a snout, like a true canine’s. Her fur is about three centimeters thick, or just over an inch, uniform all over her body. She has brown hair, just a touch lighter in hue, going from her scalp to her just below her shoulders. She has perky, triangular, wolfish ears that she can fold and flex, and they stand about twelve centimeters at their longest. Her tail is bushy-but-not-fluffy, covered with black fur on the top and beige-brown on the bottom, which reaches to her tendons.");
	output("\n\nPaige likes to wear a sleeveless jumper vest that hugs her torso well, bulging against her C-cup breasts and clinging to her tight abs that covers up to her neck and down to her waist. When she’s doing yoga, she wears tight yoga pants, stretched thin against the contours of her legs, but when she’s relaxing at home, she switches out for grey sweatpants. During the daytime, she prefers to have her long hair done up in a cute bun");
	//if {PC has had sex with Paige}
	if(flags["SEXED_PAIGE"] != undefined) output(", while during the night, she lets it down. For underwear, she a white sports bra that keeps the girls from getting too wild during yoga, and she wears frilly white panties to keep her otherwise decent");
	output(".");
	//Paige is blind
	if(paigeBlind()) output("\n\nBeing blind, Paige wears an earpiece in her right ear, with a long stem going from the base to just before her eyes. Not many people know the truth about the piece: its part one-way communicator with Paige’s assistant droid, and its part projector. Paige is blind from an injury that goes across her eyes, and the projector hides the cataracts in her eyes as well as the scar that goes across the bridge of her nose. Nobody can tell when the projector is on, but it does a brilliant job of hiding the scar and displaying instead a beautiful set of deep blue eyes. When it’s off, her eyes are grey and cloudy, and her scar is so wide and deep, it still looks fresh.");
	// end scene (scene: Paige’s Appearance)
	clearMenu();
	addButton(0,"Next",backToPaigeMenu);
}

//[=Yoga=]
// Reveal this option only after the PC has had sex with Paige.
// Available at every hour that Paige is accessible, but only once per day.
// Tooltip: Even though you’re not ‘officially’ a student of hers, you could still try asking Paige if she’s willing to do some yoga.
// Tooltip (already done yoga once that day): It’s not a good idea to do extended yoga sessions more than once a day. You might hurt yourself!
// (scene: Difficulty Select 2)
public function paigeAtHomeYoga():void
{
	clearOutput();
	showPaige();
	if(currentLocation == "SHIP INTERIOR")
	{
		output("You ask Paige if she’s willing to do some one-on-one yoga with you. You know that, since you’ve taken Paige as a lover, she can’t have you as a student due to professional courtesy, but you’d love to do a little bit if she’s okay with doing it for free.");
		output("\n\n<i>“Aww, [pc.name],”</i> she coos, <i>“that’s so sweet that you want to be a part of my interests even after you got into my pants. Of course I’d love to do some yoga with you! It’s more than a job to me – it’s my passion, and I’d love you to be a part of it");
		if(hours >= 0 && hours < 9) output(", even at this unruly hour");
		output("!”</i>");
		output("\n\nBesides the monitor Paige uses to communicate with Iddi; her bed; a small desk with two chairs; and a personal refrigerator, the bulk of Paige’s personal quarters are taken up by a large yoga mat. She mostly uses it for herself. <i>“Strip out of your gear,”</i> she commands, and you do.");

		//if {the PC has never done Difficult Select 1 and has gotten into Paige’s pants entirely via Honey Wine}
		if(flags["PAIGES_WINES"] != undefined && flags["PAIGE_YOGA"] == undefined || (flags["PAIGE_YOGA"] != undefined && flags["PAIGE_YOGA"] < 4)) output(" <i>“I’m really glad you want to give yoga another try with me, [pc.name]. You haven’t been to a class since I invited you into my unit – I was wondering if maybe I had scared you off of it. Don’t worry though, baby. I’ll be gentle.”</i>");
		//if {the PC hasn’t unlocked Hard Mode}
		if(flags["YOGA_MEDIUM"] == undefined || flags["YOGA_MEDIUM"] < 4) output(" <i>“So, what are we in the mood for today? We can try something a little easier, or we can start working our way into the more exotic poses.”</i>");
		else output(" <i>“Whatever you’re in the mood for, baby, we can do it. If you want to take it easy with something simpler, I’m down. Or, if you want to try the intense stuff, the poses-for-two... maybe we can work a happy ending into it.”</i>");
		//[=Easy Mode=][=Medium Mode=][=Hard Mode=][=Other=]
		// play the usual difficulty modes and Difficulty Select 2 endings
		// end scene (scene: Crewmate: Difficulty Select 2)
	}
	else
	{
		output("You ask Paige if she’s willing to do some one-on-one yoga with you. You know that, since you’ve taken Paige as a lover, she can’t have you as a student due to professional courtesy, but you’d love to do a little bit if she’s okay with doing it for free.");
		output("\n\n<i>“Aww, [pc.name],”</i> she coos, <i>“that’s so sweet that you want to be a part of my interests even after you got into my pants. Of course I’d love to do some yoga with you! It’s more than a job to me – it’s my passion, and I’d love you to be a part of it");
		if(hours >= 0 && hours < 9) output(", even at this unruly hour");
		output("!”</i>");
		output("\n\nThe main room to her unit, besides the couch, the recliner, and the coffee table, is mostly bare. On top of it is one single, massive yoga mat that, until you met her, Paige used by herself. <i>“Strip out of your gear,”</i> she says, and you do.");
		output("\n\n[if {the PC has never done Difficult Select 1 and has gotten into Paige’s pants entirely via Honey Wine}<i>“I’m really glad you want to give yoga another try with me, [pc.name]. You haven’t been to a class since I invited you into my unit – I was wondering if maybe I had scared you off of it. Don’t worry though, baby. I’ll be gentle.”</i>");
		//if {the PC hasn’t unlocked Hard Mode}
		if(flags["YOGA_MEDIUM"] == undefined || flags["YOGA_MEDIUM"] < 4) output("\n\n<i>“So, what are we in the mood for today? We can try something a little easier, or we can start working our way into the more exotic poses.”</i>");
		else output("\n\n<i>“Whatever you’re in the mood for, baby, we can do it. If you want to take it easy with something simpler, I’m down. Or, if you want to try the intense stuff, the poses-for-two... maybe we can work a happy ending into it.”</i>");
	}
	processTime(5);
	//[=Easy Mode=][=Medium Mode=][=Hard Mode=][=Other=]
	// end scene (scene: Difficulty Select 2)

	// connect all (scene: Easy Mode) endings here (they’re the same scenes from the yoga class earlier, but with unique ends for Paige’s Unit)(includes the Other option)
	clearMenu();
	if(pc.legCount != 2 || pc.isGoo())
	{
		addDisabledButton(0,"Easy Mode","Easy Mode","You’d need to be both a biped and non-gooey for this.");
		addDisabledButton(1,"Medium M.","Medium M.","You’d need to be both a biped and non-gooey for this.");
		addDisabledButton(2,"Hard Mode","Hard Mode","You’d need to be both a biped and non-gooey for this.");
		addButton(3,"Other",otherWorkSlooootNonGoo,undefined,"Other","As a non-traditional creature, your yoga options are limited.");
	}
	else
	{
		addButton(0,"Easy Mode",paigeYogaEasyMode);
		addButton(1,"Medium M.",yogaMediumMode);
		if(flags["YOGA_MEDIUM"] != undefined && flags["YOGA_MEDIUM"] >= 4) addButton(2,"Hard Mode",yogaHardMode);
		else addDisabledButton(2,"Hard Mode","Hard Mode","That is still beyond your capabilities.");
		addDisabledButton(3,"Other","Other","This is for non-bipeds and creatures made of goo.");
	}
}

// (scene: Easy Mode Ending 2)
public function easyModeEndingInApartment():void
{
	clearOutput();
	showPaige();
	output("An hour passes before Paige calls it. You go through a number of ‘cool down’ poses to relax your muscles and ease you back into your regular life.");
	output("\n\n<i>“Nicely done today, sweet thing.”</i> She rubs both of your shoulders lovingly with her firm hands, and you feel what little tension remaining in them melt away. <i>“Like I promised, some easy stuff today. Nice and easy...”</i>");
	output("\n\nYou hold onto her hands as she rubs you, and you tell her that they were only easy because you had such a good instructor with you. <i>“You’re already in my pants, [pc.name],”</i> she giggles. <i>“But I love it.”</i>");
	output("\n\nYou enjoy each other’s time together a bit more before you finally pull yourself together and fit your effects back onto your body. <i>“So,”</i> says Paige. <i>“Is there anything else you wanted to do today?”</i>");
	// end scene (scene: Easy Mode Ending 2); advance time by one hour; return the PC to Paige’s main menu but grey out the [=Yoga=] option; increase Physique by 1(if PC is goo, do nothing); increase Tone by 5(if PC is goo, do nothing); deduct 20 energy
	processTime(50);
	yogaToning(5);
	pc.energy(-20);
	paigeMenu();
}

// connect all (scene: Medium Mode) endings here
// (scene: Medium Mode Ending 2)
public function mediumModeEndingInApartment():void
{
	clearOutput();
	showPaige();
	output("It’s strenuous, demanding, and more than a little difficult, but after an hour of different stretches and poses, Paige calls it quits and lets you unwind. You unfurl into a person-shaped puddle on the floor, feeling different muscles all over your body spasm with their exertions. Paige laughs, but convinces you that it’s within your best interest to do some simple cool down stretches to unwind your body.");
	output("\n\n<i>“You did very well today, sweet thing,”</i> she says. She frames your face with her hands as she speaks to you, her eyes ");
	if(paigeBlind()) output("very nearly ");
	output("on yours. <i>“You’ve made me very proud as a teacher. You could have given up, but you stuck it out.”</i> She leans forward and plants a kiss on your [pc.lips] – it lasts quite a bit longer than her usual lovey kisses.");
	output("\n\nYou tell her that you wouldn’t have even thought of making it this far without her and her tutelage. <i>“You could,”</i> she replies. <i>“It’s not like I’m making you do yoga. But the fact that you’re involving yourself in my interests... that means a lot to me. I appreciate it.”</i>");
	output("\n\nYour muscles are still quaking from the exercise, and it takes a bit more effort to put your things back on. You’re in no rush anyway. Paige fills the air with talking about how well you’ve been doing and how excited she is for some future poses she could try with you, if you’re willing to push yourself a bit harder. <i>“We still have some time to kill, sweet thing,”</i> she says lovingly, wrapping her arms around your left one and hugging it tight. <i>“Anything else you want to do today?”</i>");
	// end scene (scene: Medium Mode Ending 2); advance time by one hour; increase Physique by 2; increase Tone by 7; deduct 40 energy
	processTime(50);
	IncrementFlag("YOGA_MEDIUM");
	yogaToning(7);
	pc.energy(-40);
	paigeMenu();
}

// connect all (scene: Hard Mode) endings here
// (scene: Hard Mode Ending 2)
public function apartmentYogaEndings():void
{
	clearOutput();
	showPaige();
	output("An hour later, Paige says the most beautiful sentence in the world: <i>“That’s enough for today.”</i>");
	output("\n\nYou immediately collapse into a puddle of [pc.skinFurScales]. Your muscles convulse and spasm for their exertion and your bones hurt and feel as though they had been twisted and bent out of place time and again. You splay on the floor, your arms and legs apart, and you feel yourself dissolve on Paige’s yoga mat. ");
	//if {first time doing Hard Mode}
	if(flags["YOGA_HARD"] == undefined) output("Paige tells you that the pose you’re in is actually considered more yoga; a pose called ‘savasana.’ Whatever. As long as you’re not stretching anything.");
	else output("The savasana pose is easily the best, most practical part of yoga, especially right this second. You feel like you could sleep right then and there.");
	output("\n\nPaige laughs, then lays down beside you, her scalp against yours. You’re not out of breath, but you don’t have the energy to do much of anything. You both spend a couple of minutes with each other in total silence, basking in the accomplishment of completing Paige’s challenge.");
	output("\n\n<i>“Been there,”</i> she whispers. <i>“You get used to it.”</i> You ask her how long it took for her to ‘get used to it.’ <i>“Years.”</i> You laugh in sheer defeat.");
	output("\n\nPaige rolls onto her stomach, then slowly crawls towards you");
	if(paigeBlind()) output(", using her hands to feel her way towards you");
	output(". She finds your shoulder, then your arm, then your hand. She feels her way around your [pc.belly], then across you as she climbs on top of you. She lays her face against your [pc.chest], then scoots up to your neck.");
	output("\n\nShe lays on top of you gently for a moment, listening to your heartbeat, breathing in time with you. <i>“It means a lot to me that you’re willing to do this, [pc.name],”</i> she tells you. <i>“I’ve never had a yoga partner that could keep up with me. You’ve filled a lot of gaps in my life.”</i>");
	output("\n\nShe grinds forward, her chest against yours. You can feel her Ausar nipples against your [pc.nipples], and her knee bends and gently brushes into your [pc.crotch].");
	if(pc.hasCock()) output(" <i>“I have one more gap to fill if you think");
	else output("<i>“I can think of a great way to end the day if");
	output(" you have the energy for it.”</i>");
	output("\n\nMost of your body says no and is ready to sleep. But one body part in particular is wide awake.");
	// end scene (scene: Hard Mode Ending 2); increase Physique by 2; increase Reflexes by 1; increase Tone by 10; deduct 70 energy; increase lust by 30; inflict Sore on PC
	processTime(50);
	yogaToning(10);
	pc.energy(-70);
	pc.lust(33);
	paigeMenu();
}

//[=Sex=]
// Keep this option hidden until the PC has had sex with Paige once
// Lust must be at 30 minimum
// Tooltip (enough Lust): You could really do with some release, and something tells you yoga’s not gonna cut it.
// Tooltip (not enough Lust): You’re not aroused enough to have sex with Paige. There are several ways to fix that, of course.
// (scene: Paige Foreplay)
//Coded in follower/paigeSex.as: sexWithPaige

//[=Rest=]
// Reveal this option after the PC has had sex with Paige once, and grey it out unless the time is between 00:01 and 08:59
// Tooltip (acceptable hours): No yoga and no sex – just some cuddling with Paige for a good night’s rest.
// Tooltip (unacceptable hours): Who goes to bed in the middle of the day? Come on.
// (scene: Rest)
public function restOnSomeSchtuff():void
{
	clearOutput();
	showPaige();
	output("You have no plans for tonight. As a matter of fact, it’s pretty late out, and you were kind of ready to hit the hay. <i>“Uh,”</i> says Paige, bewildered, <i>“then why did you make your way all the way out here? Don’t you have a bed in your ship?”</i>");
	output("\n\n<i>“Because,”</i> you answer, <i>“");
	if(pc.PQ() <= 69) output("Little Spoon wants to be held by Big Spoon");
	else if(pc.PQ() <= 94) output("Big Spoon wants to hold Big Spoon");
	else output("Big Spoon wants to hold Little Spoon");
	output(".”</i>");

	output("\n\nPaige rears back, and then laughs. <i>“That’d be sweet if it weren’t so corny,”</i> she chides. <i>“");
	if(pc.PQ() > 94) output("And I’ll be getting you back for calling me the smaller spoon someday. ");
	output("Hurry up, then.”</i>");

	output("\n\nYou strip down to nothing ");
	if(pc.isNude()) output("not that it was difficult ");
	output("while Paige undoes her bra, letting her puppies out to breathe. You don’t ogle for long, since that’s not what you came for – Paige throws the covers to her bed open, then pats the lower sheets, inviting you in as you crawl into the bed with her.");

	output("\n\nOnce you’re snug in the bed, your warm body pressed against the smooth, fine fur of your Ausar lover, Paige pulls the covers over you both and snaps her fingers twice. Responding to her command, the lights in the room shut off.");
	if(paigeBlind() && silly) output(" You ask her how she knows when the lights are on and when they’re off. <i>“Don’t worry about it,”</i> she responds.</i>");
	output("\n\nNow in total darkness and snuggled up tight against Paige, ");
	if(pc.PQ() <= 69) output("your back against her front, her arms wrapped around you, her boobs against your back and her hips against your butt");
	else if(pc.PQ() <= 94) output("both of you sleeping face-to-face, one arm over the other’s body and the other under the pillows");
	else output("your [pc.chest] pressed against her back, your arms around her body, and your [pc.hips] resting against her firm butt");
	output(", the day’s activities catch up to you in a hurry. It’s not long before you find yourself drifting to sleep.");

	//[=Next=]
	// end scene (scene: Rest)
	// advance the clock 8 hours
	processTime(8*60);
	clearMenu();
	if(hours == 8 || hours == 9) addButton(0,"Next",paigeRestWakeupOne);
	else addButton(0,"Next",paigeREstWakeupTwo);
}

// Play this scene if the clock is between 08:00 and 09:00
// (scene: Rest 2)
public function paigeRestWakeupOne():void
{
	clearOutput();
	showPaige();
	output("Paige’s alarm clock jostles you both awake. Slow to start and fighting the cotton in her mouth, Paige groans and turns over, finding the switch for the alarm with experienced deftness, stopping its incessant ringing. Chewing at nothing, she pulls herself away from you and flips the covers open, slowly pulling herself out of the bed.");
	output("\n\nShe snaps her fingers twice, and the lights of the room turn back on. You squeeze your eyes even tighter against the bright light. <i>“Rise and shine,”</i> Paige utters, almost contemptuously. You don’t move at first. <i>“Sorry, [pc.name],”</i> she says, whipping the covers against your body and leaving you exposed to the unit’s air conditioning. <i>“I got a yoga class to teach today. Can’t sleep in. Couldn’t if I wanted to; Iddi’s gonna be here any moment to yell at us.”</i>");
	output("\n\n<i>“Momma!”</i> Iddi yells, hovering just beyond the door. <i>“It’s morning, momma!”</i> Right on time.");
	output("\n\n<i>“Thanks, baby,”</i> she yells back. <i>“I’ll be right out.”</i> Iddi’s silhouette vanishes from the door. Well, you’re awake now. With some difficulty, you pull yourself out of bed, finding your effects in a pool by the side of the bed, just as you had left it.");
	output("\n\n<i>“I’m not gonna lie,”</i> Paige says, yawning once. <i>“That was a pretty good sleep. I don’t remember sleeping as well as that in a while.”</i>");
	output("\n\nStrange as it may seem, you’re inclined to agree. Turns out, cuddling with someone to sleep is pretty awesome. You feel way better rested than usual.");
	output("\n\nYou spend the morning getting dressed and having a delicious, home-cooked breakfast of steak, eggs, bacon and orange juice with Paige. When nine o’clock rolls around, she and Iddi make for the door of her unit. <i>“It’s not often I say this to just sleeping,”</i> she says to you, <i>“but hey, let’s do it again sometime!”</i>");
	output("\n\nYou just might!");

	// end scene (scene: Rest 2); remove any negative status ailments (such as Sore); apply the Home Cooking status; restore Energy to maximum; place PC one square outside of Paige’s Unit
	sleepHeal();
	eatHomeCooking(100);
	clearMenu();
	addButton(0,"Next",moveSouth);
}

// Play this scene if the clock is any time after 09:00
// (scene: Rest 3)
public function paigeREstWakeupTwo():void
{
	clearOutput();
	showPaige();
	output("You awake slowly. The bed is softer than your usual bed, and the sheets are a bit thinner and have a softer material. When you blink your eyes awake, you realize that you’re not in your ship, and it takes you a moment longer to remember that you slept with Paige in her bed.");
	output("\n\nYou stumble out of bed. Paige isn’t with you, and it looks like she hasn’t been there for a while. Your effects lay in a flat pool beside the bed, exactly where you left them before your sleep. You call out Paige’s name, and then Iddi’s. There’s no response from anywhere in the unit.");
	output("\n\nAs you dress, you pick up your codex, and you find that you’ve received mail from Paige, sent by Iddi. You open the letter immediately.");
	output("\n\n<i>“Good morning, [pc.name]!”</i> it reads. You glance at the corner of your codex for the time");
	if(hours >= 12) output(", and you wince in embarrassment");
	output(". <i>“Sorry I couldn’t stick around, but I have a yoga class to teach all day, after all.”</i>");

	output("\n\n<i>“It was a good idea for you to stay the night last night! I dunno about you and I can’t exactly ask, not right away, but I feel way more energized than I normally do. Who’d a thought that spooning with a sweet thing like you would be so rejuvenating? Let’s do it again sometime!”</i>");
	output("\n\n<i>“Help yourself to anything in the fridge. I know you adventurer types can’t adventure on an empty stomach. Hope to see you again soon!”</i>");
	output("\n\n<i>“Eckses and ohs,");
	output("\n\nPaige.”</i>");
	output("\n\nYou have to admit, you feel pretty relaxed after a sleep like that. You just might take up Paige on her offer to spend another night in her bed.");
	output("\n\nYou take up Paige’s invitation to visit her fridge for a fairly basic breakfast. Once you’re done and full, you slip your effects back onto your body, and then you make your way for the door. Paige is right about another thing: you have a big day of adventuring ahead of you!");

	// end scene (scene: Rest 3); remove any negative status ailments (such as Sore); restore Energy to maximum; place PC one square outside of Paige’s Unit
	sleepHeal();
	eatHomeCooking(100);
	clearMenu();
	addButton(0,"Next",moveSouth);
}

//[=Leave=]
// (scene: Leave)
public function leavePaige():void
{
	clearOutput();
	showPaige();
	output("It’s been fun, but it’s time to say until next time to Paige. <i>“Aw, so soon?”</i> she pouts, then perks back up. <i>“I understand, sweet thing. Being an adventurer is an all-day gig. Get out there and show the universe how [pc.aRace] does it!”</i>");
	output("\n\nPaige follows you to the door of her unit.");
	if(flags["SEXED_PAIGE"] != undefined) output(" Before you leave, she spins you around and gives you a quick kiss on your lips.");
	output(" <i>“See you around,”</i> she giggles, then pushes you out.");
	processTime(1);
	clearMenu();
	if(InShipInterior(pc) && paigeIsCrew()) addButton(0,"Next",crew);
	else addButton(0,"Next",moveSouth);
}

//[=Spar=]
// Reveal this option after the PC has seen (scene: Paige 6), and grey it out unless the time is between 17:00 and 00:00
// Tooltip: Paige mentioned that she would like a sparring match against you. Even though she’s blind, don’t expect an easy fight!
// Tooltip (unacceptable hours): Tonight’s not the night for fighting. You might cause a disturbance with the noise among the other units, besides.
// (scene: Spar)

//flags["PAIGE_SPAR_RESULT"] = ; {loss/win}
//flags["PAIGE_SPAR_WINS"] = ;
//flags["PAIGE_SPAR_LOSSES"] = ;
public function sparWithPaige():void
{
	clearOutput();
	showPaige();
	output("You say to Paige that you’ve been thinking about her challenge to a sparring match. <i>“Oh yeah!”</i> she chirps. <i>“");
	//if {never challenged Paige before}
	if(flags["PAIGE_SPAR_RESULT"] == undefined) output("You put any thought into it, sweet thing? Decide that you’re not afraid to fight a blind woman?");
	//if {won the previous encounter with Paige}
	else if(flags["PAIGE_SPAR_RESULT"] == "win") output("Wanna go another round? I’ve been thinking about why I lost last time. It’s not gonna be any easier this time, I can promise you that!");
	//if {lost the previous encounter with Paige via HP}
	else if(flags["PAIGE_SPAR_RESULT"] == "loss") output("Thinking of putting your pride on the line a second time? Hope you brought your A-game this time, sweet thing!");
	//[if {lost the previous encounter with Paige via Lust}
	else if(flags["PAIGE_SPAR_RESULT"] == "slut") output("Got all that tension out of your system, did you? I hope you realize how disappointed I’ll be if you decide to fuck off again.");
	//if {last encounter ended in a Stalemate}
	else if(flags["PAIGE_SPAR_RESULT"] == "stalemate") output("Got your nerve built up this time? I’d better hope so! The last match ended on such a lame, boring note. I hope you really give it your all this time!");
	//if {last encounter ended by Yielding}
	else if(flags["PAIGE_SPAR_RESULT"] == "yeild") output("Think you’ve toughened up enough for me? I don’t hold it against you for backing down last time, but if you’re ready for a serious go, then I’m game too!");
	output("”</i>");

	//if {Never challenged Paige before}
	if(flags["PAIGE_SPAR_RESULT"] == undefined)
	{
		output("\n\nYou tell her that you’ve thought about it, and you’re interested in having an honest sparring match with her. You promise that you won’t hold back ");
		if(paigeBlind()) output("just because she’s blind ");
		output("– you respect her more than that. <i>“Good idea. You’re going to need every trick up your sleeve!”</i> she guffaws, then flexes her arms, showing off her weapons.");

		output("\n\n<i>“I just have one rule, though,”</i> she says. <i>“No weapons. Shields and armor, that’s fine, if you don’t mind hiding behind a shield.”</i> She smiles cockily and brings her hands together, popping her knuckles. <i>“But this is a sparring match. I want to test what we’re capable of. It’s not that hard to pull a trigger.”</i> She presses her arms against her boobs, deepening their cleavage for you. <i>“Let’s not forget what the ultimate prize is for the winner, too,”</i> she says, licking her lips.");

		output("\n\nDo you accept her terms?");
	}
	else if(flags["PAIGE_SPAR_RESULT"] == "win")
	{
		output("\n\nYou reply that you <i>hope</i> she’s thought about it. You were bored enough whupping her ass across her yoga studio last time and this time, you expect her to give you a better challenge. <i>“That’s the shit-talk I want to hear!”</i> she laughs. She places her hands on her hips and flexes her abs and pectorals. <i>“Let’s hear it keep up when my fist is in your mouth, sweet thing!”</i>");
		output("\n\n<i>“Before we go, though, I just want to be clear that the rules are the same: no weapons. You can use your armor and your shields if you think you need them – and you will – but I don’t want to see any plasma rifles or energy swords or whatever the hell. You still game?”</i> She raises her hands to her breasts and openly gropes them in front of you. <i>“The reward’s still the same, and still ripe for the taking, sweet thing.”</i>");
		output("\n\nDo you accept her terms?");
	}
	else
	{
		output("\n\nYou promise Paige that the last time you danced was just a fluke, and this time, you’ve got her figured out. You’ll be cleaning the mats with her fur before the hour is out. <i>“Big talk, after what happened last time!”</i> she chortles. She spreads her legs and flexes them, and the definition in them practically pop straight through her fur. <i>“For your sake, you better hope you got something better this time. Who wants to lose to a ");
		if(paigeBlind()) output("blind ");
		output("woman</i> again<i>?”</i>");

		output("\n\n<i>“Before we go, though, I just want to be clear that the rules are the same: no weapons. You can use your armor and your shields if you think you need them – and you will – but I don’t want to see any plasma rifles or energy swords or whatever the hell. You still game?”</i> She turns around and slaps her own ass hard, letting the cracking sound reverberate off the walls of her unit. <i>“Maybe I’ll let you take charge of some of</i> this <i>if you win!”</i>");

		output("\n\nDo you accept her terms?");
	}
	processTime(7);
	//[=Accept=][=Decline=]
	// end scene (scene: Spar)
	clearMenu();
	addButton(0,"Accept",paigeSparAccept);
	addButton(1,"Decline",declareSparWithPaige);
}

//[=Decline=]
// (scene: Spar Decline)
public function declareSparWithPaige():void
{
	clearOutput();
	showPaige();
	output("No weapons? Um...");
	output("\n\n<i>“What, you don’t want to fight a ");
	if(paigeBlind()) output("blind ");
	output("woman at arm’s length?”</i> she chides, keeping up the boastful demeanor but subtly disappointed that you’re so hesitant. <i>“That’s fine, [pc.name]. I could fight off more than my fair share of Black Void pirates");
	if(paigeBlind()) output(" when I could see");
	output(", so I’m not exactly a slouch. When you’re feeling a bit braver, feel free to come at me. I’ll be here!”</i>");

	output("\n\nYou can’t help but feel you’ve let Paige down a bit, but still, you kind of value your personal health. Maybe you’ll take her advice and come back when you’re ‘braver.’");

	// return to Paige Select 2, no penalty
	// end scene (scene: Spar Decline)
	processTime(2);
	clearMenu();
	addButton(0,"Next",backToPaigeMenu);
}

//[=Accept=]
// (scene: Spar Accept)
public function paigeSparAccept():void
{
	clearOutput();
	showPaige();
	if(paigeIsCrew())
	{
		output("No weapons? You ask Paige: aren’t we beyond that, now that she doesn’t have her disability?");
		output("\n\n<i>“We’d still be wearing the gloves,”</i> she laughs. <i>“But I hear what you’re saying. To be honest, these sparring matches are supposed to be about who between us is the better fighter. It’s not about who has the biggest, baddest sword, or how well they can use it. It’s down to you, me, and our fists. There’s no tricks or excuses. One of us is the better fighter, and that’s all there is to it.”</i>");
		output("\n\nYou can respect that. You ask her where she intends to spar. <i>“There’s plenty of room in the cargo hold. We barely use it for anything. I can set up a couple yoga mats down there to make things a bit softer.”</i> Sounds good to you! You leave your weapons in her unit and you both head to the ship’s hold.");
		output("\n\nMoments later, you have a respectable ring in the hold of your ship. Paige gives you the gloves with the soft, malleable material that provides some cushioning without losing your power. <i>“Let’s just go over the rules,”</i> she says as you slip the gloves on. <i>“The basic shit. No hitting the groin; first to say uncle; and all that.”</i> She raises her own gloved fists, grinning at you as she stares you down with her brilliant blue eyes. <i>“When you’re ready.”</i>");
		output("\n\nYou raise your own gloved fists as you take your spot across from Paige. Her stance is similar to an experienced boxer’s position – her arms are protecting her body and her fists are protecting her face. Her time with you has made her stronger than she ever has been before, and now that she can see, she has no more obstacles between her and her victory.");
		output("\n\nExcept one.");
		output("\n\n<b>You.</b>");
	}
	else
	{
		output("No weapons? Child’s play! You’re more than happy to fight Paige bare-knuckled.");
		output("\n\n<i>“Not bare knuckled,”</i> she advises. <i>“My yoga class is a wide open space and it’s closed for the day. I got some gloves we can use – soft on the face but they don’t lose any power in the swing. Let’s do this there.”</i>");
		output("\n\n");
		if(paigeBlind()) output("You let Paige lead you out of her unit (instructing Iddi to remain there, and that she’ll be back soon) and to her yoga class just one room over. When you’re inside, she locks the door and hides her earpiece on a small corner table next to the door.");
		else output("You let Paige lead the way as she takes you through the belly of your ship, towards your cargo hold. You’re not really using it for anything, and from the looks of things, Paige has been busy, setting up a number of mats placed together to form your arena.");
		output("\n\n<i>“Let’s do this proper,”</i> she says, stepping onto the yoga mat with you and handing you the gloves she promised. They’re fairly basic, but the material, as she promised, is soft and malleable, providing some cushion for impact without inhibiting your power. <i>“I want a good, clean fight. Toe the line; no hitting below the belt. And all that shit. You ready?”</i>");

		output("\n\nYou find yourself a spot directly across from Paige on the center of the mat. She raises her gloved fists, facing towards you, taking an experienced boxer’s position – her arms are protecting her body and her fists are protecting her face. It’s clear that she knows her way around a fight – ");
		if(paigeBlind()) output("and even with her disability, ");
		output("this won’t be easy at all.");

		output("\n\n<b>It’s a fight with Paige!</b>");
	}
	// Refer to Combat With Paige document to proceed; inflict Disarm on the PC
	//Fen note: fuck that, original sparring wasn't fun. Replaced with minigame.
	// end scene (scene: Spar Accept)
	processTime(3);
	paigeSparSetup();
}

// (scene: Her Eyes 2)
public function herEyes2():void
{
	clearOutput();
	showPaige();
	output("You sit with Paige in silence for a moment, contemplative. You’ve already made up your mind, but your heart needs a moment to catch up to your head. That’s an enormous amount of money you’re about to put down on Paige.");
	output("\n\n<i>“Terra to [pc.name]?”</i> Paige says playfully, nudging you after you don’t respond to her questions. <i>“It’s okay; that price tag knocked me for a loop too. Don’t space out on me now!”</i>");
	output("\n\nYour mouth is dry as you turn to her. Would she accept it? You don’t take Paige to be the type to accept a lot of handouts. But, there’s no point in beating around the bush. <i>“I can afford that,”</i> you say.");
	output("\n\nPaige hesitates. <i>“What?”</i> she asks, her playful tone remaining. You’re sure she heard you clearly the first time.");
	output("\n\n<i>“I can afford that,”</i> you say again. <i>“You don’t have to be blind until you’re old. I can help you with your eyes, Paige.”</i>");
	output("\n\nPaige’s eyes fixate in your direction. Her smile fades but her cheeks remain raised in hope. Her tail is still as could be, but her ears perk straight up, her undivided attention on you. <i>“I, uh,”</i> she stutters, at a loss for words for the first time since you met her. <i>“That’s sweet, [pc.name], but even if you could, I don’t need a handout.”</i>");
	output("\n\n<i>“I’m not offering because you need one, Paige,”</i> you insist, reaching out and grabbing her hand, squeezing it gently. <i>“I’m not trying to solve the universe’s problems. I want to help you because...,”</i> you gasp, trying to put your thoughts to words. Paige doesn’t interrupt and listens to you intently, her damaged eyes wide and her hand trembling in yours. <i>“You’re more to me than just a teacher. I want to help you; I want to see you happy, and if that means half a million credits to fix your eyes, I’d pay it. I’d pay it twice over, if I had to.”</i>");
	output("\n\nPaige is still as a statue and her expression goes narrow, processing what you’ve said to her. You can feel her pulse quickening in your hand and you can hear her hold her breath. <i>“It’s,”</i> she says, struggling with the words she feels she needs to say, <i>“it’s too much money, [pc.name]. Spend it on something else.”</i>");
	output("\n\n<i>“Paige!”</i> you yell, frustrated, <i>“stop thinking about your pride for a minute and just think about yourself! You can be seeing out of your</i> own <i>eyes again in a matter of days. I’m trying to help make your dream come true; stop trying to convince us both that you aren’t worth it!”</i>");
	output("\n\nYou bite your lip, waiting for Paige’s response. Her eyes begin to water and her own upper lip starts to quiver. Her other hand finds yours, still gripping her first, and trails its way up your arm, hurried and erratic as it crawls up your bicep to your shoulder, then to your neck and face. <i>“[pc.name],”</i> she says, then falls into you, burying her face into your shoulder. Her arm wraps tightly around you, and then she starts sobbing.");

	processTime(5);
	clearMenu();
	addButton(0,"Next",herEyes3);
}

// (scene: Her Eyes 3)
public function herEyes3():void
{
	clearOutput();
	showPaige();
	output("Her sobs are muffled by your " + (!pc.isChestExposed() ? "[pc.upperGarments]" : "body") + ", her grip hard as iron on your hand and the arm locked around your shoulders almost tight enough to be painful. <i>“[pc.name]”</i> she repeats, struggling to maintain her composure. Every time she stiffens up, she promptly collapses into you again.");
	output("\n\nYou remain on her couch for a moment, holding your Ausar lover as she gets everything she needs out of her, out of her. You stroke at her back tenderly as you wait. <i>“This is,”</i> she tries to say, then stops to take a breath. <i>“This is the nicest thing anyone’s ever done for me, [pc.name],”</i> she tells you. <i>“That’s... that’s five hundred thousand credits! Half a million! That’s....”</i>");
	output("\n\n<i>“Please stop reminding me,”</i> you chuckle. <i>“I’m not going to back down, but saying it over and over doesn’t make it easier.”</i>");
	output("\n\nShe laughs cutely between her sniffles. <i>“Right.”</i>");
	output("\n\nYou stay together for a bit longer, waiting for Paige to calm down. It takes her about ten minutes to completely settle, but neither of you break the embrace or the silence: you’ve taken your relationship to some other level now, something that words don’t do justice right at this moment. Well, except one word.");
	output("\n\n<i>“Are we calling this ‘love?’”</i> she asks you. <i>“Is that a strong enough word to be throwing around right now?”</i>");
	output("\n\nYou smile and squeeze her with both hands, one still holding hers and the other around her own shoulders. <i>“What do you think?”</i>");
	output("\n\nShe leans back slightly, her nose against yours. <i>“I’ll show you what I think.”</i> She closes the gap and plants a kiss, right on your lips. Long, lingering, and loving.");
	output("\n\nWhen she pulls away, her familiar, confident smile spreads across her lips. <i>“So I’m worth exactly one million credits, am I, sweet thing?”</i> she asks playfully. <i>“If the surgery was one-million-and-one credits, is that the line?”</i>");
	output("\n\n<i>“Oh, shut up,”</i> you chide.");
	processTime(10);
	pc.lust(5);
	clearMenu();
	addButton(0,"Next",herEyes4);
}

public function herEyes4():void
{
	clearOutput();
	showPaige();
	// Place PC at a lone square called ‘Operating Room Lobby’
	currentLocation = "TAVROS_TEMPO";
	generateMap();
	output("The next morning, you and Paige are in Tavros’s Medical Bay, normally inaccessible to the public, at the waiting lobby for the operating room. The process to pay for Paige’s surgery and get everything in line was surprisingly succinct: Paige did most of the paperwork (which was ironic and sort of cruel, considering) while you just threw money around until you got what you wanted. With the advancements of modern medicine, and with Tavros Station being fairly tame in terms of disease or injuries, there was no wait time: you got started immediately on fixing Paige’s eyes.");
	output("\n\nPaige’s hand hadn’t left yours since you arrived in the bay. She giddily signed her papers and spoke with the nurses and helper droids and she chatted you up all morning, up until the very last step. Knowing that her future, a brighter future, was behind a pair of tightly shut, whitewashed metal doors – doors she could reach out and touch – changed her demeanor entirely.");
	output("\n\nShe had been dragging you by the hand back and forth across the room since they had put you two there. When she sat you both down, she couldn’t sit for a few minutes before she got back up. She had been mostly silent, and she kept shrugging her shoulders and kicking her legs, resetting her clothes.");
	output("\n\n<i>“Nervous?”</i> you ask her.");

	output("\n\n<i>“G-Gods, how can I not be?”</i> she asks back. <i>“[pc.name], I’ve been blind for " + (days + 2414) + " days. I’ve counted. I had been pinching credits to save up for this. I thought I was going to be old and grey by the time I could see again. And it’s....”</i> She stops and approaches the door, resting her hand on its smooth, cool, metal frame. <i>“It’s right there.”</i>");

	output("\n\n<i>“We could call it off, if you’d like,”</i> you snicker.");

	output("\n\n<i>“Don’t even joke!”</i> she spits, but she smiles, knowing you’re just trying to calm her down. <i>“I’ve wanted to look Iddi in his adorable monitor since I first got him. I’ll be able to see the stars again after this! I can go back to photography, or navigation! And,”</i> she says, squeezing your hand and turning to look you in the eyes (or thereabouts), <i>“I’ll be able to look my lovely sponsor in the eye....”</i> She pulls you closer, whispering the last words to you, <i>“and maybe give [pc.himHer] a proper thank-you later.”</i>");

	output("\n\nThe white metal doors hiss and quickly slide open, startling you two. <i>“Miss Paige?”</i> asks a nurse droid, hovering five feet off the ground. Its single lens rotates in its socket as it scans the room for its patient. A second droid accompanies it, equipped with two padded ‘arms’ on its frame for Paige to grasp onto. <i>“We’re ready for you.”</i>");

	output("\n\nPaige stands still, taking a deep breath through her nose and out her mouth. <i>“Okay.”</i> For the first time that day, she lets go of your hand. <i>“[pc.name],”</i> she says, looking over her shoulder as she approaches the droid with arms. She smiles that confident, loving smile at you as she finds the droid with her hand. <i>“I’ll see you later.”</i>");

	output("\n\nShe and the droid walk into the surgery room, leaving you alone in the lobby with the other one. <i>“" + pc.mf("Mister","Miss") + " [pc.name]?”</i> it asks, facing you. You acknowledge it. <i>“Miss Paige’s surgery will take about twelve hours to complete. You’re welcome to wait here in the lobby if you’d like; if you’d instead like to leave, we can message your codex when she’s ready.”</i>");

	output("\n\nYou hum as you consider it.");
	
	var time2Go:Number = 0;
	if(hours < 8) time2Go = (8 - hours) * 60;
	else if(hours > 8) time2Go = 8*60 + (24-hours)*60;
	else time2Go = 50;
	processTime(time2Go);
	//[=Stay=][=Leave=]
	// end scene (scene: Her Eyes 4); advance clock to 08:00; deduct 500,000 credits
	pc.credits -= paigeCost();
	pc.createStatusEffect("PAIGE_COMA_CD");
	pc.setStatusMinutes("PAIGE_COMA_CD",60*30);
	clearMenu();
	addButton(0,"Stay",paigeEyeholeEmailEvent);
	addButton(1,"Leave",leavePaigesEyeholes);
}

//[=Leave=]
// (scene: Her Eyes: Leave)
public function leavePaigesEyeholes():void
{
	clearOutput();
	showPaige();
	pc.createStatusEffect("PAIGE_COMA_EMAIL_CD");
	pc.setStatusMinutes("PAIGE_COMA_EMAIL_CD",60*12);
	output("There are some errands you’d like to get to today. As important as today is for both you and especially Paige, you’re sure she’d understand that you’re not too excited about staying in a room with nothing to do or to entertain you for twelve straight hours. You tell the droid you’ll be leaving.");
	output("\n\n<i>“Very well,”</i> it answers curtly. <i>“Expect a message on your codex when Miss Paige’s surgery has concluded.”</i>");
	output("\n\nYou’ll be sure to.");
	// end scene (scene: Her Eyes: Leave); place PC one square outside Paige’s Unit
	currentLocation = "PAIGE_HOUSE";
	clearMenu();
	addButton(0,"Next",moveSouth);
}

// After twelve hours, play the following message:
// (scene: E-Mail)
public function paigeEyeholeEmailEvent():void
{
	clearOutput();
	showName("SURGERY\nALERT!");
	output("The familiar tone of receiving a new message rings through the air. You bring your codex off your hip, checking who it’s from – it’s from Tavros’ Infirmary!");
	output("\n\n<i>“" + pc.mf("Mister","Miss") + " [pc.name],”</i> it reads, <i>“you’re receiving this message as Miss Paige’s partner and sponsor. We’re happy to report that her surgery to replace her damaged eyes with a synthetic, biologically identical set has been a success.”</i> That’s a relief. And that’s exciting! Paige will be able to see again! <i>“Miss Paige is currently in an induced coma; we request your presence within the next twelve hours to proceed.”</i>");
	//if {PC is on Tavros}
	output("\n\nHell, those twelve hours went by like they were nothing! There’s no time to lose: you need to get to the Medical Bay right now!");
	// if PC is on Tavros, proceed to (scene: Her Eyes 6); if not, do nothing.*/
	clearMenu();
	addButton(0,"Next",herEyes6,true);
}
//[=Stay=]
// (scene: Her Eyes 5)
public function stayForPaigesEyeholes():void
{
	clearOutput();
	showPaige();
	output("Nothing you have in the agenda is as important as making sure you’re here for Paige. You’re fine with waiting the twelve hours here in the medbay. <i>“Are you certain?”</i> the droid asks you, and you confirm. <i>“Very well. You’ll be informed when Miss Paige’s surgery is completed.”</i>");
	output("\n\nThe droid follows Paige into the operating room, and the whitewashed metal doors clank shut, leaving you alone in the waiting room. A red light above the door turns on, letting everyone that sees it know that the room is, in a word, occupied.");
	output("\n\nYou take a seat, getting comfortable in the plain room. There is no music and the few magazines offering off-world fashions and news from the corners of the universe are all outdated by several solar months. The medbay gives you access to the extranet via your codex, but the speeds leave something to be desired; who could survive on twenty paltry gigabytes a second?");
	output("\n\nWell, you’ve made your decision. You settle in for the long haul.");
	output("\n\n...");
	output("\n\n...");
	output("\n\nA few hours pass. You’re getting awfully hungry. There’s a vending machine available, offering some chips, cookies, and fizzy drinks, though none of them look particularly appetizing. You’re tempting to go to the merchant deck for something to eat, but... you decide instead to just fill up on water.");
	output("\n\n...");
	output("\n\n...");
	output("\n\nFunny thing about filling up on water: it makes you pee a lot. You’ve been to the bathroom four times in the space of an hour, now. At least you’re well hydrated.");
	output("\n\n...");
	output("\n\n...");
	output("\n\nYou lounge in your seat and scratch at your groin, your pile of completed magazines slowly building to your right. You check the clock. You’ve been here for five hours.");
	output("\n\nGreat.");
	processTime(5*60);
	clearMenu();
	addButton(0,"Next",herEyes6);
}

// (scene: Her Eyes 6)
public function herEyes6(fromEmail:Boolean = false):void
{
	clearOutput();
	showPaige();
	//if {PC was not on Tavros when they received the message}
	if(fromEmail) 
	{
		currentLocation = "TAVROS_TEMPO";
		generateMap();
		//if {continue here if the PC chose to [=Leave=]}
		output("You rush into the Medical Bay, to the waiting room you had last seen Paige in. She’s not there; it’s barren, except for the nurse droid that spoke with you last. <i>“Where is Paige?”</i> you ask it hurriedly.");
		output("\n\nThe droid turns in your direction, focusing its lens on you, spinning its gears as it gets a good look at your features. <i>“" + pc.mf("Mister","Miss") + " [pc.name],”</i> it begins, <i>“I’m happy to inform you that Miss Paige’s procedure has completed successfully with no complications.”</i> You hunch over, taking in a deep breath and exhaling it as a huge sigh of relief.");
		//if {it has been thirty hours or less since Paige’s surgery began}
		output("<i>“As written in your message, Miss Paige is currently in an induced coma. We are prepared to wake her up on your instruction.”</i>");
	}
	else
	{
		output("You’re not afraid to admit that you fell asleep. What else were you supposed to do for twelve hours? It was difficult at first; you were too anxious over Paige to fall asleep at first, but, you suppose, you exhausted yourself to sleep.");
		output("\n\n<i>“" + pc.mf("Mister","Miss") + " [pc.name]?”</i> you hear a voice call, then a second time, louder. The noise jostles you awake at first, and then, as soon as you’re cognizant, you remember where you are and the situation. You sit up, eyes unfocused, until they find the droid you had spoken to twelve hours ago, its lens facing you.");
		output("\n\n<i>“I’m pleased to inform you,”</i> it begins, not giving you a chance to wake yourself up any further, <i>“that Miss Paige’s procedure has been completed successfully and with no complications.”</i> The news is all you need to hear to pull yourself to your [pc.feet], excited to meet Paige and have her see you for the first time. <i>“She is currently in an induced coma and we are prepared to wake her on your instruction.”</i>");
		output("\n\n<i>“Of course!”</i> you say, <i>“let’s not waste any time!”</i>");
		output("\n\n<i>“As you say.”</i> The droid then begins hovering away from the whitewashed doors. The red light from above it has been turned off. <i>“Miss Paige has been moved to our recovery ward; we can proceed from there.”</i>");
		output("\n\nYou follow the droid eagerly through the white, winding halls of the Medical Bay on Tavros Station. Your focus is only on the little robot as it leads you up several floors and past half a dozen double doors until you get to an area labeled as the ‘recovery ward;’ you peek into the rooms as you pass by, looking for Paige despite the nurse droid moving past them entirely.");
		output("\n\nFinally, it turns once, into one patient’s room. A clipboard filled out with the occupant’s medical information rests on a bin next to the door. And on the bed, undeniably, is your Ausar, Paige.");
	}
	processTime(10);
	//[=Next=]
	// end scene (scene: Her Eyes 6)
	clearMenu();
	addButton(0,"Next",herEyes7);
}

// (scene: Her Eyes 7)

public function herEyes7():void
{
	clearOutput();
	showPaige();
	// if it’s been thirty hours or less, play from here:
	if(pc.hasStatusEffect("PAIGE_COMA_CD"))
	{
		output("The lights in the room are very dim; it’s almost as if the room is candlelit. Paige rests on the hospital bed, sleeping soundly underneath the fresh covers, her arms and upper chest exposed. She’s wearing what appears to be a plain, baby-blue hospital gown – most discerningly, she has several layers of gauze wrapped around her head, pressed tightly against her eyes.");
		output("\n\nStanding next to her bed is who you assume to be the surgeon that had worked on her. The doctor is a petite woman, standing up to Paige’s neck at her tallest; it’s difficult to make out her finer features in the shoddy lighting, other than her neck-length blonde hair and the fact that she’s human. She appears busy with some paperwork when you walk in; when you arrive, she lifts her head and smiles warmly at you.");
		output("\n\n<i>“You must be [pc.name],”</i> she says, her voice lower than you had expected. She reaches out her hand for you to shake, and you do so gladly. <i>“My name is Tilim Hannoway. I’m the ophthalmologist that performed on Paige today.”</i>");
		output("\n\nThere’s a seat next to Paige that you gladly take once you release Hannoway’s hand. <i>“That’s a five dollar word if I’ve ever heard one,”</i> you laugh.");
		output("\n\n<i>“Imagine trying to spell it,”</i> she laughs with you. <i>“I’m happy to inform you that Paige’s operation was a complete success, with no complications at all. Miss Paige had asked us to wait for you before we woke her up, assuming she didn’t wake up herself first.”</i> Hannoway smiles at you sweetly. <i>“She probably wanted you to be the first thing she saw.”</i>");
		output("\n\n<i>“Well, let’s not keep her waiting,”</i> you implore, gesturing to her. <i>“Let’s see those baby blues of hers!”</i>");
		output("\n\n<i>“Of course.”</i> Hannoway reaches for a needle sitting on a tray next to Paige’s bed, full of a clear liquid. With a practiced swing, she removes its cap and sticks it into Paige’s wrist, pressing the plunger. When it’s empty, she removes it and tosses it into a bin mounted on the wall. Then, you wait.");
		output("\n\nYou sit in tense silence, waiting for any sign of consciousness. It takes only a minute for the drug to work: Paige begins to stir, moaning deliriously on her bed, twisting her head from side to side. Her breathing halts for a moment, then she lets out a long sigh. <i>“Hello?”</i> she asks, her mouth dry.");
		output("\n\n<i>“I’m here, Paige,”</i> you say gently, cupping her right hand in yours, stroking it with your thumbs.");
		output("\n\n<i>“Mmmm, [pc.name]?”</i> she asks, her head facing your direction. <i>“Where am I? Why can’t I see you?”</i>");
		output("\n\n<i>“It’s because you have gauze over your eyes.”</i>");
		output("\n\nPaige tentatively raises her left hand, gently feeling at her eyes and trailing her furry fingers over the bandages wrapped around her head. <i>“Checks out.”</i>");
		output("\n\nHannoway steps forward, interrupting you two. <i>“Miss Paige?”</i> she says. <i>“I’m Tilim Hannoway, your ophthalmologist. I’d like to–”</i>");
		output("\n\n<i>“My</i> what<i>?”</i>");
		output("\n\n<i>“I’m... your doctor. I performed your operation today.”</i>");
		output("\n\n<i>“Oh yeah,”</i> she says drolly, <i>“the cute human. Sorry. I’m a little... I’m not all here, yet.”</i>");
		output("\n\n<i>“Thank you for the compliment!”</i> the doctor replies earnestly. <i>“I’d like to inform you that your operation was a complete success. We’ve transplanted your eyes without any complications.”</i>");
		output("\n\n<i>“Wicked.”</i> She leans into her pillow, returning your hand-holding lazily. <i>“Let’s get this thing off of me.”</i>");
		output("\n\nWithout a word, Hannoway reaches for a pair of scissors off the same tray she pulled the syringe. With a little more caution than the needle, she snips off the end of the gauze, then makes half a circle around Paige’s head. When she gets to you, she offers you the end she’s holding. <i>“Care to do the honors?”</i>");
		output("\n\nYou’d love to.");
	}
	// if it’s been thirty-one hours or more, play here
	else
	{
		output("The lights in the room are very dim; it’s almost as if the room is candlelit. Paige rests on the hospital bed, her arms and upper chest exposed. She’s wearing what appears to be a plain, baby-blue hospital gown – most discerningly, she has several layers of gauze wrapped around her head, pressed tightly against her eyes.");
		output("\n\nStanding next to her bed is who you assume to be the surgeon that had worked on her. The doctor is a petite woman, standing up to Paige’s neck at her tallest; it’s difficult to make out her finer features in the shoddy lighting, other than her neck-length blonde hair and the fact that she’s human. She and Paige are busy with some smalltalk by the time you walk in; when you do, she stops immediately and smiles at you warmly.");
		output("\n\n<i>“The guest of the hour is here, Miss Paige,”</i> says the doctor. She extends her hand towards you. <i>“I’m Tilim Hannoway, and I was Miss Paige’s acting ophthalmologist.”</i>");
		output("\n\nYou accept the handshake, but stare at her blankly. <i>“She was my surgeon,”</i> Paige says. <i>“It’s a bit of a five-dollar word, isn’t it, sweet thing?”</i>");
		output("\n\nHannoway laughs. <i>“Spelling it was a bit of a challenge at first,”</i> she admits. <i>“" + pc.mf("Mister","Miss") + " [pc.name], you’ll be glad to hear that the operation on Miss Paige was a complete success; we’ve transplanted her new eyes without any complications.”</i>");
		output("\n\n<i>“Yes, the nurse droid told me,”</i> you say, taking a seat next to Paige’s bed. You find her hand with yours, cupping it gently and stroking it with your thumb. Paige squeezes back lovingly, returning the gesture. <i>“What’s left to do?”</i>");
		output("\n\n<i>“Nothing,”</i> the doctor replies, <i>“other than to remove the gauze. We were just waiting for you to get here.”</i>");
		output("\n\n<i>“Sorry I’m late, then,”</i> you say to Paige as Hannoway reaches for a tray next to the bed, pulling out a pair of scissors. With some caution, she makes one quick snip against the fabric, starting an unraveling line around Paige’s head. Paige herself is calm, and even a little apprehensive, nervous of the results of the surgery.");
		output("\n\nWhen Hannoway gets to you, she offers you the end of the gauze. <i>“Care to do the honors?”</i>");
		output("\n\nYou’d love to.");
	}
	processTime(10);
	clearMenu();
	addButton(0,"Next",theBigMoment);
}

public function theBigMoment():void
{
	clearOutput();
	showPaige();
	output("You release your hold on Paige’s hand and stand next to the bed, slowly and gingerly unwrapping the cloth from Paige’s head. You go slowly, less from dramatic effect and more because you’re sure she must be a little sensitive from the operation. The grip the gauze has on her gets looser with your every orbit around her, until you get to the last layer, and it falls away.");
	output("\n\nYou hand the scissors back to Hannoway and grip onto Paige’s hand once again. There is a large, circular incision going from the bridge of her nose and around both eyes that’s been stitched together. The scar going across both eyes is still there, the fur gone and the tissue scarred. Her eyes are closed, her brown eyelids fluttering lightly – and then, she opens them.");
	output("\n\nBefore, her eyes were bluish-gray and clouded with cataracts, with asymmetrical pupils as a result of her injury. What you see instead are brilliantly blue eyes, with perfectly healthy irises and large, dilated, round pupils. She grunts in pain at first and squeezes her eyes shut – with concentrated effort, she slowly blinks them open, adjusting to the light of the room: even dim as it is, it’s a little much. Her eyes find your hand first, then trail up your arm, then lock onto yours.");
	output("\n\nYou stare at each other for a moment. Paige’s grip on your hand tightens almost painfully as she studies you and your features: from your eyes, to your [pc.lips] and [pc.face], to your eyes, then to your [pc.face] and your [pc.ears], to your eyes, to your [pc.hair] and back to your eyes. She bites her lower lip and chokes out a single, joyful laugh through a pursed smile as her new, young, functional eyes begin to moisten. <i>“Good news,”</i> she says to you and Hannoway as the tears quickly stream unabated down her cheeks, <i>“the tears work.”</i>");
	output("\n\nYou’re content to sit there for as long as she needs, letting her see new things for the first time in a lifetime for her. <i>“You’re blurry,”</i> Paige criticizes, lifting her left hand to your face and watching herself touch your facial features. <i>“Unless that’s just what [pc.race]s look like now.”</i>");
	output("\n\n<i>“Your vision is blurry because your brain is trying to ‘relearn’ how to see,”</i> Hannoway explains. <i>“It’s a skill it’s had to make do without for a very long time, now. Give it a day or two. We’ll be keeping the lights dim until then.”</i>");
	output("\n\n<i>“She’s staying here?”</i> you ask the doctor, keeping your gaze on your Ausar.");
	output("\n\n<i>“Just for another day or two. We still need to do some rudimentary tests – you know, making sure she’s not colorblind or anything. We also need to remove her stitches, of course.”</i> Hannoway steps towards the door, her hands in the pockets of her coat. <i>“I’ll leave you two alone for now; I have some reports to file and I’m sure I’d just ruin the moment.”</i>");
	output("\n\n<i>“Thank you,”</i> Paige says to Hannoway as she leaves. <i>“Thank you!”</i>");
	pc.removeStatusEffect("PAIGE_COMA_CD");
	//[=Next=]
	// end scene (scene: The Big Moment)
	processTime(10);
	clearMenu();
	addButton(0,"Next",theBigMoment2);
}

public function theBigMoment2():void
{
	clearOutput();
	showPaige();
	output("You spend the next twenty-four hours with Paige, easing her into her new sense of vision. You play silly games with each other: you ask her about the shapes and colors of various objects around the room, and you hold up some fingers and ask her how many you’re holding up. You write your name on a piece of paper, then you ask her to write hers. She finds inventive ways to describe your [pc.face] and she ");
	//if {PC has hair}
	if(pc.hasHair()) output("admires how you keep your [pc.hair]");
	else output("jokes about how she can see herself in your hairless head");
	output(". She loves every second of it: she can’t stop smiling or laughing at the smallest or the silliest jokes. When you’re too tired to keep going, you sleep on your chair next to her, resting your head next to her hand.");

	output("\n\nShe passes Hannoway’s follow-up exams easily, picking out her greens from her blues and reds, and her circles from her squares and triangles. Throughout the day, Hannoway turns the brightness up in the room until it’s as bright as the rest of the medbay. Removing the stitches was a simple, quick process, and by the time hour twenty-three rolls around, Paige has Hannoway’s clean bill of health to leave and go back to her unit on the residential deck.");

	output("\n\nYou still have to lead her through the station by hand because she doesn’t recognize where she is, and her muscle memory is thrown off by her sight. She warmly greets nearly everyone she passes, smiling and waving to them, telling them how good they look and wishing them a nice day. She’s quivering in excitement by the time you get her to her unit, excited to see her own housing for the first time – and to see her helper droid.");
	output("\n\n<i>“Iddi?”</i> Paige yells when she walks in, less concerned with the décor and more about her robot. Right on cue, you hear the gentle humming of levitating pulsars from around the corner, and Iddi’s large monitor flits about.");
	output("\n\n<i>“Hello momma!”</i> Iddi greets as usual. Rather than the usual small-talk between Paige and her droid, she lunges forward, wrapping her arms around Iddi’s monitor and hugging it tightly to her chest. <i>“Wow!”</i> Iddi exclaims, its monitor turning bright pink and its eyes turning to small crescents. <i>“This is nice!”</i>");
	output("\n\nPaige pulls away, looking Iddi at its large, pixelated, cartoonish eyes. She begins sniffling, on the verge of crying again, but nothing could break the huge smile on her face. <i>“It sure is, baby,”</i> she says, rubbing her hands along Iddi’s smooth, chrome frame.");
	output("\n\n<i>“Are you okay, momma?”</i> Iddi asks concernedly.");
	output("\n\n<i>“I’ve never been better, Iddi.”</i> She leans in, planting a kiss on Iddi’s frame. <i>“I had my surgery the day before yesterday. I can see you.”</i> She runs a finger along Iddi’s monitor, watching its trail as she goes. <i>“I can see you, Iddi. I’ve waited to see you since the day I got you.”</i>");
	output("\n\nUnexpectedly, Iddi’s eyes arc with pixelated eyebrows, and its background turns a dark blue. Iddi seems... scared, all of a sudden. <i>“Are,”</i> it asks haltingly, <i>“are you gonna get rid of me?”</i>");
	output("\n\n<i>“What?! Of course not!”</i>");
	output("\n\nIddi’s expression doesn’t change, apparently unconvinced. <i>“But you don’t need me anymore.”</i>");
	output("\n\nPaige presses her nose against the glass of Iddi’s monitor, squinting her eyes and taking a softer tone. <i>“Iddi, you’re more to me than a helper droid. Hell, you’re more than a pet, too. It doesn’t matter whether I ‘need’ you or not, sweet thing; you’re a part of my life now, and I wouldn’t give you up for the world. JoyCo doesn’t need to know I’m not blind anymore, and even if they did, I’d like to see them</i> try <i>to take you from me!”</i>");
	output("\n\nIddi’s eyes turn to its usual, happy crescents, and configures its background into repeating hearts of pink and red. Its pulsars thrust up, pressing its metal body against Paige’s. <i>“I love you, momma!”</i>");
	output("\n\n<i>“I love you too, baby,”</i> Paige replies, hugging Iddi tightly. <i>“And if you’re really worried about being ‘useful’ to me, I have a couple ideas on how you can still help around the house.”</i>");
	output("\n\n<i>“Like how?”</i>");
	output("\n\nPaige, in response, turns to you. <i>“Well, I first need to speak with [pc.name].”</i>");
	processTime(60*24);
	clearMenu();
	addButton(0,"Next",theBigMoment3);
}

public function theBigMoment3():void
{
	clearOutput();
	showPaige();
	output("Paige takes a deep breath, in through her nose and out through her mouth, just like she had practiced in yoga. Her gaze is locked onto you, watching your every move and detail, almost like she’s staring you down. <i>“There’s no real way to lead into this, I don’t think,”</i> she says, <i>“so, I’m just going to say it. [pc.name], I want you to take me with you on your crew.”</i>");
	output("\n\nYou tell her that you’d love to.");
	output("\n\n<i>“It’s because I – wait, what?”</i>");
	output("\n\nYou have all the reasons in the known universe to bring Paige onto your ship. She used to be a navigator for Kiro back before her injury, and you could definitely use one. She’s a yoga master, and you could use a fitness instructor onboard to keep you and the rest of your crew in shape. She an expert combatant, capable of bringing down three Black Void pirates by herself. She’s been cooped up in her unit on Tavros for such a long time, she’s probably anxious as anything to get out and start seeing the universe again. And finally... Paige is more to you personally than any of those. You’d love to explore the stars with her by your side.");
	output("\n\nPaige smirks as you list off all the reasons why you’d like to make Paige an addition to your crew. She studies you, noting your sincerity and your body language, appreciating every word that comes out of your mouth. <i>“I see you’ve given this some thought, too.”</i>");
	output("\n\nYou shake your head. <i>“I had my mind made up a while ago. I was going to ask if you weren’t going to offer.”</i> Still, you have some concerns. What about her yoga class? Is she going to close up shop for your sake?");
	output("\n\n<i>“That’s what Iddi’s going to help me with,”</i> she says, patting Iddi on top of its frame before facing its screen. <i>“Momma’s going to go with [pc.name], Iddi. We’re going to explore the stars together. I need you to stay here.”</i>");
	output("\n\n<i>“What will I do, momma?”</i>");
	output("\n\n<i>“You’re going to look after my unit; my yoga studio; and my class, Iddi. Here’s what we’re going to do: I’m going to set up a video stream on [pc.name]’s ship, two-way. I’ll be able to see everything you see, and you’ll be able to see me. That way, no matter where I am in the galaxy, I’ll never be too far away from you, okay?”</i>");
	output("\n\n<i>“That sounds like fun!”</i> Iddi answers, its screen turning green in delight.");
	output("\n\n<i>“That’s right! I’ll still be able to teach yoga through you, Iddi, but you know enough to help my students on your own when I’m busy working with [pc.name]. And I’ll visit you</i> every <i>time we visit Tavros again, okay?”</i>");
	output("\n\n<i>“Okay!”</i>");
	output("\n\n<i>“That’s my baby,”</i> she finishes, planting another kiss on Iddi’s frame. She straightens herself and turns to you once again. <i>“So! All that’s left is for me to pack my things and establish that video stream with Iddi. Is there anything else I should know about before I get started?”</i>");
	//if {PC has at least one crewmate}
	if(crew(true) > 0) 
	{
		output("\n\nOne thing does immediately spring to mind – something you’ve been meaning to talk with Paige about ever since your relationship... escalated. There’s never been a good time to bring it up, and there won’t ever <i>be</i> a good time. You probably won’t get another opportunity to bite the bullet....");
		//[=Promiscuity=][=Stay Silent=][=Next=]
		// end scene (scene: The Big Moment 3); if [=Next=], place PC one square outside of Paige’s Unit and queue (scene: Welcoming); if the PC has no crew, remove the first two buttons and vice versa if the PC has at least one crewmate
		clearMenu();
		addButton(0,"Promiscuity",promiscuityTalkWivPaige);
		addButton(1,"Stay Silent",stayQuietAboutSluttery2Paige);
	}
	else 
	{
		output("\n\nYou rack your mind for a little bit, but you come up blank. You’ve got a big, empty ship, and you’d love to have someone keep you some company on those long flights, as soon as possible. <i>“Alright then!”</i> Paige says, turning towards her room (which takes her a second to find, unused to seeing it with her eyes). <i>“I shouldn’t be too long. I’ll meet you down at the landing bay, [pc.name]!”</i>");
		output("\n\nYou ask her if she knows where it is. <i>“Nope. But I can find it pretty easily, I bet. I want to at least try; one of the big things I’m looking forward to now that I can see again is finding things on my own. Something as little as finding the toilet is its own adventure all over again!”</i>");
		output("\n\nWell, at least she’s excited.");
		clearMenu();
		currentLocation = "PAIGE_HOUSE";
		addButton(0,"Next",moveSouth);
	}
	flags["PAIGE_CREW"] = 1;
	//currentLocation = "PAIGE_HOUSE";
	processTime(20);
}

//[=Promiscuity=]
// (scene: Promiscuity)
public function promiscuityTalkWivPaige():void
{
	clearOutput();
	showPaige();
	output("You tell Paige that you already have some crew onboard your ship, and while you definitely have enough room to support one more, you have certain... obligations to them, as a captain and as a person, that you can’t rightfully deny them just because she’s coming onboard too.");
	output("\n\n<i>“What, are you doin’ them?”</i> she asks, point-blank. You stutter at first, trying to find a way to describe their needs and necessities better than that. <i>“Hah, I was right! To be honest, [pc.name], I was kind of hoping for an open relationship, myself.”</i> She’s taking this a lot better than you thought. To help you relax, Paige massages your shoulder with her left hand. <i>“I don’t really care who you bang, because I know, at the end of the day, even if I’m sharing this,”</i> she accentuates, cupping your [pc.crotch] with her right hand, <i>“nobody else is taking this,”</i> she says, placing her hand over your heart.");
	output("\n\nThat’s true: you don’t have the same connection with the rest of your crew that you do with Paige, and she’s absolutely right. If she’s okay with sharing you, then, you suppose there isn’t a problem. <i>“Besides,”</i> she says huskily, licking her lips as she leans in, whispering, <i>“having a crew full of horny studs and sluts sounds like a good time to me, too.”</i>");
	output("\n\nThat said, Paige pulls away from you, resuming her earlier, energetic disposition. <i>“Alright then!”</i> she says, turning towards her room (which takes her a second to find, unused to seeing it with her eyes). <i>“I shouldn’t be too long. I’ll meet you down at the landing bay, [pc.name]!”</i>");
	output("\n\nYou ask her if she knows where it is. <i>“Nope. But I can find it pretty easily, I bet. I want to at least try; one of the big things I’m looking forward to now that I can see again is finding things on my own. Something as little as finding the toilet is its own adventure all over again!”</i>");

	output("\n\nWell, at least she’s excited.");
	processTime(5);
	flags["PAIGE_CREW"] = 1;
	flags["PAIGE_POLYAMORY"] = 1;
	clearMenu();
	currentLocation = "PAIGE_HOUSE";
	addButton(0,"Next",moveSouth);
}

//[=Stay Silent=]
// (scene: Stay Silent)
public function stayQuietAboutSluttery2Paige():void
{
	clearOutput();
	showPaige();
	output("You know it’s wrong to not let Paige in on what she should expect on your ship, but you honestly can’t find a way to explain your prior obligations to your other crew to her. You’re scared it would break her heart and have her call the whole thing off, but you know she’ll figure it out as soon as she steps on board. <i>“No,”</i> you answer gutlessly.");
	output("\n\n<i>“Alright then!”</i> she says, turning towards her room (which takes her a second to find, unused to seeing it with her eyes). <i>“I shouldn’t be too long. I’ll meet you down at the landing bay, [pc.name]!”</i>");
	output("\n\nYou ask her if she knows where it is. <i>“Nope. But I can find it pretty easily, I bet. I want to at least try; one of the big things I’m looking forward to now that I can see again is finding things on my own. Something as little as finding the toilet is its own adventure all over again!”</i>");
	output("\n\nWell, at least she’s excited.");
	flags["PAIGE_POLYAMORY"] = -1;
	// end both scenes here; add Paige as a crewmate
	flags["PAIGE_CREW"] = 1;
	clearMenu();
	currentLocation = "PAIGE_HOUSE";
	addButton(0,"Next",moveSouth);
}

// if the PC attempts to enter Paige’s Unit after Paige is made a crewmate, between the hours of 09:00 and 17:00
// (scene: Tavros (Crewmate) – Busy Hours)
public function paigeUnitAsCrewmate():void
{
	clearOutput();
	showPaige();
	output("You step into Paige’s unit. Everything is exactly as she left it when she was made your ship’s navigator.");
	output("\n\nPaige is there, lounging on her couch and enjoying her shore-leave from your ship. Despite the constant travelling to new and exotic lands, there is, after all, no place like home. Her helper droid, Iddi, sits on its charging dock in the next room.");
	output("\n\n<i>“Hey there, [pc.name]!”</i> she says, waving you in. You mock-frown at her, putting your hands on your [pc.hips]. <i>“Hey we’re not on any ship, I ain’t calling you ‘captain’ anything when we’re in my own house.”</i> She laughs and sits up, patting the seat next to her. <i>“Come on in, let’s burn some candlelight before we leave again. I could use the company!”</i>");
	processTime(4);
	//[=About Paige=][=About Iddi=][=Her Eyes=][=Appearance=][=Yoga=][=Sex=] [=Rest=][=Spar=][=Leave=]
	paigeMenu();
}

// The PC boards their ship for the first time since Paige joined as a crewmate
// (scene: Welcoming)
public function firstTimePaigeCrewHiHi():void
{
	clearOutput();
	showPaige();
	// Continue here if the PC has any other crew
	if(crew(true) > 0)
	{
		output("The first thing to greet you when you step onto your ship is Paige, walking casually up to you with a bit of a sashay in her hips. It’s good to see that she found the place just fine");
		if(silly) output(", although you wonder how she got here before you. Eh, fuck it");
		output(".");
		//if {PC chose to [=Stay Silent=]}
		if(flags["PAIGE_POLYAMORY"] == -1) output(" <i>“You didn’t tell me you had any other crew on this ship,”</i> she starts. You were dreading this conversation, although Paige seems to have a fairly casual tone to her voice.");
		else if(flags["PAIGE_POLYAMORY"] == 1) output(" <i>“I had the chance to meet some of your other crew,”</i> she starts. You’re curious to hear what she thinks about the rest of your merry bunch. <i>“You’ve sure got a... unique taste in company. Present company included, I suppose.”</i>");

		if(annoIsCrew()) output("\n\n<i>“I see I’m not the first Ausar to catch your fancy. I mean, damn, I can see why: the first thing I see when I step foot on this ship is a bombshell like Anno? You sure know how to pick them, stud! I wonder if she’d be down for a little bit of extra fun on the side.”</i>");
		if(bessIsCrew()) 
		{
			output("\n\n<i>“Your robo-buddy seems pretty cool. I gotta admit, I never really thought of the logistics behind a sexbot. ");
			if(bess.mf("","Bess") == "Bess") output("If you slapped Bess’s ass, would it jiggle? Or is it as tight as mine?");
			else output("When Ben gets hard, does it fill with, like, oil? Or air? Or is it all hydraulics?");
			output("”</i>");
		}
		if(celiseIsCrew()) output("\n\n<i>“That Galotian of yours is pretty bubbly. I’m not gonna judge you on your sense of character – after all, you chose me, and I’m pretty great – but I kinda wonder what Celise’s story is. Is she a pet? Is she, like, some kind of master gunner or something under that liquid exterior?”</i>");

		//if {Nova, and PC is not currently wearing her}
		if(gooArmorIsCrew()) 
		{
			output("\n\n<i>“Your gray-goo, uh, companion is... she’s awfully forward. I love a good hug as much as the next gal, but funny thing about goo people is that their hugs are kinda... full-body. And she’s got enough ‘material’ to make it a whole other experience, if you get me.");
			if(celiseIsCrew()) output(" Speaking of, you got something for goo girls or what? All that malleability is pretty hot, for sure.");
			output("”</i>");
		}
		if(pexigaIsCrew()) output("\n\n<i>“I’m a little, um, concerned about that albino pexiga you got on board. Don’t get me wrong, I’m a fan of some big ole’ titties myself, but the way she talks is like she isn’t quite all there. I’m assuming she’s some kind of rescue case and not something a little more</i> sinister <i>on your part.”</i>");
		if(reahaIsCrew()) output("\n\n<i>“The human with the big boobs is a bit of a firecracker, isn’t she? I kinda had Reaha pegged for a dumb pushover at first, but if you can get past the temper, she’s actually pretty smart. She gave me some sob story about her being a slave before you bought her contract? She seems to like being with you, so that’s pretty sweet, I guess. Also, I</i> love <i>her hair.”</i>");
		if(seraIsCrew()) 
		{
			output("\n\n<i>“I met that demon-thing you keep in a collar. No way would a girl like</i> that <i>ever agree to call someone else ‘captain,’ ");
			//if {Sera isn’t broken}
			if(flags["SERA_OBEDIENCE_MIN"] <= 0) output("and it looks like there’s still a bit of fight in her. Hell, [pc.name], I love a good challenge; if you need help showing her who’s the boss, I can lend a hand!");
			else output("but it looks like you’ve got things pretty under control. It’s clear she’s smitten with you, and she’s so well-spoken! I kind of wish I was here to see what sort of hoops you had to go through to break her in like that.");
			if(sera.hasCock()) output(" She’s got a pretty juicy dick, too, not gonna lie.");
			output("”</i>");
		}
		if(yammiIsCrew()) output("\n\n<i>“I have no idea what Yammi even is. I hope that’s not speciesist. She seems cool; apparently she’s onboard as your chef? And she and the pexiga are a part of a package somehow? I’ll have to ask her again for the details. She makes one</i> hell <i>of an ice cream, though. I wonder what her secret is.”</i>");

		// continue here if the PC chose to [=Stay Silent=]
		if(flags["PAIGE_POLYAMORY"] == -1)
		{
			output("\n\nYou’re utterly confused; you don’t know whether she’s being earnest and her reaction to your eclectic crew is completely casual, or if she’s feigning some kind of bubbling rage. You sheepishly apologize for not telling her about your crew earlier.");
			output("\n\n<i>“Why didn’t you?”</i>");
			output("\n\nYou admit that you weren’t sure how she would take sharing the ship with a crew that had certain... <i>requirements</i> as yours. You have... <i>obligations</i> as this ship’s captain, and you weren’t sure how to explain that to her. Hell, you still don’t.");
			output("\n\n<i>“‘Obligations?’ Hah! That’s a pretty vague way of saying you fuck most of them, if not all of them.”</i> You say nothing. <i>“Hey, don’t worry about it, [pc.name]! Look, I’m going to be totally honest with you: I was kind of hoping for an open relationship myself.”</i>");
			output("\n\nThat takes you by surprise. Paige never gave you any hint of the sort. <i>“Because I was worried how</i> you <i>were going to take it! A thing as sweet as you, [pc.name], I wasn’t sure if you were the type to be so... active!”</i> She approaches you, wrapping an arm around your shoulder. <i>“It’s fine with me, [pc.name], because I feel safe knowing that, even if I have to share this,”</i> she says, cupping your [pc.crotch] with her other hand, <i>“nobody else is taking this,”</i> she says, placing her hand over your heart.");
			output("\n\nYou’re relieved to hear that she’s not only okay with it, but she’s practically encouraging it. <i>“Well, I should hope so.”</i> She leans in, breathing hotly into your ear as she whispers, <i>“A ship full of horny studs and sluts sounds like a fun time to me, too.”</i>");
			flags["PAIGE_POLYAMORY"] = 2;
		}
		// continue here if the PC chose to admit their [=Promiscuity=]
		else if(flags["PAIGE_POLYAMORY"] == 1)
		{
			output("\n\n<i>“All-in-all, a pretty swarthy bunch you’ve got so far. And I doubt it’s going to stay this small for long, you charmer.”</i>");
			output("\n\nYou smile, glad to hear that Paige seems to be getting along just fine with the rest of her crewmates. <i>“I’m sure we’ll be doing more than ‘getting along,’ knowing the two of us,”</i> she smiles toothily. <i>“I’ve been chaste all those years before I met you, [pc.name], and if you’re going to be fucking just anybody on this crew, I’m sure as shit not going to be twiddling my thumbs in my room.”</i>");
			output("\n\nYou ask her politely to not... break any of them. Paige can be very competitive in bed and you’re not sure how well the others can keep up. <i>“I promise nothing.”</i>");
		}
		// Merge here
		output("\n\nShe claps her hands together, straightening her stance and taking a more professional demeanor. <i>“Now then, Captain Steele,”</i> she says, standing straight, trying to look stern and disciplined but her goofy smile and wagging tail give her away. <i>“Where are my quarters? I have some things I need to be setting up.”</i>");
		
		output("\n\n(<b>Paige has joined your crew!</b>)");
		
	}
	// Continue here if the PC has no other crew
	else
	{
		output("The first thing to greet you when you step onto your ship is Paige, walking casually up to you with a bit of a sashay in her hips. It’s good to see that she found the place just fine");
		if(silly) output(", although you wonder how she got here before you. Eh, fuck it");
		output(". <i>“Is it just the two of us?”</i> she asks you, looking you in the eye.");

		output("\n\nYou tell her that, at the moment, yes, it’s just you two. You realize that you’re hardly much of a ‘captain’ when you have no crew to lead, but, on the bright side, not only do you have the hunk of junk to yourselves, but Paige also has seniority rights to any quarters she wants. <i>“Even yours?”</i> she asks, then continues, <i>“I’m sure I’ll be spending a lot of time in yours either way.”</i>");
		output("\n\nYou laugh, then take the time to show her around the ship. It’s not much of a ship, and it’s not much of a tour: the crew quarters; the mess; the cargo hold; the bridge; and, finally, the captain’s quarters. Paige is respectfully silent through the tour until the end. <i>“She’s a fine ship,”</i> she says.");
		output("\n\n<i>“You don’t have to lie,”</i> you retort, smirking at her.");
		output("\n\n<i>“Well... I’ve been on worse ships,”</i> she giggles. <i>“It’s certainly spacious enough; I have a few ideas on how to manage my own quarters to keep up my yoga with Iddi. And we don’t seem to be using the cargo hold for a lot. Maybe I can turn it into a gym or something.”</i> She turns to you, smiling giddily. <i>“With your permission, of course, Captain Steele.”</i>");
		output("\n\nCaptain Steele. You kind of like the sound of that. <i>“I already know where I’m setting up,”</i> she continues, standing at attention, trying to look stern and disciplined but her goofy smile and wagging tail give her away. <i>“Permission to start making myself at home. " + pc.mf("Sir","Ma’am") + "?”</i>");
		output("\n\nYou ask Paige if this is going to be a regular thing between you two. <i>“Nah,”</i> she laughs, relaxing and stepping away from you, towards the quarters she’d already picked out for herself.");
		
		output("\n\n(<b>Paige has joined your crew!</b>)");
	}
	//[=Next=]
	// end scene (scene: Welcoming)
	processTime(10);
	flags["PAIGE_SHIP_GREETING"] = 1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}


public function paigeShipBonusText(btnSlot:int = 0, showBlurb:Boolean = true):String
{
	var desc:String = "";
	
	desc += "\n\nPaige mostly keeps to her room when not helping you navigate the starways.";
	
	addButton(btnSlot,"Paige",paigeCrewApproach);
	
	return (showBlurb ? desc : "");
}
// The PC talks to Paige on their ship between the hours of 09:00 and 17:00
// (scene: Crewmate Paige: Class Hours)
public function paigeCrewApproach():void
{
	clearOutput();
	showPaige();
	if(hours >= 9 && hours < 17)
	{
		//sex hook!
		if(flags["PAIGE_TALK_SELF"] != undefined && flags["PAIGE_TALK_SELF"] >= 4 && flags["SEXED_PAIGE"] == undefined) 
		{
			paigeSexPrologue();
			return;
		}
		output("You approach Paige’s quarters and knock on her door. You can hear her talking softly to someone through the metal of her walls. With a hiss, the door slides open, showing you into her personal quarters.");
		output("\n\n<i>“Raise your leg a little higher, and keep it straight,”</i> Paige says to a video feed on a small, free-standing monitor she set up against a wall. She looks over her shoulder, and when she sees it’s you, goes back to the screen. <i>“Iddi, I’ve got some company. Keep watch over the class for me, would you?”</i>");
		output("\n\n<i>“Yes, momma!”</i> you hear Iddi’s voice, garbled slightly through the speakers of her monitor.");
		output("\n\n<i>“That’s my babe,”</i> she says, then presses a button on her monitor, turning it off. With that out of the way, she turns to face you, standing straight. She’s wearing her usual yoga attire and she’s panting lightly from exertion; she must have been leading her class through the exercises via Iddi.");
		output("\n\n<i>“Captain!”</i> she says, reaching out to you and wrapping her arm around your shoulder warmly. <i>“It’s good to see you today. What can I do for you?”</i>");
		//[=About Paige=][=About Iddi=][=Her Eyes=][=Appearance=][=Yoga=][=Sex=] [=Spar=][=Leave=]
	}
	// The PC talks to Paige on their ship between the hours of 17:01 and 08:59
	else
	{
		// (scene: Crewmate Paige: After Hours)
		output("You approach Paige’s quarters and knock on her door. <i>“Yep, come on in!”</i> you hear her shout through the thin metal of her walls. With a hiss, the door slides open, showing you into her personal quarters.");
		output("\n\nPaige is lounging on her bed, relaxing with a book in her hands. She lifts her studying eyes from its pages to yours when you enter, and when she sees it’s you, she slides the book beneath her bed and stands up. You lean to one side, trying to see how many books she’s got under there – you can’t tell exactly, but it’s more than a handful. <i>“Captain!”</i> she says jovially, standing straight and at attention in your presence. <i>“It’s good to see you today. What can I do for you?”</i>");
		//[=About Paige=][=About Iddi=][=Her Eyes=][=Appearance=][=Yoga=][=Sex=] [=Spar=][=Leave=]
	}
	processTime(2);
	paigeMenu();
}

//[=Her Eyes=]
// (scene: Crewmate: Her Eyes)
public function crewPaigeEyeholes():void
{
	clearOutput();
	showPaige();
	output("You ask Paige how her new eyes. How is she enjoying them?");
	output("\n\nThe question hits her a little harder than you expected, and she slowly begins to tear up as a warm, elated smile spreads across her lips. <i>“I try not to think about it,”</i> she laughs, <i>“because then I start crying like a little girl over how happy I am. [pc.name], I really can’t thank you enough. You’ve... you’ve changed my life.”</i>");
	output("\n\nYou don’t try to play it humbly, knowing that downplaying it would be downplaying what having her eyesight back means to her. You say nothing as Paige’s hand reaches for your own, squeezing it tightly. <i>“I was convinced I was going to stay blind until I was old. I had accepted it. I was willing to work for it. And you... Gods above, like a guardian angel, straight out of a storybook, you come along and you make me feel like the luckiest Ausar in the universe. You’d think being a pirate for a stint would have given me terrible karma, but, here you are.”</i>");
	output("\n\nShe gets out of her seat and leans into you, placing her lips against your own gently. It’s a purely chaste, asexual kiss, and you respond in kind, stroking down her side as you enjoy the intimacy. <i>“I had my future all planned out,”</i> she says when she pulls away. <i>“I was going to sit still for decades on end until I could see again. I have no idea what the future holds for either of us, [pc.name], and I love that. I</i> love <i>that. Not knowing what’s ahead; not knowing where we’ll be in a year, or a month, or even next week. But one thing I know is that,”</i> she finishes, squeezing your hand even tighter, <i>“wherever we’ll be, I’ll be with you.”</i>");
	output("\n\nYou enjoy the warmth of the room together for a moment, sitting still and holding hands in the silence of her quarters. <i>“To answer your question,”</i> she says suddenly, back to her regular, upbeat self, <i>“my eyes are great! I’m not going colorblind; they aren’t unfocused or anything; it’s as if I never lost them to begin with. I love that they’re</i> mine, <i>too. Grown in a tube somewhere, but with my stem cells, so they’re</i> mine <i>and not a donor’s, or some copper and metal fake eyes, or anything. They’re working great!”</i>");

	output("\n\nYou’re glad to hear that.");
	// end scene (scene: Crewmate: Her Eyes)
	processTime(5);
	clearMenu();
	addButton(0,"Next",backToPaigeMenu);
}

//CUE HARDMODE GAINS
public function hardmodePaigePerkGain():void
{
	// Play this whenever the PC unlocks the perk
	clearOutput();
	output("You walk away from Paige’s after yet another intense session. They’ve been getting easier and easier lately: your limbs move with a different sort of fluidity since you’ve started, and your body feels very flexible and loose. You wonder if this sort of limberness could be applied to anything else in your everyday life....");
	output("\n\n<b>New Perk Unlocked: Limber:</b> you have an additional 20% chance to escape all grapples! You must perform Hard yoga with Paige every now and again to maintain this perk.");
	pc.createPerk("Limber",0,0,0,0,"Grants an addition 20% chance to escape from grapples!");
	pc.createStatusEffect("LimberTime");
	pc.setStatusMinutes("LimberTime",24*60*14);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
// Play this if the PC neglects their yoga and loses the perk
public function paigeLimberRemove():void
{
	clearOutput();
	output("You hadn’t noticed, but your limbs have slowly begun to ache and stiffen over time. It’s not uncomfortable to move around or anything, but the flexibility you’ve had before seems to be out of your reach now.");
 	output("\n\nYou’ve neglected your yoga sessions with Paige, <b>and you’ve lost the Limber perk.</b> A few more sessions with her should set you straight again.");
 	pc.removePerk("Limber");
 	clearMenu();
 	addButton(0,"Next",mainGameMenu);
}