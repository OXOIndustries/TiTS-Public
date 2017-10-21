// Erika the shemale kaithrit
// https://docs.google.com/document/d/1hyrYOSlZGf6ROCvbXlak7LI3a8OFT2QArRqPYcOzOO8/edit#heading=h.q5mjn84i7rif
	
// ERIKA_MET					Met her before
// ERIKA_SEXED					Had sex at least once
// ERIKA_SEEN_NAKED			Erika has visited PC ship, PC has seen Erika naked, PC has seen her toys
// ERIKA_TALKED_ABOUT_HER		Talked about her
// ERIKA_TALKED_ABOUT_BODY		Talked about her body
// ERIKA_TALKED_ABOUT_MOTHER	Talked about her mother

public function showErika(nude:Boolean = false):void
{
	showName("\nERIKA");
	showBust(erikaBustDisplay(nude));
}

public function erikaBustDisplay(nude:Boolean = false):String
{
	var sBust:String = "ERIKA";
	if(nude) sBust += "_NUDE";
	return sBust;
}

public function erikaBarAddendum(btnSlot:int = 0):void
{
	output("\n\n");
	
	if (flags["ERIKA_MET"] == undefined) output("A slender kaithrit girl is sitting alone at the bar, tails wrapped around her waist. She is nursing a drink and looking around the bar. She notices that you're looking back at her and quickly turns away to look at her drink, ears flat against her head. After a while she takes another peek at you, with the same result.");
	else output("Erika is sitting at the bar again, nursing a drink. She notices you and gives you a little wave and a hopeful smile before turning back to her drink.");
	
	//Stygs ToDo Add desciptions to button
	addButton(btnSlot, (flags["ERIKA_MET"] != undefined ? "Erika1" : "Erika2"), erikaMainMenu);
}

public function erikaMainMenu():void
{
	clearOutput();
	showErika();
	author("Doots");

	if (flags["ERIKA_MET"] == undefined)
	{
		output("You decide to see why the kaithrit girl is sitting alone in a bar at this time of the day. You find a seat next to her. ");
		if (pc.isNice()) output("\n\n“<i>I noticed that you seem to be interested in me, or am I wrong?</i>” She mutters in the affirmative. Placing a hand on her thigh, you continue, “<i>I would still like to know your name.</i>”");
		else if(pc.isMischievous()) output("\n\n“<i>So are you going to tell me your name, or are you going to try to take </i>subtle<i> looks at me all night?</i>”");
		else output("\n\n“<i>You have a staring problem, or do you have a good reason why you can't get your eyes off me?</i>” Before she can say anything, you cut her off. “<i>If you're going to stare at me all night you could at least tell me your name...</i>”");
		output("\n\n“<i>Umm… E-Erika,</i>” she stammers, tails wrapped in her lap and ears folded against her head.");
		output("\n\n“<i>[pc.name],</i>” you tell her. “<i>[pc.name] Steele. ");
		if (pc.isNice()) output("Now, were you trying to get my attention, or were you just staring at me when you thought that I wasn't looking?</i>”");
		else
		{
			if(pc.isMischievous()) output("So why did you have your eyes glued to me? Were you trying to get a peek at my [pc.butt]?</i>”");
			else output("So were you hoping that I would come here and make you scream my name all night, or were you just looking to waste my time?</i>”");
			output("\n\n“<i>No, it was an accident,</i>” she mutters.");
			if (pc.characterClass == GLOBAL.CLASS_SMUGGLER) output("\n\n“<i>That's what I told the officer, but she didn't believe me.” You sneak your hand down her pants and squeeze her expansive ass flesh. “<i>That was an accident too,</i>” you smirk at her.");
		}
		output("\n\nYou look the slender kaithrit up and down while wondering what you'll do with her. You could probably get this kitty to your bed quite easily.");
		flags["ERIKA_MET"] = 1;
	}
	else
	{
		if (pc.isNice())
		{
			output("You sit down next to Erika just as she finishes her drink. You greet her and offer her a drink.");
			output("\n\n“<i>Thank you for the offer, but no. Maybe some other time?</i>” Instead of taking your offer, she orders another drink from Burt.");
			if (flags["ERIKA_SEXED"] == undefined) output("\n\n“<i>So, do you want to hang out for a bit, maybe keep me company for a bit?</i>” She fidgets a bit, waiting for your answer.");
			else output("\n\n“<i>Did you just come for a chat or did you want something else, maybe go back to your ship?</i>” She slowly starts to blush at the suggestion.");
			output("\n\nNow, to decide why you came up to her in the first place: Did you want to talk her ear off, or just say hi to her?");
		}
		else if (pc.isMischievous())
		{
			if (flags["ERIKA_SEXED"] == undefined)
			{
				output("You walk behind her, and without saying a thing you grab the tip of her tail. As you tickle it her entire body tenses for a moment, before she starts purring.");
				output("\n\n“<i>Aww, were you hoping for me to show up?</i>”");
				output("\n\n“<i>M-maybe,</i>” she stammers out, as you keep tweaking the tip of her tail.");
				output("\n\nWhether you just talk to her or try to get something more substantial going is up to you; or you could just keep on torturing the tip of her tail.");
			}
			else
			{
				output("You sneak up behind Erika and announce your presence by grabbing her butt cheeks with both hands, making her let out a small yelp. After being smacked in the face by her tails a couple of times, you decide to let go of her butt.");
				output("\n\nShe turns to look at you, smiling. “<i>[pc.name], did you want to talk or...</i>” she says, blushing at the suggestion. You sit next to her and think about what you actually want to do with her.");
				output("\n\nDo you want to take this kitty back to your ship, stay here at the bar talking with her, or did you just want to fondle her butt?");
			}
		}
		else
		{
			if (flags["ERIKA_SEXED"] == undefined)
			{
				output("Walking up to Erika, you slap her back.");
				output("\n\n“<i>You're here alone again. Were you hoping for me to come and keep you company?</i>” You laugh boisterously.");
				output("\n\nShe pouts a bit at your comment. “<i>Well, I like you. So why wouldn't I hope for that?</i>”");
				output("\n\nNow it's up to you to take the initiative on what to do.");
			}
			else
			{
				output("You decide to have some more fun with the little kitty sitting at the bar. You silently come up behind her and slap her ass, causing her to spill her drink.");
				output("\n\n“<i>[pc.name]! Why did you do that?</i>” she whines.");
				output("\n\n“<i>Because it was fun.</i>” You grin at her, slipping one hand down her pants and groping at her junk. You whisper in her ear that you want to have some more fun with your silly little slut.");
				output("\n\nAt that she turns bright red, but her tails are swaying faster than before. What shall you do with this little kitty? Should you talk with her for a bit, take her back to your ship, or just leave her here wondering why you came up to her only to make her spill her drink?");
			}
		}
	}

	clearMenu();
	addButton(0,"Talk",erikaTalkMenu);
	addButton(1, "Buy Drink", erikaBuyDrinkMenu);
	// dont check for genetials, anal should still be avaible for neuters
	addButton(2, "Sex", erikaSexMenu);
	addButton(5,"Appearance",erikaAppearance);
	addButton(14,"Leave",mainGameMenu);
}

