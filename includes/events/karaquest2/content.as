/* FLAGDOC

KQ2_QUEST_OFFER 		-- GameTimestamp that the quest was offered at
KQ2_QUEST_DETAILED		-- GameTimestamp that the player went to meet Kara
KQ2_QUEST_BEGIN			-- Players decision about starting the quest
						-- 0/undefined, no decision
						-- 1 player accepted
						-- 2 player rejected
KQ2_SEX_PAY				-- Player asked for sexytimes as extra payment
KQ2_CREDS_FIRST			-- Player asked for additional credits up front
KQ2_KARA_WITH_PC		-- Karas current location
						-- 0/undefined, GONES
						-- 1 with the player
						-- 2 on the radio tower
KQ2_RND_ENTRANCE_OPEN	-- 0/undefined, closed
						-- 1 blown open with the tank
						-- 2 used keycard
						-- 3 manual override
						-- 4 kara did things
KQ2_RF_KENNEL_USED		-- 0/undefined, unused
						-- 1 fixed damaged tamwolf (got regular tamwolf)
						-- 2 upgraded regular tamwolf
TAMWOLF_DAMAGE_UPGRADE	-- 0/undefined, current damage for undamaged tamwolf
						-- 1 upgraded/adaptive damage for tamwolf (TODO)
KQ2_WATSTON_MET
KQ2_DEFEATED_ENGINEER
KQ2_DEFEATED_JUGGERNAUT
KQ2_DEFEATED_KHAN
KQ2_KHANS_FILES			-- 0/undefined, nothing
						-- 1 Karas swiped Khans files
KQ2_NUKE_STARTED		-- undefined, nuke not active
						-- otherwise, timestamp that the player activated the nuke at

KQ2_FOUGHT_AMARA		-- 0/undefined, nope


SAVE IMPORT FLAGS
SILENCE_RESCUED_CONNIE	-- 0/undefined, no
						-- 1, Kara rescued Connie
*/

public function showKara():void
{
	showBust("KARA");
	author("Savin");
	showName("\nKARA");
}

public function tryProcKQuest2Entry():Boolean
{
	// On enter/leave ship on Myrellion
	// Taivra defeated
	// Kara aided in KQuest1

	kq2SaveImport();
}

public function kq2SaveImport()
{
	// Figure this shit the fuck out

	kq2Offer();
}

public function kq2Offer():void
{
	flags["KQ2_QUEST_OFFER"] = GetGameTimestamp();

	output("\n\nAs you’re boarding your ship, your Codex bleeps an alert: incoming video-call. From an in-system number, you note, as you take it out and glance at the screen. Curious, you tap the <b>Accept</b> button.");

	output("\n\nIt takes you a moment to recognize your caller as the fuzzy camera feed filters in: there’s a lot of interference in the connection, but the video eventually consolidates into a vaguely familiar shape: a cat-girl with cobalt-blue hair and a leather choker around her neck, sporting a cute kitty bell that jingles ever so slightly with its owner’s every movement. <b>It’s Kara!</b>");

	output("\n\n<i>“Hello again, captain,”</i> the kaithrit vagabond purrs, leaning in with her elbows atop some kind of console under the camera, cradling her chin. She gives you a faint hint of a smile, her odd eyes glinting in the light. <i>“Glad to see you’re still in-system; I’ve been meaning to talk to you again. To say thank you again, and to give you a new proposition, if you have the time: another job. And one that’ll pay several times more than that business in the Golden Peak.”</i>");

	output("\n\nWell, she was good for the money last time. You suppose you could hear her out, if nothing else.");

	output("\n\n<i>“Great,”</i> she grins, flicking a hand across a screen. Your Codex beeps with an incoming message, displaying a set of stellar coordinates. <i>“I’m parked in the second moon’s ring. Meet me at those coordinates, "+ pc.mf("handsome", "sweetheart")+", and I’ll tell you everything.”</i>");

	output("\n\nWithout waiting for a response, the mysterious cat-girl closes the channel, leaving you with a set of navpoints and a bucket of questions still unanswered.");

	processTime(10);

	clearMenu();
	addButton(0, "Next", mainGameMenu);

	//[Next]
	//Add [Kara] to the destination map. Same system and all as Myrellion, short travel time if in-system. No time limit to arrive. 
	//Tooltip: 
}

public function kq2TravelToKara():void
{
	clearOutput();
	showKara();
	//Walks through import process from Silence. Option to back out if not import.

	flags["KQ2_QUEST_DETAILED"] = GetGameTimestamp();

	pc.credits += 10000;

	output("You punch in the coordinates Kara gave you and engage the autopilot, letting the computer start your journey.");

	output("\n\nOne");
	if (9999 == 0) output(" lengthy journey through space and the Warp Gate network");
	else output(" quick trip through the atmosphere later");
	output(" and you’re zooming through the blackness of space, hurtling towards Myrellion’s further moon. The journey toward the icy blue moon isn’t particularly long, by galactic standards, but the coordinates Kara gave you lead into rocky belt encircling it. You instinctively boost your shielding, gazing out your ship’s viewports as tumbling hunks of house-sized rock and ice smash against each other. Your shields rumble and flicker as shards of debris hit you, just enough to give you a light show - no threat, so long as you keep dodging the big rocks.");

	output("\n\nThe coordinates are just ahead, drawing you to one of the largest hunks of rock in the belt, nearly twice the size of a hydroball field. A scan of it comes back as a big empty: no signals on it, or for miles around. You furrow your brow, wondering why Kara’s brought you all the way out here... until the rock tumbles around, revealing a huge, hollow crack in its side, permitting entry for a ship about your size. Could be interfering with your scans, and this <i>is</i> where Kara said to meet.");

	output("\n\nYou take a steadying breath and ease your ship into the crack in the rock. You’re quickly bathed in darkness, no light from the sun or moon to guide you past the craggy cave mouth. A moment of doubt passes, before being blasted away by blinding light shining from inside the cavern. Your ship’s shielding keeps the worst of it at bay, just making you squint as the view outside consolidates into several large floodlights mounted on the walls, hanging over some kind of catwalk.");

	output("\n\nAnother ship is parked ahead, a sleek, blue-and-white freighter");
	if (9999 == 0) output(" not much bigger than your old Z14");
	else output(" not much bigger than your own ship");
	output(". Your comms bleep with an incoming message.");

	output("\n\nYou accept it, and are greeted by Kara’s face, standing on what must be the bridge of the other ship, surrounded by blinking consoles and computer terminals - none of them manned. <i>“Captain! I was starting");
	if (kara.isNice()) output(" to worry something had happened to you.");
	else if (kara.isMischeivious()) output(" to worry you got lost!");
	else output(" to think you weren’t coming.");
	output(" Good to see you again,”</i> she says, affecting a faint smile. <i>“In person, preferably. I’m extending a docking tether now... mind if I come over?”</i>");

	output("\n\n<i>“");
	if (pc.isNice()) output("By all means,");
	else if (pc.isMischeivious() && kara.isMischeivious()) output("Sure. If you think you can manage to not get lost on the way.");
	else if (pc.isMischeivious()) output("Looks like you’re already inviting yourself over,");
	else output("I guess,");
	output("”</i> you say, as the docking clamps lock your ships together, ever so slightly rattling your outer hull.");

	output("\n\n<i>“Great. See you in a moment,”</i> she winks, flicking off the video.");

	output("\n\nYou make your way down to the airlock, just as it’s cycling through on the other side. You pop your lock and let it slide aside, revealing the familiar shape of the catgirl on the other side. Kara’s shed her cloak and hood since your first meeting, giving you a look at the woman underneath for the first time: she’s rocking a skin-tight black synth-leather suit, showing off womanly hips and a generous bust, accentuated by a shoulder holster loaded down with energy cells and a plasma pistol. A chrome-plated briefcase rests in one of her hands, gloved fingers wrapped tight around the handle. Knee-high leather boots finish off the ensemble, drawing your eyes up her long, toned legs and up to... to a faintly noticeable bulge in the front of the cat-girl’s pants, showing off a tight knot of more masculine flesh. Looks like this kitty’s packing a little something extra...");

	if (kara.isNice())
	{
		output("\n\n<i>“Hey there, [pc.name],”</i> she smiles, reaching in and giving you a brisk hug.");
	}
	else if (kara.isMischeivious())
	{
		output("\n\n<i>“Heyya, "+ pc.mf("handsome", "beautiful") +"”</i> Kara grins, giving you a rough clap on the shoulder.");
	} 
	else
	{
		output("\n\n<i>“Steele,”</i> Kara says, giving you a firm but respectful nod.");
	}
	output(" <i>“It’s good to see you again. Like I said over the comms, I’ve got another job for you - if you’re interested. And I still owe you for");
	if (9999 == 0) output(" helping me kick that bounty hunter bitch’s ass");
	else output(" pulling my ass out of the fire back on Myrellion");
	output(".”</i>");

	output("\n\nShe flips a credit chit out of her shoulder rig and");
	if (kara.isMischeivious()) output(" tosses it to you");
	else output(" hands it to you");
	output(", waiting with a smile as you swipe it through your Codex. A moment later, the device beeps an alert that <b>ten thousand credits</b> have been transferred to your account. You blink away your surprise and tuck your Codex away with a grateful nod towards the kaithrit.");
	if (kara.isMischeivious()) output(" She gives you a playful wink and says,");
	output(" <i>“Like I said, I owed you. Think that makes us even, hmm?”</i>");

	output("\n\n");
	if (pc.isAss()) output("<i>“That’s a start, I guess,”</i> you smirk. ");
	output("<i>“So, you had a job you wanted to discuss?”</i>");

	output("\n\n<i>“That I do.");
	if (kara.isMischeivious()) output(" Permission to come aboard, captain?");
	else output(" Mind if we sit down somewhere?");
	output("”</i>");

	output("\n\n");
	if (pc.isMischeivious() && kara.isMischeivious()) output("<i>“Permission granted!”</i> you grin, giving Kara an exaggerated wink.");
	else output("<i>“Sure, come on in,”</i> you say, waving her aboard.");
	output(" You turn and lead her out of the airlock and into the ship’s common area.");

	output("\n\n<i>“Nice ship,”</i> she murmurs, a gloved hand running along the bulkhead as she enters, looking cautiously around. <i>“Haven’t been aboard a");
	// 9999 {ship model}
	output(" Z14")
	output(" in a while.”</i>");

	//{if PC has Anno aboard:
	if (annoIsCrew())
	{
		output("\n\nYou hear footsteps coming your way. Both you and Kara turn to see Anno walking towards the galley, reading on a tablet couched in her arm. She looks up at the two of you and blinks. <i>“Oh, hey boss. Didn’t know we were expecting company.”</i> She tucks her datapad away and extends a hand to your companion. <i>“Anno Dorna. Ship’s scientist.”</i>");

		output("\n\n<i>“Kara Volke,”</i> Kara answers, shaking Anno’s hand.");
		if (!reahaIsCrew()) output(" When Anno leaves to go about her business, Kara adds, <i>“I didn’t know you had a crew, [pc.name]. You kind of struck me as a loner. That, and you didn’t have anyone with you when we met.”</i>");
	}
	if (reahaIsCrew())
	{
		if (!annoIsCrew()) output("\n\nYou hear footsteps coming your way. Both you and Kara turn to see Reaha");
		else output("\n\nThe moment Anno leaves, Reaha comes out of her quarters,");
		output(" padding down the corridor, moaning slightly as an auto-milker attached to her breasts buzzes happily. She stops and blinks at Kara, her own bare breasts jiggling as the milk is sucked out of them.");	

		output("\n\nKara returns the stare, her feline tails moving more quickly behind her. <i>“That looks... really good,”</i> she purrs, eyes affixed to the cow-girl’s bosom.");

		output("\n\nReaha flushes red and twirls a lock of strawberry hair around a finger. <i>“T-thanks. I’m Reaha. [pc.name]’s my [pc.master]. Do you... uh, do you want a glass?”</i>");

		output("\n\n<i>“I’d love one, Reaha,”</i> Kara says, introducing herself as the cow-girl picks up a glass from the galley nearby and fills it from the back of the milker. Once Kara’s got herself a drink, you give Reaha");
		if (pc.isNice()) output(" an affectionate");
		else if (pc.isMischeivious()) output(" a playful");
		else output(" a commanding");
		output(" smack on her ass and tell her to scoot. You’ve got business to attend to.");

		output("\n\nReaha squeaks and walks off, wiggling her hips a little more as she goes. Kara chuckles and sips on her glass of milk, watching appreciatively. <i>“I didn’t know you had a crew, [pc.name]. You kind of struck me as a loner. That, and you didn’t have anyone with you when we met.”</i>");
	}

	if (annoIsCrew() || reahaIsCrew())
	{
		output("\n\nYou shrug and say that");
		if (!silly) output(" you prefer to operate alone. Most of the time, anyway.");
		else output(" Fenoxo won’t let you take party members with you most of the time.");

		output("\n\n<i>“Well, we’re going to change that,”</i> Kara grins.");
	}

	output("\n\n<i>“Like I said, I have a job for you, [pc.name]. Dangerous work, but");
	// {if fought Shade:
	if (9999 == 0) output(" you’ve proven you can handle yourself");
	else output(" I think you can handle yourself");
	output(". Plus I can’t fly the </i>Ghost<i> solo into a fight, if it comes to that. Hopefully it won’t, but...”</i>");

	output("\n\n<i>“Alright");
	if (pc.isMischeivious()) output(", I’ll bite");
	output(", what’s the job?”</i>");

	output("\n\nKara nods, a glint in her eerie eyes. <i>“Now we’re talking. A very powerful... friend... of mine tells me that there’s a pirate base being set up down on Myrellion.");
	if (kara.isNice()) output(" I’ll be honest with you: they’re Black Void. Biggest and most powerful pirate syndicate in the galaxy.");
	else if (kara.isMischeivious()) output(" You’ve heard of the Black Void, right? They’re no joke, but I’m going after them. Hard and fast.");
	else output(" They’re tough bastards. Black Void. But nothing we can’t handle.");
	output("”</i>")

	output("\n\nThe Black Void. She’s not joking: they’re the most dangerous pirates around - you couldn’t go a day in flight school without somebody sharing a horror story about Void raiders slaughtering a crew to the man, or dragging them off to the slave pits of Raxxia. Most folk would do just about anything to stay out of their crosshairs... and Kara wants to kick a hornets’ nest. Maybe you should get a little more information.");

	output("\n\nKara kicks back on one of your seats, setting down the chromed briefcase she’s carrying between her legs, waiting for your response.");

	processTime(15);

	kq2InitTalkMenu();
}

public function kq2InitTalkMenu():void
{
	clearMenu();
	if (flags["KQ2_BV_TALK"] == undefined) addButton(0, "Black Void", kq2KaraTalkBlackVoid, undefined, "Black Void", "Ask what Kara knows about the Black Void, and why she’s going after them.");
	else addDisabledButton(0, "Black Void");

	if (flags["KQ2_BV_TALK"] != undefined && flags["KQ2_F_TALK"] == undefined) addButton(1, "Friend", kq2KaraTalkFriend, undefined, "“Friend”", "Who is this friend of yours, Kara?");
	else if (flags["KQ2_BV_TALK"] != undefined && flags["KQ2_F_TALK"] != undefined) addButton(1, "Push", kq2KaraPushFriend, undefined, "Push “Friend”", "You're not letting her get off the hook that easily.");
	else addDisabledButton(1, "Friend");

	if (flags["KQ2_PLAN_TALK"] == undefined) addButton(2, "Her Plan", kq2KaraThePlan, undefined, "Her Plan", "Let’s talk about this plan of yours, Kara.");
	else addDisabledButton(2, "Her Plan");

	if (flags["KQ2_EYES_TALK"] == undefined) addButton(3, "Her Eyes", kq2KarasEyes, undefined, "Her Eyes", "Ask kara about those eyes of hers. They look " + (pc.characterClass == GLOBAL.CLASS_ENGINEER ? "artificial" : "... wrong"));
	else addDisabledButton(3, "Her Eyes");

	if (flags["KQ2_PLACE_TALK"] == undefined) addButton(4, "This Place", kq2ThisPlace, "This Place", "How did Kara know about this place, anyway?");
	else addDisabledButton(4, "This Place");

	if (flags["KQ2_HERSELF_TALK"] == undefined) addButton(5, "Herself", kq2Herself, "Herself", "Ask Kara about herself. You need to know who you're working with, after all.");
	else addDisabledButton(5, "Herself");

	addButton(14, "Next", kq2InitTalkNext, undefined, "Decisions....", "You've heard enough. Time to make your choice.");
}

