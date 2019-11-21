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
		addButton(0, "Go Inside", myrellionManorGoInside, undefined, "Enter the room", "This looks to be the busiest room in the manor, and the head officer of the occupation is apparently inside. If you wanted to discuss anything with her, here’s the best place to do it.");
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
		addButton(0, "Mission", selleraYourMission, undefined, "Your Mission", "Tell Sellera you’re here searching for a way to get your father’s fortune and prove your worth.");
		addButton(1, "Sightseeing", selleraSightseeing, undefined, "Sightseeing", "Tell Sellera you’re just the first fruit of Myrellion’s new tourist industry, taking in the sights and experiences of the whole planet.");
		addButton(2, "Exploration", selleraExploration, undefined, "Exploration", "Tell Sellera you’re interested in going where no man, or woman, or herm, or whatever has gone before, meeting new species and exploring new frontiers.");
		return true;
	}
	else
	{
		output("You find yourself in a dimmer level than the one above. Standing before you are two guards in front of the administration office of Field Marshal Sellera.");
		output("\n\nDo you need enter and speak to her about anything?");
		flags["NAV_DISABLED"] = NAV_IN_DISABLE;
		clearMenu();
		addButton(0, "Sellera", approachSellera, undefined, "Approach Sellera", "May as well visit the marshal while you’re here.");
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
	
	moveTo("841");

	output("Giving a nod to the Red soldier, you head into the office and wait for one of the uniformed women to approach you. Once again, you follow the soldier to a side-room, onto a lift, and down into the basement lair of Field Marshal Sellera.");
	
	output("\n\nYou find her sitting alone in the secluded war room, though judging by the sound of a closing door just before you walked in, at least one other person just left. There’s a glass cup on the table in front of her, filled halfway with a liquid that’s as black as a pirate’s heart. Could be some form of myr liquor, you guess. In any case, Sellera downs it in one gulp when she sees you, and then gives you her usual dagger-sharp smile.");
	
	output("\n\n<i>“Steele,”</i> she begins, <i>“you’ve returned. I take it there’s something you’d like to... discuss?”</i>");

	selleraMenu();
}

/* Creates a button that may or may not be disabled
 * data is an object that should have these attribute/property/field/value/whatever the fuck they're called now
 * f - function that the button executes
 * prevF - will disable the button if equal to f, can be null
 * id - button slot
 * lbl - label
 * ttH - tooltip head
 * ttB - tooltip body
 * arg - argument for f
 * 
 * hope this will help you suffer a little less than I did when finding this without comments - LF
 */
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

	gatedButton( { id: 2, lbl: "Sellera", f: selleraHerself, arg: undefined, ttH: "Sellera", ttB: "Inquire as to Sellera’s own history and get to know her a bit better.", prevF: prevFunc } );

	// Has met Nehz
	if (flags["MET_NEHZARA"] != undefined) gatedButton( { id: 3, lbl: "Nehzara", f: selleraNehzara, arg: undefined, ttH: "Colonel Nehzara", ttB: "Since she’s the main commander of the offensive force, Sellera might know Colonel Nehzara. You could see what she thinks of the other officer.", prevF: prevFunc } );

	if (flags["SELLERA_OCCUPATION"] != undefined) gatedButton( { id: 4, lbl: "Rebels", f: selleraRebels, arg: undefined, ttH: "Rebels", ttB: "Ask a little more about the rebel problem the occupation forces are having.", prevF: prevFunc } );
	
	//Federation Quest Hook
	if(flags["FEDERATION_QUEST"] == 0) addDisabledButton(5, "Help", "Help", "You already discussed this and backed out.");
	else if (flags["SELLERA_REBELS"] != undefined && flags["FEDERATION_QUEST"] == undefined) addButton(5, "Help", selleraHelp, undefined, "Help", "Offer to help the Field Marshal out with her rebel problem.");

	//[Sex]. Greyed out until you finish all other talk options with her.
	if (flags["FEDERATION_QUEST"] == undefined || flags["FEDERATION_QUEST"] <= 2) addDisabledButton(8, "Sex", "Sex", "Sellera was pretty clear that she isn’t going to screw you until you do what she’s asking.");
	else if (pc.isTaur()) addDisabledButton(8, "Sex", "Sex", "Stop having so many legs.");
	else if (!pc.hasGenitals()) addDisabledButton(8, "Sex", "Sex", "You need something to have sex with.");
	else gatedButton( { id: 8, lbl: "Sex", f: selleraFucksYouInRecognitionOfYourWork, arg: undefined, ttH: "Sex", ttB: "Sellera did say she would reward you for your help. It’s time to collect on that reward.", prevF: prevFunc } );
	if(pc.lust() >= 33) gatedButton( { id: 9, lbl: "Sex Service", f: selleraEnlistForSexualService, arg: undefined, ttH: "Sex Service", ttB: "See if you can help the Federation in more sensual ways.", prevF: prevFunc } );
	else addDisabledButton(9,"Sex Service","Sex Service","You aren’t turned on enough for this kind of service right now.");

	gatedButton( { id: 10, lbl: "Appearance", f: selleraAppearance, arg: undefined, ttH: "Sellera’s Appearance", ttB: "The general appearance of Field Marshal Sellera.", prevF: prevFunc } );
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
	addButton(1, "Otherstuff", selleraSomethingElse, false, "Something Else", "Pointing it out might just be unwise, and besides, you’d rather hear more about that juicy tidbit she dropped earlier.");
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

public function selleraFucksYouInRecognitionOfYourWork():void
{
	clearMenu();
	clearOutput();
	selleraHeader();
	author("Night Trap");
	processTime(2);

	output("You’ve made yourself useful to Sellera, and you feel it’s high time she " + (flags["SELLERA_SEXED"] == undefined ? "rewarded you" : "gave you another reward") + ". You inform the field marshal that you’re ready for her to use those ‘other resources’ she mentioned.");
	output("\n\nThe corner of Sellera’s mouth crooks up in a small show of amusement, but she stands up from her seat as if she were simply moving to refill her glass. " + (pc.isNude() ? "Sellera" : "<i>“Strip.”</i> Sellera fires off the command like a bullet, but somehow still manages to make it sound slightly sultry. While you undress, the stern officer") + " removes her own uniform with military precision, unbuttoning her top and skirt one after another, folding them neatly and laying them on her desk.");
	output("\n\nYou steal a glance at the myr woman as she disrobes. Her scarlet chitin covers more of her body than the average myr’s, but there is still plenty of beautiful flesh to feast your eyes on. Sellera’s breasts are already laid bare, her bra apparently being built into her top. Those round, perky C-cups are just begging to be groped and squeezed, but it’s probably a bad idea to do so without being ordered to.");
	output("\n\nSellera’s stomach is flat and well-toned, with a thin waist that makes her pleasantly-wide hips look all the more curvy. The field marshal is wearing the standard black panties most red soldiers wear, but they cling tightly to her crotch, forming an inviting camel toe that draws your gaze like a magnet.");
	output("\n\nSellera has obviously noticed your stare, as she hooks her chitin-covered thumbs into the waistband of her underwear before dragging them down slowly and sensually, in stark contrast to the cold efficiency with which she removed the rest of her clothing. As the veil of black fabric descends agonizingly slowly, you’re treated to a view of an even darker thatch of thick pubic hair, the dense fuzz hiding her mons from you while still leaving no doubt as to her being a woman. You can’t be sure, but as Sellera’s panties descend, you could swear you see a glint of moisture on the crotch.");
	output("\n\nThe predatory officer folds her panties and places them with the rest of her uniform before flashing you the knife-edge smile you’ve come to expect. <i>“Well, Steele, what will it be this time?”</i>");

	if (pc.hasCock())
	{
		addButton(0, "RevMissionary", selleraOccupiesYourDick);
		addButton(1, "RevCowgirlAnal", sellerasStealthBackdoorOperations);
	}
	else
	{
		addDisabledButton(0, "RevMissionary");
		addDisabledButton(1, "RevCowgirlAnal");
	}
	if (pc.hasVagina()) addButton(2, "Lesbian Fun", selleraPerformsReconnaissanceOnYourNetherLips);
	else addDisabledButton(2, "Lesbian Fun");
}

public function selleraOccupiesYourDick():void
{
	clearMenu();
	clearOutput();
	selleraHeader(true);
	author("Night Trap");
	processTime(10+rand(11));

	var x:int = pc.biggestCockIndex();

	output("You’re not looking for anything too fancy at the moment. Right now all you want is some good, old-fashioned sex.");
	output("\n\nSellera chuckles derisively at your statement. <i>“Is cumming yourself lame on a heavy dose of aphrodisiac venom considered ‘old-fashioned’ among your kind, Steele? Because you should know that if my pussy is what you’re after, I’m going to fuck you until you can’t [pc.walk].”</i>");
	output("\n\nWhen your [pc.cocks] " + (pc.hasCocks() ? "begin" : "begins") + " to harden at the thought, Sellera laughs and slips into your personal space. <i>“Don’t worry though. I’ll see to it you get a medical evacuation when I’m done. I make sure all my personnel receive the very best, mmmmm, </i>‘care’<i>,”</i> she husks into your [pc.ear], tracing a chitinous finger along the length of your [pc.cockBiggest] as she nibbles on your neck.");
	output("\n\nHer hot breath on your [pc.skinFurScales] raises goosebumps, and when her fingertips sieze your [pc.cockHeadBiggest] you can’t help but moan. Your pleasured vocalization is cut short when Sellera unceremoniously cups your cheek and pulls you into a ravenous kiss. Her tongue immediately finds yours, and your mouth fills with " + (pc.hasPerk("Venom Slut") ? "a comfortingly familiar" : "an unnatural") + " heat as her venomous saliva seeps into you.");
	output("\n\nThe red myr’s venom quickly spreads to the rest of your body, filling you from head to toe with an unbearable warmth that rapidly settles in your [pc.crotch]. Your [pc.cocks], already at half-mast, quickly " + (pc.hasCocks() ? "stand to attention and begin" : "stands to attention and begins") + " leaking precum freely. Sellera gathers the creamy stuff on her hand, smearing it along your shaft all the way to your [pc.knot].");
	if (pc.hasSheath(x)) output(" You involuntarily jerk your [pc.hips] when you feel her chitin-clad digits slip into your sheath.");
	if (pc.balls > 0) output(" Once she’s coated your length in your masculine fluids, she darts her inhumanly strong hand to your [pc.sack], hefting your scrotum and feeling your [pc.balls] until they clench in her grasp. You know a red myr like her is strong enough to injure you very badly with just one hand if she so desired, but that only makes the way she’s currently examining your " + (pc.balls > 1 ? "balls" : "ball") + " even more arousing.");
	output(" The cock-starved woman seems unwilling to let any part of your venom-engorged manhood go untouched, and she continues molesting your crotch until you’re groaning into the liplock.");
	output("\n\nWith your massively increased sensitivity, even this simple fondling is stimulating enough to cause your [pc.cockBiggest] to throb just before spurting a generous helping of creamy precum. As soon as Sellera feels your cock pulsing she positions her hand to catch your output. You can actually feel her pleased grunt vibrate against your [pc.lipsChaste], and she breaks the kiss shortly after" + (pc.hasPerk("Venom Slut") ? ", much to your chagrin." : "."));
	output("\n\nThe field marshal slips her lubed-up hand down between her legs, biting her lip to stifle a sigh when she makes contact with her scarlet labia. She begins smearing your masculine lubricant all over her vulva, painting her womanhood with your pre-seed until her breath is coming hot and heavy, and her pubic hair is matted with your wetness and hers.");
	output("\n\n<i>“Fffuuuccckkk, you’ve got some warm precum, Steele! So much warmer than our males’,”</i> Sellera groans. She slips a finger inside herself as she speaks, the crimson digit plumbing her depths with a lurid squishing sound that can be heard faintly whenever she pauses in her speech. <i>“I am so fucking--</i>UGH<i>,”</i> she crams a second finger into her pussy, causing her voice to crack, <i>“fucking pent-up. I don’t want to, mmmmhhh, take it slow any loOOOnger than I have to, and I know you don’t either. So </i>AH!<i> do us both a favor and get me ready for that nice cock of yours.”</i>");
	output("\n\nYou’re so horny it’s hard to resist just jerking off instead, but you know if you obey, there are better things in store for you. You obediently drop to your kness, staring up at Sellera’s crotch, which is still covered by the hand she’s jilling herself off with. Once you’re in position, she withdraws her fingers and spreads her entrance with a heavy sigh, baring her womanhood to you.");
	output("\n\nFrom this angle you have a prime view of her pussy: her labia are swollen and sensitive, her clit is obscenely engorged, and a thick strand of femlube is dripping out of her spread-open tunnel, already halfway to the floor and swaying every time her scarlet folds give a hungry clench. It’s a sight that could headline a premium porn shoot, but you’re given precious little time to enjoy it.");
	output("\n\nSellera quickly grabs the back of your head and grinds your face into her sopping wet box, smearing her cunny honey all over your [pc.lips] as she humps your mouth. Your [pc.tongue] darts out on reflex, lapping up the copious femlube coating the myr woman’s labia. Even through the flood of earthy, alien juices, you can still taste the [pc.cumFlavor] flavor of your own precum thanks to the generous coating Sellera applied earlier. When she begins to grind her bullet-hard clit into your nose though, your [pc.cumFlavor] taste slowly vanishes, replaced by the field marshal’s feminine essence.");
	output("\n\n<i>“Get that tongue dee</i>EEEE<i>ep in there, Steele! The better you eat my pussy out, the sooner you get to feel it around your cock!”</i>");
	output("\n\nYou eagerly follow Sellera’s order, but not just because you’re desperate for your own pleasure. Whether it’s because of her venom, her authoritative air, your own perverse submissiveness, or some mixture of the three, you genuinely enjoy obeying the myr woman’s commands. As soon as she’s told you what to do, you unthinkingly obey, thrusting your [pc.tongue] deep inside of her.");
	output("\n\nYour taste buds are assaulted by the exotic flavor of horny myr pussy. It’s not quite like anything you’ve ever tasted, but it’s a difficult thing to savor thanks to another myr trait: Sellera’s cunt suddenly squeezes down on your tongue hard enough to keep it from moving, making the inhuman strength of her race painfully clear. Her inner muscles release your tongue almost as quickly as they seized it, but even their lightest flutterings are comparable to a normal woman’s orgasm.");
	output("\n\nThe field marshal might not be free with verbal praise, but she certainly knows how to encourage you. When your [pc.tongue] first penetrates her, you can feel her chitinous fingers tremble against your head as she struggles to relax her vaginal muscles. When you begin to lick up and down her sopping walls, her hips jerk involuntarily as she grunts with effort. When you finally start to properly tonguefuck her, she throws her head back, letting out deep, shuddering moans of pleasure that crack whenever your tongue hits a particularly sensitive spot.");
	output("\n\nAlthough you certainly can’t stop Sellera from spastically fucking your face, you place your hands on her hips to at least have some warning that it’s going to happen. You press your thumbs into her pubic mound, and the gentle pressure is quickly rewarded with a thicker flow of cunny honey. It’s difficult to properly eat out a pussy that grabs your tongue every time you start to pick up speed, but you do eventually find a rhythm. When you realize that you can bait Sellera into humping your mouth by rubbing your nose into her throbbing clit, it just becomes a matter of withdrawing your tongue every so often to swallow another mouthful of her earthy femlube.");
	output("\n\nEven with your hands occupied and unable to tend to you, your [pc.cocks] " + (pc.hasCocks() ? "are" : "is") + " still just as erect as when your myr mistress was jerking you off. It’s surprisingly easy to ignore your own needs: the pitch and volume of Sellera’s cries rise as you intensify your oral efforts, and that’s all you need to stay hard. Just when the fluttering in her box reaches a peak, Sellera suddenly steps back from you on shaky legs. A small stream of saliva and pussy juice trickles out onto the floor as the field marshal takes deep breaths to try to master herself once more.");
	output("\n\n<i>“Haaaa, FUCK, you are good at that, Steele! I almost forgot what I made you go down on me for in the first place. I’d love to squirt buckets all over that " + pc.mf("handsome", "pretty") + " face of yours, but I think we’d both rather it was your cock I’m squirting on. Right?”</i>");
	output("\n\nYou’d nearly forgotten just how horny you were, but with the reminder of what you came for, your need comes flooding back all at once. You’re so hard it hurts, and you assume a submissive position with such haste that you don’t even think to wipe all the earthy femlube off your face first.");

	imbibeVenomEffects();
	pc.applyPussyDrenched();

	addButton(0, "Next", sellaraTheFuckingsBegin, x)
}

