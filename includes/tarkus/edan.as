/* Male leithan mercenary called Edan that you meet in the Mess Hall on Tarkus. Penchant for using the PC as a cumdump, exhibitionism, and occasional group sex. Possible companion?
 * By Wsan. Keep the taur agenda strong!
 * Maybe the least elegant code of all time.
 * 
 */

public function edanHeader(nude:Boolean = false):void
{
	showName("\nEDAN");
	if(!nude) showBust("EDAN");
	else showBust("EDAN_NUDE");
	author("Wsan");
}

public function edanRoomDesc():void
{
	author("Wsan");
	
	if (flags["EDAN_MET"] == undefined) 
	{
		
		output("You see a massive leithan sitting next to some animated raskvel, their eager chittering a juxtaposition to his calm silence as he eats. His eyes flicker to you for a moment before he returns to his meal.");
		addButton(0, "Leithan", talkToEdan, undefined, "Leithan", "Say hello to the Leithan.");
	}
	else if (flags["EDAN_FUCKED"] == undefined)
	{
		output("You see Edan sitting next to some animated raskvel, their eager chittering a juxtaposition to his calm silence as he eats. His eyes flicker to you for a moment before he returns to his meal.");
		addButton(0, "Edan", talkToEdan, undefined, "Edan", "Say hello to Edan.");
	}
	else if (flags["EDAN_FUCKED"] == 1)
	{
		output("You see Edan sitting next to some animated raskvel, their eager chittering a juxtaposition to his calm silence as he eats. His eyes flicker to you for a moment before he returns to his meal. You think you see a slight smirk playing over his face.");
		addButton(0, "Edan", talkToEdan, undefined, "Edan", "Say hello to Edan.");
	}
	else if (flags["EDAN_FUCKED"] == 2)
	{
		output("You see Edan sitting next to some animated raskvel, their eager chittering a juxtaposition to his calm silence as he eats. His eyes flicker to you for a moment, and he crooks a finger to beckon you over before returning to his meal. His casual hold over you turns you on a bit...");
		addButton(0, "Edan", talkToEdan, undefined, "Edan", "Go say hi.");
		pc.changeLust(5);
	}
	else if (flags["EDAN_FUCKED"] >= 3)
	{
		output("You see Edan sitting next to some animated raskvel, their eager chittering a juxtaposition to his calm silence as he eats. He gives you a nod and you immediately heat up a bit, the memory of being fucked like you’re some kind of masturbation toy fresh in your mind and all too appealing.");
		addButton(0, "Edan", talkToEdan, undefined, "Edan", "Go say hi.");
		pc.changeLust(15);
	}
}

//Story selector
public function edanStorySelector():void
{
	if (rand(4) == 0)
	{
		output("\n\nEdan leans back and runs a hand across the faded scars on his face.");
		output("\n\n<i>“Have you ever heard of the Black Void, Steele? They’re a pirate group that operate outside of the U.G.C.’s jurisdiction. Honestly, I’d be surprised if you hadn’t heard a couple of stories given their notoriety. They’re different from regular pirate and mercenary groups, though. Roving slavers, mostly targeting the fringe worlds,”</i> he says, waving a hand around. <i>“I was out there once when I was younger and dumber, thinking bounty or mercenary work would be plentiful in the less secure territories. Well, I was right, and for a while it went great. Lots of money to be made in protecting U.G.C.-funded colonists, but you really earn the money.");
		output("\n\nAt some point I was taking a break in an inn. Laughing, drinking, talking to pretty girls. Well, all of that came to a crashing halt when the Void guys showed up. They’re a striking presence in person, what with the black and red coloration on their armor. Anyway, all hell broke loose the moment they raided the inn. See, living on the fringe worlds, everyone knows who the Black Void are and what they do. You just live in a kind of perpetual hope that they won’t show up on <i>your</i> world, in <i>your</i> town. So there was a lot of screaming and running. Surprisingly little gunfire, but only if you don’t know their MO. They don’t slaughter people wholesale, they just take them alive and sell them. From what I’m told, you’d be better off if they did just kill you.”</i>");
		output("\n\nHe picks through his food a bit before continuing.");
		output("\n\n<i>“So, anyway, a lot of panic. A few people drew weapons, but they were gunned down pretty quick. They’re not one of the biggest pirate groups for nothing. I made a getaway through a wall - being this big has its advantages, and the place was only made of wood anyway. I’m not stupid. Let me tell you, Steele, if you ever encounter them in your travels, don’t fight unless you have absolutely no other options. The concept of mercy is alien to them.”</i>");
	}
	else if (rand(4) == 1)
	{
		output("\n\nEdan looks at you and grins.");
		output("\n\n<i>“You ever been to Poe A, Steele? It’s a hell of a planet. They throw some massive festival there every year and it goes on for a month. An entire month! It’s not just any regular festival either, it’s one of the most debauched things I’ve ever seen. There were girls getting fucked right on the streets. Guys too, actually, and herms. There’s something for everyone there. I spent my fair share of time indulging in the festivities, but ended up inside some inn at some point. Weirdest thing was, it was even crazier than the outside!”</i>");
		output("\n\nEdan spends the next few minutes detailing his lustful encounters with a female centaur (<i>“Genuine, as far as I could tell!”</i>), three ausar girls, and a gryvain in heat (<i>“I hope to one day have a bitch that lusty and willing,”</i> He says with a wistful sigh). As he delves further into his sexual conquests you find yourself getting somewhat fidgety and red-faced, then he seems to remember something at the end of his story.");
		output("\n\n<i>“Oh. If you ever see a pink-haired girl while you’re there, be careful.”</i>");
		output("\n\nNo more information about the girl appears to be forthcoming.");
	}
	else if (rand(4) == 2)
	{
		output("\n\n<i>“Have you met the Gabilani, Steele? There’s a couple of them around, like the guy on the other end of town. He’s alright, but a total crackpot. Can you believe he thinks there’s going to be a robot uprising? The other is a pool manager or something to the northwest. I didn’t really look into it. Anyway, you might not know it looking at them but they’re fucking insatiable. I ran into some off-world, and apparently, in their culture size is king. Anything big gets their attention - they believe the longer a name is the more important you are, the bigger your assets the more attractive you are, and so on. Well... needless to say,”</i> He says with a sweep of his arm down his chest, <i>“They liked me. They were like little cocksucking limpets, I swear. It was impossible to keep them away, and in the end I was just walking around with a couple hanging off my cock and one fucking herself on the end of it like some kind of spitroast.”</i>");
		output("\n\nHe shakes his head in utter disbelief.");
		output("\n\n<i>“It’s not like having a warm cocksleeve was awful, but it was easily the most ridiculous situation I’ve ever been in.”</i>");
		output("\n\nYou’re inclined to agree.");
	}
	else if (rand(4) == 3)
	{
		output("\n\nEdan looks around and begins talking in a low voice.");
		output("\n\n<i>“Have you ever heard of the Followers of The Tear? I met some once in some backwater shithole called Inzmuth. Creepiest motherfuckers I’ve ever encountered, and I’ve seen a fair bit of the galaxy. What really weirded me out the most was that it’s a coastal village, but they don’t eat fish. I never really got a straight answer about that one, they’re a pretty silent bunch. It seems innocuous, but it was just one of the many things that made the place just feel <i>wrong</i>.”</i>");
		output("\n\n He stops to eat, and you think maybe he’s done talking before he starts up again.");
		output("\n\n<i>“There was something really strange going on there. People disappeared randomly, and I could swear I heard chanting during the nights. I say nights, but it was really only like two. I hightailed it the fuck out of there as soon as I could, before they decided the resident leithan was food or some shit. Caught a U.G.C. shuttle to a neighboring planet and never looked back.”</i> He shudders and goes back to eating.");
		output("\n\nYou make a mental note to avoid this place, should you ever encounter it.");
	}
	else
	{
		output("\n\n<i>“So Steele, you must know all about the planet rush. I mean, we’re on one of the rush planets right now. They’re still announcing all the results, though. I’ve heard one of the most recent ones found is a wartorn shithole populated by ants. Haven’t been out there myself yet so I’m just going on rumors, so it’s hard to discern the truth of what’s really going on down there. Apparently there’s talk of the Confederate just glassing the planet. I might have to make the trip down there myself. A wartorn shithole is exactly where a mercenary like me wants to be.”</i>");
		output("\n\nHe smiles wanly after this last statement, but continues. <i>“That’s not the only rumor, though. I’ve been hearing some about an ice planet too, but they’re so vague I can’t be sure it even exists. Plus, I don’t think I’d want to hang out on an ice planet in the first place. Then again, I’ve heard New Canada has some leithans on it so who knows.”</i>");
	}
}

//Main menu for Edan.
public function talkToEdan():void
{
	clearOutput();
	clearMenu();
	edanHeader();
	
	if (flags["EDAN_MET"] == undefined)
	{
		output("You sit down across from the leithan, realizing that although he looked big from afar he’s positively huge from this close. He’s handsome in a rough manner, a man who’s seen a lot of life. You open to your mouth to greet him but you’re cut short by what feels like a minor earthquake ");
		if (pc.gooScore() > 3) output("jiggling your gooey body around.");
		else output("in your bones.");
		output("\n\n<i>“Hey there, kid.”</i>");
		output("\n\nIt takes half a second for you to figure out that the rumbling came from the leithan, rather than some kind of seismological event.");
		output("\n\n<i>“Hey there,”</i> you say, then indicate the amount of food heaped on his plate. <i>“You hungry?”</i>");
		output("\n\n<i>“Always am,”</i> he grins. <i>“Edan. You?”</i>");
		output("\n\n<i>“[pc.name] Steele,”</i> you reply.");
		output("\n\n<i>“Steele...”</i> Edan muses. <i>“Is that with an E? Like the mining company?”</i>");
		output("\n\n<i>“That’s me. My old man wanted me to see what the galaxy has to offer, so here I am.”</i>");
		output("\n\n<i>“Huh,”</i> he eyes you across the table. <i>“So you’re the " + pc.mf("heir", "heiress") + ", eh?”</i>");
		output("\n\n<i>“Do you know my family?”</i> you ask, curious to see if he’s going to make a big deal of it.");
		output("\n\n<i>“Anyone with a vested interest in making money on a large scale knows the Steele family, kid,”</i> he chuckles. <i>“I guess I can’t be surprised if most people out here don’t, though,”</i> he continues with a shrug. <i>“After all, the majority of people just want to eke out a life on their ball of junk, no interest in anything beyond their own noses. No, fuck that.”</i>");
		output("\n\nHe leans across the table, and with him this close you realize his scaled hide is covered in faded scars. They crisscross all across his face and body, signifying a lifetime spent in combat.");
		output("\n\n<i>“Life is about taking. It’s about seizing opportunities when you see them. Don’t be content to wallow in mediocrity.”</i>");
		output("\n\nHe relaxes and you see the faint hint of the corners of his mouth turning upwards as he pulls back.");
		output("\n\n<i>“But you’re a Steele, so no doubt you know that already. I’m Edan. What are you here for?”</i>");
		output("\n\nWhat <i>are</i> you here for?");
		
		flags["EDAN_MET"] = 1;
	}
	else if ((flags["EDAN_FUCKED"] == undefined) && (flags["EDAN_MET"] == 1))
	{
		output("You walk over to the giant leithan, who nods at you.");
		output("\n\n<i>“Edan.”</i>");
		output("\n\n<i>“Steele.”</i>");
		output("\n\nWhat are you here for?");
	}
	else if (flags["EDAN_FUCKED"] == 1)
	{
		output("Before you know it, you’re sitting across from the leithan and saying hi with a casual smile. He gives you a nod, meeting your eye with a casual grin.");
		output("\n\n<i>“Hey there, Steele. You here for the food?”</i> He asks with a wink.");
		output("\n\nWhat did you come here for?");
	}
	else if (flags["EDAN_FUCKED"] == 2)
	{
		output("You sashay over and say hi, popping yourself down on the bench next to the giant leithan.");
		output("\n\n<i>“Making yourself comfortable, Steele? Not sure why you chose the seat when you clearly prefer the floor.”</i> Edan laughs to himself.");
		output("\n\nWhy are you here?");
	}
	else if (flags["EDAN_FUCKED"] >= 3)
	{
		output("You practically prance over to Edan, fantasizing all the while. What kind of raunchy sex act is he going to put you up to today? You can hardly wait to find out what he’s going to do to you, which hole of yours he’s going to fuck and rut and mate-");
		output("\n\n<i>“Hey Steele. Whatcha thinking about?”</i> Edan says with a knowing grin on his face.");
		output("\n\nYou’re apparently as transparent as you are red. And horny.");
	}
	
	if (flags["EDAN_FUCKED"] == 3 && !pc.hasVagina()) addDisabledButton(0, "Drinks", "Drinks", "You need a vagina for this!");
	else if (flags["EDAN_FUCKED"] == undefined || flags["EDAN_FUCKED"] <= 4) addButton(0, "Drinks", edanDrinks, undefined, "Drinks", "Ask Edan if he wants to grab some drinks.");
	else addDisabledButton(0, "Drinks", "Drinks", "You’re not actually here for the drinks.");
	
	if (flags["EDAN_STORYBLOCKED"] != 1) addButton(1, "Stories", edanStories, undefined, "Stories", "Ask Edan for a story.");
	else addDisabledButton(1, "Stories", "Stories", "Don’t kid yourself.");
	
	if (flags["EDAN_NODICKS"] == 1 && !pc.hasVagina()) addDisabledButton(2, "Sex", "Sex", "Edan explained his sexual preferences - you need a pussy to have sex with him.");
	else if (pc.lust() < 33) addDisabledButton(2, "Sex", "Sex", "You are not aroused enough for this!");
	else addButton(2, "Sex", edanSex, undefined, "Sex", "Proposition the leithan for sex in the middle of the mess hall.");
	
	addButton(14, "Back", mainGameMenu);
}

//Drinks scene lead-in.
public function edanDrinks():void
{
	clearOutput();
	clearMenu();
	edanHeader();
	
	if (flags["EDAN_FUCKED"] == undefined)
	{
		output("You bring up the idea of drinks, and Edan nods his head.");
		output("\n\n<i>“I like the way you think, nothing like a drink after eating. Let’s head to the tavern next door.”</i>");
		output("\n\nYou rise from your seat to find that to your surprise, Edan was actually sitting on the floor. He grouses a bit as he stands.");
		output("\n\n<i>“They don’t make furniture for leithans around here. Maybe I should ask some of the raskvel about that, actually,”</i> he muses, before shaking his head. <i>“Never mind, damn things’d probably build it outta junk.”</i>");
		output("\n\nYou head into the tavern, Edan following closely behind.");
		
		currentLocation = "302";
		addButton(0, "Next", edanDrinksIntro);
	}
	else if (flags["EDAN_FUCKED"] == 1)
	{
		output("You mention getting some drinks next door and Edan nods, then laughs.");
		output("\n\n<i>“Do you do everything backwards, Steele? Usually the drinks come first. Still, I’m not one to turn drinking down. Let’s go.”</i>");
		output("\n\nHe gets up and turns to leave and you walk alongside him into the tavern, although only one of you can fit through the door at the same time.");
		
		currentLocation = "302";
		addButton(0, "Next", edanDrinksIntro);
	}
	else if (flags["EDAN_FUCKED"] == 2)
	{
		output("Edan nods.");
		output("\n\n<i>“Could do with a drink and I might as well bring you along for afterwards, huh?”</i>");
		output("\n\nHe rises and sets off to the tavern. You follow along behind him, blushing slightly at the implication in his words.");
		
		currentLocation = "302";
		addButton(0, "Next", edanDrinksSexSecond);
	}
	else if (flags["EDAN_FUCKED"] == 3)
	{
		output("\Edan laughs, and you ask why.");
		output("\n\n<i>“It’s just that you read my mind. I guess you know what’s best, Steele.”</i>");
		output("\n\nHe gets up from the floor and beckons you towards the tavern.");
		output("\n\n<i>“I can see how eager you are to get to it. Don’t worry, I’ve got something special planned with the owner.”</i>");
		output("\n\nSomething special? You like the sound of that. You walk behind Edan as he strides into the tavern, your eyes lingering between his legs. His cock is sheathed right now, but you’re looking forward to when it isn’t. You tuck that thought away as you walk into the tavern, your [pc.vaginas] already quivering a little at the thought of whatever Edan’s going to subject you to.");
		
		currentLocation = "302";
		addButton(0, "Next", edanSexFourth, undefined, "Next", "Time to find out what that something special is.");
	}
	else if (flags["EDAN_FUCKED"] == 4)
	{
		output("Edan nods.");
		output("\n\n<i>“Could do with a drink and I might as well bring you along for afterwards, huh?”</i>");
		output("\n\nHe rises and sets off to the tavern. You follow along behind him, blushing slightly at the implication in his words.");
		
		currentLocation = "302";
		addButton(0, "Next", edanDrinksSexThird);
	}
}

//Story generator. Picks 1 of 5 random stories to be injected into a conversation.
public function edanStories():void
{
	clearOutput();
	clearMenu();
	edanHeader();
	
	if (flags["EDAN_STORYINTROTOLD"] != 1) //First time story
	{
		if ((flags["EDAN_FUCKED"] == undefined) || (flags["EDAN_FUCKED"] == 1))
		{
			output("You ask Edan if he has any stories of his time spent traversing the galaxy.");
			output("\n\n<i>“Sure I do, but there’s no way I’m letting the Steele " + pc.mf("heir", "heiress") + " ask me for a story without telling me what they’re doing on Tarkus. What exactly are you doing here?”</i> he inquires.");
			output("\n\nHe’s curious about what kind of circumstances would bring the " + pc.mf("heir", "heiress") + " of one of the most powerful corporations in the galaxy out to a dusty hellhole. You regale Edan with the story of your travels, starting with your origin and your inheritance situation. He listens with interest, interrupting every so often to ask questions.");
			if (flags["LOST_TO_DANE_ON_MHENGA"] != undefined) output("\n\nHe seems especially interested in your rival and [rival.eir] bodyguard Dane, <i>“Pity I wasn’t there, I could have taken him,”</i> Edan insists, <i>“A real man gets the job done with two arms.”</i> This is followed by some theatrical flexing and laughter.");
			else if ((flags["DIDNT_ENGAGE_RIVAL_ON_MHENGA"] != undefined) || (flags["LOST_TO_DANE_ON_MHENGA"] == undefined)) output("\n\nHe seems especially interested in your rival and [rival.eir] bodyguard Dane, <i>“Damn, this guy sounds like a real bitch if he can’t beat up a regular [pc.race] when he has four fuckin’ arms,”</i> Edan jeers, <i>“A real man gets the job done with two.”</i>");
			else output("\n\nHe seems especially interested in your rival and [rival.eir] relation with you, <i>“I can’t believe someone would be such a scumbag to their own family,”</i> Edan grumbles. <i>“Sounds like a real dick if you ask me,”</i> leaving you to explain your family situation.");
			output("\n\nYou sit back when you’re done with your tale and Edan lets out a low whistle.");
			output("\n\n<i>“Looks like you have a fair bit of shit to deal with yourself. I guess I can spare some time for a story.”</i>");
			
			edanStorySelector();
			
			output("\n\nHe finishes his story and looks down at his plate to find it empty.");
			output("\n\n<i>“Well, I’m going to go get some more food. I’ll see you ‘round, Steele.”</i>");
			output("\n\nEdan goes to harangue some cooks for more food, and you get up to depart.");
			flags["EDAN_STORYINTROTOLD"] = 1;
		}
		else if (flags["EDAN_FUCKED"] == 2)
		{
			output("You ask Edan if he wants to swap stories.");
			output("\n\n<i>“Sure, but are you sure you want to use your mouth for talking? What’s your story, anyway? Why is the Steele " + pc.mf("heir", "heiress") + " out sucking cock on Tarkus?”</i> he inquires.");
			output("\n\Despite the casual jab at your somewhat adventurous sexual habits, you can tell he’s genuinely interested. You regale Edan with the story of your travels, starting with your origin and your inheritance situation. He listens with interest, interrupting every so often to ask questions.");
			if (flags["LOST_TO_DANE_ON_MHENGA"] != undefined) output("\n\nHe seems especially interested in your rival and [rival.eir] bodyguard Dane, <i>“Pity I wasn’t there, I could have taken him,”</i> Edan insists, <i>“A real man gets the job done with two arms.”</i> This is followed by some theatrical flexing and laughter.");
			else if ((flags["DIDNT_ENGAGE_RIVAL_ON_MHENGA"] != undefined) || (flags["LOST_TO_DANE_ON_MHENGA"] == undefined)) output("\n\nHe seems especially interested in your rival and [rival.eir] bodyguard Dane, <i>“Damn, this guy sounds like a real bitch if he can’t beat up a regular [pc.race] when he has four fuckin’ arms,”</i> Edan jeers, <i>“A real man gets the job done with two.”</i>");
			else output("\n\nHe seems especially interested in your rival and [rival.eir] relation with you, <i>“I can’t believe someone would be such a scumbag to their own family,”</i> Edan grumbles. <i>“Sounds like a real dick if you ask me,”</i> leaving you to explain your family situation.");
			output("\n\nYou sit back when you’re done with your tale and Edan lets out a low whistle.");
			output("\n\n<i>“Looks like you have a fair bit of shit to deal with yourself. I guess I can spare some time for a story.”</i>");
			
			edanStorySelector();
			
			output("\n\nHe finishes his story and looks down at his plate to find it empty.");
			output("\n\n<i>“Well, I’m going to go get some more food. I’ll see you ‘round, Steele.”</i>");
			output("\n\nEdan goes to harangue some cooks for more food, and you get up to depart.");
			flags["EDAN_STORYINTROTOLD"] = 1;
		}
		else if (flags["EDAN_FUCKED"] == 3)
		{
			output("You meekly suggest you wanted to hear some of his stories instead of suck his cock but the moment the words leave your lips you realize how much more realistic they were in your head, given your actions so far. He raises an eyebrow.");
			output("\n\n<i>“Alright then, you first. Why’s the Steele " + pc.mf("heir", "heiress") + " on Tarkus swallowing my cock like a pornstar?”</i> He inquires.");
			output("\n\nAlthough you have to admit he has a point, you can tell he’s interested in your story. You haltingly begin to regale Edan with the story of your travels, starting with your origin and your inheritance situation.");
			if (flags["LOST_TO_DANE_ON_MHENGA"] != undefined) output("\n\nHe seems especially interested in your rival and [rival.eir] bodyguard Dane, <i>“Pity I wasn’t there, I could have taken him,”</i> Edan insists, <i>“A real man gets the job done with two arms.”</i> This is followed by some theatrical flexing and laughter.");
			else if ((flags["DIDNT_ENGAGE_RIVAL_ON_MHENGA"] != undefined) || (flags["LOST_TO_DANE_ON_MHENGA"] == undefined)) output("\n\nHe seems especially interested in your rival and [rival.eir] bodyguard Dane, <i>“Damn, this guy sounds like a real bitch if he can’t beat up a regular [pc.race] when he has four fuckin’ arms,”</i> Edan jeers, <i>“A real man gets the job done with two.”</i>");
			else output("\n\nHe seems especially interested in your rival and [rival.eir] relation with you, <i>“I can’t believe someone would be such a scumbag to their own family,”</i> Edan grumbles. <i>“Sounds like a real dick if you ask me,”</i> leaving you to explain your family situation.");
			output("\n\nYou sit back when you’re done with your tale and look hopefully at Edan, who lets out a low whistle.");
			output("\n\n<i>“Looks like you have a fair bit of shit to deal with yourself. I guess I can spare some time for a story and you can listen while you massage my cock with your throat.”</i>");
			output("\n\nWell-practiced by now, you slip off the seat next to him and get on your knees in front of him, already salivating as you open your slutty mouth wide...");
			
			edanStorySelector();
			
			output("\n\nEdan exhales loudly as he finishes his story, his turgid cock throbbing in your poor throat as he explodes directly into your stomach, splattering your walls with a sticky coating of cum and marking you as his. You gurgle around the base of his dick as your overwhelmed throat bulges with each load travelling down his cumvein until it’s where it belongs - your overstuffed tummy. With him impaling you so deeply swallowing is unnecessary, but you do it anyway to make your well-trained throat muscles convulse and tighten around his cock as he finishes, the absurd bulge receding from your neck as he withdraws from your fuckhole, as loose as any plowed cunt.");
			output("\n\n<i>“You’re good, Steele,”</i> he sighs in satisfaction, looking down at you. <i>“Now that I think about it, maybe being a pornstar </i>is<i> your calling.”</i>");
			output("\n\nFinding his plate empty, he returns to the kitchen to harangue the chefs for more, leaving you with the happiness of his praise and a stomach full of his cum.");
			pc.changeLust(30);
			pc.exhibitionism(2);
			flags["EDAN_STORYINTROTOLD"] = 1;
		}
		else if (flags["EDAN_FUCKED"] >= 4)
		{
			output("You meekly suggest that you came to him to hear some stories, but Edan is shaking his head before you even get the words out.");
			output("\n\n<i>“Don’t play around, Steele. If you were really here for stories you’d have asked sometime before becoming my favorite cocksleeve. You don’t need to pretend you don’t want it, it’s written all over your face. Come back when you’ve figured yourself out.”</i>");
			
			flags["EDAN_STORYBLOCKED"] = 1;
		}
	}
	else //Repeat talk scenes
	{
		if (flags["EDAN_FUCKED"] == undefined)
		{
			output("You ask Edan if he has any stories of his time spent traversing the galaxy.");
			output("\n\n<i>“I’ve been here and there. I’ll swap one for yours.”</i>");
			
			edanStorySelector();
			
			output("\n\nYou tell him a story of your adventures so far, and he reacts with amazement. Seems like he’s taking a real interest in your journey. Conversation over, you get up.");
			
		}
		else if (flags["EDAN_FUCKED"] == 1)
		{
			output("You tell Edan you want to hear some stories.");
			output("\n\n<i>“Oh yeah, stories. Let me tell you about this one spacer that sucked my dick under a mess hall table,”</i> Edan says, snickering a bit. <i>“Fine, I’ve got some stories.”</i>");
			
			edanStorySelector();
			
			output("\n\nYour lust (for stories!) sated, you get up.");
		}
		else
		{
			output("Edan rolls his eyes.");
			output("\n\n<i>“Right, you’re here for the stories like how I read the hyperporn mags for the Nivas interviews. Sure, Steele.”</i>");
			output("\n\nRegardless of what he thinks of your desire (for stories, of course) you trade some tales, some taller than others.");
			
			edanStorySelector();
			
			output("\n\nYour lust (for stories!) sated, you get up.");
		}
	}
	
	addButton(0, "Next", mainGameMenu);
	processTime(10);
}

