/*
ICEQUEEN COMPLETE
	0/undefined -- not started
	-1	 		-- turned down at the initial message
	-2			-- refused after meeting zaalt
	1 			-- murderhobod zaalt
	2			-- turned zaalt in
	3 			-- helped him after beating the shit out of him
	-3 			-- lost to him

ICEQUEEN KARA STUFF -- 
	0/undefined -- WHO KNOWS?
	1 			-- played it cooool
	2 			-- interrupted, sure
	3 			-- interrupted, sex
	4 			-- interrupted, no

ZAALT_DISABLED -- obvs.
*/

public function iceQueenMessageHelp(destination:String):void
{
	clearOutput();
	author("Savin");

	flags["STORED SHIP DESTINATION"] = destination;

	output("Alright, time to be a good samaritan. You punch in the coordinates, redirecting your ship towards the <i>Ice Queen</i>. One brief LightDrive sprint later and you’re within visual range of the ship - and a hail of tumbling rocks hurtling through space. Considering how many comets are streaking by you, it looks like the <i>Queen</i> must have gotten caught in a storm. Even with modern shields, a hit from something big enough going fast enough can be the end of you - or do enough damage to make your equipment go haywire.");
	
	output("\n\nSure enough, when you zero in on the vessel, your forward cameras start picking up chunks of metal and plastic gracefully rolling through the endless void around the vessel. The <i>Ice Queen</i> is a big girl in her own right, even with what looks like a nasty scrape along her starboard side. She definitely took a big impact. The <i>Queen</i>’s all orange and red, curvaceously circling an expansive cargo bay with crew quarters, engines, and a single defensive rocket pod that automatically angles your way.");
	
	output("\n\nYou keep your shields up just in case, but happily, the <i>Ice Queen</i> doesn’t do so much as blink at you until you’re within a hundred meters. Once you’re at the stellar equivalent of bumping noses with it, a computerized alert appears on your HUD, directing you to align yourself with the <i>Queen</i>’s port side. You circle around and, once you’re in position, a boarding umbilical extends from it and bonks against your hull with a resounding vibration, making the hull tremble ever so slightly. A button press allows the umbillical to link up with your airlock, forming an air-tight bridge you can traverse.");
	
	output("\n\nSecured to the other vessel, you hop off the captain’s seat, grab your gear, and get ready to head over.");
	
	processTime(45);

	clearMenu();
	addButton(0, "Next", iceQueenMessageHelpII);
}

public function showZaalt(nude:Boolean = false):void
{
	author("Savin");
	if(nude) showBust("ZAALT_NUDE");
	else showBust("ZAALT");
	//showBust("MILODANMALE");
	if(inCombat()) showName("CAPT.\nKANDAR");
	else showName("ICE\nQUEEN");
}

public function zaaltImprisoned():Boolean
{
	return (flags["ICEQUEEN COMPLETE"] == 2);
}

public function iceQueenMessageHelpII():void
{
	shipLocation = "SPACE";
	currentLocation = "SPACE";
	showLocationName();
	
	clearOutput();
	showZaalt();

	output("The moment the <i>Ice Queen</i>’s hatch cycles open, you’re hit with a wave of greasy black gas that");
	if(pc.hasAirtightSuit()) output(" briefly obscures your vision");
	else output(" makes you gag and cover your mouth");
	output(". The interior’s darkened with red emergency lights, casting long shadows across the deck. You duck down under the billowing smoke, waving your hands around your face and calling out.");
	
	output("\n\n<i>“Hey!”</i> a voice shouts from down the entrance corridor. You turn and see a man jogging down the corridor. A <b>big</b> man - easily over six and a half feet, and as he comes into better view, you can see he’s clearly inhuman. His towering, burly body is covered in a short covering of thick orange fur, itself coated in soot and grease. A pair of goggles are pulled up on his forehead, pushing up a head of black-and-ice-blue dyed hair, and a pair of small tusks jut down from the upper jaw of his short muzzle behind a transparent breathing apparatus.");
	
	output("\n\nYou");
	if(pc.hasAirtightSuit()) output(" wipe the ash staining your helmet for a better view. You can’t smell the outside air, but you imagine it wouldn’t be pleasant. The man grabs your shoulder and guides you past the dense smoke.");
	else output(" wave, coughing despite how low you’re keeping to the deck. The air smells rancid, a mix of engine oil and burning fat. The man grabs your shoulder and pushes a mask like his into your hands, and you put it on eagerly. Sweet relief!");
	
	output("\n\n<i>“Glad you’re here,”</i> the man says. <i>“I’m Captain Zaalt Kandar. You’re just in time...”</i>");
	
	output("\n\n<i>“Steele,”</i> you answer, taking " + (pc.hasAirtightSuit() ? "a" : "in a deep") + " breath of recycled air. <i>“[pc.name] Steele.”</i>");
	
	output("\n\nHe grins, showing off dark golden eyes, slitted like a cat. Now that he’s close, you can see the resemblance: more bestial than a kaithrit, but his species is definitely feline. Almost like a sabertooth. <i>“Just in time, [pc.name],”</i> he says, squeezing your shoulder in one of his big, clawed paws. <i>“We’ve finally got the drive cooled off - barely - but there’s another problem.”</i>");
	
	output("\n\nAs if having your engine ready to cook off under you isn’t bad enough! <i>“What?”</i>");
	
	output("\n\n<i>“Look, the </i>Queen<i>’s in rough shape. Our shields buckled after a debris-storm hit us, took out a chunk of the hull. My second’s got things stabilized, but we’re not going anywhere with our engine having a fit. Normally I wouldn’t mind sitting here for a few days fixing things, but we’ve got an urgent delivery we need to make. Lot of credits on the line, [pc.name].”</i>");
	
	output("\n\nCredits? Your [pc.ears] perk up as the topic switches from rescue to the potential for profit.");
	
	output("\n\n<i>“Got your attention, huh?”</i> Zaalt grins. <i>“With the engines under control, my crew can start repairing things. Should be able to scrub the air clean on their own, too. But there’s no way we can make our delivery. Which means you’re a damn fine sight in this mess.”</i>");

	if (pc.isNice())
	{
		output("\n\n<i>“How can I help?”</i> you say.");
		output("\n\n");
	}
	else if (pc.isMisch())
	{
		output("\n\n<i>“I get that a lot,”</i> you answer with wink.");
		output("\n\n<i>“I bet,”</i> the towering feline laughs. ");
	}
	else
	{
		output("\n\n<i>“Start talking,”</i> you say around your mask. <i>“What do you need?”</i>");
		output("\n\n");
	}

	output("<i>“Alright, I hate to impose, but I promise: helping me out will be more than worth your while. We’re making a delivery to Uveto - a core world’s moon, icy little snowball in rush-space ten. Mostly small computer parts... things the colonists can’t replicate on their own. The bulk of the shipment can wait here, but there’s a briefcase full that’s en-route to some mining company, Rhenwail or whatever, that’s marked urgent. No credits unless it’s delivered in...”</i>");
	
	output("\n\nZaalt looks at a glowing leather-strapped holoband on his wrist, <i>“Uh, real soon. Dammit, gotta hit the space lanes right now if we’re gonna make it.”</i>");
	
	output("\n\n<i>“We?”</i>");
	
	output("\n\n<i>“Huh? Oh, yeah,”</i> the big fella says. <i>“Gotta come with you to make the delivery. Can’t let cargo this critical out of my sight.”</i>");
	
	output("\n\nAs he says that, the <i>Ice Queen</i> shudders under your [pc.feet] and a plume of black smoke billows out from around a corner behind him. A female ausar with a long head of bubblegum-pink hair and a ragged black jacket stumbles out from the smoky corridor, blasting some kind of foam from a device on her wrist.");
	
	output("\n\n<i>“Well, the <b>engine</b>’s not on fire anymore, cap!”</i> she shouts from under a canid-shaped facemask.");
	
	output("\n\nZaalt grimaces. <i>“You and Kait going to be able to keep things locked down while I’m gone?”</i>");
	
	output("\n\nThe ausar woman throws her hands up and shouts something so rapid-fire in an alien language that your translator fails. It sounds angry as hell, though!");
	
	output("\n\n<i>“Alright, alright,”</i> the tiger-man grunts. <i>“We’ll get out of your hair! Assuming [pc.name] here wants to earn some credits, that is?”</i>");

	output("\n\n");
	if (pc.isMisch() || pc.isAss()) output("Oh, you actually get some input here? ");
	output("So, are you in, or is the cat-captain going to have to find another ride?");
	
	processTime(15);

	//[Help Him] [Question] [Refuse]
	clearMenu();
	addButton(0, "Help Him", iceQueenHelpHim, undefined, "Help Him", "You’ve made your decision: you’ll take Kandar to Uveto as he asked.");
	addButton(1, "Question", iceQueenQuestion, undefined, "Question Him", "You’ve got some questions first...");
	addButton(2, "Refuse", iceQueenRefuse, undefined, "Refuse", "You don’t want anything to do with this.");
}

public function iceQueenRefuse():void
{
	clearOutput();
	showZaalt();

	output("<i>“Sorry, captain,”</i> you say. <i>“I didn’t come over here to be your personal taxi.”</i>");
	
	output("\n\n<i>“Wha- ah, dammit. C’mon, [pc.name],”</i> Zaalt sighs, wiping the soot from his furry brow. <i>“There’s a lot of credits on the line here!”</i>");
	
	output("\n\nNot your problem. You turn to leave, telling the captain he might want to start messaging for help again if his ship’s going to keep falling apart around him. He curses and pounds a fist against the bulkhead, but doesn’t force the issue. You return to your ship and depart.");

	flags["ICEQUEEN COMPLETE"] = -2;
	
	processTime(5);

	clearMenu();
	addButton(0, "Next", flyToWrapper, flags["STORED SHIP DESTINATION"]);
}

public function iceQueenQuestion():void
{
	clearOutput();
	showZaalt();

	output("<i>“I’ve got some questions before we go anywhere,”</i> you say, positioning yourself between Captain Kandar and the airlock.");
	
	output("\n\nHe shrugs. <i>“Alright, but the sooner we leave, the better chance we have of making my deadline - and a big fat pile of credits.”</i>");
	
	processTime(1);
	
	addDisabledButton(1, "Question");
	addButton(5, "Destination", iceQueenQuestionDestination, undefined, "Destination", "So where are you going, exactly?");
	addButton(6, "Cargo", iceQueenQuestionCargo, undefined, "Cargo", "What’s this cargo, exactly?");
	addButton(7, "Captain", iceQueenQuestionCaptain, undefined, "Captain", "You want to know more about Zaalt before you think about letting him aboard your ship.");
	addButton(8, "Ice Queen", iceQueenQuestionIceQueen, undefined, "Ice Queen", "Ask about Zaalt’s ship, and what went wrong.");
	addButton(9, "Credits?", iceQueenQuestionCredits, undefined, "Credits?", "How much are you going to be making from this?");
}

