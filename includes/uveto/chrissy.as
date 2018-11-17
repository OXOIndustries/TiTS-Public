/* 
 * Chrissy the Half Kui-tan Hermgirl - https://docs.google.com/document/d/1nfZhrx7AJdRO5-0imSsyhDIVLrJHYhuMQgJSdigRnXI/edit
 * 
 * #Flags:
 * CHRISSY_MET		1 if met Chrissy, else undefined
 * CHRISSY_SEXED	0-infinity how many times you sexed Chrissy, undefined if never sexed
 * CHRISSY_ANAL		1 if put it in her bum, else undefined
 * CHRISSY_VAG		1 if pounded her pussy, else undefined
 * CHRISSY_RIDDEN	1 if ridden Chrissy's dick, else undefined
 * CHRISSY_GETFKD	1 if let her pound you, else undefined
 * 
 * SQ_ACTIVE_8888		Placeholder flag for if SyriQuest is active, Replace when SyriQuest is implemented, assumed undefined == syriQuest not started, 0 = syriQuest over, 1 = syriQuest active
 */

public function showChrissy(nude:Boolean = false):void
{
	showName("\nCHRISSY");
	showBust(chrissyBustDisplay(nude));
}

public function chrissyBustDisplay(nude:Boolean = false):String
{
	var sBust:String = "CHRISSY";
	if (nude) sBust += "_NUDE";
	return sBust;
}

public function getChrissyPregContainer():PregnancyPlaceholder
{
	var ppChrissy:PregnancyPlaceholder = new PregnancyPlaceholder();
	if(!ppChrissy.hasCock()) ppChrissy.createCock();
	ppChrissy.shiftCock(0, GLOBAL.TYPE_KUITAN);
	ppChrissy.cocks[0].cLengthRaw = 6;
	ppChrissy.cocks[0].cThicknessRatioRaw = 1.75;
	ppChrissy.balls = 2;
	ppChrissy.ballSizeRaw = 24;
	ppChrissy.createPerk("Fixed CumQ", 16000, 0, 0, 0);
	return ppChrissy;
}

public function chrissyAtBar():Boolean
{
	/* FEN NOTE: Disabled this. Having her disappear is dumb.
	if (flags["SQ_ACTIVE_8888"] == 1) return false;
	*/
	return true;
}

public function chrissyAtTheFreezer(btnSlot:int = 0):void
{
	if (flags["CHRISSY_MET"] == undefined)
	{ 
		output("\n\nLooking around, you can see a girl sitting all alone in her booth. She’s human-looking, but seems to be a half kui-tan, with her fuzzy, egg-shaped ears twitching, her eyes surrounded by a sleek tanuki mask made of darker skin, and a tail that’s just as big around as she is. ");
		if (pc.isBro()) output("Looks like a hot piece of ass.");
		else if (pc.isNice() || pc.isBimbo()) output("Maybe she could use some company.");
		else output("Maybe you could use your wiles on her and catch a quick lay.");
		
		addButton(btnSlot, "TanukiGirl", approachChrissy);
	}
	else
	{
		output("\n\nChrissy is at her usual spot, alone in her booth, either here to just relax or waiting for someone to make a move on her. She notices you [pc.walk] in and takes a break from her drink to smile and wave your way.");
		
		addButton(btnSlot, "Chrissy", approachChrissy);
	}
}

public function approachChrissy():void
{
	clearOutput();
	author("HugsAlright");
	showChrissy();
	clearMenu();
	
	if (flags["CHRISSY_MET"] == undefined)
	{
		flags["CHRISSY_MET"] = 1;
		output("Well, you’ve mulled over the idea enough and decide you’re going to head over to that lonely-looking tanuki girl.");
		output("\n\nYou start to stride your way over to her booth, and its lone occupant is quick to notice your approach, taking one last sip from the long straw in her glass before she turns towards you. A warm smile appears on the girl’s face as you close in, resting her head in the palm of her hand and letting her long, fluffy tail snake left and right across the floor of the bar.");
		output("\n\n<i>“Hey there,”</i> she calls out, following you with her gaze as you approach, <i>“I haven’t seen you around here before.”</i>");
		output("\n\nClosing in on the booth, your eyes are greeted by quite the bulge between the girl’s legs, leading you to the conclusion that she is most definitely a half kui-tan of some sort. You respond to the kui-girl’s query by telling the half-breed that you haven’t seen her around here either, finally taking a seat across from her at that table.");
		output("\n\nShe gives you a giggle in return before speaking again, <i>“Yeah, I’m new here, moved in not too long ago, so I guess that means we’re both new.”</i> She gives you a big grin, filled with genuine happiness at her discovery of you, <i>“I’m Chrissy.”</i>");
		output("\n\nGetting comfortable in your seat, you introduce yourself as “[pc.name]” and ask her why she moved out to this frozen moon.");
		if (!syriQuestComplete()) output("\n\n<i>“Oh,”</i> Chrissy stutters, straightening herself before leaning forward on the table, <i>“Well, there’s supposed to be a big video game tournament here soon, and I’m supposed to be in it!”</i> She says that with a bit of pride in her voice before settling down, <i>“I- I’m not the best, but people are really looking forward to seeing me here, so I got here, uh, a couple months earlier because I thought I’d need time to adjust to the cold or something... and I just really wanted to get off Terra for a bit, but it turns out I really like it here, so I moved in! It’s nice and quiet, and all those big, fluffy huskar just make for the best cuddlers.”</i>");
		else output("\n\n<i>“Oh,”</i> Chrissy stutters, straightening herself before leaning forward on the table, <i>“You know that big video game tournament that happened here? I was in that.”</i> She says that with a bit of pride in her voice before settling down, and looking a bit disappointed, <i>“I- I didn’t win, but it was fun! That and it turns out I really like it here, so I moved in. It’s nice and quiet, and all those big, fluffy huskar just make for the best cuddlers.”</i>");
		output("\n\nChrissy smiles, lost in her own thoughts for a moment before she turns her attention back to you, <i>“What about you, here for anything special?”</i> Finishing her question, she brings the straw in her brightly coloured drink between her dark lips and starts to suck, expecting you to answer.");
		output("\n\n");
		if (syriQuestComplete()) output("Leaning forward onto the table just like she is, you start to explain how you’re “friends” with one of the people who competed in that tournament she was in, causing the tanuki’s eyes to widen a bit before you continue your story. ");
		output("You tell her of your own personal journey, all those trials that brought you all the way out to this frozen moon, your ship, ");
		if (crewRecruited().length > 0)output("and the crew you’ve assembled. ");
		else output("and your solo flying adventures. ");
		output("Chrissy keeps her attention fixed on your story all the way through, seemingly enthralled as her tail sways unconsciously behind her. ");
		output("\n\n<i>“Neat!”</i> the tanuki exclaims, taking a break from her drink and smiling at you again, <i>“I don’t think I could be a spacer or rusher; I like sitting around and being comfy too much, but I like how a lot of people like you come around here, always got cool stories to tell.”</i> Chrissy’s hands tighten around her cup, padded fingers tapping on the glass, <i>“Speaking of, what brought you over to me?”</i>");
	}
	else
	{
		output("Chrissy takes notice of your approach and her demeanor immediately becomes more than a bit bubbly, with a call of <i>“Hey, [pc.name]!”</i> to welcome you as you finally sit down across from her at the table.");
		if (!syriQuestComplete()) output("\n\n<i>“Glad you came back,”</i> ");
		else output("\n\n<i>“I think I saw you out in the crowd during the tournament, hope I put on a good show!”</i> ");
		output("the tanuki-girl says with a wide smiles on her face, <i>“So, wanna chat, or go back to my place for a round or two?”</i>");
		output("\n\nYou cock an eyebrow at the clearly intended double-meaning of that last phrase, resulting in a playful giggle from the half kui-tan. She quickly settles down, resting her head in her hands and eagerly awaiting your answer.");
	}
	
	processTime(5 + rand(3));
	
	addButton(0, "Appearance", appearanceChrissy, undefined, "Appearance", "Take a look at Chrissy.");
	addButton(1, "Talk", talkChrissy, undefined, "Talk", "Learn a little about Chrissy from the tanuki-girl herself.");
	addButton(2, "Video Games", playChrissy, undefined, "Video Games", "She likes video games right? Maybe you could play some together.");
	if (pc.isTaur() || pc.isNaga()) addDisabledButton(3, "Sex", "Sex", "Not Naga or Taur compatible.")
	else if (pc.lust() < 33) addDisabledButton(3, "Sex", "Sex", "You aren’t turned on enough for this.")
	else addButton(3, "Sex", sexChrissy, undefined, "Sex", "Ask this cutie if she’d be down for a little fun.");
	
	addButton(14, "Leave", mainGameMenu);
}