//Sex scene picker
public function edanSex():void
{
	clearOutput();
	clearMenu();
	edanHeader();
	
	if ((flags["EDAN_FUCKED"] == undefined) && pc.hasVagina() && !pc.isMasculine(true))
	{
		output("You mention sating your sexual curiosity and he laughs.");
		output("\n\n<i>“In the middle of the mess hall? I’d heard rumors, but I thought they were just fantasies. Sure, Steele. I doubt you could handle being fucked over a bench in the middle of the mess hall, but I give you permission to suck my dick under the table.”</i>");
		
		addButton(0, "Yes", edanSexFirst, undefined, "Yes", "Get under that table.");
		addButton(1, "No", edanSexRefusal, undefined, "No", "You’re not about to suck his dick like a floozy!");
	}
	else if (!pc.hasVagina() || pc.isMasculine(true))
	{
		output("You mention sating your sexual curiosity and he shakes his head.");
		output("\n\n<i>“Sorry, Steele. Guys and shemales just aren’t my thing,”</i> he explains. <i>“Nothing personal, it’s just that there’s so many people open to sex that there’s really no reason to sleep with anyone except the ones you really prefer. I like a regular woman, even with extra bits.”</i>");
		output("\n\nFair enough.");
		flags["EDAN_NODICKS"] = 1;
		
		addButton(0, "Next", talkToEdan);
	}
	else if (flags["EDAN_FUCKED"] == 1)
	{
		output("You tell Edan you enjoyed last time and want to go again, and he smiles at your honesty.");
		output("\n\n<i>“Color me surprised, the wild spacer that blew in from their galactic adventure to suck my dick wants to go again. Be my guest, Steele.”</i>");
		output("\n\nYou go to slide under the table...");
		
		addButton(0, "Next", edanSexSecondStart);
	}
	else if (flags["EDAN_FUCKED"] == 2)
	{
		output("At this point, you don’t really see the point in dancing around the issue.");
		output("\n\n<i>“Say, Edan, when are we going to fuck?”</i>");
		output("\n\nEdan shrugs.");
		output("\n\n<i>“There’s nothing stopping you from sucking my cock whenever you want, Steele. And I know you do want it. But if you really want to get fucked,”</i> he says while gesturing to the bench you’re sitting on as he rises, <i>“lie down on that bench.”</i>");
		output("\n\nDo you obey?");
		
		addButton(0, "Yes", edanSexThird, undefined, "Yes", "Of course you do.");
		addDisabledButton(1, "No", "No", "Don’t kid yourself - he’s finally going to fuck you! Refusal doesn’t even cross your mind.");
	}
	else if (flags["EDAN_FUCKED"] == 3)
	{
		output("Edan already knows what you’re here for - and so does everyone else, if the somewhat muted conversations and sideways glances around you are any clue - and he did mention last time that there was nothing stopping you from taking the lead, so you do. You sink to your knees in front of him, your pussy already aflame with lust as you strip off your [pc.upperGarments] to reveal your [pc.breasts], the nearby raskvel already chittering in anticipation. As you put your gear aside, Edan stops you.");
		output("\n\n<i>“Hold up, Steele. As happy as I am you’ve accepted your role, there’s something else I want to do today. Let’s go to the tavern next door, I’ve got something special planned for you.”</i>");
		output("\n\nSomething special? You like the sound of that. You walk behind Edan as he strides into the tavern, your eyes lingering between his legs as you chuck your gear back on. His cock is sheathed right now, but you’re looking forward to when it isn’t. You tuck that thought away as you walk into the tavern, your pussy already quivering a little at the thought of whatever Edan’s going to subject you to.");
		
		pc.changeLust(20);
		currentLocation = "302";
		pc.exhibitionism(5);
		addButton(0, "Next", edanSexFourth, undefined, "Next", "Time to find out what that something special is.");
	}
	else if (flags["EDAN_FUCKED"] == 4)
	{
		output("The moment he spots you, he gives you a wave and you walk on over with a smile. He stands as you approach his seat and you stop, raising a questioning eyebrow as he gets up.");
		output("\n\n<i>“C’mon, Steele. Let’s take a walk to my ship. I wanna eat something different today.”</i> He gives you a wink before passing you by.");
		output("\n\nYou can’t tell if that was a double entendre but you automatically turn and follow him anyway, surreptitiously casting your gaze downwards to his hindquarters. Much like the rest of him, it’s firm, well-rounded and muscular. His muscles aren’t overly defined, but you’ve been on the receiving end of him enough times to know there’s a lot of power in his frame. What you’re really interested in is between his legs, though. There’s just nothing like the way he fucks you so utterly, filling whichever hole he chooses so completely with his equine flare.");
		output("\n\nIt’s why you’ve been approaching him so often, it’s why you followed through when he half-seriously told you to suck his dick under a mess hall table. You’re giving him your everything, and you’re loving it. Part of you wonders if he was serious when he said he could fuck you all day, and whether you could even handle it. Maybe if you’re lucky, that’s what you’re about to find out. You catch up to him to walk side by side until you reach his ship, completely ignoring the surroundings as your imagination plays out your fantasies.");
		output("\n\n<i>“Here we go. It’s not fancy, but it flies well and it was the roomiest one I could find.”</i>");
		
		pc.changeLust(20);
		currentLocation = "201";
		addButton(0, "Next", edanSexFifth);
	}
	else if (flags["EDAN_FUCKED"] == 5)
	{
		output("When you see Edan, he’s flipping through a data slate instead of putting away a cargo freighter’s worth of food. You decide to see what he’s up to, motivated in part by simple curiosity and in part the notion that any time spent with Edan is potentially a few minutes removed from having his juicy horsecock throbbing inside you. Sidling up to him, you give him a pleasant surprise by wrapping yourself around his arm and letting him feel your presence.");
		output("\n\n<i>“Oh, hey Steele,”</i> He looks up from the tablet and grins at your attentions. <i>“Was just looking through some contracts. I need to go meet with some potential clients, you want to come with? It’s probably just going to be boring business things, but you must be used to that. Besides, maybe you can liven it up.”</i>");
		output("\n\nYou shrug. Can’t be any worse than some of the meetings you’ve had to endure.");
		
		currentLocation = "201";
		addButton(0, "Next", edanSexSixth);
	}
	else
	{
		output("Edan gives you a wave as you approach.");
		output("\n\n<i>“Heya, [pc.name]. I’ve got some time, you wanna hang out back at my place today? I’ve got some crappy movies we can watch.”</i>");
		output("\n\n<i>“Sounds like fun,”</i> you nod. <i>“Especially if it’s anything like last time.”</i>");
		output("\n\nHe grins. <i>“Thought you might say that.”</i>");
		output("He puts his arm around you casually, pulling you close as the two of you walk to his ship.");
		
		currentLocation = "201";
		addButton(0, "Next", edanSexRepeat);
	}
}

//For when the PC ducks outta there.
public function edanSexRefusal():void
{
	clearOutput();
	clearMenu();
	edanHeader();
	
	if (flags["EDAN_FUCKED"] == undefined) 
	{
		output("<i>“Suit yourself,”</i> he shrugs, <i>“If even half of what I hear is true, you’ll be scrabbling under the table in no time.”</i> Edan returns to eating his food as though nothing has happened, your refusal of his terms apparently of no consequence to him."); 
		
		addButton(0, "Next", talkToEdan);
	}
	else
	{
		output("You meekly shake your head and Edan shrugs.");
		output("\n\n<i>“Suit yourself, Steele. Don’t worry, I’ll still be here if you change your mind.”</i>");
		
		addButton(0, "Next", talkToEdan);
	}
}

//START OF EDAN'S SEX SCENES

public function edanSexFirst():void
{
	clearOutput();
	clearMenu();
	edanHeader(true);
	
	output("You scuff along the floor on your [pc.knees] and palms, navigating through the dirt and mess inevitably left behind by busy patrons as you get closer to where the leithan is sitting. More than a few raskvel notice you, but you guess they’re pretty casual about this kind of thing given that after a few hoots and some hollering they go back to whatever they’re doing. The table Edan is sitting at today is conveniently located against one of the bulkheads; you notice he’s not actually sitting on a bench, so there’s nothing in the way obstructing him from putting his forelegs up on the table to allow you access to his dick.");
	output("\n\nYou try not to think about how much attention a giant leithan standing on a table is going to draw and start shuffling under the front of his powerful body, his sizeable sheath already thickening in response to the ease with which you acquiesced to his command. You reach out and stroke it, and it’s not long before inches issue forth into your waiting hands. Six, twelve, eighteen... <i>wow</i>. There’s a few feet of thick, veiny horsecock hanging in front of your face. You reverentially caress it with your hands, marvelling at how hard it is between your fingers.");
	output("\n\n<i>“Yeah, I get that reaction a lot. I sprung for gene mods, too. I get a lot of positive feedback on the choice,”</i> Edan says from somewhere above you.");
	output("\n\nYou can actually <i>hear</i> the smugness in his voice, but settle for rolling your eyes from the safety of underneath the bulk of his bestial flared cock. You can’t actually enclose his swollen dick in your hands, but you do your best with what you’ve got as you slowly rub him up and down. Your jaw unconsciously drops in amazement as you realize you can actually feel his heartbeat reverberating in your hands, and if you strain your [pc.ears] you ");
	if (pc.earType == GLOBAL.TYPE_SYLVAN) output("can actually <i>hear</i> ");
	else output("could swear you can hear ");
	output("the dull thud of bloodflow in his gargantuan prick.");
	output("\n\n<i>“Your open-mouthed adulation is appreciated, Steele, but I’m pretty sure I asked you for something specific,”</i> he grunts.");
	output("\n\nHe’s right, of course. You were so caught up in admiring his beautiful cock, the individual contours and feedback from the swollen veins of his dick so pleasurable to caress - oops, you’re doing it again. You position yourself so you’re kneeling in front of his tip and allow yourself an experimental lick of the head with your [pc.tongue], eliciting a grunt from above you. Well, he likes that. The taste isn’t bad either, you note as you swish your tongue around your mouth to wet it with saliva.");
	output("\n\nYou lean forward and start to work in earnest, alternating between gently suckling his tip and bobbing your lips up and down his head to entice drops of precum into your waiting mouth. A waitress passes by and rolls her eyes upon noticing you eagerly taking a leithan’s cock between your [pc.lips]. You guess out here on the frontier people must be pretty blasé about");
	if (pc.race().toLowerCase().indexOf("leithan") != -1) output(" sexual encounters happening right in front of them.");
	else output(" interspecies sexual encounters in their face.");
	output("\n\nShe <i>is</i> still watching you though, and continues to do so on her way back to the kitchen, almost tripping over some raskvel scrabbling about underfoot.");
	output("\n\nYou can’t tell if she’s just admiring your technique or the prodigious tool it’s being zealously applied to, but you make sure to make eye contact with her as you squeeze his shaft and swallow the spurt of precum that follows. She starts at the realization you’ve seen her staring and quickly hurries back into the safety of the kitchen as she casts another glance over her shoulder. With the distraction out of the way, you turn your full attention back to pleasuring the cock in your mouth, noting with some dismay that your jaw is beginning to ache with the effort of accommodating it.");
	output("\n\nYou struggle to pop your lips around the tip and begin jacking him off into your mouth with both arms, jerking your head back and forth as the leithan starts to breathe heavily, his underside shaking as a result of your ministrations. His groans from above are louder now and it’s readily evident to anyone in the vicinity what’s going on under the table, as if they didn’t already know. Luckily, the raskvel don’t really seem to care much. You’ve kept your champion cocksucker performance up for less than a minute when you hear him gripping the table so hard it’s splintering slightly; accompanied by the sensation of his turgid cock thickening in your mouth and hands, you’re pretty sure he’s about to come. You redouble your efforts, his precum being coaxed into your throat and dribbling down the front of your [pc.upperGarmentOuter] on every frenetic upstroke as you strive to bring him to orgasm.");
	output("\n\nYour actions are rewarded when you feel his gargantuan dick start to pulse and flex, followed a split-second later by a gush of much thicker cum into your mouth. Your pliant lips stay wrapped around his cock hungrily, and left with no alternative you start to gulp down his spunk. It’s nigh-impossible given the volume of his ejaculation, and a fair amount of it sprays from the sides of your mouth or drips down your chin onto the floor. You make some progress, and you can actually feel his warmth in your body as his loads coat your insides on their way to your [pc.belly].");
	output("\n\n<i>“God </i>damn<i>, [pc.name]. It’s no wonder your family has the - the rep it does. You’ve got genuine tale</i>nnn<i>t.”</i>");
	output("\n\nYou hear Edan’s praise as he struggles to maintain some sense of normalcy in his speech, but your ability to retort is somewhat hindered by your inability to swallow the ever-increasing amount of his cum in your mouth. It spills from between your [pc.lips], splattering between your legs as you draw back. The rest of his ejaculation spurts onto the ground near you, narrowly missing coating your [pc.legOrLegs] in spunk. You swallow the remainder, and crawl out from under the table to sit on the bench adjacent to him. You burp quietly and cover your mouth in shock, causing Edan to laugh.");
	output("\n\n<i>“If you’re half as good at negotiation as you are at sucking cock I can see why you’re the " + pc.mf("heir", "heiress") + ", although I’m not convinced you don’t think they’re the same thing. I’m going to go get some more food, Steele. You’ll probably want to wash your face. Got a bit on your cheek there.”</i>");
	output("\n\nEdan laughs again as he goes to get the attention of some kitchen staff, who have notedly been avoiding the area. You wash your face off and just sit for a while, thinking about how easily you followed his commands. It did stoke the flames of your lust if the state of your ");
	if (!pc.isCrotchExposed()) output("[pc.lowerGarment] is a reliable indicator,");
	else output("[pc.pussy] is a reliable indicator,");
	output(" but maybe being overly willing to suck the dick of a mercenary you just met might give him the wrong idea. You glance up to see Edan has found a new seat, and he gives you a smile and a wave before getting back to eating. You guess being as big as he is has its drawbacks when it comes to food. With a sigh and a mix of emotions burning in the pit of your spunk-filled tummy, you stand to leave as a resigned kitchen worker arrives with a mop.");
	
	
	pc.changeLust(70);
	pc.exhibitionism(5);
	pc.loadInMouth(chars["EDAN"]);
	flags["EDAN_FUCKED"] = 1;
	processTime(10);
	addButton(0, "Next", mainGameMenu);
}

public function edanSexSecondStart():void
{
	clearOutput();
	clearMenu();
	edanHeader();
	
	output("... But Edan’s voice stops you short.");
	output("\n\n<i>“Actually, Steele, I don’t want you hiding under the table.”</i>");
	output("\n\nHe shuffles backwards a bit to make room on the floor in front of him and points at the space.");
	output("\n\n<i>“I’d rather you were sitting right here.”</i>");
	output("\n\nThat’s in plain view of everyone sitting around you! You look desperately at Edan, but you can see in his face that not only is he serious, but he’s not going to budge. He notices your look and smirks a little.");
	output("\n\n<i>“What? You should be used to it by now, it’s not like the table made it any less obvious. I think you’d enjoy it more too, I can tell you have an exhibitionist streak in you.”</i>");
	output("\n\nWell, maybe...");
	
	addButton(0, "Yes", edanSexSecondEnd, undefined, "Yes", "Fine. You’ll obey his instructions for now, even if he is asking you to deepthroat his massive cock in public.");
	addButton(1, "No", edanSexRefusal, undefined, "No", "That’s too much even for you.");
}

public function edanSexSecondEnd():void
{
	clearOutput();
	clearMenu();
	edanHeader(true);
	
	output("Fuck it, you might as well. You crawl under the table and emerge on the other side in front of Edan; kneeling in front of him eyeing his giant dick is starting to feel pretty familiar by now. You look around and see a bunch of raskvel and various denizens of the hall eyeing you; Edan was right, they know why you’re here. At least you’ll be performing for an attentive audience. You decide you might as well go all the way while you’re here,");
	if (!pc.isChestExposed()) output(" and sway your booty a bit as you strip off your [pc.upperGarments] to free your [pc.breasts] from their confines, giving everyone around you and especially Edan an eyeful of what [pc.fullname] has on offer.");
	else output(" swaying your booty is you lightly caress your [pc.breasts], giving everyone around you and especially Edan an eyeful of what [pc.fullname] has on offer.");
	output("\n\n<i>“Damn, Steele, you’re really getting into it. I knew you’d like this more.”</i>");
	output("\n\nYou look up at a grinning Edan and lean forward, kissing his sheath until his cock springs free, giggling a bit as the sheer bulk of it pushes you backwards until it’s laid across your head. You crane upwards and lick the underside, idly playing with your [pc.nipples] as you drag your tongue along his cumvein until their stiffness is almost distracting.");
	output("\n\nYou see Edan’s giant hand reach down and let him cup the back of your head, urging you to get to work. You acquiesce and stop playing with yourself to tend to his need, licking his tip before fitting your [pc.lips] around the head of his cock, his gentle insistence pushing you further down until you’ve got a throatful of it. You cast a sultry look upwards to meet his gaze, your lips and tongue forming a warm wrapper around his dick before slowly sliding downwards on his cock, Edan lifting his hand away to let you fuck your own mouth in front of your captive audience. You stretch your head forwards and straighten your neck so as to allow his dick easier access to warm recesses of your throat, arching your back seductively as your gag reflex submits to his overwhelming thickness, neck bulging with his length.");
	output("\n\nYou’re reminded of the audience’s presence by a few impressed gasps and gesturing from surrounding raskvel at how hard you’re being stuffed, and take a moment to just hold his cock in the softness of your warm throat, lubricated by saliva and precum. The surprise is evident on your face when Edan pulls himself out of his sheath, and you’re left coughing and spluttering a bit in your unpreparedness. You look up at Edan questioningly and his reply comes in the form of a gentle push, sending you sprawling onto your back with your limbs splayed.");
	output("\n\n<i>“Stay down for a moment, Steele. I want to try something different,”</i> He says from above, and so you wait, wishing he was fucking your mouth but curious to see what he has in mind. He positions his oversized tauric body directly above your prostrate form, his cock coming to rest on your torso between your [pc.breasts]. Seeing the sheer scale of it lying on top of your ");
	if (pc.tallness < 84) output(" comparatively tiny ");
	output("body turns you on, imagining how your insides would have to contort with the effort of fitting him into you driving your pussy to drip with need");
	if (!pc.isCrotchExposed()) output(", staining your [pc.underGarment]");
	output(". Edan doesn’t notice your dick-induced fantasizing and the subtle flushing of your face as your mouth hangs open unconsciously, mesmerized by the tip of his rod nestled just under your chin.");
	output("\n\nYou’re roused to attentiveness by the sound of Edan’s voice, as authoritative as it is deep, commanding you to do something. You crane your neck backwards to look up at him and he snickers before repeating himself.");
	output("\n\n<i>“I said, I want you to give me a tit job. Can you do that?”</i>");
	if (pc.biggestTitSize() < 4)
	{
		output("\n\nYou look down at your chest, the subtle swell of your breasts pretty much imperceptible under his behemoth organ, and pout a bit. He can see for himself that you don’t have that much to work with! Still, though, you want to make it work for him. You press your meager cleavage together to form a valley of flesh for him and he responds by slowly beginning to rub himself up and down your form with slow pumps of his powerful hips, the veins and grooves of his cock being pulled and pushed over your [pc.skinFurScales].");
		output("\n\nNonetheless, he seems pretty content to use your body roughly to get off. Your tenuous grip on the seat relaxes as the intermingling of your sweat provides adequate lubrication for him to massage your chest with his engorged cock, precum dribbling and spurting onto your face and meager breasts as every increasingly primal stroke gets him closer to orgasm. The audience looks to be getting close to their own, a bunch of horny raskvel eagerly jacking off to the sight of your submission and debasement.");
		output("\n\nFinally he groans and lunges forward one last time, his dick settling on your chin and immediately blasting your face with his cum. The majority of it flies onto the floor behind you, but there’s definitely enough to go around as your scrunched-tight [pc.eyes] and [pc.hair] are coated in the warmth of Edan’s sticky seed. A lot of it ends up in your mouth and you’re forced to swallow it down to keep up, although there never seems to be any less of it after you do.");
	}
	if ((pc.biggestTitSize() >= 4) && (pc.biggestTitSize() < 12))
	{
		output("\n\nYou look down at your chest, the swell of your breasts comfortably holding his behemoth organ between them. You’re well equipped to handle a tit job for most cocks, but Edan’s size means that you’d need to be even bigger to properly provide for him. Still, though, you’re definitely big enough to have some fun. You press your breasts together and although they don’t completely contain his length, they create a nice wall of soft flesh for him to fuck. He responds by slowly beginning to rub himself up and down your form with slow pumps of his powerful hips, the veins and grooves of his cock being pulled and pushed through the [pc.skinFurScales] of your breasts.");
		output("\n\nYou watch transfixed as Edan’s cock plunges between your tits and across your face, practically blotting out your vision from this close as you struggle to maintain your inward press on your breasts while he gets rougher with his thrusting. This would be much easier if your tits were even bigger, and he’d probably appreciate the effort. Not that he isn’t going to town on you already, but you think he’d be happier if you could give him a real titfuck. Worth thinking about, you note as you’re almost dragged across the floor by his intense thrusting.");
		output("\n\nStill, he seems pretty happy to pummel your cleavage, the lubrication of his and your sweat easing the friction as your face and tits are covered in the drippings of his cock, the taste of precum broaching your [pc.lips] as his excitement mounts. The taste and texture has changed over the past few minutes, getting thicker as Edan gets closer to orgasming. The audience looks to be getting close to their own, a bunch of horny raskvel eagerly jacking off to the sight of your submission and debasement.");
		output("\n\nFinally he groans and lunges forward one last time, the tip of his dick settling on your sensuous lips and immediately blasting your face with his cum. The majority of it flies onto the floor behind you, but there’s definitely enough to go around as your scrunched-tight [pc.eyes] and [pc.hair] are coated in the warmth of Edan’s sticky seed. A lot of it ends up in your mouth and you’re forced to swallow it down to keep up, although there never seems to be any less of it after you do. Your breasts also get their fair share of glazing, a symbol of their purpose.");
	}
	if (pc.biggestTitSize() >= 12)
	{
		output("\n\nYou don’t even need to look down to see the swell of your breasts, lying down as you are. Your [pc.breasts] are easily big enough to comfortably contain Edan’s engorged cock. You wrap your arms around your tits to marshal them into a cavern of cleavage for him to fuck, and hear him from above you.");
		output("\n\n<i>“Attagirl, Steele. You know what to do with those, huh? Damn, your body is just the way I like it.”</i>");
		output("\n\nYou flush with embarrassment at his brazen praise for your voluptuous body in front of an audience, but you’re inwardly pleased he’s happy with your body. He starts to slowly thrust his horsecock in between your gigantic tits with slow pumps of his powerful hips, making them jiggle up and down as you feel the veins and grooves of his cock rubbing across your [pc.skinFurScales].");
		output("\n\nYou have a front row seat to the violation of your own tits as he plunges into their cushiony expanse, the slap of flesh on flesh resounding through the air as his animalistic thrusts almost drag you across the floor with their intensity. The passage of his cock is eased by the intermingling of his and your sweat, your face and body flushed with the exertion of keeping your giant breasts as tightly pressed together as you can for him.");
		output("\n\nEach thrust of his spurts a little bit of precum across your face and between your [pc.lips], your [pc.tongue] collecting what he leaves in and around your mouth. Your tits don’t escape either, but between your focus on pleasing him and the growing warmth between your melons you hardly notice the aid of his precum in easing the friction. You do notice that the taste and texture of his precum has changed in the last few minutes, the increasing thickness and difficulty of getting it down your throat signalling his impending orgasm. The audience looks to be getting close to their own, a bunch of horny raskvel eagerly jacking off to the sight of your submission and debasement.");
		output("\n\nHis thrusting reaches a crescendo and he finally groans, lunging forward one last time as the tip of his dick settles on your sensuous lips, blasting your face in cum. Some of it flies onto the floor behind you, but there’s definitely more than enough to go around as your scrunched-tight [pc.eyes] and [pc.hair] are coated in the warmth of Edan’s sticky seed. A lot of it ends up in your mouth and you’re forced to repeatedly swallow it to avoid choking, although there’s always more left after you do. He withdraws a bit to cum all over your tits too, leaving your [pc.breasts] absolutely plastered in his cum and zero doubts about what they’re best used for. After all, you don’t have breasts this large for nothing.");
	}
	output("\n\nEdan raises himself off you, his cock still dripping spunk, and takes a good look at you lying on the ground.");
	if (pc.hasHair()) output("Your hair is matted, your face is covered, and your mouth is a warm pool of ejaculate.");
	else output ("Your entire face is covered and your mouth is a warm pool of ejaculate.");
	output("You’re a mess, but you love it. It felt <i>amazing</i> to be dominated in front of an audience, to give your body over to Edan’s use. Your only regret is that he didn’t fill you with his cock, but that’s up to him after all. He nods at you as you embarrassedly gulp down the rest of his cum, his load sliding down your throat as he talks.");
	output("\n\n<i>“Good work, Steele. I knew you’d be a natural. Come back around and we’ll have some more fun, I want to take you for a ride.”</i>");
	output("\n\nWith that he turns and leaves you lying on the floor, your upper half glazed in his cum and your lower half on fire with need. Is he going to fuck you for real the next time you meet? That’d be great, you think as you idly ");
	if (!pc.isCrotchExposed()) output("withdraw your hand from your [pc.lowerGarments] to wipe some cum out of your eyes.");
	else if ((pc.hasCock()) && (pc.hasVagina())) output("draw your hand back from fingering your needy pussy to wipe some cum out of your eyes. Your [pc.cock] stands at attention, hoping for a touch.");
	else output(" draw your hand back from fingering your needy pussy to wipe some cum out of your eyes.");
	output(" You briefly wonder what it would feel like to have his giant cock explode inside you instead of all over you, but decide not to dwell on it too long lest you start enthusiastically masturbating right there in the hall. You clean yourself off as best you can and get up to leave.");

	pc.changeLust(100);
	pc.exhibitionism(10);
	pc.loadInMouth(chars["EDAN"]);
	flags["EDAN_FUCKED"] = 2;
	processTime(20);
	addButton(0, "Next", mainGameMenu);
}