public function erikaTalkMenu(doOut:Boolean = true):void
{
	if (doOut)
	{
		clearOutput();
		output("You tell her that you want to talk.");
		output("\n\n“<i>Well, If you have something you want to talk about then sure, but when it comes to me I don't think there is much to talk about.</i>”");
	}
	showErika();
	author("Doots");

	clearMenu();
	addButton(0,"Her",erikaTalkHer);
	addButton(1,"Drinking",erikaTalkDrinking);
	addButton(2,"Body",erikaTalkBody);
	// [Mother] (requires talk about her. Can be done only once)
	if (flags["ERIKA_TALKED_ABOUT_HER"] != undefined && flags["ERIKA_TALKED_ABOUT_MOTHER"] == undefined)
	{
		addButton(3,"Mother",erikaTalkMother);
	}
	else if (flags["ERIKA_TALKED_ABOUT_HER"] != undefined && flags["ERIKA_TALKED_ABOUT_MOTHER"] != undefined)
	{
		addDisabledButton(3,"Mother", "Mother", "Erika doesn't want to talk about this again..");
	}
	else
	{
		addDisabledButton(3,"Locked","Locked","You don’t know enough about her for this.");
	}
	// [Sister] (requires talking about [Body] and [Her] and talked to Lerris)
	if (flags["ERIKA_TALKED_ABOUT_HER"] != undefined && flags["ERIKA_TALKED_ABOUT_BODY"] != undefined && flags["MET_LERRIS"] != undefined)
	{
		addButton(4,"Sister",erikaTalkSister);
	}
	else addDisabledButton(4,"Locked","Locked","You don’t know enough about her for this.");
	addButton(14,"Back",erikaMainMenu);
}

public function erikaTalkHer():void
{
	clearOutput();
	showErika();
	author("Doots");

	output("You ask her to tell you something about herself.");
	output("\n\nNow, to decide why you came up to her in the first place: Did you want to talk her ear off, or just say hi to her?");
	output("\n\nShe pauses for a moment to think, then continues. “<i>Let's see. Well, I was born on Ausaril.</i>”");
	output("\n\nWhat were two kaithrit doing on Ausaril, or are her parents actually not kaithrit?");
	output("\n\n“<i>No, both of my parents are full-blooded kaithrit as far as I know. And regarding why they were on Ausaril, I really don't know. Maybe my mom had a thing for knotted cocks.</i>” Taking another drink, she pauses again, thinking about what to say next.");
	output("\n\nYou push her onwards by asking how she ended up on Mhen'ga if she was born on Ausaril.");
	output("\n\n“<i>Well, I wanted to leave home as quickly as possible. It's not like I had a bad childhood, but my other mom was a bit too nosy for my liking. You wouldn't know how... unpleasant it is for your other mom to burst into your room when you're taking some time for yourself.</i>” She blushes at that point, but soldiers onwards. She thinks for a while before looking down at her glass. ?");
	output("\n\n “<i>And my mother being the biggest whore on Ausaril.</i>” Her voice drips with venom when she mentions her mother. Her fist clenches and her knuckles turn white while she looks down at the table. Before you can ask her what's wrong she is back to her cheery self. “<i>Besides that, I wanted to move out, live on my own. I didn't want to live with my parents for the rest of my life.</i>”");
	output("\n\nSo why is she on Mhen'ga instead of some other planet?");
	output("\n\n“<i>Well, a shithole planet like this isn't too expensive to live on, and since I stay with the civilized folk I won't get buggered by the zil lurking around in the jungle. And it isn't too different from home. Besides, I usually don't leave my house, and working over the extranet means that I don't have to worry about local employment.</i>”");
	output("\n\nSo what does she do for a living, then?");
	output("\n\n“<i>I'd rather not talk about my work. You wouldn't be able to find a more boring topic,</i>” she deflects.");
	output("\n\nWould she rather talk about ");
	if (pc.characterClass == GLOBAL.CLASS_SMUGGLER) output("what it's like spending six hours getting your ship searched from top to bottom when you’ve done nothing illegal?");
	else if (pc.characterClass == GLOBAL.CLASS_MERCENARY) output("how to operate a tank?");
	else output("how the body of a KihaCorp class six companion droid works?”");
	output("\n\n“<i>Ok, fair enough, but I still don't want to talk about my work. It's irrelevant.</i>”");

	flags["ERIKA_TALKED_ABOUT_HER"] = 1;

	processTime(10+rand(5));
	erikaTalkMenu(false);
	addDisabledButton(0, "Her");
}

public function erikaTalkDrinking():void
{
	clearOutput();
	showErika();
	author("Doots");

	output("You decide to ask her why she is drinking this early in the day.");
	output("\n\n“<i>Well, it's not like I'm getting hammered. Have you tried getting drunk on this stuff? Besides, going out to drink is an excuse to leave home, hoping to meet someone nice, but I lack the confidence to chat up strangers since I'm generally not comfortable in public.</i>”");
	output("\n\nIf she doesn't like the cheap beer then why does she drink it?</i>”");
	output("\n\nAll of the other drinks that they offer here are ridiculously expensive. The mead tastes wonderful, but I'm not going to pour my credits down my throat. And the X-Zil-rate is even more expensive; plus apparently it makes you horny and I don't want to start popping boners in public.");
	output("\n\nBut still, why is she drinking this early in the day?");
	output("\n\n“<i>Later in the evening there are more people here, and I really don't like it when there are lots of people hanging around getting drunk, being obnoxious and loud.</i>”");
	output("\n\nSo she doesn't like hanging around other people?");
	output("\n\n“<i>No, it's not that. Well, kind of. It's being around drunks that I don't like, I like hanging out with you and other friends of mine.</i>”");

	processTime(10+rand(5));
	erikaTalkMenu(false);
	addDisabledButton(1, "Drinking");
}

