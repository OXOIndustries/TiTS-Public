//This is my submission for the Halloween writing contest for TiTS. It’s an expansion pack for my latest submission, Paige the Yoga Instructor. Keeping in the Halloween theme, this submission’s spooky themes are poltergeists; possession; and body-hijacking. Also a little bit of transformation, but that’s hardly a new thing for TiTS.

//This content will be available whether she’s blind or not. During the Halloween-content-accessible times, Paige can be found huddled in a distant corner of her living unit. Long story short, her yoga studio is haunted and when you two go investigate, she’s possessed by a poltergeist and turns into a dickgirl, because you’d be surprised how often I was asked to make her one. You’d think, for a game made largely by men, largely for other men, there’d be a little less emphasis on penises, haha.

//This expansion pack is non-canon to Paige’s content. I have no intentions of making her a dickgirl as part of her main, story-related content, and it would go against her character if she wanted to be one too. But, if I throw around the words ‘non’ and ‘canon,’ then fuck it, I can make her do whatever.

//Since I’m a boss, I managed to pump out an entire flowchart-based sex tree for Paige and her newfound appendage within the time limit. I know they’re a bit of a meme within the community, but hell, it’s quantity.


// Continue here if: the PC enters Paige’s Unit; the system clock is between October 22nd and November 1st; the time is between 17:00 and 08:59; and the PC has had sex with Paige at least once.
// (scene: Paige’s Halloween Intro)


//flags["PAIGE_GHOSTED"]			# of times ghost scene done
//flags["HALLOWEEN_REJECTED_1"]		Timestamp of when event was passed up the first time.

public function paigeHalloweenerIntro():void
{
	clearOutput();
	showPaige();
	author("B");
	output("You enter Paige’s unit, looking for your favorite Ausar yoga instructor for some company. She’s always a good way to end a night, even if it doesn’t end sexily.");

	output("\n\nAlthough Iddi is quick to show you in and holler for his owner, Paige isn’t with you as quickly as she normally is. <i>“Over here,”</i> she yells back, from the opposite end of her unit. She’s huddled into a ball, one ear tightly pressed against the wall. She’s got a tense look of concentration on her face: one eye closed, her nose scrunched as her breath is held. Her ears are straight up and attentive, flicking at any sound she hears.");

	output("\n\nYou ask her what she’s doing down there. She whispers tersely, speaking in hushed, quick words. <i>“Around this time, every three-hundred-fifty or sixty solar cycles,”</i> she begins, then stops, listening for something in the walls, <i>“I always hear some kind of rummaging in my yoga studio. I’m keeping an ear open for it right now.”</i>");

	output("\n\nYou ask the most obvious question first: thieves? <i>“You’d think, but no,”</i> she answers, prepared for the question. <i>“The next morning, the studio is a mess, but nothing is ever missing. I set up cameras once, but someone disconnects them before they do whatever it is they do. The one and only time I sent Iddi in, I found him deactivated the next morning. ");
	if(paigeBlind()) output("If I weren’t blind, I’d go in there and fuck up whoever’s messing with my stuff myself, but... I’ve been a little wary of confrontation ever since my last one didn’t end well for me");
	else output("This is the first time it’s happened since I’ve gotten my eyesight back, and I’ve just been</i> itching <i>for whoever is doing it to show up again");
	output(".”</i>");

	output("\n\nPaige is clearly taking whatever this is seriously, so you decide to humour her and take a spot next to her, one ear pressed against the wall, listening for any noise. You two sit in silence for a while, the minutes ticking by slowly, your combined breathing as the only ambience–");

	output("\n\nThen, you hear it.");

	output("\n\nShuffling, at first, like someone was dragging their feet across the floor. Then, you hear a loud crash, as though a dresser or cabinet had been knocked over. Followed by a whistling noise, or maybe a rushing wind.");

	output("\n\nPaige’s fur stands on end, her tail straight, as the sounds start playing. She leans closer against the wall, listening for the one thing you both want to hear: a voice. But there aren’t any. Not so much as a grunt of exertion, or a gasp for air.");

	output("\n\n<i>“Right on cue,”</i> she whispers to herself, her ear flinching at every little noise you both hear. She bites her lower lip in excitement and indecision. <i>“");
	if(paigeBlind()) output("The difference between every other time and now, [pc.name],”</i> she says, <i>“is that you’re here.");
	else output("I can’t wait to get over there and finally see for myself who has the</i> balls <i>to break into</i> my <i>studio!");
	output("”</i> She grabs you by the wrist, barely able to contain herself. <i>“You and I together could fuck up any burglar. Let’s get over there!”</i>");

	processTime(7);
	clearMenu();
	//[=Okay!=][=Uhh...=]
	// end scene (scene: Paige’s Halloween Intro)
	addButton(0,"Okay!",okayHalloweenBoners);
	addButton(1,"Uhh...",rejectTheHalloweeners);
}

//[=Uhh...=]
// (scene: Reject)
public function rejectTheHalloweeners():void
{
	clearOutput();
	showPaige();
	author("B");
	output("You flinch indecisively. When you came to Paige’s unit, you weren’t expecting to deal with burglars. You just wanted to spend some time with her. Going over there sounds like it could be dangerous.");
	output("\n\n<i>“That’s what makes it exciting, though!”</i> she laughs, and then straightens herself. <i>“I suppose this</i> is <i>kind of an abrupt development in our relationship. I won’t make you go over there if you don’t want, and I’m not going to go without you backing me up. It’s not like they ever steal anything, anyway.”</i>");
	output("\n\nShe pulls herself to her feet and makes her way to the loveseat deeper into her unit, where she normally likes to sit. <i>“Let me know if you ever change your mind and want to go punch some burglars, alright sweet thing?”</i>");
	output("\n\nAs you take your seat next to her, you promise her that you will, if you ever change your mind.");

	if(flags["HALLOWEEN_REJECTED_1"] == undefined) flags["HALLOWEEN_REJECTED_1"] = GetGameTimestamp();
	// Display Paige’s usual conversation options
	// end scene (scene: Reject)
	paigeMenu();
}

//Vanish after 1 week or Halloween over.


// Continue from here if the PC has rejected Paige’s invitation to investigate the studio, and has entered the unit once again
// (scene: Paige’s Halloween Intro Redux)
public function paigeHalloweenIntroRedux():void
{
	clearOutput();
	showPaige();
	author("B");
	output("When you enter Paige’s unit again, she’s at her now-familiar corner, her body pulled into a tight ball and her ear against the wall. She waves you over when Iddi invites you in, motioning for you to sit next to her.");
	output("\n\n<i>“I’m still on the lookout,”</i> she tells you matter-of-factly. <i>“Once the noises start, they go for about seven solar days, and I’m going to be keeping an ear out for them every single night until then.”</i>");
	output("\n\nJust as she says that, the eerie noises begin to sound through the thick walls of her unit. Like before, they started with a rough shuffling, followed by a crash, and followed by a cacophony of other noises, particularly whistles, but no voices. You both listen to the noises for a moment, listening for anything that could pin the intrusion to a person, but you hear nothing of the sort.");
	output("\n\n<i>“What’dya say?”</i> Paige asks you, her eyes gleaming with excitement. <i>“You feel up to beating up some bad guys tonight?");
	if(!paigeBlind()) output(" I’d love to see the look on their faces when we bust them!");
	output("”</i>");

	//[=Okay!=][=Uhh...=]
	// end scene (scene: Paige’s Halloween Intro Redux)
	processTime(3);
	clearMenu();
	addButton(0,"Okay!",okayHalloweenBoners);
	addButton(1,"Uhh...",rejectTheHalloweeners);
}

//[=Okay!=]
// (scene: Paige’s Halloween 1)
public function okayHalloweenBoners():void
{
	clearOutput();
	showPaige();
	author("B");
	output("Hell yes you want to go over there! ");
	//if {PC’s personality is Hard}
	if(pc.isAss()) output("Nobody’s going to fuck with your Ausar’s studio as long as you’re here!");
	else output("You can tell Paige really wants you to say yes – what sort of lover would you be if you turned her down when she needed help?");

	output("\n\n<i>“My hero, that’s the spirit!”</i> she cheers, hoisting herself to her feet. <i>“");
	if(paigeBlind()) output("If things get hairy, you’ll have to take the front line, but I’ll do my best to back you up. I may be blind, but I’m still no slouch!”</i>");
	else output("Gods, I’d love nothing more than to crack a skull or two now that I have my eyesight back. Don’t try to hold me back, [pc.name]!”</i>");

	output("\n\nYou leave Paige’s unit and make the few steps towards her yoga studio. The noises are a little less prevalent from the hallway, but if you strain, you can still hear them. The door has no sign of tampering: it’s still locked when you arrive, and there is no evidence of a break-in. The door has a large, opaque glass window on it, obfuscating the details of the studio – but you can at least tell that the lights are not on. The knob is also cold, telling you that nobody’s gripped it lately.");
	output("\n\nIt’s difficult to tell if Paige is paying any attention to all this information, as giddy as she is to get in there and punch someone. Still, you know that <i>some</i> of the information is getting through to her: when she realizes how un-tampered the door is, she hesitates, trying to process how exactly the culprit could have gotten in.");
	output("\n\n<i>“Let’s do this,”</i> she says, reaching for the door, her key in hand. With a quick twist, the door swings open, and the light of the hallway washes into the studio, illuminating...");
	output("\n\nNothing. The noise stopped the moment you opened the door. You flick the lights on, and you");
	if(!paigeBlind()) output(" and Paige");
	output(" can see the entirety of the studio... but there’s nobody there. The place is a mess, of course: mats have been tossed about the room and discarded haphazardly all over the floor; racks for coats and sweaters have been tipped over, their hooks strewn about; various knicks and knacks litter the place, everything out of place and disheveled. Yet, true to Paige’s story, at a first glance, it doesn’t appear that anything crucial is missing.");
	output("\n\n<i>“Lock the door,”</i> Paige tells you, and you do. The room is deathly quiet; you and Paige are both silent as you investigate, your ears peeled for anything that could imply that someone was with you. Breathing; footsteps; anything.");
	output("\n\nYou both pace around the room, quietly searching in places where a person could be hiding, but, it being an open yoga studio, there aren’t many. The studio has a utility closet to hold mops and brooms, but once that was cleared, you and Paige both are left with nothing to go by – and it’s visibly upsetting Paige.");
	output("\n\n<i>“This sucks!”</i> she curses, flapping her arms uselessly against her sides. <i>“I got all hyped up to finally catch the fucker that’s been wrecking my studio, and there’s nobody here!”</i> ");
	if(paigeBlind()) output("She rests her face in her hands, grunting loudly into her palms.");
	else output("She kicks at one of the mats in frustration, flipping it over, while she curses some more.");
	output(" <i>“Is there, like, some kind of hatch or something I don’t know about? Is there some kind of fancy new warp technology that’s established a wormhole in my yoga studio and</i> only <i>my studio?”</i>");

	output("\n\n<i>“Maybe it’s haunted,”</i> you joke.");

	processTime(20);
	clearMenu();
	addButton(0,"Next",PaigesHalloween2);
}

// (scene: Paige’s Halloween 2)
public function PaigesHalloween2():void
{
	clearOutput();
	showPaige();
	author("B");
	output("The lights flicker, then short-circuit with a loud ‘CLANG!’ The light of the room begins to strobe irregularly, subjecting you to the darkness more often than not.");
	output("\n\nSuddenly, the noises return, and in much greater frequency and high decibels. The scraping comes back in full force, and the whistling has become something just short of a wail, making it difficult to hear anything else. A rhythmic thumping reverberates throughout the studio, slowly growing louder over time.");
	output("\n\nThe yoga mat you happened to be standing on is yanked from underneath you, knocking you off your feet and sending you tumbling; before you lose your balance, something hits you on the back of the head, rattling what little vision you have in the darkness.");
	output("\n\nAs soon as Paige hears something nearby, she takes a wild swing with a clenched fist, punching hard into the air. Some smaller debris from the mess begin to rise and circle around her, trapping her in a cyclone of common items – some large, some small, some dull, and some sharp. ");
	if(paigeBlind()) output("Paige calls for your name, her arms up and against her body protectively, listening for <i>anything</i> that makes sense around her, but, blind as she is, the noises all confuse and shut out the one sense she does have.");
	else output("Paige keeps her arms tight against her chest protectively, but she keeps still, afraid to approach any part of the tornado around her. She was looking to punch a burglar – what is she up against now?");

	output("\n\nYou scramble to your [pc.feet] and rush to Paige, forgetting about your own safety for now; all you want is to get to her and then leave the studio if you can. But when you reach your hand out, you feel a tight, painful snap around it: something hard and round has latched around your wrist, and it yanks you backward, throwing you against the far wall and latching to the surface. It’s too small to wriggle your hand through – you pull and you pull, but try as you might, you can’t wrest yourself free from the thing pinning your arm down.");

	output("\n\nDust kicks up in the windy circle around Paige, adding to the chaos around her. For her part, she does not panic: she focuses intently on her surroundings, flexing her ears");
	if(!paigeBlind()) output(" and keeping her eyes peeled");
	output(", but between the high-pitched wailing; the scraping");
	if(!paigeBlind()) output("; the cyclone around her; the constant flashing of the lights");
	output("; and everything else going on, she couldn’t focus on any single thing.");

	output("\n\nThe lights go out, submerging you both in the darkness, and you can’t even watch. The whistling gets higher in pitch, only for a moment, and you hear what you think is Paige gasping, or calling out for help, until... it all goes silent. The bits surrounding Paige in her twister fall to the floor, shuffling and clanking all against each other in the darkness, and you’re left with no sound whatsoever.");
	output("\n\nYou call Paige’s name a few times, and she never responds. The thing holding your wrist in place is steadfast, no matter how hard you try. Then, you hear footsteps....");

	processTime(10);
	clearMenu();
	addButton(0,"Next",paigesHalloween3);
}