public function sellaraTheFuckingsBegin(x:int):void
{
	clearMenu();
	clearOutput();
	selleraHeader(true);
	author("Night Trap");
	processTime(50+rand(21));

	output("Sellera laughs wickedly at your eagerness, but the thick coating of nectar glinting on her thighs betrays just how much it turns her on. While she positions herself over you, a thick droplet of her juice lands on your [pc.cock " + x + "]. As horny as you are, even this momentary sensation of warm wetness on your shaft is enough to make your dick throb powerfully. The needy groan it elicits from you is silenced when the field marshal drops to all fours over you like a tiger over its prey.");
	output("\n\nShe spends a moment leering down at you predatorily with her hands on either side of your head. Then, without breaking eye contact, she lowers her hips, savoring your reaction as she grinds her molten-hot mound against the top of your [pc.cock " + x + "]. Even though she was on the verge of orgasm a short while ago, Sellera still can’t resist reveling in her power over you. Her breasts press down onto your [pc.chest], and with her venom inflaming your body, her rock-hard nipples dragging across your own feels heavenly.");
	output("\n\nYou’re struggling to contain yourself just from these small touches when she presses her hands onto your chest and pushes herself vertical.");
	if (pc.hasBreasts()) output(" She helps herself to your breasts as she does, roughly groping and fondling them until you squeal in masochistic pain.");
	output(" All hope of retaining any shred of dignity goes out the window when you feel Sellera’s chiseled buttocks squeezing around your shaft. The scarlet woman groans wantonly as she rocks her hips against you. You can feel her dragging her diamond-like clitoris along your [pc.skinFurScales] as she humps you, working herself into a sexual frenzy and incidentally giving you a teasing buttjob in the process.");
	output("\n\nWhen you start moving your own hips to try to thrust deeper into her rear cleavage, Sellera drops her weight onto you with no warning, pinning your pelvis to the floor. You whine and look up at her questioningly, only to be met by an almost maniacal grin. <i>“That comes later, Steele. For now, you just keep still and let me use your dick like a good drone. Understand?”</i>");
	output("\n\nBy now you’re so high on her druggy saliva that you can’t even nod your head without a considerable effort, but even just resting against the myr woman’s beautiful ass is enough to make your cock spontaneously spurt a huge glob of precum.");
	output("\n\nSellera laughs derisively when she feels your creamy preseed splattering into her crack, but she’s obviously delighted. <i>“Hahahaha, oh that’s as good as a ‘yes ma’am’, Steele! I wish more of my subordinates would salute me like that!”</i> She expresses her pleasure by smearing your precum all up and down her ass, wetting your entire length as she gives you a proper buttjob this time.");
	output("\n\nYou can feel your " + (pc.balls > 0 ? "[pc.balls]" : "muscles") + " tightening as Sellera hotdogs your cock, but you’re also dimly aware of the small puddle of femlube that’s formed on your crotch. Before you can actually get close to cumming, the field marshal unceremoniously stops grinding against you. You don’t even have time to groan in disappointment before a chitin-clad hand grabs your [pc.cock " + x + "] and angles it upward. There’s no more warning than that before Sellera sits on your dick, your [pc.cockHead " + x + "] parting her folds with a lurid squish to make way for the rest of your shaft. The sex-hungry myr’s cunt swallows your length alarmingly fast, and by the time her puffy lower lips are kissing your [pc.knot " + x + "], you’re both gasping for air.");
	pc.cockChange();
	output("\n\nSellera pants heavily for a moment before bending over you again, squashing her breasts into your [pc.chest] before she buries her face in your neck. You wrap your arms around her muscled back, desperately trying to anchor yourself before you’re washed away in this sudden tide of stimulation. Sellera’s velvety folds have an alien texture to them that under normal circumstance would catch your attention. Drugged up on aphrodisiac saliva though, all you care about is that they feel hot, wet, and <i>strong</i>. The feeling of her myr pussy gripping down on your cock is reminiscent of a condom that’s just a bit too small for comfort. Her pussy is not uncommonly tight per se, but its muscles can exert unbelievable pressure on any cock fortunate enough to penetrate it.");
	output("\n\nWhile you’re still adjusting to these overwhelming sensations, the myr woman atop you suddenly begins sloppily kissing and nibbling your neck. You gasp and shudder at the bizarre feeling of Sellera’s venom diffusing through your [pc.skinFurScales]. Everywhere her lips touch feels like a little point of liquid fire that blossoms outwards. She kisses the flesh around your jugular especially hard, leaving hickeys and causing you to instantly absorb her venom into your bloodstream.");
	output("\n\nAs she gives herself time to adjust to your [pc.cock " + x + "], Sellera trails her kisses up to your head and [pc.ears]. Although her lips never actually meet yours, they still come tantalizingly close.");
	if (pc.hasPerk("Venom Slut")) output(" These minute doses she’s giving you just aren’t enough for you at this point. You need the sweet feeling of a massive dose of venom straight to your lips. Even after just getting your fix a short time ago, you still can’t help but crave even more of Sellera’s sweet kisses; to you, they’re more important than sex.");
	output(" You moan in desperation, but it only prompts a mocking laugh from the sadistic officer.");
	output("\n\nUnder this treatment your arousal eventually outpaces your self-control. In desperation, you begin thrusting up into Sellera’s pussy, instantly drawing the field marshal’s ire. She pins your hips to the floor again and bites your neck in a bestial display of dominance, not hard enough to break the skin, but enough to pump even more of her infernal toxin into you as punishment.");
	output("\n\nShe growls into your ear, <i>“I said that comes later. But I guess if you’ll be a good [pc.boyGirl] from now on, I’ll fuck you properly.”</i> She pushes herself up to stare down at you, waiting for a response.");
	output("\n\nIntelligible speech is a little difficult for you at the moment, but Sellera nonetheless looks very pleased with herself when you start nodding your head feverishly in agreement.");
	output("\n\nWith no more warning than her sharp grin, the most powerful woman in Kressia starts roughly fucking your [pc.cock " + x + "]. There’s no gradual buildup of speed. After just a few thrusts of her hips, Sellera is violently spearing herself on your shaft, producing a cacophony of wet squelches and grunts. Your eyes roll back into your head as the intense stimulation suddenly crashes into your hypersensitive body. As suddenly and forcefully as she started fucking you, this must be painful for your partner as well. She seems to relish it however, as she grows audibly wetter within moments.");
	output("\n\nTightness mounts in your " + (pc.balls > 0 ? "[pc.balls]" : "lower half") + ", and your dick throbs out an enormous dollop of precum. When she feels it hit her walls, Sellera drops forward again with a whorish moan as she resumes applying kisses and love bites to your neck. Her venomous affections fill your bloodstream with more aphrodisiac that just seems to flow straight to your [pc.cock " + x + "]. You’re ready to blow your load after less than 30 seconds, but Sellera is prepared for this.");
	output("\n\nShe bottoms out on your cock as she grunts with effort and squeezes her inner muscles down on your shaft hard enough that it starts to hurt. Mercifully, you’re so drugged up that the pain just pushes you closer to orgasm, but as you rocket towards the point of no return you soon realize this is not something to be thankful for. You throw your head back and cry out in frustration as your orgasm is agonizingly stymied by Sellera’s inhuman tightness.");
	output("\n\nThough your distressed shout does cause her pussy to flutter briefly in unmistakable delight, it’s nowhere near relaxed enough for you to cum. The field marshal practically purrs into the crook of your neck as she grinds your ensnared breeding rod through her folds, pressing it into all the sweet spots she can hit while she’s clenched so tightly. <i>“Mmmmmm... This is for your benefit, Steele. You’re going to- OOOHH... to be cumming in me AH! </i>a lot<i> today, sooOOHH, you’ll want to HAAH-hold it back for as looooooong as possible. Otherwise you’d- FUCK! You’d run dry.”</i> The predatory hunger in her tone as she mutters her last sentence is unmistakable.");
	output("\n\nYour hands tremble against her back as you try to hold out against the pleasure of her pussy. Your lower half begins to twitch when Sellera starts to mash her throbbing button against your [pc.skinFurScales]. Your " + (pc.balls > 0 ? "[pc.balls] " + (pc.balls > 1 ? "start" : "starts") : "pelvic muscles start") + " to clench when you feel the field marshal’s copious pussy juice leaking over " + (pc.balls > 0 ? (pc.balls > 1 ? "them" : "it") : (pc.hasVagina() ? "your pussy" : "your taint")) + ". When she begins roughly gyrating her hips, you grit your teeth and groan loudly. It feels like all the blood in your body has become trapped in your [pc.cock " + x + "], and all the pleasure-inducing venom with it.");
	output("\n\nYou probably could’ve cum a half dozen times already with such intense stimulation, but the sadomasochistic myr atop you seems intent on making your first orgasm take as long as it would for a normal tryst. <i>“It’ll be worth it,”</i> Sellera moans into your ears over and over in an increasingly-orgasmic tone, though it doesn’t seem worth it to you at the moment. Amazingly, she’s about to cream your cock after no more than a couple minutes of simply grinding on it, but you’re too focused on not cumming to feel proud of yourself. Every second your [pc.cum] is held back feels like an eternity of torment, and you barely even notice there’s a beautiful woman screaming in pleasure on top of you. All you can think about is the crimson pussy that’s both your prison and your hope for release.");
	output("\n\nIt takes you a moment to notice when Sellera relaxes her vaginal grip. Before it even occurs to you that you can finally orgasm, the field marshal barks out an order that is somehow no less authoritative for being said on the verge of climax. <i>“CUM IN ME!!!”</i> You do exactly that, the edges of your vision darkening from the incredible effort your [pc.cock " + x + "] is now making to empty your [pc.balls] as quickly as possible.");
	output("\n\nWhich turns out to be nowhere near as quickly as you’d like. When the first lance of [pc.cum] blasts against her cervix, Sellera bottoms out and screams in ecstasy as her pussy spasms frantically around the cumming cock inside it, squirting all over your length and milking it for even more precious seed like it would any red myr’s cock. Ironically, this stymies the flow of your ejaculate, leaving you almost foaming at the mouth as your shaft fruitlessly throbs during the clenches of Sellera’s pussy.");
	if (pc.hasKnot(x)) output("\n\nHer spasming fuckhole lewdly stretches around the top of your swollen [pc.knot " + x + "], the bulb of flesh obviously too large and her pussy too tight during orgasm to fit. This doesn’t deter your cock-starved partner one bit. When she realizes there’s still more of your manhood she could be creaming, she frantically jerks her hips against your engorged knot until, through either luck or determination, it wetly pops inside. Sellera’s entrance must be painfully stretched from the forceful insertion, but her climax seemingly redoubles as she massively gapes her cunt on an alien’s cock.");
	output("\n\nThis prolongs your respective orgasms by an unnatural amount, and eventually you lose the last shred of self-control and start bouncing your dominant partner on your [pc.cock " + x + "] to more thoroughly inseminate her. She doesn’t protest in the slightest, and even shrieks at you in a broken voice to fuck her harder. You obediently follow her orders, filling the field marshal’s slit with one of the biggest creampies you’ve ever given.");
	if (pc.cumQ() < 6000) output(" Thanks to" + (pc.hasKnot(x) ? " your knot and" : "") + " the almost watertight seal Sellera’s pussy forms around your [pc.sheath " + x + "], every drop of [pc.cum] stays inside of her.");
	else output(" With productivity like yours, that really means something. Sellera’s washboard middle swells against your [pc.belly] until she has to arch her back to keep her face buried in your neck. " + (pc.hasKnot(x) ? "Between your knot and the almost watertight seal her pussy forms around your [pc.sheath " + x + "], not a drop of [pc.cum] escapes her." : "Only tiny jets of [pc.cum] escape her thanks to the almost watertight seal her pussy forms around your [pc.sheath " + x + "]."));
	output("\n\nYou empty your [pc.balls] into Sellera for what feels like forever, jerking your [pc.hips] into her");
	if (pc.hasKnot(x)) output(" as much as your knot will allow");
	output(" the whole time. She comes down from her orgasm before you do and lifts her face an inch above yours, smiling down at you with a mixture of affection and pride. When you finally still yourself and notice her gaze, you smile weakly back at her, still rock hard despite your epic orgasm. The red myr is somehow even more red than usual, and as she gasps for air and shudders with the aftershocks of orgasm, she hoarsely whispers something. <i>“I ordered you to fuck me.”</i>");
	output("\n\nHer warm smile turns predatory again in a heartbeat, and as you open your mouth to explain yourself, her lips seal themselves against yours again. Your recent orgasm had taken the edge off of your high, but Sellera kisses you until you’re even more drugged up than you were earlier. A red haze seems to cloud your vision, and you start bucking your hips on autopilot. You’re so sensitive that just the air flowing through the room feels amazing on your skin, so when you feel Sellera’s cum-slathered folds against your [pc.cock " + x + "] you can’t help but cum.");

	output("\n\n");
	if (pc.cumQ() >= 6000) output("Your domme’s stomach swells even further, and though she grunts in pain, ");
	output("Sellera looks delighted. Judging from the way her pussy is tightening and spasming, she’s already not far from another orgasm herself. Before she squirts on your dick again, she resumes kissing you. Higher thought is soon washed away by the flood of venom surging into you, and your last memory is of wondering if this is what an overdose feels like.");

	pc.orgasm();

	addButton(0, "Next", selleraHasLiberatedYourCum);
}

public function selleraHasLiberatedYourCum():void
{
	clearMenu();
	clearOutput();
	showName("\nBEDCHAMBERS");
	author("Night Trap");
	// Remove venom
	if (pc.hasStatusEffect("Red Myr Venom")) pc.setStatusMinutes("Red Myr Venom",35);
	processTime(70+rand(81));

	output("When you finally come to, you’re no longer in Sellera’s office. Instead, you’re in the middle of an absolutely massive bed. It’s so soft that you’re loathe to move, especially since any movement makes your head feel like it’s going to split open. Your gasp of pain alerts the sentry outside the room, who opens the door and enters with no regard for your nudity. She quickly approaches the bedside, carrying a small crate in her arms. To her credit, she doesn’t stare at your exposed [pc.chest], but " + (silly ? "she notices ur buldge, her solid black eyes widening and her nostrils flaring in a perfect OwO" : "her eyes do linger momentarily on the bulge of your [pc.cock " + x + "] under the sheets."));
	output("\n\nThe sentry places the crate on the ludicrously ornate bedside table, letting you see that it contains your posessions. " + (pc.isNude() ? "You hop out of bed and retrieve your equipment, giving the blushing myr woman an eyeful of your full-frontal nudity. Once you’re ready, she awkwardly clears her throat." : "She turns her back politely, but does not leave the room. Once you’re clothed, she turns back to face you again.") + " <i>“You’re in the former queen’s bedchambers. Field Marshal Sellera made certain you received an injection of antivenom once you passed out. You’d still be high right now otherwise. I was ordered to escort you out once you’re awake,”</i> the soldier explains curtly.");
	output("\n\nAlthough you’d really rather take some time to ice your crotch, you nod, following the sentry out and through the mansion until you’re back on the streets of Kressia, feeling very cold without the addictive kiss of Sellera to warm you.");

	pc.shower();

	IncrementFlag("SELLERA_SEXED");

	addButton(0, "Next", move, "807");
}

