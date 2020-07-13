//doc link: https://docs.google.com/document/d/1d3zGkDx6JrOWxF-3tieM_sESHKmKSmVswVl6Vjr-ir0/edit

public function makiusLeftClinic():Boolean {
	return flags["MAKI_WORKS_AT_NURSERY"] || flags["MAKI_IN_CREW"] || flags["MAKI_STATE"] == 2;
}

public function enterNovaClinicFunc():void {
	author("LukaDoc");
	setNavDisabled(NAV_NORTH_DISABLE);
	clearMenu();
	if (flags["MAKIUS_INTRO"] == undefined) MAKIUS_INTRO1();
	else{
		if (makiusLeftClinic()){
			//kayl
			showBust("RASKVEL_MALE");
			output("The Novahome Clinic is in its usual semi-organised state of chaos. The now-acting doctor, a male raskvel named Kayl, is working busily at the front desk. Since there are no other patients standing ahead in line, you can walk right up to him and announce your presence.");
			output("\n\nHe gazes at you as you approach and immediately breaks into a friendly smile. \"Hey there, [pc.name]. Need treatment?\"");
		}else{
			//makius
			showBust("MAKIUS");
			output("The Novahome Clinic is its usual semi-organised state of chaos. As you clear the doors, you see the Venarian, Doctor Makius, sitting at the front desk reading a file. As he is not busy with a patient, you head straight to the front desk and announce your presence.");
			output("\n\n\"Hmm?\" He looks up and immediately breaks into a soft smile upon spotting you. \"Oh, hello [pc.name]. What can I help you with?\" he says, still smiling.");
			addButton(2, "Talk", makiusClinicTalkIntro, undefined, "Talk", "Chat with the Venarian doctor.");
			addButton(3, "Appearance", makiusAppearance, undefined, "Appearance", "Make an examination of your own.");
			if (flags["MAKI_RELATIONSHIP_STATUS"]) addButton(4, "Sex", makiusClinicSex, undefined, "Sex", "Ask him if he has time for a break.");
		}
		addButton(0, "Examine", novaClinicExamine);
		if (pc.HP() >= pc.HPMax()) addDisabledButton(1, "Heal", "Heal", "You feel fine.");
		else if (pc.hasStatusEffect("Bandaged")) addDisabledButton(1, "Heal", "Heal", "You should wait until your bandages need replacement.");
		else addButton(1, "Heal", novaClinicHeal, undefined, "Heal", "Get healed by the " + (makiusLeftClinic()?"raskvel nurses.":"good doctor."));
	}
}

public function MAKIUS_INTRO1():void {
	clearOutput();
	author("LukaDoc");
	showBust("RASKVEL_MALE");
	flags["MAKIUS_INTRO"] = false;
	setNavDisabled(NAV_SOUTH_DISABLE);
	output("As you push your way through the door into the clinic, you take in the room before you. It is, as you might have expected, nothing particularly fancy - almost primitive. The room was clearly refabricated before being repurposed, and a trio of raskvel - two female and one male - are busying themselves around the chamber with various tasks. From their clothing, they appear to be nurses or general assistants at this clinic.")
	output("\n\nYour thoughts are interrupted, however, as a sudden burst of sharp, stinging pain erupts across your scalp" + (pc.horns > 1 ? ", right between your [pc.horns]":"") + ". A metallic jingle somewhere near your [pc.feet] provides an obvious clue to the culprit, but you are too busy clapping a hand instinctively over the sore spot and spitting a curse at the pain to look.");
	output("\n\nA raskvel in a lab coat immediately rushes to your side. \"Hey, " + pc.mf("Mister", "Miss") + "? Are you alright? Damn piece of crap. I should’ve had this fixed up ages ago… Sorry.\"\n\n");
	if (pc.isNice()) output("You assure the raskvel that you're fine; your head smarts a little, but it's nothing serious.");
	else if(pc.isMischievous()) output("You manage to grin wryly and reply that it's a good thing you have such a hard head; you don't think it's anything serious.");
	else output("Scowling, you angrily agree that he should have fixed that before someone got hurt - he's just lucky it's nothing serious, or you'd teach him a lesson yourself.");
	output("\"We’ll get the doctor to take a look at that for you - free of charge, naturally.\" He motions for you to follow.");
	output("\n\nThe clinic is small, but it does have a few rooms for the sick and the injured. You note that only a couple of rooms seem to actually house unhealthy raskvel. \"The name’s Kayl, by the way. I’m the doctor’s apprentice.\" he introduces himself with a smile.");
	output("\n\nIdly, you give Kayl your name in turn, still gingerly rubbing the tender spot atop your scalp.");
	clearMenu();
	processTime(5);
	addButton(0,"Next", MAKIUS_INTRO2);
}

