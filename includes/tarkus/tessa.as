//Tsundere Albino Ovir
//Coded by Maye

//Flags
	//TESSA_MET
	//TESSA_TRUST
	//TESSA_PROF
	//TESSA_ORAL
	//TESSA_HERSELF
	//TESSA_SPECIES
	//TESSA_ALONE
	//TESSA_GENDER
	//TESSA_H2H1
	//TESSA_H2H2
	//TESSA_JOB
	//TESSA_ORAL
	//TESSA_FOOT
	//TESSA_PCNEEDS
	//TESSA_BREAST
	//TESSA_DRINK
	//TESSA_FLIRT
	//TESSA_SENSEPLAY
	//TESSA_FJ_MALE
	//TESSA_FJ_FEMALE
	//TESSA_GONEDOWN
	//TESSA_BJS
	//TESSA_LICKS
	//TESSA_BREASTPLAY
	//TESSA_SHOWER
	//TESSA_SHOWER_BREAST
	//TESSA_ORAL_SCENE
	
	
public function tessaBonus(button:Number):void
{
	//[White Woman] (Scene description before talking to her)
	if(flags["TESSA_MET"] == undefined)
	{
		output("\n\nIn a dark corner of the bar you spot a white haired woman drinking alone. She’s dressed in a long black jacket and is facing down into her drink. From what little you can see, she is clearly not human, as she has a thick white tail resting on the ground behind her. Oddly, her complexion and hair are completely white. A closer look might reveal more.");
		addButton(button,"WhiteWoman",whiteWomanTessa);
	}
	//[Tessa] (Scene description after talking to her)
	else if (rand(2) == 0)
	{
		output("\n\nYou see Tessa sitting at her normal table, but instead of a beer in her hand you see her tapping away at a holopad. Angling for a better look, you see the pad is displayed with lists of wanted criminals, and she seems to be browsing through them.");
		if(flags["TESSA_DATAPAD"] == undefined) output (" Is she planning on catching them? You can use this....");
		flags["TESSA_DATAPAD"] = 0;
		if(flags["TESSA_MET"] == 0) flags["TESSA_MET"] = 1;
		addButton(button,"Tessa",whiteWomanTessa);
	}
	else
	{
		output("\n\nYou see Tessa sitting at her usual table. She is staring down into her drink like normal, lost in thought.");
		addButton(button,"Tessa",whiteWomanTessa);
	}
}

public function showTessaName():void
{
	if(flags["TESSA_MET"] == undefined)userInterface.showName("PALE\nWOMAN");
	else userInterface.showName("\nTESSA");
}
public function tessaBustDisplay(nude:Boolean = false):String
{
	return "TESSA" + (nude ? "_NUDE" : "");
}
public function showTessa(nude:Boolean = false):void {
	showBust(tessaBustDisplay(nude));
	showTessaName();
	author("Fr0sty");
}
	
public function tessaTrust(add:Number = 0):Number
{
	if (flags["TESSA_TRUST"] == undefined) flags["TESSA_TRUST"] = 0;	
	
	//affection is locked at 100 so no more adding or subtracting
	if (flags["TESSA_TRUST"] >= 100)
	{
		flags["TESSA_TRUST"] = 100;
	}
	else
	{
		if(add != 0) flags["TESSA_TRUST"] += add;
		if(flags["TESSA_TRUST"] > 100) flags["TESSA_TRUST"] = 100;
		if(flags["TESSA_TRUST"] < 0) flags["TESSA_TRUST"] = 0;
	}	
		
	return flags["TESSA_TRUST"];
}
	
	
public function whiteWomanTessa():void
{
	clearOutput();
	clearMenu();
	showTessa();

	//Tessa not met
	if (flags["TESSA_MET"] == undefined)
	{
		output("You walk over to the pale woman in the corner sitting alone. As you draw closer, her gaze turns to you and you see her striking red reptilian eyes. You slow a moment, a little off balance due to their stark contrast to the rest of her. The break in your step causes her to shift, suck her teeth dismissively, then avert her gaze back to her drink.");
		output("\n\nYou reach her and introduce yourself. <i>“Hey there, name’s-”</i>");
		output("\n\nThe white woman cuts you off. <i>“Would you mind just walking away? I’m really not in the mood and I don’t have time for your rehearsed icebreakers.”</i>"); 
		output("\n\nYou pause a moment then continue. <i>“[pc.Name]...”</i> You shift a moment, feeling a bit of tension. ”</i>[pc.Name] Steele.”</i>");
		output("\n\nThe woman tilts her head slightly, showing a minimal amount of interest. <i>“That’s nice.”</i> She takes a sip of her drink, still not looking at you.");
		output("\n\nAfter a long few seconds you shift a bit, feeling awkward. Doesn’t that line usually work? She takes another sip from her drink then sucks her teeth again. <i>“Look kid. I’m sure you expect that to mean something to me. It doesn’t. So move along.“</i>");
		output("\n\n<i>“Kid?”</i> You repeat out loud, and take another step closer, standing better in the light above her table. "); 

		//Nice
		if(pc.isNice()) output("<i>“I’m really not that young compared to you. Unless you’re older than you look.”</i>");
		//Mischievous
		else if(pc.isMischievous()) output("<i>“I’m not an expert, but if I had to guess you can’t be much older than me. In fact, I might even be older than you.”</i>");
		//Hard
		else output("<i>“Who exactly are you calling a kid?”</i>");

		//Merge
		output("\n\nThe woman turns her head slightly, regarding you again for the first time since her initial look. Dark black slits in her red orbs shift around slowly taking you in. <i>“Ah. My mistake. I thought you were... Nevermind... Just keep walking please " + pc.mf("Mr.", "Ms.") + " Steele, I’m not interested.”</i>");
		output("\n\nSensing a marginally lighter tone after her mistake, you turn back on the Steele charm for another quick pass. Maybe she’ll be more receptive now that the ice is broken? "); 

		//Nice
		if(pc.isNice()) output("<i>“Come on now, let me buy you a drink. Drinking alone isn’t fun.”</i>");
		//Mischievous
		else if(pc.isMischievous()) output("<i>“Not interested? But you don’t know what I’m offering. It’s quite a bit of fun.”</i>");
		//Hard
		else output("<i>“It’s going to take a bit more than that to scare me off. I’ve seen worse bite before.”</i>");

		//Merge
		output("\n\nThe woman’s gaze narrows a bit, seemingly getting quite annoyed. You watch as her free hand slips off the table towards her hip. <i>“Leave.”</i> You hear the faint sound of a blaster activating under the table. Did she just draw a gun on you?!");
		output("\n\nThe threat is clear. You stare back at her a moment in disbelief. Is she going to shoot you for hitting on her?"); 
		//Hard
		if(!pc.isNice()&&!pc.isMischievous()) output(" Your fingers twitch, itching to reach for your own weapon.");
		output(" Examining her glare, you believe she would. For some reason, looking into those orbs, you know this woman is dangerous. You back away slowly, defeated. <i>“Can I at least get your name? I’d at least know the name of the woman threatening to kill me.”</i>");	
		output("\n\nThe woman frowns. <i>“It’s Tessa. Now leave " + pc.mf("Mr.","Ms.") + " Steele.”</i>");
		output("\n\nYou nod your head slightly and move away from the table, leaving the white woman alone with her drink and gun.");
		
		processTime(3);
		
		//Set flag level
		flags["TESSA_MET"] = 0;
		
		//Buttons
		addButton(14,"Leave", mainGameMenu);
	}
	//Tessa met but no random scene encountered yet
	else if (flags["TESSA_MET"] == 0)
	{
		output("You decide to try your luck with Tessa again. She spots you a few paces away from her and takes a big gulp from her drink. You also can’t help but notice her right hand drops below the table. When you reach the table she looks over at you, her red eyes boring a hole into your skull.");
		output("\n\n<i>“Are you being serious right now?”</i> Her tone is calm, with no hint of rage. <i>“Didn’t we already go over this?”</i>");
		output("\n\nYou shift your weight a bit, <i>“I figured...”</i> You cut yourself off and take a step back. <i>“I’m sorry, I’ll leave you be.”</i> You turn to leave, hearing Tessa mutter something under her breath as you leave earshot.");
		processTime(1);
		
		//Buttons
		addButton(14,"Leave", mainGameMenu);
	}
	//Tessa met and random scene encountered
	else if (flags["TESSA_MET"] == 1)
	{
		output("You decide to try your luck with Tessa again. She spots you a few paces away from her and takes a big gulp from her drink. You also can’t help but notice her right hand dropped below the table. When you reach the table she looks over at you, her red eyes boring a hole into your skull.");
 		output("\n\n<i>“Are you being serious right now?”</i> Her tone is calm, with no hint of rage. <i>“Didn’t we already go over this?”</i>");
		output("\n\nYou slowly raise your hands and move to the opposite side of the table. <i>“Relax, I’m not here to hit on you.”</i>");
		//Misch
		if(pc.isMischievous()) output(" You give a small wink. <i>“This time.”</i>");
		output(" You slowly take a seat and place your palms flat on the table. <i>“I’m here on business.”</i>");
		output("\n\nTessa’s gaze softens, then twists into a skeptical expression. <i>“Business? With me?”</i> Her tone shifts, she seems more curious now, but still on guard. She slides her drink away from her, opening up space between her and you. <i>“What business could we have together?”</i>");
		output("\n\nYou take a deep breath. <i>“I want to hire you.”</i> You watch her expression closely, trying to sense if her mood changes.");
		output("\n\nTessa scoffs slightly. <i>“<b>Hire me</b>? Do you... Even know what I do?”</i> She shifts a bit in her seat, seemingly getting comfortable.");
		output("\n\nYou smile a bit, getting ready to play your hand. <i>“You’re a Bounty Hunter.”</i>");
		output("\n\nTessa chuckles, seemingly amused at your declaration. <i>“Bounty Hunter huh? And what does a go getter like you need with a Bounty Hunter?”</i> Her red eyes examine you closely, in a way they haven’t before. For the first time she really looks at you. <i>“No. You don’t want to hire me.”</i> She reaches for her drink and takes a big gulp.");
		output("\n\nYou raise a brow. <i>“What? Why do you say that? Of course I want to hire you...”</i>");
		output("\n\nThe white woman waves her hand at you, dismissing your claim. <i>“Please. Spare me that crap. You strike me as a...”</i> She stares at you again, those red orbs seeming to read your soul. <i>“..Do it yourself kind of person.”</i> She points at you with a sharp finger. <i>“I can tell.”</i>");
		output("\n\nYou raise your hands in surrender and sigh. <i>“Alright, you got me.”</i> You ease back your posture a bit more, getting comfortable. All the danger seems to have vanished from her eyes. <i>“So you admit it then?”</i>");
		output("\n\nShe takes another gulp from her drink, seemingly indifferent to your presence now. <i>“Hm? Admit what?”</i>");
		output("\n\nYou roll your eyes and can’t help but smirk a bit now. <i>“That you’re a Bounty Hunter.”</i>");
		output("\n\nTessa stares at you a moment, and for that moment you feel a tingle run up your spine as her red eyes narrow again. After a long few heartbeats she sighs and her gaze soften and looks away. <i>“It’s not quite correct, but I suppose you could call me that.”</i> She takes another gulp and finishes her drink. <i>“Great I’m empty now. Dealing with you made me drink faster than I like.”</i> She returns her gaze to you, expectantly. <i>“Well?”</i>");
		output("\n\nYou stare at her a moment, unsure of her intentions. She gives her empty glass a tap with her sharp nails and you immediately understand. She wants you to buy her a drink. You stand up and head over to the bar. ");
		//PC isn't a bum
		if(pc.credits >= 10)
		{
			output("You return a few moments later with a new glass for the pale woman.");
			pc.credits -= 10;
		}
		//PC is a bum
		else output("Realizing your broke, you take a quick look around and spot an unattended glass waiting to be sent out. After a quick look around, you grab the glass and make your way back to Tessa, trying to look casual.");
		output("She takes the drink and takes a small sip. <i>“Okay Steele, you win. I’ll let you stay until this drink is done.”</i>");
		
		processTime(5);
		
		//Set flag level
		flags["TESSA_MET"] = 2;
		
		//Buttons
		addButton(0,"Talk",talkWifDatLizTessa,undefined,"Talk","Engage with your new friend.");
		addButton(14,"Leave",lonelyLizardTessa);
	}	
	//TESSA_SEX_IDENTITY_SCENE 
	else if	(flags["TESSA_GENDER"] == 1)
	{
		output("You spot Tessa in her normal spot in the corner of the bar. Her knife is still embedded into the table, and more than a few empty beer glasses are littered around. Taking a deep breath, you head on over.");
		output("\n\nYou reach the table and stand behind your normal seat. Tessa is starting down into her drink and does not acknowledge you. You take a seat and sit there in silence a few moments.");
		output("\n\n<i>“I was raised a girl you know.”</i> She speaks after a long few minutes. Her speech is slurred, she’s drunk or at least well on her way. <i>“Not saying that was wrong, but I was. I was <b>born</b> female, so it made sense, right? They had me tested. Most ovir don’t have that happen to them. I was a girl and I knew it for as long as I can remember.”</i> She went quiet again and took a big gulp of her drink.");
		output("\n\nYou ask her how much she’s had to drink. You count at least ten glasses on the table, but knowing her she was likely a few deep before.");
		output("\n\nTessa just shakes her head. <i>“Don’t care, lost count.”</i> She sighs a bit and lifts her head for the first time sit you sat down. Her eyes are puffy, she’s been crying. <i>“I thought I was over this shit, but whenever I feel like I’ve forgotten somebody comes alon-”</i> She cuts herself off and goes quiet. She sits there a long time without saying anything. You both do.");
		output("\n\nAfter a few minutes she sets her glass down and reaches for her knife. With a yank she pulls it from the table and looks over the blade. <i>“Sorry I... you know... You didn’t mean anything by it. I know that. I <b>KNEW</b> that. I just...”</i> She moves the blade to the sheath on her hip and slides it in. <i>“I’m a mess... I need to go.”</i> She starts to stand up and wobbles a bit.");
 		output("\n\nYou jolt up and grab her arm, stopping her from falling over. She yanks her arm away and scowls. <i>“Don’t... I don’t need...”</i> She staggers a bit, then holds onto the edge of the table for support. <i>“Fuck... I can’t...”</i> Her eyes start to well up again. She bites her lip, clearly frustrated.");
		output("\n\nYou reach out again, offering to help her back to her ship or wherever she is staying.");
 		output("\n\nTessa stands there a long moment, holding onto the table and looking at the floor. She thinks to herself for a few moments then raises her head. She nods.");
		output("\n\nA few minutes later the two of you are walking towards the hangar, her arm over your shoulder and your arm around her waist. Her head is rolled back and is staring off in the distance, tears still in her eyes. She breaks the silence first. <i>“I only let you help me because it’s what a woman should do. Or at least what I think I woman should do.”</i>");
		output("\n\nYou frown a bit at that. ");
		//Nice
		if(pc.isNice()) output("<i>“It’s not just women who need help getting home you know.”</i>");
		//Mischievous
		else if(pc.isMischievous()) output("<i>“I don’t think needing help getting home after drinking your ass off is exclusive to women.”</i>");
		//Hard
		else output(". <i>“You shouldn’t only ask for help because of what’s between your legs.”</i>");
		output("\n\nShe gives a loud snort at that and starts to laugh. <i>“Yeah, you’re right about that.”</i> She points a long white finger at a sleek black ship, the name Ebony scrawled on the hull. <i>“That would be me.”</i> She stops and pulls away from you, staggering a little bit. <i>“I can make it from here.”</i> Her eyes seem glazed over, but she shifts them to look at you. <i>“You’re a good drinking buddy.. And I’m not just saying that because you haven’t tried to sleep with me.”</i> She reaches out and taps your nose, smirking.");
 		output("\n\nYou sigh to yourself as you watch the drunken ovir stagger over to her ship, waving as she walks away. She shouts back at you, <i>“let’s pretend this didn’t happen, okay?”</i>");
		output("\n\nYou call back saying you’d like that. You’re not sure if she heard.");
		
		processTime(6);
		
		//Reset flags to zero cause we aren't exiting like normal.
		flags["TESSA_HERSELF"] = 0;
		flags["TESSA_SPECIES"] = 0;
		flags["TESSA_ALONE"] = 0;
		flags["TESSA_GENDER"] = 2;
		
		addButton(0,"Next",mainGameMenu);
		currentLocation = shipLocation;
	}
	//Heart2Heart1
	else if ((flags["TESSA_LICKS"]!=undefined||flags["TESSA_BJS"]!= undefined) && flags["TESSA_H2H1"]==undefined && tessaTrust() == 100 && rand(5) == 0)
	{
		output("You approach Tessa and take your normal seat. Tessa sighs at you and sips her beer, barely acknowledging you. <i>“Hey [pc.name], here to spoil the silence again?”</i> She stares off into the distance, her chin in her hand.");
		output("\n\nYou shift a bit in your seat. She doesn’t call you by your first name often, and almost never <i>before</i> you two have played. <i>“Something up? You seem... Bitchy...er.”</i>");
		output("\n\nTessa turns to you and frowns. <i>“Watch it. I still have my gun you know.”</i> She sighs deeply, her frown fading away. <i>“Just been thinking too much and not drinking enough.”</i> With that she takes another long sip from her drink.");
		output("\n\nYou ask if this is about the recent additions to your sexual dynamic. Tessa scoffs at that, dismissing the idea. You think a back a moment. <i>“Is this about that déjà-vu comment?”</i>");
		output("\n\nThe ovir looks back at you, her eyes narrowing. <i>“Shut it. We’re not talking about that.”</i>");
		output("\n\nTempting the dangerous white woman, you press the issue. <i>“That just tells me it is. Why not tell me about it? If it’s upsetting you we can work it out you know.”</i>");
		output("\n\nTessa’s hand twitches, you can tell she’s fighting the urge to draw on you. Instead she takes a healthy gulp of her drink and scowls. <i>“Look Steele, we have fun yeah? Why go mess up a good thing by pissing me off?”</i> She leans back in her chair, stretching slightly.");
		output("\n\nYou can’t help but frown, but knowing how Tessa is, you decide to drop the issue. The two of you sit in silence for a moment until Tessa groans loudly. <i>“Fuuuuck. See? That right there is the fucking problem. I <b>want</b> to talk about it, but I fucking hate that I want to talk about it.”</i>");
		output("\n\nYou can’t help but stare at the woman. You decide to stay quiet for a moment and see how this plays out.");
		output("\n\n<i>“For some insane reason, I trust you. I mean <b>trust</b> might not be the word... Value you? I think that sounds better, let’s go with that.”</i> The ovir woman pushes her drink aside. This is about to get deep. <i>“I’m not like most girls.”</i> Tessa’s hand reaches for her collar, fiddling with her zipper.");
		output("\n\nYou can’t help but blush a bit. Was she going to strip naked? Here?");
		output("\n\nTessa pulls down the zipper down to her navel and yanks at the sides of her suit, letting her very finely shaped melons fall free. You blink a moment, looking over at them. <i>“You... Don’t have nipples....”</i> You stare at them a moment longer. They’re pure white orbs, huge and round, but plain.");
		output("\n\nA patron nearby turns and looks over, spotting Tessa’s exposed chest. The ovir woman notices and barks at him. <i>“What the fuck are you looking at limp dick?!”</i> She draws her gun and points it at him. <i>“Never seen a pair of tits before!? BEAT IT!”</i> The poor man stumbles out of his chair and runs out of the bar, Tessa glaring at him the whole time. <i>“Yes, Steele. I don’t have nipples.”</i> Tessa puts her gun away, then stuffs her well sized chest back into the sides of her suit, zipping it up after.");
		output("\n\n<i>“So, is that it? You’re upset because you don’t have nipples?”</i>");
		output("\n\nThe ovir frowns at you. <i>“No shithead. I’m upset because... Look I’m not like most women. I don’t have a proper set of tits or normal cunt.”</i> She sighs and grabs her drink, taking a long pull from it. <i>“Cards on the table? No bullshit? I’m just a bit worried you might... Not be kind. Like I said, I value our time together. If it ended because...”</i> She groans a bit. <i>“I’m an ovir. Ovir aren’t born with nipples. There, that’s your biology lesson for the day. You fine with that?”</i>");
		output("\n\nYou nod.");
		output("\n\n<i>“And my cun-...my cloaca? Your fine with that too?”</i>");
		output("\n\nYou roll your eyes and nod again.");
		output("\n\nTessa smiles at you, a weight seemingly lifted off her shoulders. <i>“Awesome.”</i> She finishes her beer. <i>“Now excuse me. I’ve got to go and take a shower, gonna try to wash all this sap off me”</i>");
		output("\n\nWithout any goodbye, Tessa rises from her seat and walks off, her tail wagging behind her.");
		
		processTime(5);
	
		flags["TESSA_H2H1"]=1;
		
		//Buttons
		addButton(0,"Next",mainGameMenu);
	}
	//Heart2Heart2
	else if ((flags["TESSA_SHOWER"]!=undefined||flags["TESSA_BREASTPLAY"]!= undefined) && flags["TESSA_H2H2"]==undefined && tessaTrust() == 100 && rand(5) == 0 && pantyFapCount() > 5)
	{
		output("You take your normal seat across from Tessa, the ovir woman glancing over at you and sighing. <i>“Won’t be able to stay long Steele. I’ve got business to take care of.”</i>");
		output("\n\nYou can’t help but frown at that, considering how little the white woman did on a daily basis aside from drink. <i>“What sort of business?”</i>");
		output("\n\nTessa takes a sip of her drink and sighs. <i>“My job.”</i>");
		output("\n\n<i>“Ah.”</i> You sit in silence a moment. It came up so rarely you had almost forgotten your scaled friend was a professional killer. You clear your throat and shift in your seat. <i>“So, are you... killing somebody in particular or....?”</i>");
		output("\n\nThe white ovir looks at you for a long moment, her face difficult to read. <i>“Yeah. I am. We don’t... have to talk about this, you know.”</i> You notice Tessa’s eyes twitch a bit, she was forcing herself to look at you.");
		output("\n\nYou shrug. The topic wasn’t the worst in the world, and if there was ever a time to talk about it... <i>“Tell me about your target.”</i>");
		output("\n\nTessa shifts in her seat. <i>“Nothing much to say really. Just some pirate, or ex-pirate rather. Crossed the wrong people and now... well...”</i> Tessa takes another sip of her drink. <i>“Let’s just say his old crew doesn’t want him talking to <b>certain</b> people.”</i>");
		output("\n\n<i>“So he deserves to die then?”</i> You ask the question flatly, trying not to sound judgemental. The ovir sighs and pulls out a datapad from her pocket, sliding it over to you. Taking a peek, you see a picture of a rather scruffy looking man, and a very lengthy list of his alleged crimes. <i>“Ah.”</i> You scroll through a few, starting to get the idea after a few of the more graphic charges. You slide the datapad back to the ovir and she repockets it.");
		output("\n\n<i>“Yeah. Real piece of work.”</i> Tessa sips her drink again then coughs a bit. <i>“Subject change? Subject change. So... Sleep with anybody fun lately?”</i> The white women smirks at you, leaning in a bit. <i>“Don’t be shy, I know you get around.”</i>");
		output("\n\nChuckling a bit, you start to tell Tessa about a few notable exploits of yours, but the ovir cuts you off after you drop a few tales. <i>“Right, like I should believe that shit. Look, I believe you get some mad.... well whatever it is you get, you get it a lot.”</i> When you insist you’re being honest, Tessa rolls her eyes. <i>“Prove it.”</i>");
		output("\n\nYou smirk at the woman and show her a few of the <b>trophies</b> you’ve gathered over your travels. Tessa looks at the pile of panties and gives them a soft sniff, then leans in close to them and sticks her long ovir tongue out. For a second you think she’s going to lick the pile, but instead she wiggles her studded tongue around your collection. <i>“Huh.”</i> Tessa leans back in her chair taking another sip from her drink. <i>“All from different women. Good work.”</i>");
		output("\n\nYou crack a small smile. <i>“Maybe one of these days I could add something of yours to my collection.”</i>");
		output("\n\nTessa stares at you a moment, slight annoyance in her eyes. After a long tense pause, she sighs and rubs her face. <i>“Steele. Do you realize I’ve never kissed you?”</i> You think about it for a moment. Assuming she only means on the lips then she isn’t wrong. <i>“I’m sure you’ve also realized we’ve never properly <b>fucked</b> either.”</i> The ovir takes another sip from her drink, letting that sink in. <i>“We’ve come close mind you, dangerously close in fact...”</i> Tessa smiles a bit, her tail wagging behind her. <i>“But nothing that would cause somebody to lose their V-card over. I always keep you back, do you know why?”</i>");
		output("\n\nYou shrug, but decide to take a guess. <i>“Because you like to keep your distance? Not let things get serious?”</i>");
		output("\n\n<i>“Exactly. Those sorts of things are... Well I’ve been there and done that. Didn’t work out for reasons, some of them mine, some... not.”</i> The white woman leans in. <i>“I’m not looking for a " + pc.mf("boyfriend","girlfriend") + ". Now I know fucking and kissing aren’t exclusively things for people who date... but I don’t want to give you the wrong idea. Now I like you, but I’m not exactly writing your name in my diary with hearts either, if you know what I mean.”</i> She motions to the pile of panties between the two of you. <i>“Also, I’m not eager to make any additions to your collection. That’s some next level shit.”</i>");
		output("\n\nYou sit there a moment, letting Tessa’s words sink in. <i>“You... Have a diary?”</i>");
		output("\n\nTessa glares at you, her red eyes burning so hot you can’t help but shrink back. <i>“You do remember I’m literally killing somebody in like 20 minutes right?”</i> Tessa brings her drink to her lips and finishes her beer, then pulls herself to her feet. <i>“Look. Play your cards right and I’ll make out with you, sleep with you, and even let you raid my panty drawer. Real highschool level shit. Just remember: I’m not looking for a somebody to bring home to Sunday dinner to meet the folks. I’m looking for somebody to have fun with. Got it?”</i>");
		output("\n\n<i>“Got it.”</i> You smile at Tessa, understanding exactly what she was getting at. The ovir’s sour expression relaxes, and she smiles back. <i>“But seriously, you have a diary?”</i>");
		output("\n\nThe white woman punches you in the shoulder then brushes past you on her way to the door. <i>“See ya later Asshole.”</i> She says as you turn to watch her leave, noticing her tail sway back and forth on its own.");
		
		processTime(8);

		flags["TESSA_H2H2"]=1;
		
		//Buttons
		addButton(0,"Next",mainGameMenu);	
	}
	else
	{
		output("You stalk on over to Tessa’s corner of the room and take a seat across from your ovir friend.");
		output("\n\nHer drink is about half down, and you can tell she’s been nursing it at her normal pace. She doesn’t regard you at first, instead examining her claw-like fingernails. After a few long moments of silence, her red eyes look up at you. <i>“This is starting to become a habit of yours.”</i>");
		
		processTime(1);
		
		//Buttons
		addButton(0,"Appearance",lookAtDatSexyTessa,undefined,"Appearance","Get a good look at her.");
		addButton(1,"Talk",talkWifDatLizTessa,undefined,"Talk","Engage with her.");
		if (tessaTrust() >= 70 && flags["TESSA_JOB"]!= undefined && pc.lust() >=33)
		{
			addButton(2,"Flirt",flirtWithTessa,undefined,"Flirt","See where this goes.");
		}
		else
		{
			addDisabledButton(2,"Flirt","Flirt","Probably not a good idea.");
		}
		
		addButton(14,"Leave",lonelyLizardTessa);
	}
}