public function sellerasStealthBackdoorOperations():void
{
	clearMenu();
	clearOutput();
	selleraHeader(true);
	author("Night Trap");
	imbibeVenomEffects();
	if (pc.hasStatusEffect("Red Myr Venom")) pc.setStatusMinutes("Red Myr Venom",60);
	processTime(90+rand(121));

	var x:int = pc.biggestCockIndex();

	output("You’ve seen hints of the shapely butt Sellera is concealing under her skirt, and you want to make good use of it. How would she feel about an assault to the rear?");
	output("\n\nThe field marshal grins wickedly at your suggestion. <i>“Oh? Are you interested in my ass? I’ll admit, I’ve not had the chance to feel a real cock back there more than a few times. Most myr drones are totally focused on breeding. But, with a performance as exceptional as yours I think you’ve earned it. Are you sure you can handle an ass like mine though? We myr are so much stronger than most of you aliens.”</i> Her tone is menacing, but her sexual hunger is etched into her sharp features.");
	output("\n\nYour mind is already glazing over at the thought of how sinfully tight Sellera’s anus must be. The fact that you’d be one of the very few people to ever fuck her butt is just icing on the cake. You snap out of your fantasies and confidently inform Sellera that you’re up to the task.");
	output("\n\nHer thin smile widens into a toothy grin. <i>“Well, let’s find out if you really are.”</i> Then her hands are on you, and you’re pulled into a kiss hard enough that you feel Sellera’s teeth through her lips. As soon as her tongue enters your mouth, you start to feel hot. The warmth starts out centered on your mouth, but it quickly spreads outward, radiating through your body until it begins to coalesce in your groin. Heat builds in [pc.eachCock]");
	if (pc.hasVagina()) output(" and [pc.eachVagina]");
	output(" until " + (pc.hasVagina() || pc.hasCocks() ? "they feel" : "it feels") + " aflame with need.");
	if (pc.hasPerk("Venom Slut")) output(" Your trembling subsides, and you feel complete once more as the infernal substance your body craves pours into your bloodstream and fogs your brain. This state of being used to seem fucked up to you, but you realized long ago that you’re only fucked up when you’re sober. You feel numb and lethargic without your mistress’s venom pumping through your veins, and you hungrily return her kiss, desperate to get your fix as quickly as possible.");
	output("\n\n");
	if (pc.hasPerk("Venom Slut")) output("All too soon, ");
	output("Sellera pulls back from you with a hungry gleam in her eyes. A chitinous hand soon snares your sensitized [pc.cock " + x + "] in an iron embrace, provoking a pleasured hiss from you. Sellera tuts dismissively at your vocalization, jerking you off a few times with her frighteningly powerful grip before she surprises you by dropping to her knees. There she licks and slurps at your [pc.cock " + x + "], bouncing her head up and down your length with shocking enthusiasm, polishing your " + (pc.hasCocks() ? "poles" : "pole") + " with more of her venomous saliva until your whole lower half feels like it’s on fire. The instant you try to thrust your hips however, Sellera grabs your [pc.hips] and pushes off of you. She pants softly after her impromptu spitshine, but she regards you with a wicked grin, her arousal-flushed face " + (pc.cLength(x) < 12 ? "unobscured" : "obscured by your massive [pc.cock " + x + "]") + " as she murrs, <i>“You didn’t say you wanted a blowjob, Steele. I’m just making sure you’re as hard for me as possible. We wouldn’t want you slipping out and ruining the fun, would we?”</i>");
	output("\n\nNo, you certainly wouldn’t want that.");
	output("\n\n<i>“I didn’t think so,”</i> Sellera husks. Her breath blows across your precum and spit-slickened member whenever she speaks, and with the incredible sensitivity foisted on you by the myr woman’s venom, each syllable feels like a thousand teasing fingers tracing across the surface of your [pc.cock " + x + "]. When your dick twitches out another strand of pre-seed in response, Sellera coos patronizingly at it. <i>“Aww, such a cute little thing. Even your cock knows to salute and stand at attention for me.”</i>");
	output("\n\nYou gasp at the feel of chitin sliding along your [pc.cock " + x + "] as the field marshal suddenly grabs your [pc.knot " + x + "] and slides her hand all the way to your [pc.cockHead " + x + "], gathering up as much of the mixed fluid coating your manhood as possible, even catching the spurt of precum she milks out of you with her palm. Then Sellera takes the same hand down to her hairy pussy.");
	output("\n\nWith an almost business-like manner, she smears some of the slippery mixture on her clit, gasping as her own venom seeps into the hard little nub. The myr women spends a moment just diddling herself, rocking her hips and staring hungrily at your cock as she does so. Soon the bittersweet smell of her excited pussy wafts up to you, and Sellera bites her lip to suppress a moan.");
	output("\n\nOnce her femlube is flowing freely, she dips her fingers into her honeypot, scraping them around with a lurid schlicking sound. Even as she closes her eyes and stifles a groan of pleasure though, there’s no mistaking Sellera’s masturbatory motions for self-indulgence. As a puddle of her drippings begins to form under her, her hand gleams in the primitive electric lighting of the room, the chitinous appendage drenched up to her knuckles in creamy precum, aphrodisiac saliva, and tangy pussy juice.");
	output("\n\nEventually the field marshal is satisfied with her work, and she withdraws her sloppy fingers from her slit with a soft squelch. Then she drags her digits even lower, across her soaked taint, until they disappear from sight behind her. Suddenly Sellera opens her eyes, fixing you with a hungry grin. <i>“");
	if (silly) output("Don’t just stand there like you’ve never seen the hand of God before! ");
	output("Lie on the floor for me. You’ve earned yourself a show, Steele.”</i> Her words drip with sensuality, but they are somehow as authoritative as usual, if not more so.");
	output("\n\nYou try not to make your excitement too obvious as you scramble to drop to the floor, though it’s a pointless effort: your [pc.cock " + x + "] twitches and throbs fitfully the whole time you’re reclining, leaking increasingly-creamy preseed down your " + (pc.balls > 0 ? "[pc.balls]" : "taint") + ". The myr domme stares at your dripping length possessively with her lightless black eyes as you position yourself for her. She briefly gazes into your own [pc.eyes] before turning around and leaning forward. Sellera looks back over her shoulder as she uses her clean hand to pull her brawny buttocks apart, vulgarly exposing her red rosebud to you.");
	output("\n\nHer pucker is a darker shade of red than the flesh around it, and when Sellera’s lubed-up fingers begin to prod at it, it quite reluctantly yields, making it abundantly obvious just how tight her orifice is. The myr woman hisses through her teeth as she forces her asshole to relax, something that seems to be fairly difficult as her venomous saliva begins to take effect. With some effort, Sellera is able to slacken her muscles enough to permit two fingers into her ass. She wiggles them around slowly at first, but as she loosens up, she picks up speed.");
	output("\n\nEventually she begins thrusting three fingers into her sculpted butt, smearing the mess of sexual fluids coating her digits around in her bowels. Sellera’s pussy clenches jealously, drooling thick strands of femlube down her scarlet thighs, advertising just how much the myr woman enjoys anal stimulation. She thrusts her hips back into her hand, grunting with pleased effort.");
	output("\n\nThe highest ranking officer in Kressia fingerfucks her ass with enthusiasm, preparing herself for a reaming like a wanton buttslut. Her sopping pussy is less than an inch away from your [pc.cockHead " + x + "], and she’s moaning in delight from simple anal masturbation, but her domineering aura hasn’t diminished in the least. The venom coursing through your veins makes you burn with the <i>need</i> to sheathe your [pc.cock " + x + "] in something, and you can feel her dilated quim radiating its heat onto your crown. Even with this incredible temptation, the idea to thrust into her cock-starved box never crosses your envenomed mind. Sellera never told you to, and you wouldn’t dream of making a move on her without being told to.");
	output("\n\nOnly after her pussy has begun dripping does the field marshal deem herself ready. With a bestial groan she slides her fingers out of her pucker. Even after all that preparation, the muscular ring still clings fiercely to the retreating digits, giving you a preview of the sinful tightness in store for you. The moment Sellera’s hand is freed, she pounces on your dick, snaring it in a vice grip and angling it up from her neglected slit, towards her hungry ass.");
	output("\n\nOnce your [pc.cock " + x + "] is in position, the field marshal drops her hips, instantly impaling herself on a third of your length. You let out an involuntary yelp as crushing tightness envelops your [pc.cockHead " + x + "]. Sellera’s anus feels like a too-small cockring slipping down your length, and the depths beyond it aren’t much more forgiving. The myr woman’s ass is painfully tight the whole way down your shaft, but thanks to the venom corrupting your nerves, you actually get off all the more for the hurt her tunnel is inflicting on you.");
	pc.cockChange();
	output("\n\nSellera’s sculpted butt swallows the first half of your length greedily, and when she drags her hips upward again, you’re grateful for all the lubing up she did beforehand. Even with the slippery mixture of juices coating your shaft, the marshal’s hole stymies the progress of every centimeter of cockflesh, even on the way out. As slowly as she can stand, the myr woman raises her hips until only your tip remains inside her, snaring your hyper-sensitized crown in a constricting ring of superhuman muscle.");
	output("\n\nYour eyes cross from the masochistic bliss of Sellera’s ass crushing in around your [pc.cockHead " + x + "], and you moan like an ultraporn star as you struggle to keep your [pc.hips] on the floor. That becomes impossible when the scarlet domme clenches her ass down, sadistically grinning as she torments the most sensitive part of your cock until you involuntarily buck your hips upward.");
	output("\n\nYou’re caught in a brief, frantic struggle to punch through her resistance, but at the apex of your third thrust, Sellera’s ass suddenly yields to your [pc.cockNounSimple]. Before you can even register this though, the myr woman slams her hips down with a painful slap of flesh on flesh, taking your [pc.cockNounComplex] to the hilt in a single motion. You yell in pained pleasure as her back door swallows your length far too quickly, apparently even for Sellera. The officer’s too-tight hole spasms wildly, instinctively rejecting the sudden insertion and wringing your shaft from your [pc.knot " + x + "] to your [pc.cockHead " + x + "] with crushing strength.");
	output("\n\nYour own carnal shout is drowned out by a low, vibrato moan from deep in Sellera’s throat. The pitch of her cry trembles as her hips and pucker twitch atop you in sync with each other. It’s a surprisingly feminine sound, but you can hardly appreciate that fact while your cock is agonizingly hard and your eyes are rolling back into your venom-fogged head.");
	output("\n\nMercifully, you aren’t the only one who needs time to adjust. As you grunt and pant in equal parts delight and distress, Sellera breathes heavily, resting her weight on her chitinous knees as she tries to rein in the spasming of her rosebud. As she tries to relax, she looks back over her shoulder and addresses you in a husky tone, <i>“That’s just </i>aaaahhh<i>bout my </i>FFFFF<i>favorite part. Just- </i>gah FUCK!<i> just jamming it in, ready or not. </i>Everything<i> feels bigger when it’s in your ass. And my,”</i> she begins slowly rocking her hips for emphasis, <i>“</i>mmmmm<i> favorite thing to have in my ass... is a </i>big- thick- dick.<i>");
	if (pc.cocks[x].thickness() > 1.3) output(" Like this one.");
	output("”</i>");
	output("\n\n As the field marshal talks dirty to you, her grip on your [pc.cock " + x + "] gradually becomes less painful until it’s almost pure pleasure. By the time she’s finished speaking, her pussy has drooled its slickness down her taint to soak your " + (pc.balls > 0 ? "[pc.balls]" : "own") + ", and you’re not only ready for her to ride you, you <i>need</i> it.");
	output("\n\nSensing your eagerness, Sellera flashes you a predatory grin. The myr woman grabs your [pc.knees] for balance and clambers onto her feet, but she doesn’t immediately do more than that. You’re so horny it hurts, and it’s taking everything you’ve got not to break down and try to rail Sellera’s tight little ass, yet she still doesn’t move. The sadomasochistic officer idly fingers herself while you tremble with tension and need under her. Even this minimal attention her pussy is receiving is causing her pelvic muscles to flutter now and then, assaulting your [pc.cock " + x + "] with muscular contractions every time it happens. Only when you worry your mind is about to snap does Sellera finally raise her hips.");
	output("\n\nYou draw a breath in anticipation as her scarlet orbs rise up along your shaft, only to have it knocked out of you when the ant woman drops down again, pile-driving your [pc.hips] into the floor. " + (silly ? "Your hips are moving on their own!" : "You hadn’t even realized you had raised them.") + " If you weren’t preoccupied moaning like a whore, you might be ashamed for losing control of yourself like that. Fortunately, Sellera’s chosen punishment for your disobedience is " + (silly ? "bigly" : "exactly") + " what you crave at the moment, and you unthinkingly repeat your disobedient motions.");
	output("\n\nLike an organic cock ring, Sellera’s anus traps your envenomed blood in your [pc.cockNounSimple " + x + "], heightening your sensitivity to a ludicrous degree. The myr domme savors every inch of your length with long, deep lunges of her hips at first, but her own need ensures she doesn’t keep this slow pace for long. Barely a minute goes by before Sellera is bouncing on your [pc.cock " + x + "] like a rodeo star, making filthy grunts and coos of satisfaction with every bruising collision of her bottom and your [pc.skinFurScales].");
	output("\n\nYou shiver harder than ever under her, not only from her venom, but from the delightful punishment being dealt to your [pc.cock " + x + "]. Each time Sellera quite literally bottoms out on your [pc.cockNounSimple " + x + "], the tension in your body and groin grows, forcing you over the point of no return in record time. You’re well beyond the point at which you would normally have painted Sellera’s bowels [pc.cumColor] with your seed, but unfortunately for your [pc.balls], your orgasm is totally stymied by the myr woman’s inhuman tightness. You whine pathetically as the very source of your pleasure blue balls you, helpless to do anything other than fuck her even harder.");
	output("\n\nSellera’s venom has your body on autopilot, your [pc.hips] pistoning tirelessly as your " + (pc.balls > 0 ? "sack" : "prostate") + " grows even tighter in agonizing ecstasy. You’re rocked by another orgasm all too soon, but it too is denied by your superior’s greedy rosebud, ratcheting up the pain in your backed-up [pc.balls] until even your venom-induced masochism can barely compensate for it.");
	output("\n\nThroughout your predicament, Sellera largely ignores you, focusing instead on her own enjoyment. The sex-starved officer just can’t seem to get enough carnal pleasure fast enough. At first she just increases the speed and power of her bounces on your [pc.cock " + x + "], but this isn’t nearly enough for the horny myr. Sellera’s chitinous hand finds its way once more to her sloppy cunt, rubbing her folds and clit for a while before greedily plunging three fingers knuckle-deep and viciously jilling off, producing a symphony of vulgar squelches loud enough for the guards outside to hear.");
	output("\n\nBlack hair sways wildly over you as Sellera arches her back and fingers herself even harder. From her erratic trembling you’d guess she’s not only rushing to orgasm, but flat-out overstimulating herself, and your suspicion is confirmed when her free hand begins violently mauling her bouncing breasts.");
	output("\n\nThough it feels like an eternity to you, Sellera’s sadomasochism brings her to orgasm alarmingly quickly, and with a shriek of ecstasy, the red myr creams her fingers. Her cunny’s squelches grow even louder, but they’re hard to hear over Sellera’s bestial cries of orgasm. In perfect sync with her pussy’s contractions, her ass repeatedly clenches down on your [pc.cock " + x + "] with the force of an industrial compactor.");
	output("\n\n" + (pc.hasKnot(x) ? "The field marshal’s spasming sphincter can’t take your swollen knot at first, but even when she’s nearly done cumming, her bounces are still so frequent and so frantic that sheer brute force wins the day: with a wet <i>POP!</i> you tie her ass. It feels so wrong and so right all once. Your breeding bulb wasn’t made for this, for gaping unprepared rosebuds, but your body doesn’t care that it’s sheathed in the wrong hole." : "The field marshal’s spasming sphincter continues to stymie your ejaculation until she at last bottoms out on your [pc.sheath " + x + "].") + " With your urethra no longer being squeezed off, your eyes lose focus and drool runs down your cheeks as, with a hollow moan, " + (pc.balls > 0 ? "your clenching sack dumps" : "you dump") + " three backed-up orgasms in Sellera’s bowels.");
	if (pc.cumQ() >= 6000) output(" Given your inhuman virility, even one load would’ve been enough to give your partner a respectable sperm paunch, but this triple dose inflates the dominant myr atop you until her washboard belly bloats outward with your [pc.cumVisc] seed.");
	if (pc.hasKnot(x)) output("\n\nNot even a drop of your [pc.cum] escapes your partner’s ass");
	else output("\n\n" + (pc.cumQ() < 6000 ? "A trickle of" : "A thick stream of") + " your [pc.cum] oozes out of your partner’s ass");
	output(", and Sellera makes her enjoyment of this fact clear in the most carnal way possible. Your jizz acts like fuel for the guttering embers of her orgasm, causing her climax to flare back up to an even greater height than before. Sellera screams in delight as she resumes bouncing on your [pc.cockNounSimple " + x + "] as much as your swollen knot will allow her to, mauling her tits and fingering her box while you creampie her ass until her whole body locks up.");
	output("\n\nThe alien woman’s voice cracks into silence just as her hips begin jerking fitfully, allowing you to hear just how wet her pussy is as she starts fingering herself like a woman possessed. You’re concentrated almost entirely on stubbornly breeding her butt until you recognize the unmistakable sound of a woman squirting. Ribbons of slippery, alien femcum gush around Sellera’s chitinous fingers as she creams her hand. Her ejaculate is so voluminous that her cunny honey splatters on your [pc.thighs] and [pc.legs], marking your [pc.skinFurScales] with the dominant woman’s pussy-scent.");
	output("\n\nSellera shudders out the remainder of her second orgasm, swearing quietly between breaths as her [pc.cumNoun]-stuffed insides flutter around your sorely abused [pc.cock " + x + "]. She wipes her femcum-soaked hand off on the dry outside of your [pc.thigh] before patting it affectionately and looking back at you with a shockingly warm smile. <i>“That was fan-</i>fucking<i>-tastic, Steele. I haven’t squirted that hard in ages. I bet it won’t be the last time I cum like that today, either.”</i>");
	output("\n\nYou smile back up at the field marshal, gasping for breath and utterly exhausted. Does she have an appointment after you?");
	output("\n\nSellera laughs, a little too wickedly. <i>“Very funny, Steele. I like that sense of humor. Or did you seriously forget that your cock is still harder than your namesake?”</i>");
	output("\n\nYou yelp in pleasured pain as the sadistic myr clenches her butt, crushing her now-cum-plastered bowels around your tenderized [pc.cock " + x + "]. There’s no denying it though: as soon as she relaxes her anal muscles, pleasure surges through your treacherous manhood, and you realize that your body is still polluted with Sellera’s venom.");
	output("\n\nThe field marshal takes some pity on you when she sees your reaction, grinning a moment before slowly reclining on you, pressing most of her weight down on your [pc.chest]. Reaching back, she grabs your chin, and you notice instantly that her hand still smells powerfully of her womanhood. As you breathe in her raw, feminine scent, Sellera murrs to you, <i>“Cum is my favorite lube, and I’d hardly call this a proper reward-assfucking if I didn’t share that fun with you.”</i> Then she snares your lips in a raunchy tonguefuck disguised as a kiss.");
	output("\n\nAnother massive dose of her " + (pc.hasPerk("Venom Slut") ? "sweet nectar" : "fiendish venom") + " pours into your body. You moan into her mouth as the aphrodisiac seizes you once more, but she doesn’t stop this time. Even when you start shivering and thrusting your [pc.hips] up into her cummy behind again, Sellera continues pumping you full of her venom. She doesn’t stop until you’re so sensitive that you finally writhe under her and cum again, filling her with even more of your cream. Only then does she finally break the liplock, moaning out loud herself as she pushes back up onto the balls of her feet.");
	output("\n\nSellera doesn’t even need to move to get you off again, but the aggressive officer pins your [pc.hips] to the floor once more with her alien strength. Even as a red fog descends over your brain, you still recognize it as a command to let her take charge, a command you unthinkingly follow. The last thing you clearly remember of the next few hours is Sellera’s predatory grin and the feeling of cumming deep inside of her countless times. The near-overdose of her venom she gave you robs you of the ability to think of anything other than fucking her ass with " + (pc.hasKnot(x) ? "the short, jerky thrusts your knot permits" : "bruising force") + ", and that’s all you do until you pass out.");
	output("\n\nWhen you finally come to, you’re no longer in Sellera’s office. Instead, you’re in the middle of an absolutely massive bed. It’s so soft that you’re loathe to move, especially since any movement below the belt sends twinges through your sore and abused [pc.cock " + x + "]. Your gasp of pain alerts the sentry outside the room, who opens the door and enters with no regard for your nudity. She quickly approaches the bedside, carrying a small crate in her arms. To her credit, she doesn’t stare at your exposed [pc.chest], but " + (silly ? "she notices ur buldge, her solid black eyes widening and her nostrils flaring in a perfect OwO" : "her eyes do linger momentarily on the bulge of your [pc.cock " + x + "] under the sheets."));
	output("\n\nThe sentry places the crate on the ludicrously ornate bedside table, letting you see that it contains your [pc.gear]. " + (pc.isNude() ? "You hop out of bed and retrieve your equipment, giving the blushing myr woman an eyeful of your full-frontal nudity. Once you’re ready, she awkwardly clears her throat." : "She turns her back politely, but does not leave the room. Once you’re clothed, she turns back to face you again.") + " <i>“You’re in the former queen’s bedchambers. I’ve been ordered to escort you out again once you’re awake,”</i> the soldier explains curtly.");
	output("\n\nAlthough you’d really rather take some time to ice your crotch, you nod your head in understanding, following the sentry out and through the mansion until you’re back on the streets of Kressia, your body still reeking of the woman who controls the whole city.");

	pc.orgasm();
	pc.shower();

	IncrementFlag("SELLERA_SEXED");

	addButton(0, "Next", move, "807");
}

