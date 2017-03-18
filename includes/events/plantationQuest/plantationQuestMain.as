/*
Plantation Quest
by Nonesuch, the such of none. Whatever that means. I’m just stalling for time.

Ideas/Plans

Thare Plantation is being menaced by an aggressive tribe of zil. An eco-terrorist has escaped the place and is directing them against Darnock, hoping to drive him off and stop Mhen’ga being turned into an agri-world. Darnock offers substantial reward to neutralise them and bring the escapee back.

PC has to get past a mini-dungeon. Aimed at Lvl 6-7.

PC can side with zil and destroy Thare. This stops the planet being agri-formed but also stops the zil from being able to join the galactic community.

PC can bring the zil to heel and return the escapee, which allows Darnock to see his plan through. PC gets large reward and some sort of repeat reward from the plantation (health/energy giving fruit?)

Third option requires the PC to make smart choices: talk to Able beforehand, not steal the tribe’s treasures, etc. Persuade tribe to trade honey with Esbeth and get settlers to block Snugglé taking over in the fullness of time, possibly with Steele Tech help.

Bosses: Kane, Snake Pit, R.K. Lah

Commissioner wants two specific scenes with Quinn: If PC has overclocked libido (in every hole fuck?) and Quinn on top using pheromones.

Choices to unlock <i>“good”</i> option: PC must leave amber alone, PC must challenge Lah to a fight, PC has to offer protection, sex and names. PC can get all of these hints by talking to Able before leaving.

Zil base is high up cliff above waterfall. It’s difficult to reach on foot. (They attack en masse if the PC tries to be a smart-arse and uses wings/jetpack.) After PC has completed quest in way which doesn’t drive them off, they can access the village without doing the gauntlet.

===================
\\ FLAGS: 		 \\
===================
flags["PLANTATION_QUEST"] = 0; 			- QUEST STARTED

flags["PQUEST_WHERE_CHAT"] = 1; 		- TALKED WITH DARNOCK ABOUT WHERE LAH IS.
flags["PQUEST_LAH_CHAT"] = 1;			- TALKED WITH DARNOCK ABOUT WHO LAH IS.
flags["PQUEST_ABLE_TALK_DISABLE"] = 1;	- ABLES EARLY PQUEST TALK IS DISABLED BECAUSE WALKED AWAY.
flags["PQUEST_ABLE_TALK_DISABLE"] = 2;  - ABLE EARLY PQUEST DISCUSSIONS LOCKED BECAUSE PC TALKED 2HIM.
flags["PQUEST_ABLE_CUSTOMS_TALK"] = 1;  - ABLE TOLD YOU ABOUT CUSTOMS
flags["PQUEST_ABLE_VALUE_TALK"] = 1;  - ABLE TOLD YOU ABOUT WHAT THEY VALUE
*/

public function plantationQuestComplete():Boolean
{
	return false;
}
public function zilCampOpened():Boolean
{
	return false;
}
public function showKane():void
{
	showName("\nKANE");
	showBust("KANE");
}


public function lichensAndIronwoodsAbleDisableLelPlantationQuestWrapper():Boolean
{
	if(flags["PLANTATION_QUEST"] == 0 && flags["PQUEST_ABLE_TALK_DISABLE"] == undefined) flags["PQUEST_ABLE_TALK_DISABLE"] = 1;
	return jungleEncounterChances();
}


//Subject: Salutations!
//From: Shep Darnock
public function shepDarnocksPlantationQuestInviteText():String 
{
	var textBuff:String = "";
	textBuff += "<i>This e-mail is headed by the Snugglé corporate logo. On one side of it, a number of links to exciting employment and investment opportunities within the Snugglé family is displayed; on the other, recipe suggestions based upon meals you have recently purchased and mentioned you liked in public places.</i>\n\nDear " + pc.mf("Master", "Miss") + " Steele,\n\nI do hope this message finds you in the best of health. I imagine such have been the adventures and escapades you have experienced on the frontier since I saw you last, you barely remember your old friend down here on Mhen’ga. The joys of being young and carefree!\n\nIf you are ever in the neighbourhood of Thare again, however, please do drop by. There has been a spot of bother locally, and I require the services of a bold adventuring type whose discretion can be relied upon. If that sounds like somebody you know(!), hasten them in my direction. I believe that the situation can be of mutual benefit. Out of adversity, and all that!\n\nYours sincerely,\n\tProf. Shepward Darnock\n\t(Warden, Chaplain - Thare Plantation)";
	return textBuff;
}

//Revised PLANTATION APPROACH description
public function plantationApproachBonusRedux():Boolean
{
	author("Nonesuch");
	//Show if e-mail read and quest not completed
	if(MailManager.isEntryViewed("plantation_quest_start") && !plantationQuestComplete())
	{
		output("You notice that a few of the defense turrets you pass as you enter the prim, open greenness of the plantation fields are charred around the chassis. A small swarm of hovering drones are assessing the damage with flickering holo-beams.");
		output("\n\n");
		if(hours >= 6 && hours < 19) output("There’s activity, here and there in the sea of clean green, but it’s too far away to make out.");
		else output("The fields look deserted, which is probably not surprising given the time of day.");
		output(" Rising above the fields to the south-east though a big, white building can be seen, approached by the same wide track you are on. Behind you, to the west, the alien wilderness encroaches, a complete contrast to this pristine, slightly unnerving farmland.");
		flags["NAV_DISABLED"] = undefined;
		return jungleEncounterChances();
	}
	//Normal desc.
	else
	{
		var msg:String = "";	
		if(hours >= 6 && hours < 19) msg += "The bright sun of Ara Ara";
		else msg += "The ghostly light of Mhen’ga’s moons";
		msg += " becomes less and less filtered as you follow the sawdust trail eastwards, the jungle thinning out until it stops, suddenly, at the edge of a huge field. Row upon row of carefully tended and manicured plants of many different type and size meet your eye, each of them cordoned off from one another by white fencing and wire. Close to the edge of the acres of cleared forest there are defense turrets, similar to the ones guarding Esbeth. The ones nearest haven’t attempted to warn or fire at you.";
		msg += "\n\n";
		if(hours >= 6 && hours < 19) msg += "There’s activity, here and there in the sea of clean green, but it’s too far away to make out.";
		else msg +="The fields look deserted, which is probably not surprising given the time of day.";
		msg += " Rising above the fields to the south-east though a big, white building can be seen, approached by the same wide track you are on. Behind you, to the west, the alien wilderness encroaches, a complete contrast to this pristine, slightly unnerving farmland.";
		msg += "";
		
		output(msg);
		flags["NAV_DISABLED"] = undefined;
		return jungleEncounterChances();
	}
}

//Revised THARE PLANTATION FIELDS description
public function tharePlantationFieldsBonusRedux():Boolean
{
	//Show if e-mail read and quest not completed
	if(MailManager.isEntryViewed("plantation_quest_start") && !plantationQuestComplete())
	{
		output("Fresh air, blessed next to the mugginess of the jungle, washes over your [pc.skin] in the open expanse of the plantation’s fields. ");
		//Time is 08:00-18:30
		if(hours >= 8 && hours < 18 || (hours == 18 && minutes <= 30)) output("Drones hover over the pristine green fields like lazy flies in summer, presumably watching over the workers, dotted here and there; sweat-soaked backs bent to the lash of the ceaseless sun. Was the insistent hum of these robots here before? You don’t think so. This extra security detail is a new development.");
		else output("The fields are deserted; the only sounds are the night insects and the distant, slightly terrifying strains of the Mhen’gan jungle.");
		output("\n\nTo the east are some low lying buildings which presumably function as dormitories. To the south, behind a tall wall, gate and manicured lawn, lies a multi-tiered white manor house. Its neo-classical design and spotless frontage, nestled within this tropical paradise, speaks only of immense opulence. On the wall next to the gate is a speaker and a brass sign which reads <i>“THARE PLANTATION. A Snugglé enterprise.”</i>");
		//[Enter]
		if(!plantationQuestComplete()) 
		{
			addDisabledButton(0,"Enter","Enter","You should hunt the fugitive down before speaking to Darnock again.");
			//Add to bottom of THARE PLANTATION FIELDS if PC has not yet talked to Able:
			if(flags["PQUEST_ABLE_TALK_DISABLE"] == undefined && flags["PLANTATION_QUEST"] == 0)
			{
				output("\n\nAble the zil-servant is hanging around by the side of the gate, wings twitching fitfully. He casts a glance at you before looking away with a strong blush.");
				addButton(1,"Able",ablePlantationQuestPostMeetingTalk);
			}
			else addButton(0,"Enter",snugglePlantationQuestStartMeetAble);
		}
		flags["NAV_DISABLED"] = NAV_SOUTH_DISABLE;
		return false;
	}
	else
	{
		author("Nonesuch");
	
		var msg:String = "";
		var fullTime:int = ((hours * 60) + minutes);
		
		msg += "Fresh air, blessed next to the mugginess of the jungle, washes over your [pc.skin] in the open expanse of the plantation’s fields.";
		// Time is 08:00-18:30:
		if(fullTime >= (8 * 60) && fullTime <= ((18 * 60) + 30)) msg += " There are humanoid workers out there amongst the regimented crops, clad in khaki coveralls, as well as agri-bots that look like walking climbing frames, but they all ignore you.";
		// Time is 18:31-07:59:
		else msg += " The fields are deserted; the only sounds are the night insects and the distant, slightly terrifying strains of the Mhen’gan jungle.";
		msg += "\n\n";
		msg += "To the east are some low lying buildings which presumably function as dormitories. To the south, behind a tall wall, gate and manicured lawn, lies a multi-tiered white manor house. Its neo-classical design and spotless frontage, nestled within this tropical paradise, speaks only of immense opulence. On the wall next to the gate is a speaker and a brass sign which reads “THARE PLANTATION. A Snugglé enterprise”.";
		
		if(!CodexManager.entryUnlocked("Snugglé"))
		{
			msg += "\n\nYour Codex beeps with relevant information on the corporation.";
			CodexManager.unlockEntry("Snugglé");
		}
		
		output(msg);
		
		if(flags["THARE_MANOR_ENTERED"] == undefined) addButton(0, "Speaker", tharePlantationManorApproach, "speaker");
		else
		{
			if(pc.hasStatusEffect("Thare Manor Visit") > 0) addDisabledButton(0, "Enter", "Enter", "You have already met Professor Darnock for a meal already. Perhaps you can revisit him later?");
			else addButton(0, "Enter", tharePlantationManorApproach, "enter");
		}
		
		flags["NAV_DISABLED"] = NAV_SOUTH_DISABLE;
		
		return false;
	}
}

public function snugglePlantationQuestStartMeetAble():void
{
	clearOutput();
	showAble();
	output("Able promptly buzzes out of the sky a short while after you press the button. He seems more tense and furtive than usual; his black eyes flicking up to yours and then away, his long tongue nipping in and out of his mouth, as if he were tasting something on the air.");
	output("\n\n<i>“Master would like to see you,”</i> he says. The gate silently opens, gravel crunches as you are led up the immaculate path. <i>“He says it is important.”</i> The petite zil pauses at the steps, hands balling his Snugglé shift. <i>“Could you - once you have talked to Master, could we talk? I- I mean, you don’t have to. Just- just if you want.”</i> Eyes turned to the ground, he gestures at the open door of the mansion.");
	processTime(2);
	clearMenu();
	//Move PC to Mansion square
	currentLocation = "THARE MANOR";
	addButton(0,"Next",snugglePlantationQuestStartMeetAble2);
}

public function snugglePlantationQuestStartMeetAble2():void
{
	clearOutput();
	showDarnock();
	output("Darnock is gazing up at a large hologram screen, projected onto the patio doors, when you come in. He is actually standing in a small enclave of such holo-screens, all of which are displaying tightly packed information. He turns at your approach, a pensive expression shifting into a warm smile when he sees who it is.");
	output("\n\n<i>“" + pc.mf("Master","Miss") + " Steele,”</i> he says, clapping you on the shoulder. <i>“I knew you would come. The slightest hint of adventure, or a friend in need - that’s all it took for Victor Steele to appear, tail up and ready for action! Like father, like " + pc.mf("son","daughter") + ".”</i>");
	output("\n\n<i>“What’s this about?”</i> you say. Darnock raises his hand.");
	output("\n\n<i>“Not another word, Steele! Sit yourself down. Act as if you just spent the best part of a day ploughing through space traffic and then a hostile jungle, just to take audience with a foolish old man.”</i>");
	output("\n\nYou do so. A glass of water and a small meal is provided to you by a silent, unsmiling Snugglé prisoner employee. Munching, you watch as the professor goes back to silently gazing at the screens thrown across the glass windows and plush furnishings of the veranda. From what you can gather from a cursory glance, they are analytics of the plantation’s probationers.");
	output("\n\n<i>“Problem with the prisoners?”</i> you venture.");
	output("\n\n<i>“Something like that,”</i> the white-haired human sighs. He sounds reluctant, as if you were talking to you about something taboo. <i>“A laborer jumped the fence a few weeks ago. It would not ordinarily be a problem - the jungle usually discharges them either to the plantation or Esbeth, quivering and begging to be taken back. Unfortunately, in this particular laborer’s case, the jungle itself </i>was<i> the goal.”</i>");
	output("\n\nDarnock flicks his hand at the screen, and a prisoner’s file is projected onto it. A lean, male ausar gazes down at you; solemn, hungry yellow eyes beneath a shock of grey hair. MD6 - 605631 REMI-KELLEN LAH, reads the plate he’s holding up.");
	output("\n\n<i>“I must make clear,”</i> Darnock continues, <i>“that it was a bureaucratic snafu that had Remi sent here in the first place. Send me your thieves, I told Snugglé! Send me your petty criminals, your unlicensed prostitutes, your drug addicts - I will change them. I will HEAL them. Just don’t send me any eco-warriors. Don’t send me any activist ausar serving five years for a fire-bombing campaign against Xenogen. Because doing that might... it might cause problems.”</i>");
	output("\n\nThe professor signals with two terse fingers and the prisoner file slides away, replaced by a geographical map of the immediate area. The perimeter of the plantation is shown, and a number of angry red circles intersect it.");
	output("\n\n<i>“Since Lah escaped, we have been attacked six times by a tribe of zil. They use tactics which are completely out of keeping for their kind, exploiting programming blind spots to get past the turrets and destroy our crops. They are not out for sex; it is pure, targeted aggression.”</i> He gestures. A fuzzy video recording appears on the main screen, shot in night vision. A rangy figure is gesticulating wildly at insect-winged others, who are quickly dragging large pods into what looks like sugar cane.");
	output("\n\n<i>“But what price this, you may ask, dear Steele,”</i> mutters Darnock, switching the recording off. The screen fades away entirely, and is replaced by the vista of the plantation fields beyond, into which the old human stares. <i>“A wannabe revolutionary escapes, hooks up with some delinquent zil nearby and attempts to harass my quiet, noble quest here. What is this, really, to a company with Snugglé’s resources? But there is a lot at stake here, Steele. And I believe Lah knows it.”</i>");
	output("\n\nA finger is flicked; a vid-window silently opens in front of you. Details of an impending visit from a Snugglé evaluation team appear in your lap.");
	output("\n\n<i>“Mhen’ga stands at a crossroads, Steele,”</i> says Darnock, turning away from the prospect to look you in the eye with a quiet smile. <i>“Lah wishes to force it down the path of darkness. By harnessing the savagery of the natives, he aims to demonstrate to the evaluators that this world is too dangerous, too wild to be agri-formed and brought into the light of the wider galaxy. I have no doubt he believes his intentions noble. But make no mistake - they are to the detriment of every living being on this planet. If the evaluators find this plantation untenable because the zil are too war-like, they will almost certainly be denied sapient rights via the U.G.C. Mhen’ga may even be deemed too dangerous to settle - Esbeth will be abandoned. Snugglé shall be denied a fantastic world to study and foster. The pirates and slavers lurking in the wings handed a vast, free buffet.”</i>");
	output("\n\nDarnock gestures, and this time a screen doesn’t pop up. Your attention is instead directed out the patio towards the green wall of the jungle, looming beyond the serried plantation fields.");
	output("\n\n<i>“Lah is out there somewhere, Steele. Find him. Bring him to justice. Your reward shall be substantial - both fiscally, and in terms of the great good you shall render this world.”</i>");
	processTime(18);
	//[Where?] [Lah] [Continue]
	pquestIntroChatMenu();
}

public function pquestIntroChatMenu():void
{
	clearMenu();
	if(flags["PQUEST_WHERE_CHAT"] == undefined) addButton(0,"Where?",askWhereLahIs,undefined,"Where?","Ask for more details concerning the mission.");
	else addDisabledButton(0,"Where?","Where?","You just finished that discussion.");
	if(flags["PQUEST_LAH_CHAT"] == undefined) addButton(1,"Lah",askAboootLah,undefined,"Lah","Ask for more information concerning the target.");
	else addDisabledButton(1,"Lah","Lah","You just finished that discussion.");
	addButton(2,"Continue",continuePlantationBriefing);
}

//Where?
//Tooltip: Ask for more details concerning the mission.
public function askWhereLahIs():void
{
	clearOutput();
	showDarnock();
	flags["PQUEST_WHERE_CHAT"] = 1;
	output("<i>“Do you have any idea where Lah is holed up?”</i> you ask. Darnock silently brings up the map of");
	output("\n\nthe nearby jungle again. A large area to the north is circled.");
	output("\n\n<i>“The zil have attempted to disguise their paths of approach, but satellite surveillance shows that they have almost certainly made camp on the highlands to the north. There seems to be a zil settlement there, at the head of a large waterfall. You will find our ausar friend there, I am sure of it.”</i>");
	output("\n\n<i>“If you know where they are...”</i> you say slowly.");
	output("\n\n<i>“...why haven’t I directed an orbital laser strike on their position? Hired a team of SagiTom mercs to go up there and, ah, take care of business?”</i> The professor smiles at you humorlessly. <i>“Firstly: I want Remi alive. He is not some psychopathic pirate with his empathy burnt out, beyond redemption. His and the zils’ eternal souls can be saved. They WILL be saved. Secondly: He is playing a clever game, Steele. Such brute tactics would be noticed, recorded and would </i>prove<i> that Mhen’ga is too dangerous to be civilised. I shall not make a martyr of him. That is why I turn to a single trustworthy hunter, well experienced with the Mhen’gan jungle, to bring him back.”</i>");
	processTime(3);
	pquestIntroChatMenu();
}

//Lah
//Tooltip: Ask for more information concerning the target.
public function askAboootLah():void
{
	clearOutput();
	showDarnock();
	flags["PQUEST_LAH_CHAT"] = 1;
	output("<i>“How dangerous would you say this R.K. Lah is?”</i> you ask. Darnock brings up the lean ausar’s profile on the main screen again, clicks into a subset menu. You are treated to various shaky recordings of Lah participating in a protest march, shouting an address to an angry crowd of eco-protesters, his grey tail disappearing hurriedly behind a building as a line of riot police advance over glass and rubble...");
	output("\n\n<i>“He isn’t a murderer or some out-of-control mercenary,”</i> the old human replies at length, staring up into Lah’s round, yellow eyes. <i>“On the other hand - his psych report and history suggest he is unstable. He certainly does have a penchant for arson, as my crops have learnt to their intense displeasure. His last fire bombing attack on a Xenogen lab seriously injured someone - not the intention, but collateral damage is an unfortunate necessity when you are fighting the Dog, is it not?");
	output("\n\n<i>“The most worrying thing is the hold he’s developed over this tribe of zil. I cannot imagine what he’s told them to get them to obey him, and with such fearlessness and precision. I don’t think there will be any avoiding fighting them, driving them to the four corners so he stands alone, Steele - it seems to be the only language the bee people understand, alas.”</i>");
	processTime(3);
	pquestIntroChatMenu();
}

//Continue
public function continuePlantationBriefing():void
{
	clearOutput();
	showDarnock();
	output("Darnock clasps your hand tightly at the door, clapping your shoulder.");
	output("\n\n<i>“The very best of luck hunting the bounder down, dear Steele. Much rides on your success. The One will watch over you, of that I am sure!”</i>");
	//QUEST START!
	flags["PLANTATION_QUEST"] = 0;
	clearMenu();
	//Move PC to Thare fields. Forward 1 hour. Grey out [Enter] button
	//Fen note: TOO MUCH TIME. How about 5 minutes.
	processTime(5);
	addButton(0,"Next",move,"THARE FIELDS");
}

//Add to bottom of THARE PLANTATION FIELDS if PC has not yet talked to Able: Able the zil-servant is hanging around by the side of the gate, wings twitching fitfully. He casts a glance at you before looking away with a strong blush.
//[Able]
//Because he assumes you don’t want his dumb sissy advice, this option goes away if PC steps into IRONWOODS AND LICHENS square without activating it.

public function ablePlantationQuestPostMeetingTalk():void
{
	clearOutput();
	showAble();
	if(pc.isBimbo()) output("<i>“Would you like a suck, sweet stuff?”</i> you ask the slim zil boy kindly. <i>“It’d calm you down some, you know.”</i>");
	else if(pc.isNice() || pc.isAss()) output("<i>“Deep breaths,”</i> you say, moving over to the slim zil boy. <i>“Now talk.”</i>");
	else output("<i>“You’re going to shiver right out of that carapace, aren’t you?”</i> you " + pc.mf("chuckle","giggle") + ". <i>“C’mon - get it off your chest.”</i>");

	output("\n\n<i>“I- I know what Master Darnock asked you to do,”</i> stutters Able. <i>“Go and find the ausar who ran away, right? I... I know where he went.”</i>");
	//PC used [Where?] option:
	if(flags["PQUEST_WHERE_CHAT"] != undefined) 
	{
		output("\n\n<i>“To the north of here, in a zil village above a waterfall,”</i> you say. <i>“Right?”</i>");
		output("\n\n<i>“H-how...? Oh,”</i> says Able, wilting. <i>“The eye machines in the sky, right? I keep forgetting about them.”</i>");
	}
	else
	{
		output("\n\n<i>“Go on,”</i> you say.");
		output("\n\n<i>“There’s a great waterfall to the north of here,”</i> Able answers in a rush. <i>“There is a camp - a, that is to say, a zil camp - at the top of it. The ausar is sheltering there, with them.”</i>");
	}
	output("\n\nHe toes the gravel with a shiny boot.");
	output("\n\n<i>“There... there’s something I wanted to ask of you though, " + pc.mf("sir","mistress") + ". The zil that are harboring the ausar - they are my clan. They are very angry. Before Master came, this was their farming land, and they believe themselves wronged. That is how the ausar is turning them against the plantation. But-”</i> the zil sucks in a lungful of air. <i>“But they are not unreasonable, or, or stupid. They are afraid - afraid of all the changes that have happened since the star-people arrived, all seemingly against them. I know our ways seem strange to you, but our chieftain is just - if you were to approach her according to our customs, she would listen to you. You could resolve this peacefully, I am sure of it.”</i>");
	processTime(8);
	//[Customs] [Leave]
	clearMenu();
	addButton(0,"Customs",askZilbooooootyAboutCustoms);
	addButton(1,"Leave",leaveAbleAfterTalkingPreQuestWhyNot);
}

//Customs
public function askZilbooooootyAboutCustoms():void
{
	clearOutput();
	showAble();
	output("<i>“So what would I have to do to get them to listen?”</i> you ask.");
	output("\n\n<i>“Challenge the ausar to a fair fight,”</i> Able replies immediately. <i>“He holds the chieftain’s ear. You have to earn the right to replace him, if only for a while. But...”</i> he pauses again. <i>“Even if you manage that, you’ll still have to convince the chieftain. It won’t be easy - they have been listening to the ausar for some time, and have been afraid of the star-people for longer. You will have to - convince them with things zil value, to get them to agree with whatever bargain you want to strike.”</i>");
	flags["PQUEST_ABLE_CUSTOMS_TALK"] = 1;
	processTime(3);
	//[Value?] [Leave]
	clearMenu();
	addButton(0,"Value?",talkToAbleAboutValue);
	addButton(1,"Leave",leaveAbleAfterTalkingPreQuestWhyNot);
}

//Value?
public function talkToAbleAboutValue():void
{
	clearOutput();
	showAble();
	output("<i>“And what do the zil value?”</i> you persist.");
	output("\n\n<i>“ ...sex?”</i> mumbles Able after a pause, shrugging. <i>“Um. We don’t like it when people take our belongings without winning them fairly. That’s the whole reason why the clan are attacking the plantation. We like being able to roam the forests free of danger. And... there’s something else the ausar is giving them. I don’t know what, but they are really committed to protecting him, it’s as if- as if he were an endless supply of food, or something. If you can work out what it is he’s offering them...”</i>");
	processTime(1);
	flags["PQUEST_ABLE_VALUE_TALK"] = 1;
	//[Customs] [Leave]
	addButton(0,"Customs",askZilbooooootyAboutCustoms);
	addButton(1,"Leave",leaveAbleAfterTalkingPreQuestWhyNot);
}