public function largestCockIndexThatFitsTessaMouth():int
{
	var i:int;
	var maxFitIndex:int = -1;
	var maxFitVol:Number = 0;
	for (i = 0; i < pc.cocks.length; i++)
	{
		if (pc.cocks[i].cLength() <= 24 && pc.cocks[i].thickness() <= 4 && pc.cockVolume(i, false) > maxFitVol)
		{
			maxFitIndex = i;
			maxFitVol = pc.cockVolume(i, false);
		}
	}
	
	return maxFitIndex;
}


public function lonelyLizardTessa():void
{
	clearOutput();
	clearMenu();
	showTessa();
	
	output("You rise up and bid Tessa a farewell.");
	output("\n\nShe looks at you and sighs. <i>“Thank God, all this talking is making my throat dry.”</i> Her red eyes shift down to her drink, and she resumes her loner behavior.");
	output("\n\nWalking away, you hear her take a long, loud sip from her beer.");
	
	processTime(1);
	
	if (flags["TESSA_HERSELF"] != undefined) flags["TESSA_HERSELF"] = 0;
	if (flags["TESSA_SPECIES"] != undefined) flags["TESSA_SPECIES"] = 0;
	if (flags["TESSA_ALONE"] != undefined) flags["TESSA_ALONE"] = 0;
	if (flags["TESSA_JOB"] != undefined) flags["TESSA_JOB"]=0;
	
	//Buttons
	addButton(0,"Next",mainGameMenu);
}	

//Talk with her
public function talkWifDatLizTessa():void
{
	clearOutput();
	clearMenu();
	showTessa();
	
	output("What will you ask her about?");
	
	addButton(0,"Herself",askAboutDatSexyTessa,undefined,"Herself","Ask her about herself.");
	if (flags["TESSA_HERSELF"]!= undefined)	addButton(1,"Species",tessaSpecies,undefined,"Species","Ask her about her species.");
	if (flags["TESSA_SPECIES"]!= undefined)	addButton(2,"Alone?",whySoLonelyTessa,undefined,"Alone?","Ask why she always drinks alone.");
	if (flags["TESSA_SENSEPLAY"]!= undefined && flags["TESSA_ALONE"]!= undefined) addButton(3,"Her Sex",didYouJustAssumeTessaGender,undefined,"Her Sex","Ask her what her “deal”</i> is.");
	if (tessaTrust() >= 60) addButton(4, "Profession", whatSexyTessaDo, undefined, "Profession", "Wait, what did you do again?");
	addButton(14,"Back",whiteWomanTessa);
}

//Ogle dat liz
public function lookAtDatSexyTessa():void
{
	clearOutput();
	clearMenu();
	showTessa();
	
	output("Sensing your gaze, the ovir woman turns to face you, tilting her head slightly. <i>“Checking me out? Fine.”</i> Slightly annoyed, Tessa gives a soft sigh and allows your inspection. Without her heels on, you estimate she stands at around 5’2, seemingly quite short by the Galactic Standard. Her body is covered in fine, milky white scales, with no hint of a design or pattern, leaving her seemingly made of some pristine stone. Her eyes are a deep red, with a thin reptilian slits in the middle. Pale snowy hair falls down on her shoulders in a thick mass. Not a single hair touches her face, exposing a pronounced widow’s peak at the top of her forehead. Together, these three traits give you the impression she’s an albino.");
	output("\n\nHer face is an odd mix of reptilian and feminine, with a smoothed brow and flat nose, but a striking jawline and sharp cheekbones. Her lips are plain but puffy giving them a soft kissable appearance, a bit unusual for ovir, suggesting she might have taken an Estrobloom or two during her life. She wears no makeup as far as you can tell, leaving her face a solid alabaster. She sighs a bit, growing tired of your staring, very briefly showing off her sharp teeth hidden behind her lips.");
	if (flags["TESSA_PROF"]!= undefined) output(" You also know from first hand experience Tessa’s mouth hides a long ovir tongue, with a single silver stud pierced through it that she keeps well hidden.");
	output("\n\nTessa wears a tight smoke grey catsuit, made from some material resembling leather, but you can tell offers far more protection and mobility. Over the suit she wears a long black jacket, open at the front and reaching down to her ankles. At her feet you see she the suit ends off on a pair of wedge heels, seemingly adding at least 4 inches to her height. At her hip to see a pistol of unfamiliar make, and on the other a knife tucked into a sheath. Following your gaze, Tessa opens her jacket a bit, allowing you a better look at her.");
	output("\n\nYour eyes trial downward, examining her feminine frame. Tessa boasts an impressive hourglass figure, with a tight flat stomach leading into impressive egg bearing hips. Her ample chest completes the hourglass, and despite being held in tight by her attire, your expert opinion leads you to believe she’s equipped with at least a DD cup.");
	if (flags["TESSA_H2H1"]!= undefined) output(" Having seen so first hand, you also know Tessa lacks nipples of any kind.");
	output(" A white swish averts your gaze, drawing your attention to the thick tail behind her, nearly as wide as her waist at the start and almost as long as she is tall. Her tail gives another annoyed wave, silently reminding you to hurry up.");
	output("\n\nDirectly below her tail Tessa’s wide hips lead into her sizable round ass, seemingly being equal parts firm and jiggly. Between her large cheeks rests her asshole, and inches away from that you observe her flat crotch area, where her cloaca is hidden.");
	output("\n\nTessa scowls a bit and closes her jacket, turning away from you. <i>“Alright, show’s over Steele.”</i>");

	//Buttons
	addButton(0,"Next",whiteWomanTessa);
}

//Ogle dat liz
public function askAboutDatSexyTessa():void
{
	clearOutput();
	clearMenu();
	showTessa();
	
	output("You decide to ask her about herself.");
	output("\n\nShe runs a long nail around the rim of her drink. <i>“Me? Not much to say. Just a gal trying to make it in this twisted cruel galaxy.”</i> She tilts her head a bit, letting silence fill the air for a moment. She gives her glass a tap then lifts it to her mouth a takes a big gulp. <i>“Fine.”</i>");
	output("\n\n<i>“Well, you can clearly tell I’m not human. Never was. I’m an ovir, although you might already know that....”</i> She leans back a bit and sucks her teeth. <i>“But as you can tell I’m not exactly your standard model. I’m an albino. While that isn’t exactly rare for my kind, there isn’t really one like me living in every community if you get my meaning.”</i>");
	output("\n\nYou nod a bit. <i>“That must have made you lonely.”</i>");
	output("\n\nShe scoffs a bit. <i>“Being <b>alone</b> makes you lonely. Not the color of your skin.”</i> She shifts a bit in her seat and crosses her legs under the table. <i>“But, if you are asking if I was lonely, then I guess I was. From time to time. Not that I mind being alone.”</i> She gives you a knowing glare.");
	output("\n\nYou can’t help but smirk at that, but ask her to continue.");
	output("\n\n<i>“What else is there to say? I’m an albino ovir who’s been alone so much she’s gotten used to it.”</i> She runs her hand through her thick mane of hair. <i>“Anything else is just the past.”</i>");
	output("\n\nYou stare at her, frowning a bit at her evasiveness. <i>“There has to be more than just that..”</i>");
 	output("\n\nTessa shrugs. <i>“Just because we are doing...<b>this</b>...Doesn’t mean I’m going to tell you my life story. I’m a private person and if you don’t like that....”</i> Her red eyes narrow in. <i>“Then we’re done here.”</i>");
	
	processTime(3);
	
	//+5 Trust each visit first time talked about
	if (tessaTrust() < 70 && flags["TESSA_HERSELF"]!=1)
	{
		tessaTrust(10);
		if (tessaTrust() > 70) flags["TESSA_TRUST"] = 70;
	}
	if(flags["TESSA_HERSELF"] != 1) flags["TESSA_HERSELF"] = 1;
	//Buttons
	addButton(0,"Next",talkWifDatLizTessa);
}

public function tessaSpecies():void
{
	clearOutput();
	clearMenu();
	showTessa();
	
	output("You ask her more about her species.");
	output("\n\nThe white woman shrugs. <i>“You’ve got that Codex thing, don’t you? I’m sure it can tell you more about that than I can.”</i> She gives an exaggerated smile, showing off her sharp teeth.");
	output("\n\nYou shrug at the truth of it. <i>“True. But you must have something to add. What was it like growing up as an ovir?”</i>");
	output("\n\nTessa stares at you hard a moment. Her gaze isn’t threatening, but is rather certainly annoyed. <i>“I told you I’m a <b>private person</b>. My childhood isn’t any of your business.”</i>");
	output("\n\nYou apologize, trying to drop the issue. <i>“I didn’t think that was going to be a sore spot for you.”</i>");
	output("\n\nShe takes a big gulp and rubs her forehead. <i>“If it’ll shut you up about it, I wasn’t really raised around other ovir. I didn’t meet another ovir until I was...”</i> She pauses a moment and thinks, searching for the right word, <i>“<b>mature</b>. So, I’m not like them and they are not like me, in fact-”</i> She cuts herself off, realizing she was starting to say too much.");
	output("\n\n<i>“Sorry I brought it up. We can talk about something else if you want.”</i>");
	output("\n\nTessa takes a sip from her drink. <i>“This is why I like to sit alone. Fucking hell, this was just so much easier when you were just trying to hit on me.”</i>");
	output("\n\nYou chuckle, asking her when she thinks you stopped.");
	output("\n\nShe smirks at that. Behind her you notice her jacket shifting a bit. You point it out and the motion stops immediately. <i>“Shit. Sorry, that’s my tail. Damn thing has a mind of its own if I don’t think about it long enough.”</i>");
	output("\n\nYou can’t help but laugh");
	if(pc.hasTail()) output(", and you give your own a bit of a wag. <i>“Oh trust me. I know.”</i> You smirk and wiggle it again at Tessa");
	
	processTime(3);
	
	//Nice
	if(pc.isNice()) output(". <i>“See? You did teach me something about ovir. I didn’t know they wagged their tails like Ausar when flattered.”</i>");
	//Mischievous
	else if(pc.isMischievous()) output(". <i>“Well, well looks like somebody likes me after all.”</i> You offer a lewd wink.");
	//Hard
	else output(". <i>“Hope you can keep that thing under control when it counts there.”</i>");
	
	//Merge
	output("\n\nThe death glare Tessa shoots you ends the conversation quickly.");
	
	//+5 Trust each visit first time talked about
	if (tessaTrust() < 70 && flags["TESSA_SPECIES"]!=1)
	{
		tessaTrust(10);
		if (tessaTrust() > 70) flags["TESSA_TRUST"] = 70;
	}
	if(flags["TESSA_SPECIES"] != 1) flags["TESSA_SPECIES"] = 1;
	//Buttons
	addButton(0,"Next",talkWifDatLizTessa);
}