public function appearanceChrissy():void
{
	clearOutput();
	author("HugsAlright");
	showChrissy();
	clearMenu();
	
	output("Chrissy is a very " + (silly ? "smol" : "short") + " girl, standing only about 5\' 1\", no doubt thanks to her kui-tan heritage. Wavy, chestnut hair surrounds her face, which is parted by two fuzzy, egg-shaped raccoon ears; her lovely locks flow down only a bit past her shoulder, helping to keep attention fixed on her face. The most prominent feature of her visage is that sleek tanuki mask around her big, deep-brown eyes, formed by a small area of much duskier flesh apart from her usually fair skin. Along with those attributes, her button nose and darkened lips give her a very cute, even innocent, appearance. ");
	if (silly) output("Though, that mask does make her look like quite the scoundrel, or B-movie villain.");
	output("\n\nHer striped, fluffy tail, which is just as long as she is tall, swishes and sways behind her constantly, distracting your eyes for a moment before they drift down to the pair of perky B-cups on her chest, each breast topped with a pert, pink nipple. Moving your gaze downward, you’re greeted with the sight of Chrissy’s svelte midsection, and her comparatively wide hips, along with her shapely butt: compact and squeezable, much like the half-breed herself.");
	output("\n\nThough, opposite her bottom rests her massive bulge, a sure sign of her kui-tan-package: big, fuzzy balls and a cute knotty cock, and past that is a dusky, almost bestial vagina, leaking femlube and ready to accept any knots or big cocks that come Chrissy’s way.");
	output("\n\nEvery once in a while you are able to get a glimpse at the soft, leather pads lining the kui-girl’s paw-like fingertips: soft, supple, and oh-so perfect for handjobs and groping. Both her legs and arms are covered with kui-tan floof, almost like an ausar... but a tanuki.");
	
	processTime(2 + rand(3));
	
	addButton(0, "Next", approachChrissy);
}

public function talkChrissy():void
{
	clearOutput();
	author("HugsAlright");
	showChrissy();
	clearMenu();
	
	output("<i>“Sure,”</i> the tanuki-girl says, leaning forward onto the table again, <i>“But I don’t know if I’ve got any stories that’ll top yours.”</i>");
	
	addButton(0, "Her", talkChrissyHer, undefined, "Her", "Ask the half-breed about herself.");
	addButton(1, "Family", talkChrissyFamily, undefined, "Family", "What’s Chrissy’s family like?");
	addButton(2, "Uveto", talkChrissyUveto, undefined, "Uveto", "Ask Chrissy what she thinks of her new home.");
	
	addButton(14, "Back", approachChrissy);
}

public function talkChrissyHer():void
{
	clearOutput();
	author("HugsAlright");
	showChrissy();
	clearMenu();
	
	output("<i>“Me?”</i> she asks, almost taken aback by your question, <i>“I think I already told you most of what there is about me. Well, not everything, I guess. I do video game things for a living, stream a lot, go to tournaments, that stuff. Maybe you’ve heard of me, " + (silly ? "TinyTanuki69" : "ChrissyCoon88") + "?”</i>");
	output("\n\nThe ‘nuki gives you a wide, almost prideful grin before you shake your head in response, informing her of your ignorance.");
	output("\n\n<i>“O-oh,”</i> Chrissy stutters, shifting uncomfortably in her place, <i>“Guess I should’ve expected that, probably busy with more important stuff like... flying ships... and stuff to worry about video games, huh?”</i>");
	output("\n\nThe girl looks a little down after that, her shoulders slumping and betraying her normally happy demeanor, prompting you to change the subject and ask her where she lived before her move to this frozen moon.");
	output("\n\n<i>“I was born on Earth, and I like to move around every now and then. I’m not a spacer, but I enjoy going to new places. Then moved to Tavros for a bit. It was a little too noisy and busy for me, so I went back to Terra. ");
	if (!syriQuestComplete()) output("Then I heard the tournament was gonna happen here so I came here early");
	else output("Then the tournament here on Uveto happened");
	output(", and after a few nights and a few huskar... I just really liked it here, so I moved in. Still likin’ it so far.”</i>");
	output("\n\nOnce Chrissy finished her tale of how she got to this moon, she sighs and leans back in her seat, staring at her drink for a moment before she turns to you again, <i>“Like I said, there’s not much you don’t already know, and I hope I don’t sound weird by saying this, but I like to be held, ya know? Feeling someone’s arms around you... covered in blankets until the sound of their breathing makes you fall asleep.”</i> As she’s explaining herself, the half-breed seems lost in her own thoughts, a clear bit of blush appearing on her cheeks until she pulls herself back to reality, when her cheeks get even more red. <i>“That’s not a weird thing to tell someone, r- right?”</i>");
	output("\n\nYou shake your head and tell Chrissy you’ve met people who are a lot more open about their desires than she is, and thank her for sharing that, resulting in a warm smile from the tanuki girl.");
	
	processTime(10 + rand(3));
	
	addDisabledButton(0, "Her");
	addButton(1, "Family", talkChrissyFamily, undefined, "Family", "What’s Chrissy’s family like?");
	addButton(2, "Uveto", talkChrissyUveto, undefined, "Uveto", "Ask Chrissy what she thinks of her new home.");
	
	addButton(14, "Back", approachChrissy);
}

public function talkChrissyFamily():void
{
	clearOutput();
	author("HugsAlright");
	showChrissy();
	clearMenu();
	
	output("<i>“There’s not much,”</i> Chrissy begins with a little shrug of her little shoulders, resting her hands on her drink, <i>“Just me, my mom, and my... uh, other mom.”</i> She chuckles for second, leaning forward with her head resting in one hand, and dawdling her glass with the other, <i>“I don’t know if you can tell or not, but I’m only </i>half<i> human. The other half is kui-tan. My mom is human, and my </i>other<i> mom, uh, ‘dad-mom’ is a kui-tan herm.”</i> With that said, your half-breed friend sighs halfheartedly, her back slouching a bit.");
	output("\n\nThat seems like a rather odd reaction to Chrissy simply explaining her parents to you, leading you to ask her what it was like growing up with them.");
	output("\n\nThe ‘nuki girl picks herself up, sitting straight for a moment and keeping herself from making eye contact with you as she stares into her glass, <i>“I mean... I love them to pieces. It’s just that sometimes I wish mom, mom-mom, could’ve been into dudes.”</i> She pauses and leans forward against the table, <i>“If you don’t know, kui-tan don’t have females, and can’t have girls as kids, just herms and guys. You can probably guess which one I got. It was just really, really weird growing up on Earth, surrounded by girls who didn’t have cocks. Just makes you feel a </i>little<i> self conscious about your body, you know?”</i>");
	output("\n\nWondering if Chrissy really has that much of a problem with her kui-tan biology, you ask her so, but you don’t think it bothers her that much, otherwise she would have more than likely modded those bits of her away.");
	output("\n\n<i>“I’m not as weirded out by it as I used to be,”</i> the kui-girl responds, picking herself up again, looking a bit more confident this time, <i>“I still don’t, you know, use it often, or care enough to get rid of those parts... I’m still kinda attached to ‘em. I don’t know why, but I always feel like people are bothered by it, probably just some leftovers from growing up on Earth, and all that stuff.”</i>");
	output("\n\nShe smirks after that, staring down into her drink, <i>“Feels pretty nice when you can cum from two spots at once, too.”</i> Though, once she says that she looks back at you and blood rushes to her face, turning her a bright red, <i>“Th- that... I shoulda kept that to myself, sorry.”</i>");
	output("\n\nYou tell Chrissy she doesn’t need to apologize and tell her you wouldn’t have asked if you weren’t expecting something like that to have been said.");
	
	processTime(10 + rand(3));
	
	addButton(0, "Her", talkChrissyHer, undefined, "Her", "Ask the half-breed about herself.");
	addDisabledButton(1, "Family");
	addButton(2, "Uveto", talkChrissyUveto, undefined, "Uveto", "Ask Chrissy what she thinks of her new home.");
	
	addButton(14, "Back", approachChrissy);
}

