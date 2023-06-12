//Anzhela, Red Myr Medic
//By JimThermic

public function showAnzhela(nude:Boolean = false):void 
{
	showName("\nANZHELA");
	if(nude) showBust("ANZHELA_NUDE");
	else showBust("ANZHELA");
	author("JimThermic");
}

//Occupied Hospital
//First Floor
public function hospitalShit():Boolean
{
	output("You’re standing in a busy looking hospital filled with white cotton beds and draw curtains. Busy medical staff bustle back and forth, taking patients charts, checking supplies, and administering pain relief. Even though the architecture is scarred by conflict like everywhere else, the smell of disinfectant lingers here, and everyone’s wearing sterile gloves.");
	output("\n\nThere are both red and gold myr patients here, being treated equally. A large banner hangs from the wall – white with a red lotus-looking flower. If you had to hazard a guess, it looks like the Scarlet Federation’s version of a green cross.");
	//Met Anzhela:
	if(flags["MET_ANZHELA"] != undefined) 
	{
		output("\n\nAnzhela is busy at work here, keeping everything ship-shape. There’s a definite presence whenever the CMO is striding about the room.");
		addButton(0,"Anzhela",approachAnzhela,undefined,"Anzhela","See what Anzhela is up to.");
		
	}
	//Else First Time:
	else 
	{
		output("\n\nA tall, svelte doctor is standing about, checking over patients charts. Perhaps she’s in charge–?");
		addButton(0,"CMO",approachAnzhela,undefined,"CMO","Approach the chief medical officer.");
	}
	vendingMachineButton(1);
	return false;
}

//[{CMO/Anzhela}]
//CMO / Anzhela
public function approachAnzhela():void
{
	clearOutput();
	showAnzhela();
	//First Time:
	if(flags["MET_ANZHELA"] == undefined)
	{
		output("Asking around about who is in charge, you’re pointed to a tall, svelte myr woman who is examining a patient’s charts. It’s not hard to spot her from a distance. Her curly hair - tied up in a messy bun - is so red it’s positively rebellious.");
		output("\n\nYou walk up just in time to hear the end of a conversation between the radically red-haired woman and the patient’s attending doctor.");
		output("\n\n<i>“...She looks good. Discharge her with some ephacin for the nausea,”</i> the hospital administrator hands the attending doctor the charts then shoots the patient a brilliant smile, <i>“Congratulations! Looks like you’re going to be getting out of here by the end of the day.”</i>");
		output("\n\nAfter patting the patient’s hand, the head doctor strides in your direction. When she spots you, she stops in her tracks. She then pointedly tilts her half-frame glasses and shoots you a curious look.");
		//if PC is red myr morph:
		if(pc.race() == "red myr")
		{
			//icPC is a male red myr morph:
			if(pc.mf("D","") == "D" && pc.hasCock())
			{
				output("\n\n<i>“They’ve sent one of our males to the front lines...?”</i> she murmurs, though loud enough for you to hear. <i>“...This must be part of that ‘Hearts and Minds’ campaign everyone’s talking about.”</i> By the way she’s looking you up and down, mistaking you for a real red myr male, she clearly doesn’t disapprove.");
			}
			//else pc is a female red myr morph:
			else
			{
				output("\n\n<i>“A new recruit...? And quite a pretty one too...”</i> she murmurs, though loud enough to hear. <i>“I hate to see new girls come in, but at the same time, when they look like </i>that<i>, who can say no?”</i>");
			}
		}
		//else if PC is gold myr morph
		else if(pc.race() == "gold myr")
		{
			output("\n\n<i>“...A gold myr? No, not enough arms...”</i> she murmurs, though loud enough for you to hear. <i>“An alien faux myr, perhaps...? [pc.HeShe]’s so " + pc.mfn("handsome","beautiful","striking") + "...”</i>");
		}
		//Else:
		else
		{
			output("\n\n<i>“...Is that... an offworlder? Such interesting [pc.skinFurScalesColor] [pc.skinFurScalesNoun],”</i> she murmurs, though loud enough for you to hear.");
		}
		output("\n\nShe’s not the only one admiring the view. It’s hard not to notice her distinct womanly curves and magnificent stocking-clad legs. The straps of a garter belt travel up and disappear below her low-cut black skirt, and you feverishly fantasize about what wonders lie beneath.");
		output("\n\nAs she crosses her arms, she presses up her pert C-cups, so well emphasized by her low cut top and framing black-lace bra. A stethoscope is hanging around her neck, both ends resting upon those brilliant swells.");
		output("\n\nYou imagine there’s a tangible rise in her patients’ pulse rates whenever she leans over. Her long white lab coat covers half her body, adding to the mystery. The scarlet-haired doctor reaches out a gloved hand to warmly shake yours.");
		output("\n\n<i>“Welcome to Kressia. I’m Anzhela, the chief medical officer overseeing this aid facility. Here for a check-up, or just got a desire to wander through the middle of a war zone?”</i> she jokes.");
		output("\n\nFirst, you introduce yourself, then you explain why you’re here; that you’re ");
		//redOrGoldMyrMorph: 
		if(InCollection(pc.race(), "myr", "red myr", "gold myr", "orange myr")) output("actually an alien explorer");
		else output("an explorer");
		//Haven’t found pod:
		if(!reclaimedProbeMyrellion()) output(" in search of a pod");
		else output(" who came looking for a pod");
		output(" left on Myrellion by your late father. Anzhela attentively listens, even looking a little bit sympathetic at your loss.");
		output("\n\n<i>“Ah, well, that makes sense. I can’t imagine anyone being out here if they could help it");
		//Have Found Pod:
		if(reclaimedProbeMyrellion()) output(", particularly with");
		//Else Still Searching:
		else output(". I’d be careful about searching around these parts, though. There are");
		output(" landmines all over, harmful spore plants, and nyrea running wild.”</i>");

		output("\n\nAnzhela then gestures to her injured patients, some with swollen bellies and others wrapped in bandages. <i>“There’s beds to spare since the cease-fire, but I’d prefer not to see you get hurt, especially if you’ve come all this way to our planet.”</i>");

		output("\n\n<i>“Just tell me if you need anything, and I’ll be happy to assist. We’ve also got some medical supplies here if you’re going to be exploring. That said, prevention </i>is<i> the best cure.”</i>");
		processTime(6);
	}
	//Repeat:
	else
	{
		output("The svelte, scarlet-haired doctor, Anzhela, is standing and ");
		if(rand(3) == 0) output("talking to a patient");
		else if(rand(2) == 0) output("talking to another doctor");
		else output("talking to a soldier");
		output(". Her hands are tucked in the pockets of her lab coats.");
		
		output("\n\nWhen she notices you walk in, she smiles and politely dismisses herself. Sauntering up to you, she pulls out a hand and brushes back a lock of her curly hair. Her half-frame glasses are lightly tilted.");

		output("\n\n<i>“");
		//MetMoreThanTwice: 
		if(flags["MET_ANZHELA"] >= 2) output("[pc.name]");
		else output("[pc.fullName]");
		output("!”</i> Anzhela brightly exclaims, <i>“");
		if(rand(3) == 0) output("Here for an examination, or something else...?");
		else if(rand(2) == 0) output("To what do I owe the pleasure?");
		else output("Here for a check up, or just to see me?");
		output("”</i>");

		output("\n\nAs she asks, the sultry doctor not so subtly crosses her arms under her pert C-cups, pushing them up. Her stethoscope slides between the swells of her black lace-lined breasts, falling into her cleavage.");
		processTime(4);
	}
	IncrementFlag("MET_ANZHELA");
	//[Appearance] [Talk] [CheckUp] [S.Relief]
	// Appearance.tooltip: Take a look at Anzhela.
	// Talk.tooltip: Have a chat with Anzhela.
	// CheckUp.tooltip: Get checked out by Anzhela to make sure everything’s in working order.
	// S.Relief.tooltip: Get some sexual relief. Doctor’s orders! (Must have 30 lust or higher)
	anzhelaMenu();
}

public function anzhelaMenu():void
{
	clearMenu();
	addButton(0, "Appearance", appearanceAnzhela,undefined,"Appearance","Take a look at Anzhela.");
	addButton(1, "Talk", talkToAnzhela,undefined,"Talk","Have a chat with Anzhela.");
	addButton(2,"Checkup",giveMeACheckupAnn,undefined,"Checkup","Get checked out by Anzhela to make sure everything’s in working order.");
	if(pc.lust() >= 33) addButton(3,"SexRelief",sReliefAnn,undefined,"Sexual Relief","Get some sexual relief. Doctor’s orders!");
	else addDisabledButton(3,"SexRelief","Sexual Relief","You don’t need any sexual relief at the moment.");
	addButton(14, "Leave", mainGameMenu);
}

public function backToAnzhelaMenuFromSex():void
{
	clearOutput();
	showAnzhela();
	output("Anzhela shrugs. <i>“Suit yourself.”</i>");
	anzhelaMenu();
	addDisabledButton(3,"SexRelief","SexRelief","If you wanted that, you shouldn’t have changed your mind.");
}

//Appearance
public function appearanceAnzhela():void
{
	clearOutput();
	showAnzhela();
	output("Smart, svelte, and sensual, all wrapped up in a single scarlet-haired package. That’s the red myr doctor in a nutshell; increasing pulse rates one patient at a time.");
	output("\n\nStarting at the head, her hair is curly and dramatically scarlet, drawn back in a messy bun. Long, dark lashes frame her caring black eyes, barely hidden behind her half-frame glasses.");
	output("\n\nFurther down, her plush wine-red lips are difficult not to notice. Much like the alcoholic beverage they resemble, they hold the promise of subtle, mature flavor and intoxicating delights.");
	output("\n\nLooking down, a black stethoscope hangs around her neck, both ends resting atop the swells of her C-cup breasts. Her low cut top is lightly undone, giving you a glimpse at her black lace bra and beautifully formed breasts.");
	output("\n\nHer slender legs are covered by dark stockings with patterned lace lining. They’re clearly connected to a garter belt hidden under that dark, tightly fitting skirt of hers.");
	output("\n\nShe wears a lab coat over her entire ensemble with the marking of her rank - Chief Medical Officer - emblazoned on her chest. There are also patches and ribbons, the former declaring her specialities in combat medicine and psychiatry, the latter her veteran status.");
	output("\n\nOn her arm is a patch with a red lotus and a pale backdrop. Written underneath is a motto: <i>“Caring Is Our Calling”</i>.");
	anzhelaMenu();
	addDisabledButton(0, "Appearance", "Appearance", "You just did that.");
}

//Talk