public function whySoLonelyTessa():void
{
	clearOutput();
	clearMenu();
	showTessa();
	
	output("You ask her why she likes to drink alone.");
	output("\n\n<i>“I’m a private person and I like to be alone. Is that so strange?”</i> She rhythmically taps her fingers on the table, seemingly thinking on the question more. <i>“I just don’t like people. Well most people. You’re <b>alright</b>. I guess.”</i> She looks at you with her big red eyes.");
	output("\n\nYou laugh a bit and thank her, but remind her of your not too warm meeting and the end of a blaster.");
	output("\n\n<i>“I’m not sorry about that.”</i> Her tone stiffens a bit and her eyes become annoyed again. Silence fills the air for a long moment. She scratches her thumb nail against her forefinger a moment then continues. <i>“Look, I’ve had some stuff in my past that’s made me a little messed up okay? I’m not going to get into it, but all you need to know is me and people don’t mix well.”</i> She takes a firm gulp from her drink and scowls a bit looking down into her drink.");
	output("\n\nYou nod a bit and opt to sit in silence for a moment. The tension only lasts a short while, with her taking a few more gulps and sips. You comment she is quite good at holding her liquor.");
	output("\n\nShe chuckles a bit softly. <i>“I usually pace myself. I make a beer like this last two hours. Been doing that since I was... God... Fourteen?”</i> She leans back and ruffles her hair a bit. <i>“Do that with five beers a day at least for a number of years and a tolerance builds up. Only drink beer though, everything else is too strong for me.”</i> She looks you dead in the eye. <i>“Beer or water. Nothing else.”</i>");
	output("\n\nYou nod a bit and chuckle, asking how she managed to support a drinking habit so young.");
	output("\n\nThe pale ovir shifts a bit, clearly uncomfortable with the question. <i>“I told you I’m a pri- Okay, you know what. Fine. You get this one.”</i> She lifts her glass to get mouth and takes a gulp, as if asking for strength. <i>“When I was young, even younger than fourteen, my home had a contaminant in the water. Alien something or other from who knows where. Nobody knew what it was or how to get rid of it. We could bathe fine, but drinking? That was a sure-fire way to end up sick and in a hospital bed for a week.”</i>");
	output("\n\nYou lean in a bit, interested that she finally decided to share. <i>“Didn’t you have filtration? Or water reserves?”</i>");
	output("\n\nTessa waves her hand a bit, dismissively. <i>“Filtration wasn’t getting it. Not all the time at least. Whatever was in the water was persistent. All the reserves had to be used for the sick. And let me tell you, there were a lot of those.”</i>");
	output("\n\nYou shake your head a bit in disbelief. She must have grown up somewhere pretty backwater by the sounds of it. <i>“So, what did you drink?”</i>");
	output("\n\nThe white woman sighs and taps her glass. <i>“Have you been paying attention? Beer. Well I did at least. I was a kid, so they gave me the lightest stuff they could. All the kids had to drink it. For some reason, the crap in the water couldn’t survive in alcohol, which I suppose makes sense.”</i> Tessa lifts her beer up off the table and starts to swirl the liquid. <i>“The whole thing maybe last a few months. But when you drink nothing but beer for that long, you develop a taste.”</i>");
 	output("\n\nShe takes another sip and sets the glass down. <i>“By the time I was fourteen I had a hookup who could get me tons for cheap. Just had to have the cash, and money was never really an issue for me.”</i> The ovir went silent a moment and sighed again. <i>“So there, that’s why I drink beer. End of discussion.”</i>");
	
	processTime(5);
	
	//+5 Trust each visit first time talked about
	if (tessaTrust() < 70 && flags["TESSA_ALONE"]!=1)
	{
		tessaTrust(10);
		if (tessaTrust() > 70) flags["TESSA_TRUST"] = 70;
	}
	if(flags["TESSA_ALONE"] != 1) flags["TESSA_ALONE"] = 1;
	//Buttons
	addButton(0,"Next",talkWifDatLizTessa);
}	
	
public function didYouJustAssumeTessaGender():void
{
	clearOutput();
	clearMenu();
	showTessa();
	
	if (flags["TESSA_GENDER"] == undefined)
	{
		output("You ask decide to ask her about her sex.");
		output("\n\nTessa rolls her eyes and frowns a bit. <i>“I’m pretty clearly a woman.”</i> She stares at you a moment, her red eyes reading you. Her frown fades away and her expression goes blank. After reading you a moment, she understands now why you’re asking. <i>“Oh. <b>That</b>.”</i> Her gaze narrows and her tone becomes rather annoyed. <i>“I’m a female. No cock.”</i>");
		output("\n\nYou lean in a bit, slightly surprised. <i>“Oh, well you seem rather feminine for a female don’t y-”</i>");
		output("\n\n<i>“So you’re saying a <b>woman</b> can’t be <b>feminine?</b>”</i> She leans back in her chair, crossing her arms over her chest.");
		output("\n\nYou shake your head. <i>“What? That’s not what I mean. I just thought that male ovir were the ones with large busts an-”</i>");
		output("\n\n<i>“So just because I have a large chest I must be a male?”</i> Her eyes narrow. She flexes her fingers against her arms, her sharp nails almost scratching into her jacket.");
		output("\n\nYou go silent a minute, unsure of what to say. An ovir’s sexual dimorphism was what it was, so why was she getting so mad?");
		if(pc.isNice()) output(" <i>“I’m sorry if I misspoke, it’s just an ovir I met told me-”</i>");
		else if(pc.isMischievous()) output(" <i>“Wow. Damn. Sorry. I just heard from this ovir that-”</i>");
		else output(" <i>“Settle down. Damn. This ovir told me that-”</i>");
		output("\n\nTessa slams her hand on the table and stands up with a jolt, knocking her chair over with her tail as she rises. <i>“Shut up! You don’t know anything!”</i> Her red eyes glare hard into you, harder than when she first threatened your life. <i>“What the fuck do you know?! I’m me, do you understand that? I’m a <b>woman</b> and I was born a <b>woman</b> and no matter how I act or look I am just as much a woman as any other human or ovir!”</i>");
		output("\n\nYou raise your hands, trying to apologize. A few eyes around the bar turn to watch the small scene.");
		output("\n\nThe white woman reaches for and draws her knife, slamming it into the table, the force of which spills her beer. <i>“You don’t get to tell me if I’m too feminine or masculine or anything like that, you got it asshole?”</i> Her eyes were pure rage and hurt. You notice the ovir’s hand on the knife tremble, her knuckles going red. A long moment passes and she stands up straight, leaving the knife in the table. Using her tail, she scoops up her chair and set it upright then sits down, her gaze falling downward into her lap. <i>“Leave me alone.”</i> Her voice was calm, and low. But she wasn’t asking.");
		output("\n\nWithout hesitation, you stand up and leave the trembling ovir alone.");
		
		processTime(3);
		
		//Reset flags to zero cause we aren't exiting like normal.
		flags["TESSA_HERSELF"] = 0;
		flags["TESSA_SPECIES"] = 0;
		flags["TESSA_ALONE"] = 0;
		
		//Set Flag for Special Opening Scene
		flags["TESSA_GENDER"]= 1;
		tessaTrust(-10);
		
		//Buttons
		addButton(0,"Next",mainGameMenu);
	}
	else
	{
		output("You decide to risk bring up the Sex issue again.");
		output("\n\nTessa stares at you a moment, her gaze going rigid. <i>“Do you think that’s wise?”</i> She runs a finger along the table, brushing over the mark left behind by her knife. <i>“Do you want to <b>die</b>?”</i>");
		output("\n\nYou stare at her a moment, pondering the threat, but are waved off by the ovir shaking her head and sighing.");
		output("\n\n<i>“Fine. I think I owe you a bit of an explanation. Well as I said before I am female.”</i> She leans back, getting comfy in her seat. <i>“I don’t know if you remember me mentioning, but I didn’t meet another ovir until I was an adult.”</i>");
		output("\n\nYou nod at that, recalling that as one of the few details she let slip about her past.");
 		output("\n\n<i>“Well when I said that... I meant it. Very literally.”</i> She takes a strong gulp on her drink and then runs her long nails through her snowy hair. <i>“Not even my parents. No. Stop, don’t... I don’t need sympathy for that okay.”</i> She waves her hand at you, dismissively. <i>“I’ve accepted that. I was abandoned as an egg. Best reckoning is my parents didn’t want...”</i> The white woman goes silent and motions up and down at herself. <i>“<b>This</b>. I guess they could tell what I was from my egg. An albino freak. I’m told most ovir don’t care about this sort of thing. But some... Well let’s just say some people in this galaxy are living a few centuries behind everybody else.”</i>");
		output("\n\nThe two of you pause and let that hang in the air, thinking about it for a long a moment.");
 		output("\n\n<i>“Anyways, I was adopted by my foster parents. Humans. They are...well...my parents. I’ve never really considered them not to be....”</i> She smiles faintly at that. <i>“They loved kids, but for some... God, for some insane reason instead of making one of their own they adopted an egg. An egg!”</i> Tessa chuckles a bit and takes another drink, a small sip this time. <i>“Well, when I hatched, they didn’t know the first thing about ovir children, they couldn’t even tell if I was a boy or girl. So, they had me checked.”</i> She sighed deeply and shook her head. <i>“That’s not normal for ovir. Not really anyways.”</i>");
		output("\n\nYou can’t help but ask how being an ovir raised by humans went.");
 		output("\n\n<i>“I was... Different. It was a human colony. Tiny really, everybody knew everybody sort of tiny. Sure, we had an ausar here and there, but I was the only ovir. My mother made all my clothes because of that.”</i> She gives her tail a bit wiggle, then chuckles. <i>“I was treated like a human most of the time, but not always. Some kids were... Not kind to me. But you know kids, right? They’re little assholes. Didn’t stop little ol’ me from crying myself to sleep some nights.”</i>");
		output("\n\n<i>“That must have been hard for you.”</i> You watch the ovir’s eyes stare off into nothing, knowing she’s thinking back to those days.");
		output("\n\n<i>“It was fine. It was childhood. Kids are jerks, but they grow out of it. One of the boys who was mean to me...”</i> She pauses a moment and smirks; her tail starting to start to wag a bit. After a quick second she catches herself and her tail stops. <i>“Nevermind....”</i> In a quick motion she downs her drink and taps on the glass. <i>“Get me another, will ya? I’m way too sober to talk about this crap.”</i>");
		output("\n\nYou shake your head and ");
		//PC isn't a bum
		if(pc.credits >= 10)
		{
			output("fetch");
			pc.credits -= 10;
		}
		//PC is a bum
		else output("steal");
		output(" a fresh beer for your alabaster friend. She takes it from your hand and sighs. <i>“I didn’t know anything about ovirs. Nothing. Aside from stuff I knew because it was happening to me. I was just a girl, a lizard girl in a sea of filthy monkey children, but a girl all the same.”</i> She takes a sip of her new drink. <i>“First ovir I met thought I was a guy. How you spend your whole life around ovirs and get the sexes confused is beyond me, but... Well he was... Hurtful. And not in the way the children were.”</i>");
		output("\n\nSensing the story is about to get heavy, you say she can stop if she wants, but she shakes her head and sips her beer, holding it in both hands.");
		output("\n\n<i>“No. I started this crap, I might as well finish. He saw me first... And he liked what he saw... I mean can you blame him? He was charming... And sweet. I knew he was a he, or she was a he, or however the damn pronouns work... We went back to my place... I...”</i> She gulps her beer, still with both hands. <i>“I was curious. We stripped naked and his... was out, it had been out a good chunk of the night. It’s how I knew....”</i> She laughs and finishes her drink in a mighty chug.");
		output("\n\nKnowing how this normally goes, you stand and offer to get another for her, but he waves you off. <i>“No. No. Let me finish.”</i>");
		output("\n\nShe sighs and rubs her temples. <i>“He asked me... Well, he asked me why I wasn’t into him. I was confused, I wanted him. <b>Badly</b>. I... Fucking hell. I said I was, and he asked why I hadn’t let it <b>out</b>... He... Well. When I told him I was a female he laughed at me...”</i> Tessa’s red eyes shifted off into the distance. <i>“He was a gay ovir who thought I was a dude. My white scales... Well females are not usually white. We’re supposed to be bland, dull colors... And my chest... I guess you could say I’m stacked for a girl....”</i> She went quite a moment. <i>“And I guess... female ovir don’t get horny... well they do, just not often. But... that’s not me... I... I’m... Never mind. I want that drink now.”</i>");
		output("\n\nYou head back over to the bar and retrieve a fresh beer for your friend. She takes it, but stays silent. <i>“So, he laughed and left. Said I needed to learn how to... How to act my sex... He was an asshole. I know not all ovir are like him but... All my life I was something else. Something other. Everybody around me... Not everybody accepted me at first because I was different. Most of them changed over time, but they still were not the same as me. I was a lizard in a den of mammals. So why is it the first other ovir I met treated me like I was... something else....”</i>");
		output("\n\nYou reach across the table and place your hand on Tessa’s. She looks over at you, regarding you with her red orbs. She smiles. <i>“I was raised like a human girl. I grew up with human girls... My appearance... I was a freak to the humans and then a freak to the ovir.”</i>");
		output("\n\n<i>“No. You’re not.”</i> You grip her hand. <i>“You are... You.");
		//Nice
		if(pc.isNice()) output(" You are so much more because of it all. It helped you become an amazing person.");
		//Mischievous
		else if(pc.isMischievous()) output(" You said it before, when you... well when you had your knife out.");
		//Hard
		else output(" So to hell with everybody else. If they want you to change then they aren’t worth thinking about.");
		output("”</i>");
		
		//Merge
		output("\n\nThe white woman can’t help but laugh at that. <i>“You’re right. I know, it’s... it’s just me. God, I feel silly. Starting to well all emotional because the first ovir I met didn’t think I was who I should have been....”</i> She sighs and takes another sip from her drink. <i>“Thanks [pc.name}, for listening.”</i> She runs her thumb along the side of your hand, still placed on hers. <i>“Now stop touching me before I cut that hand off.”</i>");
		output("\n\nLaughing, you pull your hand away, not sure if she’s serious or not. She couldn’t be. Right?");
		
		processTime(11);
		
		if (tessaTrust() < 70)
		{
			tessaTrust(10);
			if (tessaTrust() > 70) flags["TESSA_TRUST"] = 70;
		}
		if(flags["TESSA_GENDER"] != 3) 
		{
			flags["TESSA_GENDER"] = 3;
			tessaTrust(5);
		}
		//Buttons
		addButton(0,"Next",talkWifDatLizTessa);
	}
}

public function whatSexyTessaDo():void
{
	clearOutput();
	clearMenu();
	showTessa();

	if (flags["TESSA_JOB"]== undefined)
	{
		output("You decide to ask about her job.");
		output("\n\n<i>“Bounty Hunter.”</i> She takes a sip of her drink. <i>“That’s what you figured out right?”</i>");
		output("\n\nYou frown at that, reminding her she wasn’t very clear on the subject.");
		output("\n\nThe ovir woman scratches her face a bit, staring at you hard. <i>“It’s accurate enough.”</i>");
		output("\n\n<i>“I think you can do better than that.”</i> You lean in slightly, feeling like you know the white ovir well enough to get when she isn’t being straight with you.");
		output("\n\nTessa sighs deeply and pushes her drink to the side, an uncharacteristic move for her. <i>“How did you find out about that anyways... I never did ask.”</i>");
		output("\n\nYou mention you observed her looking up bounties, and you hazarded a guess.");
		output("\n\nThat stops the white woman in her tracks and she glares at you. <i>“So, you guessed?”</i>");
		output("\n\nAll you can offer in response is a shrug.");
		output("\n\nThat brings a chuckle from the woman, and her tail making a bit of movement behind her. <i>“Oh, that’s good. Very good. Here I am letting you into my little world based completely off of a guess. Well cheers to you!”</i> She goes for her glass, but doesn’t take it, her hand stopping just before it.");
		output("\n\nYou stare at her a moment, watching her hesitation. You’ve never known her to turn down a good sip.");
		output("\n\n<i>“How much would it take to change the subject?”</i> She says after a long moment. She stares at you hard, her eyes focused. There is no annoyance, or rage, or murderous intent in her stare. Just focus.");
		
		processTime(1);
		
		addButton(0,"Back Off",talkWifDatLizTessa,undefined,"Back Off","Discretion is the better part of wisdom they say.");
		addButton(1,"Push the Issue",tessaNothingPersonalKid,undefined,"Push the issue","Don’t let her off THAT easy.");
	}
	else
	{
		output("Against your better judgement, you decide to ask her about her job again.");
		output("\n\nTessa chuckles. <i>“Want to be reminded of how I almost killed you?”</i> She smirks and sips her beer, seemingly very relaxed. <i>“What’s there to say? I kill people for money.”</i>");
		output("\n\nYou stare at her a moment, a bit uneven about how flippant she is over it.");
		output("\n\n<i>“Oh, don’t give me that look. This is why I didn’t want to tell you. Don’t worry. I don’t kill people who don’t already have it coming.”</i> She sets her drink down and frowns. <i>“I don’t... do it much. There is good money to be made doing it, and I can more than sustain my lifestyle only killing a few people a year.”</i>");
		output("\n\n<i>“I don’t think that makes it much better.”</i> Your eyes move to her knife at her hip. <i>“How do you even get into that sort of thing?”</i>");
		output("\n\n<i>“Oh. Well I started off as a Bounty Hunter, like you guessed. Now most bounties want you to bring in the mark alive... Well I wasn’t very good at that.”</i> She motions up and down at herself. <i>“You try subduing and dragging a 300-pound ausar onto your ship with a build like mine and you find out quick what you can and can’t do.”</i>");
		output("\n\nYou frown, <i>“Why be a Bounty Hunter? It’s not exactly the sort of job anybody can just do.”</i>");
		output("\n\nThe white woman sighs deeply and takes a big swing from her drink. <i>“I fell into it. I needed a job and it paid well. Did some easy ones and got a taste for it. It’s very exciting. Then I started to have... Problems. Until I took my first ‘Dead or Alive’ contract, and focused on the dead part. Then, well, no more problems. Fast forward a few years and now I just kill people.”</i> She takes another swing. <i>“And no, it doesn’t keep me up and night, and yes I do enjoy it.”</i>");
		output("\n\nThe bluntness of her statement does not surprise you. You know her that well at least. <i>“But, isn’t that kind of... Illegal?”</i> You hazard the question.");
 		output("\n\nShe laughs a bit and waves her hand. <i>“Very. Well, in some places. Others not so much. Trick is knowing what’s illegal where.”</i> She stares at you a moment then sighs. <i>“Look, I didn’t want to bring it up. But it’s out there now. I’m a murderess. I’ve killed, and I’ll kill again. But it’s a tough galaxy and a girl’s gotta do what a girl’s gotta do.”</i> She runs her hand through her hair and flips it a bit. <i>“Judge away, if you want.”</i>");
		output("\n\n<i>“What kind of people do you kill?”</i> You feel like asking this is important, a clue to figuring out exactly who she is.");
		output("\n\nTessa leans back and thinks a moment. <i>“People worse than me. I don’t kill people who are innocent, Steele. I promise you that. These are people who the law can’t get, and even if they did the punishment they receive is nothing compared to the shit they deserve.”</i> Her eyes go narrow and serious. <i>“I’ve seen real monsters. I’ve killed them. The kind of monsters who die reminiscing about the things they did rather than regretting them.”</i> She takes another sip from her drink. <i>“Maybe I’ll tell you about them. One day.”</i>");
		
		processTime(2);
		
		addButton(0,"Next",talkWifDatLizTessa);
	}
	
	if (tessaTrust() <70 && flags["TESSA_JOB"]!= 1)
	{
		tessaTrust(10);
		if (tessaTrust() > 70) flags["TESSA_TRUST"] = 70;
	}
	if(flags["TESSA_JOB"] != 1) flags["TESSA_JOB"] = 1;
}

