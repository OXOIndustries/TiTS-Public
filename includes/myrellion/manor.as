public function myrellionManorEntrance():Boolean
{
	output("Following the road, you find yourself coming up to the manor’s gate, where two uniformed sentries are waiting for you.");
	
	var pRace:String = pc.race();
	
	if (pRace == "gold myr") output(" They’re both tensed and on-edge as they approach you, and one casts a glance back toward the gate’s security posts, where you assume they have reinforcements. You suppose you’re getting used to this treatment, considering you look like a two-armed gold myr.");	
	else if (pRace == "red myr") output(" The two of them look confused and apprehensive as they approach you, and you realize they’re probably wondering why a red myr like themselves is visiting the manor without a uniform and bearing strange gear.");
	else output(" They both look at you with cautious interest as they approach you, and you guess you might be the first alien either of these women has encountered.");
	
	output("\n\nOnce you’ve provided proof of your identity and your status as a UGC citizen, one of the guards turns back toward the gate and gives a hand signal. As you look in that direction, you notice a few gun barrels withdrawing from slots in the wall beyond. That’s met with a sigh of relief from you; it’s only sensible to find relief in knowing you no longer have three or four sets of crosshairs on you.");
	
	output("\n\nYou’re free to advance into the manor now.");
	return false;
}

public function myrellionManorOutsideBedroom():Boolean
{
	// Block access to east exit (bedroom) unless Marshall has been fucked
	if (9999 == 9999)
	{
		flags["NAV_DISABLED"] = NAV_EAST_DISABLE;
	}
	return false;
}

public function myrellionManorEnterWarroom():Boolean
{
	//clearOutput();

	//War Room (First Time)
	if (flags["MANOR_WARROOM_ENTERED"] == undefined)
	{
		output("You approach a large, open doorway, behind which you can hear the low commotion of several people talking quietly at once. Every few seconds, the hustle and bustle is punctuated by one voice rising up louder than the others, and a soldier or servant-girl rushing out of the room and slipping past you without a word.");
		
		output("\n\nThere’s a single sentry standing next to the entrance. You take a step toward her and prepare to introduce yourself, but she just takes one quick look at you before turning to face a strange contraption built into the wall. There’s something resembling a small brass cone attached by wire, which is picked up off its hanging hook by the sentry and placed to her ear. She then places her mouth by a larger brass tube, like the end of a trumpet.");
		
		output("\n\n<i>“Ma’am! Steele is just outside the doorway,”</i> you hear her announce. It seems you were expected. Could the occupying commander have been keeping tabs on you since your arrival in the city?");
		
		output("\n\nThe sentry turns to face you again. <i>“Marshal Sellera is ready to see you,”</i> she says flatly. Well. You probably shouldn’t keep her waiting if you want to speak to her at all.");

		// [Go Inside] (Other option is to leave the "room," and meet with the following scene each time until you choose Go Inside)
		clearMenu();
		addButton(0, "Go Inside", myrellionManorGoInside, undefined, "Enter the room", "This looks to be the busiest room in the manor, and the head officer of the occupation is apparently inside. If you wanted to discuss anything with her, here's the best place to do it.");
		addButton(14, "Back", move, "834");

		return true;
	}
	else
	{
		output("You approach the bustling, busy doorway that you know leads to the manor’s administration office. A familiar-looking soldier is standing sentry, and you could swear you catch a quick glimpse of a smile on her face once she’s seen you.");
		
		output("\n\nOnce you’re close enough to face her, the sentry asks if you’re going inside to see Field Marshal Sellera.");
		
		output("\n\nDo you have business with the Marshal, or are you just passing through?");

		clearMenu()
		addButton(0, "Sellera", approachSellera);
		addButton(14, "Back", move, "834");
		return true;
	}
}

public function myrellionManorGoInside():Boolean
{
	clearOutput();
	showName("MANOR\nWAR ROOM");

	output("While you’re here in Kressia, you figure it’d be prudent to meet with the occupation force’s commander.");
	// Not found the probe yet
	if (!reclaimedProbeMyrellion()) output(" She may have information on any alien technology that’s gone through here, like one of your father’s probes.");
	output(" After all, you’re a visiting UGC citizen, and a high-profile one at that. What’s the worst they could do to you?");
	
	output("\n\nYou move past the sentry and step through the wide doorway. The scene that greets you upon entering certainly suits the hubbub you heard from outside. The first comparison that comes to mind is a kicked anthill, which brings a small smile to your face. Uniformed red myr rush back and forth around the office-like room, carrying papers and boxes while hurriedly making their way through the maze of desks and workspaces. Decorated officers move about, picking up files or delivering instructions. Though everyone is speaking in a low voice, the presence of so much activity, even in a large room like this, is almost deafening. It’s putting you on edge, and you wonder how the myr are able to function like this.");
	
	output("\n\nOne soldier in the functional garb you’ve seen the guards and sentries wearing, what you assume is their combat attire, approaches you. She hails you in a raised voice loud enough to penetrate the ambient buzz. <i>“Captain Steele. The marshal is in the war room. Follow me.”</i> She then turns snappily, moving away from you with a sauntering gait that manages to look professional while still drawing your attention to her toned and shapely ass. You’re not sure if it’s racial genetics or if it’s due to some military exercise regimen, but you have yet to see a red myr whose hindquarters weren’t a work of art.");
	
	output("\n\nYou follow her through the main aisle bisecting the bustling room, moving to the back wall where she knocks on a nondescript and easily overlooked doorway. It opens a moment later, and your escort leads you into a small side-room where another sentry awaits. The first soldier gives you a nod and then turns back, likely resuming whatever duty she’d been occupied with before you arrived.");
	
	output("\n\n");
	if (pc.isNice()) output("Flashing a smile");
	else if (pc.isMischievous()) output("Winking");
	else output("Pursing your lips");
	output(" at this new guard, you quickly take a look around the room. A lift platform dominates the center of the small room, surrounded by dusty crates. This must have been an access for moving supplies up from the basement, you surmise.");

	addButton(0, "Go Down", move, "841");
	addButton(14, "Leave", move, "834");
	return false;
}