public function iceQueenQuestionCredits():void
{
	clearOutput();
	showZaalt();

	output("<i>“Can’t say for sure,”</i> Zaalt says, waving a plume of smoke away. <i>“The computer chips are the most valuable part of the shipment by far, but since we’re not making a full delivery... look, I’ll promise you twenty-five hundred credits at minimum, out of my own pocket if I have to. If we’re lucky, and that icy bitch on the station is in a good mood... I’ll give you half my net profit on this set. Eight thousand credits or so.”</i>");
	
	output("\n\nThat’s a tidy profit for just running a delivery back into the core. It’s not even a dangerous route, theoretically.");
	
	processTime(1);

	addDisabledButton(9, "Credits?");
}

public function iceQueenQuestionIceQueen():void
{
	clearOutput();
	showZaalt();

	var pcLocation:String = getSystemName();
	if(InCollection(pcLocation, ["Unknown", "Deep Space", "Siretta"])) pcLocation = "Kalas";
	
	output("<i>“The </i>Ice Queen<i>?”</i> Zaalt says, leaning against a bulkhead. <i>“She’s the biggest gal on the Siretta-"+pcLocation+" run. Might not be the fastest out here, but the </i>Queen<i>’s got a mighty cargo bay and great big engines,”</i> he adds, making a motion around his chest as if to mimic a set of big, weighty breasts. Way bigger than average.");
	
	output("\n\nHe laughs and cracks his knuckles. <i>“She’s a Pyrite-corp ship. Which I <b>thought</b> meant reliable as hell, until her LightDrive decided to throw us a curveball. First time she’s given us trouble, but considering she just got her side tore out by a meteor, I’ll give her a pass.”</i>");
	
	output("\n\n<i>“How long have you had her?”</i>");
	
	output("\n\n<i>“About twelve years. Ha, yeah, we milodan age pretty gracefully, eh? She’s a good ship, and I damn well intend to keep her... once my crew gets things under control here.”</i>");
	
	output("\n\nYou glance between him and the pink-dyed ausar who’s spraying chemicals at some unseen leak or fire. <i>“So what happened?”</i>");
	
	output("\n\n<i>“Well,”</i> he half-groans, rubbing at the back of his head. <i>“I put the ship on automatic at the end of my shift at the helm, went back to spend some, uh, quality time with the crew.”</i> He looks behind him, to the skinny ausar and the pluming smoke. <i>“Rockstorm must have snuck up on us while we were on autopilot. First thing I heard was the crash of the shields buckling, then the proximity alarms. Can’t tell if it was a glitch or what-”</i>");
	
	output("\n\nHe’s cut off by a panel on the bulkhead ten yards behind you exploding off the wall in a shower of sparks and falling wires.");
	
	output("\n\n<i>“Ah, dammit, I just fixed that!”</i> Zaalt scowls, punching the steel beside him. The panel drops off the wall there, too, narrowly missing dropping on his foot.");
	
	processTime(2);

	addDisabledButton(8, "Ice Queen");
}

public function iceQueenQuestionCaptain():void
{
	clearOutput();
	showZaalt();

	output("<i>“Me?”</i> the feline captain chuckles, his broad chest rising with mock pride. <i>“I’m Zaalt Kandar. Born and raised on Ortisan. Captain of the </i>Ice Queen<i>. Legendary pilot, explorer, and lover!”</i> he says with a grin around his breath-mask.");
	
	output("\n\n<i>“Legendary, huh?”</i> you say,");
	if (pc.isBimbo()) output(" eying his muscular chest with much more interest than before. Your eyes instinctively follow the lines of his taut muscles downwards, to where an unsublte package is waiting in rest between his legs. Now that’s a tasty-looking reward for your help...");
	else if (pc.isBro()) output(" completely nonplussed.");
	else output(" with a cocked brow. <i>“Never heard of you.”</i>");
	
	output("\n\nZaalt just laughs and crosses his arms. <i>“Look, I’m afraid we don’t have time for my life story right now. But it’s a long enough ride from here to Uveto, if you want me to talk your ear off.”</i>");
	
	output("\n\nYou guess that’ll have to do. He doesn’t <i>look</i> like a serial killer or a pirate, at least...");
	
	processTime(2);

	addDisabledButton(7, "Captain");
}

public function iceQueenQuestionCargo():void
{
	clearOutput();
	showZaalt();

	output("<i>“Cargo’s standard fare for a backwater: replacement heavy industrial parts for the mining operations, some medicine and nano-biotics, plenty of personal cargo. Got a contract from Galactic Post before for Siretta. Places like Uveto don’t get that many heavy cargo ships that aren’t corporate-owned and regulated, so we end up carting around all sorts of things every trip.”</i>");
	
	output("\n\n<i>“And what cargo are you wanting to bring on my ship?”</i>");
	
	output("\n\nZaalt grins. <i>“Just a briefcase full of electronic components. That’s the most critical thing that needs delivered - the only thing with a time restraint, anyway. The big mining company on Uveto, RhenWorld, needs ‘em for... whatever it is they’re doing with those robots of theirs. A.I. control or something, I think. They’re real desperate to get the parts, whatever they are.”</i>");
	
	output("\n\n<i>“Can I see them?”</i>");
	
	output("\n\n<i>“Sure,”</i> the sabertooth man says. <i>“I’ll get ‘em when we’re about to get underway. You can inspect them to your heart’s content then. Nothing dangerous, I promise.”</i>");
	
	processTime(2);

	addDisabledButton(6, "Cargo");
}

public function iceQueenQuestionDestination():void
{
	clearOutput();
	showZaalt();

	output("<i>“Destination is Uveto Seven, in the Siretta system. It’s an iceball backwater, well out of anybody’s way unless you’re interested in psionic minerals or husky ausars. And... it’s my species’ homeworld, though I’m not a native,”</i> he admits. <i>“We milodan were uplifted centuries back, unlike most of the other native races. At least some of us.”</i>");
	
	output("\n\nThat right? <i>“Anything else you can tell me?”</i>");
	
	output("\n\n<i>“Well,”</i> Zaalt says with a shrug, <i>“It’s in rush ten space, like I said. It’s a corporate controlled world, mostly ausar and human. The big companies we deal with are RhenWorld and their daddy corp, Steele Tech. They’ve got a big presence on the planet, mining for savicite and the like. The only people you’re going to need to talk to are the Camarilla - the little fuzzy bastards have a monopoly on exports from Uveto, and they control the space station we’ll be docking at.”</i>");
	
	if (!uvetoUnlocked())
	{
		output("\n\n<i>“So... how do we get there, exactly? Never been.”</i>");
	
		output("\n\nZaalt chuckles. <i>“Most people haven’t. Don’t worry, I’ve got the coordinates and directions on my holoband!”</i>");
	}
	
	output("\n\n<i>“Anything important I should know?”</i>");
	
	output("\n\nThe captain thinks for a moment, then shrugs. <i>“Nah. You look like you’ve done plenty of space adventuring, [pc.name], so Uveto won’t be anything special. Ought to try the saunas while you’re there, though: they’re the best in the galaxy!”</i>");
	
	processTime(3);

	addDisabledButton(5, "Destination");
}

public function iceQueenHelpHim():void
{
	clearOutput();
	showZaalt();

	pc.addNice(2);

	output("<i>“Alright, we’re in business,”</i> you tell your sabertoothed counterpart. <i>“Let’s get you to Uveto.”</i>");
	
	output("\n\n<i>“Really? Great!”</i> he grins, grabbing your hand and shaking it. He turns to the ausar woman and shouts something in the same alien language she was cursing in and tells you to wait here - he’s got to go grab the cargo.");
	
	output("\n\nHe runs off down the corridor, leaving you and the ausar woman alone in the steadily-more-oppressive clutch of engine smoke. She huffs as Zaalt brushes by her and cuts off the spray of chemicals from her device. A flick of the wrist cleans the last bits of foam off, and she turns to you.");
	
	output("\n\nPulling off her canid-shaped mask reveals a dark-skinned humanoid face with eyes bearing both the shape and color of almonds. Her bright pink hair is mussed and dirty after being exposed to whatever fuming blaze she’s been dealing with and her black jacket has been torn in several places, but that only accentuates that statuesque beauty on display. She seems like she’d be just as at home in a pantheon as an engine room, even as she scowls.");
	
	output("\n\n<i>“I thought captains were supposed to go down with the ship and all that,”</i> she growls, ripping the spray-gun off her arm and tossing it angrily at the bulkhead at her feet. She glowers at you, dark eyes hardened. <i>“I hope you bring Zaalt back in one piece - I’m gonna be damn lucky if I can keep this frigid bitch together while he’s gone.”</i>");
	
	output("\n\n<i>“Are you sure it’s alright for him to be leaving at all?”</i>");
	
	output("\n\nHer lips twist in an irate scowl. <i>“No. But we’re screwed if he doesn’t. Gotta make this stupid delivery, and Zaalt’s the least qualified to make repairs here. If anybody’s going, it’s him.”</i>");
	
	output("\n\n<i>“So what’s so important about these");
	if (pc.isBimbo()) output(", uh... like,");
	output(" computer parts?”</i>");
	
	output("\n\n<i>“No idea. I’m a mechanic, not a computer nerd. All I know is some Uvetan company is paying top creds for express delivery... and we’re going expressly nowhere while our engine’s belching gas at us.”</i>");
	
	output("\n\nYou think about questioning her further, for what good it seems to do, but Zaalt’s back mere moments later, carrying a silver security case - no more than two feet wide, and so chromed that even the emergency lights and smog can’t dim its glint.");
	
	output("\n\n<i>“Alright, here they are,”</i> Zaalt says with a grin, rapping his knuckles against the case. <i>“What do you say we get underway, huh?”</i>");
	
	output("\n\nThe sooner you get out of this oppressive smoke, the better.");
	
	processTime(6);

	clearMenu();
	addButton(0, "Next", iceQueenHelpHimII);
}