public function tessaNothingPersonalKid():void
{
	clearOutput();
	clearMenu();
	showTessa();
	
	output("A brief silence fills the air between you two. After a moment you shift in your seat and smirk. <i>“I think I’d like to press the issue.”</i>");
	output("\n\nA dark smile creeps across the face of the white woman, and she stands up slowly. <i>“Then follow me. I’ll show you.”</i> She reaches out and offers her hand to you.");
	output("\n\nUnsure of what she means, you take her hand and follow her. She leads you outside of the bar and takes you a bit of a ways away, towards the hangar you believe. Walking behind her, you can’t help but notice her tail wags lightly behind her as she walks, the tip of it brushing against you gently. Is she... Is this?");
	output("\n\nShe comes to a stop and a small alley, gives a look around and releases your hand. <i>“Come on in... If you want a taste....”</i> She slips into the shadows, giving a small giggle. "); 
	if(pc.hasCock()||pc.hasVagina())
	{
		output("Feeling a sudden");
		if(pc.hasCock())output(" tightness");
		else if(pc.hasVagina())output(" heat");
		output(" in your ");
		if(!pc.isCrotchExposed())output("[pc.lowerGarment]");
		else output("[pc.groin]");
		output(", you can’t help but follow. ");
	}
	output("You turn the corner into the alley and... She’s gone. You look around but see almost no sign of her... Except her black jacket on the ground. You tread forward and bend over to examine the jacket.");
	output("\n\nCold steel meets your throat. While you bent down, the ovir woman somehow got behind you, her wicked knife now at your throat. Her other hand is on her blaster, which you feel prod against your back. She giggles in your ear, leaning in close. <i>“Gotcha.”</i>");
	output("\n\nSweat begins to build on your brow. What was this, what was she? She’s just a boozehound in a bar who made threats and sat alone. This was wrong. This wasn’t normal. She wasn’t a Bounty Hunter. Bounty Hunter’s don’t move like that. How can she get behind somebody in a narrow alley and take them from behind? In heels no less!");
 	output("\n\nShe moves her face close to yours and gives you a small lick on the cheek. <i>“You thought I was just a Bounty Hunter. You’re not far off. I’m actually...”</i> She twists the blade a bit, the razor edge pressing tight against your throat. <i>“An Assassin.”</i>");
	output("\n\nThen, just as quickly as she attacked, the blade and the blaster are removed. You spin around ready to fight, but see she is gone. You dart your eyes around. How did she do that? How did she disappear? You hear a call from the end of the alley.");
	output("\n\n<i>“I’ll be at the bar if you want to talk.”</i> You turn the opposite direction and see her at the far end, putting her jacket back on. Your eyes fall to where it was laying and see she had somehow scooped it up. The white woman laughs and blows you a kiss, then turns to leave while you sit there dumbfounded.");
	
	processTime(2);
	
	currentLocation = "213";
	generateMap();
	//Buttons
	addButton(0,"Next",mainGameMenu);
}

public function flirtWithTessa():void
{	
	clearOutput();
	clearMenu();
	showTessa();

	if (flags["TESSA_FLIRT"] == undefined)
	{
		output("Tessa stares at you a moment, frowning slightly. <i>“Really? Are you fucking serious? We’re doing this now?”</i> She takes a gulp from her drink and sighs loudly. <i>“Okay Steele, hit me with your best shot.”</i>");
		output("\n\nYou return her unimpressed look. <i>“You know, most people enjoy flirting.”</i>");
		output("\n\nThe pale ovir leans back in her seat and rolls her eyes. <i>“Fuck you. I enjoy flirting just as much as anybody. What comes <b>after</b> on the other hand....”</i> She trails off and sighs, leaving the thought unfinished.");
		output("\n\nYou chuckle a bit at that. <i>“You didn’t strike me as a prude.”</i> You can’t help but notice your female friend narrow her eyes at that remark. <i>“Don’t worry about after, just enjoy the now.”</i>");
		output("\n\nTessa’s stare breaks off of you a moment and see looks down at her drink, thinking. After a few seconds, she looks back up at you and clicks her tongue. <i>“Might need another one of these....”</i>");
		output("\n\nYou get up and head to the bar, grabbing her a fresh beer. When you return to the table, you notice she hasn’t finished her glass. <i>“I’m surprised you didn’t down that.”</i> You offer over the new drink and she shakes her head.");
		output("\n\n<i>“No. That’s for you. You’re going to have to chug it.”</i> Tessa takes a sip from her own drink and motions for you to sit.");
		output("\n\nYou set the drink down and take your spot across from her. <i>“What? Why?”</i>");
		output("\n\nTessa rolls her eyes. <i>“If we’re going to do this, then I can’t be the only one with a buzz.”</i> She leans back in her chair again and crosses her legs. <i>“I think I need to clarify. About the <b>after</b>.”</i>");
		output("\n\nYou stare at her for a heartbeat. <i>“Wait, what?”</i> You look down at the drink in front of you and then back up at her. ");
		//Nice
		if(pc.isNice()) output("<i>“I don’t want to pressure you into anything. We can just talk you know.”</i>");
		//Mischievous
		else if(pc.isMischievous()) output("<i>“Well, that was a quick change of heart, like what you see more than you let on or something?”</i>");
		//Hard
		else output("<i>“Well, if you’re good then I’m good, but what changed?”</i>");
		output("\n\nTessa groans at that. <i>“Holy fuck Steele. Shut up and listen.”</i> The ovir woman runs her fingers through her hair. <i>“We’ve clearly had a bit of a miscommunication. Let’s try this again.”</i> She takes a sip of her beer, then sets the glass down on the table. <i>“I think we should play. However, if we’re going to do that, we’re going to do it my way.”</i> A sly grin creeps across her face and she gives you a lascivious wink.");
		output("\n\nYou stare at her a moment. While the odd flirtatious remark wasn’t out of character for the ovir, this kind of forward behavior was a first. Well almost a first. <i>“We’re not going to have a repeat of the alley are we?”</i>");
		output("\n\nThe white woman groans again, louder than before. <i>“God damn Steele. No. I’m serious.”</i> She leans forward in her chair, keeping her legs crossed. <i>“Didn’t you just say something about enjoying the now like a minute ago? I’m bored and you want to get naughty, right? So this just makes sense, or am I mistaken in thinking you want to have some fun?”</i> Tessa points a sharp nail and you. <i>“Last chance. Are we doing this or not?”</i>");
		
		processTime(3);
		
		addButton(0,"DrinkTheBeer",tessaDrinkBeer,undefined,"Drink the Beer","Sure, why the fuck not?");
		addButton(1,"Another Time",tessaAnotherTime,undefined,"Another Time","Oh second thought...");
	}
	else
	{
		output("You lean in a bit, asking your pale companion if she would be interested in taking this back to her ship. <i>“What do you say? Up for some fun?”</i>");
		output("\n\nTessa sighs, examining her drink. <i>“Again? My god Steele.”</i> She tosses back her beer and pulls herself to her feet. <i>“Alright. Let’s have some fun.”</i>");
		output("\n\nThe two of you make your way back to the Ebony, her tail wagging back and forth the whole way. Despite her cool demeanor, you can tell she’s excited. The two of you enter her vessel and she removes her jacket and looks you over.");
		
		output("\n\n<i>“Alright Steele. You know what’s on the menu. What’ll it be?”</i>");
		
		processTime(1);
		
		addButton(0,"Sense Play",tessaCleverGirl1,undefined,"Sense Play","Go back into the cargo hold and let her play.");
		if(tessaTrust() >= 80) addButton(1,"New Idea",tessaNewIdea,undefined,"New Idea","See what else you two can do.");
		else addDisabledButton(1,"New Idea","New Idea","She still doesn’t quite trust you enough for that.");
		if (flags["TESSA_FOOT"]!= undefined && (pc.hasCock()||pc.hasVagina())) addButton(2,"Footjob",tessaFootjob,undefined,"Footjob","See what she can do with those feet.");
		if (flags["TESSA_ORAL"]!= undefined) addButton(3,"GoingDown",tessaOralLuv,undefined,"Going Down","Eat her out.");
		if (flags["TESSA_PCNEEDS"]!= undefined && largestCockIndexThatFitsTessaMouth() >= 0 &&!pc.isTaur())
		{	
			addButton(4,"Blowjob",tessaPcOralIntroBJ,undefined,"Blowjob","Let her suck you off.");
		}
		else if (flags["TESSA_PCNEEDS"]!= undefined) addDisabledButton(4,"Blowjob","Blowjob","Get a dick or at least a smaller one. Must be biped.");
		if (flags["TESSA_PCNEEDS"]!= undefined && pc.hasVagina()&&pc.isBiped())
		{
			addButton(5,"Get Eaten",tessaPcOralIntroCunny,undefined,"Get Eaten","Let her eat you out.");
			
		}
		else if (flags["TESSA_PCNEEDS"]!= undefined) addDisabledButton(5,"Get Eaten","Get Eaten","Requires a vagina. Must be biped.");
		if (flags["TESSA_BREAST"]!= undefined && (pc.hasCock() || pc.hasVagina()) && pc.biggestTitSize() > 3 && pc.isBiped())
		{
			addButton(6,"Breast Play",tessaPcBreastPlayIntro,undefined,"Breast Play","Let her play with your tits.");
			flags["TESSA_SHOWER_BREAST"] = 0;
		}
		else if (flags["TESSA_BREAST"]!= undefined) addDisabledButton(6,"Breast Play","Breast Play","Requires genitalia, D-cup breasts and a biped PC.");
		if (flags["TESSA_DRINK"]!= undefined && (pc.hasCock()||pc.hasVagina())&&pc.isBiped()) 
		{
			addButton(7,"Take a Shower",showerTimeIntroTessa,undefined,"Take a Shower","Get clean and dirty together.");
			flags["TESSA_SHOWER_BREAST"] = 1;
		}
		else if (flags["TESSA_DRINK"]!= undefined) addDisabledButton(7,"Breast Play","Breast Play","You need genitalia and must be a biped.");
		
		addButton(14,"Leave",tessaLeaveShip,undefined,"Leave","You’ve changed your mind.");
		currentLocation = shipLocation;
		generateMap();
	}
}
public function tessaLeaveShip():void
{
	clearOutput();
	showTessa();
	output("<i>“Actually, I’ve changed my mind. I think I’ll pass. Maybe another time.”</i>");
	output("\n\nYou exit Tessa’s ship.");
	clearMenu();
	addButton(0,"Next",mainGameMenu);

}
//Sense Play] - Go back into the cargo hold and let her play.
//[New idea] - See what else you two can do.
//This option is required to unlock additional scenes.
//[Footjob] - See what she can do with those feet.
//Requires PC to have a Penis Or Vag.
//Requires PC to have completed More hands on dialogue. 
//[Going Down] - Eat her out.
//Requires PC to have completed Oral dialogue.
//[Blowjob] - Let her suck you off.
//Requires PC to have a Penis. Penis must be no longer than 24 inches.
//If PC has multiple Cocks, the largest allowable one is selected.
//Requires PC to have completed My Turn dialogue.
//Cannot be Taur
//[Get Eaten] - Let her eat you out.
//PC must have a Vagina.
//Must be Bipid
//Requires PC to have completed My Turn dialogue. 
//[Breast Play] - Let her play with your tits.
//PC must have at least D cup breasts.
//PC must have either a Penis or Vagina.
//PC must be a biped.
//PC must have talked about Breasts.
//[Take a Shower] - Get clean and dirty together.
//PC must have Drank Wine with Tessa.
//PC must have either a Penis or Vagina. 
//PC must be a biped.	

public function tessaAnotherTime():void
{	
	clearOutput();
	clearMenu();
	showTessa();

	output("You shake your head and slide the beer over to Tessa. <i>“I think I’ll pass. Maybe another time.”</i>");
	output("\n\nTessa shrugs and downs her drink, then takes hold of the one you refused and sets it in front of her. <i>“Now who’s the prude?”</i> She smirks at you and lifts her glass in a mock toast.");
	addButton(0,"Next",talkWifDatLizTessa);
}

public function tessaDrinkBeer():void
{	
	clearOutput();
	clearMenu();
	showTessa();

	output("You take ahold of your beer and lift it to your lips, downing the drink. You gasp slightly when finished and bring the glass down hard onto the table. <i>“We’re doing this.”</i>");
	output("\n\nTessa smiles and tosses back what little she had left of her own drink, and before she even swallows it she hops up to her feet. <i>“Alright Steele. Let’s do this shit.”</i> The ovir gives you a smirk and starts walking towards the door, the tip of her tail swaying back and forth.");
	output("\n\nYou follow behind the white woman, keeping your eyes on her. <i>“We’re not going down any alleys are we?”</i> Your eyes fall down again to Tessa’s tail, watching it move back and forth slowly while sticking out from under her coat.");
	output("\n\n<i>“Sadly, not today. No we’re going to my ship.”</i> She turns her head a bit, glancing over her shoulder at you. <i>“And stop staring at my tail. It’s fucking creepy.”</i>");
	output("\n\nThe two of you arrive at her ship, the Ebony, and she leads you inside. The vessel is small, but not cramped, and you get a feeling it’s been well lived in. The main hold has been furnished like a living room, and you note more than one empty beer bottle laying around. Looking around more, you see a door off to the side which you suspect to be her bedroom and start off towards it. <i>“Nice place, should I get comfy?”</i>");
	output("\n\nTessa removes her jacket and tosses it to the side. She turns to you and rolls her eyes. <i>“Don’t go in there dumbass.”</i>");
	output("\n\nYou stop and turn around, facing the white woman. <i>“Ah, I thought that was the bedroom.”</i>");
	output("\n\nThe ovir stares at you a moment. <i>“Yeah, it is. But we’re not using it. We’re using the cargo hold.”</i> Tessa points to the back of the ship and starts to walk over. <i>“We’re doing this my way remember?”</i>");
	output("\n\nThe two of you enter the hold and Tessa turns to you, smiling. ");
	if(pc.isNude()) output("<i>“This is the part where I’d ask you to strip, but you’re already ahead of me on that one.”</i>");
	else output("<i>“Clothes off, Steele. Everything.”</i> Tessa crosses her arms over her chest and watches you expectantly. You do what she says and take off your [pc.gear] and get naked.");
	output("\n\n<i>“Alright, your turn then.”</i> You can’t help but smile, more than a little curious what’s under that catsuit of hers. Looking around the room you can’t help but notice there isn’t any furniture. What exactly does she have in mind?");
	output("\n\nTessa laughs and shakes her head. <i>“Yeah no. Sorry we’re not doing that today.”</i> She turns and heads to the corner of the hold and opens a crate. <i>“What are you like [pc.height]? I’m pretty good at sizing a person up, so I’m usually right.”</i> She pulls a length of rope from the box and turns back to face you.");
	output("\n\n<i>“Um, what are you doing?”</i> You eyeball the rope, feeling like you might have signed up for something a bit more freaky than intended.");
	output("\n\nSensing your concern, Tessa rolls her eyes. <i>“Don’t be a pussy. You agreed to play and let me do things my way.”</i> She takes an end on the rope and tosses it over a steel beam on the ceiling you didn’t notice before. <i>“Besides, in the grand scheme of freaky shit people do in this galaxy, this isn’t much more adventurous than a blowjob.”</i> Tessa adjusts the rope and flags you over. <i>“Raise your hands, I need to make sure the length isn’t fucked.”</i>");
	output("\n\nYou move to the center of the room where she’s standing and raise your arms like she instructed. You watch her measure the rope out and adjusts it a bit, then she heads back over to the box and returns with two wrist binders and a blindfold. Without a word, she moves towards you and slips the binders over your wrists. <i>“Um...Tessa?”</i>");
	output("\n\n<i>“Shhh, don’t be a... Hm, what was the word you used?”</i> The white ovir woman looks you in the eye, finished tightening the binders. <i>“Prude.”</i> She smirks and then takes the ends of the rope, securing them to each binding, leaving your arms strung up in the air. Taking a step back she examines her work.");
	output("\n\n<i>“This wasn’t exactly what I had in mind....”</i> You tug at the rope a bit, noticing it wasn’t very taut, but you can’t lower your arms. While you are looking up at you arms, Tessa moves back to you and puts the blindfold over your eyes. <i>“Hey! Wait-”</i>");
	output("\n\n<i>“Shut up. God damn.”</i> You hear her heels clicking, moving away from you. <i>“I understand this is a little bit <b>rape dungeon</b>-y, but I swear this is super mellow, you’ll love it.”</i> You hear two zipper pulls and the sounds of something hitting the floor. <i>“Relax, it’s just my shoes.”</i>");
	
	processTime(3);
	
	currentLocation = shipLocation;
	addButton(0,"Next",tessaCleverGirl2);
	pc.imbibeAlcohol(25);
}

public function tessaCleverGirl1():void
{
	clearOutput();
	clearMenu();
	showTessa();

	output("Tessa smirks at the suggestion and leans down to remove her shoes. <i>“Again, Steele? You a masochist or something?”</i> She tosses her boots to the side and shrugs. <i>“Fine by me. Lead the way.”</i>");
	output("\n\nYou step into the cargo hold as Tessa brushes past you and heads towards the box of ropes. ");
	if(pc.isNude()) output("You watch your play partner set up the rope.");
	else output("You remove your [pc.gear] and toss it to the side, watching your play partner set up the rope.");
	output(" Once the rope is in place she motions for you to come closer.");
	output("\n\nStepping into place, Tessa slips the binders onto your wrists and starts to secure them to the ropes. <i>“If we keep doing this you’re going to have to start providing your own rope.”</i> She gives to a suggestive wink, finishing up binding you into place. <i>“You know I really think you enjoy this more that I do.”</i> She lightly treads back over to the box and produces the blindfold. <i>“Am I wrong?”</i>");
	output("\n\nYou offer a shrug. <i>“Can’t say for sure. Sadists like you are hard to understand.”</i> Tessa rolls her eyes at that and moves in close to you, placing the blindfold over your face.");
	output("\n\n<i>“Sadist? Sounds like a challenge.”</i> You hear Tessa take a few steps backwards from you, then her footsteps vanish. A few long heartbeats later, you hear her behind you. <i>“Get ready, love muffin. This is going to be fun.”</i> All that follows is silence....");
	
	processTime(1);
	
	addButton(0,"Next",tessaCleverGirl2);
}