public function myrellionManorAdminRoom():Boolean
{
	if (flags["MANOR_ADMINROOM_ENTERED"] == undefined)
	{
		//clearOutput();
		selleraHeader();

		flags["MANOR_WARROOM_ENTERED"] = 1;
		flags["MANOR_ADMINROOM_ENTERED"] = 1;

		output("After a brief moment, you look the guard in the eyes. There’s a brief moment of mutual assessment before she about-faces and leads you onto the lift. You’re both taken down a level into a room nearly identical to the last. The only difference that’s readily apparent is the lack of noise on the other side of the door.");
		
		output("\n\nOnce more, you’re treated to a good view of some tight red myr physique as the uniformed soldier steps off the lift and slowly approaches the door on the other side of the room. Goodness. You don’t think you could ever get tired of watching <i>that</i>, and if these red-hued girls insist on leading you everywhere, you’ll likely have plenty more opportunities to put that theory to the test. Careful not to be caught gawking, you");
		if(pc.hasLegs() && pc.hasFeet()) output(" place one [pc.foot] in front of the other and");
		output(" force yourself to look forward. You make your way over to the door and open it, stepping into a very, very different room from the one upstairs.");
		
		output("\n\nThe lights are dimmer here, for one. It’s also much emptier. In fact, you can only see three myr inside, and each are covered in battle honors and signs of prestige. You don’t need any codex or translator to tell you that these are some very high-ranked veterans of the war. A set of eyes and a pair of brain cells to rub together");
		if (pc.IQ() <= 25) output(", even if they’re your <i>last</i> pair,");
		output(" get the message across just fine. Two of the myr look to be on their way out, actually, and both throw you curious glances before heading out a back door. Your attention, however, is on the third sitting at the other end of a long table: a Scarlet Federation officer whose uniform " + (flags["BEEN_ON_TARKUS"] != undefined ? "has more metal on it than Tarkus" : "is heavily decorated in medals") + ".");
		if (flags["MET_NEHZARA"] != undefined) output(" A uniform, you note, which looks to be of the same type worn by Colonel Nehzara.");
		output(" The air around her seems to fill with intensity as she leans forward to skewer you with her jet-black gaze.");
		
		output("\n\n<i>“Steele,”</i> she purrs. <i>“Captain Steele.”</i> Her voice isn’t unpleasant, but there’s something icy and dangerous about it. The way she says your name reminds you of a predator that’s thinking over the best time to pounce on its target. Her eyes drift down to");
		if (pc.hasMeleeWeapon()) output(" your [pc.meleeWeapon] and narrow before moving on to");
		if (pc.hasRangedWeapon()) output(" your [pc.rangedWeapon] and");
		output(" the [pc.clothes] you’re wearing.");
		
		// maybe do an inv check for ANY weapons
		var hasWeaponInv:Boolean = pc.hasWeapon();
		
		if (hasWeaponInv) output(" It occurs to you that it’s pretty odd you weren’t disarmed before being taken to see the occupation leader herself, whom you assume is the myr woman in front of you now. Something tells you it wasn’t an oversight.");
		
		output("\n\nHer eyes leave you");
		if (hasWeaponInv) output("r weapon");
		output(" after a long, tense moment. You get the feeling she was somehow taking your measure by appraising your equipment. The smile on her face is too emotionless, too ambiguous to give you any good indication of exactly what she thinks of her first impression of you.");
		if (pc.isNice()) output(" Well, it couldn’t have been anything too bad.");
		else if (pc.isMischievous()) output(" Hopefully she likes what she sees; keeping up a body like yours isn’t easy!");
		else output(" If she’s sizing you up because she thinks you’re prey, she’d better think again.");
		
		output("\n\nThe officer speaks up again after a moment of mutual examination. <i>“Hm. You’re exactly like the grapevine said, Steele. Uncannily so.”</i> She inhales quietly but deeply, holding her breath in for a moment before suddenly exhaling and springing out of her chair.");
		
		output("\n\nYou tense");
		if (pc.WQ() >= 75) output(" ever-so-slightly");
		output(" at the unannounced movement, taken aback by the agility and grace of her action. She moved almost too quickly to track, and all without disturbing her chair as she left it. You’re fully aware of how strong myr are as well, so that level of coordinated swiftness is somewhat alarming. The marshal may be a commander rather than a front-line soldier, but it’s quite clear she didn’t let herself go to seed because of it.");
		
		output("\n\n<i>“I have not yet introduced myself,”</i> she declares with a subtle smile, evidently pleased by your reaction. <i>“I am Field Marshal Sellera, appointed commander of the Kressia Occupation Army and the highest-ranking officer currently prosecuting the ongoing Gildenmere campaign.”</i> The expression on her face grows into a wicked grin");
		if (pc.race() == "gold myr") output(" as she sizes up your gold myr features");
		output(", and she takes short, measured steps toward you along the table’s edge. <i>“Of course, we’re only a mere ‘occupation army’ because half my constituent corps are scattered around the theater holding defensive positions while your people insist on a ceasefire. I commanded the entirety of the primary offensive force prior to your arrival.”</i>");
		
		output("\n\nWow. A real bigshot, then. If what she says is true, then the imposing woman walking in your direction is a noble among the ruling class of the Scarlet Federation, someone who commands generals and determines the course of an entire war. Her importance would be comparable to one of the highest queens among her enemy’s culture. Most of all, she doesn’t even appear that <i>old</i>, though you’ve already noticed that myr age somewhat differently from humans. She’s either got friends in very high places, or she’s some sort of prodigy.");
		
		output("\n\n<i>“And don’t think I spent all my time sitting in a cozy chair issuing orders, Steele,”</i> the marshal continues, now only an arm’s length away from you. She casually gestures toward the wall as she says this, and you flick your gaze over in that direction to see what it is she wants you to look at. Your eyes come to rest on an absolutely ludicrously sized double-bladed axe mounted in an ornate frame at chest-height. You know myr warriors are fond of big weapons, but that’s just obscene!");
		
		output("\n\n<i>“Oh, that’s ornamental,”</i> she reveals with a small laugh. <i>“I carry it during public appearances. It’ll chop through you just fine, but I wouldn’t want to use it in combat. I’d be cut down in the time it took to recover from a single swing.”</i> You breathe a sigh of relief. You didn’t want to believe anyone on this planet could possibly be capable of actually wielding that thing in battle. That would be genuinely terrifying.");
		
		output("\n\nSellera pulls out a chair at the side of the table, near the closer end, and waves at the opposite chair, beckoning you to do the same. You comply, finding that the large table gives you just enough space to feel separated from her while still seeming close and intimate. <i>“So, Captain Steele,”</i> she says carefully, sitting back and taking a slow, prolonged breath. <i>“I’ll get to the point. Why are you in Kressia?”</i>");
		
		processTime(5);
		
		clearMenu();
		addButton(0, "Mission", selleraYourMission, undefined, "Your Mission", "Tell Sellera you're here searching for a way to get your father's fortune and prove your worth.");
		addButton(1, "Sightseeing", selleraSightseeing, undefined, "Sightseeing", "Tell Sellera you're just the first fruit of Myrellion's new tourist industry, taking in the sights and experiences of the whole planet.");
		addButton(2, "Exploration", selleraExploration, undefined, "Exploration", "Tell Sellera you're interested in going where no man, or woman, or herm, or whatever has gone before, meeting new species and exploring new frontiers.");
		return true;
	}
	else
	{
		output("You find yourself in a dimmer level than the one above. Standing before you are two guards in front of the administration office of Field Marshal Sellera.");
		output("\n\nDo you need enter and speak to her about anything?");
		flags["NAV_DISABLED"] = NAV_IN_DISABLE;
		clearMenu();
		addButton(0, "Sellera", approachSellera, undefined, "Approach Sellera", "May as well visit the marshal while you're here.");
		addButton(14, "Leave", move, "834");
		return true;
	}
}