public function talkChrissyUveto():void
{
	clearOutput();
	author("HugsAlright");
	showChrissy();
	clearMenu();
	
	output("<i>“I like it a lot here!”</i> Chrissy exclaims with a big smile on her face, her voice filled with excitement and joy, <i>“Most people stay inside because of the cold so it’s pretty quiet around here, and that’s something I always look for when picking out a new home.”</i>");
	output("\n\nYou cock an eyebrow and tell her “quiet” doesn’t exactly sound like enough of a reason to move to one of the coldest places in the void. ");
	output("\n\nThe tanuki girl grins at the question, <i>“The cold is nice, gives me a reason to stay inside most of the time, or go to the bar and have a few drinks to warm up.”</i> Chrissy finishes that sentence with a giggle before picking up where she left of, <i>“Ever just listen to the wind at night and imagine how freezing it is out there? Makes being in bed feel that much better... that and it’s good weather for cuddling. Everything about this place just makes you feel so warm and cozy when you’re inside, and I </i>love<i> that, not to mention all the nice clothes I get to wear.”</i> With that, the half kui-tan grins wide and holds up her arms to reveal the rather-thick sweater she’s wearing over her small, svelte body.");
	output("\n\n<i>“And I don’t know if I mentioned this,”</i> Chrissy says, placing her arms back on the table, though, now her sleeves are falling over her hands, a sure sign that sweater is a couple sizes too-big, <i>“but, uh... I like huskar, a lot. I don’t want to sound like an airhead or anything when I say this, but they’re so fluffy and warm-looking. Every time I see one I just want them to give me a big hug and take me home and... well, you know... uh, sorry if I got carried away.”</i>");
	output("\n\nLeaning forward with a smirk on your face, you tell Chrissy that it sounds like she has a few more reasons than just drinks to come to the bar.");
	output("\n\n<i>“Well...”</i> she’s says with more than a hint of tentativeness, <i>“Not really... I’m not very good at asking people out or stuff like that. So I just sort’ve... do whatever, and sometimes people come up to me, which is nice, but I don’t go out of my way for sex... even if I did, I wouldn’t be very good at it because I just get so nervous when I have to go up to someone, which is weird because I’m perfectly fine when someone comes up to me. It’s just weird.”</i>");
	output("\n\nWell, looks like you made the right move by making the first move and [pc.walking] up to Chrissy’s booth" + (silly ? ", what a smoothy." : "."));
	
	processTime(10 + rand(3));
	
	addButton(0, "Her", talkChrissyHer, undefined, "Her", "Ask the half-breed about herself.");
	addButton(1, "Family", talkChrissyFamily, undefined, "Family", "What’s Chrissy’s family like?");
	addDisabledButton(2, "Uveto");
	
	addButton(14, "Back", approachChrissy);
}

public function playChrissy():void
{
	clearOutput();
	author("HugsAlright");
	showChrissy();
	clearMenu();
	
	output("Leaning forward in your seat, you put on a smile and ask Chrissy if the two of you could go back to her place and... play some " + (silly ? "vidya." : "video games."));
	output("\n\nHer face immediately lights up at that suggestion, her brown eyes suddenly filled with a long-lost joy and a big grin appearing on her face. <i>“Yeah! Let’s do it!”</i> the tanuki girl exclaims, standing up from her seat, <i>“I usually don’t ever get to play with anyone in real life anymore, almost everything I do is online.”</i> With that last sentence Chrissy finishes picking herself up and grabs a coat lying next to her, <i>“It’ll be nice to play with someone else next to me for a change.”</i>");
	output("\n\nThe kui-girl makes her way to the bar’s entrance, pulling her coat on, which ends up covering most of her body, and has the effect of turning her into a half kui-tan marshmallow, <i>“Let’s get going, then.”</i>");
	
	processTime(1 + rand(3));
	
	addButton(0, "Next", playChrissy2)
}

public function playChrissy2():void
{
	clearOutput();
	author("HugsAlright");
	showChrissy();
	clearMenu();
	
	output("Chrissy leads you through the cold, cold streets, keeping a close eye on you and wrapping her arms around herself in an attempt to stay warm until you finally reach her domicile. Opening the door, she invites you in, kicking some snow off her shoes as she goes to step inside behind you.");
	output("\n\nYou’re greeted with the warmth of artificial heating as you step through the door, and immediately feel a pleasant ease set upon you as you scan your surroundings. Your eyes are met with ");
	if (flags["CHRISSY_VIDYA"] == undefined) output("a rather comfortable sight: blankets strewn across cushy furniture, a computer desk complete with a PC and at least three monitors, some consoles placed under a holo-screen across from the couch, and a VR set-up that looks rather similar to the one at Burt’s bar. ");
	else output("the familiar sight of Chrissy’s home, filled with all her gaming equipment and just as cozy as ever. ");
	output("The place is a <i>bit</i> of a mess, with stray clothing lying around the floor, clearly left there by their tanuki owner.");
	output("\n\nEventually, you’re lead to the sofa resting in front of a large holo-screen. Chrissy sheds her coat and throws it onto an arm of the couch as she grabs a couple controllers from the floor.");
	output("\n\n<i>“Here...”</i> she says quietly, still smiling and handing you a controller labeled “Mad Dogz” before she plops herself down on the couch, patting the empty area next to her with an empty hand.");
	output("\n\nYou take the controller and the hint, taking a seat next to her as the holo-screen flips on, that same, big grin still on her face, beaming at all that’s happening. She quickly curls herself up against the arm of the sofa and picks up her own controller lying next to her; it looks a bit higher quality than the one she handed you.");
	output("\n\nOnly a few moments after the screen flicks on, you’re both playing your hearts out with the year’s latest shooter. It’s all very fast paced, and Chrissy is just as fast, to the point where you can almost feel that competitive side she must have flaring up as she downs you again, and again, and again. Though, in time you pick up your own pace, learning the pattern of the game and moving from place to place with your virtual head on a swivel and your reflexes on overdrive. Through it all, Chrissy laughs and smiles, simply enjoying the fact that she has someone to play with.");
	output("\n\nAs time passes, you both get a bit bored with the game like you’d expect, and decide to call it quits after a few rounds of fast-paced action. ");
	if (pc.reflexes() < (pc.reflexesMax() / 2)) output("You put up a good fight for sure, but Chrissy’s clear skill and practice with these types of games shows, and you ultimately lose.");
	else output("You and Chrissy are pretty evenly matched, with your quick reflexes and the half-breed’s honed skill with these types of games both put on display, but you ultimately come out on top.");
	output("\n\n<i>“Man, that was fun,”</i> Chrissy says, putting down her controller and standing up from the couch, taking a big stretch as she does so, <i>“");
	if (pc.reflexes() < (pc.reflexesMax() / 2)) output("Sorry if I got too competitive with it... it’s in my nature.");
	else output("You’re pretty good, haven’t gotten a workout like that " + (syriQuestComplete() ? "since the tournament!" : "for a while!"));
	output("”</i> She gives you a warm smile and points her thumb over her shoulder, <i>“Anyways, wanna head back to the bar?”</i>");
	
	IncrementFlag("CHRISSY_VIDYA");
	
	if ((pc.reflexes()/pc.reflexesMax()) < .80) pc.slowStatGain("reflexes", 1);
	
	if (flags["CHRISSY_VIDYA"] == 5){
		output("\n\n<b>You learned something from your play sessions with Chrissy</b>");
		if (pc.reflexes() < (pc.reflexesMax() / 2)) 
		{
		pc.createPerk("Rage Aim", 1, 50, 0, 0, "You get so mad when you’re losing, you gain +1 accuracy when you’re below 50% health.");
		output("\n(<b>Perk Gained: Rage Aim</b> - You get so mad when you’re losing, you gain +1 accuracy when you’re below 50% health.)");
		}
		else 
		{
		pc.createPerk("Calm Aim", 1, 50, 0, 0, "You’re a pretty good shot when things aren’t too hectic, so you gain +1 accuracy when above 50% health.");
		output("\n(<b>Perk Gained: Calm Aim</b> - You’re a pretty good shot when things aren’t too hectic, so you gain +1 accuracy when above 50% health.)");
		}
	}
	
	processTime(60 + rand(15));
	
	addButton(0, "Next", mainGameMenu);
}

public function sexChrissy():void
{
	clearOutput();
	author("HugsAlright");
	showChrissy();
	clearMenu();
	
	processTime(2 + rand(3));
	
	if (pc.tallness <= 61)
	{
		output("Putting on your most seductive grin, you ask this tanuki if she’d like head back to her place for a little fun with you, but all that you get is a rather apologetic look from Chrissy before she starts to explain herself.");
		output("\n\n<i>“Sorry, but...”</i> the half-breed begins, keeping her same remorseful look and slumping forward, <i>“You’re not really my type. It’s not anything to do with you! It’s just me being picky... I like people that are bigger than me is all, to hold me and stuff after we mash and bang or whatever.”</i>");
		output("\n\nChrissy gives you an unsure shrug and a nervous smile, ");
		if (pc.isNice() || pc.isMischievous() || pc.isBimbo()) output("but you tell her that’s fine, everyone has their tastes, after all.");
		else output("and you lean back in your seat, trying your best not to whisper “bitch” under your breath.");
		output("\n\n<b>Looks like you’ll need to be a bit taller to " + (silly ? "ride this coaster": "bed this half-breed") + ".</b>");
		
		addButton(0, "Next", approachChrissy);
		return;
	}
	
	output("Putting on your most seductive grin, you ask this tanuki if she’d be down for a little fun with you, and Chrissy gives you a lusty smile in return, as well as a good view of her reddening cheeks.");
	if (pc.race() == "huskar") output("\n\nThe half-breed’s eyes go wide at that suggestion, her deep-brown orbs traveling all over your frame, from your [pc.tail] to that floofy area around your neck, and all she can do is stammer out <i>“Y- yes, please,”</i> before she pulls herself together, ");
	else output("\n\n<i>“That sounds like fun,”</i> the half-breed begins, licking the last of her drink away from her darkened lips before going to stand up, ");
	output("<i>“We can head to my place, it’s not too far from here, but, uh...”</i> The kui-girl finishes picking herself up as her last sentence trails, grabbing a large coat sitting next to her before she gestures towards her crotch, drawing your attention to that immense bulge of hers, <i>“You don’t mind the whole me-having-a-dick thing, do you? I- I know some people are weirded out by it, is all.”</i>");
	if (flags["CHRISSY_SEXED"] == undefined) output("\n\nYou respond by telling Chrissy you wouldn’t have asked in the first place if you were bothered by it, and go to stand up from your seat.");
	else output("\n\nYou respond by telling Chrissy she’s asked this before and if you didn’t mind then you won’t mind now, and go to stand up from your seat.");
	output("\n\n<i>“Oh, yeah, that makes sense,”</i> the kui-girl says, sounding a bit embarrassed after that as she pulls her coat on, which ends up covering most of her body, and has the effect of turning her into a half kui-tan marshmallow, <i>“Let’s get going, then.”</i>");
	
	addButton(0, "Next", sexMenuChrissy);
}