public function paigesHalloween3():void
{
	clearOutput();
	showPaige();
	author("B");
	output("You fall to the floor, the clasp keeping you against the wall bouncing off the floor with metallic tumbles. You fall to your knees and rub at your wrist to ease the pain there, your eyes ahead of you for anything, but you can’t see in the total darkness. You say Paige’s name once more, and once more, she doesn’t respond.");

	output("\n\nThe lights come on suddenly, brighter than before. They blind you, and you flinch your eyes closed, squinting through splayed fingers to try and see what happened to your Ausar. You see the silhouette of a figure in the room with you, and then footsteps once again. Paige doesn’t respond to anything.");

	output("\n\nWhen your eyes adjust, you get a better image of the person in the room with you. It’s definitely Paige, you’d recognize her Ausar form and fur coloration anywhere – but she’s different. She’s facing away from you, and her hands run over her body inquisitively, unfamiliar with herself. Her tail, once adorned with fine, streamlined fur, is now bushy and fluffy, its fur standing on end and thick as her waist. Her previously-pointy, triangular ears are now slightly rounded, taking a more circular shape. Her hair is suddenly much longer: before, it only went to her shoulders, and now, it reaches halfway down her back.");
	output("\n\n<i>“Paige?”</i> you ask her, hoping she’ll respond. You have no idea what happened to her when the lights went out; you hope it really <i>is</i> Paige in the room with you.");
	output("\n\nThe figure turns about slowly, staring at her fingers and flexing them repeatedly. Her muzzle has become noticeably squashed and rounded, looking less like an Ausar");
	//if {Kui-Tan is unlocked in the codex}
	if(!CodexManager.entryUnlocked("Kui-Tan")) output(" and more like a Kui-Tan");
	else output(", and more like... something else");
	output(". Her hands explore her torso, especially around her tummy, her fingers playing with the ridges of her abs there. And, most prominent of the figure in front of you, the loose sweatpants are tented with what could be nothing else but a <i>massive,</i> barely-restrained erection.");

	output("\n\n<i>“‘Paige?’”</i> the figure responds. It’s definitely Paige’s voice, and it looks <i>like</i> Paige’s body, but there are just too many differences to say that it’s truly Paige you’re speaking with. <i>“Is that her name?”</i> she asks-as-a-statement and not as a question.");
	output("\n\n");
	if(paigeBlind()) output("The figure hums in frustration as she studies her fingers, then her body and room around her. Her fingers lightly scratch at her eyes, then around her face, feeling for any obstructions or clothing. <i>“She’s blind,”</i> she says. <i>“Poor girl. I don’t know if I can fix that.”</i> She squeezes her eyes shut, scrunching her face tightly – and when she opens them again, her eyes glow an eerie, iridescent green, ghostly flames licking out from the sockets of her eyes. <i>“This will have to do for now.”</i>");
	else output("As you study the figure’s form, you get a look at her face, past the muzzle and into her eyes. Paige’s deep, striking blue eyes are gone – and are replaced instead by vivid green ones. They shimmer every time she blinks or focuses her vision on something in the room.");

	output("\n\nThe figure nods appreciatively every time it finds a new facet of her own body to explore. She grips at nothing, enjoying the strength in her fingers; she hefts her breasts, admiring their pertness and tightness; she runs her fingers over her abs, cooing at the strength and flexibility within her belly; she unabashedly dips her hand underneath the waistband of her sweatpants, giving the raging hard-on a tug before dipping her hand a little lower and laughing delightedly at what she finds back there.");

	output("\n\n<i>“Not used to Ausar equipment, but gods</i> damn, <i>what a body!”</i> she cheers excitedly, groping at herself at irregular intervals, unable to keep herself <i>from</i> herself. <i>“Thirty-some-odd years without a body, and I fucking nail the</i> jackpot!”</i>");
	output("\n\nFrankly, you’re not sure what to think or do. Whoever is standing right in front of you resembles Paige, quite a bit, but she’s <i>not</i> Paige. You don’t move, trying to process what’s happened in this room, and what’s happened to Paige, if that’s truly her.");
	output("\n\nThe woman stops admiring herself for a moment to explore her surroundings. She notes the mess of yoga mats and general debris around her, clicking her tongue at the sight. Then, her glowing green eyes fall onto yours.");
	processTime(20);
	pc.changeLust(5);
	clearMenu();
	addButton(0,"Next",paigesHalloween4);
}

public function paigesHalloween4():void
{
	clearOutput();
	showPaige();
	author("B");
	output("<i>“Oh my,”</i> the figure says sultrily as she eyes your kneeling form, taking in your every detail from her angle. She licks her lips, her eyes narrowing at you; the bulge in her pants jerks upward, a damp spot seeping through the fabric of her sweatpants. <i>“Do you know this body?”</i>");
	output("\n\nYou don’t answer, too confused to form a sentence at the moment – and the question itself is a little more macabre than you were prepared for. The woman approaches you, swaying her powerful hips and wagging her ass, and the pole between her legs, before you, using her every asset to entice you. <i>“It’s okay, hun,”</i> she says reassuringly, which, it being Paige’s voice, you actually find unnerving. <i>“You’re acting like this is the first time you’ve ever seen someone get possessed before.”</i>");

	output("\n\n<i>“Possessed?!”</i> you shout in surprise, falling backward, onto your [pc.ass], your back against the wall.");
	output("\n\n<i>“I guess that answers that,”</i> she laughs, grabbing you by the shoulders and hefting you onto your feet. She hums in delight once more, admiring how easy the motion felt; her eyes trail along her own biceps, seeing how defined and pronounced they are.");

	output("\n\n<i>“My goodness, my heart is just going pitter-pat at the sight of you,”</i> she says, lightly gripping your chin and appraising you. She leans forward, burying her nose against your neck and inhaling deeply, ingraining your scent into her button-nosed-nostrils. You feel the log pressed damply against your [pc.belly] flinch and tighten as she does so. <i>“‘Paige’ must really have a thing for you, cutie. I can...”</i> she stutters, her tongue snaking out to lick a huge swath against your neck, <i>“I can barely contain myself.”</i>");

	output("\n\nHer long, fluffy tail sways gently behind her, her eyes still locked to yours fiercely. Both her hands are pressed tightly to your shoulders, and every time you try to move, she flexes her arms and keeps you pinned down. <i>“I was never this strong in my old body,”</i> she admires. <i>“I’m going to enjoy the absolute</i> hell <i>out of this.”</i>");
	output("\n\nShe leans in once more, her hips pressed against you as she frots her cock against your [pc.belly], her lips against your neck once again.");
	if(pc.hasCock()) output(" Her straining, bulging erection crosses against your own [pc.cock], and the bodily reaction is immediate.");
	else if(pc.hasVagina()) output(" Her frotting against your body begins to kindle something in your [pc.vagina], soliciting the response she’s surely looking for.");
	output(" You had never entertained the idea of Paige growing a dick and using it on you, but, with how forward she – or, rather, this person in her body – is being, you’re starting to now.");

	output("\n\nYour hands reflexively reach to her ribs, stroking sensually down her body and pulling her gently to you. You’re on autopilot as she humps against you and kisses your neck; you lean forward, breathing her own scent in, distinctly Paige, as you thrust your own [pc.hips] against her, meeting her impish body hump-for-hump–");

	output("\n\nShe nibbles at your neck, and the sensation jolts you upright. With a shiver, you push against her forcefully, surprising her and stopping her. You stare into her gleaming green eyes for a moment, trying to catch your breath, a million-and-one questions in your head right now.");

	output("\n\n<i>“I’d be a bit surprised too,”</i> she laughs well-meaningly. <i>“I’m sure you have a million-and-one questions to ask me. Fire away, cutie.”</i> She leans back in, one hand tickling down your thigh and the other crawling up your back, keeping you close to her as she resumes kissing and rocking against you. <i>“Make it quick, though. I got thirty years of ‘backlog’ to get through and I’m not wasting tonight on answering questions.”</i>");

	processTime(10);
	pc.changeLust(10);
	clearMenu();
	//[=Possessed?=][=Old Life=][=Paige=][=No Thanks!=]
	// end scene (scene: Paige’s Halloween 4)
	addButton(0,"Possessed",paigeHalloweenPossessionTalk,undefined,"Possessed","This person in Paige’s body mentioned that they ‘possessed’ Paige. What do they mean?");
	addButton(1,"Old Life",ghostlyOldLifeTalk,undefined,"Old Life","Ask the apparition who and what it was before they had passed away, and ask how they died.");
	addButton(2,"Paige",whereIsPaige,undefined,"Paige","Ask the ghost about Paige. She’s... still in there, right? How many priests are you going to need after tonight?");
	if(silly) addButton(4,"No Thanks!",tooSpoopyFourMe,undefined,"No Thanks!","This whole thing is 2spooky4u. Time to make like a tree and get out of here!");
	else addButton(4,"No Thanks!",tooSpoopyFourMe,undefined,"No Thanks!","Ghosts? Possession? Whatever’s happening here, you want no part of it!");
}

public function paigeTalkTic():void
{
	if(!pc.hasStatusEffect("ghosttic")) 
	{
		pc.createStatusEffect("ghosttic");
		pc.setStatusMinutes("ghosttic",100);
	}
	pc.addStatusValue("ghosttic",1,1);
}

//[=Possessed?=]
// Tooltip: This person in Paige’s body mentioned that they ‘possessed’ Paige. What do they mean?
// Remove this button from the list once it’s selected.
// (scene: Possessed)
public function paigeHalloweenPossessionTalk():void
{
	clearOutput();
	showPaige();
	author("B");
	output("You’re still a little dumbstruck by the whole thing, so you’re not exactly thinking as clearly as you’d like – but you could swear that this person just said that they had ‘possessed’ Paige. <i>“What’s to be confused about?”</i> she asks between languid kisses against you. <i>“I’m a spooky ghost, and I possessed... what is she, your girlfriend? Your wife? Whatever, doesn’t matter. I’m in the driver’s seat for now.”</i>");
	output("\n\nShe’s a... ghost? <i>“Gods,”</i> she sighs exasperatingly, <i>“you’re cute as hell. Please don’t tell me you’re dumb.”</i> You hurry the conversation along, then: was she the one making all the racket in the studio earlier? <i>“Not unless it was some other poltergeist, yeah. ‘s me, every year, on the dot. I materialize – I guess? I guess that’s what you’d call it? Yeah, anyway, I materialize, horny as all hell, and I make a big ol’ ruckus to try and get someone to poke their nose in so I can take over. Funny thing, though, a shitload of noise with nobody to blame tends to push people away, not bring them in.”</i> She pulls away from you to admire her bulging muscles and defined abs once more. <i>“Patience really</i> is <i>a virtue! Thirty years, and I couldn’t have pictured a better body to take over!”</i>");
	output("\n\nWhy did she choose Paige? <i>“Couldn’t tell the difference between you and her, actually,”</i> she says, the hand at your back sliding downward to get a handful of your [pc.ass]. <i>“Let’s just say... you see things differently when you’re a spirit. You can’t see bodies or places or anything; what you see is... I can’t really describe it. They didn’t invent words for it. Best I could call it is your ‘life.’ I saw two healthy people walk into my unit, and I just picked one.”</i> She kisses your cheek sensually. <i>“Lucky for me, whichever one I picked, I’d have been a winner.”</i>");
	output("\n\nYou ask her why... why she has a dick. The Paige you knew didn’t have one, and, as far as you knew, was never interested in growing one. <i>“‘Growing one?’ Holy shit, what have I been missing out on?!”</i> she asks. <i>“She probably has a dick ‘cause I had one when I died. Don’t you know? The host body takes on the physical form of the spirit possessing it. Or something. I haven’t exactly possessed a lot of people in my time as a ghost, your guess is honestly as good as mine.”</i>");
	output("\n\nAre there other ghosts in the unit? In any part of Tavros? <i>“Dunno. I can see ‘life.’ I can’t see ‘dead.’”</i>");
	//if {This is the first topic chosen}
	if(pc.statusEffectv1("ghosttic") == 0) 
	{
		output("\n\nShe continues to kiss and massage different parts of your body with different parts of hers as she speaks. You feel her hardened nipples poke ");
		if(!pc.isChestExposed()) output("through your [pc.upperGarments] ");
		else output("you ");
		output("and her stiff, leaky dick continues to stimulate itself against your own pectorals. Her hands become more and more eager as she goes – if you want to keep her talking, you should pick another topic, quick.");
	}
	//if {This is the second topic chosen}
	else if(pc.statusEffectv1("ghosttic") == 1)
	{
		output("\n\nHer breath washes against your neck excitedly, and her tongue sneaks out to lick her dry lips frequently. Her long, fluffy tail has curved around you both, wrapping against your [pc.legs] to keep you against her. One hand plays at your ribs, rubbing its way to your [pc.nipple], while the other dips between you, tugging gently at her dick and eking out more pre to soak through her pants and coat her hand. She’s getting impatient.");
	}
	//if {This is the third topic chosen}
	else if(pc.statusEffectv1("ghosttic") == 2)
	{
		output("\n\nAs she finishes her explanation, her motions have escalated to full-body humping: her tongue goes from your collarbone to your ear, and her breasts draw thick lines from your upper belly to your own [pc.nipples]. Her hard cock pushes against you forcefully, digging against your body a little painfully as she seeks to penetrate <i>something.</i>");
		output("\n\n<i>“Fuck it, I’m done talking,”</i> she says lowly.");
	}
	paigeTalkTic();
	// end scene (scene: Possessed); if this is the third dialogue option chosen, include a [=Next=] button that goes to (scene: HSIFT)
	processTime(6);
	pc.changeLust(10);
	addDisabledButton(0,"Possessed","Possessed","You already had this conversation.");
	if(pc.statusEffectv1("ghosttic") > 2)
	{
		clearMenu();
		addButton(0,"Next",HSIFT);
	}
}