public function selleraHeader(nude:Boolean = false):void
{
	if(!nude) showBust("SELLERA");
	else showBust("SELLERA_NUDE");
	showName("\nSELLERA");
	author("Kaiju"); // ?
}

public function selleraYourMission():void
{
	clearOutput();
	selleraHeader();

	output("You take a few moments and explain your frontier-spanning mission to obtain your rightful inheritance, coming into contact with all sorts of strange creatures and individuals as you follow the Planet Rush.");
	
	output("\n\nSellera nods as you go on, apparently fascinated by your tale. Her lips turn up into a genuine smile when you finish. <i>“So your father has made you embark on some manner of campaign, a quest, to claim the fruits of your family’s fortune and success?”</i> She’s practically beaming now! <i>“I like this idea. To succeed your father, you must prove yourself his equal, or better. It’s not simply handed to you on a silver platter. You must claim your place in the world.”</i>");
	
	output("\n\n<i>“Yes,”</i> she continues, <i>“the more I think about it, the more I admire the idea. I think, if I’d met him, I might just like your sire, Steele.”</i> The marshal lightly bites the tip of one of her fingers, eyes going distant as she presumably imagines an older, more experienced");
	if (pc.mf("m", "f") == "f") output(" male version of");
	output(" you.");
	
	output("\n\nWell, you’re not exactly sure how you should take that. Fantasizing about your dead dad right in front of you? That’s pretty gross.");
	
	output("\n\nInterrupting her with");
	if (pc.isNice()) output(" an understated clearing of your throat");
	else if (pc.isMischievous()) output(" a comically exaggerated cough");
	else output(" a blunt and straightforward clearing of your throat");
	output(", you ask if she knows anything about");
	if (!reclaimedProbeMyrellion()) output(" where the probe could be");
	else output(" how the probe made it all the way into the caverns");
	output(". If anyone would know, the commander of every single soldier in Kressia is a very likely candidate.");
	
	output("\n\n<i>“I cannot say that I have any information on the topic,”</i> Sellera replies. Her response seems genuine; if she’s lying, she’s doing a very good job of it. You can’t think of a reason for her to lie, though. It’s not as if your father’s probe has any military use, so it’s doubtful the marshal would be interested in it.");
	
	output("\n\nAfter a moment of silent thought, the marshal seems to remember something. Leaning forward, she says, <i>“Shortly before First Contact, we received reports from our surface scouts of a massive impact in the plains west of the Kressia airfield. We assumed it was Republic artillery, though the blast was much larger, and buried deeper, than their guns normally do. The lead scout, one of my more... liberated... commandos by the name of Thyrsa, mentioned it had created a tunnel that appeared to lead deeper underground than our standard tunnels. It is possible that impact was your probe landing. I cannot guarantee that, however.</i>");
	
	output("\n\n<i>“I’m sorry I can’t answer your questions on that front, Steele,”</i> she says in what comes close to an actual tone of regret. <i>“Is there anything else you’d like to know?”</i>");

	processTime(5);

	// [The War] [Occupation] [Sellera] [Nehzara] [Appearance] [Leave]
	selleraMenu();
}

public function selleraSightseeing():void
{
	clearOutput();
	selleraHeader();

	output("Well, that’s a good question. What exactly <i>are</i> you doing in Kressia? You take a quick moment to think about it and decide to give the most honest answer: you just wanted to see the place.");
	
	output("\n\nBy the expression on Sellera’s face, she’s a little taken aback by this answer. <i>“Your reason is... you came on an impulse?”</i>");
	
	output("\n\nThat’s not entirely correct. Sure, some impulse may have been involved, but you knew what you were doing and made a conscious decision to travel to Kressia. It wasn’t as if you just let your [pc.legsNoun] simply carry you along and you wound up here. When she doesn’t get that, either, you do your best to explain the concept of tourism to her and ask if the myr don’t have an analogue.");
	
	output("\n\n<i>“Yes and no,”</i> she replies, crossing her arms over her chest. <i>“We certainly travel between cities from time to time, perhaps going to see monuments or museums or showcases of great art and engineering while we are there, but... it isn’t nearly so pronounced as to warrant an entire </i>industry<i> devoted to it. Nothing worthy of being referred to as such, in any case.”</i>");
	
	output("\n\n");
	if (pc.isNice()) output("Smiling, you suggest that with the entire population of the UGC as potential tourists, maybe that will change. If there are such great works of art and engineering in the Federation, surely there are others who’d want to see them.");
	else if (pc.isMischievous()) output("Smirking, you answer that you <i>are</i> an alien, after all. As far as you’re concerned, the myr are the weird ones. As things stand, you’re probably just the first of a new phenomenon for Myrellion.");
	else output("Sighing, you remark that it shouldn’t be surprising the Federation wouldn’t be willing to pull the sticks out of their asses long enough to go enjoy themselves. Maybe with the new contact with the UGC, they’ll have the opportunity to see a third way of life that isn’t theirs or the Golds’.");
	
	output("\n\nSellera nods slowly, mulling it over in her head. <i>“Perhaps, Steele. Perhaps. Your arrival certainly means change for all of us... for better or worse. Now, with that enlightening conversation out of the way, is there anything else you’d like to discuss?”</i>");

	//[The War] [Occupation] [Sellera] [Nehzara] [Appearance] [Leave]
	selleraMenu();
}

