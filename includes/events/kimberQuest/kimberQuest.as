//kimberquest flag:
//-1 - can't be started
//0 - heard
//1 - killed worm
//2 - returned to kimber
//3 - did kimber on top
//+4 - looted pantsu
//kimberoffer: job offered

public function kimberQuestWormLoss():void
{
	clearOutput();
	if (flags["KIMBER_QUEST"]%4 == 1) output("The wormling's attack sends you staggering, and you tumble to the ground. Before you can force yourself to rise, you hear the skittering creature draw closer, and its claws prod at your neck, scraping across your [pc.skinFurScales].\n\nOut of the corner of your [pc.eye], you see its jaws open, revealing three rows of sharp, jagged teeth. The last thing you feel is those teeth snapping shut around your neck.");
	else
	{
		showBust("DAERWORM", "WORMLING");
		showName("THE\nDAER WORM");
		output("The wormling's attack sends you staggering, and you tumble to the ground. Before you can force yourself to rise, you hear the skittering creature draw closer, and its claws prod at your neck, scraping across your [pc.skinFurScales]. Out of the corner of your [pc.eye], you see its jaws open, revealing three rows of sharp, jagged teeth.");
		output("\n\nBefore the wormling can take a bite of you, the sound of something much larger scraping on the stone comes from deeper within the cave. The wormling lets out a chirping sound, and skitters away. You have only a moment to think you'll get out of this before a monstrous creature crawls into the room.");
		output("An enormous version of the wormling enters the room, four glassy black eyes peering down at you. The thing's body is easily three feet across, and covered in overlapping plates of brown and black chitin. The head looks like something out of a nightmare: wide and heavily plated, with yellowed teeth jutting up from a tremendous jaw that looks strong enough to crush bone with a single bite. Dozens of legs, each one tipped with a claw sharp enough to dig through stone, jut out from the creature's sides.");
		output("This is the daer worm, the monster Kimber warned you about.");
		output("\n\nThe creature's jaw cracks open wide, showing more teeth than anyone should ever need. The last thing you see is the daer worm's maw darting toward your head, and the last thing you feel is its teeth snapping shut around your neck.");
	}
	badEnd();
}
public function kimberQuestDeadWormling():void
{
	clearOutput();
	showBust("WORMLING");
	showName("\nWORMLING");
	output("Your attack sends the wormling tumbling back, and it lets out a pained hiss as it crumples to the cavern floor. Its body seizes up, shaking, and its clawed legs grow stiff. After a quivering moment, the wormling curls up around itself and goes still. It's dead.\n\n");
	CombatManager.genericVictory();
}
public function kimberQuestDaerWormLoss():void
{
	clearOutput();
	output("You stumble to the ground, too wounded to keep fighting. The daer worm darts forward, faster than a creature that large should be able to move. Its wedge-shaped head slams into you, sending you to the floor.\n\nThe creature's jaw cracks open wide, showing row after row of sharp, jagged teeth. The last thing you see is the daer worm's maw darting toward your head, and the last thing you feel is those teeth snapping shut around your neck.");
	badEnd();
}
public function kimberQuestDeadWorm():void
{
	clearOutput();
	output("The daer worm rears back and lets out a pained cry as your attack connects. It sways to the right, then collapses, crushing its legs beneath itself as it crashes to the cavern floor. Its jaws snap as its body shudders, sending drool and broken teeth flying. It gives one last long screech, then the convulsions cause it to curl up around itself. The cavern falls silent as the daer worm breathes its last.");
	output("\n\nThe monster is dead. You take a sample from its corpse for Kimber. You should return to her and tell her that it's done.\n\n");
	flags["KIMBER_WORM_BEING_FOUGHT"] = undefined;
	flags["KIMBER_QUEST"] += 1;
	CombatManager.genericVictory();
}

public function kimberOpenQuest():void
{
	clearMenu();
	clearOutput();
	showKimber();
	processTime(1);
	
	flags["KIMBER_OFFER"] = 1;
	
	output("Kimber finishes her story, then gives you a careful look. \"<i>You've done a lot to help me here, [pc.name],</i>\" she says. \"<i>And it looks like you can handle yourself out there, if you're bringing me back all of this.</i>\"");
	output("\n\nYou tell her that you've handled everything you've come across so far, but you're wondering where she's going with this.");
	output("\n\nShe presses her lips together, and when she speaks, it sounds like she's choosing her words carefully. \"<i>If you're interested,</i>\" she says, \"<i>I might have a special job for you. It's fine with me if you're not, but if you want to know, just say so.</i>\"");

	addButton(0, "Special Job", kimberJobOffer, undefined, "Special Job", "Ask Kimber about the special job.");
	addButton(1, "Not Now", kimberMenu, undefined, "Not Now", "You can ask her about it later.");
}