public function kq2KaraTalkBlackVoid():void
{
	clearOutput();
	showKara();

	output("<i>“Tell me about the Black Void.”</i>");

	output("\n\nThe kaithrit scoffs, <i>“What’s there to tell? They’re the biggest, baddest group of pirates in the galaxy, bar none. You don’t run into them much in the core, but out here in the fringe - especially during a Rush - they’re the biggest threat to trade and commerce we pilots face. The Void is ruthless, bloodthirsty even, and they’ve got no qualms about killing. Unless you’re unlucky enough to be pretty when they board you: then you’re bound to be sold as a slave, if whatever captain takes you doesn’t fancy you himself... then it’s worse. The Void’s scum, [pc.name]. Evil to the man.”</i>");

	output("\n\nSounds like bad news. <i>“So why are you going after them?”</i>");

	output("\n\nKara’s hand rubs at the back of her neck as she answers, <i>“I crossed them. Big time.”</i> She sighs, and hesitantly she adds, <i>“I’ll be honest, [pc.name], I might not have told the whole truth back at the bar. That bounty hunter was there to cash in on a price on my head. A big one. I took a chunk out of a Black Void frigate, the biggest and scariest pirate vessel I’ve ever seen, commanded by one of the Dread Lords. Because of that fight, I’m a wanted woman... and I racked up a big debt to a ‘friend,’ paying for the damage they did to my crew, my ship...");

	output("\n\n<i>“Plus, they did </i>this<i> to me,”</i> she adds, pointing a pair of fingers at her eyes.");

	processTime(3+rand(3));

	flags["KQ2_BV_TALK"] = 1;
	kq2InitTalkMenu();
}

public function kq2KaraTalkFriend():void
{
	clearOutput();
	showKara();

	output("<i>“Tell me about this... ‘friend’ of yours.”</i>");

	output("\n\nThe kaithrit fidgets uncomfortably, mumbling, <i>“I’d rather not. Let’s just say he’s powerful, well-connected, and has a vested interest in kicking the Void in the nuts.”</i>");

	output("\n\nShe’s silent for a moment after that. Doesn’t look like she’s going to open up more than that without prodding.");

	processTime(3+rand(3));

	flags["KQ2_F_TALK"] = 1;
	kq2InitTalkMenu();
}

public function kq2KaraPushFriend():void
{
	clearOutput();
	showKara();

	output("<i>“If you want me to work with you, you’re going to have to be honest with me,”</i> you say, locking eyes with the cat-girl. <i>“Tell me about this ‘friend’.”</i>");

	output("\n\nKara sighs and runs a hand through her blue hair, pointedly avoiding eye contact with you. <i>“I think ‘friend’ might be too strong a word, anyway. Employer, financier, backer, take your pick. For right now, I work for a man named Lysander Chow. Aside from the Void, he’s one of the most powerful criminals in the galaxy. Non-violent crime, you understand: gambling, whoring, smuggling. I ran cargo on and off for him for years, and he’s... good to his word, if nothing else. His intel’s always been spot on, and I trust it to get me - us - into the base.”</i>");

	processTime(3+rand(3));

	flags["KQ2_F_TALK"] = 2;
	kq2InitTalkMenu();
}

public function kq2KaraThePlan():void
{
	clearOutput();
	showKara();

	output("<i>“So, what’s your plan, Kara?");
	if (pc.isMischeivious()) output(" We can’t exactly walk into a pirate base.");
	output("”</i>");

	output("\n\n<i>“It’s not going to be easy, but I’ve got a unique opportunity here. The pirates are just setting up on Myrellion, bringing in pre-fab buildings and blasting out some caverns near the surface, carving out a sewer. Some kind of bunker underground, too. Security’s going to be");
	if (kara.isNice()) output(" pretty stringent");
	else if (kara.isMischeivious()) output(" tighter than a princess’s chastity belt");
	else output(" KaraHard: fucking brutal");
	output(" on the surface, but they’re still building up the sub-levels and sewers, and there’s a chance we could push in through the underground, pop up in the middle of the base.”</i>");

	output("\n\n<i>“The sewers? Really?”</i>");

	output("\n\n<i>“Really!”</i> Kara says, a little defensive. <i>“They’re not expecting trouble - they don’t think anybody knows they’re there.");
	if (kara.isMischeivious()) output(" P-probably!");
	output(" It’s a backwater research base, after all. A couple dozen foot-soldiers at worst, plus some automated security. But leave that to me - punching through security systems is my specialty. If I can get access to their communications systems or a computer, I’ll be able to shut down the alarms and make sure no reinforcements show up. Once done, we push into the the subterranean research complex, and shut it down. Permanently.”</i>");

	output("\n\n<i>“Any idea what they’re researching, exactly?”</i>");

	output("\n\nKara grimaces. <i>“Bad things. You don’t build a base in the middle of a desert, hundreds of miles away from civilization");
	if (kara.isNice()) output(" if you’re doing anything short of evil.");
	else if (kara.isMischeivious()) output(" just because.");
	else output(" unless you have something to hide.");
	output(" Whatever they’re working on is dangerous, and we’ll all be a lot safer if the Black Void doesn’t succeed in whatever they’re doing. Besides, they picked Myrellion for a reason: this planet’s lousy with weapons of mass destruction. Chemical weapons, nukes, you name it. I wouldn’t be surprised if one of the local factions is supplying them with W.M.D.s, which you </i>know<i> are going to be used against spacers like us. The last thing any of us need is for a piercer rocket to punch into our ship’s hull and fill it with myr lust-gas, turning the whole crew into fuck-hungry animals begging to be enslaved if it means sweet relief.”</i>");

	output("\n\nYour kaithrit companion shakes her head with disgust and crosses her legs. <i>“Anyway, once we shut down the lab, we’ll need to make a quick getaway, unless we want to fight a couple dozen pirates all at once. There’s a launch pad on top of the research building, and I’ve got some experience piloting gunships of the same make and model that the Void uses. That’ll be our exfil.”</i>");

	processTime(7+rand(3));

	flags["KQ2_PLAN_TALK"] = 1;
	kq2InitTalkMenu();
}

public function kq2KarasEyes():void
{
	clearOutput();
	showKara();

	output("<i>“");
	if (pc.isNice()) output("Would you mind telling me what happened to your eyes?");
	else if (pc.isMischeivious()) output("So, what’s with the peepers?");
	else output("So what’s the story with those eyes?");
	output("”</i>");
	
	output("\n\nKara winces, looking pointedly away from you when you ask. <i>“I... lost them. No, that’s too easy. A pirate bitch took them - a Dread Lord of the Black Void, I found out later. She had me dead to rights, was going to chain me up and sell me and my crew as slaves on the black market. We’d gone after the same treasure as the Void, and ended up damaging her ship in the crossfire. I’d intended to go out in a blaze of glory, but somehow we survived... and ended up surrounded by pirate troopers.”</i>");
	
	output("\n\nSelling us would have put a dent in that debt, if a Terran warship hadn’t hit her when it did. The pirate bitch ran, but not before trying to blast my brains all over the deck. Last shot at vengeance for what I did. She missed, mostly, but the laser blast boiled my eyes. My crew pulled me out while the pirates scrambled to get away, and I got patched up at a medbay on New Texas.”</i>");
	
	output("\n\nShe gives a wry chuckle and rubs at her cheeks. Now that she’s this close, with her hood down, you can see faint scarring all around her cyber eyes. <i>“Lucky me,");
	if (flags["KQ2_F_TALK"] == 2) output(" Chow");
	else output(" my ‘friend’");
	output(" was willing to get me some top shelf cyberware to replace them, on top of everything else I owed him afterwards. The only way I can repay a debt like that is this mission for him.”</i>");

	processTime(3+rand(3));

	flags["KQ2_EYES_TALK"] = 1;
	kq2InitTalkMenu();
}

public function kq2ThisPlace():void
{
	clearOutput();
	showKara();

	output("<i>“You didn’t put this place together yourself, did you?”</i> you ask, sweeping a hand out the forward viewscreen.");

	output("\n\nKara laughs. <i>“Oh, no. No. This was going to be used as a smuggling base right after the Rushers discovered Myrellion, before the Damocles Fleet arrived in orbit. After that, well, it’s hard enough to move goods on the down-low without a jumpy Confederate fleet next to your destination. The place was abandoned, and I");
	if (flags["KQ_F_TALK"] != undefined) output(" decided to use it as a meet point. No chance of accidental pirate encounters here.");
	else output(" found it! Pretty handy, hmm?");
	output("”</i>}");

	output("\n\n<i>“Definitely useful,”</i> you muse. <i>“Is there anything more to this place? Other than the dock, that is.”</i>");

	output("\n\n<i>“Some tunnels. A few half-built rooms,”</i> Kara answers. <i>“I haven’t explored this place too much. Mostly because there’s no atmosphere anywhere");
	if (kara.isMischeivious()) output(", and space suits just chafe my tails, you know?");
	output(". If you want to look around on your time, you’re welcome to - like I said, it doesn’t belong to me.”</i>");

	processTime(3+rand(3));

	flags["KQ2_PLACE_TALK"] = 1;
	kq2InitTalkMenu();
}

public function kq2Herself():void
{
	clearOutput();
	showKara();

	output("<i>“I’d like to know a little bit more about you,”</i> you say, looking the blue-haired cat-girl up and down. <i>“");
	if (pc.isNice()) output("I’d like to know who I’m working with, after all.");
	else if (pc.isMischeivious()) output("We ought to get to know one another first, right?");
	else output("If you want my help, that is.");
	output("”</i>");

	output("\n\n<i>“That’s fair,”</i> Kara chuckles. <i>“I’ll save you the whole sob story, if it’s all the same to you. For the last few years, I was crew on a smuggling vessel: the </i>Silence<i>. She was originally captained by Rourke Blackstar. You might have heard of him.”</i>");

	output("\n\n");
	if (pc.characterClass == GLOBAL.CLASS_SMUGGLER) output("Of course you have. Blackstar was a legend among smugglers, the best of the best. At least, until he got pinched a couple years back. Kara smiles at your recognition. <i>“Good. Then you know what he could do. What he was capable of.”</i>");
	else
	{
		output("You shake your head. Kara grunts a mute, <i>“Don’t worry about it.");
		if (kara.isNice()) output(" Suffice to say, he was the best smuggler to ever live.");
		else if (kara.isMischeivious()) output(" I guess you’re a pretty shitty smuggler if everyone’s heard of you, now that I think about it.");
		else output(" Can’t expect everyone to know, I guess.");
		output("”</i>");
	}

	output("\n\nYour companion sighs and continues: <i>“I was born a slave in a kaithrit colony on Tarilia. The colony was short on males - it’s a problem on a lot of kaithrit worlds - so they kept anything with a dick cooped up as breeding stock. That includes me, if you’re wondering; I was born a hermaphrodite. About ten percent of kaithrit are. Blackstar met me on a run when the planet’s matriarch invited him to tour the ‘pleasure palace’ they kept us chained up in. Long story short: he liked me, and helped bust me out. I’ve been on the run ever since. I served under him on the </i>Silence</i>, learned the tricks of the trade, and when he was captured on Terra, I took command of the ship. Most of the crew bought their farms with him or got pinched by the Peacekeepers... or bailed out after the stunt I pulled with the Void. All that’s left is me");
	if (9999 == 9999) output(" and my first mate.");
	else output(" , my first mate, and a V.I. in a robot.");
	output(" Not much of a crew.”</i>");

	output("\n\nAfter a moment’s consideration, you ask, <i>“I thought you said your ship was the </i>Ghost<i>?”</i>");

	output("\n\n<i>“Heh. About that...");
	if (kara.isNice()) output(" The </i>Silence</i> got destroyed by the Black Void the last time we tangled.");
	else if (kara.isMischeivious()) output(" I might have sort of rammed a Black Void frigate with the </i>Silence</i>. It seemed like a good idea at the time, honest!");
	else output(" I rammed a Black Void warship with the </i>Silence</i>. Crippled one of their best ships and killed dozens of pirates, though I lost the ship in the process. I’d do it again in a heartbeat.");
	output(" Lucky me, my backer saw fit to replace her with a new ship: the </i>Ghost<i>. Brand new, sleek as hell, and tougher than </i>Silence<i> ever was.”</i>");

	output("\n\nShe sounds like she’s trying to convince herself on that last point as much as she is you.");

	processTime(7+rand(3));

	flags["KQ2_HERSELF_TALK"] = 1;
	kq2InitTalkMenu();
}

public function kq2InitTalkNext():void
{
	clearOutput();
	showKara();

	output("<i>“I think I’ve heard enough.”</i>");
	
	output("\n\n<i>“Good,”</i> Kara says with a smile. <i>“So, are we in business? Help me out, and 30,000 credits are yours. Plus whatever you want to loot from the Void base - I’m just there to");
	if (kara.isAss()) output(" wreck shit");
	else output(" hurt the bastards");
	output(".”</i>");

	processTime(1);

	clearMenu();
	addButton(0, "DontTrust", kq2DontTrust, undefined, "Trust Issues", "Tell Kara that you don't trust her.");
	addButton(1, "LetsGo", kq2LetsGo, undefined, "I'm In", "Let's do this.");
	addButton(2, "No", kq2NotGonnaHappen, undefined, "No Way", "No way. Find someone else.");
}

public function kq2DontTrust():void
{
	clearOutput();
	showKara();

	output("<i>“I don’t trust you,”</i> you bluntly state.");
	if (flags["KQ2_BV_TALK"] != undefined) output(" <i>“You’ve already lied to me once.");
	else output(" <i>“I don’t think you’re being straight with me.");
	output(" I’m not trusting my life with you.”</i>");
	
	output("\n\nShe winces, chewing on her lip as your words sink in. <i>“I guess that’s fair. I wouldn’t ask anyone to go into a fight without trusting me. I just wish there was some way to change your mind...”</i>");

	processTime(2);

	addDisabledButton(0, "DontTrust");

	addButton(5, "PayFirst", kq2PayFirst, undefined, "Payment First", "Tell Kara you might trust her if she payed you up front.");
	addButton(6, "Sex", kq2SexFirst, undefined, "Sex", "Tell Kara you might trust her if she threw in a more... <i>personal</i> incentive.");
}

public function kq2PayFirst():void
{
	clearOutput();
	showKara();

	output("<i>“Payment up front would help.”</i>");
	
	output("\n\nKara looks nervously around before drawing out a small datachit and swiping it through a small computer on her wrist. <i>“Uh, yeah, I guess that makes sense. Let’s call it halvsies, alright? Half now, half after?”</i>");
	
	output("\n\nThat’s pretty reasonable, you figure.");

	addDisabledButton(5, "");
	addDisabledButton(6, "");
	flags["KQ2_CREDS_FIRST"] = 1;

	processTime(2);

	//When PC hits [I'm In], grant PC 15,000C
}

public function kq2SexFirst():void
{
	clearOutput();
	showKara();

	output("<i>“I could think of a few ways,”</i> you say, letting your eyes play across the cat-girl’s figure. With that black catsuit hugging her body like it is, there’s no hiding her lush curves - the swells of her breasts and butt, the flare of her hips, the long lengths of her legs...");
	
	output("\n\nYour gaze hardly goes unnoticed. Kara shifts ever so slightly, just enough to make her bust jut out against the front of her cloak, the twin mounds’ full size on display for you. Her lips twitch into a small smile and she purrs, <i>“Hey, now, I’ve paid you well already, haven’t I? And I’m offering to pay you a pretty penny this time, too... but if you want to talk about </i>bonuses<i>,”</i> she chuckles, <i>“Well, maybe you and I can work something out after the mission.");
	if (kara.isMischeivious()) output(" If you’re a good "+ pc.mf("boy", "girl") +", that is...");
	else if (kara.isAss()) output(" If you don’t get yourself killed, anyway.");
	output("”</i>");

	addDisabledButton(5, "");
	addDisabledButton(6, "");
	flags["KQ2_SEX_PAY"] = 1;

	processTime(2);
}

public function kq2LetsGo():void
{
	clearOutput();
	showKara();

	output("<i>“Alright, I’m in,”</i> you say, extending a hand to Kara.");
	
	output("\n\nShe grins from ear to ear and shakes it hard. <i>“You’re the best, [pc.name]. I knew I could count on you.”</i>");
	
	output("\n\n<i>“So what’s next?”</i> you ask. Kara answers by hopping up to her feet and grabbing her case, starting towards you airlock.");
	
	output("\n\n<i>“Next... we go down to the planet. We’ll take my ship, if it’s all the same to you. </i>Ghost<i> is rigged with a high-end stealth system, and she’s fast and quiet besides. We’ll fly right under the pirates’ radar, land near their base, then hoof it in.");
	if (kara.isMischeivious() && pc.hasLegFlag(GLOBAL.HOOVES)) output(" Literally, in your case!");
	output("”</i>");
	
	output("\n\nKara waves you on after her, leading you back through the airlock cycle and onto her ship, and the beginning of your next adventure...");

	if (flags["KQ2_CREDS_FIRST"] == 1) pc.credits += 15000;

	flags["KQ2_QUEST_BEGIN"] = 1;

	processTime(2);

	clearMenu();
	addButton(0, "Next", kq2QUESTTIME);
}

