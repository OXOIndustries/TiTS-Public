// Whenever the PC encounters Kiro at a bar, and after the PC has had sex with Paige and has gained Kiro’s trust, display the following button and tooltip:

//[=Paige=]
// Tooltip: The Ausar yoga instructor Paige once told you that she considers Kiro to be her closest friend. Maybe you should ask Kiro if the name sounds familiar to her?
// If Paige is blind, display this button only if Kiro is at Tavros, and only between the hours of 17:01 and 08:59. Otherwise, display it wherever she can be found at a bar, at any time.
// (scene: Intro)

public function showPaigeAndKiro(nude:Boolean = false):void
{
	if(rand(2) == 0)
	{
		showName("KIRO\n& PAIGE");	
		showBust(kiroBustDisplay(nude),getPaigeBustString(nude));
	}
	else
	{
		showName("PAIGE\n& KIRO");
		showBust(getPaigeBustString(nude),kiroBustDisplay(nude));
	}
}

public function paigeThreesomeIntro():void
{
	clearOutput();
	showKiro();
	author("B!");
	// Continue from here if this is the first time the PC chooses this option.
	if(flags["PAIGE_KIRO_THREESOMES"] == undefined)
	{
		output("You take a seat next to Kiro. She’s already got a mug half-downed in her hand, and when you take your spot, she takes a hearty swig of it. <i>“Well come on,”</i> she says playfully, nudging you in the shoulder. <i>“You gonna have a drink or what?”</i>");
		output("\n\nYou smile at her question and nudge her back. You don’t order a drink from the bar; your mind is instead focused on your Ausar yoga instructor, Paige, and what she told you about her past. She and Kiro were once close friends and ‘coworkers;’ you’re curious if Kiro’s been keeping up with Paige ever since their last job together. You lean over to Kiro and ask if the name ‘Paige’ sounds familiar to her.");
		output("\n\nFor Kiro’s part, her face keeps slate still and she doesn’t outwardly react to your question. She masks her face with her beer, taking in another mouthful before acknowledging you. <i>“The Ausar that runs the yoga studio, right?”</i> she asks, her eyes on yours. Her body language is watery and smooth, making sure you can’t get a read on her. <i>“I’ve heard the name, but I’m not familiar with the woman, if that’s what you’re asking.”</i>");
		output("\n\nYou raise an eyebrow, and you’re about to respond questioningly, when Kiro wiggles her eyebrows at you, and then glances toward the crowd in the bar. You get the message: Kiro may not care so much about her own reputation, whatever it is, but she’s trying to protect Paige’s.");
		output("\n\nYou motion to the barkeep and ask him for a pen and paper. An unusual request, in the age of codices and artificial intelligences, but the barkeep complies; he graciously gives you a pen and a bit of receipt paper with nothing printed on it.");
		output("\n\n<i>That’s not what Paige told me,</i> you write down, and you pass it to her. Kiro snatches the paper from your hand and reads the sentence once, then crumples the paper into a ball; at the same time, she grips the handle of her mug and chugs the rest of the entire thing, in a single, deep breath.");
		output("\n\n<i>“Well, " + pc.mf("stud","slut") + ", it’s your lucky night,”</i> Kiro says suddenly, and just loudly enough that the patrons around you both could hear her. Her body sidles closer to yours; she deposits the crumpled paper into her empty mug, and then her hand travels down your side until it gropes at your [pc.thigh]. You can smell the stink of her beer on her breath. <i>“You’re hot, and I’m drunk and horny. You gonna invite me back to your apartment, or your ship, or whatever? I can make it worth your while.”</i>");
		output("\n\nShe winks at you");
		if(pc.IQ() <= 15) output(". You wink back – it’s only friendly, after all! When Kiro tilts her head inquisitively, you realize that you have erred and that she was asking for you to do something. Unsure of what you should say, you fly by the seat of your pants, and y");
		else output(", but it’s not a sultry, ‘let’s fuck’ kind of wink – the way her face is frozen in serious stoicism, it’s more of a ‘follow my lead’ kind of wink. Y");
		output("ou respond that you’d love to.");

		output("\n\nKiro grips onto your hand tightly and yanks you off the stool you just sat down in. Despite her trying to keep up appearances (or it might also be a part of the act), she’s really excited. <i>“Lead the way, [pc.name],”</i> she says, even though she’s the one leading you out of the bar.");
	}
	// Continue from here for subsequent sexy threesome times
	else
	{
		output("You take a seat next to Kiro. She’s her usual, jovial self, already halfway deep into her drink. Judging from her demeanor, this is probably her first drink, and she’s not drunk at all yet.");
		output("\n\n<i>“I think I’d rather get out of here,”</i> you answer her, swatting her on the arm to get her attention. <i>“You and I have a mutual friend that would like to see you again.”</i>");
		output("\n\nKiro smiles warmly, then raises a finger at you, telling you to wait a moment. In another impressive display of being able to hold her alcohol, she tips her heavy mug to her lips and chugs the entire thing in a hurry, her throat working overtime to accommodate all the fizzy beer. When she’s done, she slams her mug down and wipes the frothy moustache from her face. <i>“Better not keep them waiting then, don’t you think, [pc.name]?”</i>");
		output("\n\nWith some excitement, she grips onto your arm and leads you out of the bar. She knows the drill by now, and where your ship is docked – you’ll be having a visit with Paige in just a few minutes, now.");
	}
	//[=Next=]
	// end scene (scene: Intro); go to (scene: Intro 2)
	processTime(10);
	clearMenu();
	addButton(0,"Next",kiroPaigeIntro2);
}

// (scene: Intro 2)
public function kiroPaigeIntro2():void
{
	clearOutput();
	showKiro();
	author("B!");
	// continue here if it’s subsequent sexy times
	if(flags["PAIGE_KIRO_THREESOMES"] != undefined)
	{
		output("You and Kiro are familiar with the routine at this point: you both head down to your ship");
		if(paigeBlind()) output(", and you leave her there while you run back to Paige’s apartment unit and walk her back");
		else output(", and you head straight to your personal quarters and call Paige to join you");
		output(". At this point, it’s not really a surprise for any of the three of you, and it doesn’t take any convincing at all to get Paige into the mood when Kiro is around.");
		output("\n\n<i>“It’s nice catching up, you know?”</i> Kiro asks, making small talk on the elevator as you ride it down. <i>“I mean, sure, the sex is great and all. But I adore Paige, and it’s a relief that she’s being looked after by someone like you. If I weren’t still in the game, I’d convince her to stay with me and Kally.”</i>");
		output("\n\nYou tell her that you understand; it’s nice to get back together with old friends now and again, and although she and Paige have an... exploratory relationship, it’s always nice to just sit down and catch up sometimes.");
		
		// Continue here if Paige is blind
		if(!paigeIsCrew())
		{
			output("\n\nYou arrive at your ship, and you settle Kiro into your personal quarters. She begins to lounge, making herself at home, as you make your way back through Tavros and all the way back to Paige’s unit.");
			output("\n\nIt’s a bit of a routine: you get to the door; Iddi lets you in and hollers for his momma; you tell Paige that you have a guest waiting for her in the hangar; and then that sly, sultry grin spreads across her mouth as she tells you to wait so she can get dressed. When you had first done this, Paige was apprehensive as could be and was trying to shy her face away from any onlookers that could be nearby; now, she’s... no less reserved, but she’s definitely got a bit more spring in her step, knowing exactly what’s in the books up ahead.");
			output("\n\nThe trip back to your ship is uneventful, and when you show yourself into your quarters, there is Kiro, looking exactly as proper as you left her. She’s entertaining herself with her codex and with some errant notepads you had scattered around your quarters; as soon as her eyes fall on Paige, she drops everything.");
			output("\n\n<i>“Heya, Bookworm,”</i> Kiro says delightedly, standing and gripping Paige by the wrist, dragging you both into the room. You make sure to lock the door behind you.");
			showPaigeAndKiro();
		}
		// Continue here if Paige can see
		else
		{
			output("\n\nYou arrive at your ship, and you settle Kiro into your personal quarters. Once you’re both comfortable, you reach for your ship’s intercom and dial up the speaker connected to Paige’s quarters. <i>“Navigator Paige,”</i> you say, lowering your voice to take on a commanding, not-a-suggestion tone, <i>“to your captain’s personal quarters, please.”</i>");
			output("\n\nPaige dials you back immediately. <i>“On my way,”</i> she says, curtly and professionally. Then, she leans into her microphone, her own voice lowering to a more sultry, lustful tone, <i>“and ready as ever.”</i>");
			output("\n\nSeconds later, there’s a hard knock on your door. You don’t tell Paige to enter; she shows herself in. When her eyes meet Kiro’s, both their mouths split into knowing, playful grins.");
			output("\n\n<i>“Hey again, Bookworm,”</i> says Kiro playfully, her bushy tail swishing as Paige locks the door behind her.");
			showPaigeAndKiro();
		}
		//[=Next=]
		// end scene (scene: Intro 2); go to (scene: Main Menu)
	}
	// Continue here if it’s the first time
	else
	{
		output("You make it to the elevator, Kiro’s grip tight on your wrist, and she presses the button to bring you to the hangar. You’re alone in the metal tube as it whirrs and begins to descend.");
		output("\n\n<i>“Paige got out of the game for a reason,”</i> Kiro explains, confident that her voice won’t travel beyond the elevator. <i>“Sorry for the games, but I can’t have anyone know that we’re associated, for her sake.”</i>");
		output("\n\nYou tell her that it’s alright, and that you understand.");
		output("\n\n<i>“How much has she told you?”</i> You relay an abridged version of what Paige told you: that she and Kiro were close friends growing up; that they were both partners in crime; and that Paige received her injury while ‘on the job.’ After that, she took a bunch of gene mods to disguise herself and opened a modest yoga studio to pay the bills.");
		output("\n\n<i>“That’s about the short of it, yeah,”</i> Kiro says – she’s rocking on her heels and toes and her hands can’t seem to find a comfortable spot on her body. She can’t help but smile as she remembers her Ausar friend, and her eyes keep going from the steel doors of the elevator to you. She’s suddenly quite giddy. <i>“Wow, small universe, huh? I almost can’t believe it! My angel and my best friend growing up know each other!”</i> You smile at her, but say nothing – and she takes it as an admission. <i>“Lemme guess, Steele: you’re a</i> little <i>more familiar with each other than that, am I right?”</i>");
		output("\n\nYou don’t deny it, and instead ask if Kiro could blame you. <i>“You?”</i> she asks, then leans back, scanning your form. <i>“If you were some slut that I picked up at a bar that happened to do yoga on the side, I’d be a little more concerned. Not just for Paige’s safety, but because she could do so much better than just some slut.”</i>");
		output("\n\nShe wraps her arm around your shoulders, pulling you closer to her and pressing her cheek against yours. <i>“But you’re no slut. Well, I mean, you get around, but I’m okay with that, and knowing Paige, she’s okay with that too. You’re one of the good ones, Steele.”</i> Kiro turns her head, and her tongue slides out, drawing a fat lick across your neck. <i>“And, knowing Paige, she wouldn’t mind sharing.”</i>");

		// Continue here if Paige is blind
		if(!paigeIsCrew())
		{
			output("\n\nWhen you arrive at the hangar, you show Kiro into your [pc.ship], and you show her to your personal quarters. You tell her to make herself at home; Paige isn’t here, and you have to go get her. <i>“I’ll be waiting, angel,”</i> she says, her eyes roving around the walls of your room. <i>“I’ll try to keep myself from getting</i> too <i>ready.”</i>");
			// end scene (scene: Intro 2); go to (scene: Intro 3)
			processTime(10);
			clearMenu();
			addButton(0,"Next",kiroPaigeIntro3);
			return;
		}
		// Continue here if Paige can see
		else
		{
			output("\n\nWhen you arrive at the hangar, you show Kiro into your [pc.ship], and you lead her by the hand towards your personal quarters. You explain that you and Paige are more ‘familiar with each other’ than Kiro had guessed: you had convinced her to join your crew as a navigator.");
			output("\n\n<i>“How’d you do that?”</i> she asks incredulously. <i>“Last I heard, Paige was blind. How’s she gonna navigate with no eyesight?”</i>");
			output("\n\nYou reply that you had paid for Paige’s surgery and that she joined your crew in part to pay you back, and in part because she wanted to be with you.");
			output("\n\n<i>“What the hell?”</i> Kiro asks, her breath catching in her throat. <i>“Didn’t she say that surgery would cost her a million credits or something?”</i>");
			output("\n\n<i>“Half a million,”</i> you correct her. You show Kiro into your personal quarters and wave your hand to the room, allowing her to sit whenever she likes. As you do, you reach for the ship’s intercom, and dial up Paige’s quarters. <i>“Navigator Paige, please come to my personal quarters,”</i> you say into the ship’s microphone.");
			output("\n\n<i>“On my way, captain!”</i> Paige replies seconds later.");
			output("\n\n<i>“Feel free to ask her yourself,”</i> you say as you take your own seat, at a small desk in the corner of the room, next to Kiro on your bed. The seconds pass by palpably – Kiro’s hands fidget on her lap, and her lips quiver with excitement. She’s very eager to meet Paige again.");
			output("\n\nThen, there’s a knock on your door, the sound of knuckles against the metal reverberating through the cold hallway of the ship. It swings open without your invitation; on the other side is Paige, your Ausar navigator.");
			output("\n\n<i>“Captain?”</i> asks Paige, her eyes scanning the room as she enters – until her eyes meet Kiro’s.");
			output("\n\n<i>“Uh,”</i> Kiro stutters, at a loss for words – a rarity for her. <i>“Hey there, Bookworm.”</i>");
			showPaigeAndKiro();
			//[=Next=]
			// end scene (scene: Intro 2); go to (scene: Main Menu)
		}
	}
	processTime(15);
	clearMenu();
	addButton(0,"Next",paigeKiroMainMenu);
}

// (scene: Intro 3)
public function kiroPaigeIntro3():void
{
	clearOutput();
	showPaige();
	author("B!");
	output("With Kiro’s blessing, you leave the ship and begin the long relay back to Paige’s unit. It’s not a long journey, but knowing that you’re about to reunite two close friends has gotten your Good Samaritan blood pumping – ");
	if(pc.isNice()) output("and, sheepishly, you admit to yourself that you might be getting a little excited at the thought of having them both at once");
	else output("and, to be honest with yourself, you’d be surprised if the night ended without things getting a little hot");
	output(". Kiro’s already all for it. You doubt it would be hard to convince Paige.");

	output("\n\nYou press the doorbell when you arrive at Paige’s door. The thick, opaque glass clears for a moment as Iddi, Paige’s assistant droid, answers the door and lets you in. <i>“Mama!”</i> Iddi hollers, getting your Ausar lover’s attention. <i>“It’s [pc.name]!”</i>");

	output("\n\nPaige is with you in a moment, all smiles as you return to her. You give her a hug and a kiss, your arms wrapping around her waist and interlocking just above her tail. You tell her that you have a surprise for her.");

	output("\n\nPaige hums in thought at the announcement, her lips curling wryly. <i>“I’m not usually a fan of surprises,”</i> she says, her eyes turning to crescents under her smiling cheeks. <i>“But with you, I think I’ll make an exception. Just for you.”</i>");

	output("\n\nYou tell her that it’s not here – it’s on your ship, and you two have to go to the hangar. <i>“Oh,”</i> Paige says, her expression dropping. <i>“Uh, I don’t suppose you could bring it here? ");
	if(paigeBlind()) output("I... don’t usually leave my unit or my studio unless it’s important.");
	else output("I do try to maintain a low profile.");
	output("”</i>");

	output("\n\nYou suggest that it’s <i>very</i> important, but Paige really should go to the ship; you don’t think you could bring it here. She purses her lips in thought, her clouded eyes on yours studiously. <i>“Okay,”</i> she says, after much internal deliberation. <i>“I trust you, [pc.name]. If it’s from you, and you say it’s important... I’ll trust you on this one.”</i>");

	output("\n\nPaige takes another few minutes to get dressed, and when she’s presentable, you lead her by the hand through the residential deck, and then to the Tavros hangar. Although Paige walks upright and with a confident stride");
	if(paigeBlind()) output(", her grip on your hand is nervous and fidgety, and it doesn’t stop when you’re in the elevator back down.");
	else output(", her grip on your hand is a bit nervous. It doesn’t stop once you’re in the elevator back down.");
	output(" <i>“Relax,”</i> you tell her soothingly. <i>“You’ll love it.”</i>");

	if(paigeBlind()) 
	{
		output("\n\nShe finds comfort with you and your words, but she can’t help but be cautious at every sound around her. You gently lead her up the boardwalk of your ship; once the door to your ship’s hold fizzes shut airtight behind you both, the tension palpably leaves her body. You tell her that it’s just a little bit further, and for the first time since leaving her unit, there’s a bit of pep in her step.");
		output("\n\nFinally, at the door to your quarters, you take Paige’s hand and place it on the handle of the door. You tell her to twist and push, and she does – and the door to your quarters swings open.");
	}
	else
	{
		output("\n\nShe finds comfort with your words but can’t help but be cautious of the strangers around her. You gently direct her to the boardwalk of your ship, a little proud when her eyes open wide at the sight of it. Once the door to your ship’s hold fizzes shut, airtight, the tension palpably leaves her body. You tell her that it’s just a little bit further, and Paige walks to the door. It’s the first time you’ve seen any pep in her step since leaving the apartment.");
		output("\n\nThe door to your quarters swings open with a single push.");
	}
	output("\n\n<i>“Heya, Bookworm,”</i> says Kiro.");
	//[=Next=]
	// end scene (scene: Intro 3); go to (scene: Main Menu)
	processTime(25);
	clearMenu();
	addButton(0,"Next",paigeKiroMainMenu);
}

// (scene: Main Menu)
public function paigeKiroMainMenu():void
{
	clearOutput();
	showPaigeAndKiro();
	author("B!");
	// Continue here if it’s the first time
	if(flags["PAIGE_KIRO_THREESOMES"] == undefined)
	{
		output("Paige freezes in the doorway, her fur becoming bristly. Her breath catches in her lungs and her ");
		if(paigeBlind()) output("blind eyes lock onto Kiro’s general direction");
		else output("eyes lock onto Kiro’s");
		output(". <i>“Kiro?”</i> she asks, her voice quieter than she had meant.");
		output("\n\n<i>“Yep, it’s me alright,”</i> she responds, pulling herself to her feet to meet her friend. <i>“It’s good to see you again!”</i>");
		output("\n\nPaige extends her hand straight out, her palm facing inside, as if she were looking for a handshake. She gets one, but not the way you had expected: Kiro’s hand reaches out and interlocks her fingers with Paige’s, and then they begin an elaborate handshake, by clapping each other by the wrists; lifting their arms and bumping each other’s elbows; twisting their arms back down in front of their bodies, giving them room to lean forward and headbutt each other; and finishing with their free hand wrapping forward in what at first looks like a friendly embrace, until they twist and open-hand slap each other on the ass.");
		output("\n\n<i>“Holy shit!”</i> Paige nearly shrieks in delight, gripping onto Kiro by the shoulders. Her eyes go wide as saucers and her mouth hangs open in the widest, childlike grin you think you’ve ever seen her make.");
		output("\n\n<i>“I know, right?!”</i> Kiro responds, just as elated at their good fortune. <i>“Goddamn, we sure know how to pick ‘em, don’t we, Bookworm?”</i>");
		output("\n\n<i>“Is this real? Is this real life?”</i> asks Paige, her eyes flitting from Kiro’s to your general direction. <i>“Is it real that my favorite yoga student just</i> happens <i>to be on a first-name basis with my best friend?”</i>");
		output("\n\n<i>“Oh, please, honey, let’s not pretend that [pc.heShe] doesn’t just ‘know’ either of us. I doubt we’d let someone like [pc.himHer] get this deep between us by doing some yoga and grabbing some drinks.”</i> Kiro slaps Paige on the ass once again, allowing herself to get more than a little bit of a handful while she’s at it. <i>“You know me as well as I know you.”</i>");
		output("\n\n<i>“Well–”</i> Paige starts, nervously tilting her head from side to side, until she breaks down into a lazy, red-handed grin. <i>“Yeah.”</i>");
		output("\n\nKiro’s head turns, her hair swishing around her shoulders from the jerking motion, to face you. <i>“You!”</i> she demands, her steely gaze fixated on you. <i>“Lock the door and get over here!”</i>");
		output("\n\nYou do as you’re commanded: you key in the lock’s code, and you approach the two girls. As soon as you’re in arm’s length, Kiro grips you by the shoulder and yanks you between her and Paige. She says nothing; her arms wrap tightly around you both, locking you close to her body. Paige does the same to you and Kiro, and, taking their lead, you do the same to them.");
		output("\n\nConversation is a bit light – the three of you simply enjoy each other’s company for a while. Kiro and Paige take deep, excited breaths, in through their noses and out their mouths, as they try to contain themselves. Girlish giggles make for the ambience of the room as the three of you share an intimate group hug; in fact, Kiro is shaking in pure delight and excitement at finally having met Paige once again.");
		output("\n\n<i>“We have</i> so much <i>shit to do,”</i> Kiro says happily, her head leaning against Paige’s. <i>“It’s been so long, Paige. I... I knew you were alive and safe, in Tavros, and I wanted to... I, I wanted to visit, I wanted to, like, send you a message, or maybe take a yoga class or something....”</i> She begins to stutter as the words fall apart in her mouth. <i>“I dunno, I dunno how I was gonna do it. I was gonna put on a disguise, or, or, I thought of maybe sending you snail-mail, or I was gonna ask Mason to help–”</i>");
		output("\n\n<i>“Hey,”</i> Paige interrupts, leaning forward to boop her nose against Kiro’s. <i>“You’re not gonna cry in front of me and [pc.name], are you, Kiro Tamahime?”</i>");
		output("\n\n<i>“No!”</i> shouts Kiro defiantly through the building spittle in her grinning mouth. <i>“Shut up!”</i>");
		output("\n\nPaige can’t help but laugh well-meaningly. <i>“Kiro Tamahime,”</i> she repeats, her voice low and reverent, still reeling from meeting her again. <i>“Brought to tears by little old me.”</i>");
		output("\n\nPaige sniffles long and hard through her nose, trying to maintain her own composure. Neither of them say anything for another few moments, too caught up in the rush of finally having been reunited to say anything more. Delicately, so as to not ruin the moment, you suggest that the three of you take a seat. Like Kiro said, you three have a lot of catching up to do.");
		output("\n\nKiro takes another deep breath through her nose. <i>“Yeah,”</i> she agrees, mustering the strength to finally pull away from the huddle. Gripping you both tight as a vice, she makes her way to your bed, plopping herself down on its edge; you both help Paige to it, and then, your hand still locked with Kiro’s, you pull out your desk chair and sit on it. Your bed isn’t all that big, after all, and you wouldn’t want to get in between the girls.");
		output("\n\nPaige and Kiro are too caught up in each other’s presence to break the ice any further than that; sitting side-by-side, they’re comfortable with simply holding hands and leaning against each other for some time more.");
		output("\n\nLooks like it’s up to you to get the conversation going this time.");
	}
	// Continue here for subsequent times
	else
	{
		output("<i>“Hey yourself, Kiro,”</i> Paige says jovially, stepping into your personal quarters. Once she’s out of the doorway, you slide the metal door shut and activate the electrical lock, securing the room and giving you three all the privacy your quarters can afford.");
		output("\n\nPaige and Kiro go about their secret handshake: Kiro’s hand reaches out and interlocks her fingers with Paige’s, and then they begin an elaborate handshake, by clapping each other by the wrists; lifting their arms and bumping each other’s elbows; twisting their arms back down in front of their bodies, giving them room to lean forward and headbutt each other; and finishing with their free hand wrapping forward, until they twist and open-hand slap each other on the ass.");
		output("\n\nThe two women are giggling the whole time, so used to each other’s company that they feel comfortable with feeling giddy and acting like the best friends they were when they were little girls. Familiar with the layout and ‘proceedings’ between the three of you, Kiro and Paige show themselves to the edge of your bed, while you cordially take the chair stationed at your desk once more.");
		output("\n\nThe two women whisper the occasional nothing to each other; one of them invariably says something a little naughty, and the other moans in delight while biting onto her lower lip. You consider leaving the two alone for some additional privacy, but you know that they wouldn’t want the one to reunite them to ever feel left out – and, that besides, you’d never forgive yourself if you ever missed a session with your two favorite women.");
		output("\n\nThat said, you still need to loudly clear your throat to get their attention away from each other for a moment. With their eyes on you, you have the floor – what’s on the menu tonight?");
	}
	processTime(20);
	paigeKiroThreesomeMenu();
}

public function paigeKiroThreesomeMenu():void
{
	clearMenu();
	//[=Childhood=][=Gossip=][=Piracy=][=Threesome?=]
	if(pc.hasStatusEffect("PAIGE_KIRO_CHILDHOOD_CD")) addDisabledButton(0,"Childhood","Childhood","That discussion is over.");
	else addButton(0,"Childhood",paigeKiroChildhoodTalk,undefined,"Childhood","Paige and Kiro have known each other since they were younger. Ask them what kind of mischief they might have gotten up to.");
	if(pc.hasStatusEffect("PAIGE_KIRO_GOSSIP_CD")) addDisabledButton(1,"Gossip","Gossip","That discussion is over.");
	else addButton(1,"Gossip",kiroPaigeGossip,undefined,"Gossip","As long as you’re all here and you’re all acting friendly and familiar, you ask the two ladies if there’s any gossip one of them is willing to share with you about the other. This may be your chance to learn something interesting about the two!");
	if(pc.hasStatusEffect("PAIGE_KIRO_PIRACY_CD")) addDisabledButton(2,"Piracy","Piracy","That discussion is over.");
	else addButton(2,"Piracy",paigeKiroPiracyTalk,undefined,"Piracy","Ask the two ladies what their piratical history was like together. They’ve bound to have some interesting stories about their time together.");
	if(flags["PAIGE_KIRO_CHILDHOOD"] != undefined && flags["PAIGE_KIRO_GOSSIP"] != undefined && flags["PAIGE_KIRO_PIRACY"] != undefined) 
	{
		if(flags["PAIGE_KIRO_THREESOMES"] == undefined) addButton(3,"Threesome?",paigeKiroThreesomeIntro,undefined,"Threesome","The girls have caught up; they’ve both admitted that they’re okay with ‘sharing you;’ and one of them is at least a little horny. Maybe it’s time to move the conversation along....");
		else addButton(3,"Threesome?",paigeKiroThreesomeIntro,undefined,"Threesome","Skip to the good part. You doubt Paige or Kiro would provide much resistance.");
	}
	else addDisabledButton(3,"Threesome?","Threesome?","Surely the girls have some catching up they’d like to do first! Good things come to those who wait.");
}

//[=Childhood=]
// Tooltip: Paige and Kiro have known each other since they were younger. Ask them what kind of mischief they might have gotten up to.
// (scene: Childhood)
public function paigeKiroChildhoodTalk():void
{
	clearOutput();
	showPaigeAndKiro();
	author("B!");
	output("You ask the women what sort of relationship they had growing up. If you remember right, Paige told you that they met each other in some kind of gymnastics class?");
	output("\n\n<i>“That’s right,”</i> Paige answered, nudging Kiro in the shoulder. <i>“Gosh, imagine what our parents would think if they knew</i> this <i>was where something as innocuous as a gymnastics class was going to take us. Piracy and polyamory; how scandalous!”</i>");
	output("\n\n<i>“I don’t even know why my old lady wanted me in that class,”</i> says Kiro, shrugging in indifference. <i>“I guess it was good exercise and all, but she enrolled me in my early teens; she must have known that putting a developing Kui-Tan in a class full of other developing teenagers, where the exercise was to do a lot of bouncing, was probably not the best combination.”</i>");
	output("\n\nYou ask if the two ladies had ever been romantically involved. Paige didn’t talk about Kiro much, and when she did, it was usually about their capabilities as pirates.");
	output("\n\n<i>“I mean, we thought about it,”</i> Paige answers. <i>“We even gave it a try for... six months, I think? We tried to call ourselves girlfriends, but it never really stuck. I dunno; we’d both see somebody cute and we’d both try to go after them, and we’d forget that we’re only supposed to have eyes for each other.”</i>");
	output("\n\n<i>“We fucked a lot, though,”</i> interjected Kiro.");
	output("\n\n<i>“Yeah we did.”</i> Paige’s fingers interlock with Kiro’s, and her body relaxes – if you weren’t listening to Paige’s words right now, you’d easily make the mistake that they were a couple, with their body language towards one another. <i>“Sometimes I wonder if it would have been so bad to try and keep it up. Way back in the day, Kiro and I agreed that if we couldn’t go steady with each other, then maybe it wasn’t meant to be. So we kept it on the friends-with-benefits level.”</i>");
	output("\n\n<i>“But hell, things change,”</i> Kiro continues for her, motioning to you. <i>“[pc.name] is sitting right there, and we’re both – well, I’m okay with sharing [pc.himHer]. Are you, Paige?”</i>");
	output("\n\n");
	if(paigeBlind()) output("<i>“Yep. I’d trust [pc.name] with damn near anything.”</i> Her blind eyes look in your direction. <i>“Hell, I told you about Kiro and I, didn’t I? And I trusted you to lead me back to her. Hell yes I’d share you with her.”</i>");
	else output("<i>“Are you kidding me?”</i> Her fingers trail along the scar across her eyes, feeling at the dead skin and the cut fur along the slash. <i>“[pc.name] did something completely unthinkable for me. I... I never imagined I’d be where I am right now, and so soon. I thought I wasn’t going to be able to see again until I was old and grey.</i> And <i>[pc.heShe] knows you? Fuck, it’s everything I never knew I wanted in a relationship.”</i>");
	output("\n\nYou blush at the praise, and keep asking the two ladies about their history together. Considering they’ve admitted to sleeping together, you ask if each other was their first.");
	output("\n\n<i>“Sure were,”</i> says Kiro, her eyes narrowing as she remembers the event. <i>“It was the night I first told Paige I loved her. Words like that come easy when you’re young.”</i>");
	output("\n\n<i>“I might have escalated our relationship a little quickly,”</i> Paige chuckles, embarrassed. <i>“I have since learned to not drop my panties every time someone tells me they loved me.”</i> Her eyes lock onto yours");
	if(paigeBlind()) output(" (generally, anyway)");
	output(", and her mouth curls into a wry grin. <i>“Well, for the most part.”</i>");
	output("\n\n<i>“I know it’s hard to imagine, Steele, but I wasn’t exactly the temptress I was back then,”</i> Kiro says, laughing along with Paige. <i>“We were a little too young. It got slippery and awkward. But hell, practice makes perfect, am I right?”</i>");
	output("\n\n<i>“‘Perfect,’ she says,”</i> Paige mocks.");
	output("\n\n<i>“Well,”</i> Kiro says, leaning in close to Paige to press her nose against hers, <i>“maybe I’ll just have to prove it to you later.”</i>");
	// end scene (scene: Childhood); grey out [=Childhood=] button
	processTime(30);
	flags["PAIGE_KIRO_CHILDHOOD"] = 1;
	//Temporary status to disable the buttons but only for this threesome. They'll wear off before the threesomes finish.
	pc.createStatusEffect("PAIGE_KIRO_CHILDHOOD_CD");
	pc.setStatusMinutes("PAIGE_KIRO_CHILDHOOD_CD",120);
	paigeKiroThreesomeMenu();
}