public function selleraExploration():void
{
	clearOutput();
	selleraHeader();

	output("There’s a definite note of pride in your voice as you answer her question. You’re just fulfilling the heartfelt dream of everyone who’s ever looked up at the stars and longed to see the edges of eternity. You’re exploring the edges of civilized space, boldly going into the great black unknown. Perhaps you even phrase it in a slightly less cheesy fashion. The crux of it is that you’re an explorer, and you’re seeking out whatever new sights and discoveries you can.");
	
	output("\n\nThis elicits a mixed response from the field marshal. She takes a moment to ponder over your answer, and then takes a long, leggy step forward.");
	
	output("\n\nYou find yourself backing up into the wall as she leans in to look");
	if (pc.tallness >= 70) output(" up");
	else if (pc.tallness >= 65) output(" straight");
	else output(" down");
	output(" at you and stare into your eyes. An intense moment passes while you feel as if your very soul is being measured. Then it’s over and she turns around, sauntering back over to her previous position to lean against the table and face you once more.");
	
	output("\n\n<i>“You have passion,”</i> Sellera says approvingly. <i>“A drive to do something for yourself. Fire. I respect this. It’s a very... appealing character trait.”</i> She licks her lips slowly as she looks you up and down once more. Why do you get the feeling of being sized up for dinner every time she does that? You’re starting to imagine you’re the ant here, and you waltzed into a spider’s web.");
	
	output("\n\nAn awkward silence follows before she speaks up again. <i>“In any case, Steele... since you’ve come all the way here to see me, is there anything else you’d like to know?”</i>");

	// [The War] [Occupation] [Sellera] [Nehzara] [Appearance] [Leave]
	selleraMenu();
}

public function approachSellera():void
{
	clearOutput();
	selleraHeader();
	
	currentLocation = "841";
	generateMap();

	output("Giving a nod to the Red soldier, you head into the office and wait for one of the uniformed women to approach you. Once again, you follow the soldier to a side-room, onto a lift, and down into the basement lair of Field Marshal Sellera.");
	
	output("\n\nYou find her sitting alone in the secluded war room, though judging by the sound of a closing door just before you walked in, at least one other person just left. There’s a glass cup on the table in front of her, filled halfway with a liquid that’s as black as a pirate’s heart. Could be some form of myr liquor, you guess. In any case, Sellera downs it in one gulp when she sees you, and then gives you her usual dagger-sharp smile.");
	
	output("\n\n<i>“Steele,”</i> she begins, <i>“you’ve returned. I take it there’s something you’d like to... discuss?”</i>");

	selleraMenu();
}

public function gatedButton(data:Object, forceLock:Boolean = false):void
{
	if (forceLock || (data.prevF != null && data.f != null && data.f == data.prevF))
	{
		addDisabledButton(data.id, data.lbl, data.ttH, data.ttB);
	}
	else
	{
		addButton(data.id, data.lbl, data.f, data.arg, data.ttH, data.ttB);
	}
}

public function selleraMenu(prevFunc:Function = null):void
{
	// [The War] [Occupation] [Sellera] [Nehzara] [Appearance] [Leave]
	clearMenu();
	
	gatedButton( { id: 0, lbl: "The War", f: selleraTheWar, arg: undefined, ttH: "The War", ttB: "Ask the marshal about the war. As the commanding officer of the entire offensive, her take on things should prove enlightening.", prevF: prevFunc } );

	gatedButton( { id: 1, lbl: "Occupation", f: selleraOccupation, arg: undefined, ttH: "Occupation", ttB: "Ask about the state of the occupation, and how the Reds have managed to adapt to living in Kressia.", prevF: prevFunc } );

	gatedButton( { id: 2, lbl: "Sellera", f: selleraHerself, arg: undefined, ttH: "Sellera", ttB: "Inquire as to Sellera's own history and get to know her a bit better.", prevF: prevFunc } );

	// Has met Nehz
	if (flags["MET_NEHZARA"] != undefined) gatedButton( { id: 3, lbl: "Nehzara", f: selleraNehzara, arg: undefined, ttH: "Colonel Nehzara", ttB: "Since she's the main commander of the offensive force, Sellera might know Colonel Nehzara. You could see what she thinks of the other officer.", prevF: prevFunc } );

	if (flags["SELLERA_OCCUPATION"] != undefined) gatedButton( { id: 4, lbl: "Rebels", f: selleraRebels, arg: undefined, ttH: "Rebels", ttB: "Ask a little more about the rebel problem the occupation forces are having.", prevF: prevFunc } );

	// 9999 MARSHALQUESTUUUUUU
	// if (flags["SELLERA_REBELS"] != undefined) gatedButton(5, "Aid Her", selleraAidHer, undefined, "", "", prevFunc);


	gatedButton( { id: 10, lbl: "Appearance", f: selleraAppearance, arg: undefined, ttH: "Sellera's Appearance", ttB: "The general appearance of Field Marshal Sellera.", prevF: prevFunc } );
	addButton(14, "Leave", selleraLeave, undefined, "Leave", "Bid Sellera farewell and go back upstairs.");
}

public function selleraTheWar():void
{
	clearOutput();
	selleraHeader();

	output("Deciding to address the most obvious issue, you ask about the war. Specifically, what it was like practically directing the entire course of it.");
	
	output("\n\n<i>“I wouldn’t know,”</i> Sellera says simply. When your eyes widen in surprise at her response, she flashes you a sharp smile. <i>“My promotion was recent, Steele. I was given command a week prior to the invasion of Kressia. Lasted three days, that did, and I was at the very front during the first push inside. Started out as an infantry commander fighting the nyrea menace, and I’ll die an infantry commander, field marshal or no.”</i> An emphatic nod punctuates the end of her last sentence.");
	
	output("\n\nYou may not be a field marshal, but you’re pretty sure that’s irresponsible. Some would say it’s insane. You could speak up and point that out, if you’re the type to think tact and sensibilities are overrated.");

	// [Point It Out] [Something Else]
	clearMenu();
	addButton(0, "Point Out", selleraPointItOut, undefined, "Point it Out", "You may as well tell her how reckless and foolhardy it is for someone of her rank to lead from the front where she could be easily slain.");
	addButton(1, "Otherstuff", selleraSomethingElse, false, "Something Else", "Pointing it out might just be unwise, and besides, you'd rather hear more about that juicy tidbit she dropped earlier.");
}

public function selleraPointItOut():void
{
	clearOutput();
	selleraHeader();

	output("Well, you may as well come out and say it. She should be smarter than that if she’s holding such a high rank. For a general, let alone a field marshal, to fight in the thick of things is beyond reckless: it’s insane. It’s absurd.");
	
	output("\n\nThe Federation officer’s response surprises you. You expected her to be taken aback, possibly offended, but instead she gives you a toothy smile with half-lidded eyes. <i>“You’re completely correct, Steele,”</i> she says softly. <i>“It’s probably insane. I’ve no doubt some say that about me. I hear more than people think, after all. But I lead in the only way I know how, and it conquered Kressia. It’ll conquer Gildenmere when the time comes. But most of all, it got me here. Now, as for how...”</i> She clears her throat and continues on with another story, eyes going slightly distant as she does.");

	//insert the rest of the text under Something Else beginning with "The Third Offensive Army..."
	selleraSomethingElse(true);
}