//Stygs Todo:
// [Body] (need to take her to your ship once. Sex not required)
public function erikaTalkBody():void
{
	clearOutput();
	showErika();
	author("Doots");

	if (pc.isAss())
	{
		output("“<i>So were you born with your dick, or did you decide to trade in your puss for the chance of dicking someone?</i>”");
		output("\n\nShe chokes on her drink in surprise. After waiting a few moments for her to finish coughing up her drink and take a few deep breaths, she is able to reply, “<i>Geez, did you have to ask it so bluntly?</i>”");
		output("\n\nNo point in beating around the bush, you chuckle. Now, is she actually going to answer?");
		output("\n\nShe pouts at you for few moments, and with a sigh she opens up.");
	}
	else
	{
		output("“<i>I hope you don't mind me asking, but were you born with... with what you've got? You know, the boobs and a dick?</i>”");
		output("\n\nShe doesn't show a voluntary outward reaction to your question, instead taking another sip of her drink, but she is turning bright red and almost hiding behind her glass.");
		output("\n\nYou wait patiently for her to start talking, if she is willing to talk at all.");
		output("\n\nSetting her glass down, she lets out a sigh.");
		output("\n\n“<i>I'm not really a fan of talking about that, but if you really want to know...</i>” she says, looking at you questioningly.");
	}
	output("\n\n“<i>I was born male, and I grew up effeminate like all kaithrit. I always thought girls were really pretty, but instead of being like one of the other guys who wanted to fuck them, I wanted to be one.</i>”");
	output("\n\n“<i>At nineteen, when I had enough courage, I started to try on women's clothing. Small things at first, a bra here, panties there. Eventually I started wearing full-on women's clothing, skirts, dresses, and tops.</i>”");
	output("\n\n“<i>Eventually my sis, Lerris, found out what I was doing. She teased me at first, but she helped me embrace what I loved and eventually even set up a date with one of her friends: a gorgeous gryvain. She showed me what it was like to be loved like a woman.</i>”");
	output("\n\nShe blushes a bit before continuing. “<i>She showed me few other things as well, like how it felt to be fucked like a bitch and love it.</i>”");
	output("\n\n“<i>So, in the end, I owe my sister for a lot of things. If she hadn't seen me in those panties my life would probably suck a lot more now.</i>”");
	output("\n\nSo if she loves feeling like a woman, why hasn't she gotten the whole deal instead of just getting breasts?");
	output("\n\n“<i>Do you know the cost of something like that? I can't afford that! Besides, I really don't find herms that appealing.</i>”");
	if (pc.isHerm())
	{
		output("\n\nYou give her the kind of look that conveys that she fucked up.");
		output("\n\n<i>Well, you're an exception. I think that you're really hot. I meant that I don't find the idea of being a herm myself that appealing,</i>” she hastily fusses in apology.");
	}
	output("\n\nShe doesn't need to keep her dick if she gets a pussy. There are ways to get rid of it");
	if (flags["MET_DR_LASH"] != undefined) output(", and you have heard of a certain doctor who could take care of that");
	output(".");
	output("\n\n“<i>If I can't afford just a pussy do you think I can somehow also afford to get rid of my dick?");
	if (flags["MET_DR_LASH"] != undefined) output(" And I'm not going to let some doctor who I've never heard of touch me.");
	output("</i>”");
	output("\n\nIf money is the only reason, she could save up her credits");
	if (pc.isAss())
	{
		output(" or she could probably earn a pretty penny giving up that butt for sale.");
		output("\n\nShe stares at you, mouth hanging wide open. “<i>You're joking, right? Are you actually saying that I should whore myself out just to buy some mods to get a pussy?</i>”");
		output("\n\nYou burst out laughing after she finishes.");
		output("\n\n“<i>That wasn't funny.</i>” she pouts.");
	}
	else output(".");
	output("\n\n“<i>But, no, money isn't the only reason. The other reason is that getting a pussy is a really big step, and I'm not ready for that kind of thing.</i>”");
	output("\n\nAnd what's with the dog dick?");
	output("\n\n“<i>A ex-girlfriend of mine convinced me to try it out, she even paid for half of it. My only regret about it is that i didn't try it earlier.</i>”");

	flags["ERIKA_TALKED_ABOUT_BODY"] = 1;

	processTime(10+rand(5));
	erikaTalkMenu(false);
	addDisabledButton(2, "Body");
}

// [Mother] (requires talk about her. Can be done only once)
public function erikaTalkMother():void
{
	clearOutput();
	showErika();
	author("Doots");

	output("“<i>So, is there bad blood between you and your mom?</i>”");
	output("\n\n“<i>Ugh, I don't want to talk about that bitch. Besides, why do you care?</i>”");
	if (pc.isAss())
	{
		output("\n\n“<i>If you want to keep mulling over it, that's your prerogative, but that's just stupid. Nothing is going to get better, and before you ask how talking is going to help, you might actually get over it since you don't live with your mom anymore.</i>”");
	}
	else
	{
		output("\n\n“<i>Look, if you talk about it, you might feel better, especially now that you live on your own.</i>”");
	}
	output("\n\nErika seems a bit defeated and sighs. “<i>Fine. You win, you win, but just this once. So why do I hate my mother? Well, she ruined everything. Leaving my other mom for some kui-tan asshole with a big cock and a fat wallet.</i>”");
	output("\n\nHer hands start to shake a bit, but she continues. “<i>She didn't even have the decency to  break up with her properly, or nicely for that matter. One day she was just gone, with no word from her at all besides the pictures of her sucking and riding that bastard's dick. Both her ass and pussy were overflowing with his cum, and finally there was a picture of her just covered in it. So that was a lovely way of telling my other mom that they were breaking up.</i>”");
	output("\n\nYou notice that there are small wet spots forming on the counter. Looking closer, you can see that tears are flowing freely down her face. ");
	if (pc.isNice()) output("You pull her into a hug, holding her against your [pc.chest]. You say nothing, simply holding her against you.");
	else if(pc.isMischievous()) output("You place your hand on her shoulder, offering her a small sign of comfort, whispering in her ear that she doesn't need to continue if it hurts too much.");
	else output("You're unsure what to do, so you wrap your arm around her neck.");
	output("\n\nShe takes a moment before continuing. “<i>She didn't take it too well. Hit the bottle hard after that, lost her job because she was too drunk to work, and things just kept getting worse. She would get really angry when she was drunk. Never hit me or my sis, but we were still always so scared. Eventually, we had to get jobs since she was unable to keep one. It was on us to pay the bills, so we would have food on the table and a roof over our heads. We went through all of that just because my mom was a gold-digging WHORE!</i>” She slams her glass down on the counter, spilling most of her drink. She grunts, pushing the half empty drink aside.");
	output("\n\nShe takes a few moments to compose herself, and then continues talking. “<i>That's why I hate my mom. I even changed my name since I didn't want to go by the name my whore of a mother gave me.</i>”");
	output("\n\nWell, it seems she has a good reason to be angry with her mom. You doubt that she would be willing to talk about this subject again.");

	flags["ERIKA_TALKED_ABOUT_MOTHER"] = 1;

	processTime(10+rand(5));
	erikaTalkMenu(false);
	addDisabledButton(3, "Mother");
}