public function leaveAbleAfterTalkingPreQuestWhyNot():void
{
	clearOutput();
	showAble();
	output("<i>“I’ll do my best, ");
	if(pc.isBimbo()) output("candy-cane");
	else if(pc.isBro()) output("candy-ass");
	else output("Able");
	output(",”</i> you say. <i>“But no promises.”</i>");

	output("\n\n<i>“I understand, " + pc.mf("sir","mistress") + ". Thank you for listening,”</i> he replies. <i>“I just- I want to think there might be a better way.”</i>");
	output("\n\nHe opens his wings and thrums off back to the manor.");
	processTime(1);

	//remove Able talkies sloot.
	flags["PQUEST_ABLE_TALK_DISABLE"] = 2;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Part Two: The Waterfall Gauntlet
/*Overview/Mechanics

	* Once PC has defeated Kane, PC can rest in the waterfall pool square without being molested.
	* Kane is a lust-orientated stunlocker armed with a stone on a rope, because I’m subtle
	* Each waterfall square carries a 30% chance of being occupied by a zil hornet/hoverfly.
	* Because the PC has to hold onto a slippery cliff whilst fighting, they are at a -25% ACC penalty, and cannot escape. They can stop holding on to remove this - but this carries a chance of being knocked down the cliff! If PC knocked down, take severe health damage and moved down waterfall two squares.
	* Moving up a square on waterfall saps 6 energy. PC cannot fap or rest whilst on waterfall. PC can rest at top before taking on Quinn/Lah.
	* PC must pass v. high Reflex test to avoid the snake pit. If fail, they are forcibly introduced to a naleen mating ball in the caves beneath fall. No bad end if PC loses, but they will crawl out at the bottom.
	* Zil shrine with treasure near the top. PC needs to leave this alone in order to be able to bargain with Quinn. (Or they can take it and sell it for a fat wad lol)
	* Once PC has reached Chieftain’s Circle, zil hornets/hoverflies stop appearing in cliff squares.
*/

public function babblingBrookBonusUnlockShit():Boolean
{
	if(flags["PLANTATION_QUEST"] == undefined) 
	{
		output("\n\n<b>There's no reason to go traipsing off to the north... for now</b>. Maybe something will come up later?");
		flags["NAV_DISABLED"] = NAV_NORTH_DISABLE;
	}
	else 
	{
		output("\n\n<b>You could force your way northwards</b>, up the banks of the stream, if you wanted to. You think you can see a break in the ironwoods much further above in that direction.");
		flags["NAV_DISABLED"] = undefined;
	}
	return jungleEncounterChances();
}

public function waterfallPoolBonusSchtuff():Boolean
{
	if(flags["PQUEST_WATERFALLED"] == undefined)
	{
		flags["PQUEST_WATERFALLED"] = 1;
		output("Heart pounding and sweat on your brow despite the cool spray of the stream, you clamber up the steep, dank banks, any worry you have about damaging the plant-life swiftly superseded by your need for good handholds upon the slippery rocks. At least there’s no chance of losing your way - the roar of water gets closer and closer. You blink in sudden sunlight as you emerge in a break of tree cover upon a mossy plateau. Finally, you have a clear view of what lies ahead.");
		output("\n\nAbove you a big waterfall comes thundering down from many feet above into a deep pool. The vast, ceaseless power of it throws up writhing veils of white vapour that breathe blessings on your hot [pc.skinFurScales]. It is shouldered by sheer, red rock cliffs that climb out of the jungle both to the east and west. The more you take it in the more daunting the prospect is - without going many miles out of your way, the only method of getting at the highlands above will be to clamber up the layered, craggy rock face alongside the waterfall.");
		output("\n\n<i>“So, you finally made it!”</i> says a harsh, buzzing voice, from above and behind you. You whirl around. A rangy, carapace-clad figure is lounging in a nearby tree. He is perhaps taller and better built than your average zil, his gleaming black limbs rounded with nimble, wiry muscle, a thin, meandering scar across one eye. In one hand a large, smooth rock attached to a fibrous rope dangles.");
		output("\n\n<i>“I hope your intention was not to approach our village stealthily,”</i> he goes on, carelessly twirling his rope club as he eyes you. <i>“We heard you banging and crashing through the trees from miles away. We smelt you not long after.”</i> He breathes in, long and deep. <i>“My brother’s scent is upon you. Not surprising; he, like you, is a pawn of the land-stealers. Yes... I smell the weakness, the submissiveness, the excitement at being bent over and put in his rightful place. Or is that just you? Perhaps this is the natural scent of pawns.”</i> Anger and lust cloud over the insouciance on his long, brooding face. <i>“I shall happily see to such desires, land-stealer puppet!”</i>");
		output("\n\nHe is on the ground in a flickering flow of diaphanous wings and compact tar muscle, spinning his weapon in a vicious arc as he advances on you.");
		//start fighto!
		CombatManager.newGroundCombat();
		CombatManager.setFriendlyCharacters(pc);
		CombatManager.setHostileCharacters(new Kane());
		CombatManager.victoryScene(kaneDefeated);
		CombatManager.lossScene(loseToKane);
		CombatManager.displayLocation("KANE");

		clearMenu();
		addButton(0, "Next", CombatManager.beginCombat);
		return true;
	}
	//Repeat if Kane not defeated
	else if(flags["KANE_DEFEATED"] == undefined)
	{
		output("You are on the open, mossy plateau at the bottom of the waterfall. It comes thundering down from many feet above into a deep pool. The vast, ceaseless power of it throws up writhing veils of white vapour that breathe blessings on your hot [pc.skinFurScales]. It is shouldered by sheer, red rock cliffs that climb out of the jungle both to the east and west. The more you take it in the more daunting the prospect is - without going many miles out of your way, the only method of getting at the highlands above that you can immediately see is to clamber up the layered, multitudinous rock face beside the waterfall.");
		output("\n\n<i>“You return!”</i> says a harsh, buzzing voice from behind you. Kane is in his tree, leg dangling, watching you with an insouciant sneer.");
		output("\n\n<i>“Was the first set of lumps not enough of a lesson?”</i> the scarred zil asks, swinging his club. <i>“Did I knock you completely silly, and now you cannot find your way back to the feet of your land-stealing masters? Or perhaps you enjoy being put in your place.”</i> His voice lowers to a lustful drone. <i>“Perhaps you cannot get enough of it. Certainly, that is what your scent is telling me. Very well - but do not expect my foreplay to be any more lenient, pawn slut.”</i>");
		output("\n\nHe is on the ground in a flickering flow of diaphanous wings and compact tar muscle, spinning his weapon in a vicious arc as he advances on you.");
		//start fighto!
		CombatManager.newGroundCombat();
		CombatManager.setFriendlyCharacters(pc);
		CombatManager.setHostileCharacters(new Kane());
		CombatManager.victoryScene(kaneDefeated);
		CombatManager.lossScene(loseToKane);
		CombatManager.displayLocation("KANE");

		clearMenu();
		addButton(0, "Next", CombatManager.beginCombat);
		return true;
	}
	//Repeat if zil camp not opened
	else if(!zilCampOpened())
	{
		output("You are on the open, mossy plateau at the bottom of the waterfall. It comes thundering down from many feet above into a deep pool. The vast, ceaseless power of it throws up writhing veils of white vapour that breathe blessings on your hot [pc.skinFurScales]. It is shouldered by sheer, red rock cliffs that climb out of the jungle both to the east and west. The more you take it in the more daunting the prospect is - without going many miles out of your way, the only method of getting at the highlands above that you can immediately see is to clamber up the layered, multitudinous rock face beside the waterfall.");
		output("\n\nBehind you, the pool empties out into a wide brook, which leads steeply downwards to the south.");
		if(pc.canFly() && flags["PQUEST_FLY_BLOCKED"] == undefined)
		{
			output(" You stare up towards where the cliff’s vanishing point meets the sky. I mean... what’s wrong with just flying up there...?");
			//[Fly]
			addButton(0,"Fly",pQuestGetFlySlammed);
		}
		else if(pc.canFly()) addDisabledButton(0,"Fly","Fly","You already tried that. The Zil have archers ready to shoot down anyone who tries to fly past the falls.");
	}
	//Repeat if zil camp opened
	else
	{
		output("You are on the open, mossy plateau at the bottom of the waterfall. It comes thundering down from many feet above into a deep pool. The vast, ceaseless power of it throws up writhing veils of white vapour that breathe blessings on your hot [pc.skinFurScales]. It is shouldered by sheer, red rock cliffs that climb out of the jungle both to the east and west. It is certainly a daunting prospect - but you can, of course, get some help up to the top with a shout.");
		output("\n\nBehind you, the pool empties out into a wide brook, which leads steeply downwards to the south.");
	}
	return false;
}

public function pQuestGetFlySlammed():void
{
	clearOutput();
	showName("\nFLYING!");
	output("You shoot up into the air. You rise above the jungle canopy, keeping your gaze fixed upon the waterfall... when, with a terrible whine, a whole squadron of male zil emerge from the cliff top and from the trees behind you, arrowing at you with wooden spears like a swarm of trappy hornets.");
	output("\n\n<i>“Land-stealer!”</i>");
	output("\n\n<i>“Far Shist!”</i>");
	output("\n\n<i>“Weakling cheat!”</i>");
	output("\n\nYou try and bat them away with your [pc.meleeWeapon]... and feel something swift and deadly flick past your jaw. You realize with a start that there are female zil arrayed across the cliff face, strings taut on their short bows, intently awaiting another shot at you.");
	output("\n\nThe message is extremely clear. You dive back towards the foot of the waterfall, trailing cheering zil as you go. They break off and whine back to the top of the cliff when you get back beneath the tree cover, and you manage to land safely. Looks like you’ll be climbing after all.");
	//Remove [Fly]
	processTime(10);
	pc.energy(-10);
	flags["PQUEST_FLY_BLOCKED"] = 1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

// Kane Fight!
//Notes

//Although not particularly tough, Kane has a riposte system; each time the PC uses a melee attack, next round he sets up to counter a melee attack, same respectively for ranged. This happens with appropriately tagged specials as well. The set-up and activation are in addition to his regular attack. PC thus must alternate, or use lust attacks.

//Suggested stats
//Level 6
//HP 95
//Armor 20
//Initial Lust 30
//Dodge 20%

/*
output("\n\n");
*/

//PC uses melee attack/special
public function kaneMeleeReaction():void
{
	output("\n\nKane buzzes in pain, the impact of your blow forcing his hand to the ground. His overcast face flicks up, his tar-like eyes focussing with fierce intent on your [pc.meleeWeapon]...");
}

//PC uses melee attack next round
//Plays instead of hit/damage calculation. PC does no damage, takes heavy kinetic HP damage plus stun. Bypasses shield. Keeps happening if PC continues spamming it
public function kaneMeleeInterrupt():void
{
	output("You swing your weapon - and the zil darts forward in a whining flash, seizing your outstretched wrist, pulling you forward and smashing his armor-plated elbow into your chin.  You can’t help but cry out in pain as you stagger away, clutching your jaw. Feels like the bastard dislocated it!");
	output("\n\n<i>“What the word-wolf says about you is true - slavery to your machines has made you star-people soft and predictable,”</i> calls the harsh, buzzing voice tauntingly. <i>“Against a true warrior, you have no answer!”</i>");


}

//PC uses ranged attack/special
public function kaneRangedReaction():void
{
	output("\n\nKane barks in shock and anger as your shot hits the target. Gusting back on his wings, he focuses his tar-like eyes with fierce intent on your [pc.rangedWeapon]...");
}

//PC uses ranged attack next round
public function kaneRangedInterrupt():void
{
	//Plays instead of hit/damage calculation. PC does no damage, takes heavy kinetic HP damage plus stun. Bypasses shield. Keeps happening if PC continues spamming it
	output("You raise your weapon - but before you can fire it the zil flings himself forward, taking advantage of your lack of guard to smash both of his fists into your face, practically horizontal as he hits you. You gasp in shock and pain as you stagger away, hands to your face. Your nose, your beautiful nose!");
	output("\n\n<i>“You rely on your metal blowpipes, and all you know is how to witlessly pull the trigger,”</i> calls the harsh, buzzing voice tauntingly. <i>“Once your victims know how to get past them, you are as nothing against true warriors. So says the word-wolf, and his words ring true!”</i>");
}

//PC wins
public function kaneDefeated():void
{
	showKane();
	flags["KANE_DEFEATED"] = 1;
	showName("VICTORY:\nKANE");
	output("Kane collapses in a yellow and black heap, beside the waterfall pool.");
	output("\n\n<i>“No...”</i> he groans, wings twitching fitfully, attempting to clamber to his hands and knees. <i>“I obeyed the words... I am strong... I must protect...”</i>");
	output("\n\nYou eye the lean, fit zil that you have subdued and consider your options.\n\n");
	//[Frot] [Missionary] [Let Him Go]
	clearMenu();
	if(pc.hasCock()) addButton(0,"Frot",frotWithKaneYaBugger,undefined,"Frot","What better use to put a glossy honey-soaked dick to, after all.");
	else addDisabledButton(0,"Frot","Frot","You need a penis for this.");
	if(pc.hasVagina()) addButton(1,"Missionary",missionaryPositionWithKane,undefined,"Missionary","I don’t wanna leave the jungle, oh no no no...");
	else addDisabledButton(1,"Missionary","Missionary","You need a vagina for this.");
	addButton(2,"Let Him Go",letKaneGo);
}

//Let Him Go
public function letKaneGo():void
{
	clearOutput();
	showKane();
	output("<i>“Go on,”</i> you say, jerking your head. <i>“This pawn is showing you mercy, because it’s stronger than you. Get.”</i>");
	output("\n\nKane stares at you, shame and resentment trembling upon his face. Slowly he gets to his feet, regains his breath and composure, and then buzzes into the air.");
	output("\n\n<i>“You can try and climb the waters to visit the word-wolf if you wish,”</i> is his parting shot. <i>“That is the true test of strength. It will show you none of your so-called mercy!”</i>");
	output("\n\n");
	CombatManager.genericVictory();
}


//Missionary
//Tooltip: I don’t wanna leave the jungle, oh no no no...
//Requires vagina
public function missionaryPositionWithKane():void
{
	clearOutput();
	showKane();
	var x:int = rand(pc.totalVaginas());
	output("So much energy and boyish vigour, wasted upon angrily batting into you like a wasp against a window. With the wonderful sugary pheromones singing in your veins, sinking roots of hot arousal into your [pc.groin], you know exactly how the zil’s aggression should really be channelled.");
	output("\n\nKane watches you from the ground, still scowling, as you ");
	if(!pc.isCrotchExposed()) output("slide out of your [pc.gear], calmly displaying");
	else output("calmly display");
	output(" your bare [pc.chest] to him before placing your [pc.butt] down on a tuffet of soft moss.");
	output("\n\n<i>“What are you doing?”</i>");
	if(!pc.isBimbo()) output("\n\n<i>“Collecting my rightful reward,”</i> you reply archly, splaying your [pc.thighs] and exposing [pc.eachVagina] to the warm, moist air. <i>“You’ve got way too much anger going on and I need a fuck. So get over here, and we’ll solve both issues.”</i>");
	else output("\n\n<i>“Fighting time is over, so now it’s bouncy time!”</i> you say brightly, splaying your [pc.thighs] and exposing [pc.eachVagina] to the warm, moist air. <i>“C’mon fly boy - you aren’t always buzzing around being angry, are you?”</i>");

	output("\n\nHis black eyes focused on your twat, the zil warrior attempts to form contemptuous words once, twice - then sighing in exasperated defeat, he rises and strides over to you, retracting his groin and chest plate as he comes. The smell of horn-honey intensifies as his stiff, six inch foreskinned prick springs into view, and you breath it in gladly, the heavy sweetness radiating arousal down to your crotch, your [pc.vagina " + x + "] moistening and spreading readily. You stroke him mockingly on the cheek when he takes you into his smooth, hard arms, his bare chest and muscular legs rubbing over your [pc.chest] and [pc.thighs].");
	output("\n\n<i>“Don’t... patronize me, land-stealer,”</i> he grunts through gritted teeth. You coo as he pushes his bulbous head beyond the labia of your [pc.vagina " + x + "], opening you up. <i>“I do this because... honor dictates it.”</i>");
	output("\n\n<i>“And you aren’t interested in sexing me at all, are you,”</i> you smirk at him. You gasp as he responds by fiercely thrusting home, swelling your wet walls outwards with most of his cock. ");
	if(pc.vaginas[x].looseness() < 4) output("He’s thicker as well as bigger than most zil, too - perfect.");
	else output("A modestly sized species like the zil can’t help but be a little lost in your gaping, well-used cunt - but the way he angled downwards and dug it in. <i>That</i> was nice.");
	output(" <i>“Ooh, I think I almost felt your honor there. Keep going, cute stuff - I want to learn aaaaall about it!”</i>");

	pc.cuntChange(x,10);

	output("\n\nYour teasing has the effect you’re looking for. Kane grips you tightly and pumps his athletic frame into you with all his anger and resentment, his harsh, growling breath washing over your face, driving pleasure into you with each returning clap of his hard thighs against your own. The bulging tip of his black bee dick and his thick foreskin drag over your walls, only intensifying the sensuous, honey-soaked delight of it.");

	output("\n\nYou gasp and crow and giggle your delight to it, your [pc.girlCum] ");
	if(pc.vaginas[x].wetness() < 3) output("dripping");
	else output("drooling");
	output(" freely down your [pc.legs], knowing your vocal enjoyment of it only intensifies how hard the zil sticks it to you. You reach around and clutch his tight bum as a shimmering orgasm blots out all thought, happy to lie back and let your boy toy do all the work, his nice shiny bludgeon of a cock rubbing and pushing into your [pc.vagina " + x + "] in a way that makes you cry out in delight");
	if(pc.canMilkSquirt()) output(", your engorged nipples jetting [pc.milk] into his scowling face as the ecstatic clenches reach up to your [pc.chest]");
	output(".");
	var y:int = -1;
	if(pc.totalVaginas() > 1) 
	{
		for(var i:int = 0; i < pc.totalVaginas(); i++)
		{
			if(i != x) y = i;
		}
		output("\n\n<i>“Good,”</i> you coo when you come down, cheeks aglow. You swivel your hips, allowing his firm erection to fall out of your [pc.vagina " + x + "] and position it at the mouth of [pc.vagina " + y + "]. <i>“Now - do it again.”</i>");
		output("\n\n<i>“Fuck you, you weird alien!”</i> snaps Kane - and then does exactly that, spearing his [pc.girlCumNoun]-smeared maleness into your other hole and going back to fiercely plumbing away, holding onto you like a drowning man to a lifesaver. He can’t help it; simultaneously furious with and enraptured by your sprawling sex, he is incapable of doing anything but hump away, pushing and stroking more and more sensuous delight into your [pc.vagina " + y + "]. When another orgasm lights up your senses, you make sure to tighten your [pc.hips] around his tight, jackhammering waist this time; you are rewarded by a harsh, buzzing groan and sweet, viscous warmth pulsating into your womb. You squeeze his compact, wiry from into your [pc.chest] and rut into him back, riding the gorgeous, sugary pulses, both of you setting aside your ulterior purposes to fuck each other silly.");
	}
	else 
	{
		output("\n\n<i>“Wouldn’t it have been nicer if we’d skipped all the roughhousing and got to this bit straight away?”</i> you ask coyly, fingering his antennae.");
		output("\n\n<i>“We are fighting for our land, you - slattern!”</i> he cries, outraged. His hips pump into your drooling hole of their own accord, shivers of delightful sensation reaching into your heat. <i>“We lived just fine until you - I can’t believe you’d - oh, fuck you! Fuck you! Fuck you!”</i> he enunciates it with a fierce thrust of his hips");
		if(pc.legCount > 1) output(", pulling your [pc.legs] up in his ropey arms so he can go at you even harder");
		output(".");
		output("\n\n<i>“Yes! That’s it! Fuck me! Oh, you’re so sweet when you’re all worked up!”</i> you laugh delightedly, clutching up big handfuls of moss. He can’t help it; simultaneously furious with and enraptured by your sex, he is incapable of doing anything but hump away, pushing and stroking more and more sensuous delight into your [pc.vagina " + x + "]. When another orgasm lights up your senses, you make sure to tighten your [pc.hips] around his tight, jackhammering waist this time; you are rewarded by a harsh, buzzing groan and sweet, viscous warmth pulsating into your womb. You squeeze his compact, wiry from into your [pc.chest] and rut into him back, riding the gorgeous, sugary pulses, both of you setting aside your ulterior purposes to fuck each other silly.  ");
	}
	output("\n\nYou rest for a moment, glued together by a gratuitous load of honey seed, the afterglow opening up your senses. You run your fingers through Kane’s brown mop half-mockingly, half-comfortingly, and that rouses him. He parts from you without a word, his dangling cock trailing golden cum from your snatch and staggers to his feet. After one or two false starts he manages to thrum his wings into action and rises into the air. You close your [pc.hips] and, leaning on your side, watch him go.");
	output("\n\n<i>“There’s no way you’re getting up the waters,”</i> is his parting shot. <i>“They are the true protector of the word-wolf!”</i>");
	processTime(20);
	if(pc.totalVaginas() > 1) pc.loadInCunt(enemy,y);
	else pc.loadInCunt(enemy,x);
	pc.orgasm();
	pc.orgasm();
	output("\n");
	CombatManager.genericVictory();
}

//Frot
//Tooltip: What better use to put a glossy honey-soaked dick to, after all.
public function frotWithKaneYaBugger():void
{
	clearOutput();
	showKane();
	output("<i>“Pants down, fly boy,”</i> you growl, the sugary pheromones singing in your veins, hot arousal rooting into your [pc.groin]. <i>“Let’s see the goods.”</i>");
	output("\n\nKneeling on his side, Kane sullenly does as you ask, retracting his chest and groin plate so that his stiff, six inch fore-skinned prick springs into the open air. The smell of horny honey intensifies and you breath it in gladly; the arousal inside you swells from nagging to uncontainable and you have your [pc.gear] off before you’ve even thought about it, [pc.eachCock] throbbing with need and pointing at the warrior zil accusingly, all of your attention on his gently oozing cock.");
	output("\n\nYou lower yourself down onto the mossy ground and take hold of his firm, compact frame, allowing your [pc.chest] to brush over his small, black nipples, firmly pressing the hot meat of your [pc.cock] against the shiny, latex-like protrusion of his own. He turns his head away with a flick of brown hair, an expression of disdain writ large on his overcast features.");
	output("\n\n<i>“As if you weren’t going to do similar if </i>you<i> had won,”</i> you scoff. You thrust your hips, pleasure sharply jagging down your erection as it rubs over the zil’s glossiness, making your partner shiver in response.");
	output("\n\n<i>“I allow this because honor dictates it,”</i> he snaps. <i>“Gloat if you must");
	if(pc.cocks[0].cLength() < 5.5) output(", although I wouldn’t if it were me who were hung like a child.");
	else if(pc.cocks[0].cLength() < 7) output(". It won’t change the fact the touch of a land-stealer puppet fills me with revulsion.");
	else output(". It won’t change the fact your grotesquely-sized beast-penis fills me with revulsion.");
	output("”</i>");

	output("\n\nOh yeah? You wrap your ");
	if(pc.isNaga()) output("coils");
	else if(pc.isGoo()) output("goo");
	else output("[pc.thighs]");
	output(" around his hard thighs and steadily thrust into him, rubbing your cock up and down his thick bee dick, sending a continuous stream of pleasure coursing into your groin. The zil’s cock is perfect for this - wonderfully smooth, hard and flexible, effortlessly sliding across the sensitive underside of your own prick, occasionally flapping to one side to caress the other side. Kane emits a tight gasp between gritted teeth, and a small bubble of golden syrup rises up from its tip, sourcing a small stream of dribbling pre. The touch and intense scent of his pre just makes it all the better, oiling your length as you spread it up and down yourself with loving pumps of your [pc.hips], the lubrication allowing you to go at him with increasing fervor.");
	output("\n\n<i>“Thought you weren’t into this, cute stuff?”</i> you murmur in Kane’s ear, teasingly gripping his tight ass.");
	output("\n\n<i>“Fuck- you!”</i> he hisses back, face burning orange. <i>“Fuck you! Fuck you!”</i> He enunciates each expletive with a fierce thrust of his hips, muscles clenching up beneath your hand. You laugh with delight, the little black rocket of his dick now grinding back into yours, smearing the thick warm honey between you. You let yourself be carried away on a saccharine tide of sensuality, bumping and rubbing back against the infuriated hornet until your [pc.cock] is dense and singing with pleasure, sugar and salt turning out to be a delightful combination.");
	if(pc.cocks[0].cLength() >= 14) output(" Your lumpen member is big enough that it can stretch up to rub against his flat, athletic chest, your sensitive [pc.cockHead] sliding over its smooth plateaus. You teasingly dab the moist, pre-slicked head against his thin lips, make him bark angrily and intensify his own oozing thrusts.");
	else if(pc.cocks[0].cLength() < 5.5) output(" It’s quite pleasant to force the bigger guy to do all the work with the teasing touch of your cute little twig. It’s so delightfully sensitive that having that thick, honey-slicked cock thrusting against your own makes you tingle all over, pleasure shimmering through you.");

	output("\n\nOrgasm takes a firm grip of your groin");
	if(pc.balls > 0) output(", your [pc.balls] tightening up with a heavy load");
	output(", and you don’t wrestle away from it. You groan gratuitously as your [pc.cock] swells up and forces a ");
	if(pc.cumQ() < 40) output("spurt");
	else output("huge gout");
	output(" of [pc.cum] into the air, spattering on Kane’s ");
	if(pc.cocks[0].cLength() < 12) output("chest");
	else output("face");
	output(". He pouts and barks his displeasure, but he’s too wrapped up in the intense pleasure you’ve pressured on him to do anything but jack-hammer his narrow hips up to his own high, syrupy gold melding with your [pc.cumColor] [pc.cumNoun]. You keep a close grip on his tight, heaving frame, thrusting against his pulsing dick, the pheromone-thick goo enveloping your cock only intensifying your release and deep need to pump out every last drop of your cum. ");
	if(pc.cumQ() < 100) output("Both you and him are pretty damn sticky by the time your blood has finally cooled.");
	else output("You’ve managed to cover him from his mop of hair down to his shiny boots in your glory by the time your blood has finally cooled.");
	output("\n\nYou rest for a moment, scissoring with your defeated opponent, before fully taking in the fact that you’re lying next to a massive, natural wash basin. You disentangle yourself from Kane - still lying there with his eyes closed, wiry chest heaving - and head into the cool waters.");
	output("\n\nThere’s a thrum of wings whilst you’re still enjoying a skin-tingling clean. You turn and watch Kane slowly ascend.");
	output("\n\n<i>“Enjoy the waters while you can - they will be your undoing,”</i> is his parting shot. <i>“They are the true protector of the word-wolf!”</i>\n\n");
	processTime(15);
	pc.orgasm();
	CombatManager.genericVictory();
}

//PC Loses
public function loseToKane():void
{
	clearOutput();
	showKane();
	showName("DEFEAT:\nKANE");
	if(pc.HP() <= 1) output("The strength departs your [pc.legs] and you collapse, hands sinking into soft moss. You shake your head urgently and throw your [pc.weapon] down when you hear the deadly whirr of the stone approaching. <i>Anything</i> but getting hit by that again.");
	else output("Your head swims. Everything seems to drip with honey, you can practically taste and feel it on your [pc.lips] and [pc.tongue], and oh Void the thought of being touched and roughly used when you’re in this state... you barely notice your [pc.weapon] tumbling out of your hand. It’s no longer of any importance.");
	output("\n\nKane walks across to you slowly, only letting his weapon softly thump down into the moss when it’s completely obvious you aren’t bluffing; when he’s almost on top of you, and the smell of him is billowing thickly over your senses.");
	output("\n\n<i>“That’s it?”</i> he growls in your face. <i>“I was not expecting the land-stealers to send a warrior so  weak and dissolute.”</i> His black eyes flicker down, over your [pc.chest] and [pc.legs]. <i>“Still. You’re good for two things.”</i>");

	output("\n\nHis glossy black hands are strong and sure as they ");
	//If upper garment:
	if(!pc.isChestExposed()) 
	{
		output("first tear off your [pc.upperGarments]. He gives ");
		if(pc.biggestTitSize() >= 1) output("a boob");
		else output("your flat chest");
		output(" a rough squeeze,");
	}
	else 
	{
		output("give ");
		if(pc.biggestTitSize() >= 1) output("a naked tit");
		else output("your naked chest");
		output(" a rough squeeze,");
	}
	output(" making you " + pc.mf("gasp","mewl") + " before pushing you down onto your hands and [pc.knees]. You are at eye-level when he retracts the groin-plate of his carapace back behind his slim, ropey thighs and allows his thick, six-inch, foreskinned cock to spring out, already sternly erect and beading gold at the tip. The dense, horny, syrupy smell of it is deep in your nostrils and swarming over the back of your throat even before you’ve drawn breath; your mouth is suddenly full of saliva, ");
	if(pc.hasCock()) output("[pc.eachCock] hard with puppyish glee");
	if(pc.hasGenitals()) output(" and ");
	if(pc.hasVagina()) output("[pc.eachVagina] soaking, simmering wet");
	if(pc.hasGenitals()) output(", ");
	output("your mind a yellow, summery expanse of submission.");

	output("\n\nWhy are his pheromones <i>this</i> powerful? You don’t care. It’s easier to let go and not struggle against any more unpleasantness. It’s easier to reach out, grasp that hard, tar-black cock and spread your [pc.lips] over it, forcing the folds of his foreskin back with intent pulls of your mouth and groaning with joy at the strong, aromatic sugar that your questing tongue finds underneath, sending more and more heat sinking down into your [pc.groin].");

	output("\n\n<i>“Nice,”</i> grunts Kane, ");
	if(pc.hasHair()) output("sinking his fingers into your [pc.hair]");
	else output("  wrapping his fingers around your scalp");
	output(" and slowly flexing the wiry black iron of his hips into you, wings flickering with pleasure. <i>“No mewling or need for instruction - just right on with it. A natural, obedient cocksucker, as I sensed.”</i>");

	output("\n\nThe all-encompassing saccharine fuzz drives you to open wide and take him right down to the base, kneading at his hot, truncheon-like length with outward drags of your cheeks, trying to milk the honey out of him, intent on completely washing your senses away in sweet bliss. Despite the leisured groans this draws out of the warrior zil, though, he firmly pushes you off after a short while.");
	output("\n\n<i>“Turn around,”</i> he orders, hard lust livid on his brooding features. <i>“There’s other flavors of star-slut meat I wish to sample.”</i>");
	output("\n\nYou’re too addled with pheromonal arousal to even fake reluctance. ");
	if(!pc.isAssExposed()) output("You pull your [pc.lowerGarments] down and leave them in a heap, [pc.knees] sinking");
	else output("Your [pc.knees] sink");
	output(" into the moss as you swing around and wiggle your naked butt invitingly, arching your back like a bitch in heat for him. You receive a husky buzz of approval and a tight squeeze on the [pc.ass] in response.");

	output("\n\n<i>“It’s a shame I’m going to have to turn you loose after this,”</i> the warrior zil says, arousal coarsening his tone. Long, smooth fingers tease ");
	if(!pc.hasVagina()) output("your [pc.anus], piercing it and stroking at your insides with interest");
	else output("[pc.oneVagina], tracing your opening and dipping inside your needy hole");
	output(", making you shudder with anticipation. <i>“You have all the makings of a fine trophy " + pc.mf("boy","wife") + ". Come back here when we have burned your master’s’ palace to the ground, and you have nothing. I’ll be happy to claim you then.”</i>");
	output("\n\nHis questing fingers withdraw and wrap themselves around your [pc.hips], replaced by the stern, polished club of his hot cock. ");
	if(!pc.hasVagina()) output("You twitch and moan as he fitfully bumps into you, opening your [pc.anus] wide and filling you up with aggressive shoves, driven entirely now by his own overwhelming lust.");
	else output("You moan as he spreads your [pc.vagina] wide and fills you with an aggressive shove, driven entirely now by his own overwhelming lust. You wet silkiness clenches up eagerly around him.");
	output(" Guttural buzzes of zil gratification fill the air as Kane uses his grip to force your [pc.butt] back against his rock-hard abdomen and hips whilst hilting himself deep into you again and again, the impact vibrating through your whole body. Is his roughness primarily motivated by his anger or his lust? The result is the same either way - sheer pleasure seizes you up with every hard thrust of his cock, ");
	if(pc.hasVagina()) output("rubbing and stretching your wet, pheromone-slicked pussy walls beautifully");
	else output("filling your ass-pussy and beating rudely against your buried prostate beautifully");
	output(".");

	if(!pc.hasVagina()) pc.buttChange(10);
	else pc.cuntChange(0,10);

	output("\n\nYou cum after barely a minute of his relentless pounding, honey seeming to pump through your veins as ");
	if(pc.hasVagina()) 
	{
		output("you quiver and seize up around his smooth, girthy prick, ");
		if(!pc.isSquirter()) output("dribbling");
		else output("squirting");
		output(" copious amounts of [pc.femcum]");
	}
	else if(pc.hasCock())
	{
		output("your [pc.cock] seizes up to the stimulation of his smooth, girthy prick, ");
		if(pc.cumQ() < 50) output("spurting");
		else output("spraying");
		output(" copious amounts of [pc.cum]");
	}
	output(". Kane continues to athletically pump into the hole he’s claimed, only responding to the gasps and whines he’s forced past your lips with a stinging slap on the [pc.ass]. The taste of syrup seed is rich in your mouth, and you can only push back into your conqueror in a daze, clenching up around the obdurate brace of his cock, eager for more.");

	output("\n\nYou’re a quivering mess by the time he’s done, the moss around you sticky with the juices you’ve sprayed deliriously in response to getting fucked into the ground whilst under the effects of the zil’s incredibly potent sugar. Your [pc.eyes] roll and you groan woozily as Kane slides his hands forward, grips your [pc.chest] tightly and fills your [pc.vagOrAss] with warm, oozing honey seed, each clap of his thighs against your [pc.ass] accompanied by a harsh hum of purest gratification, wings flickering frenetically. ");
	output("\n\n<i>“There,”</i> the tall zil grunts at last, releasing his grip and slowly pulling his cock out of your [pc.vagOrAss], dragging it along your tenderized walls and opening. A slow cascade of orange cum follows him out, drooling down your [pc.thighs]. <i>“Carry that back to your land-stealing masters’ feet, let them know exactly what we think of them and their weakling servants. You’re a poor warrior, but you will be an excellent message. And, when this is done perhaps: a respectable " + pc.mf("husband","wife") + ". For now though... push off.”</i>");
	output("\n\nWith a throbbing buzz he returns to his seat in the trees, and watches balefully whilst, after a few moments of collecting yourself, you dazedly collect your scattered supplies and carefully descend back down besides the river, attempting to ignore the syrup oozing steadily down your [pc.legs] from your tender [pc.vagOrAss].");
	output("\n\nTime to rethink your approach, possibly.\n\n");
	processTime(30);
	pc.orgasm();
	currentLocation = rooms[currentLocation].southExit;
	//Move PC to Upper Brook square, zil pheromones effect
	CombatManager.genericLoss();
}

/*



output("\n\nWATERFALL POOL");



output("\n\nFOOT OF THE CLIFF");

output("\n\nFirst: You sigh, gazing up at the looming red cliff face in front of you, so high it’s impossible to ascertain where it levels out. Well... it’s not going to climb itself. {Climbing Kit: At least you came well prepared. You spend a few moments fastening on the climbing kit’s carabiner and familiarising yourself with its paraphernalia. Carefully tuning the emergency stabilizer and preparing an auto-mining bolt, you set your hands on the rock.}  ");

output("\n\nTo the immediate west of the foaming waterfall pool the land rises, tufts of scrub growing out of natural steps at the foot of the red rock cliff. If you carefully climb outwards upon them from the waterfall pool, you can work your way around onto the cliff face proper.");

output("\n\nRED ROCK OUTCROP");

output("\n\nYou wipe your brow. You are clutching onto a bulging outcrop of red stone, maybe 30 feet off the ground. You can find handholds and are reasonably stable, but also frighteningly exposed. Behind you, you can hear the shift and hiss of leaves in the breeze; you are almost beyond the reach of those towering ironwoods, but not quite. The cascade tumbles down nearby, the flume of water no longer obscured by the white veil it throws up at the bottom. It’s impossible to make out anything above, but it looks like you can keep climbing upwards if you have the strength, or inch your way back down to the scrub steps.");

output("\n\nRED ROCK LEDGE");

output("\n\nThe cliff face steps in here like a skewed pile of books, offering a place for you to stand in reasonable comfort as long as you keep a tight grip on the rock. To one side a spindly tree like a long, dark asparagus grows out of the rock, bulbous head waggling in the wind. Remarkable what can cling to life in the most perilous of places. Above you, the rock marches back outwards threateningly; you don’t want to even try and climb onto that. It’s just about possible to descend though. Or you could sidle along the ledge towards the hushing crash of the waterfall, see if you can progress from there.");

output("\n\nWATERFALL STAIRWAY");

output("\n\nYou take deep breaths, clutching onto the dank rock. The waterfall thunders directly overhead, raw elemental power that is hard to comprehend, much less handle being underneath. Here, the cliff face offers a gradual advance upwards - if you’ve got the stomach to climb under the gigantic flume of water, feel its spray on your back and [pc.hair], risk the slippery, mossy, jagged stone under hand and foot. If you can just keep pulling yourself upwards, it looks like there’s a level shoulder ahead - or you can shuffle back towards the dry ledge.");

output("\n\nDRIFTWOOD SHOULDER");

output("\n\nFirst: The angular, chipped rock is fairly level and dry here, high up the variegated cliff face. Going off the bleached wood and tangles of dried-out vegetation straggling the rock here and the waterfall probably once ran over this part of the mountain as well, before some calamitous shrug of geography changed the river’s course. From this vantage point, you can at last see the top of the falls - a white curtain tumbling down over a sheer ledge thirty feet above - and what you have to do to get to the top. The next stage is the short face just across the withered scrub, or the deadly wet causeway below.");

output("\n\nRepeat: The angular, chipped rock is fairly level and dry here, high up the variegated cliff face. Probably the waterfall once ran over this part of the mountain as well, going off the bleached wood and tangles of dried-out vegetation straggling the rock, here and there, before the river course changed due to some calamitous shrug of the geography. From this vantage point, you can at last see the top of the falls - a white curtain tumbling down over a sheer ledge thirty feet above - and what you have to do to get to the top.");

output("\n\nOf course, you know now to avoid walking straight across the treacherous, honeycombed rock. Unless... you actually want to go visit the sex-mad kitty snakes beneath the falls?");

output("\n\n[Submit]");

output("\n\nGoes north first time, reflex check succeed: You begin to pick your way across the driftwood-scattered shoulder - and pause. Carefully, you reach out and pluck one of the lumps of dry bleached wood off the rock. A black hole yawns beneath it, breathing water-cooled air into your face. This whole section is as hollow as a honeycomb! You move as daintily as you can around the side, not putting your weight on any of the old vegetation. You think you hear sighs and hisses beneath you, carried up from what sounds like many feet below... thankfully no zil takes this particular opportunity to molest you, and after a tense few minutes you reach the other side. Whew!");

output("\n\nGoes north first time, reflex check failed: You pick your way across the driftwood-scattered shoulder. It’s rather pleasant to not have to use your hands for once. You are halfway to the other side when a large tangle of rotten wood and dried scrub gives way beneath you, and with a horrified wail and a lurch in your chest you fall [pc.feet] first into a gaping chasm below.");

output("\n\nYou hurtle downwards, imagining the terrible impact, your broken body splayed on jagged stone in some Oneforsaken cave nobody will ever find you... before your [pc.butt] touches smooth rock, you whizz down a natural, water-carved slide and are flung into a deep, black pit, landing in something soft and dry before you can properly take in what’s happened.");

output("\n\nYou have a single, short moment to feel adrenaline-soaked relief, to move your limbs and feel for yourself that nothing is broken... before the couch beneath you shifts lugubriously, a multitude of hands touch your [pc.chest] and [pc.groin], and the stench of leathery sex settles into your nostrils.");

output("\n\n<i>“What was that?”</i> coos a woozy voice, somewhere below the shifting warmth.");

<i>“Fresh meat,”</i> hisses a female voice in your ear. You turn your head, gaze into lust-clouded feline eyes. The naleen smiles at you at the same time as she, and many others, coil their strong tails around your [pc.legs]. <i>“Provided to us by our zil landlords. So sweet, how they think of us. <i>“ Her fluffy breasts press into your [pc.chest] as she moulds her lips against yours...

output("\n\n//Lust up");

output("\n\nRED ROCK SCREE");

output("\n\nYou are on a higgledy-piggledy run of loose sunburned rock, above the lenient shoulder. You really are a considerable distance up now - the sound of the waterfall is running liquid and a distant crash far below - but at least it’s no longer a straight drop down. The loose, crumbling rock means you have to be careful as you climb. To the east you can see a crevice in the grey rock face 45 degrees to the one you are currently on. A tough, fibrous rope bridge strung across the cliff wall and the smoothness wrought by many feet around its entrance suggest it’s frequently visited by the zil. Meanwhile you think you can just about see the tops of some wax structures to the west, beyond the head of the falls.");

output("\n\nGREY ROCK SHRINE");

output("\n\n//Does not require energy to visit");

output("\n\nCompared to the rest of the cliffs, using the rope bridge to access the crevice here is child’s play.");

output("\n\nTwo flickering candles set in alcoves right at the back light the cave, which stretches back about fifteen feet. The walls are covered with ochre palm prints and spindly paintings of winged beings on hunts, defeating serpents, kneeling before indescribable objects and beings... there is a carved table at the back between the two candles, upon which a number of items have been placed - arrowheads, a necklace of small discs, a long, curved fang. What catches the eye, however, is a huge round amber gemstone of some sort, covered in charcoal figures. It’s impossible to tell how valuable it might be. {Quinn persuaded: Probably best to leave all of this alone.}");

output("\n\n[Take It] [Leave]");

output("\n\nTake It");

output("\n\n//Does not show if Quinn persuaded");

output("\n\nYou gingerly grasp the amber, half expecting some sort of trap to go off. But nothing happens. Shrugging, you slip the gemstone into a belt pocket.");

output("\n\nLeave");

output("\n\nProbably better not to piss the zil off any more than they already are, at least for now. You retreat out of the shrine and back across to where you were.");

output("\n\n//Back to Red Rock Scramble");

output("\n\nTOP OF THE CLIFF");

output("\n\nThe wind whips over your [pc.hair] as you gaze southwards out at the green-and-occasionally-turquoise blanket of tree tops below you. The view from here, at the edge of a jungle-festooned mesa overlooking a plummeting cliff, is beyond words. {Silly mode: A flock of bird creatures fly by, conveniently providing a sense of scale.} You think you can make out the gleaming white of Esbeth in the distance - and the gleaming reflection of spacecraft taking off and coming in. You are standing on the bare banks of the river which forms the waterfall. The rapids gurgle and chunter as it hurls itself off the outcropping rocks to make the distant thunder at least a hundred feet down.");

output("\n\nAhead, arranged around the river in the squat, lime, cedar-like trees that grow up here, are zil buildings - pale yellow and disc-shaped, almost like giant fungi growing out of the forest.");

output("\n\nPC attempts to rest on waterfall squares");

output("\n\nIt’s impossible to rest here, clamped to the cliff as you are. Perhaps there is respite to be found at the top...?");

output("\n\nPC attempts to fap on waterfall squares");

output("\n\nYou can’t get at your bits whilst holding onto the cliff for dear life - even if there weren’t a swarm of zil somewhere nearby, waiting for you to do just that! Perhaps there is respite to be found at the top...?");

output("\n\nPC Falls Off");

output("\n\n//Happens if PC energy/HP reaches 0 at any time, or if PC rolls it whilst fighting and ungripped.");

output("\n\nExhaustion");

output("\n\n//Does not trigger during combat - so PC can use energizers during combat to avoid triggering it after resolution");

output("\n\nYou can’t take this anymore... {you} / {your [pc.upperGarments]} are soaked in sweat, the tendons in your wrists feel like they’re made of red hot iron, and your nerves are utterly shot. You can barely reach out to the next handhold without almost retching in fright, how far you are off the ground and the merciless sound of the waterfall blotting out all rational thought. You can only focus on one thing - getting down and away from this vertical nightmare, now.");

output("\n\nYou don’t remember much of the next hour - it’s an agonising descent, one slow finger-hold down after another, that terrible war-like blend of boredom and all-pervading fear. The one blessing is that the zil don’t attack you. Perhaps they sense you no longer present a threat to them, or simply don’t have the stomach to attack you in your current state.");

output("\n\nAfter altogether too long, you are collapsed in a sweat-soaked heap near the roaring hush of the waterfall pool, waiting for your heartbeat to return to normal and the adrenaline to stop jangling your nerves. Dully you stare up at the towering cliff that has defeated you. You are going to need a long rest, and maybe a rethink, before attempting it again.");

output("\n\n//Place PC in WP square, +1 hour");

output("\n\nSparta’d");

output("\n\nYou bring your [pc.weapon] up to bear, preparing to give your insectile opponent a swatting... and place your weight on rock that suddenly isn’t there at all. You suck in a huge gulp of air as you find yourself slipping, falling, desperately clawing at the cliff face as you slide off the perch, jutting stone clawing at your chest and face. The callous laughter of the zil rings in your ears as handfuls of dirt come loose in your hands and you find yourself watching the ledge fly away from you... and the only sound is the waterfall and the air in your ears, very loud...");

output("\n\nFell from 3 squares up from Waterfall Pool or more: SMACK. You thump hip-first into another sandstone outcrop, narrowly avoiding cracking your chin on it as you recoil. Chest heaving, you fearfully grab onto it, managing to stop yourself from falling any further. You’re alive. Just about. As you get your breath back and more of the world comes back into focus, horrible pain flares in your [pc.legs] and the wounds on your chest and face begin to sink their teeth into you. You stare hollow-eyed up to where you were only a moment ago, where a smirking zil is just disappearing from view. The only comfort, your imagination lets you know in graphic detail, is that taking a fall like that could have ended a lot worse.");

output("\n\nFell from 2 squares up from WP or less: SPLAT. You thump into the moist turf at the bottom of the cliff, narrowly avoiding the deadly rocky outcrop nearby. Chest heaving, you curl into a foetal position and groan.  You’re alive. Just about. As you get your breath back and more of the world comes back into focus, horrible pain flares in your [pc.legs] and the wounds on your chest and face begin to sink their teeth into you. You stare hollow-eyed up to where you were only a moment ago, where a smirking zil is just disappearing from view. The only comfort, your imagination lets you know in graphic detail, is that taking a fall like that could have ended a lot worse.");

output("\n\n//Take 75% HP damage. If 2 < squares move down 2 squares, If less move to WP square");






output("\n\nZil Hornet");

output("\n\n//PC always starts gripping the cliff. They suffer a 25% accuracy loss as long as this is the case. If they choose to release they no longer suffer this, but have a 40% chance of being knocked down the cliff every time the opponent connects with them. PC can swap without wasting a turn.");

output("\n\nSuggested Stats");

output("\n\nLevel 5");

output("\n\nHP: 65");

output("\n\nArmor: 20");

output("\n\nInitial Lust: 30");

output("\n\nDodge: 10%");

output("\n\nIntro");

output("\n\nSomething flicks past your ear. Imagining falling rock, you look up - and manage to duck to one side as the long, barb-tipped spear is thrust at you more accurately. <i>Real</i> falling rock crumbles beneath your [pc.feet].");

output("\n\n<i>“You are mine, far shist pig!”</i> squeaks the painted, armored female zil that is clutching it, roped to the cliff above you. Getting assaulted like this from above this high up is horribly unnerving - your heart chunters and your every instinct screams for you to make her stop. {At least your climbing gear give you a semblance of security whilst you fend her off.} / {You will have to clutch to the rock face and fend her off one-handed!}");

output("\n\nDescription");

output("\n\nYou are fighting the Zil Hornet. Roped to the cliff-face above you, the 5’5”</i> zil is armed with a long, poison-soaked barb-spear, providing her with extensive reach. There is no question of getting away from her in your current position. Bare breasted, hair tied back, arrayed in beaten, beetle-like plates and smeared with war paint, she is a vision of primordial feminine fury, yellow and black vivid against the deep red of the rock. {You are fighting her one-handed, so your attacks are significantly less accurate.} {You are fighting her with both hands, so suffer no accuracy penalties - but nothing is holding you to the cliff-face...}");

output("\n\nRelease Grip");

output("\n\nTooltip: Let go of the cliff face so you can fight the zil properly.");

output("\n\nYou release your grip on the rock so you can properly defend yourself against your opponent. You try and put the whistling void below you out of mind...");

output("\n\nTake Grip");

output("\n\nTooltip: Grip the cliff face with one hand so you don’t risk falling off.");

output("\n\nYou grip the cliff face, and the terrible anxiety creeping up your spine about the drop below you alleviates. Of course, fighting off your opponent is a bit tougher now...");

output("\n\nAttacks");

output("\n\nSpear Thrust");

output("\n\n//Kinetic penetrating, causes continuing drug damage if shield down");

output("\n\nThe Hornet savagely thrusts her spear at you! {It bounces jarringly off your shield.} {You manage to shuffle desperately to one side, evading it.} {It breaks through your shield and stabs into you.} {It stabs viciously home, pain searing into your side.} {You groan as heat flares within you, pheromones surging into your bloodstream, lust pulsing steadily down to your nethers.} {You cry out as yet more pheromone poison is thrust into you, honeyed lust piling on top of honeyed lust. You’ve got to stop her doing that!}");

output("\n\nSpear Buffet");

output("\n\n//Kinetic. Does double damage vs. shields. If unshielded, drains PC energy by 5 and swaps them to ungripped.");

output("\n\nThe Hornet winds her spear upward, takes a deep breath, and then swings the flat at you with a wild howl! {It blats off your shield. Oof - looks like it felt that.}  {You manage to shuffle desperately to one side, evading it.} {Your shield gives in with an audible gasp of air, and the blow slaps into you.} {It thuds windingly into your side.} {Your hand is forced off the rock with the heavy momentum of the blow. After a few horrible moments, you manage to regain your balance.}");

output("\n\nPC Wins");

output("\n\n{The spear sags in the fazed and wounded hornet’s grip, and you take the opportunity to seize it and rip it out of her grip. It’s clanking and splintering its way downwards long after you’ve thrown it. The zil hoists herself away before you can grab her, too.}");

output("\n\n{The spear sags in the hornet’s grip as she’s finally driven to distraction, reaching beneath her armor with one hand to frig herself furiously. You take the opportunity to seize the spear and rip it out of her grip. It’s clonking and splintering its way downwards long after you’ve thrown it. The zil hoists herself upwards before you can grab her, too.}");

output("\n\n{merge}");

output("\n\n<i>“You’ll tire eventually, land-stealer!”</i> she cries, as she pulls frenetically at her rope, reeling her bobbing abdomen and full, bare buttocks away from you.");

output("\n\nPC Loses");

output("\n\n{Lust loss: You groan woozily, overcome by pheromonal lust. All you want to do is shove your hand between your thighs and masturbate, but if you do that you’ll fall off... } {HP loss: You shudder, unable to summon the will to keep fighting. It’s all you can do to clutch agonized to the cliff and wish to be anywhere else.}");

Loose rock rattles past you, chitinous boots working their way down towards you. A throbbing buzz seems to approach from all around you...

output("\n\n<i>“No!”</i> growls the female zil, close now above you. You hear the creak of rope and swish of her spear. <i>“Be off with you! [pc.he] is mine.”</i> Blearily you look up, just in time to see a yellow-and-black vision of barbarian fury descend on you, honey-slick pussy first.");

output("\n\nIf dick that fits");

output("\n\n<i>“Like that?”</i> she demands, bending her pronged abdomen back to stab it into you above your [pc.chest]. Needling pain and fierce heat spreads out from the puncture wound. <i>“And that? And that?”</i> You cry out weakly, cringing away from her stinger, trying to beg for mercy. [pc.eachCock] responds immediately to her venom, tent-poling {your [pc.lowerUndergarments]} so fiercely you find yourself doubting {it / they} will ever go soft again. The arousal is so intense, your mouth open and vision swimming, you don’t even realize immediately what she’s doing as she descends on her ropes - reaching around you, pushing your face between her soft, pert breasts - until you feel the tough, fibrous pressure on the small of your back.");

output("\n\n<i>“I’m not having you kill yourself before I’ve gotten my satisfaction,”</i> she growls in your ear, as you sag backwards with relief in her makeshift harness. <i>“As much as I doubt you know the meaning of sacrificial honor, land-stealer.”</i> She descends still further, the give of her breasts shifting down your [pc.chest], until she can {pull your [pc.lowerGarments] down your [pc.legs] with a rude rip and shove, and} circles her smooth, booted legs around your [pc.hips]. With no further preamble, she roughly shoves her honey-leaking twat onto your helplessly erect [pc.cock].");

output("\n\nYou twitch and gasp as she uses you with savage jerks of her lithe, athletic thighs, jerking your length in her warm, slimy depths, taut abdomen slapping against your [pc.belly].");

output("\n\nDick < 5 inches: <i>“You are hung like the meekest of our men,”</i> she snaps in frustration, digging her fingers into your cheek, upping the pace of her humping. <i>“The word-wolf says you star-people have become weak from dependence on your metal pipes - this is surely what he meant!”</i>");

output("\n\nOtherwise: <i>“Yes! Yes! Yes!”</i> she grits, digging her fingers into your cheek, upping the pace of her humping. <i>“Tell your masters to send MANY more weaklings with thick manhoods between their thighs. I enjoy them very much!”</i>");

output("\n\n{merge}");

output("\n\nYou are feverish, writhing to the pulse of pheromones slathered over your every sense, and you rocket [pc.cum] into her milking snatch in an unstoppable flurry {until it is oozing and dripping down your [pc.legs] into the void below}.");

output("\n\n<i>“Already?”</i> the zil snorts, as you flail against her like a landed fish. She viciously stabs you with her stinger again in the [pc.thigh], a flare of pain to go with the intoxicating pleasure of her slick, tar cunt gloving your [pc.cock]. <i>“Already? Do you think to escape by wilting out of me, pathetic soldier-child? I have barely begun! See how a true warrior fucks, and dwell upon it next time you think to invade our lands!”</i>");

Your dick is still achingly erect, and probably will be for hours given the sheer volume of zil-venom teeming through your veins. The only thing you can do is hang there and let her continue to have her savage way with your poor, tender body; feel her dig her fingers and thighs into you, feel the heat rise up inexorably to the kneading, honey-hole and erupt, flexing increasingly less and less [pc.cum] into that apoplectic insatiability until it’s clenching up dryly, and it’s all just a fever dream of stinging pain and swimming pleasure...

output("\n\n//Time forward 1 hour, energy -70%, move to WP square");

output("\n\nYou come to your senses in slow, woozy stages, each fresh awakening seeming to trigger a new set of aches somewhere on your frame. The booming crash of water informs you that you are at the bottom of the waterfall again - you vaguely remember the creak of a rope, a rough, careless descent... your [pc.thighs] and much of your [pc.legs] are utterly slathered in a filthy slurry of honey and your own seed, and your front is covered in angry red stings that are already beginning to itch.");

output("\n\nStill: She didn’t kill you. Your possessions are scattered around you. She left you right next to an ice-cold bath. You doubt you’ll be able to attempt the climb again anytime soon, but there are reasons to be grateful.");

output("\n\nIf no dick that fits");

output("\n\n<i>“Like that?”</i> she demands, bending her pronged abdomen back to stab it into you above your [pc.chest]. Needling pain and fierce heat spreads out from the puncture wound. <i>“And that? And that?”</i> You cry out weakly, cringing away from her stinger, trying to beg for mercy you already know you aren’t going to get. {[pc.eachVagina] responds immediately to her venom, juicing {your [pc.underGarments]} so badly it’s like somebody just turned a warm tap on down there.} {If no vag but dick: [pc.eachCock] responds immediately to her venom, tent-poling {your [pc.lowerUndergarments]} so fiercely you find yourself doubting {it / they} will ever go soft again.} The arousal is so intense, your mouth open and vision swimming, you don’t even realize immediately what she’s doing as she descends on her ropes and reaches around you, pushing your face between her soft, pert breasts until you feel the tough, fibrous pressure on the small of your back.");

output("\n\n<i>“I’m not having you kill yourself before I’ve taken my satisfaction,”</i> she growls in your ear, as you sag backwards with relief in the makeshift harness. <i>“As much as I doubt you know the meaning of sacrificial honor, land-stealer.”</i> {If no dick: She raises a woad-daubed eyebrow as her gaze travels further down - presumably taking in the fact you aren’t tent-poling like mad {downstairs} / {in your [pc.underGarments]} - before athletically swinging her armored yellow legs around your neck. {If dick too big: She snorts in disgust as her gaze travels further down - taking in the massive erection you’re sporting, far too big for a petite wasp girl to do anything with - before athletically swinging her armored yellow legs around your neck.");

output("\n\n<i>“You know how to lick, far shist pug,”</i> the yellow-and-black hellion rising over you asserts, bumping her sweet, oozing mons against your [pc.lips]. <i>“Your master’s boots don’t shine themselves, after all. Proceed.”</i>");

output("\n\nThe sound of the waterfall and wind around your precarious perch are muffled intermittently by soft yellow flesh clutching up around your [pc.ears] as you helplessly lap at your conqueror’s pussy. Whenever she feels you’re not giving it everything you’ve got, or your [pc.tongue] doesn’t dart across her flaps in exactly the way she wants, you feel a sharp point scrape across your [pc.belly], her sting circling over your [pc.skinFurScales] meaningfully. It’s intoxicatingly horrible - the more you mash your lips into her sex and bend your tongue into her warm channel the more she oozes honey, and the more you are forced to swallow the higher the pheromones fizz in your veins, your heart thumping in your chest{ and {[pc.eachVagina] dribbling [pc.girlCum] down your [pc.thighs] in giddy excitement / { your ignored, massive dick{s} strain against your [pc.belly] in giddy excitement}.");

output("\n\n<i>“Good... right there,”</i> she groans, back arched against her ropes. You moan woozily as her thighs tighten hard around your head and she starts reactively thrusting herself against your face, smearing sticky sugar across your cheeks and nose. <i>“Yes!”</i> She cries out, a sudden gush invading your mouth and blotting out your throat. Your cough turns into a yelp of pain as she stings you in the thigh - from a loss of control or pure sadism, it’s impossible to tell. You whimper around your mouthful of bee twat as the surge of venomous heat forces you to orgasm, {[pc.eachVagina] pulsing delirious pleasure through your over-sensitized, sweating frame / [pc.eachCock] pulsing wasted [pc.cum] up your sweaty front / your [pc.anus] clenching up in delirious pleasure}.");

output("\n\n<i>“Yes! You like this, don’t you land-stealer!”</i> pants the zil, jabbing her chitinous boots into your back. <i>“It is good, because we have barely begun! A victorious warrior requires many groveling lickings from her pickings! If you did not know this you had no right coming here!”</i>");

output("\n\nUtterly defeated and subsumed in a deep sea of pheremonal honey, you can do nothing but dip your face between her thighs and tongue her opened snatch, the leak of thick sugar seeming to ooze directly down to your own {groin} / {pussy} / {pussies}, filling {it / them} with slathering lust and forcing you to another orgasm, then another, then another...");

output("\n\n//Time forward 1 hour, energy -70%, move to WP square");

output("\n\nYou come to your senses in slow, woozy stages, each fresh awakening seeming to trigger a new set of aches somewhere on your frame. The booming crash of water informs you that you are at the bottom of the waterfall again - you vaguely remember the creak of a rope, a rough, careless descent... your [pc.thighs] and much of your [pc.legs] are utterly slathered in a filthy slurry of honey and your own seed, and your front is covered in angry red stings that are already beginning to itch.");

output("\n\nStill: She didn’t kill you. Your possessions are scattered around you. She left you right next to an ice-cold bath. You doubt you’ll be able to attempt the climb again anytime soon, but these are all reasons to be grateful.");


output("\n\nZil Hoverfly");

output("\n\n//Same set of grip/no grip mechanics to the Hornet");

output("\n\nSuggested Stats");

output("\n\nLevel 5");
output("\n\nHP: 65");
output("\n\nArmor: 20");
output("\n\nInitial Lust: 25");
output("\n\nDodge: 10%");

output("\n\nIntro");

output("\n\nThe crash and hush of the waterfall is progressively drowned out by another sound - the throbbing hum of skateboard-sized insect wings. With a dull lurch of dread, you turn your head to take in the male zil hovering above you, short stabbing spear in one hand and long shield in the other, war paint turning his scowl into a mask of fury.");

output("\n\n<i>“You should not have exposed yourself like this, far shist land-stealer. You are mine for the plucking!”</i>");

output("\n\n{At least your climbing gear give you a semblance of security whilst you fend him off.} / {You will have to clutch to the rock face and fend him off one-handed!}");

output("\n\nDescription");

output("\n\nYou are fighting the Zil Hoverfly. In stature he is a typical male zil - 5’7”</i>, slim, boyish body clad in black carapace - but he is in full flight, open wings keeping him floating near your position, tauntingly just out of reach. He is armed with a long, thin shield and a poison-soaked assegai, with which he suddenly darts in and stabs you with to attack. He is daubed in war dyes and is livid with the joy of flight and battle, flicking this way and that, his heart-shaped face wild with varying degrees of lust, delight and righteous anger. There’s no chance of getting away from him up here - you’ll have to force him to buzz off.");

output("\n\nAttacks");

output("\n\nTwin Needle");

output("\n\n//Low damage but attacks twice, kinetic + drug lust damage");

output("\n\nThe Hoverfly flicks this way and that, testing your guard - or maybe simply teasing you - before suddenly darting in, deftly thrusting his assegai at you once, then swiftly again from another angle. {The blow bounces jarringly off your shield.} {You manage to shuffle desperately to one side, evading the attack.} {The blow breaks through your shield and stabs into you.} {The attack stabs viciously home, pain searing into your side.} {You groan as heat flares within you, zil pheromones surging into your bloodstream, lust pulsing steadily down to your [pc.groin].} {You cry out as yet more pheromone poison is thrust into you, honeyed lust piling on top of honeyed lust. You’ve got to stop him doing that!}");

output("\n\nZweet Breeze");

output("\n\n//Pheromone lust damage. 50% chance to blind PC");

output("\n\nThe Hoverfly buzzes backwards, out of range of your [pc.meleeWeapon], before sliding his groin plating back, revealing his fat, black six inch cock, erect and gently leaking with golden anticipation. The thrum of his wings kicks up to a deafening vibration as he directs a flattening wash of air at you, laden with the warm and cloyingly sweet smell of his swollen sex. You can’t help but breathe some of it in, the scent teasing and twisting down your throat, sugary impulse and heat pulsing down into your [pc.groin]. {You make the mistake of trying to track his movements, and dust is blown into your [pc.eyes]. You are blinded!}");

output("\n\nShield Up");

output("\n\n//Increases armor by 40 for next two turns.");

output("\n\nKeen black eyes on your [pc.weapon], the Hoverfly raises his thin, black shield, hunching his lithe form behind it, only his thrumming wings and cute behind visible. Whatever that material is made of, it looks tough.");

output("\n\n<i>“Give me your metal blowpipe’s best shot, land-stealer!”</i> he cries.");

output("\n\nContinuing effect: He’s still covering himself with his shield.");

output("\n\nFinish effect: With a tired huff, the male zil’s allows his guard to sink back down.");

output("\n\nPC Wins");

output("\n\n{Spear and shield splinter and clatter their long way down the cliff. {The zil warrior sags on his wings, too thrashed to do anything but hold himself in the air.}  {Face orange, the zil warrior claws at his groin plate, all thoughts departed except the need you’ve instilled in his nethers.}");

output("\n\n<i>“You’ll tire eventually, land-stealer!”</i> he grits angrily as he sinks an erratic and jerky path downwards, eventually disappearing beneath the treetops. You allow yourself a sigh of relief.");

output("\n\nPC Loses");

{Exhaustion / Arousal} making your eyes swim, you stumble and suddenly feel rock crumbling beneath your [pc.feet]. For one horrible moment you are losing your balance, the sound of the waterfall very loud in your ears...

output("\n\nThe zil barges into you, arresting your fall with a flying rugby tackle.");

output("\n\n<i>“Not having you kill yourself, land-stealer,”</i> he growls, clasping you around the [pc.chest]. The throbbing flicker of his wings is like a cinemascope of the sky. <i>“Least not before I’ve gotten my satisfaction.”</i> The flicker intensifies as he half drags, half carries you down to a sheltered spot on the cliff. You are too subsumed in {lust / tiredness} and frazzled by the fright of losing your balance. If the energetic wasp boy wants to fuck you... fine. That’s fine. That’s better than falling 50 feet onto jagged rock.");

output("\n\nThis train of thought is aided by the sweet, heated smell of his lean, athletic flesh, baking your senses in irresistible, cloying pheromones. It’s so easy to just breathe that in and let it soothe your jangling nerves with thoughts of thick, sexual honey{, {[pc.eachCock] growing tender and erect} {and} {[pc.eachVagina] moistening and widening eagerly}}. By the time he’s laid you on the rocky shelf you’re actually salivating slightly in anticipation.");

output("\n\nThe zil warrior slides his wings down and lies back on the rock, slender chest heaving, his expression one of well-worked triumph. He opens his gleaming thighs and retracts his groin plate, murmuring as his thick, jet, foreskinned dick springs outward, erect and ready.");

output("\n\n<i>“It’s not going to suck itself,”</i> he says, gazing at you heavy-lidded with the air of a returning conqueror. <i>“Do a good job and who knows... I could be persuaded to carry you down to the bottom.”</i>");

output("\n\nIt’s easy to agree to these terms. So easy that you’d worry about your current state of mind, but that would draw focus away from how enjoyable it is to grasp the bee boy’s cock at the root, fold his foreskin back with drags of your [pc.lips] and spread the ambrosia of zil spunk over your taste buds. The hoverfly’s slim, flat chest rises and falls, giving buzzing, sighing voice to the pleasure you give him by circling his exposed head with your [pc.tongue] before fully enveloping him in your mouth, the smooth, hard tar rubbing delectably over your lips as you hollow your cheeks around it.");

output("\n\nThe more intently you bob your head and tongue the zil’s shaft the more of his sweet pre he leaks, and the denser your own fug of lust becomes - it’s a deeply gratifying feedback loop which you quickly get lost in, all other thoughts drowned out by the need to keep milking him for more of that wonderful, oozing sugar. {Each drop you wick away with your [pc.tongue] {sends a shiver of sensation through [pc.eachVagina], becoming wetter and hotter until it feels like you have a leaking honey-pot of your very own between your [pc.thighs].} / {sends a fresh surge of lust up [pc.eachCock], throbbing harder and harder until it feels like you have your very own dripping, pheromone-laden sting between your [pc.thighs].}}");

output("\n\n<i>“That’s it... <i>“ groans the warrior, hand gripping your [pc.hair], the woad spirals and stripes on his face a mask of ecstasy as you bend your head down to sheath every inch of him, his tight balls bumping against your chin, before pulling at his rock-hard shaft ardently. <i>“Keep doing that... that!”</i>");

output("\n\nHe arches his back and thrusts his lithe, armored hips into your face, squirting a thick load of honey down your throat. You swallow and coo around him, everything drowned out by a summer of sweet, pheromonal bliss opening up in your mind and groin. You keep kneading his pulsing cock with close pulls of your mouth, rubbing his underside with sharp drags of your [pc.tongue], focused on drawing every last drop of liquid gold you possibly can out of him. A croak and a polite but firm push to the head eventually informs you to stop. You look up at your zil subjugator, slightly dazed, deep in the summery bliss of a heavy dose of honey.");

output("\n\n<i>“You’re a poor fighter but a good cocksucker,”</i> he husks. <i>“Suits me to have your type running around our jungle - whatever the word-wolf says.”</i>");

output("\n\nAfter an immoderate period of lounging on the sun-baked rock, the male zil instructs you to put your hand on the rock. Happy to peacefully obey your honey daddy, you do so. Maybe he’ll let you suck him again when you get to the bottom? He’s too petite to properly carry you, but he does support you as you carefully climb down, curtly husking instructions in your [pc.ear]. You think you hear more buzzing nearby - other male zil, sensing a pheromone-soaked lust-sponge - but the one with his hands around your [pc.chest] angrily beats them away.");

output("\n\n<i>“We aren’t your personal honey trove, land-stealer,”</i> he growls, laying your unresisting body down next to the waterfall pool. <i>“Tell your masters that - and stay in the jungle if you want more.”</i> He buzzes off with a high whine.");

output("\n\nNaleen Mating Ball");

output("\n\nNotes");

output("\n\nHas a huge amount of health (what’s 18 x 45?) and is therefore tough to beat by conventional methods. Lust rises passively every round... but the higher their lust climbs, the more attacks they get!");

output("\n\nSuggested stats");

output("\n\nLevel 7");

output("\n\nHP 450");

output("\n\nInitial Lust 25");

output("\n\nDodge 0%");

output("\n\nNo. of attacks: 25-38 lust = 2, 39-60 = 3, 61-75 = 4, 76-89 = 5, 90-100 = 6");

output("\n\n20% resistance to lust attacks across the board");


output("\n\nDescription");

output("\n\nYou are embroiled in the Naleen Mating Ball! Here, deep in the caverns below the waterfall, a whole host of the feline naga have made a wide hollow their own, and are in the middle of enthusiastically expressing their desire for the naleen race to persist. Their smooth, leathery coils and soft fur shifts languorously beneath your [pc.skinFurScales], and the smell of musk and excitement is overpowering in the still, oppressive darkness. You can’t tell how many of them there are - their sibilant hisses, titters and moans echo back to you through the caves, as if the whole warren is carpeted with serpent shag - however the ratio of fluffy boobs to double dicks pressing into you suggest there’s more female naleen here than male.");

output("\n\nTheir attention is constantly drifting back to each other, but when they are focused on you they use their sure hands, sharp teeth and frighteningly strong tails to drag you further into their writhing midst, hungry for their orgy to grow ever larger and more exciting.");

output("\n\nAttacks");

output("\n\nSnake Slap");

output("\n\n//Kinetic. Only procs if shield still up. 1.5x vs shield");

output("\n\nIrritated by your kinetic barrier butting into them, a naleen rears his lower half out of the morass and smashes himself into it as hard as he can. {Your shield can’t hold out anymore, and the thick whip of lithe muscle carries straight on into you.}");

output("\n\nBite");

output("\n\n//Ignores shield. Small kinetic damage, degrades physique, reflexes and willpower. Does not stack");

output("\n\nWet pressure spreads itself over a spot on your side, a libidinous love bite which culminates in needle-like teeth sinking past your [pc.skin]. {You grit your teeth as you feel venom work its way into your bloodstream, tightening up your muscles and clouding your mind.}");

output("\n\nConstrict");

output("\n\n//Only procs if shield is down. PC bound");

output("\n\nSmooth, warm scales slide around your [pc.legs], a naleen’s tail curling itself around you, a loop that draws ever tighter. {You manage to wrench yourself clear.} {Your movements are limited in this pit of writhing, sighing flesh, and you can’t get yourself clear of it in time. A few moments more of sinuous movement, and you are completely bound in the naleen’s coils.}");

output("\n\nFemale Tease");

output("\n\n//Tease lust damage");

output("\n\nA female naleen rears up in front of you; making hushing, soothing noises, she grasps your head and presses it between the soft, warm fluff of her breasts{, stroking your [pc.hair] as she does so}.");

output("\n\nMale Tease");

output("\n\n//Tease lust damage");

output("\n\nStrong hands curl between your [pc.thighs] and slowly advance up your midriff to your [pc.chest]. His hard pecs rubbing against your back, the male naleen breathes a leopard’s growl in your ear, evidently enjoying what he’s touching.");

output("\n\nTwin Tease");

output("\n\n//Tease lust damage");

output("\n\nA naleen collapses on top of you, pinning you beneath her soft, fluffy front. Muscular arms reaching around you to clasp themselves around her has you realize that you aren’t her focus of attention. The two predators kiss hungrily over your head, molding their fit, lithe bodies into you passionately: a snake-kitten toasty.");

output("\n\nClaw");

output("\n\n//Kinetic damage");

output("\n\nMany hands are touching you, in all sorts of ways; a fondle, a clasp, a stroke. And, as a reminder of the savagery of these primordial predators, a violent, fully-clawed swipe. {The claws rake off your shield.} {The blow breaks through your shield and slashes into you.} {You manage to heave yourself out of the way.} {The claws rake into you.}");

output("\n\nWhen the Booping’s Good");

output("\n\n//Passively raises lust on self at end of each round by 3-6.");

output("\n\nThe slathering ball of lusty naleen shivers and squirms, their passions growing ever more intense. {If attack gained: <b>The mating ball has gotten more frantic!</b>");

output("\n\nPC wins via HP");

output("\n\nLeathery coils and furry breasts sag beneath your [pc.legs], too beaten and enervated to continue holding you.");

output("\n\n<i>“Oh, let [pc.him] go, Ophia,”</i> snaps a thoroughly fed-up voice at the bottom of the pile. <i>“[pc.he]’s completely killing the vibe.”</i>");

output("\n\nHalf a dozen hands firmly grab hold of you, haul you up and then tumble you over the lip of the hollow into a downward-sloping tunnel. You crawl for a little while on your hands and [pc.knees], trying to put as much distance between you and the naleen whilst recovering your breath and senses in the dark. After a short amount of time, things start to turn a little greyer, and the omnipresent roar of the waterfall overhead sounds clearer. At last you come to a cave entrance, in front of which a  white curtain of water tumbles down. Working your way around it leaves you blinking in the open air of the Mheng’an jungle, knee deep in the pool at the bottom of the waterfall.");

output("\n\nYou will have to start the climb again - but that seems a small price to pay, weighed against not dying and not getting gang-raped by serpents.");

output("\n\nPC wins via Lust");

output("\n\nThe naleen thrash, shiver and moan with delight, utterly lost in a group paroxysm of lust. They grasp, bite and thrust into each other in a frenzy, tails snapping and flailing, and though you feel like you’re in the middle of a scale-and-fur earthquake, they no longer have any interest in anything besides themselves. You manage to claw your way to one side, and tracing the side of the pit whilst naga bump and grind into you uncaringly, you manage to find an open space to haul yourself into and tumble down.");

output("\n\nYou crawl for a little while on your hands and [pc.knees], trying to put as much distance between you and the naleen whilst recovering your breath and senses in the dark. After a short amount of time, things start to turn a little greyer, and the omnipresent roar of the waterfall overhead starts to sound a little clearer. At last you come to a cave entrance, in front of which a  white curtain of water tumbles down. Working your way around that leaves you blinking in the open air of the Mheng’an jungle, knee deep in the pool at the bottom of the waterfall.");

output("\n\nYou will have to start the climb again - but that seems a fairly small price to pay, weighed against not dying and not getting gang-raped by serpents.");

output("\n\nPC Lost");

output("\n\n{Lost via lust: At some point your thrashing around stopped being about attempting to escape the naleen and became about joining in eagerly with their lithe, slithery mating dance. You can practically taste your own horniness, down here in the hot, sweaty darkness, and all there is left to do is to stop struggling and embrace as many purring, hissing cat-snakes as you can.} {Lost via HP: The shock of the fall, followed by this overwhelming pit of naleen, has robbed you of your will and strength. Your weak struggles only earn you even more ruthless tightening of the coils around your waist and [pc.legs], and finally you have to give in. Let them do as they wish with you; maybe they’ll let you go afterwards.}");

output("\n\n{merge}");

output("\n\n<i>“This is how it is, tossed morsel,”</i> husks the female naleen, curling her arms around you, erect nipples brushing against your [pc.chest]. All you can see of her face are her fangs and the heady lust in her slit eyes, glistening in the dark. <i>“We don’t prey upon the sweet bees above. They provide tribute to our nest in return. So you will enliven our joining by being a good little {cum-pump} {piece of ass} for us; the peace of the jungle rests upon it.”</i>");

output("\n\nAs she talks, she {mounts your [pc.cock], sensual delight furring her tones as she pushes her hot, dripping sex down your erect shaft.} {rubs her opened, dripping pussy against your [pc.vagina], bracketing her soft lips and clit with yours.} A deep growl reverberates in your ear as tightly muscular arms twine around you from behind, fondling both your [pc.chest] and the female’s divinely soft and fluffy breasts simultaneously; the male grinds into you, opening your [pc.anus] and thrusting more and more of his diamondback dick into your [pc.ass] with determined jerks of his scaly hips.");

output("\n\nThere’s nothing for you to do but clutch the sinuous female back, and whimper as she and her friend energetically take their pleasure from you. {If herm OR 1< pussy: The male huffs his enjoyment as his trailing fingers find your [pc.vagina1]; he takes a moment to line himself up, in the next pushes his double cocks into both your cunt and your {tight} / {slick} back passage.} They mold their bodies into you passionately, tonguing and biting each other’s lips over your head, all the while other naleen tails wrap themselves around your [pc.legs] and [pc.thighs], drawing you further into the heated, squirming morass until you can barely move, steeped in a shifting pit of scales and fur.");

output("\n\nThe first naleen {slides off your throbbing cock and} moves her sinuous way up until she is at the top of the pile, meaningfully bumping her wet sex against your mouth. As you helplessly tongue her tangy, dripping hole{ a flicking tongue finds your [pc.cock0], a pair of lips envelope your sensitive head. You can’t possibly see exactly what naleen is doing this, but by the trembles and muffled coos they transmit into your cock-flesh as they pull and knead at it, they’re getting royally railed as they do so.} / { a flicking tongue finds your [pc.vagina0], a pair of lips press into your labia. You can’t possibly see exactly which naleen is doing this, but by the trembles and muffled coos they transmit into your flush pussy walls as they lap and flick at them, they’re getting royally railed as they do so.}");

output("\n\nYou are made to give oral whilst oral is lavished upon you, all the while the big male pumps into your asshole {and [pc.vagina1]} unrelentingly, for a long minute in the heaving darkness. He grunts with profound relief, claws biting into your shoulders as he fills {two of your sensitive, twitching slots} / {you} with hot, gooey panther cum. Then he’s gone, withdrawing out of your opened hole{s}, and you’re being pulled somewhere else in the pile, lassoed away by another two or three tails in order to be some other naga’s toy. {Another hot, wet pussy is molded on top of your [pc.cock0] and kneads you this way and that;} / {Another fervid snake dick is thrust deep into your [pc.vagina0], digging into your tenderness deep;} / {Another hot, wet pussy is molded on top of your [pc.cock0] and kneads you this way and that, another fervid snake dick is thrust deep into your [pc.vagina0], digging into your tenderness deep;} every inch of you is felt, spread and used by the blissed-out predatory creatures.");

output("\n\n{Your [pc.cockTail], swollen up and eager in the presence of so much smooth pressure and musk, is quickly found and joyfully put to use. It pulses out cum with deep, heavy throbs into one squealing female, and then it is snatched away, pumped impatiently back to full hardness, and thrust into another.} {Your [pc.cuntTail], spreading and moistening itself eagerly to the smell of musk and the attentions of curious fingers, is quickly put to joyful use. Uncontrollable pleasure shimmers down it as one male after another pounds their cock into it, nubs rubbing over its slobbering insides before releasing their loads deep down its stem.} {Lactation: Your [pc.nipples] are {tweaked} / {fingered} until you are dribbling [pc.milk] freely, after which you discover naleen <i>like</i> [pc.milk]. A lot. Fangs nip into the quaking flesh of your [pc.chest], thirsty mouths pulling intently at your taps, and you can do nothing but wail and release torrents of the stuff down their gullets in response, knowing full well that they won’t stop even when they have drunk you completely dry.} {Cock wings: It doesn’t take much stimulation for your vine dicks to spring out from your back of their own accord, eagerly reacting to the endless stroke of leathery tails and clutching hands. They are soon threading their way through the morass, happy to be spear into every warm, welcoming hole they are coaxed towards. The pleasure of so many of your over-stimulated cocks thrusting home into some tight, wet crevice is electric, maddening; you can only tremble and thrash against your snake-like bonds as your tentacles do as they wish.}");

output("\n\nYou are forced to loud orgasm once, twice... you lose count. Time and your own sensitivities have no meaning, down there in the suffocating dark. You {spray [pc.cum] freely into some naleen’s dripping twat} {and} {convulse and dribble [pc.femcum] around a male’s hard, reptilian prick} - and then you are ruthlessly passed on to somewhere else in the pile, your [pc.groin] {and [pc.chest]} some other sexed-up naga’s source of amusement. You are rendered a doll, to whom there is no sensation but the repeated use of your {dick}{s} {and} {cunt}{s} {and} {your boobs} and your [pc.tongue] for the snake-tigers’ pleasure; there is no taste but their generous amounts of pussy juice and cum, and that is wonderful.");

output("\n\n[pb]");

output("\n\n//+2:30 Hours, Lust reset, pussy soaked, load in everywhere");

output("\n\nEventually the naleen have mercy on you. Or maybe they get bored of you, or the orgy finishes of its own accord. Whatever the case, you slowly come to your aching senses lying naked and alone, in some black cavern below the distant roar of the waterfall. The same one, or did they chuck you out of their <i>“nest”</i>? Concepts of time and place have deserted you - you just know how much your [pc.groin] and [pc.anus] ache, and how much warm naga cum is currently leaking out of you. Your fingers finding the smooth, comforting edges of your codex on the ground centers you a little.");

output("\n\nOver the course of the next half hour, you find your [pc.gear] scattered around you and put it all back on. You then crawl slowly in the direction you think you detect a slight breeze coming from. As you progress the light starts to become a bit greyer, the sound of the waterfall a bit clearer, and you have enough about you to get up and start gingerly waddling instead. At last you come to a cave entrance, in front of which a  white curtain of water tumbles down. Working your way around that leaves you blinking in the open air of the Mheng’an jungle, knee deep in the pool at the bottom of the waterfall.");

output("\n\nYou will have to start the climb again - but at least you’re still alive. And you do now know where the most rapacious pitfall on this planet lies.");



output("\n\nPart 3: RK Lah Showdown");

output("\n\nSquare Blurbs");

output("\n\nZil Village Outskirts");

output("\n\nYou are up the banks of the river, safely north from the head of the waterfall. There’s a fresh breeze up here quite unlike the oppressive humidity in the jungle below, carrying the scent of something like lavender, oozing honey and the more homely smell of wax. The zil build their homes out of the stuff, as you can clearly see; vaguely tepee-shaped, pale yellow dwellings built around the cedar-like trees and the swift river, as well as wooden platforms and rope bridges in the bows, crossing the water at various points. {Quest unresolved: You approached this literal nest of wasps as carefully as you could -  however the few zil you see hang off you, watching your approach from doorways and trees with surly, wary black eyes.");

output("\n\nYou recognize the male on the nearest platform by his size and scar. Kane gazes down at you, boot dangling, po-faced. Possibly you’re imagining it, but you think you detect the slightest hint of grudging admiration underneath that overhang of hair.");

output("\n\n<i>“Quinn will speak with you,”</i> he says. <i>“You can rest here first, if you wish. I would.”</i> He disappears further into the woods without another word.} {Quest resolved, zil defeated: This place is empty now, the wind blowing nothing but memories. Somehow it gives you the creeps a lot more than when it was packed with watching zil.} {Quest resolved, zil appeased: From their doorways and platforms the zil watch you with frank but amicable curiosity. No longer a war camp, the infirm and the young have moved back in, lending the village a friendlier, fuller vibe, and there’s a mild buzz of activity and hubbub around you.}");

output("\n\nAhead the river deviates to the west, thanks to a steep promontory of rock. A wooden ramp leads up it, surrounded by zil wax-homes. To the south the river runs its course to the cliff edge.");

output("\n\nZil Chieftain’s Circle");

output("\n\nFirst: You slowly climb up the wooden ramp. The sound of footsteps makes you turn. You’re being followed up it by more than a dozen zil, all armed, all returning your stare with silent animosity. No way out of this now, you guess.");

output("\n\nThe top of the promontory is flat, sandy and round, surrounded by the fungus-shaped zil homes, and has a circle of stones in the middle. Zil throng its edges, some carrying torches, and like a hive that has detected a predator approaching an angry hum goes up when you step off the ramp. On the opposite side of the natural terrace there is a large chair - easily the most ornate thing you’ve seen of these zil’s handiwork so far, carved with symbols, polished with wax and covered with... well, there’s only one creature you know of that has a pelt <i>and</i> a snakeskin.");

output("\n\nStanding next to the chair is a tall, rangy ausar; sat on top of it is a zil. Aside from her brilliant golden irises there is physically nothing to mark her out as different from any other female zil - clad in black carapace, slightly taller and slimmer than the norm perhaps, long yellow-and-black hair - but the manner in which she sits, still and poised, and the way in which she regards you, calmly and chin in hand, say more than robes and a crown ever could. Compared to the bee-people you’ve met so far, she looks like she’s carved out of ivory.");

output("\n\n<i>“This would be the land-stealer’s champion, then,”</i> she says placidly. <i>“You said such would come, and so it was true.”</i>");

output("\n\n<i>“I- I thought they would send - yes, I did say that, and I speak truths!”</i> growls Remi-Kellen Lah. He looks different enough from his mugshots that you didn’t immediately recognize him, and not just because he’s wearing nothing but the tattered remains of his orange jumpsuit bottoms and some sort of cape-like fur around his neck. Weeks in the jungle have browned his skin, leaned his body right down and turned his grey hair into an unruly mop between his wide, pointy ears. Like the zil chieftain though, the crucial difference is not physical. When the ausar moves towards you it is in a jerky manner, his ears and pale eyes twitching this way and that, as if expecting an attack from an unexpected quarter at any instant. He points a long, clawed finger at you like the thrust of a sword.");

output("\n\n<i>“First the fascists take your land!”</i> There is an approving murmur of <i>“far shist”</i> around the circle. <i>“Then they send their minions to enforce their greed: indoctrinated wage-slaved pawns.”</i> A wondering, rousing buzz of <i>“indo t’chinater wayslay bawns”</i> follows. <i>“And so the unfairness becomes the new rule. You cannot allow this to happen!”</i> Lah balls his fist. <i>“This pawn’s appearance here only tells us that you are winning the battle, that you have the land-stealers rattled. With their attention on you now, we need only one more great demonstration of your fury and bravery to banish them from your lands forever!”</i>");

output("\n\n<i>“And what are your words concerning the pawn [pc.him]self?”</i> says the zil chieftain calmly, once the wild cheering has died down. Lah stares at you. There’s something of a battle going on, behind those grey eyes.");

output("\n\n<i>“[pc.he] has heard the truth,”</i> he says at last, almost visibly biting down on what the ausar who has spent the last four weeks living wild wants to say. <i>“If [pc.he] is at peace with it, then [pc.he] should go in peace, yes. If [pc.he] is here to blindly follow [pc.his] orders, then... then.”</i>");

output("\n\n<i>“And what say you, stranger?”</i> Quinn says, gaze travelling up you from [pc.feet] to [pc.hair]. There’s a impatient buzz around the circle’s edge, the clink of wood and the dry, meaty sound of spear meeting sand.");

output("\n\n<i>“I am Quinn!”</i> the chieftain says loudly, eyeing the crowd, and the grumbling immediately dissipates. <i>“These were the words of the word-wolf when he first came, and it is with them we have become more than we were! The language of the star-people have power, and we have steeped ourselves in it! You shall obey me, for I am Quinn!”</i>");

output("\n\n<i>“Quinn!”</i> The syllable reverberates like a drum roll around the promontory. Beside her, Lah massages his brow with a look of profound despair.");

output("\n\n[Talk] [Challenge] [Fight] [Agree]");



output("\n\nConfrontation Options");

output("\n\nFight");

output("\n\nTooltip: Enough nonsense. Scatter this rabble to the wind and take Lah alive.");

output("\n\n<i>“I came here to bring an escaped convict to justice,”</i> you say, drawing your [pc.weapon], <i>“and that’s exactly what I intend to do.”</i>");

output("\n\n<i>“Suffer our wrath then, land-stealer,”</i> Quinn replies coolly. The angry buzz grows into a throbbing snarl that presses upon you from every side, and the entire throng of warrior zil descends on you, torches and flint-blades flashing.");

output("\n\n//Go to Zil Tribe fight");

output("\n\nTalk");

output("\n\nTooltip: Reason with Quinn. They really like words, right?");

output("\n\n<i>“Look, there’s no need for violence,”</i> you say. <i>“That’s an escaped convict you’ve got by your side. Isn’t there any way we - ?”</i>");

output("\n\n{Amber stolen: Before you can continue, a female zil comes tearing up the ramp.");

output("\n\n<i>“Quinn! The ancestor stone - it’s gone! Taken!”</i> she gasps, breasts heaving. She is too out of puff to do anything more but point accusingly.");

output("\n\n<i>“KILL [pc.him]!”</i> cries the chieftain, fury finally breaking that mask of preternatural calm. The angry buzz grows into a throbbing snarl that presses upon you from every side, the entire throng of warrior zil descends upon you, torches and flint-blades flashing.}");

output("\n\n{Amber not stolen: <i>“[pc.He] speaks falsehoods, put in [pc.his] head by the land-stealers!”</i> says Lah with loud certainty. He again points damningly at you. <i>“I am your word-wolf, and I speak truths! [pc.He] is nothing but a weak, mendacious liar, hoping to steal your truth-speaker away without even a fair fight!”</i>");

output("\n\n<i>“He is the word-wolf, and what he says is true,”</i> repeats Quinn. She gestures with a sigh. <i>“Kill  [pc.him].”</i>");

output("\n\nThe angry buzz grows into a throbbing snarl that presses upon you from every side, and the entire throng of warrior zil descends on you, torches and flint-blades flashing.}");

output("\n\n//Go to Zil Tribe fight");

output("\n\nAgree");

output("\n\nTooltip: So he’s gone a bit off the rails, but Lah isn’t wrong.");

output("\n\n<i>“You won’t hear any argument from me that Darnock’s operation sucks,”</i> you say with a shrug. <i>“So I guess if it’s a choice between having to fight you all and that place being shut down... I’m with you.”</i>");

output("\n\nLah looks completely stunned by this - even Quinn’s eyes widen a little. {Amber stolen: Before either of them can react though, a female zil comes tearing up the ramp.");

output("\n\n<i>“Quinn! The ancestor stone - it’s gone! Taken!”</i> she gasps, breasts heaving. She is too out of puff to do anything more but point accusingly.");

output("\n\n<i>“KILL [pc.him]!”</i> intones the chieftain, fury finally breaking the mask of preternatural calm. With a wild war-cry that presses upon you from every side, the entire throng of warrior zil descends on you. //Go to Zil Tribe fight} {Amber not stolen: The ausar quickly recovers, though.");

output("\n\n<i>“See?!”</i> he exults to the murmuring crowd. <i>“Even the land-stealers’ own minions cannot deny the truth when it is presented to them! Carry that in your hearts, when we set out to destroy their seat of power for good!”</i>");

output("\n\n<i>“Let’s do it now, whilst their champion is away!”</i> shouts one, waving her torch.");

output("\n\n<i>“Yes! Burn the far shist’s palace down! Carry the truth to them!”</i> the cry goes up.");

output("\n\n<i>“I... we should wait until - but no, yes! We shall do it now!”</i> bays Lah, fire in his pale eyes. <i>“Before they even know their time is up!”</i> He grins at you wildly, and then is gone, striding towards the ramp, at the head of an excited mob of zil.");

output("\n\n<i>“What an interesting star-person you are,”</i> says Quinn, continuing to gaze at you appraisingly once they have disappeared towards the waterfall. <i>“You defeat the cliffs singlehandedly, and yet when you get here you submit to the will of Quinn. A strong, fair, obedient warrior. I have not encountered any other star-people like that.”</i> She idly traces a finger up her gleaming inner thigh, a small smile on her pointed, delicate face. <i>“It pleases me a great deal that you are a subject of mine. Will you tell me a little more about yourself? Perhaps you can shed light on where the far shists come from? I must admit, the word-wolf is very confusing on this matter.”</i>");

output("\n\n[Talk] [Appearance] [Leave]");

output("\n\nLeave");

output("\n\n<i>“I should, uh... <i>“");

output("\n\n<i>“As you wish.”</i> Quinn gestures in the direction of the waterfall. {No wings: <i>“Call at the bottom, and a ladder will be provided.} {Wings: <i>“I can see you have no need for ladders. My people will not molest you when you fly up here, since you have vanquished the cliffs.}”</i> She takes you in from tip to tail with those heavy-lidded, appraising pits of gold again. <i>“You should visit often. Your Quinn requires much attention, after all.”</i>");

output("\n\nChallenge");

output("\n\nTooltip: Challenge Lah to a fight, zil-style.");

output("\n\n<i>“I challenge him to battle!”</i> you say, pointing at Lah, loudly enough for the crowd to hear. <i>“If I beat his sorry ass you will give me a fair hearing about this business, as is your custom!”</i>");

output("\n\n<i>“That’s - that’s just absurd!”</i> barks Lah, color draining from his face. Quinn frowns, stroking her chin. <i>“[pc.he] seeks to impose [pc.his] will on you through violence, as is the land-stealer’s way, just in a different way!”</i> the ausar goes on urgently. <i>“You cannot listen to him - [pc.he] speaks lies, I speak truths!”</i>");

output("\n\n{Amber stolen: Before things can go any further though, a female zil comes tearing up the ramp.");
output("\n\n<i>“Quinn! The ancestor stone - it’s gone! Taken!”</i> she gasps, breasts heaving. She is too out of puff to do anything more but point accusingly.");

output("\n\n<i>“KILL [pc.him]!”</i> says the chieftain, a look of fury finally breaking the mask of calm. With a wild war-cry that presses upon you from every side, the entire throng of warrior zil descends on you. ////Go to Zil Tribe fight} ");

output("\n\n{Amber not stolen: The angry hum grows in response to Lah’s words, becoming a throbbing snarl...");

output("\n\n<i>“No!”</i>");

output("\n\nThe sound of the mob dissipates as a large, male zil shoves his way to the front of the crowd.");

output("\n\n<i>“The land-stealer’s champion defeated the cliffs on [pc.his] own,”</i> growls Kane. <i>“I watched [pc.him]. [pc.he] is a worthy challenger, and deserves to stake [pc.his] claim.”</i>");

output("\n\n<i>“It is fair,”</i> Quinn nods. Amusement is playing with one corner of her mouth; she rearranges herself on her throne, re-crossing her gleaming legs. <i>“Reassert yourself word-wolf, as is our custom. It will be pleasing to me.”</i>");

output("\n\nLah clutches at the air in total exasperation - and then, with a reluctant huff, descends to the stone circle. The hum around you is now one of excited anticipation, and the crowd of zil close in around you. Several of them gather around Lah, and he emerges from them armed with a short stabbing spear.");

output("\n\n<i>“Lay down your weapons and take off your armor,”</i> he growls, glaring at the sandy ground in front of you. <i>“I know - pigs - have no knowledge of the concept, but this is supposed to be - yes, a fair fight.”</i>");

output("\n\nThere’s no backing down now, unless you intend to start firing into the crowd. You throw your [pc.meleeWeapon] and [pc.rangedWeapon] to the ground {before taking off your [pc.armor]{, leaving you standing there in your [pc.lowerGarment]{ and [pc.upperUndergarment]}}}. A zil approaches and tersely proffers a spear and a short bow complete with quiver of arrows. You get the distinct impression you can only take one.");

output("\n\n[Spear] [Bow]");

output("\n\n{You grasp the spear’s haft, and the zil melts back into the crowd.} {You sling the fur quiver over your shoulder and take up the bow. The zil melts back into the crowd.} Lah paces around the opposite edge of the stone circle like a wounded, hungry wolf, ears flattened, tail twitching. Behind him is the buzzing, shouting mob of warrior zil, torches waving excitedly; beyond them Quinn watches from her seat, a sculpture of relaxed, calm interest.");

output("\n\n<i>“I- I never intended this,”</i> the ausar says, pale eyes finding yours at last. <i>“Violence against property yes, but not... but I will. Yes. For this I, I will! You will not steal their innocent hearts away from me!”</i>");

output("\n\n//Go to Lah fight");

output("\n\nFights");

output("\n\nRK Lah");

output("\n\n//Notes: Simple enough, aside from the fact PC is shorn of their carried armor and weapons. Time spent with the zil has given him a small resistance to pheromone and drug lust damage. He concentrates on wearing the PC down with grapples and DoT.");

output("\n\nWeapons");

output("\n\nChampion Zil Assegai");

output("\n\nA short stabbing spear, with a broad, leaf-shaped tip made of flint. A favored weapon in zil hunting parties, the blade usually envenomed.");

output("\n\nKinetic Piercing: 6");

output("\n\nAttack text: You thrust your spear at [opponent]!");

output("\n\nChampion Zil Short Bow");

output("\n\n//Should receive bow training boost if present.");

output("\n\nA small bow made out of pliant wood and fibrous thread, complete with a quiver of dart-like arrows. Well suited to the tight confines of the Mhen’gan jungle.");

output("\n\nKinetic Piercing: 4");
output("\n\nEvasion +5");

output("\n\nAttack text: [Standard fire bow text]");


output("\n\nStats");

output("\n\nLevel 5");
output("\n\nHP: 90");
output("\n\nInitial Lust: 20");
output("\n\n15% Immunity to pheromone attacks");
output("\n\n15% Immunity to drug attacks");


output("\n\nAppearance");

output("\n\nYou are fighting RK Lah. The ausar fugitive stands maybe 6 foot tall, a height accentuated by his hard, jungle-leaned body and his wide, pointy ears. His skin is a sun-bronzed teak and his fur an orangey-grey, a shoulder-length matt of the stuff between his ears and down his bushy tail. Around his neck he has tied a long fur of some kind, which combined with the hunch of his shoulders lends him a prowling profile. Aside from that all he’s dressed in are the tattered remains of his bright orange jumpsuit bottoms; his bare feet are floured pale yellow with use.");

output("\n\nHe has a long, studious face which would be reasonably fetching in some circumstance in which his lips weren’t curled up in a mask of rage and fear. Similarly, his pale grey eyes could be pools of moon-like calm, were they not nakedly shining the light of a mind that has spent weeks marching far into the jungle night. He is armed with black, thorn-like claws and a zil spear, which with his spidery arms give him considerable reach.");


output("\n\nAttacks");

output("\n\nIf It Bleeds");

output("\n\n//Causes 5 points of bleed for 3 turns if unshielded");

output("\n\nLah lunges forward suddenly, a bestial, wordless snarl on his lips as he swipes at you with his bared, thorn-like claws! {His blow thwacks off your shield.} {His blow breaks through your shield and bites into your [pc.skin].} {You manage to sidestep the attack.} {His claws rake viciously off your [pc.skin]. {If bleed: Blood dribbles freely from the ragged wound.}");

Continuing effect: Blood continues to drip freely from the deep scratches he’s given you. You feel drained and light-headed...

output("\n\nFinish effect: Blood stops seeping out of your wound quite so freely.");

output("\n\nDances With Wolves");

output("\n\n//Raises evasion by 30% for 3 turns");

output("\n\n<i>“Fancy yourself, don’t you? Pigs always do,”</i> Lah growls, ears flat, tail twitching. He starts, eyes flicking this way and that, as if his neck were crawling... and then he shoots forward, spear raised for an all-out attack!... and then suddenly he’s not, he’s hopping and creeping around the opposite side of the stone circle instead, spear twirling in one hand. <i>“But here you are, way way out from your pen, without any of your fancy native-killing gadgets - and how soft you look without them, how </i>vulnerable<i>. So c’mon, pig. Just, just try and lay your snout on me.”</i>");

output("\n\nContinuing effect: The ausar continues to jitter and start forwards and backwards unexpectedly. It’s a nightmare drawing a bead on him.");

output("\n\nEffect finishes: The ausar finally starts moving with something approaching normalcy, his burst of nervous energy exhausted.");

output("\n\nWolf’s Tooth");

output("\n\n//Standard kinetic penetrating attack. 20% chance to cause 5 bleed for 3 turns if unshielded");

output("\n\nLah prowls around you, arm up and grey eyes flashing, thrusting his spear viciously at your side where he anticipates you won’t expect it.  {His blow is blunted by your shield.} {His blow breaks through your shield and thunks into you.} {His blow thunks into your bare side.} {You manage to sidestep the attack.} {Causes bleed: Horribly unprotected as you are, there’s nothing stopping the blade hitting a vein and the merlot to start flowing down your [pc.skinFurScales], dripping in the dirt below your [pc.feet].}");

output("\n\nContinuing effect: Blood continues to drip freely from the puncture wound he’s given you. You feel drained and light-headed...");

output("\n\nFinish effect: Blood stops seeping out of your wound quite so freely.");

output("\n\nRed Flower");

output("\n\n//Burning damage, 50% chance to cause burn");

output("\n\nLah staggers backwards, seemingly cringing away from you in fear - before snatching a torch out of the hand of a zil behind him and thrusting its lit end at your face.");

output("\n\n<i>“Burn, pig!”</i> he snarls. {Thankfully your shield deflects it upwards.} {Your shield can’t stop it entirely and instinctively you throw your arms in the way. Ffffffuck that stings!} {You instinctively throw your arms in the way, saving your face at the expense of searing pain against your palms. Fffffffuck that stings!}");

output("\n\nThe Wolf About Us");

output("\n\n//Constrict. Only uses if PC suffering from a DoT. 2 turn cooldown.");

output("\n\nPale eyes flickering over your wounds, Lah bounds forward, hunching forward on all fours in order to launch himself bodily at you. {You shuttle forward yourself, letting him leap right over you.} {Wind escapes your lungs as he grabs you around the neck, forcing you downwards in an arm-lock.");

output("\n\n<i>“Give in,”</i> he barks gruffly in your ear. <i>“Better now, before your wounds force you to.”</i>}");

output("\n\nContinuing effect: You are forced to stare dizzily at the ground, the bay and throb of the crowd in your ears, Lah’s hard, wiry arms locked firmly around your neck. You’ve got to get him off you!");

output("\n\n[Struggle] [Submit]");

output("\n\nStruggle fail: You claw blindly at his face and try and buck furiously, to no avail.");

output("\n\n<i>“Stuck pig,”</i> grits the ausar, tightening his hold. <i>“Give in already.”</i>");

output("\n\nStruggle succeed: You pull him to one side, before delivering a sucker punch hard and low from the other. Lah gasps in pain, and you manage to rip out of his grasp.");

output("\n\nPC Wins via HP");

output("\n\nThe wounds you’ve inflicted on him only seem to madden RK Lah further. He stalks towards you, pale eyes bulging, claws and teeth bared like the vengeance of some terrible, ancient forest god - and then he collapses in a shivering, coughing heap in front of you, nothing more than a hungry, slightly unhinged ausar.");

output("\n\n<i>“...the horror!”</i> he whispers at the ground, eyes still wide.");

output("\n\nPC Wins via Lust");

output("\n\nThe lust you’ve worked into him only seems to madden RK Lah further. He stalks towards you, pale eyes bulging, claws and teeth bared like the rapacious intent of some terrible, ancient forest god - and then he collapses in a shivering heap in front of you, desperately jacking the tent-pole he’s grown in his orange bottoms, nothing more a horny, unhinged ausar.");

output("\n\n <i>“...the whorer!”</i> he whispers at the sky, eyes still wide.");

output("\n\n{merge}");

output("\n\nAn uncertain, slightly shocked murmur trembles through the throng of zil, most of them staring at their fallen prophet.");

output("\n\n<i>“I am impressed, land-stealer champion,”</i> says a clear, calm voice, cutting through the hubbub. The zil shuffle out of the way, allowing you to approach the female zil on the chair again. You quickly struggle on your [pc.gear] again and do so. Quinn looks... is impressed the right word? There’s color in her pale cheeks, and she smiles at you with frank, warm pleasure, one hand sliding up a gleaming black thigh. <i>“I do so enjoy watching a hard-fought rut. {Particularly when it’s between two males.} A surprise victor, too!");

output("\n\n<i>“You have earned the right to a fair hearing,”</i> she goes on, in slightly cooler tones. <i>“Quinn will listen. Be warned though - you will have to speak better truths than the word-wolf if you are to shake our resolve to destroy the land-stealers. I doubt you can.”</i>");

output("\n\nThe zil behind you have quieted, enough for you to hear a shuffling in the sand. Lah clambering back to his feet.");

output("\n\n[Demand] [Diplomacy]");

output("\n\n//Reintroduce existing PC armor and weapons, goto Reasoning with Quinn");

output("\n\nPC Loses");

output("\n\nYou stagger, too {exhausted / horny} to properly focus anymore. You are suddenly very aware of how alone you are out here, attempting to perform this savage rite surrounded by these strange, hostile aliens. When Lah advances again, claws bared, you instinctively put your hands up. No more.");

output("\n\nAt least that is a sign that is universally understood. The zil cheer, a joyous, buzzing ululation rising and receding over the crowd. Thin chest heaving, Lah raises his hands to it, wordless for the moment in exhausted triumph.");

output("\n\n<i>“You have shown again why you are the word-wolf,”</i> Quinn says with calm pleasure, once the cacophony has died down a bit. <i>“Strong in word and deed.”</i> The ausar bows deeply.");

output("\n\n<i>“What do you want doing with the land-stealer pawn?”</i> growls Kane, hand on spear.");

output("\n\n<i>“[pc.he] challenged and fought honorably,”</i> the female zil pronounces, shimmering eyes on you. <i>“And vanquished the cliffs besides. If [pc.he] accepts the word-wolf’s truths are stronger than [pc.his], [pc.he] is free to pledge their allegiance to me, and can go in peace.”</i>");

output("\n\n[Accept] [Don’t]");

output("\n\nAccept");

output("\n\nTooltip: Lah will get his way. You will live.");

output("\n\nYou don’t exactly have a choice here, but it probably wouldn’t be bright to point that out.");

output("\n\n<i>“Fine,”</i> you sigh. <i>“Attack the plantation all you want. Not gonna start another fight over it.”</i>");

output("\n\nQuinn smiles at you broadly, and there’s a hum of appreciation for the land-stealer champion’s tact amongst the ranks. Lah strides back to his place next to the leader’s throne.");

output("\n\n<i>“You have heard the land-stealers speak for themselves,”</i> he exults to the crowd. <i>“And you know now they are nothing-words, falsehoods I told you they would mouth! Carry that in your hearts, when we set out to destroy their seat of power for good!”</i>");

output("\n\n<i>“Let’s do it now, whilst their champion is away!”</i> shouts one, waving her torch.");

output("\n\n<i>“Yes! Burn the far shist’s palace down! Carry the truth to them!”</i> the cry goes up.");

output("\n\n<i>“I... we should wait until - but no, yes! We shall do it now!”</i> bays Lah, fire in his pale eyes. <i>“Before they even know their time is up!”</i> He grins at you wildly, and then is gone, striding towards the ramp, at the head of an excited mob of zil.");

output("\n\n<i>“What an interesting star-person you are,”</i> says Quinn, continuing to gaze at you appraisingly once they have disappeared towards the waterfall. <i>“You defeat the cliffs, demand honorable battle with our prophet, and yet in the end you submit to the will of Quinn. A strong, fair, obedient warrior. I have not encountered any other star-people like that.”</i> She idly traces a finger up her bare inner thigh, a small smile on her pointed, delicate face. <i>“It pleases me a great deal that you are a subject of mine. Will you tell me a little more about yourself? Perhaps you can shed light on where the far shists come from? I must admit, the word-wolf is very confusing on this matter.”</i>");

output("\n\n[Talk] [Appearance] [Leave]");

output("\n\nDon’t");

output("\n\nTooltip: You can take ‘em all on! Probably!");

output("\n\n//Set HP to 1 if HP 0, Set Lust to 99% if 100%");

output("\n\nYou take a big gulp of air... and then you bring your {spear / bow} back up to bear.");

output("\n\n<i>“No,”</i> you say lowly. <i>“I came to bring that fugitive back, and that’s what I aim to do.”</i>");

output("\n\nQuinn’s brow crinkles as she looks down on you - in confusion more than anything. Everyone else simply looks incredulous.");

output("\n\n<i>“I know mercs aren’t particularly bright,”</i> says Lah, <i>“but you really take the biscuit.”</i>");

output("\n\n<i>“Kill [pc.him], then,”</i> sighs Quinn. The throng of zil descend on you.");

output("\n\n//Go to Zil Tribe fight. Note PC should still be without their gear");


output("\n\nZil Tribe");

output("\n\nNotes: Since this is the brute force option that can be avoided, it should be tough. I’m thinking four attacks per turn, with one of them always being the persistent pheromone attack.");

output("\n\nStats");

output("\n\nLevel 7");
output("\n\nHP: 350");
output("\n\nInitial Lust: 20");
output("\n\nArmor: 100");

output("\n\nArmor absorbs 50% of kinetic attacks, 30% of burning attacks, 50% of poison attacks, 150% of corrosive attacks, 50% of drug attacks, 30% of electric attacks.");


output("\n\nAppearance");

output("\n\nYou are fighting the <b>Entire Zil Tribe</b> - or at least, every member of it that can raise a blade, bow or blunt instrument in anger, male and female alike. The flames of their torches glimmer off their black armor, beetle-like oval shields and the sticky war paint they have smeared across their wild, tar-eyed faces. You’ve backed yourself against the wall of a wax building so you don’t have to fight literally every single one of them at once, but the lithe bee people are a thicket of yellow, tar and flint all around you, closing off any notion of escape. A buzzing ululation is on all of their lips, a rising and falling war cry that seems to inspire them and drive them to frenzy, fearlessly flying at you regardless of where you’ve got your weapon aimed.");

output("\n\nThe ones that can’t reach you stamp their boots in the sand or fly above the foray, droning encouragement to those that can, eagerly awaiting their own opportunity to hurl themselves at the land-stealer champion.");

output("\n\nAttacks");

output("\n\nSpear Stab");

output("\n\n//Standard kinetic crushing.");

output("\n\nOne zil stabs at you viciously with their spear. {You avoid the blow.} {It deflects off your shield.} {Your shield absorbs some of the blow, but not all.} {It thrusts into your side.}");

output("\n\nArrow");

output("\n\n//Standard kinetic penetrating.");

output("\n\nAn arrow hisses out of the mob towards you. You don’t even see who fired it. {You dodge out of its path.} {It deflects off your shield.} {It breaks through your shield and thinks into you.} {It thunks brutally into you.}");

output("\n\nClobber");

output("\n\n//Kinetic crushing, causes stun if shield down. Only once per turn");

output("\n\nA wordless war hum vibrates out of the open mouth of a zil as they throw a whirling roundhouse you with their wooden club. {You avoid the blow.} {It deflects off your shield.} {Your shield absorbs some of the blow, but not all.} {It bounces off your head.} {You taste iron, and you’re knocked to a place where it seems as if the battle is coming from a long way away... }");

output("\n\nDart");

output("\n\n//Small kinetic penetrating damage, drug lust damage.");

output("\n\nA zil at close-quarters raises a blowpipe and puffs their cheeks around the hole. {You manage to sidestep the dart.} {The dart disintegrates against your shield.} {The dart breaks through your shield and pecks into you.} {The dart pricks into you, releasing its lusty, woozy payload.}");

output("\n\nWounded Grab");

output("\n\n//Only active if HP 180 or less. No damage, trips the PC if success. Only once per turn, two turn cooldown");

output("\n\nOne of the zil you’ve driven wounded to the ground grabs desperately at your [pc.legs]. {You manage to wrench yourself out of his grip.} {You can’t stop yourself being pulled down in turn! The remaining zil cheer and close in, scenting victory.}");

output("\n\nHigh Summer");

output("\n\n//One of their attacks is always this. Pheromone lust damage");

output("\n\nThe smell of so many zil packed together around you is impossible to avoid. The fragrant, arousing sugar is exacerbated by the warmth of their naked bodies and the sharpness of their anger and excitement, an intoxicating blend that cascades over your senses in waves...");

output("\n\nSquirt");

output("\n\n//Only active if Lust 65 or more. Pheromone lust damage");

output("\n\nOne of the zil you’ve rendered too lust-addled to do anything but frig herself grits her teeth, grips her nipples and squirts syrupy, projectile arousal at you. {You duck out of the way.} {It splatters across you, and you groan as the scent and flavor of it works itself into your head... }");

output("\n\nArmor Replenish");

output("\n\n//Only active if Armor at <10. Raises armor by 70. Only once per turn, three turn cooldown");

output("\n\nWhilst two zil box you in with their circling spear-tips, the rest of the mob rearrange themselves. Shields change hands, black carapace tightening up with concerted concentration. Before you know it you’re being assaulted on all sides again, the warrior wasps’ armor revitalized.");

output("\n\nHoney-cane");

output("\n\n//Only active if Lust 80 or more. Reduces lust by 60, tease damage to PC. Can only be used once");

output("\n\nThe zil are looking increasingly orange in the face, and more than just from battle frenzy. Honey is leaking down thighs, thick jet-boners are on display.... They shout and buzz at each in distraction - a decision seems to be reached - and before you know it they’ve reorganized. Three of the least affected by your antics leap forward, boxing you in with swinging clubs and torches, and the rest relieve themselves. Gratuitously. Ebony fingers dance across lithe flesh, squeeze, rub furiously, lips are bitten, gasps escape into the air, and honey squirts everywhere.");

output("\n\nFrom left to right is a cornucopia of frenzied insectile lust, and it’s difficult not to be overwhelmed by it. It seems to have only been opened in front of you for a few mere moments though before a wave of freshly relieved wasp fighters are back on their feet and charging back into the fray, triumphantly resuming that deafening hum-cry of theirs.");

output("\n\nPC Loses");

output("\n\nVia HP: You falter, sweat stinging your eyes and blood dripping down your flank, and the next moment you are being battered to the floor with clubs and spear butts, your cries of pain drowned out under the stamp of a dozen carapace boots.");

output("\n\nVia Lust: You moan, lost in a woozy reverie of sickly-sweet honey and lust venom. The need coursing through your veins is too great - your [pc.weapon] falls from your hands. Your assailants close in and grab you roughly, and just the touch of their smooth hands on your enflamed [pc.skinFurScales] is enough to make you wail wantonly, and you thrust yourself against them, vainly trying to get them to see to the all-engulfing fire in your loins.");

output("\n\n{merge}");

output("\n\nA humming cheer goes up as you are dragged forwards by many chitinous hands, presented to the calm figure on the seat at the head of the circle.");

output("\n\n<i>“We have defeated the land-stealer’s champion!”</i> you hear Kane harshly exult over the triumphant tumult. <i>“We can defeat ANY that stand before us!”</i>");

output("\n\nRK Lah doesn’t look triumphant. He takes in your slumped, defeated form and the cheering, dancing crowd with twitchy apprehension. He looks like a dog who’s realised that somewhere out there, a rolled-up newspaper has his name on it.");

output("\n\n<i>“You - you could let him go,”</i> he says to Quinn. <i>“Lesson learned. Let [pc.him] carry back the message of your strength- <i>“");

output("\n\n<i>“No,”</i> she cuts him off magisterially. <i>“The far shists sent a message to us today - one of ignorance, contempt and blind violence. We shall indeed send them a response, but it shall be in kind. It shall display exactly what we think of theirs and them.”</i>");

output("\n\n{Silly mode: <i>“AaaaAAAAaaaargle gargle bargle!”</i> you scream as you are carried off. <i>“Not the bees! Not the bees! MY EYES!”</i>}");

output("\n\n{!Silly mode: She dismisses the crowd with a wave. You are carried by a troop of zil back down the ramp, and back through the village, any querying croak on your part met by stony silence. The sound of the waterfall becomes inexorably clearer just as surely as their intention does. You struggle and {scream} / {bellow} like a wild beast, but they’ve got you held tight.}");

output("\n\n<i>“Shame that someone strong enough to beat the cliffs wasn’t smart enough to know when to quit,”</i> opines Kane, at the precipice, wind blowing through your [pc.hair]. {He brings up his stone and, with the air of craftsman, lays it upon your [pc.wings]. You don’t feel him breaking them, not really. You’ve tuned out. This isn’t happening.} <i>“Take comfort in the knowledge that others of your kind may learn from your end. And that it was quick.”</i>");

output("\n\n{Silly mode: <i>“Killing me won’t bring back your goddamn honey!”</i> you howl in his face.}");

output("\n\nHalf a dozen zil heave the weight back - and then swing it forward. And then... there’s only the deafening inhalation of the wind.");

output("\n\nGAME (SPLAT) OVER.");

output("\n\nPC Wins");

output("\n\nVia HP: The sand is littered with broken spears, spent torches and zil too battered and wounded to continue fighting. The rest falter as you relentlessly advance, the deafening drone trailing off, and suddenly they are fleeing into the jungle, wings flickering and abdomens bobbing, driven away in terror by this indomitable warrior in their midst.");

output("\n\nVia Lust: You move with sensuous intent through the ranks of the defeated zil, too enraptured by this avatar of pure arousal in their midst to do anything but sprawl in the sand and desperately masturbate, some of them conjoined and feverishly attempting to work off the overload of lust you’ve worked into them. The few that still have their wits about them falter, the deafening drone trailing off, and suddenly flee into the jungle, wings flickering and abdomens bobbing.");

output("\n\n{merge}");

output("\n\nRK Lah is knelt in the sand, jaw sagged, pale eyes gazing out over the scene of {devastation} / {total abandon} you have wrought.");

output("\n\n<i>“I can’t - <i>“ he stutters. <i>“You - how could - <i>“");

output("\n\nYou shut him up with a sharp blow to the temple. There’s plenty of twine lying around to bind his wrists with.");

output("\n\nQuinn’s ornate chair was turned over and broken in the stampede. The slim female zil lifts herself up from her position on the grass around the mound, and watches you approach silently. She’s still got the aura of glassy calm about her - but the flick of her golden eyes up and down your form, and the slight tremble of her lip betray her. Not a hint of a quiver in her voice when she speaks, though.");

output("\n\n<i>“The day is yours, land-stealer. You will take what you came for. But I am guessing the taking hasn’t finished yet. Would that be right?”</i>");

output("\n\n[Fuck Her] [Let Her Go]");

output("\n\nLet Her Go");

output("\n\n<i>“It was never anything personal, lady,”</i> you reply. You jerk your head brusquely at the jungle. <i>“Keep your stinger out of star-people business in future.”</i>");

output("\n\nShe moves pretty damn fast for the most sedate zil you’ve ever met. You go back across to the stunned Lah and haul him to his feet. <b>Better take this stray back to the pound and claim your reward.</b>");

output("\n\nReasoning with Quinn");

output("\n\n[Demand] [Diplomacy]");

output("\n\nDemand");

output("\n\nTooltip: Explain that Lah is a fugitive, that you’re taking him back to face the music, and that is where the matter will end.");

output("\n\n<i>“That ausar is not a soothsayer, or whatever he’s got you believing,”</i> you say, as levelly as you can. <i>“He’s a dangerous fugitive who’ll say anything to stay out of jail. I’m here to take him back to face justice. Once I have, you won’t be bothered again.”</i>");

output("\n\nThe resumption of the angry humming behind you tells you that this hasn’t gone down well.");

output("\n\n<i>“Told you,”</i> mutters Lah.");

output("\n\n<i>“Bothered?”</i> replies Quinn, anger flashing on her enlivened face. <i>“Me and mine will remain bothered for as long as strangers steal our land and guard it with their white death stings! Or perhaps you didn’t think our truths worth listening to? Who you call oh-sir has provided us with explanations, a way forward, a direction for our ire. If you cannot do similar then either admit to his truths - or die. There is no because-I-say-so.”</i>");

output("\n\n[Insist] [Diplomacy]");

output("\n\nInsist");

output("\n\nTooltip: You’re taking Lah, whether they like it or not.");

output("\n\n<i>“Gonna have to insist, lady,”</i> you say, meaningfully reaching for your [pc.weapon]. <i>“We settled matters your way. Now Lah is coming with me.”</i>");

output("\n\n<i>“Quinn has listened to you fairly, as was demanded,”</i> replies the female zil coldly. <i>“And I have found the word-wolf’s truths ring true - you are nothing but a mindless pawn of the land-stealers. So die.”</i>");

output("\n\nThe angry hum becomes an all-encompassing drone as the tribe of zil descend upon you.");

output("\n\n//Go to Zil Tribe fight");

output("\n\nDiplomacy");

output("\n\nTooltip: There’s got to be a third way, here. Maybe they could seek a pact with the people of");
output("\n\nEsbeth, see if they can’t block Snugglé’s plans?");

output("\n\n<i>“Alright, look,”</i> you say, as levelly as you can. <i>“I get that what Snugglé is doing is bad. But Lah’s plan is only going to result in more misery for you. Either they’ll send mercs after you, </i>real<i> ones this time, or your whole species is going to be declared savage and dangerous. You’ll get killed in droves. Nobody will protect you from slavers... <i>“");

output("\n\n<i>“What are you proposing?”</i> returns Quinn, the tone of strained patience echoed back at you.");

output("\n\n<i>“You have honey,”</i> you go on quickly. <i>“Star people really like that honey. Trade it with those in Esbeth for food, medicine, material. They aren’t with the land-stealers - if you show you aren’t violent, that you can be friends, they’ll help you. They can protect you against Snugglé, block them from expanding. You can be uplifted - and that is when you really can take the fight to them.”</i>");

output("\n\n<i>“Corporatist, credit-eyed logic!”</i> snaps Lah. <i>“Join the scramble at the bottom kids, maybe some of your betters’ crumbs will fall your way - and be sure to say thank you whilst they’re literally milking you dry!”</i>");

output("\n\n<i>“Hmm,”</i> drones Quinn, gazing at you. <i>“You’ve gone through a lot in order to put this to me, but you must understand - putting down our weapons to chase after this plan of peace of yours, it sounds very dubious. The people of the place you call Esbeth have never shown anything but fear and mistrust of us. What are you really offering over the word-wolf’s truths?”</i>");

output("\n\n<b>You get the impression you’re only going to get a limited number of shots at this.</b>");

output("\n\n[Words] [Security] [Money] [Peace] [Sex] [Power]");

output("\n\n//Repost choices at the end of each one, ghost out each as they’re chosen. PC gets four tries at it before fail state, i.e. if they select more than one of Money, Peace and Power goto PC fails.");

output("\n\nWords");

output("\n\nTooltip: Explain that Lah has been selling her a lemon.");

output("\n\n<i>“I’ll offer you real truth, how’s that?”</i> you say, looking Lah dead in the eye. <i>“And the truth is that that guy has been telling you star-people’s words have a lot more power than they actually do.”</i>");

output("\n\n<i>“What do you mean?”</i> says Quinn, frowning.");

output("\n\n<i>“He called you <i>“queen”</i> when he first met you, because he didn’t know the first thing about how Zil reproduce!”</i> Lah looks down at the sand, blushing, and you press on triumphantly. <i>“Just because he called you one doesn’t automatically make you one. I’m telling you this because if you start going around telling star-people you’re Quinn without knowing what it means, they will all laugh at you!”</i>");

output("\n\n <i>“Is this true?”</i> The female zil has turned a face of pure venom to the cringing Lah.");

output("\n\n<i>“I- it was a mistake,”</i> he mutters. <i>“I don’t even like - I hate monarchies! But once you’d gotten hold of it, I couldn’t - and it made everything so much... easier... because all your tribe listened to you!”</i>");

output("\n\n<i>“But if that isn’t true,”</i> Quinn says, face now clouded with pale doubt, <i>“then that means... <i>“");

output("\n\n<i>“No!”</i> says Lah quickly. <i>“You know everything else I’ve told you is true! You have seen things I have said made flesh! That land-stealer pawn standing right there is just one - one example!”</i>");

output("\n\nBut you can see the seeds of doubt have been sown.");

output("\n\nSecurity");

output("\n\nTooltip: Promise them better freedom to roam the jungle.");

output("\n\n<i>“What your people want more than anything is the freedom of Mhen’ga, right?”</i> you say. <i>“To do in the forest as you please, as you’ve always done.”</i>");

output("\n\n<i>“Which is exactly why you must drive the land-stealers away!”</i> rages Lah. <i>“They will enslave you! They will take more of your jungle away!”</i>");

output("\n\n<i>“You might be able to drive Snugglé away,”</i> you go on patiently, <i>“but all it will mean is that there will be no star-people to stand up for you. Others will come - slavers, pirates, squatters, stripminers. But star-people could be a great boon for you. If you reach out to them, they can protect you. Not just from bad star-people, but the vanae and the naleen, too. No more of your men-folk snatched away in the night. No more {snake-death} / {bargaining with snakes beneath your waterfall}. That is what is there to be gained.”</i>");

output("\n\nThere’s a sizable murmuring amongst the tribe to this.");

output("\n\n<i>“An interesting offer,”</i> says Quinn at length, steepling her jet fingers. <i>“And what you say about other star-people - that has the ring of truth to it. Drive away another tribe, and you simply invite other enemies to fill their space. I had not thought of this.”</i>");

output("\n\nMoney");

output("\n\nTooltip: Honey for money. Money for neat stuff. Surely they can grasp that.");

output("\n\n<i>“You’ll be able to sell your honey for a good price,”</i> you say. <i>“And the stuff just comes out of you, right? With money, you’ll be able to buy things. Homes, and medicine, white stings - your lives will be better. Richer.”</i>");

output("\n\n<i>“Exactly - exactly what I warned you about!”</i> snaps Lah with triumphant contempt. <i>“MONEY. It’s all they can think about. It’s why they are here, grabbing at other people’s belongings so they can produce more of it. And here their servant is, waving it underneath your nose so that </i>you<i> can become a mindless, heartless addict to it too!”</i>");

output("\n\n<i>“We have already heard much about this money of yours,”</i> says Quinn coldly. <i>“We have no wish to be enslaved to it as you are.”</i>");

output("\n\nDang.");

output("\n\nPeace");

output("\n\nTooltip: Nobody wants jackboots on their soil, do they?");

output("\n\n<i>“You need to come to some sort of compromise with star-people,”</i> you say. <i>“Show that you are peaceful. If not with Snugglé, then someone. If you just keep attacking whoever, eventually you’ll get soldiers landing here, and things will get ugly.”</i>");

output("\n\n<i>“Are you saying that we cannot drive off whoever we choose?”</i> Quinn raises a gleaming black eyebrow at you.");

output("\n\n<i>“...Yes?”</i> you have to reply. <i>“You already know star-people have vastly better tech- <i>“");

output("\n\n<i>“What I know,”</i> the female zil interrupts with an irritated slap on her throne, <i>“is that the land-stealers hide and quiver in their palace from our attacks. That these Esbeth people of yours barely dare set foot outside their homes for fear of us. We are zil! We fight fearlessly and relentlessly, guided now by the star knowledge of the word-wolf! You seek to threaten us, alien, as if we weren’t warriors. Do not do so again.”</i>");

output("\n\nThere’s a clash of weapons and a loud, buzzing cheer behind you. Lah hasn’t said a word this time, but a glance over your shoulder tells you he’s looking unbearably smug.");

output("\n\nSex");

output("\n\nTooltip: You’re pretty sure you know one thing the zil are fans of.");

output("\n\n<i>“There is a vast universe out there,”</i> you say, pointing at the sky. <i>“Filled with many, many beings of all shapes and sizes. Most of them, however, would be very interested in... liaising with... a race of lithe, energetic bee-people who leak sexy sugar from every tip on their body.”</i>");

output("\n\nThe crowd murmurs, sniggers and giggles. You can already tell this is a potential vote-winner.");

output("\n\n<i>“Having fetching, colorful star-people wandering the forest, getting lost, getting stuck in things is - enjoyable, I grant you that,”</i> says Quinn, hand trailing over her puffed-out chestplate.");

output("\n\n<i>“Then don’t attack them! Encourage more of the enjoyable type to come,”</i> you press. <i>“You can be the leader who stopped the wanderers for good. Or you can be the leader who opened your race’s arms to a whole galaxy of love.”</i>");

output("\n\nQuinn says nothing in response, but her golden eyes shine.");

output("\n\nPower");

output("\n\nTooltip: What if you promised her a platform to unite all of the zil under her?");

output("\n\n<i>“You could be a great leader of zil,”</i> you say. <i>“Many of your people under your wise leadership. But as long as you are in control of a single tribe, with the same weapons and tools as any of the rest, that can never be. The star-people landing near to you is a great opportunity - to trade honey for the means to unite all of the zil under your leadership.”</i>");

output("\n\n<i>“And then, once you’ve ground them under your heel,”</i> groans Lah in doom-laden tones, <i>“you can make the other tribes build you a great, white palace. And you can put them to work in the gardens. And then you can be attacked by- <i>“");

output("\n\n<i>“Interesting thought,”</i> says Quinn, motioning for him to be quiet. <i>“So tell me - do you star-people know the language of the zil who live in the fungal swamps, far to the east?”</i>");

output("\n\nYou have to shrug blankly to this.");

output("\n\n<i>“Do they know the ways and desires of the wailing tribes who defend their hilltops so savagely to the near south? Could they tell us the first thing about the white zil of legend told, who supposedly inhabit lands so far to the north the ground is as hard as ironwood and the sun never sets? No, I think not.”</i> Quinn shifts on her seat, looking at you cannily. <i>“Unity. That is what you call putting weapons in our hands and telling us to march upon our brethren, whom in your ignorance you believe to be exactly like us. No, star-person. Try again.”</i>");


output("\n\nPC Fails");

output("\n\nA gesture from Quinn signals the end of your entreatment.");

output("\n\n<i>“I have listened to the land-stealer champion’s words,”</i> she says, projecting her clear, sonorous voice so all present can hear it. <i>“Having considered them, I believe the word-wolf’s truths to be deeper. He foresaw many of the things land-stealers would say in their defence, and told us of them. The attacks shall continue.”</i>");

output("\n\nThe zil cheer fiercely, clashing their weapons together in syncopation, a primitive gun salute that goes rolling out over the plateau. It’s almost enough to drown out Lah’s ragged sigh of relief.");

output("\n\n<i>“What about the land-stealer champion [pc.him]self?”</i> growls Kane, once the din has died down.");

output("\n\n<i>“[pc.he] followed our ways and behaved honorably, even if [pc.his] arguments rang false in the end,”</i> Quinn replies, gazing at you serenely. <i>“As long as [pc.he] accepts my judgment [pc.he] can go, and visit us again if [pc.he] chooses.”</i>");

output("\n\n[Accept] [Insist]");

output("\n\nAccept");

output("\n\nTooltip: Accept Quinn’s judgment. Let Lah go.");

output("\n\n<i>“Fine,”</i> you sigh. <i>“Attack the plantation all you want. Not gonna start another fight over it.”</i>");

output("\n\nQuinn smiles at you broadly, and there’s a hum of appreciation for the land-stealer champion’s tact amongst the ranks. Lah strides back to his place next to the leader’s throne, {limping only slightly} / {his boner having dissipated enough for him to do so}.");

output("\n\n<i>“You have heard the land-stealers speak for themselves,”</i> he exults to the crowd. <i>“And you know now they are nothing-words, falsehoods I told you they would mouth! Carry that in your hearts, when we set out to destroy their seat of power for good!”</i>");

output("\n\n<i>“Let’s do it now, whilst their champion is away!”</i> shouts one, waving her torch.");

output("\n\n<i>“Yes! Burn the far shist’s palace down! Carry the truth to them!”</i> the cry goes up.");

output("\n\n<i>“I... we should wait until - but no, yes! We shall do it now!”</i> bays Lah, fire in his pale eyes. <i>“Before they even know their time is up!”</i> He grins at you wildly, and then is gone, striding towards the ramp, at the head of an excited mob of zil.");

output("\n\n<i>“What an interesting star-person you are,”</i> says Quinn, continuing to gaze at you appraisingly once they have disappeared towards the waterfall. <i>“You defeat the cliffs and our prophet singlehandedly, and yet in the end you submit to the will of Quinn. A strong, fair, obedient warrior. I have not encountered any other star-people like that.”</i> She idly traces a finger up her bare inner thigh, a small smile on her pointed, delicate face. <i>“It pleases me a great deal that you are a subject of mine. Will you tell me a little more about yourself? Perhaps you can shed light on where the far shists come from? I must admit, the word-wolf is very confusing on this matter.”</i>");

output("\n\n[Talk] [Appearance] [Leave]");

output("\n\nInsist");

output("\n\nTooltip: You’re taking Lah back, whether they like it or not.");

output("\n\n<i>“Sorry lady, that isn’t going to happen,”</i> you say, meaningfully reaching for your [pc.weapon]. <i>“Lah is coming with me.”</i>");

output("\n\n<i>“That’s a shame,”</i> replies Quinn coolly. <i>“I had formed quite a high opinion of you. But it turns out the word-wolf was right about another thing - you follow your orders mindlessly. And so you must die.”</i>");

output("\n\nThe angry hum becomes an all-encompassing drone as the tribe of zil descend upon you.");

output("\n\n//Go to Zil Tribe fight");

output("\n\nPC Succeeds");

output("\n\nA gesture from Quinn signals the end of your entreatment.");

output("\n\n<i>“I have listened to the land-stealer champion,”</i> she says, projecting her clear, sonorous voice so all present can hear it. <i>“Having considered... I believe there is merit to what [pc.he] says. [pc.he] has presented unexpected words that have the ring of truth to them, widening my understanding. We shall relent, and seek alliance with the star-people of Esbeth.”</i>");

output("\n\n<i>“No!”</i> howls Lah, over the murmurings of the crowd. <i>“You don’t understand, the attacks have to continue! You’ve only got a limited opportunity before- <i>“");

output("\n\n<i>“I </i>understand<i> that you lied to me,”</i> Quinn interrupts sharply, <i>“in order to ‘make things easier’. I think that’s the greatest truth you have spoken recently.”</i> She waves dismissively. <i>“Take him away if you wish, champion. I have no further use for him.”</i>");

output("\n\nThe lanky ausar slumps in the dirt, head bowed and clutching the sand, utterly broken.");

output("\n\n[Take Him] [Let Him Go]");

output("\n\nLet Him Go");

output("\n\nTooltip: Relent and let the doggie go.");

output("\n\nLooking at the former prophet slumped in the dirt, you realise you don’t really have the stomach to drag him back to the Plantation.");

output("\n\n<i>“Go on, get out of here,”</i> you say gruffly, catching Lah’s eye. <i>“I’m not taking you back to Darnock.”</i>");

output("\n\n<i>“I- really?”</i> says the ausar in disbelief. He awkwardly clambers to his feet, barely daring to look at you or Quinn. <i>“But- what am I going to do?”</i>");

output("\n\n<i>“Don’t care,”</i> you reply. <i>“Get to Esbeth, change your clothes, hitch a lift to another frontier world and never let me see you again, that’s my advice.”</i>");

output("\n\n<i>“Merciful,”</i> Quinn observes, as she watches the ausar hurry off into the jungle. <i>“What are you going to tell the land-stealers?”</i>");

output("\n\nYou were just starting to wonder that yourself.");

output("\n\n// +2 Nice Points");

output("\n\nTake Him");

output("\n\nTooltip: Book him, bois.");

output("\n\nBefore you can even move across to him, two male zil have pounced upon Lah, roughly picked him up and got his thin wrists tied with fibrous rope behind his back. He doesn’t resist; the ausar looks eaten from within. They push him down the ramp, hopefully to somewhere you can pick him up from once you’re finished with Quinn.");

output("\n\n{merge}");

output("\n\nThe zil leader stands up and opens her arms to the crowd.");

output("\n\n<i>“You have heard my judgment,”</i> she says. <i>“Tell the young and old they may return, we are no longer at war - for now. Tomorrow we shall send a delegation to Esbeth, our displeasure with the land-stealers presented alongside our honey. We shall see what they have to say. I am Quinn!”</i>");

output("\n\n<i>“Quinn!”</i> echoes the crowd. Despite your revelation about the provenance of her name, the svelte female zil still seems to be in total control here - maybe because she continues to wield her authority with such icy coolness. The tribe have dispersed towards the waterfall in moments without protest. She smirks at you once they’ve gone.");

output("\n\n<i>“Defeater of the cliffs, champion of the circle, </i>and<i> speaker of great wisdom,”</i> she says. <i>“If this strange scheme of yours works, you will be part of our legends for centuries to come, stranger.”</i> She idly traces a finger up the latex-like armor of her inner thigh; there’s plenty of color left in her cheeks from watching your bout with Lah. <i>“Is there anything else you wish to know of Quinn?”</i>");

output("\n\n[Talk] [Appearance] [Leave]");

output("\n\nLeave");

output("\n\n<i>“I should, uh... <i>“");

output("\n\n<i>“As you wish.”</i> Quinn sighs. She gestures in the direction of the waterfall. <i>“You have easily done enough to be treated as an honored guest in our village. {No wings: Call at the bottom, and a ladder will be provided.} {Wings: I can see you have no need for ladders. My people will not molest you when you fly up here, now that you have defeated the cliffs.}”</i> She takes you in from tip to tail with those heavy-lidded, appraising rings of gold again. <i>“You should visit often. Your Quinn requires much attention, after all.”</i>");

output("\n\nQuinn Initial Texts");

output("\n\nAppearance");

output("\n\nFrom the top of her striped fuzzy hair to the tip of her black boots, the female zil who calls herself Quinn is about 5’8”</i>. She is a bit taller than the zil average, as well as more svelte - underneath the sheer armor of her chest her breasts look to be maybe C cups, and the slimness of her thighs make her gleaming, armored legs look long and rather strict. Still, the presence of a tear-shaped abdomen and complete absence of clothes means she doesn’t stand out much from her fellows in purely physical terms. It’s the sense of control, the sedateness and the manner of someone used to getting their own way which do that.");

output("\n\nHer pale, yellow face is quite round, with arching black eyebrows above her striking, golden-irised eyes; the smiles or frowns that appear on her mouth seem to touch only the barest corners of it. Her frizzy chestnut-and-platinum blonde hair falls freely down to the small of her back, pierced by the two bobbing antennae that all zil share.");

output("\n\n{!fucked: You’d readily assume, going off the rest of her, that underneath that implacable armor Quinn is just as stickily and headily zil as the rest of her female subjects; she certainly doesn’t display it outwardly, though.} {Fucked: Underneath that implacable armor of hers you know that Quinn has the intoxicating, oozing honey cunt common to all female zil, as well as an extremely tight, orange back door between her cute, supple rump.}");


output("\n\nVictory Fucks");

output("\n\n//If herm display choice");

output("\n\nFemale");

output("\n\nDamn right. Endorphins pumping through your veins, honeyed pheromones sinking wet heat into your [pc.groin], all you feel looking down at the defeated zil chieftain is prickly, angry lust. You stare her right in the eye, the image of her ordering your death sparking across your mind’s eye, and begin to briskly tear off your [pc.gear].");

output("\n\n<i>“Let’s see the goods,”</i> you demand. Quinn looks down at last, color peeking out of her pale cheeks as she slowly withdraws the plates across her chest and groin. Her boobs are the supple, beautifully formed handfuls the curve of her breastplate suggested they were, and as for her bare, yellow delta... you inhale deeply, closing your eyes as the smell of sexual honey engulfs you, gathering at the back of your nostrils and throat, blood rising eagerly to your [pc.skin] and [pc.femcum] {slickening your folds} / {dribbling like a sourced stream down your [pc.thigh]}.");

output("\n\nActing now on pure, bestial instinct, you {impatiently divest yourself of your [pc.lowerUndergarment] and} stand over her, {thumping your knees down into the sand either side of her shoulders / layering yourself on top of her collarbone} so that you are facing back down her lithe body, your bare butt towards her head.");

output("\n\n<i>“You know how to lick, don’t you slut?”</i> you growl, splaying [pc.eachVagina] in front of her mouth. <i>“Don’t make me wait.”</i>");

output("\n\n<i>“I don’t- <i>“ splutters Quinn. You feel a vindictive surge of arousal at the hesitancy in her voice. <i>“I mean, not for- <i>“");

output("\n\n<i>“Better learn quick.”</i> You sit down firmly, wet pussy meeting her quivering lips.");

output("\n\nThe zil clutches at your [pc.hips] and her lithe body spasms and writhes in front of you, a fetching display for you whilst she gets her bearings. That she hasn’t deigned to eat muff in far too long is palpable - her tongue slithers frustratingly over your outer labia without penetrating, and she keeps missing your [pc.clit] - but these bee bitches are made for it, and once you’ve ground your puffy, [pc.cuntColor] business into her face impatiently she starts improving. You huff your approval as the long, slick tube of her tongue spears between your lips, finds your [pc.girlCum]-slicked hole and spears into it, flicking at the sensitive innards, working in deeper and deeper. Sincere gratification begins flowing through you, your heavily-aroused sex trembling to the seeking, dragging tip of her tongue.");

output("\n\nYou reward her by shifting your hands down her open front, seizing her small breasts, delighting in their pert firmness as you squeeze them firmly, gripping her erect, black nipples fiercely. Her legs thrash and a muffled squeak is swallowed up by ample amounts of [pc.skinColor] flesh. You raise your [pc.butt] up{, allowing a generous amount of [pc.girlCum] to rain down}, allowing the fallen chieftain to gasp for air.");

output("\n\n<i>“More like that,”</i> you smirk down at her. <i>“And I might even let you go. Understand?”</i>");

output("\n\n<i>“Yes,”</i> mutters Quinn. <i>“I understand you well... far shist.”</i> Resentment underlies fear and meekness on her femcum-slathered face; a truly fitting expression for a wild bitch brought to heel. Deep red lust grips you afresh, and you sit yourself back down firmly on her long, sugar-hungry tongue.");

output("\n\nYour authority imprinted upon her as emphatically as your [pc.butt] is on her face, she reaches into you deeply, making you sigh with sheer delight and reach for your own [pc.nipples], {tweaking} / {fingering} them to intensify the melting pleasure overtaking you. Opening your eyes blissfully you take in Lah, who’s recovered enough to be watching the scene in front of him with an expression of enthralled horror.");

output("\n\n<i>“You never got to sample this sugar, did you mutt?”</i> you ask tauntingly, relishing the high excitement in your own tones. You emphasize your words by thrusting yourself into Quinn’s open mouth at the same time as jabbing your fingers between her legs, coating your fingers in warm honey to her twitches and moans, tongue still curling and coiling at your spread twat. <i>“Mmm... <i>“ you sigh theatrically, as you pass your finger tips over your [pc.tongue]. <i>“Too bad. These zil honeys make for good fucks once you’ve shown them a bit of discipline... <i>“");

output("\n\nThe slack-jawed ausar doesn’t respond - either in a trance, or not recovered from being knocked for six. No matter. It’s enough that he watches as you grip Quinn’s hair, demand that she switch attention to your [pc.clit] and arch your neck to the ecstasy of being licked and flicked to a shaking orgasm. Your clitoris pulses like a strobe-light under the attentions of the wet, sucking tube-tip and your [pc.vagina] seizes up in sympathy, overcome by the fuck-honey singing in your veins and slathered on your taste buds. You reward the hitherto chieftain by clamping your [pc.thighs] around her pretty face and smearing generous amounts of [pc.femcum] all across her face {at the same time as gripping your [pc.nipples] and spurting [pc.milk] down her slim front, your [pc.boobs] caught up in the flexing ecstasy.}");

output("\n\nYou lazily fall on to one side, releasing Quinn so that you can bake in the post-coital bliss. You notice she is noticeably leaking honey from her bare cunt when she scrambles to her feet. That’s too bad - she’ll have to go into the jungle and find release there, hopefully remembering the taste of your pussy as she does so. She looks at you purse-mouthed, tense and uncertain.");

output("\n\n<i>“Go on, get out of here Princess Rugmunch,”</i> you smirk, reaching over and slapping her on the ass, drawing another enjoyable squeak out of her. <i>“Before I think about sticking a collar on you and employing you full-time.”</i>");

output("\n\nYou watch her jouncing abdomen and pert behind disappear into the jungle before going back across to Lah and gruffly hauling him to his feet. <b>Better take this stray back to the pound and claim your reward.</b>");

output("\n\n// -1 Nice Points");

output("\n\nMale");

output("\n\n//Needs not gigantic-sized cock");

output("\n\nDamn right. Endorphins pumping through your veins, honeyed pheromones sinking hard heat into your [pc.groin], all you feel looking down at the defeated zil chieftain is prickly, angry lust. Staring her right in the eye, the image of her ordering your death redolent across your mind’s eye, you begin to briskly tear off your [pc.gear].");

output("\n\n<i>“Let’s see the goods,”</i> you demand. Quinn looks down at last, color peeking out of her pale cheeks as she slowly withdraws the plates across her chest and groin. Her breasts are the supple, beautifully formed handfuls the curve of her breastplate suggested they were, and as for her bare, yellow delta... you inhale deeply, closing your eyes as the smell of sexual honey engulfs you, gathering at the back of your nostrils and throat, blood rising eagerly to your [pc.skin] and surging down the shaft of your [pc.cock], becoming almost unbearably erect.");

output("\n\nYou are acting on pure, bestial instinct as you fix one hand to the zil’s slim thigh and flip her over, forcing her to get on chitin-clad hands and knees and present her pert rump and the neat, intoxicating lips of her sex to you. There’s no need for words - you can demonstrate who’s in charge here and what she’s good for where you’re concerned with actions alone. And is this not how the zil settle their disputes, after all? A good, hard fuck administered to the one proven to be the weakest. Lust practically forming on your [pc.lips], you push your [pc.cockHead] against Quinn’s prim labia and open her up, sliding your shaft into her, gripping her bulbous abdomen and the spare softness of her tit to keep her still.");

output("\n\nShe grips handfuls of sand and hisses through clenched teeth, twitching and clenching up around you as you glove more and more of your [pc.cock] in warm honey, but it’s palpably an act. Zil are used to impromptu rough fucking, and you can feel it for yourself. A few gorgeous dips deep into her cunt has golden arousal slithering freely down your prick, dripping generously down {your [pc.balls]} / {onto the ground} as you find her limit and treating yourself to one pleasure-loaded pump after another, your head swimming with syrupy arousal.");

output("\n\nHer intermittent shudders and clenches only serve to drive you on, your [pc.hips] clapping into her short, yellow backside fervently, groans forced past your [pc.lips] as pleasure coils around the stern flesh of your cock, succulent heat beginning to rise up to boiling point. The cute little gasps and squeaks you’re beginning to draw out of the quivering zil chieftain with each intent thrust are clearly not made from a place of anguish, either.");

output("\n\n<i>“You’re enjoying that, aren’t you Princess?”</i> you growl tauntingly, adjusting your grip so that you can mold your fingers into her breast, rolling your fingers over a small, taut black nipple. <i>“Feels pretty good to be put in your place, doesn’t it?”</i>");

output("\n\n<i>“I do this for my people - far shist brute!”</i> she snaps, head pressed into the sand. You enjoy yourself by angling your [pc.cock] down knowingly, pressing into a sweet spot that makes her throw her striped hair back and flick at the air with her golden tube-tongue insensate, stopping her from continuing her rant for a few long moments. <i>“ - I chose for us to face you - I take the fall for our failure to stop you. If - if I did otherwise, I would not be Quinn!”</i>");

output("\n\n<i>“Uh huh.”</i> You casually swat one of her buttocks, admiring the hand-mark you leave, and laugh as she tightens up around your [pc.cockHead], fresh honey oozes around you and onto the ground. <i>“Totally not because none of your subjects dare give it you the way you love it.”</i> Looking up from her you take in Lah, who’s recovered enough to be watching the scene in front of him with an expression of enthralled horror.");

output("\n\n<i>“Isn’t that right, mutt?”</i> you ask tauntingly, relishing the gloating excitement in your own tones. <i>“You never did get to sample this sugar, did you?”</i> You emphasize your words by thrusting yourself into Quinn’s opened twat roughly, spattering syrup on your naked thighs, hand gripped around her spiky hair. The slack-jawed ausar doesn’t reply - either in a trance, or not recovered from being knocked for six. <i>“Too bad,”</i> you groan theatrically to his non-response, closing your [pc.eyes] as orgasm overwhelms you, ecstasy tightening up your muscles. <i>“These zil honeys make for good fucks once they’re shown a bit of discipline... <i>“");

output("\n\nYour [pc.cock] bulges deep in the gooey, quivering heaven of the zil’s cunt and then releases brilliantly, packing it out with [pc.cum] via heavy, juicy flexes, making you hold and pump into her hard, intent on elongating every whiplash of joy as much as possible. Her gasps and shudders only intensify your gratification, and you tighten her grip, letting her feel your strength and surety, a vice around her softness that spreads and claims her again and again. {Your [pc.cumVisc] seed is soon spurting back around your girth, and you pull out your over-burdened cock and slap it between her buttocks, cannoning [pc.cum] up her back and into her blonde-and-brown hair. She cries out in disgust and anger, but you blot that out by flipping her over and giving her face and petite breasts a heavy creaming from your throbbing, fecund bitch-breaker too.}");

output("\n\nAt last you lazily fall on to one side, releasing your hands from Quinn so that you can lie back and bake in the post-coital bliss. A delightfully obscene mixture of honey and cum is drooling from her bare cunt as she scrambles to her feet. She looks at you purse-mouthed, tense and uncertain.");

output("\n\n<i>“Go on, get out of here Princess Cocksleeve,”</i> you smirk, reaching over and slapping her on the ass, drawing another enjoyable squeak out of her. <i>“Before I think about sticking a collar on you and employing you full-time.”</i>");

output("\n\nYou watch her jouncing abdomen and pert behind disappear into the jungle before going back across to Lah and gruffly hauling him to his feet. <b>Better take this stray back to the pound and claim your reward.</b>");

output("\n\n// -1 Nice Points");

output("\n\nPart 4: Resolutions");

output("\n\nZil Chieftain’s Circle Blurbs");

output("\n\nPC sided with Lah, has not visited Plantation since");

output("\n\nYou are on the small plateau that stands at the head of the zil village. The top of the promontory is flat, sandy and round, surrounded by the fungus-shaped zil homes, and has a circle of stones in the middle. On the opposite side of the natural terrace there is the ornate, trophy-laden chieftain’s chair, upon which Quinn lounges. She arches her eyebrows in response to your gaze.");

output("\n\nThe place is otherwise deserted - Lah and the zil warriors all charged off into the jungle, towards the Plantation.");

output("\n\n[Quinn]");

output("\n\n//Quinn ghosted out until PC visits plantation");

output("\n\nGO Tooltip: Maybe go check on what’s happened at Thare before talking to Quinn again.");

output("\n\nPC sided with Lah, has visited Plantation since");

output("\n\nYou are on the small plateau that stands at the head of the zil village. The top of the promontory is flat, sandy and round, surrounded by the fungus-shaped zil homes, and has a circle of stones in the middle. On the opposite side of the natural terrace there is the ornate, trophy-laden chieftain’s chair, upon which Quinn lounges. She arches her eyebrows in response to your gaze. Stood beside it is RK Lah, who grins wolfishly in turn.");

output("\n\nSeveral small zil children run over at your approach, eager to stare at, ask questions of and most importantly play with the honored star-person guest. The place has a bustle to it; male zil flicker in and out of the air carrying tools, cooking fires are lit, weapons are honed and conversation buzzes. It’s all around the edges, though. Nobody walks through the circle.");

output("\n\n[Quinn] [Lah]");

output("\n\nPC got peaceful resolution");

output("\n\nYou are on the small plateau that stands at the head of the zil village. The top of the promontory is flat, sandy and round, surrounded by the fungus-shaped zil homes, and has a circle of stones in the middle. On the opposite side of the natural terrace there is the ornate, trophy-laden chieftain’s chair, upon which Quinn lounges. She arches her eyebrows in response to your gaze.");

output("\n\nSeveral small zil children run over at your approach, eager to stare at, ask questions of and most importantly play with the honored star-person guest. The place has plenty of bustle; male zil flicker in and out of the air carrying tools, cooking fires are lit, weapons are honed and conversation buzzes. It’s all around the edges, though. Nobody walks through the circle.");

output("\n\n[Quinn]");

output("\n\n//Ghosted out until PC reports back to Darnock");

output("\n\nTooltip: Maybe go back and explain what’s happened at the Plantation before speaking to Quinn again.");

output("\n\nPC got violent resolution");


output("\n\n<24 hours since PC won");

output("\n\nYou are on the small plateau that stands at the head of the zil village. The top of the promontory is flat, sandy and round, surrounded by the fungus-shaped zil homes, and has a circle of stones in the middle, although it’s badly muddled now. On the opposite side of the natural terrace there is an overturned ornate chair.");

output("\n\nSpent torches and broken spears are scattered across the sand like branches after a storm. The place is deserted - although is it the wind that is causing the rustle and whisper in the undergrowth? Perhaps it would be wise not to linger.");

output("\n\n>24 hours since PC won");

output("\n\n//Both squares become wild e.g. random Mhen’ga encounters can now be gotten here.");

output("\n\nYou are on the small plateau that stands at the head of the former zil village. The top of the promontory is flat, sandy and round, surrounded by the fungus-shaped zil homes - although you notice they are beginning to slump into themselves now, like melting ice-cream. The wax probably needs constant maintenance to retain its shape.");

output("\n\nThe chieftain’s chair and various bits of crafted material that were once here have been spirited away. The place could have been deserted for years. Presumably Quinn and the rest of her savage clan are still out there somewhere, although you doubt the female zil is still in charge of them after what happened here.");

output("\n\nPeople calling a place ill-fated seems a lot less laughable when you’re stood alone somewhere like this. There’s no reason to linger.");

output("\n\n[Go Up]");

output("\n\n//Add this option at Waterfall Pool square if PC resolved peacefully or thru Lah. Transports PC to Zil Village square");

output("\n\nTooltip: Or are you interested in practising your rock climbing?");

output("\n\nNo wings: You whistle as loud as you can. A few moments later, a rope ladder tangles and tumbles its way down by the side of the waterfall.");

output("\n\nIt’s a long and slightly unnerving climb up, but the ladder is a serious improvement upon doing it with your hands and [pc.feet] whilst being attacked by zil. The two at the top of the cliff give you a smile as they reel it back in.");

output("\n\n//+20 minutes");

output("\n\nWings: You open your [pc.wings] and leap into the air. You find a warm air current and allow that to do most of the hard work, the waterfall revealing more and more of its grandeur as you climb. Male zil hover threateningly near the top, but they disappear once they see it’s you. You drop out of the sky at the outskirts of the village, tucking your wings away as you do.");

output("\n\n//+10 minutes");

output("\n\n[Go Down]");

output("\n\n//Add this option at Top of the Cliff square if PC resolved peacefully or thru Lah. Transports PC to Waterfall Pool square");

output("\n\nTooltip: Or are you interested in practising your rock climbing?");

output("\n\nNo wings: There’s a bulky, cylindrical object stowed here, like a rolled up fence. When you ask them to, two female zil carry it to the cliff and unroll it over the edge; the rope ladder thumps and clatters its way out of view.");

output("\n\nThe climb down is long and slightly unnerving, but the fibrous rope is strong and it’s a hell of a lot better than doing it with your hands and [pc.feet]. After a short while you are back next to the waterfall pool, and the ladder is being hoisted back out of sight.");

output("\n\nWings: Climbing down? Pshaw! You open your [pc.wings] and hop easily into the gusty air. It’s an ease and a pleasure to glide right back down to the bottom of the waterfall.");

output("\n\nPC Sided With Lah");


output("\n\nNew Jungle/Plantation Square Blurbs");

output("\n\nIRONWOODS AND LICHENS JUNCTION");

output("\n\nIf burntplantation=0");

output("\n\nThe jungle here is marvellously colorful. Hues of verdant green swim between vibrant yellows and lurid reds, shining up from the interwoven lichens in a rainbow of beauteous light. Whenever you press down upon some of it, the light brightens, lighting the way as you go. Ferrous trees as big as buildings rise up to the east, and smaller gray ones to the west cluster so tightly that you cannot go in that direction. There is an obvious track leading east between the looming giants, though: the undergrowth and even some of the trees have been cut back mechanically.");

The bitter smell of wood smoke is coming from somewhere...

output("\n\nIf burntplantation=1");

output("\n\nThe jungle here is marvellously colorful. Hues of verdant green swim between vibrant yellows and lurid reds, shining up from the interwoven lichens in a rainbow of beauteous light. Whenever you press down upon some of it, the light brightens, lighting the way as you go. Ferrous trees as big as buildings rise up to the east, and smaller gray ones to the west cluster so tightly that you cannot go in that direction. There is an track leading east between the looming giants, although it is not as clear cut as it used to be. Forest flora is beginning to creep its way across the sawdust, a steady reclamation in progress.");

output("\n\nPLANTATION APPROACH");

output("\n\nIf burntplantation=0");

output("\n\n{The bright sun of Ara Ara} / {The ghostly light of Mhen’ga’s moons} becomes less and less filtered as you follow the sawdust trail eastwards, the jungle thinning out until it stops, suddenly, at the edge of a huge field.");

output("\n\nVoid, fuck and One, the manor is on fire! Other parts of the plantation are drooling smoke as well, but none quite so dramatically as its gleaming white centrepiece: A filthy cumulonimbus of blooming grey and flickering yellow towers over the plantation, lending the chaotic scene in front of you a pallor of unreality. Male zil flit over the lush fields and females trample across them, furiously battling drones, defense turrets and panicking prisoners in an ugly free-for-all. The nearest turret to you cycles and clicks, fruitlessly attempting to acquire targets that have already gotten past it; the head of the other lolls on its base, sparking and broken.");

output("\n\nFirst: An orange-jumpsuited vulkrim charges past you into the jungle, pitch black eyes wild.");

output("\n\n<i>“They came out of the goddamn walls!”</i> he howls at you. <i>“It’s every fucker for himself!”</i>");

output("\n\nIf burntplantation=1, < 24 hours");

output("\n\nParts of the plantation continue to smoulder, but it does at least look like there isn’t going to be an all-out forest fire anymore. The only signs of movement are a few drones, bobbing hopelessly over the fields, performing logistic checks and preparing repair routines for an administration that has abandoned them. The zil have departed, taking their wounded with them, and you can’t see a single orange jumpsuit in sight. Fled into the jungle? Hunkered down in the dorms? Taken prisoner? Impossible to say.");

output("\n\nIt’s not a place to hang around.");

output("\n\nIf burntplantation=1, > 24 hours");

output("\n\n{The bright sun of Ara Ara} / {The ghostly light of Mhen’ga’s moons} becomes less and less filtered as you follow the sawdust trail eastwards, the jungle thinning out until it stops, suddenly, at the edge of a huge field.");

output("\n\nIf it was quiet before, Thare Plantation is deathly silent now. The once carefully controlled plant species are running wild, the most successful clambering over the white fences and gobbling up the ground of the rest. Although even they, in turn, are doomed; you can already see globules of giant fungus and the sproutlings of ironwood sprinkling where the perimeter once was. Rising above the eerie, ragged fields to the south-east is the blackened carcass of the manor. To the west the alien wilderness encroaches.");

output("\n\nTHARE PLANTATION FIELDS");

output("\n\nFirst: You choke and wheeze as you push towards the heat of the manor inferno. The wind is thankfully running from behind you; you doubt you’d be able to approach otherwise.");

output("\n\nRK Lah is standing by the soot-touched walls, watching the fire go, mouth slightly ajar. He looks over you at you vaguely at your approach, before turning back to it, entranced. Orange flickers in his wide, grey eyes.");

output("\n\n<i>“Did everyone get out?”</i> you shout, over the fire’s roar and the melee in the fields behind you. Lah starts out of his trance, and barks a wry laugh.");

output("\n\n<i>“The warden had a private one-seater jet stowed in one wing. Had a go at giving us the <i>“friends, neighbours”</i> spiel when we broke through the perimeter - arms outstretched, you know - and then booked it to his getaway car the second the fire got going. Can you believe that bastard? I can’t imagine his corporate masters will be particularly glad to receive him back to their bosom.”</i> The ausar folds his thin arms. <i>“But all the staff got out. I made sure of that.”</i>");

output("\n\n<i>“What about Able?”</i> you ask. Lah frowns; his lips form an o. Fire gouts out of an upstairs window.");

output("\n\n<i>“Able,”</i> you shout in his ear. <i>“A zil boy, about so high. He worked for Darnock.”</i>");

output("\n\n<i>“I didn’t see any zil,”</i> he replies. His adam’s apple bobs. <i>“None of ours went into the house.”</i>");

output("\n\nYou both watch silently as the roof thunderously caves in, throwing up a blizzard of sparks.");

output("\n\n<i>“Cheer up, friend,”</i> Lah says bracingly, once the noise has died down. <i>“I know this - it all looks a bit ugly now, but it was necessary. Somebody stood up for the little guy! No mega-conglomerate in the galaxy is going to touch Mhen’ga with a twelve foot volgar-pole now. The zil, and the naleen, and the vanae - they can continue to live their innocent lives in peace. The land will remain as it has - has always been: a paradise that anyone can partake of and enjoy. Because the corporate fascists’ own instrument of oppression turned against them. [pc.He] was willing to stop, listen and realize what was right.”</i>");

output("\n\nHe claps you on the shoulder, and with one last lingering look at the burning ruins, heads towards the fields.");

output("\n\n<i>“I’m going to go reign the zil warriors in. There’s no need - no need for more violence. Particularly not against my old chain gang mates, hahaha! I am sure the chieftain has already said it, but you will be forever welcome in our village. As their, ah, their word-wolf, you can be assured of that.”</i>");

output("\n\nYou are left with your own thoughts at the former plantation’s gates.");

output("\n\n[Leave]");

output("\n\n//Set burntplantation to 1, +10k experience points or whatever’s suitable");

output("\n\nIf burntplantation=1, < 24 hours");

output("\n\nBeyond the brass gates, the gutted manor house continues to smoulder fitfully. The fire has mostly run its course now the roof has fallen in, but flames continue to lap at the base and the heat and acrid smoke is overpowering. There must have been a lot of old fashioned wood and plant material inside, for a building mostly made of synthetic marble and ceramic to go up so enthusiastically. Or perhaps a dedicated arsonist like Lah knows a trick or two.");

output("\n\nThe building was thankfully set away from any trees, so it doesn’t look like the fire isn’t going to spread. The lawn, drive and garden remain surreally flawless.");

output("\n\nIf burntplantation=1, >24 hours");

output("\n\nSoot may blacken the walls, but the closed gate, buzzer and brass plaque remain. <i>“THARE PLANTATION. A Snugglé enterprise”</i>. Beyond it looms the blackened rib cage of the burnt manor house, silent and cold. Native flora is beginning to enthusiastically colonize the once immaculate lawn in front of it.");

output("\n\nOver to the east are the low-lying buildings that once functioned as the inmates’ dormitories. They look relatively untouched by fire; who knows what calls them home now. Probably better not to find out.");

output("\n\n[Lah]");

output("\n\n//Option appears in Chieftain Circle square if burntplantation=1");

output("\n\nTooltip: The ausar activist’s angry agitation appears adequately abated.");

output("\n\n<i>“It is good to see you return, honored friend!”</i> Lah leaps down from his place by Quinn’s side and shakes your hand vigorously. <i>“Seriously, it’s nice to talk to - talk to someone from the outside world,”</i> he goes on in lower tones. <i>“And for the zil to see starwalkers walking amongst them in peace. What’s - what’s going on? At Esbeth? On the frontier?”</i>");

output("\n\nYou give him what fragments of gossip you have, which is hungrily devoured by craning furry ears and wide, grey eyes.");

output("\n\n<i>“So no U.G.C. intervention seems planned? That is good news, at least. What can I tell you about?”</i>");

output("\n\n[Escape] [The Zil] [Future]");

output("\n\nEscape");

output("\n\nTooltip: Ask him how he jumped the fence at Thare.");

output("\n\n<i>“How exactly did you get out of the plantation and wind up here?”</i> you ask. <i>“Darnock seemed pretty surprised that anyone managed it.”</i>");

output("\n\n<i>“A few others did it,”</i> replies Lah, strolling slowly around the plateau with you, hands behind back. <i>“You saw yourself they didn’t have walls, just turrets. So if you were willing to risk getting a stun bolt between your shoulderblades - and let me tell you, those things sting fierce for days afterwards - you could always try leaping into the jungle if your group got assigned to the perimeter fields. But if you managed to evade the turrets and the drones, what were you going to do then?”</i>");

output("\n\nLah barks with dry laughter, gazing out over the huts and trees to the south west.");

output("\n\n<i>“I remember one kaithrit in my work group - smuggler. Grew up on a jungle world, said Mhen’ga was pussy shit, in her words. Got away in the first week, sprained her ankle doing it, spent a day limping her way to Esbeth, fighting off naleen and worse on the way. What’s waiting for her at the entrance? Their police officer, a riot-mech and a cab back to the plantation. Snugglé know exactly where you’re going to go, because what else are you going to do? Let the tentacle women enslave you?”</i>");

output("\n\nHe rubs his chin, pale eyes lowering to the bustle of the zil village.");

output("\n\n<i>“So I always knew that if I were going to get out, it would be </i>out<i>. Permanently. I had my beliefs and my education, and that stood me apart from the other prisoners - lowlives and sad-stories mostly, struggled to see beyond their own noses. I knew about Snugglé’s practices, I knew if they were using prison labor it had to be because the natives were restless. It was just a case of connecting up with them. The other prisoners laughed and cheered when I ran for it the first time I got put on the far fields, like they always did. A bit of entertainment to break up the backbreaking monotony of life on that fucking plantation.”</i> Lah’s wiry shoulders rise and fall. <i>“I am so glad you didn’t try and take me back there. I am so glad I will never see any of them again.”</i>");

output("\n\nThe Zil");

output("\n\nTooltip: Ask him how he hooked up with this tribe of zil.");

output("\n\n<i>“Pretty amazing accomplishment,”</i> you muse. <i>“An alien criminal, not only being welcomed in by zil, but anointed their prophet.”</i>");

output("\n\n<i>“It was all - luck,”</i> mutters Lah, ears lowering and cheeks burning. <i>“One thing just fell on top of the other. If I - if I’d planned any of it, I’d never have set myself up as their ‘word-wolf’. I wouldn’t have started this ridiculous ‘Quinn’ thing. It’s totally against what I - how we should interact with natives.");

output("\n\n<i>“But there’s no meticulous plan when you’re running through an alien jungle, getting steadily more dehydrated and spooked. The first zil I ran into, I asked her to take me to her leader. And after we - after certain relationships were established - that’s exactly what she did.”</i>");

output("\n\nLah sighs in exasperation, rubbing his face and ears.");

output("\n\n<i>“Look, I didn’t know how zil babies were made at the time, alright? I didn’t </i>ask<i> to be sent to Mhen’ga. And I just assumed, once I saw the leader was female, that - it was an honest mistake, alright? But she took to being called Quinn like I’d crowned her myself. They seem to think the star-people language has actual power, that they can use it against their oppressors as a weapon. And because I could explain why Snugglé had taken their land away from them, and could show them how to get back at them - as I said. One thing just fell on top of the other.”</i> He flourishes his hands wryly, plucks at his fur cape. <i>“And now this is me. The word-wolf, sayer of truths. Sometimes you don’t get to choose your own destiny.”</i>");

output("\n\nFuture");

output("\n\nTooltip: Ask what he plans to do with the zil.");

output("\n\n<i>“So what’s the plan from here on in?”</i> you ask. <i>“Can these zil go back to farming the plantation land?”</i>");

output("\n\n<i>“Oh no,”</i> says Lah, shaking his head furiously. <i>“No no no. We all need to lie very low for a time, let things settle, see what Snugglé and their U.G.C. lapdogs decide to do next. In fact it may even be wise to relocate, not give them any potential targets at all. I’ve had trouble explaining this to the zil - they think the battle is won, they’re eager to reclaim it before another tribe does. But they do listen. I have been proven right about everything else, after all.”</i>");

output("\n\nThe ausar sits down, rubbing his hands rhythmically, eyes slightly glassy.");

output("\n\n<i>“My expectation is that they will step off. There’s plenty of other planets out there that can be terraformed and exploited after all, no need to waste money on one that’s stood up to them and destroyed their property. Property, right? It’s the most important thing - the key to really hitting capitalist pigs where it hurts. After that - <i>“ Lah smiles. <i>“ - I’ve got friends out there. Friends who will be very interested to hear about an independent paradise like this. Once we’ve got dozens  of like-minded souls here - that’s when we can really start making things happen. We can build something different. Something of mutual benefit, to natives and outsiders in need alike.”</i>");

output("\n\nPC Takes Lah Back");

output("\n\nFirst time PC goes to Zil Village Outskirts square after finishing with Quinn and deciding to take Lah back in Peaceful resolution: The two male zil wordlessly hustle RK Lah over to you as you step down the ramp, his thin wrists bound. Time to take the defeated ausar back to the Plantation, you guess.");

output("\n\n//”</i>RK Lah”</i> appears in Key Items if PC picks him up either here or through the violent resolution");

output("\n\nTooltip: You have the ausar eco warrior plodding along in front of you, hands bound. He looks thoroughly fed up.");

output("\n\n[Talk]");

output("\n\n<i>“Don’t,”</i> snaps Lah, voice almost breaking with loathing, when you attempt to strike up conversation. <i>“Take me back to Snugglé. Take me anywhere, so long as it’s away from you.”</i>");

output("\n\nPC attempts to take him to Esbeth");

output("\n\nLah gets increasingly restless the further you go west, tendons tensing in his arms and neck, and as soon as the white buildings of Esbeth hove into view he throws himself to the ground.");

output("\n\n<i>“No, you fucker!”</i> he howls, writhing out of your grip when you try to pull him back to his feet. <i>“You aren’t selling me into slavery or to some organ harvester! I’d sooner die out here!”</i>");

output("\n\nHe is possessed with an almost rabid energy, and nothing you do can persuade him to carry on in that direction. <b>Looks like you’ll have to take him back to Thare Plantation first if you want to leave the Mheng’an jungle.</b>");

output("\n\nPC gets hit by random mob whilst Lah is in inventory");

output("\n\n//Suffix to bottom of first combat text, does not appear subsequently");

output("\n\nLah leans against a tree and watches you fight your opponent with hollow-eyed antipathy. He could probably make a break for it now - but it’s as if all the fight and will has been cored out of him.");


output("\n\nPC [Enter]s Manor with Lah");

output("\n\nAble buzzes out of the air and opens the gate for you. His tar black eyes flick from you to the fugitive ausar, his slender face full of questions - but he doesn’t ask them.");

output("\n\n<i>“Sir is waiting for you.”</i>");

output("\n\nThat he is. Darnock stands on the steps of the manor, a proud beam splitting his face, and opens his arms wide as you come up the driveway, Lah in front of you.");

output("\n\n<i>“My dear [pc.boy],”</i> the old human exults. <i>“I knew I had placed my faith wisely when I put you in charge of this little matter. Well done, ah, well done indeed!”</i>");

output("\n\nStill smiling, he ambles down to take the ausar in, doing a full circuit before looking him in the eye.");

output("\n\n<i>“It is such a relief to see a prodigal returning to the flock whole and unscarred,”</i> Darnock says, with a kind of grave affableness. <i>“Do you have anything to say, Remi? Words of wisdom? One of your, aha, impassioned denunciations? Is it too much to hope... a chastened apology?”</i>");

output("\n\nLah spits in his face.");

output("\n\n<i>“Be that as it may,”</i> Darnock continues, reaching for his handkerchief, <i>“I am glad that you are back. Redemption is achievable by anyone - and one day, that intelligence and energy of yours shall be turned to better purposes. We shall be certain of it.”</i>");

output("\n\nHe motions, and two security droids lumber over to haul Lah away. Darnock leads you into his dining room.");

output("\n\n<i>“First thing’s first,”</i> he puffs, settling himself down in his favourite armchair and swiping up a holo-screen. Your codex chirrups. <i>“22,000 credits. Easily what I’d pay a PMC to do the job you just did, but nowhere near as neatly.”</i> He points at a blank stretch of wall, and satellite footage of the zil settlement is beamed there.");

output("\n\nViolent resolution: <i>“Looks like there was quite the scuffle there,”</i> he observes. <i>“Do you have any idea how our friend Remi managed to persuade them to defend him so zealously?”</i>");

output("\n\nYou explain how Lah had set himself up as a quasi-prophet, and that you had to drive the zil off in order to retrieve him.");

output("\n\n<i>“Captivating stuff!”</i> declares Darnock, eyes and teeth flashing. <i>“This will make fine material for your autobiography one day Steele - keep seeking out swashbuckling adventures like this and you’ll even overshadow your dear old dad!”</i>");

output("\n\nPeaceful resolution: <i>“Things are looking remarkably peachy up there,”</i> he remarks. <i>“How did you ever manage to nab our friend Remi away from them?”</i>");

output("\n\nYou explain that you were able to talk the zil down, that they handed Lah over of their own accord, and that they shouldn’t be a problem in the future.");

output("\n\n<i>“Hmm.”</i> Darnock strokes his chin and eyes you beadily. <i>“Slightly naive of you, I’m afraid. The lesson they shall carry away from this is that they can wage war against us without any repercussion. It really does do to be </i>firm<i> with natives in situations like this. Still!”</i> He raps the desk firmly. <i>“It would be exceedingly ungracious of me to browbeat an honest attempt to resolve matters peacefully.”</i>");

output("\n\n[pb]");

output("\n\nThe white-haired warden ushers the satellite footage away and strolls over to the veranda.");

output("\n\n<i>“Of course, the real rewards for your actions today are out there - waiting to be reaped,”</i> he says with a happy sigh, gazing out over the fields. <i>“The inspection shall be a success, of that I am sure, and Mhen’ga will take one small step on the path towards prosperity and civilization.”</i> He looks over at you mistily. <i>“Do stop in again, in due course. We will be trialing some of the most successful fruit and vegetable hybrids we have so far manufactured, plants with truly incredible properties. I want you to be one of the first to try them. Until then - why don’t you take a well-deserved rest? The guest bedroom, and Able, stand ready.”</i>");

output("\n\n+10k experience points or whatever’s suitable");

output("\n\n[Rest] [Finish]");

output("\n\nFinish");

output("\n\nTooltip: Time to hit the road.");

output("\n\nYou make your excuses.");

output("\n\n<i>“Of course! Of course,”</i> sighs the old human. <i>“Just like your father, you must hare off into the great unknown at the first opportunity. Until next time, heroic [pc.name] Steele!”</i>");

output("\n\n//Move PC to Thare Plantation square");


output("\n\nRest");

output("\n\n//If PC didn’t talk to him before quest, go to default");

output("\n\nTooltip: Let Able show you to a room.");

output("\n\nYou follow a supple, white-clad rump, a pair of wings the size of hoverboards and the scent of deep honey back out into the marble hall and up a grand staircase. Able leads you into a plush guest room, heavy on dark wood and lace. A large, claw-footed tub catches your eye in the adjoining washroom. Insects dance beyond the tall duraflex windows.");

output("\n\nViolent resolution: <i>“I know,”</i> he says stonily, before you can speak. <i>“I was listening.”</i> He looks at the carpet, scuffs at it with his boot. <i>“It was stupid of me to think you could reason with my chieftain. There’s just too much for them to understand, and they’d been letting the ausar fill their minds with his anger for too long. In the end... in the end, they were in the wrong. We must learn from the star-walkers, not drive them away. Perhaps it had to be this way.”</i> He lets out a shuddering sigh. <i>“ ...Would you like a bath? Or something else?”</i>");

output("\n\nPeaceful resolution: <i>“Thank you so much for talking my chieftain down and not shooting my brothers and sisters,”</i> he whispers, the moment he closes the door. He hovers a bit, unsure of himself, and then abandons decorum to hug you tightly around the midriff. <i>“I was so worried about them... and about you. I thought all sorts of terrible things - that they’d kill you, or come back and do something awful like set the fields on fire - but you solved everything. You’re amazing.”</i> The slender zil looks {up / down} at you, tar-pit eyes shining with hero worship. <i>“There must be something I can do for you. A bath? {My behind / A lick}? Anything.”</i>");

output("\n\n[Appearance] [Bath] [Fuck] [Sleep]");

output("\n\nPC Does Not Take Lah Back");

output("\n\nAble buzzes out of the air and opens the gate for you. His tar black eyes flicker over you, his slender face full of questions - but he doesn’t ask them.");

output("\n\n<i>“Sir is waiting for you.”</i>");

output("\n\nThat he is. Darnock stands on the manor steps, watching you approach up the gravel drive with a quizzical, searching expression.");

output("\n\n<i>“Steele! You return. In one piece - which is excellent to see - but also, I note, empty-handed. May I ask what has happened to our erstwhile escapee?”</i>");

output("\n\nYou go inside to his dining room and wait for him to settle in his chair before giving a debriefing. The old human plays with a pen, humourless smile frozen on his lips as you explain that you settled matters with the zil, and they agreed to stop attacking the plantation - but that Lah himself escaped into the jungle before you could nab him.");

output("\n\n<i>“A fine tale, one which I’m sure will garner you much acclaim once the celebrity sites get ahold of it,”</i> he says at last, tapping the pen on his desk. <i>“{Delightful Miss} / {Dashing Sir} Steele melts the heart of the sultry alien princess and solves the stand-off through wit and chivalry - alas, the fiery rabble rouser slips through [pc.his] grasp. To appear dramatically in a later installment, perhaps! However. Allow me to apply a less rosy gloss to this.”</i>");

output("\n\nDarnock gets up and walks slowly over to the veranda, arms behind his back.");

output("\n\n<i>“I have nothing but your word that this illiterate zil leader - whom by your own admission has zero respect for our values - will call off the attacks. Lah is still at large, perhaps poised to wreak more havoc. Or attempt a hijack on some unfortunate tourist in Esbeth, who knows? And I now must explain to the Snugglé inspector why I am one prisoner short. In sum: this has been an almost complete failure. I cannot in good faith reward you for it.”</i>");

output("\n\nHe favors you with that wintry smile.");

output("\n\n<i>“Let this be an important lesson, my touchingly naive young charge - what makes the best sounding story is not necessarily the best outcome, for you or anyone. Still! If - <b>if</b> - these zil do indeed desist their attacks, and Lah is smart enough not to lay low in the interim, then you should stop by again. If we are allowed to, we shall be trialing some of the most successful fruit and vegetable hybrids we have so far manufactured, plants with truly incredible properties. I want you to be one of the first to try them. Because I am a soft old fool at heart.”</i>");

output("\n\nHe collapses back into his chair with a weary sigh and flicks a holo-display up into existence in front of him.");

output("\n\n<i>“Now do run along, have Able see to you if you have any other needs. I must see about hiring some </i>actual<i> professionals now.”</i>");

output("\n\n//+10k experience points or whatever’s suitable");

output("\n\n[Rest] [Finish]");

output("\n\nRest");

output("\n\nYou follow a supple, white-clad rump, a pair of wings the size of hoverboards and the scent of deep honey back out into the marble hall and up a grand staircase. Able leads you into a plush guest room, heavy on dark wood and lace. A large, claw-footed tub catches your eye in the adjoining washroom. Insects dance beyond the tall duraflex windows.");

output("\n\n<i>“Thank you so much for talking my chieftain down and not shooting my brothers and sisters,”</i> he whispers, the moment he closes the door. He hovers a bit, unsure of himself, and then abandons decorum to hug you tightly around the midriff. <i>“I was so worried about them... and about you. I thought all sorts of terrible things - that they’d kill you, or come back and do something awful like set the house on fire - but you solved everything. You’re amazing.”</i> The slender zil looks {up / down} at you, tar-pit eyes shining with hero worship. <i>“There must be something I can do for you. A bath? {My behind / A lick}? Anything.”</i>");

output("\n\n[Appearance] [Bath] [Fuck] [Sleep]");

output("\n\nSelling the Ancestor Stone");

output("\n\n//Suggestions for other buyers gladly taken");

output("\n\nTooltip: A polished, rugby ball-sized hunk of semi-opaque, brown-red stone, rather like carnelian. Do the spidery, sooty figures and zil lettering painted onto it add to or detract from its value?");

output("\n\nArtie");

output("\n\nTooltip: The <i>“spiritual value”</i> of this thing must be off the charts, surely.");

output("\n\n<i>“My goodness.”</i> Artie’s smirk melts off his face when you plonk the Ancestor Stone down in front of his diode. <i>“Where on Mhen’ga did you come by this, child?”</i>");

output("\n\n{Kind: <i>“As a result of an unfortunate disagreement.} / {MIsc: <i>“It fell off the back of a spaceship.} / {Hard: <i>“Never you mind.} What can you give me for it?”</i>");

output("\n\n<i>“I- wouldn’t like to- <i>“ the bald human splutters. He seems entranced by it; he stretches his hand out and, when you don’t pull it away, carefully strokes it, tracing one of the long, lithe figures with two fingers. <i>“This belongs in a museum. A chance to meditate upon it first though... what a privilege... ”</i> He looks up at you. <i>“Mine is a humble operation {Master / Miss} Steele, you may have noticed. But a finder’s fee seems appropriate - how does 5000 credits sound?”</i>");

output("\n\n[Yes] [No]");

output("\n\nYes");

output("\n\nArtie taps at his aged desk-mounted computer, and a few seconds later your bank balance is updated.");

output("\n\n<i>“We shall be bringing the incense out tonight,”</i> he smiles happily, gazing down at the red gemstone. <i>“Thank you for this, young traveller!”</i>");

output("\n\nColenso");

output("\n\nTooltip: Perhaps the gabilani will give you a good price for it.");

output("\n\n<i>“Crumbs.”</i> Colenso stares at the polished, red-brown oval you’ve laid carefully down on his counter. <i>“So what’s this when it’s home?”</i>");

output("\n\nYou explain that it is an alien treasure. Very prestigious. Who knows what ancient secrets are to be fathomed from its black, arching sigils?");

output("\n\n<i>“Hmm.”</i> Colenso eyes you with a sly grin. <i>“Any particular reason why you aren’t selling it on its own world? Ah, no worries mate! Don’t need to make a peep. I’m happy to be your no-questions-asked when you’ve got some hot goods you need to be rid of. But there’s got to be a little consideration when the filth might be interested, eh? So I’ll give you 6k for it.”</i>");

output("\n\n[Yes] [No]");

output("\n\nYes");

output("\n\nColenso rolls his seat over to one of his screens, and a few seconds later your codex beeps as your bank balance is updated.");

output("\n\n<i>“Not really my thing, precious stones, primitive calligraphy ‘n that,”</i> he admits as he stows the zils’ trophy beneath the counter, <i>“but I do know a few people. Be interesting to see how many precursor theories it backs up.”</i>");

output("\n\nEsbeth Reworked Texts");


output("\n\n//Add after 24 hours have passed since peaceful resolution.");

output("\n\nBurt");

output("\n\nGreet spread");

output("\n\n<i>“Hey [pc.name]!”</i> A grinning Burt strides over to you when you prop yourself up at the bar. <i>“Here to try my new mead cask? Triple filtered, and made from only the finest zil produce!”</i> He gestures at several new draught fonts arrayed behind the counter.");

output("\n\n[Shop]");

output("\n\n<i>“Oh no, I don’t really need any of that type of stuff from you anymore.”</i> The big human drums his fingers on the counter with an air of cheery industry. <i>“A tribe of zil are selling honey, their plates, anything they’re willing to give directly to us now. Barter, anyway - they got a real thing against credits for some reason. But it’s great! I’ve got vats of different honeys fermenting in the back now, people back in the core interested in the samples I’ve been sending out. I think we could really make a go of things here now!”</i>");

output("\n\n[Zil]");

output("\n\n<i>“So you’re doing business with the zil now?”</i> you ask.");

output("\n\n<i>“Yeah! This gaggle of ‘em came in from the jungle, wouldn’t leave until they got to talk to Penny and the wobbly U.G.C. gal,”</i> Burt explains, leaning on the bar. <i>“This tribe of ‘em decided they want to trade with us, all of a sudden, and I for one am not saying no to ‘em. What they want is really simple stuff - basic medicine, fabrics, building material - and what they’re selling, well, you can’t get it anywhere else in the galaxy.”</i> He kisses his fingers effusively. <i>“These are golden days, [pc.name]. Golden. Now I’ve got a surplus to work with, I can really start to think about all the things that might be done with that honey, cuz you know it’s amazing stuff. Not just mead, but perfume... therapeutic massages... aphrodisiac... once I send it off to a lab and know all of its properties... <i>“");

output("\n\n<i>“But they want more than clothes, don’t they?”</i> you interrupt.");

output("\n\n<i>“Oh yeah,”</i> Burt says, sobering. <i>“They reckon those Snugglé folks took their land when they built their big ass farm, way out there. They want them gone, they’ve made that pretty damn clear.”</i> He sighs, knitting his fingers. <i>“Not gonna lie, that’s a tough ask. Snugglé aren’t some two bit operation you can send a few letters to your system delegate about and expect they’ll pack up tomorrow. And plenty of people are going to </i>want<i>  ‘em here, because they mean jobs and security. It’s a tough ask [pc.name], no question about that.");

output("\n\n<i>“But... <i>“ he gestures expansively. <i>“They haven’t really got started on Mhen’ga yet. The U.G.C. rep seems to think there’s a chance we can persuade ‘em to go elsewhere. And if there’s a chance we can make Esbeth a prosperous lil place by itself, rather than as some agri-corp’s soulless space-port, then I’m all for it. I’ll fight for the cute lil bee girls ‘n boys, if there’s a chance!”</i>");

output("\n\nFlahne");

output("\n\n[Zil?]");

output("\n\nTooltip: Ask if she’s talked to Quinn’s people yet.");

output("\n\nYou ask if any zil have been in town recently.");

output("\n\n<i>“Yes!”</i> she squeaks, long ears perking up. <i>“This... I suppose </i>delegation<i> is the only way to describe them, really. Officer Penny brought them up here, and once we got the air conditioning on full blast we had a long talk with them. How did you know about that, [pc.name]?”</i>");

output("\n\nYou briefly describe your confrontation with Quinn’s tribe, how you talked them out of terrorizing Thare Plantation and persuaded them to talk to the people of Esbeth instead. {Nice: You stoically play down your own heroism - not that that dissuades Flahne much.} {Misc: Your account is heavy on the razor-like wit you used to completely destroy RK Lah.} {Hard: You briskly present the story as simple cause and effect; you saw what had to be done, and so did it.} {Bimbo: Your account is heavy on the </i>smell<i> and the </i>cuteness<i> of zil boys and oh Void you just wanna eat them up, though that doesn’t seem to turn Flahne off much.} {Brute: Your account is heavy on how superfine the zil honeys were and just how many of them you laid, though that doesn’t seem to turn Flahne off much.}");

output("\n\n<i>“So we have you to thank for this!”</i> she exclaims, eyes wide. <i>“You made something really remarkable happen, [pc.name]. No natives have ever approached us like that before - making understandable demands, offering peaceful trade and stuff. It’s the first step in the uplifting process we U.G.C. first contact reps are supposed to look out for, and I’m sooooo pleased the zil cuties have taken it!”</i>");

output("\n\nYou ask whether these understandable demands of theirs are achievable.");

output("\n\n<i>“Maybe,”</i> sighs Flahne, expression turning significantly gloomier. <i>“</i>Very<i> maybe. It seems likely that Snugglé will want to expand their operation here, and once they do that, a full scale agri-forming won’t be far behind. If the colonists are overwhelmingly against that - as well as the natives - then they might think twice. But being an independent planet is tough, [pc.name]. If they leave then somebody else is likely to step in, and if they don’t then we’re likely to be harassed by pirates and other meanie heads. Couple of years of that, and even the zil might be begging Snugglé to come back.”</i>");

output("\n\nShe sucks on her current lollipop morosely.");

output("\n\n<i>“I’ve committed myself to looking at ways of getting Snugglé to pack up and go elsewhere, because I love those snugglebugs so much and want to do right by them, but... <i>“ she sighs heavily. <i>“Sometimes I think I’m not cut out for making these kinds of big decisions.”</i>");


output("\n\nPart 5: Quinn Talks and Sex");

output("\n\n[Appearance]");
output("\n\n[Talk]");

output("\n\nFirst");

output("\n\n<i>“Tell me your title first,”</i> Quinn says. <i>“You aren’t stranger or far shist anymore.”</i>");

output("\n\nYou tell her.");

output("\n\n<i>“[pc.name] Steele,”</i> she says, rolling the unfamiliar syllables around her mouth with enjoyment, yellow tube-tongue flicking. <i>“And what does that mean?”</i>");

output("\n\nYou describe your background and your quest - or at least, an edition of them that you think she might understand. The svelte zil listens intently but with a certain amount of glassiness, chin rested in hand.");

output("\n\n<i>“I want to hear more of this,”</i> she interrupts after about thirty seconds, rising from her carved chair. <i>“Particularly about this great prize that will elevate you to being a {Ken / Quinn} of your own people. But the {day} / {night} has been long and tense, and I want sex. You will come with me to my home, [pc.name] Steele. Or you will fetch one of my men, as you wish.”</i>");

output("\n\n//Lust to 30 if <30");

output("\n\n[Sex] [No] [Appearance]");

output("\n\nNo");

output("\n\n<i>“One of the shy ones with round bottoms,”</i> she requests as you politely turn her down. <i>“Those are my favorites.”</i>");

output("\n\n//Move PC to Village square, Chieftain square barred for three hours");

output("\n\nRepeat");

output("\n\n<i>“My {most honored} warrior returns,”</i> the female chieftain says, leant back in her chair, one hand rested on a slim thigh. She favors you with a serene smile. <i>“What does [pc.he] wish of [pc.his] Quinn?”</i>");

output("\n\n[Talk] [Sex] [Appearance] [Leave]");

output("\n\nSex");

output("\n\n//Requires dick < 12”</i> and/or vagina");

output("\n\nFirst");

output("\n\nYou follow her bobbing abdomen and the glossy slink of her legs back behind her throne, to the largest wax yurt-house in the settlement. Behind the hanging colored fabric that acts as its door there is a single room, lit with candles and dominated by a round, wicker bed, heaped with furs.");

output("\n\nPrimitive it may be to your eyes, but you very much doubt there is a more richly decorated dwelling in the village. The roof is hung with carvings, gemstones and feather ornaments; on one wall there is a pale, rubbery pelt with a multitude of dangling tentacles that probably doesn’t bear looking at too closely; and crowning the bed’s head-board, a fearsome, many-toothed skull the size of an exercise ball.");

output("\n\n<i>“My tribe have many trophies,”</i> murmurs Quinn, sliding backwards onto the bed. Her crotch and chest armor is a hushed whisper as it slides back, and the intense, irresistible smell of fem-zil honey fills the close space; between her bare yellow legs is as neat and puffy a vajazzle as you’re ever likely to see. She touches a small, erect black nipple, her eyes pots of liquid gold in the flickering light. <i>“Only the most honored get to see some, though.”</i>");

output("\n\n[Zil on top] [Every hole] [Scizzor]");

output("\n\nRepeat");

output("\n\n<i>“In the mood, are we?”</i> Quinn murmurs. Her golden eyes glint. <i>“It doesn’t do to see {one of my warriors} / {my most honored warrior} unsettled for want of [pc.his] Quinn’s love. Come.”</i>");

output("\n\nYou follow her bobbing abdomen and the glossy slink of her legs back behind her throne, to her large wax home. Behind the hanging colored fabric that acts as its door there is a single room, lit with candles and dominated by a round, wicker bed, heaped with furs.");

output("\n\nThe roof is hung with carvings, gemstones and feather ornaments; on one wall there is a pale, rubbery pelt with a multitude of dangling tentacles that probably shouldn’t be looked at too closely; and crowning the bed’s head-board, a fearsome, many-toothed skull the size of an exercise ball. The space has taken on a sensual, arousing aura for you now; primal, savage intimacy.");

output("\n\n<i>“My tribe have many trophies,”</i> murmurs Quinn, sliding backwards onto the bed. Her crotch and chest armor is a hushed whisper as it slides back, and the intense, irresistible smell of fem-zil fills the close space; between her bare yellow legs is as neat and puffy a vajazzle as you’re ever likely to see. She touches a small, erect black nipple, her eyes pots of liquid gold in the flickering light. <i>“Only the most honored get to see some, though.”</i>");

output("\n\n[Zil on top] [Every hole] [Scizzor]");


output("\n\nEvery Hole");

output("\n\nTooltip: Do her in every possible way, if you’ve got the moxy.");

output("\n\nG Tooltip: You need to be a randy so-and-so with a not unreasonably sized dick for this.");

output("\n\n//Requires <12 inch dick, Libido > 30%");

output("\n\n<i>“I’m going to fuck you senseless in all three holes.”</i>");

output("\n\nThe words just tumble out of you. They aren’t even remotely appropriate, but here, in this warm, secluded space, with the saccharine pheromones pouring off her wasp factory and submerging your senses in honeyed need, the sight of her lithe, athletic body sprawled on the furs in front of you, they just... happen. [pc.eachCock], throbbing {urgently / and straining urgently against your [pc.lowerUndergarment]} {have / has} bypassed your brain entirely. The zil chieftain laughs with delighted condescension, knee waggling up and down. Oh Void, the way she arches her eyebrow... you {step} / {slither} towards the bed reactively.");

output("\n\n<i>“All </i>three<i> of my holes, you say?”</i> she wonders. <i>“But I only have... oh. Like the males sometimes do with each other, you mean?”</i> She touches her petite rump; the yellow flesh trembles ever so slightly underneath thin, gleaming fingertips. <i>“Well, I don’t know... <i>“ She props herself up and drinks you in as you impatiently tear off your [pc.gear]. Her heavy-lidded eyes rest on your [pc.cock], so hotly erect you feel like you could walk through the waterfall and pierce the cliff-side with it. <i>“...I think a warrior would have to prove [pc.him]self VERY spirited if I was going to allow that... <i>“");

output("\n\nThat’s enough. Pulse thudding in your temple, you tumble onto the bed, grip her beneath the knees and winch her legs up, rubbing your [pc.cockHead] over her exposed mound, smearing it in oozing syrup until it catches beneath her lips. Smooth, chitinous legs tighten around your shoulders as you open her hole around you, her breath catching as you sink more and more of your [pc.cock] into a warm, gooey sleeve of bliss.");

output("\n\n//pc.cockChange();");

output("\n\nEvery instinct roars at you to go at the zil like a wild animal, lose yourself in the blood-sugar-hormone buzz, but you exercise all of your self-control to instead slide in and out of the lithe, black and yellow insect queen steadily, holding her close as you find her limit, withdraw and thrust home into gorgeously tight and smooth honey cunt again and again... you want to prove your prowess, and tease those sex-mad instincts of hers out. Black, latex-like calves and feet are soon digging into your back.");

output("\n\n<i>“More... more!”</i> she husks fiercely, wriggling her flat, lissome stomach against yours and gripping your biceps hard enough to pinch. You descend onto her pretty, pert breasts, gripping the black spike of a nipples between your teeth, making her gasp. A slim, athletic pair of hips thrust themselves against your own greedily, honey-lube dripping down your {[pc.balls] / [pc.thighs]. <i>“Gimme more!”</i>");

output("\n\nEach miring of your cock in her syrupy warmth makes the need to draw back and do it again all the more pressing, and you obey the order, vigorously pumping into her. Groans are forced past your lips as she shudders and writhes around you, finally fixing her neat teeth into your shoulder, biting down and thrashing like a frenzied wolverine about your [pc.cock], copious honey spattering across your [pc.belly].");

output("\n\nDespite the dense, overwhelming heat packing every inch of your dick {and swelling your [pc.balls]} you hold yourself back through it all; wait until the zil has calmed down and is simply moaning softly, out-fucked, to every firm thrust of your [pc.hips]. That’s when you grip her close and unload, pulling at her other nipple with your [pc.lips] as you do, sweetness beaming on your [pc.tongue] as you fountain hot [pc.cum] into her with intense, ecstatic clenches. {Knot: The bulb of meat at the bottom of your dick throbs mightily, instinct urging you to push it inside Quinn to make sure not a single drop of cum escapes her - but again, you’re in control. You don’t want to be locked inside her, not yet.} {Big load: She makes a low, buzzing sound of dizzy amazement as your overloaded orgasm goes on and on, plumping out her stomach and splattering richly out of her utterly stuffed cunt, mingling with her honey.} You draw back out, gently releasing her legs and breasts, before you’re even half-done; your oozing, dripping [pc.cock] is still rock hard, your bestial lust barely abated.");

output("\n\n[pb]");

output("\n\n<i>“My word,”</i> husks Quinn, when she catches sight of it. Her striped hair is tussled, her face soft,  open and orange-cheeked. <i>“It still stands to attention after that?”</i> She trails her fingers across {her swollen belly} / {her unfurled, cum-drooling snatch.} <i>“What </i>energetic<i> creatures you star-people are.”</i> She folds her legs to one side and gazes at you coquettishly; you move forward on the bed, and exhale slowly as she wraps her hand around the base of your throbbing, honey-slathered dick.");

output("\n\n<i>“Yes,”</i> she breathes, slowly moving her hand up and down your thick meat, smooth pressure all the way along your frenum, <i>“We must reach out, encourage many more of yours to come to our lands. I could stand to have many warriors like you at my side...”</i> Her slick, yellow tongue lolls out of her mouth, craning out like a hummingbird’s beak to dab at your [pc.cockHead]; you move forward again, reactively presenting your musky, honeyed cock to her face. She gazes up at you winsomely as she rolls more of her insectile mouth-tube out, wrapping it around your length before drawing that brilliant, tight, wet coil back into her maw, touching its sucking, open end to your cum-slit to sample you.");

output("\n\nHoney seed: <i>“You taste just like us,”</i> she says, a delicate frown appearing on her face after rolling the flavor around her mouth. <i>“I know star-people are </i>different<i> - so how can that be?”</i>");

output("\n\n<i>“Magic,”</i> you grin rakishly. <i>“Deal with us, and you’ll experience all kinds.”</i>");

output("\n\nChocolate: <i>“Like us, but - different,”</i> she says, a delicate frown appearing on her face after rolling the flavor around her mouth. <i>“Richer. Deeper. Is all star-people seed like this?”</i>");

output("\n\nFruit: <i>“Hmm,”</i> she murmurs, a delighted grin appearing on her face after rolling the flavor around her mouth. <i>“Like mangoes and berries! The honey I can make with this...”</i> She gazes up at you hungrily. <i>“I like star-people a </i>lot.<i>”</i>");

output("\n\nOther: <i>“So meaty and salty in comparison to our own,”</i> she proclaims, a delicate frown appearing on her face after rolling the flavor around her mouth. <i>“Not unpleasant, exactly, but... you star-people are so <i>strange.</i>”</i>");

output("\n\n{merge}");

output("\n\nShe bends forward and engulfs the sensitive tip of your [pc.cock] with her lips, apparently eager to taste more. You groan as slips more and more beyond her pert, black lips, her long tongue flicking and skimming along the underside; pre leaks copiously in response to her efforts, sucked away with a curious, muffled hum. Rekindled lust in your veins, you run your hands through the zil’s fuzzy, striped hair, and grip her reactively, pulling her towards you when she sinks her mouth further down your shaft. You worry momentarily about propriety - this is an alien chieftain you’re making it with, after all - but that dissolves completely into a sea of red lust as a pleased coo vibrates through your groin in response to your roughness.");

output("\n\nYou hold her head steady and push your [pc.cock] demandingly past Quinn’s gleaming black lips, bathing it in the wet, kneading pressure of her hollowed cheeks, her whip-like tongue wrapped firmly around {the base} / {the [pc.knot]. You slather her mouth in a constant drizzle of pre, and her slim neck works as she tastes and swallows with evident enjoyment, eyes closed. You cannot look down at that expression and last long; you sigh blissfully as you mire every inch of your cock into her mouth{, [pc.balls] pressed against her chin, } and unload a thick gout of [pc.cum] straight down her throat. You keep her head firmly pressed to your groin for the first couple of juicy pulses, before relaxing and pulling further out, swelling her cheeks with the final [pc.cumVisc] flurry. It’s important she savor the flavor, after all. A single [pc.cumColor] drop works its way down Quinn’s chin as she swallows the load with a wet hum of gratification, golden eyes fixed on you.");

output("\n\n[pb]");

output("\n\n<i>“So then,”</i> she husks, her voice the buzz of a nectar-drunk bumble bee, <i>“Now you’ve treated your Quinn in such a rough, rude fashion - do you really think you deserve anything else?”</i> She says all this with her hand still wrapped around the base of your darkened, semi-erect cock. <i>“Seems to me like you’ve found your limit anyway.”</i>");

You One-damned have not - it only takes the slightest amount of lazy stroking and fondling of those long, smooth fingers of hers for your ever-ready, fervid prick to become almost painfully erect again - but still, you’re going to go easy here. Beneath her teasing words you can hear an edge of anxiety, and you suspect it wouldn’t take much for her to reassume her regal veneer and demand you leave. And it would be <i>such</i> a shame if you didn’t finish the job and do her up her pert little bum...

output("\n\nThe fact your [pc.cock] is absolutely slathered in saliva and honey helps. You take her into your arms, mold your [pc.chest] against her petite breasts and tongue her lasciviously, tasting your own seed on her breath, as you slide your [pc.cock] slowly down the line of her opened pussy, oiling it again in [pc.cum] and her syrup for good measure. You get the eager little rise of her tummy and thigh against your flank that you were hoping for - and you pull back and gently flip her over, pressing her into the warm furs as you expose her behind, its small, round prettiness counterpoised by the striking alienness of the insect abdomen with its lethal four inch sting dangling above it.");

output("\n\n<i>“Star-people have such strange desires,”</i> Quinn murmurs, gazing over her shoulder at you, eyes glinting in the candlelight. <i>“I suppose it makes sense, if they are all like you and don’t go soft after spending themzzz- <i>“ she trails off into a crooning buzz, somewhere between discomfort and passion, as you inexorably open her cheeks and press your [pc.cockHead] against the small, black wrinkle of her asshole.");

output("\n\nThat the zil is a novice to this is obvious - she grips handfuls of furs, her hole clenching up with every honey-slicked rock-hard centimeter taken - so the going is slow. But that’s fine, necessary even, because your [pc.cock] is throbbing hot and tender from the red raw fucking it’s already dished out, and is certainly not in the mood for anything different. And void, is she <i>tight</i>. You inhale when your [pc.cockHead] is all the way inside; it’s like being caught in a hoover.");

output("\n\n<i>“Death, shit and disease,”</i> a shuddering Quinn curses, with surprising eloquence. <i>“I have made males go at each other for my amusement, and sometimes they are like sword and shield! How do they manage it... <i>“ You let your hands roam over her body, fondling her breasts, curling your fingers into her gooey pussy, carrying your cum-oozing fingers up to her mouth, coaxing the relaxed, sex-drunk side out of her, all the while sinking more and more of your rock-hard length into her back passage with the faintest of pushes and pulls. There’s exactly zero need for impatience here. Your wildest lust satiated, you have all the time in the world to enjoy the perfect ecstasy of this incredibly haughty ass gloving you like a warm, clenching hand.");

output("\n\nThe zil does at last relax as you finally fit {all} / {most} of your cock into her - not all the way, not enough to lose that sweat-inducing tightness - but enough that when you slowly move your [pc.hips] up and down, dragging your length up and down her syrup-and-cum slathered walls, the little catches of her breath are not of pain.");

output("\n\n<i>“I see,”</i> she buzzes quietly, arching her back to present her dainty butt cheeks better. <i>“I see how this could be - <i>“ You massage her breasts with both hands again, making orange bead at her teats at the same time as you drive firmly into that wonderfully narrow crease, and this earns a pleased hum, a delightful wriggle around you.");

output("\n\nIt feels like the seed is practically being suctioned out of you in there, and after a minute or so of gentle but profoundly satisfying thrusting, you stop denying it. You wrap one arm around Quinn’s round abdomen, the other two playing with the warm, sucking tip of her tongue as you hilt your [pc.cock] in a warm, clenching hole you’ve made your own, allow it to bulge up and then gush [pc.cum] deep inside her.  {Low/mid output: You’re practically tapped out at this point, but you still keep pumping into the zil until you’re sure every last drop you’ve got to give has disappeared inside her. When at length you draw yourself out, her walls pulling at you all the way, her anus closes up like the cutest, blackest airlock in the galaxy.}");

output("\n\n{High output: <i>“How can you still have so much?!”</i> she cries out in laughing exasperation as, with grunting relish you release every last [pc.cumVisc] drop you’ve got to give, packing her intestines out with it, bumping against the multiple loads you’ve already swollen her with. The zil isn’t a big girl and it’s soon spurting richly around your girth, so densely packed it can even get out around as tight a seal as your dick and her ass. Exasperated the tone might have been, but you hear a distinct, glutted <i>“mmm”</i> when you are finally done, and are slowly drawing yourself out.}");

output("\n\n{merge}");

output("\n\n<i>“I’m going to assign several of my more wayward maidens to you in future,”</i> she says once she’s recovered herself a bit, gazing up at you with a complacent smirk. <i>“That seems to me the only way I am going to be able to take care of your unnatural, alien lusts.”</i>");

output("\n\nShe is completely unresisting when you lock your arms around her, however, and roll deep into the soft furs{, enjoying the heavy bloat you’ve given her slim abdomen. In a slight doze you imagine your thick seed being converted in the zil’s thirsty body into extra honey, piling soft weight onto her hips and boobs, giving her the curvy, matronly body she really needs to go with her title... }");

output("\n\nYou leave after a couple more minutes of snuggling, sticky but profoundly satisfied. A couple of handmaidens pass you on the path from the Quinn’s yurt, heated towels and buckets sloshing.");

output("\n\nScizzor");

output("\n\n//Requires vag");

output("\n\n{If cuntboy / maleherm: Quinn’s sultry expression lengthens into one of surprise when you {flick off your [pc.lowerUndergarment] and} expose your [pc.groin].");

output("\n\n<i>“Oh! You are a man, but you have - <i>“ she coughs a laugh into her hand. <i>“Star-people are so </i>interesting<i>, aren’t you?”</i>}");

output("\n\nYou clamber onto the big, round heap of furs{, sinuously removing your [pc.gear] as you come,} eyes full of her lithe, forest-fairy body. The roiling, intoxicating smell of oozing, horny honey is overwhelming, and you don’t fight what it directs you to do. One hand sliding softly up her bare, yellow hip, you dip your head between her legs and drag your [pc.tongue] along the neat line of her pussy,  coating it with sugar. Arousal blooms like a firework inside your gut as you funnel her honey down your throat, heat flushing down to your groin, and you bend your tongue between her flaps, intensely eager for more. Quinn hums her approval, slim hips moving either side of your [pc.hips]. [pc.eachVagina] {is / are} getting very, very wet.");

output("\n\n<i>“So how do star-women do with each other?”</i> she murmurs; long, glossy fingers curl around your chin, making you look up to her molten brass eyes. <i>“Is it just like this? This is how my maidens love one another usually, I know, but I thought perhaps for other beings - who don’t have the sweetness - ?”</i>");

output("\n\n{Honey/chocolate femcum: You smile at her toothily, and silently climb up her horizontal form until your [pc.vagina] is level with her mouth. Gingerly she reaches out with her yellow tube tongue, dabbing at the stickiness on your labia - and her thin eyebrows shoot up.");

output("\n\n<i>“You are sweet too!”</i> she exclaims. She takes a more generous lick this time, between your lips and across your [pc.clit], making you sigh. <i>“But how can that be?”</i>");

output("\n\n<i>“Star people magic,”</i> you grin. <i>“But since you ask, yes, there is a couple other ways we screw.”</i>}");

output("\n\n{Fruit femcum: You smile at her toothily, and silently climb up her horizontal form until your [pc.vagina] is level with her mouth. Gingerly she reaches out with her yellow tube tongue, dabbing at the stickiness on your labia - and her thin eyebrows shoot up.");

output("\n\n<i>“Like the mangoes and berries!”</i> she exclaims. She takes a more generous lick this time, between your lips and across your [pc.clit], making you sigh. <i>“Oh, the honey I can make with you... but how can that be?”</i>");

output("\n\n<i>“Star people magic,”</i> you grin. <i>“But since you ask, yes, there is a couple other ways we screw.”</i>}");

output("\n\n{Otherwise: <i>“I think I taste pretty damn nice,”</i> you reply, with a certain archness. <i>“ But since you ask, yes, there is a couple other ways we screw.”</i>}");

output("\n\n{merge}");

output("\n\nYou rearrange yourself, sliding across her smooth flesh and glossy carapace, pulling up a slim, unresisting thigh so that yours is locked around hers. Sat up, hands deep in the furs, Quinn watches as mold your [pc.vagina0] against hers, syrupy yellow kissing [pc.vaginaColor]. Pleasant sensation shivers through you.");

output("\n\n<i>“One of my kin tried this with me when we were young,”</i> she murmurs, watching you with those pits of molten brass of hers. <i>“It was... awkward. We stopped because I was laughing too much.”</i>");

output("\n\nIf large clit: <i>“Did your friend have one of these, though?”</i> you grin, parting her lips with your [pc.clit]. It’s bulging well out of its hood, drunk on the smell and taste of honey, and it pulses pure pleasure when it slithers back and forth across her moist hole and inner folds.");

output("\n\n<i>“No... she didn’t. Ooh... <i>“ she trails off into a breathless hum, her thigh tensing up beneath your hand, when you touch something nubby and tough at the top of her opening. Grinning, you rub back and forth against that with gentle pushes of your [pc.hips].");

output("\n\nIf 1 < clit: <i>“But you see, if you’re like me and have more than one... <i>“ you trail off in a sensuous sigh as her lips bump across first one clit, and then when you slide back down her line {the other} {another}, twin buzzes of pleasure shivering through you. Quinn gazes at you with a wondering curiosity as you move against her out of pure sensual instinct, driven by the over-sensitized nubs of your pussy.");

output("\n\n<i>“More star people magic,”</i> she mutters. <i>“I must look into... ooh.”</i> she trails off into a breathless hum, her thigh tensing up beneath your hand, when you push over something nubby and tough at the top of her opening. Grinning, you rub back and forth against that with gentle pushes of your [pc.hips].");

output("\n\nOtherwise: <i>“Experience, Quinn,”</i> you grin. <i>“Just relax... <i>“ You sensuously move against her, sliding the line of your pussy down hers, exploring the smooth textures of an alien sex. She looks more curious than overwhelmed with lust - until you push over something nubby and tough at the top of her opening, which makes her thigh tense up beneath your hand and forces a breathless hum past her lips. Grin widening, you rub back and forth against that with gentle pushes of your [pc.hips].");

output("\n\n{merge}");

output("\n\nHoney seeps freely from the zil’s hole, soaking the furs and your groin in oozing warmth as you gently thrust against her. You make sure to give her the assiduous attention an uptown ho expects - catching at her tiny, black nipples with her teeth, lavishing them with your [pc.tongue]; dipping your fingers into her warm tunnel, stroking at her walls as you kiss her lasciviously, wrapping your tongue around the long, thin tube of hers - and soon enough you’re rewarded with vixenish abandon, Quinn’s svelte, athletic hips bucking against your own vigorously. {vagina > 1: You make sure to flex your [pc.butt] up so that your [pc.vagina1] gets to enjoy her excited palpitations too; that’s the joy having more than one, after all.}");

output("\n\n<i>“More like that!”</i> she gasps, petite boobs jouncing, arm wrapped firmly around your shoulders. <i>“I demand more like that!”</i> You firmly bump {your out-sized clit} against her nubby tender spot, and she pulls you into her wiry, sweaty embrace as she finds her high, mouth open and eyes pointed at the ceiling, slathering [pc.eachVagina] in pheromone-laden syrup. You are forced to a shimmering high yourself, pupils and pores dilated as you quiver against her, pressing your [pc.chest] against her small, sensitive breasts, [pc.femcum] mixing with honey as [pc.eachClit] throb deep pleasure through you.");

output("\n\nYou come down slowly, laying her back on the creaking wicker basket-bed, kissing and fondling the dainty but delightfully well-formed curves of her body, hips still firmly intertwined.");

output("\n\nIf fruit femcum: <i>“Do you mind if I... ?”</i> she murmurs. Her tongue flicks out, touching your chin. <i>“It’s just that - usually after sex, I have some fruit brought to me. And you’re so... <i>“");
output("\n\nWithout another word you rise up, opening your [pc.thighs] above her head. You clutch the skull headboard and murmur, then groan with pleasure as thin hands clutch at your [pc.butt] and a thirsty tube-tongue travels over your soaked [pc.vagina], lapping at your fruity spent juices, reaching deep inside you to suck away every last drop.");

output("\n\n<i>“Yes,”</i> she murmurs, smacking her lips with the deepest satisfaction when you finally drop back down beside her. <i>“You will come by often. Provide for your Quinn.”</i>");

output("\n\nOtherwise: <i>“I can see how star people can show us many things,”</i> she murmurs. Long, delicate fingers squeeze your [pc.butt]. <i>“I wish for you to visit often. Provide more demonstrations.”</i>");

output("\n\n{merge}");

output("\n\nAfter a little more languorous fondling, you put your gear back on and leave her snoozing on her pile of furs, a {spring in your step} / {flick in your slither} / {bounce in your ooze} as you meander back down to the plateau.");

output("\n\nZil On Top");

output("\n\nGO Tooltip: You need a reasonably sized dick for this.");

output("\n\nIn this warm, confined, dusky space, filled with the suffocating, horny smell of female zil in heat, it’s difficult to think clearly. In a slight daze you just stare at the black-and-yellow vision sprawled across the furs in front of you - the gleaming, austere armor of her lean, plated limbs framing the soft, perfectly formed, gently leaking treats within - until [pc.eachCock] feel{s} like it’s {going to tear through your [pc.lowerGarmentOuter] / {shoot through the wax of the wall behind her} {it’s / they’re} that hard. Quinn’s soft smile widens knowingly.");

output("\n\n<i>“Why don’t you lie here, warrior?”</i> she says in a tone of gentle authority, shifting herself over. <i>“{First: You have done much already this day.} {Repeat: Undoubtedly you have done many great feats in my name this day.} It is Quinn that should be doing the work now.”</i>");

output("\n\nYour mind and dick are in agreement: this is a fantastic idea. Your [pc.gear] is a pile on the floor and you are sunk deep into the furs, [pc.cock] pointing earnestly at the conic roof, in seconds. Your heart thuds as Quinn leans over you, candlelight flickering on her teeth and armor, and wraps her long, elegant fingers around the base of your hot erection.");

output("\n\n7-12 inches: <i>“So much bigger than my homegrown warriors,”</i> she remarks, a vein of husky excitement running through her tone. You groan softly as she moves her grip upwards, trails her fingertips of your [pc.cockHead], and then slowly slinks them down again. <i>“You mustn’t show it to them. They will get very jealous.”</i>");

output("\n\n5.6-6.9 inches: <i>“Very alike to my homegrown warriors,”</i> she remarks, curiosity coloring her tone. <i>“Are all manhoods the same size?”</i> You groan softly as she moves her grip upwards, trails her fingertips of your [pc.cockHead], and then slowly slinks them down again. <i>“Of course they are,”</i> she goes on, playful menace blotting out whimsy. <i>“Because this size suits Quinn.”</i>");

output("\n\n<5.6 inches: <i>“Aren’t you sweet,”</i> she remarks, playful menace creeping through her tones. You gasp, tense up as she grips you tightly... and then relents, stroking your length with loving curls of her fingers. <i>“An indomitable, loyal warrior in the circle and jungle, yet hung like the meekest of my men.”</i> You ball fur in your hands as she grips you fiercely again, craning her mouth to your ear as she does. <i>“I like that combination </i>a lot.<i>”</i>");

output("\n\n{merge}");

output("\n\nHer cool thigh slides down your [pc.hip] as she climbs on top of you, boobs and abdomen jouncing slightly as she leads the oozing warmth of her honey-cunt up the underside of your [pc.cock]. She still has her hand around the base of it, clutching it tightly, lining it up with assured movements like a prized, personal tool - which you suppose it is. Your mind is drowned in the deep, sweet smell of zil, leaving nothing but an open, sugary eagerness, a sunny will to do exactly as your sexy, assertive queen demands.");

output("\n\n<i>“That’s it,”</i> she sighs, other hand pressing down on your shoulder as she spreads her slick lips over your [pc.cockHead]. <i>“Just lie back and let me do as I will... <i>“ You can’t help but groan and twitch as she slowly sits herself down. The silken feel of her narrow tunnel advancing down your rock-hard prick, drooling honey over {the [pc.knot]} {and} {your [pc.balls] / {base} is so good you can feel the sweetness of Nirvana on your [pc.furSkinScales] and tongue. Instinctively you reach out and clasp her hourglass waist as she {gloves you whole, easily taking every inch of your eager boy dick / takes as much of you as she can in her tight tunnel, the rest of your dick soaked in syrup}; she strokes your hands fondly, before gently but firmly taking them off, leading them back and planting them on the thick, wide femurs of the bone trophy behind you.");

output("\n\n<i>“Keep them there,”</i> Quinn murmurs. The pheromone fug seems to intensify, blood reaching up to your [pc.skin], and another wordless sound of pained joy escapes your [pc.lips] as she begins to move her hips, stirring you within her oozing, limber warmth. She may as well have tied your hands to her grisly headboard; the thought of disobeying has no chance of trespassing the eager, summery yellowness of your mind. All your attention is upon how wonderful it feels when she finds her rhythm and begins to briskly ride you, tightening her strong athletic thighs around your waist, locking herself into you enthusiastically.");

output("\n\n<i>“Being Quinn means I often must stay here instead of joining our hunters,”</i> she husks, fingers hooked around your shoulders. <i>“Watch over the village, judge and carry out my will. It is frustrating. But... getting to lie with the most honored warriors afterwards... I can </i>feel<i> their spirit, I am in command of their feats when I move them, and it’s so... yes!”</i> She throws her head towards the ceiling and emits a savage howl, bucking around you ferociously, petite tits jouncing up and down. Your [pc.cock] throbs, oozing pre deliriously in response to getting jerked and kneaded this way and that in her supple, honey-soaked sex. {Your [pc.balls] tighten, the heavy load within raring to go...}");

output("\n\n<i>“But you don’t cum,”</i> the zil says suddenly, as if sensing your thoughts. She looks down at you, orange-cheeked and panting slightly, still firmly embedded on your cock. <i>“Not yet. Quinn has not got everything she needs and that won’t do, will it?”</i> You shake your head breathlessly, hands still clenched around smooth ivory. All is eager yellow. All is horny sugar. Quinn resumes her movements, slowly but stubbornly pumping her lean, round butt towards your [pc.belly] and then back, working your giddy erection firmly. <i>“Yeessss... <i>“ she breathes, stroking your {chin / beard} and touching your [pc.chest]. <i>“You lie back and let your Quinn own you. Let me live your deeds and absorb your spirit.”</i>");

output("\n\nIt’s a kind of pleasurable hell letting an embodiment of entitlement and frustration sit on top of you and wring your [pc.cock] inside her slick, drooling cunt, energetically levering herself to first one howling orgasm and then another; but for all the burning desire to let go and pack her absolutely full of [pc.cum] you could have a catheter inserted for all the likelihood it’s going to happen without her order. The pheromone fug, and the calm, sonorous words that came with it, are too powerful. When she cries out with delight, clenching her hips around yours and spattering clear syrup onto your [pc.belly] and [pc.legs], sheerest joy lights up your mind - you have pleased your Queen! - and denying the unbearable load bulging up your [pc.cock] {and [pc.balls}] seems a very small price to pay.");

output("\n\nQuinn slows down a little after the second gratuitous high - spends a little time {If second cock: curiously playing with your [pc.cock1], tantalizing it with coiling strokes until it is every bit as erect as the one she’s got trapped in her softened twat} {If lactation: curiously playing with your [pc.nipples], cooing when they spring leaks in response to her tweaks and caresses, descending to suckle [pc.milk] from you hungrily} {If otherwise: curiously playing with your [pc.nipples], caressing and pulling at them until they are tender and {erect / bee-stung}} - before beginning to wring and clench you within herself vigorously again, snarling and clutching at your flesh like a wolverine attached to its prey.");

output("\n\n<i>“Cum now then, my warrior,”</i> she growls throatily, the sweet smell of her billowing over you in waves as she rocks on top of you. Instantly your long-denied heat begins to rise to a brilliant, inexorable point, and you {groan / moan} mightily, thrashing up into her reactively. <i>“Cum with me! Let me take your strength!”</i>");

output("\n\nFor a moment you think your [pc.cock] might actually explode with the pressure... and then you are spouting [pc.cum] into her warm, tight depths deliriously, one glorious full-body clench after another. You clutch the ivory like your life depends upon it and thrust it into her, determined to give her every last drop. {Low output: You are still pumping up into her, [pc.butt] clenching up, long after you have, your dick still pulsing dryly and [pc.cumVisc] trailers working their way down your [pc.thighs].} {Otherwise output: There’s no way you actually can, of course - the zil is fairly petite, and you are fecund as fuck. Quinn gasps and then laughs with filthy delight as you completely fill her with several fervent bucks of the hips before carrying on regardless, [pc.cumVisc] goodness spurting out all over your [pc.hips] and the sweat-and-honey soaked furs. She continues to ride you with brisk pumps of her body, visibly enjoying every fresh wave of seed you bloat her womb with.}");

output("\n\n<i>“Very good,”</i> she husks at last, still sat proudly on top of you. Her chitin-gloved hands slide over your sweaty [pc.chest], exploring alien flesh and feeling your muscles with sweeping, languorous massages. {Small cock: Her satisfied grin turns into a knowing smirk as she easily slips off your toy-like cock, giving you a squeeze down there that makes you jerk and open your mouth. <i>“My sweet little warrior.”</i>} {Otherwise: She slowly disengages from your cock, a pleased hum elicited when it comes loose from her well-fucked pussy and brings with it a {dribble / generous river} of [pc.cum] that gobbets down onto you. She grips your softening member, slapping it this way and that playfully. <i>“Remember to bring this with you again next time. It is a pleasing shape.”</i>}");

output("\n\nQuinn drops to one side, the exploration of your naked, ravished body continuing with flicks of her golden pupils. Although her smell remains overpowering, the pheromonal imperative of it seems to be fading - nothing stops you from slowly reaching out and clasping her thigh and beneath the arm, do a bit of tired, fond exploring yourself. A significant part of you regrets that all-encompassing submissive goldenness receding. Wouldn’t it be nice to stay here forever as your savage queen’s fuck-pet?...");

output("\n\n<i>“Come back later,”</i> she murmurs in your ear, pointedly taking your hands of her pretty breasts. Reluctantly you clamber out of the bed and try to find your gear in the dim, flickering light, <i>Void</i> does your dick ache. <i>“When you have performed many more brave, wise deeds in my name. I will relive and absorb them with you. Maybe one day - I will sire a child with them.”</i>");

output("\n\nA couple of handmaidens pass you on the path from the Quinn’s yurt, heated towels and buckets sloshing.");


output("\n\nTalk");

output("\n\nHerself");

output("\n\nTooltip: Ask how she became <i>“Quinn”</i>.");

output("\n\n<i>“Were you born Quinn?”</i> you ask. <i>“Or is Quinn-dom something you had to achieve?”</i>");

output("\n\n<i>“I am the daughter of the Chieftain of the Great Western Rift,”</i> the zil replies, with an air of relaying something extremely impressive. <i>“I became one of the wives of the old Chieftain here, as part of a truce between our two tribes. When he died, there was disagreement as to who should replace him, as there always is. I defeated some of his wives, husbands and children in the ring; the rest submitted. That was a good night.”</i>");

output("\n\nHer faint smile broadens slightly in fond memory.");

output("\n\n<i>“In answer to your question though, no, I did not become Quinn until the word-wolf arrived. Before then, I was simply a chieftain, among many other chieftains throughout these lands. {RK Lah around: With the words he gave me, I became something more - unique, imbued with the unquenchable truth of the stars. With it, we stands as equals in knowledge to the evil land-stealers. And they do not match our bravery!”</i>");

output("\n\nShe favors the ausar at her side with the proud, beatific smile. He looks uncomfortable.}");
output("\n\n{RK Lah gone: Although I know now that it was a form of deceit he used to control me, I hold onto it.”</i> She pauses slightly in thought. <i>“To my people, it continues to hold a ring of power; it makes their leader unique and modern, and they are proud to serve me. To me though - it speaks of humility. Of being too eager to grasp power to properly question where it came from. This is an important thing for me to remember. I will let it shape me.”</i>}");

output("\n\nEsbeth");

output("\n\n//Greyed out for 24 hours after peaceful resolution");

output("\n\nPeaceful Tooltip: Ask how things are progressing with the colonists.");

output("\n\nGO Peaceful Tooltip: Let them have a chance to talk with the colonists before discussing this.");

output("\n\nViolent Tooltip: Ask what, if anything, they intend to do about the star people settlement.");

output("\n\nPeaceful");

output("\n\n<i>“Have you managed to make contact with the people of Esbeth?”</i> you ask.");

output("\n\n<i>“We have,”</i> Quinn replies, stroking the arm of her chair absentmindedly. <i>“It has been... slow. When my envoys first approached the star-people settlement they hid inside their buildings, and shouted about turning the white stings on us. However - once pots of honey were left and my warriors returned, they were willing to talk.”</i> She snorts. <i>“Soft and greedy.”</i>");

output("\n\n<i>“Have you made any progress with them?”</i>");

output("\n\n<i>“They are happy to trade goods for honey - star food, wondrously fine and colorful silks. These things are excellent to have. But we have made it </i>very<i> clear that this peaceful trade can only continue if the land-stealers, those you call Snug Lay, are driven away. There is one - a Huge Man, who seems to like our honey a lot. He listens the closest when we talk of this, I am told. We shall see.”</i> She gives you the golden eyeball, faint smile firmly in place. <i>“I believe the path you have set us on is the correct one. For now.”</i>");

output("\n\nViolent");

output("\n\n<i>“Do you plan to do anything about Esbeth? The star-people settlement to the south west,”</i> you supplement.");

output("\n\n<i>“They have not taken any of our land, and do not trouble us,”</i> replies Quinn with regal indifference. <i>“Save sending enjoyable morsels into the jungles from time to time. If they expand, and begin to act in the same manner the land-stealers did... they have their example. I hope another one will not have to be made.”</i>");

output("\n\n<i>“It won’t,”</i> says Lah quickly. <i>“Small, independent settlements, yes - these are fine. We can, we will be able to sort any problems out with colonists seeking a simple life easily.”</i>");

output("\n\n<i>“Yes,”</i> agrees the zil coolly. <i>“We will.”</i>");

output("\n\nNaleen");

output("\n\nTooltip: Ask about {the naleen you were unfortunate enough to encounter} / {the hissing you heard} underneath the falls.");

output("\n\nDid not encounter: <i>“I heard... hissing sounds coming up from underneath the waterfall,”</i> you say. <i>“What have you got down there?”</i>");

output("\n\n<i>“The naleen pit?”</i> Quinn traces the corner of her mouth with a finger. <i>“I was impressed that you managed to avoid falling into that, you know. My zmiths are very proud of how carefully they carved that tunnel, and disguised its entrance.”</i>");

output("\n\nDid encounter: <i>“I... met your friends. Underneath the waterfall,”</i> you say, trying not to glare. <i>“How did you get them to obey you?”</i>");

output("\n\nQuinn hoots with laughter.");

output("\n\n<i>“Yes! What an amusing trap that is, do you not agree?”</i> she chortles. <i>“I could not be prouder of the warriors who devised it. Still! You got out of it and fought your way back up here, didn’t you? Perseverance is a finer trait than unthinking agility.”</i>");

output("\n\n{merge}");

output("\n\nShe taps her finger on the wax-polished arm of her chair.");

output("\n\n<i>“The naleen prey upon all creatures that live in the jungle. That is an unfortunate but unbreakable truth. However, as ravenous and evil as they are, they can be reasoned with. We know many like to come to the caves to perform their mating rituals in peace - we know that were we to do nothing about it, we would lose many of our own as after-sex snacks. And they would lose some also, in acts of retribution. They would never be able to truly relax.”</i> The zil plays idly with a tuft of fur on her chair-pelt. <i>“Of course, naleen cannot come to an agreement to such as us unless it seems heavily weighted in their favor. They are extremely prideful creatures. And so - the pitfall. I explained that we carved it in deference to them, and that we would send tribute sliding down to them during orgy season from time to time, so long as they left our own alone. They liked this a lot - and we gained an easy way of getting rid of intruders. The peace has held.”</i>");

output("\n\nShe pats the tuft down.");

output("\n\n<i>“If you are that interested in them, feel free to go down there and experience the naleen mating ritual for yourself. Every tribute contributes to the accord we all enjoy, after all...”</i>");
*/