//[=Old Life=]
// Tooltip: Ask the apparition who and what it was before they had passed away, and ask how they died.
// Remove this button from the list once it’s selected.
// (scene: Old Life)
public function ghostlyOldLifeTalk():void
{
	clearOutput();
	showPaige();
	author("B");
	output("You ask to whom you have the pleasure of speaking to.");
	output("\n\nShe immediately stops everything and goes stock-still against you, processing the question. She stutters slightly, unable or unsure of how to answer you; her exasperation feels unfamiliar, coming from sure, confident Paige. <i>“Thing is,”</i> she says quietly, her earlier, horny attitude replaced with something much more somber – upset, even. <i>“Death... it... it removes your sense of self. The name you die with is for your body; your spirit doesn’t take that with you when you leave. I still have my memories: I could tell you everything about my past life when I kicked it thirty years ago, but my name isn’t one of them. I don’t remember it. When you asked for my name, my first impulse was to say my name is Paige.”</i>");
	output("\n\nYou ask, then, who she was in her previous life. <i>“I was a Kui-Tan. Lived in this unit for most of my life.”</i> Her fingers dip lower, scratching lightly at your waist and daring themselves to go further south. <i>“Whoever got it after me probably got it for a bargain. Cadavers tend to tank the resale value of real-estate.”</i> You ask her how old she was. <i>“I see it’s no longer rude to ask a lady her age,”</i> she answers mirthfully. <i>“Old enough to have seen it all; young enough for it to have been ‘before my time.’ Let’s leave it at that.”</i>");
	output("\n\nHer being a Kui-Tan explains Paige’s new appearance, for the most part, as well as the... addition currently fucking its way up your stomach. You ask her how she died. <i>“Overdosed on Throbb. Turns out, yeah, that’s a thing that can happen. I was just gearing up to give my girlfriend a good time, and, well, I made a mistake. Happened around this time of year, which is why this is when I ‘come back.’”</i>");
	output("\n\nShe grunts as she pulls away, looking between your bodies and grabbing her erection, still concealed in Paige’s sweatpants, by its base and flopping it back and forth, stroking it eagerly through the cloth. <i>“Do yourself a favor and pass away peacefully in your sleep. When you leave, your spirit maintains the state your body was in when you left it. Imagine rocking a chub like</i> this <i>for all eternity. You and I are going to have a hell of a night tonight.”</i>");
	
	//if {This is the first topic chosen}
	if(pc.statusEffectv1("ghosttic") == 0) 
	{
		output("\n\nShe continues to kiss and massage different parts of your body with different parts of hers as she speaks. You feel her hardened nipples poke ");
		if(!pc.isChestExposed()) output("through your [pc.upperGarments] ");
		else output("you ");
		output("and her stiff, leaky dick continues to stimulate itself against your own pectorals. Her hands become more and more eager as she goes – if you want to keep her talking, you should pick another topic, quick.");
	}
	//if {This is the second topic chosen}
	else if(pc.statusEffectv1("ghosttic") == 1)
	{
		output("\n\nHer breath washes against your neck excitedly, and her tongue sneaks out to lick her dry lips frequently. Her long, fluffy tail has curved around you both, wrapping against your [pc.legs] to keep you against her. One hand plays at your ribs, rubbing its way to your [pc.nipple], while the other dips between you, tugging gently at her dick and eking out more pre to soak through her pants and coat her hand. She’s getting impatient.");
	}
	//if {This is the third topic chosen}
	else if(pc.statusEffectv1("ghosttic") == 2)
	{
		output("\n\nAs she finishes her explanation, her motions have escalated to full-body humping: her tongue goes from your collarbone to your ear, and her breasts draw thick lines from your upper belly to your own [pc.nipples]. Her hard cock pushes against you forcefully, digging against your body a little painfully as she seeks to penetrate <i>something.</i>");
		output("\n\n<i>“Fuck it, I’m done talking,”</i> she says lowly.");
	}
	paigeTalkTic();
	// end scene (scene: Old Life); if this is the third dialogue option chosen, include a [=Next=] button that goes to (scene: HSIFT)
	processTime(10);
	pc.changeLust(10);
	addDisabledButton(1,"Old Life","Old Life","You already had this conversation.");
	if(pc.statusEffectv1("ghosttic") > 2)
	{
		clearMenu();
		addButton(0,"Next",HSIFT);
	}
}

//[=Paige=]
// Tooltip: Ask the ghost about Paige. She’s... still in there, right? How many priests are you going to need after tonight?
// Remove this option from the list once it’s selected.
// (scene: Where Is Paige)
public function whereIsPaige():void
{
	clearOutput();
	showPaige();
	author("B");
	output("Whoever this person is, it’s clearly not Paige, despite the resemblance. You ask them what’s happened to her.");
	output("\n\n<i>“Paige is the name of this sexy number, is it?”</i> she asks, pulling away from you to grope at herself some more. <i>“And you two are an item? I want you to tell her</i> every day <i>how fucking sexy she is. Godsdamn, a body like this deserves to be worshipped. I never had my abs this tight when I was still kicking.”</i> She squeezes at her boobs, pressing them together, deepening their cleavage in front of you. <i>“The titties aren’t the biggest, but shit, they’re so firm I feel like I could punch a man out with them.”</i>");
	output("\n\nYou’re aware of how tight Paige’s body is, but that’s not what you asked. Losing your patience a bit, you grit your teeth and ask again where she is. <i>“She’s fine,”</i> she answers, knocking on her own skull with her knuckles playfully. <i>“She’s taking a backseat for now. She’s just as confused as you are, but, and I know this is going to be difficult to believe, I just want to borrow her for a night. One night! Then I’ll be out of your hair... until next year, anyway. You think you two can put up with me for one night?”</i>");
	output("\n\nYou answer that that’s not really up to you. <i>“True. But if I’m going to take a mercenary attitude about it, it’s not really up to</i> her <i>either.”</i> You grimace, frustrated and powerless at who- or what-ever has hijacked Paige’s body. <i>“Look, it’s just one night. I have been holding onto these blue balls for the past thirty years, cutie, and Paige is clearly into you. Trust me, she’d rather the night be with you than some pay-by-the-hour dump. Might as well just humor me?”</i>");

	//if {This is the first topic chosen}
	if(pc.statusEffectv1("ghosttic") == 0) 
	{
		output("\n\nShe continues to kiss and massage different parts of your body with different parts of hers as she speaks. You feel her hardened nipples poke ");
		if(!pc.isChestExposed()) output("through your [pc.upperGarments] ");
		else output("you ");
		output("and her stiff, leaky dick continues to stimulate itself against your own pectorals. Her hands become more and more eager as she goes – if you want to keep her talking, you should pick another topic, quick.");
	}
	//if {This is the second topic chosen}
	else if(pc.statusEffectv1("ghosttic") == 1)
	{
		output("\n\nHer breath washes against your neck excitedly, and her tongue sneaks out to lick her dry lips frequently. Her long, fluffy tail has curved around you both, wrapping against your [pc.legs] to keep you against her. One hand plays at your ribs, rubbing its way to your [pc.nipple], while the other dips between you, tugging gently at her dick and eking out more pre to soak through her pants and coat her hand. She’s getting impatient.");
	}
	//if {This is the third topic chosen}
	else if(pc.statusEffectv1("ghosttic") == 2)
	{
		output("\n\nAs she finishes her explanation, her motions have escalated to full-body humping: her tongue goes from your collarbone to your ear, and her breasts draw thick lines from your upper belly to your own [pc.nipples]. Her hard cock pushes against you forcefully, digging against your body a little painfully as she seeks to penetrate <i>something.</i>");
		output("\n\n<i>“Fuck it, I’m done talking,”</i> she says lowly.");
	}
	paigeTalkTic();
	processTime(10);
	pc.changeLust(10);
	// end scene (scene: Where Is Paige); if this is the third dialogue option chosen, include a [=Next=] button that goes to (scene: HSIFT)
	addDisabledButton(2,"Paige","Paige","You already had this conversation.");
	if(pc.statusEffectv1("ghosttic") > 2)
	{
		clearMenu();
		addButton(0,"Next",HSIFT);
	}
}

// [=No Thanks!=]
// Tooltip (not silly mode): Ghosts? Possession? Whatever’s happening here, you want no part of it!
// Tooltip (silly mode): This whole thing is 2spooky4u. Time to make like a tree and get out of here!
// Remove this option from the list if all three other talking options are selected first.
// (scene: 2spoopy)
public function tooSpoopyFourMe():void
{
	clearOutput();
	showPaige();
	author("B");
	output("This is just too much information for you to take in. You had come into this studio to catch a burglar and maybe start a fight; you hadn’t counted on poltergeists, body-snatching, and whatever other paranormal bullshit is going on here. You need to get out!");
	output("\n\nYou push ‘Paige’ away from you as you frantically scramble for the far door. She grunts in surprise and falls backward, hitting the floor with a harsh thud. You have to get across the whole studio to get there, but you’re confident you can outrun Paige. You’re not sure what your plan is after that – Tavros is a large, diverse station. Maybe someone on it can perform an exorcism.");

	output("\n\nAs you step forward, you feel a strong grip on your [pc.foot], and you tumble downward, your fall broken by one of the yoga mats strewn about the floor. Before you can pull yourself back up, you’re flipped over by a pair of strong Ausar hands, and you’re on your back, staring up at Paige’s face – but not her eyes.");

	output("\n\n<i>“Calm down!”</i> she implores you, her hands pinning your shoulders to the mat. You squirm beneath her as she straddles you, the thick, beady dick in her pants beating against your stomach once more. <i>“Look, we’ll skip the bullshit, alright? I know how this seems. Just let me say something, just one thing, okay?”</i>");
	output("\n\nYou twist your neck head away from her, your neck bared, your frightened eyes on her. You’re tense, but you stop struggling, if only momentarily; most of your brain is terrified, but some small part of you is highly curious. <i>“Paige is fine,”</i> she says finally, nodding her head to affirm herself. <i>“She’s just coming along for the ride for now. I just want to borrow her body for one night. Just one! That’s all I want!”</i>");
	output("\n\nYou’re breathing heavily, your heartbeat going a mile a minute. It <i>looks</i> like Paige, it <i>sounds</i> like Paige, but it isn’t saying things Paige would say and it isn’t acting like Paige would act. You can’t shake the feeling that you’re staring at an imposter, a doppelgänger; someone or something <i>else</i> wearing Paige’s face.");
	output("\n\n<i>“Please?”</i> she begs, her hips jerking forward involuntarily, her concealed dick rubbing against your belly and the fabric containing it. <i>“I’ve... look, long story short, I’ve had this hard-on ever since I became a ghost. Some thirty-years, now. Wouldn’t</i> you <i>jump at the first opportunity to... have it taken care of? Just... help a girl out, would you?</i> Please?”</i>");

	processTime(10);
	pc.changeLust(10);
	clearMenu();
	//[=...Okay=][=Nope!=]
	addButton(0,"...Okay",HSIFT,true);
	addButton(1,"Nope!",noThankYouGhost);
}

// end scene (scene: 2spoopy); if [=...Okay=], go to (scene: HSIFT); if [=Nope!=], go to (scene: Ungood End)

//[=Nope!=]
// (scene: Ungood End)
public function noThankYouGhost():void
{
	clearOutput();
	showPaige();
	author("B");
	output("Without thinking about it, you clench your right hand into a fist, and you crack Paige across the face as hard as you can. Your swing is a little stunted by the fact she’s holding you by the shoulders, but the result is exactly what you were hoping for.");
	output("\n\nShe falls into a slump next to you, face down on the mat, out cold. When you blink, her body transforms instantaneously: the fur on her tail goes back to its straighter, smoothlined texture; her ears go back to their pointed, triangular forms; her muzzle elongates, back to its earlier length. You hazard a guess that her other addition has vanished as well.");
	output("\n\nHer breathing is steady, but she’s unresponsive to your words or prodding. At least you didn’t break her neck by accident or something. You pull yourself to your [pc.feet], rubbing your knuckles. Uh... now what?");
	output("\n\nYou squat down, grab her by the shoulders, and start dragging her out of the studio and towards her unit. You’re quick, hoping that the sound of dragging a comatose body along the hallways don’t attract any attention.");
	output("\n\nYou get her into her bed safe and sound, and then you leave in a hurry. Hopefully she doesn’t remember any of this when she comes to.");
	// end scene (scene: Ungood End); disable this event from proccing in the future. Since this is non-canon (and also because it’d be funny), never reference anything about this ending in her usual interactions.
	flags["PAIGE_GHOSTED"] = -1;
	processTime(8);
	ghostSexWrapper("nope");
}

// (scene: HSIFT)
// start here if the PC is NOT coming from (scene: 2spoopy)
// Action Tree: https://i.imgur.com/zhokZ9W.png
public function HSIFT(twospoop:Boolean = false):void
{
	clearOutput();
	showPaige(true);
	author("B");
	paigeGhostFutaGo();
	if(!twospoop)
	{
		output("With rough, strong hands, she grips onto your shoulders and yanks you from the wall, pivoting you both around as she falls backward. You hit one of the yoga mats strewn about the studio, thankfully breaking your fall, with this apparition pretending to be Paige on top of you, grinding her body against you.");
		output("\n\n<i>“You can still call me Paige, cutie,”</i> she says, her hips jackhammering against your body, her hot length sliding across your pectorals through her pants. <i>“It’ll be easier for all three of us.”</i> She leans forward, burying her nose in the cleft of your neck and taking another, exaggerated whiff of your scent. <i>“She’s watching, you know. She’s paying attention. She wants to know how you’ll react to having her thick,”</i> she says, punctuating her words with another hump against you. <i>“Hot,”</i> she continues, her tongue snaking out to taste you. <i>“Ausar cock pounding that cute ");
			if(pc.hasVagina()) output("cunt");
			else output("ass");
		output(" of yours.”</i>");
		output("\n\n");
	}
	// Continue here if it’s the first time, including if it’s from (scene: 2spoopy)
	if(flags["PAIGE_GHOSTED"] == undefined)
	{
		output("You’re not sure if you believe her – but, pinned to the floor by Paige’s sexy body, rutting against you like she’s never needed you before, the heat of her body and the thick scents rising from different parts of her – you have to admit that she spins a compelling story. Paige has always billed herself as sexually open and promiscuous. Surely... she wouldn’t mind?");
		output("\n\nCautious at first, your hands gently rest against her ribs as she rubs her body against you. You lay them motionless against her, but every time she moves backward, your hands go with her, until they rest firmly against the meat of her ass. <i>“That’s a good " + pc.mf("boy","girl") + ",”</i> she says, kissing you gingerly on the cheek. Your fingers hook beneath the elastic band of her sweatpants, snaking underneath to rake against her cheeks directly. <i>“What’s your name, cutie?”</i> You answer.");
		output("\n\nShe pulls away from you and stands up. <i>“Well, [pc.name] Steele,”</i> she says huskily, catching her breath. <i>“Tonight’s going to be an... interesting night for you and Paige.”</i> Licking her lips, she reaches for the hem of her shirt and yanks it off with a practiced pull, bearing her bra-clad breasts to the air, and in another swift motion, that’s gone as well.");
		output("\n\n‘Paige’ looks down at herself, tweaking the nipples that cap her full, firm breasts for herself. <i>“Shit, this woman has an incredible body,”</i> she says unabashedly, groping at herself, stretching and pulling at her own titflesh. <i>“It’d inspire me to go for a jog myself if I had a body to jog with.”</i>\n\n");
	}

	output("She looks down at you");
	if(!pc.isCrotchExposed() && !pc.isChestExposed() && !pc.isAssExposed()) output(", and motions for you to get naked as well. <i>“This ain’t a one-woman show, [pc.name]. Lemme see what I’m working with.”</i> You oblige, and in a flash, your body, all of you, is bared to the air of the studio");
	output(". She notes y");
	if(pc.hasCock()) output("our [pc.cock], thick-but-not-yet-hard, although that’s changing in a hurry");
	if(pc.hasCock() && pc.balls > 0) output(", and underneath, your [pc.balls], full of cum and ready to work");
	output(". She rotates her finger, motioning for you to flip over, and you do: you ");
	if(pc.tailCount > 0) output("lift your [pc.tails] to ");
	output("reveal your ass to her, ");
	if(pc.tone <= 49) output("thick and plump");
	else output("toned and tight");
	if(pc.hasVagina()) output(".\n\nYour new position gives her the perfect view of your [pc.cunt], currently drier than she would appreciate, but winking in anticipation: a bead of your feminine arousal drips from somewhere within you, lining along your labia and collecting at your [pc.clit] before falling to the mat");
	output(".");

	output("\n\nPaige grins, her hands on her hips and her dick straining against her pants all the more; a thick dollop of pre collects at her tip, soaking through the fabric and trailing itself down the trim of her pants and between her legs.");

	output("\n\n<i>“Release me,”</i> she commands you, nodding to her throbbing erection. You flip back onto your front, crawling towards her until your nose is pressed against the fabric. Paige’s body quivers in excitement, her hands shaking against her hips; if you don’t make a move, and quickly, she’ll probably do it for you.");

	processTime(10);
	pc.changeLust(10);
	clearMenu();
	//[=Suckle=][=Lower Pants=]
	addButton(0,"Suckle",HSS1);
	addButton(1,"Lower Pants",HSLP)
}