public function selleraSomethingElse(fromPoint:Boolean = false):void
{
	if (!fromPoint)
	{
		clearOutput();
		selleraHeader();

		output("Judging from the look on her face, it might not be a great idea to mention that. Instead, you ask about the days leading up to the promotion.");
		
		output("\n\nSellera takes a moment to think over how she wants to answer. Her eyes are a little distant as she speaks up, recalling recent memories that must feel like a lifetime ago.");
	}

	output("\n\n<i>“The Third Offensive Army was massing around the surface approaches of Kressia’s caverns, while the Second Offensive Army, which had suffered the worst losses in prior fighting and hadn’t yet received reinforcements, moved in through the underground routes where their smaller lines of battle wouldn’t be so detrimental. The narrow spaces, you see, make any given frontline smaller than a more open field would allow. Between the denser formations and the twisty nature of the passages, it means close-quarters combat is far more prominent belowground. Which suits us just damn fine.”</i>");
	
	output("\n\n<i>“The First, you see, was off running patrols, expeditions, etcetera further afield. IV and VII Corps, as well as a few units from the air wing attached to the First Offensive, were blazing forward on a secondary objective to cut overground supply lines to Gildenmere and seize a forward airfield. We’d hoped to convince them that we were going right for the heart of the Republic instead of cutting off an artery first, but judging from the staunch defense of Kressia, the Golds didn’t fall for the ruse.”</i> Sellera starts to walk away from you slowly, dragging her fingers across the edge of the table as she walks along its side.");
	
	output("\n\n<i>“We lost a lot of girls in the attack, many of them veteran fighters who’d been with the war since the early days.”</i> Sellera stops and looks over her shoulder at you. <i>“But this story is about the time before that, isn’t it? When I was a general commanding the II Corps?”</i>");
	
	output("\n\nYou nod slowly. She’s getting a little sidetracked, but you guess that’s to be expected.");
	
	output("\n\nShe sighs and faces away from you again before continuing. <i>“We took their forward airfield, thinking we’d just secured air superiority for the surface approach to Kressia. None of us realized the Golds had just finished construction on a new generation of tactical bombers, with about twice the range of their old craft. So we got complacent.”</i> Her hand clenches into a fist. <i>“It was a mistake we’d all regret.”</i>");
	
	output("\n\nThe field marshal takes a moment to breathe deeply before continuing. <i>“Those... underhanded cunts caught us with our pants down, utterly and completely. They must have taken off from the damn Gildenmere strip, or an airfield we hadn’t found yet. It happened in the middle of the night. The engines were surprisingly quiet, and the Third Offensive Army suffered nearly fifty percent losses from the gas in those goddamn bombs. What was left of them retreated down to regroup with us in the cavern approaches. The Third Offensive was effectively dissolved and absorbed into the Second. Virtually all of their command staff were dead, dying, or too wounded to carry out their duties. It was the most one-sided defeat we’d ever suffered, and we never fired a fucking shot. Damn them.”</i>");
	
	output("\n\nYou’re a little surprised you hadn’t heard of this from any of the other myr you’ve talked to. That sounds like a pretty big deal. Maybe they just don’t like to talk about it? Even the Golds probably aren’t proud of it, considering they gassed thousands of unsuspecting targets. Fighting is one thing, but that... what must the pilots have felt as those bombs dropped, especially so close to one of their cities?");
	
	output("\n\nSellera carries on after composing herself again, turning back around to pace toward you again. <i>“In any case, Headquarters had a fit. Even the big brass back home were breathing down our necks all of a sudden. A lot of scapegoats got made, even people in the Second Offensive Army who really had nothing to do with any of it. People were angry, and they needed someone to blame.”</i> She’s close to you again, within arm’s reach and staring right at you. <i>“Rank comes with a lot of privilege and prestige, but it also means your head’s a big target for the bullshit cannons.”</i>");
	
	output("\n\nShe lets out a long, slow breath. <i>“In any case, after another week, it looked like I was getting a promotion. Actually, everyone had expected absolute command to go to the general commanding all of the First Offensive because she’d miraculously been spared by our impromptu inquisition, but... it turned out that her two sisters and her daughter had all died in the attack. She retired from the front, followed by all manner of rumors. So... the position went to me.”</i> She shrugs. <i>“I didn’t see much use in resisting. It would’ve turned out badly if I had. So I went along with it, and here we are. In a queen’s repurposed manor and living the good life.”</i>");
	
	output("\n\nYou’re unsure if that’s sarcasm, or completely genuine. She thoroughly enjoyed saying at least half of that statement, you’re sure.");
	
	output("\n\n<i>“Is there anything else, Steele?”</i>");

	selleraMenu(selleraTheWar);
}

