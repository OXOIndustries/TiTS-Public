public function tryProcKaedeUvetoEncounter():Boolean
{
	if ((flags["KAEDE_MET_ON_UVETO"] == undefined || (flags["KAEDE_MET_ON_UVETO"] == -1 && flags["KAEDE_UVETO_RAINCHECK"] + (7 * 24 * 60) < GetGameTimestamp())) && flags["KAEDE_FUCKED"] && (flags["KAEDE_MYRELLION_ENCOUNTER"] != undefined || flags["KAEDE_NT_ENCOUNTER"] != undefined) && flags["UVETO_GREETING_PARTY"] != undefined && flags["PREV_LOCATION"] != undefined && flags["PREV_LOCATION"] == "SHIP INTERIOR")
	{
		encounterKaedeOnUveto();
		return true;
	}

	return false;
}

public function encounterKaedeOnUveto():void
{
	kaedeHeader();

	output("\n\nYou step out of your ship and into the cold, sterile air of Uveto Station. The long arm of the docking limb stretches far ahead of you, somewhat cluttered with crates of mining equipment and food supplies. A handful of other spacers are milling around, trying to ignore the ever-present eye of security cameras and assault drones peering down from on-high.");
	
	output("\n\nJust as you’re starting to head down to the corridor, you hear your name being called from behind. You turn, just in time to see a familiar ginger half-ausar bounding towards you down the corridor. You swing your arms around her, pulling Kaede into a tight hug. Her orange tail swishes excitedly behind her as she nuzzles her cheek into your [pc.chest].");
	
	output("\n\nAfter a few moments of tight embrace, Kaede pulls back with a big smile. <i>“[pc.name]! What are you doing here?”</i>");
	
	output("\n\nYou explain what brought you all the way into the core, then pose the same question back at her: doesn’t Kaede usually operate out of Tavros?");
	
	output("\n\nShe points back the way she came, to a pair of leithans in purple and silver uniforms who are guiding a hover-platform off of <i>Talon Rogue</i>, laden with cargo containers marked for RhenWorld Stellar Excavations.");
	
	output("\n\n<i>“I’ve still got a pretty sweet gig for RhenWorld going. The daughter of their C.E.O. and I are, uh, pretty close so... whenever I don’t have a contract going, I just get myself on RhenWorld’s Uveto-Krovak supply run. Safe, boring, and lucrative - just the way I like ‘em!”</i> Kaede chuckles.");
	
	output("\n\nWell, that is a sweet deal she’s got going for herself. Speaking of sweet, you notice that the normally plain-jane girl’s dolled herself up a little for once: her slim lips are glistening with blue lipstick, and she’s definitely got at least a little eyeshadow on, though she’s still wearing her weathered old jacket and tore-up jeans.");
	
	output("\n\nThe halfbreed blushes when she catches you looking. <i>“What?”</i> she pouts, still wagging her tail. <i>“A girl can decide to look pretty once in a while. Especially when she’s gonna be meeting her leithan patron’s half-sister here on business. Though not for a couple hours, actually. Hey! There’s a little cafe here on the station that makes the <b>best</b> steaks. How ‘bout I buy you lunch? I’d love to have someone to while away the time with.”</i>");

	processTime(10);

	//[Sure!] [Rain Check]
	clearMenu();
	addButton(0, "Sure!", uvetoKaedeSure, undefined, "Sure!", "You’d be happy to spend some time with Kaede.");
	addButton(1, "RainCheck", uvetoKaedeRainCheck, undefined, "Rain Check", "Maybe some other time, Kaede.");
}