//[=Suckle=]
// (scene: HSS1)
public function HSS1():void
{
	clearOutput();
	showPaige(true);
	author("B");
	output("You grip onto the waistband of her pants, tugging at it a bit, teasing that you’ll pull them down and release the demon they contain. Instead, you lean forward and press your nose against the hard, damp spire, breathing deeply through your nose, taking in her thick musk the same way she did to you.");
	output("\n\nPaige hums in approval, and the neurological response you both get is immediate and intense. Your back goes slack and your neck cranes upward; your face sinks into Paige’s crotch, her cock drawing a thick line down your face as you go, submersing yourself in a scent that is undeniably, <i>powerfully</i> masculine, and yet is simultaneously, unmistakably Paige. And Paige, in turn, feeling in control of the situation in a way she’s never experienced before, grips your head lightly, her erection straining, the fibers of her pants audibly creaking as they stretch to contain her.");
	output("\n\nYou lose your composure and pull back, giving the tip of her spire another long draw against your nose, before you open your mouth and stick it in, bathing her thick meat through the thin material of her pants. The taste of her Ausar pre melts onto your tongue; it touches your tip, then spreads, like a virus, across your buds and along your cheeks. You crave more: you moan as you lean forward, swallowing more of her concealed cock, using your tongue to rub it against the roof of your mouth.");
	output("\n\nPaige woofs quietly to herself, closing her eyes, wallowing in the sensation of your horny, eager, unbridled submission to her power. She pumps her hips against you several times, driving herself, still protected by the fabric of her pants, deeper into you; each push is accentuated by another heavy dollop of precum, bathing your [pc.tongue] and keeping it moist despite the cotton.");
	output("\n\n<i>“Enough,”</i> she commands, and, reluctantly, you obey her, withdrawing her cock from the wet, warm pocket that is your mouth. <i>“Take me out before you continue. I don’t want to ruin these pants.”</i>");
	output("\n\nYou had forgotten your initial command in your reverie, your fingers still hooked around her waistband. With a swift, eager motion, you pull them down – perhaps <i>too</i> eagerly, as her dick gets caught in the band as it goes, and when her pants are around her ankles, it springs back up, whapping you in the chin with its girth. Paige laughs mirthfully, gripping it by the shaft and tracing its head along your [pc.lips], coating them with yet more of her gift.");
	output("\n\nFace-to-crotch with this new, intimidating, inspiring monster, your mouth begins to salivate, and your ");
	if(pc.hasVagina()) 
	{
		if(pc.totalVaginas() == 1) output("[pc.vagina] clenches and slickens");
		else output("[pc.vaginas] clench and slicken");
		output(" in desperate preparation for Paige");
	}
	else output("[pc.ass] tightens, nervous, yet ready for the challenge, of accepting Paige’s masculinity into itself");
	output(".");

	output("\n\nDespite your eagerness, you can only take her in one of your holes. How do you pleasure Paige?");
	processTime(10);
	pc.changeLust(10);
	//[=Oral=][=Vaginal=]
	// end scene (scene: HSS1)
	clearMenu();
	addButton(0,"Oral",HSO);
	if(pc.hasVagina()) addButton(1,"Vaginal",HSVA);
	else addButton(1,"Anal",HSVA);
}

//[=LowerPants=]
// (scene: HSLP)
public function HSLP():void
{
	clearOutput();
	showPaige(true);
	author("B");
	output("You’re excited to see what sort of package Paige is carrying, and you’re already fantasizing about the new, exciting ways you both can explore her new body. You don’t waste any time – she’s hornier than you are, but you’re well on your way to meeting her there. You wrap your fingers around the waistband of Paige’s pants, and yank them down.");
	output("\n\nYou underestimate the length of her newest addition, and it gets caught in the elastic as you pull down; when her pants get to her knees, it springs back upward, striking you in the chin, its precum splashing against your neck. When you recoil, you get a great look at the challenge before you: as thick around as a wrist and as long as your forearm, Paige’s Ausar cock bobs before your eyes; as invigorated as it is, it’s too heavy to support itself, and it sags down, its tip knocking against her kneecaps. At its base is a knot as thick as your fist, and beneath them are two grapefruit-sized testicles, snug beneath a thin layer of fine fur, churning with load after load for your willing body.");
	output("\n\n<i>“On all fours,”</i> Paige commands you, and you comply, but not before gingerly lifting the monolith to your [pc.lips] and giving it a long, languid kiss, sucking out some precum as an appetizer. You spin around, presenting yourself again to Paige, your ");
	if(pc.hasVagina()) output("glistening [pc.vaginaNoun] on full display, noticeably more lubricated than before and excited to get a taste of her.");
	else output("[pc.ass] on full display; you reach back with one hand and pull on one cheek, revealing your winking [pc.asshole] to her. It’s dwarfed compared to the cock you’re about to shove against it, but you’re more than willing to take the challenge.");

	output("\n\nShe sighs as she lands on her own knees, her hands rubbing and massaging at your thighs and the thick of your asscheeks; she gropes you shamelessly, stressing your muscles and meat for the main course coming up. When she stops her prodding, you finally feel it: the point of her dick, stalking around your [pc.vagOrAss], teasing you both. You feel a warm, wet splash of liquid against you, and then, with a push, she’s inside – but just the tip, for now.");

	processTime(10);
	pc.changeLust(10);
	clearMenu();
	//[=Buck Back=][=Lay Down=]
	addButton(0,"Buck Back",HSBB);
	addButton(1,"Lay Down",HSLD);
}

//[=Oral=]
// (scene: HSO)
public function HSO():void
{
	clearOutput();
	showPaige(true);
	author("B");
	output("Once the sweet ambrosia that is Paige’s precum hit your [pc.tongue], a hunger developed in not just your belly, but the whole of your being; you <i>need</i> to have her cum, and the only way you’ll be satisfied is if you feel the hot, smooth ichor slide across your maw and down your throat.");
	output("\n\nHer Ausar dick is the girth of a wrist, and it’s so long, its tip slaps against her kneecaps. Its base is bloated with a knot the size of your fist, and shadowed underneath that are two grapefruit-sized testicles, each snug underneath a layer of fine, brown fur. Her cock is too heavy to support its own weight, so you do it a favor and hoist it with your hands, leveling it, before bathing it with your tongue.");
	output("\n\nPaige’s hands run lovingly over your head");
	if(pc.hasHair()) output(" and through your [pc.hair]");
	output(" as you trail long lines of saliva across the thick, heavy meat of her cock. You kiss at its sides and at the muscles beneath it, sucking its smooth skin against your mouth for a moment and releasing it with a ‘pop!’ every time. You work your way to its base, then start running circles around her knot, breathing heavily through your nose as mat it against her pelvis.");
	output("\n\nYour work does not stop at her cock: shuffling forward on your knees, you begin kissing upward, planting a thick, heavy smack on every one of her eight, sculpted abdominals, once on the way up and then counting your way back down. When you reach her base again, you dip lower, lathering her solid, powerful thighs with your spit, getting her nice and moist all over her powerful, rippling muscles. And, of course, before you begin your long crawl back up her spire, you pay a visit to each testicle, lovingly shucking them into your mouth for a bath.");
	output("\n\nPaige hums in pleasure with your every little motion: from all the attention you’re sparing to her huge cock, to all the abject worshipping of her muscles, to all the attention you pay to all the little minutia of her body and genitals. When you kiss your way back to the arrow-like tip of her Ausar dong, she thrusts her hips forward, rubbing the thick of her shaft across your cheek, sharing the moistness you’ve given her.");
	output("\n\nPaige’s hips are quivering in excitement, and you’re pretty sure she isn’t going to get any harder. You gently grasp her by the knot, directing the point of her weapon directly between your eyes. If Paige were to cum, right here and now... where would you want it most?");
	processTime(10);
	pc.changeLust(10);
	clearMenu();
	//[=Your Mouth=][=Your Face=]
	addButton(0,"Your Mouth",HSYM);
	addButton(1,"Your Face",HSYF);
}

//[=Vaginal=]
// If the PC has no vagina, change this button to [=Anal=]
// (scene: HSVA)
public function HSVA():void
{
	clearOutput();
	showPaige(true);
	author("B");
	output("Riding on a high off Paige’s musk and flavors, you’re barely conscious of yourself lying flat on your back and lifting your [pc.legs] up and over your shoulders, presenting your [pc.vagOrAss] to her. You don’t need to say anything and Paige needs no further invitation; you feel a harsh clap of her hand against your right buttcheek, followed by a rough grope, her powerful fingers flexing at your flesh, as she moves into position, her body towering over you.");
	output("\n\nHer other hand comes down on your other cheek, lifting you up as she settles into position above you. She flops her doggy dong ");
	if(pc.legCount > 1) output("between your [pc.legs]");
	else output("against your [pc.leg]");
	if(!pc.hasCock() && pc.hasVagina()) output(", rubbing the shaft against the moist heat of your [pc.vagina]. She rocks against your body, your juices collecting and distributing along her length, lubing it further as it prepares to claim you");
	else if(pc.hasCock()) 
	{
		output(", slapping it against your own [pc.cock]");
		if(pc.biggestCockLength() < 4) output(". She smirks at you as she wraps her one hand around both your shafts; she uses her fingers to hold yours in place while her larger, superior cock rubs and dwarfs yours, overshadowing it. You release one meager spurt of pre, and it accomplishes so little against her comparatively-titanic cock");
		else if(pc.biggestCockLength() <= 12) 
		{
			output(". She grins as she unabashedly compares your sizes; ");
			//if (pc.cockLength < 9)
			if(pc.biggestCockLength() < 9) output("you’re big, but she’s still bigger");
			else output("you’re about equivalent, and it’s difficult to eyeball who is truly larger");
			output(". Her hand wraps tightly around both of your tools, her fingers unable to close around the girth of you both together, and she jacks you, beating you both off skillfully. You spurt a round or two of your own pre, and yours and hers mix together in her palm, lubing you both");
		}
		else
		{
			output(". She frowns as she compares your sizes; despite the immensity of her gift, you still outclass her");
			if(pc.biggestCockLength() <= 14) output(", if only just");
			output(". She wraps one, strong hand against both of your tools and begins tugging, frotting her Ausar prick against your [pc.race]’s, enjoying the smooth textile differences between the two. Any pre that shoots from you both swiftly dribbles into her palm, which she gratefully uses to lube you both as she works");
		}
		if(pc.balls > 0) output(". Your warm [pc.sack] kisses against hers, providing a soft, fleshy pillow for her own cum-filled testicles to massage against as she ruts you");
	}
	output(".");

	output("\n\nShe can only get herself so far, frigging against you the way she is. Like you, she needs more. With a grunt, she releases your right cheek to grip her tool by the base – she slaps it against you a few times, spewing more of her pre this way and that, before backing up and plying it against the vent of your [pc.vagOrAss]. You bite your lip in anticipation; Paige’s form always did <i>things</i> for you, and the idea of taking her inside you is <i>tantalizing.</i>");

	output("\n\nWith a thrust, she’s in. Your breath leaves you both in harsh gasps; Paige, unaccustomed to the sensation, freezes momentarily, unsure of how to continue, but after a moment of collecting herself, she figures it out. You cough out in pleasure every time she leans in and spears into your body: her pointed tip parts you perfectly, showing the rest of her meat into your body for it.");

	if(pc.hasVagina()) pc.cuntChange(0,paige.cockVolume(0));
	else pc.buttChange(paige.cockVolume(0));

	output("\n\nHer strong hands grip at your waist for stability as she rails you, thrusting harder and faster as time goes on. You have no voice, and even if you did, no strength to use it. Your hands curl into fists and your eyes cross; it’s not the act or the penetration itself, but something about it being <i>Paige,</i> whether it’s her surprising size or just that fact that it’s <i>her,</i> that makes it so incredible for you.");

	output("\n\nAs the minutes go on, you feel something thick and hot tap against your [pc.vagOrAss], getting louder and louder, and more and more forceful, as her rutting goes on. You’re so caught up in the visceral act of Paige’s body inside yours that you, at first, register it as her bottoming out against you – but then you remember her bloated, searing hot knot, large enough to really, properly wreck you; thick enough to <i>ruin</i> you for anyone but her again.");

	output("\n\nHonestly, that sounds a bit tempting to you....");

	processTime(10);
	pc.changeLust(10);
	clearMenu();
	//[=Pull Out=][=Take Her Knot=]
	// end scene (scene: HSVA)
	addButton(0,"Pull Out",HSPO);
	addButton(1,"Take Knot",HSTHK);
}