// [Sister] (requires talking about [Body] and [Her] and talked to Lerris)
public function erikaTalkSister():void
{
	clearOutput();
	showErika();
	author("Doots");

	output("You happen to know a kaithrit by the name Lerris, it could be coincidence but it never hurts to ask. “<i>Does your sister happen to work at the TamaniCorp shop on Tavros?</i>”");
	output("\n\nHer attention picks up when you mention Lerris “<i>You know her? Man, I wonder how is she doing, it’s been ages since I last saw her.</i>”");
	if (flags["FUCKED_LERRIS"] == undefined)
	{
		if (pc.isNice()) output("“<i>Yeah, she seems like a nice sister to have,</i>” you say, thinking back to the few times you spoke with Lerris.");
		else if(pc.isMischievous()) output("“<i>Yeah I chatted with her a few times, cute girl, but I think you're cuter.</i>” You give her a wink, making her blush briefly.");
		else output("“<i>Yeah, she's a bit of a slut, I can tell you two are related.</i>” She sputters when you call her and her sister sluts and shoots you a dirty look, earning a chuckle from you.");
	}
	else
	{
		if (pc.isNice()) output("“<i>Yes, I do know her... and I’ve spent few intimate moments with her,</i>” you say, trying to not shock her with the knowledge that you have had sex with her sister.");
		else if(pc.isMischievous()) output("“<i>Yeah I know her all right, I know her </i>really<i> well.</i>” You wink at her, making your way of telling that you have had sex with her sister even less subtle.");
		else output("“<i>Yup and I've fucked her too, she's a real slut, just like you.</i>” You punctuate what you said with a sharp slap on her ass.");
	}
	output("\n\n“<i>Man, I miss her, I really should visit her one of these days. Is she doing all right?</i>” she seems to be excited by the concept of hearing about her sister, her ears twitching slightly and tails swaying faster than before.");
	output("\n\nYou lean against the bar, thinking what to tell her, Lerris didn't exactly give you her life story, but she seemed genuinely happy, and you tell her so.");
	output("\n\n“<i>Good to hear that sis is doing well. I owe her so much for everything she did for me. She hooked me up with my first girlfriend, and she was there for me when I needed her. When some guy that you are sweet for, and has been patient with you the whole time, dumps you because he thought you were a girl... at moments like that, you need a person to hold you the most, and my sister was always there for me.</i>” She sighs, lost in mixed memories.");
	output("\n\n“<i>If you love your sis so much why did you leave her behind and leave for Mhen'ga.</i>”");
	output("\n\n“<i>Well, like I said, I wanted to live my own life, and well,</i>” she circles the rim of her glass “<i>I was starting to feel like a burden on my sister. I wasn't able to find a job, and needed constant emotional support. I didn't want to feel like a bum anymore.</i>” Her ears droop a bit at what she says. “<i>I actually didn't contact her for the longest time, it was hard to ignore her calls but I wasn't prepared for her reaction. When I finally answered her she was worried mostly, angry too, but mostly worried.</i>”");
	output("\n\n“<i>I have been trying to keep in touch with my sis but I haven't been doing a good job of it. It's nice to hear that she's still doing well.</i>” a warm smile spreads across her face. “<i>Tell me: is she still a mod hound like no other?</i>”");
	output("\n\nYou chuckle. “<i>Yeah it didn't take her long to say how she has tried every mod they sell");
	if (flags["LERRIS_ITEMS_GIVEN"] != undefined) output(", I even gave her some mods");
	output(".</i>”");
	output("\n\nErika chuckles softly before standing up. “<i>Hey, I'm going to call my sis and catch up, thanks for bringing her up.</i>”");
	output("\n\nShe leaves you sitting alone at the bar with a smile on your face, such optimism is infectious. After a while, you leave too, the smile clinging to your face.");

	processTime(10+rand(5));
	erikaTalkMenu(false);
	addDisabledButton(4, "Sister");
}

public function erikaBuyDrinkMenu(doOut:Boolean = true):void
{
	if (doOut)
	{
		clearOutput();
		output("You decide to buy Erika a drink.");
	}
	showErika();
	author("Doots");

	clearMenu();
	if(pc.credits >= 1) this.addButton(0,"Crabbst",erikaBuyDrinkCrabbst,undefined,"Crabbst","Shitty beer.");
	else this.addDisabledButton(0,"Crabbst","Crabbst","You can’t afford this. Damn, you’re poor.");
	if(pc.credits >= 10) this.addButton(1,"Mead",erikaBuyDrinkMead,undefined,"Mead","Honey-based mead.");
	else this.addDisabledButton(1,"Mead","Mead","You can’t afford this.");
	if(pc.credits >= 50) this.addButton(2,"X-Zil-rate",erikaBuyDrinkXilErAte,undefined,"X-Zil-rate","Some kind of exotic, expensive brew.");
	else this.addDisabledButton(2,"X-Zil-rate","Z-Zil-rate","You cannot afford this.");
	addButton(14,"Back",erikaMainMenu);
}

public function erikaBuyDrinkCrabbst():void
{
	clearOutput();
	showErika();
	author("Doots");

	output("You call to Burt and order a Crabbst. He gives you a quizzical look but pours you the drink nonetheless. Taking a sip from the drink, Erika looks at you.");
	output("\n\n“<i>Would you believe that I've drunk something worse?</i>”");
	output("\n\nYou tell her that you have a hard time believing that.");
	output("\n\n“<i>Crabbst tastes horrible, but I'm used to how awful it tastes. I appreciate the thought, though.</i>” She gives you a small peck on the cheek.");

	pc.credits -= 1;

	processTime(15+rand(5));
	erikaBuyDrinkMenu(false);
	addDisabledButton(0, "Crabbst");
}

public function erikaBuyDrinkMead():void
{
	clearOutput();
	showErika();
	author("Doots");

	output("You call Burt over and order a bottle of mead. He quickly fills a glass and hands it over to you. Erika takes a sip of the mead and sighs with pleasure.");
	output("\n\n“<i>It's good to be treated sometimes. Getting to drink something besides that poison is wonderful. Thank you.</i>”");
	output("\n\nShe wraps her hands around your neck and pulls you into a kiss. After a while of fawning in your lap she pulls back, tails swaying.");

	pc.credits -= 10;

	processTime(15+rand(5));
	erikaBuyDrinkMenu(false);
	addDisabledButton(1, "Mead");
}