public function talkToAnzhela():void
{
	clearOutput();
	showAnzhela();
	//First Time Talking:
	if(flags["ANZHELA_TALKS"] == undefined)
	{
		output("<i>“If you want to talk, we should go into my office. That way we won’t be constantly interrupted,”</i> Anzhela suggests, gesturing towards a nearby door.");
		output("\n\nNodding, you let her lead the way. Following her clicking heels and swaying coat, you walk into her office.");
		output("\n\nBy the many arches and faux columns lining its walls, this office must have been once very grandiose. However, any extravagance the office may have held before Kressia’s occupation has been long since lost. The windows are cleanly shattered and the walls and floor are largely scorched.");
		output("\n\nDespite its disrepair, the scarlet-haired director walks across the burnt carpet and pulls up a chair ");
		if(!pc.isTaur()) output("for each of you ");
		output("at a small coffee table. She then brews you up a drink, passing it to you with a warm smile.");
		output("\n\nYou curiously peer into the cracked cup. It’s filled with hot, orange-colored water with tiny vermillion flakes floating around in it.");
		output("\n\n<i>“...Sorry, all I can offer you is a simple scova. I’m not even sure if it’s deadly poison for you, given you’re an off-worlder,”</i> Anzhela lets out a heavy sigh. <i>“Even with the cease-fire, supplies are still scarce at the front. This small thing is a bit of a luxury. What I wouldn’t give for a ra’as martini, I swear.”</i>");
		output("\n\nYou sip the scova, knowing your microsurgeons will protect you from the harms of drinking alien beverages. Despite its fiery look, it tastes a lot like cinnamon tea. You find your muscles unwinding as you drink some more");
		if(!pc.isTaur()) output(", until you’re thoroughly slouched in your seat.");
		processTime(2);
		flags["ANZHELA_TALKS"] = 1;
	}
	//Repeat:
	else
	{
		output("<i>“My office...?”</i> Anzhela suggests, and you nod. Following her clicking heels and swaying coat, you walk into her office.");
		output("\n\nOnce you’re inside, the scarlet-haired doctor brews you brews you up a cup of scova, along with one for herself, warmly passing it to you. You both sit down at the usual spot at the slightly scorched coffee table.");
		processTime(1);
	}
	output("\n\n<i>“So, what did you want to talk about...?”</i> Anzhela asks, elegantly sipping her scova.");
	// Since you’re having scova with Anzhela, there is no back button, but instead a ‘leave’ button.
	// When you leave, one hour passes, and the PC is restored of energy and loses 20 lust due to the calmative effects of scova.
	// A message also plays which is under the ‘leave’ title.
	// ‘Her Work’ opens another list of sub-topics.

	//[Her Work] [Supplies] [SCARMED] [F.Marshal] [Anzhela] [Her Past]
	//[TrenchW] [Leave]
	anzhelaTalkMenu();
}

public function anzhelaTalkMenu():void
{
	clearMenu();
	addButton(0,"Her Work",talkToAnzhelaAboutHerWork,undefined,"Her Work","Ask her about her work.");
	addButton(1,"SCARMED",talkToAnzhelaAboutScarmed,undefined,"SCARMED","Ask her about the organization she belongs to.");
	// Must have viewed Scarmed.
	if(flags["ANZHELA_SCARMED_TALK"] != undefined) addButton(2,"F.Marshal",talkToAnzelaAboutFMarshal,undefined,"F.Marshal","Ask her about her boss.");
	else addDisabledButton(2,"Locked","Locked","You don’t know enough to ask about this topic. Maybe talk about some other things first.");
	addButton(3,"Anzhela",talkToAnzhelaAboutAnzhela,undefined,"Anzhela","Ask her about herself.");
	addButton(4,"Her Past",talkToAnzhelaAboutHerPast,undefined,"Her Past","Ask her about her past.");
	addButton(5,"TrenchW",talkToAnzhelaAboutTrenchWives,undefined,"Trench Wives","Ask her about her opinion on trench wives.");
	
	addButton(14,"Leave",leaveAnzhelasTalkMenu);
}

public function backToAnzhelaTalkMenu(disabled:int = -1):void
{
	clearOutput();
	showAnzhela();
	output("Is there something else you would like to talk about?");
	anzhelaTalkMenu();
	if(disabled == 0) addDisabledButton(disabled,"Her Work","Her Work","You just spoke about this topic.");
	else if(disabled == 1) addDisabledButton(disabled,"SCARMED","SCARMED","You just spoke about this topic.");
	else if(disabled == 2) addDisabledButton(disabled,"F.Marshal","F.Marshal","You just spoke about this topic.");
	else if(disabled == 3) addDisabledButton(disabled,"Anzhela","Anzhela","You just spoke about this topic.");
	else if(disabled == 4) addDisabledButton(disabled,"Her Past","Her Past","You just spoke about this topic.");
	else if(disabled == 5) addDisabledButton(disabled,"TrenchW","TrenchW","You just spoke about this topic.");
}

//Her Work
public function talkToAnzhelaAboutHerWork():void
{
	clearOutput();
	showAnzhela();
	output("You ask Anzhela about her and her team’s work at the central aid center. You’ve seen as many gold patients as red ones since you arrived.");
	output("\n\n<i>“Well, there’s tending to the wounded, of course. Thankfully, there’s been hardly any critical injuries since the cease-fire - I wouldn’t have even had time to say ‘hello’ to you if you’d come in here several months ago,”</i> she blows the steam off her scova, then continues, <i>“...Most of the heavily wounded come from nyrea attacks, landmines, and scouts getting caught with their pants down.”</i>");

	//MetLieve:
	if(flags["MET_LIEVE"] != undefined)
	{
		output("\n\nYou think of the actual scout you found with her pants down just outside of Kressia. Does she mean literally, or...?");
		output("\n\nNoticing the perplexed gaze in your eyes, Anzhela laughs and waves her hand dismissively, <i>“Oh, no, not with their pants </i>actually<i> down - not normally! I mean, that HAS happened, but it’s an exception, not the rule. Mostly when two scouts are fooling around, or going somewhere for private time. Usually the wound to their pride - or their embarrassment - hurts more than the injury!”</i>");
	}
	output("\n\n<i>“Most of my time is taken up with pain management from old injuries, treating shell shock and addiction, and lately, administering transformatives.”</i>");
	processTime(3);
	//[P.Manage] [Shellshock] [Addiction] [Alterants]
	clearMenu();
	addButton(0,"P.Manage",painManagementAnzhela,undefined,"Pain Management","Ask about the old injuries and pain management.");
	addButton(1,"Shellshock",talkToAnzhelaAboutShellshock,undefined,"Shellshock","‘Shell Shock’ sounds like an odd term. What is it?");
	addButton(2,"Addiction",talkToAnzhelaAboutAddiction,undefined,"Addiction","Addiction? The Reds seem so strict...");
	addButton(3,"Alterants",talkToAnzhelaAboutAlterants,undefined,"Alterants","Administering transformatives? That sounds... dicey.");
	addButton(14,"Back",backToAnzhelaTalkMenu);
}

public function backToAnzhelaWorkTalkMenu(disabled:int = -1):void
{
	clearOutput();
	showAnzhela();
	output("Is there something else about her work you would like to discuss?");
	clearMenu();
	addButton(0,"P.Manage",painManagementAnzhela,undefined,"Pain Management","Ask about the old injuries and pain management.");
	addButton(1,"Shellshock",talkToAnzhelaAboutShellshock,undefined,"Shellshock","‘Shell Shock’ sounds like an odd term. What is it?");
	addButton(2,"Addiction",talkToAnzhelaAboutAddiction,undefined,"Addiction","Addiction? The Reds seem so strict...");
	addButton(3,"Alterants",talkToAnzhelaAboutAlterants,undefined,"Alterants","Administering transformatives? That sounds... dicey.");
	addButton(14,"Back",backToAnzhelaTalkMenu);
	if(disabled >= 0) addDisabledButton(disabled,"Disabled","Disabled","You just spoke about this topic.");
}

// PManage.tooltip: Ask about the old injuries and pain management.
// ShellShock.tooltip: ‘Shell Shock’ sounds like an odd term. What is it?
// Addiction.tooltip: Addiction? The Reds seem so strict...
// Alterants.tooltip: Administering transformatives? That sounds... dicey.

//PManage
public function painManagementAnzhela():void
{
	clearOutput();
	showAnzhela();
	output("You ask Anzhela about the patients and their pain management. Wouldn’t it be more efficient and effective to fully fix the injury instead?");
	output("\n\nThe chief doctor clicks her tongue and looks at you with a wistful smile. <i>“If only. Unfortunately, you off-worlders are a lot further along in medical science.”</i>");
	output("\n\n<i>“We’re still sewing up wounds and hoping the body heals by itself, instead of regrowing or replacing limbs. Because of that, there’s residual pain that needs to be managed.”</i>");
	output("\n\nYou ask how they manage that. After all, dealing with daily pain must be quite a chore.");
	output("\n\n<i>“Usually we prescribe a lot of Rubalim, a synthesized version of our venom which numbs the patient and gives them a sense of euphoric bliss,”</i> she taps the side of her cup, <i>“It lacks a lot of the side effects of undiluted venom, but it’s no less addictive.”</i>");
	output("\n\n<i>“Girls who habitually take it in the trenches call it ‘Ruby’.”</i>");
	output("\n\nYou try to get your head around the idea of constant and perilous pain management, coming from a society where even critical injuries can be fixed up by a nursedroid. You state as much, sipping your scova.");
	output("\n\n<i>“Hum, yes. Honestly, I’d love to learn more about off-world medicine, but it’s all part of the bartering process - or should I say negotiations - with your U.G.C ambassadors and this ‘Xenogen’.”</i>");
	output("\n\n<i>“From what I’ve heard down the grapevine, the suffering of the locals is far less important than the unique blood we shed.”</i>");
	output("\n\nThe scarlet-haired physician furrows her brow and stares into her cup. <i>“...It - it upsets me. I was hoping for a lot </i>more<i> from first contact. Enlightenment. Benevolence. Exemplary beings to aspire to, reflecting the best that we could be.”</i>");
	output("\n\n<i>“It’s rather jading to find out that the rest of the galaxy is dominated by something so banal as commercial greed.”</i>");
	//Return to ‘Her Work’ Talk Menu.
	processTime(5);
	clearMenu();
	addButton(0,"Next",backToAnzhelaWorkTalkMenu,0);
}

//Shellshock
public function talkToAnzhelaAboutShellshock():void
{
	clearOutput();
	showAnzhela();
	output("You ask Anzhela about this ‘shell shock’ she mentioned. You’ve never heard of the condition before.");
	output("\n\nThe chief doctor lets out a long, wearied sigh, running her finger around the edge of her cup. <i>“...It’s a condition similar to a physical wound to the head, yet it occurs in those without any signs of injury.”</i>");
	output("\n\n<i>“Our current theory is that it’s caused by the psychological trauma of battle, though some commanders still chalk it up to ‘cowardice’ or a ‘lack of moral fiber’.”</i>");
	output("\n\nShe taps the side of her glasses, <i>“You can usually tell who’s got it by the ‘thousand yard stare’ they’ve got - the afflicted will just stare off into space, completely unaware of what’s going on around them. They make up the most habitual users of Ruby as well.”</i>");
	output("\n\n<i>“In the worst cases, the patient loses all sense of reason and becomes utterly unpredictable. Quite a lot of them are put on trial for desertion or cowardice.”</i>");
	output("\n\nLeaning back in her chair, Anzhela looks up at the decaying office roof. <i>“...Still, convincing a military court that a soldier is suffering from shell-shock is tricky business - assuming it gets to a court. Out in the field, there’s no physicians to vouch for their actions. It’s an issue that, like the trench-wives, High Command would prefer to ignore.”</i>");
	output("\n\nAnzhela then shakes her head and gives you a strained smile. <i>“I’m sorry, I got a little maudlin there. It’s symptomatic of being in a mobile army surgery hospital. Thank you for lending an ear. It’s strange to be the one talking instead of listening for once.”</i>");
	// Return to ‘Her Work’ Talk Menu.
	processTime(4);
	clearMenu();
	addButton(0,"Next",backToAnzhelaWorkTalkMenu,1);
}