public function MAKIUS_INTRO2():void {
	move("NOVA CLINIC OFFICE");
	clearOutput();
	showBust("MAKIUS", "RASKVEL_MALE");
	output("At the end of the short hallway, you see a wooden board with a painted arrow and the word \"Office\" scribbled on it. The arrow points to an open door nearby where you presume the doctor practices.");
	output("\n\nAs you approach, you can see the office can be charitably described as 'organised chaos' befitting the makeshift nature of this clinic. A large table serves as the room's centrepiece and the workplace of the occupant. It's dominated by a computer assembled secondhand from junk, with huge piles of files and data-slabs towering to both sides. Shelves crowd the room, laden with medical tools, reference texts and assorted bits and pieces, adding to the cramped, precarious feel of the chamber.");
	output("\n\n\"Doctor Makius, sir?\" he calls out, gingerly moving a box filled with forms out of the way.");
	output("\n\n\"Hmm? Yes, Kayl?\" the doctor asks, his voice coming from behind his computer.");
	output("\n\n\"This is " + pc.mf("Mister","Miss") + " Steele, [pc.he] was wounded by our improvised door-bell.\"");
	output("\n\nYou can hear him sigh and then stand up, coming into view. Now that you take a good look at him, you can see that this doctor is no raskvel, as you might’ve expected.");
	output("\n\nStanding around six feet tall, the doctor is closer in height to a standard human than the reptilian bunny-like aliens with which he works. Doctor Makius only resembles them in that his appearance also combines some distinct mammalian and reptilian features. His overall form is fundamentally lizard-like, with a short, conical snout and long tail. However, he is covered in fur and has a pair of pointed, dog-like ears atop his head. Grass-green eyes flicker below a forelock of navy blue hair as he studies you in return.");
	output("\n\nAs the doctor steps around his table, your Codex chirps, signaling that it has identified the doctor’s species as a <i>Venarian</i> with the relevant entry added to your database.");
	output("\n\nA soft cough diverts your attention back to his smiling face. \"Hello, I’m Makius. The residing doctor in this small clinic. Let me apologise for the doorbell. This is supposed to be a place of healing, not a place where you go to get injured.\" He rubs the back of his neck apologetically, then recomposes himself and extends a clawed hand towards you in a friendly gesture. \"Pleased to make your acquaintance, " + pc.mf("Mister","Miss") + " Steele.\"" + (pc.isAss() ? "Even though politeness moves you to accept his hand, you grip it as firmly as you can, replying that the circumstances could have been more pleasant on your end." : "You warmly shake his hand, telling him that it's a pleasure."));
	output("\n\n\"Let’s step over to an empty room so I can take a look at you,\" he says with a smile, turning to look at his raskvel assistant. \"Kayl, can you finish indexing that batch of forms while I take a look at our friend?\"");
	output("\n\n\"Right-o, doc,\" he says with a salute. Doctor Makius rolls his eyes, though the smile on his face tells you the gesture wasn’t wasted on him. \"Come on,\" he gently takes hold of your hand and leads you away.");
	output("\n\nThe examination is swift and efficient. Doctor Makius shows excellent practice as he pokes and prods the sore spot on your head. You question the doctor if everything is alright.");
	output("\n\n\"If you'd like, you can call me Maki. I prefer to be a bit more friendly with my patients.\"");
	output("\n\nShrugging, you repeat the question.");
	output("\n\n\"You look fine, " + pc.mf("Mister", "Miss") + " Steele. I’m just going to give you some painkillers so the pain will stop bothering you,\" he explains while moving towards the door.");
	CodexManager.unlockEntry("Venarians");
	clearMenu();
	processTime(5);
	addButton(0,"Next", MAKIUS_INTRO3);
}

public function MAKIUS_INTRO3():void {
	clearOutput();
	author("LukaDoc");
	showBust("MAKIUS", "RASKVEL_FEMALE");
	output("\"Nira?\" He calls out.");
	output("\n\nA female raskvel presents herself. You see she’s wearing a white blouse and skirt combo. Atop her head, a red, cross-shaped hairpin holds a pair of bangs framing her cheeks. From the way she's dressed and acting, you assume she is one of the nurses. How big is the staff in this clinic anyway?");
	output("\n\n\"Yes Maki?\" she says with a pleasant smile.");
	output("\n\n\"I need a painkiller, just a mild one. And some water,\" he says.");
	output("\n\nThe female raskvel’s eyes dart towards you before she smiles and replies, \"Right away.\"");
	output("\n\nAs she runs off to fetch you your pill, Maki turns and approaches you once more. \"Wait just a bit longer.\"");
	output("\n\nYou nod your head and tell him that's fine.");
	output("\n\n\"So, what brings you to Haven? I mean… it’s not my business and I don’t mean to pry, but I rarely get news from outside. And it’s not often I get to speak to an offworlder either,\" he says, obviously trying to strike a conversation.");
	if (pc.isNice()){
		output("\n\nSince he's trying so hard, you decide to be honest, telling him you've come to this planet as part of a personal mission of sorts.");
		output("\n\n\"I see. Most people that come by are just interested in finding some scraps or junk for their own projects. So your reply is not so surprising.\"");
		output("\n\nYou tell the doctor about your father's death and how you're competing with one of your cousins for the inheritance.");
		output("\n\n\"Oh, my condolences for your loss. It’s always sad when you can’t get along with your family,\" he idly comments.");
		output("\n\nYou sigh and nod your head, admitting you have to agree with his perspective on the matter. Still, one has to look on the bright side, right? After all, it's certainly giving you an excuse to travel and see the sights. Speaking of which, what's a Venarian doing in a place like this?");
	}else if (pc.isMischievous()){
		output("\n\nWith your most winning smile, you describe your being here as a mixture of business and pleasure. Mostly, you declare, you're here to see the sights - like the good doctor himself, you add.");
		output("\n\nThe Venarian is a bit taken aback by your statement, but manages a nervous smile all the same. \"Umm… thank you?\"");
		output("\n\nChuckling, you reply that it's so odd to see a Venarian residing here, especially since most of the populace are raskvel and the odd gabilani.");
	}else{
		output("\n\nIt's business, you reply flatly, and private business at that.");
		output("\n\n\"Yes… umm… sorry for asking. Maybe you’d like to talk about something else? Or I can just shut up and we can wait for Nira’s return,\" his ears flatten against his skull.");
		output("\n\nActually, you reply, you were curious about something: why is he here?");
	}
	output("\n\n\"Oh, I got stranded here. I used to serve aboard a ship, but I had a bit of a disagreement with my captain and she left me here to rot,\" he explains, ears flat as he recalls bad memories.");
	output("\n\nSurprised, you ask what Makius could possibly have said or done to warrant that sort of treatment over a simple disagreement.");
	output("\n\nHis face screws into an expression of disgust. \"I refused to help her torture a thug in order to get info on a bounty. I made an oath when I finished my training to <b>help</b> people, not torture them. And as it turns out… she didn't tolerate disobedience. So here am I,\" he raises his hands in a sign of resignation.");
	output("\n\nYou nod your head in understanding as you digest the Venarian's tale.");
	output("\n\n\"Doc? Got your pill,\" says the female raskvel from earlier, carrying a tray containing a cup with water and a small white pill on top of a napkin.");
	output("\n\nLooking at Nari, Maki nods with a smile. \"Thank you, Nari.\"");
	output("\n\nShe walks up to you and offers you the tray. \"Here you go cutie.\"");
	output("\n\nYou take the pill from her tray with a thank you, then swallow it before washing it down with the offered water.");
	output("\n\n\"It’ll take a little while for the pill to take effect, but everything should be fine now,\" he smiles.");
	output("\n\nYou tell him that you can already feel it working.");
	output("\n\n\"Please feel free to stop by whenever you need treatment. We may not have access to more technologically advanced machinery for treatment, but I can promise you we’ll take good care of you. Or… if you just want to chat, I’d love to hear more about what's going on up there in the stars,\" he smiles happily, ears twitching atop his head, tail lazily waving in a happy manner.");
	output("\n\nYou thank him, promising to keep that in mind, and leave.");
	clearMenu();
	processTime(10);
	addButton(0,"Back", move,"NOVA CLINIC");
}
public function makiusClinicTalkIntro():void{
	clearOutput();
	processTime(5);
	author("LukaDoc");
	showBust(makiusBust());
	output("He smiles at your suggestion. \"Sure, it’s been a pretty slow day and I could use a break from all these files. What would you like to talk about?\"");
	makiusClinicTalk();
}