public function sexMenuChrissy():void
{
	clearOutput();
	author("HugsAlright");
	showChrissy();
	clearMenu();
	
	output("Chrissy leads you through the cold, cold streets, keeping a close eye on you and wrapping her arms around herself in an attempt to stay warm until you finally reach her domicile. Opening the door, she invites you in, kicking some snow off her shoes as she goes to step inside along with you.");
	output("\n\nYou’re greeted with the warmth of artificial heating as you step through the door, and immediately feel a pleasant ease set upon you as you scan your surroundings. Your eyes are met with ");
	if (flags["CHRISSY_SEXED"] == undefined) output("a rather comfortable sight: blankets strewn across cushy furniture, a computer desk complete with a PC and at least three monitors, some consoles placed under a holo-screen across from the couch, and a VR set-up that looks rather similar to the one at Burt’s bar. ");
	else output("the familiar sight of Chrissy’s home, filled with all her gaming equipment and just as cozy as ever. ");
	output("The place is a <i>bit</i> of a mess, with stray clothing lying around the floor, clearly left there by their tanuki owner.");
	output("\n\nEventually, Chrissy leads you to her bed, shedding her coat along the way before she turns around to face you, rocking back and forth on her heels, <i>“So, uh, what do you wanna do?”</i>");
	
	IncrementFlag("CHRISSY_SEXED");
	
	if (pc.hasCock()) addButton(0, "ButtFuck", buttFuckChrissy, undefined, "Butt Fuck", "Put your cock up Chrissy’s booty.");
	else addDisabledButton(0, "ButtFuck", "Butt Fuck", "You must have a cock for this scene.")
	
	if (pc.hasCock()) addButton(1, "VagFuck", vagFuckChrissy, undefined, "Vag Fuck", "Lay the tanuki down and fuck her pussy.");
	else addDisabledButton(1, "VagFuck", "Vag Fuck", "You must have a cock for this scene.")
	
	addButton(2, "RideCock", rideChrissy, undefined, "Ride Cock", "Take this half-breed’s knotty xeno-cock for a spin.");
	
	if (flags["CHRISSY_RIDDEN"] != undefined) addButton(3, "GetFucked", getFuckedChrissy, undefined, "Get Fucked", "Lay down and let Chrissy take things at her own speed.");
	else addDisabledButton(3, "GetFucked", "Get Fucked", "Must have ridden Chrissy for this scene.");
}

