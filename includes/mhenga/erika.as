// Erika the shemale kaithrit
// https://docs.google.com/document/d/1hyrYOSlZGf6ROCvbXlak7LI3a8OFT2QArRqPYcOzOO8/edit#heading=h.q5mjn84i7rif
	
// ERIKA_DEGRADED_HER			PC has choosen the DegradeHer option at least once
// ERIKA_GIVEN_ANUSOFT			Gave her a dose of anusoft
// ERIKA_MET					Met her before
// ERIKA_SEEN_LUBE				PC has seen the lube
// ERIKA_SEEN_NAKED				Erika has visited PC ship, PC has seen Erika naked, PC has seen her toys
	// Stygs ToDo add this to the sex scenes
// ERIKA_SEXED					Had sex at least once
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
	
	if (flags["ERIKA_MET"] == undefined) output("A slender kaithrit girl is sitting alone at the bar, tails wrapped around her waist. She is nursing a drink and looking around the bar. She notices that you’re looking back at her and quickly turns away to look at her drink, ears flat against her head. After a while she takes another peek at you, with the same result.");
	else output("Erika is sitting at the bar again, nursing a drink. She notices you and gives you a little wave and a hopeful smile before turning back to her drink.");

	if (flags["ERIKA_MET"] != undefined) addButton(btnSlot,"Erika",erikaApproach,undefined,"Erika","You could go to say hi to Erika, she definitely could use the company.");
	else addButton(btnSlot,"Kaithrit Girl",erikaApproach,undefined,"Kaithrit Girl","Maybe you could go over and say hi since she can’t seem to keep her eyes away from you.");
}

public function erikaApproach():void
{
	clearOutput();
	showErika();
	author("Doots");

	if (flags["ERIKA_MET"] == undefined)
	{
		output("You decide to see why the kaithrit girl is sitting alone in a bar at this time of the day. You find a seat next to her. ");
		if (pc.isNice()) output("\n\n<i>“I noticed that you seem to be interested in me, or am I wrong?”</i> She mutters in the affirmative. Placing a hand on her thigh, you continue, <i>“I would really like to know your name.”</i>");
		//night -> day bc erika is here at daytime not nightime
		else if(pc.isMischievous()) output("\n\n<i>“So are you going to tell me your name, or are you going to try to take </i>subtle<i> looks at me all day?”</i>");
		else output("\n\n<i>“You have a staring problem, or do you have a good reason why you can’t get your eyes off me?”</i> Before she can say anything, you cut her off. <i>“If you’re going to stare at me all day you could at least tell me your name...”</i>");
		output("\n\n<i>“Umm... E-Erika,”</i> she stammers, tails wrapped in her lap and ears folded against her head.");
		output("\n\n<i>“[pc.name],”</i> you tell her. <i>“[pc.name] Steele. ");
		if (pc.isNice()) output("Now, were you trying to get my attention, or were you just staring at me when you thought that I wasn’t looking?”</i>");
		else
		{
			if(pc.isMischievous()) output("So why did you have your eyes glued to me? Were you trying to get a peek at my [pc.butt]?”</i>");
			else output("So were you hoping that I would come here and make you scream my name all night, or were you just looking to waste my time?”</i>");
			output("\n\n<i>“No, it was an accident,”</i> she mutters.");
			if (pc.characterClass == GLOBAL.CLASS_SMUGGLER) output("\n\n<i>“That’s what I told the officer, but she didn’t believe me.”</i> You sneak your hand down her pants and squeeze her expansive ass flesh. <i>“That was an accident too,”</i> you smirk at her.");
		}
		output("\n\nYou look the slender kaithrit up and down while wondering what you’ll do with her. You could probably get this kitty to your bed quite easily.");
		flags["ERIKA_MET"] = 1;
	}
	else
	{
		if (pc.isNice())
		{
			output("You sit down next to Erika just as she finishes her drink. You greet her and offer her a drink.");
			output("\n\n<i>“Thank you for the offer, but no. Maybe some other time?”</i> Instead of taking your offer, she orders another drink from Burt.");
			if (flags["ERIKA_SEXED"] == undefined) output("\n\n<i>“So, do you want to hang out for a bit, maybe keep me company for a bit?”</i> She fidgets a bit, waiting for your answer.");
			else output("\n\n<i>“Did you just come for a chat or did you want something else, maybe go back to your ship?”</i> She slowly starts to blush at the suggestion.");
			output("\n\nNow, to decide why you came up to her in the first place: Did you want to talk her ear off, or just say hi to her?");
		}
		else if (pc.isMischievous())
		{
			if (flags["ERIKA_SEXED"] == undefined)
			{
				output("You walk behind her, and without saying a thing you grab the tip of her tail. As you tickle it her entire body tenses for a moment, before she starts purring.");
				output("\n\n<i>“Aww, were you hoping for me to show up?”</i>");
				output("\n\n<i>“M-maybe,”</i> she stammers out, as you keep tweaking the tip of her tail.");
				output("\n\nWhether you just talk to her or try to get something more substantial going is up to you; or you could just keep on torturing the tip of her tail.");
			}
			else
			{
				output("You sneak up behind Erika and announce your presence by grabbing her butt cheeks with both hands, making her let out a small yelp. After being smacked in the face by her tails a couple of times, you decide to let go of her butt.");
				output("\n\nShe turns to look at you, smiling. <i>“[pc.name], did you want to talk or...”</i> she says, blushing at the suggestion. You sit next to her and think about what you actually want to do with her.");
				output("\n\nDo you want to take this kitty back to your ship, stay here at the bar talking with her, or did you just want to fondle her butt?");
			}
		}
		else
		{
			if (flags["ERIKA_SEXED"] == undefined)
			{
				output("Walking up to Erika, you slap her back.");
				output("\n\n<i>“You’re here alone again. Were you hoping for me to come and keep you company?”</i> You laugh boisterously.");
				output("\n\nShe pouts a bit at your comment. <i>“Well, I like you. So why wouldn’t I hope for that?”</i>");
				output("\n\nNow it’s up to you to take the initiative on what to do.");
			}
			else
			{
				output("You decide to have some more fun with the little kitty sitting at the bar. You silently come up behind her and slap her ass, causing her to spill her drink.");
				output("\n\n<i>“[pc.name]! Why did you do that?”</i> she whines.");
				output("\n\n<i>“Because it was fun.”</i> You grin at her, slipping one hand down her pants and groping at her junk. You whisper in her ear that you want to have some more fun with your silly little slut.");
				output("\n\nAt that she turns bright red, but her tails are swaying faster than before. What shall you do with this little kitty? Should you talk with her for a bit, take her back to your ship, or just leave her here wondering why you came up to her only to make her spill her drink?");
			}
		}
	}
	
	erikaMainMenu();
}
public function erikaMainMenu():void
{
	clearMenu();
	addButton(1,"Talk",erikaTalkMenu);
	addButton(2, "Buy Drink", erikaBuyDrinkMenu);
	if (pc.lust() >= 33 && pc.hasGenitals())
	{
		if (flags["ERIKA_SEEN_NAKED"] != undefined) addButton(3,"Sex", erikaSexMenu);
		else addButton(3,"Sex", erikaSexIntro);
	}
	else if(pc.lust() >= 33) addDisabledButton(3,"Sex","Sex","You need genitalia to do this!");
	else addDisabledButton(3,"Sex","Sex","You’re not up for sex right now.");
	addButton(0,"Appearance",erikaAppearance);
	addButton(14,"Leave",mainGameMenu);
}

public function erikaTalkMenu(doOut:Boolean = true):void
{
	if (doOut)
	{
		clearOutput();
		output("You tell her that you want to talk.");
		output("\n\n<i>“Well, If you have something you want to talk about then sure, but when it comes to me I don’t think there is much to talk about.”</i>");
	}
	showErika();
	author("Doots");

	clearMenu();
	addButton(0,"Her",erikaTalkHer);
	addButton(1,"Drinking",erikaTalkDrinking);
	// [Body] (need to take her to your ship once. Sex not required)
	if (flags["ERIKA_SEEN_NAKED"] != undefined) addButton(2,"Body",erikaTalkBody);
	else addDisabledButton(2,"Locked","Locked","You don’t know enough about her for this.");
	// [Mother] (requires talk about her. Can be done only once)
	if (flags["ERIKA_TALKED_ABOUT_HER"] != undefined && flags["ERIKA_TALKED_ABOUT_MOTHER"] == undefined) addButton(3,"Mother",erikaTalkMother);
	else if (flags["ERIKA_TALKED_ABOUT_HER"] != undefined && flags["ERIKA_TALKED_ABOUT_MOTHER"] != undefined) addDisabledButton(3,"Mother", "Mother", "Erika doesn’t want to talk about this again..");
	else addDisabledButton(3,"Locked","Locked","You don’t know enough about her for this.");
	// [Sister] (requires talking about [Body] and [Her] and talked to Lerris [and talked about mother, since she doesn't even mention a sister when talking about herself])
	if (flags["ERIKA_TALKED_ABOUT_HER"] != undefined && flags["ERIKA_TALKED_ABOUT_MOTHER"] != undefined && flags["ERIKA_TALKED_ABOUT_BODY"] != undefined && flags["MET_LERRIS"] != undefined) addButton(4,"Sister",erikaTalkSister);
	else addDisabledButton(4,"Locked","Locked","You don’t know enough about her for this.");
	addButton(14,"Back",erikaMainMenu);
}

public function erikaTalkHer():void
{
	clearOutput();
	showErika();
	author("Doots");

	output("You ask her to tell you something about herself.");
	output("\n\n<i>“You want to know about me? There isn’t much to tell, really.”</i> She pauses for a moment to think, then continues. <i>“Let’s see. Well, I was born on Ausaril.”</i>");
	output("\n\nWhat were two kaithrit doing on Ausaril, or are her parents actually not kaithrit?");
	output("\n\n<i>“No, both of my parents are full-blooded kaithrit as far as I know. And regarding why they were on Ausaril, I really don’t know. Maybe my mom had a thing for knotted cocks.”</i> Taking another drink, she pauses again, thinking about what to say next.");
	output("\n\nYou push her onwards by asking how she ended up on Mhen’ga if she was born on Ausaril.");
	output("\n\n<i>“Well, I wanted to leave home as quickly as possible. It’s not like I had a bad childhood, but my other mom was a bit too nosy for my liking. You wouldn’t know how... unpleasant it is for your other mom to burst into your room when you’re taking some time for yourself.”</i> She blushes at that point, but soldiers onwards. She thinks for a while before looking down at her glass.");
	output("\n\n <i>“And my mother being the biggest whore on Ausaril.”</i> Her voice drips with venom when she mentions her mother. Her fist clenches and her knuckles turn white while she looks down at the table. Before you can ask her what’s wrong she is back to her cheery self. <i>“Besides that, I wanted to move out, live on my own. I didn’t want to live with my parents for the rest of my life.”</i>");
	output("\n\nSo why is she on Mhen’ga instead of some other planet?");
	output("\n\n<i>“Well, a shithole planet like this isn’t too expensive to live on, and since I stay with the civilized folk I won’t get buggered by the zil lurking around in the jungle. And it isn’t too different from home. Besides, I usually don’t leave my house, and working over the extranet means that I don’t have to worry about local employment.”</i>");
	output("\n\nSo what does she do for a living, then?");
	output("\n\n<i>“I’d rather not talk about my work. You wouldn’t be able to find a more boring topic,”</i> she deflects.");
	output("\n\nWould she rather talk about ");
	if (pc.characterClass == GLOBAL.CLASS_SMUGGLER) output("what it’s like spending six hours getting your ship searched from top to bottom when you’ve done nothing illegal?");
	else if (pc.characterClass == GLOBAL.CLASS_MERCENARY) output("how to operate a tank?");
	else output("how the body of a KihaCorp class six companion droid works?");
	output("\n\n<i>“Ok, fair enough, but I still don’t want to talk about my work. It’s irrelevant.”</i>");

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
	output("\n\n<i>“Well, it’s not like I’m getting hammered. Have you tried getting drunk on this stuff? Besides, going out to drink is an excuse to leave home, hoping to meet someone nice, but I lack the confidence to chat up strangers since I’m generally not comfortable in public.”</i>");
	output("\n\nIf she doesn’t like the cheap beer then why does she drink it?”</i>");
	output("\n\n<i>“All of the other drinks that they offer here are ridiculously expensive. The mead tastes wonderful, but I’m not going to pour my credits down my throat. And the X-Zil-rate is even more expensive; plus apparently it makes you horny and I don’t want to start popping boners in public.”</i>");
	output("\n\nBut still, why is she drinking this early in the day?");
	output("\n\n<i>“Later in the evening there are more people here, and I really don’t like it when there are lots of people hanging around getting drunk, being obnoxious and loud.”</i>");
	output("\n\nSo she doesn’t like hanging around other people?");
	output("\n\n<i>“No, it’s not that. Well, kind of. It’s being around drunks that I don’t like, I like hanging out with you and other friends of mine.”</i>");

	processTime(10+rand(5));
	erikaTalkMenu(false);
	addDisabledButton(1, "Drinking");
}

public function erikaTalkBody():void
{
	clearOutput();
	showErika();
	author("Doots");

	if (pc.isAss())
	{
		output("<i>“So were you born with your dick, or did you decide to trade in your puss for the chance of dicking someone?”</i>");
		output("\n\nShe chokes on her drink in surprise. After waiting a few moments for her to finish coughing up her drink and take a few deep breaths, she is able to reply, <i>“Geez, did you have to ask it so bluntly?”</i>");
		output("\n\nNo point in beating around the bush, you chuckle. Now, is she actually going to answer? She pouts at you for few moments, and with a sigh she opens up.");
	}
	else
	{
		output("<i>“I hope you don’t mind me asking, but were you born with... with what you’ve got? You know, the boobs and a dick?”</i> She doesn’t show a voluntary outward reaction to your question, instead taking another sip of her drink, but she is turning bright red and almost hiding behind her glass. You wait patiently for her to start talking, if she is willing to talk at all.");
		output("\n\nSetting her glass down, she lets out a sigh. <i>“I’m not really a fan of talking about that, but if you really want to know...”</i> she says, looking at you questioningly.");
	}
	output("\n\n<i>“I was born male, and I grew up effeminate like all kaithrit. I always thought girls were really pretty, but instead of being like one of the other guys who wanted to fuck them, I wanted to be one. At nineteen, when I had enough courage, I started to try on women’s clothing. Small things at first, a bra here, panties there. Eventually I started wearing full-on women’s clothing, skirts, dresses, and tops. One day my sis, Lerris, found out what I was doing. She teased me at first, but she helped me embrace what I loved and eventually even set up a date with one of her friends: a gorgeous gryvain. She showed me what it was like to be loved like a woman.”</i>");
	output("\n\nShe blushes a bit before continuing. <i>“She showed me few other things as well, like how it felt to be fucked like a bitch and love it. So, in the end, I owe my sister for a lot of things. If she hadn’t seen me in those panties my life would probably suck a lot more now.”</i>");
	output("\n\nSo if she loves feeling like a woman, why hasn’t she gotten the whole deal instead of just getting breasts?");
	output("\n\n<i>“Do you know the cost of something like that? I can’t afford that! Besides, I really don’t find herms that appealing.”</i>");
	if (pc.isHerm())
	{
		output("\n\nYou give her the kind of look that conveys that she fucked up. <i>“Well, you’re an exception. I think that you’re really hot. I meant that I don’t find the idea of being a herm myself that appealing,”</i> she hastily fusses in apology.");
	}
	output("\n\nShe doesn’t need to keep her dick if she gets a pussy. There are ways to get rid of it");
	if (flags["MET_DR_LASH"] != undefined) output(", and you have heard of a certain doctor who could take care of that");
	output(".");
	output("\n\n<i>“If I can’t afford just a pussy do you think I can somehow also afford to get rid of my dick?");
	if (flags["MET_DR_LASH"] != undefined) output(" And I’m not going to let some doctor who I’ve never heard of touch me.");
	output("”</i>");
	output("\n\nIf money is the only reason, she could save up her credits");
	if (pc.isAss())
	{
		output(" or she could probably earn a pretty penny giving up that butt for sale.");
		output("\n\nShe stares at you, mouth hanging wide open. <i>“You’re joking, right? Are you actually saying that I should whore myself out just to buy some mods to get a pussy?”</i>");
		output("\n\nYou burst out laughing after she finishes.");
		output("\n\n<i>“That wasn’t funny.”</i> she pouts.");
	}
	else output(".");
	output("\n\n<i>“But, no, money isn’t the only reason. The other reason is that getting a pussy is a really big step, and I’m not ready for that kind of thing.”</i>");
	output("\n\nAnd what’s with the dog dick?");
	output("\n\n<i>“A ex-girlfriend of mine convinced me to try it out, she even paid for half of it. My only regret about it is that i didn’t try it earlier.”</i>");

	flags["ERIKA_TALKED_ABOUT_BODY"] = 1;

	processTime(10+rand(5));
	erikaTalkMenu(false);
	addDisabledButton(2, "Body");
}

public function erikaTalkMother():void
{
	clearOutput();
	showErika();
	author("Doots");

	output("<i>“So, is there bad blood between you and your mom?”</i>");
	output("\n\n<i>“Ugh, I don’t want to talk about that bitch. Besides, why do you care?”</i>");
	if (pc.isAss())
	{
		output("\n\n<i>“If you want to keep mulling over it, that’s your prerogative, but that’s just stupid. Nothing is going to get better, and before you ask how talking is going to help, you might actually get over it since you don’t live with your mom anymore.”</i>");
	}
	else
	{
		output("\n\n<i>“Look, if you talk about it, you might feel better, especially now that you live on your own.”</i>");
	}
	output("\n\nErika seems a bit defeated and sighs. <i>“Fine. You win, you win, but just this once. So why do I hate my mother? Well, she ruined everything. Leaving my other mom for some kui-tan asshole with a big cock and a fat wallet.”</i>");
	output("\n\nHer hands start to shake a bit, but she continues. <i>“She didn’t even have the decency to break up with her properly, or nicely for that matter. One day she was just gone, with no word from her at all besides the pictures of her sucking and riding that bastard’s dick. Both her ass and pussy were overflowing with his cum, and finally there was a picture of her just covered in it. So that was a lovely way of telling my other mom that they were breaking up.”</i>");
	output("\n\nYou notice that there are small wet spots forming on the counter. Looking closer, you can see that tears are flowing freely down her face. ");
	if (pc.isNice()) output("You pull her into a hug, holding her against your [pc.chest]. You say nothing, simply holding her against you.");
	else if(pc.isMischievous()) output("You place your hand on her shoulder, offering her a small sign of comfort, whispering in her ear that she doesn’t need to continue if it hurts too much.");
	else output("You’re unsure what to do, so you wrap your arm around her neck.");
	output("\n\nShe takes a moment before continuing. <i>“She didn’t take it too well. Hit the bottle hard after that, lost her job because she was too drunk to work, and things just kept getting worse. She would get really angry when she was drunk. Never hit me or my sis, but we were still always so scared. Eventually, we had to get jobs since she was unable to keep one. It was on us to pay the bills, so we would have food on the table and a roof over our heads. We went through all of that just because my mom was a gold-digging WHORE!”</i> She slams her glass down on the counter, spilling most of her drink. She grunts, pushing the half empty drink aside.");
	output("\n\nShe takes a few moments to compose herself, and then continues talking. <i>“That’s why I hate my mom. I even changed my name since I didn’t want to go by the name my whore of a mother gave me.”</i>");
	output("\n\nWell, it seems she has a good reason to be angry with her mom. You doubt that she would be willing to talk about this subject again.");

	flags["ERIKA_TALKED_ABOUT_MOTHER"] = 1;

	processTime(10+rand(5));
	erikaTalkMenu(false);
	addDisabledButton(3, "Mother");
}