public function makiusClinicTalk(from:int = -1):void{
	clearMenu();
	if (from == 0) addDisabledButton(0, "Plans");
	else addButton(0, "Plans", makiusClinicTalkPlans);
	if (from == 1) addDisabledButton(1, "How's Things");
	else addButton(1, "How's Things", makiusClinicHowsThings);
	if (flags["MAKIUS_INTRO"] == true) addButton(2, "Recruit", makiusClinicRecruit);
	else addDisabledButton(2, "Recruit");
	addButton(14,"Leave", mainGameMenu);
}

public function makiusClinicTalkPlans():void{
	clearOutput();
	author("LukaDoc");
	showBust(makiusBust());
	flags["MAKIUS_INTRO"] = true;
	output("The Venarian taps his chin, thinking for a moment. \"I confess that I’d like to go back to the stars someday. Being here in this clinic, doing what I do best really helped my morale after my incident with my ex-captain. But as nice as this place is, I can’t see myself settling here forever.\"");
	output("\n\nYou nod your head in understanding, asking if he's given any thought as to how he might get back into the stars. Does he plan on hiring on with a new captain, or would he rather be his own boss and own a little one-person spaceship some day?");
	output("\n\n\"I was hoping to get hired. I’m not fit to be a captain, really,\" he waves off the idea. \"Just hope I don’t have the rotten luck of running into someone like the last one.\" He takes a deep breath. \"Either way, in order to be hired I guess I'd need to get my resume out there. I haven’t bothered because Kayl and the girls were quite inexperienced in the ways of medicine. However, they’ve shown to be eager learners and are good enough that I could leave this clinic in their care in good conscience. So I guess I just haven't gotten around to it yet,\" he shrugs.");
	output("\n\nYou nod your head thoughtfully; so, this doctor is looking to get hired to go into space again? That could be useful; you resolve to remember that. You thank him for telling you such personal details.");
	output("\n\nThe Venarian smiles, shaking his head. \"No, thanks for listening. It’s always good to have someone to talk to about these things.\"");
	makiusClinicTalk(0);
}

public function makiusClinicHowsThings():void{
	clearOutput();
	author("LukaDoc");
	showBust(makiusBust());
	output("\"Good, I guess….\" is the Venarian’s nearly automatic response. \"You?\"");
	clearMenu();
	if (pc.HP() < pc.HPMax() * 0.2){
		output("\n\nYou reply you’ve had it rough recently. Absolutely nothing seems to have gone your way; you're exhausted, sore and clinging to things by a thread. You're not sure how much more you can take.");
		output("\n\n\"I see, maybe we should get you to a room? I can take a look at you and you can rest here until you’ve recovered,\" he offers.");
		output("\n\nWincing as you feel the pain of your wounds, you gratefully accept the offer, and ask him to lead the way.");
		addButton(0, "Get Healed", novaClinicHeal);
		return;
	}else if (pc.HP() < pc.HPMax() * 0.5){
		output("\n\nYou reply that things haven't been working out so well for you, and you've taken some knocks recently.");
		output("\n\n\"Would you like me to take a look at you? Maybe find a room and let you rest while you heal?\"");
		output("\n\nYou consider the offer carefully; should you be examined while you're here, or will you tough it out?");
		if (pc.credits < 50) addDisabledButton(0, "Get Healed", "Get Healed", "You are too broke to afford healthcare");
		else addButton(0, "Get Healed", novaClinicHeal);
		addButton(1, "ToughItOut", makiusClinicHowsThingsTough);
		return;
	}else if (pc.HP() < pc.HPMax()){
		output("\n\nYou reply that you've had a bit of bad luck, a few near-misses, but nothing serious.");
		output("\n\n\"That’s good,\" he smiles. \"I-I mean, not that you’ve had a few bad runs, but that you aren’t very injured….\"");
		output("\n\nYou smile and tell him you understand what he means.");
		output("\n\n\"Anyway… heard about anything lately?\"");
	}else{
		output("\n\nYou reply that you feel absolutely fine; 100% in tip-top shape.");
		output("\n\nThe Venarian doctor nods with a smile. \"I’m glad, though if you’re ever feeling under the weather we can always take a look at you.\"");
		output("\n\nYou nod and promise you'll remember that.");
		output("\n\n\"So, any news from the world outside?\" he asks.");
	}
	output("\n\nYou chat about your adventures, though admittedly neither of you are too interested in the actual stories. However, you can tell the good doctor is happy to just sit and have a nice chat with you. The two of you talk for a while, until one of the nurses calls for Maki. ");
	output("\n\n\"Excuse me, [pc.name]. Duty calls,\" he says getting up to his feet and disappearing into the hallways. Leaving you alone with Nari, the nurse.");
	output("\n\nShe turns to you with a smile and says, \"Sorry for interrupting your chat.\"");
	output("\n\nYou reply that it's okay, you know the doctor's time is valuable.");
	output("\n\n\"Alright then, " + pc.mf("Mister", "Miss") + " Steele. Don’t be a stranger,\" she waves as you go.");
	makiusClinicTalk(1);
}

