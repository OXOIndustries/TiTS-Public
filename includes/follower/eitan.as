public function eitanRecruited():Boolean
{
	return flags["EITAN_CREW"] != undefined;
}

public function eitanIsCrew():Boolean
{
	return flags["EITAN_CREW"] == 1;
}

public function letEitanBackIntoYourShip():void
{
	clearMenu();
	clearOutput();
	showEitan();
	processTime(1);

	output("You don’t really mince words or beat around the bush, knowing that Eitan is already for the idea, and you ask him if he’s ready to end his leave-of-absence and return to your ship. You have a spot open for him again if he wants it.");
	output("\n\n<i>“I would be glad to, [pc.name] Steele,”</i> he says, pulling himself to his feet and extending his hand to you. <i>“I’ll need some more lessons from the best if I’m to be a better leader for my tribe. I’ll see you at your ship.”</i>");
	output("\n\nWith that, he makes his own way to the station. You’re left alone in his tent while he goes ahead. If you have any business left to do, you can still do it before you leave to catch up.");

	flags["EITAN_CREW"] = 1;

	addButton(0, "Next", goIntoEitansTent);
}

public function pickUpAMiloForYourShip():void
{
	clearMenu();
	clearOutput();
	showEitan();
	processTime(3);

	output("You let your mind wander as you sit with Eitan in his home. You’ve been playing with a fantasy for a little bit, where you suggest he join your crew as a bodyguard and heavy-duty everyman, but you aren’t sure how receptive he would be to the offer. He has duties here on Uveto, after all.");
	output("\n\n<i>“Speak your mind, [pc.name] Steele,”</i> Eitan says suddenly. <i>“It’s obvious that you have something on it.”</i>");
	output("\n\nYou ask him if it were really that obvious.");
	output("\n\n<i>“Being in my sort of position, you learn how to read a person’s body language quickly,”</i> he answers. <i>“Our bodies are usually more honest than our mouths.”</i>");
	output("\n\nWell, you’re caught, so there isn’t any sense in drawing things out. You turn your body to face him full-on, but he doesn’t immediately reciprocate the action. You ask him if he’s recently thought of leaving Uveto.");
	output("\n\n<i>“Not recently,”</i> he answers casually. <i>“If you recall, one of my, uh... incentives for leading the attack on the korgonne was because Pyrite had offered to uplift me and my tribe to be among you offworlders. Whenever a milodan leaves the world in one of your kind’s flying machines, we call that milodan ‘uplifted.’ I was hoping to be uplifted, myself.”</i>");
	output("\n\nUnfortunately, you can’t exactly accommodate an entire tribe, but you were wondering if he wouldn’t be against... joining your crew. You could always use more security detail, and he would make an excellent bodyguard. Also, he’d be the strongest person on your crew " + (pc.physique() < 40 ? "bar none" : "after yourself") + ", and you could put him to work doing some labor in the ship’s cargo hold whenever you needed.");
	output("\n\nEitan scratches his chin and casts his gaze across the tent. He doesn’t look terribly surprised by the offer – he probably knew exactly where the conversation was going after your initial question. But he didn’t have an answer ready.");
	output("\n\n<i>“Maybe I shouldn’t,”</i> he says.");
	output("\n\nThen, nothing more. You wait for a bit, and then awkwardly ask him to elaborate.");
	output("\n\n<i>“It feels very selfish to me,”</i> he continues. <i>“I fail my attack on the korgonne; then I tell the other milodan tribes that the war between us has ended; and then I pick up and leave Uveto. It might look like I’m running, and that I’m not being responsible for my actions as alpha. You’re the one that taught me that I should try and act more like a leader.”</i>");
	output("\n\n<i>“But then,”</i> he says, shrugging his shoulders and looking at his left hand, <i>“exploring the stars and uplifting myself could broaden my understanding of</i> how <i>to be a good leader. What encouraged me to start the attack in the first place was a close-minded view of how I</i> thought <i>the world</i> should <i>work. If I left, I could come back a better alpha for the milodan.”</i>");
	output("\n\nThis is a very surprising train of thought. You tell Eitan that you weren’t expecting such a broad introspection on the possibility of leaving his tribe behind.");
	output("\n\n<i>“To be honest, I’ve been thinking about it since I was still a prisoner,”</i> he says. <i>“Not about being a good leader – that way of thinking came after – but about what it would mean if I succeeded, and Pyrite uplifted me and my tribe. What I could have expected. And if my wanting to be uplifted so badly was a part of why I was there, hitting a wall with a pick for days on end.”</i>");
	output("\n\nHe hasn’t given you a yes or a no, but you don’t push him any further or faster than he’s going. He’ll answer you on his own time.");
	output("\n\n<i>“Fine,”</i> he says, turning to face his body towards you, just as you had to him. <i>“[pc.name] Steele, I accept. I won’t learn anything new staying here.”</i>");
	output("\n\nThat’s... great! You tell Eitan that you can lead him to your ship right now. It’ll take you two through Irestead, but nobody will give him a hard time as long as he’s with you.");
	output("\n\nEitan stands and extends his hand to you, so he can lift you to your own [pc.feet]. <i>“I’d appreciate that. Your people were about as welcoming to me as mine were to you. Having an escort would be nice.”</i>");

	addButton(0, "Next", isEitanExcitedAboutCatchingTheBigRedDotInTheSky);
}