//[=Gossip=]
// Tooltip: As long as you’re all here and you’re all acting friendly and familiar, you ask the two ladies if there’s any gossip one of them is willing to share with you about the other. This may be your chance to learn something interesting about the two!
// (scene: Gossip)
public function kiroPaigeGossip():void
{
	clearOutput();
	showPaigeAndKiro();
	author("B!");
	output("You ask the two ladies, if it’s not too forward of you to ask, if there’s any gossip between the two of them that they’d be willing to share. Something that one of them knows about the other that you’d never think to ask.");
	output("\n\n<i>“That’s kind of–”</i> Paige starts, but Kiro interrupts her pretty quickly.");
	output("\n\n<i>“When we were pirates, Paige was usually the one to whore herself out for intel when our usual methods didn’t work.”</i> Kiro speaks plainly, yet excited and rushed, eager to make Paige squirm. <i>“Whether it was the president of some company, or just a ship’s helmsman on shore leave or something. If she got them alone and with some alcohol, she’d do whatever she wanted to get that information.”</i>");
	output("\n\n<i>“Okay, you’re just being obtuse,”</i> Paige responds defensively, roughly shoving Kiro in the shoulder. <i>“I didn’t</i> want <i>to do any of that; it had to be me instead of you because not as many people wanted a girl with a cock the size of a tree trunk. And</i> then <i>you took that shot of Throbb later!”</i>");
	output("\n\n<i>“I might be obtuse, Paige, but am I wrong? Remember that shipment of Reaper Armaments coming from Arcadia? The Daynar that you said looked like he ‘would taste great with a bit of butter?’”</i>");
	output("\n\nPaige stutters with her words, clearly unable to defend herself, at least not right away. Kiro presses forward while Paige is reeling. <i>“How about that alpha Dzaan on Tavros?”</i> Kiro looks at you as she continues. <i>“Did you know Paige is a bit of a cumslut? She’s a pretty thirsty girl for a good bellyful of the stuff. It’s because she spent a night a little too vigorously with a Dzaan and she damn near got herself addicted.”</i>");
	output("\n\nPaige straightens herself, not amused. Her face turns smooth as she waits for Kiro to stop talking for just a moment, and when she does, she fires: <i>“Are you still a virgin, Kiro?”</i>");

	// Continue here if Kiro is a virgin
	if(kiro.vaginalVirgin)
	{
		output("\n\nKiro stops immediately.");
		output("\n\n<i>“If we were trying to go after a woman, sure, you’d have all the cock in the world to get them to sing like a bird. But you having a big dick isn’t the </i>only<i> reason we’d get me to go after the male targets. Care to share why?”</i>");
		output("\n\nUncharacteristically, Kiro’s lips begin to quiver in shy anxiety. Her hands curl into fists on her lap and she, in her embarrassment, turns her gaze downward, unable to look at you or at Paige. The room falls silent as you and Paige both wait for an answer – and then, Kiro mumbles something unintelligible and too quiet to make out.");
		output("\n\n<i>“Come on, Kiro, if we’re going to make fun of me for throwing my pussy around, you gotta tell [pc.name] why you wouldn’t do the same.”</i>");
		output("\n\nYou do admit that you’re curious – when you first met both of the women, Kiro was the horny, cock-waggling seductress and Paige was the prim-and-proper professional that just wanted to teach a class how to exercise. To hear that their positions were at one point reversed sounds like a juicy story.");
		output("\n\nKiro says it again, a bit louder, but still too quiet. She starts again before Paige can goad her some more. <i>“I wanted to save myself for someone I loved,”</i> she finally says, loud enough for the room to understand her. <i>“Someone I was willing to... stay together with. Someone I was willing to have a family with.”</i>");
		output("\n\nYou tell Kiro that, while that’s certainly surprising coming from a woman that liked to show off her ‘trophy room’ full of the panties of her conquests, there’s nothing shameful about wanting to save her other half for someone important. <i>“Thanks, [pc.name],”</i> she replies, her tense body relaxing a bit, but she’s clearly still a little uneasy about the topic. <i>“But still, it feels kind of unfair to say, especially to Paige. She’s right; I’m perfectly okay with banging the first warm, willing hole around, but I’m a huge stick in the mud for giving myself to anybody.”</i>");
		output("\n\n<i>“I’m over it,”</i> Paige says, wrapping her arm around Kiro’s shoulders and pulling her tightly against her, but her gaze is still towards you. <i>“Back when she first told me she was trying to save herself for that special someone, I even offered to take some Throbb myself. At the time, I figured I was probably the special-est someone in her life.”</i>");
		output("\n\n<i>“And it meant a lot to me that you were willing to do that to your body just to make me feel more comfortable with mine,”</i> Kiro says, leaning into Paige and giving her a kiss on the cheek. She turns to face you as she continues the conversation. <i>“But I didn’t want her to change herself like that. She – Paige, you’re already one of the most special people in my life. Asking you to grow a dick because I didn’t want just anyone’s inside me would have been so selfish.”</i>");
		output("\n\n<i>“Hey, like I said, it’s fine. And I think we both made the better decision in the end; back then, you were pretty set on only giving your cherry to your baby’s daddy. I doubt I would have been able to fulfill that, even if I had a dong of my own.”</i>");
	}
	// Continue here if Kiro is not a virgin
	else
	{
		output("\n\nKiro’s tirade stops, but her body remains somewhat active; the grin is still plastered all over her face. <i>“As a matter of fact, no. I handed in my V-card not too long ago.”</i>");
		output("\n\nPaige reels in surprise, turning her head to Kiro in shock. <i>“Damn, really?”</i>");
		output("\n\n<i>“Don’t act so shocked, Paige.”</i>");
		output("\n\nIt takes her a second to understand the hint. <i>“You gave it to [pc.name]?”</i>");
		output("\n\n<i>“[pc.HeShe] is a pretty special " + pc.mf("guy","girl") + ".”</i> The room goes silent as Paige eyes you in surprise; you say nothing and respond with a sheepish smile. <i>“But you already knew that. You wouldn’t be here right now if [pc.heShe] weren’t.”</i>");
		output("\n\n<i>“I guess that’s true.”</i> Paige, however, isn’t done; Kiro mocked her and her earlier promiscuity, and Paige was determined to get back at her. <i>“Did you tell [pc.name]</i> why <i>you were so determined to keep it?”</i>");
		output("\n\nAt that, Kiro hesitates, her eyes on yours, almost as if she were asking for help, or for permission for something. You don’t respond – the question isn’t yours to answer – but you smile warmly, letting Kiro know that you aren’t going to judge her.");
		output("\n\n<i>“I, uh,”</i> she stutters, trying to collect her thoughts. <i>“I... I wanted to... save myself for the one that I... was... willing to have a family with,”</i> she says haltingly, carefully selecting her words throughout the sentence. As soon as she says the word ‘family,’ the fur on her body stands on end and she thrusts her face into her hands, trying to contain her embarrassment to herself.");
		output("\n\nYour own face flushes in surprise at the admission. You understood that, when you took Kiro’s vaginal virginity, it was a big deal to her and that you should rightly feel very privileged for the opportunity – but you had no idea that <i>that</i> was what Kiro had in mind.");
		output("\n\n<i>“And I feel like a bitch for saying that, seeing as Paige had no problems with giving her own virginity to me. I felt like I was implying that I was above her, or something.”</i>");
		output("\n\nPaige wraps her arm around Kiro’s shoulder and pulls her close, squeezing her affectionately. <i>“You know that I never thought that, Kiro,”</i> she says, giving Kiro a kiss on the cheek. <i>“If I did, I would have gotten mad if, after I suggested I take a shot of Throbb myself, you told me not to.”</i>");
		output("\n\n<i>“And I’m glad you did. Suggest it, I mean,”</i> Kiro replies, returning the sentiment and kissing Paige on her own cheek. <i>“It meant a lot to me that you were willing to change your body like that in order to make me more comfortable with mine. But I didn’t, and I don’t, want you to change, Paige – you’re already special to me.”</i>");
		output("\n\n<i>“Aww,”</i> Paige coos, squeezing her girlfriend’s shoulders all the tighter. <i>“It all worked out in the end. And besides, I think it was for the best that I didn’t take your virginity myself; I don’t think I could have lived up to your expectations as far as being a baby’s daddy goes. Not to mention, we were both pretty young at the time.”</i>");
	}
	// Merge here
	output("\n\nThe tension in the room is much lighter, now that the two have gotten the teasing out of the way. But, before you can break the silence with another question or suggestion, Paige beats you to the punch.");
	output("\n\n<i>“If we’re still gossiping,”</i> Paige says snidely, eager to get Kiro to wriggle in discomfort a bit more, <i>“you could have just given it to your sister, Kally.”</i>");
	output("\n\n<i>“Paige!”</i> Kiro shouts, pulling away from the Ausar.");
	output("\n\n<i>“What? Remember that one time when we both got totally smashed after that raid on the Ausaril caravan? I told you that I thought Kally was hot, and then you went on a fucking twenty-minute tirade about how hard you’d plough her if she weren’t your sister.”</i>");
	// Continue here if Kiro has not had sex with Kally
	if(kiroKallyThreesomes() <= 0)
	{
		output("\n\n<i>“I was drunk! You know I didn’t mean it!”</i>");
		output("\n\n<i>“Right, Kiro, just like all those CEOs and secretaries and helmsmen that we got drunk and fucked for information. None of them meant it too, right?”</i> Kiro’s face pouts in frustration, but she makes no effort to continue her defense. <i>“I mean, to be fair, Kally</i> is <i>pretty hot. Have you</i> seen <i>your sister’s boobs?”</i>");
		output("\n\n<i>“Can we please just change the subject?”</i> Kiro finally asks in defeat, refusing to look at either you or Paige. Looks like Paige finally won this round.");
	}
	// Continue here if Kiro has had sex with Kally
	else
	{
		output("\n\nKiro’s eyes flit between Paige’s and your own, temporarily indecisive. You’re fully aware of the secret that Kiro’s hiding from Paige, but you don’t dare make a move to reveal it ahead of her.");
		output("\n\n<i>“Fuck it. You’re my closest friend, Paige, and even [pc.name] knew before you did.”</i> Paige’s expression flattens immediately as the unsubtle hint hits her like a sack of bricks. <i>“I’ve done it. Everything that I said I’d do to Kally? I did it.”</i>");
		output("\n\nPaige, caught completely off-guard, looks between you and her, again and again, trying to learn if she’s telling the truth. You nod your head in affirmation");
		if(paigeBlind()) output(" (not that it would make a difference for her)");
		output(", and Kiro’s sly grin never leaves her face, knowing that, in Paige’s effort to get Kiro to squawk like a bird, she’s about to shamelessly turn it around on the vulnerable Ausar.");
		output("\n\n<i>“You fucked your own sister?”</i> Paige whispers, as if someone else might accidentally hear them.");
		output("\n\n<i>“And it was</i> incredible. <i>Everything that I had hoped it would be. Hell, I won’t hide it: I thought she was hot. She has some of the most incredible boobs I’ve ever seen. And now, I’ve got them all to myself.”</i>");
		output("\n\nPaige’s thighs close in reflex, and her hands fidget on her lap. She’s blinking twice as quickly as usual and her teeth nibble on her lower lip lustfully – the mental image of Kiro and her sister together is clearly having quite the effect on her.");
		output("\n\n<i>“Kiro, I’m not gonna lie,”</i> she says, her breath coming out in husky whimpers. <i>“That’s... that’s fucking hot.”</i>");
		output("\n\nKiro knows an opportunity when she sees it: her own hand lays on Paige’s lap, her fingers gently raking across the sturdy muscles of her thigh as they inch toward her body, toward the valley of her crotch. <i>“Kally always thought you were hot too, you know,”</i> Kiro whispers, her tongue snaking out to tickle the fur on Paige’s ear. <i>“I could arrange something, the four of us, if you’d like.”</i>");
		output("\n\nYou clear your throat to get their attention, before things get a little too out-of-hand.");
		pc.lust(20);
		flags["PAIGE_KNOWS_KIRO_KALLYFUX"] = 1;
	}
	flags["PAIGE_KIRO_GOSSIP"] = 1;
	//Temporary status to disable the buttons but only for this threesome. They'll wear off before the threesomes finish.
	pc.createStatusEffect("PAIGE_KIRO_GOSSIP_CD");
	pc.setStatusMinutes("PAIGE_KIRO_GOSSIP_CD",120);
	// end scene (scene: Gossip); grey out [=Gossip=] button; if Kiro has had sex with Kally, increase Lust by 20
	processTime(20);
	paigeKiroThreesomeMenu();
}

//[=Piracy=]
// Tooltip: Ask the two ladies what their piratical history was like together. They’ve bound to have some interesting stories about their time together.
// I drafted this scene, three times, hopefully the third time is the charm!
// (scene: Piracy)
public function paigeKiroPiracyTalk():void
{
	clearOutput();
	showPaigeAndKiro();
	author("B!");
	output("You ask the two ladies what, if anything, got them into the piracy business in the first place. Why did they choose to become pirates, as opposed to something that’s a little less... illegal?");
	output("\n\n<i>“Well, first of all,”</i> Kiro says, her lips pouting, and not in a cutesy way, <i>“I haven’t met another agent in the business that ‘chose’ to be a pirate, [pc.name]. If it were all about ‘choosing’ what occupation we wanted, I’d have... I dunno, I might have been a cop or something. Fight on the other side of the law.”</i> She looks down at herself and tugs at her clothes. <i>“I bet I’d look like a real sexy piece of work in a uniform.”</i>");
	output("\n\nYou say nothing, allowing Kiro to continue. <i>“That said, I’ve saved up enough capital to quit if I wanted to. But, it’s been so many years, I don’t think I’d be suited to do much else. Which is a sorry thing to say, but hell – piracy pays well and it’s a real hoot! It’s not all the money or the women that keeps me going; it’s the thrill of the getaway with hundreds of thousands of credits that belonged to someone else. The adrenaline you get is–”</i>");
	output("\n\nShe interrupts herself with an exaggerated moan, to give you an idea of how unintelligible the adrenaline rush really is. <i>“You know how some people prefer to have a smoke after sex? For Paige and I, we usually had sex after a heist – the bigger and more dangerous, Gods above, the harder and heavier the sex was. It was the perfect way to blow off all the steam and jitters we’d built up over the con. You gotta admit: as dangerous as the lifestyle is, and as much as it wasn’t my first choice, nobody can ever say that we weren’t living our goddamn lives.”</i>");
	output("\n\n<i>“I...”</i> Paige stutters, unsure of how to phrase her answer. <i>“I’m not entirely sure I agree.”</i>");
	output("\n\nKiro straightens herself, respectfully waiting for Paige to resume uninterrupted.");
	output("\n\n<i>“I mean, I definitely agree about the adrenaline rush thing. The money; the excitement; the sex; it was all great. But,”</i> she pauses, her fingers going across the groove of her scar across both her eyes, <i>“if I had known that this would happen, and the crap I had to deal with afterward... I’m not sure if I would have stuck with it all. But, then again, I say this in hindsight; if I could travel back in time and tell my younger self to pull out of the game while I was ahead, I’m not sure if I would have listened.”</i>");
	output("\n\nKiro nudges at Paige affectionately, nodding towards you. <i>“Hey, look at the bright side.”</i> ");
	if(paigeBlind()) output("Her lips curl inward as she realizes what she just said. <i>“Uh, you know what I mean.”</i> She clears her throat. ");
	output("<i>“Sure, that one job went south in a hurry – but if all that didn’t happen, neither of us would have met [pc.name].”</i>");

	output("\n\n<i>“Sure?”</i> she answers indecisively. <i>“I mean, don’t get me wrong, [pc.name], ");
	if(paigeBlind()) output("you’re a huge part of my life and I wouldn’t be here with Kiro today if it weren’t for you");
	else output("you’ve gone above and beyond what I could have expected from anybody, and I love you with all my heart for it");
	output(", but... I dunno, guys, I really liked my eyes. Is it wrong of me to want those years of my life back?”</i>");

	output("\n\nIn an effort to diffuse Paige’s emotions about her eyes, you tell her that you understand completely, and that it’s alright to pine for a reality that could have been. You don’t take it personally: it was a difficult thing Paige had to go through. <i>“Thanks, [pc.name], it means a lot to me to hear you say that.”</i>");
	output("\n\nYou try to steer the conversation towards something a little happier. You ask the two ladies what their favorite heist was.");
	output("\n\n<i>“Oh, that one’s easy,”</i> Kiro says happily, leaning backward with a goofy smile as she reminisces about her favorite con. <i>“Okay, so, picture it: we get some intel that some precious minerals are getting shipped out of Uveto. Uveto exports lots of minerals that are used for aphrodisiacs and the like, and they go for a good price in the market.”</i>");
	output("\n\n<i>“I remember this one,”</i> Paige laughs.");
	output("\n\n<i>“We had to hit them fast; shipments carrying precious cargo out of Terra don’t get UGC escorts until they leave the Siretta system, and the TSC can’t escort any caravans before then because then they’d be spreading their manpower too thin, which meant, with the technology available at the time, we had about a two hour window to intercept them. So, we just had to stakeout around a nearby planet’s orbit until the ship came by; board them; take their loot; and buzz off before their distress signal could be received and acted on.”</i>");
	output("\n\nYou respectfully sit patiently while Kiro excitedly tells her story. <i>“Turns out, though, that some ballsy fuckers had beaten us to it! A rival gang called the Terrace of the Free Market – not an especially large gang, but they liked to step on our toes every now and again. Like right then! They had gotten to the transport before Paige and I did, and they were already taking our shit before we had to chance to steal it!”</i>");
	output("\n\nKiro’s hands move animatedly around herself as she tells the story, and her eyes are wide and lit, elating in remembering every facet of the heist. <i>“So, Paige and I, we briefly considered just letting them have it and cut our losses on fuel and time. There would always be another mark to hit later, right?”</i>");
	output("\n\n<i>“Fuck that!”</i> Paige said.");
	output("\n\n<i>“Yeah, fuck that! We had come all that way, just for some pissy upstarts to try and get the jump on the Tamahime Pirates? If they wanted a fight, we’d give them a fight!”</i>");
	output("\n\nPaige leans towards you, one hand against her face to hide it from Kiro’s gaze. <i>“I didn’t agree to that name, by the way,”</i> she whispers to you, winking.");
	output("\n\n<i>“</i>Anyway, <i>Paige and I, we board the ship right then and there, guns blazing; tasers crackling; the whole nine yards. Figured we’d get the jump on them and try to overwhelm them before they even had a chance to fight back. And it went pretty well! There were only three of them, and Paige and I, we knew how to carry ourselves in a fight. It wasn’t all that hard to knock the Terrace around and steal those jewels for ourselves.”</i>");
	output("\n\n<i>“Here comes the good part,”</i> Paige interrupts.");
	output("\n\n<i>“Yeah! So, we had control of the ship and the cargo. We just needed to move the things onto my ship, and we’d be off. But wouldn’t you fuckin’ know it? The whole thing took too long, and we let the UGC catch up to us from outside Siretta. So, that cargo ship was boarded for a</i> third <i>time, and this time, it was a bunch of cops!”</i>");
	output("\n\nYou ask Kiro what she and Paige did then.");
	output("\n\n<i>“Fought ‘em off, of course!”</i> Kiro boasts proudly, puffing out her chest in triumph. <i>“Paige and I, we were outnumbered, but, like that one classical album was called, at no point we were ever outgunned. It was a damn free-for-all between us, the Terrace, and the UGC. Every woman for themselves!”</i>");
	output("\n\nYou shuffle forward on your seat, hanging on Kiro’s every word.");
	output("\n\n<i>“The thing about piracy is that, while you might want to ‘leave your mark’ on the world, you don’t want to stick around for it, you know? Paige and I, we just wanted to start hauling ass as soon as we got those jewels. As soon as we got back to my ship, the day would be ours.”</i>");
	output("\n\nWhile the answer was kind of forgone, you ask Kiro if she and Paige made it aboard Kiro’s ship safely.");
	output("\n\n<i>“We almost didn’t!”</i> Kiro continues. <i>“Some rookie upstart managed to pull Paige away. I could tell she was new because she was so excited to start prattling off our rights that she hadn’t even got the cuffs on her before she started running her mouth.”</i> Kiro laughed, patting Paige on the shoulder. <i>“She didn’t have a lot of field experience, and Paige didn’t have much issue fighting her off. One to the face,”</i> Kiro said, mimicking the action in slow motion against Paige’s face, <i>“and one in the gut,”</i> she said, hooking the same fist to Paige’s abs, <i>“and Officer Hot-To-Trot was down long enough for us to make it away. Once we were aboard and I had the lock shut behind us, we were off.”</i>");
	output("\n\n<i>“And that’s the story of our favourite heist,”</i> Paige concludes for Kiro. <i>“A free-for-all between us, a rival faction, and the police, and we even made a personal enemy in the force along the way.”</i>");
	output("\n\n<i>“Is the statute of limitations on those minerals over by now?”</i> Paige asks.");
	output("\n\n<i>“Oh, absolutely. This was years ago, Paige; we could wag our asses in front of those cops and the most they’d be able to do is admire them.”</i>");

	// end scene (scene: Piracy); grey out the [=Piracy=] button
	processTime(20);
	flags["PAIGE_KIRO_PIRACY"] = 1;
	//Temporary status to disable the buttons but only for this threesome. They'll wear off before the threesomes finish.
	pc.createStatusEffect("PAIGE_KIRO_PIRACY_CD");
	pc.setStatusMinutes("PAIGE_KIRO_PIRACY_CD",120);
	paigeKiroThreesomeMenu();
}

//[=Threesome?=]
// grey this button out if this is the first time the PC is having a threesome with Kiro and Paige until all three other talking topics are viewed. If this is not the first time the PC is having the threesome, keep this button active
// Tooltip (first time, inactive): Surely the girls have some catching up they’d like to do first! Good things come to those who wait.
// Tooltip (first time, active): The girls have caught up; they’ve both admitted that they’re okay with ‘sharing you;’ and one of them is at least a little horny. Maybe it’s time to move the conversation along....
// Tooltip (subsequent times): Skip to the good part. You doubt Paige or Kiro would provide much resistance.
// (scene: Threesome Intro)
public function paigeKiroThreesomeIntro():void
{
	clearOutput();
	showPaigeAndKiro();
	author("B!");
	// Continue here if it’s the first time
	if(flags["PAIGE_KIRO_THREESOMES"] == undefined)
	{
		output("Paige and Kiro sigh in unison as they calm down from their laughing and conversing. Paige looks totally at ease, sitting here in your personal quarters, with the two most special people in her life – it’s almost hard to believe that this was the same woman that was having a hard time leaving her own apartment not too long ago. And Kiro, likewise, has one of the most sincere smiles you’ve ever seen on a woman, much less on <i>her</i>.");
		output("\n\nAll three of you sit in relaxed silence for a time, simply enjoying the physical company of each other. You have a couple thoughts going through your head that you don’t bother to say out loud. One of them is less of a thought and more of a fantasy: based on one of their earlier conversations, they both mentioned that they wouldn’t mind ‘sharing’ you, and ever since then, you’ve had a hard time shaking the thought of getting them both into the same bed with you.");
		output("\n\n<i>“So, are we gonna fuck or what?”</i> Kiro asks suddenly, breaking the moments-long, maybe minutes-long, silence. <i>“I can’t be the only one that’s had it on her mind since we both just kinda blurted out that we’d be okay with sharing.”</i>");
		output("\n\n<i>“Gosh, you too?”</i> Paige asks, smiling slyly to Kiro as her legs cross. <i>“I mean, I really enjoyed catching up and all, but it was kinda hard to get the idea out of my head ever since we brought it up.”</i>");
		output("\n\nAs long as everyone’s being open about it, you admit that you had been thinking about it, too. You hope that saying that doesn’t make you a bad person or anything; when you say it, it feels like the only reason you reunited the girls is so you could take advantage of the situation.");
		output("\n\nAt that, Kiro leans forward and grabs you by the wrist, yanking you onto the bed between her and Paige. <i>“Well, [pc.name], you can think of it in one of two ways,”</i> she says, her eyes narrowing as she leans in closer to you, her hefty Kui-Tan boobs pressing into your side. Paige, recognizing the potential for what’s going on, does the same on your other side, and you find yourself trapped between the two ladies as they invade your personal space.");
		output("\n\n<i>“You could think of it as you just trying to reunite two old friends, like any good mutual-friend would do. And that there isn’t a single dirty thought going through your head the whole time. You could think of it that way.”</i>");
		output("\n\nYour focus is on Kiro as she speaks to you, but, distracted as you are, Paige leans into you and kisses at your bared neck, planting gentle-yet-insist kisses from your collarbone to your cheek. <i>“Or, you could think of it as two horny ladies,”</i> Kiro continues, her hand trailing along the inside of your [pc.thigh], gently groping her way towards your crotch, <i>“in your room... saying they both want you... and they’re willing to share.”</i>");
		output("\n\nKiro’s hands explore your [pc.belly], shamelessly feeling their way up until she gently grasps " + indefiniteArticle(pc.nippleDescript()) + " with the palm of your hand, giving your breast a firm squeeze. <i>“And if you aren’t convinced,”</i> Paige says, leaning up to whisper in your ear, but loudly enough that Kiro can hear, <i>“just think of it as</i> us <i>taking advantage of poor, little old</i> you. <i>We’re pirates. We’re good at taking what we want.”</i>");
		output("\n\n<i>“Hell, maybe we can work with that?”</i> Kiro asks playfully, her teeth nibbling at your other ear. <i>“You’re the damsel in distress, and we’re the filthy scumbags that are taking what doesn’t belong to them. Does that sound like something that would interest you, [pc.name]?”</i>");
		output("\n\n<i>“Or,”</i> Paige continues. She shifts her lower body, her left leg draping over your [pc.legs], until she’s straddling you. With an exaggerated pull, she drags herself along your body, and winces out in pleasure as her wet Ausar cooch leaves a slimy trail of her arousal along your [pc.leg]. <i>“We can try some role reversal. You can,”</i> she pauses, humping against you again and sighing in pleasure as she goes, <i>“you can be the evil pirate, after the most precious treasure we have to offer. Want to try that? Get a nice,</i> thick <i>taste of what it’s like to be a pirate?”</i>");
		output("\n\nSounds like you don’t have anything to worry about after all.");
	}
	// Continue here if it’s not the first time
	else
	{
		output("You sit in your chair, gazing at the two ladies as they chatter between them. You’re paying attention – sort of – not really, you’ve heard all the stories before already, and when you pick out some keywords, you know what it is they’re talking about, so you just zone out. Your eyes come to rest on the physical features between the two women: the way Kiro’s boobs hug tightly against her red blazer; the way Paige’s strong legs practically bulge against her yoga pants; the way you could practically make out the ridges of Paige’s abs; the way Kiro’s pants round out just slightly at the crotch, signaling to the universe that she might not be all that she appears....");
		output("\n\n<i>“Terra to Steele?”</i> Paige asks, waving her hand in front of you. You snap out of your longing, perverted gazing and sheepishly laugh, saying that you were caught daydreaming a little bit.");
		output("\n\n<i>“‘Daydreaming’ is putting it lightly,”</i> Kiro laughs well-meaningly, slapping Paige on the thigh lightly. <i>“You were practically fucking us with your eyes, [pc.name]. Are we both really so boring that you wouldn’t give two lady-friends the time of day without fantasizing about fucking them both?”</i>");
		output("\n\nYour face turns slightly red at the accusation, but Paige comes to your rescue. She leans into Kiro, her hand gripping onto Kiro’s wrist and directing the hand on her thigh to <i>explore</i> a little. <i>“Can you blame [pc.himHer]?”</i> she asks, her voice dripping with sensuality.");
		output("\n\n<i>“Can’t say I can, Bookworm,”</i> she answers, and then leans in, planting her lips against Paige’s. Nerveless, Kiro opens her mouth and slides her tongue into Paige’s, sloppily making out with the Ausar right in front of you. The mound in Kiro’s lap that you had been ogling just seconds ago quickly rounds out, pressing tightly against the fabric of Kiro’s uniform.");
		output("\n\nThey pull away from each other before the show they’re giving you gets a little too involved. Kiro eyes you lustfully, her hand gently working circles against Paige’s crotch, and Paige responds automatically, gently rocking her hips into Kiro’s palm. Paige’s eyes begin to cross, but she catches herself just in time; she reaches out her hand to you, and when you take it, she pulls you off your chair and in between the two girls, breaking Kiro’s ministrations against herself.");
		output("\n\n<i>“Let’s skip straight to the good part, in that case,”</i> she says to you.");
	}
	//[=Next=]
	// end scene (scene: Threesome Intro); increase Lust by 50; go to (scene: PKTSI)
	processTime(10);
	pc.lust(50);
	clearMenu();
	addButton(0,"Next",PKTSI);
}