public function buttFuckChrissy():void
{
	clearOutput();
	author("HugsAlright");
	showChrissy(true);
	clearMenu();
	
	output("With a smirk, you step closer to your soon-to-be lover and reach down for the hem of her too-big sweater, and start to pull up, resulting in a stuttering breath from the tiny half-breed. Chrissy’s face turns a deep shade of red as the garment is pulled over her head and her pert B-cups are revealed, making her chestnut locks fall down around her face. Similarly, after tossing Chrissy’s sweater aside, you grab at the tanuki girl’s pants and start to work them downwards. She’s happy to assist, wiggling her hips and blushing redder than a zel’rahn at a stripclub, seeming to enjoy the experience of being stripped like this. As her pants pop over her round, full, fuzzy balls, you can already see her thrice-knotted cock appearing from its sheath, swiftly stiffening as you eye its owner’s bare body.");
	output("\n\nChrissy steps out of her pants as they finally come all the way down, her face flushed as red as it can possibly get. ");
	if (!pc.isNude()) output("With this seemingly subby tanuki good and nude, you figure you better get yourself undressed as well, and start to strip yourself of your [pc.gear] while your half-breed friend watches with great attention. ");
	output("Now that you’re both bare as can be, you take hold of Chrissy’s svelte shoulders, releasing a little gasp from the girl before you sit the two of you down on the bed. She stares at you for a long moment, her breathing labored even before things can get started, and from the looks of her balls, she’s a little pent-up. Maybe a good prostate-milking is in order.");
	output("\n\nSmiling at your own thoughts, you pull the tiny tanuki towards you and press your lips to hers, trapping her in a kiss that draws a pleasurable sigh from the half-breed, practically melting her in your arms. She lets your [pc.tongue] slip into her mouth, and throws her arms around you in a fit of lust, pulling herself into you, to the point where you can feel her xeno-cock pressing against your [pc.stomach].");
	output("\n\nThe kui-girl’s eagerness makes you smile, and leads you to break the kiss so you can look at her face, all filled with desire as a trail of crystal-clear saliva is left between your lips.");
	output("\n\nKeeping a grin on your face, you ask Chrissy if she’s up for ");
	if (pc.isNice() || pc.isMischievous()) output("a little backdoor fun");
	else output("a dick in her squeezable butt");
	output(", stroking her cheek with your thumb. ");
	if (flags["CHRISSY_ANAL"] == undefined) output("\n\n<i>“I- I guess,”</i> Chrissy stutters, breathing heavy, her knotty cock still rock-solid, <i>“I’ve never really had anything up there besides toys. I can try though, if you want.”</i>");
	else output("\n\n<i>“Y- yeah, sure,”</i> Chrissy stutters, still breathing heavy and her knotty cock still rock-solid, <i>“The last time was pretty fun...”</i>");
	output("\n\nYou tell the nervous ‘nuki that sounds fine to you, and slowly slide a hand down to her supple assflesh as it sits on the bed, trailing your fingers along her thighs. ");
	output("\n\nBefore she can lose herself again, Chrissy exclaims <i>“Oh, wait!”</i> and quickly reaches over to the nearby nightstand, opens its highest drawer, pulls out a small bottle of what you guess to be lube, and hands it to you, still in your arms the whole time, <i>“You’re gonna get me ready first, right?”</i>");
	output("\n\nSmiling, you tell the half-breed to stand up and turn around for you, resulting in a big, lusty grin from her before she picks herself up from your grasp, still blushing quite a bit. With only a little more movement, Chrissy is in front of you and almost has her compact, squeezable butt right on your lap, fluffy tail brushing along your thighs. You lick your lips at what you’re presented with, but before you can sink your rapidly stiffening [pc.cockNounBiggest] into this little tanuki’s booty, you’ll need to get her prepared. ");
	output("\n\nPopping open the bottle in your hand, you smear a little lube onto your fingers, and then grab at Chrissy’s ass, spreading those cheeks and moving her striped tail to get a good view of her tight tailhole. Grinning at the sight, you bring the bottle of lube up to her pucker and dispense a big glob of the clear liquid onto it, making the poor kui-girl shiver and shudder as she’s met with the cold of the slippery goo. Now to work it in; you take a single finger and place it to Chrissy’s winking entrance, resulting in an audible gasp from the girl, her body tenses up before she realizes what it is pressed against her ass and quickly relaxes. You start to apply a little pressure, and Chrissy whines in response, but your already lubed-up finger easily slips into the girl’s tailhole, spreading her just a bit with a whimper of pleasure and pain. Once your digit is fully inserted, you start to move it in and out of your tanuki lover’s tight hole, working in that lube until she starts to moan softly.");
	output("\n\n<i>“S- sorry if I’m too noisy,”</i> Chrissy says shakily, your finger still lodged in her pucker, <i>“It’s just- ah! I’m a little sensitive back there.”</i>");
	output("\n\nWell, she’s practically asking you to fuck her ass now.");
	output("\n\nYou feel like you’ve gotten the kui-girl’s pucker slippery enough to the point where you can ease your [pc.cockBiggest] into her with little effort and withdraw your finger from her, pulling a shuddering breath from between her dark lips. She looks over her shoulder at you in response to the sudden emptiness and smiles, clearly awaiting what you have to give her. You return her grin and place your hand on one of her wide hips, while you take hold of your cock with the other. Giving it a few strokes, you coat your shaft with the lubricants left on your fingers, simultaneously lining it up with her slightly-gaped hole. With a little force, you pull Chrissy down, oh-so gently until your [pc.cockHeadBiggest] is pressed against her pucker, leaving the tanuki in your lap to squirm with anticipation. Giving her hip an affirming little rub, you give the half-breed what she wants and push her down onto your turgid shaft, your cockhead easily spreading her lubed-up asshole with a little cry of pleasure.");
	output("\n\nYou don’t let up and continue to aid Chrissy’s descent onto your [pc.cockBiggest], guiding her down until she starts to move on her own. With your help, the tanuki pushes herself onto your turgid cock to spread herself even wider, keeping a steady pace and savoring the penetration. With all that lube you applied, your [pc.cockNounBiggest] just glides into her. Chrissy whimpers and whines all the way down, reaching a hand back to grab at yours, caressing your [pc.skinFurScales] with her padded fingers until you’ve buried yourself to the " + (pc.hasKnot() ? "knot" : "hilt") + " inside her.");
	
	pc.cockChange();
	
	output("\n\nChrissy is left with her small chest heaving and her asshole spasming around your [pc.cockBiggest] as she moans gently, sitting there in your lap while she adjusts to the length spreading her wide. Looking over her shoulder, you can see the tanuki girl’s extra-knotty xeno-dick twitch with need, leaking pre all over its owner as her prostate is milked by the tumescent rod inside her. ");
	if (pc.isNice()) output("Seeing the poor girl in need leads you to ");
	else output(" Seeing an opportunity to tease this poor girl that’s too good to pass up, you ");
	output("reach a hand around Chrissy’s slim waist, and quickly take hold of her cum-leaking, alien shaft. She gasps when your fingers wrap around all her knots, jumping enough to make her cock dispense a big glob of pre onto her shapely thighs before she settles down again.");
	output("\n\n<i>“I- I, ah!”</i> the half-breed manages to stammer out, gently moving her hips with your [pc.cockBiggest] stuck inside her, <i>“I think I’m okay if you start moving.”</i>");
	output("\n\nThat’s all the invitation you could ever need. ");
	output("\n\nWith her kui-tan dong still in your hand, you start to stroke it, gently jerking her off. At the same time, you start to rock your hips, drawing your cock in and out of her stretching, lubed-up tailhole. planning to take it slow, at least for now. Immediately, Chrissy starts moaning, letting loose cry of pleasure after cry of pleasure, announcing her bliss to you with every flick of your wrist and movement of your [pc.hips]. This tanuki wasn’t lying about being sensitive down there; that’s for sure.");
	output("\n\nSoon you fall into a steady rhythm of thrusting your [pc.hips] up into your lover’s ass, steadily jerking the half-breed off while your dick glides in and out of her gaping pucker, but with lust burning in your loins, you feel the need to pick up the pace. You gradually speed up, bouncing Chrissy in your lap and stroking her utterly-alien dick, letting her asshole squeeze at your [pc.cockBiggest] until the kui-girl is just a fountain of pre-cum, leaking her bounty onto her own lap and all over your hand. You groan in bliss as her inner walls caress your cock, losing yourself as you hump away at Chrissy’s continuously jiggling rear. Closing your eyes, you let yourself slip away until all you can hear are Chrissy’s ceaseless cries and all you can feel is her sliding up and down your shaft and her creamy alabaster trickle down your digits.");
	output("\n\nSo enthralled by your own pleasure, you hardly notice the kui-girl’s orgasms beginning; she lets loose a long, lusty moan that rings in your ears and sends a shiver of want down your spine. You feel her xeno-cock spasm in your hand, each of her knots inflating as she dispenses her tremendous load all over your fingers and all over herself, her massive sack emptying. At the same time, her pucker clamps down around your [pc.cockBiggest], convulsing like the tiny tanuki is trying to milk you, pulling you closer and closer to your edge.");
	if (pc.hasKnot()) output("\n\nWithout a moment to lose, you slam your [pc.hips] skyward, sending your turgid knot right into Chrissy’s spasming tailhole, spreading it as wide as it will stretch and drawing a renewed chorus of pleasured tones from the girl before the turgid ball of cockflesh finally slips in, locking the two of you together. ");
	else output("\n\nWith your orgasm building, you slam your [pc.hips] skyward, burying your turgid shaft inside of Chrissy and drawing a renewed chorus of pleasured tones from the girl. ");
	output("\n\nYou can already feel your climax welling in your loins, and there’s nothing you can do to stop it. Your willpower slips away like it was never there, allowing your orgasm to begin as bliss fills your body. ");
	if (pc.cumQ() >= 2000) output("Your [pc.cockBiggest] spasms inside your lover, leaking [pc.cum] into her depths until she whimpers, feeling your molten heat fill her. With a load just as voluminous as hers, Chrissy starts to whine as the pressure of your [pc.cumNoun] builds, swelling her stomach until she’s looking good, round, and full of your seed. ");
	else output("Your [pc.cockBiggest] spasms inside your lover, leaking [pc.cum] into her depths until she whimpers, feeling your molten heat fill her. You paint her inner walls [pc.cumColor] as your climax continues, making Chrissy whimper and whine as she’s utterly filled with your seed. ");
	output("You ride out the bliss of your orgasm to the very end, even as your lover’s climax starts to decline, giving Chrissy’s bottom a few last jerky thrusts and her xeno-shaft a couple strokes with your cum-coated hand. ");
	output("\n\nYou’re both left tired and spent after all that, with your lover’s B-cups heaving gently with each labored breath she takes, thoroughly covered in her own spooge, and filled with yours. Barely able to hold yourself up, you fall backwards onto the bed with Chrissy atop you, your slowy softening cock still left twitching inside her.");
	output("\n\n<i>“That... that was nice...”</i> the tired tanuki manages to tell you between each rise and fall of her chest, <i>“But this... this is the best part.”</i>");
	output("\n\nWith that, the half-breed manages to reach for some blankets and pulls them over the both of you, smiling happily. You grin at Chrissy’s eagerness for some cuddling and wrap your arms around her " + (pc.cumQ() >= 2000 ? "swollen" : "") + "stomach, holding her close, letting her settle into your embrace as you’re covered in warm, warm blankets to stave off the cold of Uveto. Chrissy coos happily as you hold her, turning her head to the side and nuzzling her cheek against your [pc.chest]. You can feel the kui-girl’s hands grasp at yours, rubbing the supple padding of her thumbs against your [pc.skinFurScales] until she’s fast asleep. The kui-girl’s gentle breathing and warm presence make you feel more tired than you already were... yeah, you think you could go for a bit of sleep now, but no doubt you’ll have to get moving when you’re up again.");
	
	IncrementFlag("CHRISSY_ANAL");
	
	processTime(60 + rand(60));
	
	pc.orgasm();
	
	addButton(0, "Next", mainGameMenu);
}

