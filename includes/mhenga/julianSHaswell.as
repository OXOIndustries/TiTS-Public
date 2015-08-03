//First Run-in
//Office Description

public function juliansOffice():void {
	//Addendum to Office Description
	if(flags["MET_DR_HASWELL"] == undefined) 
	{
		output("\n\nSitting behind the desk, a human with incredibly pale, almost albino skin sits on a gently bobbing hoverchair. He seems distracted by his computer and its flashing, holographic displays, but it ought to be a snap to get his attention.");
		addButton(0,"Scientist",approachJulianRouter);
	}
	//Repeat Office Description Addendum
	else 
	{
		output("\n\nDr. Julian S. Haswell is busy behind his desk as always. His piercing blue eyes flick up, taking notice of you, but he doesn't bother to greet you just yet, figuring that you'll speak up if its important.");
		addButton(0,"Dr. Haswell",approachJulianRouter);
	}	
}

public function approachJulianRouter():void {
	setLocation("DR. JULIAN\nS. HASWELL",rooms[currentLocation].planet,rooms[currentLocation].system);
	//First Meeting
	if(flags["MET_DR_HASWELL"] == undefined) 
	{
		introductionToJulian();
	}
	//Repeat if haven't taken job yet
	else if(flags["ACCEPTED_JULIANS_ZIL_CAPTURE_MISSION"] == undefined && flags["JULIANS_QUEST_DISABLED"] == undefined) 
	{
		julianFirstOfferRepeat();
	}
	//Bagged a zil yet?
	else if((flags["CAPTURED_A_FEMALE_ZIL_FOR_DR_HASWELL"] != undefined || flags["CAPTURED_A_MALE_ZIL_FOR_DR_HASWELL"] != undefined ) && flags["FIRST_CAPTURED_ZIL_REPORTED_ON"] == undefined && flags["JULIANS_QUEST_DISABLED"] == undefined) 
	{
		zilBaggedApproach();
	}
	//Second zil report?
	else if(flags["SECOND_CAPTURED_ZIL_REPORTED_ON"] == undefined && flags["CAPTURED_A_FEMALE_ZIL_FOR_DR_HASWELL"] != undefined && flags["CAPTURED_A_MALE_ZIL_FOR_DR_HASWELL"] != undefined && flags["JULIANS_QUEST_DISABLED"] == undefined) 
	{
		finalZilCaptureTurnInEpilogue();
	}
	//Repeat second offer?
	else if(!pc.hasKeyItem("Capture Harness") && flags["SECOND_CAPTURED_ZIL_REPORTED_ON"] == undefined && flags["JULIANS_QUEST_DISABLED"] == undefined) 
	{
		repeatSecondHarnessOffer();
	}
	//Have the harness already?
	else if(pc.hasKeyItem("Capture Harness") && flags["JULIANS_QUEST_DISABLED"] == undefined)
	{
		clearOutput();
		userInterface.showBust("DR_HASWELL");
		output("Dr Haswell mutters, <i>\"The zil aren't going to capture themselves. I have no business with you until you do.\"</i>");
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	//Generic "BLUH"
	else
	{
		clearOutput();
		userInterface.showBust("DR_HASWELL");
		output("Dr. Haswell doesn't even look up at you. <i>\"I have no business with you at present, [pc.name].\"</i>\n\nIt looks like there's nothing to be done with him right now.");
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
}


//Introduction
public function introductionToJulian():void {
	clearOutput();
	userInterface.showBust("DR_HASWELL");
	flags["MET_DR_HASWELL"] = 1;
	output("Coughing lightly to get the mousy-looking man's attention, you wonder what point there is in having a secretary if he doesn't even care about talking to the people she lets into his office.");
	output("\n\nThe scientist's face snaps up to regard you, and you nearly take a step back under his piercing, inhuman glare. He looked like a normal enough human, barring the blue hair, but his eyes are a piercing, almost glowing blue, wrapped around a pair of deep black slits that would look more at home on a feline than a human. <i>\"I suppose you must be here about the notice I posted on the bounty board, yes?\"</i>");


	//If seen it:
	if(flags["SEEN_JULIANS_AD"] == 1) output("\n\nYou nod, wondering what exactly the vague message meant.");
	//If not:
	else 
	{
		output("\n\n");
		if(pc.isNice()) output("You say that you aren't but would like to know more about it anyway.");
		else if(pc.isMischievous()) output("You nod, figuring you can score some cash even if you didn't see his notice.");
		else output("You nod confidently, expecting to make some quick cash off the obviously inept scientist.");
	}

	output("\n\nHe brushes a lock of brilliant azure behind his ear and smiles knowingly. <i>\"I knew someone on this backwater would come. You adventurous types barely even need a promise of money to go brave death and enslavement, right?</i>\" He chuckles and shakes his head. <i>\"Where are my manners, [pc.name]? I am Julian S. Haswell, senior Xenogen researcher here on Mhen'ga.\"</i>");

	output("\n\nJulian actually leans over his desk to shake your hand and grace you with a warm smile. <i>\"I got your name from my secretary, of course. Don't let the busy scientist routine fool you, I am quite perceptive.</i>\" His expression turns thoughtful as he breaks contact with you and begins to pace back and forth. <i>\"To get to the crux of my quandry, I need samples of the local life for my research. It's hard to synthesize new transformatives in a vacuum. Naturally occurring templates reduce development times exponentially.</i>\"");
	output("\n\nYou look at him and ask, \"<i>What kind of samples do you need exactly?</i>\"");

	output("\n\n\"<i>Good question, [pc.name],</i>\" Julian says with a sage nod. \"<i>To be specific, I need one of the locals subdued and brought here - one of the zil, to be specific. Their sexual excretions are an absolute gold-mine in the making, and I need more data to synthesize a proper product.</i>\" He points to a benign-looking box on his desk. \"<i>This is a capture harness. They're illegal in most places... but not here. Yet. All you have to do is disable one of the zil and then throw the box at them. It will restrain them and summon a transport drone to bring them to our facilities here.</i>\"");

	//If not unlocked Zil codex
	if(flags["ENCOUNTERED_ZIL"] == undefined && flags["TIMES_MET_FEMZIL"] == undefined) {
		if(pc.hasPerk("Ditz Speech") || pc.hasPerk("Brute Speech")) output("\n\n\"<i>Like, what's a zil?</i>\" you ask.");
		else output("\n\n\"<i>Zil?</i>\" you ask.");
		output("\n\nJulian cocks an eyebrow. \"<i>You must be new to Mhen'ga. The zil are bug-like humanoids native to this world. Not overly dangerous, though they do seem rather aggressive in their sexual copulations. They're only rated as a class one threat. Any well-equipped explorer should be able to hold their own against them.</i>\" He spins the blocky capture harness around and looks back to you.");
	}
	//If not an asshole:
	if(!pc.isAss()) output("\n\nSeeing the worry in your eyes, Julian shakes his hands apologetically. \"<i>It won't be painful, I promise. If anything, quite the opposite. I simply need a few small tissue samples and large volumes of their sexual secretions for study, and then we'll release them into the jungle. Surely a thousand credit reward will ease your conscience.</i>\"");
	//If an asshole
	else output("\n\nJulian smiles at you. \"<i>Surely you can appreciate what we can be learned, regardless of the gray areas upon which we now tread, correct? There is only profit to be made here, friend, for both of us. One thousand credits worth, to be precise.</i>\"");
	//No new line:
	output("  The scientist looks at you as if your decision has already been made for you. Will you take the device and go capture a zil for him or refuse?");
	processTime(3);
	//choices!
	clearMenu();
	addButton(0,"Accept",acceptZilCapMission);
	addButton(1,"Decline",declinedZilCaptureMission);
}

//Repeat Capture Mission Offer [No Captures Yet]
public function julianFirstOfferRepeat():void {
	clearOutput();
	userInterface.showBust("DR_HASWELL");
	output("Julian smiles when he realizes you want his attention once more. \"<i>Come back for the job after all then? That doesn't surprise me, there's a fortune to be made on the backs of unwashed savages like the zil.</i>\"  His vertically slit eyes narrow in your direction. \"<i>Just like before, take the capture box and use it on one you've subdued. One thousand credits, easy as that, unless you still have some sort of hangup?</i>\"  His gaze twinkles with cold, unshared mirth.");
	processTime(1);
	//Yes no go to default first time.
	clearMenu();
	addButton(0,"Accept",acceptZilCapMission);
	addButton(1,"Decline",declinedZilCaptureMission);
}

//Accept Zil Capture Mission
public function acceptZilCapMission():void {
	clearOutput();
	userInterface.showBust("DR_HASWELL");
	flags["ACCEPTED_JULIANS_ZIL_CAPTURE_MISSION"] = 1;
	output("You grab the capture harness and nod to the scientist. \"<i>I'll do it.</i>\"");
	output("\n\n\"<i>Excellent!</i>\"  Julian cheers. \"<i>Male or female will do. I need them both eventually. The credits will be transferred to your account as soon as we have the creature in custody. Now...</i>\"  Julian seats himself, \"<i>if you'll excuse me, there is a mountain of work to do and only one researcher to get it all done.</i>\"  He turns back to his work, dismissing you without another word.");
	//Display key item gain message "Capture Harness"
	output("\n\n(<b>Gained Key Item: Capture Harness</b> - You can use this to capture a defeated zil for Dr. Haswell.)");
	pc.createKeyItem("Capture Harness",0,0,0,0);
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Decline Zil Capture Mission
public function declinedZilCaptureMission():void {
	clearOutput();
	userInterface.showBust("DR_HASWELL");
	//Bimbo
	if(pc.hasPerk("Ditz Speech") || pc.hasPerk("Brute Speech")) output("\"<i>No way, Doc!</i>\"  you say with a shake of your head. \"<i>I'm not gonna do something that " + pc.mf("lame","mean") + "!</i>\"");
	//Nice
	else if(pc.isNice()) output("\"<i>No thank you, Doctor,</i>\"  you say with a shake of your head. \"<i>I'm not interested in a job like this.</i>\"");
	//Mischievous
	else if(pc.isMischievous()) output("\"<i>Nah, I don't think I'll start a career as a slaver today, Doctor,</i>\"  you say with a shake of your head. \"<i>I'm sure you can find someone else to do your dirty work.</i>\"");
	//Asshole
	else output("\"<i>Hahahaha, nope!</i>\"  you laugh at the Doctor's face. \"<i>This is some kinda police sting, isn't it? Fucking entrapment! Look, I don't give a shit about the natives, but I'm not gonna hang myself doing something this stupid. You want a zil, go talk to them yourself.\"</i>");
	//Merge
	output("\n\n\"<i>A pity,</i>\"  Julian retorts. \"<i>Science will have to march on, I suppose. Do come back if you change your mind.\"</i>  He seats himself and returns to work without another word.");
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}



//Approach After Bagging A Zil
public function zilBaggedApproach():void {
	clearOutput();
	userInterface.showBust("DR_HASWELL");
	output("\"<i>Ahhh, there's the intrepid " + pc.mfn("hunter","huntress","hunter") + ",</i>\"  Julian says as he rises from his chair to greet you. He gives you a friendly handshake, admitting, \"<i>Your work shaved months off my own. I already have a few products nearing general release testing, if you'll believe that!</i>\"  He beams, proud of his progress. \"<i>You can talk to Kelly if you'd like to try any of them. I've given her clearance to sell them to you at a reduced rate as thanks for your work.</i>\"");
	output("\n\n\"<i>That's not all,</i>\"  Doctor Haswell explains, \"<i>We need both sexes of zil if we're going to enable men AND women all over the galaxy to cum delicious, flavored sweetness with no ill side effects!</i>\"  He depresses a button on the desk, suddenly causing one of the displays to show your captured zil.");

	//Dudezil:
	if(flags["CAPTURED_A_MALE_ZIL_FOR_DR_HASWELL"] != undefined)
	{
		if(!chars["KELLY"].hasItem(new HoneySeed())) chars["KELLY"].inventory.push(new HoneySeed());
		output("\n\nHe's suspended in the air by dozens of oily black tentacles, thrusting his hips furtively against the rippling black tube again and again. His rhythm is steady with only the barest hint of quiver, though his eyes are rolled back in his head, lost in whatever ecstasy he's trapped in.");
		output("\n\n\"<i>The males of the species have proven quite adept at providing us large quantities of genetic material. All it takes is a little modification and motivation, or the M and M's, I like to call them.</i>\"");
		output("\n\nThe zil's nuts appear at least three times larger than when you saw him before, doubtless responsible for his current state and immense productivity.");
		output("\n\nJulian continues talking as if nothing is out of place. \"<i>Another day or two like that and we can return our enhanced subject to the wilds. I'm sure he'll be quite popular with the ladies... and boys. I don't think it'll matter much to him with his new libido.</i>\"  He turns off the display and extends another capture harness in your direction.");
		output("\n\n\"<i>Find me a female, and I'll see to it that you are suitably compensated.</i>\"");
	}
	//Femzil:
	else
	{
		if(!chars["KELLY"].hasItem(new Honeydew())) chars["KELLY"].inventory.push(new Honeydew());
		if(!chars["KELLY"].hasItem(new Honeypot())) chars["KELLY"].inventory.push(new Honeypot());
		output("\n\nShe's suspended in the air by dozens of oily black tentacles, thrusting her hips furtively against a rippling black tube that lies embedded in her mons. You can see the surface buzzing and vibrating as it does its best to extract her nectar, its obscene motions obviously bringing great pleasure to the female. Her eyes have long ago rolled back into her head, lost to the never-ending ecstasy she's been trapped in.");
		output("\n\n\"<i>The females of the species are going to be a veritable goldmine. Not only are their pussies nearly as pleasant to smell as flowers, but their sexual fluids are absolutely delicious. Such a transformation will fetch us millions of credits, easy!</i>\" Julian cheers. \"<i>All it took was a little modification and motivation - the M and M's, I like to call them.</i>\"");
		output("\n\nThe zil's breasts appear to be nearly three times as large as the last time you met her. The heavy, pendulous globes are capped with nipple-encapsulating tubes that vaguely resemble the one in her pussy, and judging from the way these are moving, they're suckling very aggressively.");
		output("\n\nJulian continues on as if nothing is out of place. \"<i>Another day or two like this and we can return our enhanced subject to the wild. I'm sure her future mates will enjoy having such a productive partner, and with her new libido, she'll enjoy having as many as she can.\"  He turns off the display and extends another capture harness in your direction.");
		output("\n\n\"<i>Find me a male, and I'll see to it that you are suitably compensated.</i>\"");
	}
	//Both:
	//Boost lust slightly
	pc.lust(8+rand(4));
	processTime(5);
	flags["FIRST_CAPTURED_ZIL_REPORTED_ON"] = 1;
	clearMenu();
	addButton(0,"Accept",acceptRepeatZilMission);
	addButton(1,"Decline",declineDrHaswellsRepeatMission);
}

public function repeatSecondHarnessOffer():void {
	clearOutput();
	userInterface.showBust("DR_HASWELL");
	output("Julian offhandedly gestures at the capture harness. <i>\"The harness is there if you want some work. The choice is yours.\"</i>");
	clearMenu();
	addButton(0,"Accept",acceptRepeatZilMission);
	addButton(1,"Decline",declineDrHaswellsRepeatMission);
}



//Decline Repeat Zil Mission
public function declineDrHaswellsRepeatMission():void {
	clearOutput();
	userInterface.showBust("DR_HASWELL");
	output("You decline the offer for now.");
	output("\n\nJulian seems nonplussed by your admission but does not press you. He seats himself and resumes his work, having gotten enough from you already.");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Accept Repeat Zil Mission
public function acceptRepeatZilMission():void {
	clearOutput();
	userInterface.showBust("DR_HASWELL");
	output("Picking up the familiar, compact harness, you nod to Julian.");
	output("\n\n\"<i>Fantastic! I can't wait to have another subject in the lab.</i>\"  He taps a key to open the door and seats himself, returning to his undoubtedly massive workload. \"<i>This is the beginning of a beautiful partnership, [pc.name],</i>\"  he idly admits after settling in.");
	//Key item notification "Capture Harness"
	output("\n\n(<b>Gained Key Item: Capture Harness</b> - You can use this to capture a defeated zil for Dr. Haswell.)");
	pc.createKeyItem("Capture Harness",0,0,0,0);
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Approach After Bagging The Final Zil
//Could really use something similar to the previous display of what was being done with them, but I'm not feeling it atm.
public function finalZilCaptureTurnInEpilogue():void {
	clearOutput();
	userInterface.showBust("DR_HASWELL");
	output("Julian bounds up out of his chair. \"<i>There's my favorite contractor! I trust you found the wilds to your liking, yes?</i>\"  He shakes his head, dismissing his own question. \"<i>That doesn't matter. What does matter is the raft of useful genetic material you've brought in! The drones dropped your zil off and I got ");
	if(flags["LAST_ZIL_CAPTURED_FOR_HASWELL_SEX"] == 1) output("him");
	else output("her");
	output(" straight into processing. We're learning so much, and all thanks to your efforts!</i>\"  He claps you on the back before turning serious. \"<i>Kelly already has permission to sell you a few new products, if you're interested.</i>\"");
	output("\n\nYou nod in thanks, grateful to have access to the latest and greatest from Xenogen.");
	output("\n\nDoctor Haswell sighs. \"<i>Unfortunately, all the data we've gathered is going to take some time to sort through. I won't have any more jobs for a good long while, if at all.</i>\"  He says a little more, almost whisper-quiet, \"<i>Your services are no longer needed.</i>\"  With that, he returns to his desk and dismisses you.");
	//QUEST COMPLETE!
	//Room for future fuckbuddy expansion or stuff to play with captives if someone wants to write it.
	flags["SECOND_CAPTURED_ZIL_REPORTED_ON"] = 1;
	processTime(3);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Using the Capture Harness
public function useTheCaptureHarness():void {
	clearOutput();
	output("You thumb the single activation switch on the capture harness and toss the suddenly beeping cube in the direction of your fallen foe. Halfway there, it unfurls into a mass of whip-like, black tentacles. Before you can finish blinking in surprise, the zil is completely enmeshed in a web of restraints. A small, red-blinking square on " + foes[0].mf("his","her") + " chest glows angrily, and you wonder just what you're supposed to do now.");
	output("\n\nThat question is answered by the high-pitched whine of atmospheric engines. A sleek, metallic probe a little bigger than a jet-bike zips into the area and dangles a magnetic anchor, snapping it onto the square plate at the center of the harness. Looking very much like an insect in a spider's trap, the zil is reeled in closer. The probe extends a number of intricately worked \"legs\" to wrap around its acquisition and immediately zips off, leaving you alone with your thoughts.");
	output("\n\nFive minutes later, your codex beeps. It looks like your bank account is one thousand credits richer.\n\n");
	pc.credits += 1000;
	processTime(6);
	//NO LOOT! NO CREDITS!
	foes[0].inventory = new Array();
	foes[0].credits = 0;
	pc.addHard(1);
	if(foes[0].hasCock()) {
		flags["CAPTURED_A_MALE_ZIL_FOR_DR_HASWELL"] = 1;
		flags["LAST_ZIL_CAPTURED_FOR_HASWELL_SEX"] = 1;
	}
	else {
		flags["CAPTURED_A_FEMALE_ZIL_FOR_DR_HASWELL"] = 1;
		flags["LAST_ZIL_CAPTURED_FOR_HASWELL_SEX"] = 2;
	}
	pc.removeKeyItem("Capture Harness");
	//Generic combat win!
	genericVictory();
}