public function edanSexThird():void
{
	clearOutput();
	clearMenu();
	edanHeader(true);
	
	if (pc.isTaur())
	{
		output("You hesitate.");
		output("\n\n<i>“I don’t think the bench is going to work very well, to be honest.”</i> You say, gesturing at your tauric hindquarters.");
		output("\n\n<i>“That’s cool, I’ll handle it.”</i> Edan replies as he strides over to an adjacent table and grabs another bench. An occupied bench. The raskvel squawk and squeal as the ten foot ‘taur roughly shakes them off the bench and onto the dirt, and you can hardly stifle your laughter. He takes another bench and places them adjacent to the original, and you figure if he’s done the work you might as well indulge him.");
		output("\n\nYou excitedly lie down on the bench - it’s not often or, well, ever, that you get taken like this. Being a ‘taur has its upsides - you’ll probably be able to take his cock, for one - but variety in sex positions isn’t one of them.");
		output("\n\n<i>“Close your eyes and relax, Steele.”</i>");
		output("\n\nYou smile and close your eyes, feeling a little weird that your legs are more or less sticking up in the air, but by now you’re pretty practised at being a public spectacle (and with any luck, receptacle). You can hear Edan pacing around you, and sneak a peek with one eye to see what he’s up to. Strange, he’s standing in front of you - wait, what?");
	}
	else
	{
		output("You excitedly comply, lying down and spreading your legs wide enough that no one in the vicinity could possibly mistake your intentions, bracing yourself with your feet. Edan laughs and grips the bench within his giant mitts.");
		output("\n\n<i>“Relax and close your eyes, Steele.”</i>");
		output("\n\nIt’s a bit of a weird request, and you <i>so</i> wanted to see his enormous cock force your struggling cunt to acquiesce, but you can deal with it if it means you get his cock sooner. You close your eyes and hear Edan grunt, and then you’re in the air. Is he taking you somewhere? You feel a little out of place lying on a bench in a mess hall, but given your previous encounters you don’t really mind the onlookers. You feel him place you back down, and sneak a peek with one eye to see where he’s taken you. Strange, you don’t seem to have moved much at all. Edan’s standing over you - wait, what?");
	}	
	output("\n\nEdan pulls you down the bench a little until your head is hanging over the edge of it. You’re still confused until he steps back a bit and his erect cock comes into view above your face, and only then do you realize what’s about to transpire.");
	output("\n\n<i>“Wait, Edan, it’s not going to f-”</i>");
	output("\n\nYour words degenerate into wet gurgling and slurping noises as Edan fucks the head of his cock between your [pc.lips], your speech valued less than the use of your mouth as a warm fuckhole. Your eyes spring open and water a little as he begins probing the entrance to your throat, making you gag a bit given how unprepared you are.");
	output("\n\n<i>“I said relax, Steele,”</i> Edan continues as he pulls out and slowly pushes back into your depths, eliciting a muffled moan of protest. <i>“You asked to be fucked, I’m just delivering how I see fit. Just lie there and take it, okay?”</i>");
	output("\n\nYou’d glare daggers at him if he could see you, but as it is the only things you can see is the veined underside of his cock covered in your saliva slipping in and out of your lips. Still, though, the idea of getting as much of his cock in your throat as you can is seductive, and technically he <i>is</i> fucking you. You suppose you can let him have his way just this once and inwardly sigh as you relax your muscles, his dick immediately taking advantage of your throat’s compliance.");
	output("\n\n<i>“Good girl, that’s more like it.</i>");
	if (pc.biggestTitSize() >= 12) 
	{
		output("\n\nHe squeezes one of your gigantic breasts and you moan pleasurably into his cock, enticing him to pinch your [pc.nipple] and draw out a longer submissive groan.");
		output("\n\n<i>“The sooner you accept your role the better it is for both of us.”</i>");
	}
	else output("<i>The sooner you accept your role the better it is for both of us.”</i>");
	output("\n\nYour role? What, to lie here unresisting and get whatever hole he wants filled fucked whenever he wants it? You bring a hand up to your neck and hold it there for a moment, feeling his flare bulge your throat outwardly as it conquers your body. Well... the idea isn’t unattractive, you admit to yourself. He pushes in deeper and oh, <i>fuck</i>. Your throat wasn’t meant to work like this, but in a way that’s what makes it hotter.");
	output("\n\nGagging around his thick rod as he gets fully half of it into the recesses of your body is turning you on more than actually being fucked, almost like he’s shaping your holes for his own use. The noises emanating from his mouth above you inform you about how pleased he is with your service, which only turns you on all the more.");
	if (pc.biggestTitSize() >= 12) output(" You already know how much he loves the size of your [pc.breasts] given his intermittent pawing of them as he pumps your gullet, and given how good the agony feels when he pinches or twists your [pc.nipple] it’s not hard to convince yourself that his pleasure is yours.");
	output("\n\nHe pulls back and ruts your [pc.face] again, your gag reflex cowed into submission by the sheer bulk of his cock sliding down your gullet, a little more roughly than before, now that he can tell you’re enjoying being facefucked. It’s not hard, given the way you moan into his cock and your hips unconsciously lift off the bench when he rubs you deep. You have an audience but you don’t even notice them, more intent on the feeling of your perfectly aligned neck bulging and the sight of Edan’s taut ballsack slowly inching towards your face, albeit still over a foot away.");
	if (pc.race().toLowerCase().indexOf("leithan") != -1) output("\n\nDespite being leithan yourself, your throat just isn’t up to the task of taking his entire length no matter how well-fucked it is. Your sweltering marepussy would have been a better bet, you think wistfully.");
	else output("\n\nNot even if you were leithan could you take this entire thing in your throat. Still, being able to swallow half of his cock is a reward in itself. You probably wouldn’t have been better able to take him in your cunt or ass anyway, not that it makes you any less keen on the idea.");
	if (pc.biggestTitSize() >= 12) output(" As Edan’s thrusting grows in intensity, your ginormous breasts jiggle up and down in time to the rhythm of your facefucking, your body getting shuffled down the bench a bit under the persuasive force of a 10-foot leithan mating with your mouth.");
	else output(" As Edan’s thrusting grows in intensity, your body is shuffled down the bench a bit under the persuasive force of a 10-foot leithan mating with your mouth.");
	output("\n\nThe walls of your stomach are already coated in his precum, pooling in the pit of your tummy and warming you from the inside. Given the volume and frequency of the pleased groans from above and the spurts of pre you can feel sliding down your gullet, you’d hazard a guess that he’s getting closer to cumming. You’re almost there yourself, just the sensation of being <i>used</i> so casually in a public place granting you nigh-orgasmic pleasure, not to mention how good getting your throat bored out by Edan’s fat cock feels. You can feel it thickening in you, heralding the impending swelling of your stomach as if the nonstop stream of pre wasn’t enough warning.");
	output("\n\nEdan doesn’t bother to tell you when he cums, the sudden spew of his spunk into your tummy more than enough of an announcement as he shoves his cock into you, settling for half-hilting between your [pc.lips] with a satisfied sigh. You, on the other hand, are working hard underneath his bulk, swallowing frantically to encourage each load swelling your throat into your stomach so you can breathe. You reach up to tap Edan on his scaley side, but he either ignores you or doesn’t notice and you’re left with no choice but to accept the reality: you’re going to be guzzling his cum until you look pregnant.");
	output("\n\nYou can already feel your stomach swelling with seed, and you moan pitifully into Edan’s cock at the tightness in your belly. He reaches down from above to your [pc.nipples] a soft pinch.");
	output("\n\n<i>“Good girl, Steele. Hang in there for a little while longer and I’ll give you a reward.”</i>");
	output("\n\nHe gives your mouth another few nonchalant thrusts, each one adding an entirely excessive amount to the virility already sloshing around in your overburdened tummy. When he pulls out, he does so slowly, your throat getting to re-experience every individual vein and bump on the cock that so easily relegated it to the role of cumdump.");
	output("\n\nHe pulls free with a wet pop having given your insides a fresh covering, and a flow of cum spills forth from between your lips, cascading down your face as your head hangs limply over the end of the bench. You’re an absolute mess, but you’re exhausted enough that you’d entertain the thought of just falling asleep here were it not for the untended fire still raging in your loins. You didn’t get to cum when Edan did, too intent on just being able to breathe.");
	output("\n\nYou hear Edan move, and raise your head a bit to check out what’s happening.");
	output("\n\n<i>“Time for your reward, Steele. Don’t think I didn’t notice how much you got off to being facefucked.”</i>");
	output("\n\nHe walks down alongside the bench until he’s");
	if (pc.isTaur())
	{
		output(" standing next to your tauric hindquarters, and after placing one hand on your lower stomach ");
		if (pc.hasLowerGarment()) output("pulls down your [pc.lowerUndergarment], exposing your [pc.biggestVagina] to the air. He plunges two giant fingers into you with no warning, already soaked from your earlier exertions. You jolt upwards in surprise and need, your legs jerking in the air until Edan softly strokes your still-pudgy tummy.");
		else output("slowly strokes downwards until his fingers are resting on your exposed [pc.biggestVagina]. He plunges two giant fingers into you with no warning, already soaked from your earlier exertions. You jolt upwards in surprise and need, your legs jerking in the air until Edan softly strokes your still-pudgy tummy.");
		output("\n\n<i>“Relax girl,”</i> He says while rubbing your [pc.skinFurScales], <i>“Just lie back and take it in.”</i>");
		output("\n\nYou moan in subdued pleasure, equally happy that you’re finally being taken care of and surprised that he can be so gentle about it. He slips a third finger in and pumps you slowly, getting a feel for your pussy.");
		output("\n\n<i>“Damn, Steele, you’re pretty pent up. If I didn’t know better, I’d say you were in heat what with all the pheromones you’re putting out. You need to come see me more often.”</i>");
		output("\n\nYou’re too insensate to consider replying, content instead to place your arms on the floor and use them to brace yourself as you lewdly moan, your mounting pleasure causing you to needily thrust your hindquarters into his fingers as best you can. Edan increases the pace in response, and it’s not long before he brings you to a couple of your own orgasms as you shudder in his grip, your lower half bucking under the firmness of his hand holding you down.");
		output("\n\nWhen you beg Edan to stop as you can’t take any more, he brings you to a final crescendo and withdraws his hand from your still-spasming pussy. You lie there panting, awash in the endorphins and satisfaction as your tired legs splay to either side. Edan gets up and pads over to your other side, easily lifting your tauric form off the benches and depositing you back onto your shaky legs, supporting you with a powerful arm as you get used to standing again.");
		output("\n\n<i>“Good thing we’ve got more than two legs, huh?”</i> He quips before turning to leave. <i>“See ya round, Steele. Sooner rather than later, preferably.”</i>");
		output("\n\nSeems like Edan <i>is</i> capable of being a nice guy, you think to yourself as you swallow the remainder of his cum down your abused throat, and gather yourself before heading out.");
	}
	else
	{
		output(" standing next to you, and after placing one hand on your lower stomach ");
		if (pc.hasLowerGarment()) output("pulls down your [pc.lowerUndergarment], exposing your [pc.biggestVagina] to the air. He plunges a giant finger into you with no warning, already soaked from your earlier exertions. You jolt upwards in surprise and need, your legs jerking in the air until Edan softly strokes your still-pudgy tummy and pushes you back down.");
		else output("slowly strokes downwards until his fingers are resting on your exposed [pc.biggestVagina]. He plunges a giant finger into you with no warning, already soaked from your earlier exertions. You jolt upwards in surprise and need, your legs jerking in the air until Edan softly strokes your still-pudgy tummy and pushes you back down.");
		output("\n\n<i>“Relax, Steele,”</i> He says while rubbing your [pc.skinFurScales], <i>“Just lie back and take it in.”</i>");
		output("\n\nYou moan in subdued pleasure, equally happy that you’re finally being taken care of and surprised that he can be so gentle about it. He slips another finger in and pumps you slowly, getting a feel for your pussy.");
		output("\n\n<i>“Damn, Steele, you’re as pent up as a leithan girl in heat. You should come see me more often.”</i>");
		output("\n\nYou’re too insensate to consider replying, content instead to place your arms on the floor and use them to brace yourself as you lewdly moan, your mounting pleasure causing you to needily thrust your [pc.butt] upward into his fingers as best you can. Edan increases the pace in response, and it’s not long before he brings you to a couple of your own orgasms as you shudder in his grip, your lower half and [pc.legOrLegs] bucking under the firmness of his hand holding you down.");
		output("\n\nWhen you beg Edan to stop as you can’t take any more, he brings you to a final crescendo and withdraws his hand from your still-spasming pussy. You lie there panting, awash in the endorphins and satisfaction as your tired legs splay to either side of the bench. Edan gets up and shifts his arm under you, easily lifting your body off the bench and depositing you back onto your shaky [pc.legOrLegs], supporting you with the other arm as you get used to standing again.");
		output("\n\n<i>“Good thing I didn’t fuck you for real or there’d be no chance of you walking, ha!”</i> He quips before turning to leave. <i>“See ya round, Steele. We’re gonna have some real fun next time.”</i>");
		output("\n\nSeems like Edan <i>is</i> capable of being a nice guy, you think to yourself as you swallow the remainder of his cum down your abused throat, and gather yourself before heading out. You wonder what’s going to happen <i>“next time”</i> and have to stop yourself from fantasizing before you lose it and just start masturbating right here, although after your public facefucking you’re starting to think that’s not such a big deal.");
	}
	
	pc.orgasm();
	pc.exhibitionism(15);
	processTime(20);
	pc.loadInMouth(chars["EDAN"]);
	flags["EDAN_FUCKED"] = 3;
	processTime(20);
	addButton(0, "Next", mainGameMenu);
}