//Addiction
public function talkToAnzhelaAboutAddiction():void
{
	clearOutput();
	showAnzhela();
	output("You ask Anzhela about the addictions she’s been treating. The Reds seem so regimented; it’s hard to imagine them succumbing to substance abuse.");
	output("\n\n<i>“During peacetime - or the closest to peace the Scarlet Federation gets - you’d be right. Drug abuse </i>is<i> a lot lower than in the civilian population. But after seven years of outright war and some terrible policies, that’s no longer the case.”</i>");
	output("\n\nYou ask her what policies she’s referring to. Solemnly, she puts down her cup, and clasps her hands on her lap.");
	output("\n\n<i>“...Well, early on, High Command were looking for ways to capitalize on our knowledge of medicine to augment our troops. Back home, they cooked up a bunch of different steroids and performance enhancers, and had us dole them out to select groups of soldiers.”</i>");
	output("\n\n<i>“At the time, the drugs seemed safe. Beneficial, even. But something that seems harmless can have very detrimental long term effects. For instance, one performance enhancer, Blaze, made our soldiers able to fight for three days straight and remain highly alert. The benefits to front-line soldiers were obvious.”</i>");
	output("\n\n<i>“However, Blaze was also highly addictive. It made soldiers edgy and </i>too<i> alert. We stopped using it years ago, but we’re still picking up the pieces,”</i> she sighs. <i>“Yet, there’s drugs we’re ordered to prescribe to soldiers.”</i>");
	output("\n\n<i>“A lot of them we don’t know the long term effects. Of course, the worst addiction by far is the one we endorse the most - ourselves.”</i>");
	// Return to ‘Her Work’ Talk Menu.
	processTime(4);
	clearMenu();
	addButton(0,"Next",backToAnzhelaWorkTalkMenu,2);
}

//Alterants
public function talkToAnzhelaAboutAlterants():void
{
	clearOutput();
	showAnzhela();
	output("Curious, you ask Anzela about the transformatives she mentioned.");
	output("\n\nAnzhela runs a finger around the rim of her cup, her lips pursed. <i>“...We’ve been receiving them from the war labs lately.. I’m meant to offer them to any soldier who wants them.”</i>");
	output("\n\n<i>“Most of them are body enhancers, which increases muscle growth and physical strength - anything to give us an edge against the Golds.”</i>");
	output("\n\nYou ask her why the army is liberally using the treatments. She mournfully smiles.");
	output("\n\n<i>“...Because ‘if we don’t do it, the golds will’, of course. That, and a regular user of body enhancers can be a truly terrifying thing. With that many steroids coursing through them, they’re terrifyingly strong and fly into a rage at the brush of an antennae. It’s one of the reasons we have reinforced restraints on hand here.”</i>");
	output("\n\nYou ask where these chemicals come from. Even though the Federation seems to have decent medical technology, having any kind of transformatives is probably beyond them. After all, they’re still using powder rifles and bi-planes!");
	output("\n\n<i>“Honestly? The whole thing is rather secretive,”</i> Anzhela openly answers, a worried look on her face. <i>“Even though I administer the drugs, I only know very little about the whole thing,”</i> she shrugs, then continues, <i>“Rumor is that early in the war, there were stories about facilities where transformative treatments were being tested on volunteers, some kind of project to create the ‘perfect myr soldier’. Word is the results were impressive, but nothing like the technology your peoples display.”</i>");
	// JimNote: Captain Antmerica! I’m leaving an opening for someone to have fun with this. :3
	output("\n\n<i>“Apparently the offshoots of those experiments are the drugs we use today. The list of side effects is still hideously long, yet we’re still authorized – no, encouraged – to administer them. It’s said that some company called ‘Xenogen’ slipped the Federation a ‘how-to’ guide on genetic manipulation in exchange for... </i>something<i>.”</i> She shrugs again and sips her scova. <i>“...Could be scuttlebutt, though, so make of that what you will.”</i>");
	// Return to ‘Her Work’ Talk Menu.
	processTime(4);
	clearMenu();
	addButton(0,"Next",backToAnzhelaWorkTalkMenu,3);
}

//Scarmed
public function talkToAnzhelaAboutScarmed():void
{
	clearOutput();
	showAnzhela();
	output("You ask Anzhela about ‘SCARMED’, the organization she belongs to, and if it’s part of the military.");
	output("\n\n<i>“Yes and no. SCARMED is the Federal Army’s healthcare organization, but not a Federal Army command,”</i> she explains between sips of her scova, <i>“We’re split into medical and nursing corps; a pretty simple setup, really.”</i>");
	output("\n\n<i>“Under Surgeon-General Sasya, we’re assigned to different parts of the Federal Army. My chain of command is very different to the rank-and-file, though we all answer to the same people at the top. Though that’s changed a little since the new Field Marshal took command.”</i>");
	output("\n\nAnzhela’s eyebrow twitches a little. Does she not like the current commander of Kressia’s armed forces?");
	output("\n\n<i>“SCARMED has existed almost as long as the Federal Army itself. It’s not just made up of field medics and nurses; there’s also dentists, optometrists, psychiatrists, physical therapists, pharmacists, toxicologists, podiatrists - you name it.”</i>");
	output("\n\n<i>“We’re as much for peace time as we are for war, though it’s hard to remember a time when we weren’t at war these days; either with the golds or the nyrea.”</i>");
	// Topic unlocks ‘F. Marshal topic.
	flags["ANZHELA_SCARMED_TALK"] = 1;
	// Return to Regular Talk Menu.
	processTime(4);
	clearMenu();
	addButton(0,"Next",backToAnzhelaTalkMenu,1);
}

//F. Marshal
// Must have viewed Scarmed.
public function talkToAnzelaAboutFMarshal():void
{
	clearOutput();
	showAnzhela();
	output("You observe that the CMO looked a little on edge at the mention of Field Marshal Sellera.");
	output("\n\nAnzhela’s expression looks strained. She presses her fingers against the sides of her cracked cup.");
	output("\n\n<i>“The Field Marshal is - well - she has a lot of zeal. I have no doubt she spends every waking moment thinking about how to wipe the Gilden Republic off the face of the planet,”</i> she carefully states, <i>“...And probably every gold myr, as well.”</i>");
	output("\n\n<i>“I’ve met her for some checkups. She’s got a lot of scars from seven years of non-stop war, not all of them visible on the surface.”</i>");
	output("\n\nYou ask Anzhela if she dislikes the Field Marshal. Her brow furrows. It takes her a while to respond.");
	output("\n\n<i>“...I think she and I have learned different lessons from this war. Suffering can make you kind, or it can make you cruel. She’s a product of this war as much as anyone else.”</i>");
	output("\n\nYou sense she has more to say, but she holds her tongue. Perhaps she’s concerned about being seen as seditious–?");
	// Return to Regular Talk Menu.
	processTime(4);
	clearMenu();
	addButton(0,"Next",backToAnzhelaTalkMenu,2);
}

//Anzhela
public function talkToAnzhelaAboutAnzhela():void
{
	clearOutput();
	showAnzhela();
	output("You ask Anzhela a little bit about herself. She playfully smiles and looks up at you through her dark lashes, all the while blowing the steam off her cup.");
	output("\n\n<i>“Oh, about me-? I was going to ask some questions about you, but you beat me to it.”</i>");
	output("\n\nSince you’re the one who got in first, you insist she start. The female doctor leans back into her chair, looking incredibly ponderous.");
	output("\n\n<i>“...What to start with? My full name, I suppose. I’m Anzhela Sh’en Vayalle. Usually there’s a ‘Doctor’ in front of that, but I think you’ve figured that out already,”</i> she grins, flashing one of her tiny fangs. <i>“I was born on the seventh day of Nylund, so that makes me a Clai, if you follow geo patterns.”</i>");
	output("\n\nGeo patterns? That sounds an awful lot like star signs. You describe them, then ask if they’re anything alike.");
	output("\n\n<i>“Well, we myr don’t look up to the stars a whole lot - what with living underground and all - but it does sound very similar. Geo patterns are to do with relationship between geology, the time you were born and how they might affect your personality.”</i>");
	output("\n\nShe sounds really lively when she’s talking about birth patterns. You ask her if she believes in them.");
	output("\n\nThe doctor coughs into her hand, her cheeks brightly flushed. <i>“O-of course not-! It’s a common thing to answer when someone asks you about yourself, right?”</i>");
	output("\n\nShe proceeds to loudly slurp her tea. <i>“...Right. So. More about me. I’m thirty-one - thankfully no wrinkles yet, though there’s a lot of pressure from my folks to have kids. I was mostly safe until last year - now they’re getting insistent.”</i>");
	output("\n\nYou ask if that means she’s fertile. She nods and brushes back her hair. <i>“Yup. I’m that one in two. Every so often I get a letter from the government telling me ‘pregnancy is my patriotic duty’,”</i> she pauses, then adds, <i>“I’m not against kids, mind you. I just don’t want to do it for my country.”</i>");
	output("\n\n<i>“I don’t think that’s a fair reason to the child, or children. You should have kids because you want to, not because your country told you to.”</i>");
	output("\n\nYou ask her about her hobbies and interests. She smiles and looks up at you with a gleam in her eyes.");
	output("\n\n<i>“Bad movies. Good tea and cocktails. Music and dancing. That’s my list. Now you know every one of my weaknesses,”</i> she quirks an eyebrow. <i>“...So, you’re going to tell me all of yours, right?”</i>");
	output("\n\nThe CMO pesters you until you cough up more about yourself, making sure the conversation is tit for tat.");
	// Return to Regular Talk Menu.
	processTime(4);
	clearMenu();
	addButton(0,"Next",backToAnzhelaTalkMenu,3);
}