// (scene: PKTSI)
public function PKTSI():void
{
	clearOutput();
	showPaigeAndKiro(true);
	author("B!");
	output("The three of you disengage, just long enough to start stripping down. Paige gets her clothing off in a hurry, practically ripping through the material on her shirt and yoga pants; ");
	if(!pc.isCrotchExposed() && !pc.isAssExposed() && !pc.isChestExposed()) output("you take a moment longer");
	else 
	{
		output("you’re ");
		if(!pc.isNude()) output("effectively ");
		output("a nudist, and you’ve been naked since the start");
	}
	output("; and Kiro practically struggles with her own outfit, with the way her assets press against it. And the longer it takes, the more aroused she becomes, making getting off her pants all the harder.");

	output("\n\nWhen Kiro is finally naked, baring herself to you and Paige, she puts her hands on her furry hips and wiggles them back and forth, swinging her horsecock in the air, like she was baiting you and Paige to grab onto it. She and Paige share a laugh; her dick hangs in the air, too flaccid yet to support its own weight, but with each pump of her heart, that’s changing in a hurry.");

	output("\n\n");
	//First time
	if(flags["PAIGE_KIRO_THREESOMES"] == undefined) output("<i>“You still carry that oil stuff of yours around, Kiro?”</i>");
	else output("<i>“You got any more of that Peggy elastic oil or whatever, Kiro?”</i>");
	output(" Paige asks.");

	output("\n\n<i>“Peggy’s Elasticizing Oil, yep,”</i> Kiro says affirmatively, digging into the pocket of her blazer and withdrawing a small tube of the stuff. It looks to be about the size of a tube of toothpaste; easy enough to conceal and carry with you anywhere on your travels. You can’t quite make out the label from where you’re sitting. <i>“I wouldn’t leave my ship without a tube of the stuff. It’s as important as my keys!”</i>");

	output("\n\n<i>“Good,”</i> Paige says, and then turns back to you; with both of you naked, she resumes her earlier position and straddles you, eagerly humping herself along your legs as her mouth meshes with yours. You wrap your arms around Paige, your tongue exploring her mouth; you lift yourself every time Paige draws herself backward, to elongate her humping and make it better for her.");

	output("\n\nOut of the corner of your eye, you see Kiro twist the cap of the tube off and squirt a handful of the clear, runny oil into the palm of her hand. ");
	if(pc.biggestCockLength() >= 15) output("Paige hums in hesitation as she humps against you and your immensity; she bites her lip as she looks pleadingly over her shoulder to Kiro. <i>“Give [pc.himHer] some of that oily-whatever, would you?”</i> she asks. Kiro chuckles as she does as she’s asked, and after splashing a bit of it onto her palm, begins lathering you, from crown to root, in whatever product it is – and, for good measure, she runs her open palm across Paige’s cooch, getting it nice and lubed as well. ");
	output("Just as she begins lubing up her still-flaccid-but-fixing-that cock, you have a thought:");

	output("\n\nDo you sit here and keep your attention on Paige, and try and make the focus about her for this tryst? Do you push Paige off you and get the both of you to focus on Kiro and her inflating horsecock, to be used on you both? Or do you lay back and let the girls work their magic on you, and revel in the attention they could give?");

	processTime(25);
	pc.lust(15);
	clearMenu();
	//[=You=][=Paige=][=Kiro=]
	// end scene (scene: PKTSI)
	addButton(0,"You",PKTSY);
	addButton(1,"Paige",PKTSP);
	addButton(2,"Kiro",PKTSK);
}

//[=You=]
// (scene: PKTSY)
// Action tree: https://i.imgur.com/kgEjocX.png
public function PKTSY():void
{
	clearOutput();
	showPaigeAndKiro(true);
	author("B!");
	//Used to randomly pick a path for herms (and lock it in for the duration of the threesome so different random checks dont spit out non-sequitors)
	if((pc.hasCock() && !pc.hasVagina()) || (pc.isHerm() && rand(2) == 0)) 
	{
		pc.createStatusEffect("PAIGE_KIRO_COCKPATH");
		pc.setStatusMinutes("PAIGE_KIRO_COCKPATH",300);
	}
	var args:Array = ["PKTSY"];
	output("Hopefully it’s not too selfish to admit, but... like Kiro ");
	//if {not first time}
	if(flags["PAIGE_KIRO_THREESOMES"] == undefined) output("once ");
	output("said, you’re in your personal quarters with two horny ladies that said that they’re fine with sharing you. What hot-blooded, sapient mammal would look away from the opportunity of having themselves be the star of a threesome?");

	output("\n\nYou let Paige rock herself back and forth against you, and with each press forward, she grows more and more insistent and forceful. You let her, and eventually, Paige is pushing you on your [pc.chest], directing you to lie backward. When you do, Paige continues her motions, but doesn’t try to properly straddle you");
	if(pc.hasCock()) output(" and take yourself inside of her");
	else if(pc.hasVagina()) output(" and start properly fucking you, woman to woman");
	output("; instead, while she falls back with you and kisses at your neck and collar, she continues to fuck at your thigh.");

	output("\n\n<i>“Save some for the rest of us, Bookworm, you slut,”</i> Kiro chides as she climbs onto the bed on your other side. The bed creaks under the additional weight of the Kui-Tan, and when her warm body slides itself against your right side, you feel the wet, hot flesh of her still-not-fully-erect cock press against your other [pc.thigh], prodding at nothing and leaving its own trail of fluids along your [pc.skinFurScales] as she goes.");
	output("\n\n<i>“I’m not fucking [pc.himHer] yet; this</i> is <i>me saving some for you, you whore,”</i> Paige retorts, pulling away from you just slightly to give Kiro some room.");
	output("\n\n<i>“Whores do this for money, idiot,”</i> Kiro says, her eyes on you the whole time. She lays herself gently along your arm, trapping your bicep between her two, fluffy tits; your fingers draw lines along her tummy as she draws herself upward, until they collide gently with the root of her dong. She pouts her lips at you, begging for some sugar; you lean down and kiss her fully, and give her shaft a few tugs while your hand is down there.");
	output("\n\n<i>“I guess that makes us both sluts,”</i> Paige replies, laughing a little bit. She leans across your [pc.chest], bringing her face up to yours and Kiro’s, waiting patiently for her chance to get in.");
	output("\n\nKiro pulls away, licking at your [pc.lips], and then hers. <i>“I guess that does. I’m okay with that.”</i> She giggles to herself as she leans towards Paige, and the two ladies start making out in front of you, inches from your face; you can see the tastebuds in their tongues when they pull apart just enough to explore each other’s maws.");
	output("\n\nThey stop kissing each other; Paige leans towards you, her tongue snaking out prematurely, and you suck it into your mouth, running your own [pc.tongue] along the buds of her own. Paige continues to fuck your leg; you wrap your left hand around her back, your hand clapping onto the sturdy, strong meat of her ass and giving it a grope.");
	output("\n\nYou try to multitask between kissing Paige, feeling up her ass, and stroking Kiro; all the while, Kiro makes things harder by slipping your [pc.nipple] into her mouth, sucking on your [pc.chest]");
	if(pc.isLactating()) output(" and eagerly slurping down your nutritious [pc.milkNoun] with every elongated suckle");
	output(". Making matters ‘worse,’ you feel Kiro’s right hand and Paige’s left rub soft, elongated circles on your [pc.belly], unsubtly making their way towards your crotch.");
	output("\n\nAll three of you are pretty horny. You could get right to the bottom of things if you wanted; you doubt any of you needs any further encouragement. Kiro’s about as hard as she’s going to get. Or, you could let the girls continue to have their way with you – who knows what’ll happen when they work their way between your legs?");

	processTime(10);
	pc.lust(30);
	clearMenu();
	//[=Stay Still=][=Get To It=]
	// end scene (scene: PKTSY)
	addButton(0,"Stay Still",PKTSYSS,args);
	addButton(1,"Get To It",PKTSYGTI,args);
}

//[=Stay Still=]
// (scene: PKTSYSS)
public function PKTSYSS(args:Array):void
{
	clearOutput();
	showPaigeAndKiro(true);
	author("B!");
	args.push("PKTSYSS");
	output("You’re feeling awfully lethargic with two beautiful women fawning over you and showering you with their adoration and affection. You aren’t exactly in a rush to hurry things along.");
	output("\n\nAll three of you maintain your individual paces; Paige explores your mouth with her tongue voraciously while Kiro entertains herself by humping into your hand and lathering your boob with her kisses and licks. Your eyes flutter closed in the soft, wet warmth of their mouths and bodies – you could fall asleep like this if you aren’t careful.");
	output("\n\nWith perfect, seemingly practiced unison, both Paige and Kiro’s hands meet at the valley of your crotch: y");
	if(pc.hasCock()) output("ou feel a deft hand wrap insistently around your [pc.cock], fingers closing around the turgid flesh, their tips gently raking across the skin to massage and wonder at your stiffness");
	if(pc.isHerm()) output(". On the other side, y");
	if(pc.hasVagina()) 
	{
		output("ou feel a devious, questing set of fingers dip further");
		if(pc.balls > 0) output(", gently massaging at the flesh of your [pc.sack]");
		output(", seeking out your winking wet treasure. When it’s found, the fingers crease your vulva between them, lighting pinching and pulling at your sensitive folds, while palming gently at your [pc.clit]");
	}
	output(". You thrust your [pc.hips] upward instinctively, before reeling yourself in, collecting yourself underneath the ladies.");

	output("\n\n<i>“You like that, [pc.name]?”</i> Kiro asks you in between lascivious licks around the edge of your areola. Your mouth is busy, and you were taught to not talk when it’s full, so you hum in affirmation. Your body quivers in restrained pleasure as you try to not vigorously fuck their hands in pleasure. <i>“Hey Bookworm, maybe you can put that mouth of yours to some better use, eh?”</i>");
	output("\n\nPaige’s hips haven’t stopped grinding against your [pc.leg] the entire time. Without breaking her stride, she pulls away from you, sucking in a breath of air as she licks her lips. <i>“But [pc.name] tastes so good,”</i> she whines, and sticks her tongue right back where it belongs: against yours.");
	output("\n\n<i>“And I bet [pc.heShe] would taste even better somewhere else,”</i> Kiro goads. Her tasting tongue and luscious lips start pockmarking their way down your body, towards their real goal. <i>“But hell, if you don’t want any, then there’s more for me.”</i>");
	output("\n\nPaige sighs in resignation as she pulls away from you. <i>“Alright, Kiro, you’ve convinced me,”</i> she says lustfully, before doing the same and trailing her tongue in a single, long, wet line down your neck, then over your [pc.nipple], then across your [pc.belly], until she’s level with Kiro.");

	// Continue here if the PC is herm
	if(pc.isHerm())
	{
		output("\n\n<i>“That’s what I thought,”</i> Kiro says smugly, her mouth muffled slightly by the [pc.skinFurScales] of your pelvis. With deft, sensual fingers, Kiro lightly grips at the base of [pc.eachCock], steadying you, but quickly replaces them with her lips; she lightly nibbles at your [pc.base], letting your dick flop across her snout and dribble your pre-cum across her cheek, while her free hand dips further south, seeking out your feminine treasure. When Paige levels herself with Kiro, she tilts her head, lifting your tool upward to offer it up; once Paige finds it, she eagerly takes you into her mouth, freeing Kiro to tend to you elsewhere.");
		output("\n\nYou’re bombarded on both sexes by the women having their own unique ways with you. Paige doesn’t waste any time in taking your length into her mouth, slurping noisily at your length, her tongue darting out and making long, washing swathes across your skin and eagerly drinking down each heady spurt of pre-cum; meanwhile, Kiro is beneath you");
		if(pc.balls > 0) output(", your [pc.balls] resting snugly on the bridge of her nose");
		output(", her mouth pressed insistently against your [pc.vagina], kissing at your sensitive petals and her tongue thrusting into you, curling and twisting, seeking out every nerve cluster inside you.");
		output("\n\nYou thrust your [pc.hips] impishly against the two women, but as you are, your movements aren’t specific; thrusting into Paige’s mouth means moving away from Kiro’s, and pressing into Kiro’s tongue means sliding away from Paige’s. Your movements are erratic and uncontrolled; you’re totally at the mercy of the two pirates as they feed from the myriad of sexual fluids you give to them.");
	}
	// Continue here if the PC is pure male
	else if(pc.hasCock() && !pc.hasVagina())
	{
		output("\n\n<i>“That’s what I thought,”</i> Kiro says smugly, her mouth muffled slightly by the [pc.skinFurScales] of your pelvis. Your [pc.cock] grinds lightly against her neck and cheek as she kisses at you; when Paige levels herself with Kiro, she tilts her head, pushing her lips against Paige’s and darting her tongue into her mouth, replacing your own and making sure Paige’s tongue is never too idle.");
		if(pc.cockTotal() == 1) 
		{
			output("\n\nWith deft, sensual fingers, Kiro lightly grips at the base of your [pc.cock], steadying it. The shaft glides smoothly against the necks of the two women; without pulling too far away, Kiro angles it upward, until it bumps them both in the chin. Both ladies seamlessly separate from each other, allowing your shaft in between their lips.");
			output("\n\nTheir tongues lick and their lips purse at all different points along your dick, making sure to not leave a spot of it untouched. Kiro’s eyes are on yours the entire time, narrowed as if to dare you to move, while Paige’s have closed in pure, sexual bliss and subservience; you don’t think you’ve ever seen her as content as she is now, with her lover’s cock in her mouth, being shared with her closest childhood friend.");
		}
		else
		{
			output("\n\nWith deft, sensual fingers, Kiro lightly grips at the base of [pc.eachCock], steadying them. The shafts of your dicks glide smoothly against the necks of the two women; without pulling too far away, Kiro angles them upward, until they bump them both in the chin. One cock apiece, they pull apart enough to let the shafts press in between their lips, where they each tend studiously to their assigned dick.");
			output("\n\nTheir techniques couldn’t be more different: Kiro teases you relentlessly, her touches light and erotic but never giving you the satisfaction of penetrating her lips; whereas Paige, the thirsty girl, wastes no time in sliding your [pc.cock 1] into her mouth, bobbing hungrily on you, slobbering along the length of your organ. Kiro’s eyes are on yours the entire time, narrowed as if to dare you to move, while Paige’s have closed in pure, sexual bliss and subservience; you don’t think you’ve ever seen her as content as she is now, with her lover’s cock in her mouth, being shared with her closest childhood friend.");
		}
	}
	// Continue here if the PC is pure female
	else if(pc.hasVagina())
	{
		output("\n\n<i>“That’s what I thought,”</i> Kiro says smugly, her mouth muffled slightly by the [pc.skinFurScales] of your pelvis. She aligns her chin just slightly so that you can feel the fur of her face tickle at your [pc.vagina] and you can feel your own radiating, sexual heat bounce off her and back onto you. When Paige levels herself with Kiro, she tilts her head, pushing her lips against Paige’s and darting her tongue into her mouth, replacing your own and making sure Paige’s tongue is never too idle.");
		if(!pc.isNaga()) output("\n\nThe girls each put a hand on the inside of your [pc.thighs] to push them apart and make room for themselves");
		else output("The girls settle on top of your [pc.leg], getting themselves comfortable on your larger lower body");
		output(", their faces inching closer and closer to their ultimate goal: your sopping wet and ready [pc.vaginaNounSimple], itself eager for something to suck. And when Paige and Kiro get within striking distance, they give it exactly what it wants.");
		output("\n\nYou thrust your [pc.hips] upward in surprise and pleasure as both of their tongues dart into your honeypot. Their techniques are very dissimilar and practically signature of themselves: Kiro’s tongue glides sensually inside you, carefully mapping out your tunnel and noting where the most sensitive spots are, and then deftly avoiding them, teasing you to your limits; whereas Paige’s tongue thrusts in and out and licks everywhere like a mutt that found a peanut butter jar with no lid. They don’t pull away from each other; their lips are just as pressed to each other as they are to yours, and with every movement their tongues make inside your body, they make against each other.");
		output("\n\nYou groan in delight as they work you over, each displaying their own skills and tendencies when it comes to eating out their woman. Surefire Kiro’s eyes are on yours the entire time, narrowed as if to dare you to move, while Paige’s have closed in pure, sexual bliss and subservience; you don’t think you’ve ever seen her as content as she is now, with her lover’s cunt in her mouth, being shared with her closest childhood friend.");
	}
	// Merge here
	output("\n\nYou’re paralyzed with pleasure as the women work you and your loins over. Every kiss feels electric; every tongue feels like a sensual massage. Your fingers clench first at the sheets of your bed, and then helplessly at their hair; you grip at Paige’s pointed ears, squeezing them just slightly, and you ruffle your fingers through Kiro’s locks. Every time one of them hits a particularly sweet spot, you clench and hiss; in response, Paige keeps doing what she does, while Kiro deliberately avoids doing what she just did again.");
	output("\n\nAfter several moments, the two girls grow more and more animated, more <i>hungry</i> and <i>needy</i> for something a little more substantial than ");
	if(pc.hasCock()) output("a cock in the mouth");
	if(pc.isHerm()) output(" and ");
	if(pc.hasVagina()) output("a cunt to tongue-fuck");
	output(". They occasionally swap places with each other, attacking at you from different angles, while taking the time on each pass to sloppily make out with each other for a moment before pressing on.");
	output("\n\nIf you don’t take the initiative to move the group forward, there’s a good chance that one of them might. But hell, maybe you’re okay with that....");
	processTime(20);
	pc.lust(30);
	clearMenu();
	//[=Let Them=][=Get Ridden=]
	addButton(0,"Let Them",PKTSYLT,args);
	addButton(1,"Get Ridden",PKTSYTIF,args);
	// end scene (scene: PKTSYSS)
}

//[=Get To It=]
// (scene: PKTSYGTI)
public function PKTSYGTI(args:Array):void
{
	clearOutput();
	showPaigeAndKiro(true);
	author("B!");
	args.push("PKTSYGTI");
	// Continue here if the PC has a penis (50/50 chance on this scene playing if the PC is a herm)
	if(pc.hasStatusEffect("PAIGE_KIRO_COCKPATH"))
	{
		output("With Paige on your left, eagerly sucking on your tongue and humping your [pc.leg] like the horny bitch she is, and Kiro on your right, tending to your needy nipples and humping slowly against your hand as it clasps her cock’s base, you’re feeling a bit... energized. [pc.EachCock] stands on end, bloated and ready for action; with each backward pass Paige makes on your body, you subconsciously hump up against her, hoping that she’d bend just a little bit further and slip you into her....");
		output("\n\n<i>“I think someone’s ready, Bookworm,”</i> Kiro says delightedly, pulling away from you and standing at the foot of your bed. You’re a bit distracted with the Ausar tasting your tonsils, but from the corner of your vision, you finally get a look at exactly how ready Kiro is for some action: her horsecock, as thick around as her arm, points toward you, blooming obscenely with her heartbeat. You stare into the cumslit as if it were trying to intimidate you.");
		output("\n\nPaige finally pulls away, giving you both a chance to catch your breath. <i>“Gods above, I hope you are,”</i> she says huskily, kicking her left leg up to properly straddle your whole pelvis rather than just your [pc.leg]. When she leans back, she brushes and squats onto [pc.oneCock], the heat from her gash crashing onto your sensitive organ in a single, forceful wave. She hisses in pleasure as her cunt hotdogs your length, lubing your [pc.cock] with herself.");
		output("\n\nYou don’t have any time to brace yourself: when Paige’s cunt comes into contact with your [pc.cockHead], she impatiently squats her lower body onto you, engulfing you inside her. Her teeth clench, filtering her lustful exhalation; her hands grip onto your [pc.chest], groping at the flesh there, as she sinks lower and lower onto you, ");
		//if (pc.cockLength <= 15)
		if(pc.cocks[0].cLength() <= 15) output("until she bottoms out, her pussy pressing gently against your pelvis");
		else output("until she can’t take any more, and she growls in frustration at how much more of you is left exposed to the air");
		output(".");
		pc.cockChange();

		output("\n\nKiro hums in delight, one hand stroking her steely horsecock as she enjoys the show before her. She palms calmly at her flat, bloated cock head, taking the dollop of pre cum that’s collected there and using it as lube for the rest of her shaft. <i>“Now, my goodness, if that isn’t a sexy sight,”</i> she muses as she watches her best friend get railed in the cunt.");

		output("\n\nYour eyes cross in pleasure as your horny Ausar slowly brings herself back up, adjusting herself to your length. She bites her lip as her ");
		if(paigeBlind()) output("blind ");
		output("eyes flit between you and Kiro, and whenever Kiro says anything and walks anywhere, she clenches a bit on you – maybe she likes having an audience? Or maybe she just likes having Kiro as an audience?");
		output("\n\nKiro, of course, isn’t too keen on being left out. She heads towards the opposite side of your bed, intentionally swaying her hips to make her masculine features sway in the air with her movement.");
		output("\n\n<i>“I got good news for you, [pc.name],”</i> she says as she grips the base of her cock, angling it so that it slaps against your forehead before she steps forward, drawing its length down your face. <i>“The best part about getting in bed with two horny ladies is that no part of you gets left out of the action.”</i> She presses on your forehead, tilting your head backward as she steps back, until her bloated cock head is lined up with your [pc.lips]. <i>“Deep breath and open wide, sexy.”</i>");
		output("\n\nYou do as she says, and as soon as your lips part, your mouth is invaded by Kiro’s massive cock. While your mouth does stretch to accommodate her, it’s not painful or stressful at all – you taste the elasticizing oil on the skin of her shaft, and you feel its magic work on you, allowing your mouth to stretch and her cock to compress enough that the penetration is enticing without being painful.");
		output("\n\nYou’re relentlessly railed from both ends: as soon as Kiro penetrates your mouth, Paige, in her excitement at sharing you with her best friend, begins humping harder on you, taking you more urgently into you. When she presses down onto you, you shuffle back, inadvertently taking more of Kiro into your gullet, until her massive equine, smooth-skinned balls envelope the crease of your eyes and blind you with her ballsack. And when Kiro thrusts forward – deep enough to be pleasurable but not deep enough to choke you – you’re pushed back into Paige, starting the cycle anew.");
		output("\n\nA new pair of hands falls to your [pc.chest], laying atop Paige’s own. Your body grows hot, surrounded on both sides by moving, bristling fur. All you feel is the pleasure of having a tight, hot cunt on your [pc.cock] and the rigid textures of the one comfortably fucking your mouth. And, at first, all you heard was the pleasured panting of two horny women having their way with you, but that’s quickly replaced with the sounds of their tongues exploring each other and lips seamlessly gliding over one another.");
		output("\n\nThe rhythm you’ve been put into beneath the two ladies continues for some time – you have no sense of it, when all your senses revolve around being fucked, and all you see is the taut flesh of Kiro’s ballsack thrusting against you over and over. You currently don’t have any control of the pace or the action. You could change that, if you wanted....");
	}
	// Continue here if the PC has a vagina (50/50 chance on this scene playing if the PC is a herm)
	else
	{
		output("With Paige on your left, eagerly sucking on your tongue and humping your [pc.leg] like the horny bitch she is, and Kiro on your right, tending to your needy nipples and humping slowly against your hand as it clasps her cock’s base, you’re feeling a bit... energized. Your [pc.vaginaNoun] is wet as could be, and with every other motion that the two girls make against you, you shiver in anticipation, your cunt clenching in reflex, hoping to capture something within it.");
		output("\n\n<i>“I think someone’s ready, Bookworm,”</i> Kiro says delightedly, pulling away from you and standing at the foot of your bed. You’re a bit distracted with the Ausar tasting your tonsils, but from the corner of your vision, you finally get a look at exactly how ready Kiro is for some action: her horsecock, as thick around as her arm, points toward you, blooming obscenely with her heartbeat. You stare into the cumslit as if it were trying to mesmerize you, and it works – you wish for nothing more than Kiro to take herself and make you hers.");
		output("\n\nPaige finally pulls away, giving you both a chance to catch your breath. <i>“Knowing you, Kiro, [pc.heShe] better hope [pc.heShe] is,”</i> she says huskily. Paige disengages from you, her furry body sliding up yours; she grips you by the back of your head to keep you in place as she first rubs her soft, C-cup boobs against your face; then, her rock-hard, well-defined abs; then, the button of her clit bumps you in the nose, and you’re assaulted with her musk.");
		output("\n\nYou try to lean forward to take herself into your mouth, but she doesn’t let you just yet; instead, she swings one leg over you, and then the other back across, until she’s squatting over your face, facing Kiro. Then, without your consent or preparation, she sits, assaulting your face with her warm, velvety, delicious sex.");
		output("\n\nHer thighs clench on either side of your head, and you hear her hiss in delight; she slowly begins to rock back and forth, dragging herself across your face and getting her pussy all over it, from your willing [pc.lips] to both your cheeks. When she grinds along your nose, she tries to push down slightly, trying to fuck herself with it.");
		output("\n\nYou can’t see Kiro, surrounded on all sides by Paige as you are, but you can hear her and you can feel her. <i>“Now, my goodness, isn’t that a sexy sight?”</i> she asks as she watches her best friend excitedly fuck your face. <i>“See, [pc.name], this is the best part of being in a threesome with two horny ladies.”</i>");
		output("\n\nYou jerk in surprise when you feel Kiro’s questing fingers massage the sensitive folds of your [pc.vagina]. She tweaks at your [pc.clit] a little, and hums in ascension when your [pc.hips] quiver in restraint at the touch. And then she replaces her hand with something much larger, flatter, duller, hotter, and wetter. <i>“The best part about it, and hell, any threesome, really, is that no part of you is left out of the action.”</i>");
		output("\n\n<i>“Fuck [pc.himHer],”</i> Paige pleads, her own body shivering in delight with each hungry pass your [pc.tongue] makes inside her. <i>“Fuck [pc.himHer] good, Kiro.”</i>");
		output("\n\n<i>“You got it, Bookworm,”</i> Kiro responds, and you feel yourself contort around her as she pushes into you; there’s a bit of resistance at first, but then the elasticizing oil on her cock works its magic, and, with a bit of insistence, the flat of her cockHead slips between your yawning vulva, until you’re wrapped around her like a sexy glove.");
		pc.cuntChange(0,kiro.cockVolume(0)/25);
		output("\n\nBut that’s just the tip, and you feel Kiro push into you: every wondrous, overpowering inch of her length counts their way inside of you as Kiro thrusts forward. You can hardly control your flailing lower body as she fills you like few cocks in the universe truly can; Kiro grabs hold of your [pc.legs] to steady you, then wraps yourself around you, wearing your [pc.legs] like a belt until she bottoms out, her leathery scrotum resting hotly against your [pc.ass].");
		pc.cuntChange(0,kiro.cockVolume(0));

		output("\n\nPaige sighs as she ");
		if(!paigeBlind()) output("watches");
		else output("feels");
		output(" Kiro hilt herself completely inside your receptive gash; her own body tenses in delight, knowing that her best friend is fucking you, that they’re both sharing you. Her hands fall to your [pc.chest] for leverage, and she resumes her bucking against your face, fucking it for everything it’s worth.");

		output("\n\nEvery time Paige squats on you, the impact ripples through your body towards Kiro, pushing you just millimeters down her thick tree trunk of a dick; Kiro reciprocates in kind, bucking into you and planting herself inside you, and the ripple bounces back up your body and shuffles your face against Paige’s sopping cunt, causing your [pc.lips] to slide along hers and your tongue to wriggle a bit inside her.");

		output("\n\nYour senses are absorbed in everything Paige: her toned ass rests gently onto the crease of your eyes, rocking back and forth as she humps your face; all you taste is her; all you smell is her; and, for a time, all you heard was the gentle panting of the two girls having their way with you, until you feel a second pair of hands fall onto your [pc.chest], on top of Paige’s, and the panting is replaced with the muffled moans and slimy licks of two tongues wrestling and two lips gliding over each other.");
		output("\n\nThe rhythm you’ve been put into beneath the two ladies continues for some time – you have no sense of it, when all your senses revolve around being fucked, and all you see is the bristly fur of Paige’s ass rubbing against you over and over. You currently don’t have any control of the pace or the action. You could change that, if you wanted....");
	}
	processTime(15);
	pc.lust(30);
	//[=This Is Fine=][=Buck Back=]
	// end scene (scene: PKTSYGTI)
	addButton(0,"This Is Fine",PKTSYTIF,args);
	addButton(1,"Buck Back",PKTSYBB,args);
}