public function edanSexFourth():void
{
	generateMap();
	
	clearOutput();
	clearMenu();
	edanHeader(true);
	
	var x:int = pc.cuntThatFits(chars["EDAN"].cockVolume(0));
	if(x < 0) x = pc.biggestVaginaIndex();
	
	output("You’re in the Mess’ attached bar, thankfully separated from the deafening din of the open hall by a sturdy wall and thick windows. Though still smoky, the bar has a much calmer, friendlier atmosphere, and you’re quickly able to find a seat thanks to a hostess at the door, wearing a strikingly skimpy version of the Carver uniform: a simple black vest, a thong, and fishnets to cover most of her body. The rest of the staff seems to be just as scantily clad, if not more so: a stage has been erected on one wall, where a topless ausar girl in nothing but her fishnets and a pair of pasties is currently singing to the accompaniment of an old-earth jazz band made up of raskvel in little tuxedos. The bar here is clearly catering to a higher-class clientele, and most of the people lounging around are fellow spacers and pioneers coming in for the planet rush, while others have the air of off-duty U.G.C. scouts and engineers. Almost everyone has a drink or a half-nude server in their lap, maybe both. This place is a weird mesh of retro earth and sensuality, that’s for sure.");
	output("\n\nEdan points you to a table in one of the darker corners of the tavern and gives you a light swat on your [pc.butt] to put you on your way. You stick your tongue out at him while he gives you a smile and goes to talk to the owner, presumably about the <i>“something special”</i> he mentioned earlier. You sit down and relax for a bit, content to");
	if (pc.hasArmor()) output(" strip out of your [pc.armor] and");
	output(" wait for Edan and see what he’s got in store for you. He arrives with a bottle in one hand and a bag in the other, the comical size of them in his mitts provoking you to giggle. He shrugs with a grin.");
	output("\n\n<i>“They don’t exactly make leithan-sized bottles out here and I don’t wanna pay for a keg. Anyway, this is for us. The bag is for you, but drinks come first.”</i>");
	output("\n\nHe hands you the bottle and sits next to you, waiting on you to pour some drinks. You ask where the waitress went, but he just gives you a mysterious smile and says nothing. Well, whatever. You pour some drinks and knock them back, enjoying the warmth of the alcohol as you lean against Edan. He slips an arm around your shoulders and you smile, feeling safe in his grasp. You stay like that for a little while before he removes his arm and gives you the bag.");
	output("\n\n<i>“Take a look at what’s inside.”</i>");
	output("\n\nYou reach a hand in and feel around. Some kind of silky clothing? The curiosity is too much, and you open the bag to check the contents. In the darkness of the tavern, all you can really tell is that it’s black. You upend the bag onto the seat and the clothes spill out. It’s a black vest, a thong, fishnets, and some other things. The Carver uniform? You look up at Edan, who grins down at you.");
	output("\n\n<i>“Dance for me, Steele. I want a performance.”</i>");
	output("\n\nYou look back at the uniform.");
	if (pc.isTaur())
	{
		output("\n\n<i>“Edan, I don’t think all of this is going to fit.”</i>");
		output("\n\n<i>“Oh, don’t worry about that too much. The uniforms are standardized for humanoid races, but they have a bunch of extra stuff for a girl like you. Just put on what you can.”</i>");
		output("\n\nYou sort through the pile of clothing and pick out the bits and bobs you’ll be able to put on before getting up and turning to face Edan, looking him in the eye while your [pc.breasts] reveal themselves as you slowly remove your [pc.upperGarments]. You rub yourself theatrically, running your fingers over your [pc.nipples] and moaning for him");
		if (pc.biggestTitSize() >= 4) output(" as you playfully push your tits together before letting them fall, jiggling");
		output(".")
		output(" He grins and motions to keep going, clearly pleased with how into it you are. He shifts a bit on his seat, and if you had to guess you’d say that’s because he’s getting hard. You give him an impish smile and continue teasing him, slowly rubbing your hands up and down your torso before you pick up the vest laid on the seat. You pull it against your chest to see if it’ll fit and ask Edan for his opinion.");
		if (pc.biggestTitSize() < 4)
		{
			output("\n\n<i>“Looks like it’ll fit. I wanna see you with it on, Steele. I think you’d look good in the uniform, as sleek as you are.”</i>");
			output("\n\nYou slip into the vest and it tightens around your modest bust, tightening a bit at the sides of your tits to push them inwards and create a crest of cleavage visible to anyone looking. It’s snug around your waist too, but not suffocatingly so.");
			output("\n\n<i>“I was right. You <i>do</i> look good in it.”</i>");
		}
		else if (pc.biggestTitSize() < 12)
		{
			output("\n\n<i>“It’ll look great on you. The material is pretty flexible, so it should fit your frame even with tits like yours.”</i>");
			output("\n\nYou slip into the vest and it tightens around your sizeable bust, tightening a bit at the sides of your tits to push them inwards and create a crest of cleavage visible to anyone looking. It’s snug around your waist too, but not suffocatingly so.");
			output("\n\n<i>“See? I told you you’d look great.”</i>");
		}
		else
		{
			output("\n\n<i>“Damn, Steele. The material is pretty flexible, but I don’t know if it’s going to fit you with tits that big. The uniforms weren’t meant for broodmares, you know? Hell, not that I’m complaining. As far as I’m concerned, you can walk around like that all day. Might not get much done, what with how busy we’d be. Try it on, though.”</i>");
			output("\n\nYou struggle into the vest and it stretches around your massive bust, your tits threatening to pop out of your top at any moment if you inhale too deeply. The fabric that’s meant to go around your waist has been drawn upwards by the stretching you’ve given it, meaning that the vest is now more or less a strapless bra for your [pc.breasts] with your [pc.nipples] plainly visible through the fabric. Edan’s mouth is hanging slightly ajar before he realizes he’s staring.");
			output("\n\n<i>“Holy shit, Steele. Anyone ever tell you that you have a beautiful body? You are easily the sexiest girl I’ve ever seen.”</i>");
		}
		output("\n\nHappy that he’s pleased with what you’ve got going on, you continue your impromptu striptease as you remove " + (pc.hasLowerGarment() ? "your [pc.lowerUndergarment]" : "the rest of your gear") + ". Edan’s rapidly growing more restless as you do, moving around on his seat and breathing more heavily than he was before you started. It’s nice to be appreciated. You look at the thong and briefly wonder how you’re going to put it on.");
		if (!pc.hasCock()) output("\n\nYou place it on the floor and crouch a bit, using your tail to snag one of the leg openings and, with some work, wiggle it up your hind legs until it’s comfortably on your butt. Jeez, Edan said this stuff was for leithans but it’s barely a string across your pussy. Maybe the designers thought they were smaller. Either way, you’re almost done! You bend down to affix the little black bows to your front legs and as you stand back up, you realize Edan is right behind you.");
		else output("\n\nYou place it on the floor and crouch a bit, using your tail to snag one of the leg openings and, with some work, wiggle it up your hind legs until it’s comfortably on your butt. Jeez, Edan said this stuff was for leithans but it’s barely a string across your pussy and it’s definitely not containing your dick. Maybe the designers thought they were smaller. Either way, you’re almost done! You bend down to affix the little black bows to your front legs and as you stand back up, you realize Edan is right behind you.");
		output("\n\n<i>“That uniform looks great on you. Pity it was such a pain to put on, though.”</i>");
		output("\n\n<i>“Why’s that?”</i> You inquire, half-turning your torso to look at him.");
		output("\n\n<i>“Well, I was going to ask you to dance in it,”</i> Edan says as he places a hand on the top of your [pc.butt], <i>“but now that I’m here and you’ve got me worked up, I’m one second away from ripping it off to fuck you.”</i>");
		output("\n\n<i>“Right here? In,”</i> you lower your voice to a whisper. <i>“In the tavern?”</i> You ask Edan half in disbelief, half in pure undisguised horniness. <i>Finally</i>. Your [pc.pussy " + x + "] is already wet at the possibility of being bred, something he’s sure to notice given he’s right behind you and you’re both taurs. You can smell his arousal mounting from below, your body reacting with its own pheromones and instantly making you lustier.");
		if (pc.hasCock()) output(" Your prick involuntarily twitches, swelling to erection under your belly.");
		output("\n\n<i>“Right here.”</i> He says as he idly nudges your thong aside and slips a finger into your boiling hot pussy, making you start with a breathy <i>“Oh!”</i> while you instinctively clench down on him in a futile attempt to draw him further in. He points at the seat he was sitting on.");
		output("\n\n<i>“Put your front legs up on that.”</i>");
		output("\n\nYou trot over to the seat, stomach aflutter and pussy aflame as he follows you with his hand still resting on your butt and his finger still inside you. Climbing up on the seat with your forelegs, you moan quietly as Edan pulls his finger out and puts both of his hands on your rump, testing how well you can take his weight. You hold steady, your [pc.legOrLegs] quaking more in arousal than any kind of stress, your pussy dripping on the floor below you as Edan spreads it open with his fingers and fills the air with your pheromones.");
		output("\n\n<i>“</i>Fuck<i>. I hope you’re ready, Steele, because I’m not gonna be gentle.”</i>");
		output("\n\nHe rears up and mounts your midsection, his giant equine cock slapping the underside of your belly as he does. You scrabble a bit at the added weight but stay standing, strength inspired by your intense desire to be spread wide and roughly fucked by his maleness. And spread <i>wide</i> you’re going to be.");
		output("\n\nYou know he’s huge, but size takes on a different dimension when you actually have a gigantic leithan male pracically enveloping you. You feel his massive dick slide back from your belly as he adjusts his footing above you, getting ready to plunge it between your eager lower lips. You push backwards against him, a quiet whine of frustration escaping your mouth. You <i>need</i> his cock sheathed in you, impaling you and throbbing.");
		output("\n\nHe aligns himself against your dribbling pussy and doesn’t bother telling you to relax – as the blunted tip of his horse-like penis brushes your labia, your hindquarters unconsciously jolt and the next thing you know you’re moaning in ecstasy while his cockhead parts your folds, advancing slowly into a passage that was never meant to be stretched so wide. You pant and moan in mixed agony and pleasure, already on the verge of orgasm as Edan’s cock conquers the first few inches of the wet and warm walls of your [pc.pussy " + x + "].");
		
		pc.cuntChange(x, chars["EDAN"].cockVolume(0));
		
		output("\n\nHe pulls out, leaving you painfully empty for less than a second before ramming back into your still-gaping hole and this time you <i>do</i> cum, teeth clenched painfully tight to avoid screaming and drawing attention to the two of you in the tavern. Your vagina ripples around the head of his cock, desperately trying to entice it into filling you with a hot load of leithan spunk. Edan gives your [pc.butt] a smack just to let you know that it’s not over yet, and pushes further in. You gasp as your bent forelegs unexpectedly buckle, causing you to fall to your shaky knees on the seat.");
		output("\n\nEdan’s front half falls a few inches as well, following your descent and pushing your front half further into the seat as his weight lands on you. The rapid movement has the added effect of getting another few inches into your already overstuffed pussy, and at that you can’t help but let out a small scream of surprise and pleasure");
		if (pc.hasCock()) output(", your cock spurting a rope of jizz across the leather under you.");
		else output(".");
		output("\n\n<i>“You really love this, don’t you Steele?”</i> Edan says as he draws back for another steady insertion. <i>“I’m starting to understand you more now - you keep coming back to me, and I think you actually like this more than I do.”</i>");
		output("\n\nHe grunts as his oversized manhood forces your seizing and dripping cunt into submission, slipping further into your depths until you’re sure he must be at least halfway hilted. You’re not sure anyone or any<i>thing</i> will ever be able to fuck your pussy properly again but this is well worth it, you think as your back half sags into his penetration. Edan speaks up again as he drills you, the tip of his cock getting closer and closer to your cervix.");
		output("\n\n<i>“Not that I don’t like fucking you, but for you it seems like something more than that. You just love...”</i>");
		output("\n\nHe seizes your midsection and pulls you towards him, pumping you with his powerful hips as he does, making you cry out in alarm as you feel his flared head finally come into contact with the opening to your womb, dribbling warm precum into the recesses of your thoroughly stretched cunt.");
		output("\n\n<i>“...To submit. That’s what it is, isn’t it? You just can’t help wetting yourself at the thought of being fucked full of cum, whether it’s your throat or your pussy. You love playing the part of the bitch.”</i>");
		output("\n\nYou groan as he starts fucking you harder, more self-assured in his discovery of you, his hands sliding down your body to your humanoid half and pulling you backwards by your shoulders until you’re looking up at him with a slutty expression on your face, cowed into submission by the gigantic cock invading your nethers. You can’t even tell him he’s wrong, and he grins down at you.");
		output("\n\n<i>“I knew it. You really </i>are<i> the sexiest girl I’ve ever seen.”</i>");
		output("\n\nYou’re too incoherent to reply, your entire canal wrapped around what feels like a rock-hard pillar of flesh, muscles too weak to flex but retaining your tightness by virtue of his size. You moan instead, the only thing you’re really capable of doing at the moment. You suddenly realize you can feel his cock actually getting slightly wider inside you followed by a sensation of intense warmth in your womb. You remember from your rough facefuckings that this is what happened immediately before he came, and thrust back at him with a desperate renewed vigor, panting in your eagerness to be filled and overflowing.");
		output("\n\n<i>“Fuck, that’s the way, Steele. You’ll get it real soon.”</i>");
		output("\n\nHe starts pumping you like a piston, each thrust accompanied by lewd splatters and fretful moans as your pussy acquiesces to Edan’s throbbing cock, wetness coursing down your hind legs and dripping onto the floor from your [pc.pussy " + x + "]. He pulls back once more and slams into you, grabbing your [pc.breasts] and sealing your lips with a rough kiss as he starts to cum, your surprise immediately giving way to orgasmic delight as a continuous stream of leithan sperm jets into your waiting womb.");
		if (!pc.hasCock()) output("\n\nYou moan into Edan’s mouth as his tongue wraps around yours, being dominated at both ends making you weak enough at the knees that you’d have collapsed were his stiff, pulsing cock not holding you upright. Your [pc.belly] rapidly swells outwards as your womb is forced to accept load after load as he pumps you with short hip motions, his spunk drowning your fallopian tubes and eventually venting back out of your abused cunt, spraying down your legs as his ejaculation continues.");
		else output("\n\nYou moan into Edan’s mouth as his tongue wraps around yours, being dominated at both ends making you weak enough at the knees that you’d have collapsed were his stiff, pulsing cock not holding you upright. Your [pc.belly] rapidly swells outwards as your womb is forced to accept load after load as he pumps you with short hip motions, his spunk drowning your fallopian tubes and eventually venting back out of your abused cunt, spraying down your legs as his ejaculation continues. You clench your teeth, your own prick soaking the seat in release beneath you.");
		output("\n\nBy the time he finishes you’re a sodden wreck, your shaking humanoid half only upright because he’s supporting you with his hands. He lets you free and you collapse onto the seat with a moaning post-orgasm sigh, ultimately sated in the wake of being fucked so utterly. Edan slowly dismounts, taking care to avoid being caught in the rapidly increasing flow of jism issuing forth from your gaping cunt.");
		output("\n\nYou groan at the sensation of him pulling out of you, his flared head scraping your tingling nerves on its way out and making you quiver, aftershocks running through your body. He slips free with a wet pop and a cascade of jizz follows, splattering into the drains running through the floor of the tavern as you collapse only to find yourself being held up by Edan.");
		output("\n\n<i>“Can’t collapse here, Steele,”</i> he says with a grin. <i>“We’ve got to get you out of that uniform, at the least.”</i>");
		output("\n\nRight, the uniform. You look down to see he must have ripped the top while he was mauling your tits, the bows around your legs are polka-dotted with your juices and his cum, and while you can’t see the thong you were wearing or feel anything in your back legs anyway, you suspect that didn’t turn out so hot either. You turn to Edan and he shrugs sheepishly.");
		output("\n\n<i>“We’ll just put them back in the bag. They must deal with this shit all the time, right?”</i>");
		if (!pc.isCrotchExposed()) output("\n\nYou nod, too tired to bother suggesting an alternative. Edan strips you down with surprising gentleness, packing the disheveled clothes into the bag they came in as you wipe yourself down and start to get back into your [pc.gear]. Your belly is still swollen to the point you’re probably going to be mistaken for pregnant, and there’s an unavoidable trail of warm cum oozing into your [pc.lowerGarment], but at least you’re dressed.");
		else output("\n\nYou nod, too tired to bother suggesting an alternative. Edan strips you down with surprising gentleness, packing the disheveled clothes into the bag they came in as you wipe yourself down. Your belly is still swollen to the point you’re probably going to be mistaken for pregnant, and there’s an unavoidable trail of warm cum oozing down your legs. Being nude, there’s nothing to hide the fact you’ve been freshly taken and fucked.");
		output(" It’s nice being marked by Edan, you think as you idly heft yourself to your still-shaky feet and your body sloshes with cum, but it’s kind of inconvenient to be carrying this much weight. It’s more suited to a broodmare, the kind of girl that gets fucked full of babies over and over rather than the type of girl out adventuring. Edan interrupts your momentary reverie.");
		output("\n\n<i>“Time we got out of here, Steele. Just leave the bag there, and hopefully they still let us in when we come back.”</i>");
		output("\n\n<i>“Sounds like a plan,”</i> you smirk as you offload the bag onto the seat you were so dominantly taken on just minutes before, musing on the thought that if Edan can fuck you like this often enough, you’re going to run out of new places on Tarkus to bang pretty quickly. You turn back to him and he smiles at you before leaning down to give you a gentle kiss, juxtaposing it by pulling your [pc.upperGarments] back down to roughly cup your [pc.breasts] and tweak your [pc.nipples], eliciting a soft moan of tired pleasure from you before he pulls back and grins.");
		output("\n\n<i>“My favorite bitch. Come see me again real soon, Steele. I can fuck you like that all day if you want.”</i>");
		output("\n\nWith that, he turns and makes to leave the tavern. You watch him go and find yourself thinking. His bitch? Well... you did love the way he split you apart with his fat cock to fill your womb. And your stomach before that. Looking at the results, you guess he has a point. You’re still an individual, though! You have stuff to do that isn’t being mated for hours a day, fucked full of leithan babies and mothering them, your tits swelling with milk and your stomach with seed. Not that you can think of it right now, but it’ll come back to you, no doubt. You make yourself decent again before you walk out there, and exit the room.");
	}
	else
	{
		output("\n\n<i>“You won’t be able to fit everything on because there’s some stuff in there for non-humanoids, but just put on what looks like it’ll fit.”</i>");
		output("\n\nYou sort through the pile of clothing and pick out the bits and bobs you’ll be able to put on before getting up and turning to face Edan, looking him in the eye while your [pc.breasts] reveal themselves as you slowly remove your [pc.upperGarments]. You rub yourself theatrically, running your fingers over your [pc.nipples] and moaning for him");
		if (pc.biggestTitSize() >= 4) output(" as you playfully push your tits together before letting them fall, jiggling");
		output(".")
		output("\n\nHe grins and motions to keep going, clearly pleased with how into it you are. He shifts a bit on his seat, and if you had to guess you’d say that’s because he’s getting hard. You give him an impish smile and continue teasing him, slowly rubbing your hands up and down your torso before you pick up the vest laid on the seat. You pull it against your chest to see if it’ll fit and ask Edan for his opinion.");
		if (pc.biggestTitSize() < 4)
		{
			output("\n\n<i>“Looks like it’ll fit. I wanna see you with it on, Steele. I think you’d look good in the uniform, as sleek as you are.”</i>");
			output("\n\nYou slip into the vest and it tightens around your modest bust, tightening a bit at the sides of your tits to push them inwards and create a crest of cleavage visible to anyone looking. It’s snug around your waist too, but not suffocatingly so.");
			output("\n\n<i>“I was right. You <i>do</i> look good in it.”</i>");
		}
		else if (pc.biggestTitSize() < 12)
		{
			output("\n\n<i>“It’ll look great on you. The material is pretty flexible, so it should fit your frame even with tits like yours.”</i>");
			output("\n\nYou slip into the vest and it tightens around your sizeable bust, tightening a bit at the sides of your tits to push them inwards and create a crest of cleavage visible to anyone looking. It’s snug around your waist too, but not suffocatingly so.");
			output("\n\n<i>“See? I told you you’d look great.”</i>");
		}
		else
		{
			output("\n\n<i>“Damn, Steele. The material is pretty flexible, but I don’t know if it’s going to fit you with tits that big. The uniforms weren’t meant for broodmares, you know? Hell, not that I’m complaining. As far as I’m concerned, you can walk around like that all day. Might not get much done, what with how busy we’d be. Try it on, though.”</i>");
			output("\n\nYou struggle into the vest and it stretches around your massive bust, your tits threatening to pop out of your top at any moment if you inhale too deeply. The fabric that’s meant to go around your waist has been drawn upwards by the stretching you’ve given it, meaning that the vest is now more or less a strapless bra for your [pc.breasts] with your [pc.nipples] plainly visible through the fabric. Edan’s mouth is hanging slightly ajar before he realizes he’s staring.");
			output("\n\n<i>“Holy shit, Steele. Anyone ever tell you that you have a beautiful body? You are easily the sexiest girl I’ve ever seen.”</i>");
		}
		output("\n\nHappy that he’s pleased with what you’ve got going on, you continue your impromptu striptease as you remove " +(pc.hasLowerGarment() ? "your [pc.lowerUndergarment]" : "the rest of your gear") + ". Edan’s rapidly growing more restless as you do, moving around on his seat and breathing more heavily than he was before you started. It’s nice to be appreciated.");
		output("\n\nYou pick up the thong and twirl it around your fingers, your other hand creeping down your [pc.stomach] to find your pubic mound, rubbing tantalizingly close to your [pc.clits]. You slip one leg through the thong and sway your [pc.hips] from side to side as you slowly pull it up until it’s comfortably hugging your nethers. You bend down to put the kneesocks and accompanying little black bows on your legs and realize Edan is standing right behind you.");
		output("\n\n<i>“That uniform looks great on you. Pity we’re not gonna get much use out of it.”</i>");
		output("\n\n<i>“Why’s that?”</i> you inquire, standing to look ");
		if (pc.tallness < 108) output("up ");
		output("at him.");
		output("\n\n<i>“Well, I was going to ask you to dance in it,”</i> Edan says as he moves closer, putting a giant hand on your [pc.butt] and gently pulling you against his body, <i>“but now that I’m here and you’ve got me worked up, I’m one second away from ripping it off to fuck you.”</i>");
		output("\n\n<i>“Right here? In..”</i> you lower your voice to a whisper. <i>“In the tavern?”</i> You ask Edan half in disbelief, half in pure undisguised horniness. <i>Finally</i>. Your [pc.pussy " + x + "] is already wet at the possibility of being bred, a trickle of moisture slowly rolling down your inner thigh. You can smell his arousal mounting from below, the musk of leithan pheromones entering your nostrils and instantly making you lustier.");
		output("\n\n<i>“Right here,”</i> he says as he idly nudges your thong aside and slips a finger into your boiling hot pussy, making you start with a breathy <i>“Oh!”</i> while you instinctively clench down on him in a futile attempt to draw him further in. He points at the wall.");
		output("\n\n<i>“Stand up against that and spread your legs, babe.”</i>");
		output("\n\nYou slowly walk over to the seat, your motion halting as he follows you with his finger still resting inside the opening to your pussy. Placing your hands against the wall, you moan quietly as Edan pulls his finger out");
		if(pc.hasLegs()) output(", allowing you to spread your [pc.legs]");
		output(". Your legs quake in arousal, your pussy dripping on the floor below you as Edan spreads it open with his fingers and fills the air with your aroused scent.");
		output("\n\n<i>“</i>Fuck<i>. I hope you’re ready, Steele, because I’m not gonna be gentle.”</i>");
		output("\n\nHe rears up and places his forelegs against the wall, easily encompassing you with his bulk, his giant equine cock slapping against your pussy as he does. You shake and moan a bit at the impact but stay steady, strength inspired by your intense desire to be spread wide and roughly fucked by his maleness.");
		output("\n\nAnd spread <i>wide</i> you’re going to be. You know he’s huge, but size takes on a different dimension when you actually have a gigantic leithan male practically enveloping you. You feel his massive dick slide across your passion-inflamed lips as he adjusts his footing above you, getting ready to fill you up. You rub your needy pussy along his length, a quiet whine of frustration escaping your mouth. You <i>need</i> his cock sheathed in you, impaling you and throbbing.");
		output("\n\nHe aligns himself against your dribbling cunt and doesn’t bother telling you to relax – as the blunted tip of his horse-like penis brushes your labia, you unconsciously jolt and the next thing you know you’re moaning in ecstasy while his cockhead parts your folds, advancing slowly into a passage that was never meant to be stretched so wide. You pant and moan in mixed agony and pleasure, already on the verge of orgasm as Edan’s cock conquers the first few inches of the wet and warm walls of your [pc.pussy " + x + "].");
		
		pc.cuntChange(x, chars["EDAN"].cockVolume(0));
		
		output("\n\nHe pulls out, leaving you painfully empty for less than a second before ramming back into your still-gaping hole and this time you <i>do</i> cum, teeth clenched painfully tight to avoid screaming and drawing attention to the two of you in the tavern. Your vagina ripples around the head of his cock, desperately trying to entice it into filling you with a hot load of leithan spunk.");
		output("\n\nEdan gives your [pc.butt] a smack just to let you know that it’s not over yet, and pushes further in. You gasp as your legs unexpectedly buckle, causing you to fall to a half-crouch before you tense your legs and catch yourself. The new angle and clenching of your pussy draws Edan another few inches into your already overstuffed pussy, and at that you can’t help but let out a small scream of surprise and pleasure.");
		output("\n\n<i>“You really love this don’t you Steele?”</i> Edan says as he draws back for another steady insertion. <i>“I’m starting to understand you more now. You keep coming back to me, and I think you actually like this more than I do.”</i>");
		output("\n\nHe grunts as his oversized manhood forces your seizing and dripping cunt into submission, slipping further into your depths until you’re sure he must be at least halfway hilted. You’re not sure anyone or any<i>thing</i> will ever be able to fuck your pussy properly again but this is well worth it, you think as you sag into his penetration. Edan speaks up again as he drills you, the tip of his cock getting closer and closer to your cervix.");
		output("\n\n<i>“Not that I don’t like fucking you, but for you it seems like something more than that. You just love...”</i>");
		output("\n\nHe seizes your [pc.hips] in his giant hands and pulls you towards him, pumping you with his powerful hips as he does, making you cry out in alarm as you feel his flared head finally come into contact with the opening to your womb, dribbling warm precum into the recesses of your thoroughly stretched cunt.");
		output("\n\n<i>“...To submit. That’s what it is, isn’t it? You just can’t help wetting yourself at the thought of being fucked full of cum, whether it’s your throat or your pussy. You love playing the part of the bitch.”</i>");
		output("\n\nYou groan as he starts fucking you harder, more self-assured in his discovery of you, his hands sliding down up body and pulling you backwards by your shoulders until you’re looking up at him with a slutty expression on your face, cowed into submission by the gigantic cock invading your nethers. You can’t even tell him he’s wrong, and he grins down at you.");
		output("\n\n<i>“I knew it. You really </i>are<i> the sexiest girl I’ve ever seen.”</i>");
		output("\n\nYou’re too incoherent to reply, your entire canal wrapped around what feels like a rock-hard pillar of flesh, muscles too weak to flex but retaining your tightness by virtue of his size. You moan instead, the only thing you’re really capable of doing at the moment. You suddenly realize you can feel his cock actually getting slightly wider inside you followed by a sensation of intense warmth in your womb. You remember from your rough facefuckings that this is what happened immediately before he came, and thrust back at him with a desperate renewed vigor, panting in your eagerness to be filled and overflowing.");
		output("\n\n<i>“Fuck, that’s the way, Steele. You’ll get it real soon.”</i>");
		output("\n\nHe starts pumping you like a piston, each thrust accompanied by lewd splatters and fretful moans as your pussy acquiesces to Edan’s throbbing cock, wetness coursing down hind legs and dripping onto the floor from your [pc.pussy " + x + "]. He pulls back once more and slams into you, lifting you completely off the ground and impaling you while you’re suspended in the air, sealing your lips with a rough kiss as he starts to cum, your surprise immediately giving way to orgasmic delight as a continuous stream of leithan sperm jets into your waiting womb.");
		if (!pc.hasCock()) output("\n\nYou moan into Edan’s mouth as his tongue wraps around yours, being dominated at both ends making you weak enough at the knees that you’d have collapsed were he not holding you on his stiff, pulsing cock as he sprays your womb. Your [pc.belly] rapidly swells outwards as your womb is forced to accept load after load as he pumps you with short hip motions, his spunk drowning your fallopian tubes and eventually venting back out of your abused cunt, spraying down your legs as his ejaculation continues.");
		else output("\n\nYou moan into Edan’s mouth as his tongue wraps around yours, being dominated at both ends making you weak enough at the knees that you’d have collapsed were he not holding you on his stiff, pulsing cock as he sprays your womb. Your [pc.belly] rapidly swells outwards as your womb is forced to accept load after load as he pumps you with short hip motions, his spunk drowning your fallopian tubes and eventually venting back out of your abused cunt, spraying down your legs as his ejaculation continues. You clench your teeth as your cock spurts uselessly into the air, ropes of jizz splattering to the floor.");
		output("\n\nBy the time he finishes you’re a sodden wreck, completely incapable of supporting yourself were you on the ground. Edan slowly pulls you off his cock, taking care to avoid being caught in the rapidly increasing flow of jism issuing forth from your gaping cunt. You groan at the sensation, his flared head scraping your tingling nerves on its way out and making you quiver, aftershocks running through your body. He slips free with a wet pop and a cascade of jizz follows, splattering into the drains running through the floor of the tavern as he carries you back to a seat.");
		output("\n\n<i>“Can’t collapse here, Steele,”</i> He says with a grin. <i>“We’ve got to get you out of that uniform, at the least.”</i>");
		output("\n\nRight, the uniform. You look down to see he must have ripped the top while he was mauling your tits, the bows around your legs are polka-dotted with your juices and his cum, and while you can’t feel anything in your legs or see the thong under the coating of cum your lower half has, you suspect that didn’t turn out so hot either. You turn to Edan and he shrugs sheepishly.");
		output("\n\n<i>“We’ll just put them back in the bag. They must deal with this shit all the time, right?”</i>");
		if (!pc.isCrotchExposed()) output("\n\nYou nod, too tired to bother suggesting an alternative. Edan strips you down with surprising gentleness, packing the disheveled clothes into the bag they came in as you wipe yourself down and start to get back into your [pc.gear]. Your belly is still swollen to the point you’re probably going to be mistaken for pregnant, and there’s an unavoidable trail of warm cum oozing into your [pc.lowerGarment], but at least you’re dressed.");
		else output("\n\nYou nod, too tired to bother suggesting an alternative. Edan strips you down with surprising gentleness, packing the disheveled clothes into the bag they came in as you wipe yourself down. Your belly is still swollen to the point you’re probably going to be mistaken for pregnant, and there’s an unavoidable trail of warm cum oozing down your legs. Being nude, there’s nothing to hide the fact you’ve been freshly taken and fucked.");
		output("\n\nIt’s nice being marked by Edan, you think as you idly heft yourself to your still-shaky feet and your tummy sloshes with cum, but it’s kind of inconvenient to be carrying this much weight. It’s more suited to a breeding bitch, the kind of girl that gets fucked full of babies over and over rather than the type of girl out adventuring. Edan interrupts your momentary reverie.");
		output("\n\n<i>“Time we got out of here, Steele. Just leave the bag there, and hopefully they still let us in when we come back.”</i>");
		output("\n\n<i>“Sounds like a plan,”</i> you smirk as you offload the bag onto the seat you were deposited on moments before, musing on the thought that if Edan can fuck you like this often enough, you’re going to run out of new places on Tarkus to bang pretty quickly. You turn back to him and he smiles at you before leaning down to give you a gentle kiss, juxtaposing it by pulling your [pc.upperGarments] back down to roughly cup your [pc.breasts] and tweak your [pc.nipples], eliciting a soft moan of tired pleasure from you before he pulls back and grins.");
		output("\n\n<i>“My favorite bitch. Come see me again real soon, Steele. I can fuck you like that all day if you want.”</i>");
		output("\n\nWith that, he turns and makes to leave the tavern. You watch him go and find yourself thinking. His bitch? Well... you did love the way he split you apart with his fat cock to fill your womb. And your stomach before that. Looking at the results, you guess he has a point. You’re still an individual, though! You have stuff to do that isn’t being mated for hours a day, fucked full of leithan babies and mothering them, your tits swelling with milk and your stomach with seed. Not that you can think of it right now, but it’ll come back to you, no doubt. You make yourself decent again before you walk out there, and exit the room.");
	}
	
	processTime(60);
	pc.loadInCunt(chars["EDAN"],x);
	pc.orgasm();
	pc.exhibitionism(3);
	flags["EDAN_FUCKED"] = 4;
	addButton(0, "Next", mainGameMenu);
}