public function isEitanExcitedAboutCatchingTheBigRedDotInTheSky():void
{
	clearMenu();
	clearOutput();
	showEitan();
	
	removeUvetoCold();
	processTime(287);

	output("Considering Eitan is leaving not only his tribe, but his planet, you’d have thought there would have been more ceremony and fanfare. He’s being ‘uplifted,’ which you thought was a big deal to the milodan, but apparently they, or at least Eitan’s tribe, don’t waste a lot of time with goodbyes. There were well-wishes and good-lucks, but it was all fairly formal, like they were all co-workers and Eitan was just punching out to go home.");
	output("\n\nAlthough it isn’t a particularly long walk back to Irestead, Eitan is standing tall the whole way, with an excited stride you weren’t expecting from him. Before Irestead is in sight, you ask him what he thinks being uplifted will be like.");
	output("\n\n<i>“I could give you any number of fantasies, [pc.name] Steele,”</i> he replies, <i>“but I couldn’t begin to guess. All I want is to be uplifted. I’ll figure out what that means when it happens.”</i>");
	output("\n\nYou assure Eitan that there’s nothing wrong with putting yourself first in life – it’s only a problem when he puts others down to get there. This isn’t such a case.");
	output("\n\n<i>“So you’ve been teaching me,”</i> he answers.");
	output("\n\nLike Eitan had told you, and like you had expected, the denizens of Irestead gave you both any number of looks as you made your way through the station towards the space elevator. Some of them were awed that such a massive milodan could exist (and the average milodan was already fairly large); some nervously turned or walked away from you both, knowing of the milodan’s reputation and wary of one as big as him; and more than a handful of them openly fucked him with their eyes – he’s a statuesque male wearing very little below the waist, so it was hardly unexpected. And given the way Eitan’s body language shifted the deeper into Irestead you went, he probably noticed them too, but he had the sense to not interrupt your walking.");
	output("\n\nIts common technology to you, but the space elevator catches Eitan by surprise: once the elevator takes off and you lift into the Uveto sky, his hands and face press against the glass viewing ports, watching the world disappear beneath him. He has a myriad of questions the whole way – what an ‘elevator’ is, for starters – and you try to answer them all to the best of your ability. He’s like a kid that’s only now discovering the world around himself.");
	output("\n\nEitan’s eyes can’t stay focused ahead of himself once you’re in the promenade: the world around him is totally artificial, and while he’s still getting the same stares as he did on Irestead, he’s started staring at them back, having gotten a taste of what alien life is really like, and how the natural form could look so much different from his own.");
	output("\n\nHe remains respectfully silent when you bring him to the ship’s hanger, and you introduce him to your own ship, the [pc.ship]. You tell him that this is what you two will be traveling in, and this is how you’ll be going from planet to planet.");
	output("\n\n<i>“It’s the size of a mountain!”</i> he exclaims. <i>“And it can travel across the stars? I can hardly imagine it moving an inch!”</i>");
	output("\n\nYou ask him how he <i>thought</i> wayfarers like yourself traveled across the stars.");
	output("\n\nHe hesitates at the question. <i>“Now that you ask, I haven’t put much thought into it,”</i> he answers.");

	moveTo(shipLocation);

	addButton(0, "Next", showEitanYourShip);
}