//[=Let Them=]
// (scene: PKTSYLT)
public function PKTSYLT(args:Array):void
{
	clearOutput();
	showPaigeAndKiro(true);
	author("B!");
	args.push("PKTSYLT");
	output("You lay back. They’re treating you like a " + pc.mf("king","queen") + " with their attention; why would you want to change something like this? You know that one of them is probably going to change it up, but you’re looking to ride this out for as long as you can.");
	output("\n\nIt only goes for a few more minutes, with more of the same: by the time Kiro pulls herself to her feet, your crotch and your inner thighs are positively soaked in their combined spit. <i>“Damn, but don’t you taste good,”</i> Kiro says, leaning over your body and gripping onto your wrist. With a fierce tug, you and your oversensitive loins are pulled to your feet. <i>“But now I wonder how you feel.”</i>");
	output("\n\nKiro steps behind you, her massive horsecock batting you in the side as she steps around you; when she gets into place behind you, she drags it between your bodies, until it springs up, flinging a bit of pre cum onto the back of your neck, the head of her massive dick poking you between your shoulderblades. Then, she wraps both her arms around your [pc.chest], pressing her own fluffy boobs into your spine; and then she falls backward, taking you with her.");
	output("\n\n<i>“Hope you enjoyed the attention,”</i> Kiro whispers in your ear, nibbling and tugging at it slightly as her hips frot her turgid, pulsating cock between you two, <i>“because it’s time you gave a little bit back.”</i> She hotdogs herself between your bodies; her cock lodges itself between her breasts as she fucks herself along your spine. <i>“Paige, honey, guide me in, would you?”</i>");
	output("\n\nYou look down your body, to Paige, who hums in delight at the command; one hand goes to your [pc.belly], rubbing at it sensually, as the other dips down to reach between you and Kiro. She fondles and plays with the base of Kiro’s cock a bit, enjoying the heat and thickness of it, before she pulls; you feel Kiro’s cock slide out from between you two, leaving a wet trail on her fur and across the [pc.skinFurScales] of your back.");
	output("\n\n<i>“Lift, sweet thing,”</i> Paige says, the hand on your stomach going to your [pc.ass] and lifting slightly. You comply, and when you do, you suddenly feel the flat tip of Kiro’s equine dong jab at your right buttcheek. <i>“And a bit to the left...”</i> she muses to herself, adjusting her aim a bit, until all three of you find the mark: Kiro’s tip, lodged snugly against your [pc.vagOrAss], ready to push in and split you apart.");
	output("\n\n<i>“Kiro,”</i> Paige says, panting in excitement as she leans over you. <i>“Don’t be gentle.”</i>");
	output("\n\nKiro sighs wistfully, her eyes narrowing on Paige in adoration. <i>“That’s the Paige I remember.”</i> She pushes her lips to your ear, licking at its rim. <i>“Don’t you just love it when your partner knows what they want?”</i>");
	output("\n\nYou don’t remember being asked what <i>you</i> want.");
	output("\n\n<i>“You’ll want more in just a moment, angel,”</i> Kiro answers smugly.");
	output("\n\nOn Paige’s command, Kiro thrusts into you, the blunt head of her dick penetrating you. You tense at first, expecting at least a bit of pain from having so wide inside you, but instead, you feel a delightful, wet tightness – the elasticizing oil is working its magic on your body, making you stretchy and making Kiro easier to take inside your [pc.vagOrAss]. Once she enters you, the strength leaves your lower body, and you sink, inadvertently shucking more and more of that Kui-Tan cock into you.");
	output("\n\n<i>“Hold on,”</i> Paige asks; Kiro does as she’s told and does not thrust. You feel her twitch and leak inside you; her every heart beat pounds through your body like a drum while your flesh wraps around hers.");

	// Continue here if the PC has a penis
	if(pc.hasStatusEffect("PAIGE_KIRO_COCKPATH"))
	{
		output("\n\nWith you kept still, your [pc.cock] almost painfully erect, Paige crawls over you both, straddling your waist and bringing her steaming hot cunt to your rigid tool. She presses it flat against your body with herself as she grinds up your shaft, but she doesn’t keep the teasing up for long: as soon as she finds your [pc.cockHead], she guides it into herself, and she devours you in a single, easy glide.");
		pc.cockChange();
		output("\n\n<i>“Thanks for the wait,”</i> she says through hushed breath as she and Kiro begin pounding you from both ends. When Paige thrusts herself down, clapping her hips against yours, you’re forced to bound down onto Kiro’s meaty horsecock; Kiro, in turn, pushes upward, into your welcoming [pc.vagOrAss], pushing you up into Paige.");
		output("\n\nYou’re trapped between the fluffy, furry, fit bodies of the Tamahime Pirates as they fuck you wantonly, with no regard for any rhythm, at least at first. Kiro’s heavy boobs cushion your shoulders when Paige pounds you down, her hard nipples etching maps into your back; her hands wrap around to your [pc.chest], groping at what she finds there and playing with your [pc.nipples].");
		if(pc.hasVagina()) pc.cuntChange(0,kiro.cockVolume(0));
		else pc.buttChange(kiro.cockVolume(0));
		output("\n\nPaige, after a time, leans forward, wrapping her arms around your both, her own perky tits kissing against your [pc.chest] and against Kiro’s hands, surrounding them with boob. Your upper body is sandwiched into a wonderfully warm, active massage of fur and titflesh, while your lower body is relentlessly pounded and extoled for their pleasure.");
		output("\n\nWith the aggressive pounding your [pc.vagOrAss] is taking, and with the rough ride Paige is taking on your [pc.cock], you don’t last as long as you’d have liked. You’ll be sore when it’s over, but it’s the type of soreness that you wish could last forever.");
	}
	// Continue here if the PC does not have a penis
	else
	{
		output("\n\nWith you kept still, Kiro’s horsecock resting patiently inside your body, Paige crawls over you both, straddling your waist and bringing her steaming hot cunt to your crotch. She frots against you a few times, letting her own juices wash over your body as she teases you and Kiro. But, she’s horny and doesn’t need teasing herself; she draws herself backward slightly, until the vulva of her gash folds themselves over the thick of Kiro’s shaft as it’s plugged into you. Whenever Kiro thrusts in or out, she’ll rub the underside of herself along Paige’s cunt.");
		output("\n\n<i>“Thanks for being patient. Give [pc.himHer] all you got, Kiro,”</i> Paige permits. Kiro takes the invitation gladly; she starts energetically thrusting into you, her dick sawing in and out of your [pc.vagOrAss], and with every motion she makes, Paige’s body shivers in pleasure, her pussy stimulated by the auxiliary grinding.");
		output("\n\nYou’re trapped between the fluffy, furry, fit bodies of the Tamahime Pirates as they fuck you wantonly, with no regard for any rhythm, at least at first. Kiro’s heavy boobs cushion your shoulders when Paige pounds you down, her hard nipples etching maps into your back; her hands wrap around to your [pc.chest], groping at what she finds there and playing with your [pc.nipples].");
		if(pc.hasVagina()) pc.cuntChange(0,kiro.cockVolume(0));
		else pc.buttChange(kiro.cockVolume(0));
		output("\n\nPaige, after a time, leans forward, wrapping her arms around you both, her own perky tits kissing against your [pc.chest] and against Kiro’s hands, surrounding them with boob. Your upper body is sandwiched into a wonderfully warm, active massage of fur and titflesh, while your lower body is relentlessly pounded and extolled for their pleasure.");
		output("\n\nYou can only hold on for so long, assaulted as you are by the two ladies having their way with you. Kiro fills you like you’ve scarcely been filled before, her lubed dick hitting every passage inside you that you didn’t know you had; and, while Paige isn’t fucking you as properly as you’re sure she’d like, there’s nonetheless a hot, fit Ausar lady that’s humping against you and is on the verge of her own orgasm. You can’t help but get a little closer, knowing all that.");
	}
	// Merge here
	output("\n\nPaige, sensing your proximity to your orgasm, brings her face to yours, gently cupping your cheeks even as she vigorously pounds herself into you. She displays impressive body control as she keeps her upper body still while her hips are jackhammering hard and fast. She kisses you, somewhat chastely at first, but the façade dissolves quickly as she starts licking the roof of your mouth. <i>“Tell us how much you like it,”</i> Paige implores you, her eyes on yours. <i>“Let us know you want more.”</i>");
	output("\n\n<i>“Sing for us, angel,”</i> Kiro agrees, her hot breath panting against your neck and shoulder. Her own body shakes and her own thrusting into you is becoming more and more haphazard and eager. The sound of her big Kui-Tan balls beating against your [pc.ass] almost drowns out her voice. <i>“Tell your ladies what they want to hear.”</i>");
	output("\n\nYou clench your teeth. You’re not sure if you can put the pleasure you’re feeling to words, but maybe you don’t need to, and they’ll settle for a loud, drawn out groan or something. When your orgasm hits you, it’s about all you could hope to achieve.");
	processTime(20);
	pc.lust(100);
	clearMenu();
	addButton(0,"Next",PKTSYE,args);
	//[=Climax=]
	// end scene (scene: PKTSYLT); go to (scene: PKTSYE)
}

//[=Get Ridden=]
// if coming from [=Get To It=], change this button to [=This Is Fine=]
// (scene: PKTSYTIF)
public function PKTSYTIF(args:Array):void
{
	clearOutput();
	showPaigeAndKiro(true);
	author("B!");
	args.push("PKTSYTIF");
	// Continue from here if coming from [=Stay Still=]
	if(InCollection("PKTSYSS", args))
	{
		output("Your [pc.hips] bounce off your bed impiously and unrestrained, eager to fuck both the mouths of the wonderful women doing what they’re doing to you. But, all the same, you like to think you’re hardly an unfair or selfish lover, and they both need something to do themselves. You glance down your body, ");
		if(pc.hasCock()) output("into Kiro’s eyes, and you demand that she get up here with that fat cock of hers and");
		else 
		{
			output("into Paige’s eyes");
			if(paigeBlind()) output(", even if she can’t meet your lustful gaze");
			output(", and you demand that she get up here with that delicious box of hers and");
		}
		output(" fuck your face.");

		if(pc.hasCock()) 
		{
			output("\n\nKiro yanks herself from you with a jerk, excited to do as you suggest. <i>“Music to my ears, angel,”</i> she says, her leaking horsecock bobbing underneath its own weight as she strides to the other side of your bed. When she gets up to your head, she grips herself just beneath her flat, flared head, and drags it along your neck, leaving a slimy trail of pre on your [pc.skinFurScales] until it’s pressed insistently against your [pc.lips].");
			output("\n\nBefore you get to work, Paige pulls away from you. <i>“And what would you have me do, sweet thing?”</i> Paige asks you innocently, her face resting against your [pc.cock], nuzzling it affectionately, letting you know what she wants you to say.");
			output("\n\nYou tell her to use her imagination. And with that, your mouth is too full to instruct her further.");
		}
		else
		{
			output("\n\nPaige gives you one last lick before standing, eager to do as you command. <i>“I was waiting for those magic words, sweet thing,”</i> she says, her drooling snatch leaving rivulets of her juices streaking down the inside of her thighs as she makes her way to the other side of your bed. She plays with herself as she goes, twiddling at her clit and dipping her fingers into her own honeypot, and when she gets to your head, she drags them across your [pc.lips], wetting them for the real test up ahead.");
			output("\n\nPaige pulls herself back onto the mattress, her knees on either side of your skull and ensconcing your vision from everything but her drooling, winking pussy. Before you get to work, though, Kiro stops going down on you. <i>“And just how am I supposed to entertain myself?”</i> she asks teasingly, her own fingers taking her tongue’s place as she fingerbangs you casually, letting you know what it is she wants you to say.");
			output("\n\nYou tell her to use her imagination. And with that, your mouth is too full to instruct her further.");
		}
		output("\n\n");
	}
	// Start here if coming from [=Get To It=], but continue here if coming from [=Stay Still=]
	// Continue here if the PC has a penis
	if(pc.hasStatusEffect("PAIGE_KIRO_COCKPATH"))
	{
		output("Your body relaxes as you accept your position beneath the two women. You don’t need anything in your life right now but them and the pleasure that comes with knowing that the three of you are working together to reach the same goal. That, and the pleasure that comes with having a thick horsecock fucking your throat raw, with its heavy, furry testicles butting you in the face with every push in; and the pleasure that comes with having a tight pussy fuck you with everything it can, eager and almost desperate to get the seed you’re so greedily keeping from it.");
		output("\n\nYour hands aren’t busy, so you busy them: you reach up, towards the only thing you can see, and heft each of Kiro’s balls in one hand, admiring their density. Your hands smooth the bristling fur along her balls, your fingers tickling at the taut flesh and gently massaging the cum surging around inside them to give you a hearty meal. And then you change it up, keeping one hand on her sack to trace along their cleft and using the other to wrap around the base of Kiro’s dick, jerking what little bit she can’t work into her mouth.");
		output("\n\n<i>“You ever wonder,”</i> Kiro says breathlessly as she fucks your throat, in between deep, throaty tongue-filled kisses she and Paige share, <i>“if we... deserve what we get?”</i>");
		output("\n\nA momentarily silence (between the creaking of your mattress; a cock wetly fucking a throat; two heavy balls slapping against a face; and a cunt sloppily fucking a second cock) as Paige and Kiro kiss some more. <i>“What do you mean?”</i> Paige asks, panting herself as she tries to maintain her stamina on top of you.");
		output("\n\n<i>“We’re pirates, Paige,”</i> Kiro answers as she readjusts her grip on your [pc.chest]. <i>“And here we are, with damn near the greatest... the greatest thing to happen to us both, just...”</i> Kiro loses her track of thought as the hand on her nuts makes a broad, smooth wipe over her left nut, reaching back just a bit to tease her perineum. <i>“[pc.name] is great at sucking cock, is what I’m trying to say here.”</i>");
		output("\n\nPaige laughs out loud at Kiro’s tact. <i>“[pc.HeShe] is a better lay than some of our targets back in the day, that’s for sure,”</i> she agrees. Her own hands play and search on your body, seeking out unoccupied and untouched spots of [pc.skinFurScales] to massage and caress. <i>“But yeah. Our lives would have taken a different direction without [pc.himHer].”</i>");
		output("\n\n<i>“I’ll say,”</i> Kiro mutters, remembering how you and she met.");
		output("\n\n<i>“And I gotta say,”</i> Paige continues, her hips swaying in circles on your [pc.cock] as she leans forward. You hear what sounds like light kissing, and Kiro’s upper body arches forward as she moans. The image of Paige sucking on Kiro’s titty fills your thoughts. <i>“There are worse ways to have ended up... I’m okay with all my decisions so far ending in a threesome with my closest friends.”</i>");
		output("\n\nKiro’s thighs quiver with excitement in their every push forward as her stiff cockflesh swabs at your throat; with every draw backward, your [pc.tongue] is rewarded with another thick dollop of her pre, and they’ve been getting more and more copious over time. As full as your mouth is, it feels as though it’s getting fuller with each thrust; Kiro’s cock is expanding in preparation for the load it’s about to deliver.");
		output("\n\n<i>“I know that look,”</i> Paige whispers, leaning back so she can sit on your [pc.cock] properly. <i>“You’re close, aren’t you, Kiro?”</i>");
		output("\n\nKiro doesn’t respond intelligibly; she tries to form a sentence, but it comes out as a few jumbled words with no proper beginning or end.");
		output("\n\n<i>“Let’s see it, Kiro,”</i> she implores. <i>“Cum in [pc.name]’s throat. Let’s see [pc.hisHer] belly get fat with your Kui-Tan cream.”</i>");
		output("\n\nThe ushering has an effect on both of the ladies: Kiro’s thrusting grows more deranged and haphazard, and she cares less and less for your own comfort as she takes what she wants from your mouth. And Paige: as the words leave her own mouth, she grows more excited, her cunt gripping onto your [pc.cock] with wetter abandon on every draw upward, and when she slides back down, she takes a bit longer to pull away.");
		output("\n\nAnd the words reach you as well: your loins bubble with the same familiar, rising heat and urgency as every other orgasm you’ve had, but with a different ferocity than you’re used to. Laying there, being used from both ends, has your hormones firing on all cylinders; when you cum, it’s going to be huge.");
		output("\n\n<i>“We’re all close,”</i> Paige says, continuing her by-now one-sided discussion. <i>“What better way to end this bang... than with a boom?”</i>");
		output("\n\nAs if on cue....");
	}
	// Continue here if the PC does not have a penis
	else
	{
		output("Your body relaxes as you accept your position beneath the two women. You don’t need anything in your life right now but them and the pleasure that comes with knowing that the three of you are working together to reach the same goal. That, and the pleasure that comes with having a thick horsecock fucking your cunt raw, with its heavy, furry testicles slapping against your ass with every push in; and the pleasure that comes with having a soaking wet pussy fuck your face with everything it can, eager and almost desperate to milk the tongue for the cum it can’t provide.");
		output("\n\nYour hands aren’t busy, so you busy them: you reach up, towards the only thing your eyes are capable of seeing, and grope and squeeze along Paige’s tight, toned ass. You run your palms along the smooth cheeks, with the grain of her fur, pulling them apart and pushing them together, and moving them off-rhythmically from each other. You change it up a bit, reaching up with one hand, and lightly grip at the base of her tail; you palm at the underside, where her tail meets her spine, knowing that it’s a particularly erogenous zone for her. The response you get is what you wanted: she shivers, sighs in delight, and her body stiffens on your face, followed by another delicious gush of her all-natural lube.");
		output("\n\n<i>“Damn,”</i> Paige says breathlessly as her hips continue their forward-and-back motions on your face, determined to get everything she can out of fucking it. <i>“Kiro... I don’t think I ever asked, but, do you... do you believe in karma?”</i>");
		output("\n\nA momentarily silence (between the creaking of your mattress; a cock wetly fucking a pussy; two heavy balls slapping against an ass; and a cunt sloppily fucking a face) as Paige and Kiro kiss some more. <i>“What do you mean?”</i> Kiro asks, panting herself as she tries to maintain her stamina inside of you.");
		output("\n\n<i>“It’s just, we haven’t exactly been the best of people in our time,”</i> Paige says as she readjusts her hips on your face. <i>“And despite that, you and I... here we are, fucking the daylights out of [pc.name]. After everything... [pc.heShe] has done for us both, and here, we’re...”</i> She loses her track of thought as the hand on her tail gives it a light tug, yanking on her thrashing limb and causing her lower body to tighten around your face. <i>“And on top of being such a wonderful person to us, [pc.name] knows how to eat a goddamn box.”</i>");
		output("\n\nKiro chuckles as she continues rutting against you, squeezing and squelching more and more of her thick dick into your tight tunnel. <i>“Don’t go getting me jealous, Paige. You’re making me wonder if [pc.heShe]’s just as good at sucking a dick.”</i> Her hands feel along your [pc.legs], sensually feeling down your body for new, unexplored spots to caress. <i>“But I hear you. Who knows where we would be without [pc.himHer].”</i>");
		output("\n\nPaige says nothing in response; she grunts as she continues to rut herself against your [pc.lips].");
		output("\n\n<i>“And, you know, on top of all the gushing,”</i> Kiro continues, before she’s interrupted by something. You hear what sounds like light kissing, and Paige’s upper body arches forward as she moans. The image of Kiro sucking on Paige’s titty fills your thoughts. <i>“I’ve been in a handful of threesomes before, but I’ve never been as emotionally invested as I have with this one.”</i>");
		output("\n\nPaige’s thighs flex involuntarily and spastically against your face the more she rubs against it and the deeper you drive your [pc.tongue] into her. When you twist your wriggling muscle to one side, Paige’s body leans with it, trying to keep you centered while also trying to get you to reach different spots. Her juices start to back up in your mouth, mingling with your own spit and submerging your tongue; you swallow when you need to breathe, and when you breathe, your lungs are filled with her musk, making you clench tighter on Kiro.");
		output("\n\n<i>“Getting close, Bookworm?”</i> Kiro asks, her own thrusting growing less casual over time. <i>“I’d recognize that face anywhere.”</i>");
		output("\n\n<i>“Don’t act like you aren’t,”</i> Paige responds. She tries to continue, but her tongue flops uselessly out of her mouth in her dazed, pleasured stupor.");
		output("\n\n<i>“Let’s see it then, you sexy bitch,”</i> Kiro chides. Her hands wrap around your waist for leverage, and she begins railing you much harder; the sound of your own messy eating is almost drowned out by the sound (and the feeling) of her hips and her bitch-breaking horsecock fucking you into the bed like she owns it. <i>“Lemme see you paint that pretty face of [pc.name]’s with your lady spunk. I wanna see [pc.himHer]</i> sink <i>into it.”</i>");
		output("\n\nHer words have their effect on all three of you: Paige, overcome with her lust, stops fucking you entirely and leans over you, her hands clamping somewhat painfully onto your [pc.chest], as she sinks herself onto your face. Kiro, watching her friend clench her body in oncoming orgasm, can’t stop the rising tide in her own loins as it rushes from her and into you. And you, with a cock in one end and a pussy plugging the other, your senses overwhelmed by the sounds, the feels, and the tastes, barely have the strength or the wherewithal to wrap your [pc.legs] around Kiro and hold her to you so she can seed you properly.");
		output("\n\n<i>“Let’s see it then, you two,”</i> Kiro implores.");
		output("\n\nAnd then....");
	}
	processTime(20);
	pc.lust(100);
	clearMenu();
	addButton(0,"Next",PKTSYE,args);
	//[=Climax=]
	// end scene (scene: PKTSYTIF); go to (scene: PKTSYE)
}

//[=Buck Back=]
// (scene: PKTSYBB)
public function PKTSYBB(args:Array):void
{
	clearOutput();
	showPaigeAndKiro(true);
	author("B!");
	args.push("PKTSYBB");
	output("As great as it is getting double-ended by these ladies, you’re not fond at the prospect of taking such a passive role beneath them. Time to change that.");
	// Continue here if the PC is male, or is herm and is fucking Paige
	if(pc.hasStatusEffect("PAIGE_KIRO_COCKPATH"))
	{
		output("You put your hands on Kiro’s abdomen and push her off; not hard enough to hurt, but hard enough to send her the message that you’d like her to stop fucking your throat. She complies; before either of them can try to ask what you intend to you, you sit up and reach for Paige’s wrists, grabbing them and twisting her, sending her crashing to the bed in your place.");
		output("\n\n<i>“Goodness me,”</i> Kiro says, amused, but from the way her dick spurts another dollop of warm pre into the air, which lands right on Paige’s face, she certainly enjoyed what she saw.");
		output("\n\nYou lift Paige’s legs and drape them around your [pc.hips], wordlessly commanding her to wrap them around you. She sighs in delight as she acquiesces, and hisses through clenched teeth when you reach between you two, grabbing your [pc.cock] and aligning it with her pussy once more. <i>“This is my favorite part,”</i> she says to Kiro. <i>“When [pc.heShe] really knows what–”</i>");
		output("\n\nYou don’t bother teasing your bitch; you thrust into her, straight down to the [pc.knot], and resume fucking her. Her hands clench at the sheets of your bed, and she chokes out a pleasured laugh, as you take what you want from her, and she is more than happy to give it.");
		output("\n\n<i>“Damn, look at you go,”</i> Kiro congratulates as you pound the hell out of Paige. She strokes herself as she watches the hardcore porn unfold in front of you; but, soon enough, she gets a hungry look in her eyes. <i>“But I’ll be damned if I’m going to sit out from this.”</i>");
		output("\n\nKiro makes her way around to the other side of the bed, towards you and your frantic fucking. You narrow your eyes on hers, inviting her to you, knowing how she intends to join you: when Kiro steps behind you, you feel her thick dick slap against your spine, and you feel it pulse, shooting a small squirt of pre up your back. Her hands come to a rest on your [pc.ass], and she slides her massive base in between your cheeks, frotting you with your every thrust.");
		output("\n\nYour motions are slower at first, relishing the unique sensations of fucking a woman while another big-dicked hermaphrodite gives you the most exaggerated of hotdog-ings, but Kiro moves too slowly towards the finish line for you. You growl over your shoulder that you both know that she needs something more than some rubbing.");
		output("\n\n<i>“Right you are, you horny [pc.boyGirl],”</i> Kiro agrees. She steps backward, letting her cock slide down your body, until her cock’s head lines up with your [pc.vagOrAss]. She gives it a quick, experimental tease and a push, knowing that she’ll fit regardless because of the oil coating her from tip to root – but she couldn’t help herself anyway.");
		output("\n\nYou and Paige wait impatiently for Kiro to begin, and thankfully, she doesn’t wait much longer: with a rowdy thrust, she sinks halfway into you, your [pc.vagOrAss] clenching and suffocating her cock as it slides inch after tantalizing inch into you. You feel tight around her, but not so much that it’s painful; a weird, ticklish sensation rocks around the rim of your hole, and you know that that must be the oil working its magic on you.");
		if(pc.hasVagina()) pc.cuntChange(0,kiro.cockVolume(0));
		else pc.buttChange(kiro.cockVolume(0));
		output("\n\nThe three of you settle on a recursive rhythm: when you push into Paige, Kiro, as if she’s trying to prevent you from escaping her, thrusts into you shortly after. When you withdraw, you push Kiro away from you, and when you stop, she slides out of you just slightly. Your motions are slow, and you’re not fucking Paige as quickly as you’re sure she’d like, but it’s difficult to focus on plowing your woman as best as you can when you yourself are filled to the brim with a needy, ready-to-burst horsecock.");
		output("\n\n<i>“Don’t you just consider yourself the luckiest " + pc.mf("man","woman") + " in the universe, [pc.name]?”</i> Kiro asks you, her breath hot and ragged on your shoulder. Every time she pushes into you, her heavy balls slap against your [pc.legOrLegs], and she hiccups out a small breath of pleasure. <i>“In the middle between two of the hottest pirates in the universe. Getting your dick wet and getting your ");
		if(!pc.hasVagina()) output("ass");
		else output("pussy");
		output(" stuffed. It, haaah, it wouldn’t be easy to convince any other yoga teacher or a big-dicked pirate to both fuck you at once.”</i>");
		output("\n\nYou ask Kiro if getting her and Paige to fuck you was supposed to be easy.");
		output("\n\n<i>“For you?”</i> Kiro laughs. You feel one hand reach for your cheek, directing you to look over your shoulder; when you do, Kiro’s lips meet your own, and her tongue invades your mouth ruthlessly, commanding you to suck on it. You suppose that’s Kiro’s answer.");
		output("\n\nPaige’s legs wrap around your [pc.hips], and she shuffles forward, trying to wrap them around Kiro’s hips as well. Her breath catches in her throat and she bites into her lip ");
		if(!paigeBlind()) output("as she watches your tongue wrestle agonizingly with Kiro’s");
		else output("as she listens to the sound of your loud kissing and the sound of Kiro’s hips thrusting against yours");
		output("; she pants and licks her lips, trying to imagine herself in there. <i>“Fuck, that’s hot,”</i> she whispers, loud enough for you both to hear.");
		output("\n\nKiro smirks and pulls away, her hands on your [pc.chest] as she doubles her thrusting speed. <i>“She knows what she likes, [pc.name],”</i> she tells you, her eyes locked onto Paige’s while her lips smack and nibble on your ear. <i>“And you know what else she likes?”</i> Her thrusting becomes less and less restrained over time, pounding into your hungry [pc.vagOrAss] more urgently, more demandingly. <i>“She likes having a thick load in her pussy, [pc.name]. You wouldn’t want to keep her thirsty, would you?”</i>");
		output("\n\n<i>“Cum in me,”</i> Paige agrees, her hands so tight on your bedsheets that you’re worried she might claw a hole straight through the fabric. <i>“Fuck your slutty puppy.”</i>");
		output("\n\nYou and Kiro can hardly keep an honest rhythm with each other, as close as you two are. You feel your [pc.cum] building up inside you; the familiar sensation of a rushing orgasm comes at you in a hurry, and in just a few more thrusts, and with Kiro’s help, you’re going to give her what she’s desperate for.");
		output("\n\n<i>“Let’s see who’s load is bigger,”</i> Kiro finishes. With that, she grabs onto your [pc.hips] and thrusts herself the rest of the way to her own orgasm – one thrust... another... and then....");
	}
	// Continue here if the PC is female; or is herm and is getting fucked by Kiro
	else
	{
		output("You place your hands underneath Paige’s thighs and lift – you don’t have the leverage to actually move her very far, but she gets the message that you’re trying to remove her from yourself, and she disengages. Before either of them can react verbally, you reach for Kiro’s wrist and wrap your own [pc.legs] around her hips, and give her a rough twist, until she spins onto the bed, flopping onto her back. She doesn’t slip out of you the whole time.");
		output("\n\n<i>“Damn,”</i> Paige gasps, surprised at your tenacity and forwardness; she can’t help but reach down to touch herself at the display of wanton sexual energy and aggression. A fresh stream of her juices materializes and streak down the inside of her thigh.");
		output("\n\nYou keep Kiro pinned beneath you as you straddle her, readjusting yourself and her thick dick inside you. She sighs in delight as your hands press at her belly and boobs, and she lays back, content to let you do all the work as you fuck her into your mattress.");
		output("\n\nThere’s no preamble as you get you both in position, the way you want her. As soon as you feel her rod right itself inside you, you begin fucking your Kui-Tan plaything in earnest: your [pc.hips] dragging up and down in elongated thrusts, squeezing every inch of her thick, taut skin as your [pc.vagina] sucks the precum from her. Your [pc.ass] claps loudly against the fur of her heavy balls, sloshing them up against you, your body demanding their building seed for your womb.");
		output("\n\n<i>“My goodness,”</i> Paige says exhaustively as her hand runs frantic circles around her button. Her legs quiver in sight and her dry tongue licks at her lips as she ");
		if(!paigeBlind()) output("watches");
		else output("listens");
		output(" to your raggedly fucking her best friend. <i>“I’m not sure which one of you I’d rather be.”</i>");

		output("\n\nYou watch Paige impatiently, and when she doesn’t move fast enough for your liking, you grab her by the hand and yank her towards you. It startles her out of her sexual reverie, but she also remembers that she’s in a threesome, and that it’s not a spectator sport; Kiro’s dick is decidedly occupied, so instead, Paige straddles her belly, bringing her body as close to yours as she can.");
		if(pc.hasCock()) 
		{
			output("\n\nIt’s a bit awkward, and you have to stop rampantly pounding into Kiro’s pelvis for a moment, but you guide Paige’s legs around your own [pc.hips] so you can stick your [pc.cock] into her ");
			if(silly) output("<b>Molten Core!!!!!!!!!!</b>");
			else output("wet cunt");
			output(", replacing your tongue from earlier");
		}
		else
		{
			output("You don’t stop your own ride as Paige clambers onto Kiro, but as soon as her pussy presses down on the fur of Kiro’s stomach, you reach forward with both hands, grasping onto Paige’s toned ass and pulling her towards you, her C-cup boobs squashing against your [pc.chest]. You pull on her until her cunt meshes against your own, spread as it is on Kiro’s shaft, and you both do your best to trib against one another, awkward as it is");
		}
		output(".");
		output("\n\nThere isn’t much of a rhythm between the three of you: you and Kiro are excitedly fucking each other and, while you’re not so insensitive that you don’t care about Paige and her own climax, there isn’t an easy way to work her into the cycle you and Kiro have going. But she hardly seems to care: her arms are over your shoulders, hugging you tightly to her, as she breathlessly whimpers your name into your ear as she fucks you both.");
		output("\n\n<i>“Do you feel as lucky as you are, [pc.name]?”</i> Paige asks you, her tongue aimlessly licking swaths along your neck and up to your [pc.ear]. Every time Kiro thrusts into you, her words come out as an interrupted hiccup, the force billowing through her almost as hard as through you. <i>“Getting plowed by a great, big Kui-Tan cock and having a horny, devoted Ausar fucking you both where she can. There aren’t a lot of people in this universe that can say they’ve been in the same position.”</i>");
		output("\n\nYou answer affirmatively: you feel very privileged to be in the middle of these two. You likewise ask Paige if she feels the same way.");
		output("\n\n<i>“[pc.name]?”</i> she asks, her ");
		if(paigeBlind()) output("blind ");
		output("eyes locking onto yours, before she cups your cheeks with gentle hands and leans in, her tongue meeting yours with frenzied passion. You mutually suck on each other; Paige hums in amusement as she tastes herself on you. <i>“It’s like a dream come true.”</i>");

		output("\n\nYou and Paige explore each other as you both ride Kiro for everything she’s worth, and you know that Kiro is watching. You yank at Paige’s tail; you slap at her ass; you run your fingers through her fur and her hair; you scratch at that erogenous zone of hers that make her tense up and whimper like a dog, accompanying a fresh, warm squirt of her juices. Paige mimics your every action as best as she can, and whenever she does something particularly juicy to you, Kiro knows it, because you clench and squeeze on her all the harder.");

		output("\n\nKiro can hardly contain herself; her own hands fly to Paige’s body, feeling at the ridges of her washboard abs and at her toned ass for herself, getting as much a feel as you are. <i>“Kiro really likes you,”</i> Paige muses in between her frenetic smooches and pumps against your body. <i>“I can tell. She only gets this animated with people she... let’s say, people she ‘thinks about’ in her spare time. I bet it’s your ass she’s fantasizing she’s feeling right now.”</i>");

		output("\n\nYou peek over Paige’s shoulder, and sure enough, Kiro’s eyes are closed in bliss, her teeth nibbling at her lower lip in delight. <i>“And she’s close,”</i> Paige continues, her breath growing increasingly haggard. <i>“I can tell, because... because I’m close, too. She and I have fucked so often... I’ve just... learned to tell.”</i>");
		output("\n\n<i>“Gonna cum!”</i> Kiro announces to the room, out of turn. Her hips bat against yours with increasing urgency, her balls flopping up to slap your ass with her energy.");
		output("\n\n<i>“Let her, won’t you, [pc.name]?”</i> Paige asks. <i>“Let Kiro cum in that tight body of yours. She wants it. But she’d never beg for it. So I’ll do the begging for the both of us. Let me see it, [pc.name]. I want to see Kiro blow a fat fucking load inside you.”</i>");
		output("\n\nWith that, you feel Paige’s hands grab onto your [pc.ass], keeping you steady and split for the nut that’s about to blow in your [pc.vagina]. It’s only a few thrusts away... and then, one less... and then....");
	}
	processTime(30);
	pc.lust(100);
	clearMenu();
	addButton(0,"Next",PKTSYE,args);
	//[=Climax=]
	// end scene (scene: PKTSYBB); go to (scene: PKTSYE)
}