//Her Past
public function talkToAnzhelaAboutHerPast():void
{
	clearOutput();
	showAnzhela();
	output("You ask Anzhela about her past. You’re curious to know how she ended up as an army doctor on the front line.");
	output("\n\nShe taps the side of her teacup. <i>“...It’s been a long series of events. I mean, I’m from Esarra, and we don’t have a lot of doctors that far north. It’s a small mining town where everyone knows each other.”</i>");
	output("\n\n<i>“My mother was a doctor and my father a nurse - their practice was attached to our house. I grew up seeing the injured walk through our doors and my parents fix them up.”</i>");
	output("\n\n<i>“It was like magic to me - seeing my parents make people better and put a smile back on their faces. Pretty easy to see why I wanted to become a doctor, right?”</i>");
	output("\n\nAnzhela lets out a long sigh and looks up at the ceiling. <i>“...I aced my tests and went to the capital to study medicine. I wanted to be a non-military doctor, but then the war started just as I graduated.”</i>");
	output("\n\n<i>“Only ex-military got a say in what happened then. I remember being so angry about it - I decided to join SCARMED for two reasons. One was to treat the many war-wounded that would need my help.”</i>");
	output("\n\n<i>“The second was to be able to vote. My parents, even though they were upstanding citizens valued by their community, could never vote or take public office simply because they weren’t veterans.”</i>");
	output("\n\n<i>“Maybe... maybe if more people had been able to vote...”</i> the doctor shakes her head, <i>“Sorry. None of that matters now, right? We are where we are.”</i>");
	
	flags["ANZHELA_HERPAST_TALK"] = 1;
	
	// Return to Regular Talk Menu.
	processTime(4);
	clearMenu();
	addButton(0,"Next",backToAnzhelaTalkMenu,4);
}

//Trench Wives
public function talkToAnzhelaAboutTrenchWives():void
{
	clearOutput();
	showAnzhela();
	output("You ask Anzhela what she thinks of trench wives. She narrows her dark eyes.");
	output("\n\n<i>“...Medical slavery. Getting a woman hooked on your venom without consent and then getting her to be grateful for your drug after the fact. I’ve never, ever seen a gold myr who has been happy with being made a trench wife where the alternative was not being buried six feet under.”</i>");
	output("\n\nWow. She has <i>really</i> strong opinions on trench wives. You ask her how High Command feels about her views?");
	output("\n\nAnzhela leans back and lets out a long, deep sigh. <i>“...Thankfully, High Command is on the fence on the matter. It’s a double edged sword - they don’t support the practice, so I’m allowed to speak my mind, at least in private. At the same time, they don’t decry it, so it still keeps happening as a ‘necessary evil’.”</i>");
	output("\n\n<i>“It’s a necessary evil that only happens to the beautiful soldiers, mind you. Everyone else who’s not beautiful or of proper age ends up either biting a bullet or sent to camps. Obviously the old and the extremely young - namely civilians caught during the invasion of a city - can’t become trench wives.”</i>");
	output("\n\n<i>“I would probably still get in trouble if it wasn’t for the fact I’ve saved so many lives and I’m the CMO.”</i>");
	output("\n\nThe scarlet haired doctor smiles and brushes back her hair. <i>“Sorry. I - I </i>really<i> get worked up when people talk about trench wives. Usually I hold my tongue when it comes to my own people, but since you’re an off-worlder, I kind of exploded all at once.”</i>");
	output("\n\n<i>“It’s probably because every day I have privates bringing in their drugged-up trench wives, either because they’ve overdosed or not dosed up enough. They’re a lot less careful and use higher amounts of venom on the golds because they’re prisoners, not people.”</i>");
	output("\n\n<i>“If the wife-keepers cared about them as much as they claim - and it was consensual - they’d not use the venom on them at all from the get go. Take a venom suppressant and not get them hooked in the first place,”</i> she sadly smiles, <i>“...I don’t see many women lining up for that option. They’re not ‘wives’, they’re ‘sex slaves’.”</i>");
	output("\n\nYou ask her about her venom. Surely she has a similar effect on the people she kisses?");
	output("\n\nAnzhela shakes her head. <i>“I regularly take a venom suppressant. It’s considered strange by my people, but I want someone to be hooked on me for me, not my venom,”</i> She smiles a little saucily and adds, <i>“It also allows me to work on my technique.”</i>");
	output("\n\n<i>“Those girls who rely on their venom get sloppy, you know, and not in the fun way. If I want a gold girl to stick around, I can make it happen.”</i>");
	// Return to Regular Talk Menu.
	processTime(6);
	clearMenu();
	addButton(0,"Next",backToAnzhelaTalkMenu,5);
}