public function iceQueenHelpHimII():void
{
	clearOutput();
	showZaalt();

	output("You return to your airlock with the towering milodan in tow, carrying his oh-so important briefcase. Now that you’re out of the smoggy corridors of the <i>Ice Queen</i>, you’re able to take better stock of the man: he’s handsome, for a creature covered in tawny orange fur striped with black, and made to look all the more bestial by his spear-like upper tusks and alert feline ears. Though his hands are on the case, you can see now that he’s got the hilt of an energy sword slung low on his left hip, and what at a glance looks like a compact double-barrel shotgun on the other. Both are largely covered by the rough-worn leather jacket he’s wearing over his clothes.");
	
	output("\n\n<i>“Alright,”</i> he says as you cycle the lock. Fresh, clean air blasts you both in the face, wiping away the last vestiges of the tainted atmosphere from the other ship. With a deep, relieved breath,");
	if(pc.hasAirtightSuit()) output(" he discards his breathing mask");
	else output(" you both discard your breathing masks");
	output(". <i>“Listen, I really appreciate this, [pc.name]. Not a lot of people would go out of their way to help a fellow rusher like this.”</i>");
	
	output("\n\nYou nod, and the airlock starts to cycle open.");
	
	if (!uvetoUnlocked())
	{
		output("\n\n<i>“Here,”</i> Zaalt adds, tapping a holographic button on his wrist device. <i>“Coordinates for Uveto. Warp Gate sequence for the Siretta system, and coordinates for Uveto Seven, our destination.”</i>");
	
		output("\n\nYour Codex beeps an alert, and you quickly pass them along to your ship’s navigational controls. Should be child’s play to set a course from here.");
		flags["UVETO_UNLOCKED"] = 1;
	}
	else
	{
		output("\n\n<i>“You know the way to Uveto?”</i> the feline captain asks.");
	
		output("\n\nLucky for him, the coordinates are already in your navicomputer. It should be child’s play to set a course to the icy fringe world.");
	}
	
	output("\n\n<i>“Good, good,”</i> Zaalt smiles.");
	
	output("\n\nBefore you go aboard properly, is there anything you want to say?");
	
	processTime(7);

	clearMenu();
	addButton(0, "Inspect Cargo", iceQueenLetsGoInspectCargo, undefined, "Inspect Cargo", "Let’s have a look at that precious cargo.");
	addButton(1, "No Weapons", iceQueenLetsGoNoWeapons, undefined, "No Weapons", "You’ll take Zaalt aboard on one condition: no weapons. After all: trust, but verify.");
	addButton(2, "Flirt", iceQueenLetsGoFlirt, undefined, "Flirt", "Maybe you could get a little more... personal... reward for helping this buff kitty-cat out?");
	addButton(3, "Nothing", iceQueenLetsGoNothing, undefined, "Nothing", "Get on with things.");
}

public function iceQueenLetsGoNothing():void
{
	clearOutput();
	showZaalt();

	output("You don’t have anything to say, other than to cycle through the airlock and head inside. Zaalt follows you close behind.");
	
	processTime(1);

	clearMenu();
	addButton(0, "Next", iceQueenLetsActuallyGo);
}

public function iceQueenLetsGoFlirt():void
{
	clearOutput();
	showZaalt();

	flags["ZAALT FLIRTED"] = 1;

	output("Before the airlock can finish cycling, you take a step towards Zaalt and run a hand along one of his brawny, furry arms. Grinning");
	if (pc.tallness < 74) output(" up");
	else if (pc.tallness > 86) output(" down");
	output(" at him, you suggest that a good samaritan like you deserves a more personal reward. Especially from a big, strong man like him.");
	
	output("\n\n<i>“That right?”</i> Zaalt says with a cocky half-smile, putting one of his big paws on your hip. <i>“Awful forward, aren’t ya?”</i>");
	
	if (pc.isBimbo()) output("\n\nYou just giggle and press your [pc.chest] against him, emphasizing your softness and curves ripe for his taking.");
	else output("\n\nYou step closer, suddenly extra aware of the captain’s musky scent, the bristle of his fur as your fingers brush across it.");
	
	output("\n\nZaalt chuckles, but you can feel a stiffness growing, brushing against your thigh. You didn’t exactly expect a lot of opposition to your offer, after all...");
	
	output("\n\nJust like that, though, he pulls away and sets aboard your ship. <i>“Let’s talk about a bonus for safe delivery, eh?”</i>");
	
	output("\n\n<i>“But it’s such a long, boring trip,”</i> you whine. It’s going to be <i>hours</i> of nothing to do, when you could be getting to know each other.");
	
	output("\n\nZaalt gives you a wink and steps aboard, leaving you with an even hotter fire in your loins as you follow him.");
	
	processTime(2);
	pc.changeLust(20);

	clearMenu();
	addButton(0, "Next", iceQueenLetsActuallyGo);
}

public function iceQueenLetsGoNoWeapons():void
{
	clearOutput();
	showZaalt();

	flags["ZAALT DISARMED"] = 1;

	output("<i>“One thing first,”</i> you say, turning towards Zaalt. Your hand instinctively has been sitting on your [pc.weapon] for some time now. <i>“No weapons.”</i>");
	
	output("\n\nZaalt blinks in surprise, then furrows his orange brows at you. <i>“Hey now, I’m the one at a disadvantage here. Who knows what’s waiting on the other side of that airlock for me!”</i>");
	
	output("\n\n");
	if (crew(true) > 0)
	{
		output("Unless he’s allergic to");
		if (annoIsCrew()) output(" ausar fur");
		else if (celiseIsCrew()) output(" galotian slime");
		else if (reahaIsCrew()) output(" cow-girl milk");
		else if (yammiIsCrew()) output(" Yammi’s cooking");
		output(", you assure him he’ll be fine.");
	}
	else output("You assure him that he’ll be fine.");
	output(" Captain’s honor. You just don’t want to get stabbed in the back while you’re busy flying.");
	
	output("\n\nHe seems to consider it for a long, long moment before finally sighing and unbuckling his weapon belt.");
	
	output("\n\n<i>“I guess you’ve got trustworthy eyes, [pc.name],”</i> he grumbles, surrendering his gear. Flashing you a fang-bearing grin, he adds <i>“Just remember, my bite’s as bad as my bark.”</i>");
	
	output("\n\n");
	if (pc.isBimbo()) output("<i>“Oooh, I bet,”</i> you giggle.");
	else output("You’re sure.");
	
	processTime(2);

	clearMenu();
	addButton(0, "Next", iceQueenLetsActuallyGo);
}

public function iceQueenLetsGoInspectCargo():void
{
	clearOutput();
	showZaalt();

	output("<i>“Let’s have a look,”</i> you say, indicating the briefcase. Can’t be too careful about strange men with strange cargo, can you? Could be a bomb, or God only knows what in there.");
	
	output("\n\n<i>“Fair enough,”</i> Zaalt says, almost too quickly.");
	
	output("\n\nHe cheerily unbuckles the lock on either side and pops it open, revealing a heavily padded interior flush with silky purple fabric. Inside are four small, mostly smooth black spheres of plasteel, interrupted only by universal connection ports around what you imagine is the back side, and a small data display opposite them.");
	
	output("\n\nYou cock an eyebrow and reach into the case, running a finger across one of the");
	if (pc.characterClass == GLOBAL.CLASS_ENGINEER) output(" devices. A moment’s inspection confirms your first impression: they’re A.I. cores. Highly advanced ones as well; these belong in high-class companion droids much more than they do in the hands of a backwater mining facility.");
	else output(" strange devices. Wonder what they are?");
	
	if (pc.characterClass == GLOBAL.CLASS_SMUGGLER) output("\n\nYou take an extra moment to prod around in the case’s padding, checking for all the tell-tale signs of a false bottom or hidden compartments. As far as your trained eye can tell, it’s clean. Nothing but the spheres inside.");
	if (pc.characterClass == GLOBAL.CLASS_ENGINEER) output("\n\nYou sweep your Codex over the box while you have the chance, running a quick scan, just in case there’s any suspect tech hidden away inside the cores or the case. The scan comes back negative: they’re just inert computers in a padded case, as far as you can tell.");
	
	output("\n\n<i>“Satisfied?”</i> he asks, retracting the case from your probing fingers.");
	
	if (pc.characterClass == GLOBAL.CLASS_ENGINEER)
	{
		output("\n\nYou have to ask: <i>“What does a mining company like RhenWorld want with A.I. cores?”</i>");
	
		output("\n\nZaalt shrugs, clipping the case closed again. <i>“No idea. Probably mining robots or something, I’d imagine. Whatever it is, they’re desperate to get ‘em.”</i>");
	}
	else
	{
		output("\n\n<i>“What are those supposed to be?”</i> you ask as Zaalt clips the case closed again.");
	
		output("\n\nHe shrugs. <i>“From what the manifest said, they’re A.I. cores. Probably for mining robots or something. Whatever they’re used for must be important: company’s desperate for ‘em.”</i>");
	}
	
	output("\n\nAs Zaalt secures his briefcase, your airlock finishes cycling, inviting you both aboard.");
	
	processTime(3);

	clearMenu();
	addButton(0, "Next", iceQueenLetsActuallyGo);
}

public function iceQueenLetsActuallyGo():void
{
	clearOutput();
	showZaalt();
	currentLocation = "SHIP INTERIOR";
	showLocationName();

	output("You finally board your ship once more, now with Captain Kandar in tow. The bridge is a short walk away, and you quickly have the coordinates for Uveto plugged in and set the auto-pilot to task.");
	
	output("\n\n<i>“Nice ship,”</i> Zaalt says, glancing around at your bridge’s setup. <i>“Very homey.”</i>");
	
	output("\n\nFor a second, you think he’s making fun. When you turn back to look at him, though, you catch Zaalt smiling to himself as he inspects your space-borne home. He chuckles, locking eyes with you a moment. <i>“I can tell when someone loves a ship. Makes it theirs. Has a sort of atmosphere about it you just don’t get from big corporate behemoths, eh? Like someone sunk their heart into the place.”</i>");
	
	output("\n\nYou guess if anyone else would know, it’d be another rusher like yourself. Without prompting, Zaalt takes a seat in your co-pilot’s chair and flashes you a toothy grin. <i>“Well, for once I’m not in charge here. Anything I can do to help, captain?”</i>");
	
	output("\n\n<i>“Nope,”</i> you say. <i>“");
	if (flags["ZAALT FLIRTED"] != undefined) output("Other than reconsider that offer, anyway... ");
	output("It’s gonna be a long trip.”</i>");
	
	processTime(3);

	//Play Uveto approach scene, as normal. Replace the <Combine> section as follows, however:
	flags["DO UVETO ICEQUEEN ENTRY"] = 1;
	clearMenu();
	addButton(0, "Next", flyToUveto);
}