//[=Lay Down=]
// (scene: HSLD)
public function HSLD():void
{
	clearOutput();
	showPaige(true);
	author("B");
	output("You lay flat on your [pc.belly], folding your arms to rest your head against as you let Paige do what she wants to you. You surrender yourself as little more than a hole for her and her new equipment; you rest and relax, making the coming intrusion as difficulty-free as you can.");
	output("\n\nPaige crawls forward, laying her own body across yours: you feel her fur tickle against your lower back and her boobs rest on your shoulders, the hardened, pointed nipples digging into your skin. She licks at your ear, nibbling at it gently, as gravity slides her thick length into your [pc.vagOrAss]. You count the millimeters she penetrates you, and you welcome each one, in body and in mind.");

	if(pc.hasVagina()) pc.cuntChange(0,paige.cockVolume(0));
	else pc.buttChange(paige.cockVolume(0));

	output("\n\n<i>“Look at you, taking this so easily,”</i> Paige says kindly, unironically praising your self-control and willingness. ");
	//if {First time}
	if(flags["PAIGE_GHOSTED"] == undefined) output("<i>“Paige tells me that she never knew you’d be so... receptive to this. She was afraid you’d turn us away. Imagine her surprise when her lover is just as much of a slut for a good cock as she is. Her words, not mine.”</i>");
	else output("<i>“I was so surprised with how easily you took to this, and now I know you’re just a cum-craving slut like yours truly. I got a big dick, and I know it – but I’m wearing you like a glove. Gods, having a dick feels good.”</i>");

	output("\n\nShe comes to a rest against your [pc.ass], settling herself inside you for a moment. Your body rumbles as it adjusts to the intrusion inside you, familiarizing itself with Paige’s rod. You feel a dense heat against your body, bulging against the base of Paige’s dick, and when she pulls out to thrust in again, it claps against your body, and your [pc.vagOrAss], greedily.");

	//First time
	if(flags["PAIGE_GHOSTED"] == undefined) output("\n\n<i>“She wants to hear it");
	else output("\n\n<i>“I want to hear it");
	output(",”</i> she whispers to you, her hips getting into a gentle, steady rhythm as her meat drills into you. Her copious pre dribbles from her, seeping deeper into your body with each push. <i>“Tell ");
	if(flags["PAIGE_GHOSTED"] == undefined) output("her");
	else output("me");
	output(" you enjoy it as much as ");
	if(flags["PAIGE_GHOSTED"] == undefined) output("she does");
	else output("I do");
	output(". That you love laying on the dirty floor, having a thick-ass Ausar cock pounding you. ");
	if(flags["PAIGE_GHOSTED"] == undefined) output("We");
	else output("I");
	output(" know you do.”</i>");

	output("\n\nYou bite your lip. You know she’s just riding off a power-high, having her new appendage inside you and asserting her dominant-self onto you. You could tease her and deny it, or you could admit it and play along, not that you’d be lying, necessarily.");

	//[=Submit=][=Say Nothing=]
	// end scene (scene: HSLD)
	processTime(10);
	pc.changeLust(10);
	clearMenu();
	addButton(0,"Submit",HSS2);
	addButton(1,"Say Nothing",HSSN);
}

//[=Buck Back=]
// (scene: HSBB)
public function HSBB():void
{
	clearOutput();
	showPaige(true);
	author("B");
	output("Horny and impatient, you ball your hands into fists as you push back against you, swallowing more of her with your [pc.vagOrAss]. Your senses alight; your [pc.tongue] lolls out and you unconsciously drool just a little as your body adjusts to the sudden, intense heat inside your body. You’re split open; Paige wears you like a sock for her cock, and you haven’t even touched down on her knot yet.");
	if(pc.hasVagina()) pc.cuntChange(0,paige.cockVolume(0));
	else pc.buttChange(paige.cockVolume(0));
	output("\n\n<i>“Damn,”</i> Paige husks. She barely moves herself – you’re doing more than your fair share, excited as you are, to have Paige fuck you. You fuck against her, withdrawing and sinking back in, taking a little bit more each time, your nerves and veins greeting her own as you shuck in more fat Ausar dick into your body. Your limbs grow weak and numb from the pleasure, but the pleasure dictates that you don’t stop. Not until you have every little bit of her.");
	output("\n\nYou feel, unfortunately, the bloat of her knot against you, stopping her from plowing you further, and despite your enthusiasm, you don’t believe you’re ready to take it inside you just yet. But that’s fine, because it means you have more time to fuck the rest of her cock: you bounce on her, taking her shaft and massaging it with your body. You’re starting to work up a good sweat.");
	output("\n\n<i>“Thirsty [pc.boyGirl],”</i> Paige says. She reaches forward, her hands on your shoulders, as she finally joins you in fucking you: when you pull forward, she pulls back, and when you push back, she thrusts forward, spearing deeper into you than ever and teasing your with the promise of her knot. <i>“Show me how much you want this thick knot in you, [pc.name],”</i> she commands. <i>“Show me how much you want me to wear you like a condom; how badly you need to feel yourself wrap around a proud, fat Ausar cock.”</i>");
	output("\n\nYou feel yourself spreading just a bit wider with every pound against you. It’s happening, whether you want it or not – but you can at least control your own body as it happens.");

	processTime(7);
	pc.changeLust(20);
	clearMenu();
	//[=Relax=][=Take It=]
	addButton(0,"Relax",HSR);
	addButton(1,"Take It",HSTI);
}
//[=Your Mouth=]
// (scene: HSYM)
public function HSYM():void
{
	clearOutput();
	showPaige(true);
	author("B");
	output("You give her shivering cock a quick kiss, before gently yet eagerly sliding it back in. You twist your head to one side, allowing the spade to slide along the inside of your cheek. You compress, applying light, warm pressure to the entirety of her shaft, your [pc.tongue] washing over it from every angle it can twist and writhe to. You lean in, dipping further, until it hits the edge of your throat – but there’s still more of her to take, and you won’t be satisfied until you’ve taken all of her.");
	output("\n\nTaking your actions as a sign that this is where you want to be for the big climax, Paige grips onto your head and lightly rocks her toned hips back and forth, sawing herself in and out of you. Your vision is clouded by her incredible six-pack; the incline of her pelvis against her abdominals; and her knot, constantly bumping you in the nose on every inward push.");
	output("\n\nYou feel her flex in her mouth as pre fountains from her, coating your tastebuds before sliding into your gullet. You reach forward, one hand cupping her balls to usher the real prize forward, and the other wrapping and gliding around the ball of her knot, simulating it being locked in a bitch. Your efforts don’t go unappreciated: Paige starts humping harder, pushing you past your limit, until your [pc.lips] finally kiss against her knot.");
	output("\n\nThe sounds of you slurping along her red length are interrupted by Paige saying, simply, <i>“gonna cum.”</i> Her breathing is harsh and guttural; she instinctually hunches, giving more power to her legs, to properly seed your belly. <i>“Gonna put some thick Ausar jizz in that pretty mouth of yours,”</i> she says, knowing how hungry you are for it. <i>“Doubt it’ll be the last time either, you slut.”</i>");
	output("\n\nWhen the first drop hits your [pc.tongue], you think to yourself that you certainly hope not.");
	processTime(10);
	pc.changeLust(10);

	//[=Climax=]
	// end scene (scene: HSYM); go to (scene: HSE1)
	clearMenu();
	addButton(0,"Climax",HSE1);
}

//[=Your Face=]
// (scene: HSYF)
public function HSYF():void
{
	clearOutput();
	showPaige(true);
	author("B");
	output("You pucker your [pc.lips] and give the spade of her cock a kiss, slipping it in for good measure, but you don’t take her much deeper than that. You suckle and slurp at her, compressing to stimulate her tip and drinking every delicious drop of her Ausar pre that she gives you. Your hands glide along her slick-with-spit cock, masturbating her to her finish.");
	output("\n\nPaige gets what it is you want, and she stands steadily, letting you work her with your hands. <i>“Want it all over your face?”</i> she asks you. You don’t answer, absorbed in your work as you are. <i>“Want to wear my Ausar cum like mascara? Keep it up.”</i>");
	output("\n\nYour left hand travels down her shaft, rubbing at her knot like a glass ball while your right continues to jerk her. You feel its thickness and marvel at its heat; your hand travels upward, scratching between the valleys of her abdominals and admiring how each one pokes back at you; you go low, to her balls, each hefty nut large enough to fill your hand and each one dense enough to promise a facial unlike anything you’ve experienced");
	if(pc.hasCock()) output(", whichever end you happened to be on");
	output(".");

	output("\n\nMewling, you nuzzle against her dick, using your hand to keep it in place as you rub your cheek against it fervently. You crane your [pc.lips] against it as you nuzzle, trailing them up and down her thick meat; your spit from earlier soaks back against your [pc.skinFurScales], and you replace it by snaking out your [pc.tongue], tasting her length again.");
	output("\n\n<i>“Nearly there,”</i> she tells you, once, gutturally. You take it as an instruction and lean backward, resting on your knees, your lips gently against her tip once more. Paige swats your hands away as she grips onto herself with both hands, furiously pumping, her breath coming out ragged and forced, her balls swinging forward and back in time with her hands. You open your mouth and extend your tongue, ready for your baptizing.");

	output("\n\nHer body jerks awkwardly for a moment, and her abs crunch. You watch her load travel up her shaft before–");

	processTime(10);
	pc.changeLust(20);
	//[=Climax=]
	// end scene (scene: HSYF); go to (scene: HSE2)
	clearMenu();
	addButton(0,"Next",HSE2);
}

//[=Pull Out=]
// (scene: HSPO)
public function HSPO():void
{
	clearOutput();
	showPaige(true);
	author("B");
	output("Maybe not this time. You ask Paige to not knot you.");

	output("\n\nShe growls in frustration, but nonetheless acquiesces. <i>“You’re lucky you’re cute,”</i> she says. She does not stop or even slow her thrusting, but the sound of your body slapping against her knot is as deep as it ever gets. You thank her between her body-shaking thrusts; she’s large enough that your [pc.vagOrAss] feels stuffed beyond compare even without it.");
	output("\n\nPaige reaches forward, both hands gripping onto your [pc.chest] tightly for her support. You, in turn, wrap your [pc.legs] around her waist, holding yourself aloft with your lower body (and her meat, stuck on it as you are) while she goes at you. She grunts occasionally, and you feel something warm touch on your [pc.belly] every now and again – she’s drooling on you. The new experiences she’s feeling has changed her mind to something more bestial, concerned with only getting a good nut. That she’s <i>still</i> honoring your request to not knot you is a testament to her willpower.");

	output("\n\n<i>“Mmm,”</i> you moan as her cock slides in and out of your abused hole. <i>“Fuck me,”</i> you beg, almost deliriously, not that you need to: your body is surrendered to her completely, and she’s taking the invitation like a wild wolf given a free meal. A burst of heat emanates from your body as she plows you and seeps deeper into you with every other push; you lick your lips, thirsty for her to give you the real thing and mark you as her property.");

	output("\n\nHer hips pound against your [pc.vagOrAss] forcefully, and eventually, it grows painful, despite her restraining herself from going all the way. Exasperated at her bodily demands and her promise that she wouldn’t, she instead pulls out, leaving you cold, empty, unfulfilled and lame; when she scoots forward, her powerful legs on either side of your [pc.hips], both hands furiously stroking herself, you realize that she’s about to mark you a little more literally than you had hoped for.");
	output("\n\nPaige pants, her breathing haggard, her balls bouncing in time with her hands. You watch rapturously as her cock inflates, the spade opening slightly for another quick rush of pre that lands across your torso, a mere appetizer of the flood that soon follows it....");

	processTime(10);
	pc.changeLust(20);
	clearMenu();
	addButton(0,"Next",HSE2);
	//[=Climax=]
	// end scene (scene: HSPO); go to (scene: HSE2)
}

//[=Take Her Knot=]
// (scene: HSTHK)
public function HSTHK():void
{
	clearOutput();
	showPaige(true);
	author("B");
	output("You decide to say nothing: Paige needs no further encouragement to shove herself deep into you and lock you in place as her cumdump. You lift your [pc.legs] and wrap them around her waist, flexing them whenever Paige pushes in you help her along, ushering her into the temple that is your [pc.vagOrAss].");
	output("\n\nSensing your submission and eagerness to take her into you, Paige reaches beneath you, grapping you by the [pc.ass] and lifting you, giving her more leverage to fuck you. The pummeling your body is taking by the chunk of flesh at the base of her already-formidable cock is starting to hurt a bit, but, in equal parts mind-drunk pleasure, adoration for Paige, and pure curiosity, you... you just want to feel it inside you. You want to know what it’s like.");
	output("\n\n<i>“This’ll probably hurt,”</i> Paige warns you. You grunt your acknowledgement but you make no attempt to stop her, and she continues on: her thrusts grow stronger and more determined, until your tortured body begins to relent: your [pc.vagOrAss] yawns slightly wider with every other push inside, until you feel yourself stretch to accommodate the top of her wide knot. She instinctually knows that she’s past the point of no return and stops thrusting in favor of simply pushing herself until she’s in.");
	output("\n\nYou bite your lower lip as conflicting messages and feelings assault your head. You’re being slowly split open, and the feeling is as comfortable as it sounds; but you’re being split open not just by a dick, and not just by a thick, hot, powerful Ausar dick, but by <i>Paige’s</i> dick. The fact that it’s her, and that you’re okay with these changes to her as she uses them to mold you into something that’s only ever going to be useful for her from now on, makes the pain not only tolerable, but actually makes it feel even better; you’re willing to put up with that pain just because it’s Paige.");
	output("\n\nPaige growls and grunts as she shoves forward, your body fighting against her, until your [pc.vagOrAss] finally relents: with a sudden thrust, the entirety of her cock slips inside you, and your body quickly seals around the rear side of her knot to lock her in place. You two aren’t going anywhere for a while yet; the implication that she would be wearing you like a condom has never been truer until this very moment.");
	if(pc.hasVagina()) pc.cuntChange(0,paige.cockVolume(0)*2);
	else pc.buttChange(paige.cockVolume(0)*2);
	output("\n\nSomething immediately triggers in Paige’s head as soon as she feels herself slip into you. The sudden heat around her bulbous knot, and the tightness around the whole of her dick, flips a switch that tells her to stuff your body even further with her cum. With a grunt bordering on an awkward bark, she hunches over, and you feel another sensation quickly bloom inside you.");

	processTime(10);
	pc.changeLust(20);
	clearMenu();
	addButton(0,"Next",HSE3);
	//[=Climax=]
	// end scene (scene: HSTHK); go to (scene: HSE3)
}
//[=Submit=]
// (scene: HSS2)
public function HSS2():void
{
	clearOutput();
	showPaige(true);
	author("B");
	output("You part your lips – at first, you don’t have the breath or the strength to say anything, lodged onto Paige’s engorged cock as you are. You collect yourself and try again. <i>“I love it,”</i> you say, perhaps a little quieter than Paige would have liked to hear.");
	output("\n\n<i>“Louder,”</i> she says, although, based on the sudden jerk in your [pc.vagOrAss] and the way Paige’s body has started fucking you – slowly for now. <i>“");
	if(flags["PAIGE_GHOSTED"] == undefined) output("She");
	else output("I");
	output(" can’t hear you well when you’re full of ");
	if(flags["PAIGE_GHOSTED"] == undefined) output("our");
	else output("my");
	output(" cock like this.”</i>");

	output("\n\nIn response, you bend your knees, lifting your lower body up and against her, taking more of herself into you suddenly. <i>“Fuck me, Paige,”</i> you say, loudly enough that there could be no mistake. <i>“If I had known you having a dick would feel this good, I would have started sneaking Throbb into your cereal the day we met.”</i>");

	output("\n\nShe laughs, not at your submission but because she genuinely thought it was funny. <i>“");
	//if {first time}
	if(flags["PAIGE_GHOSTED"] == undefined) output("She wants you to know that she has an idea for later, in that case");
	else output("Keeping this spirit around to sprout a dick for you to fuck was the best idea I’ve ever had");
	output(",”</i> she replies. <i>“And if you’re this horny for some yummy Ausar meat, then ");
	if(flags["PAIGE_GHOSTED"] == undefined) output("we’re");
	else output("I’m");
	output(" sure you wouldn’t mind going all the way.”</i>");

	output("\n\nTo punctuate her statement, you feel her bulb press harshly against your [pc.vagOrAss], demanding entry. You whimper, not in worry but in lust, as it pushes and pounds into you, vigorous; entry is not a question, but a statement, one that’s only a few moments away. Paige’s hands slam down on either side of your head as she braces herself, and she goes faster and harder, her balls swinging down with every thrust");
	if(pc.balls > 0) output(" to clap against yours");
	output(".");

	output("\n\n<i>“You’re gonna be a cock sock for a little while after this,”</i> she whispers in your ear, her powerful hips never stopping. <i>“A dream come true, am I right?”</i> Before you answer, she thrusts once, and you feel your body giving way; twice, and her knot’s halfway lodged inside you; a third time, and there it goes: she’s as deep inside you as she could hope to be.");
	if(pc.hasVagina()) pc.cuntChange(0,paige.cockVolume(0)*2);
	else pc.buttChange(paige.cockVolume(0)*2);

	output("\n\nShe clenches her teeth and inhales sharply once your body molds around her shaft. Her body becomes stock-still as something triggers in her head; after a tense moment, you feel every contour of her cock against your sensitive flesh as it bloats, making room for her load to seed you like the proper, willing bitch that you are beneath her.");

	processTime(10);
	pc.changeLust(20);
	clearMenu();
	addButton(0,"Next",HSE3);

	//[=Climax=]
	// end scene (scene: HSS2); go to (scene: HSE3)
}