public function showEitanYourShip():void
{
	clearMenu();
	clearOutput();
	showEitan();
	processTime(14);

	output("You give him a quick tour of the ship: everything from the loading bay and cargo hold, to the mess hall, to the bridge, to the engine room, to the captain’s quarters, and finally, to the crew’s quarters. Eitan, being fairly large, has a hard time moving from place to place through the ship - through door frames and down hallways. It’ll be a while before he stops bonking his head on the ceiling.");
	output("\n\nAs you go, you detail to him what you expect from him as a crewmate on your ship. He has no experience with working on a ship or exploring the stars, but he’s a very large man, and you can find uses for that kind of muscle. On top of the fairly mundane, like lifting boxes or moving munitions, outer space isn’t always the safest place to be, and you might run into... undesirables during your adventures. Violence isn’t always the answer, but, sometimes, it is, and having a huge guy like Eitan around can be useful for that.");
	output("\n\nAll of the crew quarters look fairly identical – meaning, small, especially for a guy like Eitan – but you tell him that he’s allowed to whichever quarters isn’t already occupied.");
	output("\n\nHe frowns as he examines some of the options he has. <i>“It’s all a bit of a step down from the alpha’s living space back home, isn’t it?”</i> he says.");
	output("\n\nIt surprises you to hear him say that, but at the same time, he likely doesn’t understand everything that he’s getting in his quarters - he wouldn’t understand how to work the climate control or the viewport at a first glance. You make a note to teach him of all the amenities he’s actually getting later.");
	output("\n\n<i>“This isn’t what I had in mind when I thought I was going to be uplifted,”</i> he remarks. <i>“What about the captain’s quarters? That was larger than all of these. Can I have that?”</i>");
	output("\n\n<i>“Absolutely not,”</i> you answer firmly. That’s where <i>you</i> sleep, after all! If he doesn’t like it, he’s free to back out – you may be ‘uplifting’ him, but being naturalized into modern society means having to put up with conditions he might not be used to, and that means tight living spaces.");
	output("\n\nEitan hums in thought as he considers your ultimatum. <i>“What else does it mean?”</i> he asks; not to goad you, but because he’s genuinely curious.");
	output("\n\nWell, the first thing that comes to mind is that, as long as Eitan is on <i>your</i> ship, and he is in <i>your</i> crew, it means that <i>you</i> are the captain, and <i>that</i> means that your word and instruction is final. You tell him to think of the crew as another tribe, and you’re the alpha.");
	output("\n\nHe hums again, scratching at his chin. <i>“This is all beginning to sound like I’ve made a terrible mistake,”</i> he laughs. <i>“But if there’s any one thing that I still am, [pc.name] Steele, it’s that I’m stubborn. You’ve started me on a better life on Uveto, so I’d trust that my experiences with being uplifted will be better with you than any other... what did you call yourself? A ‘captain?’”</i>");
	output("\n\n<i>“That’s right,”</i> you say. You think that about covers it. You’re normally fairly lax about dress code, but if he really wants to go the extra mile and feel like he’s with you and your crew, there should be a spare Steele Tech uniform underneath the bed. The material the suits are made of are fairly flexible, so it should conform to his size.");
	output("\n\nEitan ducks his head into one of the unoccupied crew spaces and remains there a moment longer than the others. <i>“I’ll take this one,”</i> he says, leaning back out to face you. <i>“I think it may be larger than the others by a palm or two.”</i>");
	output("\n\nThat’s probably just his eyes playing tricks on him, but if he wants it, you aren’t going to dissuade him. You tell him it’s his.");
	output("\n\nHe pulls out of the doorway and stands beside you in the cramped hallway, his massive body contorting to the side just to fit. <i>“So,”</i> he drones, <i>“what happens next?”</i>");
	output("\n\nFor him? Not a lot – he just stands by and waits for your further instruction. You grant him shore leave whenever you’re docked, and he has your permission to wander the ship as he likes, but when you tell him to do something, he needs to do it. If he doesn’t think he should touch something, then he <i>should not</i> touch it. Other than that... it’s just a bit of waiting.");
	output("\n\n<i>“May I touch you?”</i> he asks.");
	output("\n\nThe question takes you aback. <i>“Uh... " + (pc.isAss() ? "I... don’t see the harm...?”</i>" : "yes?”</i>"));
	output("\n\nWith your permission, he steps into you and wraps you in his giant arms, squeezing you to his chest. <i>“My experience with Pyrite did not end well. I won’t waste this opportunity a second time, [pc.name] Steele,”</i> he says, holding you against his fluffy, muscular chest.");
	output("\n\nYou weren’t expecting that" + (pc.isAss() ? ". You don’t reciprocate the hug - at least, not as thoroughly as he’s giving you yours. You awkwardly reach for his shoulder and give it a few reassuring pats." : ", but far be it from you to turn down a hug from someone as large, fluffy, and firm as Eitan is. You reciprocate the hug as best as you can, worming your arms out from underneath him, and wrapping them around his ribs, pulling him into you."));
	output("\n\n" + (pc.isAss() ? "Eitan, sensing your unease, doesn’t let the hug last for too long." : "It turns out, Eitan’s a good hugger. His size makes it easy for him.") + " When he disengages and heads into his own quarters, it air of your ship feels just a bit cooler.");
	output("\n\n<b>Eitan is now your crewmate!</b>");

	moveTo("SHIP INTERIOR");
	flags["EITAN_CREW"] = 1;

	addButton(0, "Next", mainGameMenu);
}