public function iceQueenUvetoEntry(oldUvetoVisitFlagValue:* = undefined):void
{
	clearOutput();
	author("Savin");

	output("<b>An hour passes...</b>");

	output("\n\nJust as you’re getting through with the mountain of legal gobbledygook the Tove sent you, your proximity sensors alert you to the approach of a large ship bearing the trade IDs of the Camarilla. You respond to a message blip ordering you to power down weapons and shields and follow the “wabeshift” to Uveto Station’s docking terminal. You do as you’re ordered and switch the autopilot on, letting it dog the Camarilla ship in towards the station.");

	shipLocation = "UVS F15";
	currentLocation = "SHIP INTERIOR";
	showLocationName();

	if (oldUvetoVisitFlagValue == undefined)
	{
		output("\n\nUveto Station’s a small affair, one of the pre-fab low-orbit control stations common on frontier worlds too inhospitable to support a full colony. Why it’s in what’s been a core world for centuries, you have no idea. A thick tether connects it to the planet below - a space elevator, you imagine - and several long, curving arms extend from the central unit of the station, providing a great deal of docking space. You suppose there must not be a spaceport on the surface of the planet.");
	}

	output("\n\nYou lean over and give Zaalt a ");
	if (pc.isAss()) output("less-than-");
	output("gentle shake, getting a start from the snoozing cat. You can’t remember when he fell asleep, but if the way his tongue is lolled out the side of his mouth is any indication, he’s been down and out a while!");
	
	output("\n\n<i>“Huh!? Wha?”</i> Zaalt blinks, glancing around the bridge... and then going wide-eyed as the Camarilla cruiser passes across your bow, letting you finish the approach to Uveto Station’s docking arm in peace. <i>“What’s a wabeship doing here? They barely bother to roll out a tugboat when the </i>Queen<i> comes calling!”</i>");
	
	output("\n\nYou laugh, suggesting that you must be a VIP. Maybe");
	if (flags["MET_RHENESUNNE"] != undefined) output(" Anyxine");
	else output(" the Steele Tech branch here");
	output(" is looking out for you?");
	
	output("\n\nYour companion scoffs and clambers to his feet. <i>“Can’t imagine the Camarilla actually caring about anyone, unless you’re bringing a boat-load of credits with you. Heartless little muppets only think of one thing: cold, hard credits.”</i>");
	
	output("\n\nHe laughs, but you’re not sure if it’s in mirth or rue. While Zaalt stares out the forward viewscreen, you busy yourself shepherding the auto-pilot while it does the fine calculations, making sure you’re perfectly aligned in orbit before you attach to the automated umbilical.");
	
	output("\n\n<i>“Alright!”</i> Zaalt cheers as the connection locks in: you’ve finally docked. He checks the device on his wrist and growls a curse. <i>“Cutting it damn close, [pc.name]! Gotta... Gaah!”</i>");
	
	output("\n\nZaalt’s eyes go wide and he plunges forward, just barely stopping himself on the back of your seat. You leap up and grab him before he can fall to the deck, and the moment you touch his furred flesh, you’re instantly assailed by the sheer <i>heat</i> radiating off of him. He’s burning up!");
	
	output("\n\nYou ask if he’s okay - what’s wrong? - but all the response you get is a weak groan of pain. What the hell?");
	
	output("\n\nYou’re half way to punching the emergency comms when Zaalt manages to wave his hand at you and staggers to his feet. <i>“I-I’m okay. I’m okay,”</i> he groans, rubbing his temples. <i>“Just a... just a migraine. I’ll be alright.”</i>");
	
	output("\n\nMigraine? With a fever like that? Bullshit; he’s sick!");
	
	output("\n\nZaalt grunts and waves you off, though he’s still feverishly rubbing at his head. <i>“Fuck this hurts. Agh. Just... don’t worry about it. Got less than half an hour to deliver these, uh... these cores. C’mon.”</i>");
	
	output("\n\n<i>“Are you sure?”</i> you ask, following Zaalt as he forces himself towards the airlock. He gasps and slumps against the bulkhead, gritting his tusked teeth against the pain. Again, you draw near to help... but this time Zaalt slams one of his meaty paws against your chest, sending you staggering back! He roars like a beast, throwing his head back with feral outrage.");
	
	output("\n\nYour brain hurts. Not a headache, but a sudden rush of internal agony that makes you stumble back and scream, clawing at your skull as if to get at your brain and stave off the agonizing assault. It feels like talons are clawing at your mind, rending your senses. What’s happening to you!?");
	//9999 PC is Psionic: output(" You can feel the psionic energy suddenly rushing out of Zaalt’s mind, slamming against you like a wave of mental force. You never felt anything from him before, but all of a sudden he’s radiating mental energy like the most powerful psion you’ve ever seen!");
	
	if (crew(true) > 0)
	{
		output("\n\n<i>“[pc.name]!?”</i> a voice shouts from off the bridge. <i>“Are you okay?”</i>");
	
		output("\n\nNo, you’re <b>not</b> okay! Not at all.");
	}
	
	output("\n\nZaalt’s hands are on you before you can regain your balance, throwing you backwards against your captain’s chair. He bellows and snarls, and suddenly you have claws slicing at you, trying to tear you apart! You manage to shove him back and grab your [pc.weapon], interposing it between yourself and the crazed sabertooth. By now he’s breathing heavily, staring at you with dilated, hugely black eyes. Yours, however, are drawn downwards to a swelling bulge in his breeches, standing out like a pillar of desperate need from his loins.");
	if (flags["ZAALT DISARMED"] == undefined) output(" He grabs the force blade from his belt and activates it, letting a blade of shimmering purple energy spring to life between you.");
	
	output("\n\nWith him standing between you and the corridor out, there’s nothing you can do but try and pacify him... somehow.");
	
	processTime(65);

	var tEnemy:Zaalt = new Zaalt();
	if (flags["ZAALT DISARMED"] != undefined)
	{
		tEnemy.SetDisarmed();
	}

	clearMenu();
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.victoryScene(iceQueenBeatZaalt);
	CombatManager.lossScene(iceQueenLossToZaalt);
	CombatManager.setHostileActors(tEnemy);
	CombatManager.displayLocation("CAPT. KANDAR");
	addButton(0, "Next", CombatManager.beginCombat);
}

public function iceQueenLossToZaalt():void
{
	showBust("ZAALT_NUDE");
	
	var vIdx:int = -1;
	if(pc.hasVagina())
	{
		var wombs:Array = [];
		for (var i:int = 0; i < pc.vaginas.length; i++)
		{
			if(!pc.isPregnant(i)) wombs.push(i);
		}
		if(wombs.length > 0) vIdx = wombs[rand(wombs.length)];
	}
	
	output("Zaalt slams into you like a Thraggen freighter, throwing you against a bulkhead and tearing into your");
	if (pc.hasArmor()) output(" [pc.armor]");
	else output(" gear");
	output(". You yelp and struggle against the milodan’s powerful hands, but you’re much too");
	if (pc.lust() >= pc.lustMax()) output(" turned on to resist him, intoxicated by his powerful musk and domineering grasp on your body");
	else output(" battered from his ferocious assault to resist him");
	output(".");
	if (CombatManager.hasFriendlyOfClass(Anno)) output(" Anno grabs Zaalt’s arm, trying to pull him off you. The sabertooth snarls and back-hands her, throwing her away with inhuman strength. The snowy dog-girl crashes against the bulkhead and falls still, knocked out.");
	output(" Zaalt snarls, sniffing at your neck. His eyes are dilated like someone as high as a kite, but his teeth are bared in a feral snarl as he drinks in your scent like a beast at hunt.");
	
	output("\n\nHis claws dispose of your [pc.gear], baring your flesh... and his, a moment later, leaving a throbbing shaft of black masculinity hanging down from his pelt of orange-black fur, tumescent in his animalistic need. Snarling, the feral milodan grabs you by the waist and throws you over your pilot’s console, leaving your ass bare and vulnerable. He grabs your cheeks, squeezing hard enough to make you squeal as he spreads them open and thrusts unceremoniously into your [pc.vagOrAss " + vIdx + "].");
	
	output("\n\nYour eyes go wide as the thick, black spear of cock brute-forces its way into your unprepared hole. Zaalt grunts, clutching at your hips and leaning over you, breathing hot and heavy against your back and neck as he shoves himself inside. Your hole clenches desperately around his thick shaft, trying instinctively to repulse the invading appendage. Zaalt breathes hard, letting you feel his pounding, strong heartbeat through his chest and cock.");
	
	output("\n\nYou whine, giving one last, desperate struggle against the domineering beast, but he plants a strong hand on your back and forces you down, leaving you no choice but to submit as he");
	if (vIdx >= 0) output(" breeds");
	else output(" violates");
	output(" you. Whatever’s gotten to Zaalt has left him as nothing more than a rutting beast, savagely thrusting into your [pc.vagOrAss " + vIdx + "] again and again. Between deep strokes, he nips and bites at your bare neck, marking you as his mate for all to see.");
	
	output("\n\nZaalt’s hips pound savagely against your [pc.butt], slamming you hard against your console.");
	if (pc.hasCock()) output(" Even in your state of utter submission, your body responds unconsciously. Your [pc.cocks] stiffen" + (pc.cocks.length == 1 ? "s" : "") + ", flopping uselessly against the dash and drooling your subconscious arousal.");
	output(" Your body tries to clench and push back, but that only seems to enhance the beast-man’s pleasure, making him growl into your ear and thrust all the more savagely against you.");
	
	output("\n\nBefore long, you feel something thick and heavy pressing against the entrance to your [pc.vagOrAss " + vIdx + "]. Your eyes go wide as you realize that the milodan equivalent of a bitch-breaking knot is pressing against your battered");
	if (vIdx >= 0) output(" pussy");
	else output(" ass");
	output("-flesh. The heavy bulb of meat hammers against you with every thrust, trying to force its way past your flagging defenses to fully bind you to the feral beast that was your passenger.");
	
	output("\n\nThankfully,");
	
	if ((vIdx >= 0 && pc.vaginalCapacity(vIdx) > enemy.cockVolume(0) * 1.2) || (vIdx < 0 && pc.analCapacity() > enemy.cockVolume(0) * 1.2))
	{
		output(" you’re so stretched out already that he’s able to easily grind his knot into your [pc.vagOrAss " + vIdx + "], straining your hole open and making you spasm around the thick tie.");
	}
	else output(" he isn’t quite able to force himself inside you all the way, thanks to the way you’re clenching and squeezing down around his shaft. Zaalt growls in frustration, fucking you harder to try and force it in, to no avail.");

	if (vIdx >= 0) pc.cuntChange(vIdx, enemy.cockVolume(0));
	else pc.buttChange(enemy.cockVolume(0));
	
	output(" You moan as the knotty cat-man ruts you, claws raking your bare flesh and breath coming heavily against the nape of your neck.");
	
	output("\n\nSlowly, you realize that Zaalt’s reaching his climax.");
	
	output("\n\nBellowing with feral need, Zaalt slams himself as deep into you as he can. You cry out, moaning weakly as you feel the first rushes of hot seed spilling into you, shooting deep into your");
	if (vIdx >= 0) output(" womb");
	else output(" bowels");
	output(" and plastering your insides with musky cat-cream. The milodan’s claws grip you fiercely, scoring your hips with dark lines as he empties his churning balls into your quivering hole.");
	
	output("\n\nWhen he’s finally finished, Zaalt lets out a long, ragged breath and collapses heavily on your back, breathing hard. You can do little more than squirm around the still-hard rod of cockmeat in your [pc.vagOrAss " + vIdx + "], trying not to let the cat’s claws hurt you. Slowly but surely, his breathing calms and his cock softens, drooping out of your abused hole in a waterfall of cooling kitty-cream.");
	
	output("\n\nZaalt grunts and staggers back, leaving you bent over in a complete mess. He looks around in a panic, suddenly breathing hard again, and turns. Your head falls against the dash, but you hear Zaalt wandering through your ship and, eventually, the airlock cycling. By the time you’ve recovered, your erstwhile passenger is nowhere to be found - long gone.");
	
	output("\n\nWhatever happened to him during your journey will remain a mystery...\n\n");

	processTime(15 + rand(6));
	flags["ICEQUEEN COMPLETE"] = -3;
	flags["ZAALT_DISABLED"] = 1;

	if (vIdx >= 0) pc.loadInCunt(enemy, vIdx);
	else pc.loadInAss(enemy);
	pc.orgasm();
	enemy.orgasm();

	CombatManager.genericLoss();
}