public function selleraOccupation():void
{
	clearOutput();
	selleraHeader();

	flags["SELLERA_OCCUPATION"] = 1;

	output("You decide to get Sellera’s take on how things are in Kressia. How are her soldiers handling occupation duty, instead of marching through caverns and across empty expanses?");
	
	output("\n\n<i>“Not well,”</i> she answers immediately. <i>“They’re restless, and itching for a fight. Occupation is nothing like waging war. In war, you sight the enemy and engage. Sometimes you walk into an ambush, sometimes you’re the ambusher, and sometimes you’re taken completely unawares, but war is war at the end of the day. It’s what we know. Occupation is... it’s sitting and waiting for some damn rebel to murder you in your sleep or attack you in the street before disappearing into the crowds and backroads. All you can do is try to keep some semblance of order among a populace that just wants you dead or gone and hope you foil the next resistance plot before it blows up in your face... quite possibly in a literal fashion. It’s tempting to just round up every bleeding heart would-be rebel and shoot them, but that would just turn every single civilian into a potential combatant. It’d be even more costly.”</i>");
	
	output("\n\nThat does sound unpleasant, but what about Sellera herself? How has she settled in?");
	
	output("\n\nThe marshal’s troubled expression lightens at that. <i>“Well, I’ve at least managed to construct a respectable command bunker here.”</i> She gestures around her stone-walled war room, wordlessly inviting you to take a second look at it. You notice marked-up maps and charts along the walls, as well as a chalkboard that appears to have been wiped clean shortly before your arrival. It certainly is respectable, you think. It’s a little spartan and plain, but very functional.");
	
	output("\n\n<i>“The admin hub upstairs was the work of my aides, and it’s even more impressive if I may say,”</i> she continues. <i>“Everything remotely related to governing Kressia and maintaining the occupation in this area links to there. The clincher is that by running voice and electric signal lines in shielded cases through the walls, we can operate auxiliary backup offices for different departments. That way, even if the rebels miraculously managed to conduct a raid this deep into our stronghold, we can’t be crippled without simultaneously striking every other office. We even have a direct line to the radio arrays set up on the surface, allowing us to keep in contact with other Federation units and facilitating the delivery of reports to the Federation proper.”</i>");
	
	output("\n\nYou’re impressed despite yourself. For a species operating on what you’d consider extremely primitive technology, they’re very coordinated. You suppose the myr of both races make up for their lack of technological aids with sheer dedication to the art of administration.");
	
	output("\n\nShe’s not done, however, and judging by the knife-edge smile taking over her face, she’s about to tell you the best part of it all.");
	
	output("\n\n<i>“Do you know what this manor was originally, Steele?”</i> she asks. So far, you’d been guessing that it was the abode of the top queen in Kressia, the home of the city’s former leader.");
	
	output("\n\n<i>“That’s correct.”</i> Sellera gives you an approving nod and continues. <i>“The room upstairs was an entertainment gallery, of sorts.”</i> She scowls. <i>“Essentially a space for the queen, her servants, and any guests to rut and suck and have an orgy, complete with all manner of lewd devices. No doubt it was all for the sake of sexual bribery.”</i> She grunts and stalks over to a nearby cabinet. The myr woman then draws out a large bottle full of jet-black drink, uncaps it, and brings it to her lips so she can drink deeply. You can smell the booze from where you’re standing, so whatever it is, it’s some damn strong stuff. <i>“And this room here was the queen’s personal bunker. A place to hide out in case the city was ever invaded. Fat lot of good it did her. You should have seen what it was filled with, Steele. Nearly an entire ton of sticky-sweet garbage... that disgusting honey-wine they drink down like water.”</i>");
	
	output("\n\nAt that, she takes another deep draught of the bottle, and without offering you a drop, closes the bottle and puts it away before turning back to you. <i>“At least I’ve begun restocking it with a far better vintage!”</i>");
	
	output("\n\nHer face looking considerably more flushed than usual, Field Marshal Sellera places her rear on the table with her hands on the edge in a rather unprofessional pose. <i>“Aside from the rebels and the sickening little reminders of whatever debauchery the Golds were up to, I suppose this posting could be far worse.”</i>");
	
	output("\n\nThe decorated officer takes a moment to huff and then looks you in the eye again. <i>“Did you have anything else to chat about, Steele?”</i>");

	processTime(5);

	//Add [Rebels?] dialogue option
	selleraMenu(selleraOccupation);
}

public function selleraRebels():void
{
	clearOutput();
	selleraHeader();

	flags["SELLERA_REBELS"] = 1;

	output("Sellera mentioned rebels, and that piqued your interest.");

	// (if has merchant queen quest:)
	if (9999 == 0) output(" You’re pretty sure that you know a little bit more about her insurgent problem than she thinks you do. If you can see what she plans to do about it, that could help you decide on the best course of action to take in your own dealings with the resistance");
	else output(" There’s a chance you could benefit a little here, either by helping the marshal smooth out her insurgent problem or by getting into contact with the resistance");
	output(". With that in mind, you press the issue a bit. Why’s she having so much trouble with the rebels in Kressia?");
	
	output("\n\nThe atmosphere instantly worsens. The field marshal was loose and casual before, but now she’s tensed and glaring at you sullenly. You picture some fanged, razor-clawed predator that’s done lazing about and is now pondering the best way to tear out your throat. Eesh. It was a simple question.");
	
	output("\n\n<i>“They’ll be dealt with,”</i> she growls. <i>“They’re just little pests that think they’re clever for hiding behind civilians and skulking about like cowards.”</i> It occurs to you that she’d likely be doing the same thing should the roles be reversed, but you’re not quite tactless enough to go blurting that out.");
	
	output("\n\nWell, what exactly have they been up to, then?");
	
	output("\n\nThe field marshal sighs, her confrontational aura bleeding away slowly. <i>“Mainly small, minor raids here and there. Enough to keep us tensed and ready, but never enough to overextend themselves. Whoever leads them, though she’s cowardly and spineless, is clever. She knows when enough is enough, and when to retreat and go underground. It doesn’t help,”</i> she snarls suddenly, <i>“that they almost certainly have outside backing. Backing I’m dealing with little by little.”</i>");
	
	output("\n\nHer expression as she says those last words sends a chill down your spine.");
	if (pc.isGoo()) output(" Well, it would if you had a spine.");
	output(" You’re not certain what’s going through her head, but it’s probably not something you want to think about. Just in case you’d begun to forget whom you’re talking to, Sellera shifts her stance and is suddenly a mere inch away from you in the time it takes to blink, leaning close and putting her face right by yours. She’s close enough that you can feel her warm breath on your [pc.face], so you find yourself with little choice but to stare into Sellera’s eyes. Other myr have the same unbroken obsidian color in their eyes, but this one’s feel like bottomless pits, ready to swallow up anything that stares into them for too long.");
	
	output("\n\n<i>“Now, Steele,”</i> the uniformed woman says in a tone dripping with poisonous saccharine,");
	//" {(if pc has met merchant queen:)
	if (flags["MET_MERCHANT_QUEEN"] != undefined) output(" <i>“I know you’re fully aware that I don’t have... </i>total<i> control of this city yet. Some troublesome elements aside from the rebels still remain.”</i> You’re pretty sure you know what she’s talking about, too: there’s still an independent Gold queen dwelling within the city, flaunting her freedom and thumbing her nose at the occupation commander. Wait, what did she mean about you being fully aware? Has she really been watching you that closely since your arrival?");
	else output(" <i>“It’s unfortunate, but the Queens have not entirely relinquished their hold on this city. One still remains, and plays off her ability to keep the masses placid just to make sure she’s more valuable to me independent and alive. And yet she undoubtedly has dealings with certain troublesome elements.”</i> You think to yourself that any high-profile Gold able to flaunt Sellera’s authority must be very crafty to have survived this long.");
	
	output("\n\n<i>“I can’t move openly against these elements if I wish to maintain what control I </i>do<i> have.”</i> The menacing myr pulls away as quickly as she’d darted forward, straightening back up and placing one hand on your chest. <i>“But that, Steele, is where you come in... I could reward you if you were to make yourself useful to me... perhaps my army’s materiel is unimpressive to you, but I have other resources at my disposal, too.”</i> One of her hands makes its way down to her skirt, slowly pulling it up and directing your attention down to her thighs and abdomen.");
	
	output("\n\nYou hesitate for just a moment at that, and Sellera smiles knowingly. <i>“You needn’t decide immediately, Steele. In fact, I strongly advise you to think long and hard about where you want to cast your loyalties in this city... and this war.”</i> Her voice goes from sultry to ice-cold in an instant. The contrast snaps you back into the moment, and you look back up at Sellera’s face.");
	
	output("\n\nThe marshal gives an exaggerated sigh, making it sound more longing than frustrated. <i>“While you’re pondering that, Steele, we could move on to another topic. I’m plenty patient.”</i>");

	// (The [Aid Her] option now shows up in all other "normal" conversation choice lists)
	selleraMenu(selleraRebels);
}