public function makiusClinicHowsThingsTough():void{
	clearOutput();
	author("LukaDoc");
	showBust(makiusBust());
	output("After making your decision, you shake your head and assure the doctor that things are fine and you'll be alright.");
	output("\"Alright… if you say so.\" He takes a deep breath before smiling. \"Anyway, heard anything from outside?\"");
	clearMenu();
	makiusClinicTalk(1);
}

public function makiusClinicRecruit():void{
	clearOutput();
	author("LukaDoc");
	showBust(makiusBust());
	if (!flags["MAKI_HAS_BEEN_RECRUITED_BEFORE"]){
		flags["MAKI_HAS_BEEN_RECRUITED_BEFORE"] = true;
		//crew stuff that increases in a non-hardcoded way needs to be an actual number.
		flags["MAKI_RELATION"] = 0;
		flags["MAKI_SUBPOINTS"] = 0;
		flags["MAKI_SUBBED_TIME"] = 0;
		flags["MAKI_SIRED_CHILDREN"] = 0;
		flags["MAKI_BIRTHED_CHILDREN"] = 0;
		
		output("Nodding to yourself, you decide that Makius sounds too useful to pass up. You ask the doctor if he's still looking for a new captain to take him back into space?");
		output("\n\n\"Sure am,\" he says with a smile.");
		output("\n\nIn that case, you reply, you'd like to extend an offer for him to join your crew. Having a trained medical professional on board could come in handy in your travels. If he's willing to accept your offer, of course.");
		output("\n\n\"I… wow, are you sure?\" he says in disbelief.");
		output("\n\nYou reply that you're sure; if he's willing to sign up with you, you'll happily take him back out to the stars. So, what does he say?");
		output("\n\n\"Of course!\" He exclaims happily. \"Just give me a moment to explain things to Kayl and the nurses and we can be off!\" He disappears through the hallway before you can say anything else.");
		output("\n\nYou can't help but marvel at how enthusiastic he is. Still, so long as he brings that enthusiasm to his work, he should be a valuable addition to your ship.");
	}else{
		output("You ask the doctor if he wants to join your crew once more?");
		output("\n\n\"" + (flags["MAKI_RELATIONSHIP_STATUS"] == 2?"Always, my mate":"Sure am") + "\" he says with a " + (flags["MAKI_RELATIONSHIP_STATUS"] == 2?"dreamy ":"") + "smile.");
		output("\n\nIn that case, you reply, you'd like to offer him his previous position. Having a trained medical professional on board could come in handy in your travels.");
		output("\n\n\"Of course!\" He exclaims happily. \"Just give me a moment to explain things to Kayl and the nurses and we can be off! " + (flags["MAKI_RELATIONSHIP_STATUS"] == 2? "I can't wait to be back in my old room with you. ":"") + "He disappears through the hallway before you can say anything else.");
	}
	flags["MAKI_IN_CREW"] = true;
	clearMenu();
	addButton(0, "Back", mainGameMenu);
}

public function novaClinicExamine():void{
	clearOutput();
	author("LukaDoc");
	move("NOVA CLINIC OFFICE");
	if (makiusLeftClinic()){
		//kayl
		showBust("RASKVEL_MALE");
		output("\"Sure thing, please come with me,\" the raskvel motions for you to follow.");
		output("\n\nYou follow the raskvel to an available room. As you might have expected, it's nothing particularly fancy, but it looks clean enough and it does have plenty of privacy. You settle yourself upon a low-slung examining table - obviously, the bulk of the races that go through here are raskvel and gabilani - and wait for Dr. Kayl to gather his instruments.");
		output("\n\nHe procures a handheld scanner. It looks old, and you can see tape holding the thing together, still you say nothing.");
		output("\n\n\"Just a moment, I need to get this thing to work.\" he says, fiddling around with the scanner.");
		output("\n\n\"No problem.\"");
		output("\n\nAfter a moment a few beeps and a soft light indicates the scanner has started working. Kayl runs it across your body, checking for any signs of disease and other maladies.");
	}else{
		//makius
		showBust(makiusBust());
		output("\"Alright, please follow me.\"");
		output("\n\nYou follow the Venarian to an available room. As you might have expected, it's nothing particularly fancy, but it looks clean enough and it does have plenty of privacy. You settle yourself upon a low-slung examining table - obviously, the bulk of the races that go through here are raskvel and gabilani - and wait for Dr. Makius to gather his instruments.");
		output("\n\nHe procures a handheld scanner. It looks old, and you can see tape holding the thing together, still you say nothing.");
		output("\n\n\"Just be still for a moment, this thing takes a while to finish,\" Maki explains.");
		output("\n\n\"No problem.\"");
		output("\n\nA few beeps and a soft light indicates the scanner has started working. Maki runs it across your body, checking for any sign of disease or other maladies.");
	}
	//find out what SSTDS the player carries
	var playerSSTDS:Array = [];
	var sstds:Array = sstdList();
	for (var sstd:String in sstds) if (pc.hasSSTD(sstds[sstd])) playerSSTDS.push(sstds[sstd]);
	addButton(0, "Next", novaClinicSSTD, [0, [], [], playerSSTDS]);
}