public function iceQueenBeatZaalt():void
{
	showZaalt();
	
	output("Zaalt staggers back, grabbing the sides of his head and screaming in agony. Your eyes go wide as the bestial cat-man’s eyes roll up in his head, and he falls onto his back. He convulses for a moment, then falls still.");
	
	output("\n\nWhat the hell was that all about?");
	
	if (CombatManager.hasFriendlyOfClass(Anno))
	{
		output("\n\n<i>“Whew,”</i> your ausar companion sighs, stuffing her handgun in her belt. <i>“Why’d your friend flip out like that, boss?”</i>");
	
		output("\n\nYou shrug. No idea.");
	
		output("\n\nAnno takes a knee and checks his pulse. <i>“Still alive, anyway. I’ll go find something to tie him up with.”</i> She gives you a wink and takes off.");
	}
	
	output("\n\nYou breathe a sigh of relief as the threat passes... for now. When he wakes up, though, who knows what’s going to happen?");

	clearMenu();
	addButton(0, "Kill Him", iceQueenBeatZaaltKill, undefined, "Kill Him", "Zaalt went insane, and God only knows what he’d have done if you hadn’t fought him down. You’ll brook no threat aboard your ship."); // pls go murderfucks
	addButton(1, "Authorities", iceQueenBeatZaaltWOOPWOOPITSDASOUNDOFDASPACEPOLICE, undefined, "Authorities", "Zaalt went insane, and he can’t be trusted anymore. Call the local Peacekeepers and have them arrest your would-be assailant.");
	addButton(2, "Help Him", iceQueenBeatZaaltHelpHim, undefined, "Help Him", "Whatever just happened, you don’t think it was Zaalt’s fault. Something made him freak out -- you’ve got to find out what.");
}

public function iceQueenBeatZaaltKill():void
{
	clearOutput();
	showZaalt();

	output("You glance at your [pc.weapon] and the cat-man, scowl, and finish him with a single strike to the head. You secure your weapon, heft the cat-man up, and start the arduous drag towards the airlock.");
	
	output("\n\n");
	if (pc.isAss()) output("The next time another cargo ship is close enough to muddle sensors around your ship, you eject Zaalt’s body into the black. Chances are, nobody will ever see it again.");
	else output("You spend the next several minutes filing a report with the local Peacekeepers, spinning it as self defense, and call up someone local to dispose of the body.");
	output(" Once that business is taken care of, you’re left to contemplate your course of action. Whatever you and Zaalt were going to do, there’s probably no completing his contract for him.");
	
	output("\n\nYou stow away the case of A.I. cores,");
	if (flags["MET_RHENESUNNE"] != undefined) output(" figuring you might be able to complete Zaalt’s contract, at the very least. <b>Anyxine would probably reward you for them.</b>");
	else output(" hoping that you’ll bump into someone who can take these off your hands sometime soon.");

	//Add [A.I. Cores] to Key Items.
	processTime(60 + rand(10));
	flags["ICEQUEEN COMPLETE"] = 1;

	pc.createKeyItem("Uveto A.I. Cores", 0, 0, 0, 0, "A.I. Cores recovered from Captain Zaalt Kandar, destined to be delivered to Uveto.");
	output("\n\n(<b>Gained Key Item: Uveto A.I. Cores</b>.)\n\n");
	CombatManager.genericVictory();
}

public function iceQueenBeatZaaltWOOPWOOPITSDASOUNDOFDASPACEPOLICE():void
{
	clearOutput();
	showZaalt();

	output("You key your comms and cycle over to the Confederate Peacekeepers’ open channel, thankful that even a backwater like Uveto has law enforcement of some kind. You’re eventually put in touch with a Deputy Lunasson, a huskily-built female ausar who bumbles through a few questions over comms while she comes up from planetside to the docks.");
	
	output("\n\nWhile she’s coming, you grab Zaalt and tie him up. Just in case. When you do, though, you notice that there’s a serious bloodstain on the deck near his neck, and a wound there that you didn’t cause. At least, you’re pretty sure that wasn’t your doing.");
	
	output("\n\nYou roll the unconscious cat-man over, poking at a small split in the skin near his spine... and finding something metallic underneath. An implant?");
	
	output("\n\nThere’s no time to investigate further, as Deputy Lunasson arrives a few moments later. Before she cycles through the airlock, you stow away Zaalt’s cargo for later - maybe you can find someone to take those off your hands later? Once that’s done, you open the lock and hand Zaalt off to the ausar Peacekeeper.");
	
	output("\n\nThe next several hours are spent trying to explain the situation, filing police reports, and generally trying to make sure nobody thinks you were responsible for something untoward. Luckily, things like this must happen from time to time, because Lunasson dutifully takes your statement, tells you that the Peacekeepers will be in touch but, assuming you don’t want to press charges, they’ll just hold him for a short while.");
	
	output("\n\nYou return to your ship to clean up after that, wondering what exactly caused an otherwise civilized man like Zaalt to go crazy like that. Did it have something to do with that implant you found? Maybe, but unless he chooses to get in contact with you someday, you doubt you’ll ever find out.");

	//Add [A.I. Cores] to Key Items.
	processTime(360 + rand(40));
	flags["ICEQUEEN COMPLETE"] = 2;

	pc.createKeyItem("Uveto A.I. Cores", 0, 0, 0, 0, "A.I. Cores recovered from Captain Zaalt Kandar, destined to be delivered to Uveto.");
	output("\n\n(<b>Gained Key Item: Uveto A.I. Cores</b>.)\n\n");
	CombatManager.genericVictory();
}

public function iceQueenBeatZaaltHelpHim():void
{
	clearOutput();
	showZaalt();
	userInterface.hideNPCStats();
	userInterface.leftBarDefaults();
	generateMap();

	flags["ICEQUEEN COMPLETE"] = 3;

	output("You kneel over Zaalt’s unconscious body, gently rolling him over. A dark bloodstain is spreading on the deck underneath his neck, and you grimace as you find the cause: a split in the skin on the back of his neck, right near his spine. No way you caused this. You brush your fingers around near the wound, trying to find the cause... and feeling something hot and metallic just beneath the surface. Some kind of implant?");
	
	output("\n\nYou pause, brow furrowed.");
	if (pc.characterClass == GLOBAL.CLASS_ENGINEER) output(" Looks like whatever the implant was, it overloaded. Hard. Probably what knocked him out, more than your efforts at any rate.");
	else output(" Whatever it is, it looks like it broke inside him.");
	output(" Maybe that’s what made Zaalt go insane?");
	
	output("\n\nDeciding not to take any chances, you still tie him up and move the unconscious brute to your common room, propping him up against a bulkhead.");
	
	output("\n\nAt your [pc.feet], Zaalt groans and stirs, weakly struggling against his bonds. You grab the emergency medikit from your bridge and spray a sealant over his neck wound and wrap it in a bandage, cutting off the steady bleeding the ruptured implant caused. The milodan gasps as you cinch the bandage tight around his neck, slowly opening his eyes just inches from your face.");
	
	output("\n\n<i>“Ugh. [pc.name]? What, uh... what’s going on?”</i>");
	
	output("\n\nYou blink back a moment’s surprise and ask Zaalt what the last thing he remembers is.");
	
	output("\n\nHe shifts uncomfortably, straining a wrist against the bonds, but he doesn’t struggle too fiercely with your [pc.weapon] still on display. <i>“Last thing I can remember is pulling into orbit. Docking with the station. Musta blacked out after that... So, what’s with the bondage setup, eh? I miss something fun?”</i>");

	output("\n\n");
	if (pc.isMisch()) output("Hardly.");
	else output("You scowl.");
	output(" <i>“No, you attacked me. And your neck...”</i> you say, pointing to the bandage. <i>“");
	if (pc.characterClass == GLOBAL.CLASS_ENGINEER) output("Whatever implant you got back there overloaded. Made you go kind of crazy there, start attacking me.");
	else output("You went nuts and started attacking me. And something popped in your neck...");
	output("”</i>");

	output("\n\n<i>“Wha...”</i> Zaalt groans, blinking. <i>“You’re shitting me. What-”</i> he cranes his neck, wincing as he cricks it to the side of the busted implant. <i>“Gah! Ow.”</i>");
	
	output("\n\nHe gasps. <i>“Gods and stars, [pc.name], I’m sorry,”</i> he says, rubbing the bandage. <i>“I... I’ve got no idea what happened. That shouldn’t have... that shouldn’t have happened.”</i>");
	
	output("\n\nYou pause and fix him with a stare. <i>“What do you mean, ‘shouldn’t have happened?’”</i>");
	
	output("\n\nHe grimaces beneath his tusks, avoiding your gaze. <i>“I’m... what most people would call a psyker. A lot of Uvetan races have latent psionics. Emphasis on latent! My implant, it’s supposed to help focus mental energy, let us actually use our abilities. But - agh, damn that stings!”</i>");

	output("\n\n");
	// 9999
	if (!pc.myMiddleNameIsJensen()) output("Do implants just rupture like that all the time? If so, that’s fucking horrifying... and t");
	else output("T");
	output("hat doesn’t exactly explain why he went ballistic on you, though. And you need to make sure that doesn’t happen again before you do anything... like take him onto a crowded space station to deliver his product.");

	output("\n\n<i>“Oh shit, the delivery!”</i> Zaalt says with a start. <i>“How’re we doing for time, [pc.name]? We’ve got to-”</i>");
	
	output("\n\n<i>“We’re already late,”</i> you say, glancing at the clock. If he was cutting it by minutes before, there’s no way you’re making your deadline after that stunt of his.");
	
	output("\n\nZaalt curses, surging against his bonds so suddenly that you have to take a step back, still holding your weapon. He keeps it up for a moment before slumping forward, moaning in pain. <i>“Let me go already. I’m fine!”</i>");
	
	output("\n\n<i>“Hold on,”</i> you say. He’s still not going anywhere until you get an explanation - no fast-talking his way out of this. Zaalt looks almost like he wants to just run past you, glancing between you and the airlock, tapping his foot on the deck. But he takes a deep breath and nods.");
	
	output("\n\n<i>“Look,”</i> he says. <i>“I don’t know what happened. Honest. The implant I’ve got is, uh, experimental. Not exactly corporate standard, if you get my drift. But it should have been stable - and even if not, it blowing out should have just killed me, not made me go nuts on you. That was </i>not<i> what they told me would happen.”</i>");

	output("\n\nThey?");
	
	output("\n\nZaalt shrugs. <i>“The people that made it. Like I said, it’s kind of home made. Guess it wasn’t ready for actual use. Tell you what: let me use your john for a minute and I’ll pop the bastard out. Just in case. Then we can make that delivery, yeah?”</i>");
	
	output("\n\nWell, all signs point to the implant having been the cause, so... sure, why not.");
	
	output("\n\nHe smiles weakly. <i>“Thanks. I mean it. And... sorry. I really am.”</i>");
	
	output("\n\nYou sigh and untie him, pressing the medical kit into his paw. Can’t exactly keep him here, and he’s your only shot at getting the reward, after all.");
	
	processTime(35);

	clearMenu();
	addButton(0, "Next", iceQueenBeatZaaltHelpHimII);
}