public function tessaCleverGirl2():void
{
	clearOutput();
	clearMenu();
	showTessa();

	output("You listen for movement but can’t seem to find her. <i>“Tessa?”</i> You call out but get no reply. You shift your feet, straining your arms against the rope. Where is she? Was she sitting in the corner? You listen harder. Nothing. Your heart flutters in your chest.");
	output("\n\nSuddenly you feel a sharp nail graze along your chin, a flare of sensation in your sightless world. You start to let out a sharp gasp, but are hushed by the white woman. <i>“Shhhh. Easy there. Just be quiet and enjoy.”</i> Tessa’s claw-like nail drags downward along your neck then vanishes off your [pc.skinFurScales].");
	output("\n\nTessa moves around the room, stalking you like a predator on the hunt. Every so often she makes a subtle noise, but you know it’s only because she made it on purpose. With each sound your head turns towards the cause of the break in silence, struggling to follow the ovir’s movements. A long minute passes, then one of Tessa’s nails touches the back of your neck. You can’t help but jump at her touch, the unexpected contact feeling electric against your vulnerable nape, sending your heart hammering.");
	output("\n\n<i>“So jumpy. I love it.”</i> Tessa’s tone is low and husky in your ear. You feel a second unexpected touch on your stomach, and you can only assume it’s Tessa pressing the tip of her tail firmly against your exposed [pc.belly}. You strain against the rope, trying to defend yourself against her invasive touch. Her tail drags across your body, brushing against your [pc.skinFurScales] then disappears off you, leaving your flesh tingling. Tessa’s nail starts to glide down your neck before vanishing as well off your now trembling body.");
	output("\n\nTessa speaks again, now in a different spot from where she was standing. <i>“Having fun yet?”</i> Despite the absurdity of the situation, you can’t help but nod. Each of her touches feels far more potent than it should, the sensation of her sharp dangerous nails against your [pc.skinFurScales] makes you more than a little excited. You feel your breath start to grow heavy and the air starts to feel warm against your exposed body. Your arms ache as you strain against the restrictive bonds on your wrists.");
	output("\n\nTwo sharp nails press on the sensitive underside of your arm. You can’t help but squirm as they trail downwards, heading towards your tender armpit, your body starting to twist away from the contact on it’s own. <i>“Easy now. Move too much and I might nick you.”</i> You try your best to stay still, successful for the moment as you struggle against the urge to fight against the attack. Tessa’s fingers reach your armpit then shift their path along your collarbone. A third nail joins the others and their trail stops at your sternum. <i>“Your heart is pounding, can you hear it?”</i>");
	output("\n\nEven if you couldn’t before, with your senses sharpened you surely can now as it thumps wildly in your chest. You feel your [pc.legs] grow weak underneath you, your body feeling more sluggish by the minute. You really are starting to enjoy this. A loud sound off to the side startles you, Tessa’s nails still pressing tight against your chest. You feel a sharp pain, suspecting she scratched you with her wicked claws. <i>“Ow, what the hell?”</i>");
	output("\n\nWith her free hand Tessa strokes your cheek. <i>“Awww, sorry ‘bout that.”</i> The insincerity of her tone is thicker than honey. <i>“Damned tail has a mind of its own. Did I hurt you?”</i> Her hand on your chest pulls away and in its place you feel an unexpected warm wetness.");
	output("\n\nYou wince as her tongue and lips touch your scratches, but the soft and warm sensation only lasts a fleeting moment before it’s gone. Her kiss was a sloppy one, as you feel a wet spot still on your chest. The hand she has on your cheek runs along your jaw, her smooth scales tickling as they trail along your [pc.skinFurScales]. While focusing on the caress of her hand, you’re suddenly hit by something long and strong wrapping around your waist. Knowing the ovir’s anatomy, it’s quite clearly her tail.");
	output("\n\nThe strong appendage hugs you tightly, its scales pressing hard into your form. The tip of her tail wiggles against your [pc.hip], causing you to squirm at the touch. <i>“Like it when I hold you close?”</i> You feel the ovir’s warm breath tickle your neck as she talks. She leans in closer and you feel her soft lips brush against your throat lightly.");
	output("\n\nBefore you can reply she and her tail vanish off you, leaving you exposed and alone. A quick snap on your ass makes you yelp, Tessa’s tail delivering a strong smack to your backside, the sting radiating across your meaty flesh. You hear your play partner chuckle off to the side and you turn in her direction. <i>“Now that was mean,”</i> you admonish her weakly.");
	output("\n\n<i>“Oh [pc.name] honey. If you thought that was bad....”</i> You hear a metallic sliding sound. <i>“Then you don’t have a very good imagination.”</i> Tessa makes noticeable footsteps, positioning herself in front of you. <i>“Trust me. Don’t move.”</i>");
	output("\n\nDoing as you’re told, you brace yourself. Cold steel meets your neck, as Tessa’s knife presses against you. You can’t help but tug on the ropes in alarm, but remain as still as you can, quivering at the dangerous touch. Tessa rotates the knife slowly and deliberately, the flat of the blade turning over to the edge.");
	output("\n\n<i>“Do you have any idea how hot I get knowing I have your life in my hands?”</i> Tessa’s tone is throaty, her breathing slightly labored. <i>“Don’t worry. I’ll be careful not to cut you again... This time.”</i> You feel the knife drag along your neck, moving down to your collar. The cold blade feels wickedly sharp against you, not helped by how hot you feel. The blade moves to your shoulder, where Tessa presses it against you harder, the edge just on the brink of cutting you. Then it vanishes off you, making your body sing in its absence.");
	output("\n\nA long few moments pass with no touch. You call out to your silent friend but get no answer. Carefully you listen, and you quiver in anticipation. You hear her breathing on the far side of the room, faintly. You turn to her but are suddenly met with a light touch from her tail on your [pc.thigh].");
	output("\n\nHer tail lightly trails upwards, brushing against your crotch and briefly visiting your [pc.genitals]. Then you feel the unmistakable sensation of teeth on your jaw, Tessa’s sharp fangs grazing you as she nibbles at your chin. You lash out a bit, causing Tessa and her touches to withdraw. You hear her laughing behind you.");
	output("\n\n<i>“Oh Steele. This is going to be so much fun.”</i>");
	output("\n\n<b>Half an hour passes.</b>");
	output("\n\nYou struggle to stand, your [pc.legs] failing you. Tessa, stalking you still, is nowhere to be heard, and you have long since stopped trying to track her. Her touches seem random and without pattern. One minute it would be her knife and the next her soft wet lips. The blind sensations are killing you, her teasing going beyond what you are used to. Suddenly, the rope holding you upright goes loose and your arms fall free, causing you to lose your balance and fall on your [pc.ass]. <i>“What the hell?”</i> You pull off the blindfold and see Tessa standing in front of you, having just cut the rope with her knife.");
	output("\n\nTessa smiles and sheathes her weapon. <i>“That was fun Steele, but I think it’s time to call it.”</i> Her face is flushed and her voice heavy. <i>“Can you show yourself out? I have some stuff to take care of. And I suspect you do as well.”</i> She gives you a knowing look.");
	output("\n\n<i>“You mean we’re not going to-”</i> You huff and start to undo the bindings. <i>“Right. Got it.”</i>");
	output("\n\nThe white woman sighs and crouches down in front of you. <i>“Maybe next time, Steele.”</i> She give you a condescending pat on the head, like a child or pet. <i>“This was just play. Never said there would be any sex involved.”</i>");
	output("\n\nYou gather up your stuff and start to head out, feeling more than a little pent up. That woman sure knows how to be a tease.");
	
	flags["TESSA_FLIRT"] = 1;
	IncrementFlag("TESSA_SENSEPLAY");
	
	tessaTrust(5);
	pc.lust(25);
	processTime(60);
	addButton(0,"Next",mainGameMenu);
}

public function tessaNewIdea():void
{
	clearOutput();
	clearMenu();
	showTessa();
	
	output("<i>“I was thinking we might try something else.”</i>");
	output("\n\nTessa tilts her head, slightly intrigued. <i>“Something else? What did you have in mind?”</i>");
	if (tessaTrust()>= 80 &&pc.hasGenitals()&& flags["TESSA_FOOT"] == undefined) addButton(0,"Hands On",tessaHandsy,undefined,"Hands on","Literally if possible.");
	else if (flags["TESSA_FOOT"] == undefined) addDisabledButton(0,"Hands On"," Hands On");
	if (tessaTrust()>= 80 && flags["TESSA_ORAL"] == undefined) addButton(1,"Oral",tessaOral,undefined,"Oral","A little mouth action never hurt.");
	else if (flags["TESSA_ORAL"] == undefined) addDisabledButton(1,"Oral","Oral");
	if (tessaTrust()>=90 &&pc.hasGenitals() && flags["TESSA_ORAL"] != undefined && flags["TESSA_PCNEEDS"] == undefined) addButton(2,"My Turn",tessaPCNeeds,undefined,"My Turn","Promises should be kept.");
	else if (flags["TESSA_PCNEEDS"] == undefined) addDisabledButton(2,"My Turn","My Turn");
	if (flags["TESSA_H2H1"]!= undefined && pc.biggestTitSize() > 4 && CodexManager.entryViewed("Ovir") && chars["JADE"].hasTentacleNipples() && flags["TESSA_BREAST"] == undefined) addButton(3,"Her Breasts",tessaBreasts,undefined,"Her Breasts","Who doesn’t love boobs?");
	else if (flags["TESSA_BREAST"] == undefined) addDisabledButton(3,"Her Breasts","Her Breasts","You’ll need to know somebody who has gotten new nipples for their breasts as well as have read the Ovir Codex entry for this. Pretty complicated, but Tessa is a complicated girl!");
	if (flags["TESSA_H2H1"]!= undefined && pc.hasItemByClass(HoneyWine)&& StatTracking.getStat("contests/kiro drinkoff wins") >0 && flags["TESSA_DRINK"] == undefined) addButton(4,"Drink",tessaDrinkOff,undefined,"Drink Together","Can she say no to a drink?");
	else if (flags["TESSA_DRINK"] == undefined) addDisabledButton(4,"Drink","Drink Together","Maybe you should get some wine or prove you can hold your drink.");
	addButton(14,"Back",flirtWithTessa,undefined,"Back","Maybe not.");
}	
		
public function tessaHandsy():void
{	
	clearOutput();
	clearMenu();
	showTessa();
	
	output("You ask Tessa if she would be willing to be more hands on when the two of you play together.");
	output("\n\nTessa frowns a bit. <i>“What you mean, like literally use my hands?”</i> Her tone is about as sarcastic as you’ve ever heard her.");
	output("\n\nYou nod. <i>“That would be the idea....”</i>");
	output("\n\n<i>“No.”</i> She crosses her arms over the chest defiantly.");
	output("\n\nWell that was a short conversation. You can’t help but feel a little disappointed, and you’re sure it’s showing on your face.");
	output("\n\nTessa stares at you hard for a moment then sighs. <i>“God damn it. Look. You know I’m not super...”</i> She cuts herself off and thinks to herself a moment. <i>“How about the next best thing?”</i>");
	output("\n\nYou cock an eyebrow, curious as to what she is suggesting.");
	output("\n\nA naughty smirk crosses her face. <i>“Well... I am very light on my feet. You’ve seen it yourself. Imagine what else I can do with them.”</i>");

	//Unlocks Footjob Options
	flags["TESSA_FOOT"] = 1;
	
	addButton(0,"Next",flirtWithTessa);
}

public function tessaOral():void
{	
	clearOutput();
	clearMenu();
	showTessa();

	output("You ask Tessa if she would be willing to try going down on you.");
	output("\n\nTessa chuckles a bit. <i>“Oh, wow. Um, no.”</i> She sighs and leans against the bulkhead of her ship. <i>“No offence Steele, but I taste <b>and</b> smell with my tongue. So I’m a bit picky whose crotch I bury my face in.”</i> The white ovir rubs her lip with her thumb.");
	output("\n\nThe gesture reminds you of something you’d been meaning to ask. <i>“Those aren’t your natural lips right?”</i>");
	output("\n\nTessa freezes at the question and stares at you hard for a moment, her red eyes going narrow. After a tense moment she sighs. <i>“Not exactly. I’m not really sure how much of them are me or otherwise.”</i>");
	output("\n\nYou can’t help but push the issue at a vague answer like that.");
	output("\n\nTessa glares at you for a moment longer, then groans. <i>“Fine. Fuck. You win. I took some fucking Estrobloom when I was thirteen. Happy?”</i> She looks at your expression and opts to elaborate. <i>“Ovir don’t hit puberty until sixteen. All my human friends, or rather all my friends period, turned into sexed crazed teenagers well before that, and I still looked like I was in grade school. So, I took matters into my own hands. Couple years later puberty hit me like a truck anyways and they filled out even more.”</i>");
	output("\n\nYou can’t help but smile at that, imagining a tiny Tessa with enlarged blowjob lips. Tessa shoots you a glare, killing your smile.");
	output("\n\n<i>“You know what. If you want me to go down on you sure. I’ll do it. But first you’ve got to do something for me.”</i> Tessa smiles and licks her sultry lips. <i>“Eat me.”</i>");

	//Unlocks Going Down Option
	flags["TESSA_ORAL"] = 1;
	
	addButton(0,"Next",flirtWithTessa);
}

public function tessaPCNeeds():void
{	
	clearOutput();
	clearMenu();
	showTessa();
	
	output("You decide to remind your play partner that it’s your turn for some oral pleasure.");
	output("\n\nTessa winces. She clearly forgot all about that. Or at least made herself forget. <i>“Right... Can we raincheck that?”</i> Her tail swishes a bit but she seems to notice and forces it still.");
	output("\n\nYou shake your head, you’re not letting the ovir get off that easy. <i>“Deal’s a deal and you promised.”</i> She lets out a groan and rolls her eyes at that. You ask if that’s going to be a problem for her, she seems oddly tense even for her.");
	output("\n\n<i>“What? Fuck no. I’m fine.”</i> Tessa straightens herself out and composes herself. <i>“I’m just getting some déjà-fucking-vu.”</i>");
	output("\n\nYou ask her what she means by that and the white ovir seems to go a shade more pale. You both know she slipped up.");
	output("\n\n<i>“Nevermind.”</i> She takes a deep breath then gives you a lusty smile. <i>“I’m just a little flustered is all. Thinking about how good you’re going to taste.”</i> She takes a step closer to you, her puffy lips glistening. <i>“So don’t worry yourself. Let me show you what I can do.”</i>");
	output("\n\nYou decide to remember this slip up for later, but you’re not about to look a gift horse in the mouth. Not when that mouth can do other things.");

	//Unlocks Blowjob and Get Eaten Options
	flags["TESSA_PCNEEDS"] = 1;
	
	addButton(0,"Next",flirtWithTessa);
}

public function tessaBreasts():void
{	
	clearOutput();
	clearMenu();
	showTessa();
	
	output("You ask Tessa about her breasts.");
	output("\n\nThe white ovir frowns a bit. <i>“What about them?”</i>");
	output("\n\n<i>“Have you ever considered growing nipples of your own? I know a girl on Tavros who-”</i>");
	output("\n\nTessa shakes her head. <i>“I’ve given it some thought Steele. I’m not against it, but not right now.”</i> The pale woman sighs. <i>“I’m not the kind of girl who changes for people. If I do it, I want to make sure I do it only for me.”</i>");
	output("\n\nYou shrug a bit, knowing not to push the issue with this one. After a moment Tessa asks you a question. <i>“How did they turn out?”</i>");
	output("\n\nYou raise your brow at Tessa. <i>“How did what turn out?”</i>");
	output("\n\nTessa rolls her eyes. <i>“Your friends nipples. How did they turn out?”</i>");
	output("\n\nSilence fills the air a moment. <i>“They are...Fun. She’s enjoying them.”</i> You answer vaguely, hoping to not scare Tessa off of nipples for good.");
	output("\n\n<i>“Oh... Good.”</i> Tessa pauses, silence filling the air. You look around the room absentmindedly, the silence starting to get awkward. Your eyes return to Tessa, and you notice her gaze has fallen a bit below your face.");
	output("\n\n<i>“Hey Tessa?”</i> The ovir woman’s face snaps up to your eyes. <i>“Were you just...”</i> You think back to something you read about female ovirs once. <i>“Were you looking at my tits?”</i>");
	output("\n\nTessa glares at you, but her face turns red at the same time. <i>“What?! No!”</i>");
	output("\n\nYou smile at the ovir, taking a step close. Tessa’s face gets a shade brighter. <i>“Female ovirs love big tits right? It’s part of your biology.”</i> Tessa opens her mouth to reply, then shuts it. <i>“Do you... want to play with them?”</i>");
	output("\n\nTessa stares at you a moment, then her red eyes slowly shift down towards your chest again. <i>“...Yes”</i>");

	//Unlocks Breast Play Option
	flags["TESSA_BREAST"] = 1;
	addButton(0,"Next",flirtWithTessa);	
}