public function edanSexFifth():void
{
	generateMap();
	
	clearOutput();
	clearMenu();
	edanHeader(true);
	
	var x:int = pc.cuntThatFits(chars["EDAN"].cockVolume(0));
	if(x < 0) x = pc.biggestVaginaIndex();
	
	output("You walk up the protruding ramp with him and note the entrance is massively tall -");
	if (pc.tallness >= 108)
	{	
		output(" a relief to you, being as big as you are. Dealing with doorways on most planets is such a drag");
		if (flags["LANDED_ON_TEXAS"] != undefined) output(", New Texas being the last one you can remember fitting in everywhere");
		output(". You turn your head as Edan activates the lights with a voice command.");
	}
	else if ((pc.tallness < 108) && (pc.tallness > 84))
	{
		output(" tall enough that you probably couldn’t reach the door frame without");
		if (pc.isTaur()) output(" rearing back on your hind legs. You stand alongside Edan as he activates the lights with a voice command.");
		else output(" jumping. You stand alongside Edan as he activates the lights with a voice command.");
	}
	else output(" it looks to be almost twice your height or more! You feel like you’ve entered a giant’s abode which, you suppose, you have. Edan towers above you, activating the lights overhead with a voice command.");
	output(" You turn your head to check the place out. It’s pretty nice for a self-proclaimed traveling mercenary, with a couch and projector along with a dinner table in the living room. The scale of all the items actually in his ship are relatively huge, and there are no chairs. You’re struck by the dichotomy of how simple yet complicated being a giant leithan is.");
	output("\n\n<i>“It’s not much, but it’s home.”</i> Edan shrugs. <i>“Take a seat, I’m gonna order some food.”</i>");
	output("\n\nYou flop on the couch and Edan tosses you the projector remote before picking up a data slate off the table, muttering something about spam before leafing through the delivery selections. You switch idly through the channels, but nothing really catches your eye. Amazing how you can have hundreds of channels available and still not find anything fun. Well, you know how to make your own fun. Edan looks up from the tablet as you get up, placing it back on the table.");
	output("\n\n<i>“Not gonna watch any TV?”</i>");
	output("\n\n<i>“There’s nothing on. Plus,”</i> You say sweetly, running your palm down his chest and over his abs, <i>“I want an entrée before dinner gets here.”</i>");
	output("\n\n<i>“You’re insatiable,”</i> Edan grins and shakes his head. <i>“I appreciate that, though. It’s probably why you’re the only girl that can keep up with me.”</i>");
	output("\n\nYou give him a demure smile and sink between his forelegs, where you find his rapidly-hardening erection already swelling in size. Maybe you really <i>are</i> the only one that can keep up with him, you think to yourself, slipping your [pc.tongue] from your mouth and gently wrapping it around his flaring head. He gives an approving rumble and you take it as a signal to continue what you’re doing, taking your time lapping up and down the contours of his cock without ever fully taking it in your mouth.");
	output("\n\nYou rub your [pc.lips] along its length and give him a sultry moan, just happy to be underneath him once more. This is the first time he’s given you the lead, and you’re determined to make it worth his while. You suck the dribbling head past your lips while stroking him softly, his dick flexing and veins bulging at your delicate ministrations. He groans and gasps above you, his underside shivering and straining when you drag your tongue across his tip delightfully slowly, making sure to slurp up his precum in your mouth. A few minutes of your artful teasing and he gives up.");
	output("\n\n<i>“Fuuuck! Okay, that’s it, get on the couch. Any longer down there and you’re going to be full before the food even gets here. Shit, you’re <i>really</i> going to get it.”</i>");
	output("\n\n<i>Mission accomplished.</i> You rise with a sly grin and sashay over to the couch, your hips swinging out tantalizingly with every step while you strip off your [pc.gear]. Edan is close behind, his hot breath on you more like a predatory animal than any civilized being. You’d be afraid of what he was going to do to you if you didn’t want it so fucking bad. ");
	if (pc.isTaur()) 
	{
		output("You put your forelegs on the couch and spread your hind legs as far as you can to allow easy access, your [pc.tail] flitting about in eager anticipation. Edan wastes no time in mounting you, his gigantic cock searching out your [pc.pussy " + x + "]. He rams it in with a bestial roar, your slickened lips and canal instantly surrendering to his overwhelming size. Oh fuck, this is going to be <i>so</i> good.");
		
		pc.cuntChange(x, chars["EDAN"].cockVolume(0));
		
		output("\n\nThe overactive pheromones you’ve elicited from him with your teasing fill your mind with images of being bred like a mare in heat, the reality only reinforcing the fantasy. You can see the bioluminescence erratically flickering and pulsing brightly across his chitin-covered legs, proof of his wild state of mind. He seizes your midsection in his massive hands to fuck you deeper, sliding more of his equine rod into you until his flared head is pressed up against your womb and pulsating.");
		output("\n\nYou moan loudly at the sensation of his balls pressing into your [pc.butt], the knowledge you’ve taken his entire length every bit as hot as the actual feeling of having his cock filling you. It’s like an iron pole impaling you right through your insides, except it’s throbbing and spraying warm precum all throughout your thoroughly distended cunt. He sighs in luxurious satisfaction.");
		output("\n\n<i>“Fuck! That’s more like it. You make this worth it every time.”</i>");
		output("\n\nEdan takes you by your shoulders and tilts your torso back, kissing you roughly while he savagely pumps your hindquarters, forcing you to moan into his mouth. You feel yourself getting closer and closer to climax and pull him towards you, pushing yourself back into his massive body as he stiffens and flexes, rapidly approaching his own orgasm. He pulls back from the kiss and grabs your [pc.breasts], the pulse of his cock thrumming through your body explosively as the two of you cum.");
		output("\n\nYou can’t help but throw your head back and scream in pleasure looking up at him, your face sweaty and red as you shudder and shake underneath his bulk. His jizz spouts straight into");
		if (pc.isPregnant(x)) 
		{
			if (!pc.hasCock()) output(" your willing canal, not even a second passing before you’re too full to contain any more. The warmth of his ejaculation fills you for what feels like minutes, each shot sending a thrill of sympathetic pleasure down your spine while you quietly moan.");
			else output(" your willing canal, not even a second passing before you’re too full to contain any more. The warmth of his ejaculation fills you for what feels like minutes, each shot sending a thrill of sympathetic pleasure down your spine as your cock gently pulses, dribbling cum down your shaft.");
		}	
		else 
		{
			if (!pc.hasCock()) output(" your waiting womb, thick ropes of leithan spunk splattering inside you. Oh god, he’s filling you so quickly! It’s not long before his virility is making your underhanging stomach swell and sag with the thick warmth of his cum. You groan in both pleasure and mild annoyance, each shot sending a thrill of sympathetic pleasure down your spine but making it less likely you’ll be able to walk.");
			else output(" your waiting womb, thick ropes of leithan spunk splattering inside you. Oh god, he’s filling you so quickly! It’s not long before his virility is making your underhanging stomach swell and sag with the thick warmth of his cum. You groan in both pleasure and mild annoyance, each shot sending a pulsing dribble of cum down your own shaft.");
		}
		output(" He finally pulls out, both of you panting in exertion and after-lust. A thin sheen of shimmering sweat covers your bodies, Edan sliding off you slowly as he dismounts. His cum immediately begins rolling down your hindlegs, but you’re too spent to really care. Your legs shake and you collapse forward onto the giant couch, your [pc.butt] in the air and your pussy spilling cum. A wave of exhaustion rolls over you and you briefly entertain the idea of just staying in the couch forever.");
	}
	else
	{
		output("You get on the couch and sit doggystyle, arching your back and spreading your legs to allow easy access, waving your [pc.butt] in eager anticipation. Edan wastes no time in crashing down above you, his gigantic cock searching out your [pc.pussy " + x + "]. He rams it in with a bestial roar, your slickened lips and canal instantly surrendering to his overwhelming size. Oh fuck, this is going to be <i>so</i> good.");
		
		pc.cuntChange(x, chars["EDAN"].cockVolume(0));
		
		output("\n\nThe overactive pheromones you’ve elicited from him with your teasing fill your mind with images of being bred like a mare in heat, the reality only reinforcing the fantasy. You can see the bioluminescence erratically flickering and pulsing brightly across his chitin-covered legs, proof of his wild state of mind. He thrusts his powerful hips to fuck you deeper, sliding more of his equine rod into you until his flared head is pressed up against your womb and pulsating.");
		output("\n\nYou moan loudly at the sensation of taking him as deep as you possibly can, the knowledge he’s filling you up every bit as hot as the actual feeling of his cock. It’s like an iron pole impaling you right through your insides, except it’s throbbing and spraying warm precum all throughout your thoroughly distended cunt. He sighs in luxurious satisfaction.");
		output("\n\n<i>“Fuck! That’s more like it. You make this worth it every time.”</i>");
		output("\n\nEdan bends at the knees, his underslung stomach pressing into your back. You’re borne into the couch under his immense weight, moaning all the while as he savagely pumps your pussy into submission. You feel yourself getting closer and closer to climax and thrust back into him desperately as he stiffens and flexes, rapidly approaching his own orgasm. He collapses on top of you, the pulse of his cock thrumming throughout your body explosively as the two of you cum.");
		output("\n\nYou can’t help but scream into the couch as he lays atop you, your face sweaty and red as you shiver and shake underneath his weight. You lie under him unable to move, just taking his orgasm between your shuddering legs. His jizz spouts straight into");
		if (pc.isPregnant(x)) 
		{
			if (!pc.hasCock()) output(" your willing canal, not even a second passing before you’re too full to contain any more. The warmth of his ejaculation fills you for what feels like minutes, each shot sending a thrill of sympathetic pleasure down your spine while you quietly moan.");
			else output(" your willing canal, not even a second passing before you’re too full to contain any more. The warmth of his ejaculation fills you for what feels like minutes, each shot sending a thrill of sympathetic pleasure down your spine as your cock gently pulses, dribbling cum down your shaft.");
		}	
		else 
		{
			if (!pc.hasCock()) output(" your waiting womb, thick ropes of leithan spunk splattering inside you. Oh god, he’s filling you so quickly! It’s not long before his virility is making your underhanging stomach swell and sag with the thick warmth of his cum. You groan in both pleasure and mild annoyance, each shot sending a thrill of sympathetic pleasure down your spine but making it less likely you’ll be able to walk.");
			else output(" your waiting womb, thick ropes of leithan spunk splattering inside you. Oh god, he’s filling you so quickly! It’s not long before his virility is making your underhanging stomach swell and sag with the thick warmth of his cum. You groan in both pleasure and mild annoyance, each shot sending a pulsing dribble of cum down your own shaft.");
		}
		output(" He finally pulls out, both of you panting in exertion and after-lust. A thin sheen of shimmering sweat covers your bodies, Edan sliding off you slowly as he dismounts. His cum immediately begins rolling down your legs, but you’re too spent to really care. You remain stationary on the couch, your [pc.butt] in the air and your pussy spilling cum. A wave of exhaustion rolls over you and you briefly entertain the idea of just staying where you are forever.");
	}
	output("\n\n<i>“Hold up, let me get you a towel,”</i> Edan pants, catching his breath.");
	output("\n\nHe meanders into what you assume is the bathroom and returns to toss a ridiculously oversized towel under you. You can’t help but laugh exhaustedly.");
	output("\n\n<i>“What is this, a blanket? Your bedsheets pulling double duty?”</i>");
	output("\n\nEdan laughs good-naturedly and slaps your vulnerable butt and as he does so, a chime rings out across the living room. Edan casually hits a button on the wall and the giant door slides open, immediately exposing some unfortunate kaithrit delivery boy to a giant naked leithan male and his well-fucked mate still dripping spunk. You turn around to peer at him and... he’s not even looking at you, and seems completely unfazed.");
	output("\n\nYou suppose being a delivery boy on the frontier worlds must be pretty desensitizing, in hindsight. It’s probably not the first time he’s seen the subject of wild, raw animalistic sex lying out in the open. Edan hands him a tip and carries a giant stack of food back in as the door shuts, setting down a couple containers near you and putting the rest on the table. He easily lifts you");
	if (pc.isTaur()) output("r back half");
	output(" up and plops you on the couch with your comically-sized towel before snatching the remote up, mashing through the channels. Before long, he sighs and tosses it back on the couch.");
	output("\n\n<i>“You were right, there’s nothing on. Screw this, lets watch a movie.”</i>");
	output("\n\nNot like you were going anywhere in your current state.");
	output("\n\n<i>-- 45 minutes go by --</i>");
	output("\n\nYou pass the time snuggled up with Edan watching some action movie about a bank heist gone wrong. It’s not that great, but at least it’s fun to watch. You don’t eat much of your food, feeling full despite the fact that none (well, almost none) of his spunk ended up in your actual tummy. Halfway through the movie you shift around Edan’s outstretched form and idly rub his sheath, ignoring the warning rumbles reverberating in his chest. He lets you get closer, but it doesn’t look like he wants to take an active role so soon after his food.");
	output("\n\n<i>“Looking for something to wash your food down with, Steele? Cuz I’m happy to oblige, if you get it yourself.”</i>");
	output("\n\n<i>“Fine by me,”</i> you reply.");
	output("\n\nYou lie down next to him and start kissing and licking his sheath, planting your lips on it as wide as you can when it begins to bulge outward. His dick practically springs outward and straight down your throat, hardening and thickening until it’s swelled out to fill your esophagus. You can already feel him drooling precum into your stomach, but after the earlier exertions you’re not really feeling like moving around a lot. You’ll have to take care of him without too much activity, and it might be hard after he’s already cum once.");
	output("\n\nYou slowly pull your [pc.lips] up his rod to give yourself some room to breathe, softly wrapping your hands around his absurdly thick base before starting to jack him off into you. He gives a drawn-out noise of satisfaction from above you and you’re rewarded with more warmth in your [pc.belly]. You bob your head around his equine pole, drawing back to slip your tongue around his flare to enjoy the heat emanating from the tip. Your desire finally overcomes your torpor, and you find yourself blissfully sliding down his cock in search of bringing him to orgasm. You rub his plump balls in a show of encouragement to fill you up and get a suppressed groan for your efforts.");
	output("\n\nSmiling inwardly, you go back to doing what you do best: throating Edan’s cock like a pro. You effortlessly swallow feet of cock, your lips inching down his length, feeling his cum vein flex and stretch your mouth wider every few seconds. Gag reflex completely suppressed, your cock worship is a full body experience. You stroke it up and down with alternating paces, you slip it between your [pc.breasts] and rub your [pc.nipples] with it, your tongue rubs every ridge and bump along its length, you swallow his hot pre to massage it with weak undulations of your throat.");
	output("\n\nIt’s not long before he’s teetering on the brink of orgasm, huffing in equal parts pleasure and torturous desire. You can actually feel the moment his sense of reason dissipates, signaled half by the increasingly angry throbbing of blood in his massive penis and half by the fact he groans and pushes you further down. He shifts around on the coach to lie on top of you, his cock embedded in your throat as far as it’ll go. With a couple of rough pumps that set your body jiggling, his grip on you tightens and you feel him begin to hose your insides down with spunk.");
	output("\n\nAfter the bestial display earlier this orgasm is more muted, but no less bountiful. You obediently lie under him, your mouth at his service and your throat wrapped around his cock as he slowly swells you from the inside. You wrap your arms around his midsection and squeeze, urging him to give you as much as he wants, and he obliges in spades. Very soon");
	if (!pc.isPregnant(x)) output(" your stomach has swollen to match your womb, and being held down and pumped soon exceeds it. There’s no convenient escape route for the cum this time and he’s so deep that it won’t just flow back out your throat, so you’re forced to lie on the couch and just quietly take everything he wants to give you. You suck and swallow and weakly rub his midriff, his bulk shivering in pleasure every time he deposits another load deep in your gurgling tummy.");
	else output(" your stomach has swollen to match your pregnancy, and being held down and pumped soon exceeds it. There’s no convenient escape route for the cum this time and he’s so deep that it won’t just flow back out your throat, so you’re forced to lie on the couch and just quietly take everything he wants to give you. You suck and swallow and weakly rub his midriff, his bulk shivering in pleasure every time he deposits another load deep in your gurgling tummy.");
	output("\n\nBy the time he’s done and he pulls out, your well-fucked mouth hangs open dribbling cum between your [pc.lips] and your eyes are half rolled back in your head. You see Edan’s face swim into view above you and give him a moan to let him know you’re conscious, albeit tired.");
	output("\n\n<i>“[pc.name]? Maybe I went overboard. Lets get you to the shower, huh?”</i>");
	output("\n\nDespite some initial struggles with your cum-swelled form");
	if (pc.isTaur()) output(" like the fact your [pc.feet] can hardly scrape the ground");
	output(", he maneuvers you into a large room with a smooth floor. He puts you down and water begins to pour from overhead, warming you up and raising you from your sated torpor. You look up at him half in bewilderment and half in something approaching religious fanaticism.");
	
	pc.shower();
	
	output("\n\n<i>“That was <i>amazing</i>.”</i>");
	output("\n\n<i>“Yeah, they do good delivery,”</i> comes the completely straight-faced reply, making you smile and laugh. Edan grabs some liquid soap and begins rubbing it into you, leaving you to lean back into him and relax with your eyes closed as he carefully washes you up with suds and warm water. Nothing like a bit of pampering, especially when you’re incapable of doing it yourself. It’s quite the switch-up, although you’re not complaining. You are curious, though. You mention the change in his demeanor to Edan and he shrugs noncommittally.");
	output("\n\n<i>“Guess I just wanted to show some appreciation. Like I said, you’re the only one that’s ever been able to keep up with me. Be a shame if I didn’t show you some hospitality.”</i>");
	output("\n\nYou suspect there’s more to the answer given that he can’t be that young, but you’re content to let sleeping dogs lie for now. Especially when their owner is washing you up, making you feel nice and clean. His hands brush lightly over your nipples, provoking a soft sigh from your lips and the realization you don’t get to enjoy this kind of attention non-sexually often, if ever. He lets go of you and begins to clean himself up quickly before you stop him.");
	output("\n\n<i>“No?”</i> He says, looking at you for a clue.");
	output("\n\n<i>“No. It’s my turn.”</i>");
	output("\n\nHe relaxes and drags a bucket and wet towel across to give to you. <i>“Use these. Makes the chitin much less of a pain to clean");
	if (pc.race().toLowerCase().indexOf("leithan") != -1) output(" although I guess you already know");
	output(".”</i>");
	output("\n\n<i>“It’s not like you have to make them shine as a merc, right? You’re not exactly hobnobbing with CEOs,”</i> You ask, idly wondering if you can learn anything about his life.");
	output("\n\n<i>“Well, I have a CEO rubbing me down with a towel right now. Does that not count?”</i> You give him a light ineffectual punch and he laughs. <i>“Right, a prospective CEO. Guess you’ve still gotta find the other probes you talked about.”</i>");
	output("\n\nHe lapses into silence for a few moments, looking up at the ceiling while you wash his muscular back. It feels like he’s trying to figure out how much he should share.");
	output("\n\n<i>“I used to. Back in the day I worked for Reaper Industries as a consultant and field tester. That mostly meant shooting things, but there was a fair amount of bullshit meetings too,”</i> He sighs. <i>“The pay was better than what I make now, but it wasn’t very satisfying. In weapons development all you can really hope for is that the stuff you help out on gets used for the right purpose, and when it comes to guns - </i>“ He trails off and gives you a shrug, his massive shoulders shifting the towel around. <i>“It’s not exactly like I struggled with moral quandaries every day, especially when there are actual wars or slavers to be fought. But it does wear on you.”</i>");
	output("\n\nYou don’t want to hardball him, but this is probably the best time to ask. <i>“Do you not feel a little hypocritical working as a mercenary after having problems with weapons development?”</i>");
	output("\n\nYou move around to his front and he sits up, uncrossing his arms so you can wash his chest.");
	output("\n\n<i>“Sure. I know it’s cliched but nobody’s perfect, Steele. You’re only young so you probably haven’t run into these situations before, but sooner or later you’ll have to compromise. Or maybe you won’t, who knows.”</i>");
	if (pc.characterClass == GLOBAL.CLASS_SMUGGLER)
	{
		output("\n\n<i>“I’m not as naive as you think, Edan. I’ve done some underhanded work in my life. Trust me, you don’t get to be the CEO of a galactic Megacorp flying completely straight. Someone has to get the valuables from point to point.”</i>");
		output("\n\n<i>“I thought you guys were above the law,”</i> Edan grunts, though you see a twinkle of mirth in his eye and a slight upturn at the corner of his mouth when you look up at him.");
		output("\n\n<i>“Not always. Just most of the time,”</i> you smile and return to getting him clean, the air feeling considerably clearer between the two of you.");
	}
	else if (pc.characterClass == GLOBAL.CLASS_ENGINEER) 
	{
		output("\n\n<i>“I’m not as naive as you think, Edan. I work with weaponry all the time, it’s what I did before the probe-chasing deal. You’ve gotta do something yourself, you don’t get to be the CEO of a galactic Megacorp waiting on other people.”</i>");
		output("\n\n<i>“Yeah, that comes after.”</i> He grins.");
		output("\n\n<i>“Exactly right.”</i> You smile up at him and return to getting him clean, the air feeling considerably clearer between the two of you.");
	}
	else
	{
		output("\n\n<i>“I’m not as naive as you think, Edan. I’ve worked as a mercenary just like you, although I got to choose what contracts to take. Still, you don’t get to be the CEO of a galactic Megacorp flying completely straight. Someone has to do the dirty work, and if you want something done right...”</i>");
		output("\n\n<i>“You gotta do it yourself,”</i> He grins. <i>“You learn that pretty quick in our line of work.”</i>");
		output("\n\nYou smile up at him and return to getting him clean, the air feeling considerably clearer between the two of you.");
	}
	output("\n\n<i>“You’ve led an interesting life so far, huh?”</i> Edan muses. <i>“Anyway, the main reason I went into mercenary work is because I could still apply my skills but I can at least pick what I want to do. I’m no bastion of principle, but the only thing negatively affected when I shoot slavers and pirates for a paycheck is some asshole’s bottom line. The money I earned with Reaper affords me that choice, at least.”</i>");
	output("\n\n<i>“And you get to explore the galaxy. Meet prospective CEOs and all that,”</i> You reply innocently, your hands moving lower down his body.");
	output("\n\n<i>“Right, you’re the best perk of the job so far. Gotta say, our interactions so far as CEO and mercenary haven’t exactly fit in with my prior experience. You break the mold in all the right ways.”</i>");
	output("\n\nSpeaking of which... you brush your naked chest down his front and get your hands under him before he stops you.");
	output("\n\n<i>“How about we continue in the bedroom?”</i>");
	output("\n\n<i>“So we cleaned up for nothing?”</i> You put on a pout, but you can’t hide that you’re eager for his dick to be inside you. <i>“Fine, but you’re still going to have to help me there.”</i>");
	output("\n\nThe both of you wrestle your still-cumflated body into Edan’s bedroom and onto his bed, where you collapse on your side.");
	output("\n\n<i>“I couldn’t eat another bite,”</i> you quip, and he laughs.");
	output("\n\n<i>“Guess we’ll have to solve the problem working backwards, then.”</i>");
	output("\n\nHe throws down a towel and lies down beside you, the feeling of his dick iron-hard on your back a welcome distraction from your tummy. There’s no doubt you’re going to swell back up again, but weighing the consequences between not getting his dick and getting it you’re one hundred percent sure what you want.");
	output("\n\n<i>“Fuck me </i>hard<i>,”</i> you moan lustily.");
	output("\n\n<i>“Always do.”</i>");
	if (!pc.hasCock())
	{
		output("\n\nEdan slides down and grasps your [pc.butt], aligning himself with your [pc.asshole] and pushing forward with a grunt. You yelp a little as his flare slips inside your ring, but the rest is smooth and sensitive sailing. He pulls you down the bed until it’s fully in you, leaving you weakly writhing on the pillar impaling you from the bottom up. After letting you get used to it he slowly starts pumping you, increasing in intensity until you’re loudly grunting in a very un-ladylike manner every time he hilts himself in your guts.");
	
		pc.buttChange(chars["EDAN"].cockVolume(0));
	
		output("\n\n It’s impossible not to cry out in lust and pleasure when a few feet of cock is rearranging your internal organs to better turn you into a cumdump, and you don’t bother resisting the urge. He loves hearing you break down over his dick until you’re incapable of doing anything other than just taking it, and you do love to please. The full-body stimulation is just too much for your frame and before long you’re cumming with every other thrust, your [pc.pussy] spasming and still leaking spunk from your earlier fucking.");
		output("\n\nYou practically seize in his grip, your muscles completely taut as the electric thrill of multiple orgasms crashes throughout your nervous system and leaves you gasping for breath. Taking that as his cue to finish up, Edan thrusts roughly into you once, twice, and then groans as he starts refilling you with warm seed. You moan and sigh erotically when you feel your insides being plastered with his jizz once more, the heat starting at your core and blossoming outwards as your bowels are filled over and over. He hugs you closer as your stomach swells out again, this time from the other end. Wriggling in his grip as you blow up, you can’t help but wonder how much more you can even take. You’re starting to taste his cum in your mouth, and it’s not just from sucking his cock earlier.");
		output("\n\nFinally the spray of jizz into your innards recedes, and you’re left shivering on the end of his massive cock unable to move. He pulls a few pillows down from the top of the bed and props them under your head, pulling the blankets up and over. You almost instantly fall asleep being cradled in his arms, hoping that walking is a realistic proposition when you get up tomorrow.");
	}
	else
	{
		output("\n\nEdan slides down and grasps your [pc.butt], aligning himself with your [pc.asshole] and pushing forward with a grunt. You yelp a little as his flare slips inside your ring, but the rest is smooth and sensitive sailing, although you whimper in pleasure every time a vein or his medial ring rubs your prostate. He pulls you down the bed until it’s fully in you, leaving you weakly writhing on the pillar impaling you from the bottom up. After letting you get used to it he slowly starts pumping you, increasing in intensity until you’re loudly grunting in a very un-ladylike manner every time he hilts himself in your guts.");

		pc.buttChange(chars["EDAN"].cockVolume(0));
	
		output("\n\n It’s impossible not to cry out in lust and pleasure when a few feet of cock is rearranging your internal organs to better turn you into a cumdump, and you don’t bother resisting the urge. He loves hearing you break down over his dick until you’re incapable of doing anything other than just taking it, and you do love to please. The full-body stimulation is just too much for your frame and before long you’re cumming with every other thrust, your [pc.pussy] spasming and still leaking spunk from your earlier fucking and your [pc.cock] spewing [pc.cum] everywhere.");
		output("\n\nYou practically seize in his grip, your muscles completely taut as the electric thrill of multiple orgasms crashes throughout your nervous system and leaves you gasping for breath. Taking that as his cue to finish up, Edan thrusts roughly into you once, twice, and then groans as he starts refilling you with warm seed. You moan and sigh erotically when you feel your insides being plastered with his jizz once more, the heat starting at your core and blossoming outwards as your bowels are filled over and over. He hugs you closer as your stomach swells out again, this time from the other end. Wriggling in his grip as you blow up, you can’t help but wonder how much more you can even take. You’re starting to taste his cum in your mouth, and it’s not just from sucking his cock earlier.");
		output("\n\nFinally the spray of jizz into your innards recedes, and you’re left shivering on the end of his massive cock unable to move. He pulls a few pillows down from the top of the bed and props them under your head, pulling the blankets up and over. You almost instantly fall asleep being cradled in his arms, hoping that walking is a realistic proposition when you get up tomorrow.");
	}
	output("\n\nWhen you do wake up, it’s caused by the sensation of water falling on you. You groggily open your eyes to find Edan has carried you into the shower for another scrub, and looking down you see your swelling has receded. You grumble a bit and Edan shooshes you.");
	output("\n\n<i>“Go back to sleep. I’ll get you cleaned up and you can rest until you’re ready, I’m gonna head out.”</i>");
	output("\n\nFeels nice to be spoiled. Your eyes drift close under the warmth of the shower and gentle massaging, and you awaken refreshed some hours later in a clean bed. There’s a note on the dresser, and you read it");
	if(pc.hasUpperGarment() || pc.hasLowerGarment())
	{
		output(" after putting your");
		if(pc.hasUpperGarment()) output(" [pc.upperUndergarment]");
		if(pc.hasUpperGarment() && pc.hasLowerGarment()) output(" and");
		if(pc.hasLowerGarment()) output(" [pc.lowerUndergarment]");
		output(" on");
	}
	output(".");
	output("\n\n<i>“Hey Steele, dunno if you were awake enough to remember but I’m out for the day. There’s some leftovers on the table if you want to warm them up, but I’ve got a feeling you won’t be hungry. Come see me again if you want to hang out.”</i>");
	output("\n\n - Edan");
	output("\n\nHang out indeed. Being blown up like a blimp by cum is fucking hot and the whole thing feels great, but there’s something to be said for being able to walk. Still, you’re keen to see him again. Eating a few bites of the leftovers you find his prediction was mostly true, and screw up your face at the prospect of having to finish it. You opt to close the container and put it back on the table, finding the rest of your gear strewn across the floor and putting it back on. Exiting Edan’s ship, you step down the ramp and into the Novahome hangar.");
	
	pc.loadInCunt(chars["EDAN"],x);
	pc.loadInAss(chars["EDAN"]);
	pc.loadInMouth(chars["EDAN"]);
	processTime(800);
	pc.orgasm();
	pc.exhibitionism(3);
	pc.shower();
	sleepHeal();
	flags["EDAN_FUCKED"] = 5;
	addButton(0, "Next", mainGameMenu);
}