public function selleraPerformsReconnaissanceOnYourNetherLips():void
{
	clearMenu();
	clearOutput();
	selleraHeader();
	author("Night Trap");
	imbibeVenomEffects();
	if (pc.hasStatusEffect("Red Myr Venom")) pc.setStatusMinutes("Red Myr Venom",60);
	processTime(90+rand(121));

	var x:int = rand(pc.vaginas.length);

	output("Sellera regards your [pc.cunt " + x + "] with a wry smirk. <i>“I’m impressed, Steele! Here I thought </i>all<i> you aliens had at least one cock bolted onto you at some point, but I can see you’ve chosen the superior sex. Well, just because there’s no cock around doesn’t mean we can’t still have fun. I’m not sure what you’ve seen from those golds, but I’m going to show you how </i>real<i> myr women fuck.”</i>");
	output("\n\nYou’re surprised when, rather than pouncing on you, the field marshal turns away and begins clearing off her desk. She moves everything with such cold precision that you first think she’s suddenly remembered some important paperwork, but when she grabs you without warning, her reasoning soon becomes clear.");
	output("\n\nSellera kisses you with a passion born of hunger. You’d be feeling hotter just from the intensity of her touch, but the venom carried in her kiss quickly fills you with an unnatural heat.");
	if (pc.hasPerk("Venom Slut")) output(" You couldn’t be happier to get your fix in such a direct way. Your scarlet domme is generous with her doses of druggy saliva, and you have no doubt that if you could sate your addiction like this every time, there’s nothing you wouldn’t do for her.");
	output(" The infernal aphrodisiac courses through your veins with remarkable speed, spreading from your mouth to your [pc.nipples] to your [pc.cunts] in short order. An involuntary moan soon escapes you, though it’s muffled by your partner’s lips.");
	output("\n\nAs abruptly as the kiss began, it ends, but before you can even think to complain you cry out in shock. Sellera grins as she wordlessly lifts you with her superhuman strength. No sooner " + (pc.hasFeet() ? "have" : "has") + " your [pc.feet] left the ground than you’re slammed onto the field marshal’s desk, knocking the wind out of you. While you’re still recovering you feel a pair of chitinous hands grab the undersides of your [pc.thighs]. You look down in dazed confusion and make eye contact with Sellera. Once she’s fixed her gaze on your [pc.eyes] she strokes and kisses your inner thighs, and despite the obvious passion of her actions, the red myr’s lightless orbs feel downright cold.");
	output("\n\nTension mounts as the field marshal stares at you without blinking while she licks");
	if (pc.wettestVaginalWetness() > 3) output(" the copious [pc.girlCum] staining");
	output(" your [pc.skinFurScales]. She kisses around your [pc.cunt " + x + "] and even blows on it, avoiding direct contact, every touch administering another tiny dose of venom. Soon you’re so horny that you’re tempted to just wrap your [pc.legs] around Sellera’s head and grind her face into your pussy, but you never give that more than a moment’s consideration. You’re too spellbound by your partner’s gaze to even make a sound.");
	output("\n\nEven when your womanhood starts to ache from arousal, all you can do is shiver. The gravity of your partner’s predatory demeanor leaves you paralyzed like a mouse cornered by a hungry snake. Your heart beats faster and faster as you wait for the inevitable, but it never seems to come. Sellera just continues tormenting you with her venom-drenched tongue, like the serpent tasting the air before it lunges at its prey.");
	output("\n\nShe teases you until your [pc.clits] " + (pc.totalClits() > 1 ? "are" : "is") + " rock-hard and your labia are obscenely puffy");
	if (pc.hasPlumpPussy(x)) output(" even by your standards");
	output(". It’s hard to say if you could be any hornier than you are now. You think that with a little more venom or even the lightest touch on your clit, you’d be able to cum. Like she can read your thoughts, Sellera chooses this moment to finally strike. She darts her tongue out with lightning speed, delivering a long, firm, and <i>very</i> wet lick to your twitching pussy. You scream as her powerful oral muscle starts at your soaked taint, and by the time she’s licked up to your entrance, you cum <i>hard.</i>");
	output("\n\nSellera immediately tightens her grip on your [pc.thighs]. Her monstrous strength prevents your [pc.legs] kicking and flailing nervelessly from the intensity of your climax, but it doesn’t stop you screaming loud enough for the whole floor to hear");
	if (pc.isSquirter()) output(", nor from from squirting all over her tongue. The red myr makes a pleased sound at this, though you barely notice her");
	output(". Your screams mostly drown it out, but you can feel Sellera’s derisive laughter expressed as delightful vibrations that simply intensify your orgasm.");
	output("\n\nYour entrance gives its best in its effort to draw your domme’s tongue inside you, painfully empty as you are. Sadly the slippery muscle is far too strong to be ensnared, and Sellera uses the frantic clenching motions of your love tunnel against you. Even as you buck your [pc.hips] and reflexively squeeze down she never lets more than the very tip penetrate you, always retracting and extending it to keep your opening spread the barest amount.");
	output("\n\nThis teasing continues throughout your orgasm, prolonging and strengthening it significantly. You gasp for air as the aftershocks roll through your entire lower half, but the aphrodisiac in your system means you’re not even remotely satisfied even after such a powerful climax. Aroused as you are though, you’re still not prepared for when Sellera thrusts her tongue as deep inside you as she can. You let out a high-pitched yelp and collapse writhing onto the field marshal’s desk, breath hitching every time you try to scream again.");
	output("\n\nThe pitch of your voice climbs higher over just a few seconds of rough, venomous tongue-fucking. The scarlet woman eats you out with undisguised hunger, but she never stops to swallow, allowing a flood of druggy saliva to pour deep into your most sensitive place. You’re sweating like you’ve run a marathon, but in truth it’s nothing more than the effects of the infernal venom of the red myr. Sellera’s powerful tongue is stronger than a finger, yet far softer, and it feels deliciously exotic as it plunders your folds for every drop of [pc.girlCumFlavor] nectar you have to give, leaving more liquid heat in its place.");
	if (pc.wettestVaginalWetness() > 3) output(" You’re shamefully wet, and it shows. Even Sellera’s greedy tonguing can’t keep up with your output, and a puddle of [pc.girlCumNoun] soon forms under your [pc.ass].");
	if (pc.wettestVaginalWetness() > 4) output(" It doesn’t take much longer to overflow and begin audibly dripping on the floor and your partner.");
	output("\n\nYou finally draw a full breath just in time for the field marshal’s mouth muscle to find your g-spot, and when she presses into it harder than any human tongue could, you immediately begin shrieking out in orgasm for a second time.");
	if (pc.isSquirter()) output(" The direct g-spot stimulation is almost unbearable, and your second squirt is even more voluminous than the first. The flood of cunny honey bathes your partner’s tongue for but a moment before she withdraws from you.");
	output(" Sellera sadistically denies you the pleasure of having something to cream all over by pulling out of you at the moment of orgasm, and your cry takes on a mournful tone as your pussy squeezes down on nothing once more. You’re not too broken up about it though, as you can barely breathe fast enough to keep voicing your ecstasy.");
	output("\n\nGiving an exotic alien two powerful orgasms in the span of barely a minute would be something to celebrate for most people, but the field marshal acts like you’re just another piece of work that’s landed on her desk. She continues slowly trailing her tongue up your spasming slit, calmly holding your [pc.legs] still even as you thrash in her grip hard enough to bruise yourself. She licks upward so slowly that you don’t even notice the movement until you’re done wailing like a cat in heat.");
	output("\n\nOnce you’ve come down enough to regain some semblance of muscular control, Sellera shifts her grip, using just her left arm to hold the tops of both your thighs as she rests them on her shoulders, raising your");
	if (pc.wettestVaginalWetness() >= 3) output(" [pc.girlCum]-soaked");
	output(" bottom off the desk. You can feel your left thigh being jostled repeatedly, prompting you to lift your head to try to see what’s going on. There you see Sellera staring back up at you, still slowly licking up the length of your womanhood, only now her face is even more red than usual. She’s flushed and panting, and when you start to hear a very wet noise from below the desk, you realize she’s energetically fingering herself to the sight of you squirming in bliss.");
	output("\n\nYou shudder in delight at the realization, your shudder turning into a full-body tremor when Sellera’s tongue finally reaches your [pc.clit]. Between the venom and your back to back orgasms, your sensitivity is at an all-time high. Your voice cracks as you try to moan, and your violent shuddering and jerking adds a noticeable tremolo. Your swollen, erect clitoris is a lightning rod for the field marshal’s venom-soaked thunderbolt of a tongue, causing a similar amount of electrical activity in your body as the nerve-rich bundle of flesh is assaulted by Sellera.");
	output("\n\nShe inadvertently saves your vocal cords when her merciless tongue invades your clitty’s hood, intentionally avoiding drawing it back so that your own anatomy traps her hellish, wonderful venom against your naked clit. The sheer overstimulation caused by this violation silences your third orgasmic scream before it can even happen. Your ensuing climax is so explosive and violent that the scarlet domme actually stops fingering herself to free her right hand. The chitinous appendage glints with her copious moisture, leaving a generous smear of the stuff on your [pc.skinFurScales] when she presses down on your middle to keep you from flopping off the desk.");
	output("\n\n");
	if (pc.isSquirter()) output("You squirt more than you thought you were capable of, every bit of your ejaculate splattering over your domme’s neck and chest. ");
	output("Your arms and [pc.legs] don’t know if they want to flex or extend, and your abdominal and pelvic muscles are contracting so frequently and so intensely that it hurts. Thankfully you’re so envenomed that the pain is downright enjoyable, but you would doubtless have injured yourself if you weren’t being restrained. This time you don’t care that your pussy is empty. All you can even notice is the unholy amount of stimulation your love button is receiving, and you don’t want to think about what kind of shameful noises you must be making between alternately begging to stop or keep going.");
	output("\n\nSellera is doing little more than slowly circling your clit, but you’re so worked up and so high that she might as well be directly stimulating your nerves themselves. You can’t seem to stop creaming yourself, and your butt and back are");
	if (pc.wettestVaginalWetness() < 4) output(" wet");
	else if (pc.wettestVaginalWetness() < 5) output(" drenched");
	else output(" absolutely soaked");
	output(" in your own [pc.girlCum]. You’ve lost track of if this is one continual orgasm or several without interruption, and for that matter you lose track of everything but the wonderful torture your throbbing button is receiving.");
	output("\n\nIt does eventually stop, thankfully before you lose consciousness. You’re dimly aware of being eaten out deeply for a few minutes before being moved further onto the field marshal’s desk and having a smooth, hard weight suddenly pressing down on you. It’s the [pc.girlCumFlavor] smell of your own pussy that finally rouses you back to full awareness though. You blink dumbly as you take in the situation that greets you.");
	output("\n\nSellera has climbed on top of you, straddling your thigh and pressing her own muscular leg into your [pc.groin] as she breathes heavily an inch from your face. Her voice is dripping with unfulfilled need as she whispers to you. <i>“Your cunt tastes great, Steele, very [pc.girlCumFlavor]. I hope you didn’t fill up on that little appetizer though. I’m hungrier than when we started.”</i>");
	output("\n\nYou gasp sharply when the crimson dominatrix pinches your [pc.nipples] far too hard for comfort. A moment later you feel even more moisture on your leg, demonstrating just how much Sellera enjoys your pain. Again she pinches one of your teats until you squeak, releasing it the instant it becomes too much for you. Soft squishing sounds fill the air as the sadistic officer gives in to her lust and begins grinding her muff on your thigh. She drags her dripping-wet pussy across your [pc.skinFurScales] with alarming intensity, bumping her toned leg into your mound with every forward jerk of her hips. It’s hardly the most stimulating thing, but you’re so much more sensitive than usual from her venom and your string of orgasms that you’re grateful for the comparatively gentler treatment below the belt.");
	output("\n\nHer grasp on your chest however is anything but gentle. Sellera continues molesting your upper half in an increasingly rough manner, gradually accommodating you to the joys of submissive masochism. She swiftly moves from simply tweaking your nipples to squeezing your breasts like she has a grudge against them. Ten points of hard chitin viciously sink into your " + (pc.hasBreasts() ? "boobs" : "pecs") + " with awesome strength, prompting you to " + (pc.isTreatedCow() ? "moo" : "squeal") + " involuntarily.");

	if (pc.isLactating())
	{
		output("\n\nSmall wonder that your [pc.milk] suddenly squirts out in fine jets. Sellera’s eyes light up as soon as she feels it against her palms. <i>“Oh ho ho, was this for your children, Steele? Knowing how decadent your people are, I wouldn’t be surprised if you made yourself lactate just so you could feel some alien stud suckling from you.”</i>");
		output("\n\nShe begins milking you with rough, cruel motions, though her panting breath and the gleeful smile on her face clues you in to just how excited she is about this. <i>“Or would you rather be like those slutty little gold honeypots? Just lazing around all day eating and having your big, fat tits sucked and tugged and pumped? Do you even have the sense of duty those gluttons have, or do you just get off on begging someone stronger than you to drain these jugs for you? Yes, you’re not even ‘Steele the honeypot.’ You’re just a cow, and a whore to boot!”</i>");

		pc.milked(25);
	}
	else if (pc.biggestTitSize() < 4)
	{
		output("\n\nYour breasts are the perfect size for Sellera to grasp, allowing her to encompass the entirety of each mound with just one hand. She’s obviously pleased by this, if the way her breathing has quickened is any indication, and she shares her pleasure with you by doing everything pleasurable and painful to your mammaries she can think of.");
		output("\n\nHer actions aren’t just simple sadism. Each one is cunningly calculated to make you mind-meltingly sensitive.The red myr seamlessly switches between pleasure and pain, keeping you on your toes and leaking a " + (pc.wettestVaginalWetness() < 3 ? "puddle" : "flood") + " of [pc.girlCum] the entire time. Soft strokes of her fingertips on your nipples become cruel pinches. Harsh squeezes of your breasts transition into gentle massages. Even when the electric feeling of her venom-soaked tongue licking your teats is replaced by her teeth seizing the swollen buds, it feels totally natural.	");
		output("\n\nWhenever she’s not licking, sucking, or biting some part of you, she’s whispering to you in a smoky voice. <i>“So glad you’ve got something practical for me to play with. This is all anyone really needs. Perky, but soft. Don’t get in the way when shooting or fighting if you’re a soldier. And if you’re a,”</i> she punctuates each of her next three words with a kiss right on your throbbing nipples, <i>“submissive, little, alien,”</i> she bites your tender bud and growls one word through her teeth before releasing you, <i>“SLUT! They’re just the right size for whoever you’re spreading your legs for at the moment. I don’t know how many men or women you’ve let fondle you, but I’ll make sure you don’t forget me.”</i>");
	}
	else
	{
		output("\n\nSellera attacks your mammaries with an uncanny surety to her actions. It almost seems like she’s been planning this for years, preparing herself mentally for when she has the chance to strike. Whoever this plan was for, you immediately get the feeling that Sellera didn’t like them, as she’s inflicting much more pain than pleasure. You’re doubly grateful for all the venom pumping through your veins, as it allows you to savor even this nigh abusive treatment.");
		output("\n\nShe eases up a bit after a few long moments, though with the way she’s frantically grinding her pussy on your thigh you’re not sure if she realized you wouldn’t be able to handle this for long or if it just made her too horny to keep her concentration. Either way, you’re relieved, though only briefly. The myr woman stills her hips before she gets too carried away and squirts all over you, and she channels that sexual energy into working your chest for everything it’s worth. She tugs ferociously on your sizeable bosom, sometimes with both hands on the same boob to wring your breast while yanking your nipple. Her mouth soon comes into play as well, sucking, biting, and envenoming all the breastflesh she can reach both top and bottom. Every weapon in her formidable sexual arsenal is brought to bear, and she doesn’t stop even when you tremble through a few miniature orgasms.");
		output("\n\nThere’s a gleam in her cold, black eyes, one of total, almost manic glee. It’s utterly at odds with the razor-thin smile on her lips, a contrast further emphasized by the faint tremble in her voice as she speaks between oral assaults.");
		output("\n\n<i>“I’m not surprised in the least you’d have such big tits.");
		if (pc.biggestTitSize() < 7) output(" A little bigger and you’d fit right in with the locals of this city.");
		output(" I’ve seen so many gold whores flaunting their huge breasts, but when it comes time to go to war, what use are they? </i>Big, fat tits<i> like these.”</i> Her eyes and smile both widen as she shamelessly gropes you, and she speaks faster as her excitement makes itself obvious. <i>“The only thing you could do with them is maybe distract a fresh recruit who’s never seen such slutty lumps of flesh. Otherwise they’re just big advertisements. Do you know what they say?”</i>");
		output("\n\nShe tweaks your nipples when you try to speak, silencing you with a wicked grin on her face.");
		output("\n\n<i>“They say, ‘I’m not a soldier. I’m what soldiers fight over.’ That’s right, I’ve seen hardened women squabble over the right to make some four-armed whore their trench wife. But you? Oh, you’d make a whole platoon tear itself apart trying to be the one who gets to fuck your brains out every night. Yes, these udders are a threat to unit cohesion, and I’m going to show you what will really happen every time you jiggle these things around.”</i>");
	}
	
	output("\n\nYou shriek from time to time as the red myr’s " + (pc.isLactating() ? "milking" : "groping") + " takes on a truly sadistic vigor. She looks and sounds like she’s on the verge of creaming your thigh, but even as excited as she is, she still makes sure not to push you to the point that it’s totally unpleasant. She’s treating you like a sex toy");
	if (pc.isLactating()) output(" and a milk dispenser at the same time");
	output(", but you’re thrilling in every second of it. Sellera is normally so in control of herself and her lusts, but all you had to do to drive her wild was submit. The verbal abuse she’s heaping on you sets your pulse racing even faster, coaxing you into letting go of yourself and seeing how fun it would be live up to her words.");
	output("\n\nBy now you’re convinced your blood might have a pink tinge to it with all the venom diluting it. Your brain floats in a sea of the addictive stuff, lazily reclining just like the rest of you, content to allow your dominatrix to do whatever she wishes with or to you. You barely notice her frenzied grinding, and each miniature orgasm it forces out of you is barely a blip on your radar. All the venom that isn’t in your brain seems to have coalesced in your " + (pc.hasVaginas() ? "vulvae" : "vulva") + ", leaving you swollen and puffy beyond all reason. Just the occasional touch to the hypersensitive flesh there is enough to keep you breathless and squirming.");
	output("\n\nSellera kisses you again, a proper tongue-fucking, and you almost cum again from that alone. You’re still whining and begging for more of her taste when she casually slings your [pc.legs] around her hips and lifts your lower half up more than a foot into the air. The red myr’s strength allows her to move you like a ragdoll, and as she brings your puffy mound up to her six-pack with just one hand, the incline of your torso becomes extreme enough that your own juices begin to drip down your front. Her free hand is obscured under your body, but the vigorous motions of her arm and loud squelching sounds accompanying it leave no doubt as to what she’s doing below you.");
	output("\n\nFor you at least, this position could hardly be less comfortable or more vulnerable. For Sellera that seems to be exactly the point. Though you have little leverage, you’re too horny not to try to shake your hips. It’s not strictly necessary given that your partner is moving your whole lower half, but the effort on your part obviously pleases her, and that’s all the reason you need. Your scarlet domme rewards you for shedding your laziness by releasing your hip and returning that hand to punishing your chest.");
	output("\n\nYou’re not quite sure if you’re grateful or disappointed that she’s not ambidextrous. As the field marshal’s own arousal grows she becomes increasingly sadistic, but she also works herself over even harder. She quickly grows dissatisfied with her split efforts, and compromises by performing the same motions with both hands. Sellera’s sadomasochistic streak makes itself apparent to you when she chides you for yelping over a particularly sharp pinch to one of your teats.");
	output("\n\n<i>“Woman up for one fucking minute, you little slut! I know full well you can handle this. I’m not pinching your tit- </i>AH!<i> half as hard as I’m pinching my clit!”</i> The sudden, sharp jerk of the red myr’s hips in the middle of her sentence gives credence to her claim. If she’s really going at herself harder than she is you, you’re astonished she hasn’t injured herself yet.");
	output("\n\nShe isn’t wrong about you being able to enjoy your own pain either. Very soon after she begins pinching your nipples you find yourself once again on the verge of cumming. Your neck and shoulders ache, and all the blood that isn’t in your puffy " + (pc.hasVaginas() ? "pussies" : "pussy") + " seems to have pooled in your brain. The poor circulation leaves you not only light-headed, but also even more high on myr venom than ever before.");
	output("\n\nWhen you finally do cum it’s explosive. You " + (pc.isSquirter() ? "squirt" : "leak") + " [pc.girlCum] all over Sellera’s six-pack, glazing her abs and " + (pc.wettestVaginalWetness() < 4 ? "much" : "all") + " of your own front half and butt. Your eyes roll back into your head and tremors wrack your body as the sensitivity in your crotch reaches a new level. It’s overwhelming, the way her abs grind against your throbbing " + (pc.totalClits() > 1 ? "clits" : "clit") + ". You can feel every little variation in Sellera’s musculature through your puffy labia as easily as if you were using your fingers. By the time you’re halfway through your climax you’re certain you could draw the field marshal’s abdominal muscles from memory.");
	output("\n\nFrom both the intensity of your climax and the awkward position you’ve been held in, you very nearly black out. Your body still convulses from time to time, and you’re not sure if it’s from how many times you’ve cum or if you’re close to overdosing on Sellera’s venom. Your vision and hearing slowly return to you as your blood circulates freely once more, but you just lie on the desk trembling and gasping for air.");
	output("\n\nYou’re too exhausted and sore to do anything else, at least until a soaking wet, chitinous hand starts slapping your cheek. From the potent, earthy bouquet of raw femlube, you realize immediately that this is the hand Sellera has been fingering herself with, and from the sheer amount of moisture it left behind, you realize she must be close to cumming. When you look up at her looming over you, her expression is a mixture of relief, annoyance, condescension, and unabashed fondness.");
	output("\n\n<i>“So you just couldn’t hold out for ten fucking seconds more, huh, Steele? You just had to choose </i>right then<i> to cream my abs until you almost passed out?”</i>");
	output("\n\nGiven how red your face is already you can’t really blush, and you’re too breathless and hoarse to say anything, but you do still cast your eyes down in embarrassed submission.");
	output("\n\n<i>“Ten more seconds. Maybe less! That’s how close I was to getting off, and then you started shaking like you were having a damn seizure. I thought you’d overdosed. I was worried for a minute.”</i> She presses the back of her hand against your cheek with surprising gentleness, unintentionally, or perhaps intentionally, smearing her juices on your face and inundating you in the smell of her ravenous cunt.");
	output("\n\nYour heart takes a break from hammering in your chest to flutter at this show of concern from the normally-dispassionate field marshal. Even her next statement and return to form doesn’t entirely undercut the warm feeling in your chest.");
	output("\n\nHer demeanor spontaneously shifts back to the hungry predator you’re used to as she flashes you a toothy grin and squeezes your face with her pussy-soaked hand. <i>“Yes, I was very worried I wouldn’t get to cum myself. I know you’re probably used to your partners finishing with you quickly and discarding you for the next alien slut, but I’m afraid that’s just not standard operating procedure in my army.”</i> She releases her grip on your face with a condescending pat to your cheek, and you suddenly become keenly aware of her other hand.");
	output("\n\nScarlet chitin strokes feather-light across your puffy pussy, from your pubic mound all the way down to your taint. Even this light stimulation causes your [pc.legs] flail nervelessly until Sellera pins them to the desk with her ankles. With one hand pressing down on your pubic bone, she teases your clenching entrance with her fingertips, slowly tracing the perimeter of your tenderized womanhood. You try to buck your [pc.hips] in an effort to penetrate yourself on her digits, but the field marshal just glares daggers at you and presses down on your mons even harder, enough for you to feel the pressure directly on your pubic bone.");
	output("\n\n<i>“I can hardly believe you. You’ve already gotten off, what, a dozen times? More?”</i> At a torturously slow pace, Sellera slips a finger inside you, carrying on speaking like nothing’s happening as she does so. <i>“I know you’re strung out on enough venom to make a whole squad of golds cream themselves, but most people would either be passed out or totally satisfied by this point. How can you still be this desperate for me to fuck you? Are you some sort of futuristic sex toy, or are you just that much of a slut?”</i>");
	output("\n\nPerhaps in a more lucid state you would be aware of how much all the aphrodisiac saliva has perverted your behavior. At the moment though you’ve been so high for so long that you can’t really think about what it’s like to be sober. For that matter you can’t really process speech. All you manage to slur out in response is a ragged <i>“More!”</i> which just seems to further incense Sellera.");
	output("\n\n<i>“More??? You want </i>more?!?<i>”</i> She stuffs a second finger into you and begins grinding her thumb into your clit. <i>“After all you’ve had, you want more?!? What’s the matter? Don’t feel satisfied until you’ve had a cock in you?”</i> Despite her angry tone and demeanor, you can tell from her body language that the myr woman is exciting herself with her words. <i>“Oh, let me guess: you just want to lie back all day with your legs spread and let anyone who walks by have their way with you.”</i>");
	output("\n\nSellera fits a third finger into you and penetrates you faster and deeper, positively tormenting your g-spot until you scream and cum. She doesn’t slow down one bit, and even takes this as a sign that she’s exciting you with her dirty talk. <i>“Exactly as I thought. Just the mention of it is enough to get you off. What else do you need to be satisfied? Are you the kind of girl who needs a cock in her to be satisfied?”</i> You whimper as the field marshal crams a fourth digit into your still-cumming pussy and begins pinching and twisting your [pc.clits].");
	output("\n\nThe stream of perversion Sellera is directing at you seems to be more for her own benefit at this point. Her neglected slit has gone from occasionally dripping to outright trickling thick strands of cunny honey on your [pc.legs], and even when you cum a second and third time from her vigorous fingering, she just carries on verbally abusing you.");
	output("\n\n<i>“I can see it now: you, bent over a table, your panties around your ankles, a line of horny alien studs stretching around the block, every one of them with a different cock. Mmmm, yes! The only commonality is that they’re all big. All different shapes, but all </i>big.</i>”</i>");
	output("\n\nYou’ve stopped trying to do or say anything in protest. Every time you cream her digits, Sellera just grows more excited and fingers you deeper. When her hard digits are nearly reaching to your cervix you can do nothing but gasp for tremble and clench down on her hand as she continues working herself up. <i>“Oh, but you aliens do some strange things with your bodies. Would it be a line of men gaping your cunt, or would you prefer women with giant cocks, like the nyrea? That seems more your style. I’m sure you’re fantasizing about it right now: thick cocks stretching you apart, raking your walls with those barbs.”</i> As Sellera speaks, or really, moans, her hand inside you mimics the actions she’s describing, and you’re too busy thrashing under her to notice that she’s building up to a crescendo. <i>“All leading up to that giant, fist-sized knot </i>slamming<i> into you!”</i> With no more warning than that, the field marshal crams her thumb into your overstuffed pussy and balls her hand into a fist.");
	output("\n\nYour eyes almost pop out of your skull, and you arch your back so much that your shoulders leave the desk. Every muscle in your abdomen and pelvis contracts around your domme’s fist. Your entire body tenses up in that moment. Then she starts moving it, and you start screaming.");
	if (pc.isSquirter()) output(" Your femcum splatters everywhere as you explosively cum, squirting continuously.");
	output(" Your vagina doesn’t know what to do, nor does the rest of you. You throw your arms around her neck and try to pull her face into your bosom, but she’s so much stronger than you that you instead pull yourself up to her until your arms go limp again. You manage to scream now and then, but Sellera never relents.");
	output("\n\nEven when your upper half goes slack and your voice cracks into silence, she keeps going, <i>“I wish I’d realized it sooner! The heroic [pc.name] Steele is just a little alien slut who wants to get her cunt stuffed with load after load of thick, virile cum! </i>By other women!<i> If I’d known earlier that a whore could accomplish the mission I gave you I would’ve hired a prostitute.”</i> Finally her words dissolve into a long, deep moan, and a small shiver runs through her as her untouched pussy gushes a modest amount of femcum onto your thigh. It dawns on you that the field marshal just had a small orgasm, totally hands-free, from nothing more than abusing you.");
	output("\n\nShe takes a moment to catch her breath, her fist still inside you the entire time as tremors rock your body. Once she’s regained her composure she pulls out of you roughly, leaving you painfully empty. You’re too exhausted to really focus on anything but the hollow feeling between your legs, so you fail to notice Sellera hop off of her desk. You ignore the sounds of drawers opening and being rummaged through and close your eyes, ready to sleep off the remainder of your venom high. Until you feel leather straps sliding up your [pc.legs] at least.");
	output("\n\nIt’s almost too much effort open your eyes, but when you do you’re greeted by the sight of Sellera sliding a strap-on dildo onto you. The silicone phallus is a replica of a myr male’s cock... an exceedingly lengthy, thick, veiny cock at that. It even has a replica scrotum beneath it, large and swollen like a real breeding drone’s would be. You don’t even realizing you’re licking your lips at the sight of it, but the scarlet dominatrix fitting it on you notices it instantly. <i>“Oh, so you like this? It doesn’t even have all the bells and whistles I thought you were accustomed to. Well no cock for you today, Steele, not even fake ones. I wouldn’t even be using this myself, but I’m well aware that you’re too exhausted to so much as lick my clit.”</i>");
	output("\n\nWhile she’s speaking she strokes up and down the length of the dildo with the hand she used to fist you, and you realize she’s lubricating the toy with your [pc.girlCumNoun]. Once she’s satisfied with its readiness she casually wipes the rest of your juices on your [pc.belly] before gracefully climbing back on top of you. She places her hands on either side of your head and stares down at you with her lightless eyes. <i>“I had hoped you could last long enough at least for me to get myself off, but since you decided to be selfish and cum yourself half to death right before I could manage even one orgasm... well, I just had to call in reinforcements.”</i>");
	output("\n\nSellera rears back and rises onto the balls of her chitin-clad feet, balancing over the head of the strap-on as she grabs it with one hand and spreads her pussy with the other. She lines the tip up with her entrance and rocks her hips slightly to be certain she has the proper angle. Then she unceremoniously drops her full weight, spearing herself on roughly a foot of girthy, fake cock in a doubtlessly painful insertion. The ant woman gives no verbal indication of discomfort aside from a single gasp of <i>“Fuck!”</i> before she starts writhing in what you think is pain until she starts pinching her nipple in one hand and clitoris in the other.");
	output("\n\nShe grinds the dildo against her deepest reaches, grunting and grinding the sizeable head against her cervix for several seconds until she doubles over a moment before throwing her head back and this time shouting <i>“FUCK!!!”</i> The field marshal’s hips are almost a blur, and her hands look like she’s trying to crush herself. A moment into her orgasm and she squirts as violently as the rest of her is moving, drenching your whole midsection in earthy femcum. Her abdominal muscles contract so tightly that you can see the outline of the dildo inside her. It’s more obvious now than ever that this is a woman with an almost bottomless reserve of suppressed libido.");
	output("\n\nWhile you’re still wondering how you managed to keep up with her for as long as you did, Sellera finishes creaming the strap-on like she’s trying to break it. She takes only a few seconds to recuperate before she starts vigorously bouncing on it, and by attachment, you. The field marshal pounds her hips into yours, making her desk creak and groan under the two of you. She builds to a frantic pace that will no doubt bruise you, and in what can’t have been more than a couple minutes she orgasms again. This time the only indication that she’s cumming is the gush of femcum as she squirts around the toy inside her once more. Her rapid movements and the sheer girth of the dildo cause her ejaculate to splatter everywhere in a pressurized spray of earthy girljizz.");
	output("\n\nThough you do feel some vibrations in your crotch from the sheer force of your domme’s bouncing, the pleasure it brings you diminishes rapidly as you start to come down from you high. Without the pink tide of aphrodisiac washing over your brain, you no longer have anything keeping you conscious, and sometime around Sellera’s fourth orgasm, you pass out from sheer exhaustion.");
	output("\n\nWhen you finally come to, you’re no longer in Sellera’s office. Instead, you’re in the middle of an absolutely massive bed. It’s so soft that you’re loathe to move, especially since any movement makes your head feel like it’s going to split open. Your gasp of pain alerts the sentry outside the room, who opens the door and enters with no regard for your nudity. She quickly approaches the bedside, carrying a small crate in her arms. To her credit, she doesn’t stare at your exposed [pc.chest], but you do notice a momentary look of disappointment when she glances at the total flatness of the sheets over your [pc.groin].");
	output("\n\nThe sentry places the crate on the ludicrously ornate bedside table, letting you see that it contains your [pc.gear]. " + (pc.isNude() ? "You hop out of bed and retrieve your equipment, giving the stone-faced myr woman an eyeful of your full-frontal nudity. Once you’re ready, she clears her throat." : "She turns her back politely, but does not leave the room. Once you’re clothed, she turns back to face you again.") + " <i>“You’re in the former queen’s bedchambers. Field Marshal Sellera made certain you received an injection of antivenom once you passed out. She didn’t want to take any risks on you overdosing. I was ordered to escort you out again once you’re awake,”</i> the soldier explains curtly.");
	output("\n\nAlthough you’d really rather take some time to ice your crotch, you nod your head in understanding, following the sentry out and through the mansion until you’re back on the streets of Kressia, your body still reeking of the woman who controls the whole city. Part of you shudders at the thought of what she would do if you had a penis, but another part of you can’t help but feel excited at the possibilities.");
	//add pussy-soaked status, add like two dozen orgasms to the PC's counter

	var orgs:int = 6+rand(25);
	while (orgs-->0) pc.orgasm();
	pc.applyPussyDrenched();

	IncrementFlag("SELLERA_SEXED");

	addButton(0, "Next", move, "807");
}