public function kq2NotGonnaHappen():void
{
	clearOutput();
	showKara();

	output("<i>“Sorry. Find someone else,”</i> you answer.");
	
	output("\n\nKara huffs and crosses her arms under her chest. <i>“Fine. I can probably find someone else... yeah, no problem. Sorry for bringing you out here for nothing, [pc.name].”</i>");
	
	output("\n\nYou nod as the kaithrit turns to leave. She gives you a wink over her shoulder before stepping through the hatch and back onto her own vessel. <i>“See you around, I guess, [pc.name].”</i>");
	
	output("\n\nYou wave, and the kaithrit vanishes through the airlock. A moment later and the docking tube disconnects, freeing you to take the helm and take off to a new destination.");

	processTime(2);

	flags["KQ2_QUEST_BEGIN"] = 2;

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function kq2QUESTTIME():void
{
	clearOutput();
	
	if (flags["SILENCE_RESCUED_CONNIE"] != undefined) showBust("KARA", "LOGAN", "CONNIE")
	else showBust("KARA", "LOGAN");

	author("Savin");

	showName("THE GHOST");

	output("A moment later and you’re aboard the <i>Ghost</i>, Kara’s ship, looking around at the sleek, bright white of the interior. She’s a new ship, still squeaky clean and polished to a shine. Consoles run along the length of every corridor you pass through on the way to the bridge. The whole ship has an oddly sterile feel - not like the cozy home you’ve made out of your own ship.");

	if (flags["SILENCE_RESCUED_CONNIE"] != undefined)
	{
		output("\n\nAs you’re walking, a side passage in the corridor slides open with a hiss, and a pale blue beauty sashays out into your path. You blink hard as the robotic bombshell smiles at you with big, ultramarine lips, putting her hand on a set of broad hips that strain the band of her skin-tight yoga pants. Her flat, sleek belly is left bare, all the way up to a too-tight black sports bra that’s somehow hugging back a set of tits that would look more at home");
		//{if met Irellia:
		if (9999 == 0) output(" on a gold myr queen");
		else output(" on a hyperporn star - and emphasis on the hyper");
		output("!");
		// {if met Gianna:
		if (9999 == 0) output(" She looks a lot like a certain New Texan companion droid you know - maybe they’re the same model?");

		output("\n\n<i>“Welcome back, captain,”</i> the droid says, oddly emotionless despite the husky purr in her voice. Almost eerily so. <i>“I assume this is [pc.name] Steele. Pleased to meet you.”</i>");
		
		output("\n\n<i>“Heyya, Connie,”</i> Kara says with a smile, spinning on a heel to slip an arm around the gynoid’s shoulders and face you. <i>“[pc.name], this is Connie, </i>Ghost<i>’s virtual intelligence. Military command-grade operating system, made utterly and completely loyal after I poked around in her brain... and she’s rocking a damn fine body besides.”</i>");
		
		output("\n\nThe pleasure-bot flutters her big, sky-blue eyes at you and smiles. <i>“As you say, captain. I’m afraid I lack the aesthetic sense to judge.”</i>");
		
		output("\n\nKara snickers, and you see her hand slip down the droid’s back to brush across the tight backside of her pants. Connie’s eyes widen a bit, and her mammoth chest heaves with a sudden breath. <i>“At least you have the senses to </i>enjoy<i> your body,”</i> the kaithrit says, squeezing Connie’s butt.");
		
		output("\n\nBiting her lip to suppress a gasp, Connie murmurs a faint, <i>“Yes, captain. I am equipped for full tactile stimulation, and as you insisted I integrate this chassis’s behavioral software into my own, I’m fully equipped for my duties on the bridge </i>and<i> in the captain’s quarters.”</i>");
		
		output("\n\nSuddenly more serious, Kara lets the companion droid’s plush butt go and adds <i>“Connie’s connected to the ship’s systems via wireless QuanComms. She’s got full systems access, and can do just about anything the rest of the crew can, just faster and better. Talking to her is basically talking right to </i>Ghost<i> herself. You need anything, just ask her.”</i>");
		
		output("\n\n<i>“Anything to please, captains,”</i> Connie says with a seductive smile, stepping out of Kara’s embrace with a wiggle of her hips that sets her mouth-watering bust jiggling. <i>“If you’ll excuse me.”</i>");
		
		output("\n\nYou turn to watch her go, eyes fixated on the hypnotic sway of the droid’s hips under those lovely yoga pants.");
		
		output("\n\n<i>“Coming?”</i> your companion teases, tapping your shoulder to bring you back to the real world.");
	}
	
	output("\n\nYou’re soon following Kara onto the bridge, trailing in the wake of her twin tails as she loads you through the heavy hatch and onto a sweeping command deck that looks more like a warship’s bridge than a freighter’s. Several consoles ring around a central captain’s chair, and holo-displays hang down from above to absolutely flood the crew with information.");
	
	output("\n\nThe only crew you see, however, is a brunette woman sitting in the pilot’s seat, bobbing her head beneath a headset that echoes punk-sounding music over the otherwise silent deck. <i>“[pc.name], this is my first mate, Logan,”</i> Kara says, reaching down to run her sharp-clawed hands through the other woman’s long brown hair. The first mate gasps in surprise and yanks her headphones off, looking over her shoulder with a pronounced scowl. <i>“Don’t sneak up on me like that!”</i> she snaps. <i>“I’m still jumpy after...”</i>");
	
	output("\n\n<i>“Sorry, babe,”</i> Kara chuckles, still caressing Logan’s hair. As she does, you notice that her first mate is rocking some pretty serious gene mods: green, scaly frills peek out from under her hair where her ears should be, and her eyes are solid golden orbs, broken up by slitted black irises. Even her tongue looks reptilian, forked and slender and giving her a faint hint of an accent. She looks human, otherwise, and gives an expressive pout as she collapses back in her chair, zipping her beige flight suit up to the neck from its relaxed post.");
	
	output("\n\n<i>“So you’re [pc.name]? Logan Cassina. Thanks for helping Kara out before... good to know there are still people out there who’d help a stranger.”</i>");

	output("\n\n<i>“");
	if (kara.isMischeivious()) output("Being a sexy stranger sure helps,”</i> Kara winks, pointedly ignoring a renewed pout from her second.");
	else output("I guess of all the random spacers in that bar, I picked right,”</i> Kara grins.");
	
	output("\n\nLogan rolls her reptilian eyes and turns back to the pilot’s console. <i>“Anyway, welcome aboard, [pc.name]. Pick a seat and strap in, should be ready to take off in a couple minutes.”</i>");
	
	output("\n\nYou");
	if (pc.isMischeivious()) output(" make a beeline for the captain’s seat, only to be rebuffed by Kara, and sent packing to one of the weapons consoles");
	else output(" take a seat at one of the weapons consoles");
	output(" beside Logan. She gives you a slight nod and turns her attention to her controls, fingers flying across the holographic interface. A moment later, you hear a distant <i>thunk!</i> as the docking umbilical disconnects, and a faint thrum shakes the deck as the engine spools up, and the <i>Ghost</i> starts to slide back through the hollowed out tunnel in the rock.");
	
	output("\n\nYou take a deep breath and lean back, letting the crew of the <i>Ghost</i> ferry you towards your next adventure.");

	processTime(30+rand(10));

	clearMenu();
	addButton(0, "Next", kq2QUESTTIMEII);
}

public function kq2QUESTTIMEII():void
{
	clearOutput();
	
	if (flags["SILENCE_RESCUED_CONNIE"] != undefined) showBust("KARA", "LOGAN", "CONNIE")
	else showBust("KARA", "LOGAN");

	author("Savin");

	showName("THE GHOST");

	output("The trip goes by quickly and peacefully, until you hit the arid atmosphere of Myrellion. The ship shudders with turbulence, and you watch as Logan hammers several controls on a console above her. Part of the forward screen flickers off, replaced by a bird-eye view of the desert - some kind of probe’s camera, maybe? The second screen focuses in on some kind of walled compound sitting the bottom of a deep caldera, surrounded by nothing for miles and miles around. You squint, and think you make out all of three, maybe four buildings on the surface.");
	
	output("\n\nNot much of a base.");
	
	output("\n\n<i>“Bring us in low, Logan. Nice and easy,”</i> Kara says casually, leaning back in her captain’s chair with legs crossed. <i>“Any sign of Void ships?”</i>");
	
	output("\n\n<i>“None,”</i> your pilot calls back, flipped a button that replaces your view of the base with a radar image of the surrounding airspace: totally blank.");
	
	output("\n\nKara nods slowly. <i>“Alright, drop the rear hatch and bring us in. We’ll drop on that plateau, just ahead. [pc.name], you’re with me. We’re gonna fast rope onto the surface. Stealth system keeps us off their LIDAR, but doesn’t help much if we’re kicking up dust right on their front porch.”</i>");
	
	output("\n\nShe hops up and grabs that silver case of hers, still closed. You follow her off the bridge and through the gently-curving alabaster corridors of her ship, all the way to the freighter’s opposite end and down a short elevator ride to the cargo deck.");
	if (flags["SILENCE_RESCUED_CONNIE"] != undefined) output(" Connie’s waiting there for you, standing at an almost military at-ease as the cargo ramp slides down beside her. <i>“Best of luck, captain.”</i>");
	
	output("\n\nWind whips past your face, threatening to either blast you back or suck you out with equal force.");
	if (flags["SILENCE_RESCUED_CONNIE"] != undefined) output(" Connie leans out with a robotic surety, securing a hook to an auto-loader cable on the roof and kicking out a long length of synth-silk rope, a hundred feet or more tumbling to the dirt. Kara tosses you a pair of climber’s gloves before grabbing on and sliding down and out of sight. You give the helpful robot a nod and grab the rope, following the <i>Ghost</i>’s captain down to the surface.");
	else
	{
		output(" Kara tosses you a pair of climber’s gloves before shoving you aside and rushing past, right towards the lowering door. You have just enough time to blink before she spins on a heel, gives you a wink, and dives backwards out the door.");
	
		output("\n\nIt takes you a moment to realize there’s a huge bundle of synth-silk rope training after her, suddenly going taut as she lands. You let out a breath you hadn’t realized you were holding and grab it, following her down.");
	}

	processTime(15);

	clearMenu();
	addButton(0, "Next", kq2QUESTTIMEIII);
}

public function kq2QUESTTIMEIII():void
{
	clearOutput();
	showKara();

	output("<i>“Whoo!”</i> Kara laughs, making way as you drop to the ground beside her.");
	if (pc.isTaur() && silly) output(" Lucky you, you had your special centaur rocket-booties to help you down! Ropes and ladders would be a pain without them!");
	output(" <i>“Alright. There should be a way down into the sub-levels just down the caldera. Ready?”</i>");
	
	output("\n\nAs she speaks, Kara steps back from you, finally unlatching the big silver case she’s been lugging around. You watch her");
	if (pc.lust() >= 33 || pc.lq() >= 50) output(" appreciatively as she bends over to pop the case open, lifting her tails high and showing off a remarkable ass under that catsuit");
	else output(" as she leans over the case and pops it open");
	output(". Rather than opening, though, the handle on the case just slides up with her hand, attached to a black mass of metal that snaps out front and back into a barrel, stock, and magazine.");
	
	output("\n\nWhen she stands, Kara’s got a sleek black marksman’s rifle in her hands. She flips a holo-scope out of its chromed box and snaps it onto the former-handle, completing the package. The slide racks with liquid ease, chambering what looks like a big, meaty bullet.");
	
	output("\n\nKara grins at you, resting her rifle on her shoulder. <i>“Like what you see?”</i>");
	
	output("\n\nShe snickers before you can answer, turning towards the cliff’s edge. Above you, the <i>Ghost</i>’s engines sputter, and it turns on a dime before blasting off the way it came, towards a safe hiding spot out of view. <i>“C’mon. Let’s go give these pirate bastards a wake-up call.”</i>");

	flags["KQ2_KARA_WITH_PC"] = 1;

	currentLocation = "K2_LZ";
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function showWatson():void
{
	if (flags["KQ2_KARA_WITH_PC"] == 1) showBust("KARA, WATSON");
	else showBust("WATSON");

	author("Savin");

	showName("\nWATSON");
}

public function kq2MeetWatson():void
{
	clearOutput();
	showKara();

	output("<i>“Gimme a sec, looks like security’s sealed the door. Should be just a moment,”</i> Kara says, yanking a wire from her wrist computer and attaching it to a small panel beside the door. A holo-display pops up around her hand, and she gets to work punching through the firewall. It barely takes a minute for her to finish.");
	
	output("\n\n<i>“That was fast,”</i> you say as she stands and recovers her gear.");

	if (kara.isNice()) output("\n\n<i>“Thanks! I’ve been practicing,”</i> she answers, smiling at you as she draws her weapon.");
	else if (kara.isMischeivious()) output("\n\n<i>“I’m just that good,”</i> she smirks, drawing her pistol.");
	else output("\n\n<i>“Damn straight,”</i> she laughs, drawing her gun.");
	output(" She presses her shoulder to the side of the door, and motions for you to open it. You steel yourself and shove it open, storming in with your [pc.rangedWeapon] raised.");

	output("\n\nPredictably, there’s nothing inside: just a big, dark, hot room full of servers surrounding a single hologram projector and a couch facing it.");
	
	output("\n\nYou cock an eyebrow at the setup. <i>“The hell?”</i>");
	
	output("\n\nYour companion shrugs, looking out across the room. She walks a few paces to the side, to a railing overlooking a sharp drop into a lower level. More towers stretch out into the darkness, surrounded by frozen mist clinging to the floor. <i>“There’s thousands of them... it’s like a maze down there. What in the world...”</i>");

	output("\n\nYou see a sudden flicker of light on the holo-projector, drawing you and Kara back to the device. The image coalesces into a floating message of bright, transparent blue");
	if (silly) output(" Comic Sans");
	else output(" characters");
	output(": <i>“<b>SIT DOWN.</b>”</i>");

	output("\n\nKara gives you a look, and takes a step towards the couch. The message shifts to, <i>“<b>DON’T BE AFRAID. SIT.</b>”</i>");
	
	output("\n\nAs Kara slowly moves toward the couch, the projection shifts from words into a humanoid shape - a rotund, short man in an expensive suit jacket and a deer stalker cap, puffing on a pipe. He looks up at you with small, cold eyes swimming with code.");

	output("\n\n<i>“Ah, yes, you’ll forgive me for the wait. Most of my higher-level processes were occupied elsewhere. You may call me Watson, if you’d be so kind,”</i> he says, puffing a holographic circle of smoke from the end of his pipe. He looks to your companion and scowls, <i>“You must be Captain Volke of the </i>Silence<i>, yes? I’m led to believe this incident was a long time in coming. Longer than expected: it’s been several months since the unfortunate business aboard the N.S.V. </i>Constellation</i>.”</i>");

	output("\n\n<i>“Unfortunate business!?”</i> Kara snaps, stomping up and jabbing a finger into the hologram’s belly. <i>“Your Dread Bitch shot out my eyes!”</i>");

	output("\n\nThe hologram seems nonplussed by her aggression, and even pauses to tap a little ash out of his pipe. <i>“Yes. And you led your crew into an unprovoked engagement on the order of a noted opponent of the organization I represent, attempting to steal high-value cargo from not only us, but the people of New Texas. You’ll understand if I don’t apologize for Lord Bragga’s behavior during the incident. At any rate, please, make yourselves at home. I simply intended to tip my hat to you - bravo on making it this far past our security. We’ve certainly learned from the events of today, and I assure you such faults will not be repeated. Now, please, do carry on with whatever it is you came to do.”</i>");

	output("\n\nWhat, he doesn’t intend to stop you? What kind of V.I. is this?");

	processTime(15);
	flags["KQ2_WATSON_MET"] = 1;

	//[Watson] [Kara] [Constellation] [Intervention]
	clearMenu();
	addButton(0, "Watson", kq2WatsonTalkWatson, undefined, "Watson", "Ask the strange pirate program about itself.");
	addButton(1, "Kara", kq2WatsonTalkKara, undefined, "Kara", "Ask Watson about the Void's beef with Kara.");
	addButton(2, "Constellation", kq2WatsonTalkConstellation, undefined, "Constellation", "Ask Watson about the incident aboard the Constellation.");
	addButton(3, "Intervention", kq2WatsonTalkIntervention, undefined, "Intervention", "Finish this conversation. Why isn't Watson trying to stop you?");
}

public function kq2WatsonTalkWatson():void
{
	clearOutput();
	showWatson();

	output("<i>“So, what exactly are you?”</i> you ask, eyeing the hologram as it puffs on its pipe.");
	
	output("\n\nIt chuckles slightly, completely devoid of humor. <i>“Why, my dear [pc.boyGirl], I should like to think the correct question is ‘who’ am I? But I digress, this is hardly the moment for a discussions on the higher philosophies of artificial intelligences. Suffice to say, I am Watson. I oversee the Black Void’s operations.”</i>");
	
	output("\n\n<i>“What operations?”</i> your companion asks.");
	
	output("\n\nAgain, the A.I. chuckles dryly. <i>“Why, my dear girl, all of them. You’ll pardon a bit of bragging, but I am the most sophisticated artificial intelligence in the galaxy, bar a few specimens quite beyond the understanding of yourselves, and have several trillion credits’ resources at my disposal - for processing and the like, you understand. Ah, and before you excite yourselves, please understand that I’m hosted quite a distance from you - several systems away, in fact. I’m in no danger if you carry out your plans. Aren’t quantum communications remarkable?”</i>");

	processTime(5);

	addDisabledButton(0, "Watson");
}

public function kq2WatsonTalkKara():void
{
	clearOutput();
	showWatson();

	output("<i>“So, what exactly do you pirates have against Kara?”</i>");
	
	output("\n\nWatson blows a particularly large puff of smoke in the kaithrit’s direction and rolls his eyes. <i>“My dear [pc.boyGirl], we’ve nothing against miss Volke personally. However, she is responsible for a great deal of damage being inflicted upon Lord Bragga’s flagship, putting the </i>Black Rose<i> out of commission for several months. I’m also told she’s also responsible for several dozen deaths among our organization’s foot-soldiery, though that’s of much less concern. Forgivable, where several billion credits’ worth of damage to a warship is not. For that insult, she must suffer.”</i>");
	
	output("\n\n<i>“We’ve come this far. And now, we’re going to blow up your precious base. I’m not afraid of you, you little shit,”</i> Kara snaps, scowling at the portly avatar.");
	
	output("\n\nWatson chuckles. <i>“My dear girl, you very well should be.”</i>");

	processTime(5);

	addDisabledButton(1, "Kara");
}

public function kq2WatsonTalkConstellation():void
{
	clearOutput();
	showWatson();

	output("<i>“What happened aboard the </i>Constellation<i>?”</i> you ask.");
	
	output("\n\nKara answers before the A.I. can. <i>“My crew was brought in to retrieve some cargo aboard a Nova Securities ship, the </i>Constellation<i>, in the middle of a pirate attack. Fly in, take what they had, and get out before anyone noticed we were there.”</i>");
	
	output("\n\n<i>“How naive,”</i> Watson comments, tapping out a bit of ash from his pipe.");
	
	output("\n\n<i>“Anyway,”</i> Kara continues, scowling. <i>“I brought my crew in, but the pirates finished slaughtering the other Nova ships and came back around. Flushed us out with a ground assault, then pounded my ship until I had no choice but to ram the bitches. Hit ‘em hard, and try to take their ship in the surprise.”</i>");
	
	output("\n\nWatson shakes his head. <i>“A plan doomed to fail, of course. Or a failed suicide attempt. To be honest, I could never tell. At any rate, miss Volke’s ramming attempt damaged both ships badly, and ended with Lord Bragga, the </i>Black Rose<i>’s captain, executing her. Or it should have. Clearly Lord Bragga needs to improve her aim.”</i>");
	
	output("\n\nYou turn to Kara and ask, <i>“What were you trying to steal, anyway?”</i>");
	
	output("\n\n<i>“Plat-190. Rare isotope, very valuable. We hit on a security case packed full of it.");
	if (kara.isNice()) output(" Just a fraction of that payday would have set me and my crew up for life.");
	else if (kara.isMischeivious()) output(" Just a sliver of that would have made me a rich woman. If it weren’t for the pirates, I’d be cruising the pleasure gardens of Venus with a harem and a liquor-replicator.");
	else output(" I’d kill for that kind of money. Hell, me and my whole crew <b>did</b>.");
	output("”</i>");
	
	output("\n\n<i>“Unfortunately for you, Lysander Chow did not realize with whom he was interfering,”</i> Watson states. <i>“And for that, you paid with your eyes - and you will pay more, soon.”</i>");

	processTime(5);

	addDisabledButton(2, "Constellation");
}

public function kq2WatsonTalkIntervention():void
{
	clearOutput();
	showWatson();

	output("<i>“You know Kara and I came here to put a stop to your research,”</i> you say, stepping closer to the projector. <i>“And you don’t seem too keen on stopping us.”</i>");
	
	output("\n\nWatson laughs, his voice full of condescension. <i>“My dear [pc.boyGirl], you misunderstand me. Of course I intend to stop you. In fact, I already have. The moment you set foot in the sub-levels - the sewers - I began the process of uploading all the data stored here on the base to different servers. Destroying the equipment here now is a futile, if childish, gesture. A few thousand credits of hardware lost, a drop in the bucket. At worst, if you kill or disable Doctor Khan, you’ll set us back by a few weeks until we can find a replacement. You are a small and insignificant bump along the path we tread, little more.”</i>");
	
	output("\n\n<i>“Son of a bitch!”</i> Kara screams, pounding her fist on the wall.");
	
	output("\n\n<i>“Indeed,”</i> Watson adds, clenching his pipe between his teeth and reaching out beside him. A holo-map of the Myrellion system flickers into place, showing several vessels closing in. <i>“Every moment you’ve been within this base, every soldier you’ve killed, every second wasted in pointless battle, has been a delaying tactic whilst I recall this base’s commander, Lord Faell, from her patrol of the outer moons. I estimate you have less than five seconds before the first troop transports set down on-base.");
	
	output("\n\n<i>“So please, make yourselves at home. Sit, relax. You still have a few moments before your lives are over. Use them wisely.”</i>");
	
	output("\n\nWatson flickers out of existence, leaving you in the dark.");
	
	output("\n\n<i>“God... no,”</i> Kara moans, slumping against the wall. <i>“We’re fucked.”</i>");
	
	output("\n\n<i>“Come on!”</i> you shout, grabbing her by the arm. <i>“We have to get out of here!”</i>");
	
	output("\n\nWith a little encouragement, Kara collects herself. <i>“Right... right. Before we leave, there’s something I need to know. Let’s get to Khan’s office. I need to see something.");

	processTime(10);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function kq2WatsonSelfDestruct():void
{
	clearOutput();

	output("<i>“Fuck it, let’s be childish!”</i> you grin, grabbing a holo-board from one of the nearby servers and typing in a few commands. Kara’s hacking has given you more or less unlimited systems access, for what little good it does you. But there is one thing you could manage...");

	output("\n\nSure enough, there’s a self destruct routine buried deep in the command console. A quick glance tells you there’s a pocket nuke buried somewhere deep beneath the base: enough to wipe the place out, but the base’s position in the depths of the caldera should keep the blast from hurting any myr.");
	if (pc.IQ() >= 10) output(" Of course, you do remember something about a fleet ready to glass the planet overhead, if a nuclear launch -- or blast, you suppose -- is detected....");

	output("\n\nDo you risk it?");

	processTime(3);

	clearMenu();
	addButton(0, "Nuke It", kq2NukeIt);
	addBUtton(1, "No", mainGameMenu);
}

public function kq2NukeIt():void
{
	clearOutput();

	output("You rip the console’s wireless plug out, just in case Watson’s watching, and hit the activation sequence. Here we go!");

	// 9999 - make this time value actually agree with the game time it will take for the player to actually be able to get the fuck out.

	output("\n\n<i>“Nuclear Cleansing System Activated,”</i> a feminine voice drones from the console. <i>“Detonation in T-minus: 10 minutes. Please get to minimum safe distance.”</i>");
	
	output("\n\n<i>“Wait, what did you just do?”</i> Kara blinks, ears perking straight up. <i>“Woah, wait, didn’t you hear about that... that fleet in orbit? They’ll glass the whole planet!”</i>");
	
	output("\n\nCalculated risk. You grab Kara by the shoulder and shove her towards the door - you’ve got get out of here, NOW!");

	flags["KQ2_NUKE_STARTED"] = GetGameTimestamp();

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function showKQ2Engineer():void
{
	if (flags["KQ2_KARA_WITH_PC"] == 1) showBust("KARA", "KQ2ENGINEER");
	else showBust("KQ2ENGINEER");

	showName("LAPINARA\nENGINEER");

	author("Savin");
}

public function kq2EnterEngineersRoom():void
{
	if (flags["KQ2_ENGINEER_NUM_DRONES"] == undefined) flags["KQ2_ENGINEER_NUM_DRONES"] = 1 + rand(4);

	if (flags["KQ2_LEFT_ENGINEER"] == undefined)
	{
		clearOutput();
		showKQ2Engineer();

		output("You step into the security room, and immediately are greeted by the sound of low, metallic grating that’s almost like growling. You take a step back as a huge, black canine robot stalks out of the shadows, its teeth bared. Behind it stands a small, feminine figure - not quite four feet in height, with svelte curves that are muted by a ballistic breastplate that’s much too bulky for its user. She’s nearly naked aside from the plate and a pair of high-heeled boots... and a jockstrap that’s barely holding back a pair of oversized testicles, out of which bobs a six-inch canine cock. The diminutive creature scowls at you, hands on her hips, the pair of bunny-ears atop her head lying flat back against her scalp, showing off a pair of demonic-looking horns that sprout out from her orange hair.");
		
		//9999
		if (9999 == 0) output("\n\nIt takes you a good moment to realize the creature’s a lapinara, clearly unlike those you’ve seen before!");
		else output(" It takes longer than usual for your Codex to identify the creature as a lapinara, of the non-parasitic variety.");
		
		output("\n\n<i>“How did you get past all the guards!?”</i> she growls, staring");
		if (9999 == 0) output(" up at you");
		else output(" straight at you");
		output(" with a pair of huge green eyes. <i>“Get out of here, or my pet");
		if (flags["KQ2_ENGINEER_NUM_DRONES"] > 1) output("s");
		output(" will rip you to shreds!”</i>");
		
		output("\n\nAfter a moment, she adds, <i>“A-and I’ll shoot you, too! Just for good measure!”</i>");

		// [Fight] [Leave] [Bribe]
		clearMenu();
		addButton(0, "Fight", kq2FightEngineer, flags["KQ2_ENGINEER_NUM_DRONES"]);
		addButton(1, "Leave", kq2LeaveEngineer);
		addButton(2, "Bribe", kq2BribeEngineer);
	}
	else
	{
		showKQ2Engineer();

		output("\n\n<i>“You again!?”</i> the lapinara screeches as you shove the door open. <i>“Th-that’s it! I gave you a warning. Go get "+ pc.mf("him", "her")+", pupp"+ (flags["KQ2_ENGINEER_NUM_DRONES"] == 1 ? "y" : "ies") +"!”</i>");
		
		output("\n\nLooks like it’s a fight!");

		clearMenu();
		addButton(0, "Fight!", kq2FightEngineer, flags["KQ2_ENGINEER_NUM_DRONES"]);
	}
}

public function kq2FightEngineer(numDrones:int):void
{
	var f:Array = [pc];
	if (flags["KQ2_KARA_WITH_PC"] == 1) f.push(kara);

	var h:Array = [new KQ2Engineer()];
	for (var i:int = 0; i < numDrones; i++) h.push(new KQ2FenrisDrone());

	CombatManager.newGroundCombat();
	CombatManager.setFriendlyCharacters(f);
	CombatManager.setHostileCharacters(h);
	CombatManager.victoryCondition(CombatManager.SPECIFIC_TARGET_DEFEATED, h[0]);
	CombatManager.victoryScene(kq2EngineerPCVictory);
	CombatManager.lossScene(kq2CapturedByPiratesBadEnd);
	CombatManager.beginCombat();
}

public function kq2EngineerPCVictory():void
{
	clearOutput();
	showKQ2Engineer();

	output("The lapinara and her drone");
	if (CombatManager.getHostileCharacters().length > 2) output("s");
	output(" collapse, utterly defeated. <b>You find a keycard on her person</b>. No doubt this’ll get you into the research facility!");

	pc.createKeyItem("Key Card - R&D Security Pass");
	output("\n\n<b>New Key Item: Key Card - R&D Security Pass</b>.");

	flags["KQ2_DEFEATED_ENGINEER"] = 1;

	CombatManager.genericVictory();
}

public function kq2LeaveEngineer():void
{
	clearOutput();
	showKQ2Engineer();

	flags["KQ2_LEFT_ENGINEER"] = 1;

	output("You cautiously step back out of the security room, and quickly have the door slammed in your face.");

	processTime(1);

	currentLocation = "KQ2_BARRACKSINTERIOR";
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function kq2BribeEngineer():void
{
	clearOutput();
	showKQ2Engineer();

	output("<i>“Come on. Maybe we can work something out?”</i> you suggest, raising your hands disarmingly.");
	
	output("\n\nThe hermaphroditic lapinara cocks an eyebrow and crosses her arms over her chest. <i>“Maybe... maybe we can, yeah. I’ll give you my keycard, and you fuck off to wherever you’re going if you...");

	processTime(1);

	//[Sex] [Money] [Dirty Magazine]
	clearMenu();
	addButton(0, "Sex", kq2GibEngyDankHoles, undefined, "Sex", "Bend over and let the lapinara bust a nut in your backside in exchange for the keycard.");
	addButton(1, "Money", kq2GibEngyCash, undefined, "Money", "Give the lapinara some money in trade. Considering who she works for, it'd probably take 1,000 credits to convince her.");
	if (pc.hasKeyItem("Hentai Magazine")) addButton(2, "DirtyMag", kq2GibEngyDirtyMag, undefined, "Dirty Magazine", "Try and pawn off that dirty magazine Kara gave you on the lapinara.");
}

public function kq2GibEngyDirtyMag():void
{
	clearOutput();
	showKQ2Engineer();

	output("<i>“...give me that magazine!”</i> she says, pointing to the hentai comic sticking out of your pack.");
	
	output("\n\nWell, that’s a pretty low price. You take it out and give it to the tiny dick-girl, noticing her cock harden as she takes possession of it. Her dog");
	if (flags["KQ2_ENGINEER_NUM_DRONES"] > 1) output("s");
	output(" growl");
	if (flags["KQ2_ENGINEER_NUM_DRONES"] == 1) output("s");
	output(" at you until you back off again a little ways. Their owner clutches the magazine, quickly leafing through the brightly-colored pages - and gaining a little color in her cheeks in the process.");
	
	output("\n\n<i>“So. Keycard?”</i>");
	
	output("\n\nShe looks up, startled. <i>“Uh. Yeah, sure. Card, whatever,”</i> she says, grabbing a card off of the desk behind her and shoving it into your hand. <i>“Now fuck off.");
	//{if convinced Steph to do porn:
	if (9999 == 0) output(" I’ve been waiting for the first issue of </i>Galactic Fucktress<i> for ages!");
	output("”</i>");
	
	output("\n\nSomewhat amazed that actually worked, you take the keycard and leave the lapinara engineer to her business.");

	pc.createKeyItem("Key Card - R&D Security Pass");
	output("<b>New Key Item: Key Card - R&D Security Pass</b>.");

	processTime(2);

	currentLocation = "KQ2_BARRACKSINTERIOR";
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function kq2GibEngyCash():void
{
	clearOutput();
	showKQ2Engineer();

	output("<i>“...give me a thousand credits!”</i> she says, extending a hand to you, palm open and expectant. You dig a credit chit out of your pack and plant it in her outstretched hand. The engineer squeals in excitement, bouncing around on her powerful legs. <i>“Score! Take the card, I’m going on a SHOPPING SPREE! Whoo!”</i>");
	
	output("\n\nShe grabs a keycard off of the desk behind her and tosses it at you. You narrowly snatch it away from the fangs of");
	if (flags["KQ2_ENGINEER_NUM_DRONES"] > 1) output(" one of");
	output(" her cyber-hound");
	if (flags["KQ2_ENGINEER_NUM_DRONES"] > 1) output("s");
	output(", and quickly make your way out of the security office.");

	pc.createKeyItem("Key Card - R&D Security Pass");
	output("<b>New Key Item: Key Card - R&D Security Pass</b>.");

	processTime(2);

	currentLocation = "KQ2_BARRACKSINTERIOR";
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function kq2GibEngyDankHoles():void
{
	clearOutput();
	showKQ2Engineer();

	var engineer:KQ2Engineer = new KQ2Engineer();

	output("<i>“...bend over and let me fuck you!”</i> the lapinara finishes, thrusting her crotch at you. Her bright red puppy pecker bobs eagerly, a tiny glint of moisture already on its tip. <i>“All the other pirates call me a parasite and won’t touch me! Please... I’m so horny, I’ll trade the card for just a quick fuck.”</i>");

	if (flags["KQ2_KARA_WITH_PC"] == 1) output("\n\n<i>“I’ll just, uh, wait outside.... Cover the door for you.”</i> Kara says, slipping away.");

	output("\n\nYou suppose fucking <i>is</i> preferable to fighting, and tell the diminutive slut as much. She grins, practically bouncing in place, and orders her pet");
	if (flags["KQ2_ENGINEER_NUM_DRONES"] > 1) output("s");
	output(" to stand down - for now. <i>“Great! Now just grab something and");
	if (pc.isTaur()) output(" just... uh, brace yourself!");
	else output(" bend over.");
	output(" Don’t worry, I’ve got some lube somewhere around here...”</i>");

	output("\n\n");
	if (pc.ass.looseness() >= 3 || pc.ass.wetness() >= 3) output("You doubt a dick that size would <i>need</i> any to get into you, but you let the lapinara have her fun for now.");
	else output("That’s a relief!");
	output(" You shrug out of your [pc.gear] and stretch yourself out over one of the computer consoles, putting your [pc.butt] on display for the tiny engineer. She shows her appreciation with a gentle caress, rubbing her small fingers all along the curve of one of your cheeks.");

	output("\n\nA little moan escapes her lips as she teases you. <i>“Mmm. Such a nice ass... I’ve waited soooo long for this,”</i> she purrs, planting her other hand on your opposite hip. She pulls herself in, digging her face right into the crack of your [pc.butt]");
	if (pc.buttRating() >= 8) output(" and giving you a little back-door motor boat");
	else output(" and lapping her tongue through it, making you shiver with the sensation");
	output(". With a gasp of excitement, the girl manages to pull herself off of you long enough to say, <i>“Don’t worry. Gonna treat this ass right.”</i>");

	output("\n\nShe reaches down and grabs the bottle of lube she’d promised, squirting a nice helping of cool liquid into her hand, and across your bare cheeks. You shiver at the coldness of it, but the sensation quickly fades as the lapinara goes to work, rubbing the lube into your skin and shepherding it towards your [pc.asshole]. A shock of pleasure runs through you as one of her fingers pushes into you, opening you just wide enough to let a steady stream of lube trickle in after in.");

	output("\n\n<i>“Like that?”</i> your anal-obsessed lover asks, using her other hand to rub your butt, just enough to relax you a little around her probing digit.");
	if (pc.tallness <= 48 && pc.ass.looseness() < 3)
	{
		output(" Her finger feels not unlike a cock inside your tiny body, thrusting into you enough to make your");
		if (pc.hasCock()) output(" [pc.cock] jump to attention");
		else output(" body flush with heat");
	}
	else
	{
		output(" At least, that’s her intention. Truth be told, you can barely feel her in there, her finger’s so small compared to");
		if (pc.tallness >= 72) output(" you");
		else output(" the cocks you’re capable of pleasuring");
		output(". You push back against her hand, urging her lube-slick digit deeper, making sure she slathers as much of your passage as she can.");
	}

	output("\n\nSatisfied with her work, the lapinara slowly withdraws from you. <i>“Okay,");
	if (pc.tallness >= 72) output(" let me go find a box to stand on!”</i> she says excitedly, scrounging up a small supply crate and dragging it up behind you. She scrambles up onto it, putting her more on level with your much larger frame.");
	else output(" let’s do this!”</i> she cheers, grabbing your [pc.hips].");
	output(" Her six-inch puppy-dick slides up between your lubed-up cheeks, its pointed head rubbing through your crack and gently teasing your [pc.asshole]. Instinctively, your fingers dig into the edge of the console, stretching yourself out over it and wiggling your hips back against the lapinara’s canine cock.");

	output("\n\nShe giggles as your backside slips and slides around her member, all but sucking her in. It’s just a slight shift of her own slender hips to put her crown flush against your asshole, and push in. Your breath catches as the pointed tip spreads your hole open, making room for her thicker shaft to follow it in. Her fingers dig into you, squeezing your ass, and she lets out a low, husky moan. <i>“Fuuuuck. Oh, that’s good.");
	if (pc.ass.looseness() < 3) output(" So tight, too! You’re gonna make me work for it, huh?");
	else output(" And so loose! I feel like I’m just sliding in!");
	output("”</i>");

	output("\n\nYou give the lapinara a little grin over your shoulder, and relax in her hands, enjoying the feeling of her prick inside you,");
	if (pc.ass.looseness() < 3) output(" stretching you out");
	else output(" filling your cock-hungry hole");
	output(". After a moment of penetration, you quickly feel a tiny bump of thickness press against your hole - the knot at the base of her dick. The tiny engineer presses it against you, seeming to think about it for a moment before withdrawing, and starting to thrust. Your lover goes from slow to full throttle before you can blink, pounding away at you thanks to the ample helping of lube coating your anal walls. She moans like a whore, and you soon hear her breastplate clattering to the ground, letting her pinch and grab at her small breasts. Her other hand, however, slips down around your [pc.hip], starting to");
	if (pc.hasVagina()) output(" caress your [pc.cunt]");
	else if (pc.hasCock()) output(" wrap her fingers around your [pc.cock], bringing it from an excited half-mast to full attention. Her hand is still slathered with cool, slick lube, and she’s able to glide across your member with ease, returning the pleasure you’re giving her own member");
	else output(" rub the tender, sexless [pc.skinFurScales] of your crotch");
	otuput(". You let yourself moan in answer to her wandering hand, pushing back against her six-inch pole to take it deeper, trying to feel every inch of throbbing hot dog-meat inside you.");

	output("\n\nA few heart-pounding moments of thrusting later, and your lapinara lover is screaming and jackhammering her hips, slamming them into your [pc.butt] with wild abandon. You can feel her");
	if (pc.ass.looseness() >= 3 || pc.tallness >= 72) output(" tiny");
	else output(" girthy");
	output(" prick swelling inside you, straining to hold back her orgasm; her knot batters against the rim of your hole, swollen to nearly the size of its owner’s fist and demanding entrance. You’re only just able to push the swollen member back - you can’t spend <i>that</i> kind of time here, waiting for her to untie you. The lapinara makes a pleading moan when you rebuke her knot, but doesn’t push the issue: her attention is snatched away in a moment but a surge of seed rushing through her member and into your eagerly awaiting posterior. She screams her pleasure, slamming herself as deep into you as she can before unloading a thick rope of hot and creamy spunk across your anal walls.");

	output("\n\nYou wince as you feel her cum pour into you. It’s much hotter than you were expecting, like a stream of boiling cream flooding into you and searing your walls. Giving a low groan of your own, you dig your fingers into the desk and try and bear it, gasping and moaning as the engineer continues to thrust into you as she cums. Your bowels get a thorough spunk-basting by the time she’s done, filling you with more lapinara cum than you’d have thought such a tiny girl could produce, even with those massive balls she was toting around.");

	output("\n\nThe lapinara grunts as she pulls herself out of you, trailing a sticky web of spooge behind her. A little trickle of it leaks out of your well-fucked hole, drooling down your thigh. <i>“Whoo! I’ve never fucked a butt quite like that!”</i> she coos, wiping off the last traces of her orgasm off on your upraised ass. She flops back in a chair behind one of the desks and tosses a keycard to you. <i>“You earned it. Hehe, I’ll be fapping to this memory for a loooong time.”</i>");

	output("\n\nYou spend a moment catching your breath, letting your body cool down from the rough buttfucking, before grabbing the card, cleaning up as best you can, and rejoining Kara outside.");

	output("\n\n<i>“Score!”</i> you say, holding up the card.");

	output("\n\n<i>“I guess you’re a lover, not a fighter, huh?”</i> she chuckles.");

	pc.createKeyItem("Key Card - R&D Security Pass");
	output("<b>New Key Item: Key Card - R&D Security Pass</b>.");

	processTime(15+rand(5));

	pc.loadInAss(engineer);
	pc.orgasm();

	currentLocation = "KQ2_BARRACKSINTERIOR";
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function showKhan():void
{
	if (flags["KQ2_KARA_WITH_PC"] == 1) showBust("KARA", "KHAN");
	else showBust("KHAN");

	author("Savin");

	showName("\nDR KHAN");
}

public function kq2EncounterKhan():void
{
	clearOutput();
	showKhan();

	output("You give Kara slight nod, signaling her to pop the hatch and open the door. You go in first, [pc.rangedWeapon] raised. The sealed lab hits you with a sultry heat the moment you step in, clinging to your [pc.skinFurScales] as your [pc.feet] tread through something wet and sticky covering the white floor. The lab’s a mess compared to the sterile facility you just passed through: computers and machinery is turned and toppled all over, and covered in a thick, musky white goo.");
	
	output("\n\nYou hear a click from across the lab, and have just enough time to dive behind an overturned desk before a lightning bolt screeches across the room, slamming into the wall just behind where you’d stood a moment ago. A laugh booms across the room, drawing your attention to a small man sitting on what at first glance is a large, tan beanbag chair in the corner of the room, a smoking pistol in his hand. Several young women surround him, gold-plated myr girls in white lab coats that hang open from bare shoulders, leaving their nude bodies underneath on shameless display for you: breasts swollen with honey, and honeypots drooling with blatant desire.");
	
	output("\n\nOnce the immediate excitement of the man’s shot is over, they begin to fawn over him, chitin-clad hands playing across his soft fur, caressing the seat beneath him, falling to their knees around a canine-shaped cock with three large, turgid knots at full mast - though it remains out of their reach, trapped in a hardlight cage not unlike a chastity belt. He’s a kui-tan, the same tanuki-like race as Ambassador Juro, and as you watch him, you can see that’s not a beanbag chair he’s sitting on, but a pair of almost comically swollen testicals, large enough to keep his feet from touching ground.");
	
	output("\n\n<i>“I told you pirate bastards to leave me alone!”</i> the man shouts, snapping off another shot as Kara dives into the room, rolling into cover behind an overturned desk. <i>“You’ll get your devices when they’re damn ready, and not a second before! I’ll not have my work roughshod by impatient peasants who don’t know the meaning of </i>SCIENCE<i>. Nobody rushes DOCTOR SOUTA KHAN!”</i>");
	
	
	output("\n\n<i>“");
	if (kara.isNice()) output("Hold your fire! We aren’t pirates!");
	else if (kara.isMischeivious()) output("We’re not pirates, you crazy furball!");
	else output("Try that again, asshole! You’re shooting at the wrong people.");
	output("”</i>");
	
	output("\n\nHe laughs at that, racking the charger on his lightning gun. <i>“Not pirates? Then you’re just more lab rats, then? How considerate of my masters to replenish my stock... I was getting bored of these girls, anyway!”</i>");
	
	output("\n\nAs he speaks, several small hover drones take off from alcoves in the wall, charging up their own zappers as they ascend, starting to fly towards you.");
	
	output("\n\nLab rats? Something tells you he’s not letting you get past.");

	var tKhan:KQ2Khan = new KQ2Khan();

	CombatManager.newGroundCombat();
	CombatManager.setFriendlyCharacters([pc, kara]);
	CombatManager.setHostileCharacters([tKhan, new KQ2FightSecDrones(), new KQ2FightSecDrones(), new KQ2FightSecDrones()]);
	CombatManager.victoryCondition(CombatManager.SPECIFIC_TARGET_DEFEATED, tKhan);
	CombatManager.victoryScene(kq2KhanPCVictory);
	CombatManager.lossScene(kq2KhanPCDefeat);
	CombatManager.displayLocation("DR KHAN");

	addButton(0, "Fight!", CombatManager.beginCombat);
}

public function kq2KhanPCVictory():void
{
	clearOutput();
	showKhan();

	flags["KQ2_DEFEATED_KHAN"] = 1;

	output("<i>“How... how are they not stopping!?”</i> Khan shrieks, his little legs pistoning atop his oversized ballsack as if he’s trying to run away. He’s firmly planted on the ground, however, completely immobile. With a cry of terror, he throws his lightning gun to the ground and starts trying to pull himself along the wall, dragging his nuts behind him for a few useless inches.");
	
	output("\n\nYou and Kara advance on him, weapons up, brushing aside a few stragglers in his personal harem. The gold myr lab-sluts cry out for their <i>“master”</i>, rushing to his side and clinging to his massive sack. The doctor looks at you with wide eyes, still trying to scamper off, grunting in frustration as he manages an inch or two a second. In an act of final desperation, Khan grabs one of his harem girls, digging into the pocket of her lab coat and pulling out a pink grenade.");
	
	output("\n\n<i>“YOU’LL NEVER TAKE ME!”</i> he shrieks, hurling it at you.");

	output("\n\n");
	if (kara.isNice()) output("<i>“Oh, no you don’t,”</i> Kara says, swatting the grenade back at him mid-air.");
	else if (kara.isMischeivious()) output("<i>“Think fast!”</i> Kara shouts, grabbing the grenade mid-air and beaning Khan in the head with it.");
	else output("Kara back-hands the grenade out of the air, letting it roll back towards its owner.");
	output(" It detonates in a pink cloud that utterly envelops him and his harem, spreading out almost far enough to draw you into it, too. Just a little whiff of the brightly-colored gas sends a shiver up pleasure up your spine.");

	output("\n\nKara, too, flushes a bit as vapors waft past her. <i>“Whew. That’s some potent stuff,”</i> she murmurs, adjusting the band of her half-skirt to make the sheer cloth cover a bit more of her crotch.");
	
	output("\n\nEven before the cloud disperses, you can hear desperate moans from inside it, the shadows of girls moving all over their master as overwhelming, chemically-induced lust overtakes them. When the gas fades, you find quite the sight in store for you: Doctor Khan desperately but futilely tugging at the hardlight cage firmly affixed around his tri-knotted dick while his harem desperately kiss and fondle each other and their master’s scrotum, all trying to find some measure of relief.");
	
	output("\n\n<i>“I’ll take that,”</i> Kara says, snatching a small remote from Khan’s hand and twisting a dial on it. He gulps, eyes wide, as Kara waves the remote over him and his harem... and the small metal collars each of the gold myr is wearing snap open and fall off. There’s a moment of silence as the girls’ eyes go wide, their vapid expressions evaporating into understanding.");

	output("\n\n<i>“What... where...”</i> one of the girls gasps, looking down at her nearly naked body.");
	
	output("\n\n<i>“It’s alright. You’re safe now,”</i> Kara says, putting a hand on the girl’s shoulder. <i>“Khan’s got no hold on you anymore.”</i>");
	
	output("\n\nRealization passes over the gold myr, one face at a time. They all come to look angrily at the overburdened kui-tan, desperately clawing at the cage surrounding his cock. He looks up after a minute, chuckles nervously, and scoots an inch or two back from the collection of gold myr surrounding him.");
	
	output("\n\n<i>“Uh. L-ladies, please... our work was a resounding success! The collars exceeded our wildest expectations. Surely... uh, surely you can see the progress we’ve made is more than worth-”</i>");

	output("\n\n<i>“You bastard!”</i> one of the girls says, storming up and slapping the doctor across the face. <i>“We... we </i>trusted<i> you!”</i>");
	
	output("\n\nKhan sucks in a breath, rubbing his cheek. <i>“L-look, we can work something out, right? Come on, you’re all reasonable people... right?”</i>");

	//[Talk: Gold Myr] [Talk: Khan] [Fuck Khan] [Loot Room] [Leave]
	kq2KhanVictoryMenu();
}

public function kq2KhanVictoryMenu():void
{
	clearMenu();
	if (flags["KQ2_KHAN_MYR"] == undefined) addButton(0, "Talk: Myr", kq2KhanPCVictoryTalkMyr, undefined, "Talk: Gold Myr", "Talk to the gold myr girls. How did they end up here?");
	else addDisabledButton(0, "Talk: Myr");

	if (flags["KQ2_KHAN_KHAN"] == undefined) addButton(1, "Talk: Khan", kq2KhanPCVictoryTalkKhan, undefined, "Talk: Dr. Khan", "Talk to the defeated researcher.");
	else addDisabledButton(1, "Talk: Khan");

	addButton(2, "Fuck Khan", kq2KhanVictoryFuckRouter, undefined, "Fuck Dr. Khan", "Give the doctor a taste of his own medicine. Make him service you orally while Kara milks what's gotta be gallons of spooge via the back door.");

	if (flags["KQ2_KHAN_LOOTED"] == undefined)
	{
		addButton(3, "Loot Room", kq2KhanPCVictoryLootRoom, undefined, "Loot The Room", "Loot the room. Khan had a nice gun that went... somewhere.");
	}
	else
	{
		addDisabledButton(3, "Loot Room");

		if (flags["KQ2_KHAN_LOOTED_COAT"] == undefined) addItemButton(5, new KhansLabCoat(), kq2LootLabCoat);
		else addDisabledButton(5, "LabCoat", "Lab Coat", "You've already taken it!");

		if (flags["KQ2_KHAN_LOOTED_CASTER"] == undefined) addItemButton(6, new KhansArcCaster(), kq2LootArcCaster);
		else addDisabledButton(6, "ArcCaster", "Arc Caster", "You've already taken it!")
	}

	addButton(14, "Leave", kq2KhanLeave, undefined, "Leave", "Leave the researchers to their business. You've come here to destroy their work, after all.");
}

public function kq2KhanPCVictoryTalkMyr():void
{
	clearOutput();
	author("Savin");

	output("You turn your attention from the debilitatingly swollen kui-tan to the ex-harem around him. Between angry glances at their captor, many of them are buttoning up what’s left of their lab coats or recovering bits of clothing scattered across the lab. When you approach them, they set aside whatever it is they’re doing and give you their full attention, saying <i>“thank you”</i> in every way imaginable.");
	
	output("\n\nWhen they finally let you get a word in edgewise, you ask a few of them how they managed to end up in a pirate lab in the middle of nowhere. Shamefacedly, one of them answers, <i>“We were all scientists working for a big firm in Gildenmere. We worked in chemical weapons, gases mostly. These... people... approached us just after you offworlders first appeared and made a deal we couldn’t refuse: they offered to share their technology with us if we would help them reproduce our company’s gases. Imagine what we could have done with offworlder weapons -  lasers and cannons and new types of armor! All they wanted were some of our formulas, help setting up the facility...”</i>");
	
	output("\n\n<i>“You’re weapons engineers?”</i> Kara asks, cocking an eyebrow. <i>“And you came here willingly?”</i>");
	
	output("\n\nThe ant-girl nervously presses her four sets of fingers together. <i>“We... we did. But we didn’t know what kind of people they were! Especially him,”</i> she says, pointing towards Khan. <i>“They had us work with him. The pirates’ leader, the woman with red hair and big ears, she made us work for Khan, making these collars of his spray gas under the skin. Hypo-collars, he called them. We’d never seen anything like them before. As soon as we had the gas release just the way he wanted it, though, he collared us all in our sleep.”</i>");
	
	output("\n\n<i>“Bastard!”</i> a few of the other girls chime in.");
	
	output("\n\nTheir leader nods. <i>“It’s hard to remember what happened since, but I know we’ve done little more than be forced to worship his manhood day in and day out. You have our thanks for freeing us. We’ll not be duped by offworlders’ honeyed words again.”</i>");
	
	output("\n\n<i>“What are you going to do now?”</i> you ask them.");
	
	output("\n\nThe looks they give you say that they don’t really know. <i>“Escape, somehow,”</i> the leader says. <i>“You don’t need to worry about us. We’ll find a way out. I imagine you’ve created more than enough confusion for us to slip away without too much trouble.”</i>");
	
	output("\n\nAs the gold myr go back to collecting themselves, Kara puts a hand on your shoulder and says, <i>“We did a good thing here. I’ve been where they were... it’s not something I’d wish on anyone. Except maybe that fuzzy bastard in the corner.”</i>");

	flags["KQ2_KHAN_MYR"] = 1;
	kq2KhanVictoryMenu();
}

public function kq2KhanPCVictoryTalkKhan():void
{
	clearOutput();
	author("Savin");

	output("You approach Doctor Khan, still slumped against a wall, desperately trying to look small while he struggles with the firmly-placed hardlight cage locking down his cock. He reeks of lust-vapors and cum, with streaks of pink staining his fur where the grenade detonated next to him.");
	
	output("\n\n<i>“Doesn’t look like he has much to say,”</i> Kara says, curling a lip in disgust at him. <i>“Then again, maybe he could use a little... help.. with that.”</i>");
	
	output("\n\nAs if for emphasis, Kara adjusts the fabric of her catsuit, revealing a pretty impressive bulge in her black-clad crotch. <i>“Teach this bastard a lesson...”</i>");

	flags["KQ2_KHAN_KHAN"] = 1;
	kq2KhanVictoryMenu();
}

public function kq2KhanPCVictoryLootRoom():void
{
	clearOutput();
	author("Savin");

	output("You spend a few minutes poking through the room, overturning desks and chairs to find any hidden gear. Among the trash, you manage to find a shiny white Arc Caster lightning pistol half hidden beneath one of Khan’s enormous balls as well as a lab coat that’s in much better condition than the ones worn by the gold myr assistants. You also turn up several credit chits scattered around, totaling up to 2,500 credits. Not a bad haul for a room full of buck-naked people.");

	pc.credits += 2500 + rand(27);
	flags["KQ2_KHAN_LOOTED"] = 1;
	kq2KhanVictoryMenu();
}

public function kq2LootLabCoat():void
{
	lootScreen = kq2LabCoatCheck;
	itemCollect(new KhansLabCoat());
	flags["KQ2_KHAN_LOOTED_COAT"] = 1;
}

// Cheesy hack to see what the player did with the item. If they discarded it, clear the flag that said they looted it.
public function kq2LabCoatCheck():void
{
	if (!pc.hasItemByType(KhansLabCoat) && !pc.armor is KhansLabCoat) flags["KQ2_KHAN_LOOTED_COAT"] = undefined;
	kq2KhanVictoryMenu();
}

public function kq2LootArcCaster():void
{
	lootScreen = kq2LabCoatCheck;
	itemCollect(new KhansArcCaster());
	flags["KQ2_KHAN_LOOTED_CASTER"] = 1;
}

public function kq2LabCoatCheck():void
{
	if (!pc.hasItemByType(KhansArcCaster) && !pc.rangedWeapon is KhansArcCaster) flags["KQ2_KHAN_LOOTED_CASTER"] = undefined;
	kq2KhanVictoryMenu();
}

public function kq2KhanLeave():void
{
	clearOutput();
	author("Savin");

	output("<i>“Alright. Let’s get out of here,”</i> you say. <i>“Still have work to do.”</i>");
	
	output("\n\n<i>“Yeah,”</i> Kara says, drawing her pistol again. <i>“This wasn’t what I expected the Void to be working on, but it’s just as bad as them getting more WMDs. Better destroy the research before the Void turns into the galaxy’s next biggest slaver ring.”</i>");
	
	output("\n\nJust as you’re turning to go, you feel a tug on your arm. One of the youngest-looking golden myr is standing behind you, her eyes big as she stares");
	if (pc.tallness >= 72) output(" up");
	else if (pc.tallness <= 60) output(" down");
	output(" at you. Nervously, she says, <i>“Um... speaking of slaves. I thought you should know, we brought several red myr prisoners of war with us. It... it was better than letting them rot in camps, we thought. They’re down the hall, to the west. They deserve better than what we’ve done to them.”</i>");
	
	output("\n\n<i>“Slaves taking slaves,”</i> Kara grunts, picking the remote back up from the floor and pressing it into your hand. <i>“");
	if (kara.isMischeivious() || kara.isAss()) output(" And I was just starting to feel good about freeing them. ");
	output("Your turn, [pc.name]. Let’s go find us some red bugs.”</i>");

	CombatManager.genericVictory();
}

public function kq2KhanVictoryFuckRouter():void
{
	if (pc.hasCock()) kq2KhanPCDickFuck();
	else kq2KhanPCVagFuck();
}

public function kq2KhanPCDickFuck():void
{
	clearOutput();
	
	showBust("KARA", "KHAN");
	author("Savin");

	output("<i>“I think this bastard deserves a taste of his own medicine,”</i> you say, taking a menacing step towards Khan. The helpless kui-tan tries futilely to scoot away from you. You grab him by the scruff of the neck. He mewls helplessly, eyes wide with fright as you circle around him, planting his face pretty much on level with your crotch. Turning to Kara, you add, <i>“Don’t you think?”</i>");
	
	output("\n\n");
	if (kara.isNice()) output("<i>“Normally I wouldn’t, but... for this sicko, I’ll make an exception,”</i> Kara says with a wink, moving to his opposite side.");
	else if (kara.isMischeivious()) output("<i>“Couldn’t agree more, [pc.name],”</i> Kara answers, a mischievous twinkle in her eerie eyes. Slowly, she slips behind the prostrate kui-tan, tracing her fingers along his bare, thick fur as she goes.");
	else output("Kara gives you a silent, approving nod and moves behind the kui-tan, giving his bare, furry ass a rough slap.");
	output(" Your companion plants herself behind Khan and yanks down her skirt and shorts, revealing a thick pink kittycock dangling between her legs. Khan’s eyes widen even more as she flops her prick into the crack of his ass.");
	
	output("\n\n<i>“You... you...”</i> Khan babbles, squirming pitifully under you as you shift off your own [pc.gear]. You grab his head and mash his short little muzzle into the base of your [pc.cock] the moment it’s free of your gear, muffling any further argument with your crotch.");
	
	output("\n\n<i>“Open,”</i> you command, squeezing down on him. Meekly, the defeated, lusty kui-tan obeys. You grin as you see his little caged cock twitch, drooling obscenely as he opens wide and accepts a thrust of your cock into his mouth. You groan as the kui-tan’s black lips seam around your shaft, sucking you in with surprising skill.");
	
	output("\n\n<i>“Oh, somebody’s had some practice,”</i> you tease. His prick again twitches in its glowing cage, and Khan’s legs desperately try to close, shielding it from view. So you weren’t wrong.... You grin at the kui-tan’s embarrassment, but urge him on to ply that talented tongue on your thrusting cock.");
	
	output("\n\n<i>“Poor guy looks so pent up,”</i> Kara chuckles from the other side of him, her hand vanishing underneath the kui-tan’s hugely fluffy tail. You feel Khan’s body go rigid, his tongue lashing around your length. <i>“Pirates must have kept him nice and locked up. Makes sense... he’d probably never get anything done without something to keep his mind on track.”</i>");
	
	output("\n\nKara leans in behind Khan, all but pressing herself to his bent back, and whispers into his ear, <i>“Maybe if you work hard to please my friend here, I’ll be nice enough to get you off properly. I can feel a nice, big bulb back here. Sensitive, isn’t it?”</i>");
	
	output("\n\nKhan whines an affirmation, and you shiver as his oral attention shifts fully towards pleasing you, desperately licking and slurping your [pc.cock]. Kara winks. Her buried hand ever so slightly shifts, making the tanuki cry out with pleasure. While Khan’s prick is now out of sight, hidden by his legs, your eyes are drawn to another thick slab of cockmeat, growing stiff at the sight of Khan’s mouth acting as a receptive sheathe to your thrusts.");
	
	output("\n\nYou allow your pleasure to guide you, spurring your movements faster, pounding Khan’s face until he’s gagging on your dick, spittle drooling down from the corners of his mouth. You’re merciless in your face-fucking, knowing full well he’d have treated you no better were your places reversed. The kui-tan’s mouth is nothing but an onahole for you to abuse, the fuck as hard as you can until you spill your seed down his throat.");
	
	output("\n\n<i>“That’s better,”</i> Kara coos, shifting her hand behind Khan. She shifts her hips back, dragging her spiny feline shaft down through the furry cleavage of Khan’s backside, out of sight into the kui-tan’s crack. She lifts her hand out of the way, and thrusts her hips in hard against Khan’s upraised ass. He cries out, squealing almost girlishly as Kara hammers home into his boypussy. The tongue that was slavishly servicing your cock falls still, stunned by the sudden penetration. Khan’s caged prick erupts in a geyser of white cream, cum spewing out of his otherwise average prick like from a firehose.");
	
	output("\n\nKara’s eyes go wide at the sight, startled by the deluge she’s caused - and the visible shrinking of Khan’s sack as just the one thrust starts to empty him. It takes a few moments for Kara to recover from her shock and start moving after that. When she does, Khan lurches forward on your shaft, thrust up by the force of Kara’s hips battering his plush behind. He blinks lazily, as if recovering from a trance, and starts to moan like a bitch in heat around your [pc.cock] as his ass is fucked. Not so high and mighty now, is he?");
	
	output("\n\nYou try and look Khan in the eye, but he’s too far gone. His eyes are crossed, completely vacant of conscious thought, dim with vacant pleasure and longed-for release.");

	if (kara.isNice())
	{
		output("\n\n<i>“I almost feel bad,”</i> Kara groans between balls-deep thrusts.");

		output("\n\n<i>“But not </i>too<i> bad,”</i> you tease back, working to sync your thrusts with hers.");
	}
	else
	{
		output("\n\n<i>“This bitch ain’t bad,”</i> Kara laughs, reaching over to give you a high-five over the bent-over kui-tan. You could swear Khan’s cum-hosing intensifies the moment your fingers touch, and his whole body trembles as his balls slowly deflate.");
	}
	output(" You’re standing in what feels like an inch-thick sea of spooge leaking out of the hardlight chastity belt’s little piss slit, taking him down from beach ball sized nuts towards a pair of cute, fuzzy volleyballs hanging between his legs. If the kui-tan wasn’t speared between two cocks and completely blissed out with anal ecstasy, he might have been able to escape!")

	output("\n\nInstead of making a break for it, of course, Khan moans and his mouth lolls open, tongue caressing your [pc.cock] with a startling eagerness that would have you praising an expert cocksucker; coming from a scientist surrounding himself with a harem of mind-addled girls, his passion nearly leaves you stunned. You reward him by thrusting your [pc.hips] faster, grabbing the sides of his head and pounding away at those thick black lips and sultry wet hole of a mouth. Your partner moves to match you, roughly fucking the kui-tan’s hole just as fast as she can move her hips - and Khan’s ass swallows every inch of spiny kitten-dick Kara feeds it. She glides in and out of his plush keister with abandon, her breath now coming ragged and hard as she thrusts.");
	
	output("\n\nKara cums first, announcing herself with a very un-feminine grunt and slamming herself to the hilt in Khan’s well-used asshole. In turn, the kui-tan’s caged cock swells and strains against its glistening confines, doing everything it can to cum under the kaithrit hermaphrodite’s anal ministrations.");
	
	output("\n\n<i>“Oh, no you don’t,”</i> Kara coos, moving her hips now only in short, jerky little bursts that deny the kui-tan his satisfaction. <i>“Just tighten up and milk it aaaaall out.”</i>");
	
	output("\n\nKhan whines and looks up at you, the sentience slowly flushing back into his eyes now that his balls have been sufficiently drained. Taking pity on the poor kui-tan, you let go of your restraints, allowing his sultry little mouth to milk you to completing as well. You don’t have all the time in the world, after all.");

	output("\n\nSensing your relaxation, Khan reaches up to");
	if (pc.balls > 0) output(" cup your [pc.balls]");
	else output(" stroke your shaft, too");
	output(", trying to finish you as quickly as possible. Even hurried, you can’t deny the skill he possesses");
	if (CodexManager.hasViewedEntry("Kui-Tan")) output(", doubtless thanks to his species’ hermaphroditic population");
	output(". It isn’t long before you’re groaning");
	if (pc.biggestTitSize() >= 2) output(", cupping a breast");
	else output(" stroking his hair");
	output(" and bucking against his short muzzle. With a muted gasp, you let loose, shooting a thick rope of [pc.cumNoun] into Khan’s waiting mouth. He grunts and winces, but has no choice but to accept it, to swallow every drop you pump into him");
	if (pc.cumQ() >= 5000) output(" until he looks positively pregnant with spooge, and his own balls are already swelling in reaction");
	output(".");

	output("\n\nHe sputters and gags as you step back, pulling your [pc.cock] out and leaving a trail of spit and spooge drooling from his mouth - an equal partner to the creampie you soon see trickling down his thighs.");

	output("\n\n");
	if (kara.isNice() || kara.isMischeivious()) output("<i>“We make a good team,”</i> Kara says with a wink, wiping her cock off of the kui-tan’s thigh.");
	else output("<i>“Not bad,”</i> Kara grunts, wiping her cock off on Khan’s furry thigh. <i>“Wouldn’t mind keeping a tight little hole like that around... willingly, of course.”</i>");

	output("\n\nFinished with the kui-tan, Kara gives the defeated, cum-stuffed doctor a little push. He groans and collapses, slipping into a state of sated unconsciousness.");

	output("\n\n<i>“That was too good for him,”</i> a few of the gold myr girls mumble, glowering at their erstwhile master. You silently gather your gear and leave Khan to his sleep.");

	processTime(30+rand(5));
	pc.orgasm();

	CombatManager.genericVictory();
}

public function kq2KhanPCVagFuck():void
{
	clearOutput();

	showBust("KARA", "KHAN");
	author("Savin");

	output("<i>“I think this bastard "+ pc.rawmf("deserves a taste of his own medicine", "needs to learn how to </i>really<i> treat a girl") +",”</i> you say, taking a menacing step towards Khan. The helpless kui-tan tries futilely to scoot away from you. You grab him by the scruff of the neck. He mewls helplessly, eyes wide with fright as you circle around him, planting his face pretty much on level with your crotch. Turning to Kara, you add, <i>“Don’t you think?”</i>");
	
	output("\n\n");
	if (kara.isNice()) output("<i>“Normally I wouldn’t, but... for this sicko, I’ll make an exception,”</i> Kara says with a wink, moving to his opposite side.");
	else if (kara.isMischeivious()) output("<i>“Couldn’t agree more, [pc.name],”</i> Kara answers, a mischievous twinkle in her eerie eyes. Slowly, she slips behind the prostrate kui-tan, tracing her fingers along his bare, thick fur as she goes.");
	else output("Kara gives you a silent, approving nod and moves behind the kui-tan, giving his bare, furry ass a rough slap.");
	output(" Your companion plants herself behind Khan and yanks down her skirt and shorts, revealing a thick pink kittycock dangling between her legs. Khan’s eyes widen even more as she flops her prick into the crack of his ass.");
	
	output("\n\n<i>“You... you...”</i> Khan babbles, squirming pitifully under you as you shift off your own [pc.gear]. You shiver as the cool, sterile air kisses your cooch, mixing with Khan’s hot breath as you pull his face into the cleft of your sex, pressing his wet nose into your slit. He sputters and protests, voice muffled by your muff. After a few moments of struggling, though, Khan’s chemically-induced lustiness overwhelms his senses, and your feel his little lips opening, tongue slithering out.");
	
	output("\n\n<i>“Get going,”</i> you command, sternly holding his face right where you want it. Meekly, the defeated, lusty kui-tan obeys. You grin as you see his little caged cock twitch, drooling obscenely as he opens wide and drills his tongue between the lips of your [pc.cunt]. His tongue is long and wriggling, squirming through your");
	if (pc.gapestVaginaLooseness() <= 2) output(" tight little");
	else if (pc.gapestVaginaLooseness() <= 4) output(" loose");
	else output(" gaping");
	output(" passage as his wet nose presses into your [pc.clit], sending shocks of pleasure through you.");
	
	output("\n\n<i>“Oh, somebody’s had some practice,”</i> you tease. His prick again twitches in its glowing cage, and Khan’s legs desperately try to close, shielding it from view. With his cock caged like that, you suggest, maybe the only way for him to please his harem was with his mouth. You grin at the kui-tan’s embarrassment, but urge him on to ply that talented tongue on your quivering quim.");

	output("\n\n<i>“Poor guy looks so pent up,”</i> Kara chuckles from the other side of him, her hand vanishing underneath the kui-tan’s hugely fluffy tail. You feel Khan’s body go rigid, his tongue lashing around your twat. <i>“Pirates must have kept him nice and locked up. Makes sense... he’d probably never get anything done without something to keep his mind on track.”</i>");
	
	output("\n\nKara leans in behind Khan, all but pressing herself to his bent back, and whispers into his ear, <i>“Maybe if you work hard to please my friend here, I’ll be nice enough to get you off properly. I can feel a nice, big bulb back here. Sensitive, isn’t it?”</i>");
	
	output("\n\nKhan whines an affirmation, and you shiver as his oral attention shifts fully towards pleasing you, desperately licking and slurping your [pc.cunt]. Kara winks. Her buried hand ever so slightly shifts, making the tanuki cry out with pleasure. Your eyes are drawn to Khan’s tiny shaft, trapped in its hardlight cage. It gushes spooge down his swollen nuts and thighs, spurting some onto you.");
	
	output("\n\nYou move your [pc.hips] in answer, grinding against the kui-tan’s little muzzle. You allow your pleasure to guide you, spurring your movements faster, rubbing yourself against Khan’s face until he’s drowning in your pussy, fur darkening with your leaking excitement. You’re merciless in your grasp on him, keeping Khan buried deep in your nethers, knowing full well he’d have treated you no better were your places reversed. The thought spurs your movements on faster, demanding you seize your pleasure from his writhing tongue.");
	
	output("\n\n<i>“That’s better,”</i> Kara coos, shifting her hand behind Khan. She rocks her hips back, dragging her spiny feline shaft down through the furry cleavage of Khan’s backside, out of sight and into the kui-tan’s crack. She lifts her hand out of the way, and thrusts her hips in hard against Khan’s upraised ass. He cries out, squealing almost girlishly as Kara hammers home into his boypussy. The tongue that was slavishly slithering through your sex falls still, stunned by the sudden penetration. Khan’s caged prick erupts in a geyser of white cream, cum spewing out of his otherwise average prick like from a firehose.");

	output("\n\nKara’s eyes go wide at the sight, startled by the deluge she’s caused - and the visible shrinking of Khan’s sack as just the one thrust starts to empty him. It takes a few moments for Kara to recover from her shock and start moving after that. When she does, Khan lurches forward into your crotch, thrust up by the force of Kara’s hips battering his plush behind. He blinks lazily, as if recovering from a trance, and starts to moan like a bitch in heat into your [pc.cunt] as his ass is fucked. Not so high and mighty now, is he?");
	
	output("\n\nYou try and look Khan in the eye, but he’s too far gone. His eyes are crossed, completely vacant of conscious thought, dim with vacant pleasure and longed-for release.");

	output("\n\n");
	if (kara.isNice())
	{
		output("<i>“I almost feel bad,”</i> Kara groans between balls-deep thrusts.");

		output("\n\n<i>“But not </i>too<i> bad,”</i> you tease back, working to sync your movements with hers.");
	}
	else output("<i>“This bitch ain’t bad,”</i> Kara laughs, reaching over to give you a high-five over the bent-over kui-tan. You could swear Khan’s cum-hosing intensifies the moment your fingers touch, and his whole body trembles as his balls slowly deflate.");
	output(" You’re standing in what feels like an inch-thick sea of spooge leaking out of the hardlight chastity belt’s little piss slit, taking him down from beach ball sized nuts towards a pair of cute, fuzzy volleyballs hanging between his legs. If the kui-tan wasn’t speared between two sexes and completely blissed out with anal ecstasy, he might have been able to escape!");

	output("\n\nInstead of making a break for it, of course, Khan moans and his mouth lolls open, tongue caressing your [pc.cunt] with a startling eagerness that would have you praising an expert pussy eater; coming from a scientist surrounding himself with a harem of mind-addled girls, his expertise nearly leaves you stunned. You reward him by thrusting your [pc.hips] faster, grabbing the sides of his head and grinding away against those thick black lips and sultry wet hole of a mouth. Your partner moves to match you, roughly fucking the kui-tan’s hole just as fast as she can move her hips - and Khan’s ass swallows every inch of spiny kitten-dick Kara feeds it. She glides in and out of his plush keister with abandon, her breath now coming ragged and hard as she thrusts.");
	
	output("\n\nKara cums first, announcing herself with a very un-feminine grunt and slamming herself to the hilt in Khan’s well-used asshole. In turn, the kui-tan’s caged cock swells and strains against its glistening confines, doing everything it can to cum under the kaithrit hermaphrodite’s anal ministrations.");
	
	output("\n\n<i>“Oh, no you don’t,”</i> Kara coos, moving her hips now only in short, jerky little bursts that deny the kui-tan his satisfaction. <i>“Just tighten up and milk it aaaaall out.”</i>");
	
	output("\n\nKhan whines and looks up at you, the sentience slowly flushing back into his eyes now that his balls have been sufficiently drained. Taking pity on the poor kui-tan, you let go of your restraints, allowing his sultry little mouth to milk you to completing as well. You don’t have all the time in the world, after all.");
	
	output("\n\nSensing your relaxation, Khan reaches up to stroke your thighs and groin, furred fingers passing over your [pc.clit], trying to finish you as quickly as possible. Even hurried, you can’t deny the skill he possesses. It isn’t long before you’re groaning");
	if (pc.biggestTitSize() >= 2) output(", cupping a breast");
	else output(" stroking his hair");
	output(" and bucking against his short muzzle. With a muted gasp, you let loose, screaming and cumming, bathing his face in [pc.girlCumNoun]. He grunts and winces, but has no choice but to accept it, to swallow every drop your pussy squirts across his lapping tongue.");

	output("\n\nHe sputters and gags as you step back, pulling his face out of your cunt and leaving a trail of spit and fem-spunk drooling from his mouth - a counterpoint to the creampie you soon see trickling down his thighs.");

	output("\n\n");
	if (kara.isNice() || kara.isMischeivious()) output("<i>“We make a good team,”</i> Kara says with a wink, wiping her cock off of the kui-tan’s thigh.");
	else output("<i>“Not bad,”</i> Kara grunts, wiping her cock off on Khan’s furry thigh. <i>“Wouldn’t mind keeping a tight little hole like that around... willingly, of course.”</i>");

	output("\n\nFinished with the kui-tan, Kara gives the defeated, cum-stuffed doctor a little push. He groans and collapses, slipping into a state of sated unconsciousness.");
	
	output("\n\n<i>“That was too good for him,”</i> a few of the gold myr girls mumble, glowering at their erstwhile master. You silently gather your gear and leave Khan to his sleep.");

	processTime(30+rand(5));
	pc.orgasm();

	CombatManager.genericVictory();
}

public function kq2KhanPCDefeat():void
{
	clearOutput();
	showKhan();

	if (pc.lust() >= pc.lustMax()) output("Too turned on to keep fighting, you fall to your [pc.knees] and swoon towards the kui-tan.");
	else output("Shocked too badly to keep fighting, you collapse at the kui-tan’s feet... or you would, if his feet could touch the ground around his enormous nads.");

	output("\n\n<i>“Girls, help our friends here into their collars,”</i> Khan says, setting his lightning gun aside and reclining back on his huge testicles. He picks up a pair of metal collars from the table beside him and hands them off to two of the gold myr girls, each wearing an identical collar of their own. You try to block them, but in your state, it doesn’t take much for even a pair of naked lab-rats to pin you down, pulling away your [pc.gear]");
	if (!(pc.rangedWeapon is EmptySlot) || !(pc.weapon is EmptySlot)) output(" and weapons");
	output(" and sliding the slim metal ring around your neck.");
	
	output("\n\n<i>“No... get away...”</i> Kara moans as one of the girls rolls her onto her face, just beside you. Before they collar her, the girls spend a few moments undressing the kaithrit, pulling off her skin-tight top and the skimpy skirt she’s wearing, even pulling her up to her knees so they can yank her underwear off. You watch as her E-cups bounce free, immediately in the grasp of another gold myr, who squeezes and kneads the perfect, soft orbs.");
	
	output("\n\nThe other myr makes a cooing sound as she pulls Kara’s boyshorts down her long legs, licking her lips as she says, <i>“Master! This one has a cock! May we... play with it?”</i>");
	
	output("\n\nKhan snorts, <i>“Stop fooling around and collar her, damn it.”</i> His slaves pout but do as commanded, slipping the collar around Kara’s neck and letting her fall to the ground beside you, returning to their master’s side. Weakly, Kara reaches over and grabs your hand, moaning as one of the most adventurous myr girls gives her feline prick a quick, inquisitive stroke as she leaves.");
	
	output("\n\nProperly surrounded by his harem, Doctor Khan picks up a small remote from the top of a desk, not much different than what you’d control a holoscreen with. He presses a button, and you find yourself blinking rapidly, a haze washing over your thoughts. You try to focus, but... something thick and heavy seems to wrap itself around your mind.");
	
	output("\n\n<i>“Don’t try and think too hard, my new friends,”</i> Master says, leaning back against the wall and crossing his arms. <i>“Or think </i>very<i> hard about what you want now. And what’s that?”</i>");

	output("\n\nKara answers, a low murmur of <i>“To... to fuck...”</i>");

	output("\n\nYou give the kaithrit a look, and find your eyes drawn immediately to the shaft of her bare, pink feline cock. It’s hard as a rock, squeezed between her thigh and the floor with its crown pointing straight at you. What the...");
	
	output("\n\nThe kui-tan grins down at her. <i>“It feels better to be honest with yourself, hmm? You didn’t want to be a... whatever you were. Commando? Saboteur? Doesn’t matter anymore.”</i>");
	
	output("\n\n<i>“No,”</i> Kara moans, rising to her knees when Khan crooks a finger at her. Her hand drifts down to her cock, fingers wrapping around the nodule-covered crown.");

	output("\n\n<i>“Well, I think her collar works well enough. Don’t you think, girls?”</i> Khan laughs. His harem nod emphatically, congratulating their master on his newest acquisition - and begging him not to forget them while he’s playing with his new toy. After a moment of basking in the praise, though, Khan turns to you and presses another button on the remote. <i>“And what about you, hmm? What did you come here to do, "+ pc.mf("boy", "girl") +"?”</i>");
	
	output("\n\nYou try and think up the answer... what <i>did</i> you come here for? You vaguely remember a ship... you remember you like Kara, that you came here with her... came here with her to please your Master? Yes, that’s right... isn’t it? You eagerly tell that to him, hoping you haven’t kept him waiting while your silly brain tried to think.");
	
	output("\n\n<i>“Good,”</i> Master says contentedly. <i>“That’s exactly what I wanted to hear. Now, if you really want to please me... it seems your friend there is quite desperate for some relief. Why don’t you start with her. Use your mouth, if you please. I want to see just how talented that [pc.tongue] hanging out of your mouth is.");
	
	output("\n\nYou hadn’t even noticed your mouth was hanging open, all but drooling at the sight of your master’s lush, soft, fuzzy seat... so warm and comfortable looking. You want to squeeze and hug it more than anything else. Anything except to please their owner, anyway.");
	
	output("\n\nAt your master’s command, you crawl over to Kara, wrapping your hands around her firm thighs. You’d never realized how wonderful she smelled, a wonderfully heady must wafting straight into your nostrils as you bury yourself between her legs. She moans, shivering as your [pc.tongue] licks at the nubby crown of her feline prick. The taste sets your mind on fire, a rush of heat and desire flooding through you at the first touch of her cockhead on your lips.");
	
	output("\n\n<i>“Eager, too,”</i> Master beams. <i>“What do you think of [pc.himher] so far, dear?”</i>");

	output("\n\n<i>“So... so good,”</i> Kara moans, planting a hand atop your [pc.hair] and urging you on. You couldn’t resist her if you wanted - and God knows, you don’t want to. You eagerly swallow almost a foot of kittydick, going from the tip to kissing the base in the blink of an eye. Your companion purrs, her tails curling around to caress you as you fellate her. Your hands gravitate to her balls - though nowhere near as magnificent as your master’s, they’re still a nice, hefty handful. Compelled to show Master what you can do to a pair of nuts, you gently massage them, rolling her nads between your fingers. You can almost feel them churning, so full that you don’t think you’ll need to do much more than caress them to milk out all her sweet, salty seed. You give her the slightest squeeze and let your mouth finish her, bobbing on her cock until Kara makes a sweet little squeal and unleashes a torrent of seed into your mouth. You choke it down with ease, swallowing every drop the kaithrit girl can give you - you have to show the master that you can handle him, after all! You can only imagine how much cum he’ll grace you with when you finally prove your worth.");

	output("\n\nKara whimpers and falls onto her back, her balls drained. You lick up the last trickles from your chin and turn to your master, eyes imploring.");
	
	output("\n\n<i>“Good job, pet,”</i> he says, giving you a smile that makes your heart soar as he pushes another button on his remote. <i>“Your friend seems quite satisfied with your work.”</i>");
	
	output("\n\nKara moans, rolling onto her belly and nuzzling her cheek against your [pc.leg]. <i>“Yes, master. Very.”</i>");
	
	output("\n\n<i>“Do you think [pc.heShe] deserves to join my darling girls here?”</i> he asks her, patting the heads of a pair of golden girls beside him. They mewl happily, leaning in against their master, caressing his sack. A couple of them move, shifting to make a spot for you among them - for you, and Kara. Your companion nods emphatically, and after a moment’s consideration, Master motions you over to him.");
	
	output("\n\nYou swell with pride as you are invited to sit at your master’s feet, and quickly find yourself snuggled up to the warm, soft swell of his mighty balls, your arms wrapped around your own personal expanse of kui-tan nuts. Master groans as you settle against him, a thick squirt of spunk drooling from his member to rain down upon your and your fellow harem sluts. You reach up and lick it up eagerly, competing with the other girls to get at the wonderfully rich, salty treat. Every drop you can get, you swallow greedily; the taste is utterly divine, better than the best candy you’ve ever tasted.");
	
	output("\n\nA small, soft hand plays across the top of your head. You look up, still licking, to see Master looking down upon you with a smile. <i>“Good... I think my keepers will be very pleased to see you. Like this, of course. You’ll be here forever, of course, won’t you? No, I’ll not let a catch like you and your friend out of my grip, damn the pirates. You’re mine now, understand?”</i>");
	
	output("\n\nYou do. You understand, and thank Master for not letting anybody take you away from him. Not ever...");

	badEnd();
}

public function KQ2ShowShade():void
{
	if (flags["KQ2_KARA_WITH_PC"] == 1) showBust("KARA", "SHADE");
	else showBust("SHADE");

	author("Savin");

	showName("\nSHADE");
}

public function kq2EncounterShade():void
{
	clearOutput();

	flags["KQ2_SHADE_ENCOUNTERED"] = 1;

	// Encounter Text (PC hasn't fucked Shade)
	if (9999 == 0)
	{
		output("As you and Kara rush toward the helipad, you hear a deep, metallic howl echo across the helipad. Kara draws her pistol and skids to a stop near the foot of the stairs leading up to the helipad. A huge, black drone stands at the top of the steps, canid in shape with razor-sharp teeth bared. Another drone peeks over the ledge beside it, and a third howls behind you, leaping up onto the top of the elevator cabin.");
		if (9999 == 0) output(" They’re like Tam-wolf’s big brothers!");
		
		output("\n\n<i>“That was a lucky break back at the bar,”</i> a familiar voice says, stepping up behind one of the wolf droids. Shade, the bounty hunter from the myrellion bar, steps into view, a lightning pistol resting on her shoulder. <i>“I guess you have your friend here to thank for that, don’t you, Kara? I think we both know things would have gone differently without "+ pc.mf("him", "her") +".”</i>");
		
		output("\n\nKara scowls, leveling her plasma caster at the other kaithrit. <i>“God </i>damn<i>, don’t you ever give up!?”</i>");
		
		output("\n\n<i>“Wouldn’t be much of a bounty hunter if I did,”</i> Shade laughs, whistling to her assault drones. They advance, lowering their heads and growling metallically. <i>“Now, why don’t you and your friend come quietly, hmm?");
		//{if didn’t fight Shade: 
		output(" And </i>you<i>, [pc.name]... that was a dirty trick you pulled. Damned scummy... maybe I’ll beat some better manners into you.");
		output("”</i>");
		
		output("\n\nNot likely!");

		var tShade:Shade = new Shade();

		CombatManager.newGroundCombat();
		CombatManager.setFriendlyCharacters([pc, kara]);
		CombatManager.setHostileCharacters([tShade, new KQ2FenrisDrone(), new KQ2FenrisDrone(), new KQ2FenrisDrone()]);
		CombatManager.victoryCondition(CombatManager.SPECIFIC_TARGET_DEFEATED, tShade);
		CombatManager.victoryScene(kq2ShadePCVictory);
		CombatManager.lossScene(kq2CapturedByPiratesBadEnd);
		CombatManager.displayLocation("SHADE");

		clearMenu();
		addButton(0, "Fight!", CombatManager.beginCombat);
		return;
	}
	// Encounter Text: Fucked Shade
	else if (9999 == 1)
	{
		output("As you and Kara rush toward the helipad");
		if (9999 == 0)
		{
			output(", followed quickly by");
			if (9999 == 0) output(" your new harem of red myr");
			else output(" the group of freed red myr");
		}
		output(", you hear a deep, metallic howl echo across the helipad. Kara draws her pistol and skids to a stop near the foot of the stairs leading up to the helipad. A huge, black drone stands at the top of the steps, canid in shape with razor-sharp teeth bared. Another drone peeks over the ledge beside it, and a third howls behind you, leaping up onto the top of the elevator cabin.");
		if (9999 == 0) output(" They’re like Tam-wolf’s big brothers!");
		
		output("\n\nA woman steps up behind the drone atop the stairs, scratching it between the ears. She’s carrying a big, bulky hand-cannon resting on her shoulder, her other hand firmly planted on her hip.");
		
		output("\n\nIt’s Shade.");
		
		output("\n\n<i>Shit.</i>");
		
		output("\n\nThe buxom kaithrit looks down at your and your companion with a mix of contempt and disappointment written across her face. Her eyes settle on you. <i>“Well, this is the last place I ever hoped to run into you, kid,”</i> she says, slowly lowering her lightning gun. <i>“Last person with you, too.”</i>");
		
		output("\n\n<i>“");
		if (kara.isMischeivious()) output("I see you brought friends this time... might actually be a fair fight now!");
		else
		{
			output(" If you want a fight, Shade, come on. We’ll send you packing");
			if (9999 == 0) output(" again");
			output(" if we have to.");
		}
		output("”</i>");
		
		output("\n\nShade laughs, humorless, and holsters her gun. <i>“Relax, furball. I see you’ve got... precious cargo with you.”</i> With a sigh, Shade steps out of the way, whistling back her hounds. They whimper and retreat, slowly, never taking their eyes off you. <i>“Go on. Get.”</i>");
		
		output("\n\n<i>“W-what?”</i> Kara says, lowering her own weapon slightly.");
		
		output("\n\nThe huntress chuckles, waving towards the helipad. <i>“Don’t make me regret this... not that you’re likely to get through Amara anyway. Just thank [pc.name] if you do.”</i>");
		
		output("\n\nUncertainly, Kara moves past the other kaithrit, sprinting off towards the helipad. You follow suit, but Shade stops you at the top of the stairs, planting a firm hand on your chest.");
		
		output("\n\n<i>“I don’t like being played, kid,”</i> she whispers. <i>“Even if it was a damn </i>good<i> play. Assuming Amara doesn’t string you and your friend up, I’m gonna have words for you next time we talk.”</i>");
		
		output("\n\nYou nod your understand, and try to move by. She holds you in place for another moment, though: just long enough to plant a small kiss on your cheek. <i>“For luck. You’ll need it.”</i>");
		
		//Restore some PC Health, Energy. Increase +5 Lust.
		pc.HP(pc.HPMax() * 0.15);
		pc.energy(pc.energyMax() * 0.15);
		pc.lust(5);
		
		output("\n\nShade gives you a slight nod and takes her hand back, letting you pass her by. You rush to rejoin Kara at the helipad...");

		// [Next]
		clearMenu();
		addButton(0, "Next", mainGameMenu);
		return;
	}
}

public function kq2ShadePCVictory():void
{
	if (kara.isAss()) kq2ShadePCVictoryKaraHard();
	else kq2ShadePCVictoryKaraNotHard();
}

public function kq2ShadePCVictoryKaraHard():void
{
	clearOutput();
	showKQ2Shade();

	output("With a grunt, Shade slumps down against the wall, clutching her wounds. Her gun clatters to the ground out of reach");

	var hostiles:Array = CombatManager.getHostileCharacters();
	var numDronesAlive:int = 0;

	for (var i:int = 0; i < hostiles.length; i++)
	{
		if (hostiles is KQ2FenrisDrone && !hostiles[i].isDefeated()) numDronesAlive++;
	}

	if (numDronesAlive > 0)
	{
		output(", and the wolf drone");
		if (numDronesAlive > 1) output("s cease their attack, freezing in place as their master ceases to direct them.");
		else output(" ceases its attack, freezing in place as its master ceases to direct it.")
	}
	
	output("\n\n<i>“This bitch is going to hunt me to the end of the galaxy,”</i> Kara snarls. <i>“Not anymore.”</i>");
	
	output("\n\nBefore you can blink, her gun discharges in a blast of green plasma. A concussive echo thunders across the roof, and you avert your eyes from a burning mess of flesh smeared across the stairs.");
	
	output("\n\nHoly shit.");
	
	output("\n\nKara lets out a short sigh and racks the charger on her pistol. <i>“What’re you waiting for? Let’s go!”</i>");

	flags["KQ2_SHADE_DEAD"] = 1;

	// [Next]
	CombatManager.genericVictory();
}

public function kq2ShadePCVictoryKaraNotHard():void
{
	clearOutput();
	showKQ2Shade();

	output("With a grunt, Shade slumps down against the wall, clutching her wounds. Her gun clatters to the ground out of reach{, and the wolf drones cease their attack, freezing in place as their master ceases to direct them}.");
	
	output("\n\n<i>“Ah, fuck,”</i> Shade groans, sitting back against the wall. <i>“I’m getting too old for this shit.”</i>");
	
	output("\n\n<i>“Stay down,”</i> Kara warns, racking the charger on her pistol. The huntress doesn’t challenge her threat, and Kara turns to you. <i>“C’mon, [pc.name], let’s go! We’re almost home free!”</i>");

	CombatManager.genericVictory();
}

public function kq2CapturedByPiratesBadEnd():void
{
	clearOutput();
	author("Savin");

	//PC is brought before Amara Faell. She sends Kara off to be punished by Bragga, but decides to keep you for herself. PC gets one of Khan's collars put on, at the lowest setting -- get to keep your brain, but with heightened libido and no ability to resist commands. 
	//Play whenever the PC is knocked down by a non-Dr. Khan enemy.

	output("You stumble to the ground, too "+ (pc.HP() <= 0 ? "battered" : "aroused") +" to fight on. Your vision swims as your enemy advances, victorious. You can’t summon up the will to resist anymore, even as a solid weight slams into your face. The world goes black as your head snaps back, and you lose yourself to the darkness...");
	
	clearMenu();
	addButton(0, "Next", kq2CapturedByPiratesBadEndII);
}

public function kq2CapturedByPiratesBadEndII():void
{
	clearOutput();
	showBust("KARA", "AMARA");

	output("You awake to wind whipping against your [pc.face], and the roar of some mighty beast blasting into your ear. Your eyes blink open slowly, your vision blurred and reeling. Eveything’s fuzzy, but you immediately realize that you’re outside, high above the pirate compound. A glance tells you you’re on the roof, resting on your [pc.knees] next to a helipad. Your hands are tied behind your back, secured by a pair of nova-hot gravcuffs burning your [pc.skinFurScales]. Glancing to your side, you see the familiar ears and messy cobalt hair of your kaithrit companion, her head bowed low.");
	
	output("\n\nYou look up, and see the source of the deafening roar: a gunship sitting a few yards away, its engines blasting up a storm of sand and burning wind. The ship’s side doors stand open, giving you a look at several black-and-red clad men in armor, each with a machine pistol or shotgun at their sides. Between you and them, though, stands");
	if (CombatManager.hasEnemyOfClass(Amara)) output(" the pirate lord who brought you down");
	else output(" an ausar woman in black power armor, a head of bright orange hair whipping around her. A pirate lord of some kind, you imagine: this base’s commander");
	output(". She glowers at you and your companion with bright green eyes, a pair of blue-painted lips twisting into a scowl.");
	
	output("\n\nThe armored woman reaches down, grabbing Kara’s chin in her gauntleted fingers and forcing the defeated cat-girl to look up at her. Your companion moans, blinking through a black eye and a bloodied nose - looks like she’s suffered a much more thorough beating than you already.");
	
	output("\n\n<i>“I don’t know what’s worse:”</i> the pirate lord growls, <i>“That you were stupid enough to come knocking on my door... or that you were stupid enough to pick the wrong group of pirates.");
	if (flags["KQ2_NUKE_STARTED"] != undefined) output(" And don’t worry about the self destruct. It’s been deactivated.");
	output(" Either way, Lord Bragga has a bounty the size of a small moon out on your head.");
	if (flags["KQ2_SHADE_DEAD"] == undefined)
	{
		output(" And I intend to collect.”</i>");
	
		output("\n\nThe pirate motions for the foot soldiers standing behind her, and they come over and grab Kara. She struggles, weakly, but bound and wounded as she is, can offer no real resistance to the men. They drag her off, onto the gunship, and latch her cuffs onto a hook above her head. And then their leader turns to you.");
	}
	else
	{
		output(" Unfortunately for her, you killed my best friend. I think that gives my vengeance a little more priority than her stupid fucking ship, don’t you think?”</i>");

		output("\n\n<i>“Fuck you,”</i> Kara says, and spits in her face.");

		output("\n\n<i>“Yeah. You too, kitten,”</i> the pirate says, standing up and drawing a gun from her armor’s hip - Kara’s plasma pistol. You flinch away and close your eyes and a burst of heat rushes past you with a thunderous <b>CRACK</b>. You hear something heavy collapse beside you, reeking of charred meat.");
	}

	output("\n\n<i>“As for you,”</i> the pirate woman says, grabbing your chin and forcing you to look her in the eye. She might actually be quite beautiful, you suddenly realize, were she not sheened in sweat and clad in ape-like armor. As it is, she looks like a hulking amazon, and terrifyingly angry. With your life on the line, you");
	if (pc.isAss()) output(" look defiantly into her eyes. <i>“");
	else output(" meekly meet her gaze. <i>“");
	if (!CombatManager.hasEnemyOfClass(Amara)) output("You’re not on her crew - I read their dossier. Some merc, then? ");
	output("I almost feel bad for you, getting duped into that whore’s suicide mission. Still, can’t have you wandering off, telling everyone what happened here. Or worse, trying to avenge your friend.”</i>");

	output("\n\nShe releases your hand with contemptuous force, making you sway precariously as she turns away from you. <i>“Gunship, head on home. I’ve got to secure things here.”</i>");
	
	output("\n\nYou look up in time to see the armored goons hopping into the ship’s bay around Kara and sliding the doors closed. That’s the last you’ll see of her, you know, your heart sinking. The gunship’s engines roar, and the black ships shudders into the sky, angling its bow to the heavens and blasting off. The pirate lord sighs and turns back to you, tucking her crash helmet under her arm. She tosses Kara’s pistol away, letting it clatter off the side of the roof and out of sight.");
	
	output("\n\n<i>“So. There’s no bounty on you. And I’ll be honest: I’m impressed you got as far as you did. Not impressed enough to let you go, though. It’s too late for that.”</i> She takes a knee in front of you, looking you over with an appraising eye. You hazard a look up, into her green eyes, watching as she runs a black-armored thumb across her blue lips, thinking. After a long, tense moment, she taps an earpiece hidden in one of her jackal-like ears and says, <i>“X.O., go down and secure Khan. Get one of his collars up here for me.”</i>");

	output("\n\n");
	if (flags["KQ2_DEFEATED_KHAN"] != undefined) output("On no.... ");
	output("You gulp with dread as the pirate smiles at you, releasing her comms. <i>“I’ll make you a deal, "+ pc.mf("handsome", "beautiful") +". I’m going to put a collar on you. A special collar. That means you belong to me, now. Understand?”</i>");

	output("\n\nYou nod, slowly, dread forming a knot in your stomach. What’s about to happen to you?");

	output("\n\n<i>“Be a good");
	if (pc.race().indexOf("ausar") != -1) output(" puppy");
	else output(pc.mf(" boy", " girl"));
	output(", and you won’t even notice it’s there. Unless I decide to play with it, that is. See, you’ve got some fire in you. That meek, beaten act doesn’t suit you... and it doesn’t fool me. You’ve seen some action and adventure, haven’t you?”</i>");

	output("\n\nYou nod again.");

	output("\n\n<i>“Good. I like that in my slaves. And make no mistake: that’s what you are now. Whether you submit and obey me, or decide you want me to </i>make<i> you obey... that’s up to you. Well, you and the collar.”</i>");
	
	output("\n\nAs if on cue, an elevator dings behind you, and another armored pirate appears beside you, holding out a simple metal collar to the red-maned ausar. She nods to you, and a moment later, you feel the cold, unforgiving kiss of cold steel closing around your neck. Rough, armored hands grab at your [pc.hair], pushing your head down as the pirate affixes the collar to you. You gasp for breath, clawing at the sudden tightness around your neck - it’s not hard to breathe, really, but it digs hard into you nonetheless.");
	
	output("\n\n<i>“Looks good on you,”</i> your new owner smirks, giving her subordinate a rough clap on the shoulder to send him on his way. She reaches down after that, grabbing the back on your collar and flicking a button. The moment she does, you feel a thrum of energy pass through your neck, and something warm press against your spine.");
	
	output("\n\n<i>“This is the lowest setting,”</i> she explains, drawing her hand up from the collar and across your [pc.hair], gently pushing your head down. As she does, you feel a shudder pass through you, followed by a spreading heat from your back, slowly crawling through your body. <i>“Doctor Khan’s work is truly remarkable, in its perverse way. Stand up.”</i>");

	output("\n\nBefore you can even think, you’re leaping to your [pc.feet]");
	if (pc.tailCount > 0) output(" with your tail wagging");
	output(". The heat that’s spreading through you only intensifies, and you suddenly feel a rush of it surging through your [pc.crotch]. You groan, biting your lip as the unexpected sensation washes over you. What the...");
	
	output("\n\n<i>“Strip,”</i> she commands. You do so, slowly pulling your gear off. The wind whips hotly around you, scouring your [pc.skinFurScales]. It takes a moment for you to realize what you’ve done - that you offered no resistance, no hesitation.");
	
	output("\n\nThe pirate woman smiles. Her eyes slink across your bare body, across skin and "+ pc.rawmf("rigid lines", "soft curves") +", down to your [pc.butt] and your crotch. You’re");
	if (pc.hasCock()) output(" half-hard already, the heat pulsating through your member in rhythmic waves of pleasure.");
	else if (pc.hasVagina()) output(" drooling already, staining your thighs with feminine excitement. The heat radiating through your body seems to center on your quim, burning your body.");
	else output(" The heat in your body seems to coalesce in your bare groin, forming an intense ball of pointless pleasure.");
	output(" You feel amazing, like any touch would send you over the edge. And the pirate knows it.");

	output("\n\n<i>“Touch yourself,”</i> she commands, smiling as you immediately obey, running a hand down your groin");
	if (pc.hasCock()) output(" and caressing your [pc.cock]");
	output(". <i>“Good "+ pc.mf("boy", "girl") +". Looks like the collar’s working. Now let me tell you how this is going to work: on the lowest setting - the one I think you need - the collar makes you obedient. Easy to influence, eager to please. Khan says the marked rise in libido is a... how did he phrase it... a ‘happy accident,’ that keeps captives nice and mollified. I think he did it on purpose. It certainly made sure he had a nice little harem of test subjects all too eager to worship his fat, disgusting sack.”</i>");

	output("\n\nShe manages a slight grin, still watching you mindlessly masturbate. The thought of stopping never crosses your mind. <i>“Don’t worry, I won’t make you worship mine,”</i> she murmurs, running a finger along your chin. <i>“Now, let’s you inside and cleaned up. You’ve got a lot of adjustment to do.");

	output("\n\n<i>“And don’t even think about stopping. Not that you could, anyway,”</i> your new owner smirks, hooking a finger through a loop on your collar and dragging you into the base.");

	badEnd();
}

public function kq2JuggernautPCVictory():void
{
	clearOutput();
	showBust("KARA", "JUGGERNAUT");
	author("Savin");
	showName("VICTORY:\nJUGGERNAUT");

	output("With a grunt, the juggernaut collapses to his knees. He makes a ragged cough, amplified like a scream by his armor... and falls to his face, unmoving.");
	
	output("\n\n<i>“Wasn’t expecting... that,”</i> Kara groans, popping the spent energy cell out of her pistol. She reaches down and picks up the pirate’s gun, looking it over before offering it to you. <i>“Here. You might get some use out of this.”</i>");

	flags["KQ2_DEFEATED_JUGGERNAUT"] = 1;

	clearMenu();
	addButton(0, "Take It", kq2JuggernautPCVictoryII, true);
	addButton(1, "Refuse", kq2JuggernautPCVictoryII, false);
}

public function kq2JuggernautPCVictoryII(takeWeapon:Boolean):void
{
	clearOutput();
	showBust("KARA", "JUGGERNAUT");
	author("Savin");
	showName("VICTORY:\nJUGGERNAUT");

	output("You");
	if (takeWeapon)
	{
		var tEnemy:Creature = CombatManager.getHostileCharacters()[0];
		tEnemy.inventory.push(new AegisLightMG());

		output(" stow the weapon");
	}
	else output(" drop the unwanted weapon");
	output(" and follow Kara into the elevator car. She punches the <i>“close”</i> button, though the doors end up just bouncing off the juggernaut’s chest, squeezing him between them. With a sigh, Kara drags his body out of the way, and the doors close.");
	
	output("\n\n<i>“Alright. Up to the roof we go, [pc.name].”</i>");

	CombatManager.genericVictory();
}