// Stygs ToDo Add the sex options
public function erikaBuyDrinkXilErAte():void
{
	clearOutput();
	showErika();
	author("Doots");

	output("Calling Burt over you order a glass of X-Zil-rate. Giving you a smile, he pours a glass of the fine wine and places the glass in front of you. Erika stares unblinkingly at you as you hand the glass to her.");
	output("\n\n“<i>Are you really buying me this?</i>” You give her a small nod in response. She takes the glass from you, brings it to her nose, and inhales the smell of the wine. She takes a small sip at first, almost hesitantly, but soon gets into it. Later, while she is nursing it, you make small talk with her, mainly talking about what has been happening lately.");
	output("\n\nWhen she finishes her drink, she snuggles next to you. “<i>Thank you, that tasted heavenly.</i>” She is lost in her tipsy affection for you, not noticing that she's pressing her breasts against your body. Wrapping your arm around her shoulder you start to wonder if she'd be interested in some public fun. She looks up at you with glazed over eyes, tails trailing along your [pc.hips]. You're pretty sure that she is game if you are, so it's up to you to decide what to do.");

	pc.credits -= 50;
	//Stygs ToDO Add a flag or status to show the sex buttons for all drinks after drinking XZilRate
	processTime(15+rand(5));
	erikaBuyDrinkMenu(false);
	addDisabledButton(2, "X-Zil-rate");
	if (pc.hasGenitals()) addButton(5, "Public Sex", erikaPublicSex);
	else addDisabledButton(5, "Public Sex", "Public Sex", "You need genitals to do this!");
	if (pc.hasGenitals()) addButton(6, "To The Ship", erikaTakeHerToShip1);
	else addDisabledButton(6, "To The Ship", "To The Ship", "You need genitals to do this!");
}

public function erikaPublicSex():void
{
	clearOutput();
	showErika();
	author("Doots");

	output("You decide that it's a good time to get some oral service from her. ");
	if (pc.tallness >= 84) output("You pick the small kaithrit up and hoist her over your shoulder.");
	else output("You grab her arm and pull her along.");
	output("\n\nSome of the other patrons give you a curious look as you make your way to a more secluded part of the bar with the kaithrit, arriving at one of the more remote tables. You take a seat and point her towards the underside of the table. She blushes when she realizes what you're implying, but she crawls under the table without any word edgewise.");
	if (pc.isCrotchGarbed()) output("\n\nShe crawls between your legs and looks up at you. You reach down ");
	else output(", getting any offending garments out of the way");
	output(", getting any offending garments out of the way");

	clearMenu();
	// Stygs ToDo Add reqiurements
	// [Dick] (Dick girth equal or under 3 inches and length under 20 inches)
	if (pc.hasCock()) addButton(0, "Dick", erikaPublicSexDick);
	else addDisabledButton(0, "Dick", "Dick", "You need a penis to do this!");
	if (pc.hasVagina()) addButton(1, "Pussy", erikaPublicSexPussy);
	else addDisabledButton(1, "Pussy", "Pussy", "You need a vagina to do this!");
	addButton(2,"Threesome",erikaPublicSexThreesome1);
}