public function selleraEnlistForSexualService():void
{
	clearMenu();
	clearOutput();
	selleraHeader();
	author("Night Trap");
	processTime(1);

	if (flags["SELLERA_SERVICED"] == undefined && flags["SELLERA_GANGBANGED"] == undefined)
	{
		output("You have some ideas as to how you could contribute to the war effort here in Kressia in a way that won’t hurt anyone. Is there anything you can do to help in matters more carnal?");
		output("\n\nAt first you’re uncertain whether Sellera is genuinely considering your proposition or if you’ve offended her sensibilities. After a long, tense moment however she mercifully cracks a wry smile. <i>“I’ve received reports that you aliens were a libertine bunch. I didn’t expect you’d be so eager to volunteer for this sort of service though.”</i> Sellera’s eyes roam your body, studying you from stem to stern. <i>“Yes, I can think of a few things you could do for me and my girls. What we most need is cock. Drones are kept far away from front lines and occupied territory, and there’s only so many times most women can be satisfied by having some venom-addled trench wife eat them out.”</i>");
		output("\n\nThe field marshal pauses and takes a long swig of her drink before continuing. <i>“I handsomely reward those who serve me loyally and well, and in the minds of many of my officers, there would be few rewards finer than sex with an exotic alien [pc.man]. So then, Steele, are you ready to serve the Scarlet Federation and her people?”</i> Sellera’s smirk as she asks you is almost frightening.");

		addButton(0, "Yes", function ():void
		{
			clearOutput();
			selleraHeader();
			author("Night Trap");
			processTime(1);

			output("Although her demeanor is downright predatory, her charisma is still readily apparent. Something in her tone leaves you feeling like you need to prove yourself to her, whatever that may entail. You tell her that you’re ready to do what you can.");
			output("\n\nSellera’s smirk barely changes, but there’s a slight twinkle in her normally-cold eyes. <i>“Well then, Steele, since you’re volunteering, I’ll leave it to you. How do you wish to serve?”</i>");

			selleraServiceButtons();
		});
		addButton(1, "No", selleraGoAwayWithoutOfficialLicking);
	}
	else
	{
		output("You certainly didn’t hate the experience last time, and you’re willing to keep helping Sellera with her army’s sexual needs. Is there anything she wants you to do right now?");
		output("\n\nSellera breaks out into another hungry smirk, regarding you like a particularly juicy prey animal. <i>“Of course, Steele. Soldiers always need relief, and loyal soldiers deserve only the best. That’s what you’re here for.”</i>");
		output("\n\nThe field marshal’s praise gives you a surge of happiness. You know by now that she doesn’t hand it out lightly. Still, you’re also aware that this means she has high expectations of you. You can’t help but swallow dryly, feeling a bit trepidatious as you mull over what you want to volunteer for.");

		selleraServiceButtons();
	}
}

public function selleraServiceButtons():void
{
	clearMenu();
	addButton(0, "Under Desk", selleraShowsYouTheTasteOfWarUnderHerDesk, undefined, "Under Her Desk", "The field marshal said she doesn’t take trench wives, so she must be pretty pent up under there. She’d probably just use you like a sex toy though.");
	if (pc.isTaur() || !pc.hasCock()) addDisabledButton(1, "Reverse Gangbang");
	else addButton(1, "RevGangbang", selleraRalliesHerTroopsToFuckYou, undefined, "Reverse Gangbang", "Perform pleasure service for Sellera’s chosen subordinates. This might sound fun, but it really means dozens of beautiful women are going to fuck you, and you’re not allowed to cum.");
}

public function selleraGoAwayWithoutOfficialLicking():void
{
	clearMenu();
	clearOutput();
	selleraHeader();
	author("Night Trap");
	processTime(1);

	output("You feel there’s a frightening promise behind her smirk, a promise to use you without mercy. You don’t feel you’re ready for that yet, even if it means upsetting this fearsome woman. Forcing down the lump in your throat, you inform her with a sheepish shake of your head that you’re not quite ready for that kind of service.");
	output("\n\nHer smirk disappears before you even shake your head, replaced instead with an icy look of faint disappointment. <i>“That’s unfortunate, but unsurprising. Precious few have the resolve needed to serve the Federation. I had thought you’d be among them, Steele, but clearly I was mistaken. Now, is there any other business you had today?”</i>");
	output("\n\nSome part of you had expected Sellera to fly off the handle at you, to chew you out for wasting her time or even throw you out of her office personally. Her actual response somehow feels even worse. For some reason it feels like you’ve let down someone important to you, even though you don’t have any real relationship with this myr woman. You don’t want to linger on this feeling, so you change the topic.");

	selleraMenu(selleraEnlistForSexualService);
}

public function selleraShowsYouTheTasteOfWarUnderHerDesk():void
{
	clearMenu();
	clearOutput();
	selleraHeader();
	author("Night Trap");
	processTime(3+rand(3));
	pc.lust(10+pc.libido()/8);

	output("As busy as Sellera is, there’s no way she has time to scratch all of her itches. Does she want you to help her with that?");
	output("\n\nSellera fixes you with a stare so icy you feel like you’re in a cold shower. <i>“" + (flags["FEDERATION_QUEST"] > 2 ? "I was under the impression you wanted to do something for the Federation today, not yourself.”</i>" : "You haven’t earned a chance to fuck me yet, Steele. You’ll need to work harder if you want that.”</i>"));
	output("\n\nYour pulse quickens, and you nearly trip over your words as you hasten to explain yourself. All you want is to pleasure Sellera, not yourself.");
	output("\n\nThe red myr’s expression instantly shifts to a thoughtful one. <i>“I don’t really have time at the moment to ride anyone’s face. If you don’t mind pleasing me while I work though, I think I could make room for you.”</i>");
	output("\n\nYou nod your head emphatically. All you want is to give her some relief. ");
	output("\n\n<i>“Get under my desk then.”</i> The words are somehow both casual and authoritative. The field marshal’s commanding air is obviously not an affectation. Sellera follows close behind you as you move towards her heavy desk. Once you’ve crawled beneath it, your view of the room contracts to just a chair and Sellera’s athletic body from the waist down. Your face flushes with warmth as you watch Sellera reach up her skirt and tug her panties down with a single smooth motion.");
	output("\n\nYou are so entranced by the simple show that it startles you when the red myr’s void-black eyes meet your own [pc.eyes] as she bends down to remove her undergarments. <i>“No masturbating. I’m not about to waste my valuable time waiting for your mess to be cleaned up.”</i> She doesn’t wait for a response from you, obviously confident that her words alone are enough to control you.");
	output("\n\nWhich of course, they are. You moan softly at the order, but the feeling of submission sends a shiver of faint pleasure through you. Your");
	if (pc.hasCock()) output(" [pc.cocks] " + (pc.hasCocks() ? "throb" : "throbs"));
	else if (pc.hasVagina()) output(" [pc.vaginas] " + (pc.hasVaginas() ? "throb" : "throbs"));
	else output(" [pc.asshole] throbs");
	output(" dully with excitement, but you try to put your own arousal from your mind. Right now you need to focus on the moist slit that is surely hiding under Sellera’s uniform. As you try to master yourself, Sellera hikes up the back of her skirt and sits down in her chair, spreading her muscular, chitinous legs before sliding forward, plunging you into darkness.");
	output("\n\nShe doesn’t wait for you to make the first move, opting instead to hook one powerful leg behind your shoulders and pull you under her skirt. An exotic, tangy, bittersweet scent immediately fills your nostrils, alerting you to just how pent-up the field marshal really is. She’s only had her panties off for a few seconds, and you can already smell how wet she is! You’re given no time to savor the erotic scent; as soon you pause to do so, Sellera reaches a hand under the desk and pushes your face into her honey-laced bush. <i>“I have work to do, and so do you. Don’t get distracted.”</i> The red myr’s voice is muffled from your current position, but you can easily sense the unspoken <i>“or else.”</i>");
	output("\n\nWith your nose totally full of Sellera’s undeniably feminine scent, you begin licking her almost on reflex. Your [pc.tongue] runs through the slippery folds in front of you, gathering up all of the ambrosial fluid it can before darting back into your mouth, flooding your olfactory system with the taste and smell of raw, unadulterated femininity. It’s delicious, and you swallow eagerly before lapping up more of the stuff.");
	output("\n\nYou quickly slide your tongue over your temporary commander’s thighs, thirsty for more of the tantalizing nectar you crave. Sellera tolerates this for a short time, but all too soon she clenches her superhumanly-strong thighs around your [pc.ears], tacitly encouraging you to return to your real task. Suitably chastened, you lean forward and wrap your [pc.lips] around the alien woman’s not-so-alien clitoris, kissing it once before sucking on the sensitive nub. Smooth, scarlet skin presses in around your head again, this time not as a warning, but out of pleasure. Even muffled by wood, cloth, and beautiful antflesh, you can still hear Sellera’s long, hissing sigh.");
	output("\n\nFrom the way her hips and thighs twitch randomly, you’d guess that this might be too much stimulation for her too quickly, but when you try to back off, the red myr’s legs hold you in place. <i>“Aaahhh, keep going, Steele. I’m a </i>SSSSS-AH!<i>oldier. I can handle MUCH mo</i>OOOOH<i>re than this! Besides, I </i>nNNNnh<i>ever ordered you to stop. Now fucking EAT ME!”</i> Between her lurid vocalizations, Sellera’s tone is aggressive and sultry, and her slit is leaking a small pool of fragrant femlube under her muscular butt. The way her pussy spasms and clenches when you probe just the very tip of your tongue into it, you’d almost think she was about to...");
	output("\n\n<i>“FUCK!”</i> The normally-reserved officer shocks you with the intensity and suddenness of her orgasm. Instantly, you feel a chitinous hand on your head, mashing your face into its mistress’s cumming cunt just in time for a ribbon of sweet, alien femspunk to squirt into your open mouth, leaving you coughing and sputtering in surprise. Sellera gasps and grunts as she mercilessly grinds her hairy mound into your face, crushing your nose and [pc.lipsChaste] with her rock-hard clitoris and spasming vulva, squirting her liquid ecstasy into your open mouth with each world-shaking buck of her hips, and smearing her cunt liquor all over your face. At this moment you are nothing more than a sex toy to the myr woman. You aren’t [pc.name] Steele, just the cunt-pleaser she keeps under her desk to use whenever she needs- no, <i>wants.</i> In spite, or perhaps because, of the rough treatment you’re being subjected to, you shiver with delight," + pc.cockAndVagina(" your [pc.cocks] rocketing to full hardness", " your [pc.cunts] overflowing") + " at the thought of your utterly submissive position.");
	output("\n\nSellera’s orgasm is lengthy enough for you to grow light-headed before your face is finally freed from the fleshy prison of the marshal’s crotch. You cough and wheeze pathetically, trying to expel Sellera’s femcum from your windpipe and pull air into your lungs at the same time. When you can finally draw a clear breath, you gasp for air, every breath you take absolutely reeking with the carnal, alien smell of Sellera’s pussy juice. Once your sense begins to return to you, you realize that the smell is actually intensifying. The myr woman is subtly rubbing her toned thighs together, producing a barely-audible <i>squishsquish</i> of her juices with each movement of flesh on flesh, her arousal only growing after already cumming. Apparently the predicament her ejaculation and rough treatment forced you into just made her even hornier!");

	addButton(0, "Next", selleraWarActuallyTastesALotLikePussy);
}

public function selleraWarActuallyTastesALotLikePussy():void
{
	clearMenu();
	clearOutput();
	selleraHeader();
	author("Night Trap");
	processTime(20+rand(16));
	pc.lust(30+pc.libido()*3/8);

	output("Though you certainly still feel breathless, you are no longer audibly gasping, and that’s all the show of readiness that Sellera needs to wrap both of her chitin-clad legs around your back and drag you into her sloppy slit again. Your [pc.lipsChaste] close just in time to prevent you from taking in another lungful of myr nectar, but your nose is almost painfully mashed into the veteran soldier’s bullet-like clitoris. You reflexively try to pull away for a moment, but your hypoxic muscles are no match for the ant woman’s steely legs. Your movements do manage to excite Sellera however, as you unintentionally pull back the hood of her clitoris, stimulating the hyper-sensitized pearl beneath. Each time you do, her hips buck into your face involuntarily, and she gasps loudly in pleasure, the sound muffled by her twitching thighs.");
	output("\n\nIt finally dawns on you that you won’t be able to escape until you satisfy Sellera, something that promises to be no easy task. With retreat cut off, your only option is to press the attack, so you dive into Sellera’s pussy with all the energy you can muster.");

	// Red Myr venom:
	if (pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED))
	{
		output("\n\nIt’s time for the big guns, so you unleash your secret weapon, focusing for a moment so that your saliva gradually becomes perverted with aphrodisiac venom. You lick the inside of your mouth to gather the infernal stuff on your [pc.tongue] before thrusting your muscle out to slather your venom directly on Sellera’s clitoris. The effect is immediate. The field marshal drops all pretenses of continuing her work to instead grab the back of your head with both hands. You know what’s coming as soon as you feel her clenching at you, but you can’t possibly be prepared for it: Sellera lets out a string of profanities and invectives and creams all over your face, squirting nearly twice as much femcum as before. There’s so much of the stuff that it gets into your sinuses, stinging slightly and rendering you unable to smell anything at all other than Sellera’s ecstasy.");
		if (pc.hasHair() || pc.hasBeard())
		{
			output(" The slippery stuff even gets in your");
			if (pc.hasHair())
			{
				output(" [pc.hair]");
				if (pc.hasBeard()) output(" and");
			}
			if (pc.hasBeard()) output(" [pc.beard]");
			output(", marking your debauched activities for all to see until you can get a shower.");
		}
		output("\n\nThankfully, you manage to stymy your coughing fit, leaving you free to focus on swallowing down as much of the hysteric flood as you can. The excess splatters wetly off of your [pc.lipsChaste] to pour onto your " + (pc.isChestCovered() ? "[pc.upperGarment]" : "bare [pc.skinFurScales]") + ". Sellera frantically bucks her hips into your face, her motions now wild enough that she sometimes bangs her chitinous knees into the underside of her desk and carrying the back of your head dangerously close to crashing into hard surface. You gamely stick to your original plan, gathering up more of your venom before jamming your [pc.tongue] into the field marshal’s still-squirting slit.");
		output("\n\nWere it not for her incredible wetness, the orgasmic contractions of Sellera’s box would be milking your aphrodisiac-drenched muscle like a dairy cow. The myr woman’s excess moisture is a double blessing for you, as it not only prevents your [pc.tongue] from being captured, but also transmits your fiendish venom directly into the tender walls of her pussy. You paint Sellera’s clenching folds with more of your lust-inducing saliva in a blitz of desperate licks and swirls of your tongue. As your venom seeps into her blood, the field marshal’s hair trigger refractory rate diminishes further and further until it seems like every other lick has her squirting and shrieking breathless warnings not to stop.");
		output("\n\nBit by bit, your campaign of overstimulation brings you relief. First, Sellera’s legs become too nerveless to continue crushing your head. Then the tide of her ejaculate wanes to a trickle. Finally, when you begin to worry the officer’s shouting is going to draw her subordinates outside, she looses a bestial scream more like a roar before collapsing forward on her desk in exhaustion. Sellera releases your head as she does, her chitinous limbs barely obeying her after how much stimulation her nervous system has just endured.");

		pc.applyPussyDrenched();
	}
	// Normal tongue and no venom:
	else
	{
		output("\n\nYou stick your [pc.tongue] out and press it into the very bottom of the myr woman’s slit before licking <i>hard</i> all the way up to her clitty, where you slip your tip under her hood, swirling your oral appendage around the incredibly sensitive bundle of nerves as quickly as you can. Even as muffled as your hearing is, the sound of a choked-off scream of pleasure still reaches your ears; you’d guess Sellera just crammed her fist into her mouth to silence herself. You intensify the motions of your tongue for a moment before withdrawing to grab Sellera’s tender bud with your teeth, biting down softly and tugging on the fleshy protrusion until the woman it’s attached to wraps her twitching legs around your ears and humps your face even harder than before.");
		output("\n\nSellera’s thick pubic hair is absolutely soaked in her orgasmic fluids, and the bashing of her crotch into your skull smears the slippery stuff all over your face, the musky fluids unmistakably branding you as a servile rug muncher. The tactile sensation is so different from a shaved woman’s, so primally feminine, that it just ratchets up your own lusts to dizzying levels. Without the ability to pleasure yourself, you resign yourself to getting your superior off, trying to gain some vicarious enjoyment for yourself in the process. With that in mind, you switch back to polishing Sellera’s button. There’s no scream this time, and the twitching of her lower half slows down a bit, and even when you switch back to using your teeth, Sellera continues to slowly quiet down. She still involuntarily bucks her hips and spasms in over-stimulated bliss from the waist down, but somehow, she seems to be adjusting to the overwhelming stimulation you’re supplying her.");
		output("\n\nSoon her thighs release their grip on your head somewhat, and not too long after that, you hear papers shuffling on Sellera’s desk. She’s actually managing to do her work! The only sign that she’s even feeling anything below the waist aside from her involuntary twitches is her heavy breathing and the increasing flow of juices from her slit. You’re absolutely punishing her clitoris, and she’s just filling out paperwork, denying you even the satisfaction of her pleasured noises. You pout internally as you’re forced to munch her muff in near-silence.");
		output("\n\nBefore you can grow too disappointed, another ribbon of femcum splatters into your face without warning, and Sellera’s hand mercilessly returns to your head with its iron grip to grind her unshaved womanhood into you. The field marshal fucks your face yet again as she squirts more of her carnal fluids onto you, but this time you manage to open your mouth and drink down the remainder of her ejaculate, as much to save yourself from choking again as out of any desire to please. Nevertheless, you delight in the flavor of her ladyjizz, partly from the taste but even moreso from the proof that you really are pleasuring Sellera. The comparatively relaxed behavior of the last several minutes left you doubting yourself, but now that self-doubt evaporates like fog before the morning sun.");
		output("\n\nSellera’s hand does not leave your head even as her hips still, but your enthusiasm has been bolstered enough that you don’t mind being denied a break. She moves her hand back to her paperwork when you signal your understanding by moving your [pc.tongue] downwards and thrusting it into her still-spasming pussy. Your reward is a brief <i>“hhmmmm”</i> of pleasure from Sellera, and the sound to you now is worth more than any medal. You’re fully immersed in your role as the field marshal’s personal cunt-pleaser, and her sigh lets you know you’re serving your superior well.");
		output("\n\nWith your morale soaring, you thrust your [pc.tongue] as deeply into Sellera’s pussy as you can, mashing your lips into her labia with a symphony of luridly-wet noises. The walls of her tunnel are utterly slathered in cunny honey, but, undaunted, you do your damndest to lap up every drop of it you can, loving the taste and thrilling at the way her velvety folds clench at your tongue whenever you hit a sweet spot. The muscles of Sellera’s " + (silly ? "vagoo" : "pussy") + " are as strong as the rest of her, and they grasp your intruding [pc.tongue] like a vice. It actually hurts a bit, but you soldier on through the pain for well over a quarter of an hour.");
		output("\n\nWith your oral appendage buried in Sellera’s cunt, you’re finally able to perceive some sign that she’s about to cream all over your face. The twitching and spasming of her walls ratchets up in frequency and intensity until the smooth muscles launch into a series of rhythmic contractions that feel like they’re trying to crush your tongue. You yelp in pain as your [pc.tongue] is pulled as deep into Sellera’s pussy as it can reach, which holds your mouth open just in time for the tide of femcum that floods past your [pc.lipsChaste]. It’s difficult to swallow with your tongue hyperextended, so much of Sellera’s ecstasy simply spills out of your mouth to stain your " + (pc.isNude() ? "[pc.skinFurScales]" : (pc.hasArmor() ? "[pc.armor]" : "[pc.gear]")) + " in a musky, feminine cascade. As you’ve come to expect, Sellera’s hand latches onto the back of your head, and she fucks your tongue and face with no regard for your comfort. By this point though, you relish her abuses, as each furious pounding of her sopping box against your [pc.lipsChaste] feels more like a 21 gun salute to your service.");
		output("\n\nYou don’t need her hand or thighs to keep you working anymore. All this pussy eating just keeps making your hornier, and you’ve now begun using your tongue like a conductor for your own lusts, transferring your unbearable arousal into Sellera’s pussy like a lightning rod transferring a bolt into the ground. The rough treatment abates as the field marshal focuses on her paperwork, only returning when you push her to the heights of pleasure yet again. This pattern continues until your world contracts to little more than scarlet thighs, spasming cunny, and the taste, smell, and feeling of femcum in your mouth. You’re almost sad when Sellera creams your tongue one last time, her ejaculate now barely a trickle, and pushes your head away from her twitching mound.");
	}

	addButton(0, "Next", selleraTheSinewsOfCunnilingusArePitifulMoney);
}