//[=Say Nothing=]
// (scene: HSSN)
public function HSSN():void
{
	clearOutput();
	showPaige(true);
	author("B");
	output("<i>“Nope,”</i> you say defiantly, lifting your [pc.ass] and rocking it back and forth, dragging her thick dick with it. <i>“I’m not going to say it, and you can’t make me.”</i>");

	output("\n\nPaige hums to herself as she lowers her body, planting both hands on either side of your head, flat on the mat. <i>“Bold words, for a [pc.boyGirl] filled with some dick,”</i> she whispers. You feel her nipples drag along your back, her breasts weighing down on your shoulder blades. <i>“We’ll see how long that attitude lasts.”</i>");

	output("\n\nBraced against you, she starts pumping herself steadily into your body – slowly at first, testing her strength and stability, before increasing her speed; she leans her body forward, angling her cock so that it drives along the inside of your [pc.vagOrAss], tickling against every vein and muscle inside you. She’s gentler than you were expecting, after that response, but every time you shift to get yourself into a better position, she growls and lowers her body, pinning you tighter between her and the floor.");

	output("\n\n");
	//if {first time}
	if(flags["PAIGE_GHOSTED"] == undefined) 
	{
		output("<i>“You can’t deny how curious you are,”</i> she says nonchalantly; the effort to fuck your body isn’t even winding her. <i>“Tonight’s been a number of firsts so far. Suddenly, your babe’s got a cock");
		if(pc.biggestCockLength() <= 14) output(", and it’s bigger than yours");
		output(". Now, you’re face-first on the floor while she rails you. And you’re loving every second of it, no matter what your snooty mouth says");
		//if {Anal, and the PC has done anal with Paige}
		if(flags["PAIGE_ANAL"] != undefined && !pc.hasVagina()) output(".”</i> She leans down, her lips nibbling on your ear before continuing. <i>“Paige tells me she loves it up the ass, too. You’d really be making her night if you told her you liked it");
		output(".”</i>");
	}
	//if {not first time}
	else
	{
		output("<i>“I feel like you understand me on a more primordial level, since you keep asking me to grow a dick,”</i> she says matter-of-factly; her body flexes above you at the sound of her own words, proud that she’s pleasuring her [pc.manWoman] the way she is. <i>“How it feels to have a nice, thick cock inside you every once in a while");
		if(flags["PAIGE_ANAL"] != undefined && !pc.hasVagina()) output(". How freeing being a buttslut can be");
		output(". How much you love the feel of warm, thick jizz cumming inside you.”</i>");
	}

	output("\n\nYou feel something hot and bulbous press against your [pc.vagOrAss] with every push now; you hear the ‘paff, paff, paff’ of her cock bottoming against you before you realize that it’s her knot, thick as a pumpkin by the feel of it, demanding entry into you. <i>“Tell you what,”</i> she says calmly, <i>“if you don’t not say you want my knot, I’ll not knot not-you. If it’s all for naught if my naughty knot does not knot you, say that I shouldn’t not knot you.”</i>");

	output("\n\n");
	//if {PC’s Intelligence is capped}
	if(pc.IQ() >= 100) output("You smirk. She just offered you a ‘heads-I-win-tails-you-lose’ scenario, and you have half a mind to tell Paige that it was a nice try, but you’d be ruining the moment, and her fun, if you did.");
	else output("You scrunch your brow, repeating everything that she just said to yourself, trying to parse the two sentences, before Paige gets impatient.");
	output(" <i>“Too late,”</i> she growls, thrusting her hips harder and harder, each push placing the ball of her knot just a little deeper against you – until, with a wet ‘squelch,’ she’s inside you, wholly and completely.");
	if(pc.hasVagina()) pc.cuntChange(0,paige.cockVolume(0)*2);
	else pc.buttChange(paige.cockVolume(0)*2);

	processTime(10);
	pc.changeLust(20);
	clearMenu();
	addButton(0,"Next",SSE4);
	//[=Climax=]
	// end scene (scene: HSSN); go to (scene: SSE4)
}

//[=Relax=]
// (scene: HSR)
public function HSR():void
{
	clearOutput();
	showPaige(true);
	author("B");
	output("Thinking better of actively trying to shove something <i>that</i> huge into your [pc.vagOrAss]. you lower your shoulders and sigh, trying your best to release the tension in your body so that Paige will have an easier time ‘introducing’ herself to you. You don’t stop your bouncing on her tool, but you slow it quite a bit, to the point where Paige has to grip onto your [pc.hips] and take control of the pace.");
	output("\n\n<i>“That’s it,”</i> she says adoringly; one hand travels up your back, against your neck, and she gently, lovingly brushes your cheek with her fingers. <i>“It’s going to be a hell of a journey, [pc.name],”</i> she warns – not that you need to be told that: it already feels like she’s pushing a baseball up there. <i>“Just relax, and you’ll have all of me in you in just a moment.”</i>");
	output("\n\nAfter a few more thrusts, battering your body open enough for her liking, she gives one, final push. <i>“It’s coming now, [pc.name],”</i> she says soothingly, but through gritted teeth, focused as much as you are on getting it inside you. <i>“You’re such a good lover, wanting to take a cock as big as mine");
	if(pc.hasCock()) output(". I’ll be returning the favor soon, love. Just relax; you’ll have me soon");
	else 
	{
		output(". Maybe we should look into ");
		if(flags["PAIGE_GHOSTED"] == undefined) output("me possessing you for a night; let you know what it’s like");
		else output("loaning this spirit to you for a night. I’d love to see what you’d do to me");
	}
	output(".”</i>");
	
	output("\n\nIt hurts, you won’t deny any part of that, and a rogue thought wishes, despite your eagerness at first, that you hadn’t agreed to this in the first place – but then Paige says that <i>“it’s halfway, cutie.”</i> Knowing that it’s half-over, and that the rest of the journey is going to be a cakewalk, makes you dopey with pleasure: the pain quickly subsides, the pain turning to wonderful little tingles, as your [pc.vagOrAss] conforms around her knot, swallowing it inside you.");
	output("\n\nPaige grunts once you take her to her actual base: the part where her dick meets her body. <i>“Good [pc.boyGirl],”</i> she congratulates, and she doesn’t stop her fucking into your body: despite being as locked against you as she can be, she keeps humping, getting every little bit from your body that she can. It works – her fingers grow tense, and she chokes on her own breath for a moment. <i>“Here comes your creamy reward....”</i>");
	if(pc.hasVagina()) pc.cuntChange(0,paige.cockVolume(0)*2);
	else pc.buttChange(paige.cockVolume(0)*2);

	processTime(10);
	pc.changeLust(20);
	clearMenu();
	addButton(0,"Next",SSE4);
	//[=Climax=]
	// end scene (scene: HSR); go to (scene: SSE4)
}

//[=Take It=]
// (scene: HSTI)
public function HSTI():void
{
	clearOutput();
	showPaige(true);
	author("B");
	output("The thought of having this <i>beast</i> split you apart is all too enticing for you to ignore, and you buck back harder against Paige, excited at the prospect of taking her knot inside you");
	if(pc.hasVagina()) output(". Your [pc.vagina] spreads wider and wider with each thrust, spreading apart, lubed and ready to cement you as Paige’s bottom bitch for the night");
	else
	{
		output(". Your [pc.ass] clenches in protest, her cock just too unfathomably large to take the entirety of into itself, but you’re not going to take a ‘no’ for an answer, even if it’s from your own body");
		if(pc.hasCock()) output(". You’re already hard as iron and leaking like a faucet; the idea of this monolithic dick battering your prostate is too enticing to pass up");
	}
	output(".");

	output("\n\n<i>“That’s what I thought,”</i> Paige says, gripping onto your [pc.hips] and thrusting hard against you in response. <i>“Gods, I’m going to wear you like a condom. You’re gonna walk crooked for days when I’m done with you.”</i> You ask her if she promises; she doesn’t reply, and only jackhammers against you, thrusting harder and harder, her knot bumping against your abused hole, demanding entry that you will not deny.");

	output("\n\nYou wince – the pain is a little sharper than you would like, but to hell with that and to hell with whatever consequences that might come from taking a battering ram like Paige’s cock up your [pc.vagOrAss]. Your hands squeeze into balls as you urge her on, asking her to <i>claim</i> you, to cum inside you and seed you, to fulfill her promise of wearing you. The further your body slides down her bloated knot, the more you want it.");

	output("\n\nPaige snarls as she hunches over you, pounding against you with all her might, until your body gives just a little more than the last push; she thrusts in, then stops her pounding, pushing against your pelvis one final time as your [pc.vagOrAss] melds around her knot. You bite into your [pc.lip] as you feel every facet of your body contort to accommodate Paige’s girth; you have no idea how far long you are, until suddenly, Paige falls forward, the last of her knot vanishing into you.");

	output("\n\nYou feel the heat of her body against your [pc.ass] and her weighty balls against your [pc.thighs]. You’re almost disappointed: despite the fire in your lower body from all the pounding, you almost wish she had more cock to fuck you with. You’re full to the brim and Paige is squeezed tight inside you, but you wish there was <i>more,</i> and even if she had more to give, you’re sure your desire is a thirst that would never be quenched.");

	output("\n\nHowever, Paige is more than willing to offer you the next best thing. You feel her cock lurch inside of you, twitching; with a hot, heavy exhale, Paige gives you more than just her dick to satisfy you....");

	if(pc.hasVagina()) pc.cuntChange(0,paige.cockVolume(0)*2);
	else pc.buttChange(paige.cockVolume(0)*2);

	//[=Climax=]
	// end scene (scene: HSTI); go to (scene: HSE5)
	processTime(10);
	pc.changeLust(20);
	clearMenu();
	addButton(0,"Next",SSE5);
}

// (scene: HSE1)
public function HSE1():void
{
	clearOutput();
	showPaige(true);
	author("B");
	output("Paige huffs once, the air leaving her lungs in a hurry, as cum rockets from her happy dick, pumping straight into your mouth. You feel her flesh expand against your tongue until it fills your mouth as her ambrosia floods your cheeks; it washes against your tongue and cakes your gums and your teeth, until there’s no room left, so, taking a deep breath through your nose (and loving the huge whiff of Paige’s musk that comes with it), you swallow – and yet, she doesn’t stop.");
	output("\n\nIt tastes exactly as you had hoped: salty, hot, but with a tangy undercurrent that distinctly reminds you of Paige. The load in your mouth is quickly replaced with another, and then a third, and you usher it all into your mouth with your still-washing tongue. You wonder if this is all because of the spirit possessing Paige, or if it’s some combination of the spirit and Paige working through their years-long abstinences together, but her load is certainly larger than you had anticipated. But that’s okay with you: you’re a proper cumdump, and you’ll take every precious load Paige has to give you.");
	output("\n\nThe hand on her balls massages them through the whole ordeal, as they bunch and squeeze against Paige’s tight body with every load that passes through her dick. Paige’s body shakes and quivers through it all, finding it difficult to remain upright as she cums and cums into your thirsty mouth");
	if(pc.hasVagina()) output("; your [pc.vagina] clenches in orgasm at nothing, wishing desperately that it was <i>it</i> that was taking this impressive load into itself, and not your mouth");
	if(pc.isHerm()) output(". And, of course, you’re not done");
	if(pc.hasCock()) output(". [pc.EachCock] is rock hard, and at the sensation of your belly filling and filling with Paige’s cum, you can’t help but shoot a load of your own, your [pc.cum] arcing through the air in submissive pleasure");
	output(". You’re halfway through the fifth mouthful, your [pc.belly] tightening under the strain of such a copious meal, before she finally begins to taper, and even then, she has another two to give you before she stops.");

	output("\n\n You remain still, on your hands and knees in front of your Ausar, her dick still hard as nails in your mouth. You don’t keep sucking; you simply provide a warm, wet pocket for it to rest in as the blood leaves it, softening in your maw. You’ll remain there until Paige bids you to stop, and, from the heavy panting and odd shake of her hips, that’s not going to be for a little while yet.");

	output("\n\nMinutes pass. Paige is silent as could be, enjoying her orgasmic high, and you’re enjoying being a part of her pleasure. The hand against her knot maintains its pressure, and, like you hoped, her knot stays bloated for long after she’s finished. Her balls are noticeably lighter in mass, though no-less palm-filling than before. You wonder how long it’ll take before they’re ready to go again.");

	output("\n\nThough she lasts some time, it’s still too short, and eventually, her knot slowly deflates and her dick slowly begins to recede back into her body. You travel with it for a moment, until your nose is pressed against her tight stomach, and you lather her sheath and balls with your tongue, cleaning her, and hoping for a little more.");

	output("\n\nPaige, however, has other plans, as she flops onto the mat beside you.");

	processTime(10);
	pc.orgasm();
	//if(pc.hasVagina()) pc.loadInCunt(paige,0);
	//else pc.loadInAss(paige);
	pc.loadInMouth(paige);
	//[=Aftermath=]
	// end scene (scene: HSE1); go to (scene: HSA)
	clearMenu();
	addButton(0,"Next",HSA,"HSE1");
}