// (scene: PKTSYE)
public function PKTSYE(args:Array):void
{
	clearOutput();
	showPaigeAndKiro(true);
	author("B!");
	args.push("PKTSYE");
	output("Like you had guessed, the three of you can only hold together for a few more thrusts, and by the time you hear that last, wet sound of horny bodies clapping against each other, it’s too late to brace for the flood that is the ejection of fluids from all three of you.");

	output("\n\nKiro beats you and Paige to the end, but only by a spare thrust. ");
	//if {PKTSYTIF, and PC has a cock}
	if(pc.hasStatusEffect("PAIGE_KIRO_COCKPATH") && InCollection("PKTSYTIF",args))
	{
		output("She buries herself until your [pc.lips] kiss at the fluffy pouch of her sheath, your throat stretched to its limits, full to the brim with pulsating horse cock as it inflates and pulsates with her rushing seed. You can feel every contour, every <i>cell</i> of her cock, as stretched as you are, press against your neck; you gurgle in orgasmic delight as every pulse of her Kui-Tan cum seeds your empty, greedy belly. You feel each of her heavy, overfull nuts clench against your face as they pump and pump more of her ambrosia into you. Your only regret is that she’s in too deep for you to taste.");
		pc.loadInMouth(kiro);
	}
	else 
	{
		output("She hisses deeply through clenched teeth; she buries herself into you until you feel the shaggy fluff of her sheath press against you. Your [pc.vagOrAss] is full as can be with Kui-Tan horse cock, and if you thought you felt with just that, the warm, wet detonation inside you fills all the nooks and crannies inside your body that you never knew you had. You feel every delicious drop of her cum stuff your [pc.vagOrAss], and when you thought you couldn’t take any more or that she didn’t have more to give, she gives you another thick wad, and another. Her nuts press against you, clenching and relaxing in time with the wave after wave of warm, sticky ambrosia that she unloads into you, and you’re enjoying the sensation of being stuffed with her essence that you aren’t looking forward to when she’s finally empty.");
		if(pc.hasVagina()) pc.loadInCunt(kiro,0);
		else pc.loadInAss(kiro);
	}

	output("\n\nRight on her heels is Paige; ");
	//if {PKTSYTIF, and PC does not have a cock}
	if(InCollection("PKTSYTIF",args) && !pc.hasStatusEffect("PAIGE_KIRO_COCKPATH")) 
	{
		output("her fingers dig harshly into your [pc.chest] and her thighs quiver on either side of your face, and you scarcely have the time to react to the veritable flood of her squirting girl-jizz. She was wet and gushing before; now that her orgasm is ripping through her shapely body, your mouth is flooded with her personal lube, and it’s all you can do to swallow to keep from drowning in Paige’s ichor. You have no choice to breathe through your nose, even when it too is getting splashed with wave after wave of her cum, and all you can smell, see, and taste, is Paige: your world, right at this moment, is nothing but her and her pleasure.");
		pc.applyPussyDrenched();
	}
	else if(!pc.hasStatusEffect("PAIGE_KIRO_COCKPATH")) 
	{
		output("her tight body becomes tense as her orgasm rips through her, robbing her of her control over her own body. She clings to you as best as she can, her hips jerking randomly, as your crotch is soaked in her juices; her breath comes out in strained hiccups as a new orgasm quakes through her, starting between her legs and spreading to her extremities, which cling and twitch and scratch at irregular intervals. A warm, wet sensation blooms from between your bodies as she fucks against you, desperate to eke out as much pleasure as she can from humping your body, even after you’re stained from your [pc.belly] down in her lady-jizz.");
		pc.applyPussyDrenched();
	}
	else
	{
		output("she clenches down on your [pc.cock], unable and unwilling to stop the torrent of girl-jizz from exploding from her and soaking along your tool, giving it all the more lube to properly fuck her. Her tight body becomes tighter, and her limbs and extremities flex; her toned, defined muscles bulge from underneath her fur as she strains to contain herself, and she only barely succeeds. A low, desperate moan comes out as uneven hiccups as her pussy flexes and clenches on your length – desperate for you and for your cum to sate the fire that’s raging inside her. Her cunt ripples along you in practiced waves, milking you for everything you can give her, and despite her mind-altering orgasm, she won’t be satisfied until she has what she wants.");
	}

	output("\n\nAnd finally, there’s you. ");
	if(pc.hasStatusEffect("PAIGE_KIRO_COCKPATH"))
	{
		output("Agreeing to Paige’s unspoken bodily command, you tense and unload inside her – not that you had much of a choice, between Paige cumming a messy storm around your [pc.cock] and with Kiro unloading gout after gout of thick cum into your body, your senses are so overloaded that you couldn’t possibly <i>not</i> reciprocate. Your [pc.cum] rockets up your shaft");
		if(pc.balls > 0)
		{
			output(", your [pc.balls] rolling and clenching in time with your own wads of fresh sperm");
		}
		output(", seeding Paige’s thirsty womb, just as she wanted");
		if(pc.cumQ() >= 500) output(", and then some: despite her voracious ‘appetite,’ your cum overfills and stuffs her tight belly, bloating it into a small, rounded paunch, until it comes splashing back against you");
		output(". But, your first load isn’t enough for her; she and her pussy <i>demand</i> more from you, and they make their demands clear with another thundering, rippling orgasm around your dick, milking you for all that you have, and you, naturally, acquiesce.");
		paige.loadInCunt(pc,0);
	}
	else output("You submit to Kiro’s onslaught, and your [pc.vagina] spasms in time with her rolling, ongoing blasts of cum into your willing cunt. The strength leaves your own limbs as you dissolve into a quivering puddle along with Paige and Kiro; your mind surrenders to your body and the pleasure that radiates from your crotch, sucking load after load of hot, viscous Kui-Tan cum into your womb. Kiro’s cock is as hot as burning coal; as hard as the sturdiest oak; and her output is as voluminous as a geyser. Your [pc.belly] rounds out with her output, and when you’re filled to your brim, it comes splashing out from between you, blasting from the tight creases between her dick and your walls, and splashing back onto her vibrating nuts, only to be replaced by a fresh batch and starting the cycle all over again.");
	output("\n\nThe three of you are a writhing, senseless, directionless mass of muscle, cocks, cunts, " + (pc.hasFur() ? "and fur" : "fur, and [pc.skinFurScalesNoun]") + ". Liquids of all types spout from orifices of all sorts between you; your bed creaks and strains with the weight of three hyperactive participants all fucking each other into its mattress, and it will stink like Ausar and Kui-Tan for months to come, if it washes out at all.");
	output("\n\nYou’ve lost track of time since your threesome started, and you nearly lost consciousness in the pleasure that came with your climax. By the time you’re once again cognizant of yourself and your surroundings, the three of you have collapsed into a puddle of heaving breasts, panting mouths, and satisfied cunts and limp cocks; every movement you make is accompanied by the sound of something being peeled from something else. But you all have one thing in common: the slight, yet obvious, grins on your faces, of a person that’s well and truly satisfied.");
	processTime(10);
	pc.applyPussyDrenched();
	pc.applyCumSoaked();
	pc.orgasm();
	clearMenu();
	//[=Afterglow=]
	// end scene (scene: PKTSYE); reduce Lust to 0; go to (scene: PKTSA)
	addButton(0,"Next",PKTSA,args);
}

//[=Paige=]
// (scene: PKTSP)
// Action tree: https://i.imgur.com/kgEjocX.png
public function PKTSP():void
{
	clearOutput();
	showPaigeAndKiro(true);
	author("B!");
	var args:Array = ["PKTSP"];
	output("Admittedly, it’s kind of hard to focus on anyone, including yourself, other than the woman that’s currently fucking your mouth with her own tongue. You relax and allow your hands to travel along Paige’s body, exploring the creases and defined musculature of her back, shoulders, and glutes; you recline into the bed as she continues to assault you, and you let her.");
	output("\n\nYou squeeze and ply at the thick of her ass, kneading it like dough in your hands, as Paige’s humping against your thigh escalates to full-body humping; she has to crane her neck up and down to keep the kiss steady, but every part of your front, from your crotch to your [pc.belly] to your [pc.chest] are massaged by hers as she eagerly, hungrily rocks against you, revving herself up for a good, proper fucking between you two and Kiro.");
	output("\n\nAnd speaking of Kiro, she doesn’t remain idle for too long: at first, from the corner of your eye, you see her stand there, her chin in her hand, as she watches Paige vigorously fuck herself against you; her other hand goes to the base of her own cock, giving it a few tugs and rousing her monster from its sleep. <i>“Goddamn,”</i> she says amusedly, <i>“I don’t think you’ve ever kissed me like that, Paige. Try not to suffocate the poor [pc.boyGirl].”</i>");
	output("\n\nYou hadn’t realized how much your chest was burning from the lack of air until Kiro brought it up. At the chiding, Paige pulls away, looking over her shoulder");
	if(paigeBlind()) output(" at Kiro’s general direction");
	output(". <i>“Don’t start acting jealous now, you greedy bitch,”</i> she responds playfully. She wags her ass in Kiro’s direction, her tail swaying to one side, giving Kiro unrestricted, unimpeded vision of her wet, winking pussy, begging for some valiant, daring Kui-Tan to come and satisfy it.");
	output("\n\nKiro’s hands clap onto yours as they massage at Paige’s butt, moving with yours as they explore the contours of her meaty globes. Then, she lightly grips your hands and move them inward, towards the cleft of her ass, and she places them on the hot, steely meat of her rapidly inflating cock. She wordlessly guides you to jerk her off while she hotdogs against Paige’s rear end.");
	output("\n\n<i>“I’ll give you the chance to make a decision, here, [pc.name],”</i> Kiro says, her breath catching in her throat as she excitedly works herself against Paige. <i>“If you aren’t gonna have a piece of this pie, I won’t mind taking it for you.”</i>");
	output("\n\nKiro’s asking you if you want to take advantage of Paige’s invitation to fuck her. ");
	//if {PC has had anal sex with Paige}
	if(flags["PAIGE_ANAL"] != undefined) output("Considering that, when you met Paige, she was an anal virgin, Kiro’s never done Paige up the ass and that’s probably not going to change today. ");
	output("Your options are to politely decline Kiro’s offer and stay where you are, or to swap around and eat out Paige’s moist muffin while Kiro finds some other way to entertain herself.");

	//[=Kiss Her=][=Eat Her Out=]
	// end scene (scene: PKTSP)
	processTime(10);
	pc.lust(20);
	clearMenu();
	addButton(0,"Kiss Her",PKTSPKH,args);
	addButton(1,"Eat Her Out",PKTSPEHO,args);
}

//[=Kiss Her=]
// (scene: PKTSPKH)
public function PKTSPKH(args:Array):void
{
	clearOutput();
	showPaigeAndKiro(true);
	author("B!");
	args.push("PKTSPKH");
	output("You say nothing – it’s impolite to speak when your mouth is full, after all – and instead, you release one hand from Kiro’s rising cock and use it to pull on one of Paige’s cheeks, keeping them apart. With the other, still on Kiro’s shaft, you blindly start dragging and jabbing it at Paige’s crack, searching for the bullseye that you know both ladies are looking for.");
	output("\n\n<i>“Good choice,”</i> Kiro says huskily as she, like before, wraps her hand around yours, guiding you to guide her into Paige’s tight body. You can’t see what’s happening, but you feel Kiro’s hips push forward, then stop as she meets an obstruction – and then push forward again.");
	output("\n\nPaige lurches upward, hissing in pleasure as Kiro sinks into her, her back arching in a broad C above you. Kiro smirks at the reaction, loving just how automatic it is and how Paige is going to struggle to maintain herself in front of you both as she fucks her some more. And you: with your mouth no longer occupied, and with a sudden faceful of Ausar boob, you lean in, your hands wrapping at the crook of Paige’s back, and open wide to glom her left tit into your mouth, as much as you can stuff into there.");
	output("\n\n<i>“Gods!”</i> Paige shouts, unsure of what to do with her body. She instinctively tries to buck back against Kiro, to take more of that thick, wonderful, familiar horsecock into herself, to fuck Kiro as hard as she knows she can; but when she does, her upper body goes with her, and removes itself from your questing [pc.tongue] against her erect nipple. In an effort to try and solve both problems at once, her strong arms wrap around your back and your head, locking you in place and forcing you to move with her as she gets railed by Kiro.");
	output("\n\nKiro sighs through pursed lips as she sinks deeper and deeper into Paige’s body. Every few inches, she shuffles herself a little bit, readjusting herself inside her before pushing forward once more. <i>“Now, doesn’t that feel nostalgic,”</i> Kiro murmurs wistfully as her hands explore Paige’s ass, yanking at her tail and tickling at her erogenous spot, making her tense on top of you. <i>“Nobody’s ever quite fit me like you can, Paige. Every time with you feels like it’s the first time all over again.”</i>");
	output("\n\nYou glance up at Paige, seeing her mouth some words to herself. She squeaks out the occasional sound that almost comes out as a word, but it falls apart at her lips. <i>“Fuck!”</i> she finds the strength to yell when Kiro shuffles forward a bit more, splitting her just a little further apart. <i>“You’re so fucking...!”</i> Like before, she’s unable to finish her sentence.");
	output("\n\n<i>“Keep singing my favorite song, Bookworm,”</i> Kiro encourages as she eventually bottoms out inside Paige, successfully stuffing her entire length inside her Ausar. Paige’s breath comes out as whined, strained gasps of excitement as Kiro begins to casually thrust into her, the sound of their hips slapping together and the feel of Kiro’s heavy nuts banging against your [pc.legOrLegs] underscoring the symphony she’s putting on for the two of you.");
	output("\n\nYou maintain the course for a few moments: with Kiro behind Paige, stuffing herself into Paige’s glove at an easy, unremarkable pace and making Paige quiver with delight at each thrust, while you, held in place by Paige’s stiff, sturdy arms, lovingly tend to her bouncing boobs, sucking the globe of one into your mouth and tasting and nibbling her erect nipple until you pull back a moment to give your jaw a rest. And when you’re rested, you dive back in, going to the other boob and starting it all over again.");
	if(pc.hasCock()) 
	{
		output("\n\n[pc.EachCock] flounces to and fro underneath Paige’s bucking body; you don’t have a lot of leverage to do your own thrusting underneath her. ");
		if(pc.cockTotal() == 1) output("It leaks");
		else output("They leak");
		output(" pre-cum impiously, stranded in the cold air between your bodies, left to envy Kiro’s horsecock as it snugly makes itself at home inside Paige.");

		output("\n\nYour needy masculinity doesn’t go unnoticed by Kiro: she reaches down between the three of you and gently strokes at you, her fingers tickling down to your [pc.base] and gliding her palm over the head of your [pc.cockHead]. Whenever she thrusts in, she gives you a light tug, keeping you erect and ready, and when she pulls out, her hand travels lower, to palm at your ");
		if(pc.balls > 0) output("[pc.balls]");
		else output("root");
		output(".");
		
		output("\n\n<i>“I know you’re not just gonna lie there and let me pound Paige by myself, [pc.name],”</i> Kiro chides, leaning to one side to see you from around Paige’s form. Your vision is mostly obscured by Paige’s heaving titty in your face, but, if you lean a little bit, you can meet Kiro’s stare eye-to-eye. <i>“There’s only so much titty a [pc.boyGirl] can suck before they need to bust a nut, am I right?”</i> Kiro’s hand on your [pc.cock] grows more insistent, eager for you to say what you want. <i>“Come on, let’s really fuck her brains out.”</i>");
	}
	else
	{
		output("\n\nYour own [pc.vagina] lurches with Paige’s bucking body, leaking your [pc.girlCum] down your [pc.thighs]. Your needy sex rests unoccupied in the open air between the three of you, left to enviously hump against Paige’s overstuffed cunt and fantasize about having a nice, thick horsecock of its own to seed it.");
		output("\n\nYour drooling femininity doesn’t go unnoticed by Kiro; she reaches down between the three of you and gently strokes at you, her fingers gliding along your hot, wet vulva and gingerly slipping a finger in between them, showing herself into your body. You clench and sigh at her passive fingerfucking, and you wriggle your [pc.hips] in her direction, silently urging her for more, to explore you deeper. When she sinks into her knuckle, she lays her palm flat against you, using the butt of her open palm to slide over your [pc.clits].");
		output("\n\n<i>“I know you’re getting impatient for something to fuck you good and hard, [pc.name],”</i> Kiro chides, leaning to one side to see you from around Paige’s form. Your vision is mostly obscured by Paige’s heaving titty in your face, but, if you lean a little bit, you can meet Kiro’s stare eye-to-eye. <i>“A girl can only take so much of watching someone else get fucked before they need some for themselves, am I right?”</i> Kiro’s hand becomes more insistent, the palm of her hand soaking in your lubrication, eager for you to give the word. <i>“I only have so much cock to go around, but just say the word, angel, and I’ll think of something.”</i>");
	}
	output("\n\nIt’s hard to say no to an invitation like that....");

	//[=Double P.=][=Sandwich=]
	processTime(20);
	pc.lust(30);
	clearMenu();
	// end scene (scene: PKTSPKH)
	if(!pc.hasCock()) addButton(0,"Cuddle Up",PKTSPCU,args);
	else addButton(0,"Double P.",PKTSPCU,args);
	addButton(1,"Sandwich",PKTSPS,args);
}

//[=Eat Her Out=]
// (scene: PKTSPEHO)
public function PKTSPEHO(args:Array):void
{
	clearOutput();
	showPaigeAndKiro(true);
	author("B!");
	args.push("PKTSPEHO");
	output("You don’t hesitate; a moment longer and Kiro might take your silence as an invitation to do what she likes. You raise your [pc.foot] to her belly, gently but insistently pushing her away; she steps back, relenting to your unspoken request, and as soon as you have the space, you lurch Paige off of you.");
	output("\n\nYou command Paige to lay on her back. Panting, she’s too horny to try and deny your commands, and she does so, swapping places with you on your bed and lying flat on her back, her arms and legs spread eagle, exposing every part of her vulnerable self to you and Kiro. The two of you can barely contain yourself; Kiro audibly licks her lips at the sight of Paige and her complete, total willingness to whatever you two think to do with her.");
	output("\n\nOf course, you don’t let Kiro make the decision for you: the sight of Paige’s soaked, puffy pussy, open to the air of your quarters and oh-so-inviting for anything to taste it, is too much for you to ignore. You kneel in between her legs and unceremoniously shove your face in between her thighs, using your arms to clamp her legs around your head and keep you in place as you loudly munch on her box.");
	output("\n\n<i>“What a hero,”</i> Kiro laughs as you eagerly go down on Paige. She runs her hand along your head, ");
	if(pc.hasHair()) output("ruffling your [pc.hair]");
	else output("rubbing at your scalp");
	output(", as she strides alongside the bed, towards Paige’s upper half. <i>“You always were the cocksucker-for-hire between us, Paige. I don’t suppose you’re rubbing off on [pc.name] in more ways than one?”</i>");

	output("\n\nWords form in Paige’s mouth that dissolve immediately as she tries to control her breathing. You’re really working her over in a hungry, horny frenzy: your hands run against the grain on Paige’s stomach, digging down low to fondle at her six-pack abdominals, while your [pc.tongue] drills and twists into her as deep as it can reach, touching and exploring every spongy surface inside her cunt. Your every spurious action and reaction to her reactions is rewarded with another mouthful of her squirting, feminine lube, which you swish in your mouth momentarily before either sliding it down your throat or drooling it along your tongue to further coat it in her taste.");
	output("\n\n<i>“Gods damn, you’d think [pc.heShe] did this for a living,”</i> Kiro admires as she watches you go to town on Paige’s squirming, spasming body. <i>“I’ll have to ask [pc.himHer] if I can get some of that later.”</i>");

	output("\n\nYou hear the bed creak and you feel it sink under Kiro’s weight as she clambers onto it. You glance up, along Paige’s stomach, and you’re treated to an eyeful of Kui-Tan testicles as Kiro straddles Paige’s body. Kiro rocks and thrusts gently, her ass flexing in front of you as she gets herself comfortable; you can even see Kiro’s own winking, delicious cunt and the streaks of her feminine arousal drip steady streams down her rolling nuts, wetly matting the fur of her own balls and along Paige’s ribs.");

	output("\n\nYou hear the sound of skin clapping against skin, followed by Paige making wet gurgling noises, followed by Kiro rhythmically pumping her hips forward and back – you can only imagine the sight of Kiro tittyfucking Paige, her horsecock so large and all-encompassing that it’s all Paige can do to open her mouth and take its flare into it. You close your eyes and try to imagine what Paige must be feeling: with Kiro and her massive nuts sitting on her chest, with a big, thick dick fucking her tits and plowing into her mouth, while you’re in between her legs and servicing her cunt properly.");

	output("\n\nHer body thrashes in pleasure at the combined assault: her legs can’t find a comfortable place to crook around your body to keep you in place, and her arms and hands fling to different parts of your bed again and again, grasping and pulling at your sheets. Her belly crunches and relaxes with each thrust Kiro makes into her mouth, while her already-hardened thighs clench and tighten around your head when you hit a particularly vulnerable spot. With how wet she is, you’re not entirely positive if she’s really, really horny from the onslaught, or if she’s actually already cum once or twice.");

	output("\n\nKiro sighs in satisfaction as she casually fucks Paige’s mouth. Your vision swims with Paige’s tense stomach and Kiro’s rocking balls, growing slicker and wetter with her dripping pussy juices the longer the show goes on. <i>“You two make a great pair,”</i> Kiro says off-handedly between her deep breaths. <i>“Gods, [pc.name], if we could bottle her skill with your enthusiasm – hell, forget the piracy, we’d make a killing selling that. You two should teach a class.”</i> She sighs again as she thrusts a little deeper than usual, and you can hear Paige hum in delight at having her mouth stuffed so full. <i>“If only you could feel the things this bitch’s tongue is doing to me.”</i>");

	output("\n\nYou reach forward with one hand, gently palming at her bloated testicles as they strain to contain her overwhelming seed. You massage at the leathery, stretchy flesh, soaking your fingers and your palm in her leaking cunt juices while giving Kiro a good feel.");

	output("\n\n<i>“Aahh,”</i> Kiro breathes delightedly, arching her back in reflex at your touch. She takes several deep breaths through her nose before she straightens herself. <i>“Fuck it, I’m not gonna last much longer at this rate.”</i> She stops her thrusting into Paige’s mouth, but does not remove herself yet. <i>“What’dya say, Paige? You want this fat dick in your pussy again? Gods, it’s been so long; think how nostalgic it’ll feel to have me cum inside you again.”</i>");

	output("\n\nPaige hums in ascension, her kicking legs shifting along your head again and another warm gush of her liquid coats your tongue. <i>“You heard the woman, [pc.name],”</i> Kiro announces as she shifts herself to the side, clambering off the bed again. You glance up, and you see her huge, black horsecock stand so erect that it nestles itself in between Kiro’s heavy boobs; it drips with its own spurting pre and with Paige’s spittle. <i>“Paige wants to be taken for a ride.”</i>");

	if(!pc.hasCock()) output("\n\nYou eye that monster of a dick, and your [pc.thighs] clench at the fantasy of having Kiro drive it into you; to impale you so deeply that you’d hang from her dick like a condom. Your eyes cross at the idea of being filled like one.");
	else output("\n\nYou idly wonder to yourself how you’re going to keep busy when Kiro’s stuffing Paige’s box with her dick. Your own [pc.cock] lurches at some ideas, including maybe swapping positions and fucking her mouth, but you’re too lust-addled to decide on any one idea.");

	output("\n\n<i>“You’re welcome to come with,”</i> Kiro invites, placing a hand on your shoulder. <i>“");
	if(!pc.hasCock()) output("This doesn’t have to be a two-woman show.");
	else output("Knowing Paige, she’s got ‘room’ for one more.");
	output("”</i>");
	output("\n\nYour mind’s eye swims with the possibilities....");
	processTime(20);
	pc.lust(30);
	clearMenu();
	//[=Sandwich=][=CargoLift=]
	addButton(0,"Sandwich",PKTSPS,args);
	addButton(1,"CargoLift",PKTSPCL,args);
	// end scene (scene: PKTSPEHO)
}

//[=Double P.=]
// if the PC does not have a penis, change this button to [=Cuddle Up=]
// (scene: PKTSPCU)
public function PKTSPCU(args:Array):void
{
	clearOutput();
	showPaigeAndKiro(true);
	author("B!");
	// continue here if the PC has a penis
	if(pc.hasCock())
	{
		output("You tell Kiro that it sounds like a party to you. You ask her to pull out for a moment, and she does; you guide Paige to turn over, so that she’s laying face-up on top of you. The three of you are a bit tangled in each other, but you get the job done.");
		output("\n\nYou reach down in between your bodies, to grip your [pc.cock] by the base, and start waggling and flopping it against Paige’s buttcheek, slapping your pre-cum over the globe of her ass. Your [pc.cockHead] slaps against the entrance to her ");
		//if {PC has not done anal with Paige}
		if(flags["PAIGE_ANAL"] == undefined) output("wet tunnel, already a bit exhausted from the casual railing Kiro’s given it, but nonetheless primed and ready for more");
		else 
		{
			output("tight anus, unsullied by Kiro and her monster. Given that Paige was an anal virgin when you met, Kiro’s never had the privilege of exploring <i>all</i> of Paige.");
			pc.createStatusEffect("Buttfucking Paige");
			pc.setStatusMinutes("Buttfucking Paige",300);
		}
		if(!pc.hasStatusEffect("Buttfucking Paige")) 
		{
			output("\n\nPaige sighs as you tease her, your [pc.cockHead] fitting itself in between her spread labia but not penetrating her any deeper. You wait for Kiro to resume her position between Paige’s spread legs to guide you both in.");
			output("\n\n<i>“Now that I think about it, Bookworm, I don’t think we’ve ever had the pleasure of you getting double-teamed, have we?”</i> Kiro asks as she steps forward, her heavy cock landing with an audible slap against Paige’s stomach before she steps back to realign herself. You feel a hard obstruction on your dick, pressing against you insistently, and you slowly begin to slide into Paige.");
			output("\n\n<i>“I, uhhh,”</i> Paige groans out, followed by a sharp inhale as you and Kiro both spear into her, splitting her in half with your dual cocks working in tandem. She tenses her body on top of you, and then tries to relax, but the fact remains that she’s being pushed to her limits.");
			output("\n\n<i>“Let’s really put Peggy through the stress test, [pc.name],”</i> Kiro says with a predatory grin as she thrusts in harshly, burying both herself and you halfway into Paige’s tunnel.");
		}
		else
		{
			output("\n\nPaige hiccups in surprise as you tease her, your [pc.cockHead] pressing against the star of her asshole but not penetrating into it at all. You wait for Kiro to resume her position between Paige’s spread legs before stressing Paige’s body.");
			output("\n\nKiro hums as she sees what it is you’re aiming for. <i>“Now, don’t go making me too jealous, [pc.name],”</i> Kiro warns playfully as she steps forward, her heavy cock landing with an audible slap against Paige’s stomach before she steps back to realign herself. You feel Paige squirm above you, reflexively pulling away a bit from Kiro’s questing member, intimidated at the prospect of being split too tight.");
			output("\n\n<i>“I, uhhh,”</i> Paige groans out, followed by a quick yip as Kiro shallowly thrusts herself in. The motion rocks Paige backward, and it dislodges you from your held position, teasingly against Paige’s rear – and you too slip in. Just the tip, for now.");
			output("\n\n<i>“You’d better hope that Peggy comes through for you, Bookworm,”</i> Kiro says with a predatory grin as she thrusts in harshly, burying herself as deeply as she was before. You don’t wait for a better invitation, and you follow suit.");
		}
		pc.cockChange();

		output("\n\nWhere Paige’s body is hard as a rock and tight as a knot, the sensation you feel, buried inside her with Kiro, is altogether a different experience: ");
		if(!pc.hasStatusEffect("Buttfucking Paige")) output("on one side, you feel the familiar ridges and ripples of Paige’s tight cunt, while on the other, you feel the hot, taut flesh of Kiro’s dick pulsating alongside yours");
		else output("her ass was always tight and clenched, for lack of better terms, but with Paige’s body split apart as it is, it’s a trial to even push yourself in, much less down to the [pc.knot]");
		output(". You aren’t given much time to cherish the sensations, though: Kiro, horny and impatient, begins thrusting, harder than before, and you resolve to match her pace and passion.");

		output("\n\nPaige’s breath catches in her lungs with every other thrust. You ");
		if(!pc.hasStatusEffect("Buttfucking Paige")) output("thrust in time with Kiro, ensuring that every thrust home stuffs her fuller than she’s ever been");
		else output("thrust alternately with Kiro, ensuring that even on the backswing, she’s never left vacant");
		output("; she fights to maintain herself despite the constant tension on her hole");
		if(pc.hasStatusEffect("Buttfucking Paige")) output("s");
		output(", and for a moment you wonder if you hadn’t made a mistake and that she wasn’t actually enjoying it.");

		output("\n\n<i>“Gods,”</i> Paige gasps, the word coming out in a sudden burst, like it was a bubble that she was struggling to pop. <i>“I can’t... why haven’t....”</i> She sputters some more half-sentences, unable to formulate a single coherent thought for the next half-minute. <i>“Fuck me!”</i> she finally demands, and with her demand, she begins thrusting back against you and Kiro, leaning into your dicks as they stretch her. <i>“This is amazing!”</i>");

		output("\n\n<i>“That’s what I like to hear, Bookworm,”</i> Kiro says huskily as she leans forward, gaining some leverage over you two so she can piston her hips harder and faster.");

		output("\n\nWith any worry you had assuaged, you do as she commands of you and plow into her as determinedly as you would if you two were alone. You eye Kiro, and she eyes you back, and you aren’t certain if this hasn’t suddenly become some competition between you two, to see who can make Paige holler their name.");

		output("\n\nYou say nothing, not that you’re positive anyone would hear you anyway: the room is a cacophony of two hard cocks fitting into ");
		if(!pc.hasStatusEffect("Buttfucking Paige")) output("too small of a hole");
		else output("two small holes");
		output("; the sound of two pelvises clapping wetly against a third; and the sound of a woman gasping and hollering in perverse delight as she gets ruined for any single prospective partner in the future, and loving every minute of it.");

		output("\n\nThe sensations – of the heat, ");
		if(!pc.hasStatusEffect("Buttfucking Paige")) output("and the wetness, and the unique sensation of sharing a cooch with another cock, where you’re squeezed and milked on one side and you’re frotted and caressed on the other");
		else output("and the sheer tightness, and the unique sensation of feeling another cock through the thin boundary of Ausar biology separating her pussy from her ass as they both fuck their way into her");
		output(", and Paige gasping in sexual bliss above you, and Kiro panting in a needy, desperate rut above <i>her,</i> and the stank that comes with three rutting bodies moving and fucking together, and the feel of two horny, furry women grinding against each other and you; it all builds up in a hurry, and you feel a familiar sensation in your ");
		if(pc.balls > 0) output("[pc.balls]");
		else output("loins");
		output(" of your impending orgasm coming up to you in a hurry.");

		output("\n\n<i>“Paige,”</i> Kiro blurts out, her voice cracked and shaky, with the sort of pleading tone that a child would have when they ask for candy.");

		output("\n\n<i>“Cum in me!”</i> she shouts, her body clenching on top of you both. <i>“Fuck, you’ve already stuffed ten yards of cock into a one-yard space; fucking load me up with cum, you assholes!”</i>");

		output("\n\nKiro leans back, her thrusts growing more elongated, more excited at the permission to fill what few spaces you two can’t fill with cock with your cum. <i>“You heard the woman, [pc.name],”</i> she says simply as her thrusting grows more powerful.");

		output("\n\nThe three of you are on the verge of your individual climaxes, and it’s not going to take too many more thrusts to get there. In fact, in just a few more....");
	}
	// continue here if the PC does not have a penis
	else
	{
		output("You know that Kiro was coyly suggesting you play along and say something she wants to hear, rather than actually ask if you want to do one thing or the other. You take the bait and beg Kiro, with an exaggerated lilt in your voice, to do something about the raging fire in your cunt; you’re just so horny, and if you can’t get that thick Kiro cock inside you, you’re going to melt!");
		output("\n\nShe laughs at your performance and pulls out, leaving Paige gaping and open to the air. She whines in desperation, her hips automatically pushing back, searching for Kiro’s dick to take back inside it. <i>“How am I supposed to ignore that?”</i> Kiro asks as she shifts a bit, and you feel her huge, wet log of a dick flop onto your [pc.vagina], her blunt head poking between your vulva just a bit and depositing a sizeable dollop of pre at your entrance.");
		output("\n\nYou bite your lower [pc.lip] in anticipation, shivering as she teases you a bit, but she doesn’t penetrate you. <i>“Still, I can’t leave my good girl Paige all alone,”</i> Kiro muses, her hands greedily roaming over Paige’s tight ass cheeks. <i>“So I think all three of us are gonna have to compromise.”</i>");
		output("\n\nYou feel her reach between your bodies, her fingers gripping just beneath her fat cock head, and she lifts it slightly; she thrusts forward a bit, and her dick spears in between you and Paige, sliding along your [pc.belly] and against the ridges of Paige’s own abdominals.");
		output("\n\nKiro is meticulous with her positioning; she adjusts and readjusts herself, trying her best to use the immensity of her shaft so that she rubs against your [pc.clit] with every inward and outward thrust, and when she thinks she’s got a good angle, she lifts Paige by the thighs and aligns her until she’s accomplished the same thing.");
		output("\n\nHer cock is hot and wet against your stomach, and the hotness and wetness blooms periodically at her head as it spurts more and more pre. And then, satisfied that she’s wedged herself snugly enough between your bodies, she begins thrusting; the tactile sensation against your [pc.clits] is powerful and immediate, and you hump up against the unyielding skin of Kiro’s shaft for more pressure against your button. From the way Paige ruts against you, hissing through clenched teeth, you gather she’s doing the same.");
		output("\n\nIt’s not as good or as fulfilling as if Kiro had stuck it inside you properly, and you’re left with a yearning in your honeypot that she’s is unable to fill. Still, you don’t complain – Paige is likely feeling the same yearning for a good, hard cock, and Kiro’s missing out on being inside a tight hole to milk her, so this is the best compromise between the three of you.");
		output("\n\nYou make the most of it: you kiss Paige, wrapping your [pc.tongue] around hers as you grind your bodies and your [pc.chest] against hers. Kiro fucks at the union of your bodies, splurting more and more pre against your stomachs, getting them nice and slick and aiding in the ‘penetration’ between you. The three of you melt into an indecipherable ooze of fur, boobs, cunts and cocks, each of them sharing grunts and moans and fluids.");
		output("\n\nYou wrap your [pc.legOrLegs] around Kiro’s waist, feeling along her ass whenever she completes a circuit. You reach lower, gently brushing at the top of her bloated Kui-Tan sack, coaxing out every last drop of cum stored inside them; you’re wet from her pre, and you can’t wait to share a veritable bath between you and the Ausar you’re making out with.");
		output("\n\n<i>“Fuck, you two are a treat,”</i> Kiro says as her thrusting grows more impatient. You can tell the poor girl is restraining herself; if she thrusts too deeply, she’d start pounding against your lowermost set of ribs. Despite that, her dick lurches forward impiously on the occasional thrust, and some hefty globs of pre reach high enough to nestle in the cleavage of your [pc.chest], which then mixes and meshes into Paige’s own boobs.");
		output("\n\n<i>“Gettin’ close, ladies,”</i> Kiro warns, her hands reaching beneath your [pc.ass] and hefting you up as well as she can, considering your positions and the fact that she’s also lifting Paige. The sound of her body clapping against yours as she fucks the space between you and Paige quickly drowns out the frequent, lusty moans coming from Paige’s throat.");
		output("\n\nPaige, unable to contain herself, pulls away from you and glances over her shoulder. <i>“Let’s see it, Kiro,”</i> she begs, lifting her tail higher and grinding herself harshly against Kiro’s dick. <i>“Fu-fucking cum! Soak us like I know you can!”</i>");
		output("\n\nYou have a difficult time adding much more to Paige’s begging, as close as you are; your teeth chew on your lips in orgasmic bliss as your [pc.clit] fires signal after signal to your head and your [pc.vagina] about your impending orgasm. Gods, if only you had a cock inside you right now....");
		output("\n\nYou slap both hands onto Paige’s ass, giving both cheeks a hard spank and a thorough grope, trying your best to bring her closer. She yips your name in surprise, which melds into a sultry moan, and she goes back to fucking your mouth with her tongue as she grinds her last few thrusts towards her orgasm.");
		output("\n\nKiro isn’t much farther behind, and, with some eagerness, you realize that you’re just a few more thrusts away from learning if Kiro really has what it takes to give you two a good, long soak....");
	}
	processTime(20);
	pc.lust(100);
	clearMenu();
	addButton(0,"Next",PKTSPE,args);
	// end scene (scene: PKTSPCU); go to (scene: PKTSPE)
}