public function selleraTheSinewsOfCunnilingusArePitifulMoney():void
{
	clearMenu();
	clearOutput();
	selleraHeader();
	author("Night Trap");
	processTime(3+rand(3));

	output("You shake your head to clear your thoughts, unintentionally slinging strands of cunny honey onto your temporary commander’s thighs as you do so. As soon as you begin to extract yourself from beneath the field marshal’s desk, a sharp order catches you by surprise. <i>“I said I wouldn’t wait for your mess to be cleaned up, Steele. Do it yourself.”</i>");
	output("\n\nIt takes you a moment to realize what she means, but as soon as you do, you obediently spring into action. Your exhausted [pc.tongue] darts out once more to lap up the tangy juices you slung on Sellera’s crimson flesh. You even go above and beyond and move in to clean up the myr woman’s pussy. She gasps softly at your delicate touches so close to her over-sensitized womanhood, and she practically purrs when she feels your [pc.tongue] spit-shining her vulva.");
	output("\n\nBy the time you’re finished, Sellera is trickling her renewed excitement into the large puddle of girlspunk under her butt. Not wanting to give her the chance to press you back into service, you beat a hasty retreat and stand on your stiff [pc.legs] once more. The myr woman laughs when she sees your stricken face, utterly plastered in her alien femspunk. When she reigns herself in though, her smile is wry, but surprisingly warm.");
	output("\n\n<i>“I think I’d say you’ve served with distinction, Steele. The Scarlet Federation and its peoples thank you for your service.”</i> Sellera stands up as she speaks, her legs still a bit shaky. She makes her way over to her liquor cabinet with a spring in her step, somehow energized rather than tired. She’s careful to keep her skirt hiked up above her hips, affording you a fantastic view of her sculpted ass. Her crimson buttocks glint in the light, and you realize that her cheeks are utterly drenched in her juices, all thanks to you. The marshal bends over at the waist to retrieve her chosen bottle, momentarily presenting her soaked backside. You groan as the sight of her back door and the puffy, dripping slit below it reminds you of your own unattended arousal.");
	output("\n\nSellera hums at the sound you make and stands up again before pouring herself a drink. She regards you with that same vaguely affectionate smirk as before, naked from the waist down and dripping her own juices, but somehow no less commanding for it. <i>“You can collect your reward on your way out. I hope you volunteer to serve the Federation again soon.”</i>");
	output("\n\nYou groan again and say your farewells. The guards outside are true professionals, showing absolutely no sign of having heard anything. One of them hands you a towel to wipe their commander’s ejaculate off your face. She accepts it from you with the same impassivity as always when you’ve cleaned yourself up as much as possible before handing you a small credit chit. <i>“The Scarlet Federation thanks you again,”</i> she explains before saluting. The other guard mirrors her comrade, obviously dismissing you in as respectful a way as possible.");
	output("\n\nYou wearily return their salute, still finding the whole situation a little surreal. The red myr may seem puritanical in comparison to the golds, but you’ve obviously just found a place you can tap into those repressed lusts. You pocket the credit chit and make your way outside again, escorted by two more guards who have come to meet you. Your");
	if (pc.hasCock()) output(" [pc.cocks] still " + (pc.hasCocks() ? "ache" : "aches"));
	else if (pc.hasVagina()) output(" [pc.vaginas] still " + (pc.hasVaginas() ? "ache" : "aches"));
	else output(" [pc.asshole] still aches");
	output(" painfully with need. Maybe " + (pc.hasCock() ? "next time the field marshal can" : "if you had a dick next time the field marshal could") + " find a more mutually enjoyable way for you to serve?");

	pc.shower();

	var reward:int = 25+rand(51);
	reward *= 10;
	pc.credits += reward;
	output("\n\n<b>+" + reward + " credits!</b>");

	IncrementFlag("SELLERA_SERVICED");

	addButton(0, "Next", move, "834");
}

public function selleraRalliesHerTroopsToFuckYou():void
{
	clearMenu();
	clearOutput();
	selleraHeader();
	author("Night Trap");
	pc.lust(10+pc.libido()/8);
	processTime(15+rand(11));

	var x:int = pc.biggestCockIndex();

	output("If cock is what’s needed, you’re happy to provide it. You’re ready to satisfy any officers who have earned the chance.");
	output("\n\nSellera laughs at your answer, a derisive laugh that sounds like it’s at your expense. <i>“Well, Steele, I’m impressed with your selflessness. Let’s not waste any time then.”</i> After retrieving a sheet of paper from a drawer in her desk she stands up from her seat and walks out of her office, giving you no more than a sideways glance to indicate you should follow her.");
	output("\n\nThe guards outside salute her immediately, and she hands the paper to one of them. <i>“Tell everyone on this list who is not currently performing essential duties to report to the bedchambers, immediately. I’ll be preparing their reward myself.”</i> Your pulse quickens at Sellera’s words, but you have no time to ruminate on them. She resumes walking at a brisk pace, and you follow closely behind. You’re lead up the elevator and through most of the rest of the mansion until you finally arrive at your destination.");
	output("\n\nYou glance around the room you’ve been lead to. It’s a palatial bedchamber, sized for a gold myr queen. Most of the decorations and furnishings have been removed at this point, but what little remains can only be described as ostentatious. You’re not entirely familiar with what materials are rare on Myrellion, but even so, you can surmise that everything in this room is rare, exotic, difficult to produce, or all three. This is unmistakably a room fit for royalty.");
	output("\n\n<i>“Nauseating, isn’t it?”</i> Sellera practically spits while you’re still looking around. You’re taken aback at the figurative venom in her tone, and she elaborates, <i>“All this wealth, and what was done with it? Squandered on decadence and hedonism. The former queen may have had most of her favorite things sent away before we took this place, but she left a small mountain of sexual paraphernalia. Even up to her last days here she was still hosting regular orgies. Fitting then for our purposes. Strip.”</i> She barks the command at you and stares a hole through you until you realize she just gave you an order.");
	output("\n\nYou’re already mostly hard in anticipation of the coming storm of sex, but you hastily remove " + (pc.isNude() ? "what little" : "all of the") + " equipment you’re wearing, soon standing completely nude in front of the field marshal. She eyes you up and down for a moment with obvious judgement before");
	if (pc.cocks[x].cLength() < 5) output(" she frowns slightly. <i>“My intelligence reports indicated the majority of you aliens were exceedingly well-endowed. Well, no matter. These women are all starved for real cock. They’ll take whatever they can get, and the experienced ones will at least appreciate how little time it will take to adjust to insertion.");
	else if (pc.cocks[x].cLength() < 10) output(" she gives an approving nod. <i>“Excellent. That’s the ideal size for an experienced myr woman. Not so big she needs time adjusting to insertion, not so small it can’t scratch all her itches.");
	else output(" she unconsciously licks her lips, then surprises you with a slight frown. <i>“This is almost too big for our purposes. Most of these women don’t even have time to use their fingers to please themselves, much less a sizeable toy. Thankfully we have plenty of lube on hand to make for quicker penetration. Hopefully they don’t lose too much time adjusting to such a large insertion.");
	output(" And of course the rest of you is exotic enough to compensate for any shortcomings in your equipment.”</i>");
	output("\n\nYou feel more than a little degraded to be sized up like a piece of meat, but any retort you might have in store is silenced by what the stern field marshal has in store for you next. She suddenly closes the distance between you and drops to her knees. Without a word she licks your [pc.cock " + x + "] from your " + (pc.balls > 0 ? "[pc.sack]" : "[pc.knot " + x + "]") + " to your [pc.cockHead " + x + "], a slow, sloppy lick that leaves behind a generous amount of aphrodisiac venom.");
	output("\n\nIt’s overwhelming to have it applied directly to your genitals like this, and you moan at the incredible sensation. When Sellera’s lips engulf your upper length and her tongue swirls around your [pc.cockHead " + x + "], you involuntarily buck your hips. Or rather you try to. Your movements are stymied by the myr woman’s powerful grip on your sides, and your attempt to push her head into your crotch is equally futile. You rocket to a painful hardness in seconds, and");
	if (pc.balls > 0) output(" when you feel her chitinous fingers gently squeeze your [pc.sack]");
	output(" your manhood soon throbs as you spurt a sizeable glob of precum directly into Sellera’s mouth.");
	output("\n\nAs soon she tastes your [pc.cumFlavor] flavor on her tongue she unceremoniously ends the impromptu blowjob and returns to her feet. When she gulps several seconds later and sighs softly you realize she was actually savoring your precum! You think better than to say anything about it, and wait patiently as the eager fellatrix produces a handkerchief and wipes her venomous saliva off of your length and the corners of her mouth. <i>“Lie on the bed, near side.”</i>");
	output("\n\nOnce again, the curt order comes out of nowhere. Thankfully you’re more prepared for it this time, but the aching hardness of your erection does make your gait more than a little awkward. It’s hard not to relax on the massive, luxurious bed, and as you idly ponder how such a low-tech world could make something so comfortable, Sellera retrieves an item from a nearby chest of drawers and swiftly moves to the bedside.");
	if (flags["SELLERA_GANGBANGED"] == undefined)
	{
		output("\n\nThere’s a small glass bottle in her hand, which she removes the stopper from as she explains, <i>“I certainly hope you realize what it is you’ve signed up for. This is in no way about your pleasure. In fact, you’re not even allowed to cum. You are here to please my most loyal and competent subordinates. They are to be the focus of all your attention.”</i>	");
		output("\n\nYou look at her with a stunned expression. You’re not allowed to cum?");
		output("\n\nShe grins at your reaction, and from her tone she’s obviously turned on by the thought. <i>“That’s correct. We’re not making eggs here, Steele. This is purely about pleasure, not reproduction. If you wanted to seed a fertile womb you should’ve signed up for the breeding service. Don’t worry though, the former queen left plenty of tools that will make your task easier. If you don’t have the stamina to service dozens of pent-up, sexually-frustrated women without cumming in any of them, we have ways to make sure you don’t blow your load. Like this for instance.”</i>");
		output("\n\nShe pours the contents of the bottle into her free hand, which she then uses to coat your [pc.cock " + x + "]. It’s an oily substance, probably some sort of lubricant, and you gasp as the cool liquid makes contact with your venom-sensitized shaft. Initially you roll your head back and groan from the pleasure of Sellera’s touch, but the sensation quickly fades to barely more than a tickle. You look down, wondering why she’s suddenly teasing you, only to realize that the oil has numbed your dick! Sellera doesn’t even stop you when you buck your hips into her vice-like grip, obviously enjoying your disappointment when the movement barely produces any sensation.");
		output("\n\n<i>“Don’t worry about your partners’ pleasure. That oil will dry up in a few seconds, but it should leave you numb for a few hours. Fortunately for me it can’t permeate chitin. My girls should be here any moment now, so do try to make it good for them.");
		if (pc.hasKnot(x)) output(" And make certain you don’t knot any of them. We’re on a tight schedule.");
	}
	else
	{
		output("\n\nShe applies the same numbing oil from last time to your [pc.cock " + x + "], and though you know now you’ll be grateful for it, you still can’t help but feel a bit wistful as sensation almost completely fades from your manhood.");
		output("\n\nThe scarlet domme chides you. <i>“Man up, Steele. You know this is for your benefit. My girls should be here any moment now, so do try to make it good for them.");
		if (pc.hasKnot(x)) output(" And just to remind you: make certain you don’t knot any of them. We’re always on a tight schedule.");
	}
	output("”</i>");
	output("\n\nJust as predicted, the door opens, and a long line of red myr women trickles in. Most of the women at the front of the line are dressed in uniforms that clearly denote them as officers of very high rank. The further down the line you look the lower the average rank seems to become. The women all stand at attention until, once the last one has entered and closed the door, Sellera orders them at ease. <i>“Relax and let your hair down, ladies. Each and every one of you here today has distinguished yourself in one way or another, and you’ve all proven yourselves loyal servants of our great federation. As you all know, I value loyalty and ability above all else, and I richly reward the most loyal and able of my subordinates. So for your reward today, I’ve brought you something to help you scratch that certain itch every red-blooded woman has: a " + pc.mf("handsome", "beautiful") + " alien drone!”</i>");
	output("\n\nA few of the soldiers had been glancing at you from time to time ever since they entered the room, but now the entire group turns their attention to you at once, clapping, cheering, whistling, and catcalling you. It’s fairly demeaning, but knowing that you’re going to sheathe your dick in every one of these women in the next few hours is also fairly exciting. Your [pc.cock " + x + "] twitches and leaks a strand of pre " + (pc.exhibitionism() < 50 ? "in spite of the degrading treatment." : "simply from all the eyes on your naked body; the degrading treatment is just icing on the cake.") + " Your cock’s timing could hardly have been more perfect, as this display of your readiness drives the women wild, to the point that Sellera has to calm them down again.");
	output("\n\n<i>“Alright, girls, show some discipline. Keep it quiet for now. You can make all the noise you want when it’s your turn with your reward here, and I encourage you to do so. Let every soldier in Kressia know the rewards she can expect for exemplary service. Until then though, get ahold of yourselves.”</i> The soldiers fall silent and return to order the moment the field marshal opens her mouth, and they listen raptly to every word she says. They look every bit the disciplined veterans, until Sellera adds with a thin smile, <i>“Oh, and get naked too.”</i>");
	output("\n\nIn an instant the cheering resumes, though to their credit it’s less raucous this time. It also dies down quickly, as the women are soon preoccupied with disrobing as quickly as possible. Over the span of barely more than a minute the soldiers relieve themselves of their uniforms, undressing with a speed made all the more impressive by its orderliness. Each woman carefully folds her clothes and arranges them in a neat stack against the wall before returning to her place in line.");
	output("\n\nAs would be expected of a group of soldiers, every myr body in the room is lean and toned. Most of the women here seem quite young, even some of the higher ranking officers. Many of them look to be barely out of their teens, and their bodies show it: while battle scars are in no short supply, their skin is otherwise unblemished, and despite being mostly of modest size their breasts are perky and high.");
	output("\n\nWhat surprises you is that some of the women here look to be older than Sellera, a few of them by a fair bit. These middle-aged officers are exclusively of the highest ranks, and they’re also among the most buxom of red myr you’ve seen. They clearly eat better and exert themselves less than their subordinates, as their breasts, butts, and thighs are almost all larger. A few are outright MILFs, with wide hips and heavy breasts capped with larger, darker nipples that clearly indicate motherhood. That being said, they’re all still in excellent shape, and their narrow waistlines emphasize their hips all the more.");
	output("\n\nBy the time all the soldiers are completely nude, their arousal is becoming more apparent. Those more comfortable with sex are already warming themselves or their close friends up, and you see many chitinous hands squeezing scarlet breasts or teasing crimson slits. Some of the women are clearly in relationships, as they kiss each other with undisguised passion, envenoming and caressing each other so that their thighs are slick in a matter of moments. It’s frankly a scene out of a porno, and you unthinkingly move a hand towards your throbbing hardness to sate your painful arousal.");
	output("\n\nThe crowd of women notice this immediately, and they all turn their attention to you as you begin stroking your [pc.cock " + x + "]. They clap and cheer, egging you on, but it doesn’t matter. " + (pc.exhibitionism() < 50 ? "Even if you weren’t humiliated to be on display like this, your cock is almost totally numb." : "Even though this is exactly the sort of situation you have wet dreams about, your cock is almost totally numb.") + " You groan in frustration, redoubling your efforts, but you barely feel anything even when you use both hands. When you start thrusting your [pc.hips] up into your doubled grip out of sheer desperation, the room practically explodes with whistles, applause, and vulgar shouts directed at you. The soldiers apparently think you’re putting on a show for them!");
	output("\n\nYou barely even notice all this until the room suddenly falls silence once more and you feel the cold touch of Sellera’s insectile hand on your wrist. <i>“That’s enough, drone! It was an excellent opening act, but you’ll need to save your strength for the main event. It’s time for General-Lieutenant Anka to break you in for the rest of these girls.”</i> The field marshal’s tone is convivial, but there’s a sadistic glint in her eyes even as she speaks more to the room than to you, giving you the feeling you’re about to get more than you bargained for.");
	
	addButton(0, "Next", selleraSharesACockWithHerColony, x);
}