/** operation is an array consisting of:
 * 0: Hours the operation takes place
 * 1: SSTD removals
 * 2: Parasite removals
 * 2: SSTDS or parasites that are not asked about yet. when this array is not empty it won't continue to the next section
 */
public function novaClinicSSTD(operation:Array):void{
	clearMenu();
	processTime(2);
	if(operation[3].length > 0){
		var disease:String = pc.getRandomSSTD();
		if (makiusLeftClinic()){
			//kayl
			output("\n\nKayl examines the preliminary results showing in his scanner. \"Umm… it says here that you have <b>" + operation[3][0] + "</b>. I think we have the materials required to treat that...,\" he scratches his head. \"But we might have to replenish our stocks, so I’ll have to charge you 500 credits for the procedure,\" the raskvel doctor explains.");
		}else{
			//makius
			output("\n\nMaki examines the preliminary results showing in his scanner. \"I see that you’ve been infected with <b>" + operation[3][0] + "</b>. Thankfully we may just have the materials to heal you,\" he smiles. \"Since we’re going to need to replenish our stock, I’m afraid I’ll have to charge you. About 500 credits should do it,\" the Venarian doctor explains.");
		}
		if (pc.credits < 50) addDisabledButton(0, "Yes", "Get Cured", "You are too broke to afford SSTD removal!");
		else addButton(0, "Yes", novaClinicSSTDCure, operation);
		addButton(1, "No", novaClinicSSTDNo, operation);
	}else{
		//find parasites
		if (pc.hasStatusEffect("Butt Bug (Female)")) operation[3].push("buttbug");
		if (attachedMimbranes() > 0) operation[3].push("mimbrane");
		if (pc.hasParasiteTail()){
			if (pc.hasTailCock()) operation[3].push("cockvine");
			else if(pc.hasTailCunt()) operation[3].push("cuntsnake");
		}
		novaClinicParasite(operation);
	}
}

public function novaClinicSSTDCure(operation:Array):void{
	clearOutput();
	author("LukaDoc");
	output("You confirm that you wish to pay for the treatment and get " + operation[3][0] + " removed.\n\n\"Alright, if you would please transfer the credits?\" He asks.");
	if (makiusLeftClinic()){
		//kayl
		showBust("RASKVEL_MALE");
	}else{
		//makius
		showBust(makiusBust());
		output(" with a soft smile");
	}
	output(", holding up a tablet computer.\n\nYou reach for your codex, and in a few moments, a successful transaction is confirmed.");
	operation[1].push(operation[3].shift());
	operation[0] += 2;
	pc.credits -= 500;
	novaClinicSSTD(operation);
}

public function novaClinicSSTDNo(operation:Array):void{
	clearOutput();
	author("LukaDoc");
	output("You reply that you don't want to get this disease removed.\n\n\"Umm… alright, if you’re sure about that, \"");
	if (makiusLeftClinic()){
		//kayl
		showBust("RASKVEL_MALE");
		output("Kayl says, shrugging.");
	}else{
		//makius
		showBust(makiusBust());
		output("Maki blinks, tapping his scanner.");
	}
	operation[3].shift();
	novaClinicSSTD(operation);
}

public function novaClinicParasite(operation:Array):void{
	clearMenu();
	processTime(2);
	if (operation[3].length > 0){
		if (operation[3][0] == "mimbrane" && attachedMimbranes() > 1){
			if (makiusLeftClinic()){
				//kayl
				showBust("RASKVEL_MALE");
				output("\n\n\"Oh, those are <b>mimbranes</b> aren't they? We can remove them if you want, For free, even.\" he says.");
			}else{
				//makius
				showBust(makiusBust());
				output("\n\n\"I see those <b>mimbranes</b> have… bonded with you,\" he says, a bit flustered. \"If you want we can extract them for you. We can do this for free if you want.\" he smiles.");
			}
		}else{
			if (makiusLeftClinic()){
				//kayl
				showBust("RASKVEL_MALE");
				output("\n\n\"Oh, that’s a <b>" + operation[3][0] + "</b> isn’t it? We can remove that if you want, For free, even.\" he says.");
			}else{
				//makius
				showBust(makiusBust());
				output("\n\n\"I see one of those <b>" + operation[3][0] + "s</b> has… bonded with you,\" he says, a bit flustered. \"If you want we can extract it for you. We can do this for free if you want.\" he smiles.");
			}
		}
		addButton(0, "Yes", novaClinicParasiteRemove, operation);
		addButton(1, "No", novaClinicParasiteNo, operation);
	}else novaclinicFinalCheck(operation);
}

public function novaClinicParasiteRemove(operation:Array):void{
	clearOutput();
	author("LukaDoc");
	processTime(2);
	output("Yes, you would like him to remove your resident " + operation[3][0] + (operation[3][0] == "mimbrane" && attachedMimbranes() > 1?"s":"") + ".\n\n\"Great, I’ll have to put you under \"");
	if (makiusLeftClinic()){
		//kayl
		showBust("RASKVEL_MALE");
		output("for the job");
	}else{
		//makius
		showBust(makiusBust());
		output("to perform that procedure though");
	}
	output(".\" Is that okay?\" he asks.\n\nThat's just fine, you tell him.");
	operation[2].push(operation[3].shift());
	operation[0] += 3;
	novaClinicParasite(operation);
}