public function vagFuckChrissy():void
{
	clearOutput();
	author("HugsAlright");
	showChrissy(true);
	clearMenu();
	
	output("With a smirk, you step closer to your soon-to-be lover, reach down for the hem of her too-big sweater, and start to pull up, resulting in a stuttering breath from the tiny half-breed. Chrissy’s face turns a deep shade of red as the garment is pulled over her head and her pert B-cups are revealed, making her chestnut locks fall down around her face. Similarly, after tossing Chrissy’s sweater aside, you grab at the tanuki girl’s pants and start to work them downwards. She’s happy to assist, wiggling her hips and blushing redder than a zel’rahn at a stripclub, seeming to enjoy the experience of being stripped like this. As her pants pop over her round, full, fuzzy balls, you can already see her thrice-knotted cock appearing from its sheath, swiftly stiffening as you eye its owner’s bare body.");
	if (!pc.isNude()) output("\n\nWith Chrissy good and nude, you figure you better get yourself undressed as well, and start to strip yourself of your [pc.gear] while your half-breed friend watches with great attention.");
	output("\n\nThe seemingly subby tanuki takes the initiative and a few steps towards you, bringing her arms to wrap around the back of your neck and pull you down as best she can into a kiss. Chrissy’s whole body visibly shudders when your [pc.lipsChaste] connect with hers, leaving her to shiver in the bliss of the moment. Though, that kiss quickly becomes more fervent, and soon you find your tongues worming their ways into each others mouths, slipping and sliding across one another in an act of oral-passion.");
	output("\n\nYou can feel your lust - and your [pc.cocks] - growing, urging you to move onward, and bury your stiffening tool deep inside this half-breed’s alien snatch. Aiming to make these thoughts a reality, you reach down and grab Chrissy by her slim waist, hoisting her upwards before dropping her onto the bed with a little yelp from the kui-girl before you follow her right down onto the mattress. You find yourself pressed into Chrissy as she throws her arms around you once more, pulling you close as your kiss begins again, with the tanuki’s knotted shaft pressing hotly against your [pc.stomach]. Just as you’re settling into the half-breed’s embrace, her legs suddenly wrap around your waist, almost instinctively, begging to be bred as her thighs caress your back and sides with their warm flesh.");
	output("\n\nBetween long, tongue filled kisses, Chrissy starts to moan her desires to you, bringing renewed blush to her cheeks. <i>“P- please,”</i> she stutters before she finds her mouth filled with [pc.tongue] again, <i>“I want it.”</i>");
	output("\n\nWith that, she’s wiggling her ample hips, doing her best to line her already sopping cunt up with your [pc.cockHeadBiggest], clearly eager for a good fucking and a cock between her lower lips. You smile amidst the flurry of smooches you’re receiving and break your kiss, pulling back to look at Chrissy’s hungry gaze, watching her labored breaths, simply displaying that ache to have you fuck her.");
	output("\n\nKeeping that smirk on your face, you pull back, rising to you knees with your lover’s legs still wrapped around your back, keeping you and your [pc.cockBiggest] close. You take hold of the girl’s plush thighs and angle them forward, lifting her rump off the sheets just slightly and allowing her big ol’ balls and knotty xeno-cock to fall onto her tummy. Chrissy stares up at you lustfully in response to the sudden change in position, her tongue nearly lolling from her mouth as you hold her there. Giving her thigh an affectionate little rub, you take hold of your already rock-hard shaft and line it up with the Chrissy’s kui-cunt. She’s already wet as can be, leaking bead after bead of stray girlcum onto the mattress, clearly eager for the fucking you intend to give her.");
	
	pc.cockChange();
	
	output("\n\nNot one to keep such a cute, subby raccoon-girl waiting, you rock your hips forward until your [pc.cockHeadBiggest] is gently pressing against her sopping, dusky folds. Chrissy gasps when your tip makes contact with her the drooling lips of her pussy, coating it in her slick fluids while she lies there, wiggling and squirming with an unmatched anticipation. With a little added pressure behind your hips, your tip penetrates Chrissy’s lower lips, causing the kui-girl to whimper and bring a finger to her mouth for her to bite on, trying to quell the pleasure of your penetration. Unable to contain herself, the tiny tanuki beneath you cries out in pleasure as you saw more and more of your [pc.cockBiggest] into her, spreading her dusky folds wide.");
	output("\n\nBy the time your turgid shaft is buried to the " + (pc.hasKnot() ? "knot" : "hilt") + " inside Chrissy, she’s left panting and gasping with constant bliss with each minute movement of your man meat. You can feel her inner walls hugging and clenching around your grool-covered tool, begging for the release of orgasm, striving to gain any bit of pleasure from rubbing against your cockflesh. Planning to give the half-breed what she needs, you tighten your grip on Chrissy’s plush thighs and start to pull out of the girl, tearing a shuddering breath from her lips. The tiny tanuki wiggles and squirms in your grasp when she’s left so woefully empty, your [pc.cockHeadBiggest] left holding her sopping nether lips open.");
	output("\n\nYou smile down at the sight of Chrissy so needy for cock and start to rock your [pc.hips] forward again, sending your [pc.cockBiggest] right back into your lover’s kui-cunt with a cry of pleasure from both parties involved. Alien pussy squeezes at and caress your cockflesh, its owner’s ceaseless moans filling the space around you as fem-lube pours out around your base before you repeat the same motion. Soon, you have the big-balled tanuki leaking pre onto herself with each steady movement of your [pc.hips], setting her groaning and gasping with the excitement of your love-making.");
	output("\n\nYou don’t let up and start to move faster, vigorously fucking Chrissy’s stretching cunt until her breast, balls, and extra-knotty dick are all bobbing and bouncing in a rhythmic, hypnotic motion. Your mind starts to slip as you pound away at your lover, watching her rock back and forth on the mattress, lust claiming your senses and your grip on Chrissy’s thighs tightening.");
	output("\n\nYour hammering hips quickly become too much for your half-breed lover; with a loud cry of pleasure and sudden tightness around your [pc.cockBiggest], Chrissy’s orgasm most certainly begins. You’re treated to a show of the small kui-girl tensing and shivering with release, her knotty xeno-cock spasming as her huge sack empties all over her belly and tight chest, coating her with her own salty alabaster.");
	output("\n\nWith Chrissy’s cunt milking and squeezing at your cock, you feel a familiar uncomfortableness growing in your crotch, and start to roll your sides faster, your lover still moaning under you with each movement of your shaft across her sensitive pussy lips. ");
	if (pc.hasKnot()) output("This girl was <i>made</i> for taking knots, and you plan on giving her one. You slam your [pc.hips] forward one final time, putting all the force you can muster behind one powerful thrust. Chrissy lets loose a new chorus of pleasured tones when your swollen breeder’s knob makes contact with her puffy folds. The obscene ball of cockflesh forces her to stretch even wider as her orgasm persists, spreading her knot-taking pussy even wider until your [pc.knot] pops into her with little more than a whimper from the kui-girl. Now that you’re well and tied to Chrissy, you allow your willpower to slip away and your orgasm to begin. ");
	else output("You slam your [pc.hips] forward one final time, putting all the force you can muster behind one powerful thrust. Chrissy lets loose a new chorus of pleasured tones when you bury your [pc.cockBiggest] deep inside her, back arching as the bliss of her climax is extended. Now that you’re well and inside Chrissy, you allow your willpower to slip away and your orgasm to begin.");
	if (pc.cumQ() >= 2000)
	{
		output("\n\nHeralded by a low groan from yourself, [pc.cum] floods your lover’s womb, the sudden heat making her cry out again, even as she’s basted with her own seed. Chrissy whimpers as the pressure of your tremendous load builds inside her, swelling her flat tummy until it’s looking good and round, ");
		if (pc.hasKnot()) output("your hot [pc.cumNoun] kept secure inside her by your turgid knot.");
		else output("excess [pc.cumNoun] left to dribble out from her sodden nether lips.");
	}
	else
	{
		output("\n\nHeralded by a low groan from yourself, [pc.cum] floods your lover’s womb, the sudden heat making her cry out again, even as she’s basted with her own seed. Chrissy’s pussy eagerly accepts all the baby-batter you have to offer, moaning and shivering until she’s good and full, ");
		if (pc.hasKnot()) output("your hot [pc.cumNoun] kept secure inside her by your turgid knot.");
		else output("excess [pc.cumNoun] left to dribble out from her sodden nether lips.");
	}
	if (pc.hasKnot()) output("\n\nLooking down at your spunk-covered, cum-filled alien lover, you can see she’s pretty well spent, with her small chest heaving, her softening cock twitching every now and then, and her balls emptied to the point of being a relatively human size. You fall forward onto the tired half-breed, releasing your grip on her thighs, which quickly wrap around your back, along with the kui-girls slender arms. She holds you tight, enjoying the embrace of her lover and cooing happily as she nuzzles her head against your [pc.chest]. You smile at the gesture and roll the two of you over on your sides. Doing your best to return the cuddle, you wrap your arms around the small of her back, allowing one of your hands to caress her chestnut locks.");
	else 
	{
		output("\n\nLooking down at your spunk-covered, cum-filled alien lover, you can see she’s pretty well spent, with her small chest heaving, her softening cock twitching every now and then, and her balls emptied to the point of being a relatively human size. With some reluctance, you pull out of Chrissy, leaving her to shudder as she’s emptied and [pc.cum] to dribble out onto her sheets.");
		output("\n\nReleasing your grip on your lover’s thighs, you go to pick yourself up, only to have the kui-girl interrupted you with a slightly-worried <i>“Wait!”</i>");
		output("\n\nYou look down at her, seeing her holding herself and seeming a little disheartened. <i>“You’re not gonna, you know, hold me for a bit?”</i> she asks, looking up at you with big, needy eyes.");
		if (pc.isAss())output("\n\nGiving your own eyes a good roll, you bring yourself down to the mattress on top of Chrissy, who seems simply ecstatic at your change of heart. ");
		else output("\n\nSmiling, you bring yourself down to the mattress on top of Chrissy, who seems simply ecstatic at your change of heart. ");
		output("The half-breed quickly throws her arms and legs around your back, holding you tight, enjoying the embrace of her lover and cooing happily as she nuzzles her head against your [pc.chest]. You smile at the gesture and roll the two of you over on your sides, doing your best to return the cuddle and wrapping your arms around the small of her back, allowing one of your hands to caress her chestnut locks. ");
	}
	output("\n\n<i>“That was great,”</i> Chrissy manages to tell you, her voice still shaking with the remnants of your love-making.");
	output("\n\nSoon, though, the tiny tanuki’s shaky voice and breathing fade into a pleasurable silence as her breasts gently heave against you, letting you know the girl is fast asleep. You’ll enjoy the post-coital snuggle while it last, but no doubt you’ll have to get moving again once you wake.");
	
	IncrementFlag("CHRISSY_VAG");
	
	processTime(60 + rand(60));
	
	pc.orgasm();
	
	addButton(0, "Next", mainGameMenu);
}