public function erikaTalkSister():void
{
	clearOutput();
	showErika();
	author("Doots");

	output("You happen to know a kaithrit by the name Lerris, it could be coincidence but it never hurts to ask. <i>“Does your sister happen to work at the TamaniCorp shop on Tavros?”</i>");
	output("\n\nHer attention picks up when you mention Lerris <i>“You know her? Man, I wonder how is she doing, it’s been ages since I last saw her.”</i>");
	output("\n\n");
	if (flags["FUCKED_LERRIS"] == undefined)
	{
		if (pc.isNice()) output("<i>“Yeah, she seems like a nice sister to have,”</i> you say, thinking back to the few times you spoke with Lerris.");
		else if(pc.isMischievous()) output("<i>“Yeah I chatted with her a few times, cute girl, but I think you’re cuter.”</i> You give her a wink, making her blush briefly.");
		else output("<i>“Yeah, she’s a bit of a slut, I can tell you two are related.”</i> She sputters when you call her and her sister sluts and shoots you a dirty look, earning a chuckle from you.");
	}
	else
	{
		if (pc.isNice()) output("<i>“Yes, I do know her... and I’ve spent few intimate moments with her,”</i> you say, trying to not shock her with the knowledge that you have had sex with her sister.");
		else if(pc.isMischievous()) output("<i>“Yeah I know her all right, I know her </i>really<i> well.”</i> You wink at her, making your way of telling that you have had sex with her sister even less subtle.");
		else output("<i>“Yup and I’ve fucked her too, she’s a real slut, just like you.”</i> You punctuate what you said with a sharp slap on her ass.");
	}
	output("\n\n<i>“Man, I miss her, I really should visit her one of these days. Is she doing all right?”</i> she seems to be excited by the concept of hearing about her sister, her ears twitching slightly and tails swaying faster than before.");
	output("\n\nYou lean against the bar, thinking what to tell her, Lerris didn’t exactly give you her life story, but she seemed genuinely happy, and you tell her so.");
	output("\n\n<i>“Good to hear that sis is doing well. I owe her so much for everything she did for me. She hooked me up with my first girlfriend, and she was there for me when I needed her. When some guy that you are sweet for, and has been patient with you the whole time, dumps you because he thought you were a girl... at moments like that, you need a person to hold you the most, and my sister was always there for me.”</i> She sighs, lost in mixed memories.");
	output("\n\n<i>“If you love your sis so much, why did you leave her behind and leave for Mhen’ga?”</i>");
	output("\n\n<i>“Well, like I said, I wanted to live my own life, and well,”</i> she circles the rim of her glass <i>“I was starting to feel like a burden on my sister. I wasn’t able to find a job, and needed constant emotional support. I didn’t want to feel like a bum anymore.”</i> Her ears droop a bit at what she says. <i>“I actually didn’t contact her for the longest time, it was hard to ignore her calls but I wasn’t prepared for her reaction. When I finally answered her she was worried mostly, angry too, but mostly worried.”</i>");
	output("\n\n<i>“I have been trying to keep in touch with my sis but I haven’t been doing a good job of it. It’s nice to hear that she’s still doing well.”</i> a warm smile spreads across her face. <i>“Tell me: is she still a mod hound like no other?”</i>");
	output("\n\nYou chuckle. <i>“Yeah it didn’t take her long to say how she has tried every mod they sell");
	if (flags["LERRIS_ITEMS_GIVEN"] != undefined) output(", I even gave her some mods");
	output(".”</i>");
	output("\n\nErika chuckles softly before standing up. <i>“Hey, I’m going to call my sis and catch up, thanks for bringing her up.”</i>");
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
	if(pc.credits >= 1) addButton(0,"Crabbst",erikaBuyDrinkCrabbst,undefined,"Crabbst","Shitty beer.");
	else this.addDisabledButton(0,"Crabbst","Crabbst","You can’t afford this. Damn, you’re poor.");
	if(pc.credits >= 10) addButton(1,"Mead",erikaBuyDrinkMead,undefined,"Mead","Honey-based mead.");
	else this.addDisabledButton(1,"Mead","Mead","You can’t afford this.");
	if(pc.credits >= 50) addButton(2,"X-Zil-rate",erikaBuyDrinkXilErAte,undefined,"X-Zil-rate","Some kind of exotic, expensive brew.");
	else addDisabledButton(2,"X-Zil-rate","Z-Zil-rate","You cannot afford this.");
	addButton(14,"Back",erikaMainMenu);
}

public function erikaBuyDrinkCrabbst():void
{
	clearOutput();
	showErika();
	author("Doots");

	output("You call to Burt and order a Crabbst. He gives you a quizzical look but pours you the drink nonetheless. Taking a sip from the drink, Erika looks at you.");
	output("\n\n<i>“Would you believe that I’ve drunk something worse?”</i>");
	output("\n\nYou tell her that you have a hard time believing that.");
	output("\n\n<i>“Crabbst tastes horrible, but I’m used to how awful it tastes. I appreciate the thought, though.”</i> She gives you a small peck on the cheek.");

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
	output("\n\n<i>“It’s good to be treated sometimes. Getting to drink something besides that poison is wonderful. Thank you.”</i>");
	output("\n\nShe wraps her hands around your neck and pulls you into a kiss. After a while of fawning in your lap she pulls back, tails swaying.");

	pc.credits -= 10;

	processTime(15+rand(5));
	erikaBuyDrinkMenu(false);
	addDisabledButton(1, "Mead");
}

public function erikaBuyDrinkXilErAte():void
{
	clearOutput();
	showErika();
	author("Doots");

	output("Calling Burt over you order a glass of X-Zil-rate. Giving you a smile, he pours a glass of the fine wine and places the glass in front of you. Erika stares unblinkingly at you as you hand the glass to her.");
	output("\n\n<i>“Are you really buying me this?”</i> You give her a small nod in response. She takes the glass from you, brings it to her nose, and inhales the smell of the wine. She takes a small sip at first, almost hesitantly, but soon gets into it. Later, while she is nursing it, you make small talk with her, mainly talking about what has been happening lately.");
	output("\n\nWhen she finishes her drink, she snuggles next to you. <i>“Thank you, that tasted heavenly.”</i> She is lost in her tipsy affection for you, not noticing that she’s pressing her breasts against your body. Wrapping your arm around her shoulder you start to wonder if she’d be interested in some public fun. She looks up at you with glazed over eyes, tails trailing along your [pc.hips]. You’re pretty sure that she is game if you are, so it’s up to you to decide what to do.");

	pc.credits -= 50;
	processTime(15 + rand(5));
	clearMenu();
	addDisabledButton(0,"Crabbst");
	addDisabledButton(1,"Mead");
	addDisabledButton(2, "X-Zil-rate");
	if (pc.lust() >= 33 && pc.hasGenitals()) addButton(5, "Public Sex", erikaPublicSex);
	else if(pc.lust() >= 33) addDisabledButton(5,"Public Sex","Public Sex","You need genitalia to do this!");
	else addDisabledButton(5,"Public Sex","Public Sex","You’re not up for sex right now.");
	if (pc.lust() >= 33 && pc.hasGenitals()) addButton(6, "To The Ship", erikaTakeHerToShip);
	else if(pc.lust() >= 33) addDisabledButton(6,"To The Ship","To The Ship","You need genitalia to do this!");
	else addDisabledButton(6,"To The Ship","To The Ship","You’re not up for sex right now.");
	addButton(14,"Back",erikaMainMenu);
}

public function erikaPublicSex(Threesome:Boolean = true):void
{
	clearOutput();
	showErika();
	author("Doots");

	if (Threesome)
	{
		
		output("You decide that it’s a good time to get some oral service from her. ");
		if (pc.tallness >= 84) output("You pick the small kaithrit up and hoist her over your shoulder.");
		else output("You grab her arm and pull her along.");
		output("\n\nSome of the other patrons give you a curious look as you make your way to a more secluded part of the bar with the kaithrit, arriving at one of the more remote tables. You take a seat and point her towards the underside of the table. She blushes when she realizes what you’re implying, but she crawls under the table without any word edgewise.");
		if (pc.isCrotchGarbed()) output("\n\nShe crawls between your legs and looks up at you. You reach down");
		else output(", getting any offending garments out of the way");
		output(", give her ears a little scratch and pull her head against your [pc.crotch]. Now would be a good time to decide what kind of oral service you want.");
	}
	else
	{
		output("Unfortunately, your plans are spoiled when you don’t find anyone who doesn’t have a partner already, or isn’t three sheets to the wind.");
		output("\n\nYou spot someone who might be just what you’re looking for, but before you can even open your mouth some smug looking kui-tan starts chatting him up. Disheartened, you return to the table, sitting down next to her.");
		output("\n\n<i>“Change of plans. I couldn’t find anyone available. We’re just going back to the original idea.”</i>");
		output("\n\nErika gives you a questioning look but scuttles down under the table without a word.");
		output("\n\nNow that your plan has been foiled, it’s back to the start. What kind of oral service do you want?");
	}

	clearMenu();
	// Stygs ToDo Add reqiurements
	// [Dick] (Dick girth equal or under 3 inches and length under 20 inches)
	if (pc.hasCock()) addButton(0, "Dick", erikaPublicSexDick);
	else addDisabledButton(0, "Dick", "Dick", "You need a penis to do this!");
	if (pc.hasVagina()) addButton(1, "Pussy", erikaPublicSexPussy);
	else addDisabledButton(1, "Pussy", "Pussy", "You need a vagina to do this!");
	if (Threesome) addButton(2, "Threesome", erikaPublicSexThreesome1);
	else addDisabledButton(2, "Threesome", "Threesome", "You couldn’t find another partner.");
	addButton(14,"Leave",erikaPublicSexThreesomeLeave);
}