public function selleraHerself():void
{
	clearOutput();
	selleraHeader();

	output("Figuring that you’d like to hear more about the field marshal herself, you ask about her past. How does one find herself commanding an entire campaign? How must it feel to start at the bottom and now be here?");
	
	output("\n\nSellera initiates her recollections with a wry smile, one chitin-covered finger coming up to scratch her chin while she thinks back. <i>“First, Steele, you must understand how one’s career begins. Those of us who show promise in our younger days, or simply have high estimates of our worth, will apply to the officer academies. My family was not at all distinguished, and it was expected that I’d enlist or learn a craft.”</i> She pauses to flash you a toothy smile. <i>“But my ambitions were greater than that. I wanted to </i>lead<i>, Steele. Something inside me told me I was up to the challenge, even if I had to cut down or stomp on every single obstacle in my path.”</i>");
	
	output("\n\nJudging from the look on her face and the chilling intensity of her stare, you have no doubt she did precisely that.");
	
	output("\n\n<i>“My early career was unremarkable.”</i> The occupation commander continues her tale with a dismissive wave of her hand, as if willing this segment to pass by quickly. <i>“I commanded a platoon in one of the cavern patrols back then. I often accompanied squads that were going into the less secure areas, but we never saw any truly outstanding combat. This was shortly after the Federation had fully stabilized its union of formerly independent nations, after all. Our military strength was nothing to scoff at, and our veteran units had been hardened in battle against foes far more challenging than a rag-tag band of nyrea. Most of our less civilized enemies made themselves scarce in those days.”</i>");

	output("\n\nSellera exhales through her nose and crosses her arms over her chest. <i>“Those were the hardest days. It took me a few years to even command a company. Peace is not amenable to an ambitious officer, you see. It is war which creates opportunities to distinguish oneself. Danger is part and parcel of glory, after all.”</i>");

	if (pc.characterClass == GLOBAL.CLASS_MERCENARY) output("\n\nYou’ve met a few others who thought that way. Almost all of them ended up in a bodybag.");
	else output("\n\nSeeking out danger just to win glory sounds like a dangerous way to live.");
	output("You can’t say she’s wrong, really, but something about the nonchalance in her voice as she equates total war with career advancement stands out in your mind.");

	output("\n\n<i>“And then war came,”</i> she says simply. <i>“Still leading an infantry company, I was stationed at the front lines in the opening days of the offensive campaign. That was the best time to be in command. The Golds were strong enough to put up some resistance, but hadn’t yet resorted to their cowardly tactics of gassing and bombing. They fought like true soldiers in those days, and I had respect for the professional warriors who fell to my axe. My myr fought like heroes as well, and we accumulated prestige and recognition in several major victories.”</i> Her eyes, jet-black and inscrutable as they are, somehow look distant as she recalls her glory days.");
	
	output("\n\nCurious, you ask if they had many trench wives in those days, because they seem to be quite common now.");
	
	output("\n\nThe marshal answers by shaking her head. <i>“No, few of their professional soldiers surrendered. Perhaps a few here and there would throw down their arms, but many fought to the death. They had a sense of honor and commitment I have come to believe is now almost extinct among the Golds. If I regret anything, it was that we extinguished what few myr of worth there were to be found in the Republic.”</i> She takes one small moment to indulge in a wistful sigh before moving on.");
	
	output("\n\n<i>“Eventually, the time for my advancement was at hand. My company was made the primary force of our battalion, and I was given the rank of major. This was mere months into the war. It would be only three years before I was leading a combined-arms brigade, and only one year of that before I was commanding a division.”</i>");
	
	output("\n\nAt that moment, something in her shifts and changes. Sellera’s face darkens and takes on a clouded expression, and her shoulders stiffen. <i>“And then,”</i> she growls, <i>“the Republic began the conscription. The gassing. The petty, cowardly bullshit that showed what weak, spineless scum their queens truly are. After that, I couldn’t even </i>bear<i> to look at another gold myr without crushing her.”</i>");
	
	output("\n\n<i>“After that it was much of the same. I would lead my units into the hottest situations, the most dangerous battlefields, and we’d come out with minimal casualties and taking no prisoners. Well, I took none, anyways. </i>I<i> may think those piss-poor excuse for soldiers aren’t even worth eating me out, but the girls need some relief, I suppose.”</i>");
	
	output("\n\nHer tension gradually fades away, and you find yourself feeling a little relieved. Something about a pissed Field Marshal Sellera makes you feel like cornered prey.");
	
	output("\n\n<i>“Whenever a position would open, I’d find myself commanding larger and larger forces. Then we lost almost our entire theater command in one blow, and I found myself wearing the figurative crown as we drove into Kressia. Now I’m here.”</i> She shrugs her shoulders and lets out a sigh which lets you know she’s done.");

	processTime(10);

	selleraMenu(selleraHerself);
}