public function tessaDrinkOff():void
{	
	clearOutput();
	clearMenu();
	showTessa();

	output("You ask if Tessa would be interested in having a drink with you.");
	output("\n\nThe white woman smiles, but seems confused. <i>“Um, sure I guess? We could have stayed in the bar for that.”</i> She heads over to the mini fridge beside her couch. <i>“You’re fine with beer right?”</i>");
	output("\n\n<i>“Actually, I having something else on hand.”</i> You pull out a bottle of Honey Wine you had for just such an occasion.");
	output("\n\nTessa turns to you and squints at the bottle in your hand. <i>“What is that?”</i> She moves closer and takes exotic drink from you. <i>“Honey Wine?”</i> You watch the ovir’s red eyes read the label, her face twisting in confusion. <i>“Myr breast milk? Are you fucking serious?”</i>");
	output("\n\nYou assure her it’s much more than that, but the woman’s face remains skeptical. Attempting to convince her further, you continue. <i>“It tastes like candy. What have you got lose?”</i>");
	output("\n\nThe white woman rolls her eyes. <i>“I’ve told you, I drink beer. It’s kinda my thing in case you haven’t noticed.”</i> She examines the bottle again. <i>“Where do you even get something like this? Wait... Don’t answer that.”</i> She sighs and carries the bottle over to the couch. <i>“Alright then, let’s drink some candy flavored tit juice.”</i>");
	output("\n\nYou follow Tessa over and take a seat next to her on the couch. <i>“Do you have any glass-”</i> Tess cracks open the bottle and takes a swig of the viscous liquid. <i>“Or... that.”</i>");
	output("\n\nTessa sighs after her long pull, then holds the bottle out for you. <i>“Not bad.”</i> You take the bottle from the ovir, and take a hearty swig yourself. <i>“Alright. So, we’re on the couch drinking wine. Now what?”</i>");
	output("\n\nYou hand the bottle back to Tessa and think a moment. <i>“Ever play a drinking game?”</i> Tessa takes in another mouthful of wine, shaking her head no. <i>“Do you want to?”</i>");
	output("\n\nShe hands the bottle back, smirking. <i>“You play drinking games with all the girls?”</i>");
	output("\n\nYou hold the bottle a minute, thinking. <i>“No. Just the ones with... massive balls.”</i> You chuckle a bit and take another hit of the thick wine.");
	output("\n\nTessa rolls her eyes at that, not understanding the reference. <i>“Well. Did you win?”</i> She grabs the bottle from your hand, bringing it to her lips for more. You smirk and nod then grab the bottle from her, causing thick wine to spill on her chin. <i>“Hey! Fuck off!”</i> Tessa smacks your shoulder and stands up, wiping at her chin. <i>“Fuck. I’m going to have to wash my face now.”</i>");
	output("\n\nYou take another sip of the wine. <i>“Don’t you usually shower after we play anyways? Why not wait?”</i>");
	output("\n\nTessa turns and glares down at you. After a tense moment where you suspect she might draw out her knife again, her expression changes. <i>“Hey, this might be the wine talking... Or the beer... Or both... Well, both. But how about you join me?”</i>");
	output("\n\nYou set the bottle aside. <i>“Like after?”</i>");
	output("\n\nTessa grins. <i>“Or now.”</i>");

	//Unlocks Shower Sex Option
	flags["TESSA_DRINK"] = 1;
	pc.imbibeAlcohol(25);
	addButton(0,"Next",flirtWithTessa);
}

public function tessaFootjob():void
{
	clearOutput();
	clearMenu();
	showTessa();
	
	output("You decide to take her up on her foot offer.");
	output("\n\nTessa smirks, then saunters over to you slowly. Her walk is exaggerated, with far more wiggle than her normal stride. <i>“Oh my. Does the dear Captain Steele have a thing for feet?”</i> She taps her toe against the floor and chuckles. <i>“Alright then, let me get comfy.”</i>");
	output("\n\nYou watch her as she slowly makes her way to a chair off to the side, her hips swaying back and forth as she walks. She drags the chair over to the center of the room and takes a seat, crossing her legs as she does. She lifts her hand and beckons you over with a long white finger. <i>“Help me take my boots off.”</i>");
	output("\n\nYou move over to the seated ovir and get down low. Each boot has a zipper on the side, and seem simple enough to remove. You slide down the zipper on her right boot and pull it free. Her foot is as pale as the rest of her, you can’t help but notice her toes are just as clawed as her fingers. She giggles, seemingly understanding. <i>“Don’t worry about those. Sharp as they are, I won’t cut you. Promise.”</i> She smiles down at you. You’re not sure you believe her.");
	output("\n\nYou pull the other boot free and set it off to the side. Tessa kicks her feet a moment, and wiggles out her toes. <i>“Hm, feels good to be free.”</i> She leans back in her chair and sighs. <i>“Alright Steele, present your shit and let’s get this over with. ”</i>");
	if(pc.isNude())output("\n\nYou stare at the white woman a moment. <i>“What right here?”</i>");
	else output("\n\nYou take off your [pc.gear], stripping down naked. You stare at the white woman a moment. <i>“What right here?”</i>");
	output("\n\nTessa rolls her eyes. <i>“Yes, right here. What the fuck do you think the chair is for? Now hurry up. I’m going to have to wash my feet after this.”</i>");

	//Herms can choose which scene to see
	if(pc.isHerm())
	{	
		output("\n\n Would you rather Tessa play with your cock or your vagina?");
		addButton(0,"Vagina",tessaFootjobFemale,undefined,"Vagina","She’ll play with your kitty.");
		addButton(1,"Cock",tessaFootjobMale,undefined,"Cock","She’ll play with your sausage.");	
	}
	//Dudes just the dicking.
	else if(pc.hasCock())addButton(0,"Next",tessaFootjobMale);
	//Females play vag variant
	else addButton(0,"Next",tessaFootjobFemale);
	tessaTrust(5);
}

public function tessaFootjobMale():void
{	
	clearOutput();
	clearMenu();
	showTessa();

	output("Doing as she tells you, you position yourself at the foot of her chair, your [pc.cock] exposed to her. Unsurprisingly, you’re already rock hard. She looks down at you a moment, then smirks. <i>“Alright there big guy, let’s have some fun.”</i>");
	output("\n\nTessa reaches out with her right foot and gently presses her toes against your [pc.cockNounComplex]. Her scaly toes are warm against your cock flesh, her touch making it twitch on it’s own. Slowly, Tessa glides her foot up and down your length, gently dragging her smooth scales against your sensitive skin.");
	output("\n\nUp and down her foot slides, her pearl white scales against your [pc.cockColor] shaft. After a few slides up and down your length, she moves up to the tip, giving your [pc.cockHead] a pinch between her toes, making you quiver."); 
	if (pc.cLength() > 5)output("<i>“ Very nice. Very impressive. A piece of meat like this really shouldn’t be going to waste.”</i>");
	output("\n\nA sudden sharp poke at the base of your [pc.cockShape] shaft alerts you to the presence of Tessa’s other foot. <i>“Oops. Hope that didn’t hurt.”</i> Tessa’s chuckles softly, quite insincere. She glides her new foot slowly upward, the edge of her sharp nails dragging against your meaty flesh. You gasp and twitch at the sharp touch, but surprisingly the ovir woman doesn’t nick you in the slightest. She’s good.");
	output("\n\nHer other foot stays on your cock head, shifting a bit. With the ball of her foot she starts rubbing your [pc.cockHead] gently. The two sensations work in tandem, the sharp gazing of her nails and the gentle force of her other foot start to make your [pc.cockNounComplex] throb. Tessa sets into a steady pace, your breathing slowly growing ragged due to her efforts.");
	output("\n\n<i>“Getting excited I see? Well don’t blow your load just yet, I’ve still got another trick or two.”</i> No sooner had the words left her mouth she shifts her feet. Her right foot presses against your [pc.cockNounSimple] lengthwise, and her left hooks around and pulls back on you, pressing your meat and her right foot together. <i>“Hmmm. A nice [pc.cockShape] sandwich. With white scale bread.”</i> Tessa licks her lips. Whether she is teasing you or genuinely aroused you can’t tell.");
	output("\n\nShe squeezes you in between her feet, the pressure on your [pc.cockNounSimple] quite powerful. Tessa follows up by rotating her ankles, giving the pressure a twisting sensation. Then, making matters worse, she starts to wiggle her sharp toes, gently scratching her nails against your [pc.cockHead]. You begin to pant, the pressure of her milky white feet and the dangerous tickle of her clawed toes starting to become too much as sharp sensations of pain and pleasure rock through your cockmeat.");
	output("\n\nYou take a look at Tessa’s face and see she is flushed red. She’s clearly getting off to this, for some reason she would never divulge. She spots your gaze and smiles, showing off her sharp teeth. <i>“What? Can’t a girl have fun foot fucking somebody?”</i> Her feet shift again, and this time you suspect for a final time.");
	output("\n\nTessa moves both of her white little stompers and pinches your [pc.cockNounSimple] on either side, between her toes and balls of her feet, gripping you with each foot, causing you to gasp in pleasure. Without missing a beat, she starts to vigorously move her feet up and down, doing what could only be described as jerking you off. <i>“Come on Steele. Cum for me. Don’t leave a gal waiting....”</i>");
	output("\n\nHer feet are stronger than you could have imagined. Pinched between them you feel your engorged shaft grow hot, Tessa’s jerking motion pounding your meat better than a hand ever could. Your breath grows hot, and you feel your heart pounding in your chest. At this rate, your going to blow. And soon. You see the female ovir start panting. She’s losing steam, burning a lot of energy fast. You feel your cock pulse between the tight grip of her toes. <i>“For the love of god Steele, CUM!”</i>");
	output("\n\nAs if on command, your [pc.cockNounComplex] explodes, [pc.cumColor] seed spraying from your [pc.cockHead] and splattering all over Tessa’s white feet. You groan in pleasure as your [pc.cumVisc] load erupts from you, but Tessa doesn’t stop or slow, torturing your cock with her roughness. <i>“Fuck yeah, that’s the shit.”</i> Her breathing is laboured, almost as much as yours. <i>“That’s it, Steele. Let it all out.”</i> She milks your cock with enthusiasm, squeezing out every last drop she can.");
	output("\n\nTessa stops a few moments later, gasping for air. <i>“God damn that was a workout. Who the fuck needs a gym membership when you’ve got a <b>member</b> like that to work with.”</i> She smiles at her own pun them looks down at her feet. <i>“God damn it. Well I’ve got to take a shower now. You know the way out.”</i>");
	output("\n\nYou pull yourself to your feet, wobbling. <i>“Well, maybe I could stay and we could-”</i> You cut yourself off, Tessa’s red eyes going narrow at you. <i>“Or...That....”</i>");
	output("\n\nTessa drops her glare and stands up, cum soaked feet touching the steel floor. <i>“Maybe another time, [pc.name]. See you at the bar, yeah?”</i> She blows you a kiss then pads off to the bathroom, leaving a trail of cum footsteps behind her.");
	output("\n\nBefore she notices and makes you clean it up, you gather your stuff and show yourself out.");

	addButton(0, "Next", mainGameMenu);
	IncrementFlag("TESSA_FJ_MALE");
	pc.orgasm();
	processTime(60);
}

public function tessaFootjobFemale():void
{	
	clearOutput();
	clearMenu();
	showTessa();

	output("Doing as she tells you, you position yourself at the foot of her chair, your [pc.vagina] exposed to her. She looks down at you a moment, then smirks. <i>“Alright, little lady. Let me show you what I can do.”</i>");
	output("\n\nTessa reaches out with her right foot and gently presses big her toe against your [pc.clit]. Her scaly toes are warm against you and her touch makes you quiver. Slowly, Tessa rotates her toe, twisting her smooth scales against your sensitive [pc.clit].");
	output("\n\nShe presses against you lightly at first, but after a few moments she steps down, putting some force behind her single toe. You squirm, the sensation overwhelming and almost painful as shocks of pleasure hit you. Tessa chuckles to herself. <i>“I’ve barely touched you. Or is that cunt of yours that starved for affection?”</i>");
	output("\n\nBefore you can answer, Tessa shifts her toes, the sharp nail gently gazing you causing you to gasp out. <i>“Don’t move, or else this might get ugly.”</i> Trying your best to stay still, you nod slightly. The ovir’s sharp claw doesn’t linger long, and starts to glide up and down your wet folds. The sensation makes you quiver involuntarily, but Tessa doesn’t nick you at all. She’s good.");
	output("\n\nTessa’s other foot joins in, as she places her left foot against your clit, pressing against it firmly. She moves her foot slowly, her white scales tickling against you, making you shiver in pleasure. Her right foot and her nail continue to tease your labia, grazing against you. The two sensations together are strong, causing you to moan as pleasure rises within you.");
	output("\n\nWetness builds in your snatch, and Tessa’s movements help spread it around, especially on her feet. <i>“It’s getting awfully slippery down here. I might have to adjust my plan of attack.”</i> Tessa licks her lips, your [pc.cumVisc] wetness making her more than a little excited. Her feet shift and she lays her right foot directly over your cunt, then lays her left on top of her right. She presses down with both feet and starts to rub them up and down.");
	output("\n\nYour breathing starts to go wild, gasping for each breath of air. Tessa knew what she was doing. The pressure from both feet against you sensitive cunt flesh was intense, causing you to tremble. You look up at the white woman and see her normally pale cheeks are bright red. She was enjoying this, although you couldn’t really say why. Noticing your gaze, she smiles at you. <i>“Surprised, honey? Am I not allowed to like foot fucking you?”</i>");
	output("\n\nBefore you can answer she shifts her feet again. Her right heel presses down on your clit, and her left big toe pushes between your labia into your wetness, causing you to cry out. Another double attack. Her heel starts to rotate, slowly and with force against your quivering [pc.clit]. The invading toe does almost as much damage, sinking into your wetness, sliding in and out slowly. <i>“Alright Steele, time to finish you off.”</i>");
	output("\n\nThe two attacks continue, each foot working feverishly against your womanhood. The primary attack against your clit alone is enough to make you cum, the secondary is only added torture. You take a quick glance at Tessa and see her breathing hoarsely. This was taking more effort than it first appeared, and she wasn’t going to be able to keep it up. <i>“Come on. Do I need to ask nicely or something?...CUM!”</i>");
	output("\n\nShe didn’t need to ask twice. Your body convulses, and a deep gasping moan escapes your lips. Shuddering, your orgasm crashes throughout your body and [pc.cum] runs freely from your overstimulated cunt. Tessa doesn’t stop, and keeps up her efforts against your [pc.clit] and cunt. <i>“That’s it. That what I wanted to see. What do you say to another?”</i>");
	output("\n\nTessa shifts her feet again, reverting back to her old strategy of one foot on top of the other. Not wasting a moment, she goes into working them up and down, pressing on your womanhood with a good deal of weight. You cry out again, the new attack working too well and your body convulses again. The second orgasm shakes you more profoundly than the first, and you gasp out your lover’s name. She must like that, because she keeps up the attack until a third orgasm rocks you, this one making your voice crack when you nearly scream out in pleasure.");
	output("\n\nTessa stops after the third and pulls her sticky feet off of you. <i>“Damn. That last one kind of hurt my ears. You okay?”</i> Panting heavily, you offer your ovir friend a thumbs up instead of vocal confirmation. <i>“Good, ah shit. I’m going to be slipping and sliding like a dumbass. You can show yourself out right?”</i>");
	output("\n\nYou pull yourself to your feet, still panting like a dog in heat. <i>“Well, maybe I could stay and we could-”</i> You cut yourself off, Tessa’s red eyes going narrow at you. <i>“Or...That....”</i>");
	output("\n\nTessa drops her glare and stands up, cum soaked feet touching the steel floor. <i>“Maybe another time, [pc.name]. See you at the bar, yeah?”</i> She blows you a kiss then pads off to the bathroom, leaving a trail of cum footsteps behind her.");
	output("\n\nBefore she notices and makes you clean it up, you gather your stuff and show yourself out.");

	addButton(0, "Next", mainGameMenu);
	IncrementFlag("TESSA_FJ_FEMALE");
	pc.orgasm();
	processTime(60);
}

public function tessaOralLuv ():void
{	
	clearOutput();
	clearMenu();
	showTessa(true);


	output("You tell your pale lover that you’re ready to fulfill your end of the deal.");
	output("\n\nThe white woman thinks about it a moment. <i>“Oh? Well, I suppose it would be nice to do nothing for a change...”</i> Tessa shoots you a lewd smile. <i>“Alright. Let’s see what you can do.”</i>");
	output("\n\nTessa lifts her hands to her collar, fiddling with the zipper on the front of her suit. Slowly, she pulls it down, exposing her milky white chest and belly, and while her breasts stay hidden under the sides of the tight suit. You note she isn’t wearing a bra . <i>“I’ll be right back. Let me slip into something more... functional.”</i>");
	output("\n\nYour heart sinks a little bit. <i>“You could just get naked.”</i>");
	output("\n\nThe ovir woman stares at you a moment, her expression difficult to read. <i>“Another time.”</i> She slowly turns and heads towards her bedroom, leaving you alone in the ship’s main chamber. The door slides open a few short minutes later and Tessa emerges.");
	output("\n\nIn the place of her normal catsuit she instead is wearing an ill-fitting fuzzy pink robe. You note the sleeves come just below her elbows and the hem just above her mid thigh. The most unusual part of it is her chest, which while concealed, seems to take up most of the room inside of it. You can’t help but chuckle at the display.");
	output("\n\n<i>“Shut the fuck up, Steele.”</i> Tessa brushes past you. <i>“It’s fucking comfy, and I’ve had it since forever.”</i> While Tessa moves past, you get a look at her backside, and see the robe barely fits over her tail and more than a little cheek is showing. The ovir reaches back and attempts to adjust the robe, pulling it down slightly, only for it to loosen at the top, exposing even more of her ample cleavage. <i>“Fucking hell...”</i>");
	output("\n\nShe walks over barefoot to the far end of the room, towards a couch next to a mini fridge. Tessa sets herself down on the couch, her tail seemingly disappearing in between the cushions. She crosses her pale legs and sighs. <i>“Alright. I’m comfy.”</i>");
	output("\n\nYou move over to her and she motions for you to get down. When you don’t drop to the floor immediately, she rolls her eyes. <i>“What do you want a fucking pillow or something?”</i> Despite her tone, you get down on the ground in front of her, trying your best to get into a comfortable position.");
	output("\n\nThis close, you can see how smooth Tessa’s white scaly legs are, almost impossibly pristine. Before you know it, you reach out and touch the leg on top of the crossed pair, running your hand along it a moment. Realizing what you are doing, you pull your hand away, expecting Tessa to yell at you at least and kick you in the face at worst. When you look up and her red eyes looking down at you, wanting. <i>“Don’t stop....”</i>");
	output("\n\nYou touch her leg again and start slowly rubbing it, your fingers running up and down her smooth scales. Tessa sighs contently at your touch, seemingly enjoying the caresses. After a long few minutes, she uncrosses her legs, but keeps them together. <i>“Alright Steele. No hands for this part.”</i> Slowly she pulls her legs apart.");
	output("\n\nTessa’s snatch certainly is unique. While on a cursory glance it may look similar to a vagina, closer inspection reveals a few differences. First and foremost, it lacks the lips most vaginas are often associated with, appearing more like slit shaped hole. Just inside, you notice folds of sensitive looking flesh, which seem to be very stretchable. In addition, you can’t seem to locate a clitoris of any kind. You glance up and take a look at the ovir. Her expression is... Concerned? Afraid? You don’t have time to contemplate it as it shifts to an expression you <b>do</b> know. Annoyance. <i>“Is there a problem?”</i>");
	output("\n\nWhile you do use your mouth to answer, you don’t use words. You lean in and give her a kiss, right on her folds, all while keeping your eyes on hers. All her annoyance melts away in an instant and she smiles down at you lewdly. Without wasting any more time, you get to work.");
	output("\n\nDespite not being a vagina, Tessa’s cloaca functions similarly enough. It’s sensitive, it gets wet, and its core is a hole. The one aspect of it that surprises you most is just how wet it gets. Within seconds of your tongue starting to massage her, you are assaulted with a sweet, familiar juice and <b>a lot</b> of it. At least it tastes like a vagina.");
	output("\n\n<i>“Pro tip, Steele.”</i> You hear Tessa say, her tone soft but still somehow condescending. <i>“We ovir get as wet as a New Texan on prom night.”</i> You hear her chuckle, then sigh contently. <i>“It’s going to get messy.”</i> She wasn’t kidding.");
	output("\n\nA few short minutes pass and you feel her wetness all over your face and running down your chin. You push in a bit, and bury your face deeper into her folds. Up above you hear the ovir gasp softly. Whatever you’re doing, it’s working. However, you’re not completely clear on exactly what that was. While exploring her with your tongue, you confirm she indeed doesn’t have a clit of any kind. Attempting to get her to cum without one seems like a daunting task, with the added threat of drowning adding to the challenge.");
	output("\n\nEven so, Tessa moans softly. <i>“That’s it... Lick it. Hmmmmm, eat my cunt out.”</i> You keep licking away at Tessa’s so called cunt, clearly having some success. Her sweet fluids start to ooze out into your mouth, and you can’t help but drink in more and more of it. Around your face and cheeks you feel Tessa open up and expand, allowing you to push your face in more and more. You push in so far your cheeks press up tight against her crotch.");
	output("\n\n<i>“Noooo. More. That’s not enough.”</i> Tessa voice is thick and dripping with lust. Her hands reach down and grab your [pc.hairColor] head and pull you in tight against her. <i>“Deeper... That’s it....”</i> Struggling to breath now, you bury your tongue deep, trying your best to invade her as much as you can. Her slick girlcum flows over you, running freely down your face and neck. You inch your tongue in deeper, deeper and then....");
	output("\n\nTessa’s legs lift up and wrap around your shoulders, pinning you in place against her crotch. Her sharp claw like fingernails threaten to scalp you as she grips your head tightly. <i>“That’s it. Oh God. Oh <b>God</b>. Oh...”</i> You hear your lover gasp deeply, then her voice breaks into a sharp moan. Her cunt becomes a river, as more warm sweetness endlessly flows from her. You choke as it fills your mouth and struggle against her grip.");
	output("\n\nSensing your distress, Tessa releases her grip on you, causing you to fall backward. You cough up a bit of her girlcum and wipe your chin with your forearm. Glancing up at the white woman, you doubt the moniker is apt anymore as she is beet red. Heaving, her red eyes are closed tight and her cheeks flushed. Her chest rising and falling so fast her robe loosens more than a bit, showing off more of her impressive cleavage.");
	output("\n\n<i>“[pc.Name]...”</i> She pauses after just your name, gasping for more breath. <i>“That was exactly what I....”</i> She sighs deeply and opens her eyes, seemingly collecting herself. <i>“You have no idea how hard it is to find somebody who can do that.”</i>");
	output("\n\nYou wipe off more girlcum from your chin, then you notice it ran down your front. <i>“Make you cum?”</i>");
	output("\n\nTessa laughs, seemingly amused by your answer. <i>“Not pass out.”</i> She closes her legs and slowly stands, her knees wobbling. <i>“Well, what you said as well.”</i> You watch more of her sweet juices run down her legs. <i>“I need a shower.”</i>");
	output("\n\nYou pull yourself up, trying not to stare at her legs. <i>“Well, maybe I could stay and we could-”</i> You cut yourself off, Tessa’s red eyes going narrow at you. <i>“Right...That....”</i>");
	output("\n\nTessa drops her glare and crosses her arms over her chest, tilting her hips. <i>“Maybe another time, [pc.name]. See you at the bar, yeah?”</i> She goes to blow you a kiss then hesitates. <i>“I promise I’ll hold up my end of the deal.”</i> She smiles at you sweetly and you can’t help but believe her. She turns and walks off, leaving a trail of girlcum footsteps behind her.");
	output("\n\nBefore she notices and makes you clean it up, you gather your stuff and show yourself out.");

	addButton(0, "Next", mainGameMenu);
	IncrementFlag("TESSA_GONEDOWN");
	pc.lust(35);
	processTime(60);
	tessaTrust(5);
	pc.applyCumSoaked();
}