public function kimberJobOffer():void
{
	clearMenu();
	clearOutput();
	showKimber();
	processTime(1);

	output("You ask Kimber about the special job she mentioned.");
	output("\n\nShe draws back from you a little, and takes a deep breath. \"<i>Yeah, I do have something I'd like to see get done,</i>\" she says, and she sounds nervous. \"<i>But I need to tell you everything I know before you say if you want to do it.</i>\"");
	output("\n\nKimber looks up at you, and for the second time since you met her, she genuinely looks worried. \"<i>It could be something that really helps me, it could be nothing. But this is no joke. People who've gone looking for this have died. So if you're not up for it, I get it. I know you can take care of yourself out there, but I want you to hear me out first.</i>\"");

	addButton(0, "Legend", kimberQuestLegend);
	addButton(14, "Never Mind", kimberTalkMenu);
}

public function kimberQuestLegend():void
{
	clearOutput();
	showKimber();
	processTime(2);

	output("\"<i>So,</i>\" Kimber begins, \"<i>I first heard about this from some gabilani on Tarkus. I showed up at the hangar same time as they did, and we got to talking. They looked like they were heading out for a hunt, carrying big guns and what looked like some kind of spring net thing. So I asked what they were looking for.</i>\"");
	output("\n\nYou've heard about people using the planet rush as a way to hunt down new creatures, you tell her, but the gabilani are native to Tarkus. What were they hunting?");
	output("\n\nKimber sips her beer before she continues. \"<i>Wasn't something from their home world they were out to get,</i>\" she says. \"<i>Those boys were hunting something from Daerinoys, the half-a-planet that they crashed into their home world. Tarkus is really weird, as you might know. Anyhow, they told me about some kind of animal they called the daer worm.</i>\"");
	output("\n\nThe daer worm? You've never heard of anything like that. A quick glance at your Codex gets you nothing.");
	output("\n\n\"<i>Me neither,</i>\" Kimber says. \"<i>They said it was a burrower, crawled over to Tarkus from Daerinoys, and they were off to kill it and take it back home as a trophy. So of course I'm thinking, if this is some rare beast, I need a sample. I bring that back to work, Xenogen comes up with something brand new that no one else has, I get a raise and a promotion, all kinds of good things.</i>\" She moves to drink again, but lowers her glass instead, and looks away.");
	output("\n\n\"<i>That ain't how it turned out.</i>\"");

	addDisabledButton(0, "Legend");
	addButton(1, "Danger", kimberQuestDanger);
}

public function kimberQuestDanger():void
{
	clearOutput();
	showKimber();
	processTime(2);

	output("You ask Kimber to continue.");
	output("\n\n\"<i>I made a deal with the gabilani boys,</i>\" she says. \"<i>I gave them one of my sample containers, and asked them to bring me back a piece of the creature when they killed it.</i>\"");
	output("\n\nAnd they agreed, just like that? You'd think that gabilani going after such a big kill would want something more if they were cutting someone else in on any of it, even if it was just a sample.");
	output("\n\n\Kimber gives you a small smile. \"<i>Oh, it wasn't that hard to talk them into it. Gabilani like big things, y'know?</i>\" She slides one arm under her enormous chest and hefts it, making herself bounce. \"<i>I'm used to folks not being able to look me in the eye when we talk, but it's a whole new world when I'm talking to someone who's so short they can't see past the girls here when they look up at me.</i>\" She chuckles. \"<i>I'm guessing helping someone so big as me would only make their hunting story better. Once I told them I'm a scientist and asked about getting a sample, they were falling all over each other to help.</i>\"");
	output("\n\nHer smile fades quickly, and she takes a deep breath. When she speaks again, her voice is lower, and she sounds sad.");
	output("\n\n\"<i>I was on Tarkus for a few days, and I never heard back from them. Then, round about when I was getting set to leave, I stopped by the Nova's bar, and one of those boys was there, crying his eyes out over a whole bunch of empty glasses. I've never seen someone so damn soused. So I asked him what happened, and where his friends were.</i>\"");
	output("\n\nKimber sighs. \"<i>He kept on sobbing, and it looked like he'd already been doing that for a while. Turns out, he and his friends found the worm's lair, but the worm came for them soon as they got close. Stormed right out of the cave where it lived, ate one of them before he could do a thing. Just swallowed him right up.</i>\"");
	output("\n\nThat's a hell of a story. At least one of them survived, though.");
	output("\n\n\"<i>Yeah, that's better than none, but all the same,</i>\" she says. \"<i>The poor guy said they couldn't get away. Little worms, maybe the big one's young, burrowed up from the ground and chewed at their feet as they tried to run. He said he only escaped because he threw some kind of bomb and didn't look back.</i>\"");
	output("\n\nShe raises her head and looks at you. \"<i>That's why I wanted you to hear everything, [pc.name]. This thing took out six gabilani who thought they were ready for it. And unless I miss my guess, you don't have a small army with you. So this could be some serious trouble, and I don't want you to go unless you're sure you can handle it.</i>\"");
	output("\n\nYou tell her you understand.");

	addDisabledButton(1, "Danger");
	addButton(2, "Agreement", kimberQuestDeal);
}