public function iceQueenBeatZaaltHelpHimII():void
{
	clearOutput();
	showZaalt();

	output("A few minutes later, Zaalt comes out with a small metal chip held in a clump of bloodied cloth, which he stuffs into one of his vest pockets.");
	
	output("\n\n<i>“Gah, they ought to give you some kind of filler chip to go with these. Empty slot feels so... empty. And cold.”</i> Zaalt groans, rubbing the back of his neck as he picks up his briefcase. <i>“So, you ready?”</i>");
	
	output("\n\nYou step aside,");
	if (pc.isAss()) output(" insisting");
	else output(" gently suggesting");
	output(" that Zaalt take the lead - you’ll follow him to wherever he’s supposed to deliver these. He nods understandingly as the airlock cycles through, though, and soon the two of you are walking through the sterile blue docking arm leading into the heart of the station.");
	
	output("\n\nSecurity cameras and drone turrets eye you suspiciously as the two of you make the long walk into the station, following your every step with their cold robotic eyes. Zaalt fidgets nervously, rubbing the bandaged back of his neck. <i>“Geez, you never get used to the security here. Damn corporate types, paranoid about someone stealing profits off this backwater?”</i>");
	
	output("\n\n<i>“Not very fond of your homeworld, are you?”</i>");
	
	output("\n\nHe shrugs. <i>“It’s not my homeworld. Just the species’. Besides, it’s not like most milodan get a say in what happens up here.”</i>");
	
	output("\n\nAs if to demonstrate his point, Zaalt nods to a pack of purple-furred toves gathered around a service desk at the space elevator, all staring at him with their tiny gold eyes. One of them makes a panicked chirping sound, and they all suddenly look very busy with a data console. You guess seeing a milodan up on the station must be a rare occurrence.");
	
	output("\n\nZaalt growls in the toves’ general direction and waves you towards the western wing of the station, and a small cafe sitting a stone’s throw from the elevator. <i>“Here. The handoff was supposed to be here. With any luck, we can still make some credits.”</i>");
	
	processTime(20);

	clearMenu();
	if (flags["KQ2_QUEST_FINISHED"] == undefined || flags["KQ2_QUEST_FINISHED"] == 2)
	{
		// No Kara
		addButton(0, "Next", iceQueenNoKara);
	}
	else
	{
		// Kara
		addButton(0, "Next", iceQueenKaraShowsUp);
	}
}

public function iceQueenNoKara():void
{
	moveTo("UVS B7"); // Uveto cafe
	showLocationName();
	
	clearOutput();
	showZaalt();

	pc.credits += 10000;

	output("<i>“There’s our guy,”</i> Zaalt says, subtly nodding his head to where a young man is leaning back at a table against the far wall. He’s obviously not human, covered in a thin layer of navy blue fur culminating in a mop of dark red hair and a pair of perky, rabbit-like ears. Your contact’s dressed in a black flight jacket, unzipped to show off a blood red T-shirt with the words <i>HEAVY METAL BAND</i> inscribed across it in obviously ironic swirling font.");
	if (pc.characterClass != GLOBAL.CLASS_ENGINEER) output(" You immediately notice the holsters under his jacket, packed with a pair of holdout pistols, likely imperceptible to eyes less keen than yours.");
	output(" <i>“C’mon. Let’s get this done.”</i>");
	
	output("\n\nYou nod, letting Zaalt lead the way over to the lounging");
	if (!CodexManager.entryUnlocked("Laquines")) output(" alien");
	else output(" laquine");
	output("’s table, and you both take a casual seat across from him, like old friends meeting for lunch. Zaalt puts his case down beside you both, as casual as can be. The figure’s eyes languidly roll open, glancing at you for a moment before a little smile breaks out on the man’s faintly-angular face.");
	
	output("\n\n<i>“" +pc.mf("Gentlemen", "‘Sup") +".”</i> He says by way of greeting. <i>“You two need something?”</i>");
	
	output("\n\n<i>“I’m Zaalt,”</i> your feline companion says, extending a hand.");
	
	output("\n\nThe blue-furred man declines to shake it, though he at least sits up a little straighter. <i>“Cool. That means you’ve got something for me, then?”</i>");
	
	output("\n\n<i>“Sure do,”</i> Zaalt answers, sliding the briefcase along the deck with a foot. <i>“We good?”</i>");
	
	output("\n\nThe man yawns and stretches, moving the case all the way with a foot as he does so. After a moment’s pause he picks it up like it was his all along and eyes the contents. <i>“Yeah, we’re good. ‘Cept you’re late.”</i>");

	output("\n\n<i>“Sorry about that. Totally my fault,”</i> Zaalt says, before you can speak. <i>“Had some, uh, technical mishaps. Unavoidable.”</i>");
	
	output("\n\n<i>“Uh-huh,”</i> the furry guy answers, resting the case in his lap. <i>“Whatever, man. You got the stuff here, so I still owe you something. Here.”</i>");
	
	output("\n\nHe flips a credit chit out of his jacket pocket and into Zaalt’s hand. <i>“Don’t spend it all in one place. I’ll make sure everything gets in the right hands.”</i>");
	
	output("\n\nZaalt nods as the man stands up and saunters off to the north, case in hand. Your companion, meanwhile, runs the chit through his holoband and oggles the display hungrily. After a second, the device beeps and Zaalt grins happily. At his request, you hand off your Codex and let him transfer your part of the payment. When he returns it, you see that your bank account is a meaty 10,000 credits richer than when you woke up this morning.");
	
	output("\n\n<i>“I know credits can’t make up for what happened, but it’s the best thing I can do to say ‘I’m sorry,’ you know. I’m going to stick around here a while and try and find out what happened with my implant. Can’t have that happening again.”</i>");
	
	output("\n\nYou nod, pocketing your Codex. Maybe you’ll see Zaalt around again sometime... if his brain doesn’t explode first.\n\n");
	
	processTime(15);

	CombatManager.genericVictory();
}

public function showKaraAndZaalt():void
{
	author("Savin");
	showName("KARA &\nZAALT");
	//showBust("KARA", "MILODANMALE"); 9999
	showBust("KARA", "ZAALT");
}

public function iceQueenKaraShowsUp():void
{
	moveTo("UVS B7"); // Uveto cafe
	showLocationName();
	
	clearOutput();
	showKaraAndZaalt();

	output("<i>“[pc.name]?”</i>");
	
	output("\n\nYou look around in surprise at hearing your name, not from Zaalt but from a sweet, feminine voice over the din of chatter suffusing the cafe. It takes a second to zero in on the familiar voice: a cobalt-haired kaithrit sitting in the back, one hand clutching a kitty bell necklace and the other waving to you.");
	
	output("\n\n<i>“Kara?”</i> you ask, half to yourself, and half to Zaalt as he leads you over.");
	
	output("\n\n<i>“Guess that settles it,”</i> the milodan grins, extending a hand to her. <i>“You must be Kara.”</i>");
	
	output("\n\nShe gives you a wink and shakes your companion’s hand. <i>“");
	if (kara.isNice()) output("A pleasure,");
	else if (kara.isMisch()) output("The one and only!");
	else output("Yeah, that’s right,");
	output("”</i> she answers. <i>“Captain Kandar I presume?”</i>");
	
	output("\n\nHe nods. <i>“And... it looks like you two already met.”</i>");
	
	output("\n\n");
	if (flags["SEXED_KARA"] != undefined) output("<i>“Intimately,”</i> your lover smirks, sauntering up and grabbing two handfuls of your [pc.butt], pulling you into a kiss. <i>“I wasn’t expecting to see you here, [pc.name], but I’m not complaining. Guess this makes up for you two being late.”</i>");
	else output("<i>“Yeah, [pc.name] pulled me out of some hot water back on Myrellion. Kicked some Void ass on the way, too.”</i>");
	
	output("\n\nZaalt chuckles, slapping you on the back. <i>“That right? Heh, galaxy’s a small place, I guess.”</i>");
	
	output("\n\n<i>“So what are you doing here, Kara?”</i> you ask.");
	
	output("\n\nShe beckons you and Zaalt to sit at her table, resuming her seat when you do. <i>“I get to play delivery girl for Zaalt’s cargo, of course. Just here to pick that up, and I’m on my way.”</i>");
	
	output("\n\nSomething tells you Kara isn’t sidelining as a RhenWorld executive these days. You turn to Zaalt with an inquisitive look, and get a noncommittal shrug in response. <i>“All I had was a name!”</i>");
	
	output("\n\nHe plants the suitcase on the table and slides it over to Kara. <i>“There you go. One under-sized order of A.I. cores. Wanna take a look and make sure everything’s alright?”</i>");
	
	output("\n\n");
	if (pc.characterClass == GLOBAL.CLASS_SMUGGLER) output("You just barely pick up on a slight change in Zaalt’s voice around <i>“under”</i> and <i>“look.”</i>");
	else output("Something feels off about all of this. Kara being here, Zaalt attacking you... you get the feeling you’re being played.");
	
	output("\n\nAs subtly as you can, you glance down under the table in time to see him with the bandage-wrapped implant clutched in his paw. Kara takes it, even as she’s nonchalantly inspecting the cargo on the table.");
	
	processTime(5);

	clearMenu();
	addButton(0, "Interrupt", iceQueenKaraShowsUpInterrupt, undefined, "Interrupt", "What the hell, guys? First you get Zaalt going crazy on you, and now he’s been playing you? No way you’re taking this lying down!");
	addButton(1, "Keep Cool", iceQueenKaraShowsUpCOOLIT, undefined, "Play It Cool", "This really doesn’t concern you. Just play it cool, get your credits, and put this all behind you.");
}