public function tessaPcOralIntroCunny ():void
{	
	clearOutput();
	clearMenu();
	showTessa();

	output("You decide to take Tessa up on her promise to you. You tell her such and give your crotch a lewd pat, feeling it already aroused and ready from watching the ovir’s plump ass wiggle on the way over.");
	output("\n\nYou notice the ovir tense up. <i>“Ah. Okay... Sure.”</i> She shifts her weight from one foot to the other. <i>“The couch should be fine, right?”</i> She gives you a look up and down. ");
	if(pc.isNude())output("<i>“Come on then.”</i>");
	else output("<i>“Well, take your clothes off first.”</i> You strip off your [pc.gear] and toss it off to the side. Tessa looks you over again. <i>“Alright, come on then.”</i>");
	output("\n\nYou follow her over to her couch and take a seat, only pausing briefly thinking about the love stains from last time. Tessa moves past the couch to the mini-fridge beside it, opening it up and extracting a beer. She pops it open and takes a swig, then sets it off to the side. <i>“I’m going to need a chaser. Like I said, I smell and taste with this thing.”</i> The ovir sticks out her notably long tongue, giving it a little wag as she does. You can’t help but notice a silver stud in her tongue you’ve never seen before.");

	flags["TESSA_ORAL_SCENE"] = 1;
	addButton(0,"Next",tessaPcOral,undefined,"Next","Continue the fun.");
}
public function tessaPcOralIntroBJ ():void
{	
	clearOutput();
	clearMenu();
	showTessa();

	output("You decide to take Tessa up on her promise to you. You tell her such and give your crotch a lewd pat, feeling it already aroused and ready from watching the ovir’s plump ass wiggle on the way over.");
	output("\n\nYou notice the ovir tense up. <i>“Ah. Okay... Sure.”</i> She shifts her weight from one foot to the other. <i>“The couch should be fine, right?”</i> She gives you a look up and down. ");
	if(pc.isNude())output("<i>“Come on then.”</i>");
	else output("<i>“Well, take your clothes off first.”</i> You strip off your [pc.gear] and toss it off to the side. Tessa looks you over again. <i>“Alright, come on then.”</i>");
	output("\n\nYou follow her over to her couch and take a seat, only pausing briefly thinking about the love stains from last time. Tessa moves past the couch to the mini-fridge beside it, opening it up and extracting a beer. She pops it open and takes a swig, then sets it off to the side. <i>“I’m going to need a chaser. Like I said, I smell and taste with this thing.”</i> The ovir sticks out her notably long tongue, giving it a little wag as she does. You can’t help but notice a silver stud in her tongue you’ve never seen before.");

	flags["TESSA_ORAL_SCENE"] = 0;
	addButton(0,"Next",tessaPcOral,undefined,"Next","Continue the fun.");
}

public function tessaPcOral ():void
{	
	clearOutput();
	clearMenu();
	showTessa();

	if(flags["TESSA_ORAL_SCENE"] == 0)
	{
		var x:int = largestCockIndexThatFitsTessaMouth();
	
		output("She lowers herself to her knees in front of you, taking a good look at your " + pc.cockDescript(x) + ". You notice her face slightly turn red. <i>“" + StringUtil.capitalize(pc.cockShape(x)) + ", hm? Well I can work with this no problem.”</i> She smiles, to herself you believe. ");
		if(pc.balls>0)output("<i>“Equipment seems familiar enough.”</i>");
		else output("<i>“Hmm. Well, this is a first for me, but shouldn’t be a problem.”</i>");
		output("\n\nTessa reaches out and gently runs a sharp nail along your already hard shaft, making you quiver. <i>“Already hard hm? Well that’s good. Makes my job much more straightforward.”</i> She shifts her hand and takes your " + pc.cockShape(x) + " cock in her fingers. <i>“Sorry, [pc.Name]. I’m going to try and make this fast.”</i> The ovir leans close, her face an inch away from your hard pole. Without a word, she sucks back in her throat, then spits out a large wad of saliva down into your waiting " + pc.cockHead(x) + ".");
		output("\n\nThen, like she was off to the races, Tessa’s hand starts pumping your shaft. Her scaled hand glides along your " + pc.cockColor(x) + " cock flesh, the saliva helping cut the friction even more. The ovir woman strokes you with quick wrist pumps, heating up your already warm member and making you gasp. All the while she keeps her eyes down on your crotch meat, not looking up at you. After a minute or two of pumping, Tessa leans in a bit further, placing her soft lips against your " + pc.cockHead(x) + " and planting a small kiss.");
		output("\n\nA second kiss follows, then a third that doesn’t leave your " + pc.cockHead(x) + ". You feel the first of your precum start to seep, drawn out by her soft kiss. Tessa’s pale lips spread open and she takes the first small portion of your blood engorged cock in her warm inviting mouth. Her hand keeps stroking away, no sign of slowing, although you feel her saliva start to dry on your shaft. Not missing a beat, new wetness slowly oozes from the ovir’s mouth, re-wetting your " + pc.cockNounComplex(x) + ", and allowing her quick pumping to continue. You can’t help but moan softly at the sensations, both her sinful mouth and her very efficient hand.");
		output("\n\nShe lowers her soft lips further along your hard veiny shaft, slowly taking more of you in. You think you hear her moan as she starts to push you further into her mouth, but a moan of your own makes it hard to tell. Her hand then disappears from your shaft, getting out of the way as the ovir attempts to take more of you into her mouth. ");
		if(pc.cLength(x)<5) output("Tessa does this with ease, your meat not even challenging her as she takes you all into her mouth.");
		else if (pc.cLength(x)<10) output("You feel Tessa slide you in further, your meat gliding along her lips. She takes you all in, seemingly with no discomfort.");
		else if (pc.cLength(x)<16) output("You feel Tessa slide you in further, your meat gliding along her lips. After a short while you think you hear her gag, but she impressively still takes you all the way.");
		else output("You feel Tessa slide you in further, your meat gliding along her lips. After a short while you think you hear her gag and she stops. Another gag follows, she’s clearly hit her limit.");
		output(" The white woman then looks up at you with her big red orbs, meeting your gaze. She’s showing off.");
		output("\n\nTessa holds you in her mouth for a long moment, then slowly pulls back, dragging her metal tongue stud along you, a feeling that makes your meat throb and twitch. Your [pc.cockNounSimple "+x+"] becomes wet with her saliva and her puffy lips feel pillowy against you as she slowly drags them along. Her eyes stay locked on yours, her expression difficult to read. That gaze of hers makes you throb more with excitement. When half your cock comes free from her lips, her hand returns, gripping your rod once again.");
		output("\n\nHer hand pumps at your " + pc.cockColor(x) + " shaft, while her head bobs up and down along the top of your thick veiny meat. Her tongue rolls around the base of your " + pc.cockHead(x) + " and you hear Tessa moan deeply in the back of her throat. She wasn’t just enjoying the taste of you, she’s loving it. Her tongue spins around your " + pc.cockHead(x) + ", licking at and up every drop of your [pc.cumFlavor] precum while her hidden stud runs along you, causing your sensitive flesh to tingle in pleasure. All while never taking you out of her mouth. You know she doesn’t mind your taste at all. You release a shaky breath, still looking down at the pale woman.");
		output("\n\nYou sink back, deeper into the couch, your head falling back and breaking eye contact. You feel your hot meat throb in your lover’s mouth as she works you. Her wrist keeps pumping away, sliding up and down your hot shaft, now slick with saliva. Minutes pass, the white woman not stopping or slowing at all, expertly and eagerly working at your " + pc.cockNounComplex(x) + ". Without thinking, you start bucking your hips, face fucking the cum hungry ovir as pleasure overtakes your mind. She responds by sucking at you harder and gripping your spit soaked rod so hard it hurts. You start to cry in pain but are stifled by your own lusty groan. You feel your [pc.balls] start to tense as your climax starts to draw near. If Tessa even noticed, she doesn’t show it. Her soft wet lips run up and down your length, the pierced tongue in her mouth massaging you with what you could only call a lustful hunger. You move your hips more, forcing yourself deeper into her waiting mouth. She doesn’t seem to mind, it just makes her suck harder.");
		output("\n\nYou head falls forward, looking back down at the white woman. Her eyes were still gazing up at you, silently begging. Those eyes want you to cum and they weren’t willing to wait. Her hungry red orbs push you over the edge. Your [pc.balls] churn, as your hot load erupts from your [pc.cockNounSimple "+x+"]. If Tessa had any plans to not swallow, she certainly didn’t show it. She buries her face as far as she can down into your lap, accepting your [pc.cum] with enthusiasm. You groan loudly as your [pc.cumColor] load fills her mouth and throat, feeling like the hungry cumslut is sucking out everything you have. You shake and loudly moan, as pump after pump of hot jizz passes from your burning cock and into her skilled waiting mouth. Tessa stops moving after a minute, then slowly pulls her face off of you and gasps for air. She tilts up her chin and smiles at you. <i>“[pc.CumFlavor].”</i>");
		output("\n\nTessa quivers, her face flushed and red. The white woman then looks around, trying to find something. She spots her beer and quickly grabs it, taking a long pull. <i>“Hmm, <b> fuck yeah</b>.”</i> The ovir licks her lips and sighs contently. <i>“God damn Steele, I might have to skip dinner now.”</i> Her eyes fall down to your still semi erect cock. She presses her lips together, staring at it intently.");
		output("\n\nYou speak up after a long pause. <i>“We can do it again.”</i> You reach down and stroke yourself. <i>“It won’t take me long to get ready.”</i> You give the ovir a smile of your own.");
		output("\n\nTessa stays silent a moment. <i>“No. That’s enough for me.”</i> Tessa sighs and pulls herself to her feet, taking another swig of her drink. <i>“I need to brush my teeth or something.”</i> Tessa stares off into the distance, her still red face giving you the impression that the <i>or something</i> she mentioned was likely going to be messy.");
		output("\n\nYou rise to your feet and sigh. You know the drill and gather your stuff. While getting ready to leave, you can’t help but notice Tessa watching you, sipping away at her drink. You move to the ships exit and hear Tessa call to you. Turning you see the ovir woman holding her beer in both hands, tail swishing behind her.");
		output("\n\n“If it’s alright with you. I think we should do that again....” She blushes. It was a funny way to say she liked it, but it was welcome.");
		output("\n\nYou smile and nod. <i>“Sure, I think that would be great. Wouldn’t want you skip any more meals now would we?”</i>");
		output("\n\nTessa’s expression changes and she scowls. You yelp and run out of the ship as Tessa hurls her still half full bottle at you, smashing it against the wall. You hear here call after you. <i>“Asshole! I’ll see you at the bar!”</i>");
	
		IncrementFlag("TESSA_BJS");
	}
	else
	{
		output("Tessa looks over at you and shifts her weight around. <i>“You know, if you get on your back...”</i> She cuts herself off and clears her throat. <i>“You should get on your back.”</i>");
		output("\n\nYou shrug a bit and reposition yourself on the couch, laying down with your head on the arm rest. Tessa moves in close and sits on the other end of the couch, looking over your body. She runs her fingers along the [pc.skinFurScalesNoun] on your legs, seemingly exploring you. Slowly, she repositions herself on the couch, while simultaneously spreading your legs apart.");
		output("\n\n<i>“Already a little wet, huh? Well that’s good, nobody likes dry pussy.”</i> Tessa smirks, examining your [pc.vagina]. <i>“Well, I think I can handle this.”</i> Her eyes shift up, looking you in the eye. <i>“As long as a cock doesn’t come sliding out at least.”</i> Tessa’s gaze drops back down and she leans in close.");
		output("\n\nYou can’t help but jump as Tessa touches you, her warm tongue gently licking your folds. You hear her chuckle from down between your legs. <i>“Sensitive, or just that horny? Whatever, I’m going to try to finish this fast.”</i> You then feel the ovir’s tongue press in a bit, touching her hidden silver stud against you as she goes right for your [pc.clit].");
		output("\n\nYou jerk your head back a bit as the pale woman’s tongue starts working away at you. She isn’t just writing the alphabet with her tongue, she’s writing poetry. Her movements are strong and precise, her long pierced tongue moving with something you could almost call grace. She’s done this before. You gasp, feeling yourself grow increasingly wet at your lover’s oral skills.");
		output("\n\nTessa’s licking shifts, her tongue starting to favor long licks along the length of your snatch. You glance down at the white woman and see her face is flushed. She clearly doesn’t mind your taste. A minute later, her eyes point up in your direction and a smile forms on the corners of her mouth. You return the smile, but then feel the ovir’s studded tongue start to press against you harder, causing you to gasp once more.");
		output("\n\nYou can’t help but tremble as the ovir tongue begins to press deeper between your folds. Each long hard lick runs upward, ending with a strong flick against your [pc.clit]. Slowly, Tessa starts to ramp up speed, going faster as the minutes slowly tick by. You bite your lip, the warmth of your cunt burning and you know you must be absolutely soaking down below. Examining the skilled ovir, you see with each lick she is lapping up your [pc.cumFlavor] girlcum, her face bright red. She’s drinking you in, and loving it.");
		output("\n\nTessa pushes her face deeper, her nose and chin pressing against you now, as her soft puffy lips kiss your womanhood. Her tongue continues to lap away at you, selfishly licking up all your sweet juices. You twist and moan at her work. Despite her greed, she’s still stimulating you. Her metal stuck tongue is going wild now, licking at your soaking cunt with fervor and hunger. The white woman pushes against your thighs, trying to spread them apart further as she presses tightly against you cunt. You gasp and moan, feeling a warm rush of pleasure throughout your body. Her attack is merciless.");
		output("\n\nYou struggled to form words. <i>“I’m going to-”</i> Your jaw goes loose and your head falls back, any attempt at sound vanishing. You silently scream, unable to form sounds as your body tenses and shakes with pleasure. Your quivering cunt tells Tessa exactly what is happening, and she stops her licking and instead starts to slurp up all your [pc.cumFlavor] girlcum brought on by your very intense orgasm. You gasp for air, finding your voice return to you. <i>“Cum...”</i>");
		output("\n\nYou quiver and gasp again, finding the insatiable ovir woman starting a new attack. <i>“No. I can’t, you need to give me a break-”</i> You moan loudly, ending any further protest. Your eyes fall back down to your pale lover and see her red orbs looking up at you. Tessa’s gaze is full of lust and something else. Hunger maybe, but you’re not in a position to inquire. You tense up and convulse again as a second orgasm starts to rock you.");
		output("\n\nMany minutes pass, and Tessa keeps up her hungry attack. After your fifth orgasm, her tongue stops and your cries of pleasure go silent, although you can’t seem to stop the shaking in your legs. Both of you pant, exhausted. Tessa pulls herself up, her face dripping with your juices. <i>“I think my tongues asleep.”</i> Tessa spoke with a small slurring lisp. She backs up off the couch and grabs her now warm beer, taking a long pull. <i>“Fuck, I over did it again.”</i> She turns and looks down at you, her face a [pc.cumColor] mess.");
		output("\n\nYou pull yourself up and catch your breath. <i>“That was... intense.”</i> You place your feet on the floor and rub your face as sweat drips from your forehead.");
		output("\n\nTessa smirks and takes another sip from her drink. <i>“Yeah, well I had to show you that you’re not the only one here who can eat cunt. Didn’t want to let you show me up.”</i>");
		output("\n\nYou roll your eyes and stand, collecting yourself and your things. <i>“Yeah, well you don’t have a clit I can work with.”</i>");
		output("\n\nTessa frowns, slightly annoyed at the jab. <i>“Fair point.”</i> She wipes at her chin with her hand. <i>“God damn. Alright. I need to clean up.”</i>");
		output("\n\nYou take another deep breath and get ready to leave. As you head towards the door you hear Tessa call out to you. Turning, you see the ovir woman holding her beer in both hands, tail swishing behind her.");
		output("\n\n<i>“If it’s alright with you. I think we should do that again....”</i> She blushes. It was a funny way to say she liked it, but it was welcome.");
		output("\n\nYou smile and nod. <i>“Sure, I think that would be great. Can’t let you think that your so called cunt can match the real thing now can we?”</i>");
		output("\n\nTessa’s expression changes and she scowls. You yelp and run out of the ship as Tessa hurls her still half full bottle at you, smashing it against the wall. You hear her call after you. <i>“Asshole! I’ll see you at the bar!”</i>");

		IncrementFlag("TESSA_LICKS");
	}
	
	pc.orgasm();
	processTime(60);
	tessaTrust(5);
	addButton(0, "Next", mainGameMenu);
}