public function novaClinicParasiteNo(operation:Array):void{
	clearOutput();
	author("LukaDoc");
	processTime(2);
	output("You inform ");
	if (makiusLeftClinic()){
		//kayl
		showBust("RASKVEL_MALE");
		output("Kayl");
	}else{
		//makius
		showBust(makiusBust());
		output("Maki");
	}
	output(" that you don't want to get rid of your " + operation[3][0] + (operation[3][0] == "mimbrane" && attachedMimbranes() > 1?"s":"") + "." + (pc.isMischievous()?" You're actually quite attached to " + (operation[3][0] == "mimbrane" && attachedMimbranes() > 1?"them.":"it."):""));
	operation[3].shift();
	novaClinicParasite(operation);
}

public function novaclinicFinalCheck(operation:Array):void{
	author("LukaDoc");
	if (operation[1].length > 0 || operation[2].length > 0){
		if (makiusLeftClinic()){
			//kayl
			showBust("RASKVEL_MALE");
			output("\"Okay, where did I put- aha!\" He rushes over to a nearby table to procure a gun-syringe. \"Don’t worry, I assure you I trained how to use this,\" he smiles nervously.");
			output("\n\nThat isn't very reassuring... but, he's the best you'll get in this situation. Saying nothing, you hold out your arm and indicate he can anaesthetize you.");
			output("\n\n<b>" + operation[0] + " hours later….</b>");
			output("\n\n\"So, how’re you feeling? Not too bad I hope?\" he asks, not really sure of himself.");
			output("\n\nA few moments to check yourself over, and you reply that everything feels just fine; he did a good job.");
			output("\n\n\"Phew, that’s a relief,\" he says.");
		}else{
			//makius
			showBust(makiusBust());
			output("\"Alright then… let’s get started!\" Maki declares fetching a gun-syringe. \"This will only hurt a little,\" he says.");
			output("\n\nYou hold out your arm to let him anaesthetize you.");
			output("\n\n<b>" + operation[0] + " hours later….</b>");
			output("\n\n\"Alright, that should be everything. How are you feeling [pc.name]?\" Maki asks putting away the last of his tools.");
			output("\n\nStretching to get some of the kinks out of your joints, you reply that you're feeling much better, and thank the doctor for his treatment.");
			output("\n\n\"Always glad to help,\" he happily declares, tail swishing happily behind.");
		}
		//get rid of illnesses
		for (var sstd:String in operation[1])pc.removeStatusEffect(operation[1][sstd]);
		for (var para:String in operation[2])purgeParasites(operation[2][para]);
		processTime(operation[0] * 60);
	}else{
		if (makiusLeftClinic()){
			//kayl
			showBust("RASKVEL_MALE");
			output("\"Doesn’t seem like there’s anything wrong with you. At least nothing that I can detect,\" the raskvel shrugs.");
			output("\n\nYou thank the doctor for taking a look at you anyway. Better safe than sorry, after all.");
		}else{
			//makius
			showBust(makiusBust());
			output("\"I can’t see anything wrong with you, [pc.name]. That means you’re completely healthy,\" he declares smiling pleasantly.");
			output("\n\nYou smile and thank the doctor for the good news.");
		}
	}
	output("Your business done for the moment, you decide to bid the " + (makiusLeftClinic()?"raskvel":"good doctor") + " farewell and leave the clinic.");
	clearMenu();
	addButton(0, "Back", move, "NOVA CLINIC");
}

//free if talked to makius about your health when dying and you have no money
public function novaClinicHeal(freebie:Boolean = false):void{
	clearOutput();
	author("LukaDoc");
	processTime(15);
	move("NOVA CLINIC OFFICE");
	output("You tell the doctor that you'd like to get some treatment while you're here; better to be safe than sorry, right?");
	clearMenu();
	if (makiusLeftClinic()){
		//kayl
		showBust("RASKVEL_MALE");
		output("\n\n\"Sure thing, please come with me,\" the raskvel motions for you to follow.");
	}else{
		//makius
		showBust(makiusBust());
		output("\n\n\"Of course, let’s go then, \" he says, motioning for you to follow.");
	}
	output("\n\n\"You follow the " + (makiusLeftClinic()?"raskvel":"Venarian") + " to an available room. As you might have expected, it's nothing particularly fancy, but it looks clean enough and it does have plenty of privacy. You " + (!pc.isNude()?"take off your clothes" + (pc.exhibitionism() < 50 && pc.isCrotchGarbed()?"down to your [pc.lowerUndergarment] and settle yourself":"until you're completely nude and settle your naked body"):"settle your naked body") + " upon a low-slung examining table - obviously, the bulk of the races that go through here are raskvel and gabilani - and wait for Dr. " + (makiusLeftClinic()?"Kayl":"Makius") + " to gather his instruments.");
	output("\n\nHe procures a light. It looks like it came from an old mining helmet," + (makiusLeftClinic()?" and you can see his head tilt from the weight,":"") + " still you say nothing.");
	output("\n\n\"Just " + (makiusLeftClinic()?"a moment, while I check your body,\" he says, as he starts to examine your wounds" + (pc.isNude() || !(pc.exhibitionism() < 50 && pc.isCrotchGarbed())?", paying no attention to your naked [pc.groin]" + (pc.exhibitionism() >= 50?", despite how hard you're trying to make him look at it":""):"") +".":"be still for a moment, while I examine your wounds,\" Maki " + (pc.isNude() || !(pc.exhibitionism() < 50 && pc.isCrotchGarbed())?"stammers, trying his best to observe you, while avoiding staring at your [pc.crotch]" + (pc.exhibitionism() >= 50?", which is hard considering that you are trying to make him look at it":""):"explains as he observes your wounds") + "."));
	if (pc.HP() > pc.HPMax() / 2){
		output((makiusLeftClinic()?"\n\n\"I see that you’re wounded,\" he says leaning in to examine you a bit closer. \"Doesn’t look so bad, maybe a few bandages and healing paste will take care of that. We got enough to spare, so I don’t think we need to charge you anything.\"":"\n\nAfter he examines your wounds, he explains, \"This isn't too serious, so we can also treat your injuries right away. We got bandages and healing paste to spare, so I don’t think we’ll have to charge you for that.\""));
		addButton(0, "Get Healed", novaClinicHealYes);
	}else{
		//Cost = 10 times HP 
		var cost:int = Math.round(pc.HPMax() - pc.HP()) * 10;
		output((makiusLeftClinic()?"\n\n\"That looks… pretty bad,\" Kayl says with a grimace. \"We can probably take care of that, but we’ll need " + num2Text(cost) + " credits for the necessary supplies.\"":(!(pc.credits < cost && freebie)?"\n\nAfter he examines your wounds, he explains with a hint of worry in his voice, \"I’m afraid we’ll have to charge you to take care of all your injuries. Some of them are pretty serious and we’ll need to have one of the nurses go buy a few supplies to treat you. We’ll need " + num2Text(cost) + " credits to treat your wounds.\"":"")));
		if (pc.credits >= cost || freebie) addButton(0, "Get Healed", novaClinicHealYes, cost);
		else addDisabledButton(0, "Get Healed", "Get Healed", "You are too broke to afford healthcare");
	}
	addButton(1, "No", novaClinicHealNo);
}