public function kimberQuestDeal():void
{
	clearMenu();
	clearOutput();
	showKimber();

	output("\"<i>So that's everything I know,</i>\" Kimber says. \"<i>Big damn gabilani-eating worm somewhere on one of the weirdest planets out there. It's killed before, and it'll probably kill you if it gets the chance. If you can find it, get me a sample, and I'll bring it back to the lab and we'll see what we can make of it. If you get over there and can't find a thing, that's all good and you get yourself back here safe.</i>\"");
	output("\n\nShe looks you in the eye. \"<i>Are you sure you want to do this?</i>\"");

	if (flags["TARKUS_DESTROYED"] != undefined) addButton(0, "No Tarkus", kimberQuestUhhhh, undefined, "No Tarkus", "There's a little problem…");
	else
	{
		addButton(0, "Yes", kimberQuestAccept, undefined, "Yes", "Choose to accept the mission.");
		addButton(1, "No", kimberQuestFuckNo, undefined, "No", "Say no. You can always change your mind later.");
	}
}

public function kimberQuestUhhhh():void
{
	clearMenu();
	clearOutput();
	showKimber();

	output("You tell Kimber there's a small problem with this: Tarkus isn't there anymore.");
	output("\n\nShe blinks once. \"<i>It's what?</i>\"");
	output("\n\nYou explain the incident with the pirates at the Stellar Tether to her, and how that led to their bomb going off and destroying the planet.");
	if (pc.isNice()) output(" You make sure she knows that you tried to keep the bomb from going off, but in the end you had to get out of there and save yourself.");
	else if (pc.isMisch()) output(" You make sure to make the pirates sound like total crazy people who wanted to blow up everything, instead of just greedy thieves.");
	else output(" You make sure to give as many details of your fights with the pirates as you can, so she knows you delivered an ass-kicking before getting out of there.");
	output("\n\nKimber doesn't say anything for a moment, just stands there, her eyes wide. \"<i>I was just there not too long ago,</i>\" she breathes. \"<i>I… I don't even know what to think about that. All those people…</i>\"");
	output("\n\nShe takes a few deep breaths, and seems to collect herself. \"<i>I'm glad you got out of there all right,</i>\" she says. \"<i>And I guess the daer worm's not really something to worry about anymore.</i>\" She sighs. \"<i>Damn shame, though, to lose a whole world like that…</i>\"");
	
	flags["KIMBER_QUEST"] = -1;

	kimberTalkMenu();
}

public function kimberQuestAccept():void
{
	clearMenu();
	clearOutput();
	showKimber();

	output("You tell Kimber that you'll do it, and her eyebrows rise, her eyes going wide.");
	output("\n\n\"<i>You mean it? You sure?</i>\" She reaches into her labcoat and pulls out a small metal tube with the Xenogen logo on it, then hands it to you. \"<i>Here's the sample container. Pop off the top, drop in whatever you can get, then twist the cap back on until it clicks and hisses. That'll keep it sterile and preserved until you get it back to me.</i>\"");
	output("\n\nThe way her voice sounds, it's hard to tell if she's excited or nervous. Like she said, this could lead to something big for her at work, but she did make very sure you know how dangerous it is. You pocket the sample container and try to reassure her that you'll be okay.");
	output("\n\n\"<i>I believe you, I think,</i>\" Kimber says, then bites at her lip. \"<i>Just be careful out there, you hear? I don't want you getting killed because of me.</i>\"");
	output("\n\nYou'll be fine, you tell her. And if it gets bad, you'll run. She laughs a little at that, but it sounds forced.");
	output("\n\n\"<i>You do that,</i>\" she says. She clears her throat. \"<i>Okay. The gabilani said that he and his friends found the worm's cave in the southern part of Tarkus, in the metal fields. If you hit the predator plants, you've gone too far. Look for a cave that's between two giant pieces of steel, that's the beast's lair.</i>\"");
	output("\n\nYou note the directions, and tell her you'll do what you can. With any luck, you'll find the sample she wants.");
	output("\n\n\"<i>Oh, good.</i>\" Kimber still looks nervous, but she's smiling. \"<i>But even if you can't get a piece of it, you come back in one piece, you hear?</i>\"");
	
	refreshRoamingBarEncounter();
	flags["KIMBER_QUEST"] = 0;

	kimberMenu();
}

public function kimberQuestFuckNo():void
{
	clearMenu();
	clearOutput();
	showKimber();

	output("You tell Kimber that you don't think you're up for it. You've found plenty of trouble on your own, no need to go looking for more.");
	output("\n\n\"<i>I get it,</i>\" Kimber says, nodding. \"<i>No shame in making sure you don't get yourself killed. And I'd feel real bad if I asked you to go do something for me and you never came back.</i>\" She smiles a little, though it looks forced. \"<i>You change your mind after you get a little better at handling things or just get a bigger gun, you let me know.</i>\"");

	kimberMenu();
}