public function edanSexSixth():void
{
	generateMap();
	
	clearOutput();
	clearMenu();
	edanHeader(true);
	
	var x:int = pc.cuntThatFits(chars["EDAN"].cockVolume(0));
	if(x < 0) x = pc.biggestVaginaIndex();
	
	output("Wrong. It’s every bit as boring, but even worse because it’s got next to nothing to do with you. Stifling a yawn, you eye the leithan lady on the other side of the desk you and Edan are standing in front of. Her business suit does an awfully poor job of concealing her buxom curves, and you find yourself idly wondering if she’s a mother. Her pretty face gives you no hints as to whether this might be true – nowadays, anybody can use mods to give themselves a youthful appearance. She excuses herself to fetch some documents for Edan to sign and you lean back, giving a restless sigh as you stretch a bit. Edan turns to you with the hint of a smile.");
	output("\n\n<i>“I’m every bit as bored as you are, Steele. Offices and I don’t really get along too well, what with the furniture and overhead lights and all. Really, just being indoors kind of sucks in general. Kinda hard to convince a native species to put all their buildings together the same way they already do, but bigger, just to accommodate offworlders.”</i>");
	output("\n\nHis eyes rove around the room, eventually settling on the nameplate sitting on the woman’s desk.");
	output("\n\n<i>“Hmm. You know, I think this leithan woman – think she said her name was Anna – might be in heat. No doubt she’s using suppressants for work, but I can still smell it when we’re in such a small room,”</i> He grins. <i>“Thinking what I’m thinking, Steele?”</i>");
	output("\n\nNo sooner than the words are out of his mouth are you on the floor, cunningly hiding yourself behind the desk while you explore Edan’s nether regions with your hands. It’s only a scant few seconds before his giant cock shows itself, and it’s not long before the cramped room is awash with the scent of his pheromones. You dutifully spit-shine his impressive length, excited yourself at the prospect of what’s coming. Sure enough, you hear the door open and Anna re-enters, sealing the door behind her and effectively making her your sexy prisoner.");
	output("\n\n<i>“O-oh. Is it quite - quite hot in here? How did I not n-notice this before?”</i>");
	output("\n\nShe awkwardly clears her throat, and you can all but see her red-faced embarrassment, shuffling in her suddenly all-too-tight office dress. You can sympathize; must be hard being a working woman in the face of the blaring need to be bred. Especially by <i>this</i>, you silently add with a flutter of the eyelashes, your [pc.lips] spread wide on the tip of his rod in an affectionate kiss.");
	output("\n\n<i>“Is your f-friend gone?”</i>");
	output("\n\nThe woman nervously asks, clearly in some discomfort.");
	output("\n\n<i>“Oh, she’s indisposed at the moment,”</i> Edan casually answers, waving an arm as if to bat her question away. <i>“Actually, I was thinking we could negotiate the terms of the contract. Just the two of us.”</i>");
	output("\n\n<i>“O-oh, I... The company doesn’t usually...”</i> She’s breathless now, her panting only bringing her to the peak of lust even faster in the confines of her office. The presence of mind to open the windows has long since passed her by, and by now it’s too late anyway. She trails off as Edan comes around the desk and approaches her, leaving you hidden for now.");
	output("\n\n<i>“Don’t be like that, Anna. I’m sure we can work something out that’s agreeable for </i>everyone<i> involved.”</i>");
	output("\n\nYou sneak a peek around the corner of the desk and the woman you see looks like she’s on the verge of rediscovering herself, or maybe the purpose of life. Her expression is one of rapt adoration, her mouth hanging open slightly while she cranes her neck to look up at Edan. You’d be jealous if this woman didn’t so clearly need it – you’re not big on sharing, but Steele Tech has always been generous on the charity front, after all. She slips unsteadily on the floor and Edan’s arm darts out, catching her in a strong embrace and provoking a shuddering gasp as her ample bosom pushes against his abs.");
	output("\n\n<i>“Whoa there, little lady. You okay?”</i> he says with an amiable smile.");
	output("\n\n<i>“Oh, I.. I.. Think we could negotiate...”</i>");
	output("\n\nAlright. If you have to take any more of this doe-eyed bullshit, your eyes are going to roll out of your head. You sneak out from your hiding place and approach Anna from behind, catching Edan’s eye and giving him a wink. He pulls her tighter and your hand snakes out, deftly pulling her pants down and sinking a couple of fingers into the heat of her cunt before she can even react.");
	output("\n\n<i>“Wh-! Oh!”</i>");
	output("\n\n<i>“Anna, this is my friend [pc.name] Steele. You’ve already met, though.”</i>");
	output("\n\n<i>“[pc.name]... Steele?”</i>");
	output("\n\n<i>“Right, you probably know her. Think of this as extending a gesture of goodwill towards Steele Tech.”</i>");
	output("\n\nShe gulps, but between her heat and the fact you’re already knuckle-deep in her burning hot mare-pussy she’s more than willing to let you continue. Looks like negotiations are a go. Needing no further encouragement, you slowly slip the rest of your fingers in until she’s softly moaning and thrusting backwards in Edan’s arms. She lays her head against his broad chest and closes her eyes, just reveling in the pleasure as you bring her closer towards a shuddering climax.");
	output("\n\n<i>“It’s been so long, oh </i>god<i>!”</i>");
	output("\n\nHer breath catches in her throat as her eyes go wide and she begins to shake in Edan’s grasp, her back legs standing on tiptoes as her plush behind quivers. Her musky pussy flexes and contracts around your hand with every caress and stroke, each one eliciting delightful noises from the needy mare while she drips on the floor.");
	output("\n\nShe slowly rides her orgasmic high down with her arms wrapped around Edan, moaning all the while. You slip your hand back out of her and a deluge of translucent girlcum follows, cascading down the gray of her shaky thighs, which was all the evidence you really needed to conclude she’s <i>really</i> into this. You softly rub her still-pulsating pussy as she goes through the aftershocks of cumming and nod to Edan. He grins and nods back.");
	output("\n\n<i>“We’re not done just yet, Anna. Put your hands against your desk, would you?”</i>");
	output("\n\nShe pulls away from Edan and wordlessly nods, her breath a steady rhythm of lusty panting. Her movements are unsteady, but she grips the desk with purpose and looks back at Edan, who’s still grinning.");
	output("\n\n<i>“I do so like a woman that knows what she wants,”</i> he says, giving you a wink as he settles into position.");
	output("\n\nRearing up, his hands find purchase along her tauric hindquarters and he slides himself into her cunt with a wet squelch. You recognize the look on her face immediately despite never having actually seen it; it’s the same one you wear in the throes of passion when Edan’s inside you. Red cheeks, a firm bite down on the lower lip, gasps of pleasure and a heaving bosom as he fucks himself deeper into your stretched-out cunt. You’re out of your [pc.gear] in a flash, the heat of your own [pc.pussy " + x + "] is too much to bear in front of this orgiastic breeding frenzy.");
	output("\n\nEdan leans back then slams his whole length into Anna, her entire body shaking with the effort of staying upright as her scream of pleasure rips through the thankfully-noiseproof office. Edan gets a grip on her hair to hold her upper half still while he pumps her, throbbing horsecock leaving her drippy wetness nowhere to go except spraying down her legs.");
	output("\n\nAn idea comes to you then, and you slide neatly under the two of them until you’re positioned right where they’re joined. The next time Edan hilts himself, you lean up and give his sizeable balls a lusty lick.");
	output("\n\n<i>“Oh shit,”</i> he groans, <i>“you always know what I want.”</i>");
	output("\n\nYou smile into his sack, tonguing his balls and tasting the juices Anna is squirting back over you. He draws back and your [pc.tongue] slides along the thick underside of his cock, sensuously stroking his cumvein, stimulating him all the more. You can see the effect you’re having on him - he begins pumping the woman for all she’s worth, slamming into her spasming cunt over and over and sending girlcum sluicing to the floor.");
	output("\n\nAs intimately familiar with Edan as you are, you can see he’s close to cumming; it’s in his manly grunts, the way he’s grabbing Anna’s hips, the desperateness with which he’s bucking his hips, the thickening and rigidity of his massive cock. He groans and from your seat underneath him you can actually <i>see</i> the individual pulsing loads travelling down his dick, waiting to be deposited in his broodslut’s cunt.");
	output("\n\nHe pulls out slowly and you reach up, using your hands to jack him off into her and then onto your face as he slips free. You take the first couple of ropes all over yourself, smiling sweetly up at Edan before stretching your [pc.lips] around his flared head. Cheeks hollowed, you suck as hard as you can while vigorously jacking him into your mouth. He groans in satisfaction, head high and eyes closed as you worshipfully swallow his cum.");
	output("\n\nYou insistently bob your head a few inches back and forth, sliding your lips riiight over the most sensitive parts of his cockhead to tease out the last few splatters of cum into your throat. When he’s finally finished and only dripping into you, you take him <i>deep</i> into yourself and suck, cleaning all of the juices off before letting him pop loose of your mouth. His cock springs back upwards, spit-shined and still erect.");
	output("\n\nAnna looks to be semi-unconscious, dazed and dripping in the wake of her heat finally being satisfied in the most primal of ways. She shakily lowers herself to the floor, her upper half leaning against her desk, and she looks to be asleep almost instantly.");
	output("\n\n<i>“Poor woman,”</i> Edan remarks, looking her over. <i>“Why she doesn’t have a mate to take care of that is beyond me. Anyway,”</i> he looks back at you, starting to grin, <i>“we’re not done just yet.”</i>");
	output("\n\n<i>“I was hoping to hear that,”</i> you say, getting to your feet. <i>“Where do you want me?”</i>");
	output("\n\n<i>“Preferably screaming and bucking under me at all times,”</i> he replies, <i>“but for now brace yourself against the desk.”</i>");
	output("\n\nYou idly lick some of his cum off your lips, making sure he gets a good eyeful, before turning to the desk.");
	output(" You trot right up to it and press yourself against it, making sure to spread your ");
	if (pc.isTaur()) output("hind");
	output("legs <i>wide</i> and give him a good look at what sucking his cock has done to you. He’s in no mood to keep you waiting, rearing up and mounting you like a stallion. The familiar feeling of his weight on your back just serves as a reminder of how hard you’re going to be fucked, and you can’t help but weakly wiggle your hips under his bulk.");
	output("\n\n<i>“Calm down,”</i> Edan murmurs, <i>“you’ll get it soon.”</i>");
	if (pc.isTaur()) output("\n\nHe places his hands on your shoulders, holding your upper half ");
	else output("\n\nHe bends his knees slightly, bringing his weight down on you to hold you ");
	output("still before you feel the blunted head of his dick pressing against your [pc.pussy " + x + "], your labia spreading apart deliciously slowly. Then, all at once, he savagely spears you all the way to the hilt. Your scream of mixed lust and discomfort dies in your throat as the head of his cock touches your cervix, setting off waves of pleasure and making you burn with need. You <i>need</i> him to fill your womb with cum - the pheromones in the air are making accepting anything less an impossibility.");
	
	pc.cuntChange(x, chars["EDAN"].cockVolume(0));
	
	output("\n\n<i>“You can smell them too, huh?”</i> Edan grunts, drawing back before slamming back home, his powerful legs driving him into you. <i>“I can - unh! Tell. Don’t worry, you’ll get what you’re looking for.”</i>");
	if (pc.isTaur()) output("\n\nSo inflamed are your senses that you scarcely understand him, the actual words he’s saying secondary to his pleasing tone and low rumbles you feel in his chest. All you can really focus on right now is the fiery need between your hindlegs, the one he’s sating by filling you with cock. The sensation of each bump, nub and vein sliding through your slick entrance and into your deepest recesses is irresistible, and you find yourself fighting the unconscious act of your eyes rolling back in bliss.");
	else output("\n\nEdan takes advantage of your complete submissiveness and pumps you as hard as you think possible, the rapid stimulation just too much for your body to bear. Your legs start to wobble and shake as pleasure radiates outward from your core and through your lower body, forcing Edan to clamp his grip down on you with his midlegs, holding you down and fucking you all the while.");
	output("\n\nHe fucks you unrelentingly, the force of his strokes");
	if (pc.biggestTitSize() >= 4)
	{
		output(" shaking your [pc.breasts] up and down");
		if (pc.isLactating()) output(" sending trickles of [pc.milk] down your front");
	}
	else output(" shaking you like a leaf in a storm");
	output(". Whenever his swollen head kisses the entrance to your womb you can’t help but shiver in a miniature orgasm, his cockslit perfectly aligned with your opening and depositing splurts of hot, wet precum every time he hilts himself in you.");
	output("\n\n<i>“I’m gonna cum pretty soon, [pc.name],”</i> pants Edan, <i>“so I hope you’re fucking ready for this!”</i>");
	output("\n\nIn the seconds that follow, you realize that your definition of rough and Edan’s definition of rough may have differed. He doesn’t give you time to think about it - he draws back and <i>rams</i> himself into your stretched-wide cunt, the slap of flesh on flesh so loud in the enclosed office you think for a second that Anna might wake up.");
	if (pc.isTaur()) output(" You can feel him pushing against you, tightly pressing your [pc.chest] up against the desk and sending backspray down your wobbling legs.");
	else output(" You can feel your feet start to leave the ground, only the tips of your toes still even in contact with the floor.");
	output("\n\nEdan’s grip on your hips is almost painfully tight, but you don’t complain. You’re <i>reveling</i> in his treatment of you, like you’re a fucking toy to be stretched and filled up with cum. The only noises coming out of your mouth are ragged, bestial grunts every time you feel him plunge into you. He grunts through clenched teeth, his breath coming in pants as you feel the telltale thickening of his cock deep inside you.");
	output("\n\n<i>“Cum in me,”</i> you gasp, the pheromones still wrapped around your brain. <i>“Give me-”</i>");
	output("\n\nWhatever you were going to say is cut off as Edan hisses loudly through his gritted teeth. You feel a knot travelling through you, then blissful warmth, over and over. His cum floods into you with so much force you can actually hear it lewdly splattering inside, ");
	if (pc.isTaur()) output("Edan’s strained grunts every time he deposits another load in you enticing you to look up at him.");
	else output("your body now fully suspended on his stallion cock.");
	if (pc.isTaur())
	{
		output("You red-facedly smile up at him, head tilted back");
		if (pc.hasHair()) output(", your hair an absolute mess,");
		if (!pc.hasCock()) output(" and admiring his facial expression. You can see how much he loves to fuck you full of spunk; it’s written all over his face. The combined pleasure of feeling his seed pump into you and pride at seeing how much pleasure you’re bringing him bring you to another orgasm, your abused pussy weakly spasming and seizing along his cock. Your rippling walls slowly but inexorably milk Edan’s swollen prick for all it has, swelling you with his cum.");
		else output(" and admiring his facial expression. You can see how much he loves to fuck you full of spunk; it’s written all over his face. The combined pleasure of feeling his seed pump into you and pride at seeing how much pleasure you’re bringing him bring you to another orgasm, your abused pussy weakly spasming and seizing along his cock while your own prick twitches, spurting jizz down your forelegs. Your rippling walls slowly but inexorably milk Edan’s swollen prick for all it has, swelling you with his cum.");
	}
	else
	{
		if (!pc.hasCock()) output("\n\nYou smile red-facedly as you hear him groan and grunt, his throbbing dick holding you in place and rapidly filling you with jizz. The combined pleasure of feeling his seed pump into you and pride at hearing how much pleasure you’re bringing him bring you to another orgasm, your abused pussy weakly spasming and seizing along his cock. Your rippling walls slowly but inexorably milk Edan’s swollen prick for all it has, swelling you with his cum.");
		else output("\n\nYou smile red-facedly as you hear him groan and grunt, his throbbing dick holding you in place and rapidly filling you with jizz. The combined pleasure of feeling his seed pump into you and pride at hearing how much pleasure you’re bringing him bring you to another orgasm, your abused pussy weakly spasming and seizing along his cock while your own prick twitches, spurting jizz onto the floor of Anna’s office. Your rippling walls slowly but inexorably milk Edan’s swollen prick for all it has, swelling you with his cum.");
	}
	output("\n\nWhen he finally pulls out, streams of jizz pour from your distended cunt and run down your [pc.legOrLegs] to pool on the floor of Anna’s office. You can’t help but moan loudly as the head pops free, a few ropes of leithan spunk painting themselves across your [pc.butt] as he dismounts. You turn around and obediently sink to your [pc.knees], sucking him off for the last few pumps of cum before it’s reduced to a drizzle across your tongue. He groans as you momentarily deepthroat him, tonguebathing his cock to clean it off.");
	output("\n\n<i>“Good girl,”</i> Edan grunts. <i>“Make sure to swallow.”</i>");
	output("\n\nYou would have anyway, but at his instruction you make sure to pull back off his cock with a loud pop and look up at him. You swallow loudly and slowly, then lick your lips and smile sweetly up at him. He watches transfixed, then lifts his head to look at the ceiling with eyes closed and sighs.");
	output("\n\n<i>“God damn it, [pc.name]. You keep that up and we’ll never get </i>out<i> of this office, and I don’t think Anna’d be happy about that, no matter how often she goes into heat.”</i>");
	output("\n\n<i>“You did tell me to,”</i> you remind him, <i>“and you know I’m not one to say no to you. Besides, I don’t know if she’s going to be happy with us anyway.”</i>");
	output("\n\nYou indicate the freshly-strewn jizz all over the floor.");
	output("\n\n<i>“Right, we should get out of here,”</i> Edan decides. <i>“Enough of this was caused by Anna that she probably won’t notice the difference. Can you stand?”</i>");
	output("\n\nHe effortlessly lifts you to your feet, holding you while you shakily adjust to moving around. Your pussy throbs, still inflamed with heat, reminding you of how hard you just got fucked. You reach out for Edan’s arm to steady yourself, and he leads you");
	if (!pc.isNude()) output(" to your clothes. He quickly helps you get dressed, and casting");
	else output(" to the door. Casting");
	output(" a look back at the fucked-unconscious Anna, the two of you leave the office arm in arm.");
	output("\n\nIt’s a relatively short jaunt back to his ship, where the two of you wash up with <i>relatively</i> few sexual acts, although you have trouble not crying out when Edan softly wipes your ");
	if (pc.isTaur()) output("hindquarters");
	else output ("pussy");
	output(" down and brushes over your [pc.clits]. You pay him back when you’re washing his underside by stroking and massaging his sizeable balls, his rumbles going unheeded. You manage to get out of the shower without either of you overtly expressing the desire to fuck the other, though feeling it is another matter entirely.");
	output("\n\n<i>“You good to go, [pc.name]?”</i> Edan asks with a half-grin. <i>“Mighta been a little hard on you back there.”</i>");
	output("\n\n<i>“I can handle myself,”</i> you reply, giving him a demure smile. <i>“But thank you.”</i>");
	output("\n\n<i>“Alright, I’ll see you ‘round, Steele. Thanks for helping me negotiate, huh?”</i>");
	output("\n\nEdan gives you a light slap on the [pc.butt] and gets in a good grope while he’s at it. You wait until he’s done feeling you up, but leave before you convince yourself to turn around and make him ride you again - or before his fingers roam too much. He leans against the doorframe and watches you go, giving you a wave before you disappear from sight, then heads back into his ship.");

	pc.loadInCunt(chars["EDAN"],x);
	pc.loadInMouth(chars["EDAN"]);
	processTime(180);
	pc.orgasm();
	pc.exhibitionism(1);
	flags["EDAN_FUCKED"] = 6;
	addButton(0, "Next", mainGameMenu);
}