public function selleraNehzara():void
{
	clearOutput();
	selleraHeader();

	output("There’s something you’ve been curious about ever since being brought in to talk to the top commander of the invasion force. What does she know and think about the current diplomatic head of the Federation embassy in the DMZ, Colonel Nehzara?");
	
	output("\n\n<i>“Nehzara... now there is a name I have not heard in a while.”</i> Sellera shrugs nonchalantly, as if letting your question run off her like water. <i>“She led a shock regiment before being transferred. Capable at the position, from what I heard. What else do you want to know?”</i>");
	
	output("\n\nHer answer is deliberately dismissive, but you press the issue a little. If the colonel was chosen to be a diplomat, surely Sellera would have known something about that.");
	
	output("\n\nYour question is answered with silence for a moment. If you didn’t know better, you’d think Sellera was actually deciding how to phrase her response. The idea seems a little odd, because pensiveness doesn’t suit her at all. The myr woman in front of you is one suited to action before consideration. It doesn’t take a psychologist to notice that.");
	
	output("\n\n<i>“Kalayna,”</i> she finally says. The one word, a name, is uttered simply and flatly. <i>“I don’t approve of feuds among my subordinates, Steele. Especially not skulking, sneaky kinds like the one those two had. If you have an issue with your peers, you address it openly. Underhanded sabotage and scheming doesn’t suit a respectable soldier. Nehzara hitched a ride on her mother’s coattails all the way up to a regimental command position, and Kalayna stole the position by reading the right letters and blackmailing the right women.”</i>");
	
	output("\n\nThe expression of disgust on the field marshal’s face worsens as she continues. <i>“I make an effort to know everything that’s going on under me, Steele. Above me, too. In battle, situational awareness is everything. And the first thing a good soldier learns is that the battle never really ends. So of course I knew about all the little obstacles disappearing from Nehzara’s path to promotion, much as she’d love to claim she’d earned it all on merit. And of course I knew about Kalayna’s sudden upward mobility after she took up a position escorting mail transfers. Both were desperately trying to avoid undue attention, too, but I have ways.”</i>");
	
	output("\n\nSomething about those last few words reminds you of when you first arrived. Sellera had made it very clear she’d been keeping tabs on you ever since you stepped foot into her city. You suppose it’s all part of her ‘situational awareness.’");
	
	output("\n\n<i>“So, naturally, once a position opened up to run an embassy over by Gildenmere, I was happy to separate the two of them. While the big-shots back home bicker and squabble over who gets the honor of waving their medals in your alien faces, I decided to let Colonel Nehzara put those skills of sucking up and throwing her weight around to actual use in a position that suits her more than an infantry command. Killed two cavern-fliers with one bolt, too: now that Colonel Kalayna is here leading a battalion where I can keep an eye on her, she’s finding out that her little web of deception and blackmail is falling apart bit by bit.”</i>");
	
	output("\n\nShe certainly has an interesting take on the matter, and a very... practical philosophy on how to handle her subordinates. You look at the deadly soldier who’s now leaning against the near wall with her eyes closed as though taking a break from her job, and you remind yourself not to be misled by how loosely and casually she carries herself.");
	
	output("\n\nHer eyes slowly open and meet yours as her lips curve into a cold smile. <i>“I hope that answered your question, Steele. Would you like to know more?”</i>");

	processTime(5);
	selleraMenu(selleraNehzara);
}

public function selleraAppearance():void
{
	clearOutput();
	selleraHeader();

	output("Field Marshal Sellera is a severe-looking, thoroughly imposing Scarlet Federation officer. You estimate her height to be just a hair’s breadth under five foot ten. Her tight, form-fitting uniform hugs her respectable curves while also serving as a suitable canvas on which to pin her considerable amount of medals and other decorations. Unlike other officers you’ve seen, however, her blouse is opened slightly to reveal just an inch of her alluring cleavage. Everything about her gives off a sense of almost feline looseness, as if she’s a relaxed predator just waiting to pounce at her leisure. It’s unnerving when contrasted with the other strict, disciplined Reds you’ve seen so far.");
	
	output("\n\nYou find it difficult to gauge her actual age just by looking. She carries herself with the liveliness of youth, but that energy belies the abundance of experienced hinted at by her weathered features. Her rank implies that she’s a veteran among veterans, though wartime can make for rapid promotions.");
	
	output("\n\nHer face looks like it may have once had soft curves and feminine cuteness, but those have long since been worn away by years on the battlefield. Her eyes are a solid obsidian, but there’s something sharp and menacing about how they take in every bit of light which falls upon them. Staring into them for too long leaves you feeling on-edge and nervous, like staring into the abyss of starless space. Her lips are surprisingly plump and inviting, or would be if they were in an expression that didn’t look inches away from a knife-edge sneer.");
	
	output("\n\nThe raven-black locks atop her head are mostly hidden beneath her cap, but something tells you that her hair is cut into the exact same style as the near-identical soldiers roaming about the rest of the manor.");
	
	output("\n\nFrom what you can tell, the marshal’s chest is somewhere in the C-cup range, which is perhaps a little humble by the standards of the greater galaxy. Her bust is, however, more than a little perky and practically begs to be ogled, especially with that scant bit of cleavage acting like a black hole for your stare. If you didn’t know better, you’d think that was on purpose.");
	
	output("\n\nGoing down from there, her taut, lean midriff transitions into a slender waist and hips that just manage to be feminine. In addition to her formal uniform blouse, Sellera wears a long, equally formal skirt");
	// Met Nehz
	if (flags["MET_NEHZARA"] != undefined) output(" which is quite unlike the trousers Nehzara wore");
	output(". Filling out its back is a pair of toned, fit buttocks with just the right balance of roundness and firmness to perfectly complement the rest of the marshal’s athletic, warrior-woman physique.");
	
	output("\n\nA pair of boot-like chitinous plates, thicker and longer than those sported by most other red myr, reach up from her feet to just below her knees and leave a scarce expanse of exposed flesh between their edge and the hem of her long skirt. You notice that her chitin is rather bright and prolific, looking almost scarlet in comparison to the dried-blood reddish-black that seems to be the norm, and covering much of her hands, fingers, and forearms in addition to her legs.");
	
	output("\n\nIn all, Sellera exudes an almost bestial magnetism that could certainly inspire people to follow and respect her.");
	if (pc.IQ() >= 75) output(" Accompanying that, however, is an endless zeal that borders on lunacy. This woman not only knows why she fights, but she takes it one step further by being clueless as to why anyone else <i>wouldn’t</i> fight.");

	selleraMenu(selleraAppearance);
}

public function selleraLeave():void
{
	clearOutput();
	selleraHeader();

	output("You give a nod to Sellera and mention that you’re done for now. There are other places you need to be, and surely she’s a busy woman with more important tasks than entertaining you.");
	
	output("\n\n<i>“Quite right,”</i> she replies. You think you catch a suppressed sigh in her voice as she summons a soldier to take you to the lift. She watches you turn around and go, causing you to wonder if she’s stealing a glance at your [pc.butt] in the same way you’ve been peeking at every other pair of cheeks in the place. The thought causes you to smile to yourself, though you say nothing to your escort.");
	
	output("\n\nA few minutes later, you find yourself back outside the administration office, standing in the manor’s west wing.");
	
	processTime(3);
	
	clearMenu();
	addButton(0, "Next", move, "834");
}