public function selleraSharesACockWithHerColony(x:int):void
{
	clearMenu();
	clearOutput();
	selleraHeader();
	author("Night Trap");
	pc.lust(30+pc.libido()*3/8);
	processTime(15+rand(11));

	output("Your heart hammers in your chest from equal parts arousal and nervousness as the tall, matronly myr at the front of the line steps toward the bed. Her shoulder-length hair is streaked with grey, though the hair on her plump pubic mound is still solid black and only barely trimmed. Anka’s face is lined with years and stress, but she is in far better shape than her age might indicate. Under her weighty breasts is a tight, flat middle that naturally draws the eye down to the delta of her womanhood. Her bush mostly conceals her treasure, but it certainly doesn’t obscure her meaty thighs as she strides toward you.");
	output("\n\nThe general smirks as she notices your stare, and sways her fertile hips sensually with her last few steps. Her subordinates laugh, and a few cheer her on with cries of <i>“Save some for us, General-Lieutenant!”</i> or <i>“Show this alien what ‘Anka the Anchor’ can do, ma’am!”</i>");
	output("\n\n<i>“The Anchor”</i> salutes Field Marshal Sellera with a grin a mile wide. Her commander immediately returns the salute and the grin, speaking to her in a quiet tone, <i>“Most women would chafe at answering to someone younger than them, but you’ve been my most loyal subordinate, Anka. You deserve every second of this. Now teach all these girls how to properly fuck a drone.”</i>");
	output("\n\n<i>“Yes, ma’am!”</i> Anka laughs as she climbs onto the bed and positions herself over you. She plants her knees on either side of you before lowering her hips until her plush mound is just barely touching your [pc.cockHead " + x + "]. The general rubs the head of your dick along the length of her vulva, rubbing your tip into her clit with a sigh until she deems herself ready. Though you don’t really feel anything, you still moan under her, desperate to find out if you’ll at least feel <i>something</i> from proper intercourse.");
	output("\n\nThe myr woman slides your glans back down to her entrance, throwing her head back and letting out a soft sigh as the underside of your [pc.cockHead " + x + "] just barely parts her meaty vulva. Anka demonstrates her abundant sexual experience just a moment later: you’re so desperate for stimulation that the temptation to thrust up and pierce her folds is overwhelming, but a split second before you can rock your [pc.hips] into her the myr milf plants a powerful hand on your belly and pins you to the bed. She stares back down at you with a teasing smirk. <i>“Not without my orders, [pc.boyGirl],”</i> she purrs. <i>“There’s plenty of time for that in the next half hour.”</i>");
	if (pc.hasCockFlag(GLOBAL.FLAG_TAPERED, x)) output("\n\nThanks to the tapered shape of your cock, it’s easy for Anka to slide all the way down to your [pc.knot], " + (pc.cLength(x) < 5 ? "especially given how short you are." : "even in spite of your considerable length."));
	else if (pc.hasCockFlag(GLOBAL.FLAG_BLUNT, x) || pc.hasCockFlag(GLOBAL.FLAG_FLARED, x)) output("\n\nWith a cockhead like yours, it’s not easy for Anka to actually penetrate herself, " + (pc.cLength(x) < 5 ? "but once she does your modest length is easy for her to swallow to the [pc.knot]." : "and even after she does, there’s still the rest of your considerable length to swallow before she finally reaches your [pc.knot]."));
	output(" Once she’s bottomed out she releases a long, breathy sigh before glancing over at Sellera and muttering in a husky voice, <i>“You can start the clock.”</i>");
	pc.cockChange();
	output("\n\nThe field marshal nods and reaches into her coat, producing a small pocket watch and noting the time with a curt nod before addressing you in a stern tone. <i>“Don’t just lie there like a corpse. Good drones please their partner even when she’s riding them into the dirt.”</i>");
	output("\n\nYou swallow your exasperated groan before it escapes you, but you can’t hide the effect the verbal abuse has on your dick. Anka gasps in delight as she feels your length twitch inside her, her lined face contorting into a wicked grin. <i>“Well, you’re quite the whore, aren’t you?”</i> the general purrs as she rolls her generous hips slowly, grinding the full length of your [pc.cock " + x + "] through her folds to savor every inch of dickflesh she can. <i>“Mmmm, I’ve got a real soft spot for eager sluts. There’s nothing like a [pc.boyGirl] who knows [pc.hisHer] place in the world: on [pc.hisHer] back under a woman.”</i>");
	output("\n\nWanting to obey Sellera and possibly quiet Anka in the process, you begin feeling for the general’s clitoris. Her vulva is as plump as her thighs, and her thick pubic hair does nothing to help in your search, but you’re not one to give up so easily. You paw at Anka’s crotch for a few long moments, an embarrassed blush growing on your face under the older woman’s smug smirk as she continues grinding your cock around her velvety folds. Suddenly her fertile hips twitch, and she gasps, signalling that you’ve found your target.");
	output("\n\nAs you continue thumbing the general’s love button, her pussy clenches and grips you tight enough to feel pleasant even in your numbed condition. Given the natural strength of all myr, it’s no wonder a veteran would have a particularly powerful set of vaginal muscles, and you have no doubt that if your nerves weren’t all but defunct this tightness would be painful. Mercifully for you, the oil Sellera applied to you and the surprising volume of pussy juice that Anka is producing faster with every rub of her clit allow for pure pleasure when the myr MILF finally raises her hips.");
	output("\n\nShe moans her appreciation of your caresses as she unsheathes more of your length at a torturously slow pace until only your very tip remains inside her. You can see your [pc.cockColor " + x + "] cock glinting with her feminine moisture, and more than a few voices in the small crowd comment on this. It’s barely noticeable to you at this point. Your attention is entirely on Anka and her pleasure, and the pleasure she can give you in turn.");
	output("\n\nYou’re so focused that it surprises you when the general places her hand atop yours and stills it. Nonplussed, you glance up at her, only to be met by another smug grin. <i>“Not bad by half, [pc.boyGirl], but I think I’d better handle this task myself. I’ve got a different assignment for you.”</i> With an irresistible grip on your hands, the milfy myr spends a few seconds guiding your fingers across the hard nub of her clit, swollen and sensitive enough that she gasps softly even from these simple touches. With a warm smile, she guides your hands up to cup her heavy breasts.");
	output("\n\nYou expect Anka to begin stroking herself, but she surprises you by dropping her full weight onto you, landing hard enough to bounce both of you on the soft mattress and produce an incredibly vulgar sound from her slit. You cry out in shock at the sudden stimulation, grasping at the sheets and bucking your hips in reflex. The general groans and rolls her own hips into you, her pussy spasming for a moment around the neglected shaft of your [pc.cock " + x + "].");
	output("\n\nShe recovers far faster than you, as while you’re still reeling, she pats you roughly on the cheek until you come back to your senses. Once you do, Anka glares down and chides you in a harsh tone, <i>“I didn’t say stop, [pc.boyGirl]! What happened to that eager slut I saw earlier? I’ve only got so much time, and if you can’t work my clit properly, you’re going to support my breasts so I can fuck you fast enough to get off. Is that understood?”</i> As soon as you nod your comprehension, her smile returns in an instant. <i>“Good. Now let’s see if your cock is worth these girls’ time.”</i>");
	output("\n\nAnka grabs your hands and returns them to her chest, slipping her own touch down to her clit before raising herself once more. Her sizeable ass slaps against your [pc.thighs] like before, but by now the buxom myr is wet enough that even small movements produce a wet <i>shlick</i>, so when she spears herself on your cock this time, it’s much louder. There’s very little buildup; the first few penetrations are slow enough, but each bounce comes much faster than the last until Anka is fucking you at a blistering pace.");
	output("\n\nEven as numb as you are, you can’t help but gasp in delight. This rough, wet coupling is exactly what you wanted after all the teasing and denial you’ve had to endure. If anything, your reduced sensitivity makes this more enjoyable. If you could feel everything like you normally would, you’d most likely be in no small amount of pain, and you’d doubtless have already cum. As you are now though, being used like you’re a rented dildo is heaven.");
	output("\n\nYour fingers sink into the wonderful softness of Anka’s motherly tits without thought, and she demonstrates her appreciation by pressing her chest into your touch. Her moans grow in both frequency and volume as she rides you, stroking her love button with ever greater speed, shouting with joy whenever she feels your dick twitch inside her.");
	output("\n\nJust as you’re beginning to pulse out pre-cum with greater frequency, the MILF general doubles over, blinding you with a faceful of myr mammaries while her hips buck into your crotch at an alarming speed. Her muscled arm is pinned between you, frantically jilling herself off until her whole body tenses. With a shriek, General-Lieutenant Anka creams your cock like a madwoman. She squirts all over your dick, her femcum gushing down your " + (pc.balls > 0 ? "balls" : "taint") + " as her pussy spasms wildly, its powerful muscles wringing every inch of your manhood with slippery tightness, milking your breeding rod for cum you sadly just can’t give.");
	output("\n\nYou grip the sheets and clench your teeth, trying to master yourself. Your dick throbs several times, leaking thick globs of creamy precum perilously close to orgasm, but you somehow manage to stave it off by the end of Anka’s climax. Both of you lie there for a while, sweaty and gasping for breath. You’re more than grateful for the respite: once Anka’s pussy stops clenching at random, you’re able to come down from your edge.");
	output("\n\nAfter she returns to a vertical position, the general can see your struggle etched on your face, and she smirks at you, though she does seem impressed. <i>“That was good, damn good,”</i> she gasps, still breathing hard. <i>“Field Marshal Sellera has always known talent when she sees it: you’re not just a slut, you’re a consummate whore.”</i>");
	output("\n\nThe field marshal herself chimes in, her tone not at all sounding like she just watched her subordinate squirting all over an alien’s cock. <i>“Ten minutes left, General-Lieutenant. I’m sure you can find a better use for them than flattering me.”</i>");
	output("\n\nAnka flashes you a hungry grin before responding to Sellera, <i>“Of course, ma’am. I know just what I’m going to do.”</i> The general slowly lifts herself off of your abused [pc.cock " + x + "], sighing heavily as she does. Your femcum-drenched cock slips fully out of Anka’s pussy for the first time in what feels like an eternity, but it doesn’t stay free for long. The scarlet officer turns around in the bed, presenting her hefty behind to you as she takes a moment to drag her dripping slit along the underside of your shaft, hissing through her teeth at the feeling of her throbbing love button grinding into your cock.");
	output("\n\nThe general is perfectly aware of how short her remaining time is however, and she quickly dispenses with teasing herself. She mounts your [pc.cock " + x + "] with swift, precise movements that betray her considerable experience, releasing a soft moan as her primed cunt swallows your rod, her puffy vulva squishing hungrily against your [pc.knot]. Anka adjusts in seconds, but rather than bouncing on your dick as she did earlier, she presses herself even harder into you, sighing at the feeling of your [pc.cockHead " + x + "] plumbing previously untouched depths.");
	output("\n\nSmirking at you over her shoulder, the myr MILF begins to roll her fertile hips left and right, her considerable wetness " + (silly ? "sounding like a bowl of fresh pasta being stirred" : "causing a lurid symphony of squelches and schlicks in the process") + ". <i>“Are you enjoying the view, whore? Mmmmm... I am certainly enjoying the ride. I don’t get to fuck a- </i>haaaaa<i>-");
	if (pc.cLength(x) < 4) output(" cute little");
	else if (pc.cLength(x) < 11) output(" real");
	else output(" huge");
	output(" cock like this every day, you know. None of these girls do. That’s why I’m going to savor it... </i>oooohhh yeeeessss!<i> I’m going to grind it into every single nook and cranny, nice and </i>deeeeeep!<i>”</i>");
	output("\n\nAnka’s head lolls back with her last word, which dissolves into a throaty moan as she begins stroking her clit in full view of her subordinates. The general continues to gyrate on your tool, providing you an entrancing view of her thick thighs and brawny butt. This is your first chance to really savor Anka’s backside, and you begin fondling it in an effort to distract yourself from the rising tightness in your [pc.balls]. The myr milf moans louder in response to your groping, giving you wordless permission to continue. Her ass has no small amount of fat on it, but more impressive is the muscle you feel underneath, her glutes occasionally tensing with superhuman strength, evidence of countless years of conditioning.");
	output("\n\nAfter a few minutes, Anka is clearly building towards another orgasm, moving faster and with greater force, though still only lifting her hips the barest amount. When a particularly forceful gyration draws a moan out of you, a particularly bold woman around Anka’s age teases <i>“Save some for the rest of us, ma’am!”</i> Several others voice their jocular agreement, pulling the general’s attention back to the crowd.");
	output("\n\n<i>“Are you telling me you don’t have faith in this whore’s stamina?”</i> Anka asks in a coquettish tone, squeezing her inner muscles repeatedly until you grab her hips and moan again.");
	output("\n\nThe same woman from before responds. <i>“We do, but we also know you have a penchant for emptying men’s balls! How else would you have three kids?”</i> More bawdy laughter fills the room.");
	output("\n\nAnka laughs as well before retorting, <i>“Why don’t I ask [pc.himHer] myself?”</i> She looks back over her shoulder at you with a smoldering expression, sweaty and flushed and all the more beautiful for it. <i>“Are you going to cum already?”</i>");
	output("\n\nYou take a deep breath before shaking your head vigorously. Your [pc.balls] " + (pc.balls > 1 ? "are" : "is") + " throbbing and painfully tight, but you’re not that close to the edge at the moment. The wicked grin the general flashes you in light of this information does worry you though.");
	output("\n\n<i>“Excellent! Then I can get myself off again without any problems.”</i> She resumes rubbing her button at a rapid pace, but rather than rolling her hips like before, she begins gently squeezing and relaxing her pussy over and over, assaulting the full length of your manhood with pleasure you are ill-prepared to handle. Anka continues speaking to you between grunts and moans of effort and pleasure, though it quickly becomes clear it’s much more for her own benefit than yours.");
	output("\n\n<i>“I really am impressed by your stamina, but I am a little sad you won’t be cumming in me. I’m very fertile for a red myr, you know. I’ve been pregnant thrice, and I wouldn’t mind serving the Federation by seeing if your kind can breed with us. Good thing you have so much endurance though!”</i> The myr milf’s voice sounds like she’s going to cream your cock at any second, but at this rate you won’t be far behind.");
	output("\n\nAnka’s arm is a red blur from the elbow down as she continues, <i>“If you didn’t, then I know you would just creampie me as hard as you could </i>right now!<i> Just pump every drop of sperm you had right into my fertile womb! You’re already balls-deep, so my cunt would just milk your virile cock dry, and you’d breed me while I </i>squirt! all! over you!!!<i>”</i>");
	output("\n\nThe air is nearly knocked out of you as the general collapses backwards with a shriek, writhing and frantically pleasuring herself, jilling herself off with one hand and mauling her tits with the other while gushing femcum all over both of you. Utterly shameless in her ecstasy, Anka screams at you to cum, her voice cracking as she orders you to fertilize her. As much as you’d love to comply, you know you’re not allowed to, and you tremble with the effort of holding back, eyes crossing, every muscle in your body tensing as you try to withstand the fertile alien slit that is milking your manhood with indefatigable effort.");
	output("\n\nTo your credit, you do last through almost the entirety of Anka’s climax. Almost. You’re just so pent up, and she’s so wet and tight. Your numbness just isn’t enough to ward off your orgasm, and you throw your head with a groan, giving in to the pleasure of Anka’s powerful womanhood.");
	output("\n\nExcept you can’t seem to ejaculate. You grip the sheets until your knuckles are white and your hands are trembling, and you try to thrust your hips, but you’re pinned down. Anka twitches in overstimulation, still sensitive from her climax, but she still manages to giggle. Your dick throbs powerfully over and over, even more than you normally would, but your [pc.cum] remains painfully trapped in your [pc.balls].");
	output("\n\nYou moan and whine in confusion and discomfort, but eventually your dry orgasm winds down, and you go slack in defeat. Only when the satisfied general lifts herself off of you and a ribbon of femcum drips out of her puffy slit onto your insensate dick do you realize what happened. You were too numb to realize it, but Anka’s pussy was squeezing your [pc.cock " + x + "] so tight that you couldn’t actually cum.");
	output("\n\nThe myr milf stands over you imperiously, gazing down at you with a smug, but totally satisfied grin at your slow realization. <i>“Oh, what’s wrong now? Did the whore not have the stamina [pc.heShe] said [pc.heShe] would? Well don’t worry too much. I’m sure you’ll get a bit of R&R before your next assignment- plenty of time to catch your breath!”</i>");
	output("\n\nA small round of applause goes up for the general as she staggers off the bed on legs still shaky from her powerful orgasms. Surprisingly, Anka silences her admirers before turning towards Sellera with a contrite expression. <i>“My sincerest apologies, Field Marshal Sellera. I allowed my lust to control me, and I behaved in a vulgar manner unbecoming of a citizen of the Scarlet Federation. However, I had no intention of allowing this drone to ejaculate. I was simply-”</i>");
	output("\n\n<i>“Having fun, yes,”</i> Sellera interrupts her subordinate’s apology, looking more convivial than you’ve ever seen her. <i>“There’s no apology required, General-Lieutenant. I knew you had the situation under control. I arranged this whole affair for the express purpose of giving everyone here a chance to let off some steam. The bedchamber is exactly the place for vulgarity and lechery.”</i> The field marshal addresses the room as a whole, <i>“That goes for every woman here! This alien drone is here exclusively for your pleasure. Do </i>anything<i> you wish with [pc.himHer].”</i> Her explanation provokes more cheering and celebration than ever before, and Anka simply salutes Sellera with a smile and is wordlessly dismissed by her commander amidst the din of horny women.");
	output("\n\nThe field marshal allows this to carry on for a moment more before gesturing once again for silence. <i>“Sergeant Nalu, it is your turn now.”</i>");

	addButton(0, "Next", sellaraIsNaLukingTiredYet, x);
}