public function uvetoKaedeRainCheck():void
{
	clearOutput();
	kaedeHeader();

	flags["KAEDE_MET_ON_UVETO"] = -1;
	flags["KAEDE_UVETO_RAINCHECK"] = GetGameTimestamp();

	output("<i>“Maybe some other time,”</i> you say. You’ve got other things to attend to.");

	output("\n\n<i>“Oh, uh, sure,”</i> Kaede shrugs. <i>“Guess I’ll go get something to eat, then. Take care, [pc.name]!");
	if (annoIsCrew()) output(" And tell Anno I love her, ‘kay?");
	output("”</i>");
	output("\n\n");
	if (annoIsCrew()) output("You promise that you will. ");
	output(" Giving Kaede a parting squeeze, you send her on her way.");

	processTime(3);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function uvetoKaedeSure():void
{
	moveTo("UVS B7");
	
	clearOutput();
	kaedeHeader();
	
	flags["KAEDE_MET_ON_UVETO"] = 1;

	output("<i>“Sure,”</i> you say, releasing the half-ausar from your end of the hug. <i>“Lead the way.”</i>");
	
	output("\n\nKaede gives a little cheer and takes you by the hand, marching down the corridor with a cute little skip in her step. You follow at her side, letting her ginger tail swish against your [pc.leg] and her fingers wrap tightly between your own. As you [pc.walk] towards the inner sanctum of the station, Kaede calls your attention to the viewports on the right, showing the curving ice plane of the Uvetan moon down below.");
	
	output("\n\n<i>“Beautiful, isn’t it?”</i> she smiles, pausing to gaze out into the pale wastes. <i>“I barely ever go planetside, but Uveto really tempts me. Even though it’s so cold, I’ve seen the holovids of the ice plains and... wow. Even those coreward resort planets you see all the time don’t hold a candle to those snowy fields. They’re just so... so fake, you know? But this place, it’s still wild and untamed. A natural beauty.”</i>");
	
	output("\n\nIs that so? Kaede seems awfully taken with this icy backwater.");
	
	output("\n\nShe laughs when you mention it, turning back towards the station. <i>“I guess. Silly, right? Maybe I’m just attracted because it’s an ausar colony.”</i>");
	
	output("\n\nMaybe, though Uveto does have a sort of primal beauty to it. Kaede gives you a blue-lipped smile and sashays ahead onto the sweeping circular arc of Uveto Station. The pedestrian way leads you around the titanic chamber of the space elevator, which pumps billows of cold air in your direction as you pass by even a good fifty feet away. Several spacers around it huddle underneath heavy jackets, recoiling away as the doors slide open and a pair of leithans covered in fur coats come out with a hover-loader carried between them. Like Kaede’s cargo, it’s marked with the RhenWorld logo.");
	
	output("\n\nThe two of you get some distance from the frigid elevator and over to the cafe. Half of the corridor is taken up by tables and chairs, many facing towards the small cut-away in the bulkhead where the counter is. Kaede ushers you to one of the tables and takes a seat across from you, swinging her arms behind her head.");
	
	output("\n\nA small drone wheels up to your table a moment later and projects a holographic menu onto the table between you, asking if anything strikes your fancy in a digitized ausari accent. You glance through the menu and place your order, and Kaede follows up by asking for a rare synth-steak and a diet soda. The drone putters away to the kitchen, beeping a cheery thanks.");
	
	output("\n\n<i>“So!”</i> Kaede smiles, leaning in and resting her chin on her hands. <i>“");
	if (flags["SEXED_CASS"] != undefined)
	{
		output("Thanks again for helping out back on New Texas. I <b>really</b> needed it... and now");
		if (flags["ANNO_SEXED"] != undefined) output(" both Cass and Anno are");
		else output(" Cass is");
		output(" talking about you all the time. When am I going to get to poach some of <b>your</b> lovers, hmm?”</i> she teases.");
	}
	else
	{
		output("It’s been awhile, hasn’t it? Guess it’s hard to randomly bump into my friends in a galaxy this big.”</i>");
	}
	
	output("\n\nYou chuckle and tell her that you’re happy to see her nonetheless. Kaede smiles wide enough that her eyes close, and her tail wags fiercely behind her. <i>“Yeah, yeah. It’s really good to see you too, [pc.name]. I missed you.”</i>");
	
	output("\n\n<i>“Is that right,”</i> you say, reaching ever so subtly under the table. Kaede gasps, ears standing rigid as you pat her pert little package. It shifts and stiffens at your touch, straining against the tight confines of her thigh-hugging jeans. Her surprise turns into a soft moan as you withdraw, spending just enough time down there to get across how much you missed her in turn.");
	
	output("\n\nKaede’s eyes flutter heavily, emphasizing her dark eyeshadow. <i>“So,”</i> she murmurs happily, <i>“anything on your mind, [pc.name]? Or do you just wanna play grab-ass under the table till our food gets here. Not that I wouldn’t like it, but there’s people watching.”</i>");
	
	output("\n\nYou guess you could make small talk for a bit. Or maybe you could find something more fun...");

	processTime(10+rand(5));

	//[Talk] [Tease] [Done]
	uvetoKaedeRootMenu();
}

public function uvetoKaedeRootMenu():void
{
	kaedeHeader();
	clearMenu();
	addButton(0, "Talk", uvetoKaedeTalkMenu, undefined, "Talk", "Chat a bit with Kaede.");

	if (flags["KAEDE_UVETO_TEASED"] == undefined) addButton(1, "Tease", uvetoKaedeTease, undefined, "Tease", "Kaede seemed so delightfully shy about a mere public grope... you could probably get the little half-ausar really worked up.");
	else addDisabledButton(1, "Tease");

	addButton(2, "Done", uvetoKaedeDone, undefined, "Done", "That’s enough beating around the bush. Hang around until your food arrives, and then see where you and the ginger pup go from there.");
}

public function uvetoKaedeTalkMenu(ff:Function = null):void
{
	kaedeHeader();
	clearMenu();
	if (ff != uvetoKaedeHerBody) addButton(0, "Her Body", uvetoKaedeHerBody, undefined, "Her Body", "After getting a handful of Kaede’s crotch, you’re reminded of a burning question: how come she doesn’t have anything else between her legs?");
	else addDisabledButton(0, "Her Body");

	if (ff != uvetoKaedeAnno) addButton(1, "Anno", uvetoKaedeAnno, undefined, "Anno", "How are Kaede and Anno doing? Everything okay between them?");
	else addDisabledButton(1, "Anno");

	if (ff != uvetoKaedeCass && flags["KAEDE_NT_ENCOUNTER"] != undefined) addButton(2, "Cass", uvetoKaedeCass, undefined, "Cass", "Ask about how Cass and Kayla are doing.");
	else addDisabledButton(2, "Cass");

	if (ff != uvetoKaedeRhenworld) addButton(3, "RhenWorld", uvetoKaedeRhenworld, undefined, "RhenWorld", "Ask Kaede for some more juicy details about the RhenWorld contract she’s been working. How’d she get a sweet setup like that?");
	else addDisabledButton(3, "RhenWorld");

	if (ff != uvetoKaedeUveto) addButton(4, "Uveto", uvetoKaedeUveto, undefined, "Uveto", "Kaede seems to have a real fondness for this backwater snowball. What’s up with that?");
	else addDisabledButton(4, "Uveto");

	addButton(14, "Back", uvetoKaedeRootMenu);
}

public function uvetoKaedeHerBody():void
{
	clearOutput();
	kaedeHeader();

	output("You’ve been thinking since last time you and Kaede met. She clearly modded her body to be the way she is now, but why not go all the way? Why does she lack a female sex?");
	
	output("\n\n<i>“Oh, that,”</i> Kaede says with a hint of a blush, leaning on her laced fingers. <i>“You know, I don’t think anybody’s ever actually asked me that before. N-not that I mind, [pc.name]. I guess it comes down to... well, what’s a woman, really, nowadays? My mother is a hermaphrodite and proud of it. From what I’ve found out, she’s fathered bastards across half the galaxy. I might be the only one she actually carried herself. Too busy being a big, tough ship’s captain to be a mom! But she’s a woman. Like, obviously so. She’s got bigger boobs than I do, wears makeup, loves going to spas and salons more than anyone I know.”</i>");
	
	output("\n\n<i>“So I guess... when I decided to mod up, I didn’t think too much about my actual </i>sex<i>. I wanted to look and talk and feel like a woman, but what’s between my legs didn’t matter to me so much. Besides, a dick’s way more convenient, and if I’ve got one of those and a butt, well, who needs a twat anyway? Would have had to shell out more for different drugs to get one, too.”</i>");
	
	output("\n\n<i>“Really?”</i> you ask, cocking a brow. <i>“You never even wanted one");
	if (pc.hasVagina()) output(" - just for pleasure? They feel amazing, you know!");
	else output("?");
	output("”</i>");
	
	output("\n\nKaede shrugs. <i>“Honestly? Not really. Seems like it’s more trouble than it’s worth. Besides,”</i> she adds, narrowing her eyes and giving you a lusty little smile, <i>“you know I kinda have a thing... a big thing... for butt stuff. Anno likes to say I have the most sensitive ass in the galaxy. Maybe I do! But if it feels that good, I don’t feel like I’m missing out!”</i>");
	
	output("\n\nFair enough, you suppose. <i>“Out of curiosity, ever thought about getting more mod work done?”</i>");
	
	output("\n\n<i>“Hm... a little bit,”</i> the halfbreed admits with a little smile. <i>“Doubt I’d actually do it, but I’ve thought about maybe getting bigger breasts. Every one of my lovers");
	if (pc.biggestTitSize() <= 4) output(" except you"); // 9999 confirm kaedes tittysize
	output(" seems to have way bigger ones than me! Then again, I’d probably look silly with tig ol’ biddies hanging out in front of me,”</i> she laughs, holding her hands a watermelon’s length in front of her chest and bouncing them around.");
	
	output("\n\nYou both share a laugh. After, Kaede leans back in her chair, crossing her arms under her perky C-cups. <i>“Other than that? I don’t know. I’m actually really happy with my body the way I am now!”</i>");

	processTime(15+rand(5));

	uvetoKaedeTalkMenu(uvetoKaedeHerBody);
}

public function uvetoKaedeAnno():void
{
	clearOutput();
	kaedeHeader();

	output("<i>“So, you and Anno...”</i> you prompt.");

	if (annoIsCrew())
	{
		output("\n\n<i>“Pft. You should know, you live with her!”</i> Kaede sighs. <i>“Lucky you, all big and important and able to support a girl like her. I’d give just about anything to have her as my first mate. Hehe, get it? Because... n-never mind. Anyway, long distance isn’t that bad when you’ve got faster than light comms across the galaxy, but still, there’s a reason we split up for so long after I left school. It’s not the best.”</i>");
		
		output("\n\nLeaning in with a playful smirk, you suggest that Kaede could always rectify that by hopping aboard the S.S. Steele. She grunts and scrunches her nose. <i>“If I get any poorer I might have to! A few more dry months and somebody on my friends list is going to have an extra ginger crashing on their couch.”</i>");
		
		output("\n\nIs that right? Didn’t she just say she had a pretty steady stream of work going on?");
		
		output("\n\n<i>“I do,”</i> she admits, <i>“but core-ward work for independents like me barely pays for itself no matter how good it looks on paper. It’s desperation work, and I’m lucky to get that ‘cuz I’m banging the C.E.O.’s daughter on the side. If I want to make it big as a captain, I’ve got to work the rim. Which is dangerous as hell since I’m all by myself, and my ship is so small... it makes getting and completing contracts hard.”</i>");
		
		output("\n\nYou repeat your suggestion that she really ought to think about partnering up.");
		
		output("\n\n<i>“Oh, fuck off,”</i> Kaede grunts. <i>“Ack, sorry. I just... I want to be independent. It’s what I always dreamed of - it’s what I almost lost Anno for the chance to do. I can handle more suffering and bullshit than you give me credit for to live the dream.”</i>");
		
		if (pc.isAss())
		{
			output("\n\nIf she’s just taking corporate hand-outs, that doesn’t sound very independent to you.");
		
			output("\n\n<i>“Have I told you to fuck off lately?”</i> Kaede huffs, sticking her tongue out at you. ");
		}
		else output("\n\n");
		output("She sighs, <i>“Anyway, we were talking about Anno. Is she alright? You getting along alright?”</i>");
		
		output("\n\n<i>“We are,”</i> you tell her. Anno’s perpetually the picture of cheerful, happy ausar babe. You’re not sure anything can keep her down for more than a couple hours.");
		
		output("\n\nKaede laughs. <i>“That’s her, alright. I’m glad. Hopefully I get a chance to drop by and spend some time with her after my meeting. Turns out I know a great little place on the station for a micro-date!”</i>");
	}
	else
	{
		output("\n\n<i>“We’re doing alright, thanks,”</i> Kaede answers with a bright smile. <i>“I wish I was leading the kind of lifestyle where we could be together on a more permanent basis, but we make do. I’m always keeping an eye out for");
		if (annoNotRecruited()) output(" Tarkus");
		else output(" Tavros");
		output(" contracts so I have an excuse to visit as often as I can. Just about every spare " + (isAprilFools() ? "dogecoin" : "credit") + " I can put together goes into taking her out to nice places, buying little presents...”</i>");
		
		output("\n\nHang on a minute, isn’t Anno kind of rich? Why’s Kaede all but putting herself in the poor house like that; surely Anno should be doing the expensive wooing.");
		
		output("\n\n<i>“That’s what she says,”</i> Kaede says, rolling her eyes. <i>“But... she’s always going to be my big, snowy princess, you know? I <b>want</b> to treat her right, even if that means I eat ramen more often than I don’t. There was a time I didn’t have the choice, after all. Besides, Anno’s parents don’t actually give her much, if I remember right. She earns her credits the hard way, same as you and me.”</i>");
		
		output("\n\nKaede’s certainly a dedicated lover. You wonder: does she go out like this for all her paramours?");
		
		output("\n\n<i>“No,”</i> she says, surprisingly frank. <i>“Anno and I both like to, well, spread the love around. We’re definitely ausar like that. But she’ll always be special to me, you know? She was my first, and she’s still the lover I’ve been closest with after all this time.”</i>");
		
		output("\n\nYou give her a faux-pout, asking what about yourself? How are you supposed to compete with Anno?");
		
		output("\n\n<i>“I will happily be the bread </i>or<i> the meat any time you two want to make a fuck sammich,”</i> she teases. <i>“C’mon, don’t be like that. I want to be with <b>both</b> of you: that’s a promise.”</i>");
	}

	processTime(15+rand(5));

	uvetoKaedeTalkMenu(uvetoKaedeAnno);
}

public function uvetoKaedeCass():void
{
	clearOutput();
	kaedeHeader();

	output("<i>“How’s your little girl doing? And Cass, too?”</i>");

	output("\n\n<i>“Kayla’s great! Cass might be kinda bimbo-y now, which freaks me out some, but she’s still a big sweetheart inside. I actually see her more often now than I did before, too: every day or two she gets on a holovid call and lets me talk with my girl. Wish I could have them with me, but where I fly is soooo much more dangerous than where Cass does. Plus she’s got a way bigger, cozier ship and a crew to take care of Kayla. All I can do is send love and credits for her. She’s better off with her mom, I guess, but... I dunno. God, I miss being with her all the time.”</i>");

	output("\n\nYou reach across the table and take Kaede’s hand. You know she’s doing her best to be a great parent.");

	output("\n\n<i>“I try,”</i> she sighs. <i>“I don’t know... I’m still kind of sour at Cass about the whole thing. I hadn’t really planned on having kids. Or if I did, I’d figured it have been with Anno when we’d got some money tucked away, settled down a little. What happened with Cass just totally blindsided me. When she called me out of the blue from the maternity ward in the hospital, oh I just wanted to bash her stupid cow head in! Ugh! But then I took one look at little Kayla through the holovid, and my heart absolutely melted. Like, ‘this... that’s mine. I made that. Holy shit.’ It was amazing.”</i>");

	output("\n\nGlancing up at you, Kaede asks, <i>“Do you have any kids, [pc.name]?”</i>");

	var numChildren:Number = (StatTracking.getStat("pregnancy/total births") + StatTracking.getStat("pregnancy/total sired"));
	// preggos
	if(pc.isPregnant() && pc.bellyRatingMod > 10)
	{
		for (var i:int = 0; i < pc.pregnancyData.length; i++)
		{
			var pData:PregnancyData = pc.pregnancyData[i];
			if(pData.pregnancyType != "" && pData.pregnancyQuantity > 0)
			{
				var pChildType:int = PregnancyManager.getPregnancyChildType(pc, i);
				if(pChildType == GLOBAL.CHILD_TYPE_LIVE) numChildren += pData.pregnancyQuantity;
				//else if(pChildType == GLOBAL.CHILD_TYPE_SEED) numChildren += pData.pregnancyQuantity;
				//else if(pChildType == GLOBAL.CHILD_TYPE_EGGS) numChildren += pData.pregnancyQuantity;
			}
		}
	}
	if (numChildren > 0)
	{
		output("\n\n<i>“I do,”</i> you answer.");
		if (numChildren >= 10) output(" <i>“Lots.”</i>");
	}
	else output("\n\n<i>“Not yet,”</i> you answer. Given your ancestry, who knows how long that’ll stay true.");

	output("\n\nKaede smiles. <i>“That’s good. You");
	if (numChildren == 0) output("’ll have some eventually, I’m sure. It’s... it’s a trip.");
	else output("’re probably an awesome parent. It’s a trip, isn’t it?");
	output("”</i>");

	output("\n\nYou nod and, after a moment of silence passes, ask what Cass does exactly. She said something about working in the core?");

	output("\n\n<i>“Oh, yeah,”</i> Kaede says. <i>“Cass captains the </i>Hestia<i>, a stock freighter like my </i>Talon Rogue<i>. She’s got a little more cargo capacity than me, but still in the same ball park. Cass also doesn’t mind taking long-term corporate contracts, which means unlike me, she can operate at a profit closer to the core. That’s probably how she ended up on New Texas in the first place.”</i>");

	output("\n\n<i>“Any particular reason you don’t take those sort of contracts?”</i> you ask. It’d be a lot safer than wandering around out here on the frontier like you do, that’s for sure.");

	output("\n\nKaede makes a gagging sound at you. <i>“Gross. Big corporate contracts mean less freedom for me. Have to stick to specific routes, have to keep a pinpoint schedule, can’t try and swindle or evade any pirates that try and tangle with me. Plus half of ‘em would make me repaint </i>Talon<i>, or wear one of those clingy jumpsuits that’re all the rage now for corporate girls.”</i>");

	output("\n\nYou think back to Anno and grin, suggesting that Kaede would look pretty nice in one of those skin-tight black-and-yellow Steele Tech suits. You can just imagine the cute little bulge on display for the whole world to see.");

	output("\n\n<i>“I bet you’d like that!”</i> Kaede laughs, rolling her eyes. Still, her cheeks flush a little bit as the thought sinks in. <i>“I guess there’s worse things I could dress up in for a thrill...”</i>");

	processTime(15+rand(5));

	uvetoKaedeTalkMenu(uvetoKaedeCass);
}

public function uvetoKaedeRhenworld():void
{
	clearOutput();
	kaedeHeader();

	flags["HEARD_ASHINARI"] = 1;

	output("<i>“Tell me more about this RhenWorld job,”</i> you prompt. <i>“How’d you swing that?”</i>");
	
	output("\n\nKaede giggles, chewing one of her blue-painted lips. <i>“Well, uh, being in the wrong place at the wrong time, I guess. While I was on Tavros, I got in a long, long elevator ride with a smoking hot leithan girl. Had her bugpony-butt right in my face. And she was, uh, <b>really</b> in heat. Turns out I’m a little... a lot... more sensitive to pheromones than your average half-ausar. At least as much as a full ausar, I guess. She didn’t realize I was packing a dick in my pants until I almost fainted on her from all the blood rushing to my crotch.”</i>");
	
	output("\n\n<i>“Lucky me, she was more than happy to take responsibility,”</i> Kaede adds with a lusty smile. <i>“Afterwards it turned out that she was Ashinari Rhenesunne, the daughter of RhenWorld’s C.E.O. Heir-apparent to the company. I guess she enjoyed our meeting as much as I did, because she wanted to see me again. And again... and again. When she found out I was a freighter pilot, she offered me a job out of her office. I turned her down - I like being my own boss - but she still got me the hook up with RhenWorld’s contractor department. Whenever I want some easy, if not terribly profitable, work, I can just give Ashi a call and haul some RhenWorld mining crap around.”</i>");
	
	output("\n\nSo Kaede’s bedding the heirs to the Steele, Rhenesunne, and Dorna fortunes all at once? She’s got to be the most well-connected cargo jockey in the galaxy!");
	
	output("\n\n<i>“Hehe, I guess. Clearly I need to get the three of you in a room together... you can all do your corporate wheeling and dealing while I just roll around drowning in all that pussy");
	if (pc.hasCock()) output(" and dick");
	output("!”</i> Kaede laughs. <i>“Maybe you’ve got some more wealthy friends you could introduce me to while we’re at it?”</i>");

	if (flags["SEXED_ANYXXINE"] != undefined)
	{
		output("\n\nYou glance down the corridor towards the RhenWorld office where your own Rhenesunne lover is working. The idea of doubling down with Kaede to service the domineering half-leithan is pretty appealing...");
	}
	else output("\n\nYou chuckle and shake your head. Three’s more than plenty!");

	output("\n\nThe two of you share a hearty laugh, ending with Kaede returning her chin to rest on her hands. <i>“Anyway, this RhenWorld gig is pretty sweet. No obligations, plenty of freedom, reliable work. I kinda feel shitty about only having the job because the company head’s daughter developed a knotting fetish on my account, like I’m doing well professionally because I’m a decent lay. But then I come to the core and can afford a steak dinner, and I stop feeling bad. Apparently my professional standards aren’t </i>that<i> high.”</i>");

	output("\n\n<i>“Knotting fetish?”</i>");
	
	output("\n\nKaede leans in and with a conspiratorial whisper, says, <i>“You’ve got no idea. I figured someone of my, uh, endowments could never satisfy a big ol’ leithan, but I guess Ashi’s an even bigger butt-slut than I am! You should hear her beg for me to stretch her ass open. It’s really something...”</i>");
	
	output("\n\nYou can only imagine.");

	processTime(10+rand(5));

	uvetoKaedeTalkMenu(uvetoKaedeRhenworld);
}

public function uvetoKaedeUveto():void
{
	clearOutput();
	kaedeHeader();

	output("<i>“You really like this place, huh?”</i> you ask, inclining your head back towards the space elevator. Kaede looked like she was in awe of the wintry moon on your way in, after all.");
	
	output("\n\nShe nods, staring past you towards the viewports stretching along the bulkheads behind you. <i>“It’s beautiful. I mean, </i>really<i> beautiful. Not like those polished resort planets or paradise worlds the mega-corps cultivate. Like, those places are tailor made to be super pretty and appealing. But Uveto... it’s got this raw, primal kind of beauty. All-natural.”</i>");
	
	if (pc.isMisch())
	{
		output("\n\nConsidering how she’s all modded up and wearing makeup, and her girlfriend prides herself so much on keeping up her appearance, you’re kind of surprised Kaede’s such a stickler for “natural beauty.”");
	
		output("\n\nShe scoffs, <i>“Don’t change the subject. People and planets are totally different things. Besides, even all-natural me was pretty damn handsome!”</i>");
	}
	
	output("\n\n<i>“So,”</i> you ask, <i>“what’s to like here other than the snow?”</i>");
	
	output("\n\n<i>“Mountains of pure ice, oceans as deep as the world... thousands of thick, curvy ausar girls and lonely leithans,”</i> Kaede grins. <i>“Plus the saunas here are galaxy-famous! And I’ve heard there’s nothing like getting on a divesuit and swimming the Uvetan ocean core. As, uh, as long as you don’t get eaten by monsters, anyway. Man, I should really stop just admiring it from up here; actually go down and see for myself.”</i>");
	
	output("\n\nMaybe without the core-diving, but sure. Kaede could probably use a little time off from working all the time, anyway.");
	
	output("\n\n<i>“Got that right,”</i> she sighs. <i>“Y’know what? I think after my meeting, and maybe a de-stress nap after, I’m gonna go on down. Maybe check out the sauna or the mead hall down in Irestead. Heh, if it ends up being my kinda place, maybe I’ll see you around there sometime. I make this run often enough.”</i>");

	processTime(8+rand(5));

	uvetoKaedeTalkMenu(uvetoKaedeUveto);
}

public function uvetoKaedeTease():void
{
	clearOutput();
	kaedeHeader();

	//+Exhibitionism. If you track NPC stats like that, give +KaedeExhibitionism, too! She probably starts off really low.
	kaedeIncreaseExhibitionism(10);
	
	//+Mischievous
	pc.addMischievous(3);
	pc.exhibitionism(5);

	output("Smiling at your companion, you let your [pc.foot] slip forward under the table, brushing it up along Kaede’s thigh and towards her crotch. She returns your smile at first, enjoying the sign of affection right up until you get up into her inner thigh and rub yourself against her crotch. She recoils, doubling over and blushing furiously as you start to rub her meaty bulge up and down.");
	
	output("\n\n<i>“[pc.name]!”</i> she groans, biting her lower lip hard. <i>“K-knock it off! People will see!”</i>");
	
	output("\n\n<i>“Is that right?”</i> you tease, continuing to rub her stiffening red rocket through her jeans. <i>“Wouldn’t that be awful...”</i>");
	
	output("\n\nKaede grunts, grabbing the table on either side and trying not to moan. If anybody’s going to draw attention to the two of you, something tells you it’s going to be her! You grin and keep moving, steadily picking up the pace. Despite her verbal discontent, Kaede’s cock sure gets nice and stiff as you play with it, straining the crotch of her pants. If you didn’t know any better, you’d say the poor thing’s almost ready to explode.");
	
	output("\n\nDoes she get off on being teased in public, you wonder aloud between strokes. For shame, from such a wholesome girl like her! Kaede blushes furiously, moaning a mix of <i>“S-stop,”</i> <i>“[pc.name],”</i> and other muted pleas. You just smile and keep doing what you’re doing, letting the poor thing squirm under your tender ministrations.");
	
	output("\n\nSure enough, the way Kaede practically doubles over on the table, tail swishing panickedly and ears flat against her head, she draws more than a few gazes your way. A good half-dozen of your fellow grizzled spacers are hanging around the cafe, and between Kaede’s moans and wriggling around, every one of them ends up looking your way sooner or later. Even people passing by cast curious glances your way, making your lover blush all the darker.");
	
	output("\n\nWhen Kaede finally composes herself enough to sit back up, you flash her a grin and lean across the table, cupping her cheeks and pulling her into a kiss. She goes rigid for a moment, taken by surprise, but melts in your hands as you trade lusty teasing for passionate affection. Her big blue eyes flutter closed, abandoning their embarrassment and aggravation. After a nice, long moment, you break the kiss and lean back, keeping Kaede’s cheeks in your hands.");
	
	output("\n\nShe takes a deep breath and smiles. <i>“You’re the worst,”</i> she murmurs, still flushed and tucking her ears. Kaede glances aside at some of the folks that were looking at you two, now returning to their business. <i>“Thanks for not taking that any further. Any more and I might have creamed my jeans. Now I just have a boner so hard it hurts. You’re going to take responsibility for that after we eat, aren’t you?”</i>");

	flags["KAEDE_UVETO_TEASED"] = 1;

	processTime(10+rand(5));
	pc.lust(15);

	uvetoKaedeRootMenu();
}

public function uvetoKaedeDone():void
{
	clearOutput();
	kaedeHeader();

	output("You lean back in your chair as the little server droid zooms back to your table, balancing a steaming tray of food on its cylindrical head. Kaede slides the tray over from it and deposits a " + (isAprilFools() ? "dogecoin" : "credit chit") + " before sending it on its way. The droid beeps a polite <i>“Thank you!”</i> as it wheels off to tend to another table.");
	
	output("\n\nYour companion digs in with ferocity");
	if (flags["KAEDE_UVETO_TEASED"] != undefined) output(", taking out the frustrations of your previous teasing on");
	else output(" to");
	output(" the rare meat in front of her. A few seconds of watching her devour the juicy steak remind you of your own hunger, and you’re soon digging in yourself. The next few minutes pass in relative quiet, interrupted for brief moments as one or other of you pauses to relate some humorous anecdote of your recent adventures or to make progressively lewder innuendos between mouthfuls of meat.");
	
	output("\n\nWhen you’ve both finished, and find yourselves both contentedly patting your stuffed bellies and smiling at each other, you’re sure it’s time to go.");
	
	output("\n\n<i>“So,”</i> Kaede starts, masking a decidedly unfeminine burp in the cuff of her jacket. <i>“Still got a while before my meeting. If you don’t have somewhere to be...");
	if (flags["KAEDE_UVETO_TEASED"] != undefined) output(" then you damn well better finish what you started, captain!");
	output("”</i>");

	processTime(20+rand(5));

	//[Go With Her] [Not Today]
	clearMenu();
	addButton(0, "Go With", uvetoKaedeSEXYTIMESENSUE, undefined, "Go With Her", "Take Kaede up on her offer and head back to <i>Talon Rogue</i> for a little more intimate time with the pretty puppy.");
	addButton(1, "Not Today", uvetoKaedeNotToday, undefined, "Not Today", "You’ve got some pressing business to take care of elsewhere.");
}

public function uvetoKaedeNotToday():void
{
	clearOutput();
	kaedeHeader();

	output("<i>“Actually,”</i> you say, <i>“I do have somewhere I need to be.”</i>");
	
	output("\n\nKaede");
	if (flags["KAEDE_UVETO_TEASED"] != undefined)
	{
		output(" scowls, crossing her arms. <i>“Are you seriously blue balling me?”</i> she huffs, shifting uncomfortably around her package. <i>“Oh man, you absolute <b>dick!</b>”</i>");
	
		output("\n\nYou chuckle and give her a pat on the head to send her on her way. While you’re striding off, you’re fairly certain you hear the half-ausar muttering something about riding a dildo with your name on it. How cute!");

		pc.addMischievous(5);
	}
	else
	{
		output(" sighs and shrugs, leaning back heavily in her chair. <i>“Damn.");
		if (annoIsCrew()) output(" Well, guess I’ll go invite myself onto your ship and give our mutual girlfriend a red rocket surprise,”</i> she teases.");
		else output(" Guess I’ll hang around here for a bit. That clothes shop across the way looks super cute, actually...”</i>");
	
		output("\n\nYou chuckle and give her a pat between the ears, telling her to have fun. She nuzzles up against your palm while she can, smiling from ear to ear. <i>“Will do. See you around, [pc.name]!”</i>");
	}

	processTime(5);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function uvetoKaedeSEXYTIMESENSUE():void
{
	moveTo("UVS F15");
	
	clearOutput();
	kaedeHeader();

	output("<i>“I think I can spare a few minutes,”</i> you grin, standing up and dumping the food tray off in its bin.");

	var metAnnoKaede:int = ((flags["MET_ANNO"] == undefined || flags["ANNOxKAEDE_INTRODUCED"] == undefined) ? 0 : flags["ANNOxKAEDE_INTRODUCED"]);
	var sexedKaede:int = (flags["KAEDE_FUCKED"] == undefined ? 0 : flags["KAEDE_FUCKED"]);

	//if hasn't fucked outside of Kaede/Anno Threesome:
	// If the players fucked kaede more times than the number of times than instances of the annoxkaede threesome could possibly have happened
	if (metAnnoKaede < sexedKaede)
	{
		output("\n\n<i>“Great!”</i> she smiles, hopping up and offering you her hand. <i>“I’m glad I can tempt you away even without Anno with us.”</i>");
	}
	else
	{
		output("\n\n<i>“I’ve been looking forward to this for a while,”</i> she says with a smirk. The ever-so-slight tent in her jeans assures you she very much so has been.");
	}

	output("\n\nYou grab a handful of half-ausar ass as Kaede hops out of her chair, making her auburn tail jump and wiggle over your arm. She blushes, and the two of you quickly make your way out of the cafe and out towards the lengthy docking arm once again. As you’re walking, Kaede’s hand slips down to yours, lacing her fingers through yours. She nestles into your shoulder and follows your lead back to where you met, where your ship and hers are parked just a stone’s throw apart.");
	
	output("\n\nGlancing out the docking viewport, you’re treated to a view of Kaede’s vessel in all its beat-up glory. She’s an old Casstech Lancer, covered in a racer-like paintjob of red and white. A meaty looking laser turret sits under the cabin, considerably bigger than your average stock freighter ought to be packing. The words “<i>Talon Rogue</i>” are written in bold white letters on the long neck between the cabin and the main hold. Kaede flips a keychain out of her pocket and swipes it over a keypad next to the airlock. The ship beeps at you, and the station’s security doors slide open.");
	
	output("\n\n<i>“After you, Captain,”</i> your companion smiles, sweeping one of her arms ahead like an old-Earth valet. You");
	if (pc.isMisch()) output(" give her a mock "+ pc.mf("bow", "curtsey") +" and");
	output(" step aboard.");
	
	output("\n\nThe interior of <i>Talon Rogue</i> is delightfully comfortable looking, the very definition of a bachelor pad. A circular couch surrounds a big holo projector, wired up to several game controllers lying atop a sea of holovid and game cases. A half-eaten box of Ausari stir-fry has been lazily left on top of the projector, making the glowing blue lights flicker oddly over the ceiling.");
	
	output("\n\n<i>“Sorry about the mess,”</i> Kaede laughs, grabbing the food off her projector-turned-table and throwing it into a mini-fridge up against the far wall. She squirms out of her tight leather jacket and hangs it up next to the airlock, following it with a loaded gunbelt you hadn’t even noticed. Once she’s down to jeans and her T-shirt, she starts heading for her cabin, pausing just long enough to ask, <i>“I’m going to go slip into something more... comfortable. Want me to bring back a little social lubrication; or just the fun kind?”</i>");
	
	output("\n\nYou nod, and let Kaede slip away through a hatch into a side chamber near the back of the ship. You flop down onto the couch while you wait, slipping your arms around the back of the seat");
	if (pc.isBiped() && pc.hasFeet()) output(" and kicking your feet up onto the projector’s face");
	output(".");

	flags["KAEDE_ENCOUNTERSEX_UVETO_OVERRIDE"] = 1;
	processTime(15);

	clearMenu();
	addButton(0, "Next", kaedeMyrellionSexIntroII);
}

public function uvetoKaedeShowerWith(fuckedHer:Boolean = false):void
{
	clearOutput();
	kaedeHeader(true);
	
	var cIdx:int = pc.cockThatFits(250);
	if (cIdx < 0) cIdx = pc.smallestCockIndex();

	output("<i>“Mind if I hop in with you?”</i> you ask, rising");
	if (pc.hasFeet()) output(" to your feet");
	else output(" up");
	output(" as Kaede starts for the shower.");
	
	output("\n\n");
	if (silly) output("<i>“Only if you don’t mind the smell of wet ausar!”</i> she teases.");
	else output("<i>“Only if you don’t mind scrubbing some hard-to-reach places,”</i> Kaede laughs.");
	output(" Your lover takes you by the hand and leads you through a hatch into a decidedly cramped, dark bathroom. About what you’d expect from a one-man-crew ship, though it’s definitely standing room only in her stall. Kaede gives you an apologetic smile as she taps a control panel inside, and steaming-hot water starts pumping out. She turns on a heel, leading you in and pulling you tight against herself as the water beats down from above, drenching you and your lover in a heartbeat. Kaede quickly grabs a cloth and wipes away the cum sticking to her flesh, but catches your hand when you move to do the same.");
	
	output("\n\nGiving you a playful smile, Kaede pushes you against the blue wall and crouches down between your " + (pc.hasLegs() ? "[pc.legs]" : "[pc.thighs]") + ", flicking her tongue out across your [pc.skinFurScales]. You give a little gasp as you realize what she’s doing: grooming you clean herself! Poor thing must feel guilty for giving you so much of her cum earlier");
	if (fuckedHer) output(", even though you’ve got a thick load of your own cooling in her bowels");
	output(". She grins up at you between long, sensuous licks across your crotch, belly, and thighs, making sure every bit of mess is wiped away by her warm tongue.");
	
	output("\n\nBy the time she’s satisfied, your");
	if (pc.hasCock()) output(" [pc.cock " + cIdx + "] is throbbing hard again. Watching the little ginger tongue-worship you was just too much, even so close to your last orgasm.");
	else output(" [pc.vagOrAss] is trembling with need and burning with renewed desire. Even if you just got a hot filling of puppy-cream a few minutes ago, watching the subby little halfbreed worshipping your body like that is just too much!");
	output(" A glance down, though, at least reveals that there’s a turgid red rocket hanging between Kaede’s knees, and her tail is sloshing wetly across the shower floor.");
	
	output("\n\n<i>“I thought we were cleaning up!”</i> you chide as Kaede’s tongue");
	if (pc.hasCock()) output(" traces along the underside of your [pc.cock " + cIdx + "], happily circling your crown.");
	else output(" teases your [pc.vagOrAss], circling the cum-stuffed hole.");
	
	output("\n\n<i>“W-were we?”</i> Kaede blinks, staring up at you");
	if (pc.hasCock()) output(" around your throbbing cock resting on the bridge of her nose.");
	else output(" from between your thighs.");
	
	output("\n\nYour response is cut off by a moan, and you find your fingers scraping against the smooth shower walls. A few more licks and your resolve is completely gone, replaced by the animalistic desire to have the sultry ginger again.");

	//[Take Her Ass] [Dildo Play]
	clearMenu();
	if (pc.hasCock()) addButton(0, "FuckHerAss", uvetoKaedeFuckHerAss, [cIdx, fuckedHer], "Fuck Her Ass", "Shove Kaede against the stall’s wall and pound that sweet ass of hers until she’s begging for more!");
	else addDisabledButton(0, "FuckHerAss");

	addButton(1, "Dildo Play", uvetoKaedeDildoPlay, fuckedHer, "Dildo Play", "You notice that Kaede’s got a couple of sex toys unabashedly lying on her shower’s shelf. The two of you could put those to use, on top of Kaede’s rock-hard red rocket.");
}

public function uvetoKaedeDildoPlay(fuckedHer:Boolean = false):void
{
	clearOutput();
	kaedeHeader(true);

	output("Even with a sopping wet and rock-hard dickgirl on her knees for you, your eyes are inevitably drawn past Kaede’s slender shoulders and to the pair of rose-pink doggy dildos sitting on the shower’s shelf. Her gaze inevitably follows yours, and her cheeks flush darkly when she sees where you’re looking.");
	
	output("\n\n<i>“Oh. Uh,”</i> she blabbers, tucking her tail. <i>“D-don’t mind those. They’re med-”</i>");
	
	output("\n\nYou cut her off with a hearty laugh, reaching over her and grabbing a knotty latex schlong in either hand. Glancing between Kaede, the doggy-dongs, and your own needy sex, you murmur that Kaede ought to bend over and let you see how well she’s trained herself on these bad boys.");
	
	output("\n\nHer big blue eyes go wide for a moment... before a lusty smile overtakes her, and Kaede obediently swiveles around on her knees. She grabs the wall, pressing herself tight against it to give you all the room she can, and lifts her tail in a giddy invitation. Her body’s ready and eager for you to do whatever you want to it, even after everything you’ve done already. You smile, loving the way Kaede’s so eager to please - and to surrender to your control - as you settle in behind her and start gently caressing that tight little ass of hers.");
	
	output("\n\nYour lover gasps when your hands fall on her, but quickly ends up wiggling her hips and pressing back against your hands, letting you freely grope and squeeze every inch of supple, freckled flesh. Her cheeks spread easily, giving you an ample view of the dark star hidden between them. It winks at you, clenching ever so slightly as you brush your fingers around it. A little pressure is all you need to slide inside, pressing a lonely digit into the tight, smooth passage of Kaede’s asshole. She whimpers and arches her back, flicking her tail faster and faster the deeper you go.");
	
	output("\n\nWhile you’re busy softening up Kaede’s tail-hole, you grab one of the turgid pink dildos and slip its pointed crown into your mouth, giving it a personal touch of lube on top of the shower’s beating spray. At a mere six inches, it’s easy to slide the whole shaft down your throat, wrapping your lips around the knot before drawing it back out. The toy quivers as you spit it back out, glistening with your spittle.");
	
	output("\n\n<i>“I’m surprised you don’t have an onahole to go with this,”</i> you muse, sliding your finger back out of Kaede’s tender hole and slipping the pointed toy between her legs.");
	
	output("\n\n<i>“Really?”</i> Kaede murmurs, gasping as the tapered tip presses gently against her tight entrance. <i>“");
	if (fuckedHer) output("After the way you just reamed me? You saw me... ");
	output("I’ll take having my ass fucked over using my dick any day. There’s nothing in the galaxy like having your cum milked out through your butt, only half-hard and squirting, trying to pump it out but not being able to squeeze cuz there’s something big and thick inside you... you know?”</i>");

	output("\n\n");
	if (pc.analVirgin)
	{
		output("No, but you’ll take her word for it.");
	}
	else if (pc.ass.looseness() <= 1) output("You have to admit, anal’s not nearly as bad as all that. But still, liking it more than using a hot slab of bone like hers?");
	else output("You grin, telling her you can sympathize.");
	output(" As you speak, you gently press your wrist forward, pushing the slender pink rocket through Kaede’s reflexive clench and into the tight, lubed-up passage inside. She cries out, cock jumping to attention - and thumping helplessly against the wall, forced to point straight down by the way Kaede’s pressed against it. You reach down and give it a sympathetic stroke, but after what she’s just said, you know what Kaede really wants is a hands-free climax - and you’re more than willing to provide it.");

	output("\n\nYou slide the toy deeper and deeper, pushing ahead until the thick bulb of latex knot is pressing against Kaede’s ass. She gulps audibly, ass winking in anticipation but unwilling to tell you what to do - she’s placed herself completely in your control for this, letting you decide how hard and how fast to violate her tender behind. Grinning, you move the base of the dildo in wide circles, churning up her insides but not moving in or out. Your lover chews her lips, rolling her eyes closed and enjoying your tender ministrations.");
	
	output("\n\nEventually you grow tired of just stirring Kaede’s ass up, even though she’s clearly enjoying it, and so you start to draw the latex toy back out. Nice and slow at first, but you shove it back in much harder than before. She yelps, tail flicking up at your face, and you can feel her clench hard around the turgid toy. That’s more like it!");
	
	output("\n\nOnce you’ve got a tempo established with Kaede’s behind, keeping her moaning and bouncing back on the knotty cock, your attention wanders to the other toy. It’s a little bigger than the one currently lodged in your lover’s ass, and deliciously thick - especially around its bulbous, veiny knot. Aside from the colors, the toy looks damn near life-like. Smiling to yourself, you note that there’s a suction cup underneath the knot, ready to hold the cock rigidly in place for you. <i>Must be awful nice for solo play,</i> you muse as you slap the cup down on the floor of the shower where the jiggling rod will come to rest between [pc.butt]’s cheeks.");
	
	output("\n\nGrinning luridly, you rise up on your [pc.knees] and siddle down until your [pc.vagOrAss] is pressed right up against the tapered tip. You draw in a sharp breath as the lubed-up latex easily spreads you apart around the narrow crown, easily sinking into your eager passage. Kaede hazards a glance over her shoulder, watching with wide eyes as you slide down the turgid pink rod of her other dildo.");
	
	output("\n\n<i>“Y-you know I’ve got a-”</i> Kaede starts, cut off by a particularly deep thrust that pins her to the wall and makes her cock drool white onto the deck.");
	
	output("\n\n<i>“I thought you didn’t want to use your cock,”</i> you tease back, sliding down until the knot presses against your clenching hole. You give Kaede the same treatment, pushing the smaller shaft so deep that the knot sinks half way in, stretching her even wider than before. Your lover just keeps moaning, grabbing at her breasts and hiking her tail in the air, a silent plea to keep pounding her.");
	
	output("\n\nYou’re taken by a wicked idea, though - one leagues better than just teasing the poor butt-slut until she creams herself! Grabbing Kaede’s waist to steady her, you lean forward and whisper relaxing nothings in her ear, telling her to just stay nice and open for you. She whines, but her ass is utterly unresistant as you sink the rest of the latex shaft’s knot into her, tying her to the toy. Her cock throbs, drooling thicker streaks of white onto the floor as your ministrations milk her prostate but never let her really cum.");
	
	output("\n\nNow that the toy’s firmly knotted in Kaede’s ass, you grab her hips in both hands and yank her back, planting the half-ausar’s firm behind right in your crotch");
	if (pc.hasCock()) output(" and sliding your semi-hard schlong through the crack of her ass and into the base of her fluffy tail");
	output(". The cup-shaped base of the toy presses into your groin, shifting ever so slightly as you move on your own thicker shaft. Giving your lover a playful squeeze, you start to rock your [pc.hips] against her behind, grinding the knot inside Kaede’s hole like it’s your very own puppy pecker. She gasps, smiles, and arches her back as you start to hump away at her.");
	
	output("\n\nEvery faux-thrust you make drags the other dildo through your [pc.vagOrAss], reciprocating the pleasure you’re giving her in full. You pull Kaede close, pinning her tail between your moving bodies and reaching around her shoulder to give the halfbreed a kiss. She giggles and takes it, thrusting her tongue into your mouth and playing it around your own. Her moans are muffled in your [pc.lips], eventually fading into a single, ceaseless murmur of pleasure to the beat of her anal violation.");
	
	output("\n\nThe way you’re treating her, it’s only a matter of time before Kaede’s throbbing crimson knot swells with her rising need, then erupts in a downward geyser of white cream. She gasps, tail beating against your [pc.chest] as her unused cock splatters her thighs and the stall wall. <i>“O-oh god! Fuck yeah!”</i> she cries, groping at her chest as you keep pounding the knotty toy against her battered backdoor g-spot.");
	
	output("\n\nFeeling the puppy-girl cream herself, hearing her moans, and watching her eyes roll back in shameless ecstasy, it’s all enough to make you rush to join her in climax. Your [pc.hips] slam back against the other toy");
	if (pc.hasCock()) output(", grinding your [pc.cock] through Kaede’s clenching ass-crack");
	output(" and knot yourself, letting the nearly fist-sized bitch-breaker tie you down with an explosive sensation of stretching pleasure.");
	
	output("\n\nYou cum hard around the turgid latex toy, your [pc.vagOrAss] clenching like mad but unable to ever feel anything but speared and spread apart by the faux doggycock.");
	if (pc.hasCock())
	{
		output(" Your own [pc.cock] discharges all over Kaede’s back as the knot sets in, pressing heavily against your");
		if (!pc.hasVagina()) output(" anal");
		output(" g-spot. She gasps as hot [pc.cumNoun] splatters across her arched, bare back and into her sopping wet tail. So much for getting her cleaned up!");
	}
	output(" Kaede moans, grinding against your crotch until you wrap your hands around her waist and pull her back into your lap, settling her against yourself as your body rises out the throes of orgasm. She gives you a husky little moan, craning her neck around to demand a kiss that you happily grant her.");
	
	output("\n\n<i>“I love it when " + indefiniteArticle(pc.raceCute(true, true)) + " like you takes charge,”</i> she purrs, tail wiping wetly against your crotch. <i>“Wish we could stay like this forever.”</i>");

	output("\n\nYou smile and stroke her ginger hair, telling her that you’d enjoy that. But, all good things must come to an end - or she’s never going to make that meeting. Kaede sighs and squirms out from your grasp, grabbing the washcloth from the shelf and wiping herself clean once again.");
	
	output("\n\n<i>“C’mon, let me clean you up,”</i> she offers.");
	
	output("\n\nYou laugh and let the little ginger minx go to work, scrubbing your body down before you take the cloth and repeat the service for her, making sure to thoroughly erase the last evidence of the bestial butt-fucking she just got. Kaede gasps when your suds-up cloth teases her crack, but you remind yourself to be a gentle"+ pc.mf("man", "woman") +"... this time. By the time you’re done, Kaede’s as shiny-clean as she was before you had your way with her again and again");
	if (pc.isFeminine()) output(" and once you step out of the shower, you even have her hair and makeup back to tip-top shape");
	output(".");
	
	output("\n\nA few minutes later and the two of you are dressed and ready once more, lounging around the common room of Kaede’s cozy starship. She refuses to let you go without at least one more drink, and at least a passing invitation to join her crew as her professional butt-stuffer. She gives you a tipsy laugh after that before flopping her head into your lap, murmuring that she absolutely wants a repeat performance. As often and as hard as you can give it. You stroke her hair until your drink’s finished, and she pulls herself up with a wistful sigh.");
	
	output("\n\n<i>“Alright, I guess it’s almost time,”</i> she says, reaching for her jacket. <i>“Can’t keep this Director Rhenesunne waiting.”</i>");
	
	output("\n\nYou follow her to the door and back out onto the docking arm. Kaede gives you a tight hug, turning to the walkway. <i>“See you around, lover. Soon, I hope.”</i>");
	
	output("\n\n<i>“Soon,”</i> you echo, giving her a parting pat on the ass as she leaves. Kaede flashes a wink over her shoulder, and walks off with a spring in her step and a sway in her hips.");

	processTime(20+rand(10));
	IncrementFlag("KAEDE_FUCKED");
	pc.orgasm();

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function uvetoKaedeFuckHerAss(arg:Array):void
{
	clearOutput();
	kaedeHeader(true);
	
	var cIdx:int = arg[0];
	var fuckedHer:Boolean = arg[1];
	
	output("Considering");
	if (fuckedHer) output(" the two of you skipped right to the fun stuff");
	else output(" you didn’t even put your cock to use");
	output(" last time, you’re more than content to let your submissive shemale lover slurp and suck to her heart’s content. Turns out the old spacer myth about dog-girls and bones is true, the way Kaede greedily handles your [pc.cock "+cIdx+"]: she eagerly kisses and caresses your [pc.cockHead "+cIdx+"], slurps at your shaft, and");
	if (pc.balls > 0 || pc.hasKnot(cIdx))
	{
		output(" fondles your");
		if (pc.balls > 0) output(" [pc.balls]");
		if (pc.balls > 0 && pc.hasKnot(cIdx)) output(" and your");
		if (pc.hasKnot(cIdx)) output(" [pc.knot]");
	}
	else output(" plants long kisses on your base while your length is buried deep down her throat");
	output(".");
	
	output("\n\nEventually, though, you can’t take any more - the halfbreed’s oral ministrations are so intense, so eager to please in every way possible, that you’re seconds from busting a second nut right down her throat. Not that you think she’d mind, but you aren’t letting Kaede get you off without returning the favor. As much as you’d love to do anything else, you put a commanding hand on your lover’s head, right between her soaked ausar-ears, and push her back from your shaft.");
	
	output("\n\nKaede looks up at you with her big blue eyes, confused. <i>“Wh-”</i> she starts to say, right until you grab her under her arms and heft her up. Her crimson pecker bobs heavily as you get her upright, just long enough to give the tender rod a consolation stroke before flipping Kaede around and pushing her face-first into the shower-stall wall. She gives a little yelp of surprise, but her sodden ginger tail lifts up as reliably as can be the moment you get behind her, inviting you to take its owner however you please.");
	
	output("\n\n<i>“Gotta get as dirty as we can before we get really clean, right?”</i> Kaede giggles as your hands reach down to explore her taut cheeks, reaching between them to roll her pouch of a sack between your fingers. The way you’ve pushed her against the wall, Kaede’s cock is flat against the wall, stiff as a tungsten rod and already tipped with a crest of white from your balls-groping. Too bad it’s not going to get any love here, but then again, you know Kaede’s got such a sensitive little back door that she’s sure to get off hands-free. In fact, you’re going to make sure she does!");
	
	output("\n\nGrinning to yourself, you wet a couple of fingers and slide them into the gulf of Kaede’s ass-crack, spreading her taut cheeks wide to reveal the black hole they’re hiding. She gasps, then moans appreciatively as your fingertips circle her entrance, gently pressing in.");
	if (fuckedHer)
	{
		output(" After the raw ass-fucking you just gave her, Kaede’s back door opens easily for you, and the mix of lube and cum you’ve already pumped her behind with makes it easy to tease your way inside.");
	
		output("\n\n<i>“Y-you’re really obsessed with my ass, aren’t you?”</i> Kaede murmurs, arching her back as you slide inside. <i>“Mmm. Feels so good, though...”</i>");
	}
	else
	{
		output(" It takes a little effort, but with the constant downpour of the shower to lube your way, and Kaede’s naturally receptive body completely submitting to your hand, it doesn’t take long to force your way inside her tight backdoor.");
	
		output("\n\n<i>“Ah! Oh, oh that’s nice...”</i> your lover murmurs, wiggling her tail in your face. <i>“Don’t tease me too long... I wanna feel that [pc.cock] of yours deep in there!”</i>");
	}

	output("\n\nYou grin, happy that Kaede loves what you’re doing to her so much. Giving her an affectionate boob-squeeze, you press yourself flush against her arched back and start to work your hands on her, thrusting your digits on one hand deep and groping and squeezing every tender spot outside with the other. It barely takes any effort to get Kaede moaning and pushing back against your buried fingers, but it’s the rhythmic <i>thump-thump</i> of her cock throbbing, slapping weakly against the wall that really tells you just how much your lusty lover’s enjoying it. Her prick bounces to the quickening beat of her heart, an undeniable and primal display of her desire... and her absolute, utter acquiescence to your control. Even without a single tender touch, you’ve gotten your lover rock hard and desperate for your touch, moaning and wiggling her svelte behind for you as if to tempt you into giving her more.");
	
	output("\n\nWith Kaede so willingly putting herself at your mercy, you can’t help but want to fulfill her every carnal desire. You pull out of her, letting the shower-head clean your fingers, and grab your [pc.cock]. Your teasing, and the blowjob that preceded it, has left you almost as hard as Kaede is, and it’s practically effortless to align yourself with the wide-open dark star between your lover’s ass cheeks.");
	
	output("\n\n<i>“G-give it to me,”</i> Kaede breathes huskily, biting her lip as she feels your [pc.cockHead "+cIdx+"] starting to spread her open. <i>“Ohgodyeeessss!”</i>");

	output("\n\nYou grin and press your [pc.hips] in, holding Kaede’s hips steady as your [pc.cock "+cIdx+"] starts to sink into the welcoming embrace of the halfbreed’s lubed-up hole. She lets out an exultant groan of pleasure as you take her, while her own needy cock helplessly hammers the smooth wall and smears her excitement across it.");
	
	pc.cockChange();

	if (pc.tallness > 70 || pc.PQ() > 90)
	{
		output("\n\nYour ");
		if (pc.balls > 0) output("balls-");
		output("deep thrust just about lifts Kaede off the ground, making her shriek with pleasure and alarm in equal measure. Her legs kick around helplessly as you heft her up, pinning her completely between your meaty member and the slick wall. ");
	}
	output("By the time you");
	if (pc.cockVolume(cIdx) > 250) output(" bottom out");
	else output(" completely hilt yourself");
	output(" in the randy pup’s behind, she’s breathing hard, gasping with mind-numbing pleasure, and squeezing you so tight you’re almost ready to burst. It takes every ounce of willpower you have to pull back out again, dragging inch after inch of [pc.cockNounSimple "+cIdx+"] back through the sinfully tight ring of Kaede’s squeezing behind.");

	output("\n\nThe constant downpour from on high gives you another lavish coating of lube, making it just a little easier to slide back inside her - and a little faster. Your third thrust might as well be into any ausar girl’s dripping quim the way you glide through Kaede’s burning walls. Your lover moans in absolute ecstasy, biting her lip and reaching back to grab at you, groping your hips and [pc.chest]");
	if (pc.cocks.length > 1) output(" and excess cocks");
	output(" in a desperate bid to steady herself, to take some measure of control as you build up your pace.");

	output("\n\nSmirking, you grab her hands and pin them to the walls, making sure she can’t do a thing but take it like the lusty little butt-slut she is. Kaede gives a whimpering little moan but doesn’t resist, too enthralled by pleasure to risk your wrath - or worse, you doing anything but fucking her harder!");
	
	output("\n\n<i>“That’s more like it,”</i> you growl, nipping at the halfbreed’s canid ear between prostate-crushing thrusts. She mewls, a wordless affirmation that she’s loving every second of it. Then again, her tumescent erection tells the story much more honestly than even Kaede’s husky, lurid moans can: her knot’s at full mast, a nearly fist-sized ball of bitch-breaking flesh so swollen with cum you’re half-sure you could milk it right out with just a little squeeze. You restrain yourself, sure that the way you’re pounding its owner like the cum-hungry");
	if (pc.isAss()) output(" ausar bitch");
	else output(" beauty");
	output(" she is, there’s no doubt that lustrous cock of hers is about to blow its load all on its own.");
	
	output("\n\nYou’re not far behind yourself, now that you think about it. The way Kaede’s tight little tail-hole squeezes and kneads your member with every thrust, milking you as eagerly as any cum-thirsty quim, is driving you ever more wild with lust. All you can do to sate yourself now, though, is grab two handfuls of Kaede’s plush behind and spread her wide, hammering yourself as deep in as you can possibly go until the pleasure finally overwhelms you - and your lover.");
	
	output("\n\n<i>“Gonna... gonna... ohfuck!”</i> Kaede cries a moment before you announce your own climax. She cries out in absolute bliss, throwing her head back and letting you ream her to orgasm. Thick streaks of white ausar cream shoot straight down from her untouched prick, splattering across her feet as you milk her much-abused prostate for everything it’s got. Her climax brings yours on as sure as sunrise, though, as her ass squeezes down so forcefully around your [pc.cock "+cIdx+"] that you can’t help but give the randy pup what her hole’s been craving all this time.");

	output("\n\nWith a grunt of climactic pleasure, you");
	if (pc.cockVolume(cIdx) <= 250) output(" hilt yourself in Kaede’s ass");
	else output(" slam yourself so deep inside that Kaede’s belly practically bulges with the sheer size of you");
	output(" before you let loose a");
	if (pc.cumQ() >= 5000) output(" tidal wave of pent-up spunk deep in the puppyslut’s greedy ass, flooding her abused back-door with your seed");
	else if (pc.cumQ() >= 1000) output(" series of thick, creamy ribbons of spunk deep into Kaede’s hungry bowels");
	else if (pc.cumQ() >= 250) output(" few thin, creamy strands of spunk into the lusty halfbreed’s behind");
	else output(" spurt of all the cum you can muster, plastering the walls of Kaede’s cock-holster with seed");
	output(". You stay buried in her, letting Kaede’s own spasming muscles drain your [pc.cock "+cIdx+"] dry until she’s finally calmed down from her own climax, still drooling white puppy cream from the tip of her red rocket.");

	output("\n\n<i>“O-oh,”</i> is all she can manage to say before you drag yourself out of her, making Kaede’s cock jump one last time before you pop wetly out of her well-fucked asshole. A steady trickle of [pc.cumColor] cream follows you out, splattering on the deck behind her and mixing with her own sizable mess. For someone with the tightest little trap-pouch you’ve ever seen, Kaede sure cums like a champ - there’s a puddle of sticky white plastered all between her legs, and her knot’s not even soft yet.");
	
	output("\n\nChuckling to yourself, you let your fatigue take over and slump against Kaede’s back, keeping her pinned where she belongs: between you and the cum-soaked walls. She gives you a husky little moan, craning her neck around to demand a kiss that you happily grant her.");
	
	output("\n\n<i>“I love it when " + indefiniteArticle(pc.raceCute(true, true)) + " like you takes charge,”</i> she purrs, tail wiping wetly against your crotch. <i>“Wish we could stay like this forever.”</i>");
	
	output("\n\nYou smile and stroke her ginger hair, telling her that you’d enjoy that. But, all good things must come to an end - or she’s never going to make that meeting. Kaede sighs and squirms out from your grasp, grabbing the washcloth from the shelf and wiping herself clean once again.");
	
	output("\n\n<i>“C’mon, let me clean you up,”</i> she offers. <i>“Stop me if I try and suck your cock again. I do actually need to leave sometime today... and still be able to walk straight.”</i>");
	
	output("\n\nYou laugh and let the little ginger minx go to work, scrubbing your body down before you take the cloth and repeat the service for her, making sure to thoroughly erase the last evidence of the bestial butt-fucking she just got. Kaede gasps when your suds-up cloth teases her crack, but you remind yourself to be a gentle"+ pc.mf("man", "woman") +"... this time. By the time you’re done, Kaede’s as shiny-clean as she was before you had your way with her again and again");
	if (pc.isFeminine()) output(" and once you step out of the shower, you even have her hair and makeup back to tip-top shape");
	output(".");
	
	output("\n\nA few minutes later and the two of you are dressed and ready once more, lounging around the common room of Kaede’s cozy starship. She refuses to let you go without at least one more drink, and at least a passing invitation to join her crew as her professional butt-stuffer. She gives you a tipsy laugh after that before flopping her head into your lap, murmuring that she absolutely wants a repeat performance. As often and as hard as you can give it. You stroke her hair until your drink’s finished, and she pulls herself up with a wistful sigh.");
	
	output("\n\n<i>“Alright, I guess it’s almost time,”</i> she says, reaching for her jacket. <i>“Can’t keep this Director Rhenesunne waiting.”</i>");
	
	output("\n\nYou follow her to the door and back out onto the docking arm. Kaede gives you a tight hug, turning to the walkway. <i>“See you around, lover. Soon, I hope.”</i>");
	
	output("\n\n<i>“Soon,”</i> you echo, giving her a parting pat on the ass as she leaves. Kaede flashes a wink over her shoulder, and walks off with a spring in her step and a sway in her hips.");

	processTime(20+rand(10));
	IncrementFlag("KAEDE_FUCKED");
	pc.orgasm();

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function uvetoKaedeGoodbye():void
{
	clearOutput();
	kaedeHeader(true);

	output("You nod at her, giving Kaede’s tight behind an appreciative swat as she slinks past. She gasps and blushes, flicking her bushy red tail at you. <i>“Thanks for the fun, [pc.name]. That was... well, I hope that was half as good for you as it was for me.”</i>");
	
	output("\n\nDefinitely. You swing out of your seat and [pc.walk] over to her, grabbing Kaede by the waist and spinning her around into a quick kiss. Her eyes are wide open, taken by surprise, but quickly flutter down into a sated lull.");
	
	output("\n\n<i>“I’ll take that as a yes,”</i> she smiles, wrapping her arms around you. <i>“I’m gonna see you again, right?”</i>");
	
	output("\n\nYou nod and give her a little shove towards her shower, saying you’ll be eagerly awaiting your next encounter. Kaede blows you a kiss over her shoulder before disappearing into her bathroom, and you’re left to grab your gear and swagger on out, back into the station foyer.");

	processTime(10);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}