// (scene: HSE2)
public function HSE2():void
{
	clearOutput();
	showPaige(true);
	author("B");
	output("You open your mouth and stick out your [pc.tongue], more for show than because you want her cum in your mouth – if you did, you probably would have just taken her in the mouth. Still, you get what you want, and Paige wants to give it to you: after another few hurried pumps of her hands, she’s erupting, her cum rushing from her cock in huge waves.");
	output("\n\nThe first load splashes along your face, painting a trail that goes from your [pc.belly] all the way up to your scalp. You hum in delight as you feel the heat of her cum seep into your [pc.skinFurScales]; your hands go to your chest and stomach, and you rub Paige’s cum into your body");
	if(pc.biggestTitSize() >= 4) output(" and into the depths of your cleavage");
	output(", loving the sensation of having your hermaphrodite Ausar lover cumming all over you and marking you.");

	output("\n\nA second splash of thick cum drapes over you, crossing over the first line left on your body with a big, white X. You close both your eyes, submersing yourself in Paige’s strength and her quantity; she shoots another one, aimed largely at your face and chest, covering your form in spunk, and she isn’t stopping. You don’t want her to stop: you’d have Paige cover you from head to toe, if you could, and she’s doing her damnedest to see your wish come true.");

	output("\n\nShe grunts and sighs as her jets finally begin to wind down. There’s a bit of a pause between the fourth spurt and the fifth, and the fifth doesn’t have much more to it. To wind herself down, she sticks her cock on your outstretched tongue, frigging it against your taste buds as the last few spurts launch directly into your maw. You graciously accept, gargling her sperm, before sealing her cockhead between your lips and giving it a long, exaggerated kiss.");

	output("\n\nYou stay there, [pc.lips] dutifully on Paige’s rod, even as it starts to deflate and recede into her body. You follow it all the way down, until you’re kissing the open end of her sheath, pestering for Paige’s cock to come out and play once again. Paige, exhausted and spent, denies your request by flopping onto the mat by your side, pulling you down with her and locking you into a tight hug.");

	pc.loadInMouth(paige);
	pc.applyCumSoaked();
	processTime(10);
	pc.changeLust(10);
	clearMenu();
	addButton(0,"Next",HSA,"HSE2");
	//[=Aftermath=]
	// end scene (scene: HSE2); go to (scene: HSA)
}

// (scene: HSE3)
public function HSE3():void
{
	clearOutput();
	showPaige(true);
	author("B");
	output("You’re both tense and clenched, Paige’s strong body laid over yours as her cock flexes inside your [pc.vagOrAss]. It takes a moment for you to register what’s happening inside you: between the heat of her body; the panting of her breath; and the myriad of feelings erupting in your lower body, you don’t recognize the sensation of Paige’s cum flooding your tunnel, not until the second wave.");
	output("\n\nPaige is breathing hard atop you, through clenched teeth. She groans your name with each pulse of her heavy balls and another surge of her warm jizz into your body. You don’t have the awareness to respond: you’re too blitzed out, your senses overloaded, to the point where you’ve lost count of how many loads Paige has given you after the second.");
	output("\n\nYou wiggle your [pc.hips] involuntarily, rubbing against her knot, enticing out every last drop. ");
	if(pc.hasVagina()) output("The motion rubs against your split, strained labia, adding sparks to the forest fire that is the pleasure in your [pc.vagina]. You hold on for as long as you can, until you can hold on no longer, and your cunt convulses in a shattering orgasm, sucking the strength from all four of your limbs at once. Your eyes cross and your [pc.tongue] lolls out, flicking at nothing in time with the earthquakes between your [pc.legs]");
	if(pc.isHerm()) output(". And, of course, y");
	if(!pc.hasVagina() && pc.hasCock()) output("Y");
	if(pc.hasCock()) 
	{
		output("our [pc.cock] dangles between your [pc.legs], spraying your pre-cum helplessly beneath Paige’s rocking, powerful motions. At the sensation of her filling you");
		if(!pc.hasVagina()) output("r [pc.ass]");
		output(", you can’t help but let loose the torrent that’s been building up inside you this whole time: your [pc.cum] jets from your cock, staining the yoga mat beneath you, proof of Paige’s solid work pleasuring her bottom");
	}
	output(".");

	output("\n\nYour orgasm just inspires more from Paige’s own. She’s still going as thick and as hard by her fourth or fifth spurt; your [pc.belly] is stretched gravid with her cum and you’re only going to get bigger – her huge knot has sealed you watertight. Paige’s body quivers in pleasure and exertion above you, and she’s getting heavier over time, her own strength quickly draining from her. Finally, with one final, tapering burst of cum, she has no more to give, and she stops inflating you like a water balloon.");

	output("\n\nShe sighs in exhaustion, slumping forward, her shoulders pressing down onto yours. Her hands gently go over your body, rubbing sensually at your [pc.chest] and down to your stomach, cooing at how rounded out it is with herself. You feel her cock twitch inside you, and you nearly panic that she’s going to have a second round with such a prestigious load already inside you.");

	output("\n\nPaige has no such inclinations, though. She gently wraps her arms around your upper body, then falls to one side, holding you against her in a tight, warm, loving embrace, her dick still firmly lodged inside your [pc.vagOrAss]. You’re going to be here for a while.");

	//[=Aftermath=]
	// end scene (scene: HSE3); go to (scene: HSA)
	processTime(10);
	pc.orgasm();
	if(pc.hasVagina()) pc.loadInCunt(paige,0);
	else pc.loadInAss(paige);

	clearMenu();
	addButton(0,"Next",HSA,"HSE3");
}

// (scene: SSE4)
public function SSE4():void
{
	clearOutput();
	showPaige(true);
	author("B");
	output("You feel warmth blossom from inside your body, starting just below your [pc.belly] and spreading to the rest of your torso, and then it transforms, similar but different, when it goes towards your head and your limbs. Paige breathes hard, in through her nose and out through her mouth, humping against your [pc.vagOrAss] as she deposits her first load inside you.");
	output("\n\nYou hum in lust as she uses you, as she <i>fills</i> you; you push your butt back against her, rubbing your [pc.thighs] against her furry balls, feeling them clench and coil into her body with every wave of cum. She sprays like a hose inside your body, her cum reaching deeper into you than you thought possible; with every flex of her rock-hard cock inside you, she puts in just that much more, and not a drop of it slips out from the watertight seal that is her knot lodged into your hole.");

	output("\n\n");
	if(pc.hasVagina())
	{
		output("Your own inevitable, undeniable orgasm hits you like an ocean wave against a seashell. Your body clenches, gripping tighter (somehow, stretched as you are) onto the cock you’re speared on, rhythmically milking it for every last drop of her seed so you can make glorious, healthy Ausar babies with Paige and her ghostly copilot. You hump against her, driving her cock even deeper against you – whenever you think she’s too big, or too deep, those definitions get redefined with every new wave of warm cum");
	}
	if(pc.isHerm()) output(". And that’s not even the most of what Paige is doing to you! ");
	if(pc.hasCock()) 
	{
		output("Despite being unattended and useless, [pc.eachCock] erupts, unable to maintain itself in the pleasure erupting from you");
		if(!pc.hasVagina()) output("r prostate as she batters it senseless");
		output(". Your [pc.cum] sprays from your thick, hard length, splashing onto the yoga mat beneath you and staining it, displaying to the world just how expertly Paige has handled you. Your hands feel weak, losing their grip completely, as your orgasm dictates the motor functions of your body.");
	}
	output("\n\nPaige never stops her fucking, despite the connection between you two being so tight that you might as well be a single person – or, more likely, you’re an accessory, something Paige puts on to feel good about herself. Her movements become more exaggerated over time, though; her orgasm eventually has to end, and by the time she’s tapped out, she finally comes to a rest on top of you.");

	output("\n\nYou’re both exhausted and panting in exertion, Paige moreso than you. She collapses on top of you, squishing you to the mat");
	if(pc.hasCock()) output(" and soaking you in your own mess");
	output(". Her titanic dick is lodged tight and sure inside you; Paige twists to one side, and you’re both lying on your left with your Ausar lover spooning you. She idly kisses at your neck as she comes down from the high of her orgasm – and she occasionally teases you with the idea of a second round by humping against you some more, keeping herself nice and hard inside you, ensuring that you’re locked together for a while yet.");

	processTime(20);
	if(pc.hasVagina()) pc.loadInCunt(paige,0);
	else pc.loadInAss(paige);
	pc.orgasm();

	//[=Aftermath=]
	// end scene (scene: SSE4); go to (scene: HSA)
	clearMenu();
	addButton(0,"Next",HSA,"SSE4");
}

// (scene: SSE5)
public function SSE5():void
{
	clearOutput();
	showPaige(true);
	author("B");
	output("You begin babbling insensately as you feel Paige’s cum flood your body. As soon as the first wave hits your tunnels, you thrust backward against her, greedily pleading for more, even though, some part of you realizes, that she’s only starting. You feel her balls against the back of your [pc.legs], scrunching up tightly against your body, before loosening, then scrunching again, accompanying another thick wave of delicious, life-giving Ausar semen for your thirsty form.");
	output("\n\nPaige barely has to say or do anything with how insistent you are for more of herself inside you. Still, she humors you by thrusting the few centimeters between her knot and her body that’s left to fuck you with. The motions make every batch of cum feel just a little bit bigger than the last; with every thrust, it all seeps just a little deeper into you. You <i>need</i> as much of Paige inside you, as a <i>part</i> of you, as you can, and every little thing you both do helps.");
	output("\n\nWhen the third wave of her cum hits you, y");
	if(pc.hasVagina()) output("our [pc.vagina] clenches reflexively and powerfully, sending orgasmic shocks throughout you. The muscles in your body roll in time with the jets from Paige’s cock, sucking all her cum down as deeply into your tunnel as you can. Your stomach bloats with the quantity, and you feel a bit of an unpleasant pulling at your cooch when all that cum can’t escape past her knot, but you don’t care. You just need her cum");
	if(pc.isHerm()) output(".\n\nAs soon as your cunt shivers in orgasm, y");
	if(pc.hasCock()) output("our [pc.cock] thickens and spurts its own [pc.cum], painting the yoga mat beneath you, staining it and marking it as a sign to everyone just what sort of heights Paige has brought you to. You try your best to match your loads in time with Paige’s, but there’s no controlling your body in the wake of the things she’s doing to it. No matter how much you cum, it never feels like you’re keeping pace with her.");

	output("\n\nHer cum fills you so beautifully, so <i>completely.</i> You weren’t sure how your sexual encounter with her was going to go tonight, but now that you’re impaled on her, and she’s fucking you like a toy built explicitly to cater to her body and her needs, you couldn’t imagine tonight ending any other way. Your eyes cross and you start to lose sense of yourself and the time: the only thing to make sense of is how many more loads Paige can put into you before she’s tapped.");

	output("\n\nThe answer, it turns out, is only a few more, much to your chagrin. Exhausted and spent, Paige fucks into your [pc.vagOrAss] a few more times halfheartedly, mostly just to eke out the pleasure between you a little more. Your [pc.belly] rumbles, disquieted by the amount of cum you’re now carrying; her load sloshes inside you, hefting your stomach underneath the liquid’s weight, as Paige falls to one side, her locked knot taking you down with her.");

	processTime(20);
	pc.orgasm();
	if(pc.hasVagina()) pc.loadInCunt(paige,0);
	else pc.loadInAss(paige);
	//[=Aftermath=]
	// end scene (scene: SSE5); go to (scene: HSA)
	clearMenu();
	addButton(0,"Next",HSA,"SSE5");
}