//[=Sandwich=]
// (scene: PKTSPS)
public function PKTSPS(args:Array):void
{
	clearOutput();
	showPaigeAndKiro(true);
	author("B!");
	args.push("PKTSPS");

	output("You’ve got an idea. Paige gets to be the star of the show, but she’ll have to put her yoga skills to a bit of use.");

	output("\n\nYou pull away from Paige and reach for her shoulders. Her eyes narrow ");
	if(!paigeBlind()) output("on you ");
	output("curiously, then widen when you give her a rough shove; she reaches for the blanket and clutches at it for something to grip on, to keep her steady, but you’re quick enough and Paige is in such a sexual stupor that she doesn’t have the reflexes to react in time to keep herself righted.");
	output("\n\nBefore she knows what’s happened, her shoulders are on the floor while her legs remain up and splayed on your mattress. Her eyes roll in her head as she tries to maintain some semblance of coherence with her surroundings, but before she can even tell which way is up, you squat over her face, facing the bed, aligning your ");
	if(pc.hasCock()) output("erect, dripping cock");
	else output("gushing, leaking cunt");
	output(" with her gaping mouth, directing her in no uncertain terms to get to work.");

	output("\n\nPaige’s cunt winks in confused-yet-horny abandon, waiting for ");
	//if {PKTSPEHO}
	if(InCollection("PKTSPEHO", args)) output("your tongue to get back to work. You use your fingers to gently pry the petals of her pussy apart, your digits getting soaked in her juices, and you eye Kiro invitingly. You’ll get back to work, alright – but you’re sure, for as skilled as your tongue is, she might enjoy a thick dick in her and Kiro would appreciate a warm hole to bust into.");
	else output("Kiro’s dick to start fucking it once more. You use your fingers to gently pry the petals of her pussy apart, your digits getting soaked in her juices, and you eye Kiro invitingly. You’re sure Kiro is eager to get back to work, alright – but, you’re just as sure that Paige would appreciate something a bit more flexible to tend to her more tender areas.");

	output("\n\nKiro smirks at your tenacity and ingenuity; her dick lurches at the position you and Paige are in and she gives it several elongated tugs, flexing the precum up her cock and spurting it onto Paige’s outstretched leg. <i>“Gotta give you props for the quick thinking, [pc.name],”</i> she says as she steps over you both, facing the bed, one foot on either side of Paige’s ribs, as she lines her fat cock head against Paige’s entrance");
	//if {PKTSPKH}
	if(InCollection("PKTSPKH", args)) output(" once again");
	output(". <i>“It’s certainly one of the more imaginative poses-for-three I’ve had. And if anyone can take it, it’s Paige.”</i>");

	output("\n\nYou’re treated to an up-close show of every inch and contour of Kiro’s fat horse cock sinking into Paige’s body: every pulse as it travels down Kiro’s shaft and every hungry throb of Paige’s cunt clamping and swallowing around her meat; every squelch and wet squeeze as their individual lubes mix to make the journey smoother; the way Paige’s cunt bloats and bulges with Kiro’s immensity, followed by her abdomen as Kiro sinks lower and lower; the sheer, damn-near overpowering stench of a cock big enough to look out of place on a horse fucking a wet, horny, receptive and fertile cunt – it’s all taking place a scant few millimeters in front of your nose.");

	output("\n\nKiro’s nuts press gently against the back of your head, pushing you closer and closer to the show. You stare in lustful bewilderment, ");
	if(pc.isHerm()) output("unsure of which one you’re more jealous of and who you’d rather be: in Kiro’s position, fucking such a moist, tight hole, or in Paige’s, taking such a magnificent dick into herself");
	else if(pc.hasCock()) output("at Kiro and her amazing cock, fantasizing how it would feel if it was your [pc.cock] sinking deeper and deeper into Paige");
	else output("at the amazing way Paige’s body molds itself around Kiro, and fantasizing that it was you on your back and with Kiro’s dick sliding into you");
	output(". Eventually, when Kiro sinks deep enough and her massive testicles push you forward enough, your nose bumps against the steely flesh of her shaft, and your [pc.lips] taste of the wet union of Kiro’s dick and Paige’s pussy.");

	output("\n\nYour tongue automatically slides out to lap a gentle ring around Paige’s split vagina, soaking in the fluids pooling there. And as you do, you feel Paige finally get to work on you as well, ");
	if(pc.hasCock()) output("her lips pursing on your [pc.cock] and her cheeks hollowing out, suckling on your shaft and eagerly drinking down your leaking pre-cum");
	else output("her lips puckering against your [pc.vagina] and her own tongue spearing deeply into you, lapping at your juices and drinking down your [pc.girlCum]");
	output("; your [pc.hips] shake in surprise, reminding you exactly how horny you’ve been since you started, and you sigh (through your nose, taking in more of the scent of Paige and Kiro’s sex).");

	output("\n\nOne of your hands wraps around to Paige’s ass, gripping onto her globes and massaging at her flesh as it flexes with every push Kiro makes into her cunt. Your nose grinds along Kiro’s shaft as it plows into the Ausar beneath you again and again; you lean forward a bit, wrapping your lips at the union of their sexual organs, letting that glorious, fat Kui-cock fuck its way between your lips as it grinds into Paige again and again, your patient tongue washing the flesh and tasting the new fluids accrued on it with every rotation. Occasionally, your conscious mind registers Paige’s own mouth working on you, and your [pc.hips] automatically adjust themselves on her face, getting her deeper, to work you over better.");

	output("\n\nYou feel very warm, which comes as no surprise: you’re sandwiched between the two bodies, with Paige below and in front of you, and Kiro above you with her massive, hanging testicles behind you, bapping you gently in the head and back with her every motion into Paige’s tunnel. You kiss and lick at Kiro’s piston of a cock and at Paige’s abused, stretched hole, tasting everything the two of them have, and with every devious taste, you shudder a little bit more out of your own loins for Paige to drink down.");

	output("\n\nTime becomes nebulous; your world is these two women surrounding you and the three of you being a part of a circuit of grinding, squeezing, milking, gurgling, tasting, and fucking. You can feel Kiro’s heartbeat through her balls as they rest against your shoulders and you can feel Paige’s lungs heave whenever they get the chance to breathe without you obstructing their wind. Kiro moans occasionally, telling you sweet nothings about how she enjoys your tongue on her as she fucks Paige, and how you three should do this more often and if you could think up more exotic positions for you three to take.");

	output("\n\nYou agree mindlessly with everything she suggests. You’ve checked out, at least for now: your mind swims too vividly with the smells and tastes of pure, raw sex for you to focus on anything but making the sensation better for yourself and your partners. Of course, that includes the building orgasm you feel in your crotch – it’s only a few pumps against Paige’s mouth away, and you reason that if you’re this out of it already, you can only imagine what your senses will experience when Paige and Kiro both cum.");

	output("\n\nThe telltale signs of an impending orgasm are different from this perspective: as acquainted with Kiro’s flesh as you are, you notice it grow warmer, thicker, and harder, and Paige’s pussy becomes wetter, her vulva bulging and changing color very slightly under the strain. You feel Kiro’s balls crawl up your back as they clench, ready to dump their payload into the yearning pocket that’s stuffed to the brim with Kiro’s dick, and you feel Paige’s work on your own genitals grow more rapid in intensity, but less directed and focused.");

	output("\n\nYou wonder, as the three of you reach your climaxes simultaneously, if you look, smell, or taste any different to Paige in the moments before your body clenches in that familiar release....");
	processTime(30);
	pc.lust(100);
	clearMenu();
	addButton(0,"Next",PKTSPE,args);
	// end scene (scene: PKTSPS); go to (scene: PKTSPE)
}

//[=Cargo Lift=]
// (scene: PKTSPCL)
public function PKTSPCL(args:Array):void
{
	clearOutput();
	showPaigeAndKiro(true);
	author("B!");
	args.push("PKTSPCL");

	output("The idea of really getting down to business and fucking Paige like the proper, horny bitch she is, is too exciting an idea to pass up.");
	output("\n\nYou disengage from her, withdrawing your overworked mouth from her cooch. She whines in protest, her hips drawing upwards to try and chase after your tongue and suck it back into herself; you keep a hand on her pelvis and give her belly a gentle rub as you tell her that she deserves something a bit more substantial than just a tongue. When you ask if she agrees, she moans out something lazy and unintelligible.");
	output("\n\nYou and Kiro grab her by one wrist each and hoist her upward, into a sitting position, and then onto her wobbly, shaking feet. You know exactly how you want to see Paige fucked, and you ask Kiro for a hand");
	if(pc.PQ() < 30) output(" – you’re going to need it");
	output(".");

	output("\n\nOne of your hands dips down, between Paige’s legs, giving her wet pussy a quick pat and her engorged clit a twiddle on the way, as you hook your hand beneath her knee and lift it high. Paige doesn’t lose her balance, even as you crane her leg up and hook her knee over your shoulder – her yoga-hardened center of gravity makes her damn-near impossible to topple. That only makes it all the easier to reach down behind her other leg and do the same thing, until you’re lifting Paige into the air by her legs.");

	output("\n\nHer arms wrap around your neck for stability, but Kiro steps forward, pressing her front against Paige’s back, her hefty boobs on either side of Paige’s face and framing her skull. Her brown-furred hands wrap around to Paige’s breasts, giving them a lascivious squeeze and pinching at her nipples, making her gasp and arch her back against Kiro. It has the pleasant side-effect of shifting Paige’s weight onto Kiro slightly, taking the weight off your arms.");

	output("\n\n<i>“Ready, Bookworm?”</i> Kiro asks softly, using the name more as a pet name than a childhood nickname. You can feel Kiro’s elephant-trunk of a cock slide between you and Paige, fucking at the loose meeting of bodies there, and you know what it wants. Your hands are a bit full; Kiro has to relinquish her grip on one of Paige’s tits to align herself, and when she does, Paige’s body stiffens and her teeth chew into her bottom lip in subconscious preparation.");

	// continue here if the PC has a dick
	if(pc.hasCock())
	{
		output("\n\nKiro, gracious and accommodating as she is, doesn’t leave you in the cold air. As soon as her hand grips at herself, you feel her fingers reach for your own [pc.cock], giving it a stroke and pulling your meat against hers, masturbating them together for a few tugs.");
		output("\n\n<i>“Try and relax, Paige,”</i> Kiro says comfortingly, giving her a gentle kiss on her collarbone, <i>“because things are about to get a little tight.”</i>");
		output("\n\nYou feel Kiro pull at you a little bit, and then, with a sudden flop, both you and Kiro are lined up at Paige’s vagina, sampling her wet heat and dripping lube together. You feel Paige shiver in anticipation, and her eyes grow wide in a hurry, but you and Kiro move before she has a chance to interject: with you two thrusting simultaneously, you both worm your way inside Paige, splitting her apart with your combined masculinities. If you thought Paige was tight before, it’s nothing compared to this.");

		output("\n\nBoth of you take your time inside her – you can’t imagine how she must be feeling and you let her adjust to your girths inch by salacious inch. The oil coating ");
		if(pc.cocks[0].cLength() >= 15) output("both you and ");
		output("Kiro makes things a little stretchy and spongier, without losing any of the tightness enveloped around you, making thrusting into her a bit easier to accomplish. And when you both dig as deeply as you think Paige is comfortable with, and she doesn’t object to having you both inside her, you take her unspoken invitation and start fucking her properly.");

		output("\n\nGods, it’s tighter in there than you were expecting. On the one side, you have the tight ridges of Paige’s body clamping and slurping at your [pc.cock], eager to drink your [pc.cum] into itself. On the other, you’re pressed tight as could be against Kiro’s own shaft as it hotly bumps and grinds against yours, hungry and eager to seed Paige just as much as you are. Kiro’s bloated Kui-Tan nuts bounce forward with Kiro’s thrusts, slapping you in the [pc.legOrLegs]");
		if(pc.balls > 0) output(" and against your own [pc.sack]");
		output(", gurgling loudly enough to let you both know that it’s about to get even more cramped inside Paige.");
		pc.cockChange();
	}
	// continue here if the PC does not have a dick
	else
	{
		output("\n\nKiro grunts a bit as she grips onto her horsecock halfway down the shaft, whipping it back and forth, slapping it against Paige’s abs, and then against yours, her precum flinging every which way as she does. When she’s good and riled up, she pulls back a bit, realigning her cock’s head against Paige’s entrance.");
		output("\n\n<i>“Gods, I can’t wait,”</i> Kiro says lustfully, giving Paige a rough suck on her neck. <i>“Sometimes, it feels like your body was made for me, Paige. Nobody takes me like you do.”</i>");
		output("\n\nYou glance down in between your body and Paige’s, and you watch as that flat, blunt cockHead presses forward, Paige’s pussy yielding area by the centimeter until it relents, Kiro slipping suddenly into her. Both of the ladies exhale in delight at having gotten the ‘hardest’ part out of the way; now that Kiro is securely lodged inside her, she thrusts, gently at first, and you hear the wet squishing of Paige’s body taking more and more horsecock into it.");
		output("\n\nYou thrust your [pc.hips] forward, slicking your [pc.vagina] against the shaft of Kiro’s cock as it slides into Paige. Your eyes cross as you feel the thick, hard meat of her shaft glide between your mons and the friction of her body against your clit; you drool as you fantasize that it’s you that Kiro is sliding herself home into, and not Paige. Maybe next time.");

		output("\n\nThe three of you work as best as you can to work your awkward threesome: Paige’s agency has been removed from the equation entirely, and she is helpless to do little more than bounce happily on Kiro’s meat. Kiro maintains her own pace, heedless of you or Paige; her hands grope and pull on Paige’s breasts, kneading them for her own benefit, while her massive, cum-filled nuts slap against your [pc.legOrLegs] with her thrusts, each heavy nut gurgling with seed. It’s you that’s doing all the work, and while you’re not getting penetrated and you’re not getting any specialized attention, you’re nonetheless lost in the atmosphere of sex, and your orgasm isn’t too far off.");
	}
	// Merge here
	output("\n\nThe thrusting, grinding, and fucking continues with the three of you working off-rhythm with each other; every time you push forward, Kiro is bounding back. Paige moans your name sometimes, and she moans Kiro’s name sometimes; she and Kiro would share an elongated, tongue-filled kiss before she disengages and reaches for you, continuing with you where Kiro left off. Her legs wrap themselves around your back as best as they can with your hands beneath them, while her arms cradle Kiro’s head behind her, her fingers playing with the Kui-Tan’s hair.");
	output("\n\nYou get a good look at them both as you continue. Their faces are each less than two feet from you. Paige’s eyes can’t decide where to focus, if anywhere, and sometimes they cross whenever");
	if(pc.hasCock()) output(" you and");
	output(" Kiro hit");
	if(!pc.hasCock()) output("s");
	output(" a particularly sensitive spot inside her; her tongue lolls from her mouth with strands of saliva dripping from its floppy tip, streaking toward her nearest tit.");

	output("\n\nKiro, meanwhile, has her eyes closed in concentration. She sometimes winks an eye open, and her gaze locks with yours for a moment; she smiles, winks more deliberately, and puckers her lips at you when she does, and she redoubles her efforts for your benefit. She licks at her lips time and again, and she pants in exhaustion and dehydration; she’s breathing deeply, in through her nose and out through her mouth, trying to main her own rhythm.");

	output("\n\nYou think, in some part of your mind, you realize how connected the three of you are – on a sexual level, at least, and you each know how close the others are. When Paige’s tongue slides into your mouth, you know that she’s begging you to cum; when Kiro’s eyes meet yours, she’s asking you to cum with her so that you three can get started on doing it all again.");

	output("\n\nYour lower body shakes in pleasure, your orgasm building quickly inside you and ready to burst forth, to meet both of your lovers’ unspoken requests. The three of you become a little more frenetic as time goes on, until you’re thrusting so fiercely and wantonly that you can’t withhold yourself any longer....");

	processTime(30);
	pc.lust(100);
	clearMenu();
	addButton(0,"Next",PKTSPE,args);
	//[=Climax=]
	// end scene (scene: PKTSPCL); decrease Energy by 10; go to (scene: PKTSPE)
}

// (scene: PKTSPE)
public function PKTSPE(args:Array):void
{
	clearOutput();
	showPaigeAndKiro(true);
	author("B!");
	args.push("PKTSPE");
	output("It becomes a desperate race for last place between you three and your intense fucking. Who came first and who came last becomes completely nebulous when the fact arrives; what you’re at least sure of is that it was a close ‘race.’");
	output("\n\nKiro’s orgasm hits as hard as someone you’d expect with her endowments to orgasm. ");
	//if {PKTSPCU, and the PC is pure female}
	if(InCollection("PKTSPCU", args) && !pc.isHerm() && pc.hasVagina())
	{
		output("You feel her load bloat her already fat cock all the more as her jizz rushes along her shaft, before it explodes from her cockHead wedged between you and Paige. A wet warmth blooms between you, starting at your [pc.belly] and shooting up to your [pc.chest]; your grinding and rocking against Paige suddenly becomes wet and easy, and the sound of Kiro’s bubbling cum squishing and squelching between your bodies fills your ears. All the while, she continues to thrust into the union of your bodies, her cum painting you two more and more, until it spills from between you and soaks into your bed.");
	}
	//if {all, except PKTSPCU if the PC is pure female}
	else 
	{
		output("The cum bloats her already impressive equipment with her Kui-Tan seed, which sinks into Paige in rapid gouts");
		//if {PKTSPS}
		if(InCollection("PKTSPS", args)) output("; you watch with rapt awe as her load visible travels down her shaft, before disappearing into Paige’s body with a flush you can practically hear through her heaving body");
		output(". Kiro barks in pleasure as her body moves on its own, thrusting deeper and deeper into Paige with every new blast, seeding her as deeply as she can; her balls lurch and coil against her, squeezing out every drop for her thirsty childhood friend’s cunt to gorge itself on.");
	}
	
	output(" Kiro’s output is so voluminous that you scarcely remember when it started, and you’re unsure of when it will, or can, end.");

	output("\n\nPaige wasn’t much further behind, and as soon as Kiro burst her bubble, it was enough to launch her over the edge. She groans out, a loud, lengthy, throaty groan, and you feel her shake and tense and relax in various, unrestrained waves throughout her body, from her limbs to her torso and back again. ");
	//if {PKTSPS}
	if(InCollection("PKTSPS", args))
	{
		output("You watch her pussy spasm on its own, independent of the rest of her; it locks, presses, and gulps at Kiro’s thrusting shaft, coaxing and milking it for more, and more, yet more, of that delicious, familiar jizz; you see splashes of her girlcum float up and collect around Kiro’s cock at her vulva with every thrust. ");
	}
	//if {PKTSPCU, and the PC is pure female}
	if(InCollection("PKTSPCU", args) && !pc.isHerm() && pc.hasVagina())
	{
		output("She squeezes and hugs at you as she deliberately moves her torso along yours, to spread Kiro’s jizz between you as deeply and thoroughly as she can; her eyes are shut in blissful concentration as she surrenders to her own body, but she has enough willpower to kiss you; to offer her tongue for you to suck, and to suck on yours when you offer it to her.");
	}
	//if {all, except PKTSPCU if the PC is pure female}
	else
	{
		output("Her hands clench, squeezing at anything they can find, including you and Kiro; her legs lock and stiffen, squeezing at anything caught between them. She has no control over her body: her eyes shut in blissful concentration and her tongue, unable to focus on kissing anyone, flops lamely out of her mouth.");
	}
	

	output("\n\nAnd, of course, there’s yourself; you manage to hold on for a paltry few thrusts longer, but watching Paige and Kiro arrive on their own triggers something within you that you can’t, and removes the inclination to, stop. ");
	if(!pc.isHerm() && pc.hasVagina()) 
	{
		output("You clench your body, your orgasm rocketing through your body, tightening your [pc.belly] and buckling your knees. Your [pc.vagina] gushes in time with its Ausar counterpart, ");
		//if {PKTSPS}
		if(InCollection("PKTSPS", args)) output("drenching Paige’s face and forcing her tongue and throat to work overtime to keep up with your squirts");
		else output("soaking your own [pc.legOrLegs] and squirting your feminine cum onto Paige, drenching her own legs and belly in your fluids");
		output(". Orgasm after orgasm rips through your body, in time with ");
		//if {PKTSPS}
		if(InCollection("PKTSPS", args)) output("the loads surging down Kiro’s dick and into Paige; your body tightens at the sight of each rolling surge down her meat, fantasizing that every heavy bubble of cum was being shot into you instead");
		//if {PKTSPCU}
		if(InCollection("PKTSPCU", args)) output("every blast of cum Kiro shoots between you and Paige, bathing you both in Kui-Tan cum, just as Paige had begged her to do. Every hot, wet shot between you brings another surge from your cunt, and the fight leaves your body all over again – until the next shot");
		//if {PKTSPCL}
		if(InCollection("PKTSPCL", args)) output("the palpable surges shooting up Kiro’s cunt and into Paige. You can feel every hot burst of cum flow up through Kiro’s shaft and into Paige through your tight proximity to the two; it’s a struggle to maintain your balance and your strength as you carry Paige through the whole thing, but, in a way, the sexual energy you’re feeding off of from the other two is keeping you going");
	}
	//if {PC has a penis}
	if(pc.hasCock())
	{
		output("Your [pc.cum] surges up through your [pc.cock], inflating it as the slit in your cock’s head yawns to deposit a thick, heaping load right into your Ausar lover; ");
		//if {PKTSPS}
		if(InCollection("PKTSPS", args)) output("she gargles and swallows your load, every heady mouthful sliding down her throat. She struggles somewhat to keep up with your load; you’re enthralled by the way her pussy clenches and slurps at Kiro’s massive shaft, easily taking every thick shot of Kui-Tan cum into its womb, and you’re lost in the fantasy of it being your dick that Paige’s cunt is milking. You match Kiro’s output, if not strictly in quantity, but in duration");
		else 
		{
			output("Your grip on Paige tightens, enough to make her wince, as your [pc.cum] surges up, through you, and into her. Your shaft is almost pinched at her entrance, stifling your flow somewhat, but you won’t be denied; your cum surges into ");
			//if {PKTSPCU and anal}
			if(InCollection("PKTSPCU", args) || pc.hasStatusEffect("Buttfucking Paige")) output("her tight ass, filling her up into her belly");
			else output("her tight, cramped cunt, seeding her willing womb");
			output(" in time with Kiro’s pulsing, thick load. Whenever a new, fresh batch of cum blasts through you, Paige’s body becomes tighter around Kiro, and when Kiro matches your load, Paige grows tighter around you. The three of you work automatically, all semblance of conscious control leaving your body as you function as a pair of cocks depositing load after load into a wet, receptive, shuddering hole");
		}
		output(".");
	}
	processTime(30);
	clearMenu();
	addButton(0,"Next",PKTSA,args);
	//[=Afterglow=]
	// end scene (scene: PKTSPE); reduce Lust to 0; go to (scene: PKTSA)
}

//[=Kiro=]
// (scene: PKTSK)
// Action tree: https://i.imgur.com/kgEjocX.png
public function PKTSK():void
{
	clearOutput();
	showPaigeAndKiro(true);
	var args:Array = ["PKTSK"];
	author("B!");
	output("Though your tongue is in Paige’s mouth, and your hands are exploring her body, you can’t help but keep your eyes on Kiro and her horsecock. The way she lathers it with that oil, making it slick and shiny in the light of your quarters; the way it slowly rises over time, bloating and engorging with her flowing blood, getting it harder and readier; the way that Kiro knows you’re staring, and with a teasing smile, she rubs the palm of her hand over the cap of her cock, spreading the bead of pre that had emerged along the underside of her shaft, causing it to bob in your direction enticingly....");
	output("\n\nPaige notices that you’re a bit distracted with your kissing and exploring. <i>“Am I really that boring to you, [pc.name]?”</i> she pouts, flicking her fingers across your nose playfully. <i>“You’ve got a naked, horny bitch sitting on your lap and fucking your throat with her tongue, and all you can think about is Kiro’s cock.”</i>");
	output("\n\nKiro steps in between you both, placing her hands on both your scalps. She thrusts her hips forward, her thick tree-trunk of a cock slipping in between your bodies, nestling itself warmly against your stomachs. <i>“Can you really blame [pc.himHer]?”</i> she asks as she casually fucks the space in between you. <i>“It’s a pretty great dick, if I say so myself.”</i>");
	output("\n\nPaige smirks at Kiro’s forwardness. With her left hand, she trails her way down to Kiro’s base, running her palm along the smooth skin of her sack; with her right, she hefts Kiro’s cock slightly, lifting it between you two until it bumps against the underside of her breasts. She leans forward the rest of the way and, with her eyes on yours, runs her tongue along the beating, bloating side of her shaft. <i>“Nope,”</i> she says simply. <i>“Not even a little.”</i>");
	output("\n\nYour body tightens and your mouth waters at the sight. Your hands itch to grab onto Kiro’s shaft, much like how Paige is doing, and assist her in servicing such a magnificent piece of dick; meanwhile, your [pc.vagOrAss] clenches at the fantasy of taking it into itself, to get ploughed and fucked and seeded with her thick Kui-Tan cum.");
	output("\n\nIt’s all up to you on which fantasy you’d rather fulfill....");
	processTime(7);
	clearMenu();
	//[=ServiceHer=][=Line Up=]
	// end scene (scene: PKTSK)
	addButton(0,"ServiceHer",PKTSKSH,args);
	addButton(1,"Line Up",PKTSKLU,args);
}