public function eitanPlsGetOutYoureLeavingFurEverywhere():void
{
	clearMenu();
	clearOutput();
	showEitan();
	processTime(4);

	var uveto:Boolean = getPlanetName() == "Uveto Station";

	output("You tell Eitan that he’s dismissed from his duties for the time being. It’s time for him to go home to his tribe for now.");
	if (!uveto) output(" You can give him a ticket on the next starship back to Uveto, where he can ride in relative comfort, and he’ll know where to go once he lands at Irestead.");
	output("\n\nHe looks at you with a tilted head and arched eyebrows. <i>“Have I done something wrong?”</i> he asks.");
	output("\n\nYou tell him that, no, he’s been a model crewmate - it’s just that you have some short-term plans that require more space on your ship, and it’d be best if it were him that you dismissed. You promise that you’ll be back for him when you need him, and in the meantime, he can take what he’s learned from his uplifting back to his tribe and be a better leader for them.");
	output("\n\nEitan sighs at your words, clearly unconvinced. <i>“I was hoping my uplifting would be longer,”</i> he says. But he doesn’t argue, and he stands. <i>“I remember you saying that, as long as you are captain, what you say, goes. And if that means going home, then that’s what that means.”</i>");
	output("\n\nYou reiterate that it’s not necessarily forever, and if he’s willing to come back to sail with you, you’ll have him as soon as you have the space.");
	output("\n\n<i>“I’ll hold you to that,”</i> he says. <i>“" + (uveto ? "I can find my own way back to my tribe" : "I will accept your offer to take an alternative way home to my tribe") + ". Thank you for the opportunity to travel with you, [pc.name] Steele.”</i>");
	output("\n\nIn several swift motions, he’s out of the Steele Tech uniform he’s put on, reverting back to his simple, tribal loincloth. " + (uveto ? "And that’s all that he wears when he makes his own way through the orbital station and through Irestead." : "You bet that’d be a fun sight to see while he’s in transit back home."));
	output("\n\nWell, at least you know where to find him if you want him back.");

	flags["EITAN_CREW"] = 0;

	addButton(0, "Next", mainGameMenu);
}

public function eitanCrewBlurbs(btnSlot:int = 0, showBlurb:Boolean = true):String
{
	addButton(btnSlot, "Eitan", eitanApproachCrew);
	return showBlurb ? "\n\nEitan is on the ship if you need him. He spends most of his time either in his quarters, or doing exercises in the ship’s recreational rooms." : "";
}

public function eitanApproachCrew():void
{
	clearMenu();
	clearOutput();
	showEitan();
	processTime(1);

	// First time
	if (flags["EITAN_SHIPWARMING"] == undefined)
	{
		output("You enter Eitan’s quarters. Eitan is difficult to miss: although he technically <i>fits</i> in his quarters, it’s still quite small and cramped, especially for a guy with his size. To your surprise, Eitan took your advice from earlier – he’s wearing the Steele Tech uniform.");
		output("\n\n<i>“Hello, [pc.name] Steele,”</i> he welcomes, sitting up on the bed. The suit moves and breathes naturally with the movement of his body – although it looks stretched thin all around, it fits him like a glove regardless and he moves as naturally as he did with just his loincloth before. The dark colors of the suit contrast starkly with the color of the fur around his hands and face.");
		output("\n\nYou ask him if he likes the suit. <i>“On the one hand,”</i> he says, picking at his own bicep through the material, <i>“I prefer to wear as little as I can. I find heavy clothing restrictive. But, on the other,”</i> he continues, looking you in the eye and smiling warmly, <i>“if I’m to use my uplifting as a learning experience, I should immerse myself as best I can. And I also find this to be more comfortable than the clothing Pyrite put me in.”</i>");
		output("\n\nThat’s good to hear. You take a seat next to Eitan and consider what it is you came in here for.");
		flags["EITAN_SHIPWARMING"] = 1;
	}
	// Subsequent times
	else
	{
		output("You enter Eitan’s quarters. You find him curled up into a disc on his bed, still wearing the Steele Tech uniform: despite being large enough to take up a chunk of the quarter’s living space by himself, Eitan seems perfectly comfortable where he is.");
		output("\n\n<i>“[pc.name] Steele,”</i> he says, lifting himself and unfurling from his spot to greet you properly. <i>“It’s good to see you again.”</i>");
		output("\n\nYou tell him likewise as you take your seat next to him, thinking about what it is you came in here for.");
	}

	eitanMenu();
}