// (scene: HSA)
public function HSA(comeFrom:String):void
{
	clearOutput();
	showPaige(true);
	author("B");
	IncrementFlag("PAIGE_GHOSTED")
	output("You and Paige lie on the mat, panting in exhaustion");
	//if {HSE1}
	if(comeFrom == "HSE1") output(", the strong taste of her cum lingering on your tongue, and you imagine it’ll be there for a while yet");
	//if {HSE2}
	else if(comeFrom == "HSE2") output("; you’re covered from the waist to your [pc.hair] in her cum, and it cools quickly in the air");
	else output(", both of you locked tightly together, her thick dick lodged in your [pc.vagOrAss] by the knot");
	output(". Neither of you have any intention of getting up from your spot on the floor just yet");
	//if {HSE3, 4, or 5)
	if(comeFrom == "HSE3" || comeFrom == "SSE4" || comeFrom == "SSE5") output(", even if you could");
	output(".");

	output("\n\nYour eyes begin to flutter shut, exhausted from the intercourse");
	//if {first time}
	if(flags["PAIGE_GHOSTED"] == 1) output(", and from everything else that’s happened tonight");
	output(". Paige with a dick of her own is a dangerous, explosive weapon, and she used it to its fullest extent on you. You have some lingering concerns – namely, ");
	//if {first time}
	if(flags["PAIGE_GHOSTED"] == 1) output("whether or not the poltergeist would keep its word and release Paige tonight");
	else output("whether you should be falling asleep on the dirty mat, you doubt it’s been washed in a while");
	output(". Your tired, lazy, satisfied mind is willing to overlook all concerns, though, if it means falling asleep in Paige’s arms.");

	// continue here if it’s the first time
	if(flags["PAIGE_GHOSTED"] == 1)
	{
		output("\n\nYou feel Paige rest her head on your shoulder, clearly as tired as you. The motion snaps you awake – no, this isn’t okay. Paige is being <i>possessed.</i> You turn your head towards her, looking over your shoulder, and ask who you’re talking to. <i>“Still me,”</i> she answers sleepily. <i>“Spooky ghost, et cetera.”</i>");
		output("\n\nYou grunt in exertion, trying to spin your whole body around to face her");
		//if {HSE1 or 2}
		if(comeFrom == "HSE1" || comeFrom == "HSE2") output(", but you don’t have the strength and Paige’s hug is too tight for you to break out – not that you really put a lot of effort in, to be honest");
		else output(", but you’re reminded rather strictly of the thick, tight knot keeping you both decidedly in place. You aren’t moving, and that’s that");
		output(". You remind the ghost that she gets <i>one night.</i> She’s had her fun; you want Paige back now.");

		output("\n\n");
		//if {Clock is less than 05:59}
		if(hours < 6) output("<i>“The night ain’t over yet, first of all,”</i> she replies snidely, rocking her hips, and her still-hard cock, against your body enticingly. <i>“And second of all, ");
		//if {Clock is more than 06:00}
		else output("She sighs and looks at the room’s clock for the time. <i>“I suppose you’re right,”</i> she acquiesces sadly. Just as you feel her body start to shuffle, she stops in a jerk. <i>“Oh, hold on a second. ");
		output("Paige and I are having a word.”</i>");
		output("\n\nYou ask her what she means, but she doesn’t answer. She’s still as a statue – she sometimes hums to herself inquisitively, like she were trying to figure out a particularly stubborn math problem. As the seconds tick down, you’re reminded constantly that this <i>isn’t</i> Paige, and that it’s some stranger wearing her skin and growing her a dick: you’re becoming increasingly uncomfortable, waiting for whatever is about to happen, to happen.");
		output("\n\n<i>“Okay,”</i> she finally says, excited. <i>“I got some good news, cutie. Paige and I have come to an agreement. But I think it’ll be best if you heard it from her, not from me.”</i> She taps on your skull, making sure your attention is undivided. <i>“Before I go, though, I meant what I said, [pc.name]. You tell Paige every single godsdamn day just how amazing her body is. There’ll be nothing worse in this universe when she lets it go. Take it from me.”</i>");
		output("\n\nThen, she leans forward, placing a loving, lingering kiss on your cheek. <i>“And... thanks, you two. For giving me a chance. Dying kinda took the wind out of my sails, and I couldn’t have asked for a cuter pair of lovebirds to spook.”</i>");
		output("\n\nYou hear a faint ‘whoosh’ing noise from behind you....");

		//[=Next=]
		// end scene (scene: HSA); go to (scene: HSA2)
		processTime(30);
		clearMenu();
		addButton(0,"Next",HSA2,comeFrom);
		return;
	}
	// still HSA; continue here if it’s not the first time
	output("\n\nYou hear a faint ‘whoosh’ing noise from behind you, and you understand it to mean that the ghost possessing Paige has relinquished control back to her. Her fur returns to its less-fluffy, more-coarse default, and, more importantly, you feel her dick shrink at a rapid pace");
	//if {HSE1 or 2}
	if(comeFrom == "HSE1" || comeFrom == "HSE2") output(". Where she was previously hotdogging it between your [pc.ass], keeping it warm and snug, now there’s simply nothing at all down there");
	//if {else}
	else output(", leaving you gaping and exposed, until it disappears entirely. You try to clench your body, to keep her load from making a sudden mess everywhere, but you accomplish only so much");
	output(".");

	output("\n\nPaige sighs delightedly, like she had just finished a delicious dessert after a hearty meal. <i>“Stars above, keeping her around was a good idea. She’s such a convenient way to cheat me growing a dick and experiencing the best of both worlds.”</i>");

	output("\n\nYou lie there, still recovering from the whole ordeal");
	//if {HSE2}
	if(comeFrom == "HSE2") output(", her cum still dripping down your form, staining your [pc.skinFurScales] and stinking you with her scent");
	else output(", your [pc.belly] stuffed to bursting with her cum, stretching your body taut with it");
	output(". Still, you can’t deny – Paige was already a good fuck, and being able to experience her in such a new, outlandish way is not only exciting, but it’s damn-near invigorating. It wouldn’t take much to convince you to go again.");

	output("\n\n<i>“You’re welcome to spend as long as you need to recover, [pc.name],”</i> she says lovingly, kissing your cheek gently. <i>“You’re a strong, sexy [pc.boyGirl] – why else would you keep asking me to grow it? But, taking a dick like mine is no small feat. I know the ghost gives me a pretty serious package to contend with.”</i>");

	output("\n\nYou take her invitation – it’s the better part of an hour before you’re ready to get back up.");

	processTime(50);
	//[=Next=]
	// end scene (scene: HSA); reduce Lust to 0; if HSE2, add Cum Covered; if HSE3, 4, or 5, add Sore; increase timer by one hour; if in Paige’s Unit, place PC one square outside it; if in the PC’s ship, display usual ship options
	ghostSexWrapper(comeFrom);
}

public function ghostSexWrapper(comeFrom:String):void
{
	if(comeFrom == "HSE3" || comeFrom == "SSE4" || comeFrom == "SSE5") soreDebuff(4);
	paige.removeCock(0);
	paige.removePerk("Fixed CumQ");
	clearMenu();
	addButton(0,"Next",moveSouth);
}
public function paigeGhostFutaGo():void
{
	if(!paige.hasCock()) paige.createCock();
	paige.cocks[0].cLengthRaw = 14;
	paige.shiftCock(0,GLOBAL.TYPE_CANINE);
	if(!paige.hasPerk("Fixed CumQ")) paige.createPerk("Fixed CumQ", 25000, 0, 0, 0);
}

// (scene: HSA2)
public function HSA2(comeFrom:String):void
{
	clearOutput();
	showPaige(true);
	author("B");
	output("Not that you can see it, with Paige lying behind you, but you feel her very physiology change in rapid succession: mostly, her fur gets coarser and shorter, and her grip around your torso gets a little lighter, but, most obviously, you feel her dick shrink at a rapid pace");
	//if {HSE1 or 2}
	if(comeFrom == "HSE1" || comeFrom == "HSE2") output(". Where she was previously hotdogging it between your [pc.ass], keeping it warm and snug, now there’s simply nothing at all down there");
	else output(", leaving you gaping and exposed, until it disappears entirely. You try to clench your body, to keep her load from making a sudden mess everywhere, but you accomplish only so much");
	output(".");

	output("\n\n<i>“Whoa,”</i> Paige says. She releases one arm from your chest, bringing her hand forward for inspection; she flexes it and makes a fist over and over, understanding that it is indeed her own hand again. <i>“What a trip!”</i>");

	output("\n\nWith nothing keeping you locked in place anymore, you flip around, getting a good look at her. Paige has transformed back to the Ausar you remember: her hair is shorter, down to her neck; her ears are pointed and triangular; her face is elongated into her familiar muzzle once again; her wagging tail is no longer nearly as fluffy as before; her eyes are");
	if(paigeBlind()) output(" the same, craggy, misshapen grey irises as before");
	else output(" the familiar, brilliant blue eyes that you’ve come to love as before");
	output(". It’s as if everything that happened tonight was some kind of dream.");

	output("\n\n");
	if(paigeBlind()) output("She frowns, wagging her fingers in front of her face. She must not be able to see them. <i>“Damn,”</i> she mutters to herself. You ask her if she could see everything when the ghost was in charge. <i>“No, not in the same sense as you think,”</i> she answers cryptically. <i>“I understood that</i> she <i>could see, in shapes and colors and sizes, but I could only see... uh, I don’t know if I could explain it. I saw ‘life.’ It got brighter when we both came. I knew I was me, and you were you, but I couldn’t see your face or your body – just that you</i> were. <i>If that makes any sense.”</i> She frowns again, waving her fingers in front of herself. <i>“Anyway, point is, I’m totally blind again, so, kind of a moot point right now.”</i>");
	else output("<i>“That was so weird,”</i> she says, wriggling her fingers in front of her face, counting each one several times over. <i>“I... I could still see, but not in the same sense as I can see you right now. I saw...”</i> she stutters, gesturing to the whole of your body futilely, <i>“I saw</i> you. <i>You on a spiritual level. I dunno how to describe it. It was like I saw your ‘life;’ more than just a heartbeat and some memories. I saw mine, too, and we both got easier to see when we both came, like it was the most ‘alive’ we could be.”</i> She studies your face carefully, as if this was the last time she was ever going to see it again. <i>“I like being able to see more than that, though. I wouldn’t call it a good time.”</i>");

	output("\n\nYou tell her that, as interesting as it is to hear about her otherworldly experiences, you’re honestly more interested in what your mutual friend meant when it said she had something to tell you. <i>“Right!”</i> she answers, putting her hands on your shoulders. <i>“Okay, so, she and I had a pretty long talk after,”</i> she stops, tickling her fingers down your [pc.belly] and towards your crotch, <i>“this whole excitement. I know it didn’t seem like long, but, turns out, you can share ideas pretty quickly when you share the same mind. Anyway, to make a long story short, I said she can camp out in my head for as long as she wants.”</i>");

	output("\n\nYou reel in surprise. That was a decision you could just <i>make,</i> on the spot? <i>“It was actually my idea, believe it or not. She’s gone thirty long years without any companionship; without anyone to talk to or bond with; and, most importantly, at least to her, with no way to bust the nut she’s been edging ever since she died. So, I’m letting her stick around, on the following conditions.”</i>");

	output("\n\nShe raises her hand between you, lifting her fingers as she speaks. <i>“The first is that she only takes the wheel when I let her. Don’t get me wrong, me sprouting a dick spontaneously was a lot more fun than I thought it would be, but it’s still</i> my <i>body, and I’m not too keen on letting anyone make any changes to it, no matter how of a good time it’ll be in the end. I was pretty livid when she first took over, believe you me!”</i>");

	output("\n\nShe extends another finger. <i>“Second, even if I let her take control of my body, I’m still in charge of my own head. This way, my words are my own, so you don’t have to worry about negotiating who pitches and who catches with some spook you’ve known for four minutes.”</i>");

	output("\n\nShe extends her thumb. <i>“And finally, when she takes over, she’s only in it for the nut, then she’s gotta sit down until we let her out to play again. This one was actually pretty easy; she tells me that she’ll get as much fun out of sex whether she’s in charge or not, and us whipping out her dick is just the occasional bonus.”</i> Her hand gently trails down your form as she smiles lewdly. <i>“Not that any of us are going to complain, I’m sure.”</i>");

	output("\n\nYou ask her if this is wise. She’s possessed. Is she really okay with this? <i>“I trust her. Or, at least, I trust that she’s telling the truth. And besides,”</i> she continues giddily, <i>“you can’t lie, this is pretty exciting! All those horror movies led us to believe being possessed isn’t a good thing, but so far, it’s been nothing but fun and sexy. I’ll let you know if we ever need a young priest and an old priest.”</i>");

	output("\n\nShe slaps you on the [pc.ass] playfully as she hoists herself to her feet. <i>“Right!”</i> she sighs, stretching her limbs. <i>“");
	if(paigeBlind()) output("I’m sure this place is a nightmare to look at. We gotta get it all cleaned up before the morning rolls around and my students start showing up. Mind finding my pants for me?");
	else output("We gotta get to work cleaning this place up. It’s looking more ragged than a haunted house in here! I can’t let my students see all this!");
	output("”</i>");

	output("\n\n");
	//if {HSE3, 4, or 5}
	if(comeFrom == "HSE3" || comeFrom == "SSE4" || comeFrom == "SSE5") output("Your lower body aches rather harshly from the beating it’s taken. You tell Paige that you’ll... be a minute.");

	//[=End=]
	// end scene (scene: HSA2); reduce Lust to 0; if HSE2, add Cum Covered; if HSE3, 4, or 5, add Sore; advance clock to 08:00; place PC one square outside Paige’s Yoga Studio
	//processTime(40);
	if(hours < 8) processTime((8-hours)*60);
	else if(hours == 8) processTime(40);
	else processTime((24-hours+8)*60);
	// After the player has completed Paige’s Halloween event, add a button called [=Ghost=] to Paige’s sex menu.
	ghostSexWrapper(comeFrom);
}

//[=Ghost=]
// No requirements
// Tooltip: Ask Paige if she’s willing to let her dickgirl passenger take over this time.
// (scene: SSGI)
// Action Tree: https://i.imgur.com/zhokZ9W.png
public function paigeGhostGhost():void
{
	clearOutput();
	showPaige(true);
	paigeGhostFutaGo();
	author("B");
	output("You ask Paige if it’s alright if she lets the ghost riding shotgun with her out to play. Your mouth is already watering at the idea of Paige fucking you with that massive rod of hers.");
	output("\n\n<i>“Fiending for some of my hot sauce, are you, sweet thing?”</i> she says playfully, disengaging from your prone form. She’s soaked through her sweatpants, but the idea of getting a little extra to play with turns her on as much as you. <i>“I’m sure she’s just as eager to get some attention, too. Give us a second.”</i>");
	output("\n\nShe stands before you, her eyes shut lightly as she focuses on calling forth her spectral second-half. When she opens her eyes again, they’re glowing the same, ethereal green as before, illuminating the room like a nightlight. Then, a light, airy ‘whoosh’ passes through the room, and, just like that, Paige’s body transforms to take on the form of her poltergeist.");
	output("\n\n The fur on her tail elongates, fluffing it up spectacularly until the fur is almost as thick as her whole body. Her ears change their triangular shape, curving into smooth half-circles, facing towards you. Her muzzle shrinks down until it becomes a delightful, rounded button-nose, similar to a Kui-Tan. Her hair extends, going from neck-length to halfway down her back.");
	output("\n\nAnd, of course, between her legs, she sprouts a formidable, intimidating tent, and it only grows larger the longer you look at it. Before, her pants were damp with feminine arousal; now, she’s wet with her seeping precum, a bead of it slipping between the fabric.");
	output("\n\n<i>“Ah,”</i> Paige sighs once the transformation is complete. She looks at her body momentarily, checking herself over. <i>“Yep, everything seems to be in order.”</i> She pulls at the waistband of her pants, giving herself an eyeful of her own junk. <i>“Everything.”</i>");
	output("\n\nYou sit there, dumbfounded at the changes, but Paige takes the initiative and snaps you out of it by pressing the point of her new cock against your face. <i>“Feel like saying hello?”</i> she asks you sultrily.");
	output("\n\nDon’t mind if you do.");
	processTime(5);
	pc.changeLust(5);
	clearMenu();
	addButton(0,"Suckle",HSS1);
	addButton(1,"LowerPants",HSLP);
	//[=Suckle=][=LowerPants=]
	// end scene (scene: SSGI)
}