public function erikaPublicSexDick():void
{
	clearOutput();
	showErika();
	author("Doots");
	
	var bhStyle:String = bessHairStyle();

	output("You grab your [pc.cock] and press it to her lips.");
	// Maybe  have all this apply for Bros too?
	// (pc.isBimbo() || pc.isBro())
	if (pc.isBimbo()) output("“<i>Like, a babe like you surely knows what to do.</i>”");
	else output("“<i>Do you know what to do?</i>”");
	output("\n\nShe looks up at you, her eyes wide and confused.");
	if (pc.isBimbo()) output("“<i>You got like, this far without an issue, you must know what you're doing.</i>” ");
	else output("“<i>Please, you're on your knees with a dick in your face. Surely you know what to do?</i>” ");
	output("She slowly opens her mouth. She wraps her soft lips around your [pc.cockHead] and you shudder as she takes you into her mouth fully, starting to pull your [pc.cock] down her throat. ");
	if (pc.isBimbo()) output("“<i>Ahhh, babe you almost put me to shame when it comes to sucking dick</i>”");
	else output("“<i>Ahhh, that's a good girl, I guess you were just playing up the innocent girl act- not that I mind.</i>”");
	output("\n\nYou lay your hand on her head, urging her to go deeper, scratching her ears every time she does so. You gasp as her lips suddenly press against your [pc.sheath].");
	if (pc.isBimbo()) output("\n\n“<i>You really like this don't you? Like you're in the middle of the bar, sucking on my lovely cock, ohh it must taste wonderful.</i>” ");
	else output("\n\n“<i>Ohh, someone is eager to please, I see. I really didn't expect you to be willing to deepthroat me in a public place, and in full view of anyone whose eyes wander downwards.</i>”");
	output("\n\nDespite your words, she doesn't slow down. In fact, she does the opposite. After a while her hand trails down between her legs, disappearing into her pants. It seems that she is getting excited by the idea that someone could see her sucking your [pc.dick].");
	output("\n\nHer increasing arousal makes her bob her head along your length faster. Her lack of skill shows, she’s clearly trying very hard but you're not going to cum from her just bobbing up and down on your cock.");
	output("\n\nAfter a while you push Erika back, leaving only your [pc.cockHead] in her mouth. ");
	if (pc.isBimbo()) output("“<i>Babe I like the teasing. But can we get to the good stuff?</i>” ");
	else output("“<i>Come on, surely you can do better.</i>” ");
	output("Her eyes fall towards the floor and her ears draw back. ");
	if (pc.isBimbo()) output("You clap your hand to your cheeks in surprise. “<i>Oh babe i didn't know. Let me guide you through this, oh your going to be such a wonderful cocksucker.</i>” ");
	else output("“<i>Oh, don't be like that, let me help you. Do as I say and you'll do great.</i>”");
	if (pc.isBimbo()) output("\n\n“<i>The head is, like the best part, not for just me but you get to taste all that delicious pre.</i>” ");
	else output("\n\n“<i>First, lick the head.</i>” ");
	output("You groan almost audibly as her tongue starts to swirl around your [pc.cockHead], licking at the most sensitive part of your member before focusing more on your cum slit.");
	if (pc.isBimbo()) output("\n\n“<i>Your doing great babe. Now take it deeper, but don't forget about the yummy head.</i>”");
	else output("\n\n“<i>You're doing well. Now take it deeper, but don't ignore the head,</i>” you murmur to her while scratching away at her ears.");
	output("\n\nShe does as you tell her, taking you into her throat again and periodically pulling back to lap at your [pc.cockHead]. You move your hand from her ears to grab the back of her head. You don't push her down, only controlling the pace, urging her to go quicker.");
	output("\n\nWith her other hand occupied in her pants, ");
	if (pc.balls > 0) output("she brings up her free hand to knead your [pc.balls], feeling and fondling them in anticipation of a serving of your [pc.cum] down her throat.");
	else if (pc.hasVagina()) output("she brings up her free hand to stroke the lips of your [pc.pussy], slowly pressing two of her fingers inside you while thumbing at your [pc.clit].");
	else output("she brings up her free hand to stroke your thigh and [pc.hip], seeking out any other sensitive spots to pleasure.");
	if (pc.isBimbo()) output("\n\n“<i>I'm so close babe, just a bit more.</i>” ");
	else output("\n\n“<i>Ah, almost there, just a bit more.</i>” ");
	output("you groan under your breath, urging her to go faster. Without a warning her throat starts convulsing around your length. The sudden tightness around your [pc.cock] makes you instinctively pull her head down your length");
	// Stygs ToDo Check if the knot belongs to the right cock
	if (pc.hasKnot()) output(", bumping the swelling bulb of your [pc.knot] against her lips");
	output(".");
	//PC has normal amount of cum: 
	if (pc.cumQ() <= 500)
	{
		output("\n\nYou're starting to get really close to the edge of your orgasm, with one last thrust into her mouth, you shoot most of your load down her throat and then pull back to shoot a few last ropes of your [pc.cum] into her mouth before withdrawing completely. She looks up at you with puppy eyes, swirling her tongue inside her mouth and getting a good taste of your cum. With a gulp she swallows down your load. ");
		if (InCollection(pc.cumType, [GLOBAL.FLUID_TYPE_CHOCOLATE_MILK, GLOBAL.FLUID_TYPE_HONEY, GLOBAL.FLUID_TYPE_STRAWBERRY_MILK,, GLOBAL.FLUID_TYPE_NECTAR, GLOBAL.FLUID_TYPE_VANILLA, GLOBAL.FLUID_TYPE_CHOCOLATE_CUM, GLOBAL.FLUID_TYPE_BLUEBERRY_YOGURT, GLOBAL.FLUID_TYPE_FRUIT_CUM, GLOBAL.FLUID_TYPE_FRUIT_GIRLCUM, GLOBAL.FLUID_TYPE_EGGNOG])) output("“<i>Mmm, tasty,</i>” she says as she licks her lips, sucking the last drop of your [pc.cum] from your tip.");
		else output("“<i>Bleh,</i>” she says as she sticks out her tongue, but she still licks the last drop of your [pc.cum] from your tip.");
		output("\n\nShe climbs up next to you from underneath the table. As she sits down, you notice a modestly sized wet spot between her legs. ");
		if (pc.isBimbo()) output("“<i>Babe, like I think we both enjoyed this.</i>”");
		else output("“<i>Looks like you enjoyed your time under the table.</i>” you say as you smile to her. She blushes but gives you a small nod.");
		output("\n\n“<i>I actually had a lot of fun. Knowing that anyone could see me was both terrifying and exciting. But I need to get going, and... umm... also change.</i>” She gives you a peck on the cheek before walking off.");
	}
	//If PC has a large amount of cum:
	else if (pc.cumQ() <= 1000)
	{
		output("You push her further onto your cock with one hand before pumping your ample load down her throat. She groans around your [pc.cock] but you keep her head pressed against your crotch as you continue pumping your load into her stomach. As you feel the tide of cum tapering down, you pull out from her throat. You squeeze the few last drops of your [pc.cum] on her tongue. She obediently swallows down the last of your offering. ");
		if (InCollection(pc.cumType, [GLOBAL.FLUID_TYPE_CHOCOLATE_MILK, GLOBAL.FLUID_TYPE_HONEY, GLOBAL.FLUID_TYPE_STRAWBERRY_MILK,, GLOBAL.FLUID_TYPE_NECTAR, GLOBAL.FLUID_TYPE_VANILLA, GLOBAL.FLUID_TYPE_CHOCOLATE_CUM, GLOBAL.FLUID_TYPE_BLUEBERRY_YOGURT, GLOBAL.FLUID_TYPE_FRUIT_CUM, GLOBAL.FLUID_TYPE_FRUIT_GIRLCUM, GLOBAL.FLUID_TYPE_EGGNOG])) output("“<i>Mmm, tasty,</i>” she says as she licks her lips. ");
		else output("“<i>Bleh,</i>” she says as she sticks out her tongue. ");
		output("She slowly climbs out from underneath the table. “<i>Ugh, I'm so full.</i>” You can see that she is holding her stuffed stomach with her hands. “<i>I guess I don't need to eat tonight.</i>” she smirks. You notice there is a wet stain between her legs.");
		if (pc.isBimbo()) output("\n\n“<i>You might want to, Like get some clean clothes, unless you want everyone to know how much fun you had.</i>” ");
		else output("\n\n“<i>I guess you have to worry about getting some clean pants.</i>” ");
		output("You reach to touch her plump belly, stuffed with your [pc.cum]. She yelps, trying to slap your hand away. ");
		if (pc.isAss()) output(" You ignore her and fondle her belly, rubbing the bulge of cum. “<i>I did a pretty good job of stuffing you, didn't I?</i>” You give her belly a light slap, earning another yelp from her.");
		else output("You pull your hand back, instead pulling her into a kiss. You can taste your own [pc.cum] on her lips.");
		output("\n\n“<i>That was surprisingly fun, I wouldn't mind doing that again. Especially when anyone can see me... in full view of everyone... shamelessly pleasuring someone...</i>” She's sinking deeper in her fantasy. You shake her from dreaming, bringing her back to the dark back room of the bar. “<i>I need some rest, so see you next time. Oh, and if you want to do this again, I'm open to the idea,</i>” she says and blows you a little kiss before walking off.");
	}
	//If PC has a huge amount of cum:
	else
	{
		output("\n\nYou're going to blow your load down her throat and you don't want to spill a single drop. ");
		if (pc.isAss()) output("Grabbing her by those feline ears ");
		else output("Grabbing the back of her head ");
		output("you slam her head down all the way. With a breathless moan, you start pumping your [pc.cum] down her throat. She shudders as she is filled with more and more of your liquid love-juice. The seconds tick by as you keep filling her stomach. She starts to push against you, trying to get your [pc.dick] free from her throat.");
		if (pc.isAss()) output("You ignore her and keep a tight grip on her ears. She punches you in the gut in a desperate attempt to get you to let go. You flinch and decide to release her head before she gets any more desperate.");
		else output("You decide to let go of her head before she is suffocated by your [pc.cock].");
		output("\n\nShe pulls free with a loud gasp, “<i>Fuck!</i>” You continue to hose her down head to toe with more of your [pc.cum] until the flow finally starts to die down. She pulls herself next to you with great effort, takes a look at herself and starts to curse at the condition of her clothes. “<i>Shit, I'm... I need to get cleaned up... fuck.</i>” ");
		if (pc.isAss()) output("Basking in the afterglow of your orgasm, you watch her drag herself into the bathroom.");
		else output("You help her up and walk her to the bathroom. You walk back to your seat and wait for her to clean herself up.");
		output("\n\nWhen she returns from the bathroom she isn't covered in your cum anymore, but her clothes are just as soaked and her belly is bloated to pregnant proportions. “<i>Jeez, warn me next time if you're going to cum like a celibate kui-tan.</i>”");
		output("\n\nDoes that mean she is willing to do this again? “<i>I guess so. But, seriously, warn me the next time. And even though it feels like I'm carrying a litter of kittens, I enjoyed being down there, in full view of everyone.");
		if (pc.isAss()) output(" Also, next time, don't try to suffocate me with your dick.");
		output("</i>”");
		output("\n\nShe blows you a raspberry before walking off, albeit slowly since she is still exhausted and bloated.");
	}

	processTime(20+rand(5));
	erika.loadInMouth(pc);
	pc.orgasm();
	
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function erikaPublicSexPussy():void
{
	clearOutput();
	showErika();
	author("Doots");

	output("You tell her you'd like her to work on your [pc.cunt]. She pushes her fingers into your slit before starting to work them, getting your juices flowing. You reach down and collect some of your girl-juices on your fingers, only to wipe those fingers on her nose. ");
	if (pc.isAss()) output("“<i>A slutty kitty like you should know how to lap away at some girl's pussy.</i>”");
	else output("“<i>I could really go for a cute girl licking away at my pussy.</i>”");
	output("\n\nYou push her into your pussy, her nose bumping into your [pc.clit]. ");
	if (pc.hasCock()) output("Your [pc.cock] rests on her forehead leaking precum into her hair. ");
	output("You give her ears a little scratch as she starts to lick your [pc.pussy]. After a while of her licking at your [pc.pussy] lips, you grow tired of her fumbling attempts at pleasing you. ");
	if (pc.isAss()) output("“<i>You're not actually supposed to lick like some mutt,</i>” you chastise her, flicking her ears. She whines into your muff. “<i>Ugh, I have to do everything myself, don't I?</i>” You rub your [pc.pussy] against her face for a while, smearing her face in your juices. You twist one of her ears before pulling her face free from your [pc.pussy]. “<i>Now pay attention to the clit, it's not just for poking your nose.</i>” She offers you a small apologetic whine and reaches to do as you say. With a sigh, you let go of her ear.");
	else output("Pushing her free from your [pc.pussy], you tell her that she needs to pay more attention to the clit. You pull open the lips of your [pc.pussy] and rub your [pc.clit] with the tip of your finger as an example. “<i>Lick it and use your hand to pay attention to the rest of the pussy,</i>” you instruct her.");
	output("\n\nShe gets back to work with more finesse, licking your [pc.clit] and massaging the inner lips of your [pc.pussy] before pushing two fingers back inside you.");
	output("\n\nRelaxing as she gets to work treating your pussy, you recline in your seat. You spot Honey bouncing around between tables, taking orders. You flag her down and order some mead for yourself. ");
	if (pc.isAss()) output("“<i>And put it on her tab,</i>” you say, pointing down to Erika. ");
	output("In a short while, Honey places the mead in front of you. Taking a sip of it, you thank her before relaxing back into your seat. Bringing your free hand down to Erika, you reward her efforts by giving her ears a gentle stroking.");
	output("\n\nIn response to your stroking, she starts to rub on the insides of your [pc.pussy] with more vigor. Her fingers touching your g-spot earns her a spurt of your juices so she starts to focus on the sweet spot inside your love tunnel. “<i>Not yet, I don't want this to end yet,</i>” you whisper. She does as you say, but she still rubs over your g-spot occasionally. She's keeping your lust burning and your orgasm just within arm’s reach.");
	output("\n\nYou continue savoring your mead and telling her to slow down every time you feel your orgasm approaching. You want to take your time and relish the soft touch of her tongue and fingers on your [pc.clit].");
	output("\n\nSwigging down the last drops of the mead, you decide to take the initiative. You rub your [pc.pussy] against her face, smearing it in your juices. She takes the hint, nibbling on your [pc.clit] and rubbing your g-spot more vigorously. After edging you for so long, she is able to bring you to orgasm pretty quickly. Screaming your orgasm to the half-empty bar, you soak Erika's face in your [pc.girlCum]. ");
	if (pc.hasCock()) output("Your [pc.cock] goes off in sympathy, drenching her hair in your [pc.cum] as well. ");
	output("A few of the patrons give curious glances your way with all the ruckus you're making, but they quickly lose interest when they realize what is going on. Just another day on the frontier for them.");
	output("\n\nAfter you stop painting her face with your [pc.girlCum], she climbs up from beneath the table, her face glistening in the dim light of the bar. You pull her into a kiss, sampling some of your [pc.girlCum] from her cheek. ");
	if (pc.isAss()) output("“<i>It's a good look for you. Now everyone can see your proper place.</i>”");
	else output("“<i>Quite the makeover I gave you, but you'd better go wash up unless you want to smell like pussy for rest of the day.</i>”");
	output("\n\nShe's beet red when you let her go. Without a word, the blushing kaithrit sets off to the bathroom. You wait for her to come back, idly toying with your [pc.pussy]. After a while, she comes back, her face clean and clear of your [pc.girlCum]. She sits next to you. “<i>I had fun, thanks. I wouldn't ever have realized how fun this is without your help, to be seen by someone... anyone,</i>” she starts to mutter dreamingly. You shake her awake from her fantasies, kissing her on the nose and sending her on her way.");

	processTime(20+rand(5));
	pc.orgasm();

	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function erikaPublicSexThreesome1():void
{
	clearOutput();
	showErika();
	author("Doots");

	output("You get a better idea. “<i>Come out from under there,</i>” you tell her as you pull her onto the seat next to you and stand up. Wandering to the bar proper you search out a partner for your plan to stuff the silly little kaithrit.");

	clearMenu();
	addButton(0,"Next",erikaTakeHerToShip2);
}

public function erikaTakeHerToShip1():void
{
	clearOutput();
	showErika();
	author("Doots");

	output("You can definitely think of few things to do with Erika, but none of the involve any of the patreons getting an eyeful of what you are planning");
	if(syriFriendsWithBenefits()) output(", well maybe Syri");
	output(".");
	output("\n\nYou reach to grab a handful of Erika's ass while whispering into her feline ear what exactly you have in mind. She gives a quick nod before nuzzling into your neck.");
	output("\n\nYou leave the bar as fast as you can without running, Erika following closely. Many of the patrons give you a thumbs up or wink at you as you pass by.");
	output("\n\nWhen you arrive at your ship Erika stops and pants “<i>I want to pick up something from my place,</i>” you tell her to hurry, she turns and bolts off, obviously just as impatient as you are. Now you are left to play the waiting game.");

	clearMenu();
	addButton(0,"Next",erikaTakeHerToShip2);
}

public function erikaTakeHerToShip2():void
{
	clearOutput();
	showErika();
	author("Doots");

	output("The consoles light up, informing you that Erika was able to find your ship. Opening the airlock, you see Erika standing there with a rather large box under her arm. You wonder what's important enough to go out of her way to get. Moving aside you let her in. You're sure she will tell you what's in the box eventually.");
	output("\n\nYou lead Erika to your room and, when you get there, sit down on the bed. “<i>So, what's in the box?</i>”");
	output("\n\n“<i>Toys.</i>” She sets the box down next to you.");
	output("\n\n“<i>Toys?</i>”");
	output("\n\n“<i>Yes, toys. Sex toys, to be exact.</i>”");
	output("\n\nSex toys, huh. Yeah, in hindsight you should have known.");
	output("\n\n“<i>Open it,</i>” she urges you while she starts to strip down, throwing the bundle of clothes to a corner of the room.");
	output("\n\nYou open the box... except it's locked, so you don't open it. ");
	if (flags["ERIKA_SEEN_NAKED"] == undefined)
	{
		if (pc.characterClass == GLOBAL.CLASS_SMUGGLER)
		{
			output("Well, a simple lock like this won't keep you from the insides of this box. After a while of fiddling with the lock, it pops open.");
			output("\n\n“<i>You know, I could just have opened it.</i>”");
			output("\n\n“<i>Where's the fun in that,</i>” you smirk at her before popping open the box.");
		}
		else
		{
			output("“<i>It's locked you know. I can't really open it if it's locked.</i>”");
			output("\n\n“<i>Oh, sorry. Completely forgot about that.</i>” She fiddles with the box for a short time with her ass in the air. “<i>There we go.</i>” You reach over and pop open the lid of the box.");
		}
	}
	output("\n\nTaking a look inside, you see what is basically a dragon's hoard of sex toys: anal beads, butt plugs of varying sizes, bullet vibrators, cock rings, black electrical tape, ring gags, ball gags, bondage rope, fuzzy handcuffs, a riding crop, floggers, a paddle with small cut out hearts along its length, nipple clamps, a jar of EasyFit cream, a bottle of pink glittery lube, and a rather girthy dildo shaped like a horse cock.");
	if (flags["ERIKA_SEEN_NAKED"] == undefined)
	{
		output("Something in the corner of your eye seizes your attention. It's Erika, but she's blushing again. You think that, since you’re both ass naked, it would be a little too late for being shy. Turning your attention to her, you break the short-lived silence, asking is something is wrong.");
		output("\n\n“<i>Wrong? Well, it’s just that I forgot to tell you something. Something that might be a big deal for you, or completely trivial. It's just easier if I show you.</i>” Turning around she bends over, pointing her rear at you.");
		output("\n\nYou don't notice anything from the usual, a tail hole and a canine dick that is just shy of five inches beneath a pair of small, tightly compressed balls. The realization slowly dawns on you. It's not what's there, it's what's <i>not</i> there. It appears you mistook your shemale kaithrit for a herm.");
		output("\n\n“<i>I hope it's not a problem for you. I'd understand if you're not ok with it,</i>” she whispers, ears folded against her hair as she chews on her lower lip waiting for your response.");
		output("\n\nWell, if you had intended to fuck her pussy, that idea is out of the airlock, now. You could always just tell her that you’re not interested.");
	}

	flags["ERIKA_SEEN_NAKED"] = 1;

	clearMenu();
	addButton(0,"Next",erikaSexMenu);
}

// Stygs ToDO Add scenes
public function erikaSexMenu():void
{
	clearOutput();
	showErika();
	author("Doots");

	output("If you wanted to play around with the box full of lewdness, she'd most likely be down for it.");
	output("\n\nOr you could just ");
	if (pc.hasCock() && pc.hasVagina()) output("stick your dick into her [erika.asshole], or stick her dick into your pussy, or ");
	else if (pc.hasCock()) output("stick your dick in her [erika.asshole], or ");
	else output("get her dick into your pussy, or ");
	output("stick her dick into your ass.");
	
	clearMenu();
/*	addButton(0,"Talk",erikaAppearance);
	addButton(1,"Buy Drink",erikaAppearance);
	addButton(2,"Sex",erikaAppearance);
	addButton(5,"Appearance",erikaAppearance);
*/
	addButton(14,"Back",erikaMainMenu);
}

public function erikaAppearance():void
{
	clearOutput();
	showErika();
	author("Doots");
	output("Erika, a slender kaithrit, sits alone at the bar. By a rough estimate, you would say that she stands at about 5'3''. The first impression her appearance gives you is a lot like a standard kaithrit, with feline ears poking from her hair, two feline tails swirling behind her, and normal human like skin.");
	output("\n\nLong purple hair with lime green highlights hangs in front of her green feline eyes, adorning her pale face. Erika’s full lips are a positively eye-catching feature of her face, with  the lower one adorned by a single gleaming silver stud.");
	output("\n\nShe is wearing a rather banal outfit: a plain white strapless blouse and a pair of jeans. You notice that her nipples are visible through her shirt; it looks like this little kitty likes going commando. Her jeans cling to her fertile hips and plump butt, while two dark purple feline tails curl and sway behind her. The tips of her tails are highlighted with the same green color as her hair.");
	output("\n\nA small but undeniably unfeminine bulge lies between her legs.");
	if (flags["ERIKA_SEEN_NAKED"] == undefined) output("You are no boobspert but if you would have to guess you would say that her cup size is B, maybe C, judging the size of her bulge you're fairly certain that she isn't packing a monster between her legs. ");
	else output("Having seen below her clothes, you know that her boobs are definitely a C - cup. She has roughly five inches worth of canine meat between her legs, located just below a heart - shaped thatch of pubic hair. Below that is a pair of tightly drawn balls. Despite what you thought earlier, she doesn't have a pussy to go with her dick. ");
	output("As you gaze between her legs, her face turns bright red, but nonetheless her nipples harden, jeans tent, and her tails start to sway behind her faster. It seems this little kitty is starved for attention; or more likely- judging by her tent- she is starved for sex.");

	clearMenu();
	addButton(0,"Next",erikaMainMenu);
}