public function sellaraIsNaLukingTiredYet(x:int):void
{
	clearMenu();
	clearOutput();
	selleraHeader();
	author("Night Trap");
	pc.lust(30+pc.libido()*3/8);
	processTime(210+rand(121));

	output("No one steps forward at first, but before the field marshal has to repeat herself, a small figure, presumably Sergeant Nalu, finally emerges from behind a cluster of older women. Thanks to her previous position, you had actually failed to notice her, and even now she seems very reluctant to step into the spotlight. You think you can guess why as well: she’s around the same age as you, making her a great deal younger than the generals and grizzled veterans she was standing with. She’s also a good deal shorter and less endowed than most of the women near her, making her stand out from them even more.");
	output("\n\nAlthough Nalu approaches slowly, Sellera doesn’t betray a hint of impatience with her. When the sergeant is finally standing in front of her, she smiles at the younger woman with obvious fondness. Sellera chuckles in good-natured amusement when Nalu stands to attention and salutes her, though the field marshal doesn’t hesitate to return the salute. <i>“At ease, Sergeant Nalu, and don’t act so reserved! A heroine of your calibre should hold her head high, so everyone around her can see what a model soldier looks like. I think someone with two Federation Crosses has earned that right, among other things.”</i>");
	output("\n\nSellera suddenly turns her attention to you, all the warmth in her voice replaced with ice. <i>“Listen well. Sergeant Nalu is the Savior of the Kuldar Salient and one of the most highly decorated women in the history of the Scarlet Federation. She has given exemplary service, and for the next ninety minutes you’re going to give her the same. Understood?”</i>");
	output("\n\nYou nod nervously, and the field marshal returns her attention to Nalu. <i>“Now, Sergeant, please enjoy yourself.”</i>");
	output("\n\nThe youthful woman approaches the bed hesitantly, staring down at the floor with a mortified expression. Now that she’s closer and facing you directly you can finally get a good look at the young war heroine. Nalu is short, barely over five feet tall, but she’s extremely muscular, even for a myr veteran. Her breasts are almost non-existent, capped with tiny, pink nipples, and if her waist weren’t impressively thin, her hips would be barely noticeable. There’s hardly a hint of fat on her clean-shaven pubic mound, leaving her womanhood completely bare. The petite lips of her labia are already slick with excitement, completely at odds with the consternation the rest of her body displays.");
	output("\n\nWhen Nalu realizes that you’re staring at her assets, she isn’t sure how to react, covering and immediately uncovering herself a few times before giving up with an overwhelmed huff and hopping up onto the bed in an impressive display of agility. She takes a few awkward steps into her position over you, her balance thrown off by the way her feet sink into the softness of the mattress. Even as she squats down and brings her pussy to within inches of your [pc.cock " + x + "], the shy sergeant can’t bring herself to look you in the eyes for more than a split second. Although she may seem overwhelmed now, you imagine it would be that much harder for her to turn the other way and have even more eyes on her.");
	output("\n\nTaking pity on the petite soldier, you reach up and stroke her head reassuringly, running your fingers through her short, black bob cut. Nalu freezes at first, clearly not expecting intimacy from you, but she soon warms up to your touch, dropping to her knees and planting her crotch on your pubic mound as she begins to stroke your " + (pc.tone >= 50 ? "hard" : "soft") + " torso. You follow her example with your other hand, gently fondling her tiny breasts, appreciating her perfect six-pack, and squeezing her hip in a way that clearly excites her. It’s a welcome change of pace from the frantic fucking of the last half hour, and you can feel yourself beginning to relax along with your partner.");
	output("\n\nAfter a few more pleasant moments, Nalu is practically swooning, and she suddenly takes you by complete surprise: without a word of warning, the young woman cups your cheeks and pulls you into a fervid kiss. Just seconds later she breaks the liplock, pulling away from you with a panicked <i>“Sorry!”</i> but the damage is already done.");
	if (pc.hasPerk("Venom Slut")) output(" You moan in delight, the aphrodisiac sensations of the addictive kiss you crave rapidly washing over you.");
	output(" As her venomous saliva seeps into your bloodstream, your heart races, and your whole body starts to feel <i>very</i> hot. Your sensitivity spikes, even the bed under you feeling delightful against your [pc.skinFurScales], but much more importantly, sensation floods back into your penis, feeling even more sensitive than usual.");
	output("\n\n<i>“I’m sorry! I just got carried aw-Oh!”</i> Nalu yelps in surprise as your [pc.cock " + x + "] rockets back to full hardness, slapping into the tight crevice between her muscular buttocks with a very wet sound thanks to the thick sheen of Anka’s femcum that still coats your length. The young sergeant twists to get a visual of what she’s feeling, seeming surprised to see that it’s a rock-hard cock, dripping pre-cum and another woman’s femlube, buried against her ass.");
	output("\n\nThe war heroine takes a deep breath to calm down, muttering to herself as she exhales. <i>“Okay, Nalu, it’s a penis, not a machine gun nest. You’ve done this twice before.”</i> Having steeled herself, Nalu");
	if (silly) output(" prepares to Steele herself and");
	output(" climbs onto the balls of her feet. She grabs your throbbing cock, drawing an involuntary moan and a thick dollop of pre out of you. Your vocalization gives the inexperienced young woman pause, but the pre-cum now leaking down her chitin clues her in to your moan being one of pleasure rather than pain.");
	output("\n\nShe returns to penetrating herself on you, and her sexual inexperience soon becomes torturously clear: Your [pc.cockHead " + x + "] slides through the warm, wet lips of Nalu’s pussy repeatedly, slotting up with her love tunnel several times in the process, only to be denied when the clueless sergeant thrusts at the wrong angle each time. Nalu becomes increasingly anxious and you become increasingly frustrated until a second voice freezes you both.");
	output("\n\n<i>“Do you require assistance, Sergeant Nalu?”</i> Sellera is now standing at the edge of the bed, still holding her pocket watch in one hand, somehow seeming to loom over both of you despite being at eye level with her subordinate.");
	output("\n\nThe sergeant looks mortified as she stumbles over her own words, <i>“M-my apologies, Field Marshal Sellera! I didn’t mean to-”</i>");
	output("\n\nSellera cuts her off with barely more than a whisper. <i>“No apologies are necessary, Sergeant Nalu. I’m sure the General-Lieutenant left things a little wetter than you might be used to.”</i>");
	output("\n\n<i>“No, ma’am! General-Lieutenant Anka hasn’t done anything wrong! I just... don’t have much experience with men, and I don’t use dildos very often...”</i> Nalu’s sudden candidness is shocking, but there’s no denying the field marshal’s commanding presence, even, or perhaps especially, when she’s whispering.");
	output("\n\nShe grins at the younger woman, a flash of sexual hunger crossing her face for an instant, <i>“I will be happy to teach you the basics sometime, Sergeant,”</i> then Sellera’s all smiles again, <i>“but for now I’ll help you get started here.”</i>");
	output("\n\nNalu’s face lights up at the offer of help, seemingly oblivious to the older woman’s lust. <i>“Thank you so much, Field Marshal!”</i>");
	output("\n\nThe gentle hold of Nalu’s grip on your shaft is replaced by the steel vice of Sellera’s, cruelly squeezing and yanking your dick into position with no regard for your pleasure. It still manages to feel good in its own way, especially with the venom clouding your mind, but it’s nothing compared to the heaven of what comes next. Warm, wet pressure gradually envelops your length, swallowing your [pc.cockHead " + x + "] all at once before slowly and erratically descending down your length, replacing the vice grip of Sellera’s fingers with the near-virginal tightness of Nalu’s womanhood. Her folds spasm fitfully around your shaft, the petite veteran’s pussy obviously unused to insertions, alternating between trying to push your cock out and pull it even deeper.");
	output("\n\nNalu’s vaginal muscles are as strong as the rest of her body, making you grateful for the unplanned kiss. Her druggy saliva pushes your masochism to a new level, and what would normally be painful tightness is instead delightful pressure. Your eyes rolls back into your head as, operating on pure instinct, you try to buck your hips, desperate to stuff the sergeant’s slit as fast as possible. Just as with Anka though, your efforts are stymied by a powerful, chitinous hand.");
	output("\n\nWhen you open your eyes in desperation, you’re met with Field Marshal Sellera glaring daggers at you. You stifle your reflexive whine, not wanting to do anything else to anger her. The venom and previous edging have you so horny by now that you’re trembling, but your fear of the myr woman is more than enough to still your rebellious hips. You look back to Nalu, who has her head lolled back and her eyes shut as she moans and whines softly. Her chiseled abs clench as she rocks her hips and squeezes her pelvic muscles involuntarily, and you feel every flex of the young woman’s muscles keenly, buried deep inside her as you are.");
	output("\n\nBy the time Nalu’s lower lips are kissing your [pc.knot], you’re back to gripping the sheets and chewing on your lip in an effort to hold back your orgasm. Your hips are twitching, your cock is obscenely swollen, and you’re spurting pre-cum at a rate that would clue almost any woman in to the imminent creampie she was about to receive. The nubile myr atop you however is utterly clueless, and clearly has no idea how much of an effect she’s having on you.");
	output("\n\nYou do somehow manage to contain yourself for another few minutes. Nalu’s inexperience means she has to spend a fair bit of time finding her favorite angle of penetration, and her performance during that time is hardly stellar. Sellera is still standing by the edge of the bed, watching you closely to ensure you give this war heroine the best fuck you can. You briefly consider asking for more of the numbing oil to help you last, but one look at the field marshal’s unsympathetic gaze tells you what a bad idea that would be.");
	output("\n\nIn an effort to distract yourself, you devote all your concentration to pleasing Sergeant Nalu in any way you can, focusing on massaging her swollen clitoris and fully-erect nipples. The young myr has lost most of her shyness by this point, and she moans and gasps freely. It quickly becomes too much for her, and she falls forward onto her knees, your bloated cock nearly slipping out of her as she plants her hands on either side of you. Nalu looks down at you with heavily-lidded eyes, biting her lip to hold in moans of pleasure as your clitoral stimulation causes her pussy to clench at your shaft even more tightly and frequently.");
	output("\n\n<i>“Mmm, you’re really-</i>AHH!<i>- good at this, " + pc.mf("Mr", "Ms") + ". alien.");
	if (pc.cLength(x) < 5) output(" I don’t care if you’re not as big as those drones were, your dick is still sooo</i>OOOHH<i> amazing!");
	else if (pc.cLength(x) < 10) output(" You’re about as big as those drones, but your dick is even more a</i>aAAHH!<i>- amazing!");
	else output(" Your dick is bigger than any other drone’s I’ve screwed. It’s so</i>OOOHH<i> huge, and </i>thick!<i> I’ve never had anything </i>ooOH!<i> so deep inside me, never had anything stretch me like this!" + (silly ? " I’m ruined for other drones!" : ""));
	output(" I think I’m gonna cum already! Fuck! I’ve never cum-</i>AH<i>- cum this fast! Oh, I wish I could feel you seeding me! I’ve always wanted to cum on a drone’s cock while he fills me up!”</i>");
	output("\n\nWith such earnest dirty talk, you’d be hard pressed not to go off, but with the tacit beseeching to cream her nubile little twat, it’s impossible to last any longer. Nalu can only gasp as your cock twitches inside her harder than ever and you begin bouncing her on top of you, giving yourself over to orgasm.");
	if (pc.hasKnot(x)) output(" Your knot swells to its maximum thickness as you begin trying to fuck it into your mate.");
	output(" Your shaft twitches once, twice, prostate fluid spilling out of you into your partner’s spasming pussy before your urethra dilates and your [pc.balls] clench" + (pc.balls <= 1 ? "es" : "") + " painfully tight, dredging up every sperm cell in your body in preparation for the biggest creampie of your life.");
	output("\n\nJust before the first thick spurt of semen works its way out of you, something even tighter than Nalu’s tunnel squeezes around the base of your cock, trapping your seed inside you at the last possible second");
	if (pc.hasKnot(x)) output(" and blocking you from knotting her");
	output(". You shout in frustration, thrusting even harder and faster in a blind, instinctive effort to empty your [pc.balls] into the willing woman atop you. It doesn’t work of course, though you do succeed in fucking Sergeant Nalu to the point that she shrieks in delight and starts creaming your cock so hard that your totally stymied orgasm redoubles. You roar in pain and unfulfilled need, still mindlessly thrusting your hips until your stoppered climax finally fades and, utterly exhausted, you collapse into the bed again.");
	output("\n\nSergeant Nalu trembles out the rest of her orgasm, mercifully holding still and just rubbing her clitoris until she too collapses. She lands on top of you feeling hot, sweaty, and gasping for air, much the same as you. Unlike you though, the petite myr is bonelessly savoring her afterglow, while you are shivering with your [pc.balls] throbbing in pain and full to the bursting point. At some point the sergeant shifts her hips, gasping as your [pc.cock " + x + "] slips out of her velvety folds. The instant it’s free, you feel your manhood being angled upwards, and you realize exactly what kept you from cumming.");
	output("\n\n<i>“I did </i>not<i> say you could blow your load, drone.”</i> Sellera’s rebuke cuts through you like a knife, and you’re suddenly, and not completely irrationally, afraid for your manhood. Nalu rolls off of you, giving you a clear view of Sellera looming over you, absolutely crushing your cock in her hand. <i>“You almost ruined a true heroine’s orgasm with your insubordination. I can promise there would have been far greater consequences if you had. As it stands, I’ll simply make sure you can’t repeat your mistake twice.”</i>");
	output("\n\nYou’re afraid to ask what she means, but you don’t have to. The field marshal leans over to the nightstand and retrieves a small golden band, which she quickly slides down your dripping-wet shaft, looking far too excited in the process. Once she releases your erection from her grasp, you look down with a pathetic moan to see a painfully-tight cockring around your base. When you reflexively reach down to touch your aching dick, Sellera stops you with a sharp slap to your hand. <i>“No. If you wanted to cum inside my girls, you should’ve signed up for the breeding service. I told you this is all about their pleasure, not about making eggs.”</i>");
	output("\n\nSellera sounds and looks totally unsympathetic, but she doesn’t seem the least bit angry with you. If anything, she looks a little excited right now, as if she knew this would happen and had been looking forward to it. From the way she keeps stealing glances at your strangulated manhood with a sadistic gleam in her eyes, it’s easy to infer that she’s getting off on this. The predatory myr woman might not be having sex at the moment, but she’s definitely having fun watching you struggle like this.");
	output("\n\nThe field marshal turns to her subordinate once more, warm and smiling as if nothing just happened. <i>“My sincerest apologies for ruining the mood like this, Sergeant Nalu. Please take an extra ten minutes as compensation.”</i> Sellera then steps away from the bed, clearly not allowing Nalu to turn down this offer.");
	output("\n\nThe young myr woman climbs atop you once more, looking down at you with a sheepish, blushing smile. <i>“I’m sorry for kissing you. That must have made your job much harder. If it makes you feel better though, I think you’re really great at your job. I don’t think I’ve ever gotten off that hard before.”</i>");
	output("\n\nYou mutter your thanks to her, feeling somewhat better now that your ego has been stroked. With a bit of reassuring, Nalu is soon bouncing herself on your cock once more. With all the envenomed blood trapped in your shaft, you’re more sensitive than ever, and despite your best efforts, once Nalu’s folds begin frantically milking your manhood during her next orgasm you can’t help but succumb to the pleasure. As you fully expected, it only brings you pain as your ejaculate is throttled yet again, and yet you can’t help but want to orgasm. Your body is screaming at you to just empty your " + (pc.balls > 0 ? (pc.balls > 1 ? "balls" : "ball") : "prostate") + " already and end this pain of being so full.");
	output("\n\nAfter the sergeant’s third and fourth orgasms, you really start to lose it. Your eyes are squeezed shut and you’re almost purple in the face from the strain of containing not just your climaxes, but the urge to beg for release. You can’t really think about anything other than the ache in your " + (pc.balls > 0 ? (pc.balls > 1 ? "balls" : "ball") : "prostate") + ", so it comes as a total surprise when a pair of lips seal themselves against yours, filling you with a massive dose of myr venom that carries you to a much greater high than the paltry dose of before. You couldn’t be more grateful: the druggy kiss doesn’t so much take away the discomfort as it makes you enjoy it.");
	output("\n\nIn the brief window between your mind clearing from the pain changing and your mind being consumed by a pink haze, you open your eyes to gaze up Nalu and thank her for the kiss. When you do look up however, you’re astonished to see the face of Sellera instead, grinning down at you with a pleased smirk. Before you can question the situation, she’s kissing you again, a vulgar, raunchy tangling of tongues that fills you with heat and drives your libido through the roof.");
	output("\n\nYou’re barely cognizant of the world around you after that. You are technically aware of your surroundings, but your brain doesn’t bother recording much of anything that happens. All you’re really aware of is sex, pleasure, and most importantly, your next hit of that addictive venom. Everything else is at best a quaternary consideration.");
	output("\n\nWhen Nalu finishes up with you after her hundred minutes have passed, she thanks you with a kiss on the cheek. The tingle of her venom on your [pc.skinFurScales] is nice, but you can’t muster words to thank her with. Most of the women after her, seeing the state that you’re in, treat you as nothing more than a living sex toy, riding you hard enough to bruise or fucking you at angles you normally would find painful.");
	output("\n\nSome of the women, obviously close friends or even lovers, even take their turns together, one soldier riding your cock for a time while the other contents herself with riding your face until it’s her turn, nearly suffocating you in the process. " + (pc.hasLongTongue() ? "As soon as the first one discovers how incredibly gifted you are orally, every woman from that point on spends at least a few minutes on your [pc.tongue]. Some even forgo your [pc.cock " + x + "] entirely in favor of your tongue. Virtually every soldier who makes you eat her out ends up squirting" : "A few of these women even squirt") + " all over your face, not even bothering to wipe you off. They don’t need to anyway: you eagerly lap up their femspunk, gathering it with your hands as they laugh at you debasing yourself.");
	output("\n\nNone of this bothers you in the least. Any time it seems like it’s beginning to bother you, Sellera is always there in the next instant, passionately frenching you even when your mouth tastes like a half dozen different women’s pussies. If anything, she seems even more eager to do it once you’ve been coated in the juices of a third of her officer corps.");
	output("\n\nEventually though, you notice that you’re no longer being used or abused by anyone. Your entire front side is drenched in pungent, alien femlube, and the taste of over a dozen pussies still clings to your [pc.tongue]. The sheets under you have long since been soaked by scores of female orgasms, but you’re still high enough to like that. You lie in the massive bed for a few moments, confident that someone will come along to use you soon. When nobody does, you thoughtlessly begin stroking your [pc.cock " + x + "], the entire length still coated in countless layers of femcum that make you almost frictionless. You’re too obedient to try to remove the cockring, but you’re too fucked-apart to just lie there without stimulation on your tenderized erection.");
	output("\n\nYou continue masturbating on autopilot for an uncertain amount of time, slowly sobering up as you do so until you hear the clicking of boots approaching you. <i>“I’m impressed, drone. Or should I say Steele? You went through all that and even when you were unsupervised for several minutes, you still didn’t get yourself off. I think you deserve a little extra reward for that.”</i> The unmistakable voice of Field Marshal Sellera cuts through what’s left of your drug-fueled haze, prompting you to raise your head towards her.");
	output("\n\nShe hikes her skirt up above her knees and clambers onto the bed, sparing her garment from the small lake of feminine juices soaking the sheets. The field marshal gingerly removes your cockring much more slowly than she actually needs to, obviously enjoying making you wait. You let out a massive sigh of relief once the blood finally begins circulating through your [pc.cock " + x + "] again, and you can’t help but wince at how sore it is. You let your head fall back into the mattress again as you finally start to relax for the first time in hours.");
	output("\n\nJust as your eyelids are starting to droop, you feel a wet heat slide up the underside of your shaft, leaving an incredible tingling feeling in its wake. You immediately look down to see the field marshal herself polishing your dick with her tongue. She grins up at you, not caring one bit how many women she’s tasting on you as she licks you clean. She never once comes close to actually fellating you, but the true reason for her actions soon becomes clear: everywhere her tongue touches becomes more sensitive and less tender, and when she slowly wraps a finger around your length you realize that she was making sure you’d be able to enjoy your <i>“special reward.”</i>");
	output("\n\nSellera gently strokes your cock with just one finger and her thumb. It feels awesome, especially after her venomous spitshine, but it’s nowhere near enough to get you off. The myr woman’s sadistic streak makes itself clear even when she’s supposedly being merciful, and she spends far longer than you’d like just toying with you for a while. Once she’s gotten her fill of you wriggling in discomfort and whining with impatience, she dispenses with all ceremony and begins jerking you off like an expert. You’re not sure where a myr general would learn to give such amazing handjobs,");
	if (pc.cocks[x].cType != GLOBAL.TYPE_MYR) output(" much less to an alien cock like yours,");
	output(" but you don’t have the brainpower to ponder that at this point.");
	output("\n\nThere’s absolutely no attempt to drag this out any longer, no effort to make your pleasure last. Sellera just milks your cock like a machine, her chitinous hands making the comparison especially apt. You certainly make no effort to hold back, and when you finally do reach your climax, it’s mind-melting: your entire lower half clenches and spasms as your abused dick throbs and your [pc.balls] empty " + (pc.balls > 1 ? "themselves" : "itself") + ". You’ve almost never been this relieved in your life. It doesn’t even feel pleasurable in the way a normal ejaculation does. If anything, it’s actually painful, but you welcome the relief it brings even as you groan and yell from the pain and effort of expelling dozens of backed-up orgasms all at once.");
	output("\n\nThe myr domme moves out of the way before the first pulse of seed even leaves your [pc.cockHead " + x + "]. You cum so hard that the first half dozen ejaculations of your [pc.cum] actually reach the foot of the bed");
	var cumQ:Number = pc.cumQ();
	if(cumQ > 3000) output(", and with your inhuman virility, they quickly overflow and spill onto the floor");
	output(". Sellera catches as much of your seed as she can in her free hand, surprising you yet again by bringing it up to her mouth and swallowing it. She directs the rest of your ejaculate onto your torso, forcing you to cum all over yourself.");
	if (cumQ > 3000) output(" Thanks to your prodigious output this means you’re giving yourself a facial, moaning like a whore the whole time you’re painting your face [pc.cumColor].");
	output("\n\nYour orgasm drags on for an eternity, and even after it’s done, your cock still throbs with the aftershocks even as you lie there panting in a " + (cumQ > 3000 ? "pool" : "puddle") + " of your own seed. Sellera casually licks her hand clean before climbing off the bed and leaning down to whisper in your [pc.ear] in a voice husky and sensual enough to make you shiver. <i>“Wouldn’t that have felt better if all of that was going inside of me? All you need to do is " + (flags["FEDERATION_QUEST"] > 2 ? "let me thank you for helping me with that rebel problem" : "help me out with that rebel problem") + ". Still, I think we both enjoyed the help you provided today. The Scarlet Federation and her people thank you for your service, Steele.”</i>");
	output("\n\nShe nips your ear like a lifelong lover as she reaches into her top and withdraws a small pouch from between her breasts. <i>“Your reward for today’s service, though I hope you’ll come to understand that serving me is its own reward.”</i> She drops it on your [pc.chest] before separating from you, flashing you one last smouldering look before sashaying out of the room in a manner you doubt many other people have seen.");
	output("\n\nYou spend a few more minutes just recovering from everything that’s been done to you in the last several hours. Checking the pouch is almost an afterthought, but when you finally do, there’s a generous amount of extremely rare gems inside that should be worth quite a bit of money. Summoning all your remaining willpower before you pass out in the carnal sludge, you");
	if (!pc.isNude()) output(" clothe yourself and");
	output(" gather your gear before heading out again, receiving many strange looks from passersby thanks to being covered in your own sexual fluids and those of dozens of women.");

	//Pass like 5 hours, lose a bunch of energy, empty balls, add pussy soaked status, if PC cum amount is high then add cum covered too, add a sizeable amount to red myr venom addiction score, PC orgasm +1

	pc.exhibitionism(2);
	pc.applyPussyDrenched();
	if (cumQ > 3000) pc.applyCumSoaked();
	pc.energy(pc.PQ()/10-50-rand(31));
	pc.orgasm();

	imbibeVenomEffects();
	//Big dose. Big Addiction. Yay.
	if(flags["VENOM_ADDICTION"] != undefined) myrAddiction(15);
	venomProgress(15);

	var reward:int = 25+rand(51);
	reward *= 25;
	pc.credits += reward;
	output("\n\n<b>+" + reward + " credits!</b>");

	IncrementFlag("SELLERA_GANGBANGED");

	addButton(0, "Next", move, "834");
}