public function processMakiusBuffs(deltaT:int):void{
	if(pc.hasStatusEffect("Bandaged")) pc.HP(deltaT / 2);
	if (pc.hasStatusEffect("Venarian Spit")){
		pc.HP(deltaT / 2);
		pc.energy(deltaT / 2);
	}
}

public function novaClinicHealYes(cost:int = 0):void{
	clearOutput();
	author("LukaDoc");
	processTime(30);
	if (makiusLeftClinic()){
		//kayl
		showBust("RASKVEL_MALE", "RASKVEL_FEMALE");
		if (pc.HP() > pc.HPMax() / 2){
			output("You confirm that you would like the doctor to treat your injuries.");
			output("\n\n\"Alright, I’ll have one of the nurses bring it over,\" he says.");
		}else{
			output("It's understandable, you reply, and confirm that you do want to get your wounds seen to.");
			output("\n\n\"Alright, please transfer the credits and I’ll message one of the nurses,\" he says, tapping away at a tablet computer.");
			output("\n\nYou reach for your codex and, in a few moments, a successful transaction is confirmed.");
			pc.credits -= cost;
		}
	}else{
		//makius
		showBust(makiusBust(), "RASKVEL_FEMALE");
		if (pc.HP() > pc.HPMax() / 2){
			output("You confirm that you would like the doctor to treat your injuries.");
			output("\n\n\"Great, I’ll have one of the nurses bring us the materials,\" he says with a smile.");
		}else{
			//should be unable to get here without enough money or a freebie
			if (pc.credits >= cost){
				output("\n\nIt's understandable, you reply, and confirm that you do want to get your wounds seen to. ");
				output("\n\n\"Alright, please transfer the credits and I’ll message one of the nurses,\" he says, tapping away at a tablet computer.");
				output("\n\nYou reach for your codex and, in the work of a few moments, a successful transaction is confirmed.");
				pc.credits -= cost;
			}
		}
	}
	output("\n\nThe doctor calls one of the nurses, and not a minute later and she is already walking into the room with supplies. " + (pc.isNude() || !(pc.exhibitionism() < 50 && pc.isCrotchGarbed())?"She can't help herself from ogling your nude form.":""));
	output("\n\n\"The nurse will take it from here,\" the " + (makiusLeftClinic()?"raskvel":"Venarian") + " says and, after giving the nurse her instructions, leaves the room.");
	output("\n\n\"I need you to relax, while I take care of your wounds\" she says" + (pc.hasCock()?", her eyes transfixed on " + (pc.isNude() || !(pc.exhibitionism() < 50 && pc.isCrotchGarbed())?"your naked [pc.groin]":"the bulge in your [pc.lowerUndergarment]"):"") + ". She puts on disposable gloves, opens a bottle of healing paste and carefully applies it over your wounds. The paste hurts for a little bit, but then it's replaced with a soft warmth." + (pc.HP() <= pc.HPMax() / 2?" For your more serious wounds she grabs a few bandages and covers your wounds.":"") + (pc.hasCock()?" During the treatment, she is clearly biting her lips in restraint and trying her best to seem professional. At one point, however, she couldn't help herself and touches your " + (pc.isNude() || !(pc.exhibitionism() < 50 && pc.isCrotchGarbed())?"[pc.cock]":"bulge") + ", leaving her hand in place far longer than medically excusable.":""));
	output("\n\n\"We're all done, [pc.name] " + (pc.HP() <= pc.HPMax() / 2?"Just keep the bandages on for at least a day. ":"") + "she cheerily says.");
	output("\n\nAs you leave the examination room, you feel as strong as an ox and ready for some more tussling.");
	if (pc.HP() <= pc.HPMax() / 2) pc.createStatusEffect("Bandaged", 50, 0, 0, 0, false, "Icon_Drug_Pill_Heal", "You have bandages with healing agent covering your body, slowly healing you outside of battle.", false, 1440);
	pc.HP(pc.HPMax() / 2);
	clearMenu();
	addButton(0, "Back", move, "NOVA CLINIC");
}