//Leave
// Played regardless of what happens upon leaving.
public function leaveAnzhelasTalkMenu():void
{
	clearOutput();
	showAnzhela();
	output("Once you’ve finished having a cup of scova with the doctor, you thank her for it, then tell her it’s probably time for you to take off.");
	output("\n\n");
	if(rand(3) == 0) output("<i>“Already? Drat, and I was hoping I could pin you down a while longer. Now I’ve got to go back to work!”</i> Anzhela jokes, standing up herself.");
	else if(rand(2) == 0) output("<i>“Thanks for the chat! I very rarely get off my feet, and it’s better to break with good company,”</i> Anzhela smiles, stands up herself.");
	else output("<i>“Next time I’ll have to get some food to go with the scova - at least, if I can procure some,”</i> Anzhela smiles, standing up herself.");
	output(" She walks you to the door and ");
	//AnzhelaQuestDone: 
	//if(flags["9999_placeholder"] != undefined) output("kisses your cheek before you depart.");
	output("warmly shakes your hand before you depart.");

	output("<i>“");
	if(rand(5) == 0) output("Stay safe out there, okay? The best thing you can do for us doctors is not get injured at all!");
	else if(rand(4) == 0) output("Watch out for land mines! There’s more of them around than you think.");
	else if(rand(3) == 0) output("Make sure to watch out for those Nyrea. I hear they’re running rampant between here and Gildenmere.");
	else if(rand(2) == 0) output("Keep your fluids up, and watch out for cock vines!");
	else output("Don’t accept random kisses from strangers, okay? You never know if they’ll slip some extra venom in.");
	output("”</i>");

	processTime(45);
	// PC loses one hour of time.
	// PC is restored of energy and loses 20 lust due to Scova.
	pc.energy(100);
	pc.changeLust(20);
	// Go to Hospital Room and out of Anzhela menu.

	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Check Up
public function giveMeACheckupAnn():void
{
	clearOutput();
	showAnzhela();
	output("You tell the good doctor that you’d like to get checked out. She smiles brightly and gestures to an examination area nearby bed, hand on hip.");
	output("\n\n<i>“Hop on up and I’ll check you out,”</i> she happily offers.");
	if(!pc.isNude()) output(" The red myr then gestures to your clothes, <i>“Just strip off your things first and we’ll get to it.”</i>");
	else output(" <i>“You’re already naked, so we can get right to it.”</i>");

	//NotNude:
	if(!pc.isNude())
	{
		//Lower Exhibition Score:
		if(pc.exhibitionism() < 66)
		{
			output("\n\nW-what? Strip off, here, now? You look around the room at all the doctors, nurses and patients, a flush rising to your cheeks.");
			output("\n\nAnzhela clicks her tongue and pulls a hospital curtain around the examination area, ensuring your privacy.");
			output("\n\n<i>“Theeere you go - so shy! You don’t need to worry; we’re all medical professionals here, and the soldiers are used to seeing each other in the buff.”</i> Anzhela hugs her waist, <i>“It’s only me watching now.”</i>");
			output("\n\nStill flushing furiously, you strip off your [pc.gear]. She’s a medical professional, you tell yourself... but you swear she’s taking a good gander at your [pc.ass] as you change.");
		}
		//Else / High exhibition score:
		else
		{
			output("\n\nNot feeling the least bit embarrassed, you begin stripping off your [pc.gear], not caring if the privacy screen is closed or not.");
			output("\n\nSome of the doctors, patients and nurses look, admiring the free show. You begin to tease them a little, slowly sliding off your kit inch by inch.");
			output("\n\nCoughing a little, Anzhela closes the privacy curtain. <i>“...Hey, you’re here for a check-up, not to give a free show. Hurry up!”</i>");
		}
	}
	output("\n\nWhat kind of examination is it?");
	processTime(2);
	clearMenu();
	//[FirstAid] [AnalExam]
	addButton(0,"FirstAid",firstAidWithAnn,undefined,"FirstAid","Get checked over and treated for any injuries you may have.");
	addButton(1,"AnalExam",analExam,undefined,"AnalExam","Get the inside of your ass examined. For science.");
}
// FirstAid.tooltip: Get checked over and treated for any injuries you may have.
// AnalExam.tooltip: Get the inside of your ass examined. For science.

//First Aid
public function firstAidWithAnn():void
{
	clearOutput();
	showAnzhela();
	//NonNude: 
	if(!pc.isNude()) output("Once you’re fully naked");
	else output("Fully naked");
	output(", you climb onto the examination table and lie down. Every inch of you is tingling. You can’t tell if it’s from nervousness or excitement.");
	//if HP < 100% / Injured in any way:
	if(pc.HP() < pc.HPMax())
	{
		//if HP < 30%:
		if(pc.HP()/pc.HPMax() < .3)
		{
			output("\n\nAnzhela furrows her brow as she examines your bruised and battered body. There’s a look of worry in her dark eyes.");
			output("\n\n<i>“How in the depths did you get this roughed up?”</i> She shrilly asks. At the same time, she slips on some new gloves. <i>“Lie back and I’ll fix you up. Honestly, I can’t let you out of my sight.”</i>");
		}
		//else if HP < 80%
		else if(pc.HP()/pc.HPMax() < .8)
		{
			output("\n\nAnzhela lightly furrows her brow as she examines your bruised and battered body. She lightly clicks her tongue.");
			output("\n\n<i>“Been getting into some fights, I see? Lie back and I’ll fix you up,”</i> she exclaims, slipping on some new gloves. <i>“Honestly, [pc.name], you’ve got to take care of yourself!”</i>");
		}
		//else / More than 80% hp
		else
		{
			output("\n\nAnzhela smiles and touches your tiny wounds, quirking an eyebrow. She looks deep into your eyes.");
			output("\n\n<i>“...It’s barely a scratch. I’ll fix it right up,”</i> she grins, putting on some new gloves. There’s a bounce to her step. <i>“I’m really glad you’re not very injured.”</i>");
		}
		output("\n\nAfter the CMO gives you some tablets for the pain, she bastes a cool pink goo on your ");
		if(pc.HP()/pc.HPMax() < .3) output("numerous");
		else if(pc.HP()/pc.HPMax() < .8) output("many");
		else output("scant");
		output(" wounds. Pulling out some dressing, she binds and ties them off.");

		//FirstTimeGettingTreated:
		if(flags["ANZHELA_TREATED"] == undefined)
		{
			output("\n\nOnce she’s finished, Anzhela leans over you, curly locks framing her face. There’s an intense look in her eyes. Her fingertips brush your wrapped up chest.");
			output("\n\n<i>“You know, I have to give you one more thing to make you all better. Doctor’s orders,”</i> she huskily tells you.");
			output("\n\nAnzhela inches closer to you. You feel her soft plump lips pressing against yours. One sweet kiss later, she strokes your [pc.hair], a warm look in her alien eyes.");
			output("\n\n<i>“...There, </i>now<i> you’re all better. Can’t send you off without proper treatment, now can I?”</i> she crosses her arms, a coy smile playing on those wine-red lips.");
			output("\n\nFeeling surprised, you ask her if she does that for all her patients. Anzhela shakes her head.");
			output("\n\n<i>“Of course not! Just the ones I really like,”</i> she winks. <i>“You come back if you get injured, alright? I’ll always patch you right up, good as new.”</i>");
		}
		//Else / NotFirstTimeTreated:
		else
		{
			output("\n\nAs usual, Anzhela’s eyes glitter once she’s finished treating you. Leaning over you with curly locks framing her face, she brushes her fingers across your wrapped up chest.");
			output("\n\n<i>“Now for that last little thing to make you all better,”</i> she huskily tells you.");
			output("\n\nAnzhela inches closer to you. You feel her soft plump lips pressing against yours. One sweet kiss later, she strokes your [pc.hair], a warm look in her alien eyes.");
			output("\n\n<i>“...There, </i>now<i> you’re all better. You better keep yourself in proper shape, no matter how much you like getting waited on by a pretty doctor, okay?”</i> She hugs her waist, a coy smile playing on those wine red lips.");
		}
	}
	//Else // PC is completely uninjured:
	else
	{
		output("\n\nAnzhela looks you over and quirks a brow. Pulling back, she hugs her waist, her plush red lips pulled into a smile.");
		output("\n\n<i>“Absolutely no injuries whatsoever. I’m perfectly happy to have such a healthy patient, but why do I have the feeling you just wanted the attention of a pretty doctor, not to be patched up?”</i> There’s amusement in her voice.");
		output("\n\nYou cough a little and sit up, grabbing your things. <i>“Well, it’s always good to get a regular check up,”</i> you utter.");
	}
	IncrementFlag("ANZHELA_TREATED");
	// Heal the PC fully!
	// Increase lust by 10!
	// Return to core Anzhela menu.
	pc.changeHP(pc.HPMax());
	pc.changeLust(10);
	anzhelaMenu();
}




//AssExam
// No Taurs. Sorry taurs.
// Must have two legs.
// Must have front genitals.
public function analExam():void
{
	clearOutput();
	showAnzhela();
	output("<i>“So, what did you want examined today?”</i> The curly-haired doctor curiously asks, tilting her glasses.");
	output("\n\nWith flushing cheeks, you tell Anzhela you’d like her to check out your ass. With a professional smile, she gestures towards an examination bed with medical stirrups designed to keep your legs in the air and spread apart.");
	output("\n\nWith a nervous flutter in your chest, you lie down naked on the cool, leathery table on your back. She grabs your [pc.feet] and places them in the cushy stirrups, strapping them in tight.");
	output("\n\nYou shiver as a cool breeze washes over and teases your nethers. You’re acutely aware how exposed your poor posterior is right now, your [pc.skinColor] cheeks awaiting her probing touch.");
	output("\n\n<i>“Feeling relaxed? Don’t worry, I’ll be gentle,”</i> Anzhela smiles, slipping on a pair of white rubber gloves. She tugs at the bottom, wiggling her fingers into the narrow fabric. Your heart races as you picture those same digits tightly sheathing themselves inside of your exposed pucker and roaming around inside of your rump.");
	output("\n\nYou swallow hard and your [pc.thighs] deliciously shiver in the stirrups. You’re getting ");
	if(pc.hasCock()) output("hard");
	if(pc.isHerm()) output(" and ");
	if(pc.hasVagina()) output("wet");
	if(!pc.hasGenitals()) output("all worked up");
	output(" already.");
	if(pc.hasGenitals()) 
	{
		output(" Since you’re naked, your arousal is blatantly on display, ");
		if(pc.hasCock()) output("your [pc.cocks] pressing shamelessly against your [pc.belly]");
		if(pc.isHerm()) output(" and ");
		if(pc.hasVagina()) output("your [pc.vaginas] glistening and wet");
		output(".");
	}
	output("\n\nEven though it’s obvious, the female doctor says not a word about your glaring titillation. Instead, she takes the stethoscope off her neck and puts the ear buds in. Not even breathing on the end-piece to warm it, she instead places the cool metal and plastic on your [pc.chest]. She slides it across your [pc.skinFurScales] and teases it over your aroused [pc.nipplesNoun]. You’re so damn aroused, your breathing becomes ragged, and you can’t help but heave your chest as the stethoscope end settles over your racing heart.");
	output("\n\n<i>“Such a strong heart! I like to hear that it’s racing,”</i> the scarlet-haired doctor winks, rubbing her hand against your naked chest. <i>“But perhaps it’s going a little </i>too<i> fast? I should definitely check your temperature.”</i>");
	output("\n\nAnzhela pulls a thermometer from her white coat pocket. Opening your mouth, you say <i>“ahh”</i>, but she has another place in mind! Instead, she dabs some medical lube on your [pc.asshole] and then presses the cold, hard object inside your trembling rectum.");
	output("\n\n<i>“I-I thought you were going to put it in my mouth,”</i> you flush, biting your lower lip as the thermometer rubs around inside of you.");
	output("\n\n<i>“Assumption is the mother of all mistakes,”</i> Anzhela winks, <i>“Now clench and hold it there, but not too tight, okay?”</i>");
	output("\n\nYou flush and lightly clench your rectum around the long, stiff object jammed in your butt. It’s just a check-up, but why does it feel so lewd...?");
	output("\n\nAs she waits for the thermometer to take your temperature, the svelte doctor strokes your [pc.hair] and smiles warmly. Once some time has passed, she plucks the little glass tube out of your pucker and holds it up to the light.");
	output("\n\n<i>“Your body temperature is quite high! We’ll definitely need to do a rectal exam,”</i> the redhead doctor smiles, snapping her rubber gloves. She smears some medical lube on her index and middle fingertips and uses them to massage your [pc.asshole].");
	output("\n\nGasping out loud, your ringed muscle twitches and your thighs wildly quake in the stirrups. It’s good that your legs are strapped in, or else you’re sure you’d be all over the place.");
	output("\n\n<i>“Calm yourself! This is an examination, nothing more,”</i> Anzhela chastises you and you flush brightly. Still, there’s a devilish gleam in the doctor’s eyes as she slips two fingers inside your anus and spreads them wide, keenly examining the inside of your rump.");
	output("\n\nHer fingers stretch up inside of your [pc.asshole], seeking out that sweet pleasure point. When she finds it, you shiver and swallow hard, trying not to <i>moan</i>.");
	if(pc.hasCock()) output(" T-the doctor’s stroking your prostate!");
	else if(pc.hasVagina()) output(" Her digits are stroking the thin lining separating your rectum and g-spot. She’s stimulating it from the other side!");

	output("\n\n<i>“I need to check to see if your ");
	if(pc.hasCock()) output("prostate is");
	else output("rectum walls are");
	output(" healthy,”</i> Anzhela tells you. With very little pressure, she strokes your hyper-sensitive spot, knowing how fragile and responsive the tissues are. All it takes is one little rub before you’re moving and making noise, whimpering in delight as ");
	if(pc.hasCock()) output("pre-cum leaks out of your [pc.cockHeads]");
	if(pc.isHerm()) output(" and ");
	if(pc.hasVagina()) 
	{
		output("slickness dribbles from your slit");
		if(pc.totalVaginas() > 1) output("s");
	}
	if(!pc.hasGenitals()) output(" your thighs quake");
	output(".");

	output("\n\n<i>“Very responsive! Perhaps too responsive? I should take a look,”</i> the doctor purrs and pulls her lubed-up fingers out of your posterior with a ‘plop’. Reaching over, she grabs a metal speculum and begins to lube up the end. <i>“This will be a little cold, so bear with it.”</i>");

	output("\n\nWith breathy anticipation, you eye the duck-billed device. The two parts of the metal ‘beak’ are closed, attached to a hinge-like handle on the end. She’s going to stick that up your bottom-?");

	output("\n\nYou’re helpless to resist as the scarlet-haired doctor slowly guides the rounded end up into your rectum. The cool metal outside of the speculum brushes and caresses your sensitive inner tissues, working its way deep inside of your [pc.ass]. It feels <i>exquisite</i>.");

	output("\n\nWith unfocused eyes and parted lips, you let out a sordid little moan. You <i>know</i> it’s just an examination, but your ");
	if(pc.hasGenitals())
	{
		if(pc.hasCock()) output("[pc.cocks]");
		if(pc.isHerm()) output(" and ");
		if(pc.hasVagina()) output("[pc.vaginas]");
		if(pc.totalCocks() + pc.totalVaginas() <= 1) output(" is");
		else output(" are");
		output(" so ");
		if(pc.hasCock()) output("hard");
		if(pc.isHerm()) output(" and ");
		if(pc.hasVagina()) output("wet");
	}
	else output("loins are burning so hotly");
	output(" that you just can’t stand it!");

	output("\n\n<i>“Now push like you’re making a movement, and then relax. It’ll help me get it deeper,”</i> Anzhela urges you.");

	output("\n\nDeeper - it’s not deep already? You tremble and clench your inner muscles as instructed, then relax. As soon as you do, the cool speculum shoots further up your rectum and you let out a trembling gasp.");

	output("\n\nSlowly and with great precision, Anzhela eases the speculum open inside of your rectum. You feel impossibly stretched open and your ass feels like it’s positively gaping; probably because it is!");

	output("\n\n<i>“There we go. That wasn’t so bad, was it?”</i> Grabbing a small hand-held flashlight, the curly-haired doctor turns it on and points it inside the speculum. She peers intensely inside your poor pucker and deep in your ass, her half-rim glasses riding low on her nose. <i>“Shall I describe it to you?”</i>");

	output("\n\nYou nod, more than a little curious. Anzhela pulls her wine-red lips into a winning smile.");

	output("\n\n<i>“The walls of your rectum are flushed pink with blood and glistening with lubricant. It’s entirely clean and empty. Top notch,”</i> the doctor informs you. Knowing that makes you flush even more - she’s now seen a part of you no one ever has!");

	output("\n\n<i>“You’ve been a very good patient. Now that I’ve taken a look, how about I reward you for all your good work?”</i> Anzhela purrs, closing and pulling the metal speculum out of your bare [pc.skinColor] bum. A reward – what kind of reward?");

	output("\n\nYou don’t have to wait long to find out. The svelte doctor sensuously and slowly begins to fuck your [pc.ass] with the speculum. You groan and dig your feet into the stirrups, fingers digging and clawing at the bed beneath you.");
	pc.buttChange(pc.analCapacity()/2 + 5);

	output("\n\n<i>“There you go. I could give you a lollipop, but isn’t this so much better?”</i> She coos, sweetly sinking it back and forth inside of your [pc.asshole]. You can’t take it anymore - with a shrill cry, you convulse and ");
	if(pc.hasCock()) 
	{
		output("shoot ");
		var cum:Number = pc.cumQ();
		if(cum < 7) output("tiny dribbles");
		else if(cum < 25) output("thin streams");
		else if(cum < 250) output("thick streams");
		else if(cum < 2500) output("large puddles");
		else output("glorious gallons");
		output(" of [pc.cum] all over your [pc.belly].");
	}
	else if(pc.hasVagina())
	{
		output("utterly cream yourself. You ");
		if(!pc.isSquirter()) output("gush");
		else output("squirt");
		output(" [pc.girlCum] from your [pc.vaginas], your [pc.thighs] quaking in rapturous delight.");
	}
	else output("your [pc.thighs] quake in rapturous delight.");

	output("\n\nAnzhela shoots you a saucy smile and pulls the speculum out of your trembling backside, leaving your [pc.asshole] twitching and yearningly empty. Putting it down, she then pulls your legs out of the stirrups and pulls some sheets over you. You’re so dizzy with delight, you barely register what’s going on - all you know is that you’re suddenly covered in soft warmth, and there’s someone stroking your face, speaking to you in a soft, calming voice.");

	output("\n\n<i>“There you go. Did you enjoy yourself? The examination’s over now,”</i> the scarlet-haired doctor informs you. Your ass and loins are still deliciously throbbing and tingling. She grabs you a drink and a straw, bringing it to your [pc.lips]. <i>“Sip. It’s juice, to regain your strength.”</i>");

	output("\n\nYou happily drink the fluids, sucking on the straw as Anzhela fusses over you. Once you’ve regained your strength, you get up and slip your [pc.gear] back on. What a rush!");

	// Back to core Anzhela menu.
	// Lust drained.
	// Anal looseness increased.
	processTime(27);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//S.Relief
// PC must have 30+ lust to click.
public function sReliefAnn():void
{
	clearOutput();
	showAnzhela();
	//First Time:
	if(flags["S_RELIEF_ANN"] == undefined)
	{
		output("Anzhela looks you over, quirking an eyebrow. Suddenly, she rushes up to you and takes your temperature. <i>“...Oh my! You look a bit flushed, dear. How are you feeling-?”</i>");
		output("\n\nAs she presses in, you feel her body rub intimately close to yours. Every other thought evaporates from your mind as her awesome breasts press up against you. Void, what you wouldn’t give to fondle those soft, luscious tits-!");
		output("\n\n... Reacting to your thoughts, ");
		if(pc.hasCock()) 
		{
			output("[pc.eachCock] goes stiff");
			if(!pc.isCrotchExposed()) output(" against your [pc.lowerUndergarment]");
			output(", brazenly declaring your arousal.");
		}
		else output("your [pc.thighs] quake and you bite your lower lip.");

		output("\n\nWith a quirked eyebrow, Anzhela reaches down and strokes your [pc.thigh]. She traces her long, talented fingers ever so close to your ");
		if(pc.hasVagina()) output("moist");
		if(pc.isHerm()) output(" and ");
		if(pc.hasCock()) output("raging");
		if(!pc.hasGenitals()) output("smooth, trembling");
		output(" loins. <i>“You seem a little worked up,”</i> she sultrily purrs, running her hand pointedly up and down, stroking your [pc.skinFurScalesNoun].");

		output("\n\n<i>“How about we work a little of that frustration off? Doctor’s orders,”</i> she leans in and kisses your ");
		if(pc.tallness <= 72) output("neck");
		else output("chest");
		output(", sensuously suckling upon it. You moan in delight. She nibbles upon it; ravenous, hungry, insistent.");

		output("\n\n<i>“...It’s a very bad thing for soldiers to go out in the field while they’re all pent up, you know? You can lose a battle that way; it’s better if you let all out here, off the field");
		if(pc.hasCock()) output(", or perhaps in mine?");
		else output(".");
		output("”</i>");

		output("\n\nShe grabs one of your hands and slides it up her short black skirt. Your fingers make contact with an incredible heat, barely contained behind a thin layer of lace. Seems you’re not the only one worked up!");
		flags["S_RELIEF_ANN"] = 0;
	}
	//Else / Not first time:
	else
	{
		output("Coughing a little, you tell Anzhela you’re feeling very worked up, and could really use some relief.");
		output("\n\nWith a sensuous smile, the svelte doctor presses up against your body. She brings up a hand to check your temperature... then one down to check your ‘other’ symptoms.");
		output("\n\n<i>“Well, you’re definitely not faking,”</i> she huskily purrs, <i>“And I can’t very well have you going out in the field all worked up, now can I?”</i>");
		output("\n\nYou shake your head, and she leans in and kisses your ");
		//notSuperTall: 
		if(pc.tallness <= 72) output("neck");
		else output("chest");
		output(", sensuously suckling upon it. You moan in delight.");
		output("\n\n<i>“The only question is, what to prescribe for your acute condition?”</i> she muses, nibbling your sensitive [pc.skinFurScalesNoun].");
	}
	//IncrementFlag("S_RELIEF_ANN");
	processTime(2);
	clearMenu();
	//[Hike&Fuck] [CowGirl]
	//Have a dick. Can't be over 1000 volume. JimT had this as a 4"+ thing, but I'm cutting that.
	if(pc.hasCock() && pc.cockThatFits(1000) >= 0)
	{
		addButton(0,"Hike&Fuck",hikeAndFuck,undefined,"Hike&Fuck","Bend her over, hike up her skirt and give her a taste of your [pc.cock]!");
		if(pc.isTaur()) addDisabledButton(1,"Cowgirl","Cowgirl","Cowgirl isn’t really a position that works with your tauric proportions.");
		else addButton(1,"CowGirl",cowgirlWithAnzhela,undefined,"CowGirl","Fool around in one of the beds and see what pops up!");
	}
	else
	{
		if (pc.hasCock())
		{
			addDisabledButton(0, "Hike&Fuck", "Hike&Fuck", "Your penis is too big for this.");
			addDisabledButton(1, "Cowgirl", "Cowgirl", "Your penis is too big for this.");
		}
		else
		{
			addDisabledButton(0, "Hike&Fuck", "Hike&Fuck", "You need a penis to do this.");
			addDisabledButton(1, "Cowgirl", "Cowgirl", "You need a penis for this.");
		}
	}
	addButton(2,"Strap-On",annStraponScene,undefined,"Strap-On","Ride her strap-on.");
	addButton(14,"Back",backToAnzhelaMenuFromSex);
}

//Sex Scenes
//Cowgirl
// PC must not be a taur.
// PC must have a cock larger than 4 inches
public function cowgirlWithAnzhela():void
{
	clearOutput();
	showAnzhela(true);
	var x:int = pc.cockThatFits(1000);
	if(x < 0) x = pc.smallestCockIndex();

	output("The good doctor leads you over to one of the hospital beds, and with a loud <i>swish</i> pulls the privacy curtain shut – she doesn’t even turn around to do it! In a hurried, passionate rush, you ");
	if(pc.isNude()) output("help her tear off her clothes");
	else output("both tear off your clothes");
	output(", and within moments you’re both naked and falling into the bed behind you. Everything is a mess of glorious kisses, moans, and soft skin.");

	output("\n\nWhen you look up, you realize you’ve been straddled by the scarlet haired doctor, her soft and shapely spheres gloriously bared to your eyes alone. With flushing cheeks, she grabs your hands in her own, guiding them upwards with feverish urgency. They slide up her taut belly until they’re tickling the bottom of her brazenly formed breasts, cupping them sensuously from below.");
	output("\n\n<i>“Do you like them–?”</i> Anzhela asks, looking down through her long, dark lashes; a rare moment of self-consciousness from the typically composed doctor. You genuinely nod, totally enraptured with them. With a cheeky grin, you reach out and pinch her dusky nipples, just the slightest tug drawing a sensuous moan from her plush, wine-red lips. Her naked loins brush against yours, and though you haven’t seen them yet, you <i>feel</i> the exquisite brushing of her naked womanhood rubbing against your already stiff shaft.");
	output("\n\nWith each excited wiggle, her petal-like folds brush against your underside, drenching them in her ever-increasing slickness.");
	output("\n\nDriven by your insatiable carnal need, you slide your hands around and grab her perfectly round ass, pushing her ");
	if(pc.cocks[x].cLength() < 12) output("just a few inches ");
	output("forward until your [pc.cockHead " + x + "] is brushing against her warm wetness. Before you can thrust, the trembling doctor pushes her hips backwards and sinks back onto your [pc.cockNounSimple " + x + "]! Both of you moan as your dick slides up into her petal-smooth center.");
	pc.cockChange();
	//PcCockBelow12 inches:
	if(pc.cocks[x].cLength() < 12) output(" You bottom out inside of her, your tip rubbing");
	else if(pc.cumQ() >= 200 && rand(2) == 0) output(" It doesn’t take long before you bottom out inside of her against her deepest, sweetest point, dribbling out [pc.cumVisc] pre-cum as your tip rubs");
	else output(" Given your length, you fill her up long before you sink all the way in, your prodigious prick only half inside of her. It’s still incredibly intense as your tip rubs");
	output(" against her womb entrance.");

	output("\n\nYou gloriously grind against each other like that, your hips meeting each other in pagan rhythm. Her beautiful breasts sway and bounce before your eyes as she bounces lustily on your [pc.cock " + x + "], moaning and dribbling her slick girl-juice down your shaft");
	if(pc.balls > 0) output(" and [pc.balls]");
	output(". It’s hard to imagine anyone <i>can’t</i> hear you, but you’re both so caught up in such all-consuming pleasure that you don’t <i>care</i>. All either of you can think about is hungrily pressing and rubbing against each other – you inside of her – as you push each other further towards that exquisite brink.");
	output("\n\nWith a sharp cry, Anzela pushes herself into your shoulder, trembling wildly and convulsing against you. Her slender hips shake and shudder along with her warm, wet insides, wringing and clenching around your [pc.cockNounSimple " + x + "]. The sweet sound and feel of her cumming sets you off, and you shake against her in turn, shooting your [pc.cum] deep inside of her quaking insides. Your virile seed floods up and into her eagerly awaiting uterus, filling her up with you utterly and completely.");
	output("\n\nSweaty, satisfied, and thoroughly exhausted, you lie on each other in the hospital bed, your chests rising and falling against each other in perfect rhythm. Her fingertips brush affectionately against your chest, teasing your [pc.skinFurScalesNoun]. Your own reach down and stroke through her luscious hair, enjoying the softness as you both bask in sublime afterglow.");
	output("\n\nEventually, though, you both have to move. With a reluctant look, Anzhela picks herself off you, her curly locks all over the place and her naked skin covered in a sexy sweat. <i>“...Well, I think that relieved <i>both</i> our needs, don’t you–?”</i> she asks, a glittering look in her dark eyes. <i>“I really could stay in bed all day with you, but I honestly need get back to work. As much as I don’t </i>want<i> to.”</i>");
	output("\n\nYou admire the sight of the sexy doctor slipping back on her clothes and trying to contain the stream of your [pc.cum] leaking down her thighs. She blushes with delight, pulling her panties and stockings on, and trying her best to hide it beneath her skirt. <i>“...Let’s see if I can last the day without anyone noticing.”</i>");
	output("\n\nWith a sexy little saunter, the CMO pulls back the screen and strides off. The staff are trying hard not to pay attention to you both, but by the flicking of their eyes, it’s clear they’re <i>very</i> interested in what the doctor and the off-worlder were doing in that cubicle!");
	// Scene end. Return to menu.
	processTime(23);
	pc.orgasm();
	IncrementFlag("S_RELIEF_ANN");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Hike & Fuck
// PC must have a cock larger than 4 inches
public function hikeAndFuck():void
{
	var x:int = pc.cockThatFits(1000);
	if(x < 0) x = pc.smallestCockIndex();
	clearOutput();
	showAnzhela(true);
	output("You’re both feverishly all over each other on the way to one of the hospital beds. Between kisses and love bites, <i>somehow</i> you manage to pull the privacy curtain shut.");
	output("\n\nAnzhela captures your lips with a hungry urgency. She slides her tongue between your parted lips. The doctor’s arms slide around your waist. Spreading her legs, she pulls you close and your hips rest against her stocking clad thighs.");
	output("\n\nYou pull back and watch as her beautiful dark eyes widen and her plush lips part. <i>“W-why’d you stop?”</i> She breathily asks, and you grin. Her scarlet cheeks are flushed with arousal, and her breathing is hurried. The doctor needs you and she needs you <i>stat</i>.");
	output("\n\nReaching around Anzhela’s waist, you seize her soft well-rounded myr ass, cupping and squeezing her pliable backside. Moaning in delight, she rubs her skirt-covered ass into your hands. <i>“...Too many clothes. ");
	if(pc.isNude()) output("I’m");
	else output("We’re");
	output(" wearing WAY too many clothes.”</i>");

	output("\n\n<i>“You are,”</i> you answer, grinning. Turning her around on the spot, you give her a little shove and she lets out a surprised squeak. Pressing her hands on the bed, the doctor is deliciously bent over. Now you’ve got a perfect view of that premier ass!");

	output("\n\nSliding your hands up Anzhela’s stocking-clad thighs, you slip up her black mini-skirt until it is bunched around her waist. Like an unwrapped present, her pert round buttocks are exposed to you, perfectly framed by her garter belt.");
	output("\n\nGrabbing her hips, you slide [pc.oneCock] between her thighs. As you stroke it back and forth against her cloth-covered mound, the curly-haired doctor lets out a shivering moan.");
	output("\n\n<i>“I... I need your cock,”</i> the scarlet skinned woman huskily moans, rubbing her panty clad crotch along your " + num2Text(Math.floor(pc.cocks[x].cLength())) + "-inch pillar.");

	output("\n\nYou grab Anzhela’s panties and slide them down her stocking-clad thighs. The doctor is now in an incredibly lewd position; her skirt and coat hiked up as her underwear sexily clings to her knees.");

	output("\n\nHow do you want to take her...?");

	processTime(19);
	clearMenu();
	//[Vaginal] [Anal]
	addButton(0,"Vaginal",vaginalHikeNFuck,x,"Vaginal","Put it in her vagina.");
	if(silly) addButton(1,"Anal",anzhelaAnalSexHikeAndFuck,x,"Anal","Put your sharpie in her pooper.");
	else addButton(1,"Anal",anzhelaAnalSexHikeAndFuck,x,"Anal","Put it right between her buns.");
}

//Vaginal
public function vaginalHikeNFuck(x:int = 0):void
{
	clearOutput();
	showAnzhela(true);
	output("With primal need, you grab her gorgeous garter-clad hips and ease your [pc.cock " + x + "] into the hot, silky depths of her welcoming pussy. ");
	pc.cockChange();
	if(pc.cocks[x].cLength() <= 6) output("Once your shlong is fully sheathed, you passionately rub your [pc.cockHead " + x + "] against her vulnerable cervix.");
	else
	{
		if(pc.cocks[x].cLength() >= 12)
		{
			output("With your");
			if(pc.cocks[x].cLength() >= 15) output(" prodigiously");
			output(" long prick, y");
		}
		else output("Y");
		output("ou passionately rub your [pc.cockHead " + x + "] against her vulnerable cervix.");
	}
	output(" Trickles of feminine excitement leak down her round stocking-clad thighs and she sweetly moans.");

	output("\n\nClinging to the bedsheets, Anzhela’s red curly hair falls free and sexily wild. Her cheeks are flushed with delight and her glasses are falling off her face - the doctor looks deliciously messed up!");
	output("\n\n<i>“Ahhh... your [pc.cockNoun " + x + "]... I love it,”</i> the bedraggled beauty deliriously moans. Like a wild beast, she bucks her bare butt back against your slapping hips and eagerly takes your [pc.cockHead " + x + "] deep inside of her velvety vise. Your mind is exquisitely blown every time her cunt contracts around your thrusting prick, squeezing and milking it eagerly for your [pc.cumVisc] prize.");
	output("\n\nWith a sweet little moan, Anzhela creams herself around you. She squirts and squeezes as rivers of girl-juice liberally stream down her trembling, stocking clad thighs. As she constricts her warm, wet nethers around your [pc.sheath " + x + "], dribbles of hot pre-cum are forced down your urethra and sinfully squeezed out of your cock-hole.");
	output("\n\nLike an artist’s brush, you paint Anzhela’s slippery passage with your [pc.cumNoun]-dipped prick, turning her dribbling muff into a soppy masterpiece. It’s not long before she’s stirred up into a frenzy once more. She lustily lifts her hips, allowing your [pc.cockHead " + x + "] to smear your seed even deeper.");
	output("\n\n<i>“Cum... cum inside of me - I want to feel your hot cum spurting deep inside of me,”</i> the redhead doctor breathily begs. Hearing her desperate urging gets you wildly fired up and you pick up the pace, slapping your hips against her bare ass.");
	output("\n\nHappy to indulge, you groan and passionately bury your [pc.cockHead " + x + "] deep inside of her hot, squeezing depths. ");
	var cum:Number = pc.cumQ();
	if(cum < 25) output("Tiny little spurts of your broiling, [pc.cumVisc] spunk shoot against the entrance to her eagerly awaiting womb. Even though you don’t cum much, just feeling you twitch and flex inside of her sets your lover off; her whole body quakes and warm jets of girl cum pool inside of her netherlips. Your pulsing prick is quickly wrapped in a titillatingly thermal sensation and, once you’re finished shooting your load, her lady juice floods around yours against and into your dilated dick-slit, filling it with a delicious tickling warmth.");
	else if(cum < 1000) output("Slickly spurting your warm, [pc.cumVisc] spunk inside of her, you batter it deep against the entrance to her eagerly awaiting womb. Having you liberally spill your baby-batter inside of her sets your lover off; her whole body quakes and warm jets of girl cum pool inside of her netherlips. Her sweet juices mix with your [pc.cumNoun] and wrap your pulsing prick in a titillatingly thermal sensation.");
	//LargeCums:
	else output("You liberally unload gigantic jets of warm, [pc.cumVisc] spunk inside of her, not only battering it deep inside of her but quickly filling up her eagerly awaiting womb until her belly lightly swells as if she’s pregnant. Feeling the pressure of you packing her pussy and stomach with your [pc.cumNoun] sets your lover off; her whole body quakes as she clings to her expanding belly, stocking-wrapped thighs quaking and quivering with orgasmic delight.");

	output("\n\nAnzhela moans and rubs her ");
	if(cum >= 3000) output("swollen stomach");
	else output("belly");
	output(", a dreamy, blissed-out look on her face. <i>“");
	if(cum < 25) output("That was amazing. I felt you come, right?");
	else output("It feels so </i>warm<i>...");
	output("”</i>");

	output("\n\nYou stay buried inside of her for a while and relish in her slick muscles twitching and squeezing your sensitive prick. After a little while you pull out of her sloppy slit. The female doctor looks gloriously ravaged - curly hair wild, skirt hiked up, collapsed face-first on the bed ");
	if(cum >= 25) output("with [pc.cum] leaking from her well-fucked pussy ");
	output("- there really is no more glorious a sight.");
	if(cum >= 25 && cum < 3000) output(" Your spunk pools into her now stretched panties and stains them with your seed.");
	if(cum >= 3000) output(" The moment she’s unplugged, streams of your spunk pour out of her parted pussy lips. Her lacy panties are utterly drenched as a pool spreads between her shaking lace-covered legs.");

	output("\n\nYou help Anzhela up as she blushes and rearranges her messy hair and clothes; she is the chief medical officer after all!");
	if(cum >= 25) 
	{
		output(" However, without a spare pair of panties - or perhaps by choice - she simply pulls up her [pc.cumNoun]-soaked panties. With a wiggle and a wink, the doctor pushes down her short skirt, hiding her naughty little spunk-covered secret.");
		output("\n\n<i>“I’m going to be leaking you out of my pussy all day, so I may as well wear these,”</i>");
	}
	else output("\n\n<i>“There’s never a bad time of day for </i>that<i> to happen,”</i>");
	output(" Anzhela sultrily purrs. She then wraps her arms around your waist and gives you a steamy kiss. <i>“...Come again any time you want to, you know, ‘come again’. It’s good to visit your doctor often, you know?”</i>");
	output("\n\nWith a sexy little saunter, the CMO pulls back the screen and strides off. As soon as she’s left the cubicle, she’s immediately mobbed by hospital staff, clearly waiting for her approval for something.");
	if(cum >= 25) output("\n\nYou grin as you spot a trickle of [pc.cumColor] streaming down one of her thighs. Will anyone else notice, you wonder? You feel a delicious sense of accomplishment knowing the important woman is still filled with your [pc.cumVisc] [pc.cumNoun].");
	// Scene end. Return to menu.
	processTime(23);
	pc.orgasm();
	IncrementFlag("S_RELIEF_ANN");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Anal
public function anzhelaAnalSexHikeAndFuck(x:int = 0):void
{
	clearOutput();
	showAnzhela(true);
	output("Her ass is just too sweet not to claim. Looking about, you spot a clear bottle of surgical lubricant with a tapered tip. You snatch it up with a grin and press the bottle-tip between her bare red buttocks.");
	output("\n\n");
	//First time: 
	if(flags["ANZHELA_ANALED"] == undefined) output("The female doctor squirms and lets out a slight squeal. <i>“W-w-what are you doing-? That’s the wrong hole!”</i> she breathily stammers. Her virgin rump clenches tight - despite her risque underwear, the redhead seems to be very inexperienced in sticking things up <i>there</i>.");
	else output("The female doctor squirms and lets out a slight squeal, <i>“Y-you’re planning to stick it there again-?”</i> She breathily stammers. Her maidenly rump clenches tight - even though you’ve done her there before, it seems she has some reservations. After all, it was a <i>very</i> intense experience. Perhaps she needs a little convincing?");

	output("\n\nTeasing her a little more, you squeeze the medical bottle and shoot a cool stream of sticky lube between her trembling tuckus. A palpable shiver travels up her spine and the doctor lets out a lewd little moan; ");
	if(flags["ANZHELA_ANALED"] == undefined) output("perhaps her rump is very sensitive?");
	else output("her rump is so sensitive!");

	if(flags["ANZHELA_ANALED"] == undefined) output("\n\n<i>“You sound like you like it, though. Don’t you want to give it a try?”</i> you ask.");
	else output("\n\n<i>“You enjoyed it so much last time. I think you really want it in here instead.”</i> you state.");
	output(" Bringing a single finger up, you rub it in and along her lubed-up crack. She lets out a low, helpless whine as you slather up her butt-slit, trickles of feminine excitement leaking down her round stocking-clad thighs. <i>“...Or else why are you getting so wet?”</i>");
	output("\n\n<i>“I-I’m not!”</i> Anzhela blushes and buries her burning cheeks in the white bedsheets, her rosy rump lifted high in the air. As much as she protests, she doesn’t make a move to pull her panties up or wiggle away from your slick-fingered caress.");
	output("\n\nAs you rub your gooey fingertips against her unsullied pucker, the scarlet-haired medic moans and shivers, keeping her bare bum obediently raised. With a little wiggle, you push a single probing digit into her sensitive rectum, roaming about inside of her naughty little asshole. Void, she’s so tight!");
	output("\n\nThe response is immediate; the svelte doctor cries out and tremblingly clenches the sheets as gushes of girl-juice floods down her lace-lined legs. The deliciously sweet smell of her musky pussy fills the air as you finger-fuck her ass. You push your finger up inside of her perfectly round rump up to the knuckle and wiggle it about.");
	output("\n\nAnzhela squeals out loud and creams herself instantly. She babbles aloud as she squirts her clear girl cum all over her stretched panties, drenching them in the process.");
	output("\n\n<i>“Wow, you’ve got a </i>really<i> sensitive ass,”</i> you remark as she lies there twitching, her sphincter spasmically clenching your digit. <i>“...How about we try something a little bigger?”</i>");
	output("\n\n<i>“Buh-bigger?”</i> The female doctor breathily mumbles, her eyes utterly spaced out.");
	output("\n\nYou press the tip of the lube bottle into her rectum and liberally squirt thin ropes of the fluid inside of her ");
	if(flags["ANZHELA_ANALED"] == undefined) output("virgin");
	else output("barely-claimed");
	output(" backdoor. She shakes and clenches her taut buttocks, her wrinkled pucker lewdly squeezing the clear lid as it shoots up inside of her.");
	output("\n\nPulling the bottle out, you trade it for your [pc.cockHead " + x + "], rubbing it up against her well-slickened sphincter. She gasps as you slowly slide it inside of her perfect posterior, narrowly gripping your junk as you stretch open her rectum. Inch by inch, you sheathe yourself inside of her tight, velvety insides, feeling the doctor exquisitely wring and wrestle with your [pc.cockType " + x + "] shape.");
	pc.cockChange();
	output("\n\n<i>“Y-you’re so huge - it feels like I’m going to break!”</i> Anzhela whimpers, your [pc.cockNounSimple " + x + "] buried deep inside her garter-clad ass. If anyone were to hear her cries and pull back the hospital curtain, they’d get quite the sight!");
	output("\n\nOnce the doctor has adjusted to your shape, you press her down, sandwiching Anzhela between your hips and the bed. She quivers and moans, her insides instinctively wringing your urethra, milking every hot, [pc.cumVisc] drop of pre-cum deep into her bowels. As it dribbles deep inside of her, she lets out a sweet little cry, quivering between the bedsheets and your [pc.chest].");
	output("\n\nSoon you’ve worked up a slapping rhythm, thoroughly plowing her pert posterior as she cries and comes hard against the hospital bed. Every time she screams, you grin and stir your [pc.cockNounSimple " + x + "] about deep inside of her rippled rectum. She can’t stop cumming as you thoroughly claim her once-virgin ass, now molded to the shape of your [pc.cockType " + x + "] prick.");
	output("\n\nPleasure pools deep within your ");
	if(pc.balls > 0) output("[pc.balls]");
	else output("abdomen");
	output(" until it brims over and spills forth, exploding deep into her delectable derriere. You ");
	var cum:int = pc.cumQ();
	if(cum < 10) output("splutter");
	else if(cum < 100) output("gloriously spurt");
	else output("utterly unload");
	output(" your [pc.cumVisc] spunk inside of her bowels and groan in delight, your [pc.cockHead " + x + "] flexing and spurting deep inside of the curly-haired doctor. She moans and cums for the fifth time, squeezing every single drip of spunk from your fully-sheathed staff, making sure every ounce of your ");
	if(pc.balls > 0) output("ball-");
	output("juice makes it between her lewd red buttocks.");

	output("\n\nOnce you both catch your breath, you kiss her on the back of the neck and pull your [pc.cock " + x + "] out of her well-stretched rectum. With a loud plop, your [pc.cockHead " + x + "] emerges from her back entrance. Instantly, a ");
	if(cum < 10) output("tiny stream");
	else if(cum < 100) output("large stream");
	else output("torrent");
	output(" of [pc.cumColor] floods down from her gaping hole and down her thighs, staining the bedsheets as Anzhela twitches and moans.");

	output("\n\n<i>“That was... that was... </i>wow<i>.”</i> The scarlet-haired doctor seems at a loss for words. Soaking up the sight of her well-claimed ass, you feel an immense sense of accomplishment.");

	output("\n\nIt takes Anzhela a while to catch her breath. She looks a little wobbly as she blushes and rearranges her messy hair and clothes; she is the chief medical officer after all!");
	if(cum >= 10) output(" However, without a spare pair of panties - or perhaps by choice - she simply pulls up her sopping wet panties and pushes down her skirt, hiding her naughty little secret.");
	output("\n\n");
	if(cum >= 10) output("<i>“I’m going to be leaking you out of my ass all day, so I may as well wear these,”</i> Anzhela sultrily purrs.");
	else output("<i>“Y-you know, it’s not so bad in the ass. Is it normal for off-worlders to do it that way?”</i> She breathily asks, a hopeful glimmer in her eyes. <i>“There’s never a bad time of day for </i>that<i> to happen,”</i>");
	output(" She then wraps her arms around your waist and gives you a steamy kiss. <i>“...Come again any time you want to, you know, ‘come again’. It’s good to visit your doctor often, you know?”</i>");
	output("\n\nWith a wobbly walk, the CMO pulls back the screen. As soon as she leaves the cubicle, she’s immediately mobbed by hospital staff, clearly waiting for her approval for something.");
	if(cum >= 50) output("\n\nYou grin as you spot a trickle of [pc.cumColor] streaming down one of her thighs. Will anyone else notice, you wonder?");
	// Scene end. Return to menu.
	processTime(23);
	pc.orgasm();
	IncrementFlag("ANZHELA_ANALED");
	IncrementFlag("S_RELIEF_ANN");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Strap-on
// No Reqs.
public function annStraponScene():void
{
	clearOutput();
	showAnzhela();
	output("Grabbing both your hands in hers, Anzhela leads you over to one of the hospital beds. There’s an excited look in her eyes as you both slip behind the privacy curtain. When you get there, she slides her hands up her mini-skirt and slips her thumbs underneath her lacy panties. With a saucy little wiggle she slides them down her stocking-clad thighs, then kicks the bunched up fabric away. With her hem hiked up, you can see the telltale glistening of moisture along her pink pussy lips. Just looking at her is getting you incredibly ");
	if(pc.hasCock()) output("stiff");
	else if(pc.hasVagina()) output("wet");
	else output("horny");
	output("!");

	output("\n\n<i>“How about we pull out one of my favorite toys? I’m sure it’ll be your favorite too,”</i> Anzhela sultrily purrs. After climbing up onto the soft bed and crawling along it – giving you a nice view of her dripping cameltoe – she pulls out something from a bedside drawer. She falls on her back against the pillows and laviciously spreads her legs, giving you a full-on view of her scarlet mound! It’s short lived as she straps a large, twelve-inch male myr cock over the top of it, fastening it securely at her hips. <i>“...So, care for a ride?”</i>");

	output("\n\nYou grin and");
	if(pc.isCrotchGarbed()) output(", after stripping off,");
	output(" climb onto the bed after her. With a little teasing show you lean over and lick her red, bulbous knob, keeping heated eye contact the entire while. She’s breathy with excitement. Your performance is getting her excited! Well, you’ve got a bit more to show her. Feeling a tingling in your stomach, you ");
	if(pc.isTaur()) output("turn around, ");
	output("lift yourself up and squat above her massive member, letting it hover above your bare buttocks. Your leg-muscles strain – along with your pucker – as you lower yourself onto her expansive knob. You groan as it stretches open your ring, its knotty thickness deliciously sliding inside of your rectum. Inch by inch, you slide her veiny length inside of your butt, letting her lady dick delve deeper inside of you. With a breathy sigh, you feel the skin of your thighs press flush with hers, her knob buried so deep you can almost feel it inside your belly!");
	pc.buttChange(120);
	output("\n\n<i>“All in?”</i> Anzhela huskily asks, rubbing her hands up your [pc.thighs]. You hazily nod, wiggling in her lap, relishing in the moment. She begins slapping up against your bare buttocks from below, fucking your needy ass. You groan as her thick knob rubs around deep inside of your butt and stirs you up. Your");
	if(pc.hasCock()) 
	{
		output(" [pc.cocksNounSimple] harden");
		if(pc.cockTotal() == 1) output("s");
		output(" against your belly and your");
	}
	else if(pc.hasVagina()) 
	{
		output(" [pc.vaginas] wetten");
		if(pc.totalVaginas() == 1) output("s");
		output(" before her eyes and your");
	}
	output(" thighs quiver against hers, betraying your delight at being butt-fucked by the curly-haired doctor. You’re biting your lip and grinding in her lap like an animal, utterly drunk off the sensation of her length stirring around inside of you!");

	//PC is not a taur:
	if(!pc.isTaur()) output("\n\nHer hands reach up to tweak and tease your nipples as you bounce excitedly upon her cock. You shiver with pleasure as your nubs are tugged and rubbed by her fingers; it’s all you can do to stop yourself from moaning too loud! You bite your lower lip and roll your hips against hers, long and slow, massaging her tip as deep as you can inside your rectum. Your own hands reach for her breasts, squeezing and caressing them as your nubs and ass are teased.");
	output("\n\nWith a loud unabashed cry, you cream yourself hard on her veiny length, ");
	if(pc.hasCock()) output("shooting your [pc.cumNoun] all over your stomach");
	if(pc.isHerm()) output(" and ");
	if(pc.hasVagina())
	{
		//Squirter: 
		if(pc.isSquirter()) output("squirting");
		else output("gushing");
		output(" your girl-juice all over ");
		if(pc.isHerm()) output("hers");
		else output("her belly");
	}
	if(!pc.hasGenitals()) output("experiencing a divine butt-induced orgasm");
	output(". Everything goes white as you quiver and twitch on her lap");
	if(!pc.isTaur()) output(", hands instinctively squeezing her bra-clad breasts as you cum");
	output(". When your shivers subside, you lightly fall down on her and press yourself against her, panting heavily. You’re both deliciously sticky and clinging to each other – a deliciously intimate moment for you both. You can still feel her inside of you, even if it isn’t a real cock...");
	output("\n\nAfter you’re both able to move once more, you both slip your things back on. There’s a flushed look of satisfaction on Anzhela’s face, even though you’re the one who came! <i>“I really liked watching you ride my cock. It was really exhilarating.”</i> The sexy doctor tells you, stashing the strapon away.");

	// Scene end. Return to menu.
	processTime(28);
	pc.orgasm();
	IncrementFlag("S_RELIEF_ANN");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