public function iceQueenKaraShowsUpCOOLIT():void
{
	clearOutput();
	showKaraAndZaalt();

	flags["ICEQUEEN KARA STUFF"] = 1;

	output("You decide not to say anything, simply leaning back in your chair as Kara inspects the <i>“merchandise,”</i> quietly pocketing the damaged implant. So that was Zaalt’s real cargo all along? Doesn’t quite explain why he went ballistic all of a sudden, but then again, who knows what could be up with a piece of smuggled biotech? Definitely wasn’t ready for market, whatever it is.");
	
	output("\n\n<i>“Okay, all set,”</i> Kara says, giving you another playful wink. <i>“Thanks "+ pc.mf("boys", "you guys") + ", I’ll make sure this gets to the right place. And for you...”</i>");
	
	output("\n\nThe cobalt kaithrit fishes a credit chit from out of her skintight suit’s very generous cleavage, planting it on the table and sliding it across. <i>“Divvy it up however you want. As for me, I have an appointment to keep. It was good seeing you again, [pc.name]. Till next time.”</i>");
	
	output("\n\nKara slips out of her seat and heads for the dock");
	if (flags["SEXED_KARA"] != undefined) output(", pausing to plant a parting kiss on your brow");
	output(". You wave as she goes, then turn to Zaalt. He swipes the chit across his holoband, taps his finger across its screen, and smiles. <i>“Heh. A little less than I was hoping for, but considering our, uh, unfortunate delay... here, gimme that Codex of yours.”</i>");
	
	output("\n\nYou hand it over, and Zaalt swipes both your devices together. When he returns it, you see that your bank account is 10,000 credits bigger than before.");
	
	output("\n\n<i>“I know credits can’t make up for what happened, but it’s the best thing I can do to say ‘I’m sorry,’ you know. I’m going to stick around here a while and try and find out what happened with my implant. Can’t have that happening again.”</i>");
	
	output("\n\nYou nod, pocketing your Codex. Maybe you’ll see Zaalt around again sometime... if his brain doesn’t explode first.\n\n");
	
	processTime(10+rand(5));

	pc.credits += 10000;

	CombatManager.genericVictory();
}

public function iceQueenKaraShowsUpInterrupt():void
{
	clearOutput();
	showKaraAndZaalt();

	output("<i>“Hey!”</i> you say, grabbing Zaalt’s wrist and dragging his paw up into the light, bloody bandage and all. A little pressure makes him grunt in pain and open his fist, revealing the tiny metal implant that had been in his neck mere moments ago. <i>“What gives?”</i>");
	
	output("\n\nZaalt’s response is a bewildered <i>“Uhhh,”</i> followed by yanking his hand out of your grasp, plying his great strength and stature to free himself. <i>“Hey, uh, look, this isn’t-”</i>");
	
	output("\n\n");
	if (kara.isAss()) output("<i>“Oh my <b>God</b>, is this fucking amateur hour?”</i> Kara snarls, reaching across the table and snatching the implant out of Zaalt’s hand before anyone can see it. <i>“Tell me you didn’t try to pull one over [pc.name] <b></i>Steele<i></b>.”</i>");
	else output("<i>“Knock it off!”</i> Kara whispers, grabbing the implant and stuffing it, bandages and all, into her catsuit and zipping herself up to the neck. <i>“Now what’s going on here? Zaalt, what gives?”</i>");
	
	output("\n\nYou fix Kara with a stare and say that Zaalt here has been playing you from the start. Not only did he lead you into this under false pretenses - which seems to be a recurring theme for her and her compatriots now - but he lost his damn mind when you arrived in orbit and attacked you. Apparently that implant, the one he’s trying to pawn off on her, was responsible in some way. Everything about this situation is bullshit, and you’re fucking sick of it!");
	
	output("\n\nKara sighs, putting her hands up in a placating gesture. <i>“Okay, okay, calm down. Zaalt, I don’t know what you were trying to pull bringing someone in on a job this big without telling them, but...”</i>");
	
	output("\n\n<i>“Don’t look at me like that!”</i> he grunts, crossing his arms. <i>“How the hell was I supposed to know [pc.name] was in good with you and Chow? [pc.HeShe] was just the first person to answer my mayday.”</i>");
	
	output("\n\n<i>“Ugh! Look, I’m sorry, [pc.name],”</i> Kara says, putting a hand on yours. <i>“I didn’t know. So let me be honest for Zaalt: that implant of his is, well, not corporate standard. Which is to say, it’s illegal to sell or use in sapients because it hasn’t been tested properly. But it’s supposed to be powerful. </i>Way<i> powerful, compared to what’s on the market now. Zaalt and I were both hired to take the implant prototype from the lab it was built in, out here to the Uveto system for testing. This is a corporate world, basically a non-concern for Confederate law enforcement, and so many of the native races have primal psionic ability that it seemed like the ideal place to conduct tests.”</i>");
	
	output("\n\nSays who? Who paid for all of this, anyway?");
	
	output("\n\n<i>“That, I don’t know,”</i> Kara says with an apologetic shrug. <i>“We’re smugglers, not corporate agents. We got the job through our employer, who got it from someone else... there’s a lot of deniability all the way back, just in case. For all we know, the person we’re delivering the implant to is the same one who made it, and just couldn’t be bothered to bring it in through normal channels.”</i>");
	
	output("\n\n<i>“And you know it’s not safe, right?”</i> you follow up, glowering at Zaalt.");
	
	output("\n\nHe shakes his head. <i>“No, they didn’t tell us anything like that. I wasn’t supposed to be using it, for starters, except that my ship nearly got ripped in half and I had to improvise a way to get it through Uvetan security. And keep you from seeing it,”</i> he adds, actually looking a little ashamed for once. His big feline ears droop and he rubs one of his tusks awkwardly. <i>“I’m just gonna be saying ‘sorry’ all day, aren’t I?”</i>");
	
	output("\n\n");
	if (pc.isAss()) output("Damn straight.");
	else if (pc.isBimbo()) output("Weeeeell, maybe until he comes up with a good way to make it all up to you. Maybe a gentler version of what he seemed to want on the ship...");
	else output("Well, you kind of deserve it after all that!");
	
	output("\n\nZaalt fidgets, and Kara laughs before saying, <i>“Look, this job seems like it got kind of bungled. It happens.");
	if (kara.isNice()) output(" I wish you’d get a break from all this. It seems like trouble just hounds you!");
	else if (kara.isMisch()) output(" You’re a regular magnet for bad luck!");
	else output(" Happens around you a lot, it seems.");
	output(" But then again, where would the fun be if that wasn’t the case? The best I can do is offer you payment in full for the delivery, including the on-time bonus from my employer. Fair?”</i>");
	
	processTime(6);

	//[Sure] [Sex?] [No]
	clearMenu();
	addButton(0, "Sure", iceQueenKaraShowsUpInterruptSure, undefined, "Sure", "Sounds fair.");
	addButton(1, "Sex?", iceQueenKaraShowsUpInterruptSex, undefined, "Sex?", "Credits and " + (flags["SEXED_KARA"] == undefined ? "letting Kara make good on her previous offers for a little post-danger recreation" : "another roll in the hay with Kara") + ", and you’ll call it even.");
	addButton(2, "No", iceQueenKaraShowsUpInterruptNo, undefined, "No", "No way. Fuck this. You’re not letting this go easy!");
}

public function iceQueenKaraShowsUpInterruptSure():void
{
	clearOutput();
	showKaraAndZaalt();

	pc.credits += 8000;
	flags["ICEQUEEN KARA STUFF"] = 2;

	output("You nod and, after a quick exchange of codexes and other handheld devices, confirm a meaty 8,000 credits have been added to your bank account. Zaalt seems pleased with his payday, and tucks the A.I. core case under his arm.");
	
	output("\n\n<i>“Well, that’s it then. I think I’m going to do some investigation planetside... something about that implant rubs me the wrong way still. Heard about an expert down there who might tell me something.”</i>");
	
	output("\n\nKara stands and adjusts her catsuit around her bust, and the package hidden within it. <i>“Sounds like a plan. I’ll get our product where it needs to go. See you around, "+ pc.mf("boys", "you two") +",”</i> she says, blowing you a kiss as she sashays past, back towards the docking arm.");
	
	output("\n\nZaalt makes to follow her a moment, then pauses just as he’s about to pass you. <i>“Look, I understand you probably never want to see me again. I made... a lot of mistakes today. See you around, [pc.name].");
	
	output("\n\nYou");
	if (pc.isAss()) output(" shove him off");
	else output(" wave half-heartedly");
	output(" as he steps away, fading into the crowd of spacers near the elevator.");
	
	output("\n\nAt least you made some money off of this clusterfuck.\n\n");
	
	processTime(5);

	CombatManager.genericVictory();
}