//edan's repeatable sex scene for after all of his content is witnessed.
public function edanSexRepeat():void
{
	generateMap();
	
	clearOutput();
	clearMenu();
	edanHeader(true);
	
	var x:int = pc.cuntThatFits(chars["EDAN"].cockVolume(0));
	if(x < 0) x = pc.biggestVaginaIndex();
	
	output("<i>“Here we go. Like I said, it’s not fancy but it flies well and it was the roomiest one I could find.”</i>");
	output("\n\nYou walk up the protruding ramp with him as Edan activates the lights with a voice command. The place is still pretty much the same as the last time you were here. It’s nice for a self-proclaimed traveling mercenary, with a couch and projector along with a dinner table in the living room. The scale of all the items in his ship are relatively huge, and there are no chairs. Roomy indeed.");
	output("\n\n<i>“It’s not much, but it’s home.”</i> Edan shrugs. <i>“Take a seat, I’m gonna order some food.”</i>");
	output("\n\nYou flop on the couch and Edan tosses you the projector remote before picking up a data slate off the table, muttering something about spam before leafing through the delivery selections. You switch idly through the channels, but nothing really catches your eye. Amazing how you can have hundreds of channels available and still not find anything fun. Well, you know how to make your own fun. Edan looks up from the tablet as you get up, placing it back on the table.");
	output("\n\n<i>“Not gonna watch any TV?”</i>");
	output("\n\n<i>“There’s never anything on. Plus,”</i> You say sweetly, running your palm down his chest and over his abs, <i>“I want seconds on my appetizer before dinner.”</i>");
	output("\n\n<i>“You’re insatiable,”</i> Edan grins and shakes his head. <i>“I appreciate that, though. It’s probably why you’re the only girl that can keep up with me.”</i>");
	output("\n\nYou give him a demure smile and sink between his forelegs, where you find his rapidly-hardening erection already swelling in size. Maybe you really <i>are</i> the only one that can keep up with him, you think to yourself, slipping your tongue from your mouth and gently wrapping it around his flaring head. He gives an approving rumble and you take it as a signal to continue what you’re doing, taking your time lapping up and down the contours of his cock without ever fully taking it in your mouth.");
	output("\n\nYou rub your [pc.lips] along its length and give him a sultry moan, just happy to be underneath him once more. This is the first time he’s given you the lead, and you’re determined to make it worth his while. You suck the dribbling head past your lips while stroking him softly, his dick flexing and veins bulging at your delicate ministrations. He groans and gasps above you, his underside shivering and straining when you drag your [pc.tongue] across his tip delightfully slowly, making sure to slurp up his precum in your mouth. A few minutes of your artful teasing and he gives up.");
	output("\n\n<i>“Fuuuck! Okay, that’s it, get on the couch. Any longer down there and you’re going to be full before the food even gets here. Shit, you’re <i>really</i> going to get it.”</i>");
	output("\n\nMission accomplished. You rise with a sly grin and sashay over to the couch, your hips swinging out tantalizingly with every step while you strip off your [pc.gear]. Edan is close behind, his hot breath on you more like a predatory animal than any civilized species. You’d be afraid of what he was going to do to you if you didn’t want it so fucking bad.");
	if (pc.isTaur()) 
	{
		output("You put your forelegs on the couch and spread your hind legs as far as you can to allow easy access, your [pc.tail] flitting about in eager anticipation. Edan wastes no time in mounting you, his gigantic cock searching out your [pc.pussy " + x + "]. He rams it in with a bestial roar, your slickened lips and canal instantly surrendering to his overwhelming size. Oh fuck, this is going to be <i>so</i> good.");
		
		pc.cuntChange(x, chars["EDAN"].cockVolume(0));
		
		output("\n\nThe overactive pheromones you’ve elicited from him with your teasing fill your mind with images of being bred like a mare in heat, the reality only reinforcing the fantasy. You can see the bioluminescence erratically flickering and pulsing brightly across his chitin-covered legs, proof of his wild state of mind. He seizes your midsection in his massive hands to fuck you deeper, sliding more of his equine rod into you until his flared head is pressed up against your womb and pulsating.");
		output("\n\nYou moan loudly at the sensation of his balls pressing into your [pc.butt], the knowledge you’ve taken his entire length every bit as hot as the actual feeling of having his cock filling you. It’s like an iron pole impaling you right through your insides, except it’s throbbing and spraying warm precum all throughout your thoroughly distended cunt. He sighs in luxurious satisfaction.");
		output("\n\n<i>“Fuck! That’s more like it. You make this worth it every time.”</i>");
		output("\n\nEdan takes you by your shoulders and tilts your torso back, kissing you roughly while he savagely pumps your hindquarters, forcing you to moan into his mouth. You feel yourself getting closer and closer to climax and pull him towards you, pushing yourself back into his massive body as he stiffens and flexes, rapidly approaching his own orgasm. He pulls back from the kiss and grabs your [pc.breasts], the pulse of his cock thrumming through your body explosively as the two of you cum.");
		output("\n\nYou can’t help but throw your head back and scream in pleasure looking up at him, your face sweaty and red as you shudder and shake underneath his bulk. His jizz spouts straight into");
		if (pc.isPregnant(x)) 
		{
			if (!pc.hasCock()) output(" your willing canal, not even a second passing before you’re too full to contain any more. The warmth of his ejaculation fills you for what feels like minutes, each shot sending a thrill of sympathetic pleasure down your spine while you quietly moan.");
			else output(" your willing canal, not even a second passing before you’re too full to contain any more. The warmth of his ejaculation fills you for what feels like minutes, each shot sending a thrill of sympathetic pleasure down your spine as your cock gently pulses, dribbling cum down your shaft.");
		}	
		else 
		{
			if (!pc.hasCock()) output(" your waiting womb, thick ropes of leithan spunk splattering inside you. Oh god, he’s filling you so quickly! It’s not long before his virility is making your underhanging stomach swell and sag with the thick warmth of his cum. You groan in both pleasure and mild annoyance, each shot sending a thrill of sympathetic pleasure down your spine but making it less likely you’ll be able to walk.");
			else output(" your waiting womb, thick ropes of leithan spunk splattering inside you. Oh god, he’s filling you so quickly! It’s not long before his virility is making your underhanging stomach swell and sag with the thick warmth of his cum. You groan in both pleasure and mild annoyance, each shot sending a pulsing dribble of cum down your own shaft.");
		}
		output("He finally pulls out, both of you panting in exertion and after-lust. A thin sheen of shimmering sweat covers your bodies, Edan sliding off you slowly as he dismounts. His cum immediately begins rolling down your hindlegs, but you’re too spent to really care. Your legs shake and you collapse forward onto the giant couch, your [pc.butt] in the air and your pussy spilling cum. A wave of exhaustion rolls over you and you briefly entertain the idea of just staying in the couch forever.");
	}
	else
	{
		output("You get on the couch and sit doggystyle, arching your back and spreading your legs to allow easy access, waving your [pc.butt] in eager anticipation. Edan wastes no time in crashing down above you, his gigantic cock searching out your [pc.pussy " + x + "]. He rams it in with a bestial roar, your slickened lips and canal instantly surrendering to his overwhelming size. Oh fuck, this is going to be <i>so</i> good.");
		
		pc.cuntChange(x, chars["EDAN"].cockVolume(0));
		
		output("\n\nThe overactive pheromones you’ve elicited from him with your teasing fill your mind with images of being bred like a mare in heat, the reality only reinforcing the fantasy. You can see the bioluminescence erratically flickering and pulsing brightly across his chitin-covered legs, proof of his wild state of mind. He thrusts his powerful hips to fuck you deeper, sliding more of his equine rod into you until his flared head is pressed up against your womb and pulsating.");
		output("\n\nYou moan loudly at the sensation of taking him as deep as you possibly can, the knowledge he’s filling you up every bit as hot as the actual feeling of his cock. It’s like an iron pole impaling you right through your insides, except it’s throbbing and spraying warm precum all throughout your thoroughly distended cunt. He sighs in luxurious satisfaction.");
		output("\n\n<i>“Fuck! That’s more like it. You make this worth it every time.”</i>");
		output("\n\nEdan bends at the knees, his underslung stomach pressing into your back. You’re borne into the couch under his immense weight, moaning all the while as he savagely pumps your pussy into submission. You feel yourself getting closer and closer to climax and thrust back into him desperately as he stiffens and flexes, rapidly approaching his own orgasm. He collapses on top of you, the pulse of his cock thrumming throughout your body explosively as the two of you cum.");
		output("\n\nYou can’t help but scream into the couch as he lays atop you, your face sweaty and red as you shiver and shake underneath his weight. You lie under him unable to move, just taking his orgasm between your shuddering legs. His jizz spouts straight into");
		if (pc.isPregnant(x)) 
		{
			if (!pc.hasCock()) output(" your willing canal, not even a second passing before you’re too full to contain any more. The warmth of his ejaculation fills you for what feels like minutes, each shot sending a thrill of sympathetic pleasure down your spine while you quietly moan.");
			else output(" your willing canal, not even a second passing before you’re too full to contain any more. The warmth of his ejaculation fills you for what feels like minutes, each shot sending a thrill of sympathetic pleasure down your spine as your cock gently pulses, dribbling cum down your shaft.");
		}	
		else 
		{
			if (!pc.hasCock()) output(" your waiting womb, thick ropes of leithan spunk splattering inside you. Oh god, he’s filling you so quickly! It’s not long before his virility is making your underhanging stomach swell and sag with the thick warmth of his cum. You groan in both pleasure and mild annoyance, each shot sending a thrill of sympathetic pleasure down your spine but making it less likely you’ll be able to walk.");
			else output(" your waiting womb, thick ropes of leithan spunk splattering inside you. Oh god, he’s filling you so quickly! It’s not long before his virility is making your underhanging stomach swell and sag with the thick warmth of his cum. You groan in both pleasure and mild annoyance, each shot sending a pulsing dribble of cum down your own shaft.");
		}
		output(" He finally pulls out, both of you panting in exertion and after-lust. A thin sheen of shimmering sweat covers your bodies, Edan sliding off you slowly as he dismounts. His cum immediately begins rolling down your legs, but you’re too spent to really care. You remain stationary on the couch, your [pc.butt] in the air and your pussy spilling cum. A wave of exhaustion rolls over you and you briefly entertain the idea of just staying where you are forever.");
	}
	output("\n\nEdan meanders into what you assume is the bathroom and returns to toss a ridiculously oversized towel under you. You can’t help but laugh exhaustedly.");
	output("\n\n<i>“This again?”</i>");
	output("\n\nEdan laughs good-naturedly and slaps your vulnerable butt. This time, you maneuver yourself back into a sitting position and wrap yourself in a towel before the delivery boy gets there. As open as you are to exhibitionism, there’s no need to scar a cute delivery boy. Edan hands him a tip and carries a giant stack of food back in as the door shuts, setting down a couple containers near you and putting the rest on the table. He easily lifts you" + (pc.isTaur() ? "r back half" : "") + " up and plops you on the couch with your comically-sized towel before snatching the remote up, mashing through the channels. Before long, he sighs and tosses it back on the couch.");
	output("\n\n<i>“I don’t know why I bother. Screw this, lets watch those movies.”</i>");
	output("\n\nNot like you were going anywhere in your current state.");
	output("\n\n<i>-- 45 minutes go by --</i>");
	output("\n\nYou pass the time snuggled up with Edan watching some action movie about a bank heist gone wrong. It’s not that great, but at least it’s fun to watch. You don’t eat much of your food, feeling full despite the fact that none (well, almost none) of his spunk ended up in your actual tummy. Halfway through the movie you shift around Edan’s outstretched form and idly rub his sheath, ignoring the warning rumbles reverberating in his chest. He lets you get closer, but it doesn’t look like he wants to take an active role so soon after his food.");
	output("\n\n<i>“Looking for something to wash your food down with, Steele? Cuz I’m happy to oblige, if you get it yourself.”</i>");
	output("\n\n<i>“Fine by me.”</i>");
	output("\n\nYou lie down next to him and start kissing and licking his sheath, planting your lips on it as wide as you can when it begins to bulge outward. His dick practically springs outward and straight down your throat, hardening and thickening until it’s swelled out to fill your esophagus. You can already feel him drooling precum into your stomach, but after the earlier exertions you’re not really feeling like moving around a lot. You’ll have to take care of him without too much activity, and it might be hard after he’s already cum once.");
	output("\n\nYou slowly pull your [pc.lips] up his rod to give yourself some room to breathe, softly wrapping your hands around his absurdly thick base before starting to jack him off into you. He gives a drawn-out noise of satisfaction from above you and you’re rewarded with more warmth in your [pc.belly]. You bob your head around his equine pole, drawing back to slip your tongue around his flare to enjoy the heat emanating from the tip. Your desire finally overcomes your torpor, and you find yourself blissfully sliding down his cock in search of bringing him to orgasm. You rub his plump balls in a show of encouragement to fill you up and get a suppressed groan for your efforts.");
	output("\n\nSmiling inwardly, you go back to doing what you do best: throating Edan’s cock like a pro. You effortlessly swallow feet of cock, your lips inching down his length, feeling his cum vein flex and stretch your mouth wider every few seconds. Gag reflex completely suppressed, your cock worship is a full body experience. You stroke it up and down with alternating paces, you slip it between your [pc.breasts] and rub your [pc.nipples] with it, your tongue rubs every ridge and bump along its length, you swallow his hot pre to massage it with weak undulations of your throat.");
	output("\n\nIt’s not long before he’s teetering on the brink of orgasm, huffing in equal parts pleasure and torturous desire. You can actually feel the moment his sense of reason dissipates, signaled half by the increasingly angry throbbing of blood in his massive penis and half by the fact he groans and pushes you further down. He shifts around on the coach to lie on top of you, his cock embedded in your throat as far as it’ll go. With a couple of rough pumps that set your body jiggling, his grip on you tightens and you feel him begin to hose your insides down with spunk.");
	output("\n\nAfter the bestial display earlier this orgasm is more muted, but no less bountiful. You obediently lie under him, your mouth at his service and your throat wrapped around his cock as he slowly swells you from the inside. You wrap your arms around his midsection and squeeze, urging him to give you as much as he wants, and he obliges in spades. Very soon");
	if (!pc.isPregnant(x)) output(" your stomach has swollen to match your womb, and being held down and pumped soon exceeds it. There’s no convenient escape route for the cum this time and he’s so deep that it won’t just flow back out your throat, so you’re forced to lie on the couch and just quietly take everything he wants to give you. You suck and swallow and weakly rub his midriff, his bulk shivering in pleasure every time he deposits another load deep in your gurgling tummy.");
	else output(" your stomach has swollen to match your pregnancy, and being held down and pumped soon exceeds it. There’s no convenient escape route for the cum this time and he’s so deep that it won’t just flow back out your throat, so you’re forced to lie on the couch and just quietly take everything he wants to give you. You suck and swallow and weakly rub his midriff, his bulk shivering in pleasure every time he deposits another load deep in your gurgling tummy.");
	output("\n\nBy the time he’s done and he pulls out, your well-fucked mouth hangs open dribbling cum between your [pc.lips] and your eyes are half rolled back in your head. You see Edan’s face swim into view above you and give him a moan to let him know you’re conscious, albeit tired.");
	output("\n\n<i>“[pc.name]? Maybe I went overboard. Lets get you to the shower, huh?”</i>");
	output("\n\nDespite some initial struggles with your cum-swelled form");
	if (pc.isTaur()) output(", like the fact your [pc.feet] can hardly scrape the ground");
	output(", he maneuvers you into a large room with a smooth floor. He puts you down and water begins to pour from overhead, warming you up and raising you from your sated stupor. You look up at him half in bewilderment and half in something approaching religious fanaticism.");
	output("\n\n<i>“That was <i>amazing</i>.”</i>");
	output("\n\n<i>“Yeah, they do good delivery,”</i> comes the completely straight-faced reply, making you smile and laugh. Edan grabs some liquid soap and begins rubbing it into you, leaving you to lean back into him and relax with your eyes closed as he carefully washes you up with suds and warm water. Nothing like a bit of pampering, especially when you’re incapable of doing it yourself.");
	output("\n\nHis hands brush lightly over your nipples, provoking a soft sigh from your lips and the realization you don’t get to enjoy this kind of non-sexual attention often, if ever. He lets go of you and begins to clean himself up quickly before you stop him.");
	output("\n\n<i>“No?”</i> He says, looking at you for a clue.");
	output("\n\n<i>“No. It’s my turn.”</i>");
	output("\n\nHe relaxes and drags a bucket and wet towel across to give to you. You move around to his front and he sits up, uncrossing his arms so you can wash his chest. Soaping him up, you wash his muscular arms and chest, taking care to gently massage his upper body. You towel him down with warm water and shuffle closer, pressing your [pc.chest] against his front and getting your hands under him before he stops you.");
	
	pc.shower();
	
	output("\n\n<i>“How about we continue in the bedroom?”</i>");
	output("\n\n<i>“So we cleaned up for nothing?”</i> You put on a pout, but you can’t hide that you’re eager for his dick to be inside you. <i>“Fine, but you’re still going to have to help me there.”</i>");
	output("\n\nThe both of you wrestle your still-cumflated body into Edan’s bedroom and onto his bed, where you collapse on your side.");
	output("\n\n<i>“I couldn’t eat another bite,”</i> you quip, and he laughs.");
	output("\n\n<i>“Guess we’ll have to solve the problem working backwards, then.”</i>");
	output("\n\nHe throws down a towel and lies down beside you, the feeling of his dick iron-hard on your back a welcome distraction from your tummy. There’s no doubt you’re going to swell back up again, but weighing the consequences between not getting his dick and getting it you’re one hundred percent sure what you want.");
	output("\n\n<i>“Fuck me </i>hard<i>,”</i> you moan lustily.");
	output("\n\n<i>“Always do.”</i>");
	if (!pc.hasCock())
	{
		output("\n\nEdan slides down and grasps your [pc.butt], aligning himself with your [pc.asshole] and pushing forward with a grunt. You yelp a little as his flare slips inside your ring, but the rest is smooth and sensitive sailing. He pulls you down the bed until it’s fully in you, leaving you weakly writhing on the pillar impaling you from the bottom up. After letting you get used to it he slowly starts pumping you, increasing in intensity until you’re loudly grunting in a very un-ladylike manner every time he hilts himself in your guts.");
	
		pc.buttChange(chars["EDAN"].cockVolume(0));
	
		output("\n\n It’s impossible not to cry out in lust and pleasure when a few feet of cock is rearranging your internal organs to better turn you into a cumdump, and you don’t bother resisting the urge. He loves hearing you break down over his dick until you’re incapable of doing anything other than just taking it, and you do love to please. The full-body stimulation is just too much for your frame and before long you’re cumming with every other thrust, your [pc.pussy] spasming and still leaking spunk from your earlier fucking.");
		output("\n\nYou practically seize in his grip, your muscles completely taut as the electric thrill of multiple orgasms crashes throughout your nervous system and leaves you gasping for breath. Taking that as his cue to finish up, Edan thrusts roughly into you once, twice, and then groans as he starts refilling you with warm seed. You moan and sigh erotically when you feel your insides being plastered with his jizz once more, the heat starting at your core and blossoming outwards as your bowels are filled over and over. He hugs you closer as your stomach swells out again, this time from the other end. Wriggling in his grip as you blow up, you can’t help but wonder how much more you can even take. You’re starting to taste his cum in your mouth, and it’s not just from sucking his cock earlier.");
		output("\n\nFinally the spray of jizz into your innards recedes, and you’re left shivering on the end of his massive cock unable to move. He pulls a few pillows down from the top of the bed and props them under your head, pulling the blankets up and over. You almost instantly fall asleep being cradled in his arms, hoping that walking is a realistic proposition when you get up tomorrow.");
	}
	else
	{
		output("\n\nEdan slides down and grasps your [pc.butt], aligning himself with your [pc.asshole] and pushing forward with a grunt. You yelp a little as his flare slips inside your ring, but the rest is smooth and sensitive sailing, although you whimper in pleasure every time a vein or his medial ring rubs your prostate. He pulls you down the bed until it’s fully in you, leaving you weakly writhing on the pillar impaling you from the bottom up. After letting you get used to it he slowly starts pumping you, increasing in intensity until you’re loudly grunting in a very un-ladylike manner every time he hilts himself in your guts.");

		pc.buttChange(chars["EDAN"].cockVolume(0));
	
		output("\n\n It’s impossible not to cry out in lust and pleasure when a few feet of cock is rearranging your internal organs to better turn you into a cumdump, and you don’t bother resisting the urge. He loves hearing you break down over his dick until you’re incapable of doing anything other than just taking it, and you do love to please. The full-body stimulation is just too much for your frame and before long you’re cumming with every other thrust, your [pc.pussy] spasming and still leaking spunk from your earlier fucking and your [pc.cock] spewing [pc.cum] everywhere.");
		output("\n\nYou practically seize in his grip, your muscles completely taut as the electric thrill of multiple orgasms crashes throughout your nervous system and leaves you gasping for breath. Taking that as his cue to finish up, Edan thrusts roughly into you once, twice, and then groans as he starts refilling you with warm seed. You moan and sigh erotically when you feel your insides being plastered with his jizz once more, the heat starting at your core and blossoming outwards as your bowels are filled over and over. He hugs you closer as your stomach swells out again, this time from the other end. Wriggling in his grip as you blow up, you can’t help but wonder how much more you can even take. You’re starting to taste his cum in your mouth, and it’s not just from sucking his cock earlier.");
		output("\n\nFinally the spray of jizz into your innards recedes, and you’re left shivering on the end of his massive cock unable to move. He pulls a few pillows down from the top of the bed and props them under your head, pulling the blankets up and over. You almost instantly fall asleep being cradled in his arms, hoping that walking is a realistic proposition when you get up tomorrow.");
	}
	output("\n\nWhen you do wake up, it’s caused by the sensation of water falling on you. You groggily open your eyes to find Edan has carried you into the shower for another scrub, and looking down you see your swelling has receded. You grumble a bit and Edan shooshes you.");
	output("\n\n<i>“Go back to sleep. I’ll get you cleaned up and you can rest until you’re ready, I’m gonna head out.”</i>");
	output("\n\nFeels nice to be spoiled. Your eyes drift close under the warmth of the shower and gentle massaging, and you awaken refreshed some hours later in a clean bed. There’s a note on the dresser, and you read it");
	if(pc.hasUpperGarment() || pc.hasLowerGarment())
	{
		output(" after putting your");
		if(pc.hasUpperGarment()) output(" [pc.upperUndergarment]");
		if(pc.hasUpperGarment() && pc.hasLowerGarment()) output(" and");
		if(pc.hasLowerGarment()) output(" [pc.lowerUndergarment]");
		output(" on");
	}
	output(".");
	output("\n\n<i>“Hey Steele, dunno if you were awake enough to remember but I’m out for the day. There’s some leftovers on the table if you want to warm them up, but I’ve got a feeling you won’t be hungry. Come see me again if you want to hang out.");
	output("\n\n- Edan”</i>");
	output("\n\nHang out indeed. Being blown up like a blimp by cum is fucking hot and the whole thing feels great, but there’s something to be said for being able to walk. Still, you’re keen to see him again. Eating a few bites of the leftovers you find his prediction was mostly true, and screw up your face at the prospect of having to finish it. You opt to close the container and put it back on the table, finding the rest of your gear strewn across the floor and putting it back on. Exiting Edan’s ship, you step down the ramp and into the Novahome hangar.");

	pc.loadInCunt(chars["EDAN"],x);
	pc.loadInAss(chars["EDAN"]);
	pc.loadInMouth(chars["EDAN"]);
	processTime(800);
	pc.orgasm();
	pc.shower();
	sleepHeal();
	
	IncrementFlag("EDAN_FUCKED");
	
	addButton(0, "Next", mainGameMenu);
}




//START OF DRINKING SCENES
public function edanDrinksIntro():void //broooooo
{
	generateMap();
	
	clearOutput();
	clearMenu();
	edanHeader();
	
	if (flags["EDAN_FUCKED"] == undefined)
	{
		output("You’re in the Mess’ attached bar, thankfully separated from the deafening din of the open hall by a sturdy wall and thick windows. Though still smoky, the bar has a much calmer, friendlier atmosphere, and you’re quickly able to find a seat thanks to a hostess at the door, wearing a strikingly skimpy version of the Carver uniform: a simple black vest, a thong, and fishnets to cover most of her body. The rest of the staff seems to be just as scantily clad, if not more so: a stage has been erected on one wall, where a topless ausar girl in nothing but her fishnets and a pair of pasties is currently singing to the accompaniment of an old-earth jazz band made up of raskvel in little tuxedos. The bar here is clearly catering to a higher-class clientele, and most of the people lounging around are fellow spacers and pioneers coming in for the planet rush, while others have the air of off-duty U.G.C. scouts and engineers. Almost everyone has a drink or a half-nude server in their lap, maybe both. This place is a weird mesh of retro earth and sensuality, that’s for sure.");
		output("\n\nYou order some drinks from the bartender, a cute girl in a tight cocktail dress that accentuates her curves, and take a seat at a table. Thankfully, the bar is more accommodating of leithans than the mess hall is. You mention this to Edan and he laughs.");
		output("\n\n<i>“Yeah, the bars are where all the interstellar travellers congregate so it makes sense. You’ll meet all kinds of weirdoes in bars, trust me. The mess hall is just the remains of the Novahome’s cafeteria, so they haven’t really put into work into it beyond a bunch of benches and tables. And cute waitresses. Speaking of which, here’s our drinks.”</i>");
		output("\n\nThe dusky-skinned waitress arrives red-faced and slightly sweaty, placing your drinks and a bottle on the table and giving you an eyeful and more of her well-rounded butt as she does so thanks to the contours of her dress.");
		output("\n\n<i>“Here you go! Quivering Quasar. Enjoy!”</i>");
		output("\n\nShe chirps before turning away. Edan reaches out and gives her a light slap across the butt, laughing at her flustered squeak and subsequent retreat to behind the bar. He grins at you.");
		output("\n\n<i>“I don’t like to stay in one place too long, but I never get tired of this bar.”</i>");
		output("\n\nHe says as he lifts his glass. You reply that it’s not hard to figure out why before downing your drink, the smell of ozone making it to your nose as you swallow. Jeez, that stuff is something else. You feel like you could take on the world! Edan looks at you with amusement as you start to flex a bit, ");
		if (pc.physique() < 10) 
		{
			output("your arm shaking with the effort, your bicep perceptibly straining under your [pc.skinFurScalesNoun]. He laughs, and you decide to return to drinking. At least you hold your own there.");
		}
		else if ((pc.physique() >= 10) && (pc.physique() < 20))
		{
			output("the muscles of your arms visibly straining against your skin.");
			output("\n\n<i>“Not bad, Steele. You look like you could give an amazon a run for her money in an armwrestle.”</i>");
			output("\n\nYou get back to the task at hand - knocking back drinks.");
		}
		else if ((pc.physique() >= 20) && (pc.physique() < 30))
		{
			output("the muscles in your entire arm swelling with the effort, veins making themselves apparent across your forearm.");
			output("\n\n<i>“Goddamn, Steele. You spend all of your spare time in the gym?");
			if (pc.race().toLowerCase().indexOf("leithan") != -1) output(" That’s impressive even for a leithan.”</i>");
			else output(" That’s impressive as hell for " + indefiniteArticle(pc.race().toLowerCase()) + ".”</i>");
			output("\n\nThe gunshow over, you return to what matters - drinking.");
		}
		else 
		{
			output("raising both your arms and curling them, ripples of muscle playing up your forearms, biceps and triceps. Even your traps and deltoids contract and swell as you play it up, fueled by the alcohol.");
			output("\n\n<i>“God <i>damn</i>, Steele. Between the two of us we could probably take on an army.”</i>");
			output("\n\nYou nod your agreement and get back to what matters - drinking.");
		}
		output(" You pass the time drinking and talking, getting progressively louder and drunker until you both realize it’s time to go before things get out of hand. You both get up to leave and Edan turns to you to shake your hand and say goodbye for now.");
		
		addButton(0, "Leave", edanDrinksLeave);
		addButton(1, "Sex", edanDrinksSexFirst, undefined, "Sex", "Proposition Edan for some drunken fun.");
	}
	else
	{
		output("You’re in the Mess’ attached bar, thankfully separated from the deafening din of the open hall by a sturdy wall and thick windows. Though still smoky, the bar has a much calmer, friendlier atmosphere, and you’re quickly able to find a seat thanks to a hostess at the door, wearing a strikingly skimpy version of the Carver uniform: a simple black vest, a thong, and fishnets to cover most of her body. The rest of the staff seems to be just as scantily clad, if not more so: a stage has been erected on one wall, where a topless ausar girl in nothing but her fishnets and a pair of pasties is currently singing to the accompaniment of an old-earth jazz band made up of raskvel in little tuxedos. The bar here is clearly catering to a higher-class clientele, and most of the people lounging around are fellow spacers and pioneers coming in for the planet rush, while others have the air of off-duty U.G.C. scouts and engineers. Almost everyone has a drink or a half-nude server in their lap, maybe both. This place is a weird mesh of retro earth and sensuality, that’s for sure.");
		output("\n\nYou order some drinks from the bartender, noting that Edan is palming your butt");
		if(pc.isCrotchGarbed()) output(" through your [pc.lowerGarmentOuter]");
		output(" as you do. You indulge his attentions, pushing your [pc.ass] back against him before turning away to find a table. Thankfully, the bar is more accommodating of leithans than the mess hall is. You find a table to fit the both of you tucked away in a corner and take a seat across from Edan.");
		output("\n\n<i>“This seems like a familiar arrangement. You’re a wild one, Steele. Not as wild as the waitress here - I’ve seen some crazy shit out of her - but I’ve got a feeling we can work on that. Speaking of which, here she is with our drinks,”</i> Edan waves.");
		output("\n\nThe dusky-skinned waitress arrives red-faced and slightly sweaty, placing your drinks and a bottle on the table and giving you an eyeful and more of her well-rounded butt as she does so thanks to the contours of her dress.");
		output("\n\n<i>“Here you go! Quivering Quasar. Enjoy!”</i> She chirps before turning away. Edan reaches out and gives her a light slap across the butt, laughing at her flustered squeak and subsequent retreat to behind the bar. He grins at you.");
		output("\n\n<i>“It’s fun every time,”</i> he says as he lifts his glass. You think back to what he said earlier about working on it and down your drink, the smell of ozone making it to your nose as you swallow. Jeez, that stuff is something else. You feel full of strength, and look over to see what effect it’s having on Edan. As you’d expect from a ten foot leithan and know from experience, he’s huge everywhere. You trace the musculature of his forearm upwards to his bicep, your eyes roving over his form as you admire what must surely be massive strength. It’s so hard, too...");
		output("\n\n<i>“Like what you see, Steele?”</i> Edan teases, bringing you out of your drunken molesting of his arm. You lean back over to your side of the table and retort that the effect must be bigger on bigger people before slamming down another shot. Edan just laughs as he takes a drink.");
		output("\n\n<i>“The drink doesn’t do anything for me aside from the alcohol, Steele. What you’re seeing and touching is just me,”</i> he flashes you a grin before calling for another bottle. You pass the time drinking and talking, getting progressively louder and drunker until you both realize it’s time to go before things get out of hand. You both get up and Edan turns to you with a grin.");
		output("\n\n<i>“Up for some fun?”</i>");
		
		addButton(0, "Leave", edanDrinksLeave);
		addButton(1, "Sex", edanDrinksSexSecond, undefined, "Sex", "Always am!");
	}
	
	// Quasar effects
	processTime(10);
	if(pc.hasStatusEffect("Quivering Quasar"))
	{
		if(pc.statusEffectv2("Quivering Quasar") < 10)
		{
			pc.addStatusValue("Quivering Quasar", 2, 5);
			pc.physiqueMod += 5;
			pc.changeLust(5);
		}
	}
	else
	{
		pc.createStatusEffect("Quivering Quasar",0,5,0,0,false,"Icon_DizzyDrunk","This top-shelf alcohol makes you feel stronger - so much so that your maximum physique is temporarily increased.",false,180);
		pc.physiqueMod += 5;
		pc.changeLust(5);
	}
	pc.imbibeAlcohol(20);
}