public function erikaPublicSexDick():void
{
	clearOutput();
	showErika();
	author("Doots");

	output("You grab your [pc.cock] and press it to her lips.");
	// Maybe have all this apply for Bros too?
	// (pc.isBimbo() || pc.isBro())
	if (pc.isBimbo()) output("<i>“Like, a babe like you surely knows what to do.”</i>");
	else output("<i>“Do you know what to do?”</i>");
	output("\n\nShe looks up at you, her eyes wide and confused.");
	if (pc.isBimbo()) output("<i>“You got like, this far without an issue, you must know what you’re doing.”</i> ");
	else output("<i>“Please, you’re on your knees with a dick in your face. Surely you know what to do?”</i> ");
	output("She slowly opens her mouth. She wraps her soft lips around your [pc.cockHead] and you shudder as she takes you into her mouth fully, starting to pull your [pc.cock] down her throat. ");
	if (pc.isBimbo()) output("<i>“Ahhh, babe you almost put me to shame when it comes to sucking dick”</i>");
	else output("<i>“Ahhh, that’s a good girl, I guess you were just playing up the innocent girl act- not that I mind.”</i>");
	output("\n\nYou lay your hand on her head, urging her to go deeper, scratching her ears every time she does so. You gasp as her lips suddenly press against your [pc.sheath].");
	if (pc.isBimbo()) output("\n\n<i>“You really like this don’t you? Like you’re in the middle of the bar, sucking on my lovely cock, ohh it must taste wonderful.”</i> ");
	else output("\n\n<i>“Ohh, someone is eager to please, I see. I really didn’t expect you to be willing to deepthroat me in a public place, and in full view of anyone whose eyes wander downwards.”</i>");
	output("\n\nDespite your words, she doesn’t slow down. In fact, she does the opposite. After a while her hand trails down between her legs, disappearing into her pants. It seems that she is getting excited by the idea that someone could see her sucking your [pc.cock].");
	output("\n\nHer increasing arousal makes her bob her head along your length faster. Her lack of skill shows, she’s clearly trying very hard but you’re not going to cum from her just bobbing up and down on your cock.");
	output("\n\nAfter a while you push Erika back, leaving only your [pc.cockHead] in her mouth. ");
	if (pc.isBimbo()) output("<i>“Babe I like the teasing. But can we get to the good stuff?”</i> ");
	else output("<i>“Come on, surely you can do better.”</i> ");
	output("Her eyes fall towards the floor and her ears draw back. ");
	if (pc.isBimbo()) output("You clap your hand to your cheeks in surprise. <i>“Oh babe I didn’t know. Let me guide you through this, oh your going to be such a wonderful cocksucker.”</i> ");
	else output("<i>“Oh, don’t be like that, let me help you. Do as I say and you’ll do great.”</i>");
	if (pc.isBimbo()) output("\n\n<i>“The head is, like the best part, not for just me but you get to taste all that delicious pre.”</i> ");
	else output("\n\n<i>“First, lick the head.”</i> ");
	output("You groan almost audibly as her tongue starts to swirl around your [pc.cockHead], licking at the most sensitive part of your member before focusing more on your cum slit.");
	if (pc.isBimbo()) output("\n\n<i>“Your doing great babe. Now take it deeper, but don’t forget about the yummy head.”</i>");
	else output("\n\n<i>“You’re doing well. Now take it deeper, but don’t ignore the head,”</i> you murmur to her while scratching away at her ears. She does as you tell her, taking you into her throat again and periodically pulling back to lap at your [pc.cockHead]. You move your hand from her ears to grab the back of her head. You don’t push her down, only controlling the pace, urging her to go quicker. With her other hand occupied in her pants, ");
	if (pc.balls > 0) output("she brings up her free hand to knead your [pc.balls], feeling and fondling them in anticipation of a serving of your [pc.cum] down her throat.");
	else if (pc.hasVagina()) output("she brings up her free hand to stroke the lips of your [pc.pussy], slowly pressing two of her fingers inside you while thumbing at your [pc.clit].");
	else output("she brings up her free hand to stroke your thigh and [pc.hip], seeking out any other sensitive spots to pleasure.");
	if (pc.isBimbo()) output("\n\n<i>“I’m so close babe, just a bit more.”</i> ");
	else output("\n\n<i>“Ah, almost there, just a bit more.”</i> ");
	output("you groan under your breath, urging her to go faster. Without a warning her throat starts convulsing around your length. The sudden tightness around your [pc.cock] makes you instinctively pull her head down your length");
	if (pc.hasKnot()) output(", bumping the swelling bulb of your [pc.knot] against her lips");
	output(".");
	if (pc.cumQ() <= 500)
	{
		output("\n\nYou’re starting to get really close to the edge of your orgasm, with one last thrust into her mouth, you shoot most of your load down her throat and then pull back to shoot a few last ropes of your [pc.cum] into her mouth before withdrawing completely. She looks up at you with puppy eyes, swirling her tongue inside her mouth and getting a good taste of your cum. With a gulp she swallows down your load. ");
		if (InCollection(pc.cumType, [GLOBAL.FLUID_TYPE_CHOCOLATE_MILK, GLOBAL.FLUID_TYPE_HONEY, GLOBAL.FLUID_TYPE_STRAWBERRY_MILK, GLOBAL.FLUID_TYPE_NECTAR, GLOBAL.FLUID_TYPE_VANILLA, GLOBAL.FLUID_TYPE_CHOCOLATE_CUM, GLOBAL.FLUID_TYPE_BLUEBERRY_YOGURT, GLOBAL.FLUID_TYPE_FRUIT_CUM, GLOBAL.FLUID_TYPE_FRUIT_GIRLCUM, GLOBAL.FLUID_TYPE_EGGNOG])) output("<i>“Mmm, tasty,”</i> she says as she licks her lips, sucking the last drop of your [pc.cum] from your tip.");
		else output("<i>“Bleh,”</i> she says as she sticks out her tongue, but she still licks the last drop of your [pc.cum] from your tip.");
		output("\n\nShe climbs up next to you from underneath the table. As she sits down, you notice a modestly sized wet spot between her legs. ");
		if (pc.isBimbo()) output("<i>“Babe, like I think we both enjoyed this.”</i>");
		else output("<i>“Looks like you enjoyed your time under the table.”</i> you say as you smile to her. She blushes but gives you a small nod.");
		output("\n\n<i>“I actually had a lot of fun. Knowing that anyone could see me was both terrifying and exciting. But I need to get going, and... umm... also change.”</i> She gives you a peck on the cheek before walking off.");
	}
	else if (pc.cumQ() <= 1000)
	{
		output("You push her further onto your cock with one hand before pumping your ample load down her throat. She groans around your [pc.cock] but you keep her head pressed against your crotch as you continue pumping your load into her stomach. As you feel the tide of cum tapering down, you pull out from her throat. You squeeze the few last drops of your [pc.cum] on her tongue. She obediently swallows down the last of your offering. ");
		if (InCollection(pc.cumType, [GLOBAL.FLUID_TYPE_CHOCOLATE_MILK, GLOBAL.FLUID_TYPE_HONEY, GLOBAL.FLUID_TYPE_STRAWBERRY_MILK, GLOBAL.FLUID_TYPE_NECTAR, GLOBAL.FLUID_TYPE_VANILLA, GLOBAL.FLUID_TYPE_CHOCOLATE_CUM, GLOBAL.FLUID_TYPE_BLUEBERRY_YOGURT, GLOBAL.FLUID_TYPE_FRUIT_CUM, GLOBAL.FLUID_TYPE_FRUIT_GIRLCUM, GLOBAL.FLUID_TYPE_EGGNOG])) output("<i>“Mmm, tasty,”</i> she says as she licks her lips. ");
		else output("<i>“Bleh,”</i> she says as she sticks out her tongue. ");
		output("She slowly climbs out from underneath the table. <i>“Ugh, I’m so full.”</i> You can see that she is holding her stuffed stomach with her hands. <i>“I guess I don’t need to eat tonight.”</i> she smirks. You notice there is a wet stain between her legs.");
		if (pc.isBimbo()) output("\n\n<i>“You might want to, Like get some clean clothes, unless you want everyone to know how much fun you had.”</i> ");
		else output("\n\n<i>“I guess you have to worry about getting some clean pants.”</i> ");
		output("You reach to touch her plump belly, stuffed with your [pc.cum]. She yelps, trying to slap your hand away. ");
		if (pc.isAss()) output(" You ignore her and fondle her belly, rubbing the bulge of cum. <i>“I did a pretty good job of stuffing you, didn’t I?”</i> You give her belly a light slap, earning another yelp from her.");
		else output("You pull your hand back, instead pulling her into a kiss. You can taste your own [pc.cum] on her lips.");
		output("\n\n<i>“That was surprisingly fun, I wouldn’t mind doing that again. Especially when anyone can see me... in full view of everyone... shamelessly pleasuring someone...”</i> She’s sinking deeper in her fantasy. You shake her from dreaming, bringing her back to the dark back room of the bar. <i>“I need some rest, so see you next time. Oh, and if you want to do this again, I’m open to the idea,”</i> she says and blows you a little kiss before walking off.");
	}
	else
	{
		output("\n\nYou’re going to blow your load down her throat and you don’t want to spill a single drop. ");
		if (pc.isAss()) output("Grabbing her by those feline ears ");
		else output("Grabbing the back of her head ");
		output("you slam her head down all the way. With a breathless moan, you start pumping your [pc.cum] down her throat. She shudders as she is filled with more and more of your liquid love-juice. The seconds tick by as you keep filling her stomach. She starts to push against you, trying to get your [pc.cock] free from her throat.");
		if (pc.isAss()) output("You ignore her and keep a tight grip on her ears. She punches you in the gut in a desperate attempt to get you to let go. You flinch and decide to release her head before she gets any more desperate.");
		else output("You decide to let go of her head before she is suffocated by your [pc.cock].");
		output("\n\nShe pulls free with a loud gasp, <i>“Fuck!”</i> You continue to hose her down head to toe with more of your [pc.cum] until the flow finally starts to die down. She pulls herself next to you with great effort, takes a look at herself and starts to curse at the condition of her clothes. <i>“Shit, I’m... I need to get cleaned up... fuck.”</i> ");
		if (pc.isAss()) output("Basking in the afterglow of your orgasm, you watch her drag herself into the bathroom.");
		else output("You help her up and walk her to the bathroom. You walk back to your seat and wait for her to clean herself up.");
		output("\n\nWhen she returns from the bathroom she isn’t covered in your cum anymore, but her clothes are just as soaked and her belly is bloated to pregnant proportions. <i>“Jeez, warn me next time if you’re going to cum like a celibate kui-tan.”</i>");
		output("\n\nDoes that mean she is willing to do this again? <i>“I guess so. But, seriously, warn me the next time. And even though it feels like I’m carrying a litter of kittens, I enjoyed being down there, in full view of everyone.");
		if (pc.isAss()) output(" Also, next time, don’t try to suffocate me with your dick.");
		output("”</i>");
		output("\n\nShe blows you a raspberry before walking off, albeit slowly since she is still exhausted and bloated.");
	}

	IncrementFlag("ERIKA_SEXED");

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

	output("You tell her you’d like her to work on your [pc.cunt]. She pushes her fingers into your slit before starting to work them, getting your juices flowing. You reach down and collect some of your girl-juices on your fingers, only to wipe those fingers on her nose. ");
	if (pc.isAss()) output("<i>“A slutty kitty like you should know how to lap away at some girl’s pussy.”</i>");
	else output("<i>“I could really go for a cute girl licking away at my pussy.”</i>");
	output("\n\nYou push her into your pussy, her nose bumping into your [pc.clit]. ");
	if (pc.hasCock()) output("Your [pc.cock] rests on her forehead leaking precum into her hair. ");
	output("You give her ears a little scratch as she starts to lick your [pc.pussy]. After a while of her licking at your [pc.pussy] lips, you grow tired of her fumbling attempts at pleasing you. ");
	if (pc.isAss()) output("<i>“You’re not actually supposed to lick like some mutt,”</i> you chastise her, flicking her ears. She whines into your muff. <i>“Ugh, I have to do everything myself, don’t I?”</i> You rub your [pc.pussy] against her face for a while, smearing her face in your juices. You twist one of her ears before pulling her face free from your [pc.pussy]. <i>“Now pay attention to the clit, it’s not just for poking your nose.”</i> She offers you a small apologetic whine and reaches to do as you say. With a sigh, you let go of her ear.");
	else output("Pushing her free from your [pc.pussy], you tell her that she needs to pay more attention to the clit. You pull open the lips of your [pc.pussy] and rub your [pc.clit] with the tip of your finger as an example. <i>“Lick it and use your hand to pay attention to the rest of the pussy,”</i> you instruct her.");
	output("\n\nShe gets back to work with more finesse, licking your [pc.clit] and massaging the inner lips of your [pc.pussy] before pushing two fingers back inside you.");
	output("\n\nRelaxing as she gets to work treating your pussy, you recline in your seat. You spot Honey bouncing around between tables, taking orders. You flag her down and order some mead for yourself. ");
	if (pc.isAss()) output("<i>“And put it on her tab,”</i> you say, pointing down to Erika. ");
	output("In a short while, Honey places the mead in front of you. Taking a sip of it, you thank her before relaxing back into your seat. Bringing your free hand down to Erika, you reward her efforts by giving her ears a gentle stroking.");
	output("\n\nIn response to your stroking, she starts to rub on the insides of your [pc.pussy] with more vigor. Her fingers touching your g-spot earns her a spurt of your juices so she starts to focus on the sweet spot inside your love tunnel. <i>“Not yet, I don’t want this to end yet,”</i> you whisper. She does as you say, but she still rubs over your g-spot occasionally. She’s keeping your lust burning and your orgasm just within arm’s reach.");
	output("\n\nYou continue savoring your mead and telling her to slow down every time you feel your orgasm approaching. You want to take your time and relish the soft touch of her tongue and fingers on your [pc.clit].");
	output("\n\nSwigging down the last drops of the mead, you decide to take the initiative. You rub your [pc.pussy] against her face, smearing it in your juices. She takes the hint, nibbling on your [pc.clit] and rubbing your g-spot more vigorously. After edging you for so long, she is able to bring you to orgasm pretty quickly. Screaming your orgasm to the half-empty bar, you soak Erika’s face in your [pc.girlCum]. ");
	if (pc.hasCock()) output("Your [pc.cock] goes off in sympathy, drenching her hair in your [pc.cum] as well. ");
	output("A few of the patrons give curious glances your way with all the ruckus you’re making, but they quickly lose interest when they realize what is going on. Just another day on the frontier for them.");
	output("\n\nAfter you stop painting her face with your [pc.girlCum], she climbs up from beneath the table, her face glistening in the dim light of the bar. You pull her into a kiss, sampling some of your [pc.girlCum] from her cheek. ");
	if (pc.isAss()) output("<i>“It’s a good look for you. Now everyone can see your proper place.”</i>");
	else output("<i>“Quite the makeover I gave you, but you’d better go wash up unless you want to smell like pussy for rest of the day.”</i>");
	output("\n\nShe’s beet red when you let her go. Without a word, the blushing kaithrit sets off to the bathroom. You wait for her to come back, idly toying with your [pc.pussy]. After a while, she comes back, her face clean and clear of your [pc.girlCum]. She sits next to you. <i>“I had fun, thanks. I wouldn’t ever have realized how fun this is without your help, to be seen by someone... anyone,”</i> she starts to mutter dreamingly. You shake her awake from her fantasies, kissing her on the nose and sending her on her way.");

	IncrementFlag("ERIKA_SEXED");

	processTime(20+rand(5));
	erika.girlCumInMouth(pc);
	pc.orgasm();

	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function erikaPublicSexThreesome1():void
{
	clearOutput();
	showErika();
	author("Doots");

	output("You get a better idea. <i>“Come out from under there,”</i> you tell her as you pull her onto the seat next to you and stand up. Wandering to the bar proper you search out a partner for your plan to stuff the silly little kaithrit.");

	clearMenu();
	// [Gryvain] (50% chance of occurring instead of the ausar one also requires PC dick smaller than max
	if(pc.cockThatFits(erika.analCapacity()*1.5) >= 0) addButton(0, "Next", (rand(2) == 0 ? erikaPublicSexThreesomeGryvain : erikaPublicSexThreesomeAusar));
	else if (pc.cockThatFits(erika.analCapacity()) >= 0) addButton(0, "Next", erikaPublicSexThreesomeGryvain);
	else addButton(0, "Next", erikaPublicSex, false);
}

public function erikaPublicSexThreesomeGryvain():void
{
	clearOutput();
	showErika(true);
	author("Doots");
	
	var cIdx:int = pc.cockThatFits(erika.analCapacity());
	if(cIdx < 0) cIdx = pc.smallestCockIndex();
	
	output("You spot a bored looking gryvain lounging at the bar. ");
	//PC starting race is half gryvain or PC is a full gryvain or has read the gryvain codex entry
	if (pc.originalRace == "half-gryvain" || pc.race() == "gryvain" || CodexManager.entryViewed("Gryvain")) output("You notice that she has only one pair of wings and she’s missing the draconic horns of a full blooded gryvain. ");
	output("She’s tall, sporting hefty FF-cup breasts, each capped off with black buds and you spot a <b>very</b> large reptilian dick freely hanging between her black scaled legs. Even in its flaccid state it almost reaches to her knees. For the sake of Erika’s [erika.asshole] she’d better not be much of a grower. Behind her impressively sized reptilian dick there are a set of equally impressive balls. Hopefully she’d be up to the task.");
	output("\n\nYou walk up to her ");
	if (pc.tallness <= 48) output("and try tapping her shoulder, but you have to settle at poking her in the ribs. ");
	else output("and tap her on the shoulder to her attention. ");
	output("\n\nShe scowls at you, demanding to know why you are bothering her. As you explain to her what you have on your mind, her scowl melts into a lustful grin and her reptilian shaft gives a mighty throb in agreement.");
	output("\n\nYou walk back to your table with the tall herm in tow. She’s idly fondling her shaft while her eyes are locked on your little kaithrit. Erika is sitting where you left her, meekly looking around until her eyes lock onto the dragon girl behind you, which grow wider than you have ever seen before. Her eyes flick downwards before she turns her beet red face away from you, but she keeps stealing glances up at the bare reptilian member.");
	output("\n\nPlacing a hand on your shoulder, your anonymous partner for the night walks past you, standing in front of Erika. She towers above the kaithrit, stroking along her jaw. Grabbing her under her armpits, the gryvain picks Erika up and pulls off her clothes until she’s just as naked as the gryvain. Your scaly partner shuffles her arms under Erika’s knees, pulling her feet above her head.");
	output("\n\nYou walk in front of Erika. ");
	if (pc.tallness <= 48) output("You have a hard time figuring out how you are going to make this work logistically, but after a while, you manage to position yourself in such a way that allows both of you to fuck the kitty in between you two without complications. ");
	output("You hug Erika between both of you, letting her legs rest on your shoulders while grabbing onto the halfbreed gryvain’s ass. For her part, the dragoness begins tweaking her black nipples and toying with her reptilian shaft in anticipation of pounding Erika.");
	output("\n\nYour friend for the night starts rubbing the head of her ribbed prick against Erika’s pucker, spreading her plentiful pre around to prepare Erika’s butt for the coming penetration. You ");
	if(!pc.isNude()) output("get rid of your [pc.lowerGarments] and ");
	output("place your [pc.cock " + cIdx + "] against the reptilian shaft already pressing against the kitty’s tail hole. You tweak one of Erika’s nipples again. <i>“You really want this, don’t you?”</i> you ask, rubbing the tip of her canine shaft with your thumb. <i>“Now’s your last chance to back out, so I’ll ask you once more. Do you want this? ");
	if (pc.isAss()) output("Do you want us to fuck you like a whore right in the middle of the bar where everyone can see you and hear you begging for more?");
	output("”</i> She gives you a small nod, one where she barely moves her head, but a nod nonetheless.");
	output("\n\nBoth of you slowly sink inside of her at the same time, stretching her [erika.asshole]");
	if (flags["ERIKA_GIVEN_ANUSOFT"] != undefined) output(" to its limits");
	output(". She throws her head back to rest it between the soft mounds of the gryvain as a breathless moans breaks from her lips. With a grin, you spread her butt cheeks, and both of you thrust in as deep as you can. You start pumping your [pc.cock " + cIdx + "] in and out of her in an alternating rhythm with the gryvain.");
	
	pc.cockChange();
	
	output("\n\nAfter a while of you decide to change it up. You begin plunging inside of her at the same time as the gryvian, giving her no chance to get used to your humping. Her sweat-slick form is trapped between your thrusting bodies. Head thrown back, arms hanging limply, eyes rolled back into their sockets, mouth hanging open and tongue lolling to the side. Erika’s panting is interrupted by a small whimper every time both of you happen to shove all the way inside her at the same time.");
	output("\n\nErika’s tail hole has been made nice and moist by all the pre both of you have been leaking inside of her. The sensation of her passage clenching around you and the reptilian shaft rubbing against your [pc.cock " + cIdx + "] has you racing towards your climax. The dragon girl behind Erika has taken to twisting and rubbing kitty’s nipples, her ass suddenly clenches around you <b>hard</b> as she is thrown into orgasm. Erika’s cum flies in arcs above her own head, and the first jet lands on the gryvain’s face while rest land on her breasts. The rest lands on Erika’s face, hair, and in her lolling mouth. Your scaly friend takes some petty revenge by rubbing the wasted load all over Erika’s breasts.");
	output("\n\nErika’s sudden orgasm is all it takes to push you to the brink of orgasm. ");
	if (pc.balls > 0) output("Your [pc.balls] tighten and your ");
	else output("Your ");
	output("[pc.cock " + cIdx + "] gives a mighty throb against the dragon dick that’s assisting you in stretching out Erika’s [erika.asshole].");
	output("\n\nThe sudden heat of the halfbreed gryvains orgasm almost pulls you down with her, it takes your all to not cum yet. Once the hot gryvain cum stops flowing into her [erika.asshole] you feel how rigid her meat still is.");
	output("\n\n<i>“Are you sure you can keep up?”</i> says the gryvain with a smirk on her face. You hold on for a moment, drawing your eyes to the herm behind Erika. She continues. <i>“I guess that’s the problem with picking up strangers at a bar. They might pop before you’ve even warmed up.”</i> A smug grin spreads over her face. <i>“In this case, that’s not a problem. That’s fine. You can leave your girl with me for rest of the night,”</i> she says, sensually rubbing Erika’s cum-splattered face and hair. <i>“I’ll take good care of her... unlike you.”</i>");
	output("\n\nGritting your teeth, you hold back the tide of your orgasm. You can’t let this smug fucker beat you. She smirks once more when she realizes that you’re trying to holding out.");

	clearMenu();
	if (pc.libido()/2 + rand(20) + 1 < pc.willpower()/2 + rand(20) + 1) addButton(0, "Next", erikaPublicSexThreesomeGryvainVictory, cIdx);
	else addButton(0,"Next",erikaPublicSexThreesomeGryvainLoss, cIdx);
}

public function erikaPublicSexThreesomeGryvainVictory(cIdx:int = 0):void
{
	clearOutput();
	showErika(true);
	author("Doots");

	output("By the time Erika’s cock starts to dribble its remaining cum down her shaft during her second orgasm, you’re starting to have a hard time holding back your climax. Erika’s rhythmical clenching around you, and the reptilian shaft throbbing against your [pc.cock " + cIdx + "] definitely doesn’t make the job any easier. Sweat gathers on your brow and you grit your teeth, hard. ");
	if (silly) output("If you had a dentist, he would probably be furious with you. ");
	output("The gryvain holding Erika up also seems to be getting exhausted, sweat gathering on her own brow, her thrusting losing rhythm. Her tail starts to flick around chaotically as she begins wildly rutting Erika’s tail hole.");
	output("\n\nWith a tiny whimper, Erika’s body seizes in orgasm and her balls draw tight against her body, but they’re dried out. That doesn’t stop her from clenching around you, trying to milk your [pc.cock " + cIdx + "] and for all that it’s worth. At this rate the cocksure herm is going to beat you.");
	output("\n\n<i>“Can’t hold on any longer? You’re gonna cum already, aren’t you?”</i> Trying not to grind your teeth to dust in anger, you nod your head.");
	output("\n\n<i>“Good, because I am, too.”</i> She starts to thrust even harder and faster inside Erika. Letting out a roar of pleasure as she cums, pumping more of her pent up lust inside Erika.");
	output("\n\nSatisfied that you finally showed who’s boss to that cocky dragon girl, you let the dam of your orgasm break. ");
	
	var cumQ:Number = pc.cumQ();
	if (pc.hasKnot(cIdx))
	{
		output("You both push your bitch-breakers into Erika’s weakly spasming [erika.asshole] before either one can inflate and trap the other out of the bitch hole. Your knots stretch Erika’s ass so much that she squeezes her eyes shut and screams as she cums one last time, breaking another dry orgasm from her.} Your cum finally surges out of your cock and into Erika along with the gryvain’s. ");
		if (cumQ <= 500) output("Your orgasm is utterly dwarfed by the tide of the gryvain’s cum. Your [pc.cum] mixes with her generous output inside Erika’s colon.");
		else if (cumQ <= 1000) output("Even with her high amount of cum, you generally manage to match her cum output, your [pc.cum] mixing with hers in a swirling puddle inside Erika.");
		else
		{
			output("Even with her generous output, you manage to pump more spunk inside Erika than the big dicked dragon girl. She squints at you with a trace of jealousy on her pretty face. Her expression then softens and she grins, reaching down to ");
			if (pc.balls > 0 && pc.hasVagina()) output("finger your [pc.cunts] and massage your [pc.balls] to help you milk out more cum to shoot into Erika. You groan and begin to cum even harder than you were before. ");
			else if (pc.balls > 0 && !pc.hasVagina()) output("massage your [pc.balls] to help you milk out more cum to shoot into Erika. You groan and begin to cum even harder than you were before. ");
			else if (pc.balls == 0 && pc.hasVagina()) output("finger your [pc.cunts] to help you milk out more cum to shoot into Erika. You groan in pleasure and begin cumming even harder than you were before. ");
			else output("finger your [pc.asshole] and stroke your prostate. You groan and begin to cum even harder than you were before. ");
		}
		output("Erika’s stomach starts to bloat with both of you blowing loads inside her");
		if (cumQ > 1000) output(", with you contributing the most");
		output(".");
	}
	if (pc.hasKnot()) output("Both of your knots form an almost airtight seal in Erika’s [erika.asshole], trapping your loads in her stomach. With the cum having nowhere else to go, her belly continues to fill and expand until she looks like she’s pregnant. Waves of excess jizz start flowing around your knots and pour out of Erika’s ass when her stomach decides that it has had enough. It splatters your [pc.hips] and [pc.legs] and the floor beneath you.");
	else output("\n\nJizz streams out of Erika just as fast as it’s being pumped into her. It splatters all over your body and the floor beneath you. Though, there is enough cum already in her to keep her looking like she’s pregnant.");
	output("\n\n<i>“I guess you have some staying power, huh?”</i> the gryvain says while smirking at you.");
	if (pc.isAss()) output("\n\n<i>“Can’t let a bitch like you think that she’s better than me.”</i>");
	else output("\n\nYou smile back at her, fully well knowing that you beat her.");
	output("\n\nYou tap on Erika’s cheek to see if she’s ok, but the only response you get is a small murmur and faint snoring. It seems you’ve fucked Erika into exhaustion. <i>“What should we do?”</i> the gryvain asks you. <i>“We can’t just leave her here like this.”</i>");

	flags["ERIKA_SEEN_NAKED"] = 1;
	IncrementFlag("ERIKA_SEXED");

	processTime(30+rand(15));
	pc.orgasm();
	erika.loadInAss(pc);
	erika.orgasm();

	clearMenu();

	if (pc.isAss())
	{
		output("\n\n<i>“Not my problem. She should’ve known better. Besides, there’s nothing I can do about it since I don’t know where she lives.”</i> That said, you turn to walk away from the gryvain while she stares at you in disbelief. Despite what you told her, you’d never let Erika out of your sight. You stick around in another booth and wait for her to recover from her exhaustion-induced slumber, ready to bash heads with anyone that tries to bother you or her. When Erika starts to wake up, you decide that she can now take care of herself and that it’s time for you to leave.");
		addButton(0,"Next",mainGameMenu);
	}
	else
	{
		output("\n\n<i>“I’ll stay here and make sure she’s alright, there’s no need for you to stay.”</i>");
		output("\n\nShe gives you a warm smile before walking back to the bar. After a while, Honey drops a mug of mead under your nose. You look at her questioningly, she just smiles and points at a lady, the gryvain from earlier. She offers you a friendly wave, and you return it, smiling. You take your time savoring the gifted mead. Not like you’re going anywhere, not while Erika is still passed out.");
		addButton(0,"Next",erikaPublicSexThreesomeGryvainEnd);
	}
}

public function erikaPublicSexThreesomeGryvainLoss(cIdx:int = 0):void
{
	clearOutput();
	showErika(true);
	author("Doots");

	output("It’s no use, you can’t pull yourself back from the edge anymore. Biting your lip, you give in, letting your [pc.cum] flow through your [pc.cock " + cIdx + "] and into Erika’s ass. ");
	if (pc.hasKnot(cIdx)) output("Your [pc.knot " + cIdx + "] starts swelling against the gryvain’s reptilian cock and partially plugs Erika’s hole while you keep ");
	if (pc.cumQ() <= 500) output("squirting your load into her.");
	else output("pumping her full of your [pc.cumVisc] cum, swelling her belly.");
	output("\n\nYou’re panting by the time you run dry. The gryvain chuckles and ");
	if (pc.tallness >= 84) output("rubs your head. ");
	else output("rubs your shoulder. <i>“Aww, that’s too bad.”</i> She smirks as you pull your rapidly softening [pc.cock " + cIdx + "] from Erika, your cum spilling onto the floor..");
	output("\n\n<i>“You looked so cute when you were trying to hold out. You really thought you could beat me, huh?”</i> You stumble back and into a chair, your breaths coming out heavy. <i>“Feels good to have such a pretty girl </i>all<i> to myself,”</i> she coos while pumping her dragon dick in and out of her, groping Erika’s breasts and cock, putting up a taunting show for you. <i>“I wonder what she sees in you?”</i>");
	output("\n\nShe continues goading you as she pounds Erika, even going as far as to bend Erika over the table and fuck her mercilessly while staring you straight in the eye. She seems to be getting off on taunting you. She finally slams Erika down on her dick with a roar");
	if (pc.cumQ() <= 500) output(", swelling Erika’s belly even further with liquid lust as she cums powerfully for the second time.");
	else output(", swelling Erika’s stomach with the amount of liquid lust she’s still able to produce.");
	output("\n\nAfter she’s done cumming into Erika, she plops herself down on a bench with Erika in her lap, slowly stroking and caressing the kaithrit’s cum-swollen belly. <i>“Too bad you couldn’t have held out a little longer. It would’ve been a lot more fun.”</i> She grins and, when her knot deflates, pulls Erika off of her dick, drenching everything below her waist in mixed jizz as it pours out of the abused hole. She sets Erika down beside her and stands up, walking over to you. She claps you on the shoulder and sighs. <i>“Better luck next time?”</i> She bursts out laughing and begins walking away, her cock leaving a trail of cum behind her.");


	clearMenu();
	addButton(0,"Next",erikaPublicSexThreesomeGryvainEnd);
}

public function erikaPublicSexThreesomeGryvainEnd():void
{
	clearOutput();
	showErika();
	author("Doots");

	output("<i>“Ugh... Where am I?”</i> she groans and rubs her head. Seems that she finally woke up.");
	if (pc.isBimbo()) output("\n\n<i>“Dear");
	else output("\n\n<i>“Erika");
	output(", you’re still at Burt’s, or did you already forget what happened?”</i> You stroke her inflated belly. <i>“I couldn’t just leave you here. Are you gonna be fine now?”</i>");
	output("\n\n<i>“Yeah, I’ll just rest for a bit, then I’ll be fine.”</i>");
	output("\n\n<i>“Here, you can have what’s left of this,”</i> you say handing the mug to her. <i>“I’m going now, but you rest here.”</i> You offer her a parting smile before leaving her to recuperate.");
	
	flags["ERIKA_SEEN_NAKED"] = 1;
	IncrementFlag("ERIKA_SEXED");

	processTime(60+rand(15));
	pc.orgasm();
	erika.loadInAss(pc);
	erika.orgasm();

	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function erikaPublicSexThreesomeAusar():void
{
	clearOutput();
	showErika(true);
	author("Doots");
	
	var cIdx:int = pc.cockThatFits(erika.analCapacity() * 1.5);
	if(cIdx < 0) cIdx = pc.cockThatFits(erika.analCapacity());
	if(cIdx < 0) cIdx = pc.smallestCockIndex();
	
	output("You spot a buff ausar at the bar, knocking back drinks. Hoping he’s not three sheets to the wind, you sit next to him, asking if he would be willing to help you with something. ");
	if (pc.isHerm()) output("<i>“For a pretty girl like you? Of course,”</i>");
	else output("<i>“Let’s hear it first,”</i> he responds. You explain to him what you have on your mind.");
	output("\n\n<i>“Well, how could I turn down an offer like that?”</i> Finishing his last drink, he stands up and follows you to where Erika is sitting. He drops down next to her and starts to grope her small breasts, quickly slipping one hand under her shirt. <i>“Your "+ pc.mf("boyfriend", "girlfriend") +" told me that we could have something between the three of us.”</i> ");
	output("\n\nErika shudders from both the groping of the buzzed ausar and from the thought of getting drilled by both of you at the same time. Taking that as her sign of agreement, he yanks her shirt off, brings a nipple to his mouth and starts to suckle on it. He slides his hand into her pants, then pauses. <i>“Huh, thought she was a girl,”</i> he mutters to himself. He doesn’t seem to mind, though, since he grabs her jeans and panties with both hands and pulls them down to her ankles.");
	output("\n\nHe hoists her up on the table, placing her on her hands and knees, before looking at you. <i>“Which end do you want? Figured it would only be fair for you to choose, since she’s your girl and all.”</i>");

	clearMenu();
	addButton(0, "Ass", erikaPublicSexThreesomeAusarAss, cIdx);
	addButton(1,"Mouth",erikaPublicSexThreesomeAusarMouth, cIdx);
}

public function erikaPublicSexThreesomeAusarAss(cIdx:int = 0):void
{
	clearOutput();
	showErika(true);
	author("Doots");

	output("<i>“That’s fine, I prefer the mouth, anyways.”</i> He unbuckles his jeans before climbing onto the table. <i>“You like this kind of treatment, don’t you?”</i> he chuckles, pushing one of his thick digits into her mouth. He pulls the finger out of her mouth once it’s slathered with her saliva and replaces it with his dick. It’s about 8 or 9 inches long and bright red, covered in thick veins. His knot is surprisingly large compared to rest of his shaft. ");
	output("\n\n<i>“Better open up girl, this is a bit thicker than my finger,”</i> he says as he rubs his tapered tip against her lips.");
	output("\n\nEyes glazed over, Erika opens her mouth for the canine shaft waiting at her lips and starts to lick the head. Suddenly, he roughly thrusts into her mouth, making her gag... not that she minds. In fact, she’s probably enjoying the treatment. Her petite canine shaft leaks pre on the table and her tails sway back and forth above her plump butt.");
	output("\n\nDeciding that now is a good a time as any, you climb behind her, grabbing a tail in one hand and her dick in the other. <i>“I hope you didn’t forget about me,”</i> you say, pulling on her tail, forcing her to arch her back. You collect some of her pre and bring it to your [pc.lipsChaste] to lick your finger clean, spreading your spit all over it. <i>“Maybe you should invest in some Sweet Treat, would make this more fun for me.”</i> ");
	output("\n\nYou push the spit covered finger against her pucker. <i>“Not that I’m not having fun, but sweet cum would fit a sweet thing like you much better.”</i> You wriggle your finger around her insides, searching for that sweet little bundle of nerves. When you find it, you massage it without mercy, forcing her to leak more pre onto the table. <i>“Oh, you’re leaking pre like a faucet. Tell me, ");
	if (pc.isBimbo()) output("dear,");
	output(" are you getting close?”</i>");
	output("\n\nIf it weren’t for the ausar pumping into her mouth, she probably would nod, but instead she raises her butt higher and wiggles her hips. <i>“I’ll take that as a yes.”</i> You collect some more pre from her twitching shaft and push another finger inside her, mercilessly attacking her prostate again and jerking her little dog cock. <i>“Cum for me");
	if (pc.isAss()) output(", bitch");
	output(".”</i> you whisper into her ear. She shudders and clenches around your fingers, spilling her seed onto the table.");
	output("\n\nYou hear a sharp inhale from your doggy friend for the night. <i>“Damn, that’s tight.”</i>");
	output("\n\n<i>“You ok over there?”</i> you ask him.");
	output("\n\n<i>“I wasn’t quite prepared for that. Almost popped too early,”</i> he growls softly.");
	output("\n\nTurning your attention back to Erika, you grab her tail again and bend down to whisper into her ear. <i>“Did you think we’re done? The fun is just starting.”</i> Slapping your [pc.cock " + cIdx + "] between her butt cheeks, you start to hotdog her fat ass, leaking pre onto her tail, lower back, and pucker. <i>“Now for the best part.”</i> You angle your [pc.cock " + cIdx + "] against her pucker and, with a single steady thrust, you embed yourself in Erika up to your [pc.sheath " + cIdx + "].");
	
	pc.cockChange();
	
	output("\n\n<i>“Finally getting down to business, I see. About time, I’ve been edging for the whole time,”</i> your nameless friend grumbles from in front of Erika.");
	if (pc.isNice()) output("\n\n<i>“Oh, sorry about that. I got a bit carried away.”</i> You scratch the back of your head, embarrassed that you forgot about him. ");
	else if(pc.isMischievous()) output("\n\n<i>“Well now we know you have great stamina and willpower.”</i> You grin at him and pat Erika’s ass. ");
	else output("\n\n<i>“That’s your problem, not mine. I never told you to do anything.”</i> Ignoring his grumbling you turn your attention back to Erika. ");
	output("Since he’s so far ahead, you’d better catch up with him. You start to pump your [pc.hips] against Erika’s butt in a steady pace, building towards your own orgasm. ");
	// If PC has large cock
	if (pc.cocks[cIdx].cLength >= 20) output("The size of your [pc.cock " + cIdx + "] bulges her belly, an imprint of your [pc.cockHead " + cIdx + "] forming in her abdomen with every thrust.");
	output("\n\nErika’s moans and whimpers are muffled by the cock in her mouth, and with every thrust you send her back onto said dick, effectively sawing her between the two dicks impaling her.");
	output("\n\nWith your [pc.cockNounSimple " + cIdx + "] rubbing against her prostate, she is starting to get hard despite just cumming. In short order her puppy pecker is rock hard again. <i>“What kind of lover would I be if I didn’t even give you a reach around while drilling your ass?”</i> you chuckle, earning another muffled whimper from her, along a gush of pre. <i>“Tell me, ");
	if (pc.isBimbo()) output("dear, ");
	output("which do you enjoy more: the dick up your ass or the hand gliding along your ");
	if (pc.isAss()) output("bitch clit");
	else output("dick");
	output("?”</i> With that said you pull yourself free from her ass, leaving only your [pc.cockHead " + cIdx + "] inside. Not even two seconds pass before she’s slamming her hips back towards you. <i>“I think that’s a pretty clear answer,”</i> you say,seizing her hips as you start to pump inside her again.");
	output("\n\nWith a shudder and a moan, she shoots another load on the table and on your hand. ");
	if (pc.isAss()) output("You wipe your hand clean on her hair and face, then ");
	else output("You ");
	output("reach down to scoop up some of her cum.");
	output("\n\n<i>“Hey, let go of her face for a sec.”</i> He gives you a quizzical look but pulls out of her mouth all the same. <i>“Since you’ve been such a good girl, I think you deserve a treat, don’t you?”</i>");
	output("\n\n<i>“Yes...”</i> she moans breathlessly, her mouth hanging open and her tongue lolling out.");
	output("\n\n<i>“Well, here’s your treat then. Eat it up like a good girl.”</i> You press your cum coated digits into her mouth. She suckles and licks them eagerly, lapping up her own cum.");
	output("\n\nPulling your now saliva coated fingers out of her mouth, you grin at your ausar friend. <i>“I think now would be a good time to give her a proper treat, not just a taste.”</i>");
	output("\n\nRather than saying anything, he pulls her back down to dick level, thrusting back into her gaping mouth. It seems he’s not going to wait for you anymore with the way he’s recklessly pumping away at her mouth. Deciding you’re not taking home silver tonight, you plunge back in, effortlessly sliding into her well-traversed tunnel. Approaching your peak, you stroke her oversensitive member, making her clench around your [pc.cock " + cIdx + "].");
	if (pc.hasKnot(cIdx)) output("You push your [pc.knot " + cIdx + "] against her [erika.asshole], straining it with the girth of your bitch breaker before it finally accepts it. You can hear and feel her moan around the anonymous ausar’s cock as you pop your knot inside her. ");
	if (pc.balls > 0 ) output("Your [pc.balls] draw upwards as your ");
	else output("Your prostate draws tight before your ");
	output("[pc.cum] spews inside her, welling inside her stomach, filling her with your liquid lust, a proof of how much you enjoyed it. At the same time the ausar handling her mouth starts to cum too, fighting his animalistic instinct to tie his bitch. His knot presses against her lips as his seed starts to flow down her throat. Because she’s being pumped full of cum from both ends, her stomach begins to bloat ");
	
	var cumQ:Number = pc.cumQ();
	if (cumQ <= 500) output("a bit, showing a small cum paunch.");
	else if (cumQ <= 1000) output("considerably, showing the amount of cum inside her, which most of it being your doing.");
	else output("to pregnant proportions, her skin brushing against the wood of the table.");
	if (pc.hasKnot(cIdx)) output("\n\nYou stroke her ass while waiting for your knot to deflate. When it does, you ");
	else output("\n\nYou ");
	output("pull out of her ass, uncorking her [erika.asshole], letting your [pc.cum] flowing down her legs.");
	if (cumQ > 1000) output(" <i>“Hey, don’t get the table dirty. Burt’ll be pissed if you do.”</i>");
	output("\n\nThe ausar pulls out her mouth and sighs. <i>“That was nice. Thanks for sharing a piece of this ass... or mouth. But, yeah, thanks.”</i>");
	output("\n\n<i>“No problem. If I’m in the mood for another threesome and you’re around, I’ll be sure to pick you up for another round.”</i> You wave him a goodbye as he picks up his pants and heads back to the bar. <i>“So, Erika, would you be willing for another round some time?”</i>");
	output("\n\nFighting for breath, she nods, snuggling next to you and murmuring something about letting go and doing this again. After a while, you pick up your [pc.gear] and offer her a small wave before heading back to the bar proper.");

	flags["ERIKA_SEEN_NAKED"] = 1;
	IncrementFlag("ERIKA_SEXED");

	processTime(30+rand(15));
	pc.orgasm();
	erika.loadInAss(pc);
	erika.orgasm();

	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function erikaPublicSexThreesomeAusarMouth(cIdx:int = 0):void
{
	clearOutput();
	showErika(true);
	author("Doots");

	output("<i>“I would have preferred the mouth, but I can live with the ass,”</i> he says as he tosses his jeans over his shoulder, making you dodge the incoming clothing. Climbing onto the table he starts to hotdog his shaft between her cheeks, rubbing his pre between them and, consequently, all over Erika’s [erika.asshole]. You climb onto the table yourself after getting rid of your [pc.gear]. Taking your [pc.cock " + cIdx + "] into your hands it quickly springs to full mast at the prospect of stuffing her mouth. Primed and ready to go, you place your [pc.cockHead " + cIdx + "] to her lips. Using both hands on her head you pull her onto your [pc.cock " + cIdx + "], pushing into her throat. ");
	// If PC has large cock
	if (pc.cocks[cIdx].cLength >= 20) output("Her neck bulges with the vague outline of your [pc.cockNounSimple " + cIdx + "], and You are so deep that her nose is pressed against your [pc.sheath " + cIdx + "]");
	output("\n\nShe lifts one hand to ");
	if (pc.balls > 0) output("rub your [pc.balls], kneading them, trying to coax an early load out of them. ");
	else if (pc.hasVagina()) output("softly tease your [pc.clit] urging you closer to your orgasm. ");
	else output("rub your inner thigh, slowly stroking your soft [pc.skinFurScales]. ");
	output("However, with only one hand on the table she doesn’t have the strength to keep herself up, and her arm starts to shake with exhaustion. You push the hand ");
	if (pc.balls > 0 && pc.hasVagina()) output("kneading your balls while dipping couple fingers into your [pc.pussy] ");
	else if (pc.balls > 0 && !pc.hasVagina()) output("kneading your balls ");
	else if (pc.balls == 0 && pc.hasVagina()) output("fingering your [pc.pussy] ");
	else output("rubbing your thigh ");
	output("back to the table.");
	if (pc.isNice()) output("\n\n<i>“You can hold yourself up, right? I wouldn’t want you falling off the table.”</i>");
	else if(pc.isMischievous()) output("\n\n<i>“Can you hold yourself up? That’s not too hard of a job, right?”</i>");
	else output("\n\n<i>“Look, girl. It’s better for both of us if you could at least keep yourself upright.”</i>");
	output("\n\nShe starts to withdraw your [pc.cockNounSimple " + cIdx + "] from her mouth, only for it to be slammed back in when the ausar behind her plows inside. Her throat convulses in shock at the sudden injection of dick she is getting right up her ass. It’s tight, making it hard to thrust into her throat, but she quickly relaxes, allowing you to once again plunder the depths of her mouth with ease.");
	output("\n\nTaking advantage of this, you start to pump in and out of her throat with a steady pace. You plunge all the way into her mouth before pulling halfway out, only to push back in short order, filling her stomach with pre.");
	output("\n\nShe lifts her hand from the table again, this time going for her dick instead of your ");
	if (pc.balls > 0 && pc.hasVagina()) output("pussy or balls.");
	else if (pc.balls > 0 && !pc.hasVagina()) output("balls");
	else if (pc.balls == 0 && pc.hasVagina()) output("[pc.pussy]");
	else output("[pc.thighs]");
	output(". Squeezing her dick, she gathers some pre onto her fingers and reaches her hand behind you. Using the pre as lube she presses her finger into your [pc.asshole], searching for your prostate.");
	output("\n\nOnce she finds it, she starts to rub it, making you leak more pre into her esophagus. ");
	if (pc.hasKnot(cIdx)) output("This essentially sends you into a rut, making you fuck her face like some confused beast trying to breed [pc.hisHer] bitch.");
	else output("This breaks the last shreds of your will power before you start fucking her face with all of your might.");
	output("\n\nYour frantic efforts are interrupted when you find your whole world tilting. By thrusting while your friend was withdrawing from her, you managed to tip over the table. You come crashing down on top of Erika and your ausar friend.");
	output("\n\n<i>“Erika, are you alright?”</i> ");
	output("\n\n<i>“Yeah, I’m ok, just shocked.”</i>");
	if (pc.isAss()) output("\n\n<i>“I’m ok too, thanks for asking.”</i> the ausar in the bottom grunts. ");
	else output("\n\nYou look past Erika to your friend, <i>“You alright, too?”</i> He grunts his assent. ");
	output("Standing back up, you pick up the table and set it up right again. You hoist yourself back onto the table and in short order Erika and your ausar friend are both back on the table again too, picking up where you left off, which was mainly rutting the bitch between you.");
	output("\n\nWithin the time it took to get back onto the table, your orgasm has escaped you. Frustrated that you humped yourself out of an orgasm, you start to fuck her with more vigor, but this time without putting your whole weight into it.");
	output("\n\nNoticing that Erika is looking up at you with pleading eyes, you give her a break. Not a literal break, of course, but you do pull back far enough to let her breathe. Not for too long though, since you still want to cum.");
	output("\n\nEvery time Erika starts to plead at you with her eyes, you pull back for a few seconds, only to quickly thrust back in. Getting close to your orgasm for the second time, you carefully start to pick up your pace, your breath quickening,");
	if (pc.balls > 0 && pc.hasVagina()) output("your balls tightening in preparation, and your [pc.vagina] leaking.");
	else if (pc.balls > 0 && !pc.hasVagina()) output("your [pc.balls] tightening in preparation to blow a load in Erika’s stomach.");
	else if (pc.balls == 0 && pc.hasVagina()) output("your [pc.cunts] leaking [pc.girlCum] down your legs.");
	else output("your [pc.thighs] quivering.");
	output("\n\nThrusting balls deep ");
	if (silly && pc.balls == 0) output("(figuratively, that is) ");
	output("into her mouth, you start to fill her stomach with your [pc.cum]. Feeling your cum rushing down her throat makes you sigh in content. As your orgasm rushes through you, you try to force your [pc.cockNounSimple " + cIdx + "] further into her throat in order to feed her more of your jizz.");
	output("\n\nThe ausar behind her apparently reached his edge as well, if the full weight of him thrusting and trying to push his knot into her ass is any indication. Finally succeeding in pushing his knot past Erika’s pucker, he leans forward and starts to thrust, hammering his whole body against her in an attempt to get his dick further into her ass.");
	output("\n\nHis full body thrusts have the table tilting in your direction this time.");
	output("\n\n<i>“Well, fuck.”</i> is the only thought that has time to cross your mind before you come crashing down on your [pc.butt]. That is when Erika lands down on you and the large ausar, knocking the air out of everyone.");
	output("\n\nWith some effort, you push the ausar on top of you to the side, and he drags Erika with him. The knot is definitely doing its job keeping him tied to her.");
	output("\n\n<i>“Well, that was fun. Except for the two trips to the floor, but still,”</i> your ausar friend chuckles while rubbing the back of his neck.");
	output("\n\nYou want to give Burt a piece of your mind, like how he should get tables that won’t flip over so easily, but you decide against it since the tables probably weren’t meant for fucking.");
	output("\n\nYou notice that you got some of your [pc.cum] on you on the trip down. ");
	if (pc.isAss())
	{
		output("You pick up Erika’s discarded shirt, wiping down your [pc.breasts], [pc.belly] and finally wiping down your [pc.cock " + cIdx + "].");
		if (pc.cumQ() > 1000) output(" At the end of your cleanup her shirt is a sperm-laden mess, soaked in your [pc.cum].");
	}
	else output("You take a detour to the bathroom to clean yourself up, and in short order you are clean and refreshed again.");
	output("\n\nThe hunky ausar leans back in his seat, caressing Erika’s hips and cum filled belly. <i>“You sure you don’t want to hang around? The knot ain’t going down anytime soon.”</i> He bucks his hips, demonstrating that Erika is stuck fast to his knot.");
	output("\n\nShrugging you pick up your [pc.gear] and walk back to the bar proper. Burt chuckles about the show you three put up.");

	flags["ERIKA_SEEN_NAKED"] = 1;
	IncrementFlag("ERIKA_SEXED");

	processTime(30+rand(15));
	pc.orgasm();
	erika.loadInMouth(pc);
	erika.orgasm();

	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function erikaPublicSexThreesomeLeave():void
{
	clearOutput();
	showErika();
	author("Doots");

	output("You decide you changed your mind. <i>“Come out from under there.”</i> you tell her as you pull her onto the seat next to you. ");
	if (pc.isAss()) output("<i>“Hands off, slut. I have places to be and other sluts to fuck.”</i>");
	else output("You give her a tap on the nose. <i>“I’m not really interested at the moment, but we’ll see if I’m more inclined some other time.”</i>");
	output("\n\nShe seems a little disappointed by your reaction, but she starts to smile when you pull her into a hug and kiss her.");

	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function erikaTakeHerToShip():void
{
	clearOutput();
	showErika();
	author("Doots");

	output("You can definitely think of few things to do with Erika, but none of them involve any of the patrons getting an eyeful of what you are planning");
	if(syriFriendsWithBenefits()) output(", well maybe Syri");
	output(".");
	output("\n\nYou reach to grab a handful of Erika’s ass while whispering into her feline ear what exactly you have in mind. She gives a quick nod before nuzzling into your neck.");
	output("\n\nYou leave the bar as fast as you can without running, Erika following closely. Many of the patrons give you a thumbs up or wink at you as you pass by.");
	output("\n\nWhen you arrive at your ship Erika stops and pants <i>“I want to pick up something from my place,”</i> you tell her to hurry, she turns and bolts off, obviously just as impatient as you are. Now you are left to play the waiting game.");

	clearMenu();
	if (flags["ERIKA_SEEN_NAKED"] != undefined) addButton(0,"Next", erikaSexMenu);
	else addButton(0,"Next", erikaToyBox);
}

public function erikaSexIntro():void
{
	clearOutput();
	showErika();
	author("Doots");

	output("Chatting and drinking are fun and all, but a "+ pc.mf("man", "woman") +" can’t live on that alone.");
	if (pc.isNice()) output("\n\n<i>“I think we both would have more fun if we went somewhere more private, where I could treat you right.”</i>");
	else if(pc.isMischievous()) output("\n\nYou sigh, drawing Erika’s attention to you. <i>“This place is really boring. What do you say we get somewhere more interesting?”</i> Burt shoots you a dirty look at the mention of his bar being boring, but you ignore him and pinch Erika’s buttock, giving her a solid message what you have on your mind.");
	else output("\n\n<i>“I can’t screw you in the middle of the bar in the way I want to, so how about we head back to my place, and I’ll screw your brains right out of that silly little head of yours.”</i> ");
	output("\n\n<i>“I want to pick up something from my place,”</i> she says.");
	output("\n\nYou explain to her that you live on your ship, and how to get to said ship. After assuring you she will find the way on her own you walk to your ship.");
	output("\n\nYou lounge around for awhile in your ship, waiting for her. You start to suspect that she did get lost after all, or maybe she’s just not coming.");
	if (pc.isAss()) output(" Maybe you could find some porn on the extranet to deal with the boredom.");

	clearMenu();
	addButton(0,"Next",erikaToyBox);
}

public function erikaToyBox():void
{
	clearOutput();
	showErika(true);
	author("Doots");
	
	moveTo("SHIP INTERIOR");
	
	output("The consoles light up, informing you that Erika was able to find your ship. Opening the airlock, you see Erika standing there with a rather large box under her arm. You wonder what’s important enough to go out of her way to get. Moving aside you let her in. You’re sure she will tell you what’s in the box eventually.");
	output("\n\nYou lead Erika to your room and, when you get there, sit down on the bed. <i>“So, what’s in the box?”</i>");
	output("\n\n<i>“Toys.”</i> She sets the box down next to you.");
	output("\n\n<i>“Toys?”</i>");
	output("\n\n<i>“Yes, toys. Sex toys, to be exact.”</i>");
	output("\n\nSex toys, huh. Yeah, in hindsight you should have known.");
	output("\n\n<i>“Open it,”</i> she urges you while she starts to strip down, throwing the bundle of clothes to a corner of the room.");
	output("\n\nYou open the box... except it’s locked, so you don’t open it. ");
	if (pc.characterClass == GLOBAL.CLASS_SMUGGLER)
	{
		output("Well, a simple lock like this won’t keep you from the insides of this box. After a while of fiddling with the lock, it pops open.");
		output("\n\n<i>“You know, I could just have opened it.”</i>");
		output("\n\n<i>“Where’s the fun in that,”</i> you smirk at her before popping open the box.");
	}
	else
	{
		output("<i>“It’s locked you know. I can’t really open it if it’s locked.”</i>");
		output("\n\n<i>“Oh, sorry. Completely forgot about that.”</i> She fiddles with the box for a short time with her ass in the air. <i>“There we go.”</i> You reach over and pop open the lid of the box.");
	}
	output("\n\nTaking a look inside, you see what is basically a dragon’s hoard of sex toys: anal beads, butt plugs of varying sizes, bullet vibrators, cock rings, black electrical tape, ring gags, ball gags, bondage rope, fuzzy handcuffs, a riding crop, floggers, a paddle with small cut out hearts along its length, nipple clamps, a jar of EasyFit cream, a bottle of pink glittery lube, and a rather girthy dildo shaped like a horse cock.");
	output("\n\nSomething in the corner of your eye seizes your attention. It’s Erika, but she’s blushing again. You think that, since you’re both ass naked, it would be a little too late for being shy. Turning your attention to her, you break the short-lived silence, asking is something is wrong.");
	output("\n\n<i>“Wrong? Well, it’s just that I forgot to tell you something. Something that might be a big deal for you, or completely trivial. It’s just easier if I show you.”</i> Turning around she bends over, pointing her rear at you.");
	output("\n\nYou don’t notice anything from the usual, a tail hole and a canine dick that is just shy of five inches beneath a pair of small, tightly compressed balls. The realization slowly dawns on you. It’s not what’s there, it’s what’s <i>not</i> there. It appears you mistook your shemale kaithrit for a herm.");
	output("\n\n<i>“I hope it’s not a problem for you. I’d understand if you’re not ok with it,”</i> she whispers, ears folded against her hair as she chews on her lower lip waiting for your response.");
	output("\n\nWell, if you had intended to fuck her pussy, that idea is out of the airlock, now. You could always just tell her that you’re not interested.");

	flags["ERIKA_SEEN_NAKED"] = 1;

	clearMenu();
	addButton(0,"Next",erikaSexMenu, false);
}

public function erikaSexMenu(Repeat:Boolean = true):void
{
	clearOutput();
	showErika(true);
	author("Doots");

	// basicly compressed versions of erikaSexIntro & erikaToyBox
	if (Repeat)
	{
		moveTo("SHIP INTERIOR");
		
		output("Chatting and drinking are fun and all, but a "+ pc.mf("man", "woman") +" can’t live on that alone.");
		if (pc.isNice()) output("\n\n<i>“I think we both would have more fun if we went somewhere more private, where I could treat you right.”</i>");
		else if(pc.isMischievous()) output("\n\nYou sigh, drawing Erika’s attention to you. <i>“This place is really boring. What do you say we get somewhere more interesting?”</i> Burt shoots you a dirty look at the mention of his bar being boring, but you ignore him and pinch Erika’s buttock, giving her a solid message what you have on your mind.");
		else output("\n\n<i>“I can’t screw you in the middle of the bar in the way I want to, so how about we head back to my place, and I’ll screw your brains right out of that silly little head of yours.”</i> ");
		output("\n\n<i>“I want to pick up something from my place,”</i> she says.");
		output("\n\nSuspecting that she’s going to go pick up her little box of toys you leave her to it and return back to your own ship.");
		output("\n\nYou lounge around for awhile in your ship, waiting for her. You start to wonder how far away she lives, Mhen’ga isn’t a large settlement after all.");
		if (pc.isAss()) output(" Maybe you could find some porn on the extranet to deal with the boredom.");
		output("\n\nThe consoles light up, informing you that Erika was able to find your ship. Opening the airlock, you see Erika standing there with the large sex toy filled box. You wonder what’s important enough to go out of her way to get. Moving aside you let her in.");
		output("\n\n")
	}
	output("If you wanted to play around with the box full of lewdness, she’d most likely be down for it.");
	output("\n\nOr you could just ");
	if (pc.hasCock() && pc.hasVagina()) output("stick your dick into her [erika.asshole], or stick her dick into your pussy, or ");
	else if (pc.hasCock()) output("stick your dick in her [erika.asshole], or ");
	else if (pc.hasVagina()) output("get her dick into your pussy, or ");
	output("stick her dick into your ass.");

	clearMenu();

	// [Lap Ride]
	if(pc.cockThatFits(erika.analCapacity()*1.5) >= 0 && pc.hasCock()) addButton(0, "Lap Ride", erikaSexLapRide);
	else if(pc.hasCock()) addDisabledButton(0,"Lap Ride","Lap Ride","Your penis is too big for Erika.");
	else addDisabledButton(0, "Lap Ride", "Lap Ride", "You need a penis to do this!");
	// Ride Her
	addButton(1,"Ride Her",erikaSexRideHer);
	// [Degrade Her] (requires vagoo and PC to be hard)
	if (pc.isAss() && pc.hasVagina()) addButton(2,"Degrade Her",erikaSexDegradeHer);
	else if (!pc.isAss()) addDisabledButton(2, "Degrade Her", "Degrade Her", "You are too friendly to do this!");
	else addDisabledButton(2, "Degrade Her", "Degrade Her", "You need a vagina to do this!");
	// [Butt fuck] (requires PC to be in a rut and fit inside her)
	if(pc.cockThatFits(erika.analCapacity()*1.5) >= 0 && pc.hasCock() && pc.inRut()) addButton(3, "Butt Fuck", erikaSexButtFuck);
	else if(!pc.inRut()) addDisabledButton(3,"Butt Fuck","Butt Fuck","You need to be in rut for this.");
	else if(pc.hasCock()) addDisabledButton(3,"Butt Fuck","Butt Fuck","Your penis is too big for Erika.");
	else addDisabledButton(3, "Butt Fuck", "Butt Fuck", "You need a penis to do this!");
	// Play with her toys
	addButton(4, "Toys", erikaSexToys);
	// [Let her hate fuck] (requires PC to be hard and had done [Sex] > [Degrade Her] and genitalia of some sort)
	if (pc.isAss() && pc.hasGenitals() && flags["ERIKA_DEGRADED_HER"] != undefined) addButton(5,"Hate Fuck",erikaSexHateFuck);
	else if (flags["ERIKA_DEGRADED_HER"] == undefined) addDisabledButton(5, "Hate Fuck", "Hate Fuck", "You need to degrade her first!");
	else if (!pc.hasGenitals()) addDisabledButton(5, "Hate Fuck", "Hate Fuck", "You need genitalia to do this!");
	else addDisabledButton(5, "Hate Fuck", "Hate Fuck", "You are to friendly to do this!");
	// Give her some anusoft
	if (flags["ERIKA_GIVEN_ANUSOFT"] == undefined && pc.hasItemByClass(Anusoft)) addButton(10, "Give Anusoft", erikaSexGiveAnusoft);
	else if (flags["ERIKA_GIVEN_ANUSOFT"] != undefined) addDisabledButton(10, "Give Anusoft", "Give Anusoft", "Erika has already taken anusoft.");
	else if (!pc.hasItemByClass(Anusoft)) addDisabledButton(10, "Give Anusoft", "Give Anusoft", "You don’t have any anusoft to give Erika.");
	addButton(14,"Leave",erikaSexMenuLeave);
}

public function erikaSexLapRide():void
{
	clearOutput();
	showErika(true);
	author("Doots");

	var cIdx:int = pc.cockThatFits(erika.analCapacity() * 1.5);
	if(cIdx < 0) cIdx = pc.cockThatFits(erika.analCapacity());
	if(cIdx < 0) cIdx = pc.smallestCockIndex();

	output("Erika snatches the bottle of pink lube from the box while you drop your [pc.gear] onto a pile on the floor. Sitting down on the edge of the bed, Erika starts to apply the lube along your [pc.cock " + cIdx + "] and you shiver at the tingling sensation of the lube being slathered along your length. Taking a dollop of lube on her fingers, she starts to apply it to her pucker. You start to stroke your lubed up length, gasping at the sensitivity of your [pc.cock " + cIdx + "]. It’s far more sensitive than it was when you started.");
	if (flags["ERIKA_SEEN_LUBE"] == undefined)
	{
		output("\n\nSeeing your reaction, Erika chuckles. <i>“The lube kicks your sensitivity up a notch or two.”</i> After a while she adds, <i>“Don’t worry, the effect isn’t permanent.”</i>");
		output("\n\nShe ");
	}
	else output("\n\nErika ");
	output("bends down and blows air at your [pc.cockHead " + cIdx + "]. The feeling of cold air against your sensitive flesh sends shivers down your spine. You find a moan escaping your lips as Erika kisses your cum slit. You might not last very long with how sensitive the lube made you.");
	output("\n\nErika climbs into your lap and locks her lips with your [pc.lips], using her tongue to draw your [pc.tongue] into her mouth. Taking this pretty clear invitation, you wrestle her tongue into submission.");
	output("\n\nGrabbing a handful of her ass, you lift her up and nuzzle your [pc.cockHead " + cIdx + "] against her pucker. With all the lube and pre, her ass is in no condition to keep your [pc.cock " + cIdx + "] out. You release your two handed grip on her butt, letting gravity do all the work. Her ass takes your whole length without an issue");
	if (pc.cocks[cIdx].cLength >= 20) output(", an outline of your [pc.cock " + cIdx + "] forming in her stomach");
	output(".");
	
	pc.cockChange();
	
	output("\n\nTaking her by the butt, you lift her back up, shivering at the cold air against your sensitive flesh. Letting go for the second time, you let her fall again, this time meeting her descent with a thrust of your hips, sending a thunderous clap across your bedroom. Erika’s eyes cross from your rapid dicking, and a small amount of precum leaks from her tip when you slap against her descent for the second time.");
	output("\n\nBuckling down, you start to bounce her up and down in your lap, quickly regretting your decision as you silence a throaty moan, biting your [pc.lip]. With how sensitive you are, holding on is going to be a bitch.");
	output("\n\nAs you bounce her in your lap, you start to approach your peak already. Not wanting this to end so soon, you stop bouncing her, letting her settle into your lap. You start to make out with her again while thrusting into her slowly. Erika wraps her arms around your neck, clinging to you tightly while you grope at her ass, enjoying the feeling of the soft flesh under your fingers.");
	output("\n\nErika brings her other hand down, gently brushing over your [pc.breasts] and [pc.belly], finally trailing down to her crotch, wrapping her fingers around her canine dick. She starts to languidly stroke along her length.");
	output("\n\nBreaking your lip lock, she starts to bounce on your cock, slamming her ass down on your lap in rapid succession. She starts to maul her breast with her free hand, putting up a show for you, lewdly sucking one of her pre-glazed fingers.	");
	output("\n\nYou’re both panting with lust by now, as well as steadily leaking pre. ");
	if (pc.hasKnot(cIdx)) output("Your knot starts to swell in preparation for tying with her. ");
	output("As if sensing your orgasm approaching, or maybe she is getting close, she starts to squeeze her anal muscles, clenching your [pc.cock " + cIdx + "] in her silky passage. Hugging her against your [pc.breasts], you fall backward on the bed and start to really pound into her, working most of your length in and out of her.");
	output("\n\nYou feel something warm and slick spreading on your [pc.belly], and her tail hole clamps around you, non-subtly encouraging you to cum inside of her. Giving her what she wants, you make two more thrusts into her before pushing your member all the way inside her");
	if (pc.hasKnot(cIdx)) output(", your knot slipping in and swelling inside her, tying her ass to your crotch and making sure none of your [pc.cum] escapes");
	output(".");
	if (pc.balls > 0) output("\n\nYour [pc.balls] tighten, preparing to release a load just for Erika. ");
	else output("Your [pc.cock " + cIdx + "] throbs powerfully in Erika’s ass, ready to release a load just for her. ");
	output("You hug her tight, holding her close to you. You finally cum, pumping her full of [pc.cumColor] cum, enjoying your long awaited orgasm.");
	output("\n\nYou’re both panting heavily by now, a small whimper escaping her lips every time a spurt of your cum escapes your [pc.cockHead " + cIdx + "].");
	output("\n\n");
	if (pc.cumQ() > 1000) output("By the time you’re done, her stomach is compressed against your [pc.belly]. ");
	output("She pants in your arms, and after a while she starts to get up, ");
	if (pc.hasKnot(cIdx)) output(" only to remember that she’s stuck on your bitch breaker.");
	else output("only to be pulled back to your [pc.breasts] by your arms.");
	output("\n\n<i>“You’re not going anywhere.”</i> You smile at her before kissing and pulling a blanket over the both of you, settling down to sleep with Erika in your arms and your [pc.cock " + cIdx + "] in her ass. Both of you drift to sleep quickly in the comfortable warmth of your combined body heat.");

	flags["ERIKA_SEEN_LUBE"] = 1;
	IncrementFlag("ERIKA_SEXED");

	processTime(60+rand(15));
	pc.orgasm();
	erika.loadInAss(pc);
	erika.orgasm();

	clearMenu();
	addButton(0,"Next",erikaSexLapRideEnd);
}

public function erikaSexLapRideEnd():void
{
	clearOutput();
	showErika(true);
	author("Doots");

	output("Starting to rouse from your slumber, you feel around to find your kaithrit bed-warmer. After a while of blindly groping, you start to open your eyes, only to be greeted by your bedroom completely devoid of purple-haired shemale kaithrit bed-warmers.");
	output("\n\nYou notice that your [pc.gear] is neatly laid out with a small note on top of the stack. Dragging yourself out of the bed, you pick up the small note:");
	output("\n\n<i>“[pc.name], I’m sorry that I left without a word, but I have some things I need to do and I didn’t want to wake you up. If you decide to drop by the bar later, I’ll be there if I’m not busy.”</i>\nThere is a kiss mark at the bottom of the note.");
	output("\n\nShrugging, you don your [pc.gear] before heading back out to another day.");

	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function erikaSexRideHer():void
{
	clearOutput();
	showErika(true);
	author("Doots");

	output("<i>“I could go for some hot canine meat inside me right now. And I’m sure you can provide.”</i> Smiling at her, you gently push her back to the bed, before kneeling down between her legs.");
	output("\n\n<i>“Gotta make sure I’m nice and hard for you, huh?”</i> she chuckles before gasping as you take her canine member into your mouth.");
	output("\n\nCircling your [pc.tongue] around her head, you start to bob up and down on her length, sliding her hot piece of meat between your [pc.lips], making sure she’s nice and wet for your ride. ");
	if (pc.wetness() >= 3) output("Not that you really need it considering how wet your [pc.pussy] gets, but sucking dick is fun on its own. ");
	output("Judging that she’s as wet and as hard as she’ll get, you let her length from your mouth with a wet pop.");
	output("\n\n<i>“Well, I’m ready as I’ll ever be.”</i> She’s smiling down at you, lust burning in her eyes. Her hand reaches down and strokes your ");
	if (pc.hairLength > 0) output("[pc.hair].");
	else output("scalp.");
	output("\n\nYou push Erika back onto the bed climb on her, straddling her hips. You begin to wonder what hole you’d like to ride her cock with.");

	clearMenu();
	if (pc.hasVagina()) addButton(0, "Pussy", erikaSexRideHerPussy);
	else addDisabledButton(0, "Pussy", "Pussy", "You need a vagina to do this!");
	addButton(1,"Butt",erikaSexRideHerButt);
}

public function erikaSexRideHerPussy():void
{
	clearOutput();
	showErika(true);
	author("Doots");

	output("Pushing her back onto the bed, you straddle her hips. Taking her knotted shaft in your hand, you align the tip with your [pc.pussy]. You take your time sinking down on her dick, taking it slowly at first. You don’t want to ride her to dust, at least not just yet.");
	output("\n\nPlacing your hand on her breasts for balance, you start to buck your hips, savoring the feeling of spreading yourself on her dick and the fleshy bulb of her knot rubbing against your lower lips. Your [pc.cunt] easily accepts her small, uninflated knot.");
	output("\n\n<i>“What a nice fit,”</i> you purr. She pulls out and you savor the popping sound of her knot leaving your pussy. You can’t wait to feel the full sized knot inside you, but the build up is part of the fun.");
	output("\n\nSpeaking of build up you start to work her knotted flesh in and out of your [pc.pussy]. Her hands find your [pc.hips], grasping them tightly, and she strokes your sides. Sitting up she brings your [pc.nipple] to her mouth, kissing and nibbling it, seeking to bring you more pleasure.");
	output("\n\n<i>“That’s a good girl. Ah, right there.”</i> You scratch her behind her ear, rewarding her efforts to please you.");
	output("\n\nFeeling her knot swelling against your nether lips you start to slow down. <i>“Not yet, just wait a little longer, dear.”</i> She whines but her knot stops swelling. Kissing her you push her so that she’s on her back again. Now you’re ready to really start fucking.");
	output("\n\nPulling back until only her tip remains inside you, you slam back down with your full weight. A loud gasp breaks from her lips, only to repeat the same motion again. Your rough riding has her gasping and bucking under you. <i>“You really like it this way, don’t you? You like it rough, you dirty girl,”</i> you tease, pushing two fingers in between her lips. She starts to lick your fingers steadily.");
	output("\n\nYour [pc.pussy] is leaking your juices down your thighs by now. Slamming down for the last time, you spread yourself on her knot, your [pc.pussy] clenching around her and your [pc.girlCum] spurting from your nether lips ");
	if (pc.hasCock()) output(", your [pc.cock] enjoying a sympathetic orgasm, shooting ropes of your [pc.cum] onto her stomach, tits, and face");
	output(".");
	output("\n\nShe throbs inside you but doesn’t cum, still waiting for you to tell her to cum but you are too distracted by your own orgasm.");
	output("\n\nWinding down, you’re bit surprised that she is still rock hard inside you, it takes a bit of effort to pull from her semi-inflated knot out of your cunt, but you manage. Kneeling down between her legs again you bring your head to eye level with her dick, leaking pre and bobbing impatiently.");
	output("\n\n<i>“Such a proper and well-trained kitty you are, and good kitties get a treat.”</i> You kiss her pointed head.");
	output("\n\nThat’s all it takes to make her knot swell and her balls draw tight. Well, that won’t do at all. Before any of her cum is able to escape from her tip, you clamp the cock ring around the base of her tapered dick. Good thing she came prepared.");
	output("\n\n<i>“Wouldn’t want you to cum before I can give you a proper treat, now would we?”</i>");
	output("\n\nShe whines at you some more. Ignoring her pleading you get back to work, licking and sucking along her length. You give her balls some loving attention as well, rolling them around in your hands before popping one of them into your mouth and sucking on it, encouraging her to give you a nice and thick load.");
	output("\n\nNot forgetting her knot, you massage the ready-to-inflate bitch breaker, squeezing it to make her feel like she’s tied. Pressing your cheek against the hot bulb of flesh, you feel her heart beat through her rod.");
	output("\n\nHer whining and begging are turning louder and more impatient now. You think that you might actually break her heart if you keep teasing her like this.");
	output("\n\nIt is a good enough of a reward by now. You take her all the way into your mouth up to her knot, then remove the cock ring. The moment the ring isn’t preventing her orgasm, she wraps her legs and arms around your head, forcing more of her dick into your mouth, almost slipping her knot in as well. But with its fully inflated girth it won’t get past your lips. That doesn’t stop her from hammering against your [pc.lips], though.");
	output("\n\nThe amount of cum she forces down your throat is quite impressive for someone with such small balls. It seems all the teasing had an effect on her.");
	output("\n\nWhen she has emptied her balls completely, her entire body turns limp. Her legs fall to your sides. Rising back to your [pc.legs] you look down at her. She’s completely out of breath and her dick hangs down at half mast.");
	if (pc.isNice()) output("\n\n<i>“I went too hard on you, didn’t I? Sorry about that.”</i>");
	else if(pc.isMischievous()) output("\n\n<i>“I guess it wasn’t as well trained as I thought?”</i>");
	else output("\n\n<i>“And who told you that you could cum into my mouth?”</i> you scold her, slapping her half hard dick and reveluing in seeing her entire body flinch. <i>“Your lucky that I’m in a forgiving mood.”</i>");
	output("\n\nIt takes a while for Erika to collect herself, and when she does she gives you a meek thank you before staggering off.");

	IncrementFlag("ERIKA_SEXED");

	processTime(60+rand(15));
	pc.loadInMouth(erika);
	pc.orgasm();
	erika.orgasm();

	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function erikaSexRideHerButt():void
{
	clearOutput();
	showErika(true);
	author("Vio");

	output("You bring a finger to your mouth and chew on it, thinking. A thought suddenly strikes you and you grin, looking Erika straight in the eyes. <i>“I have an idea,”</i> you say seductively. You reach into her treasure chest of sex toys and pull out the bottle of pink, glittery lube, the roll of electrical tape, and two bullet vibrators along with their remote. ");
	if (flags["ERIKA_SEEN_LUBE"] == undefined) output("You sit back on your knees and turn the bottle of lube around to read its label. It says something about it being able to increase one’s’ sensitivity level. You grin and think of a couple fun things you could do with this stuff. ");
	output("You also attempt to discreetly pull out a vibrating cock ring when you’re pretty sure she isn’t looking, and you quickly place it under your covers for later.");
	output("\n\nYou gently push Erika back on the bed, and she gives you a quizzical, somewhat worried look. You crawl towards her, rubbing yourself against her smooth body all along the way. You place your [pc.legs] on either side of her and lean down until the two of you are bumping noses. You lick her lips and begin making out vigorously with her. As you mash faces with her, you squirt some of the pink lube on your hand. You reach down and begin groping and squeezing her supple tits, making sure to massage it into her the best you can. She gasps into your mouth in pleasure, her already-stiff nipples getting even harder. You tweak one of the buds, making her moan even more, and rub the excess lube on the rest of her unslicked torso.");
	if (silly) output(" You can already tell it’s going to be a goddamn hassle to clean this up.");
	output("\n\nYou pull your face back from hers and stare into her eyes. <i>“Close your eyes and hold out your tongue. I have a surprise for you.”</i> She does as you say, shutting her eyes and sticking her tongue out. You bring the bottle of sensitizing lube above her tongue and squeeze out a drop of it. She flinches a bit at the sudden feeling of cold liquid on her tongue, and crosses her eyes to look at what you’ve put on her it. Before she can get a peek, you push her tongue back into her mouth. She furrows her brow and begins to move her tongue around in her mouth. Her eyes slowly widen as she realizes what you’ve made her do. You squeeze out a dollop of the pink stuff on your [pc.tongue], retract it back into your mouth and move it around, spreading the lube all in your mouth. It tastes very similar to lingonberry, sour and somewhat sweet. You begin to feel the effects of the lube almost immediately, your mouth and tongue becoming almost achingly sensitive. You resist the urge to sit there and play with your tongue and look down at Erika. She’s breathing much heavier now, her oral organ pushing against the inside of her cheeks as she attempts to derive pleasure from her sensitive mouth. You stroke her cheek and lean down to make out with her again.");
	output("\n\nYour tongues don’t even fight for dominance, they just squirm and wriggle around in each other’s mouth, trying to give as much thrill to the other as they’re getting. ");
	if (pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output("You stretch your [pc.tongue] to the entrance of her throat and begin to rub around that area, spreading the lube. She groans into your mouth as you begin to push your tongue down her throat, almost fucking it.");
	else output("You lick all around the inside of her mouth, wanting to taste her more, and she does the same to you. The room fills with lewd smacking noises as the two of you make out.");
	output("\n\nYou begin to feel heat building in your loins. You look down and see that Erika’s puppy dick is twitching feverishly, leaking precum like a broken faucet. You’re both on the brink of orgasm, ready to cum from your oral affections.");
	output("\n\nJust before you both cum from tongue-fucking each other, you pull away from your intense kissing and pant, a string of lube-infused saliva connecting your mouths. You both take a moment to calm down and let the burning lust in your crotches fade away, though not completely. You ");
	if (pc.isAss()) output("grin");
	else output("smile sheepishly");
	output(" and grope her tit. ");
	output("\n\n<i>“Geez, that was... intense.”</i> She shudders and begins squeezing her unattended boob. <i>“We gonna get to the main course now?”</i>");
	output("\n\nYou nod and crawl off of her, making sure to rub her body from chest to groin. You grab the roll of electrical tape and the vibrator bullets. You tear off some tape and attach the vibes to her balls. You squeeze out a small amount of lube onto your hand and smear on her trap sack, kneading it into her. You use the remaining lube on your hand to wet your [pc.ass] and [pc.asshole]. You climb back onto Erika and start hotdogging her erect shaft with your [pc.ass], coating her twitching cock in pink and glitter. Once you’re both suitably lubed up, you begin to press your pucker down on her tapered tip, but not before grabbing the vibrator bullets’ remote and turning them on, setting the dial to 1. A faint buzzing emanates from her groin and she jerks her hips upwards at the feeling of her balls - and dick - vibrating, easily slipping her slick cocktip into your [pc.asshole]. You hum in pleasure and sink deeper onto her dick, enjoying the feeling of the bullet vibes on her small testicles making her equally small puppy pecker vibrate.");
	output("\n\n<i>“Liking those vibrators?”</i> you ask her, slowly bouncing on her quivering cock. She only mewls in response, her ears twitching. She places her hands on your [pc.hips] and shoves her entire length into your [pc.asshole], rubbing her vibrating balls against your [pc.ass]. You crank the dial up to 3 to further the sensation on your wet, sensitized ass and her balls. ");
	if (pc.buttRatingRaw >= 10) output("Your [pc.ass] jiggles profusely and Erika grinds her cock into your large ass. ");
	else output("Erika rubs your behind and grinds her cock into your ass. ");
	output("She pulls out and thrusts in, over and over again, moaning and panting like a bitch in heat. You meet her thrusts, hips slapping together and knot popping in and out of your hole. ");

	flags["ERIKA_SEEN_LUBE"] = 1;

	clearMenu();
	addButton(0,"Next",erikaSexRideHerButt2);
}

public function erikaSexRideHerButt2():void
{
	clearOutput();
	showErika(true);
	author("Vio");

	output("Erika begins to hump your [pc.asshole] feverishly, squeezing and slapping your [pc.ass]. She’s about to cum, you can just tell, especially from the way she throbs inside of you. Before she orgasms, you reach under the covers, pull out the cockring, open it and snap it onto her pulsing dick. She cries out as waves of pleasure flow through her, enticing her to cum more but the cockring prevents her from doing so. She looks at you with pleading eyes.");
	output("\n\n<i>“W-what’d you do that for? I about to cu-uh-um!”</i> She stutters and throws her head back in lust when you turn the cockring on. It vibrates furiously, sounding like an angry ");
	if (flags["ENCOUNTERED_ZIL"] != undefined) output("zil");
	else output("bee");
	output(". You grind your [pc.ass] into her lap, rubbing her shaking dick in your backdoor. ");
	if (pc.hasCock()) output("The vibrations against your prostate feel <i>amazing</i>. ");
	else output("The combined vibrations reverberate through your body. ");
	output("With the lube in and on you, you’re already pretty close to orgasm. You decide to catch it ");
	if (pc.hasCock() && pc.hasVagina()) output("rubbing your [pc.cocks] and [pc.cunts], milking pleasure from Erika’s dick.");
	else if (pc.hasCock()) output("and stroke your [pc.cocks], still milking pleasure out of the vibrations coming from Erika’s dick.");
	else if (pc.hasVagina()) output("and rub your [pc.clits], causing your [pc.girlCum] to drip down your thighs. ");
	output("You finally cum, your [pc.asshole] clenching around Erika, squeezing and caressing her dick.");
	output("\n\nAt this point she begins whining richly. <i>“Please, [pc.name], let me cum. I-I need to, to cum. Pl-ahh-ease!”</i> She writhes beneath you, begging you to take the cockring off and let her orgasm. You decide to tease her for a little longer, cranking the dial of the vibes all the way up to ");
	if (silly) output("11");
	else output("5");
	output(". You flip her onto her hands and knees and drag your fingers across her skin, sending shivers up and down her spine. You grab her sack and caress it, rolling her balls in your hand. They seem to have grown quite larger from your continuous teasing, swollen with thick cum. You grab her petite cock and stroke it, rubbing and squeezing her sensitive knot. Finally, you lean down and press your [pc.lips] against her twitching pucker. You lick all around it with your [pc.tongue], coating it in your spit-lube. ");
	if (pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output("You slowly penetrate her with your [pc.tongue], searching for her prostate. When you find it, you feel it with the tip of your tongue, and begin rubbing it, making your tongue squirm in her ass. ");
	else output("You use your saliva to slowly insert a finger into her, searching around for her prostate. When you find it, you massage it thoroughly. You insert a second finger into her accommodating [erika.asshole], opening your fingers in a scissor motion. ");
	output("Erika’s eyes are watering by now, her cock throbbing angrily in your grip. She has almost completely stopped begging you to let her cum, resorting to just moaning and pushing her ass into your [pc.face].");
	output("\n\nAfter teasing her a bit longer, you finally decide to let the kitty cum. You lean down to her ear and begin to nibble on it. <i>“You really want to cum, don’t you?”</i> She furiously shakes her head, turning and looking at you with wet eyes. <i>“You want to blow your load all over my bed, staining it with the scent of your seed. That’s what you want, huh?”</i> Her eyes roll partway into their sockets at the thought of making your sheets smell like her cum and she nods lazily, her tongue flopping out of her panting mouth, her berry-scented breath coming out quickly. You run your finger up her vibrating dick until you come to the cockring. You take your sweet time taking it off, but when you do she begins humping the empty air. You wrap your hand around her cock, giving her something to thrust into. You lick and suck her neck, whispering again into her ear. <i>“Cum for me. Shoot your cum. Blow your load. Cum just for me!”</i>");
	output("\n\nHer eyes roll completely into her head and a crazed grin creeps onto her face. She gives one last powerful thrust into your hand, hilting herself, her knot swelling and making your hand open a little. You quickly move your head near her vibrating sack. You bring her balls into your mouth, fondling them with your [pc.tongue], enjoying the hairless, soft texture of her skin and the feeling of the bullet vibes buzzing away in your mouth. You suck on her sack hard, trying to coax out their creamy treasure. You unwrap your hand from her cock and bring both of them down under her cock, forming a basket with them. She lets out a shrill scream and her balls tense in your mouth. The first jet of cum shoots from her dog dick in one thick stream like water from a hose. It splashes in your hands, spraying you, her, and your sheets. The second jet comes out equally as powerful, and she raises her hips and thrusts them back down, another stream of cum erupting from her cock. She cums countless times after, filling your hands with spunk and adequately drenching your sheets, most likely actually staining them with the scent of her cum. Her balls shrink in your mouth as she ejaculates, draining her swollen cum-factories.");
	output("\n\nOnce she’s done cumming like a garden hose, she collapses onto the bed, face in the pillows and ass up in the air. You shoulder her, causing her to flop on her side, gaining access to her face. You bring your hands to her nose and she inhales, drinking in the masculine aroma of her spunk. Her lidded eyes slowly open, first looking at you and then at the puddle of cum in your hands. You bring the cum to her mouth and she sticks her tongue out and begins lapping at her own cum, making cute gulping sounds when she swallows. You don’t even have to tell her to, she just does it. What a good, slutty little kitty. When she’s done drinking down her cum, you bring your hands to your face and drag your [pc.tongue] along them, attempting to collect any remnants of her cum that she didn’t get, though she didn’t leave very much. You lay down next to her, wrapping your arms around her and joining mouths, lazily making out as the both of you drift off to sleep.");

	IncrementFlag("ERIKA_SEXED");

	processTime(120+rand(30));
	pc.orgasm();
	erika.orgasm();

	clearMenu();
	addButton(0,"Next",erikaSexRideHerButt3);
}

public function erikaSexRideHerButt3():void
{
	clearOutput();
	showErika(true);
	author("Doots");

	output("When you wake, Erika is still resting in your embrace, faintly snoring. You gently jostle her awake, her eyes slowly opening and ears twitching. She looks at you with her beautiful green eyes and smiles. ");
	output("\n\n<i>“That was... amazing, yesterday. You’re amazing, [pc.name]. I love you,”</i> she says, letting out a shuddering sigh. <i>“I came so hard...”</i> Her eyes widen and she sits up with a soft grunt. She surveys your cum-stained sheets and blankets and blushes. <i>“Uh, s-sorry about the mess. It’s just, you know, you teased me a </i>lot<i> and for so long, made me build up a lot of cum.</i>“ You assure her that it’s fine, kissing her on the cheek. She smiles and hugs you. She then lets out a sigh and gets out of bed. She looks down at her groin and remembers the bullet vibrators you taped to her balls, and carefully removes them. She pulls on her clothes and turns to you. <i>“I’ll just show myself out.”</i> She leans over and gives you one last kiss before leaving. You lay in bed for a little longer before getting up and getting ready for the day.");

	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function erikaSexDegradeHer():void
{
	clearOutput();
	showErika(true);
	author("Doots");

	output("You’re feeling rather cruel today, and who better to take it out on than your feline chew toy? You shove her onto the bed before picking a few choice items from the box.");
	output("\n\nClimbing on top of her, you tie her wrists together. <i>“I’m going to give your pathetic little bitch clit some attention. You should be thankful.”</i> You cover her nipples with some tape. <i>“Of course, if you don’t want me to, you could say otherwise,”</i> you continue, finally putting the ball gag into her mouth. <i>“So, do you want me to stop?”</i> you ask before tying the gag behind her head. <i>“Now is your last chance to tell me.”</i>");
	output("\n\nShe shakes her head, meek and unsure, but nonetheless shaking her head. <i>“Thought so. Can’t afford to say no when someone is finally willing to touch that thing you call a dick,”</i> you say, trailing your middle finger up the underside of her doggy dick. Without a warning, you clamp the cock ring around her base. <i>“There we go, can’t trust a worthless bitch like you to last.”</i> Her cock gives a throb and her hips make a tiny thrust upwards.");
	output("\n\nStraddling her hips, you align her dick with your [pc.pussy], then slam your own [pc.hips] down, roughly impaling yourself on its tapered length.");
	if (pc.looseness() > 3) output("\n\n<i>“Oh my, it’s worse than I thought. I can barely feel a thing.”</i> You sigh in mock disappointment. <i>“I’ve had more fun with just my fingers, but I might be able to make this work.”</i> ");
	else output("\n\n<i>“Hm, better than I thought. Don’t get me wrong, it’s not good, but it’s acceptable.”</i>");
	output("\n\nYou start to lazily ride the unimpressive dick inside you. At least feeling her knot spreading your [pc.pussy] brings you some pleasure. Taking advantage of this, you repeatedly pop the knot in and out of you.");
	output("\n\nFeeling another dark streak running through you, you cease your hip bucking and lift yourself up so that only her pointy tip remains inside you. <i>“Since I’m so considerate as to allow you inside my pussy, you should do the work.”</i> You slap her tit, waiting for her to get to it. She starts to buck upwards, trying to fuck your pussy from an uncomfortable angle, but still managing to nudge against a sensitive spot every now and then. And she has vigor, there is no denying that.");
	output("\n\nBut you tire of her fumbling attempts, <i>“If you want something done right, do it yourself. Now hold that slutty cock of yours still.”</i> You slam down onto the cock once again. With the intimate knowledge of your pussy that you have, you’re able to seek all those very sensitive spots, blissfully ignorant of her pleasure. Gripping her ankles for balance you speed up your thrusting, sliding that slick piece of cock flesh between your pussy lips, pausing to rub against her knot in between thrusts.");
	output("\n\nUntying her hands, you bring her hand to your [pc.clit] telling her to rub it. Following your orders, she uses her fingers to rub and tweak your sensitive button, her other hand trailing along your body in an attempt to bring you more pleasure.");
	output("\n\nWith her thumping away at your clit and her dick sliding into you, you’re starting to actually get into the sex instead of only degrading her. <i>“Keep that up, you worthless piece of fuckmeat. At this rate, I might actually cum.”</i>");
	output("\n\nThe prospect of getting you to cum makes her double her efforts, even humping upwards and meeting your downward thrusts. ");
	if (pc.hasCock()) output("Her free hand grasps your [pc.cock] tightly, before she starts to stroke it, working up and down your meat. ");
	output("She begs you with her eyes, pleading with you, her entire body quivering.");
	output("\n\n<i>“That’s it, you pathetic slut! Just! Like! THAT!”</i> you yell, ripping the tape off her nipples in one hard pull. The sudden pain causes her body to jerk upwards, slamming into you. That’s all it takes to make you cum, your [pc.pussy] fluttering and clenching around her doggy dick, soaking her lap in your [pc.girlCum].");
	if (pc.hasCock()) output("Your [pc.cock] starts to shoot [pc.cumVisc] cum onto her chest, marking her as a bitch for your pleasure.");
	output("\n\nHaving gotten off yourself, you’re not exactly in any hurry to get up. You could just stay there, you think until one of her needy thrusts winds up bucking your entire body.");
	output("\n\n<i>“Fine, I guess you’ve earned it.”</i> You re-tie her arms so she won’t be doing anything that could ruin your plan, mainly jerking off. Carefully, you take off the cock ring so you don’t set her off, then pick a riding crop from the box. <i>“Tell you what. If you can hold back for, let’s say ten strikes, you can cum inside my pussy. That sounds like a fair deal, don’t you think?”</i> She mumbles something but you ignore her.");
	output("\n\nYou give the crop a few test swings before softly tapping it against her balls. <i>“One.”</i> The crop slaps against her balls, making her buck her hips and her cock spit pre from her tip. <i>“Two.”</i> Again, the crop connects with her balls, a sharp slapping sound and a muffled moan sound through the bedroom. <i>“Three.”</i> Now the crop connects with her rapidly inflating knot, said knot inflating more in response to the crop’s touch. <i>“Four.”</i> This time it catches her on the tapered tip. She can’t take anymore, her body shaking in orgasm, cum fountaining from her tip, arching upwards before splattering down onto her hair, face, boobs, and stomach.");
	output("\n\n<i>“You really are fucking pathetic. Couldn’t even hold it together for few strikes,”</i> you sigh, toying with your [pc.cunt]. <i>“With stamina like that you’ll never get a chance of cumming into this cunt.”</i>");
	output("\n\nHaving had your fill of chewing her out, you untie her and spend a while cleaning her up and gently caressing her sore spots, making sure she’s not hurt. After you’re sure she’ll make it home without her legs buckling, you help her onto her legs. She’s shaky but able to stand.");
	output("\n\n<i>“You’re a real dick, [pc.name]... but I kind of liked it.”</i>");
	output("\n\n<i>“Yeah, I know. And you didn’t just like it, you loved it. With the way you came, you can’t lie and say you didn’t.”</i>");
	output("\n\nYou smack her ass and push her towards the entrance of your ship. <i>“Now get out of here. If I want to put you back into your place, I’ll know where to find you.”</i>");

	flags["ERIKA_DEGRADED_HER"] = 1;
	IncrementFlag("ERIKA_SEXED");

	processTime(30+rand(15));
	pc.orgasm();
	erika.orgasm();

	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function erikaSexButtFuck():void
{
	clearOutput();
	showErika(true);
	author("Doots");
	
	var cIdx:int = pc.cockThatFits(erika.analCapacity() * 1.5);
	if(cIdx < 0) cIdx = pc.cockThatFits(erika.analCapacity());
	if(cIdx < 0) cIdx = pc.smallestCockIndex();
	
	output("You crook your finger, inviting her to come closer and pull her into your lap. <i>“I’m going to fuck you all night. You don’t have a problem with that, right?”</i> You growl into her ear while groping her butt with one hand and pressing one finger into her [erika.asshole] with the other.");
	output("\n\nShe’s breathing huskily under your ministrations. <i>“Well, the deadlines aren’t that close,”</i> you murmur in her ear. She flips over onto the bed, ass in the air and tail raised high. Her puckered hole is in full view for you, she even spreads her buttocks. She seems to need a good fucking pretty badly.");
	output("\n\nWho are you to say no to a needy kaithrit bitch? Grasping her hips, you pull her against your crotch, hot dogging between her cheeks and using your pre to lube her up, rubbing your [pc.cock " + cIdx + "] against her pucker until its wet. Aligning yourself with her, you start to thrust inside, slowly but steadily pushing inside until your [pc.sheath " + cIdx + "] grinds against her ass. <i>“Good girl,”</i> you compliment her, patting her ass.");
	
	pc.cockChange();
	
	output("\n\nPopping your [pc.cockHead " + cIdx + "] out of her, you test her with a few fingers, pulling her open. You find her nice and tight, but accommodating. You give her prostate a quick poke before pulling your fingers back. Satisfied that she will last, you replace your fingers with your [pc.cock " + cIdx + "]. Knowing that she can take your length, you bury yourself all the way inside before pulling out and slamming back in.");
	output("\n\nYour hands explore her body while you work your [pc.cockNounSimple " + cIdx + "] in and out of her ass, groping her breasts and dick, squeezing her uninflated knot before sliding your hand down her dick, pinching the tapered tip softly between your finger and pushing out a bead of pre.");
	output("\n\nYour other hand, not lying dormant, is circling her areola, making her small nubs engorge with blood before giving it a soft flick and twisting it between your fingers, and generally kneading her tit flesh.");
	output("\n\nSomething snaps in your head. Everything that makes you the well behaved individual that you are, forgotten. More bestial desires begin to wake, forgetting everything about being a normal, sane person. Your mind is completely focused on rutting the bitch beneath you, filling her with your [pc.cum], marking her with your virility.");
	output("\n\nHammering into her with butt-breaking force, you focus on your own desires. Part of you remembers that she can take it, but that part is forgotten as you slam back into her tunnel, made hot and slick from your pre. She’s clenching around your length while slamming her hips back into you. All the while she is face down on the bed, her hands drunkenly groping over her body, mindlessly pleasuring herself while you take your pleasure from her.");
	output("\n\nYou’re getting closer to your edge, leaking pre more heavily now. And feeling her soft flesh tracing over the veins along your length isn’t helping one bit.");
	output("\n\n<i>“Please...”</i> A small and weak whimper comes from below you. Not slowing down your breeding efforts, you look down at her. She’s looking up at you with puppy dog eyes. <i>“Please fill me, please, breed your bitch,”</i> she begs at you.");

	clearMenu();
	addButton(0,"Next",erikaSexButtFuck2, cIdx);
}

public function erikaSexButtFuck2(cIdx:int = 0):void
{
	clearOutput();
	showErika(true);
	author("Doots");

	if (pc.hasKnot(cIdx)) output("With how close you are to the edge, your mind is occupied by a single thought: tying with her. You grab her hips with both hands, pulling her against you while thrusting your [pc.hips] forward. With the combined effort, you manage to push the bulb of throbbing flesh inside her before it swells. She squeezes tightly against the bitch-breaking girth. ");
	output("That is all it takes to push you past the edge, your [pc.cock " + cIdx + "] giving a throb before starting to pump your [pc.cum] into her, flooding her inner tunnel with your seed. You keep fucking her through your orgasm, making sure to get as much of your seed as deep inside of her as possible.");
	output("\n\nOnce you’re done cumming into her, you slump down over her, pushing her down to the bed with you. Her exhausted arms are unable to keep both of you up. You’re exhausted but your body wants more, no, needs more. You wrap your hands around her body tightly, making sure she’s held snugly against you. A few pumps of your [pc.hips] are enough to get you to stiffen again, receiving a tired gasp in return.");
	output("\n\nAfter having claimed her tail hole with your [pc.cock " + cIdx + "], you get into it again, hot and heavy from the start. You pull back fully before putting your whole weight into the thrust. Your [pc.cum] leaks down and over her tight sack. With how slick your [pc.cockNounSimple " + cIdx + "] is with your cum, you have no problem keeping up the pace.");
	output("\n\nWith your recent orgasm you’re still sensitive and it doesn’t take much for you to reach a second orgasm. Pushing in deep again, you clench your teeth surpassing a thunderous roar of beastial triumph. Your [pc.balls] draw tight as you make another futile attempt at breeding her, more of your [pc.cum] filling her stomach. Trailing your hand once more on her body, touching her breasts and belly, your mind fills with images of her knocked up with your kids, breasts swollen and filled with milk. The thought is ambrosia to your mind in this state, and you’re rock hard again in a heartbeat.");
	output("\n\n<i>“You said you were going to fuck me all night, didn’t you? Then do so, you beast. Knock up your breeding bitch. Fill me with children and make me yours!”</i> She teases you, pushing her hips back.");
	output("\n\nWithout a second thought, you start fucking her again, still trying to breed her. She moans and clenches around you, urging you to fill her again and again.");

	clearMenu();
	addButton(0,"Next",erikaSexButtFuck3, cIdx);
}

public function erikaSexButtFuck3(cIdx:int = 0):void
{
	clearOutput();
	showErika(true);
	author("Doots");

	output("When the animalistic cloud of lust finally rises from your mind, you survey your surroundings. Erika is still on the bed, wrapped in your arms, and you’re still inside her, plugging all of your cum inside. She’s laying down on her side, assumedly so she isn’t lying on top of her stomach, with said stomach bloated with all the seed you have been pumping into her. Propping yourself on your elbow, you notice that both of you are lying in a puddle of cum. Even with both of you contributing to said pool, it is likely that you have made most of the mess.");
	if (kiroSexed()) output(" You briefly wonder how Kiro keeps dealing with this sort of thing.");
	output("\n\n<i>“Morning, you </i>savage<i>. You really did fuck me all night long. You were even fucking me while you were asleep.”</i> She offers you an exhausted smile. No wonder your cock is so sore and your [pc.balls] couldn’t give even a single drop of [pc.cum] if your life depended on it.");
	output("\n\n<i>“So how about we take a shower? I really don’t like telling people their business, but I’m not walking home like this, and I’d rather not make a bigger mess right now.”</i> Considering that you’re almost as cum covered as she is, you agree. The two of you make your way over to the shower while trying to keep her from leaking too much of your cum.");
	output("\n\n");
	if (pc.libido() >= 75) output("The shower is surprisingly chaste for a horndog like you, but considering how sore the both of you are it’s understandable.");
	output("You take your time cleaning, helping each other wash up. Erika hugs you tightly and shudders when you spread her butt cheeks to let out all of your stored up [pc.cum]. It drools slowly down her legs and into the drain. She was right when she said that she didn’t want to make a bigger mess. After the relatively quick shower, you get to cleaning the bed. Thankfully, Erika stays to help you, so I doesn’t take that long to change the sheets and mop up the mess you made.");
	output("\n\n<i>“You know where to find me if you want to treat me as your breeding bitch again, you big beast.”</i> She steals a quick grope of your [pc.cock " + cIdx + "] before heading off, leaving you standing next to your bed in the smell of the clean sheets. You definitely could go for this again... just not right now. Right now you feel still tired. Grabbing a quick drink, you head back to your bed, sinking into the freshly changed sheets. Sleep takes you quickly after so much exertion.");

	IncrementFlag("ERIKA_SEXED");

	processTime(120+rand(30));
	erika.loadInAss(pc);
	pc.orgasm();
	erika.orgasm();
	pc.shower();

	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function erikaSexToys():void
{
	clearOutput();
	showErika(true);
	author("Doots");

	output("<i>“Hmm, I’m not really in the mood right now,”</i> you muse.");
	output("\n\nShe mistakes what you mean, her ears flattening against her head, shoulders slumping in defeat.");
	output("\n\n<i>“Oh, that’s not what I meant. I just mean that I have something else on my mind.”</i> You smile while groping at her puppy pecker and ample ass. Her ears perk back up and she practically leaps to the bed. She’s halfway between being on her hands and knees and laying on her back, and she looks back at you expectantly. You consider for a while how to play this out. <i>“Get on your back for now.”</i> She quickly obeys, rolling over onto her back while you pick out a bunch stuff from the box.");
	output("\n\nStarting with the rope, you gently guide her limbs so that they are against themselves. She gives you few pointers and guides you when your movements are uncertain. In short order, she is effectively next to immobilized, at your mercy. In preparation for the next step you grab the girthy horse dildo and frot it against her leaky puppy pecker before slowly pushing it into her [erika.asshole]. You keep pushing until the entire dildo is lodged inside her, where you give it a twist and nudge it from side to side. Pulling it out completely, you rub it against her some more before");
	//output(" plugging her with it again");
	output(" setting it aside");
	output(".");
	output("\n\nNext, you pick up some vibes, spreading some all natural lube that, incidentally, is spilling out from her pecker onto them. You push them into her slutty hole one by one and turn them on. After the fourth one has disappeared into her ass, she moans shakily <i>“No more, I can’t take anymore.”</i> Deciding to not put all of your eggs into one basket, or in this case all of your vibes into one [erika.asshole], you start to put the fifth one away before you get an idea. You pull the tape from the box and you tape vibes to both of her nipples.");
	output("\n\nYou turn the vibes to low before kissing her on the nose. <i>“I think I’m going to leave you like this for a while. Don’t cum while I’m away,”</i> you call behind you, leaving her tied up on the bed.");

	clearMenu();
	addButton(0,"Next",erikaSexToys2);
}

public function erikaSexToys2():void
{
	clearOutput();
	showErika(true);
	author("Doots");

	output("You take your time boring yourself with the extranet and watching a bit of porn to keep yourself aroused. You accidentally make the mistake of getting involved in a discussion about politics, well, if it can even be called a discussion rather than a whine fest. Quickly cutting your losses, you remember that you have better uses for your time, like playing with your kitty toy.");
	output("\n\nMeandering back to the bedroom, the first thing that you notice is that she’s trying to hump the air, her tails wrapped around her diminutive length, desperately jerking herself off.");
	output("\n\n<i>“Clever slut, but did you already forget about the cock ring?”</i> You smile down at her, patting her thigh. Looking at the tails you add, <i>“And keep those tails off your dick.”</i>");
	output("\n\nYou ungag her she immediately goes into a mixture of begging and whimpering, so you decide to put the gag back into her mouth. You then start to slowly remove the vibes, teasing her in between each vibrator. After removing each vibe, you carefully remove the cock ring and catch her tails before she has the chance to jerk herself off with them. You wait until her erection starts to soften, and then trail your finger along it. <i>“Let’s see if you can cum like a true buttslut.”</i>");
	if (pc.hasGenitals()) output("\n\nTaking hold of the fake horse cock again, you grind it against your ");
	{
		if (pc.hasVagina()) output("[pc.pussy], slathering it in your juices to help in the oncoming penetration.");
		else output("[pc.cock], coating it in your pre to help it slip inside her ass.");
	}
	output("\n\nYou remember something and tie her tails against her legs so she can’t cheat. <i>“Now let’s see how big of a slut you are.”</i> You press the lubricated cock against her trained pucker, and it doesn’t take her any effort to accept the flat head of the latex member. It seems to take very little effort pushing the rest of the length inside her.");
	output("\n\nAs her previously flaccid dick rises to life again, you affectionately pat the bulge of faux flesh in her abdomen. <i>“You’re a well trained buttslut, aren’t you? Let’s find out if you’re a dedicated one, too.”</i> You grab the fake cock and twist and turn it around her insides, keenly watching her shaft. When it jumps and shoots a bit of clear pre, you know you hit the sweet spot. Pulling it back out, you tease her rim with the flare before plunging it back in, railing over her prostate.");
	output("\n\nIt doesn’t take long to have her moaning and whimpering again under this sort of treatment. Before the dam of her lust breaks, you lift her butt in the air, above her head. This position allows you to rail into her ass with all that you got. Giving her one more full-length thrust against her prostate, her whole body flinches. Her petite canine shaft quivers before letting out the prized content of her balls. It lands wetly on her face, covering it in her own cum. <i>“Good girl.”</i> You smile at her while fondling her balls.");
	output("\n\nYou remove the gag before presenting the cum covered side to her. <i>“Now be a good girl and clean up.”</i> She starts to spit shine the gag, and when you’re satisfied with her you wipe some of the cum from her face and make her lick your finger clean. You repeat this until her face is mostly clean.");
	output("\n\nYou release her from her bondage, letting her stretch her tied up limbs. She takes a quick trip to the bathroom to clean up the rest of her face. When she comes back, you pull her into a kiss and send her on her way with a slap on the ass.");

	IncrementFlag("ERIKA_SEXED");

	processTime(60+rand(15));
	pc.lust(25);
	erika.orgasm();

	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function erikaSexHateFuck():void
{
	clearOutput();
	showErika(true);
	author("Doots");

	output("You want her to call the shots this time, and you tell her as much. The moment the words escape your lips a burning desire lights in her eyes.");
	output("\n\nBefore you can say anything else, she’s already naked and pounces you like some kind of feral predator, knocking you down to the bed with her on top, grinning down at you like some sort of madwoman.");
	output("\n\nShe wastes no time, almost ripping your [pc.gear] off you, throwing it to the side. She bites the side of your [pc.ear] before whispering. <i>“Now it’s your turn to be the fuckmeat.”</i> She flips you to your hands and knees. You could easily resist her manhandling of you, but you allowed her this time.");
	output("\n\nWith your ass in the air, she takes her frustration out on said ass. Her lithe hand connecting with your [pc.butt], the sound of her hand connecting with your butt cheek rings throughout the bedroom. There is almost no strength behind her slap, but still a lightning bolt of pain and pleasure jolts through your body, down to your nethers, ");
	if (pc.hasCock() && pc.hasVagina()) output("your [pc.pussy] and [pc.cock] stirring to arousal and leaking fluids.");
	else if (pc.hasCock()) output("your [pc.cock] engorging with blood.");
	else if (pc.hasVagina()) output("your [pc.pussy] moistening and its lips swell with blood.");
	output("\n\n<i>“I would say I’m surprised, but since you’re such a submissive bitch that you would bend over for me, I would be lying if I said that,”</i> she whispers into your ear whiles penetrating your [pc.asshole] with two fingers.");
	output("\n\nShe pulls her fingers out and slaps your [pc.butt] with both hands before spreading your cheeks. She plunges between said cheeks face first. You flinch in surprise when her tongue spreads your pucker, licking all over your insides, pulling out and lapping around your rim. She alternates between rimming you and penetrating you with her tongue. By the time you’re really starting to get into it, it’s suddenly over.");
	output("\n\nLooking over your shoulder, you see her grinning at you sinisterly. You have an inkling of an idea of what she has on her mind, and you will yourself to relax. When she plows inside you with full force, you find yourself thanking that you relaxed your muscles. She’s not large, but her thrust was still strong.");
	output("\n\nShe doesn’t allow you any time to adjust to her size");
	if (!pc.analVirgin) output(", not that you need it anyways");
	output(". She fucks you from the start with butt-breaking force, slapping her hips against your ass.");
	output("\n\nYou find your face in the pillows as she pulls your arms from below you, putting your ass higher in the air. Prized for more of her mistreatment, you feel her feline claws scratching at your right butt cheek. It hurts but also feels right on some darker level.");

	clearMenu();
	addButton(0,"Next",erikaSexHateFuck2);
}

public function erikaSexHateFuck2():void
{
	clearOutput();
	showErika(true);
	author("Doots");

	output("The kaithrit railing away at your ass has you teetering on the edge of orgasm, but before you hurtle over the edge she pulls out. Slapping your ass again, she flips you over to your back, quickly mounting your face, shoving her cock into your mouth. You gag at the sudden oral intrusion, not that it stops her.");
	output("\n\nShe fucks your [pc.face] with the same vigor as she fucked your ass with, bumping your nose against her heart-shaped patch of pubes. She seems to be close to the edge as her knot starts to swell. She shows no sign of slowing down, seeking to tie with your mouth. With a final thrust, she forces her knot between your lips. Her knot swells, tying her with you. The knot swelling inside is all she can take before cumming, spilling her seed down your throat. You swallow everything she gives to you since she’s tied to your mouth, so you really don’t have an option.");
	output("\n\nShe slumps down over you, exhausted from just cumming. Good for you that she isn’t hung so you can continue to breathe even with her cock in your mouth. While you did give her the reigns for tonight, you didn’t exactly sign up for a kaithrit sleeping on your face. You poke her butt lightly, and when you get no reaction from her you poke her again, only harder this time. She yelps, tugging her her knot against the back of your teeth.");
	output("\n\n<i>“You want more, do you? The things I do for sluts like you,”</i> she grunts. With little effort she manages to pull out from your mouth. She takes the time to slap your [pc.face] with her spit-slathered rod.");
	output("\n\nShe flips you back over to your hands and knees, and without wasting time she mounts your [pc.ass] again, spreading your [pc.asshole] with her length. After cumming once, she seems to be on a hair trigger because it doesn’t take long for her knot to swell. ");
	if (pc.hairLength > 0) output("She seizes a fist full of your [pc.hair] pulling your head back ");
	else output("She grabs the back of your neck forcing your head down into the pillows");
	output(" while forcing her knot into your back passage. You can’t take it anymore, and the rough treatment breaks the dam of your arousal. ");
	if (pc.hasCock() && pc.hasVagina()) output("Your mixed genitals spray their sexual fluids onto the bed sheets, soaking them with your mixed arousal.");
	else if (pc.hasCock())
	{
		output("You spray your seed over the bedsheets");
		if (pc.cumQ() > 1000) output(", creating a puddle of your [pc.cum] between your knees");
		output(".");
	}
	else if (pc.hasVagina()) output("You spray your [pc.girlcum] with a throaty moan, and it leaks wetly down your [pc.thighs].");
	output("\n\nShe forces her knot out and back in repeatedly while cumming inside you, pulling your pucker tight around her knot. When she is finally done, your ass is leaking cum and considerably sore. While you lay there, your asshole leaking cum, she walks over to the discarded pile of your mixed possessions and picks up something. She walks back over to you and you hear the snap of a camera. Looking over your shoulder you notice her with a phone in her hands. She notices your look and smiles at you, walking next to the bed to show her phone to you, more accurately the picture she took. It’s your [pc.ass], but it’s not like when you saw it the last time. Ignoring the cum leaking down from your asshole, there is a rough scratching of her name branding your right butt cheek. Reaching back you feel around at your butt. It’s sore but it’s definitely going to heal.");
	output("\n\nYou grunt when her full weight falls down on your back. You’re about to say something to her when your train of thought is interrupted by her faint snoring. Seems that she thinks that it’s time to sleep, and your tired body agrees, quickly falling asleep despite the lightly snoring kaithrit on your back, with her cum covered dick slowly leaking cum onto your back.");

	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function erikaSexHateFuck3():void
{
	clearOutput();
	showErika(true);
	author("Doots");

	output("You stir from your sleep, rolling over to your back. You hear a yelp and a thud, from the kaithrit crashing down to the floor. Before you can even open your mouth to ask if she is alright, she bolts upright, fussing all over you.");
	output("\n\n<i>“Are you ok? I’m really sorry, I didn’t mean, I mean, I went overboard. I’m sorry, are you hurt? You just- I mean- it’s just that... I’m really sorry if I hurt you.”</i> She’s fidgeting next to you but she seems to be careful in case you’re angry with her.");
	output("\n\nYou reach out for her. She flinches but relaxes as you stroke her hair, before whispering into her ear. <i>“If I didn’t want you to call the shots, I wouldn’t have told you that you could call them.”</i> She seems genuinely relieved. She spends a few minutes snuggling with you and gently massaging all the sore spots she left you with.");
	output("\n\nBut you can’t spend all day with a kaithrit in your lap, so you push her softly off your lap. She seems to be a bit fidgety still. <i>“I’m not angry with you, but don’t count on me letting you do this again. I <i>might</i> let you, but no promises,”</i> you calm her.");
	output("\n\nShe sighs in relief. <i>“I guess I was worried that you would stop talking to me since I hurt you. I don’t want to be alone again...”</i> You assure her again that you’re fine and send her on her way with a pat on the ass.");

	IncrementFlag("ERIKA_SEXED");

	processTime(120+rand(30));
	pc.loadInAss(erika);
	pc.orgasm();
	erika.orgasm();
	
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function erikaSexGiveAnusoft():void
{
	clearOutput();
	showErika(true);
	author("Doots");

	output("Well since you happen to have a wonderful asshole enhancing cream with you, why not use it on Erika.");
	output("\n\nYou grab hold of the tube and turn to Erika. <i>“Turn around and spread your butt for me.”</i>");
	output("\n\nShe hesitantly turns around but pipes up before spreading her cheeks <i>“Umm, what are you going to do.”</i>");
	if (pc.isNice()) output("\n\n<i>“I want to make sure that every moment I’m inside you is enjoyable for you.”</i> Smiling reassuringly you stroke her posterior.");
	else if(pc.isMischievous()) output("\n\n<i>“I’m just making sure that you enjoy your ass as much as I do,”</i> you say, pinching her buttock.");
	else output("\n\n<i>“I’m going to make your hole worthy of a slut like you.”</i> You slap her ass with a grin on your face.");
	output("\n\n<i>“A-again? I’m not sure, I’ve already done it once and I hear that it goes... kind of all the way.”</i> You assure that she will love it once she gets used to it, <i>“A-alright, i-if you’re sure,”</i> she stammers, still hesitant but none the less she spreads her cheeks bearing her still normal pucker to you.");
	output("\n\nTaking a hold of the tube you unscrew it and start squeezing the cream on her rim. She gasps as the cool transformative substance soaks into her pucker.");
	output("\n\nYou blink your eyes as suddenly the tube is empty ");
	if (pc.hasPlumpAsshole()) output("- it always disappears so suddenly - ");
	output("and a feminine gasp from Erika draws your attention back to her. You stare at her rim in perverted fascination. Her thighs quake as her pucker starts to puff up, blowing up like a balloon, slowly turning into a soft puffy donut. It seems to lose some of its tightness becoming much more accommodating for huge dicks, it almost gapes slightly.");
	output("\n\nTransfixed on her pillowy pucker, you bring one finger to her soft rim. When you brush your finger on her donut, she gasps loudly before giving a moan as you keep touching her fat rim. With a smile on your [pc.lips] you pierce her pucker with a finger, breaking another moan from her before it turns into a whimper. Her doggy dick flexes, once, twice, and starts to dribble her salty milk onto the bed.");
	output("\n\nIf she came from one finger you wonder how she would react to more than one finger... and you decide to find out. You pull your finger out only to replace it with three when the trio of digits touch her newly flowered pucker her tails shoot straight like iron bars. You ignore her panicked tails and begin pushing your fingers inside her bum. Her plump rim swallows up your fingers without an issue so you decide to add another and another.");

	clearMenu();
	addButton(0,"Next",erikaSexGiveAnusoft2);
}

public function erikaSexGiveAnusoft2():void
{
	clearOutput();
	showErika(true);
	author("Doots");

	output("You pull your fist out of her ass and marvel how little her pucker has changed, it’s still the same fat donut with small gape that it was before it swallowed your entire fist.");
	output("\n\nYou look at Erika and notice that she’s drooling on the pillow, you might have gone a bit overboard but the lake of cum that she’s kneeling in shows that she definitely enjoyed it. You pat her butt and leave her to regain her wits. You can’t wait to try out her new pucker.");
	
	flags["ERIKA_GIVEN_ANUSOFT"] = 1;

	processTime(10);
	pc.lust(10);
	pc.destroyItemByClass(Anusoft);
	erika.ass.addFlag(GLOBAL.FLAG_PUMPED);
	erika.ass.delFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED);
	erika.ass.bonusCapacity += 50;

	clearMenu();
	addButton(0,"Next",erikaSexMenu);
}

public function erikaSexMenuLeave():void
{
	clearOutput();
	showErika(true);
	author("Doots");

	output("Whether it’s the dick or you just changed your mind, you tell her that you actually don’t want to have sex with her.");
	output("\n\nHer ears fold and she hugs herself before quietly asking, <i>“It’s the dick, isn’t it? It’s always the dick.”</i>");
	output("\n\nEven if it is the dick, you don’t want to break her little kitty heart. You assure her that it isn’t her dick. She seems to be a bit heartbroken, so you swoop her up in a hug. It seems to do the trick as her tails start trail along your body affectionately. You release her from the hug and before handing the box to her.");
	output("\n\n<i>“Umm, if you still want to hang out I’ll be at the bar.”</i> She’s still slightly nervous but seems happy enough, so you send her on her way.");

	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function erikaAppearance():void
{
	clearOutput();
	showErika();
	author("Doots");

	output("Erika, a slender kaithrit, sits alone at the bar. By a rough estimate, you would say that she stands at about 5\' 3\". The first impression her appearance gives you is a lot like a standard kaithrit, with feline ears poking from her hair, two feline tails swirling behind her, and normal human like skin.");
	output("\n\nLong purple hair with lime green highlights hangs in front of her green feline eyes, adorning her pale face. Erika’s full lips are a positively eye-catching feature of her face, with the lower one adorned by a single gleaming silver stud.");
	output("\n\nShe is wearing a rather banal outfit: a plain white strapless blouse and a pair of jeans. You notice that her nipples are visible through her shirt; it looks like this little kitty likes going commando. Her jeans cling to her fertile hips and plump butt, while two dark purple feline tails curl and sway behind her. The tips of her tails are highlighted with the same green color as her hair.");
	output("\n\n");
	if (flags["ERIKA_SEEN_NAKED"] == undefined) output("You are no boobspert but if you had to guess, you would say that her cup size is a B, maybe C. Further south, an undeniably unfeminine bulge lies between her legs. Judging by its small size, you’re fairly certain that she isn’t packing a monster down there.");
	else output("Having seen below her clothes, you know that her boobs are definitely a C-cup. She has roughly five inches worth of canine meat between her legs, located just below a heart-shaped thatch of pubic hair. Below that is a pair of tightly drawn balls. Despite what you thought earlier, she doesn’t have a pussy to go with her [erika.cock].");
	output(" As you gaze between her legs, her face turns bright red, but nonetheless her nipples harden, jeans tent, and her tails start to sway behind her faster. It seems this little kitty is starved for attention; or more likely - judging by her tent - she is starved for sex.");

	erikaMainMenu();
	addDisabledButton(0,"Appearance");
}