public function novaClinicHealNo():void{
	clearOutput();
	author("LukaDoc");
	processTime(2);
	if (makiusLeftClinic()){
		//kayl
		showBust("RASKVEL_MALE");
		if (pc.HP() > pc.HPMax() / 2){
			output("Shaking your head, you insist that you don't need any treatment.");
			output("\n\n\"Suit yourself,\" he says, shrugging.");
		}else{
			output("\n\nWith a shake of your head, you assert that you'll be fine; you don't want to get your wounds treated.");
			output("\n\n\"Um… okay….\" He glances at you once more.");
		}
	}else{
		//makius
		showBust(makiusBust());
		if (pc.HP() > pc.HPMax() / 2){
			output("Shaking your head, you insist that you don't need any treatment.");
			output("\n\n\"Very well, they aren’t too bad, so you should be fine,\" he smiles apologetically.");
		}else{
			output("\n\nWith a shake of your head, you assert that you'll be fine; you don't want to get your wounds treated.");
			output("\n\n\"Are you sure? You could… no… nevermind. It’s not my place to force you to get treated against your will, I’m sorry we can’t help you,\" Maki says, averting his gaze in disappointment.");
		}
	}
	output("\n\nYou both leave the examination room and return to the front desk.");
	clearMenu();
	addButton(0, "Back", move, "NOVA CLINIC");
}

public function makiusClinicSex():void{
	clearOutput();
	author("LukaDoc");
	processTime(20);
	showBust(makiusBust(2));
	move("NOVA CLINIC OFFICE");
	output("You ask " + (flags["MAKI_RELATIONSHIP_STATUS"] == 2?"your boyfriend":"the doctor") + " if he has time for a break.");
	output("\n\n\"I'm actually quite busy,\" he says as he finishes off some paperwork. You lean closer and whisper exactly what you meant. Maki starts blushing immediately and visibly, his ears flatten in embarrassment, tail swishing to and fro.");
	output("\n\n\"I-I guess I can make some time. " + (flags["PC_SEEN_BREEDER_MAKI"] == true && pc.hasCock()?"But I'll be taking suppressants. Going into heat is a huge distraction. Maybe if I was back on your ship. ":"") + "He calls for Kayl, trying his best to hide his embarrassment. \"Kayl! I need you to take over from me, while I go examine this p-patient. [pc.heShe] really needs...\"");
	output("\n\nBut before he could finish Kayl puts his finger in front of his mouth. \"No need for excuses. I'll take care of things over here.\" The raskvel shoves him out of the front desk and sits on the now-empty chair. \"Go have some fun with your [pc.boyGirl]friend!\" The raskvel apprentice snickers, \" and don't forget: last room on the right.\"");
	output("\n\nThe Venarian doctor becomes even more embarrassed, so much you swear you even see a blush under all that white fluff. ");
	output("\n\nYou follow your " + (flags["MAKI_RELATIONSHIP_STATUS"] == 2?"boy":"") + "friend into examination room hidden further along the corridor. The room must be for rich rushers, considering how large and comfy the bed is. It doesn't even-look jury-rigged, unlike everything else in this room. In one corner you spot a closed door which you assume leads to a bathroom.");
	if (flags["MAKI_RELATIONSHIP_STATUS"] == 2){
		output("\n\nYou pull your Venarian mate into a deep kiss. Maki eagerly returns, taking advantage of the opportunity to grope and rub you.");
		output("\n\nWhen you finally break apart, he is panting and gazing lustily at you. \"So, that's what you want.\" He smiles. \"That's unfair, you know I can't say no to you. And then you go ahead and get me all worked up.\"");
		output("\n\nYou look over your lover, smiling when you see his jutting erection tenting his pants, and pull him into a hug, rubbing his mane with one hand while the other trails down to brush the base of his tail.");
		output("\n\nMaki smiles happily as you rub him down, responding by doing his best to rub himself against you. " + (!pc.isNude()?"Using his advantageous position he begins working on your [pc.gear]. You guide him through stripping yourself down until you are standing naked before him, then begin returning the favor. H":"Then, h") + "e just lays down and lets you peel of his clothes and toss them away. When he's completely naked, he wraps you into another hug, rubbing himself against you once more and coiling his tail around " + (pc.tailCount > 0?"your own":"your waist") + ".");
		output("\n\n\"Alright, that's enough foreplay I think. I want you now.\"");
		output("\n\nYou agree and start considering your options.");
	}else if (flags["MAKI_RELATIONSHIP_STATUS"] == 1){
		output("\n\nYou pull your Venarian lover into a deep kiss, holding him tightly against your body. Maki embraces you, his tail " + (pc.tailCount > 0?"entwining with your own":"circling your waist") + ". A short moment later he breaks the kiss, panting and looking at you with wanton lust.");
		output("\n\nYou note that his pants are starting to tent.");
		output("\n\n\"Do you want to....\"");
		output("\n\nYou simply nod in reply. " + (!pc.isNude()?"Slowly you get off the bed and begin to peel off your clothes":"Being naked already, you simply climb into the bed and wait for him, letting him ogle every inch of your bare form") + ". Not wanting to be left behind, Maki begins taking off his clothes, and soon you are both naked. The Venarian tries to look away in embarrassment, but can't seem to stop himself from eyeing you with lust. You respond by striking a pose" + (pc.tone > 49?", flexing your muscles":"") + " and asking if he likes what he sees.");
		output("\n\n\"I love what I see!\" He replies with a smile, licking his lips. \"So, what should we do?\"");
	}
	makiusSexMenu();
}