public function iceQueenKaraShowsUpInterruptNo():void
{
	clearOutput();
	showKaraAndZaalt();

	flags["ICEQUEEN KARA STUFF"] = 4;
	flags["ZAALT_DISABLED"] = 1;

	pc.addHard(5);

	output("<i>“No fucking way,”</i> you snarl, scowling as much at Kara now as Zaalt. After all you’ve done for her, and this is how she and her friends treat you!?");
	
	output("\n\nThe cat-girl squirms under your ireful gaze, rubbing at the small golden bell on her collar. <i>“I’m sorry, [pc.name]. Would that I’d known you’d get wrapped up in this, I’d have arranged to be on your leg of the trip. But this is all just an accident - a big misunderstanding. Nobody’s </i>trying<i> to screw you. We-”</i>");
	
	output("\n\nEnough! Whatever the two of them are doing, it’s too dangerous to just let slip. Not after what happened on your ship.");
	
	output("\n\n<i>“What do you want us to do, huh?”</i> Zaalt grunts, rapping the table with his claws. <i>“We’re smugglers. This is just another job. One that got all screwed up.”</i>");
	
	output("\n\nFor starters, they could stop that implant from getting into the wrong hands. The hands of whoever wants it. After all, it’s already damaged - who’s to say it didn’t get destroyed wholesale?");
	
	output("\n\nKara blinks. <i>“You’re serious, huh? Ugh, if it means that much to you... well, it’s not the first time I’ve lost cargo. Our employer would believe it.”</i>");
	
	output("\n\n<i>“Are <b>you</b> serious!?”</i> Zaalt growls. <i>“We’re totally out of pay if you do that. And my </i>Ice Queen<i> got tore up just trying to get here!”</i>");
	
	output("\n\n<i>“");
	if (kara.isAss()) output("Well maybe you shouldn’t have put the merchandise </i>in your fucking head,”</i> Kara growls.");
	else output("Maybe if you hadn’t put the merchandise in your skull, this could have been avoided,”</i> Kara sighs.");
	output(" <i>“Besides, weren’t you carrying a bunch of legit cargo anyway? I’m sure you’ll break even.”</i>");
	
	output("\n\nHe scowls, rising to his feet and grabbing the box of A.I. cores. <i>“This is bullshit.”</i>");
	
	output("\n\n<i>“Whine to Chow about it,”</i> Kara says, patting the top of her bust. <i>“In the meantime, we’ll hold onto this. Bye!”</i>");
	
	output("\n\nZaalt curses and stomps off, taking his case with him. When he’s gone, Kara sighs and plants her chin in her hands, looking at you with heavy eyes. <i>“Just remember I always have your back, [pc.name], even though this is going to cost Zaalt and I a pretty credit. So. What do you wanna do with this implant?”</i>");
	
	output("\n\nShe zips her catsuit back down, showing off a generous bit of cleavage before retrieving the bundle. <i>“Ech, gross. I don’t know if you’re jacked or not, but I wouldn’t use this even after you clean it up. Either take it to someone who can fix it, or give it a good stomp and vent it out the airlock.”</i>");
	
	output("\n\n<b>Kara hands you the damaged psionic amp.</b> and stands, putting a hand on your shoulder. <i>“Up to you. I’m going to go play damage control with Zaalt and our network. See you around,");
	if (flags["SEXED_KARA"] != undefined) output(" babe");
	else output(" [pc.name]");
	output(".");

	processTime(5);
	
	pc.createKeyItem("Broken Psi Amp", 0, 0, 0, 0, "A broken Psionic Amplifier, removed from Captain Zaalt Kandar’s skull. After it went <i>slightly</i> batshit.");
	output("\n\n(<b>Gained Key Item: Broken Psi Amp</b>.)\n\n");

	processTime(30 + rand(15));

	CombatManager.genericVictory();
}

public function iceQueenKaraShowsUpInterruptSex():void
{
	clearOutput();
	showKaraAndZaalt();

	flags["ICEQUEEN KARA STUFF"] = 3;

	output("<i>“I guess we can call it even,”</i> you answer, reaching across the table to stroke one of Kara’s hands. <i>“...if you throw in a little </i>extra<i>.”</i>");
	
	output("\n\nKara giggles, chewing on a lip for a moment before giving you a smile. <i>“I was starting to think");
	if (flags["SEXED_KARA"] == undefined) output(" you’d never ask");
	else output(" we were a one and done thing");
	output(", [pc.name]. Why don’t we sort Zaalt’s credits out, and then head back to </i>Ghost<i>?”</i>");
	
	output("\n\nNow that sounds like a plan.");
	
	output("\n\nAfter a quick exchange of codexes and other handheld devices, you confirm a meaty 8,000 credits has been added to your bank account. Zaalt seems pleased with his payday, too, and tucks the A.I. core case under his arm.");
	
	output("\n\n<i>“Well, that’s it then. I think I’m going to do some investigation planetside... something about that implant rubs me the wrong way still. Heard about an expert down there who might tell me something. Have fun you two, I guess.”</i>");
	
	output("\n\nKara stands and adjusts her catsuit around her bust, and the package hidden within it. To you, that’s just an opportunity to get a handful of that lush posterior of hers, squeezing just hard enough to make her twinned blue tails squirm, and the front of her jumpsuit’s crotch bulge with a more masculine need.");
	
	output("\n\n<i>“Heh, guess that’s settled. See you around, Zaalt. As for you,”</i> Kara says, pulling you to your [pc.feet] and pressing herself against you in a way that makes her ample chest spread heavily against your [pc.chest]. <i>“Just follow me.”</i>");
	
	output("\n\nShe leans in and plants a kiss on your lips while Zaalt walks off, leaving you two to be ogled by the cafe’s other patrons until Kara takes you by the hand and leads you back down the docking arm...");

	processTime(10 + rand(5));
	pc.credits += 8000;

	clearMenu();
	addButton(0, "Next", iceQueenKaraSexytimes);
}

public function iceQueenKaraSexytimes():void
{
	moveTo("UVS F15"); // Ship hangar
	showLocationName();
	
	clearOutput();
	showKara(true);
	
	output("A few minutes later and you’re stumbling through the airlock of the <i>Ghost</i>, both hands supporting Kara’s soft ass as she rides you, legs wrapped around your midriff and lips eagerly exploring your neck. Her tails swish quickly around your [pc.feet], making you stumble all the more until the door finally opens, and you end up staggering in and shoving her up against a bulkhead. Kara gasps and moans, rolling her head back as she’s pressed tightly between you and the cold metal, left helpless but to let your teeth grip the zipper of her catsuit and yank it down until you’ve got a clean shot at those beautiful E-cups of hers.");
	
	output("\n\n<i>“M-my cabin’s that way,”</i> she gasps as your lips lock around a pierced nipple, pulling the breast free of her tight catsuit and into your grasp. What’s she got to worry about? You’ve got half a mind to take her here and now - and if the way her crotch is bulging, pressing needily against your hip, she wants it too. It takes all the will you can muster to pull yourself off the feline beauty and cart her into her cabin, throwing her down on the plush bed and leaping on her");
	if (!pc.isNude()) output(", shedding your clothes as you go");
	output(".");
	
	output("\n\nYour hands pin hers to the bed, spreading them out as you work her zipper further and further down. She moans throatily as you finish, letting the stiffening weight of her feline cock free and into your hand. A few playful strokes has her groaning in need, bucking her hips into your hand. Between lustful moans, she wiggles her shoulders free of her catsuit, enough to give you the hint to pull it all the way down around her hips.");
	
	output("\n\nOnce your hands are off of hers, though, Kara gives you a playful shove and rolls you onto your back, swinging herself around to straddle your waist. Your hands are already immediately planted on the kitty’s tush and after one last moan-inducing squeeze, you reach up to grab the latex scrunched up around her flared hips. You peel it down, freeing her pert behind... and letting the hot, heavy rod of her hermaphroditic sex flop onto your belly, followed by a pair of meaty weights that brush against your");
	if (pc.hasCock()) output(" own cock");
	else output(" groin");
	output(".");
	
	output("\n\n");
	if (pc.isMisch()) output("Somebody’s happy to see you! ");
	else if (pc.hasCock()) output("Looks like you’re not the only one thinking about getting your dick wet...\n\n");
	
	output("Kara gives a wiggle of her hips, letting you pull her suit off of her long legs, leaving her just as bare as you are. One of her hands reaches down, caressing her cock in one, and keeping your face pinned between her breasts with the other.");
	if (pc.hasCock()) output(" She hesitates for a moment after that, though: a silent offer to let you decide who’s fucking who...");
	
	//if PC no cock: [Next] into Take Kittydick. Else, give options.
	pc.createStatusEffect("Kara Fuck Alternate Path");
	
	processTime(10);

	clearMenu();
	if (!pc.hasCock())
	{
		addButton(0, "Next", kq2KaraTakeKittydick);
	}
	else
	{
		addButton(0, "TakeDick", kq2KaraTakeKittydick, undefined, "Take Her Dick", "Ride her kitty cock!");
		addButton(1, "FuckHer", kq2KaraFuckKittysKitty, undefined, "Fuck Kara", "Fuck Pussy’s Pussy!");
	}
}

public function zaaltPregnancyEnds():void
{
	clearOutput();
	author("Wsan");
	showBust("");
	showName("\nBIRTHING!");
	
	var se:StorageClass = pc.getStatusEffect("Zaalt Pregnancy Ends");
	
	// Failsafe
	if(se == null)
	{
		output("ERROR: 'Zaalt Pregnancy Ends' Status Effect does not exist.");
		clearMenu();
		addButton(0, "Next", mainGameMenu);
		return;
	}
	
	var numChildren:int = se.value1;
	var bRatingContrib:int = se.value2;
	var pregSlot:int = se.value3;
	var babym:Boolean = (se.value4 == 1 ? false : true);

	if(currentLocation != "SHIP INTERIOR") 
	{
		output("Oh, jeez! You can feel a stirring in your stomach; it feels like the kit");
		if(numChildren > 1) output("s");
		output(" want");
		if(numChildren == 1) output("s");
		output(" out. Time to get back to your ship!");
		output("\n\nYou stumble aboard your ship, shutting yourself in your room and lying down on a blanket.");
	}
	else
	{
		output("Oh, jeez! The kit");
		if(numChildren > 1) output("s");
		output(" want");
		if(numChildren == 1) output("s");
		output(" out, and ");
		if(numChildren == 1) output("it wants");
		else output("they want");
		output(" out <i>now</i>. You shut yourself in your room and lie down on a blanket.");
	}
	//Hour passes
	output("\n\nBy the time you’re finished, there’s ");
	if(numChildren == 1) output("a lone kit");
	else
	{
		output(num2Text(numChildren) + " healthy kits");
	}
	output(" on your blanket, waving ");
	if(numChildren == 1)
	{
		if( babym ) output("his");
		else output("her");
	}
	else output("their");
	output(" little arms and feet about. Oddly enough, none of them are crying. That Milodan toughness at work, you suspect. With a tired smile, you gently wash ");
	if(numChildren > 1) output("each one");
	else output( babym ? "him" : "her" );
	output(" off with some warm water and bundle your ");
	if(numChildren == 1) output("child");
	else output("children");
	output(" up in some comfortable sheets before calling for the nursery pods.");
	output("\n\nWatching the kit");
	if(numChildren > 1) output("s");
	output(" disappear makes you forlorn for a while, but you remind yourself that it’d be wildly irresponsible to take your kids along on your incredibly dangerous space journey. This is for the best, really. You can see them on Tavros any time you want to.");
	output("\n\nAs for you, you quickly wash yourself off in the shower and practically crawl into your bed looking and feeling like some kind of half-dead sea slug. Giving birth is tiring work, and it’s definitely time for a nap.");
	
	moveTo("SHIP INTERIOR");
	pc.removeStatusEffect("Zaalt Pregnancy Ends");
	//14 hours pass
	
	processTime(14*60);
	clearMenu();
	addButton(0, "Next", zaaltPreggoEpilogue);
}
public function zaaltPreggoEpilogue():void
{
	clearOutput();
	showName("MORNING\nAFTER");
	output("You wake up with a slight headache and a dry mouth, both of which dissipate when you rouse yourself from your well-deserved slumber and wash yourself. Time to get back to adventuring!");
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