public function rideChrissy():void
{
	clearOutput();
	author("HugsAlright");
	showChrissy(true);
	clearMenu();
	
	var ppChrissy:PregnancyPlaceholder = getChrissyPregContainer();
	var vagIdx:int = -1;
	if(pc.hasVagina()) vagIdx = pc.pickUnblocked();
	
	output("With a smirk, you step closer to your soon-to-be lover, reach down for the hem of her too-big sweater, and start to pull up, resulting in a stuttering breath from the tiny half-breed. Chrissy’s face turns a deep shade of red as the garment is pulled over her head and her pert B-cups are revealed, making her chestnut locks fall down around her face. Similarly, after tossing Chrissy’s sweater aside, you grab at the tanuki girl’s pants and start to work them downwards. She’s happy to assist, wiggling her hips and blushing redder than a zel’rahn at a stripclub, seeming to enjoy the experience of being stripped like this. As her pants pop over her round, full, fuzzy balls, you can already see her thrice-knotted cock appearing from its sheath, swiftly stiffening as you eye its owner’s bare body.");
	output("\n\nGazing at the veritable smorgasbord of sexual delights your lover has on offer, you find your [pc.eyes] drifting towards her alien cock. It’s not very big, only about six inches by your guess, but oh-so girthy, and all those knots lining it along with that heart-shaped, tapered tip make it look quite exotic. You can just picture it spreading your [pc.vagOrAss " + vagIdx + "] and feeling that knot take you as you ride this tiny half-breed.");
	output("\n\nTearing your gaze from her twitching shaft and incredibly full, fuzzy balls, you instead grab at Chrissy’s shoulders, and push her onto the bed with a yelp of surprise. Without giving the kui-girl a moment to catch her breath, you climb atop her, straddling her ample hips and looking to see your lover with more than a bit of blush on her cheeks as you scan her body. ");
	if (!pc.isNude()) output("Keeping Chrissy pinned between your [pc.thighs], you strip yourself of your [pc.gear] before returning to the matter at hand once more: her stiffened, pre-leaking xeno-dick. ");
	output("With no intention of <i>not</i> having this tanuki’s cock inside your [pc.vagOrAss " + vagIdx + "], you rock your hips back to the point where you can use Chrissy’s big, squishy balls as a comfortable cushion for your [pc.ass], and subsequently pin her cock between your " + (vagIdx >= 0 ? "pussy lips" : "bare crotch") + " and her flat tummy.");
	output("\n\nThe half-breed is quick to realize what’s about to happen when you begin to roll your [pc.hips], grinding her knotted tool against your " + (vagIdx >= 0 ? "wet, cock hungry cunt" : "crotch") + ".");
	output("\n\n<i>“Aww, you want </i>that<i>?”</i> she whines, looking a bit saddened that she won’t be getting anything between her own legs today.");
	output("\n\nYou nod in response, grinning wide and lustfully, prompting Chrissy to shift uncomfortably beneath you.");
	output("\n\n<i>“Just... just go slow, okay? I’m not used to this kind of thing,”</i> is all she can say, giving her body to do with what you please.");
	output("\n\nEcstatic at the kui-girl’s agreement, and already fairly work-up from her knots rubbing on your " + (vagIdx >= 0 ? "lower lips" : "nether regions") + ", you pick yourself up off her body with a shuddering breath. You rise to your knees and take hold of Chrissy’s cock, drawing a pleasured gasp from the tiny tanuki as you angle it towards your [pc.vagOrAss " + vagIdx + "]. The half-breed under you squirms and wiggles in her place when her tapered tip meets your sodden hole, leaving you to smile down at her anticipation, and begin your trip down onto her cock.");
	output("\n\nYou push down, applying a little pressure to your hips until Chrissy’s cockhead penetrates your [pc.vagOrAss " + vagIdx + "] with little more than a whimper from you. Barely giving yourself time to adjust, you continue your descent down your lover’s alien shaft, letting it spread you wide and your inner walls hug at her length. Both of her smaller knots pop into you with satisfying slowness, teasing you with a taste of what’s to come once you reach that thick, round breeder’s knob at her base. Finally bottoming out with that big ball of cockflesh pressed against and just ever-so gently stretching your " + (vagIdx >= 0 ? "grool-leaking nether lips" : "[pc.asshole]") + ", you let out a contented, lustful sigh.");
	
	if(vagIdx >= 0) pc.cuntChange(vagIdx, ppChrissy.cockVolume(0));
	else pc.buttChange(ppChrissy.cockVolume(0));
	
	output("\n\nLooking down at Chrissy, you can see her barely-restrained pleasure, squirming and moaning quietly, while managing to stifle a few of her more needy groans. With need growing in your loins, you start to rock your hips, gently rubbing your lover’s smaller knots against your inner walls, setting the both of you moaning, and Chrissy shivering with a rather unfamiliar or forgotten pleasure. The kui-girl’s fists tighten as you ride her, back arching and toes curling as she tries to contain her herself under the weight of your gently-rocking sides.");
	output("\n\nBefore too long, you find yourself speeding up in an attempt to speed yourself to orgasm, using her plush sack like a cushiony seat to aid your grinding hips, warm pre-cum leaking into you. Unfortunately, it seems Chrissy is quite a bit closer to her own edge.");
	output("\n\n<i>“S- slow down,”</i> she quivers with another pump of your [pc.hips], <i>“I- I’m not gonna last m- much longer if you keep- AH!”</i>");
	output("\n\nWith that, you feel the tanuki’s smaller knots inflate against your [pc.vagOrAss " + vagIdx + "], causing you to gasp as her cock spasms inside you and the first shot of her creamy, virile ‘nuki spunk fills your " + (vagIdx >= 0 ? "womb" : "depths") + ". Quick to realize your half-breed friend’s orgasm is beginning, you slam your hips downward, driving her big, girthy breeder’s knob into you with a moan and a satisfying <i>pop</i>. Chrissy whimpers pitifully and shivers with bliss as her orgasm continues, her massive sack emptying into you until her seed swells your [pc.stomach] and paints your inner walls the most vibrant shade of white. You attempt to grind your way along to your own peak, but find yourself at a loss as your lover’s own climax comes to an end, leaving your " + (vagIdx >= 0 ? "womb" : "gut") + " filled with kui-tan cream, Chrissy’s cock soft, and you woefully unfulfilled.");
	output("\n\nGazing down at the nuki-girl who just turned your tummy into a spunk-balloon, you can see her small breast heaving and her looking up at you with an apologetic look on her face.");
	output("\n\n<i>“I- I told you I’m not used to this kind of stuff,”</i> she manages to say between labored breaths, <i>“But at least we can still cuddle, right?”</i>");
	output("\n\nWell, it’s not like you have much of a choice, tied to Chrissy at the crotch like you are. ");
	if (pc.isNice()) output("You smile and bring yourself down to the mattress with you lover, wrapping her in you arms and letting her rest her head against your [pc.chest] while you tell her you don’t mind that she blew her top a bit early. ");
	else output("You roll your eyes but bring yourself down to the mattress with your lover, wrapping her in your arms and letting her rest her head against your [pc.chest] while you tease her mercilessly about what a little lightweight she is. Despite your words, ");
	output("Chrissy smiles and settles into your embrace, holding you close and nuzzling her soft, chestnut locks against your bare chest, cooing happily.");
	output("\n\nWell, you didn’t exactly get off with this little escapade, but at least you can savor a warm nap with a cute little tanuki in your arms. Though, it’s such a big galaxy out there, and you’re sure you could probably find someone to sate your lust after this... or maybe Chrissy just needs to take things at her own speed if you want her knotty xeno-cock between your " + (pc.hasLegs() ? "legs" : "thighs") + ".");
	
	IncrementFlag("CHRISSY_RIDDEN");
	
	pc.lust(30);
	if(vagIdx >= 0) pc.loadInCunt(ppChrissy, vagIdx);
	else pc.loadInAss(ppChrissy);
	
	processTime(60 + rand(60));
	
	addButton(0, "Next", mainGameMenu);
}