//[=ServiceHer=]
// (scene: PKTSKSH)
public function PKTSKSH(args:Array):void
{
	clearOutput();
	showPaigeAndKiro(true);
	author("B!");
	args.push("PKTSKSH");
	output("That cock of Kiro’s is just too big and juicy to ignore. Your eyes are fixated on it and the way it throbs in your presence; the way that, the longer it stays lodged in between your body and Paige’s, it seems to steadily get larger, thicker, and more <i>delicious.</i>");
	output("\n\nYou actually salivate. A single strand of drool drips from your [pc.lips] and lands onto Kiro’s shaft. You sheepishly wipe at your chin while the two ladies share a well-meaning laugh.");
	output("\n\n<i>“I can guess what’s coming next, [pc.name],”</i> Kiro giggles as her hand rubs at your scalp. She’s pushing you, gently, forward, towards the tip of her burgeoning prick, towards what it is you truly want. <i>“Hell, don’t let me stop you. If you want a big mouthful of dick, I’m sure Paige will be more than happy to let you have the first taste.”</i>");
	output("\n\nPaige hums in ascension; she’s already busy licking and kissing at the thick, broad side of Kiro’s shaft, willfully leaving the head unattended. It would be rude of you to refuse such an invitation from them both; you mimic Paige’s motions, leaning forward putting your face and lips against Kiro’s cock, then draw a single, elongated lick up her shaft until you’re positioned at its head.");
	output("\n\n<i>“Atta [pc.boyGirl],”</i> Kiro sighs as you work her with your mouth. You kiss, lick, and suck at the blunt, flared head of her dick, wrapping your [pc.lips] around it and giving it a hearty suck before disengaging and licking circles around the urethral opening. You suck down every drop of pre as they come from her shaft, savoring their flavor before opening wide and repeating the whole operation a second time.");
	output("\n\nYour hands busily work at the shaft, jerking what your mouth can’t take, which is quite a lot. Paige, meanwhile, occupies herself further down, opening her maw wide to suck at huge swaths of area, her broad Ausar tongue making wide, wet swipes at the meaty base of Kiro’s cock. She leans in occasionally, her nose butting against Kiro’s lower abdomen, as she dips lower, her questing, hungry mouth tasting at the skin of Kiro’s taut sack. She hefts one nut up to her pretty lips so she can give it a proper, wet kiss, before drawing her tongue at the crease of their union as she pulls herself back up to work the fat shaft again.");
	output("\n\nKiro sighs in delight, her hips instinctively humping forward whenever one of you hits a particularly sensitive nerve. She palms at both her boobs as her eyes narrow on yours. <i>“Gods, it’s good to be queen,”</i> she muses, and she punctuates the statement with a rough thrust, her blunt cock-head bumping you in the face.");
	output("\n\nYou pull away from Kiro and play along, telling her that you live to serve. She coos in delight, and you’re rewarded with another splurt of warm pre across your lips; ");
	if(pc.hasCock()) output("your own [pc.cock] lurches at the submissive gesture and at the tasty reward. You’re hard as diamonds and your own pre-cum is pouring from you in constant streams");
	if(pc.isHerm()) output(". Meanwhile, ");
	if(pc.hasVagina()) output("your [pc.vagina] clenches and drools its own fluids down your [pc.thigh], thirsty for a taste of that fat cock for itself. Your eyes cross at the fantasy: if it feels this good to take Kiro into your mouth, you can only fantasize about how it will feel in your cunt");
	output(". You’re not that close to an orgasm yet, but you don’t doubt that it’s on the way if you keep this up.");

	output("\n\nJust as another service of Kui-Tan pre dresses your tongue, Paige pulls herself away from Kiro, taking a deep breath of comparatively fresh air. <i>“I can’t take much more of that,”</i> she says in frustration, slapping at Kiro’s meat and watching it bob and sag underneath its own weight. <i>“You’re fucking one of us right now, Kiro. I’m not spending all night sucking your balls.”</i>");

	output("\n\nKiro calmly puts a hand beneath Paige’s chin, keeping the Ausar’s focus on her. <i>“Would that be so bad, Paige?”</i> she asks, puckering her lips as she leans in.");
	output("\n\n<i>“I mean, no. But you know how this works, Kiro.”</i>");
	output("\n\n<i>“I do, Bookworm.”</i> Kiro ends the conversation by pressing forward, their lips colliding. You swirl your [pc.tongue] around Kiro’s cock as you watch the two ladies fiercely make out before you, their tongues exploring each other’s mouths, a long strand of saliva dripping down between them as they taste each other; Kiro grabs at Paige’s boob, massaging the flesh, and Paige returns the gesture, pinching at Kiro’s nipple.");
	output("\n\nKiro pulls away as that same hand dips lower, travelling across Paige’s tight abdominals. Her hand shoots lower, and her fingers dip into Paige’s cunt, sampling just how wet and ready she is for some real action. She fingerbangs Paige for a few thrusts; Paige’s knees buckle in pleasure at Kiro’s masterful movements, and she grips onto Kiro’s fur for support.");
	output("\n\nKiro’s eyes lock onto yours as she brings her hand up to her face. She slips her now-soaked fingers into her mouth, sucking them clean, and she hums her approval. <i>“How about it, [pc.name]?”</i> Kiro asks as she withdraws her fingers, her now-free hand wrapping around Paige’s body to grope at her ass. <i>“Paige is about ready to get fucked.”</i> Her eyes narrow deviously and her lips curl into a mischievous smile. <i>“Wanna go first?”</i>");
	output("\n\n<i>“What?!”</i> Paige asks in frustrated surprise.");
	output("\n\n<i>“Come on, look at [pc.himHer],”</i> Kiro insists, motioning to you and the way you still have her cock in your mouth, even after all that. <i>“You’re a horny bitch, Bookworm, but [pc.heShe]’s hasn’t had my dick off [pc.hisHer] mind since we started. Figured I’d ask the thirstier of you two first.”</i>");
	output("\n\nYou look down the long, bloated shaft of Kiro’s equine dong. Kiro’s giving you the opportunity to go first and take this monster into yourself – and, given how it’s coated in that elasticizing oil, you’ll probably be able to take <i>all</i> of it. But, on the other hand, you could continue doing what you’re doing here and let Paige get fucked. Kiro’s body tastes pretty good, after all....");

	processTime(10);
	pc.lust(20);
	clearMenu();
	//[=Continue=][=Go First=]
	// end scene (scene: PKTSKSH)
	addButton(0,"Continue",PKTSKC,args);
	addButton(1,"Go First",PKTSKGF,args);
}

//[=Line Up=]
// Randomly choose whether Kiro penetrates the PC or Paige, regardless of endowments
// (scene: PKTSKLU)
public function PKTSKLU(args:Array):void
{
	clearOutput();
	showPaigeAndKiro(true);
	author("B!");
	args.push("PKTSKLU");
	output("You eyeball Kiro’s length, your lips pursed and dry as you imagine it in your mouth. With some reluctance, though, you admit that, even with that elasticizing oil on it, you doubt that you’d be able to give Kiro the pleasure she’s looking for with your mouth. And besides – you have another hole that could use the attention.");
	output("\n\nOne of your hands crawls down Paige’s side, stopping at the fat of her ass and giving her a good, hearty squeeze. You tell her to face away from Kiro and to get onto her hands and knees on the bed. Paige herself is hesitant to let go of the meaty horsecock between you, but relents and follows your instruction, turning away from Kiro and lifting her tail, presenting her drooling gash to the Kui-Tan.");
	output("\n\nYou take a similar position next to her, bumping your [pc.ass] against Paige’s, rubbing the [pc.skinFurScales] of your butt against the fine fur on her toned ass. You both giggle as you move off-rhythm from each other, wagging your asses towards Kiro, inviting her to choose one of you two for her to fuck. You bite your bottom lip in anticipation: will she choose Paige’s familiar cunt and fuck her into your mattress? Or will she shove that monster of a dick into your [pc.vagOrAss] and seed you like you hope she would?");
	output("\n\nKiro grunts in approval as she roughly brings both hands down on each of your cheeks: a hard slap on Paige’s right cheek, and one on your left. She rubs at the hot, red spots she just made as she explores your bodies with her hands; her dick slides itself in between your bodies once again, fucking at the tight space between you as she gropes and feels indecisively.");
	output("\n\n<i>“How’s a girl supposed to choose?”</i> Kiro asks nonchalantly as she teases and prods at different spots at your bodies. She admires the way your body relaxes against her palm, allowing your flesh to jiggle in time with her manhandling, while she coos at the tightness and intensity of Paige’s yoga-trained derriere. <i>“Gods, life is never easy,”</i> she laughs.");

	// continue here if Kiro fucks Paige
	if(rand(2) == 0)
	{
		pc.createStatusEffect("KIRO_FUCKING_PAIGE");
		pc.setStatusMinutes("KIRO_FUCKING_PAIGE",250);
		output("\n\nKiro’s questing hand dips a bit further inward, questing towards your [pc.vagOrAss]. You feel her skilled, furry fingers grind against your entrance, their pointed tips spearing into you just a little bit. Your body quakes in pleasure and you tense against her, hoping that this is just a taste before the real thing. But, much to your dismay, you watch Kiro out of the corner of your eye as she repositions herself behind Paige.");
		output("\n\n<i>“Paige has been waiting long enough for another taste of this, [pc.name].”</i> You watch as she realigns her cock against Paige; she hotdogs herself between her taut Ausar cheeks, the blunt tip beating against the base of her tail. Paige tenses and hiccups in pleasure as that battering ram of a dick bats against her erogenous zone, and from the way Kiro yanks at Paige’s tail to keep it steady, you guess that Kiro knows exactly what she’s doing. <i>“Be a good [pc.boyGirl], though, and maybe it’ll be you I wear like a condom next time.”</i>");
		output("\n\n<i>“Gods, Kiro, you’re such a biii</i>iiieeeeahhhhh,”</i> Paige utters in defeat as Kiro rears back, her dick spearing deeply into her with one, powerful, definitive thrust. You hear a distinct squelching noise, almost like a moist sponge being squeezed, as Kiro’s enormous tool unceremoniously worms its way into Paige’s cunt; the oil works its magic as both of their bodies meld perfectly around each other, accommodating each other to work in perfect synchronicity.");
		output("\n\n<i>“Yeah, I’m a bitch,”</i> she says snidely, punctuating her syllables with an audible ‘plap’ of her shapely hips pounding into Paige. <i>“But I’m a bitch with a</i> huge <i>dick.”</i>");
		output("\n\nPaige’s eyes cross and she lays her head to one side, her tongue lolling out in delirious pleasure. Her hands grip at the sheets on your bed in an effort to remain locked in place, but it fails: with every thrust, she inches just a bit further along your mattress. The sheets soak in a growing puddle around Paige’s face as her drool drips from her insensate mouth unabated.");
		output("\n\nKiro, proving that her bluster isn’t just words, expertly works your own genitals perfectly in time with her thrusting into Paige’s cunt. Her fingers thrust into your [pc.vagOrAss] as she thrusts into Paige, crooking and reaching for a different spot inside you every time");
		if(pc.hasCock()) 
		{
			output(", and after a few rough, intense minutes, she seamlessly switches to reaching for your [pc.cock], wrapping her fingers around it and giving you a handjob, still at the same tempo as her own thrusting]. Your [pc.hips] bend and turn with Kiro’s movements and actions, trying to eke out every last, wonderful stroke, pet, and fingerbang she’s willing to afford you.");
			output("\n\nThat said, there’s only so much pleasure a hand can give you, especially when there’s a rock hard dick fucking another hole a scant few inches away. You impatiently eye Paige; she’s been fucked so thoroughly across your bed that her head is beginning to fall off the edge, and her eyes have gone from crossed to rolled, her irises disappearing back into her head. You pout; it could have been you that’s getting fucked silly!");
			output("\n\nYou could voice your opinion as such; maybe Kiro will give you a break and pull out from Paige (if she can) so she can give you some lovin’. Or, alternatively, you could take a more proactive approach to this threesome: Kiro’s got a whole lot of cock, but that doesn’t mean she has to be the only one to do all the work between you three....");
		}
	}
	// Continue here if Kiro fucks the PC
	else
	{
		pc.createStatusEffect("KIRO_FUCKING_PC");
		pc.setStatusMinutes("KIRO_FUCKING_PC",250);
		output("\n\nKiro reaches for Paige’s tail, yanking it upright and pushing it over her back, exposing every part of Paige to herself. It reaches down, slipping a finger into Paige’s tight pussy, making her flinch and shudder in anticipation, but Kiro isn’t done: she withdraws, and then lightly scratches and palms at the base of Paige’s upraised tail, playing with the erogenous zone that she knows is there. In just a few strokes, Paige is a puddle of goo before her.");
		output("\n\nYou internally fret that Kiro’s chosen Paige to be gifted her cock, but, to your delight, Kiro shuffles towards you; you feel her hand work between you for a moment, and then her hot, heavy length wetly slaps onto your back, her thickness lodged warmly between the cheeks of your ass as she hotdogs you. <i>“Sorry, Bookworm, but [pc.name] has got an ass that’s just too good to pass up.”</i> Paige’s mouth opens as a retort forms on her lips, but another rough yank at her tail stops her immediately. <i>“Let’s not pretend you haven’t had enough of my dick to last you a lifetime regardless, eh?”</i>");
		output("\n\nPaige looks in your direction lustfully as she hears the squelching noise of Kiro thrusting herself into your [pc.vagOrAss]; you feel your body split, bloat, and inflate to accommodate her immensity, and you know that if it weren’t for the oil, this would have been significantly more of an ordeal than it is. As it is, your eyes cross and your vision blurs as you feel your body surrender to the invading girth of her tremendous horsecock: you feel every delicious inch tickle against the rim of your entrance as she pushes deeper and deeper into you, and your [pc.belly] pushes you up and forward as it makes room for herself.");
		if(pc.hasVagina()) pc.cuntChange(0,kiro.cockVolume(0));
		else pc.buttChange(kiro.cockVolume(0));
		output("\n\nKiro sighs a single, elongated sigh as she settles inside you; you feel the heat of her bloated, overfull testicles against your [pc.legs], their load churning and bubbling to seed you, and you want nothing more. When she pulls back and thrusts into you again, the shock through your body dislodges your tongue from your mouth, and you groan dumbly, drool seeping from around the corners of your mouth as you’re driven across your sheets by Kiro’s pounding.");
		output("\n\nKiro, proving that her bluster isn’t just words, even continues exploring your body with her available hand: ");
		if(!pc.hasCock()) output("she explores the meat of your ass and down your thigh, squeezing and groping at your delectable [pc.skinFurScales] there. She even reaches back to your ass and drives a finger into your [pc.asshole], exploring that avenue a bit. You have no sensibilities to stop her even if you wanted to: with that cock of hers pounding into your [pc.vagina] like it owns it, you’re little more than a steak with a nice ass for Kiro to play with. Just as you like it");
		else output("she pokes, grabs, and molests at the fat of your ass and your thigh, groping at the delectable [pc.skinFurScales] there, but she doesn’t waste much time with the teasing and eagerly reaches beneath you, her swift, precise fingers wrapping surely around your bobbing, leaking [pc.cock]. She jerks you expertly, the way only a woman with a dick herself could give someone else a handjob; you already had no control over your body, with the way her mammoth meat wraps your [pc.vagOrAss] around itself like it owns it, but with every milking, jerking motion she makes on your meat, you sink deeper into your sexual reverie with her");
		output(".");

		output("\n\nThat said... for all the fucking you’re getting, and as delirious and pleasure-drunk you are with Kiro fucking you, the fact that you’re one of the wheels in this threesome is unshakeable. Your vision occasionally clears enough for you to see Paige, lying on her belly as Kiro roughly fingerfucks her in time with her thrusting into your [pc.vagOrAss]. She makes no effort to try and interrupt your time with Kiro, but you know that she’s going to need something a bit more substantial than a finger in the cooch to really get her off.");
		output("\n\nTwo ideas cross your mind at the same time. On the one hand, you could take a more proactive role in this threesome – Kiro might have a shitload of cock on her, but that doesn’t mean she has to do all the work. But, on the other hand, you could be selfish and greedy and do nothing as Kiro has her way with your willing body. You’re sure Paige would understand....");
	}
	processTime(20);
	pc.lust(30);
	clearMenu();
	//[=Your Turn=][=Reposition=]
	// if PC is not getting fucked, the button is [=Your Turn=]; if the PC is getting fucked, the button is [=Do Nothing=]
	// end scene (scene: PKTSKLU)
	if(!pc.hasStatusEffect("KIRO_FUCKING_PC")) addButton(0,"Your Turn",PKTSKGF,args);
	else addButton(0,"Do Nothing",PKTSKGF,args);
	addButton(1,"Reposition",PKTSKR,args);
}

//[=Continue=]
// (scene: PKTSKC)
public function PKTSKC(args:Array):void
{
	clearOutput();
	showPaigeAndKiro(true);
	args.push("PKTSKC");
	author("B!");
	output("You decide that you’re just fine where you are. You do not respond to Kiro’s question; you instead answer by pulling her cock from your lips, and trailing them down its bloated underside, where you can feel every salacious throb of her cum tube against your tongue.");
	output("\n\n<i>“Looks like it’s your lucky day, Bookworm,”</i> Kiro muses as you kiss and lick your way down her shaft until your [pc.lips] mesh warmly against her stretched sheath. <i>“You bagged one of the better ones. You be sure you thank [pc.name] properly after we’re done.”</i>");
	output("\n\nPaige says nothing as she excitedly lifts a leg around Kiro’s waist; she swings her body around until she and Kiro are face-to-face, and she wastes no time in grinding and humping herself against her. When she flexes forward, her slippery cunt drools a slick line of girl-lube up Kiro’s abdominals, and when she leans back, she slides it along her length, forcing it down with her body weight until it rests heavily against your head.");
	output("\n\nYou hear the sound of them both kissing above you, and you occasionally feel Kiro’s fingers brush against your [pc.hair] as they roam over the broad of Paige’s ass. You continue your adventure beneath them, licking at Kiro’s base and pressing your [pc.chest] against Kiro’s balls, feeling them flex and hearing them rumble with seed as you work her. You lift your own hands skyward and join Kiro in feeling up Paige’s ass, groping at anywhere her hands aren’t and getting two thick handfuls for yourself.");
	output("\n\n<i>“I’d better not waste this opportunity,”</i> Paige giggles as she wiggles herself against your hands. You glance up and watch Paige rock her body against Kiro’s meat; you admire her tight pussy and the way it pulls at itself with her motions and leaks her fluids down around the sides of her shaft. Then, the vision is pulled away, as she traces the topside of Kiro’s dick from root to crown, inverse to what you did earlier, until she’s out of sight.");
	output("\n\nYou focus on your own work, fondling at Kiro’s equipment and patterning them with wet, sloppy kisses, when you feel Kiro’s body stiffen and you hear both ladies gasp in pleasure. Her rod flexes against you – you can hear her blood flow and her muscles strain with renewed vigor – followed by the unmistakable, wet, grinding, squeezing sound of a lubed dick sliding into a warm hole.");
	output("\n\nPaige has both her legs wrapped around Kiro’s waist and her arms wrapped around her shoulders, bracing herself against her while that monolith slides into her eager pussy. You’re given a front-row seat to watching that pussy spread and slide down, inch after inch, into Paige’s body; whenever she passes a new milestone on Kiro’s length, Kiro tenses and her balls pull against her momentarily before the whole cycle starts again.");
	output("\n\nDrops of their combined fluids streak in rivers down Kiro’s length until they either pool into the fur of her sheath, or they land on your own nose and cheek. You take it all in horny stride as you dip further down, lavishing her furry nuts in your spit, relaxing and bathing them to release their load into the hungry Ausar you’ve given this opportunity to.");
	output("\n\nYou don’t forget about yourself: your hand dives to your crotch, ");
	if(pc.hasCock()) output("jerking at your [pc.cock] with each thick lick you make against Kiro’s genitals. You use the flavor and your submissive posture as gasoline to fuel your diamond-hard erection; with every pull and tug at your dick, you get hornier – and, if you’re not mistaken, a little longer – until your pre-cum is leaking so expediently that you coat yourself with it three times over and then some");
	if(pc.isHerm()) output(".\n\nAnd, dexterously, you reach a bit deeper, ");
	if(pc.hasVagina()) output("palming wetly at your [pc.vagina], matching your strokes of the tongue with long, extended pets at your gash. Kiro’s every shudder vibrates through you, shaking you to your cunt before your own pre-orgasmic tenses bounce them back. In some part of your mind, you regret not taking up Kiro on her invitation to get fucked – but, in most of your mind, you’re quite happy here, with such a sexy show taking place just a few inches above you");
	output(".");

	output("\n\nWhen they feel they’ve hit a limit, you hear Paige sigh in delight and you feel her move and adjust herself to the length buried belly-deep in her gash. <i>“That’s a good girl,”</i> Kiro sighs, her own legs bouncing a bit to readjust her grip on Paige’s body. <i>“Just like old times.”</i>");
	output("\n\n<i>“Yeah,”</i> Paige answers wistfully.");
	output("\n\nThey pause momentarily, and then Kiro begins to aggressively buck her hips forward and back, sawing her dick into Paige. You hear Paige’s breath catch in her nose when she starts, and then her hot breath comes out in a single, shuddered gasp when Kiro picks up the pace. <i>“This too,”</i> Kiro says over the wet clapping of their hips meeting and the moist clenching of a pussy milking a penis.");
	output("\n\nPaige hums in lustful reverie as her body works automatically. She has no real leverage or control, with her limbs wrapped around Kiro’s body; all she does is let herself get impaled and then let Kiro and gravity do the rest. <i>“But we’ve never had a friend with us before,”</i> Paige says, her every other word coming out as hiccups, in time with Kiro’s forceful pounding. <i>“How does [pc.heShe] feel? What is [pc.heShe] doing?”</i>");
	output("\n\nIn response, you open your mouth wide and shuck in as much nut as you can, giving Kiro a delectable suck, letting her know exactly how she should answer. <i>“Goddamn,”</i> Kiro replies breathlessly, and her legs split apart subconsciously, giving you more room to work. <i>“[pc.HeShe]’s giving my right nut one hell of a bath.”</i> She doesn’t continue, and instead hooks her leg over your shoulder, trapping you directly beneath her and between her legs so that you can properly get all the hard-to-reach spots. <i>“A bit to the left, would you?”</i>");
	output("\n\n<i>“[pc.name] isn’t some rag you use to wash your nuts, Kiro,”</i> Paige chastises through her strained breath.");
	output("\n\n<i>“Yeah, of course,”</i> Kiro answers, and, around Paige’s toned leg and around Kiro’s pulsating log of a dick, you see her glance down in your direction, <i>“and Gods above if I don’t owe you one hell of a fuck for it or something, [pc.name]. But, you chose to stay down there.”</i> She steps forward, pressing you deeper into her sack and obscuring your vision and muffling the sounds of the room with her bloated balls. <i>“Might as well make the most of it.”</i>");
	output("\n\nWith that, her pace picks up considerably, her thrusting growing impatient and demanding as she fucks Paige so hard, you’re not sure she’ll be able to do yoga for a week. Paige’s voice comes out as high-pitched, strained whines as her body contorts around the log inside her; you’re sure she’s thanking the stars that Kiro remembered that elasticizing oil of hers.");
	output("\n\nYour senses are bombarded with the occasional fleeting vision of Kiro splitting Paige in half with her horsecock when it isn’t obscured by her testicles; the smell of a bitch getting fucked and a stud fucking her as hard as they can; and the taste of a furry set of bouncing, tensing balls as they prepare to unload. Your masturbation kicks up a notch as you work Kiro over as best you can with what you have.");
	output("\n\nAnd your efforts apparently have their intended effect: it isn’t long before you hear Kiro grunt, her voice coming up high and settling, announcing to the room in a primeval, monosyllabic way that she’s about to orgasm. The skin on her balls clench and bunch up all around her, pulling towards her groin, as her cum pumps and bubbles upward. And Paige: she’s been relatively quiet the whole time, but as soon as Kiro’s orgasm began to approach, she began to whine like a needy, horny puppy, wordlessly asking for her every drop.");
	output("\n\nIt’s only a few more thrusts before she gets what she wants. You keep your eyes peeled on them both: you wouldn’t want to miss this show for the world.");
	
	processTime(20);
	pc.lust(100);
	clearMenu();
	addButton(0,"Next",PKTSKE,args);
}
//[=Climax=]
// end scene (scene: PKTSKC); go to (PKTSKE)


//[=Go First=]
// if coming from [=Service Her=], this button is labeled [=Go First=]; if coming from [=Line Up=] and Kiro is fucking Paige, this button is labeled [=Your turn=]; if coming from [=Line Up=] and Kiro is fucking the PC, this button is labeled [=Do Nothing=]
// (scene: PKTSKGF)
public function PKTSKGF(args:Array):void
{
	clearOutput();
	showPaigeAndKiro(true);
	author("B!");
	args.push("PKTSKGF");
	
	// continue here if coming from PKTSKLU and Kiro is fucking Paige
	if(InCollection("PKTSKLU", args) && pc.hasStatusEffect("KIRO_FUCKING_PAIGE"))
	{
		output("Your [pc.legOrLegs] clench at unrestrained want and lust as you watch Paige get fucked so hard that she’s lost all sense of where she is. You glance over your shoulder towards Kiro; your eyes lock, and although she’s balls-deep in Paige, you know you have her attention.");
		output("\n\nYou pout your [pc.lips] in her direction and you wriggle your hips, slapping the thick of your ass against Paige’s, feeling every powerful thrust Kiro makes into her. You adjust your lower body to give Kiro a better visage of your unoccupied rear end, wordlessly hinting to her that you’re cold, empty, and lonely, and you could really use a hot cock to warm you up.");
		output("\n\nShe laughs at your unsubtle hinting. <i>“Right, Paige. Sorry, but it looks like our " + pc.mf("Mister","Missus") + " is getting a little impatient.”</i>");
		output("\n\nShe withdraws from Paige’s tight-and-unwilling-to-let-go tunnel with an audible slurp, followed by what sounds like a veritable splash of liquid as Paige’s honey drips off Kiro’s rod. As soon as her vagina becomes vacant, Paige’s expression hardens and her senses return to her; she looks over her shoulder in frustration before she remembers where she is and what Kiro is about to do; she’s still horny, but she doesn’t object when Kiro aligns herself against your [pc.vagOrAss] and, without any preamble at all, introduces herself into you.");
		pc.removeStatusEffect("KIRO_FUCKING_PAIGE");
		pc.createStatusEffect("KIRO_FUCKING_PC");
		pc.setStatusMinutes("KIRO_FUCKING_PC",200);
		if(pc.hasVagina()) pc.cuntChange(0,kiro.cockVolume(0));
		else pc.buttChange(kiro.cockVolume(0));
	}
	// continue here if coming from PKTSKLU and Kiro is fucking the PC
	else if(InCollection("PKTSKLU", args))
	{
		output("You lower your head into the sheets of your bed, resigning yourself to Kiro’s whims and whatever pleasure she decides to take from you. You hope, though, that the only thing she does differently is that she fucks you harder, and that the thought of pulling out from your [pc.vagOrAss] doesn’t even cross your mind.");
		output("\n\nLuckily for you, that seems to be exactly the case: you glance in Paige’s direction, and despite her being left alone and relatively unattended, she doesn’t seem to mind that she isn’t getting any – at least, not enough to raise her voice about it. Kiro, lost in her rut, makes no attempt to pull out of you, and fucks you like she owns you. Just as you wanted.");
	}
	// continue here if coming from PKTSKSH
	if(InCollection("PKTSKSH", args))
	{
		output("You look into Kiro’s eyes, and then Paige’s, momentarily indecisive. The taste of Kiro’s pre soaks and cakes your [pc.tongue], leaving you subconsciously wanting more, almost like a junk food. But, you think that if you turned down Kiro’s invitation to properly take this wonderful beast into your body, you don’t think you’d ever forgive yourself.");
		output("\n\nYou disengage and lay on all fours on your bed, giving your [pc.ass] a shake in Kiro’s direction, inviting her to come and get it. <i>“Sorry, Bookworm, but it looks like [pc.heShe]’s made [pc.hisHer] choice,”</i> Kiro says as she steps forward, her hands clapping down on your cheeks roughly.");
		output("\n\nPaige, though, doesn’t seem too upset; she takes a spot next to you on the bed, watching you with an amused expression as Kiro positions the blunt tip of her cock against your [pc.vagOrAss]. <i>“It’s fine with me,”</i> she replies. <i>“You’ll just have to make it up to me later.”</i>");
		output("\n\nKiro doesn’t give you the opportunity to fantasize about what that might entail. As the words register in your head, she thrusts in, easily sinking her oiled-and-lubed dick into you in a quick, forceful thrust.");
		pc.removeStatusEffect("KIRO_FUCKING_PAIGE");
		pc.createStatusEffect("KIRO_FUCKING_PC");
		pc.setStatusMinutes("KIRO_FUCKING_PC",200);
		if(pc.hasVagina()) pc.cuntChange(0,kiro.cockVolume(0));
		else pc.buttChange(kiro.cockVolume(0));
	}
	// merge here
	output("\n\nKiro pounds you into your bed, and you couldn’t stop her if you wanted to; you relax and resign yourself to her brutal treatment, allowing your body to accept all of her into your [pc.vagOrAss], thanks in no small part to the oil covering her from tip to base. You can feel every tight, hard inch slide into you until your ass beats against her belly; when she pulls out, you feel an emptiness blossom within you in time with her vacating cock, only for it to be replaced with more dick.");
	output("\n\nPaige, for all her patience with you and your selfish, unspoken desire to keep getting fucked, is nonetheless none too keen to lay there with some fingers for her to play with. Through your blurred, crossed vision, you see her crawl towards you until she’s right next to you; she leans in, her lips against yours and her tongue suddenly in your mouth. It takes you a moment to understand what’s happening, and even when you <i>do,</i> your automatic response isn’t to kiss her back so much as it is to suck on her tongue.");
	output("\n\n<i>“I’m not going to sit here and watch you get all the dick, [pc.name],”</i> she says as her body begins to shift. <i>“I’m getting some action right here, right now, or so help me.”</i>");
	output("\n\nDexterously, Paige flips onto her back and lifts her left leg high, hooking it around Kiro’s neck and locking her foot between Kiro’s shoulderblades; with a heft, she does the same with her right leg. Keeping her steady on the bed with her hands, she places her body above yours, and then thrusts her hips towards Kiro’s face, mashing her sopping wet pussy against Kiro’s lips. <i>“Eat up,”</i> she commands.");
	output("\n\nYou don’t feel any pressure on your back, but you do see Paige’s hands on either side of her head, keeping her up. It’s a unique position she’s put herself in – her yoga practice must be coming through for her now.");
	output("\n\nPaige gasps in delight as you hear the obvious sounds of a questing tongue eagerly fucking, tasting, and eating a wet Ausar pussy; her hands struggle and strain in your vision, and you wonder how long she’ll be able to keep up the position.");
	output("\n\nKiro demonstrates her expertise as a fucker by not breaking stride, even as Paige fucks her mouth. Her dick continues to piston into your [pc.vagOrAss]: in fact, it gets faster and deeper now that Kiro’s busy on both ends. Your hands bunch the sheets of your bed into balls and your eyes begin to water as you feel that blunt horsecock pound against your ");
	if(pc.hasCock()) output("prostate. Her every pound into you causing a fresh gush of pre-cum to jet from your [pc.cock] in pleasure, soaking your bedding through");
	else output("G-spot – not that that’s hard for Kiro: her dick is so big that it rubs at everything inside you at all times. Her every thrust into you causes a fresh gush of your personal lube to splurt from the crease of where her cock presses against your pussy, drenching your [pc.legs] and as far up as Kiro’s stomach");
	output(". You’re very close, and it’ll only take a dozen more thrusts, if even that.");

	output("\n\nYou can hear Kiro’s muffled voice as she chows on Paige’s box, and from the way she’s grunting in ascension, and the way her stiff dick seems to angle itself just a little bit higher, and the way the skin of her balls tense and scrunch around your legs, she’s not going to last much longer either. And Paige is the same way: she’s the most vocal of you three, with her voice coming out in wanton, feral, horny yelps; her grip slips occasionally and you can feel her quivering body press onto yours as she tries desperately to cum into Kiro’s mouth.");
	output("\n\nYou bite onto the sheet and clench your jaw, bracing for the tidal wave that’s about to come crashing into all three of you....");
	processTime(20);
	pc.lust(100);
	//[=Climax=]
	// end scene (scene: PKTSKGF); go to (PKTSKE)
	clearMenu();
	addButton(0,"Next",PKTSKE,args);
}