public function edanDrinksLeave():void
{
	clearOutput();
	clearMenu();
	edanHeader();
	
	if (flags["EDAN_FUCKED"] == undefined)
	{
		output("You shake his hand and suggest doing this again sometime soon.");
		output("\n\n<i>“Yeah, that’d be good. You hold your drink pretty well, Steele. It’s not every [pc.race] that can keep up with me. I’ll see you round.”</i>");
		output("\n\nEdan leaves, and you turn to depart.");
	}
	else
	{
		output("You shake your head with some regret and mention you have things to do. He seems to understand and you part ways, albeit drunkenly.");
	}
	
	processTime(30);
	addButton(0, "Next", mainGameMenu);
}

//START OF EDAN'S SEX SCENES FROM DRINKING SCENES
public function edanDrinksSexFirst():void
{
	clearOutput();
	clearMenu();
	edanHeader(true);
	
	output("You don’t want the drunken fun to end. You say as much to Edan as you grasp his much larger hand and he cracks a grin.");
	output("\n\n<i>“I thought you might say that. Guess the waitress mixed up the drinks and gave you a Sex on a Meteor instead, huh? There’s no real place nearby though... wait.”</i>");
	output("\n\nEdan looks over at the toilets on the far side of the tavern and you can see gears drunkenly turning in his head.");
	output("\n\n<i>“Yeah, alright. Won’t be the first time, and you don’t seem the type to mind.”</i>");
	output("\n\nYou nod your head, far more assertive and less discriminating in your drunken state than you would be otherwise. Edan practically whisks you off your feet into the male toilets, surprisingly quick for a drunk ten foot leithan. You’re trotted past a couple of guys at the urinals who grin or snicker as Edan holds your hand, guiding you into a stall. This clearly isn’t the first time a barfly has been fucked in the toilets here, despite the upper-class clientele.");
	output("\n\nThankfully the stalls are at least tall if not wide, so that while you’re somewhat close at least Edan’s head isn’t poking over the dividers. You’re hot, drunk, and eager as Edan lightly pushes you down on to the toilet cover, his rigid horsecock already out from its sheath and growing. You lean forward and stroke it with both hands, coaxing out more of its absurd length until the tip is close enough to suck. You open as wide as you can and take in the head, some precum already leaking from the tip in his alcohol-induced fervor.");
	output("\n\nHe moans quietly as your [pc.lips] slip around the tip, your warm tongue bathing the underside of his dick as you slowly bob your head up and down, popping your lips around the flare of his tip on every downstroke. You keep this up for a couple of minutes, slowly working at taking his monstrous cock as deep as you can manage until he decides to switch positions. He rears up and places his foremost legs against the wall, allowing you easier access to the throbbing rod hanging tantalizingly in front of your face.");
	output("\n\nYou gratefully make use of the opportunity, taking his member in two hands to jack him off while you suckle on its head, swishing your tongue around the opening collecting his delicious precum to use as lubricant. It’s a difficult angle, but you slowly work on taking his engorged cock deeper into your mouth, much to his satisfaction if his increasingly loud groans are any indicator. You focus on relaxing your jaw and just sliding your head up and down his dick, spurts of precum coming faster and harder until it’s a continual hot flow down your throat. You can feel him thickening in your mouth, and increase the pace of masturbating him into your mouth until he’s panting heavily and his legs on either side of your head are flexing and shaking.");
	output("\n\nIt’s not long before he explodes in your mouth, instantly filling your cheeks and spraying as much spunk as will fit straight down to your stomach. You gulp down his first few loads but your poor throat isn’t able to keep up with his incredible ejaculation, and you end up spilling a bit on yourself as you twist aside and jack him off fiercely as he finishes riding out his orgasm, splattering the wall and toilet with a truly impressive amount of his cum. By the time he’s done, pretty much the entire side of the cubicle he was aimed at is covered in a coating of leithan spunk. You look at him with some amazement and he shrugs.");
	output("\n\n<i>“Probably time to get out of here, Steele. Someone’s gonna have to clean this, and it’s not gonna be me.”</i>");
	output("\n\nYou nod and say your goodbyes, cleaning yourself off a bit before making your own exit. A drunken patron at the urinals gives you a sarcastic clap as you walk past before pissing on his own pants. As you make your way out of the toilets to the sound of his cursing, you consider that you’ve probably never seen such swift karmic retribution.");
	
	pc.loadInMouth(chars["EDAN"]);
	processTime(10);
	pc.changeLust(30)
	addButton(0, "Next", mainGameMenu);
}

public function edanDrinksSexSecond():void
{
	generateMap();
	
	clearOutput();
	clearMenu();
	edanHeader(true);
	
	output("You tell Edan you’re always up for some fun with him and he cracks a grin.");
	output("\n\n<i>“Did I see you drinking Sex on a Meteor? Alright, let’s go.”</i> Edan looks over at the toilets on the far side of the tavern and you can see gears drunkenly turning in his head. <i>“Yeah, alright. Won’t be the first time.”</i>");
	output("\n\nYou nod your head, far more assertive and less discriminating in your drunken state than you would be otherwise. Edan literally whisks you off your feet into the male toilets, surprisingly quick for a drunk ten foot leithan. You’re trotted past a couple of guys at the urinals who grin or snicker as Edan carries you into a stall. This clearly isn’t the first time a barfly has been fucked in the toilets here, despite the upper-class clientele. Thankfully the stalls are at least tall if not wide, so that while you’re closely packed at least Edan’s head isn’t poking over the dividers.");
	output("\n\nEdan puts you down firmly on the toilet cover and rears up, planting his powerful front legs on the wall on either side of your head. His cock hangs directly in front of you, already hard and waving a bit as he settles in his new position. You grab it with both hands and plant your [pc.lips] on the tip, kissing his cock before opening your mouth and taking the warm head inside.");
	output("\n\nIt feels good to make him groan in pleasure above you, wrapping your tongue around his flare while you slowly work him further into you, pulling yourself along his gigantic cock and feeling him scrape through your throat. Your tongue is squashed against the bottom of your mouth as you take his warmth further inside you, until his flare is jutting out of your lower neck and you find yourself thinking the tradeoff is worth it.");
	output("\n\nJust having him this deep inside you is setting off fireworks in your head, and you hold him there while you put your arms down, gripping the edge of the toilet seat to give yourself some leverage. You bob your head back and forward to tease him, slowly sliding him in and out of the depths of the throat until he takes the hint.");
	output("\n\n<i>“</i>Fuck<i>, Steele. Feeling pretty confident down there?”</i>");
	output("\n\nEdan seems to be about to say more, but as he starts thrusting the only noises that come out of his mouth are sighs and panting exhalations. The only noises coming out of your overfull mouth are wet slurps and muted moans as his cock slips further into you, dripping precum down the sides of your willing throat.");
	output("\n\nHis first few thrusts are slow and experimental, your muscles weakly massaging his hardness, but he gradually builds up to a decent rhythm as you try to hold on and provide the best angle for him to fuck your throat. He pumps you good but not too hard, not wanting to risk taxing you too much. Given that you’re not even a third of the way down his rod, you’re happy to lay back and just let him use you, holding back your desire to fully impale yourself on his rock-hard length.");
	output("\n\nGiven the plight of your location, Edan elects to keep things short and sweet. His thrusts grow harder and more urgent in your throat, wet gasps and moans spilling from your mouth as his cock thickens in mute announcement of the cum you’re about to be swallowing. He lets loose a low groan and hilts himself as deeply as you can manage, your throat tightening around his cock as each load travels towards your [pc.stomach]. You can actually feel the heat of it travel down your throat again and again, your eyes rolling back in pleasure slightly as you relax, your fervor placated by the warm cum spraying into you, pooling in your stomach.");
	output("\n\nEdan dismounts from the wall and slides his cock out of you, the well-lubricated flare slipping past your [pc.lips] with a wet pop and a trail of spunk that drapes itself across your face and [pc.hair]. He looks down at your glazed and dazed form and smiles a bit before turning to leave.");
	output("\n\n<i>“Looks like you enjoyed the ride, Steele. I know I did! I’ll see you around, yeah?”</i>");
	output("\n\nHe gives you a little wave as he exits the stall, closing the door behind him to at least allow you a semblance of privacy as you gather the pieces of your overstimulated mind together. You idly collect the cum across your face and slip it between your lips, cleaning yourself off a bit with your [pc.tongue] before swallowing, adding to the heat in your stuffed tummy. You get up after a bit of personal grooming and leave, accompanied only by the sensations of a slightly sore throat, a stomach fucked full of spunk and a dripping wet pussy.");
	
	pc.changeLust(40);
	processTime(20);
	pc.loadInMouth(chars["EDAN"]);
	addButton(0, "Next", mainGameMenu);
}

public function edanDrinksSexThird():void
{
	generateMap();
	
	clearOutput();
	clearMenu();
	edanHeader(true);
	
	var isLeithan:Boolean = pc.race().toLowerCase().indexOf("leithan") != -1;
	
	output("You’re in the Mess’ attached bar, thankfully separated from the deafening din of the open hall by a sturdy wall and thick windows. Though still smoky, the bar has a much calmer, friendlier atmosphere, and you’re quickly able to find a seat thanks to a hostess at the door, wearing a strikingly skimpy version of the Carver uniform: a simple black vest, a thong, and fishnets to cover most of her body. The rest of the staff seems to be just as scantily clad, if not more so: a stage has been erected on one wall, where a topless ausar girl in nothing but her fishnets and a pair of pasties is currently singing to the accompaniment of an old-earth jazz band made up of raskvel in little tuxedos. The bar here is clearly catering to a higher-class clientele, and most of the people lounging around are fellow spacers and pioneers coming in for the planet rush, while others have the air of off-duty U.G.C. scouts and engineers. Almost everyone has a drink or a half-nude server in their lap, maybe both. This place is a weird mesh of retro earth and sensuality, that’s for sure.");
	output("\n\nEdan orders drinks for the two of you at the bar then pats you lightly on the butt to maneuver you over to a table in the corner of the tavern, out of sight of most of the other patrons. You think nothing of the table selection, suddenly distracted by the realization that in the darkness of the tavern, Edan’s skin is faintly glowing yellow.");
	if (!CodexManager.entryUnlocked("Leithans") && !isLeithan)
	{
		output("\n\n<i>“Why are you glowing?”</i> You bluntly inquire, before realizing maybe it’s something private; you know there are some species whose colorations are sexual indicators.");
		output("\n\n<i>“Oh, the bioluminescence? That’s a leithan thing. They’re half a way to scare off predators and half a way to tell if we’re pissed off or just experiencing extreme emotion. Chances are you won’t see it at full blast unless we’re doing something <i>really</i> wild, ha. You’ve never asked your friendly neighborhood leithan why they glow?”</i> Edan jokes.");
		output("\n\nYou shrug.");
	}
	else if (CodexManager.entryUnlocked("Leithans") && !isLeithan)
	{
		output("\n\n<i>“Oh, I can see your lights. They’re mostly to warn predators off, right?”</i> You remark offhandedly.");
		output("\n\nEdan shrugs. <i>“Nowadays, they’re mostly indicators of extreme emotion since most of the leithans that grow up on our homeworld move off it. Aren’t too many predators out here like the ones back home. You probably won’t see me light up unless we’re doing something <i>really</i> wild, ha.”</i>");
	}
	else
	{
		output("\n\nEdan catches you looking and looks puzzled before realizing.");
		output("\n\n<i>“Right, you wouldn’t have grown up on the homeworld. I guess you haven’t seen many other leithans glowing in the dark, ha. It’s really only useful back home to make predators wary, anyway. Nowadays it just glows when we’re experiencing extreme emotion... but you probably already know that, huh?”</i> he says with a knowing wink.");
	}
	output("\n\nHe placed some subtle emphasis on the ‘we’ there, prompting you to wonder if you could get fucked so well as to make him experience <i>“extreme emotion”</i>. You briefly wonder what a 10 foot leithan possessed by breeding lust might look like,");
	if (isLeithan) output(" not having any experience with males of your own species. Maybe it’s the same-race bias, but you can’t imagine there’d be a better way to be fucked than to be mounted by a huge leithan stud with a cock like Edan’s. You don’t think your desire to be roughly fucked into the ground like Edan’s needy slut is to do with your biology, though. That’s <i>probably</i> just you, although you can’t say for sure.");
	else output(" not having any experience with leithan males. Giving Edan a once-over with your eyes you don’t know if you’d even survive the experience, but you do know it’d be worth finding out just to see what it feels like to be fully speared on his cock. He’s so big he could probably hilt inside you and leave you there like a sock.");
	output("You return to idle chitchat before you can get too distracted, although most of it is flirtatious innuendo from you to entice Edan into fucking you. You’re on the verge of just getting under the table yourself to force the issue when the drinks arrive.");
	output("\n\nThe dusky-skinned waitress appears red-faced and sweaty, placing your drinks and two bottles on the table and giving you an eyeful and more of her well-rounded butt as she does so thanks to the contours of her dress.");
	output("\n\nThe burning isn’t the alcohol, it’s the intense feeling you’ve come to associate with Edan - insatiable lust. You look at Edan but your eyes get lost on his muscular chest on the way up to his face, and you unconsciously make a low desirous moan from your throat.");
	output("\n\n<i>“God damn, this stuff is strong. How are you holding up, St-”</i> Edan meets your eyes as you just stare dumbly at him, panting hotly, hypnotized by his giant form and the thought of his cock.");
	output("\n\n<i>“Oh.”</i>");
	output("\n\nYou can’t take it. At the mere <i>sensation</i> of his utterance, the single syllable in his deep voice vibrating in you until you can feel it in your pussy, you’re off your seat and under the table. Your [pc.lips] are planted on the head of his already-unsheathed dick, no doubt provoked by your lusty fuck-me eyes and the yearning moans emanating from your mouth as much as the drink, as you bathe his rapidly-lengthening rod with your [pc.tongue]. Edan exhales in a low satisfied tone as you lick all over his cock, subserviently encouraging it to full erection.");
	output("\n\nThere’s a commotion behind you and you hear voices, bringing you out of your cock-worshipping funk just enough to pay a bit of attention because Edan is involved, but not enough for you to take your lips off his throbbing member.");
	output("\n\n<i>“Hey big guy! Are you here by yourself?”</i>");
	output("\n\nA girly voice followed by giggles. There must be a group of girls looking to hit on Edan, you guess. You’re filled with a moderately satisfying sense of smugness as you think to yourself that they got here too late, but then again, there’s probably enough of him to go around. You lightly caress his balls as you slowly stroke the underside of his dick, making him quiver a bit as he answers.");
	output("\n\n<i>“No, I’m here with a fff- a friend,”</i> Edan murmurs. <i>“She’s a little busy right now, though.”</i>");
	output("\n\nMore giggling from above. You’d be annoyed, but they’re not actually stopping you from giving Edan’s cock your love so you can’t bring yourself to care too much. All you can see is their legs, which are admittedly attractive in a lithe fashion.");
	output("\n\n<i>“I’ll bet she is, big guy. Why don’t I just take a look under here..?”</i>");
	output("\n\nYou look over a bit and see a smiling ausar face come into view. Wow, she’s a cutie herself.");
	output("\n\n<i>“Hey babe. You having fun down he- holy shit, that is </i>the<i> biggest cock I have ever seen. Hey, get down here!”</i>");
	output("\n\nThe next thing you know you’re being crowded by a trio of half-naked ausar girls eager to see what the deal is below-table, each jockeying for a position between Edan’s legs in between chatter and excitement. Whatever, between that drink and your natural inclination, all you’re interested in is Edan’s cock. They can get some too if they want it.");
	output("\n\n<i>“Damn, she’s keen. Not that I blame her, </i>look<i> at this thing. Mmm.”</i>");
	output("\n\nOne of the girls sits alongside you and runs her tongue up the base of Edan’s cock, clearly not shy at all about participating in a group blowjob. Another one slips under her to fondle and lick his taut ballsack, your combined actions eliciting a groan from above. Hey, this is kinky AND kind of fun. The third girl, though, catches you offguard by pulling " + (pc.hasLowerGarment() ? "down your [pc.lowerUndergarment]" : "off the rest of your gear") + ", your [pc.vaginas]");
	if(pc.hasCock()) output(" and [pc.cocks]");
	output(" suddenly bared to the air.");
	output("\n\nYou start a bit, but you’re too busy slowly jacking Edan off and sucking to admonish her. Besides, this might be good. She runs her fingers across your hotly inflamed lips, the wetness of your arousal soaking her hand in your juices before she’s even entered you. You hear her voice from behind you.");
	output("\n\n<i>“Damn, you’re really getting off on sucking this guy’s cock. Seems a little lopsided to me, let’s see if I can make this as good for you as you’re making it for him!”</i>");
	output("\n\nYou feel her move her hand away and hear her shuffle around a bit behind you, most of your attention still focused on Edan’s bulging cum vein and panting exhalations above you. You must be making him feel <i>really</i> good, servile happiness taking root in your head. You flicker your tongue over one of the veins on his throbbing dick as the girl on your right places her entire mouth around his ballsack and gently sucks, causing another low moan.");
	output("\n\nYou feel a slight burn of ugly jealousy in your stomach, but you don’t have time to dwell on it as the ausar girl behind you");
	if (!pc.isTaur()) output(" lifts your [pc.butt] and");
	output(" all but shoves her snout into your");
	if (pc.isTaur()) output(" rear-mounted");
	output(" snatch, licking up and down to collect your moisture and making you shake in ecstasy, femcum dripping freely and keeping her in a cycle of slurping and licking.");
	output("\n\nYour tongue jerks erratically across Edan’s shaft as you cum right into the ausar bitch’s mouth, moaning loudly all the while. At the extra stimulation and the sound of his drunken cumslut sexily writhing and gasping below him, Edan jerks forward, unable to resist cumming. He groans in satisfaction as his cock slips right between your [pc.lips], ramming home as your pliant throat eagerly devours at least a quarter of his absurd length, the flare of his head swelling your throat to a degree that has your ausar sidekicks looking on in a mix of awe, trepidation, and intense desire. You struggle to keep up as Edan’s loads begin gushing into you, your jaw stretched to capacity around his throbbing manhood as you desperately swallow his spunk.");
	output("\n\n<i>“Is she swallowing - is she going to swallow <i>all of it?</i>”</i>");
	output("\n\n<i>“This is the <i>hottest</i> thing I’ve ever fucking seen!”</i>");
	output("\n\nThe ausar girls have stopped what they’re doing to watch and listen to your throat swell and the loud, strained swallowing accompanying the passage of each load as it’s deposited into your stomach. You hardly notice their stares, enraptured entirely by the feeling of Edan’s spunk being pumped into you, warming you from the inside and satiating your alcohol-induced desire to suck cock.");
	output("\n\nIt feels <i>so good</i> to fulfill your needs that you cum on the spot, unaided by stimulus beyond what you’re being subjected to by Edan. By now the girls around you are silent save for panting gasps of exertion and pleasure, the noises of lewd squishing as they masturbate fiercely going unheard by your [pc.ears]. The pounding of Edan’s heartbeat, his satisfied groans, his whispered praise and the splatter of his cum inside you fill your world entirely. At the peak of his flow you cum yourself, unable to resist between the feeling of being filled and the sight of the debauchery around you. Your eyes roll back as femcum explosively sprays the floor " + (isLeithan ? "behind" : "below") + " you, dripping from your [pc.vaginas].");
	output("\n\nWhat feels like minutes pass as you continue to suck and swallow, hollowing your cheeks as best you can as your mouth is rutted, your chin dripping with saliva and cum as little excesses spurt out onto your face. Finally he finishes and as he slips his prick from between your [pc.lips] having finished using you as a cumdump,");
	if (pc.isTaur()) output(" your humanoid half flags to the side, suddenly tired. You’re supported by the ausar girl next to you, who takes the opportunity to ");
	else output(" you flop backwards into the arms of the ausar girl behind you, who takes the opportunity to ");
	if (pc.isChestGarbed()) output("sneakily slip her hands past your [pc.upperGarments] and ");
	if (pc.biggestTitSize() < 4) output("rub your [pc.breasts], tweaking your [pc.nipples] to draw a tired moan from you before leaning down to give you a gentle kiss on the mouth. You’re too tired to resist but you wouldn’t have anyway, the soft embrace of her tongue around yours soothing after fitting your mouth around Edan. After a while, she pulls away with a smile.");
	else if ((pc.biggestTitSize() >= 4) && (pc.biggestTitSize() < 12)) output("cup your [pc.breasts], sliding her hands up your tits and letting them jiggle as they fall before gently seizing your [pc.nipples] and lightly pulling until you have no choice but to loudly moan, even as tired as you are. She leans down to give you a gentle kiss on the mouth, slipping you some tongue to get a taste for what you haven’t swallowed. After several moments of passionate kissing, she pulls away with a smile.");
	else
	{
		output("sink her hands into the flesh of your [pc.breasts], gently massaging you as she leans down and seals your quietly moaning mouth shut with a soft kiss, her hands slowly seeking out your [pc.nipples] to tease you. She alternates between gentle rubbing and fierce pinching as she passionately intertwines her tongue with your own, pulling your nipples until you cry out into her mouth and she pulls away with a smile.");
		output("\n\n<i>“Sorry babe, guess I got a bit carried away. Your performance was just so inspiring, and I can’t help but play with such beautiful tits.”</i>");
	}
	output("\n\nYou give her a peck on the cheek before looking up at Edan, your breasts sweaty and heaving as you pant, your [pc.nipples] stiffly erect and your face wet with a mixture of [pc.race] saliva, ausar saliva, and Edan’s cum. He looks down with a barely restrained grin.");
	output("\n\n<i>“Fucking hell, Steele. I’d keep you down there all day if the management wouldn’t throw a fit. I’m tempted to do it anyway.”</i>");
	output("\n\nOne of the ausar girls speaks up.");
	output("\n\n<i>“I bet she’d love it. I wish you coulda seen the faces she was making when you were filling her up.”</i>");
	output("\n\nYou redden slightly but put up a somewhat stoic front, if looking like the codex entry for <i>“Post-coital disarray”</i> can be considered stoicism. Edan looks thoughtfully at you before the leader of the pack wraps her arms around the other two and drags them to their feet, a little sloppy but not so much in the literal sense, unlike yourself. How do they do it?!");
	output("\n\n<i>“We’re gonna go get some drinks and keep partying. I </i>really<i> hope we see you two again... especially you, cutie.”</i>");
	output("\n\nShe gives you a wink and the three of them head off to the bar, hips swaying hypnotically and drawing the attention of more than a few spacers. You turn to Edan and he looks down at your rosy face, inspecting your");
	if (pc.thickness < 5) output(" lithe");
	output(" form as his gaze drops further. You subtly push your [pc.breasts] out, your top half still bared to the world, and ask him if he sees anything he likes.");
	output("\n\n<i>“Ha! Yeah, just getting reacquainted with the sights. There’s just something else about you, Steele. I don’t know what it is.");
	if (isLeithan) output(" Maybe it’s the same-race thing but... I dunno. As much as I love breaking in a mare, you’re not the same. I have always preferred leithan girls, though.");
	else output(" You’re not even leithan, and I’ve always preferred them to other girls.");
	output(" Ah, whatever. You’re fun, and that’s what counts. I just had an idea, too - we should come back here next time. See ya round, Steele.”</i>");
	output("\n\nYou see him walk over to the bar and begin talking to the owner before you look down");
	if (!pc.isNude()) output(" and realize you’re still pretty much naked. As you hastily put your [pc.gear] back on, you consider what Edan said. You didn’t tell him, but you’ve found yourself thinking the same about him. There’s something about the way he treats you that’s... attractive. He’s a nice guy, too. Probably best to go with the flow and not think too much about the future, though. Your stuff where it should be, you stand to leave. Looks like Edan has already gone, too.");
	else output("at your natural naked form and get up, considering what Edan said. You didn’t tell him, but you’ve found yourself thinking the same about him. There’s something about the way he treats you that’s... attractive. He’s a nice guy, too. Probably best to go with the flow and not think too much about the future, though. Your stuff where it should be, you stand to leave. Looks like Edan has already gone, too.");
	
	pc.exhibitionism(5);
	processTime(45);
	pc.orgasm();
	pc.loadInMouth(chars["EDAN"]);
	
	addButton(0, "Next", mainGameMenu);
}