public function getFuckedChrissy():void
{
	clearOutput();
	author("HugsAlright");
	showChrissy(true);
	clearMenu();
	
	var ppChrissy:PregnancyPlaceholder = getChrissyPregContainer();
	var vagIdx:int = -1;
	if(pc.hasVagina()) vagIdx = pc.pickUnblocked();
	
	output("With a smirk, you step closer to your soon-to-be lover, reach down for the hem of her too-big sweater, and start to pull up, resulting in a stuttering breath from the tiny half-breed. Chrissy’s face turns a deep shade of red as the garment is pulled over her head and her pert B-cups are revealed, making her chestnut locks fall down around her face. Similarly, after tossing Chrissy’s sweater aside, you grab at the tanuki girl’s pants and start to work them downwards. She’s happy to assist, wiggling her hips and blushing redder than a zel’rahn at a stripclub, seeming to enjoy the experience of being stripped like this. As her pants pop over her round, full, fuzzy balls, you can already see her thrice-knotted cock appearing from its sheath, swiftly stiffening as you eye its owner’s bare body.");
	output("\n\nOnce again, you find your gaze inexplicably drawn to that girthy, knotty, alien cock between Chrissy’s legs. Those big, fuzzy balls of hers look like they need an outlet for all that spooge they’re holding. ");
	if (flags["CHRISSY_GETFKD"] == undefined) output("\n\nThere’s no doubt you want that hot xeno-rod deep inside you, but that last time makes you think that maybe your tanuki friend needs to take things at her own speed.");
	if (!pc.isNude()) output("\n\nGrinning, you strip yourself of your [pc.gear] in front of Chrissy, who watches your little strip show with great attention. Once you’re good and nude, you throw yourself backwards onto your lover’s bed, getting yourself nice and comfortable as your sit up on your elbows. You spread your legs invitingly for Chrissy, [pc.vagOrAss " + vagIdx + "] well within her view.");
	else output("\n\nAlready as naked as your lover, you throw yourself backwards onto the bed, getting yourself nice and comfortable as your sit up on your elbows. You spread your legs invitingly for Chrissy, [pc.vagOrAss " + vagIdx + "] well within her view.");
	output("\n\nThe tiny tanuki’s cock jumps slightly in response to the lewd display you’re showing her, but her mien quickly becomes nervous at the realization of what you want. ");
	if (flags["CHRISSY_GETFKD"] == undefined) output("<i>“C’mon,”</i> she whines with a slump of her shoulders, cheeks still red with lust, <i>“Remember what happened last time? I- I’m just gonna go too early again.”</i> ");
	else output("<i>“Again?”</i> she groans with a slump of her shoulders, cheeks still red with lust, <i>“I- I mean it was okay the last time, but...”</i>");
	output("\n\nYou assure the half-breed this is indeed what you would like to do with her, resulting in a little gulp from the girl before she takes a few steps towards the bed. ");
	output("\n\n<i>“Y- you’re sure you can’t just stick something in me instead?”</i> she asks, finally kneeling onto the mattress, right between your " + (pc.hasLegs() ? "legs" : "thighs") + ".");
	output("\n\nSmiling at her, you give Chrissy a nod and you hips a little rock forward, trying to get your [pc.vagOrAss " + vagIdx + "] closer to the tanuki’s erect dick while your knees rise to her waist. She sighs in response, though her voice is very shaky, either with arousal or nervousness, steadying her body by taking hold of your knee with one hand and her knotty, throbbing cock with another. Chrissy clearly doesn’t have much experience with this sort of thing, cautiously lining her heart-shaped tip up with your [pc.vagOrAss " + vagIdx + "], trembling until her cockhead brushes against your " + (vagIdx >= 0 ? "sodden folds" : "pucker") + ", tearing a shuddering breath from your lips.");
	output("\n\nWith little form, Chrissy rocks her hips forward, applying just the slightest bit of preasure in order to spread your " + (vagIdx >= 0 ? "nether lips" : "[pc.asshole]") + " with a little whimper. Keeping a grip on her lowest knot, your lover continues her penetration, popping both of her smaller knots into you with satisfying slowness, stretching your you tender hole wider. Each inch of her modest, girthy length pushing into you sets you moaning gently, and your lover seems like she’s feeling the same, whimpering quietly as your inner walls caress her ‘nuki dick.");
	
	if(vagIdx >= 0) pc.cuntChange(vagIdx, ppChrissy.cockVolume(0));
	else pc.buttChange(ppChrissy.cockVolume(0));
	
	output("\n\nFinally bottoming out inside you with her big, lower knot left pressing against your [pc.vagOrAss " + vagIdx + "], Chrissy keeps her position inside you, her breath shuddering. With a quiet groan escaping her darkened lips, the kui-girl fucking you collapses forward under the weight of her pleasure, stradling you on all fours. Almost immediately, you throw your [pc.legOrLegs] around her plush thighs, giving your lover some encouragement to get moving with a little flex of your inner muscles. Chrissy can only whimper in response to the minute movements of your [pc.vagOrAss " + vagIdx + "], prompting her to draw her hips back, dragging her ‘nuki dick out of you until her tapered tip is left pressing against your stretching " + (vagIdx >= 0 ? "pussy" : "asshole") + ". As soon as she’s out, you guide the half-breed back into your with a gentle push of your legs, her smaller knots widening your sodden hole with a delightful slowness. Once she’s buried deep inside you again, she starts to pull out, repeating the same motion again and again until you’re both moaning aloud.");
	output("\n\nChrissy takes it slow, gently drawing her xeno-cock in and out of your [pc.vagOrAss " + vagIdx + "] while quiet, pleasured sounds fill the room. It seems like the tiny tanuki is trying to avoid an early orgasm by taking things slow, unitentionally teasing you with her gentle, near-sluggish movements while she moans and groans with your inner walls hugging warmly at her length. With need growing in your loins, all you can do is start to roll your own hips, gently grinding Chrissy’s knotty cock against your [pc.vagOrAss " + vagIdx + "], making your lover cry out and tremble with pleasure. It’s all enough to make to make the kui-girl reconsider her slow movements, not too much, just enough that you feel your own orgasm building.");
	output("\n\nContinuing the gentle pumping and thrusting of her wide hips, Chrissy moans and groans with her barely restrained bliss, setting her compact tush jiggling when her sides meet yours, her swollen breeder’s knob teasing your supple entrance with each inward thrust. Before too long though, you can see the half-breed is close to her climax, shaking and trembling with until a long, drawn out cry of pleasure accentuates a particularly powerful thrust of her hips. You yelp aloud when Chrissy forcefully buries her cock deep inside your, her girthy lower knot forcing your [pc.vagOrAss " + vagIdx + "] to spread as wide as it can. ");
	output("\n\nSeemingly unable to force her breeder’s knob into you, Chrissy pulls her hips back, leaving you to pant until she slams her hips forwards again, driving the ball of cockflesh into you with a girly grunt and a whimper as her orgasm begins. Virile ‘nuki spunk floods your " + (vagIdx >= 0 ? "womb" : "depths") + " while three entire knots inflate and spasm inside you, your lover’s sack emptying into you. Chrissy whimpers the whole way through, swelling your [pc.stomach] with her seed and grinding her knot along your inner walls until you’re her personal cum balloon, filled to the brim with her creamy alabaster.");
	output("\n\nWith a huge ball of cockflesh spreading you wide, kui-cum filling your " + (vagIdx >= 0 ? "cunt" : "asshole") + ", and Chrissy’s hips bucking jerkily against yours, all you can do is lie back and let your orgasm begin. Your [pc.vagOrAss " + vagIdx + "] clamps down around your lover, drawing her deeper into you as your body tenses and your inner muscles spasm, drawing a renewed chorus of pleasured tones from your tanuki lover.");
	if (vagIdx >= 0) output(" [pc.Girlcum] spills out around Chrissy’s shaft, trickling down to her balls while you both cry out with the bliss of climax.");
	if (pc.hasCock()) output(" Your [pc.cocks] convulse" + (pc.cocks.length == 1 ? "s" : "") + " alongside Chrissy’s, coating your [pc.chest] and cum-swollen tummy with a healthy amount of [pc.cumNoun].");
	output("\n\nYou’re left with your eyes closed and your [pc.chest] heaving after all that, you belly so full of Chrissy’s kui-tan cream that you could pass for pregnant, the bliss of release leaving you well fulfilled. A moment later, your lover falls forward onto you, with her head resting " + (pc.breastRows[0].breastRating() >= 1 ? "between your cleavage" : "against your chest") + ", well spent and well emptied. It seems neither of you have the energy to speak, but Chrissy still wraps her svelte arms around your back and nuzzles into your [pc.chest] with a contented, stuttering sigh. You smile and return the gesture, wrapping your arms around the small of the tiny tanuki’s shoulders, holding her close as her chestnut locks caress your [pc.skinFurScales]. She coos happily at your touch and squirms a bit in your grasp while she settles in, which has the added effect of rubbing her knot against your inner walls, drawing the lightest of gasps from your [pc.lipsChaste].");
	output("\n\nWell, you’re too tired to move, and you’re already tied to this half-breed at the crotch, so you get yourself comfortable for what promises to be a warm, comfortable nap in the bliss of your afterglow. ");
	if (flags["CHRISSY_GETFKD"] == undefined) output("Seems you were right about Chrissy needing to take things at her own pace, seeing as you both got off this time.");
	output("\n\nNo doubt it’ll be as painful as anything to tear yourself from this tender embrace when you have to get up, but you can savor it while it lasts.");
	
	IncrementFlag("CHRISSY_GETFKD");
	
	processTime(60 + rand(60));
	
	pc.orgasm();
	if(vagIdx >= 0) pc.loadInCunt(ppChrissy, vagIdx);
	else pc.loadInAss(ppChrissy);
	
	addButton(0, "Next", mainGameMenu);
}