//[=Reposition=]
// (scene: PKTSKR)
public function PKTSKR(args:Array):void
{
	clearOutput();
	showPaigeAndKiro(true);
	author("B!");
	args.push("PKTSKR");
	// continue here if coming from PKTSKLU and Kiro is fucking Paige
	if(InCollection("PKTSKLU", args) && pc.hasStatusEffect("KIRO_FUCKING_PAIGE"))
	{
		output("As hot as it is to watch Paige got fucked – and as mesmerizing as it might be to watch that thick tree of a dick saw in and out of a hole that should have been too small to accommodate it, Kiro’s every thrust being accompanied by a wet squeeze and a moan from the yoga instructor – you have some needs of your own and you aren’t about to just sit there and watch the fun unfold. It’s time to be a little more proactive in this threesome.");
	}
	// continue here if coming from PKTSKLU and Kiro is fucking the PC
	if(InCollection("PKTSKLU", args) && pc.hasStatusEffect("KIRO_FUCKING_PC"))
	{
		output("Your vision is blurred and your eyes are watering with how much pleasure you’re getting from having Kiro fuck your [pc.vagOrAss] so wantonly – and you know Kiro is feeling it too, with the way she pounds so hungrily into your body and the way her hand explores your creases and hills. But, despite your inability to focus, you know that this is a threesome, and that, although you very much could ride Kiro’s dick until the next sunrise, she has needs too.");
		output("\n\nYou weakly wave at Kiro, wordlessly instructing her to stop. It takes her a thrust and a half, but she dredges up the willpower to do so. You both remain still for a moment, catching your breath; she’s still lodged deep inside you, and you can feel her every heartbeat through her thick length. When your sensibilities return, you tell Kiro simply that it’s Paige’s turn.");
		output("\n\nPaige’s eyes light up at your generosity, and her mouth widens into a giddy smile – a pair of expressions that immediately wipe from her face when Kiro, sexually energized and close enough to her own orgasm, withdraws from you with a loud slurp and, without any preamble, thrusts herself into the bitch.");
		output("\n\nA muffled scream, gurgled by Paige’s spit as she chokes on her own breath in surprise, echoes through the room in time with the wet plap of Kiro’s nuts slapping into Paige’s ass. She takes a similar position as you: face-down, ass-up, hands clenched into balls on the sheets, while Kiro uses her puffy, tight cunt as a tool for her own pleasure. You lay there, collecting your energy, watching Paige’s body push along your bed, dragging your poor sheets along with her.");
		output("\n\nThe display reminds you that you haven’t cum yet, and you’re still horny as fuck. You might have done Paige a favor, but you still have needs of your own that haven’t been met. This whole threesome so far, you’ve done nothing but lie there for Kiro’s pleasure. It’s time to be a little more proactive.");
	}
	pc.removeStatusEffect("KIRO_FUCKING_PAIGE");
	pc.removeStatusEffect("KIRO_FUCKING_PC");
	// merge here
	// continue here if the PC has a penis
	if(pc.hasCock())
	{
		//kiro pussfucking virginity check?
		output("\n\nYou stand from the bed; it rocks slightly from your weight shifting off it. Your [pc.cock] waggles in front of you, bobbing underneath its own weight in its almost-painfully erect posture. There’s only one unoccupied vagina in the room");
		if(pc.hasVagina()) output(" (aside from your own)");
		output("; you place one hand on Kiro’s jackhammering hips as you move behind her. You rub your [pc.cockHead] against the fat of her furry ass, streaking a line of your pre-cum towards her wet entrance.");
		output("\n\nKiro hums in approval when she feels your hands on her; she thrusts her hips backward, filling your hands with her body, inviting you to get a good, solid grope and to be a little more exploratory. You take the invitation, but not as much as you think she expected: you dip two fingers into the cleft of her butt to find her pussy and give them a playful, inquisitive thrust. She sighs and leans into your hand, but you withdraw – and replace it with something a little more... substantial.");
		output("\n\nShe remains still, yet impatient, as you guide yourself into her. You can hear Paige whine while Kiro momentarily abstains from fucking her brains out. <i>“");
		if(!kiro.vaginalVirgin) 
		{
			output("To this day, [pc.name], you’re the only one who’s known what it’s like to fuck Kiro Tamahime in the pussy,”</i> she growls lustfully, looking over her shoulder, her eyes falling onto yours. Her mouth curls into a trusting, yet lustful, smile. <i>“I want you to remind me why, stud.”</i>");
		}
		else
		{
			output("I guess you're going to get to be the only one who knows what it’s like to fuck Kiro Tamahime in the pussy,”</i> she growls lustfully, looking over her shoulder, her eyes falling onto yours. Her mouth curls into a trusting, yet lustful, smile. <i>“I want you to make an impression, " + pc.mf("stud","angel") + ".”</i>");
		}
		output("\n\nYour hands grip onto her ass tightly, manhandling the jiggly flesh and pressing them together to create more of a cleave for you to thrust into. You’re not as vigorous as Kiro was when she went into Paige (yet), and work your way into her slowly, feeling her split apart to welcome your [pc.cock].");
		if(pc.cocks[0].cLength() >= 16) output(" She’s tight, remarkably so, and yet, despite her ‘inexperience,’ she takes you about as easily as any other slut – you’ll have to look into buying some of that elasticizing oil yourself!");
		pc.cockChange();
		kiro.cuntChange(0,pc.cockVolume(0));
		takeKiroginity();

		output("\n\nWhen you thrust crotch-deep into her, you push Kiro forward, burying her thick cock back into Paige, who sighs in delight at being filled up once more. You remain there until Kiro pulls out, and you repeat her action yourself. It’s a slow-going rhythm at first, but when you get it going, the three of you are a well-lubed fucking machine: no cocks are left unattended cold and");
		if(pc.hasVagina()) output(" almost");
		output(" no vaginas are left empty and hungry.");

		pc.createStatusEffect("KIRO_FUCKING_PAIGE");
		pc.setStatusMinutes("KIRO_FUCKING_PAIGE",80);

		output("\n\nYou lean in closer to Kiro, wrapping your arms around to her front and fondling her boobs; you pinch and pull at her nipples in alternating patterns that sync with your thrusts, and occasionally, you open up your hand and just get a good, thick grope of Kui-Tan titty. Your every grope and feel at a different part of her body is rewarded with a gentle, sexy laugh and a coo, followed by a harder thrust into Paige and a harder back-end into you, taking you deeper into her.");
		output("\n\n<i>“Gods,”</i> Kiro gasps when your fingers rub the nub of her nipple once again. <i>“You two are the best, you know that?”</i>");
		output("\n\nPaige doesn’t respond; she’s shoved a fistful of your bedsheets into her mouth in order to keep from screaming. You answer by saying that ");
		if(pc.isAss()) output("yes, you <i>are</i> the best, and you always knew it. <i>“Smartass,”</i> Kiro laughs, slapping at your hand with her own.");
		else output("you and Paige aren’t exactly doing her a favor – you’re in a threesome together because all three of you are important to each other, and because all three of you are sexy as hell. <i>“That’s what I mean, though,”</i> Kiro answers, but doesn’t continue.");
		output(" Her breathing has become quick and shallow, and her grip on Paige’s body has become tight yet unsteady. You know what’s coming.");

		output("\n\n<i>“Kiss me");
		if(pc.isAss()) output(", Smartass");
		output(",”</i> she demands, her left hand grabbing onto your scalp to keep you in place. You do as she says and thrust your [pc.tongue] into her mouth, and allow hers into yours; your kissing is aimless and frantic, used as a tool to hurry forth your impending orgasms.");
		if(!paigeBlind()) output(" Out of the corner of your eye, you can see Paige look back at you two, and when she sees Kiro give your tongue a suck, she tenses and spasms on the spot – it pushes her over the edge.");
		output("\n\nIt works.");
	}
	// continue here if PC is pure female
	else
	{
		output("\n\nYou roll onto your hands and knees and crawl towards Paige, your eyes locked on that gorgeous meat pounding into her sopping box. Your [pc.tongue] snakes out to wet your [pc.lips] and no matter how altruistic your decision was, you can’t help but have niggling thoughts in the back of your head about what a mistake you’ve made. Still, you’ve made it; you’re not going to try and get Kiro to change her mind, but you <i>are</i> going to reward yourself for it.");
		output("\n\nCarefully, you drape your body over Paige’s, your [pc.legs] on her either side and your hands and shoulders next to hers. You layer yourself onto her back just slightly, feeling her fine, bristly fur rub and tickle at the [pc.skinFurScales] of your front side; your [pc.chest] rests against her shoulderblades, your [pc.nipples] carving lines across her back with every shove Kiro’s thrusts do into her.");
		output("\n\nPaige’s bushy tail is extended directly behind her, wrapping just slightly around Kiro’s belly and towards her ribs. You reach behind her and fix that: with a yank, which causes Paige to flinch in surprise, you lift her tail and bend it towards her back, where you trap it between your two bodies. With that done, you lower your [pc.hips] until her tail coarsely rubs against your [pc.vagina].");
		output("\n\n<i>“Imaginative girl,”</i> Kiro congratulates with a grin as she sees what you’re doing. The fur on Paige’s tail is soft enough to rub against your ladybits without being too overbearing, and the tail itself is stiff enough for you to fuck against. So you do: whenever Kiro thrusts home into Paige, she body shifts forward, dragging her tail against your vulva and your [pc.clits], making your eyes cross and your [pc.vagina] coat the underside of her tail with a little more juice.");
		output("\n\nYour [pc.chest] rubs against Paige’s strong back in time with Kiro’s thrusts into her. Your whole body feels electric: Paige’s tail thrashes between you occasionally, which does wondrous things to your [pc.clit]. You hardly have the strength to keep yourself upright the longer it goes on; you feel the strength leaving your arms and [pc.legs] and you begin to buckle, but the tactile sensation of having Paige’s tail rub against you the way it is, is too pleasurable for you to give up.");
		output("\n\nKiro, thank the Gods, comes to your aid when she sees how much effort you’re putting into just staying upright. <i>“C’mere, sexy,”</i> she growls, and you feel her hands wrap around your [pc.thighs]; with surprising strength considering your individual positions, she hefts you up suddenly, wrapping yourself around either side of her face and bringing your own closer to Paige’s lower back.");
		output("\n\nBefore you can even register what’s happening, you feel Kiro’s tongue inside you. Where before you were relatively content to just fuck Paige’s upturned tail, Kiro had other ideas, and now her wet, questing tongue pierces into your [pc.vagina], tasting at everything you have to give and playing at the ridges of your inner muscles, seeking your elusive G-spot. Her nose bumps against your [pc.asshole] with her every unforgotten thrust into Paige, making you shiver in delight.");
		output("\n\nBoth yourself and Paige are at the whims and mercy of Kiro and her masterful work on both your bodies. You glance down, your eyes drinking in the sight of Paige’s toned, flexing lower back and tight ass, as you see Kiro’s thick cock violate her pussy, the whole thing pounding down to the bone into the writhing Ausar beneath you both. If it weren’t for the oil, Paige would have been ruined for anybody else, and in some perverted part of your mind, you would have loved to see that.");
		output("\n\nIt’s all too much for the three of you. The collective breathing and rocking and fucking has gotten too intense for you three to control – Paige has resorted to shoving a fistful of your bedsheet into her mouth to keep from screaming in pleasure, and Kiro’s mouth is too full of your wet cunt, though her muffled grunts resonate through your body and into your ears well enough. You have to do the orgasmic shouting for them both: when that telltale bubbling starts between your legs and starts crackling through you like a lightning bolt, you start yelling to the room how you’re about to cum, and that you’re so close–");
		output("\n\nApparently, so were they.");
	}
	//[=Climax=]
	// end scene (scene: PKTSKR); go to (scene: PKTSKE)
	processTime(20);
	pc.lust(100);
	clearMenu();
	addButton(0,"Next",PKTSKE,args);
}

// (scene: PKTSKE)
// Sorry, Fen
public function PKTSKE(args:Array):void
{
	clearOutput();
	showPaigeAndKiro(true);
	author("B!");
	args.push("PKTSKE");
	output("All three of you are wet (in more ways than one); bruised; exhausted; and you’re sure you’re awfully musky; but none of you are done yet. That’s going to change in just a few more thrusts: your orgasm is building up and up, and you know that Paige and Kiro won’t last much longer either. In just a few more heavy thrusts, all three of you make it there.");

	output("\n\nKiro, the star of the show between you three and an artisan of her craft, isn’t able to handle the sensory intake and cums first. Her body stiffens tight, and if you focus, you can hear the gurgle of her nutsack as her copious cum jets up her shaft");
	//if {PKTSKGF, and Kiro is fucking the PC}
	if(pc.hasStatusEffect("KIRO_FUCKING_PC"))
	{
		output(" and into its new, warm home, straight into your [pc.vagOrAss]. You count each load by the times your hole tightens around her shaft with how her dick bloats with her seed; you get to five full-bodied, thick shots of Kui-Tan cream before you’re too horny to keep track. Kiro’s nuts bunch up against her body and against your [pc.legOrLegs] and the flare of her horse cock inside your body pinches at your already-taxed body in just the right ways, prodding at your sensitive bits with each fresh, new gush. Your [pc.belly] begins to swell and round out with her load, and yet she keeps going – even when you hear a wet splash from behind you when your body can’t take any more and her cum backwashes out from you");
	}
	if(pc.hasStatusEffect("KIRO_FUCKING_PAIGE")) 
	{
		output(" and into its new, warm home, straight into Paige’s cunt. You’re treated to a stage-side seat to the show that is Kiro’s dick inflating rhythmically, in time with the scrunching and bunching of her leathery sack against her legs, as she seeds her hole. Paige squeals in delight at the sensation, barely muffled by whatever she could possibly get into her mouth to stem the noise. With rapt, awed attention, you witness her belly, normally toned and defined with a visible six-pack even beneath her fur, round out with Kiro’s seed as her womb packs to bursting");
		//if {PKTSKC}
		if(InCollection("PKTSKC", args)) 
		{
			output(" – which it does. You were so lost in the sight of those two magnificent bodies copulating just inches from you that you couldn’t react in time to the sudden backwash of cum that washes from Paige’s body, and all over your face and hands");
			pc.applyCumSoaked();
		}
	}
	output(".");
	output("\n\nPaige isn’t too much further behind");
	//if {PKTSKGF, and Kiro is fucking the PC}
	if(pc.hasStatusEffect("KIRO_FUCKING_PC")) output(", and knowing, and hearing, that Kiro is cumming into your tight body just a few inches beneath her sets her over the edge. She loudly squeals into the room, her tight legs clamping around Kiro’s face, as her cunt clenches and milks at Kiro’s tongue, her ladycum squirting from her and straight into Kiro’s mouth. Her body shakes with concentrated effort, until a second, body-wracking orgasm shudders through her, robbing her arms of their strength, and she crashes into you on the bed. The motion not only does nothing to impede her rapid-fire orgasms, but it somehow gives her more, now that Kiro’s bending at the neck to suck at her cunt from a different angle");
	if(pc.hasStatusEffect("KIRO_FUCKING_PAIGE")) output(", emphasized by how her body squeezes and shivers, and her voice shrieks in pleasure, as Kiro unloads into her again and again. She does her best to stifle her own voice, to little avail: every time Kiro’s dick bloats and shoots another thick glob of seed inside her, she’s wracked with anywhere between one orgasm and three. Her lady-Ausar-jizz squirts from her hole, soaking up to her own belly and spraying back onto Kiro, lubing that amazing horse cock so it can slide ever deeper and give her ever more cum. No matter how much cum Paige takes into herself, it’s never enough, and she won’t be satisfied until every last drop of Kiro’s seed is emptied from her hefty nuts. So, they’ll probably be there for a while");
	output(".");

	output("\n\nAnd that just leaves you. Surrounded on one side by an orgasming Ausar and on another by an orgasming Kui-Tan with a massive cock, a borderline instinctive response is trigged in some part of your brain, and the orgasm that was building inside you finally unleashes everything it has. ");
	//if {PKTSKC}
	if(InCollection("PKTSKC", args)) 
	{
		output("Y");
		if(pc.hasCock())
		{
			output("our [pc.cock], unable to sit idly by as you watch, and veritably bathe in the seed of, another shaking cock as it unloads");
			if(pc.hasStatusEffect("KIRO_FUCKING_PAIGE")) output(" into a fertile pussy");
			output("--you blasting your own load eagerly into the air. Your hands do nothing to stimulate yourself further as your [pc.cum] coats Kiro’s legs, as high up as her knees, uselessly soaking into her fur and slickening the floor when it comes crashing back down");
		}
		if(pc.isHerm()) output(". And, at the same time, y");
		if(pc.hasVagina())
		{
			output("our [pc.vagina] clenches and milks the air, your [pc.girlCum] gushing from beneath you in powerful squirts, spraying and coating the floor beneath you as far back as your [pc.feet]. Y");
			if(pc.hasStatusEffect("KIRO_FUCKING_PAIGE")) output("ou can’t help but fantasize yourself in Paige’s position: to be in Kiro’s arms, with that magnificent cock pumping load after load after load into you and giving your neglected pussy the attention it so desperately craves. Using the fantasy as fuel, y");
			output("ou urge out more and more orgasms from yourself, until you’re cross-eyed and dazed.");
		}
	}
	//if {PKTSKGF, and Kiro is fucking the PC}
	if(InCollection("PKTSKGF", args) && pc.hasStatusEffect("KIRO_FUCKING_PC"))
	{
		if(!pc.hasVagina() && pc.hasCock()) output("\n\nYour body squeezes involuntarily as your orgasm rips through you, from your abused-yet-delighted [pc.asshole], up to your head, back to your [pc.cock], and back up to your head again, repeating again and again, and each time it hits your dick, you spray another load of [pc.cum] into your bedsheet. You feel muscles you didn’t realize you had tense around Kiro’s shaft, rippling around her, coaxing her for more and more; your [pc.belly] presses harshly against the bed, overfilled and heavy with her offering, and yet you couldn’t possibly imagine stopping for anything.");
		else if(pc.hasVagina()) output("\n\nYour body squeezes involuntarily as your orgasm rips through you, from your abused-yet-delighted [pc.vagina], up to your head, back to your [pc.clit], and back up to your head again, repeating again and again, and each time it hits your pussy, you spray another blast of [pc.girlCum] back onto Kiro’s shaft. You feel muscles you didn’t realize you had tense around Kiro’s shaft, rippling around her, coaxing her for more and more; your [pc.belly] presses harshly against the bed, overfilled and heavy with her offering, until your womb just couldn’t possibly take another drop, and it all backwashes onto Kiro. And yet, you need more....");
	}
	//if {PKTSKR}
	if(InCollection("PKTSKR", args))
	{
		if(pc.hasCock()) output("\n\nYour [pc.cock], wedged deep into Kiro’s cunt, inflates with your rushing [pc.cum], eager to show her why she allows you to fuck her the way you do. You press your [pc.hips] against her, shoving yourself as deep as you can in a single thrust, and your cum flows from you unabated; Kiro, through her orgasm, coos in delight every time she feels another wad of your spunk bubble inside her, and her pussy flexes and milks at you, thirsty for more and more. You’d thrust into her some more if you could, but she’s got you trapped as tight as could be inside her – not that that’s an issue. If she wants your cum as deep inside her as you can, you’ve got more to give....");
		else output("Locked as you are, with your face pressed into the small of Paige’s back and with your [pc.legs] wrapped around Kiro’s head, you have little agency in how you gush squirt after squirt of your [pc.girlCum] into her thirsty, demanding maw – in some ways, that makes your orgasm all the better. Your elbows quake in effort as you try and keep yourself aloft above Paige, and their strength gets sapped every time you feel Kiro’s lips suck at your vulva, or her tongue search a little deeper inside you, or her throat swallow your lady-spunk down her gullet. Your senses are overloaded with pleasure on all sides, and there’s nothing you can do about it but cum in Kiro’s mouth some more. And then, some more. And then....");
	}
	//[=Afterglow=]
	// end scene (scene: PKTSKE); go to (PKTSA)
	processTime(20);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",PKTSA,args);
}

// (scene: PKTSA)
public function PKTSA(args:Array):void
{
	clearOutput();
	showPaigeAndKiro(true);
	author("B!");
	output("You’ve lost track of the time, but you’re sure it’s been hours. Your bed is a mess; the room is permeated with a musk you’re not sure you’ll be able to air out for weeks; and your body is battered and sore. But you could not <i>possibly</i> be more satisfied than you are now.");
	output("\n\nThe sex was so wild, so imaginative, and so fulfilling, that of <i>course</i> all three of you weren’t satisfied with just one round, and after the first go, you had a second. You even toyed with the idea of a third, but by then, all three of you were getting so exhausted that it was difficult to keep your eyelids up, much less ");
	if(pc.hasCock()) output("yours and ");
	output("Kiro’s dick.");

	output("\n\nSo, you did what any good trio of lovers would do: you collapsed onto the bed, with ");
	if(InCollection("PKTSY", args)) output("you");
	else if(InCollection("PKTSP", args)) output("Paige");
	else output("Kiro");
	output(" in the middle, surrounded, cuddled, and spooned by lovers on both sides. There was plenty of fondling, caressing, kissing, and sweet-nothings until you fell asleep, but there was no real attempt at making it any more exciting than that.");
	output("\n\nYou were the last to wake between you three. The first thing you recognize when you wake up is the overbearing smell of sex, still thick as a perfume in the air – the second is Kiro, gazing into your eyes dreamily. When you wake, she gives you a warm, loving smile; you can’t help but smile back.");

	// continue here if it’s the first time
	if(flags["PAIGE_KIRO_THREESOMES"] == undefined)
	{
		output("\n\n<i>“And the star of the show is awake,”</i> she says playfully, leaning in towards you to boop your nose with hers. <i>“My Gods, [pc.name], but aren’t you just everything we could have asked for in a lover? That took so much out of me that, if I weren’t a Kui-Tan, I doubt I’d get hard again for a week.”</i>");
		output("\n\nPaige plays with Kiro’s hair, humming contentedly as Kiro speaks. <i>“But lemme guess,”</i> she says, ruffling at Kiro’s scalp, <i>“I bet you could go again right now, am I right?”</i>");
		output("\n\n<i>“Well, I certainly</i> could. <i>It’ll be a breezy day in hell when Kiro Tamahime isn’t in the mood to bust a good nut.”</i> All three of you share a quick laugh together. <i>“But I’m good for now.”</i>");
		output("\n\nShe takes a deep sigh and cuddles into Paige, rubbing her cheek lovingly against Paige’s own. <i>“Good Gods above, I can’t believe... everything that’s happened to get us all here today,”</i> she says wistfully. Her other hand reaches towards you, pulling you closer to her and including you in the cuddle session. <i>“If I hadn’t had that malfunction on my ship, and if you, [pc.name], hadn’t answered the call, and if you hadn’t also taken Paige’s yoga classes, none of this could have happened.”</i> She gives you a surprisingly chaste kiss on your [pc.lipsChaste], and then another on Paige’s. <i>“Given all the shit Paige and I have done, life isn’t even a little bit fair. And I’m absolutely fine with that.”</i>");
		output("\n\nPaige answers with another contented hum, squeezing at both you and Kiro once more. <i>“Don’t go getting emotional on us, Kiro,”</i> Paige says, before kissing her back. <i>“Or do. We’re both very lucky that we met [pc.name].”</i>");
		output("\n\n<i>“Very lucky,”</i> Kiro repeats, as she hugs you and Paige closer to her. You say nothing – most of what had happened to bring you three together was pure happenstance, and they know that, but you don’t try to downplay what the ladies are feeling. They’ve been apart for years, and now that you’ve reunited them, they can start their lives again... with a bang, as it were.");
		output("\n\nThe three of you don’t get up from the bed for what feels like the better part of another hour. The only ambience in your quarters is the soft breathing and gentle heartbeats from your two lovers.");
		output("\n\n<i>“Hey, Paige,”</i> Kiro says, breaking the silence at last. <i>“Have you ever told [pc.name] your last name?”</i>");
		output("\n\nPaige’s breathing stops in surprise as she considers the question. <i>“No. And I was kind of hoping [pc.heShe] wouldn’t ask.”</i>");
		output("\n\nDespite the words, all three of you are smiling, wide as can be. It’s clear that it’ll take a lot more than some teasing to break your afterglow. That said, though, now that it’s been brought up, you can’t <i>not</i> know what her last name is.");
		output("\n\n<i>“It’s Turner,”</i> Paige answers.");
		output("\n\nYou giggle. Her full name is <i>Paige Turner?</i> <i>“My parents had a real sense of humor,”</i> she answers with a shrug. <i>“I always thought it was kind of embarrassing. But whatever. You’ve not only seen me naked; you’ve seen me fucked so hard that I turned into a puddle. What’s a last name compared to that?”</i>");
		output("\n\nTaking that as her cue, Kiro reluctantly pulls herself away from your cuddle pile. <i>“Believe me when I say that if I could spend the week with you two, I would,”</i> she says as she straightens her fur and pats at her dick, wiping the dried juices from her equipment, <i>“but I have my own schedule to keep.”</i>");
		output("\n\n<i>“We’re doing this again, right?”</i> Paige asks, her hand reaching to Kiro and giving her a hearty slap on her ass, watching the fat jiggle with the force.");
		output("\n\n<i>“I guess that depends on when our schedules line up again,”</i> Kiro answers. <i>“If you want another ride of your life, [pc.name], you come find me, and we’ll get something going.”</i>");
		output("\n\nDespite her insistence that she needs to leave, it takes all three of you twice as long as necessary to get yourselves dressed and presentable. When it’s all said and done");
		if(paigeBlind()) output(", and you’ve gotten Paige safely back into her unit");
		output(", you find yourself back in your quarters, alone, but satisfied.");
	}
	// continue here if it’s not the first time
	else
	{
		output("\n\n<i>“Well, it’s about time you woke yourself up, [pc.name]!”</i> she announces to the room. <i>“You have any idea how long it’s been since we started?”</i>");
		output("\n\nYou answer that you don’t, and you ask her if she does. <i>“Nope!”</i> she answers, eliciting a laugh between all three of you. <i>“It’s been long enough, though, I know that for a damn fact.”</i>");
		output("\n\n<i>“You got somewhere you need to be, Kiro?”</i> Paige asks as she leans into the Kui-Tan, pressing her nose against hers.");
		output("\n\n<i>“Yeah, unfortunately, everyone has</i> somewhere <i>they need to be, and I’m no exception.”</i> With some reluctance, Kiro slowly peels herself from your cuddle pile, then searches the floor for her discarded clothing. <i>“Believe me when I say that, if we could just do that for, like, a weekend straight or something, I’d love nothing more. But, fuckin’ doesn’t pay for my ship’s upkeep.”</i>");
		output("\n\nPaige hums in thought at the statement. <i>“I mean, it probably</i> could,<i>”</i> she offers deviously. <i>“We could set up a couple cameras... maybe sell tickets?”</i>");
		output("\n\nKiro laughs well-meaningly, but says nothing more. It takes the three of you longer than is necessary to pull yourselves together and get presentable for the outside world, but you get it done.");
		output("\n\nBefore the two ladies leave your ship, Kiro stops at your hatch and pulls you in for a lingering, closed-mouth, sexy kiss. <i>“You know where to find me if you want to get together for another round or four, sexy,”</i> she says.");
		output("\n\nAnd then, just like that");
		if(paigeBlind()) output(", after you’ve ensured that Paige makes it safely back to her unit");
		output(", you’re alone in your quarters once more.");
	}
	processTime(180);
	pc.orgasm();
	kiro.orgasm();
	IncrementFlag("PAIGE_KIRO_THREESOMES");
	//Cleanup temporary statuses:
	pc.removeStatusEffect("PAIGE_KIRO_COCKPATH");
	pc.removeStatusEffect("KIRO_FUCKING_PC");
	pc.removeStatusEffect("KIRO_FUCKING_PAIGE");
	// end scene (scene: PKTSA)
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}