public function tessaPcBreastPlayIntro ():void
{	
	clearOutput();
	clearMenu();
	showTessa(true);
	
	output("You tell Tessa you want her to play with your chest.");
	output("\n\n<i>“What?”</i> You notice the ovir’s tail start to wiggle. <i>“That’s... okay. Sure...”</i> Tessa looks at you closely, her red eyes sinking downward.");
	output("\n\n<i>“But...”</i> You cross your arms over your chest, obstructing her view. <i>“I want to play with yours as well.”</i>");
	output("\n\nTessa stares at you a moment, thinking it over. After a long silence, Tessa reaches for her collar, her fingers gripping her zipper. <i>“Fine. I can work with that.”</i> Slowly, she tugs it down, revealing more of her smooth white body. ");
	if(!pc.isNude()) output("<i>“You should strip as well.”</i> You do as the ovir suggests, removing your [pc.gear] and setting it off to the side. ");
	output("<i>“Meet me on the couch?”</i>");
	
	flags["TESSA_SHOWER_BREAST"] = 0;
	
	addButton(0,"Strip Tease",tessaStripTease,undefined,"Strip Tease","Experience Tessa’s strip tease.");
}

public function showerTimeIntroTessa ():void
{	
	clearOutput();
	clearMenu();
	showTessa(true);

	output("You tell Tessa you want to take her up on that shower.");
	output("\n\nThe white woman frowns and gives your idea a small snort. <i>“Hm. That so?”</i> Her frown cracks into a smirk. <i>“Alright, we can do that no problem.”</i> You can’t help but notice her tail wags behind her.");
	output("\n\nTessa’s eyes narrow, her tone going very serious. <i>“Don’t fuck with my products Steele. I take scale care very seriously, so I don’t want you sticking bottles where they shouldn’t go.”</i> You nod and her eyes relax. "); 
	if(pc.isNude()) output("<i>“Great. Well, you look like you’re already set to go huh?”</i>");
	else output("<i>“Well you can’t shower with all that. Strip.”</i> You do as the ovir suggests, removing your [pc.gear] and setting it off to the side.");
	output("\n\nTessa reaches for her collar, her fingers gently grasping her zipper. Slowly she tugs it down, revealing more of her smooth white body. <i>“Well, I guess I can’t shower like this either. You know where the shower is, you can go ahead.”</i>");
	
	flags["TESSA_SHOWER_BREAST"] = 1;
	
	addButton(0,"Strip Tease",tessaStripTease,undefined,"Strip Tease","Experience Tessa’s strip tease.");
}

public function tessaStripTease ():void
{	
	clearOutput();
	clearMenu();
	showTessa(true);

	output("You smile and shake your head. <i>“I think I want to watch you strip first.”</i>");
	output("\n\nTessa rolls her eyes, lowering the zipper to her navel. She runs her hands up her sides, showing off her hourglass figure and womanly frame, then trails them back down along her front. <i>“Like what you see, Steele?”</i> Her hands move back up to her chest, roughly squeezing her large tits through her suit. <i>“Any excuse to get me naked, hm?”</i>");
	output("\n\nBefore you can answer, Tessa tugs at the sides of her suit, letting her large chest spring free. She smirks, watching your gaze focus on her well formed tits. She slowly pulls her suit off her slender shoulders, freeing her arms as well, and lets the top half of the suit fall free, her whole upper body exposed down to her belly. <i>“Now who’s staring Steele?”</i>");
	output("\n\nYou blush, Tessa’s accusation right on the mark. The exposed ovir smiles, tilting her hips back and forth, while rubbing her hands along her bare upper body. The sultry white woman knows how to move, and exactly how to make every curve in her body dance. After a moment, her hands trail down, slowly unzipping her boots and pulling them off. <i>“Ready for the rest of me?”</i> You nod, causing the white woman to giggle at you playfully as her hands slowly tug at her suit’s waist, pulling it down like a pair of tight pants.");
	output("\n\nShe kicks the suit to the side and stands before you naked. She is pure white and her scales shine brightly. Your eyes explore her and she slowly turns around, showing off her round backside and powerful tail. The albino ovir looks to you like she’s made of marble, cut to perfection, with not a single blemish to be seen. Tessa runs her hands over herself, showing you every curve of her figure. She caps it all off by running her fingers over her snatch, giving you a daring wink.");

	addButton(0,"Next",tessaBreastPlayAndShowerSex,undefined,"Next","Continue the Fun");
}

public function tessaBreastPlayAndShowerSex ():void
{	
	clearOutput();
	clearMenu();
	showTessa(true);
	
	if (flags["TESSA_SHOWER_BREAST"] == 0)
	{
		output("<i>“Chest only, Lover. Nothing else.”</i> You swallow audibly, then nod your head. Tessa smirks and turns, heading over to the couch, her very round backside wiggling sinfully as she walks. She doesn’t even need to ask you to follow you.");
		output("\n\nThe two of you reach the couch, with Tessa sitting on the far side away from you. You give the woman a naughty smile, then ask her. <i>“So, ready to pla-HEY!”</i>");
		output("\n\nTessa jumps on you like a predator, her hands immediately going straight for your chest. ");
		if(pc.breastRows.length > 1)output("The ovir seems to target your [pc.biggestBreastDescript].");
		else output("The ovir targets your [pc.chest].");
		output(" Her hands grab at you roughly, her clawed fingers pressing tightly against your sensitive mounds, causing you to cry in discomfort. <i>“Hm, these things have been driving me crazy.”</i> Tessa grips you, her nails almost digging in. <i>“Hope you like it a little rough.”</i>");
		output("\n\nYou wince in pain, but decide to return the favor, not letting her win that easy. You reach out, roughly grabbing at the lusty ovir’s soft and exposed melons, giving them a squeeze of your own. Tessa gasps, caught off guard by your attack. You lean in close, whispering to the wild woman. <i>“Hope you don’t mind it either.”</i> You feel Tessa’s grip loosen.");
		output("\n\nYour hands feel the soft mounds on the pale woman. You jiggle and bounce them around, getting a feel for and finding her very fun to play with. Tessa whines, her face going red. <i>“Hey... You can’t have more fun than me...”</i> The ovirs hands start to massage you in return, all traces of aggression gone from her touch. Her scaled fingers work along your [pc.breasts], playing and teasing them much in the same way as you are doing to her.");
		output("\n\nAfter a few minutes of teasing, Tessa gets curious. Her thumbs move in unison, both attacking your [pc.nipples] at the same time. You gasp, the sensation making your face grow warm. <i>“Like that huh, Steele?”</i> Tessa’s tone is playful, her confidence returning. <i>“Guess I’m not the only one with a soft underbelly.”</i> In response you give the white woman’s chest a hard squeeze, causing her to gasp lewdly.");
		output("\n\nThe ovir growls, her aggression returning. In a swift motion she knocks your hands away and pushes you back, falling to the couch as Tessa dives after you. You let out a small yip as you fall then a much larger cry as Tessa’s mouth attacks your left [pc.nipple]. You moan deeply, Tessa sucking at your tit like a hungry babe, her hands massaging both of your [pc.breasts] roughly. Her body presses down against yours, her scales rubbing against your now hot [pc.skinFurScalesNoun]. You feel her cunt dripping wet juices on you, your [pc.crotch] starting to burn as a result.");
		output("\n\nTessa switches to your other breast, sampling it like she did the first. She pinches your free nipple with her left hand, causing you to squirm underneath her. Her soft mountainous chest rubs against your abdomen, pressing against you tightly, causing you to sweat. She has you pinned, and is sucking away at you. ");
		if(pc.isLactating())output("You feel her draining your [pc.milkyNipples], seemingly enjoying you for all you’re worth. ");
		output("Suddenly, she starts to move, the ovir gyrating her body against you, pressing herself against your [pc.crotch].");
		output("\n\nYou moan aloud, feeling her attack pushing you to the edge. The ovir is trying to make you cum, and she’s succeeding. You feel your sex burn as your climax draws near, the white woman sucking at your chest ravenously, and her clawed fingertips working at your soft breast flesh. Before you pop, Tessa releases you, scooting herself up and pressing her large white chest against your sweaty well worn tits. She bares her weight down, pressing her tits against your own, the four melons squishing together in a cluster of sensitive flesh.");
		output("\n\nTessa’s cunt is directly on top of your own sex, and you feel her warm juices ooze onto your crotch. You let out a loud gasping moan as your climax hits, your [pc.cum] blasting all over Tessa’s body. [pc.CumVisc] fluid erupts from your [pc.groin], and you feel Tessa press her sex against you. Her soft warm chest is tight to your body, and you struggle to breath under her, gasping and moaning in your sticky pleasure.");
		output("\n\nTessa rolls off of you a moment later, allowing for a rush of air to fill your lungs. Staggering off to where she discarded her suit, you hear her sigh in pleasure. <i>“God damn, [pc.name]. That was something else.”</i> She scoops up her suit and turns to you, her lap covered in your [pc.cum.] <i>“Was that good for you?”</i>");
		output("\n\nYou look down at yourself. Tessa covered you in her wetness, so much of it you suspect the ovir might have had an orgasm herself. You stand up, wiping off as much of the fluid as you can. You hear the white woman chuckle, causing you to turn back to her. <i>“That was great Steele, seriously... Thank you... It means alot to me that you wanted to...”</i> Tessa blushes, her tail wagging behind her slightly. <i>“It just means a lot.”</i>");
		output("\n\nTessa turns and leaves, heading into her bathroom. You stand there a minute, dripping wet still, waiting for a better goodbye. You sigh, collect your things and head out. At the very least you got a thank you. Coming from Tessa, that meant a lot.");
	
		IncrementFlag("TESSA_BREASTPLAY");
	}
	else
	{
		output("<i>“Remember Steele, the plan is to get <b>clean</b>.”</i> You swallow audibly, then nod your head. Tessa smirks and turns, heading into the bathroom, her very round backside wiggling sinfully as she walks. She doesn’t even need to ask you to follow you. You enter the bathroom and take a look around. Her shower is a bathtub, with a hot pink shower curtain and a rack full of lotions and oils stuck to the wall. She really does take her scale care seriously. You double take back to the shower curtain and stare at it.");
		output("\n\nYou mutter under your breath. <i>“Pink?”</i> Looking around more, you also notice pink towels... and a pink bath mat... and a pink toothbrush. <i>“What the fuck...”</i>");
		output("\n\n<i>“Did you say something?”</i> Tessa turns to you. Based on her expression, she didn’t hear what you said. You wave her off and the ovir woman shrugs, not letting it bother her. She pads over to the tub and bends over to turn the water on, giving you a view of her pucker that makes your crotch pulse with excitement. <i>“Hope you like it hot.”</i> Tessa turns her head and looks at you over her shoulder, her lips curled in a devious smile. <i>“And I’m not just talking about the water.”</i>");
		output("\n\nA few moments pass and the water starts to steam, the whole bathroom becoming humid. Tessa feels the hot spray with her hand and nods in approval. Wasting no more time, the white ovir steps into the tub, pulling the curtain closed behind her. You stand there and watch a moment, seeing a near perfect silhouette of Tessa through the pink curtain, her picture perfect curves on full display. Tessa stands directly under the water, running her fingers through her hair for a few moments until it goes flat against her scalp. She then starts moving her hands along her body, spreading the hot water around in a very thorough but showy manner.");
		output("\n\nYou hear her call to you from the other side of the curtain. <i>“Come on in, [pc.name]. I’m already wet.”</i> You smile, slowly moving towards the curtain, feeling the steam of the water growing more intense as you draw near. As you reach for the pink barrier you see it opens up for you, Tessa using her powerful tail to pull it to the side. She smirks at you, water running down her sleek white body. <i>“Glad you could join me.”</i>");
		output("\n\nAs you step into the tub Tessa moves in on you, wrapping you up in her arms and pressing her hot wet body against your [pc.skinFurScalesNoun]. Her clawed hands move to your backside, scratching against you lightly, while her soft chest presses against your own. Slowly she spins, guiding you with her, positioning you directly under the shower head. The water burns at you, with its heat a bit more than what your used to. You gasp in discomfort, causing Tessa to giggle in your ear. <i>“Don’t pussy out on me now...”</i> The ovir woman releases you from her grasp, taking a step back. <i>“We haven’t even washed each other yet.”</i>");
		output("\n\nTessa turns to her rack of bottles, pulling two off and handing you one. You glance down at the label, noting it to be some high-end scale care product. Your eyes shift to the bottle in her hand, recognizing it as a much more general multi purpose body wash. <i>“You do me and I do you?”</i> Tessa pops open the bottle and pours a very generous amount of the thick goo in her hand. You smile, and squirt an equally generous amount from the bottle she gave you into your own palm.");
		output("\n\nThe ovir must have been serious about washing, as her hands travel everywhere along your exposed body. Her smooth scaly fingers, suds up the body wash, explore your form, spreading the foam and rubbing it in well, her touch making you tingle. You return the favor in kind, spreading Tessa’s expensive wash all over her pure white scales. Running your hands along the female ovir’s perfect hourglass figure makes your [pc.crotch] pulse with excitement, your pleasure rising. Despite yourself, you find your hands travelling to areas where there are breaks in her smooth scales, first and foremost her impressive chest.");
		output("\n\nTessa lets out a lewd moan as your fingers grasp her soft tits, working to wash with enthusiasm. The white ovir returns the favor, her fingers moving along your [pc.chest] and giving your [pc.nipples] a hard pinch. You wince and gasp at her rough touch, giving her chest a tight squeeze in relatilation. Tessa’s nearly jumps at that, the white woman letting out another lusty moan at your grip. The ovir’s hands start to slide downward, her fingers gliding along your body towards your sex, teasing you as it trails down.");
		if(pc.cockTotal() == 1) output("\n\nTessa’s hand grips your hot [pc.cockColor] piece of meat, her fingers still covered in suds.");
		else if(pc.cockTotal() == 2) output("\n\nTessa’s hand brushes along [pc.eachCock] but her settles on and grips [pc.oneCock], her fingers still covered in suds.");
		else ("\n\nTessa’s hand clamps down on your [pc.vagina], her fingers still covered in suds.");
		output(" Without a word, Tessa’s starts rubbing you, working her hand roughly against your ");
		if(pc.hasCock())output("[pc.cockNounSimple]");
		else output("[pc.vagina]");
		output(". You gasp and moan at the woman’s touch, the warm soap on her hand causing your crotch to tingle and burn with pleasure.");
		output("\n\nRoughly, you turn Tessa and push her against the shower wall, causing the rack of bottles on the wall to shake violently. Tessa gasps at your forcefulness, then moans as you clasp your hand tightly on her ovir cunt, more than eager to return the favor. You press yourself against the white woman, her chest squishing tight against your own. Your respective arms bump into each other, the two of you both eagerly rubbing the other as hot water rains down on you both, almost scalding you. Tessa growls playfully and you feel her tail slide along your backside giving your rump a hard smack. You cry out and Tessa attacks.");
		output("\n\nThe ovir woman spins, changing positions with you and pressing you against the wall instead. Her grip on you tightens, her soapy fingers burning at your sensitive ");
		if(pc.hasCock())output("[pc.cockNounSimple]");
		else output("[pc.vagina]");
		output(". She pushes against you, pressing her tail against the far side of the tub for leverage, threatening to crush you against the wall. You gasp for air, the voluptuous woman’s large bust pushing against your chest, almost winding you. You do the only thing that you can think of: You slip your fingers inside the wet and warm cunt of the pale woman.");
		output("\n\nTessa shudders in pleasure, distracting her enough that her tail gives some slack and the pressure against you vanishes, air rushing into your lungs freely. Her hand twitches, her grip on you going very tight for a moment. You slide your fingers in and out of the ovir’s hole, massaging her on the inside as effectively as you can at the awkward angle. Tessa quivers against you, shaking and gasping at your invasive touch. Her hand works at you still, her fingers tight as her wrist flicks back and forth stroking you. She bares down against you again, the warmth of her soaking wet body pressing on your chest. ");
		output("\n\nYou hear the white woman gasp for air and shake, her sex becoming tight around your nimble fingers as an orgasm rocks through her. Not far behind, you feel your ");
		if(pc.hasCock())output("[pc.cockNounSimple] throb, as an orgasm of your own shakes you, making you groan in pleasure");
		else output("[pc.vagina] quiver, as you tense up moan in pleasure, your own orgasm running through your body");
		output(". [pc.cumVisc] cum erupts from you, coating Tessa’s hand and arm as her white fingers go limp against you. You extract your own cum soaked fingers from the ovir, letting the white woman have a reprieve from your attack. Tessa shifts back in the tub, her breath heavy. <i>“I... We need to rinse this off.”</i>");
		output("\n\nThe two of you wash yourselves after that, getting all traces of cum and soap off of your respective bodies. Tessa finishes first via her hogging the water, she steps out of the shower and leaves the room. You finish a few minutes after and return to the main room of the ship.");
		output("\n\nYou find Tessa drying her hair with a pink towel and wearing her old pink fuzzy robe. She turns to you and smiles, seemingly in a very good mood. <i>“That was great Steele, seriously... Thank you... It means alot to me that you wanted to...”</i> Tessa blushes, her tail wagging behind her slightly. <i>“It just means a lot.”</i>");
		output("\n\nTessa turns and leaves, continuing to dry her hair as she heads to her bedroom. You stand there a minute, dripping wet still, waiting for a better goodbye. You sigh and collect you things, heading out. At the very least you got a thank you. Coming from Tessa, that means a lot.");
		
		IncrementFlag("TESSA_SHOWER");
	}
	addButton(0,"Next",mainGameMenu);
	pc.orgasm();
	processTime(60);
	tessaTrust(5);
}
