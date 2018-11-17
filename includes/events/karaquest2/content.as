import classes.Items.Accessories.TamWolf;
import classes.Items.Guns.KhansArcCaster;
/* FLAGDOC

KQ2_QUEST_OFFER 		-- GameTimestamp that the quest was offered at
KQ2_QUEST_DETAILED		-- GameTimestamp that the player went to meet Kara
KQ2_QUEST_BEGIN			-- Players decision about starting the quest
						-- 0/undefined, no decision
						-- 1 player accepted
						-- 2 player rejected
KQ2_QUEST_FINISHED		-- 0/undefined, nope
						-- 1, finished, left, gone, woop
						-- 2, finished but some bad shit happened (kara died, etc)
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
KQ2_WATSON_MET
KQ2_DEFEATED_ENGINEER	-- 0/undefined, unencountered
						-- 1, defeated in combat, knocked out
						-- 2, room locked, rip
KQ2_DEFEATED_JUGGERNAUT
KQ2_DEFEATED_KHAN
KQ2_KHANS_FILES			-- 0/undefined, nothing
						-- 1 Karas swiped Khans files
KQ2_NUKE_STARTED		-- undefined, nuke not active
						-- otherwise, timestamp that the player activated the nuke at
KQ2_NUKE_EXPLODED		-- 0/undefined, nope
						-- 1, nuke is dooooone

KQ2_SHADE_DEAD			-- 0/undefined, alive
						-- 1 Kara killed her
KQ2_FOUGHT_AMARA		-- 0/undefined, nope

KQ2_BETRAYED_KARA		-- 0/undefined, nothing
						-- 1, accepted credits from amara to dump kara

KQ2_MYRELLION_STATE		-- 0/undefined, normal
						-- 1, player nuked shit and lost access to myrellion
						-- 2, player married/subjugated taivra and has access to the taxi point in the deep caves, but can't get to the upper caves

KQ2_DANE_COORDS_TIMER	-- 0/undefined, unset
						-- <value> timestamp 48 hours prior to dane sending a mail with coords for the next planet

SAVE IMPORT FLAGS
SILENCE_RESCUED_CONNIE	-- 0/undefined, no
						-- 1, Kara rescued Connie
*/

public function completedKQ2Good():Boolean
{
	return (flags["KQ2_QUEST_FINISHED"] == 1);
}

public function tryProcKQuest2Entry():Boolean
{
	// On enter/leave ship on Myrellion
	// Taivra defeated (or level-appropriate)
	// Kara aided in KQuest1
	
	var beatTaivra:Boolean = flags["BEAT_TAIVRA_TIMESTAMP"] != undefined || flags["KING_NYREA"] != undefined;
	var isLevel:Boolean = pc.level >= 8;
	
	// I THINK this is the simplest check for "Kara & Shade was resolved, with the PC siding with Kara."
	var aidedKara:Boolean = flags["KARA_PAID_YOU"] != undefined; 
	
	var kq2NotOffered:Boolean = flags["KQ2_QUEST_OFFER"] == undefined;

	if (kq2NotOffered && aidedKara && (beatTaivra || isLevel))
	{
		kq2Offer();
		return true;
	}
	return false;
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
}

public function kq2TravelToKara(shortTravel:Boolean):void
{
	showKara();
	//Walks through import process from Silence. Option to back out if not import.

	flags["KQ2_QUEST_DETAILED"] = GetGameTimestamp();

	pc.credits += 10000;

	output("You punch in the coordinates Kara gave you and engage the autopilot, letting the computer start your journey.");

	output("\n\nOne");
	if (!shortTravel) output(" lengthy journey through space and the Warp Gate network");
	else output(" quick trip through the atmosphere later");
	output(" and you’re zooming through the blackness of space, hurtling towards Myrellion’s further moon. The journey toward the icy blue moon isn’t particularly long, by galactic standards, but the coordinates Kara gave you lead into the rocky belt encircling it. You instinctively boost your shielding, gazing out your ship’s viewports as tumbling hunks of house-sized rock and ice smash against each other. Your shields rumble and flicker as shards of debris hit you, just enough to give you a light show - no threat, so long as you keep dodging the big rocks.");

	output("\n\nThe coordinates are just ahead, drawing you to one of the largest hunks of rock in the belt, nearly twice the size of a hydroball field. A scan of it comes back as a big empty: no signals on it, or for miles around. You furrow your brow, wondering why Kara’s brought you all the way out here... until the rock tumbles around, revealing a huge, hollow crack in its side, permitting entry for a ship about your size. Could be interfering with your scans, and this <i>is</i> where Kara said to meet.");

	output("\n\nYou take a steadying breath and ease your ship into the crack in the rock. You’re quickly bathed in darkness, no light from the sun or moon to guide you past the craggy cave mouth. A moment of doubt passes, before being blasted away by blinding light shining from inside the cavern. Your ship’s shielding keeps the worst of it at bay, just making you squint as the view outside consolidates into several large floodlights mounted on the walls, hanging over some kind of catwalk.");

	output("\n\nAnother ship is parked ahead, a sleek, blue-and-white freighter");
	if (PCShipModel() != "Z14") output(" not much bigger than your old Z14");
	else output(" not much bigger than your own ship");
	output(". Your comms bleep with an incoming message.");

	output("\n\nYou accept it, and are greeted by Kara’s face, standing on what must be the bridge of the other ship, surrounded by blinking consoles and computer terminals - none of them manned. <i>“Captain! I was starting");
	if (kara.isNice()) output(" to worry something had happened to you.");
	else if (kara.isMischievous()) output(" to worry you got lost!");
	else output(" to think you weren’t coming.");
	output(" Good to see you again,”</i> she says, affecting a faint smile. <i>“In person, preferably. I’m extending a docking tether now... mind if I come over?”</i>");

	output("\n\n<i>“");
	if (pc.isNice()) output("By all means,");
	else if (pc.isMischievous() && kara.isMischievous()) output("Sure. If you think you can manage to not get lost on the way.");
	else if (pc.isMischievous()) output("Looks like you’re already inviting yourself over,");
	else output("I guess,");
	output("”</i> you say, as the docking clamps lock your ships together, ever so slightly rattling your outer hull.");

	output("\n\n<i>“Great. See you in a moment,”</i> she winks, flicking off the video.");

	output("\n\nYou make your way down to the airlock, just as it’s cycling through on the other side. You pop your lock and let it slide aside, revealing the familiar shape of the catgirl on the other side. Kara’s shed her cloak and hood since your first meeting, giving you a look at the woman underneath for the first time: she’s rocking a skin-tight black synth-leather suit, showing off womanly hips and a generous bust, accentuated by a shoulder holster loaded down with energy cells and a plasma pistol. A chrome-plated briefcase rests in one of her hands, gloved fingers wrapped tight around the handle. Knee-high leather boots finish off the ensemble, drawing your eyes up her long, toned legs and up to... to a faintly noticeable bulge in the front of the cat-girl’s pants, showing off a tight knot of more masculine flesh. Looks like this kitty’s packing a little something extra...");

	if (kara.isNice())
	{
		output("\n\n<i>“Hey there, [pc.name],”</i> she smiles, reaching in and giving you a brisk hug.");
	}
	else if (kara.isMischievous())
	{
		output("\n\n<i>“Heyya, "+ pc.mf("handsome", "beautiful") +"”</i> Kara grins, giving you a rough clap on the shoulder.");
	} 
	else
	{
		output("\n\n<i>“Steele,”</i> Kara says, giving you a firm but respectful nod.");
	}
	output(" <i>“It’s good to see you again. Like I said over the comms, I’ve got another job for you - if you’re interested. And I still owe you for");
	if (flags["SHADE_DEFEATED_WITH_KARA"] != undefined) output(" helping me kick that bounty hunter bitch’s ass");
	else output(" pulling my ass out of the fire back on Myrellion");
	output(".”</i>");

	output("\n\nShe flips a credit chit out of her shoulder rig and");
	if (kara.isMischievous()) output(" tosses it to you");
	else output(" hands it to you");
	output(", waiting with a smile as you swipe it through your Codex. A moment later, the device beeps an alert that <b>ten thousand credits</b> have been transferred to your account. You blink away your surprise and tuck your Codex away with a grateful nod towards the kaithrit.");
	if (kara.isMischievous()) output(" She gives you a playful wink and says,");
	output(" <i>“Like I said, I owed you. Think that makes us even, hmm?”</i>");

	output("\n\n");
	if (pc.isAss()) output("<i>“That’s a start, I guess,”</i> you smirk. ");
	output("<i>“So, you had a job you wanted to discuss?”</i>");

	output("\n\n<i>“That I do.");
	if (kara.isMischievous()) output(" Permission to come aboard, captain?");
	else output(" Mind if we sit down somewhere?");
	output("”</i>");

	output("\n\n");
	if (pc.isMischievous() && kara.isMischievous()) output("<i>“Permission granted!”</i> you grin, giving Kara an exaggerated wink.");
	else output("<i>“Sure, come on in,”</i> you say, waving her aboard.");
	output(" You turn and lead her out of the airlock and into the ship’s common area.");

	output("\n\n<i>“Nice ship,”</i> she murmurs, a gloved hand running along the bulkhead as she enters, looking cautiously around. <i>“Haven’t been aboard " + indefiniteArticle(PCShipModel()) + " in a while.”</i>");

	//if PC has Anno aboard:
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
		else if (pc.isMischievous()) output(" a playful");
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
	if (flags["SHADE_DEFEATED_WITH_KARA"] != undefined) output(" you’ve proven you can handle yourself");
	else output(" I think you can handle yourself");
	output(". Plus I can’t fly the </i>Ghost<i> solo into a fight, if it comes to that. Hopefully it won’t, but...”</i>");

	output("\n\n<i>“Alright");
	if (pc.isMischievous()) output(", I’ll bite");
	output(", what’s the job?”</i>");

	output("\n\nKara nods, a glint in her eerie eyes. <i>“Now we’re talking. A very powerful... friend... of mine tells me that there’s a pirate base being set up down on Myrellion.");
	if (kara.isNice()) output(" I’ll be honest with you: they’re Black Void. Biggest and most powerful pirate syndicate in the galaxy.");
	else if (kara.isMischievous()) output(" You’ve heard of the Black Void, right? They’re no joke, but I’m going after them. Hard and fast.");
	else output(" They’re tough bastards. Black Void. But nothing we can’t handle.");
	output("”</i>")

	output("\n\nThe Black Void. She’s not joking: they’re the most dangerous pirates around - you couldn’t go a day in flight school without somebody sharing a horror story about Void raiders slaughtering a crew to the last man, or dragging them off to the slave pits of Raxxia. Most folk would do just about anything to stay out of their crosshairs... and Kara wants to kick a hornets’ nest. Maybe you should get a little more information.");

	output("\n\nKara kicks back on one of your seats, setting down the chromed briefcase she’s carrying between her legs, waiting for your response.");
	
	processTime(15);

	kq2InitTalkMenu();
	
	// ^This doesn't work as expected because I hooked it into the _actual_ fly menu
}

public function kq2InitTalkMenu():void
{
	clearMenu();
	if (flags["KQ2_BV_TALK"] == undefined) addButton(0, "Black Void", kq2KaraTalkBlackVoid, undefined, "Black Void", "Ask what Kara knows about the Black Void, and why she’s going after them.");
	else addDisabledButton(0, "Black Void");

	if (flags["KQ2_BV_TALK"] != undefined && flags["KQ2_F_TALK"] == undefined) addButton(1, "Friend", kq2KaraTalkFriend, undefined, "“Friend”", "Who is this friend of yours, Kara?");
	else if (flags["KQ2_BV_TALK"] != undefined && flags["KQ2_F_TALK"] != undefined)
	{
		if (flags["KQ2_F_TALK"] != 2) addButton(1, "Push", kq2KaraPushFriend, undefined, "Push “Friend”", "You’re not letting her get off the hook that easily.");
		else addDisabledButton(1, "Push");
	}
	else addDisabledButton(1, "Friend");

	if (flags["KQ2_PLAN_TALK"] == undefined) addButton(2, "Her Plan", kq2KaraThePlan, undefined, "Her Plan", "Let’s talk about this plan of yours, Kara.");
	else addDisabledButton(2, "Her Plan");

	if (flags["KQ2_EYES_TALK"] == undefined) addButton(3, "Her Eyes", kq2KarasEyes, undefined, "Her Eyes", "Ask kara about those eyes of hers. They look " + (pc.characterClass == GLOBAL.CLASS_ENGINEER ? "artificial" : "... wrong"));
	else addDisabledButton(3, "Her Eyes");

	if (flags["KQ2_PLACE_TALK"] == undefined) addButton(4, "This Place", kq2ThisPlace, undefined, "This Place", "How did Kara know about this place, anyway?");
	else addDisabledButton(4, "This Place");

	if (flags["KQ2_HERSELF_TALK"] == undefined) addButton(5, "Herself", kq2Herself, undefined, "Herself", "Ask Kara about herself. You need to know who you’re working with, after all.");
	else addDisabledButton(5, "Herself");

	addButton(14, "Next", kq2InitTalkNext, undefined, "Decisions....", "You’ve heard enough. Time to make your choice.");
}

public function kq2KaraTalkBlackVoid():void
{
	clearOutput();
	showKara();

	output("<i>“Tell me about the Black Void.”</i>");

	output("\n\nThe kaithrit scoffs, <i>“What’s there to tell? They’re the biggest, baddest group of pirates in the galaxy, bar none. You don’t run into them much in the core, but out here in the fringe - especially during a Rush - they’re the biggest threat to trade and commerce we pilots face. The Void is ruthless, bloodthirsty even, and they’ve got no qualms about killing. Unless you’re unlucky enough to be pretty when they board you: then you’re bound to be sold as a slave, if whatever captain takes you doesn’t fancy you himself... then it’s worse. The Void’s scum, [pc.name]. Evil to the man.”</i>");

	output("\n\nSounds like bad news. <i>“So why are you going after them?”</i>");

	output("\n\nKara’s hand rubs at the back of her neck as she answers, <i>“I crossed them. Big time.”</i> She sighs, and hesitantly she adds, <i>“I’ll be honest, [pc.name], I might not have told the whole truth back at the bar. That bounty hunter was there to cash in on a price on my head. A big one. I took a chunk out of a Black Void frigate, the biggest and scariest pirate vessel I’ve ever seen, commanded by one of the Dread Lords. Because of that fight, I’m a wanted woman... and I racked up a big debt to a ‘friend,’ paying for the damage they did to my crew, my ship...”</i>");

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
	if (pc.isMischievous()) output(" We can’t exactly walk into a pirate base.");
	output("”</i>");

	output("\n\n<i>“It’s not going to be easy, but I’ve got a unique opportunity here. The pirates are just setting up on Myrellion, bringing in pre-fab buildings and blasting out some caverns near the surface, carving out a sewer. Some kind of bunker underground, too. Security’s going to be");
	if (kara.isNice()) output(" pretty stringent");
	else if (kara.isMischievous()) output(" tighter than a princess’s chastity belt");
	else output(" KaraHard: fucking brutal");
	output(" on the surface, but they’re still building up the sub-levels and sewers, and there’s a chance we could push in through the underground, pop up in the middle of the base.”</i>");

	output("\n\n<i>“The sewers? Really?”</i>");

	output("\n\n<i>“Really!”</i> Kara says, a little defensive. <i>“They’re not expecting trouble - they don’t think anybody knows they’re there.");
	if (kara.isMischievous()) output(" P-probably!");
	output(" It’s a backwater research base, after all. A couple dozen foot-soldiers at worst, plus some automated security. But leave that to me - punching through security systems is my specialty. If I can get access to their communications systems or a computer, I’ll be able to shut down the alarms and make sure no reinforcements show up. Once done, we push into the subterranean research complex, and shut it down. Permanently.”</i>");

	output("\n\n<i>“Any idea what they’re researching, exactly?”</i>");

	output("\n\nKara grimaces. <i>“Bad things. You don’t build a base in the middle of a desert, hundreds of miles away from civilization");
	if (kara.isNice()) output(" if you’re doing anything short of evil.");
	else if (kara.isMischievous()) output(" just because.");
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
	else if (pc.isMischievous()) output("So, what’s with the peepers?");
	else output("So what’s the story with those eyes?");
	output("”</i>");
	
	output("\n\nKara winces, looking pointedly away from you when you ask. <i>“I... lost them. No, that’s too easy. A pirate bitch took them - a Dread Lord of the Black Void, I found out later. She had me dead to rights, was going to chain me up and sell me and my crew as slaves on the black market. We’d gone after the same treasure as the Void, and ended up damaging her ship in the crossfire. I’d intended to go out in a blaze of glory, but somehow we survived... and ended up surrounded by pirate troopers.”</i>");
	
	output("\n\n<i>“Selling us would have put a dent in that debt, if a Terran warship hadn’t hit her when it did. The pirate bitch ran, but not before trying to blast my brains all over the deck. Last shot at vengeance for what I did. She missed, mostly, but the laser blast boiled my eyes. My crew pulled me out while the pirates scrambled to get away, and I got patched up at a medbay on New Texas.”</i>");
	
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
	if (flags["KQ2_F_TALK"] != undefined) output(" decided to use it as a meet point. No chance of accidental pirate encounters here.");
	else output(" found it! Pretty handy, hmm?");
	output("”</i>");

	output("\n\n<i>“Definitely useful,”</i> you muse. <i>“Is there anything more to this place? Other than the dock, that is.”</i>");

	output("\n\n<i>“Some tunnels. A few half-built rooms,”</i> Kara answers. <i>“I haven’t explored this place too much. Mostly because there’s no atmosphere anywhere");
	if (kara.isMischievous()) output(", and space suits just chafe my tails, you know?");
	else output(".");
	output(" If you want to look around on your time, you’re welcome to - like I said, it doesn’t belong to me.”</i>");

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
	else if (pc.isMischievous()) output("We ought to get to know one another first, right?");
	else output("If you want my help, that is.");
	output("”</i>");

	output("\n\n<i>“That’s fair,”</i> Kara chuckles. <i>“I’ll save you the whole sob story, if it’s all the same to you. For the last few years, I was crew on a smuggling vessel: the </i>Silence<i>. She was originally captained by Rourke Blackstar. You might have heard of him.”</i>");

	output("\n\n");
	if (pc.characterClass == GLOBAL.CLASS_SMUGGLER) output("Of course you have. Blackstar was a legend among smugglers, the best of the best. At least, until he got pinched a couple years back. Kara smiles at your recognition. <i>“Good. Then you know what he could do. What he was capable of.”</i>");
	else
	{
		output("You shake your head. Kara grunts a mute, <i>“Don’t worry about it.");
		if (kara.isNice()) output(" Suffice to say, he was the best smuggler to ever live.");
		else if (kara.isMischievous()) output(" I guess you’re a pretty shitty smuggler if everyone’s heard of you, now that I think about it.");
		else output(" Can’t expect everyone to know, I guess.");
		output("”</i>");
	}

	output("\n\nYour companion sighs and continues: <i>“I was born a slave in a kaithrit colony on Tarilia. The colony was short on males - it’s a problem on a lot of kaithrit worlds - so they kept anything with a dick cooped up as breeding stock. That includes me, if you’re wondering; I was born a hermaphrodite. About ten percent of kaithrit are. Blackstar met me on a run when the planet’s matriarch invited him to tour the ‘pleasure palace’ they kept us chained up in. Long story short: he liked me, and helped bust me out. I’ve been on the run ever since. I served under him on the </i>Silence<i>, learned the tricks of the trade, and when he was captured on Terra, I took command of the ship. Most of the crew bought their farms with him or got pinched by the Peacekeepers... or bailed out after the stunt I pulled with the Void. All that’s left is me");
	if (flags["SILENCE_RESCUED_CONNIE"] == undefined) output(" and my first mate.");
	else output(", my first mate, and a V.I. in a robot.");
	output(" Not much of a crew.”</i>");

	output("\n\nAfter a moment’s consideration, you ask, <i>“I thought you said your ship was the </i>Ghost<i>?”</i>");

	output("\n\n<i>“Heh. About that...");
	if (kara.isNice()) output(" The </i>Silence<i> got destroyed by the Black Void the last time we tangled.");
	else if (kara.isMischievous()) output(" I might have sort of rammed a Black Void frigate with the </i>Silence<i>. It seemed like a good idea at the time, honest!");
	else output(" I rammed a Black Void warship with the </i>Silence<i>. Crippled one of their best ships and killed dozens of pirates, though I lost the ship in the process. I’d do it again in a heartbeat.");
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
	addButton(0, "DontTrust", kq2DontTrust, undefined, "Trust Issues", "Tell Kara that you don’t trust her.");
	addButton(1, "LetsGo", kq2LetsGo, undefined, "I’m In", "Let’s do this.");
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

	addButton(5, "PayFirst", kq2PayFirst, undefined, "Payment First", "Tell Kara you might trust her if she paid you up front.");
	addButton(6, "Sex", kq2SexFirst, undefined, "Sex", "Tell Kara you might trust her if she threw in a more... <i>personal</i> incentive.");
}

public function kq2PayFirst():void
{
	clearOutput();
	showKara();

	output("<i>“Payment up front would help.”</i>");
	
	output("\n\nKara looks nervously around before drawing out a small datachit and swiping it through a small computer on her wrist. <i>“Uh, yeah, I guess that makes sense. Let’s call it halvsies, alright? Half now, half after?”</i>");
	
	output("\n\nThat’s pretty reasonable, you figure.");

	removeButton(5);
	removeButton(6);
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
	if (kara.isMischievous()) output(" If you’re a good "+ pc.mf("boy", "girl") +", that is...");
	else if (kara.isAss()) output(" If you don’t get yourself killed, anyway.");
	output("”</i>");

	removeButton(5);
	removeButton(6);
	flags["KQ2_SEX_PAY"] = 1;

	processTime(2);
}

public function kq2LetsGo():void
{
	clearOutput();
	showKara();

	output("<i>“Alright, I’m in,”</i> you say, extending a hand to Kara.");
	
	output("\n\nShe grins from ear to ear and shakes it hard. <i>“You’re the best, [pc.name]. I knew I could count on you.”</i>");
	
	output("\n\n<i>“So what’s next?”</i> you ask. Kara answers by hopping up to her feet and grabbing her case, starting towards your airlock.");
	
	output("\n\n<i>“Next... we go down to the planet. We’ll take my ship, if it’s all the same to you. </i>Ghost<i> is rigged with a high-end stealth system, and she’s fast and quiet besides. We’ll fly right under the pirates’ radar, land near their base, then hoof it in.");
	if (kara.isMischievous() && pc.hasLegFlag(GLOBAL.FLAG_HOOVES)) output(" Literally, in your case!");
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

	showName("THE\nGHOST");

	output("A moment later and you’re aboard the <i>Ghost</i>, Kara’s ship, looking around at the sleek, bright white of the interior. She’s a new ship, still squeaky clean and polished to a shine. Consoles run along the length of every corridor you pass through on the way to the bridge. The whole ship has an oddly sterile feel - not like the cozy home you’ve made out of your own ship.");

	if (flags["SILENCE_RESCUED_CONNIE"] != undefined)
	{
		output("\n\nAs you’re walking, a side passage in the corridor slides open with a hiss, and a pale blue beauty sashays out into your path. You blink hard as the robotic bombshell smiles at you with big, ultramarine lips, putting her hand on a set of broad hips that strain the band of her skin-tight yoga pants. Her flat, sleek belly is left bare, all the way up to a too-tight black sports bra that’s somehow hugging back a set of tits that would look more at home");
		//if met Irellia:
		if (flags["MET_IRELLIA"] != undefined) output(" on a gold myr queen");
		else output(" on a hyperporn star - and emphasis on the hyper");
		output("!");
		// if met Gianna:
		if (flags["MET_GIANNA"] != undefined) output(" She looks a lot like a certain New Texan companion droid you know - maybe they’re the same model?");

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
	if (kara.isMischievous()) output("Being a sexy stranger sure helps,”</i> Kara winks, pointedly ignoring a renewed pout from her second.");
	else output("I guess of all the random spacers in that bar, I picked right,”</i> Kara grins.");
	
	output("\n\nLogan rolls her reptilian eyes and turns back to the pilot’s console. <i>“Anyway, welcome aboard, [pc.name]. Pick a seat and strap in, should be ready to take off in a couple minutes.”</i>");
	
	output("\n\nYou");
	if (pc.isMischievous()) output(" make a beeline for the captain’s seat, only to be rebuffed by Kara, and sent packing to one of the weapons consoles");
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

	showName("THE\nGHOST");

	output("The trip goes by quickly and peacefully, until you hit the arid atmosphere of Myrellion. The ship shudders with turbulence, and you watch as Logan hammers several controls on a console above her. Part of the forward screen flickers off, replaced by a bird-eye view of the desert - some kind of probe’s camera, maybe? The second screen focuses in on some kind of walled compound sitting at the bottom of a deep caldera, surrounded by nothing for miles and miles around. You squint, and think you make out all of three, maybe four buildings on the surface.");
	
	output("\n\nNot much of a base.");
	
	output("\n\n<i>“Bring us in low, Logan. Nice and easy,”</i> Kara says casually, leaning back in her captain’s chair with legs crossed. <i>“Any sign of Void ships?”</i>");
	
	output("\n\n<i>“None,”</i> your pilot calls back, flipping a button that replaces your view of the base with a radar image of the surrounding airspace: totally blank.");
	
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
	if (pc.lust() >= 33 || pc.LQ() >= 50) output(" appreciatively as she bends over to pop the case open, lifting her tails high and showing off a remarkable ass under that catsuit");
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
	else if (kara.isMischievous()) output("\n\n<i>“I’m just that good,”</i> she smirks, drawing her pistol.");
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

	output("\n\n<i>“Ah, yes, you’ll forgive me for the wait. Most of my higher-level processes were occupied elsewhere. You may call me Watson, if you’d be so kind,”</i> he says, puffing a holographic circle of smoke from the end of his pipe. He looks to your companion and scowls, <i>“You must be Captain Volke of the </i>Silence<i>, yes? I’m led to believe this incident was a long time in coming. Longer than expected: it’s been several months since the unfortunate business aboard the N.S.V. </i>Constellation<i>.”</i>");

	output("\n\n<i>“Unfortunate business!?”</i> Kara snaps, stomping up and jabbing a finger into the hologram’s belly. <i>“Your Dread Bitch shot out my eyes!”</i>");

	output("\n\nThe hologram seems nonplussed by her aggression, and even pauses to tap a little ash out of his pipe. <i>“Yes. And you led your crew into an unprovoked engagement on the order of a noted opponent of the organization I represent, attempting to steal high-value cargo from not only us, but the people of New Texas. You’ll understand if I don’t apologize for Lord Bragga’s behavior during the incident. At any rate, please, make yourselves at home. I simply intended to tip my hat to you - bravo on making it this far past our security. We’ve certainly learned from the events of today, and I assure you such faults will not be repeated. Now, please, do carry on with whatever it is you came to do.”</i>");

	output("\n\nWhat, he doesn’t intend to stop you? What kind of V.I. is this?");

	processTime(15);
	flags["KQ2_WATSON_MET"] = 1;

	//[Watson] [Kara] [Constellation] [Intervention]
	clearMenu();
	addButton(0, "Watson", kq2WatsonTalkWatson, undefined, "Watson", "Ask the strange pirate program about itself.");
	addButton(1, "Kara", kq2WatsonTalkKara, undefined, "Kara", "Ask Watson about the Void’s beef with Kara.");
	addButton(2, "Constellation", kq2WatsonTalkConstellation, undefined, "Constellation", "Ask Watson about the incident aboard the Constellation.");
	addButton(3, "Intervention", kq2WatsonTalkIntervention, undefined, "Intervention", "Finish this conversation. Why isn’t Watson trying to stop you?");
}

public function kq2WatsonTalkWatson():void
{
	clearOutput();
	showWatson();

	output("<i>“So, what exactly are you?”</i> you ask, eyeing the hologram as it puffs on its pipe.");
	
	output("\n\nIt chuckles slightly, completely devoid of humor. <i>“Why, my dear [pc.boyGirl], I should like to think the correct question is ‘who’ am I? But I digress, this is hardly the moment for a discussion on the higher philosophies of artificial intelligences. Suffice to say, I am Watson. I oversee the Black Void’s operations.”</i>");
	
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
	else if (kara.isMischievous()) output(" Just a sliver of that would have made me a rich woman. If it weren’t for the pirates, I’d be cruising the pleasure gardens of Venus with a harem and a liquor-replicator.");
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
	
	output("\n\n<i>“Indeed,”</i> Watson adds, clenching his pipe between his teeth and reaching out beside him. A holo-map of the Myrellion system flickers into place, showing several vessels closing in. <i>“Every moment you’ve been within this base, every soldier you’ve killed, every second wasted in pointless battle, has been a delaying tactic whilst I recall this base’s commander, Lord Faell, from her patrol of the outer moons. I estimate you have less than five seconds before the first troop transports set down on-base.”</i>");
	
	output("\n\n<i>“So please, make yourselves at home. Sit, relax. You still have a few moments before your lives are over. Use them wisely.”</i>");
	
	output("\n\nWatson flickers out of existence, leaving you in the dark.");
	
	output("\n\n<i>“God... no,”</i> Kara moans, slumping against the wall. <i>“We’re fucked.”</i>");
	
	output("\n\n<i>“Come on!”</i> you shout, grabbing her by the arm. <i>“We have to get out of here!”</i>");
	
	output("\n\nWith a little encouragement, Kara collects herself. <i>“Right... right. Before we leave, there’s something I need to know. Let’s get to Khan’s office. I need to see something.");

	processTime(10);
	
	flags["KQ2_TALKED_TO_WATSON"] = 1;

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
	addButton(1, "No", mainGameMenu);
}

public static const KQ2_NUKE_DURATION:int = 90;

public function kq2NukeIt():void
{
	clearOutput();

	output("You rip the console’s wireless plug out, just in case Watson’s watching, and hit the activation sequence. Here we go!");

	// probably wise to format the value better ("T-minus: 6 hours" etc)
	output("\n\n<i>“Nuclear Cleansing System Activated,”</i> a feminine voice drones from the console. <i>“Detonation in T-minus: " + prettifyMinutes(KQ2_NUKE_DURATION) + ". Please get to minimum safe distance.”</i>");
	
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
	if (flags["KQ2_ENGINEER_NUM_DRONES"] == undefined) flags["KQ2_ENGINEER_NUM_DRONES"] = 2 + rand(2);

	if (flags["KQ2_DEFEATED_ENGINEER"] == undefined && flags["KQ2_LEFT_ENGINEER"] == undefined)
	{
		clearOutput();
		showKQ2Engineer();

		output("You step into the security room, and immediately are greeted by the sound of low, metallic grating that’s almost like growling. You take a step back as a huge, black canine robot stalks out of the shadows, its teeth bared. Behind it stands a small, feminine figure - not quite four feet in height, with svelte curves that are muted by a ballistic breastplate that’s much too bulky for its user. She’s nearly naked aside from the plate and a pair of high-heeled boots... and a jockstrap that’s barely holding back a pair of oversized testicles, out of which bobs a six-inch canine cock. The diminutive creature scowls at you, hands on her hips, the pair of bunny-ears atop her head lying flat back against her scalp, showing off a pair of demonic-looking horns that sprout out from her orange hair.");
		
		if (CodexManager.entryUnlocked("Lapinara")) output("\n\nIt takes you a good moment to realize the creature’s a lapinara, clearly unlike those you’ve seen before!");
		else
		{
			output(" It takes longer than usual for your Codex to identify the creature as a lapinara, of the non-parasitic variety.");
			CodexManager.unlockEntry("Lapinara");
		}
		
		output("\n\n<i>“How did you get past all the guards!?”</i> she growls, staring");
		if (pc.tallness >= 52) output(" up at you");
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
	for (var i:int = 0; i < numDrones; i++)
	{
		h.push(new KQ2FenrisDrone());
		h[i + 1].skinTone = "black";
	}

	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(f);
	CombatManager.setHostileActors(h);
	CombatManager.displayLocation("ENGINEER");
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
	if (CombatManager.getHostileActors().length > 2) output("s");
	output(" collapse, utterly defeated.");
	
	if (!pc.hasKeyItem("Key Card - R&D Security Pass"))
	{
		output(" <b>You find a keycard on her person</b>. No doubt this’ll get you into the research facility!");
		pc.createKeyItem("Key Card - R&D Security Pass");
		output("\n\n(<b>Gained Key Item: Key Card - R&D Security Pass</b>.)\n\n");
	}

	flags["KQ2_DEFEATED_ENGINEER"] = 1;

	CombatManager.genericVictory();
	
	kquest2RoomStateUpdater();
}

public function kq2LeaveEngineer():void
{
	clearOutput();
	showKQ2Engineer();

	flags["KQ2_LEFT_ENGINEER"] = 1;

	output("You cautiously step back out of the security room, and quickly have the door slammed in your face.");

	processTime(1);

	currentLocation = "K2_BARRACKSINTERIOR";
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
	if (pc.credits >= 1000) addButton(1, "Money", kq2GibEngyCash, undefined, "Money", "Give the lapinara some money in trade. Considering who she works for, it’d probably take 1,000 credits to convince her.");
	else addDisabledButton(1, "Money", "Money", "You don’t think you have enough spare money for this. Considering who she works for, it’d probably take 1,000 credits to convince her.");
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
	//if convinced Steph to do porn:
	if (flags["STEPH_WORK_CHOICE"] == STEPH_WORK_PORNSTAR) output(" I’ve been waiting for the first issue of </i>Galactic Fucktress<i> for ages!");
	output("”</i>");
	
	output("\n\nSomewhat amazed that actually worked, you take the keycard and leave the lapinara engineer to her business.");

	pc.removeKeyItem("Hentai Magazine");
	output("\n\n<b>Removed Key Item: Hentai Magazine</b>.");
	pc.createKeyItem("Key Card - R&D Security Pass");
	output("\n\n(<b>Gained Key Item: Key Card - R&D Security Pass</b>.)");

	processTime(2);

	flags["KQ2_LEFT_ENGINEER"] = 2;
	currentLocation = "K2_BARRACKSINTERIOR";
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function kq2GibEngyCash():void
{
	clearOutput();
	showKQ2Engineer();

	output("<i>“...give me a thousand credits!”</i> she says, extending a hand to you, palm open and expectant. You dig a credit chit out of your pack and plant it in her outstretched hand. The engineer squeals in excitement, bouncing around on her powerful legs. <i>“Score! Take the card, I’m going on a SHOPPING SPREE! Whoo!”</i>");
	
	pc.credits -= 1000;
	
	output("\n\nShe grabs a keycard off of the desk behind her and tosses it at you. You narrowly snatch it away from the fangs of");
	if (flags["KQ2_ENGINEER_NUM_DRONES"] > 1) output(" one of");
	output(" her cyber-hound");
	if (flags["KQ2_ENGINEER_NUM_DRONES"] > 1) output("s");
	output(", and quickly make your way out of the security office.");

	pc.createKeyItem("Key Card - R&D Security Pass");
	output("\n\n(<b>Gained Key Item: Key Card - R&D Security Pass</b>.)");

	processTime(2);

	flags["KQ2_LEFT_ENGINEER"] = 3;
	currentLocation = "K2_BARRACKSINTERIOR";
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
	
	pc.buttChange(engineer.cockVolume(0));

	output("\n\nYou give the lapinara a little grin over your shoulder, and relax in her hands, enjoying the feeling of her prick inside you,");
	if (pc.ass.looseness() < 3) output(" stretching you out");
	else output(" filling your cock-hungry hole");
	output(". After a moment of penetration, you quickly feel a tiny bump of thickness press against your hole - the knot at the base of her dick. The tiny engineer presses it against you, seeming to think about it for a moment before withdrawing, and starting to thrust. Your lover goes from slow to full throttle before you can blink, pounding away at you thanks to the ample helping of lube coating your anal walls. She moans like a whore, and you soon hear her breastplate clattering to the ground, letting her pinch and grab at her small breasts. Her other hand, however, slips down around your [pc.hip], starting to");
	if (pc.hasVagina()) output(" caress your [pc.cunt]");
	else if (pc.hasCock()) output(" wrap her fingers around your [pc.cock], bringing it from an excited half-mast to full attention. Her hand is still slathered with cool, slick lube, and she’s able to glide across your member with ease, returning the pleasure you’re giving her own member");
	else output(" rub the tender, sexless [pc.skinFurScales] of your crotch");
	output(". You let yourself moan in answer to her wandering hand, pushing back against her six-inch pole to take it deeper, trying to feel every inch of throbbing hot dog-meat inside you.");

	output("\n\nA few heart-pounding moments of thrusting later, and your lapinara lover is screaming and jackhammering her hips, slamming them into your [pc.butt] with wild abandon. You can feel her");
	if (pc.ass.looseness() >= 3 || pc.tallness >= 72) output(" tiny");
	else output(" girthy");
	output(" prick swelling inside you, straining to hold back her orgasm; her knot batters against the rim of your hole, swollen to nearly the size of its owner’s fist and demanding entrance. You’re only just able to push the swollen member back - you can’t spend <i>that</i> kind of time here, waiting for her to untie you. The lapinara makes a pleading moan when you rebuke her knot, but doesn’t push the issue: her attention is snatched away in a moment but a surge of seed rushing through her member and into your eagerly awaiting posterior. She screams her pleasure, slamming herself as deep into you as she can before unloading a thick rope of hot and creamy spunk across your anal walls.");

	output("\n\nYou wince as you feel her cum pour into you. It’s much hotter than you were expecting, like a stream of boiling cream flooding into you and searing your walls. Giving a low groan of your own, you dig your fingers into the desk and try and bear it, gasping and moaning as the engineer continues to thrust into you as she cums. Your bowels get a thorough spunk-basting by the time she’s done, filling you with more lapinara cum than you’d have thought such a tiny girl could produce, even with those massive balls she was toting around.");

	output("\n\nThe lapinara grunts as she pulls herself out of you, trailing a sticky web of spooge behind her. A little trickle of it leaks out of your well-fucked hole, drooling down your thigh. <i>“Whoo! I’ve never fucked a butt quite like that!”</i> she coos, wiping the last traces of her orgasm off on your upraised ass. She flops back in a chair behind one of the desks and tosses a keycard to you. <i>“You earned it. Hehe, I’ll be fapping to this memory for a loooong time.”</i>");

	output("\n\nYou spend a moment catching your breath, letting your body cool down from the rough buttfucking, before grabbing the card, cleaning up as best you can, and rejoining Kara outside.");

	output("\n\n<i>“Score!”</i> you say, holding up the card.");

	output("\n\n<i>“I guess you’re a lover, not a fighter, huh?”</i> she chuckles.");

	pc.createKeyItem("Key Card - R&D Security Pass");
	output("\n\n(<b>Gained Key Item: Key Card - R&D Security Pass</b>.)");

	processTime(15+rand(5));

	pc.loadInAss(engineer);
	pc.orgasm();

	currentLocation = "K2_BARRACKSINTERIOR";
	flags["KQ2_DEFEATED_ENGINEER"] = 2;
	kquest2RoomStateUpdater();
	
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

	output("You give Kara slight nod, signaling her to pop the hatch and open the door. You go in first, [pc.rangedWeapon] raised. The sealed lab hits you with a sultry heat the moment you step in, clinging to your [pc.skinFurScales] as your [pc.feet] tread through something wet and sticky covering the white floor. The lab’s a mess compared to the sterile facility you just passed through: computers and machinery are turned and toppled all over, and covered in a thick, musky white goo.");
	
	output("\n\nYou hear a click from across the lab, and have just enough time to dive behind an overturned desk before a lightning bolt screeches across the room, slamming into the wall just behind where you’d stood a moment ago. A laugh booms across the room, drawing your attention to a small man sitting on what at first glance is a large, tan beanbag chair in the corner of the room, a smoking pistol in his hand. Several young women surround him, gold-plated myr girls in white lab coats that hang open from bare shoulders, leaving their nude bodies underneath on shameless display for you: breasts swollen with honey, and honeypots drooling with blatant desire.");
	
	output("\n\nOnce the immediate excitement of the man’s shot is over, they begin to fawn over him, chitin-clad hands playing across his soft fur, caressing the seat beneath him, falling to their knees around a canine-shaped cock with three large, turgid knots at full mast - though it remains out of their reach, trapped in a hardlight cage not unlike a chastity belt. He’s a kui-tan, the same tanuki-like race as Ambassador Juro, and as you watch him, you can see that’s not a beanbag chair he’s sitting on, but a pair of almost comically swollen testicles, large enough to keep his feet from touching ground.");
	
	output("\n\n<i>“I told you pirate bastards to leave me alone!”</i> the man shouts, snapping off another shot as Kara dives into the room, rolling into cover behind an overturned desk. <i>“You’ll get your devices when they’re damn ready, and not a second before! I’ll not have my work roughshod by impatient peasants who don’t know the meaning of </i>SCIENCE<i>. Nobody rushes DOCTOR SOUTA KHAN!”</i>");
	
	
	output("\n\n<i>“");
	if (kara.isNice()) output("Hold your fire! We aren’t pirates!");
	else if (kara.isMischievous()) output("We’re not pirates, you crazy furball!");
	else output("Try that again, asshole! You’re shooting at the wrong people.");
	output("”</i>");
	
	output("\n\nHe laughs at that, racking the charger on his lightning gun. <i>“Not pirates? Then you’re just more lab rats, then? How considerate of my masters to replenish my stock... I was getting bored of these girls, anyway!”</i>");
	
	output("\n\nAs he speaks, several small hover drones take off from alcoves in the wall, charging up their own zappers as they ascend, starting to fly towards you.");
	
	output("\n\nLab rats? Something tells you he’s not letting you get past.");

	var tKhan:KQ2Khan = new KQ2Khan();

	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors([pc, kara]);
	CombatManager.setHostileActors([tKhan, new KQ2SecurityDroid(), new KQ2SecurityDroid(), new KQ2SecurityDroid()]);
	CombatManager.victoryCondition(CombatManager.SPECIFIC_TARGET_DEFEATED, tKhan);
	CombatManager.victoryScene(kq2KhanPCVictory);
	CombatManager.lossScene(kq2KhanPCDefeat);
	CombatManager.displayLocation("DR KHAN");
	CombatManager.encounterText("You’re fighting Doctor Khan, a kui-tan male with a pair of balls"+ (!metKiro() ? " that look more like a couple economy-sized beanbag chairs underneath him." : " that would make even Kiro jealous -- or wet. It’s hard to tell!") +" The doctor’s carrying an over-sized lightning gun, but is otherwise unarmed and unarmored -- he’s sitting buck naked on his mammoth balls. A shimmering green hardlight device encloses his cock, which seems to be at full mast, but is completely untended to by the girls surrounding him.\n\nSeveral gold myr girls surround the doctor, fawning over him with blissful, vapid expressions on their faces. They’re clad in nothing but open-faced lab coats, showing off bare breasts and groins, and each wears a small metal collar around her neck, displaying a tiny holographic tag. They lovingly caress his sack, chest, any inch of tender flesh save for the light-bound cock between his raised legs.");

	clearMenu();
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
	else if (kara.isMischievous()) output("<i>“Think fast!”</i> Kara shouts, grabbing the grenade mid-air and beaning Khan in the head with it.");
	else output("Kara back-hands the grenade out of the air, letting it roll back towards its owner.");
	output(" It detonates in a pink cloud that utterly envelops him and his harem, spreading out almost far enough to draw you into it, too. Just a little whiff of the brightly-colored gas sends a shiver of pleasure up your spine.");

	output("\n\nKara, too, flushes a bit as vapors waft past her. <i>“Whew. That’s some potent stuff,”</i> she murmurs, adjusting the band of her half-skirt to make the sheer cloth cover a bit more of her crotch.");
	
	output("\n\nEven before the cloud disperses, you can hear desperate moans from inside it, the shadows of girls moving all over their master as overwhelming, chemically-induced lust overtakes them. When the gas fades, you find quite the sight in store for you: Doctor Khan desperately but futilely tugging at the hardlight cage firmly affixed around his tri-knotted dick while his harem desperately kiss and fondle each other and their master’s scrotum, all trying to find some measure of relief.");
	
	output("\n\n<i>“I’ll take that,”</i> Kara says, snatching a small remote from Khan’s hand and twisting a dial on it. He gulps, eyes wide, as Kara waves the remote over him and his harem... and the small metal collars each of the gold myr is wearing snap open and fall off. There’s a moment of silence as the girls’ eyes go wide, their vapid expressions evaporating into understanding.");

	output("\n\n<i>“What... where...”</i> one of the girls gasps, looking down at her nearly naked body.");
	
	output("\n\n<i>“It’s alright. You’re safe now,”</i> Kara says, putting a hand on the girl’s shoulder. <i>“Khan’s got no hold on you anymore.”</i>");
	
	output("\n\nRealization passes over the gold myr, one face at a time. They all come to look angrily at the overburdened kui-tan, desperately clawing at the cage surrounding his cock. He looks up after a minute, chuckles nervously, and scoots an inch or two back from the collection of gold myr surrounding him.");
	
	output("\n\n<i>“Uh. L-ladies, please... our work was a resounding success! The collars exceeded our wildest expectations. Surely... uh, surely you can see the progress we’ve made is more than worth-”</i>");

	output("\n\n<i>“You bastard!”</i> one of the girls says, storming up and slapping the doctor across the face. <i>“We... we </i>trusted<i> you!”</i>");
	
	output("\n\nKhan sucks in a breath, rubbing his cheek. <i>“L-look, we can work something out, right? Come on, you’re all reasonable people... right?”</i>");

	userInterface.hideNPCStats();
	userInterface.leftBarDefaults();
	generateMap();
	
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

	if (pc.hasGenitals()) addButton(2, "Fuck Khan", kq2KhanVictoryFuckRouter, undefined, "Fuck Dr. Khan", "Give the doctor a taste of his own medicine. Make him service you orally while Kara milks what’s gotta be gallons of spooge via the back door.");
	else addDisabledButton(2, "Fuck Khan", "Fuck Dr. Khan", "You will need genitals for this!");

	if (flags["KQ2_KHAN_LOOTED"] == undefined)
	{
		addButton(3, "Loot Room", kq2KhanPCVictoryLootRoom, undefined, "Loot The Room", "Loot the room. Khan had a nice gun that went... somewhere.");
	}
	else
	{
		addDisabledButton(3, "Loot Room");

		if (flags["KQ2_KHAN_LOOTED_COAT"] == undefined) addItemButton(5, new KhansLabCoat(), kq2LootLabCoat);
		else addDisabledButton(5, "LabCoat", "Lab Coat", "You’ve already taken it!");

		if (flags["KQ2_KHAN_LOOTED_CASTER"] == undefined) addItemButton(6, new KhansArcCaster(), kq2LootArcCaster);
		else addDisabledButton(6, "ArcCaster", "Arc Caster", "You’ve already taken it!")
	}

	addButton(14, "Leave", kq2KhanLeave, undefined, "Leave", "Leave the researchers to their business. You’ve come here to destroy their work, after all.");
}

public function kq2KhanPCVictoryTalkMyr():void
{
	clearOutput();
	author("Savin");

	output("You turn your attention from the debilitatingly swollen kui-tan to the ex-harem around him. Between angry glances at their captor, many of them are buttoning up what’s left of their lab coats or recovering bits of clothing scattered across the lab. When you approach them, they set aside whatever it is they’re doing and give you their full attention, saying <i>“thank you”</i> in every way imaginable.");
	
	output("\n\nWhen they finally let you get a word in edgewise, you ask a few of them how they managed to end up in a pirate lab in the middle of nowhere. Shamefacedly, one of them answers, <i>“We were all scientists working for a big firm in Gildenmere. We worked in chemical weapons, gases mostly. These... people... approached us just after you offworlders first appeared and made a deal we couldn’t refuse: they offered to share their technology with us if we would help them reproduce our company’s gases. Imagine what we could have done with offworlder weapons - lasers and cannons and new types of armor! All they wanted were some of our formulas, help setting up the facility...”</i>");
	
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
	
	output("\n\n<i>“Doesn’t look like he has much to say,”</i> Kara says, curling a lip in disgust at him. <i>“Then again, maybe he could use a little... help... with that.”</i>");
	
	output("\n\nAs if for emphasis, Kara adjusts the fabric of her catsuit, revealing a pretty impressive bulge in her black-clad crotch. <i>“Teach this bastard a lesson...”</i>");

	flags["KQ2_KHAN_KHAN"] = 1;
	kq2KhanVictoryMenu();
}

public function kq2KhanPCVictoryLootRoom(noncombatMenu:Boolean = false):void
{
	clearOutput();
	author("Savin");

	output("You spend a few minutes poking through the room, overturning desks and chairs to find any hidden gear. Among the trash, you manage to find a shiny white Arc Caster lightning pistol half hidden beneath one of Khan’s enormous balls as well as a lab coat that’s in much better condition than the ones worn by the gold myr assistants. You also turn up several credit chits scattered around, totaling up to 2,500 credits. Not a bad haul for a room full of buck-naked people.");

	pc.credits += 2500 + rand(27);
	flags["KQ2_KHAN_LOOTED"] = 1;
	if (noncombatMenu == false)
	{
		clearMenu();
		kq2KhanVictoryMenu();
	}
	else
	{
		clearMenu();
		addButton(0, "Next", mainGameMenu);
	}
}

public function kq2LootLabCoat(noncombatMenu:Boolean = false):void
{
	output("\n\n");
	flags["KQ2_KHAN_LOOTED_COAT"] = 1;
	lootScreen = (noncombatMenu ? kq2LabCoatCheckMenu : kq2LabCoatCheck);
	itemCollect([new KhansLabCoat()]);
}

// Cheesy hack to see what the player did with the item. If they discarded it, clear the flag that said they looted it.
public function kq2LabCoatCheck():void
{
	if (pc.armor is KhansLabCoat || pc.hasItemByClass(KhansLabCoat))
	{
		kq2KhanVictoryMenu();
		return;
	}
	flags["KQ2_KHAN_LOOTED_COAT"] = undefined;
	kq2KhanVictoryMenu();
}

public function kq2LabCoatCheckMenu():void
{
	if (pc.armor is KhansLabCoat || pc.hasItemByClass(KhansLabCoat))
	{
		mainGameMenu();
		return;
	}
	flags["KQ2_KHAN_LOOTED_COAT"] = undefined;
	mainGameMenu();
}

public function kq2LootArcCaster(noncombatMenu:Boolean = false):void
{
	output("\n\n");
	flags["KQ2_KHAN_LOOTED_CASTER"] = 1;
	lootScreen = (noncombatMenu ? kq2LootArcCasterCheckMenu : kq2LootArcCasterCheck);
	itemCollect([new KhansArcCaster()]);
}

public function kq2LootArcCasterCheck():void
{
	if (pc.rangedWeapon is KhansArcCaster || pc.hasItemByClass(KhansArcCaster))
	{
		kq2KhanVictoryMenu();
		return;
	}
	flags["KQ2_KHAN_LOOTED_CASTER"] = undefined;
	kq2KhanVictoryMenu();
}

public function kq2LootArcCasterCheckMenu():void
{
	if (pc.rangedWeapon is KhansArcCaster || pc.hasItemByClass(KhansArcCaster))
	{
		mainGameMenu();
		return;
	}
	flags["KQ2_KHAN_LOOTED_CASTER"] = undefined;
	mainGameMenu();
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
	if (kara.isMischievous() || kara.isAss()) output("And I was just starting to feel good about freeing them. ");
	output("Your turn, [pc.name]. Let’s go find us some red bugs.”</i>\n\n");

	CombatManager.genericVictory();
}

public function kq2KhanVictoryFuckRouter():void
{
	flags["KQ2_FUCKED_KHAN"] = 1;
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
	else if (kara.isMischievous()) output("<i>“Couldn’t agree more, [pc.name],”</i> Kara answers, a mischievous twinkle in her eerie eyes. Slowly, she slips behind the prostrate kui-tan, tracing her fingers along his bare, thick fur as she goes.");
	else output("Kara gives you a silent, approving nod and moves behind the kui-tan, giving his bare, furry ass a rough slap.");
	output(" Your companion plants herself behind Khan and yanks down her skirt and shorts, revealing a thick pink kittycock dangling between her legs. Khan’s eyes widen even more as she flops her prick into the crack of his ass.");
	
	output("\n\n<i>“You... you...”</i> Khan babbles, squirming pitifully under you as you shift off your own [pc.gear]. You grab his head and mash his short little muzzle into the base of your [pc.cock] the moment it’s free of your gear, muffling any further argument with your crotch.");
	
	output("\n\n<i>“Open,”</i> you command, squeezing down on him. Meekly, the defeated, lusty kui-tan obeys. You grin as you see his little caged cock twitch, drooling obscenely as he opens wide and accepts a thrust of your cock into his mouth. You groan as the kui-tan’s black lips seam around your shaft, sucking you in with surprising skill.");
	
	output("\n\n<i>“Oh, somebody’s had some practice,”</i> you tease. His prick again twitches in its glowing cage, and Khan’s legs desperately try to close, shielding it from view. So you weren’t wrong.... You grin at the kui-tan’s embarrassment, but urge him on to ply that talented tongue on your thrusting cock.");
	
	output("\n\n<i>“Poor guy looks so pent up,”</i> Kara chuckles from the other side of him, her hand vanishing underneath the kui-tan’s hugely fluffy tail. You feel Khan’s body go rigid, his tongue lashing around your length. <i>“Pirates must have kept him nice and locked up. Makes sense... he’d probably never get anything done without something to keep his mind on track.”</i>");
	
	output("\n\nKara leans in behind Khan, all but pressing herself to his bent back, and whispers into his ear, <i>“Maybe if you work hard to please my friend here, I’ll be nice enough to get you off properly. I can feel a nice, big bulb back here. Sensitive, isn’t it?”</i>");
	
	output("\n\nKhan whines an affirmation, and you shiver as his oral attention shifts fully towards pleasing you, desperately licking and slurping your [pc.cock]. Kara winks. Her buried hand ever so slightly shifts, making the tanuki cry out with pleasure. While Khan’s prick is now out of sight, hidden by his legs, your eyes are drawn to another thick slab of cockmeat, growing stiff at the sight of Khan’s mouth acting as a receptive sheathe to your thrusts.");
	
	output("\n\nYou allow your pleasure to guide you, spurring your movements faster, pounding Khan’s face until he’s gagging on your dick, spittle drooling down from the corners of his mouth. You’re merciless in your face-fucking, knowing full well he’d have treated you no better were your places reversed. The kui-tan’s mouth is nothing but an onahole for you to abuse, to fuck as hard as you can until you spill your seed down his throat.");
	
	output("\n\n<i>“That’s better,”</i> Kara coos, shifting her hand behind Khan. She shifts her hips back, dragging her spiny feline shaft down through the furry cleavage of Khan’s backside, out of sight into the kui-tan’s crack. She lifts her hand out of the way, and thrusts her hips in hard against Khan’s upraised ass. He cries out, squealing almost girlishly as Kara hammers home into his boypussy. The tongue that was slavishly servicing your cock falls still, stunned by the sudden penetration. Khan’s caged prick erupts in a geyser of white cream, cum spewing out of his otherwise average prick like a firehose.");
	
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
	if (kara.isNice() || kara.isMischievous()) output("<i>“We make a good team,”</i> Kara says with a wink, wiping her cock off of the kui-tan’s thigh.");
	else output("<i>“Not bad,”</i> Kara grunts, wiping her cock off on Khan’s furry thigh. <i>“Wouldn’t mind keeping a tight little hole like that around... willingly, of course.”</i>");

	output("\n\nFinished with the kui-tan, Kara gives the defeated, cum-stuffed doctor a little push. He groans and collapses, slipping into a state of sated unconsciousness.");

	output("\n\n<i>“That was too good for him,”</i> a few of the gold myr girls mumble, glowering at their erstwhile master. You silently gather your gear and leave Khan to his sleep.\n\n");

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
	else if (kara.isMischievous()) output("<i>“Couldn’t agree more, [pc.name],”</i> Kara answers, a mischievous twinkle in her eerie eyes. Slowly, she slips behind the prostrate kui-tan, tracing her fingers along his bare, thick fur as she goes.");
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
	
	output("\n\n<i>“That’s better,”</i> Kara coos, shifting her hand behind Khan. She rocks her hips back, dragging her spiny feline shaft down through the furry cleavage of Khan’s backside, out of sight and into the kui-tan’s crack. She lifts her hand out of the way, and thrusts her hips in hard against Khan’s upraised ass. He cries out, squealing almost girlishly as Kara hammers home into his boypussy. The tongue that was slavishly slithering through your sex falls still, stunned by the sudden penetration. Khan’s caged prick erupts in a geyser of white cream, cum spewing out of his otherwise average prick like a firehose.");

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
	if (kara.isNice() || kara.isMischievous()) output("<i>“We make a good team,”</i> Kara says with a wink, wiping her cock off of the kui-tan’s thigh.");
	else output("<i>“Not bad,”</i> Kara grunts, wiping her cock off on Khan’s furry thigh. <i>“Wouldn’t mind keeping a tight little hole like that around... willingly, of course.”</i>");

	output("\n\nFinished with the kui-tan, Kara gives the defeated, cum-stuffed doctor a little push. He groans and collapses, slipping into a state of sated unconsciousness.");
	
	output("\n\n<i>“That was too good for him,”</i> a few of the gold myr girls mumble, glowering at their erstwhile master. You silently gather your gear and leave Khan to his sleep.\n\n");

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
	if (pc.hasEquippedWeapon()) output(" and weapons");
	output(" and sliding the slim metal ring around your neck.");
	
	pc.removeAll();
	pc.createStatusEffect("Psi Slave Collar", 0.5, 0.05, 50, 0, false, "Radio", "This metal collar limits your intelligence capacity and willpower while worn, making you completely subservient to the will of the one who operates it.", false, 0, 0xFF0000);
	
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
	
	output("\n\n<i>“Eager, too,”</i> Master beams. <i>“What do you think of [pc.himHer] so far, dear?”</i>");

	output("\n\n<i>“So... so good,”</i> Kara moans, planting a hand atop your [pc.hair] and urging you on. You couldn’t resist her if you wanted - and God knows, you don’t want to. You eagerly swallow almost a foot of kittydick, going from the tip to kissing the base in the blink of an eye. Your companion purrs, her tails curling around to caress you as you fellate her. Your hands gravitate to her balls - though nowhere near as magnificent as your master’s, they’re still a nice, hefty handful. Compelled to show Master what you can do to a pair of nuts, you gently massage them, rolling her nads between your fingers. You can almost feel them churning, so full that you don’t think you’ll need to do much more than caress them to milk out all her sweet, salty seed. You give her the slightest squeeze and let your mouth finish her, bobbing on her cock until Kara makes a sweet little squeal and unleashes a torrent of seed into your mouth. You choke it down with ease, swallowing every drop the kaithrit girl can give you - you have to show the master that you can handle him, after all! You can only imagine how much cum he’ll grace you with when you finally prove your worth.");
	
	pc.loadInMouth(kara);
	kara.orgasm();

	output("\n\nKara whimpers and falls onto her back, her balls drained. You lick up the last trickles from your chin and turn to your master, eyes imploring.");
	
	output("\n\n<i>“Good job, pet,”</i> he says, giving you a smile that makes your heart soar as he pushes another button on his remote. <i>“Your friend seems quite satisfied with your work.”</i>");
	
	output("\n\nKara moans, rolling onto her belly and nuzzling her cheek against your [pc.leg]. <i>“Yes, master. Very.”</i>");
	
	output("\n\n<i>“Do you think [pc.heShe] deserves to join my darling girls here?”</i> he asks her, patting the heads of a pair of golden girls beside him. They mewl happily, leaning in against their master, caressing his sack. A couple of them move, shifting to make a spot for you among them - for you, and Kara. Your companion nods emphatically, and after a moment’s consideration, Master motions you over to him.");
	
	output("\n\nYou swell with pride as you are invited to sit at your master’s feet, and quickly find yourself snuggled up to the warm, soft swell of his mighty balls, your arms wrapped around your own personal expanse of kui-tan nuts. Master groans as you settle against him, a thick squirt of spunk drooling from his member to rain down upon you and your fellow harem sluts. You reach up and lick it up eagerly, competing with the other girls to get at the wonderfully rich, salty treat. Every drop you can get, you swallow greedily; the taste is utterly divine, better than the best candy you’ve ever tasted.");
	
	var tKhan:KQ2Khan = new KQ2Khan();
	pc.loadInMouth(tKhan);
	
	output("\n\nA small, soft hand plays across the top of your head. You look up, still licking, to see Master looking down upon you with a smile. <i>“Good... I think my keepers will be very pleased to see you. Like this, of course. You’ll be here forever, won’t you? No, I’ll not let a catch like you and your friend out of my grip, damn the pirates. You’re mine now, understand?”</i>");
	
	output("\n\nYou do. You understand, and thank Master for not letting anybody take you away from him. Not ever...");
	
	processTime(45 + rand(6));
	
	flags["KQ2_KARA_WITH_PC"] = undefined;
	
	CombatManager.genericLoss();
	
	badEnd();
}

public function kq2ShowShade():void
{
	if (flags["KQ2_KARA_WITH_PC"] == 1) showBust("KARA", "SHADE");
	else showBust("SHADE");

	author("Savin");

	showName("\nSHADE");
}

public function kq2EncounterShade():void
{
	clearOutput();
	kq2ShowShade();

	flags["KQ2_SHADE_ENCOUNTERED"] = 1;

	// Encounter Text (PC hasn't fucked Shade)
	if (flags["SEXED_SHADE"] == undefined)
	{
		output("As you and Kara rush toward the helipad, you hear a deep, metallic howl echo across the helipad. Kara draws her pistol and skids to a stop near the foot of the stairs leading up to the helipad. A huge, black drone stands at the top of the steps, canid in shape with razor-sharp teeth bared. Another drone peeks over the ledge beside it, and a third howls behind you, leaping up onto the top of the elevator cabin.");
		if (flags["TAKEN_TAMWOLF"] != undefined) output(" They’re like Tam-wolf’s big brothers!");
		
		output("\n\n<i>“That was a lucky break back at the bar,”</i> a familiar voice says, stepping up behind one of the wolf droids. Shade, the bounty hunter from the myrellion bar, steps into view, a lightning pistol resting on her shoulder. <i>“I guess you have your friend here to thank for that, don’t you, Kara? I think we both know things would have gone differently without "+ pc.mf("him", "her") +".”</i>");
		
		output("\n\nKara scowls, leveling her plasma caster at the other kaithrit. <i>“God </i>damn<i>, don’t you ever give up!?”</i>");
		
		output("\n\n<i>“Wouldn’t be much of a bounty hunter if I did,”</i> Shade laughs, whistling to her assault drones. They advance, lowering their heads and growling metallically. <i>“Now, why don’t you and your friend come quietly, hmm?");
		//if didn’t fight Shade: 
		if(flags["DISTRACTED_SHADE"] != undefined || flags["TRIPPED_ON_SHADE"] != undefined) output(" And </i>you<i>, [pc.name]... that was a dirty trick you pulled. Damned scummy... maybe I’ll beat some better manners into you.");
		output("”</i>");
		
		output("\n\nNot likely!");

		var tShade:Shade = new Shade();

		CombatManager.newGroundCombat();
		CombatManager.setFriendlyActors([pc, kara]);
		CombatManager.setHostileActors([tShade, new KQ2FenrisDrone(), new KQ2FenrisDrone(), new KQ2FenrisDrone()]);
		CombatManager.victoryCondition(CombatManager.SPECIFIC_TARGET_DEFEATED, tShade);
		CombatManager.victoryScene(kq2ShadePCVictory);
		CombatManager.lossScene(kq2CapturedByPiratesBadEnd);
		CombatManager.displayLocation("SHADE");

		clearMenu();
		addButton(0, "Fight!", CombatManager.beginCombat);
		return;
	}
	// Encounter Text: Fucked Shade
	else
	{
		output("As you and Kara rush toward the helipad");
		// This is cutteroni
		/*
		if ()
		{
			output(", followed quickly by");
			if () output(" your new harem of red myr");
			else output(" the group of freed red myr");
		}
		*/
		output(", you hear a deep, metallic howl echo across the helipad. Kara draws her pistol and skids to a stop near the foot of the stairs leading up to the helipad. A huge, black drone stands at the top of the steps, canid in shape with razor-sharp teeth bared. Another drone peeks over the ledge beside it, and a third howls behind you, leaping up onto the top of the elevator cabin.");
		if (flags["TAKEN_TAMWOLF"] != undefined) output(" They’re like Tam-wolf’s big brothers!");
		
		output("\n\nA woman steps up behind the drone atop the stairs, scratching it between the ears. She’s carrying a big, bulky hand-cannon resting on her shoulder, her other hand firmly planted on her hip.");
		
		output("\n\nIt’s Shade.");
		
		output("\n\n<i>Shit.</i>");
		
		output("\n\nThe buxom kaithrit looks down at you and your companion with a mix of contempt and disappointment written across her face. Her eyes settle on you. <i>“Well, this is the last place I ever hoped to run into you, kid,”</i> she says, slowly lowering her lightning gun. <i>“Last person with you, too.”</i>");
		
		output("\n\n<i>“");
		if (kara.isMischievous()) output("I see you brought friends this time... might actually be a fair fight now!");
		else
		{
			output("If you want a fight, Shade, come on. We’ll send you packing");
			if (flags["SHADE_DEFEATED_WITH_KARA"] != undefined) output(" again");
			output(" if we have to.");
		}
		output("”</i>");
		
		output("\n\nShade laughs, humorless, and holsters her gun. <i>“Relax, furball. I see you’ve got... precious cargo with you.”</i> With a sigh, Shade steps out of the way, whistling back her hounds. They whimper and retreat, slowly, never taking their eyes off you. <i>“Go on. Get.”</i>");
		
		output("\n\n<i>“W-what?”</i> Kara says, lowering her own weapon slightly.");
		
		output("\n\nThe huntress chuckles, waving towards the helipad. <i>“Don’t make me regret this... not that you’re likely to get through Amara anyway. Just thank [pc.name] if you do.”</i>");
		
		output("\n\nUncertainly, Kara moves past the other kaithrit, sprinting off towards the helipad. You follow suit, but Shade stops you at the top of the stairs, planting a firm hand on your chest.");
		
		output("\n\n<i>“I don’t like being played, kid,”</i> she whispers. <i>“Even if it was a damn </i>good<i> play. Assuming Amara doesn’t string you and your friend up, I’m gonna have words for you next time we talk.”</i>");
		
		output("\n\nYou nod understandingly and try to move by. She holds you in place for another moment, though: just long enough to plant a small kiss on your cheek. <i>“For luck. You’ll need it.”</i>");
		
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
	kq2ShowShade();

	output("With a grunt, Shade slumps down against the wall, clutching her wounds. Her gun clatters to the ground out of reach");

	var hostiles:Array = CombatManager.getHostileActors();
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
	
	output("\n\nKara lets out a short sigh and racks the charger on her pistol. <i>“What’re you waiting for? Let’s go!”</i>\n\n");

	flags["KQ2_SHADE_DEAD"] = 1;

	// [Next]
	CombatManager.genericVictory();
}

public function kq2ShadePCVictoryKaraNotHard():void
{
	clearOutput();
	kq2ShowShade();

	output("With a grunt, Shade slumps down against the wall, clutching her wounds. Her gun clatters to the ground out of reach");

	var hostiles:Array = CombatManager.getHostileActors();
	var numDronesAlive:int = 0;

	for (var i:int = 0; i < hostiles.length; i++)
	{
		if (hostiles is KQ2FenrisDrone && !hostiles[i].isDefeated()) numDronesAlive++;
	}

	if (numDronesAlive > 0)
	{
		output(", and the wolf drone");
		if (numDronesAlive > 1) output("s cease their attack, freezing in place as their master ceases to direct them");
		else output(" ceases its attack, freezing in place as its master ceases to direct it");
	}
	output(".");
	
	output("\n\n<i>“Ah, fuck,”</i> Shade groans, sitting back against the wall. <i>“I’m getting too old for this shit.”</i>");
	
	output("\n\n<i>“Stay down,”</i> Kara warns, racking the charger on her pistol. The huntress doesn’t challenge her threat, and Kara turns to you. <i>“C’mon, [pc.name], let’s go! We’re almost home free!”</i>\n\n");
	
	flags["KQ2_SHADE_UNCONSCIOUS"] = GetGameTimestamp();
	// Non-relatable/Friend Shade will turn hostile after this reveal and just go back home to Uveto.
	if(!shadeIsSiblings() && !shadeIsLover())
	{
		flags["SHADE_IS_HOSTILE"] = 1;
		flags["SHADE_ON_UVETO"] = 1;
	}

	CombatManager.genericVictory();
}

public function kq2CapturedByPiratesBadEnd():void
{
	clearOutput();
	author("Savin");

	//PC is brought before Amara Faell. She sends Kara off to be punished by Bragga, but decides to keep you for herself. PC gets one of Khan's collars put on, at the lowest setting -- get to keep your brain, but with heightened libido and no ability to resist commands. 
	//Play whenever the PC is knocked down by a non-Dr. Khan enemy.

	output("You stumble to the ground, too "+ (pc.HP() <= 0 ? "battered" : "aroused") +" to fight on. Your vision swims as your enemy advances, victorious. You can’t summon up the will to resist anymore, even as a solid weight slams into your face. The world goes black as your head snaps back, and you lose yourself to the darkness...");
	
	CombatManager.genericLoss();
	
	clearMenu();
	addButton(0, "Next", kq2CapturedByPiratesBadEndII);
}

public function kq2CapturedByPiratesBadEndII():void
{
	clearOutput();
	showBust("KARA", "AMARA");

	output("You awake to wind whipping against your [pc.face], and the roar of some mighty beast blasting into your ear. Your eyes blink open slowly, your vision blurred and reeling. Eveything’s fuzzy, but you immediately realize that you’re outside, high above the pirate compound. A glance tells you you’re on the roof, resting on your [pc.knees] next to a helipad. Your hands are tied behind your back, secured by a pair of nova-hot gravcuffs burning your [pc.skinFurScales]. Glancing to your side, you see the familiar ears and messy cobalt hair of your kaithrit companion, her head bowed low.");
	
	output("\n\nYou look up, and see the source of the deafening roar: a gunship sitting a few yards away, its engines blasting up a storm of sand and burning wind. The ship’s side doors stand open, giving you a look at several black-and-red clad men in armor, each with a machine pistol or shotgun at their sides. Between you and them, though, stands");
	if (flags["KQ2_LOST_TO_AMARA"] != undefined) output(" the pirate lord who brought you down");
	else output(" an ausar woman in black power armor, a head of bright orange hair whipping around her. A pirate lord of some kind, you imagine: this base’s commander");
	output(". She glowers at you and your companion with bright green eyes, a pair of blue-painted lips twisting into a scowl.");
	
	output("\n\nThe armored woman reaches down, grabbing Kara’s chin in her gauntleted fingers and forcing the defeated cat-girl to look up at her. Your companion moans, blinking through a black eye and a bloodied nose - looks like she’s suffered a much more thorough beating than you already.");
	
	output("\n\n<i>“I don’t know what’s worse:”</i> the pirate lord growls, <i>“That you were stupid enough to come knocking on my door... or that you were stupid enough to pick the wrong group of pirates.");
	if (flags["KQ2_NUKE_STARTED"] >= 0)
	{
		output(" And don’t worry about the self destruct. It’s been deactivated.");
		flags["KQ2_NUKE_STARTED"] = -1;
	}
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
	if (flags["KQ2_LOST_TO_AMARA"] == undefined) output("You’re not on her crew - I read their dossier. Some merc, then? ");
	output("I almost feel bad for you, getting duped into that whore’s suicide mission. Still, can’t have you wandering off, telling everyone what happened here. Or worse, trying to avenge your friend.”</i>");

	output("\n\nShe releases your hand with contemptuous force, making you sway precariously as she turns away from you. <i>“Gunship, head on home. I’ve got to secure things here.”</i>");
	
	output("\n\nYou look up in time to see the armored goons hopping into the ship’s bay around Kara and sliding the doors closed.");
	if (flags["KQ2_SHADE_DEAD"] == undefined) output(" That’s the last you’ll see of her, you know, your heart sinking.");
	output(" The gunship’s engines roar, and the black ships shudders into the sky, angling its bow to the heavens and blasting off. The pirate lord sighs and turns back to you, tucking her crash helmet under her arm. She tosses Kara’s pistol away, letting it clatter off the side of the roof and out of sight.");

	if (flags["KQ2_SHADE_DEAD"] != undefined)
	{
		output("\n\nTo your surprise, when the pirate looks back your way, here eyes are misty, and her lower lip’s trembling.");
		
		output("\n\n<i>“Fuck!”</i> she roars, pounding her armored fist into one of the nearby shuttles. The hull buckles, crunching as the pirate lord takes out her frustration on it. When she’s done, her chest is heaving and her cheeks are streaked with dark trails of ruddy eyeshadow.");
		
		output("\n\nYou flinch when she turns your way again, mentally bracing to start running for your life. You don’t want your face to look like the hood of that shuttle - which is to say, coming out your ass.");
		
		output("\n\nInstead of lashing out at you, though, the red-headed pirate’s shoulders just slump heavily. <i>“Gods damn it, Shade. You should have run, you stubborn old bitch.”</i>");
		
		output("\n\nHer eyes lock on you. <i>“I saw what happened. Was watching her Fenris’s HUDs while the shuttle came down. Glad I got the chance to smoke the whore that killed her,”</i> she growls, kicking Kara’s corpse. <i>“Lucky you, you didn’t pull the trigger or both your brains would be splattered all over this roof. As it stands, now I’ve got to go call my daughter and tell her her mom’s dead.”</i>");
	}
	
	output("\n\n<i>“So. There’s no bounty on you. And I’ll be honest: I’m impressed you got as far as you did. Not impressed enough to let you go, though. It’s too late for that.”</i> She takes a knee in front of you, looking you over with an appraising eye. You hazard a look up, into her green eyes, watching as she runs a black-armored thumb across her blue lips, thinking. After a long, tense moment, she taps an earpiece hidden in one of her jackal-like ears and says, <i>“X.O., go down and secure Khan. Get one of his collars up here for me.”</i>");

	output("\n\n");
	if (flags["KQ2_DEFEATED_KHAN"] != undefined) output("Oh, no.... ");
	output("You gulp with dread as the pirate smiles at you, releasing her comms. <i>“I’ll make you a deal, "+ pc.mf("handsome", "beautiful") +". I’m going to put a collar on you. A special collar. That means you belong to me, now. Understand?”</i>");

	output("\n\nYou nod, slowly, dread forming a knot in your stomach. What’s about to happen to you?");

	output("\n\n<i>“Be a good " + pc.catDog(pc.mf("boy", "girl"), "puppy", false) + ", and you won’t even notice it’s there. Unless I decide to play with it, that is. See, you’ve got some fire in you. That meek, beaten act doesn’t suit you... and it doesn’t fool me. You’ve seen some action and adventure, haven’t you?”</i>");

	output("\n\nYou nod again.");

	output("\n\n<i>“Good. I like that in my slaves. And make no mistake: that’s what you are now. Whether you submit and obey me, or decide you want me to </i>make<i> you obey... that’s up to you. Well, you and the collar.”</i>");
	
	output("\n\nAs if on cue, an elevator dings behind you, and another armored pirate appears beside you, holding out a simple metal collar to the red-maned ausar. She nods to you, and a moment later, you feel the cold, unforgiving kiss of cold steel closing around your neck. Rough, armored hands grab at your [pc.hair], pushing your head down as the pirate affixes the collar to you. You gasp for breath, clawing at the sudden tightness around your neck - it’s not hard to breathe, really, but it digs hard into you nonetheless.");
	
	output("\n\n<i>“Looks good on you,”</i> your new owner smirks, giving her subordinate a rough clap on the shoulder to send him on his way. She reaches down after that, grabbing the back on your collar and flicking a button. The moment she does, you feel a thrum of energy pass through your neck, and something warm press against your spine.");
	
	pc.createStatusEffect("Psi Slave Collar", 0.75, 0.50, 25, 0, false, "Radio", "This metal collar limits your intelligence capacity and willpower while worn, making you completely subservient to the will of the one who operates it.", false, 0, 0xFF0000);
	
	output("\n\n<i>“This is the lowest setting,”</i> she explains, drawing her hand up from the collar and across your [pc.hair], gently pushing your head down. As she does, you feel a shudder pass through you, followed by a spreading heat from your back, slowly crawling through your body. <i>“Doctor Khan’s work is truly remarkable, in its perverse way. Stand up.”</i>");

	output("\n\nBefore you can even think, you’re leaping to your [pc.feet]");
	if (pc.tailCount > 0) output(" with your tail wagging");
	output(". The heat that’s spreading through you only intensifies, and you suddenly feel a rush of it surging through your [pc.crotch]. You groan, biting your lip as the unexpected sensation washes over you. What the...");
	
	output("\n\n<i>“Strip,”</i> she commands. You do so, slowly pulling your gear off. The wind whips hotly around you, scouring your [pc.skinFurScales]. It takes a moment for you to realize what you’ve done - that you offered no resistance, no hesitation.");
	
	pc.removeClothes();
	
	output("\n\nThe pirate woman smiles. Her eyes slink across your bare body, across skin and "+ pc.rawmf("rigid lines", "soft curves") +", down to your [pc.butt] and your crotch. You’re");
	if (pc.hasCock()) output(" half-hard already, the heat pulsating through your member in rhythmic waves of pleasure.");
	else if (pc.hasVagina()) output(" drooling already, staining your thighs with feminine excitement. The heat radiating through your body seems to center on your quim, burning your body.");
	else output(" The heat in your body seems to coalesce in your bare groin, forming an intense ball of pointless pleasure.");
	output(" You feel amazing, like any touch would send you over the edge. And the pirate knows it.");
	
	pc.lust(50);

	output("\n\n<i>“Touch yourself,”</i> she commands, smiling as you immediately obey, running a hand down your groin");
	if (pc.hasCock()) output(" and caressing your [pc.cock]");
	output(". <i>“Good "+ pc.mf("boy", "girl") +". Looks like the collar’s working. Now let me tell you how this is going to work: on the lowest setting - the one I think you need - the collar makes you obedient. Easy to influence, eager to please. Khan says the marked rise in libido is a... how did he phrase it... a ‘happy accident,’ that keeps captives nice and mollified. I think he did it on purpose. It certainly made sure he had a nice little harem of test subjects all too eager to worship his fat, disgusting sack.”</i>");

	output("\n\nShe manages a slight grin, still watching you mindlessly masturbate. The thought of stopping never crosses your mind. <i>“Don’t worry, I won’t make you worship mine,”</i> she murmurs, running a finger along your chin. <i>“Now, let’s get you inside and cleaned up. You’ve got a lot of adjustment to do.");

	output("\n\n<i>“And don’t even think about stopping. Not that you could, anyway,”</i> your new owner smirks, hooking a finger through a loop on your collar and dragging you into the base.");

	processTime(45 + rand(6));
	
	flags["KQ2_KARA_WITH_PC"] = undefined;
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
		var tEnemy:Creature = CombatManager.getHostileActors()[0];
		tEnemy.inventory.push(new AegisLightMG());

		output(" stow the weapon");
	}
	else output(" drop the unwanted weapon");
	output(" and follow Kara into the elevator car. She punches the <i>“close”</i> button, though the doors end up just bouncing off the juggernaut’s chest, squeezing him between them. With a sigh, Kara drags his body out of the way, and the doors close.");
	
	output("\n\n<i>“Alright. Up to the roof we go, [pc.name].”</i>\n\n");

	CombatManager.genericVictory();
}

public function kq2ShowAmara():void
{
	if (flags["KQ2_KARA_WITH_PC"] == 1) showBust("KARA", "AMARA");
	else showBust("AMARA");

	author("Savin")
}

public function kq2EncounterAmara():void
{
	clearOutput();
	kq2ShowAmara();

	output("You’re almost there! The helipad awaits you at the top of the stairs");
	if (flags["KQ2_SHADE_ENCOUNTERED"] != undefined)
	{
		output(", past Shade’s");
		if (flags["KQ2_SHADE_DEAD"] != undefined) output(" smouldering corpse")
		else if (flags["SEXED_SHADE"] != undefined) output(" aborted ambush"); // Fucked Shade- you don't fight her so
		else output(" failed ambush");
	}
	output(". Several small shuttles are parked along the edge of the roof, making way for a single huge gunship bristling with weapons and armored plates. Its engines are roaring, sending hot air blasting back against your face.");
	
	output("\n\nSeveral pirates in heavy armor are standing beside the open door of the gunship, their weapons trained at you. The moment you’re in sight, a half dozen red lasers flicker onto your chest, dancing over you with silent menace.");
	
	output("\n\n<i>“You got past");
	if (flags["KQ2_SHADE_ENCOUNTERED"] != undefined) output(" Shade. Twice,");
	else output(" a whole lot of pirates to get here,");
	output("”</i> a voice echoes across the landing pad, amplified as if through a megaphone. The gunship shifts, rocking from side to side until a single humanoid figure comes into sight, wearing armor that makes even the Juggernaut you fought before look skimpy by comparison - an ape-like suit of powered armor heavy enough to rock the boat as its owner steps off. <i>“Impressive. I’d be offering you a job if I didn’t owe you an ass-kicking for it,”</i> the warrior says, flicking up the suit’s faceplate.");
	
	output("\n\nBeneath the armor is an ausar woman whose fiery orange ears poke out the moment her helmet lifts. Her blue-painted lips twist into a scowl as she tucks her helm under an arm, and hefts her massive chaingun with the other.");
	
	output("\n\n<i>“Shit,”</i> Kara whispers. <i>“Amara Faell. She’s one of the biggest bads in the Void... but not the one I was expecting. Watch out.”</i>");
	
	output("\n\nShe strides forward, eyeing you and Kara. <i>“So. You shot your ways through my entire compound, you broke into a datavault guarded by the most insufferable kui-tan I’ve ever met, and my first mate’s vitals are flatlining. You, I understand being here,”</i> she says, pointing to Kara. <i>“Bragga’s got a murder-boner on for you I can see from here.”</i>");
	
	output("\n\nTurning to you, she continues. <i>“But you... who the </i>fuck<i> are you? You’re not on Volke’s crew, and you’re not on any of our bounty lists. You don’t strike me as just some hired gun the kitten here rolled out of a gutter. So what the hell are you doing here, kid?”</i>");

	//[Money] [Help Kara] [Fuck Pirates] [Stay Silent]
	clearMenu();
	addButton(0, "Money", kq2EncounterAmaraMoney, undefined, "For The Money", "Say that you’re here for the money. Like she said, just a hired gun.");
	addButton(1, "HelpKara", kq2EncounterAmaraKara, undefined, "For Kara", "Say that you came here to help a friend.");
	addButton(2, "FuckPirates", kq2EncounterAmaraFuckPirates, undefined, "Fuck Pirates", "You’re just here to fuck up some pirates!");
	addButton(3, "Silence", kq2EncounterAmaraSilent, undefined, "Stay Silent", "Don’t answer her question.");
}

public function kq2EncounterAmaraMoney():void
{
	clearOutput();
	showKara();

	//+Hardness
	pc.addHard(5);

	output("<i>“Hey, I’m just here for the money,”</i> you shrug.");

	output("\n\nThe pirate leader laughs at that, throwing her head back. <i>“Fuck. You would be, wouldn’t you?");
	if (flags["KQ2_SHADE_DEAD"] != undefined)
	{
		output("”</i>");
		//[Fight]

		clearMenu();
		addButton(0, "Fight!", kq2FightAmara);
	}
	else
	{
		output(" Tell you what, kid, I’ll double whatever the kitten’s paying you to step aside. One of the other Dread Lords wants her head, but there’s no reason for you to get fucked, too.”</i>");

		output("\n\n<i>“[pc.name]...”</i> Kara says, eyeing you. <i>“Come on. We’re almost out of here... we can take her.”</i>");

		clearMenu();
		addButton(0, "Betray", kq2AmaraBetrayKara, undefined, "Betray Kara", "Fuck it. Money’s money. Accept the pirate’s offer and turn on your partner.");
		addButton(1, "Refuse", kq2AmaraRefuseOffer, undefined, "Refuse", "Money or no, you’ve got honor. Stay with Kara, and fight the pirates.")
	}
}

public function kq2AmaraBetrayKara():void
{
	clearOutput();
	kq2ShowAmara();

	pc.credits += 60000;
	pc.addHard(20);

	output("<i>“Sorry, Kara,”</i> you say, taking a big step away from her and swinging your [pc.mainWeapon] from the ausar to the kaithrit.");
	
	output("\n\n<i>“Good choice,”</i> the pirate leader answers, motioning to her minions. Kara curses and throws her weapon down, now that a dozen target lasers are trained on her. The pirate soldiers rush forward, tackling Kara to the deck and tying her up. After a minute, they’ve got her handcuffed and gagged, and drag her onto the gunship. She glowers at you, spitting curses through the gag until the ship’s doors close behind her.");
	
	output("\n\nThe pirate leader, Amara, scoffs and shakes her head. <i>“Stupid bitch. That’s what you get for crossing the Void and washing up on our doorstep. What the hell did she think she was gonna find here. Hmpf. You on the other hand... bad ass enough to get through the base, smart enough to not get yourself killed.”</i>");

	output("\n\nAs Kara’s dragged away, you haggle out your price from the pirate. When you check your Codex, you find your account 60,000 credits richer.");
	if (flags["KQ2_CREDS_FIRST"] != undefined) output(" Hell of a deal, considering Kara gave you a chunk ahead of time.");
	output(" True to her word, Amara gives you a shuttle back to the D.M.Z., programming it to take you there and come back empty.");

	output("\n\nYou pocket your Codex and admit, you’re surprised they’re letting this go so easily.");

	output("\n\nAmara shrugs");
	if (flags["KQ2_NUKE_STARTED"] >= 0)
	{
		output(", as she sends some of her goons down to deactivate the self-destruct");
		flags["KQ2_NUKE_STARTED"] = -1;
	}
	output(". <i>“Like I said, you seem like a badass, and I didn’t come back dirt-side for a fight. Just to catch the kitten there for Lord Bragga. No reward for fighting you, except personal satisfaction. And Watson says you gave Khan a swift kick in the nuts, so what the hell. That earns you enough credit with me to get out of here. So go on. Just keep your mouth shut, or you’re dead. Though that goes without saying.”</i>");

	output("\n\nYou guess you can’t argue with that. You give the gunship one last look before hopping into one of the smaller shuttles and letting it take you back the D.M.Z., much richer for your efforts. From there’s it’s one short hitchhike back to the smuggler’s base and your own ship.");

	output("\n\nYou relax in your captain’s chair a little later, wondering what you could buy with all this money...");

	//Return PC to ship.
	flags["KQ2_KARA_WITH_PC"] = undefined;
	flags["KQ2_BETRAYED_KARA"] = 1;
	flags["KQ2_QUEST_FINISHED"] = 2;
	currentLocation = "SHIP INTERIOR";
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function kq2AmaraRefuseOffer():void
{
	clearOutput();
	kq2ShowAmara();

	output("<i>“I don’t think so,”</i> you say, keeping your [pc.weapon] trained on the pirate.");
	
	output("\n\nThe pirate scoffs, hefting up her chaingun. <i>“Suit yourself, kid. Your funeral.”</i>");

	// [Fight]
	clearMenu();
	addButton(0, "Fight!", kq2FightAmara);
}

public function kq2EncounterAmaraKara():void
{
	clearOutput();
	kq2ShowAmara();

	pc.addNice(5);

	flags["KQ2_CAME_TO_HELP_KARA"] = 1;

	output("<i>“I’m just here to help a friend,”</i> you answer, giving a slight nod to Kara. She smiles, her twin tails curling behind her");
	if (pc.kaithritScore() >= 3 || (pc.tailCount >= 1 && pc.tailType == GLOBAL.TYPE_FELINE)) output(" in a way your feline senses tell you means approval, and thanks");
	output(".");
	
	output("\n\n<i>“Huh,”</i> the pirate snorts, hefting her chaingun. <i>“I didn’t take you for a White Knight. Then again, I guess the damsel in distress routine is damn hard to resist, isn’t it? Well, I hope it was worth it, kid. She must be a dame to kill for.”</i>");
	
	output("\n\n<i>“We’ve got this, [pc.name],”</i> Kara says, standing a bit closer beside you as you get ready to throw down.");

	// [Fight]
	clearMenu();
	addButton(0, "Fight!", kq2FightAmara);
}

public function kq2EncounterAmaraFuckPirates():void
{
	clearOutput();
	kq2ShowAmara();

	pc.addMischievous(5);

	flags["KQ2_CAME_TO_FUCK_UP_PIRATES"] = 1;

	output("<i>“I’m just here");
	if (pc.isMischievous()) output(" to kick ass and chew bubblegum. And I’m all out of gum");
	else output(" to fuck up some pirates");
	output(".”</i>");

	output("\n\nThe pirate leader laughs derisively, hefting her chaingun up. The soldiers behind her spread out, ready to fire.");

	output("\n\nTime to finish this!");

	clearMenu();
	addButton(0, "Fight!", kq2FightAmara);
}

public function kq2EncounterAmaraSilent():void
{
	clearOutput();
	kq2ShowAmara();

	output("After a moment of silence, the pirate leader scowls and hefts her chaingun up. <i>“The strong, silent type, huh? Well, let’s see if you can scream!”</i>");

	clearMenu();
	addButton(0, "Fight!", kq2FightAmara);
}

public function kq2FightAmara():void
{
	var h:Array = [new KQ2Amara(), new KQ2BlackVoidGrunt(), new KQ2BlackVoidGrunt(), new KQ2BlackVoidGrunt()];

	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors([pc, kara]);
	CombatManager.setHostileActors(h);
	CombatManager.victoryCondition(CombatManager.SPECIFIC_TARGET_DEFEATED, h[0]);
	CombatManager.displayLocation("AMARA");
	CombatManager.victoryScene(kq2AmaraPCVictory);
	CombatManager.lossScene(kq2AmaraPCDefeat);
	CombatManager.beginCombat();
}

public function kq2AmaraPCVictory():void
{
	clearOutput();
	kq2ShowAmara();

	flags["KQ2_QUEST_FINISHED"] = 1;

	output("<i>“Shit,”</i> Amara grunts, rubbing a trickle of blood from her blue lip. <i>“You’re good... I’ll give you that. But you gotta know there’s an army of Void soldiers gonna come down on your heads even if you manage to kill me. And I’m not done yet...”</i>");
	
	output("\n\n<i>“Yeah. You are,”</i> Kara growls, leveling her gun at the pirate’s chest and firing. The bolt of plasma bursts across the hardened armor, sizzling and burning. She squeezes the trigger again, and again, sending shots of plasma exploding over Amara’s suit in a string of concussive booms. The pirate lord stumbles back under the assault, back and back until she’s teetering on the edge of the roof.");
	
	output("\n\nAmara manages to lock eyes with Kara, growling <i>“You’re a dead woman, either way,”</i> before Kara pulls the trigger. With an echoing boom, another blast of plasma washes over the pirate lord, and she tumbles off the ledge and out of sight amidst a shimmering green mist.");
	
	output("\n\nThe remaining pirates look between you, Kara, and the space where their leader stood a moment ago and turn tail... right into the open doors of the gunship.");
	
	output("\n\n<i>“Oh, shit,”</i> Kara groans, turning back to you. <i>“We gotta go. Now!”</i>");
	
	output("\n\nYou nod and run to the nearest of the small shuttles, popping the door and leaping in. Kara takes the pilot’s seat, making quick work of hotwiring it as the gunship behind you slowly rises up off the landing pad. You can hear the weapons charging, the distinctive whine of lasers powering up and chainguns whirring. Slowly but surely, the gunship turns to face you - just as Kara gets the shuttle off the ground. It lurches forward just as the gunship fires, lasers and bullets slamming into the pad where you’d been sitting moments ago.");

	output("\n\n<i>“");
	if (kara.isNice()) output("Hold on tight, [pc.name]!");
	else if (kara.isMischievous()) output("Buckle up!");
	else output("Fuck it, we’re out of here!");
	output("”</i> Kara shouts, punching the accelerator and launching the shuttle up into the air, and away from the pirate compound.");

	output("\n\nAt the apex of your rise, Kara angles the shuttle back down towards the plateau you first landed on, diving down into the canyons and trenches with the gunship hard on your tail. You grab the dashboard as lasers impact your navigation shields, making it feel like an earthquake’s rattling through the deck.");

	output("\n\n<i>“Shiiiit!”</i> Kara yells, grabbing her comms. <i>“Logan! We’re in the shit - pull us out!”</i>");

	output("\n\nYou hear a beep come back over the commlink, just before everything’s drowned out by the roar of one of your engines exploding. You’re thrown forward by the impact, and the sudden rush of gravity as the shuttlecraft nose-dives towards the earth. You watch with wide eyes as the barren, red earth of Myrellion rushes up towards the viewscreen!");

	output("\n\nSomething hits the back of the shuttle again. Hard. A second before you hit the ground, your stomach lurches, and you’re hit with what feels like ten G’s as the shuttle suddenly jerks backward, hurling itself into the air like it had hit an invisible trampoline! You hear a volley of heavy weapons fire overhead, followed by Kara’s comms blaring with Logan’s voice. <i>“Gotcha!”</i>");

	output("\n\nThe shuttle flies backwards over a huge orange fireball, debris rattling your hull: the remnants of the pirate gunship, going down in a fiery blaze. The modded-out pilot gives a roaring cheer over the radio, and you find yourself letting out a long breath and slumping back in your seat.");

	output("\n\nLooks like you’re home free.");
	// Nuke due to explode within 30 minutes
	if (flags["KQ2_NUKE_STARTED"] >= 0)
	{
		output(" And just in time: you cover your eyes as a nuke goes off in the caldera, a flash of light followed by a shockwave that makes your teeth ache. Luckily, the re-activated shields protect you from harm.");
		flags["KQ2_NUKE_EXPLODED"] = 1;
		if(shipLocation == "600") shipLocation = "SPACE";
	}

	// This should work, because we know we're not gonna be looting anything...
	output("\n\n");
	CombatManager.genericVictory();
	
	clearMenu();
	addButton(0, "Next", kq2AmaraPCVictoryII);
}

public function kq2AmaraPCVictoryII():void
{
	clearOutput();
	showKara();

	clearMenu();
	userInterface.hideNPCStats();
	userInterface.leftBarDefaults();
	
	var creditAmount:int;
	if (flags["KQ2_CREDS_FIRST"] == 1) creditAmount = 15000;
	else creditAmount = 30000;
	
	output("An hour later, you ditch the shuttle next to a parked <i>Ghost</i>.");
	if (flags["SILENCE_RESCUED_CONNIE"] != undefined)
	{
		output(" Connie is waiting for you next to a lowering cargo ramp, allowing you and your companion aboard");
	}
	else
	{
		output(" Kara beeps a key fob on her belt, and the cargo ramp comes down a moment later, allowing you and your companion to embark");
	}
	output(". After that, it’s a relatively quick and blessedly peaceful trip out of orbit and back to the smuggler’s base. Back to where you started your adventure.");
	
	output("\n\nKara gets out with a heavy sigh as you dock, folding her rifle back into itself and packing her gear away in its case. Her movements are slow, lethargic. Tired.");
	
	output("\n\n<i>“What a waste,”</i> she groans, rubbing her temples. <i>“All of that for nothing. That bastard A.I. had our number from the start.”</i>");
	
	output("\n\nYou put a hand on Kara’s shoulder, and she forces a slight smile for you. <i>“That tech they were working on is terrifying.");
	if (kara.isNice()) output(" Putting a stop to it... that’s even more important that the price they’ve got on my head, now.");
	else if (kara.isMischievous()) output(" One more reason to fuck the bastards over, though.");
	else output(" I’m going to put a stop to them. One way or another.");
	output("”</i>")
	
	output("\n\n<i>“Anyway. I think I owe you a reward,”</i> she says with a weary smile, stepping up to you and pulling a credit chit out of her cleavage. <i>“" + creditAmount +" credits, as we agreed on.”</i>");
	pc.credits += creditAmount;
	
	output("\n\nYou swipe the chit through your Codex. It’s all there, just like she promised. You set the tablet aside and give Kara an approving nod, walking with her from the bridge down to the airlock. You’re alone for the moment, save for the <i>Ghost</i>’s captain.");
	
	output("\n\n<i>“So,”</i> Kara says after a moment, just as you were turning to leave. She’s leaning against the bulkhead beside the airlock, one leg over the other, tails swishing slowly behind her - playfully, inviting. <i>“I don’t really have anywhere to be for a couple of hours.");
	if (kara.isNice()) output(" The data can wait, if you’d like to... you know. Stay for a while.");
	else if (kara.isMischievous()) output(" I don’t know about you, but the whole harrowing adventure and balls-to-the-walls danger thing really gets me in the mood. Heh. So, what do you say, [pc.name]? Think you can handle a little overtime?");
	else output(" And you know the old saying: best thing after a good fight is a good fuck, right? So how about it?");
	output("”</i>");
	
	output("\n\nShe gives you a wink, but the kaithrit’s stance - the heavy breaths, the wiggling tails, the thrust-out chest - all tell you she’s dead serious.");

	//[Fuck Kara]
	//Take Kara up on her offer, and take her to bed.
	clearMenu();
	addButton(0, "Fuck Kara", kq2KaraSexytimes, undefined, "Fuck Kara", "Take Kara up on her offer, and take her to bed."); //Go to Kara Sex Intro
	addButton(1, "No Thanks", kq2KaraNoSexPls, undefined, "No Thanks", "Turn Kara down on the sex.")
}

public function kq2KaraNoSexPls():void
{
	clearOutput();
	showKara();

	output("You gently let Kara down on that idea, but she takes it in stride. <i>“Yeah. Sure. No problem,”</i> she laughs, rubbing the back of her neck. <i>“Anyway, I should head out. Find a bar somewhere. Could use a drink to calm down, if nothing else. See you around, [pc.name].”</i>");

	output("\n\nShe gives you a surprisingly firm handshake before she cycles the airlock and lets you leave, waving farewell as you depart.");

	flags["KQ2_KARA_WITH_PC"] = undefined;

	currentLocation = "SHIP INTERIOR";

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function kq2AmaraPCDefeat():void
{
	flags["KQ2_LOST_TO_AMARA"] = 1;
	// PC didn't say they didn't trust Kara
	if ((flags["KQ2_CREDS_FIRST"] == undefined && flags["KQ2_SEX_PAY"] == undefined) || flags["KQ2_CAME_TO_HELP_KARA"] != undefined)
	{
		kq2AmaraSpecialEnd();
	}
	else
	{
		kq2CapturedByPiratesBadEnd();
	}
}

public function kq2AmaraSpecialEnd():void
{
	clearOutput();
	kq2ShowAmara();

	output("The pirates are just too much for you. Their leader, Amara, fights like a tank, and packs more firepower than all her goons combined. Kara grunts beside you, collapsed on the deck and clutching her belly. Blood runs out between her fingers, drooling in thick rivulets to splatter on the concrete.");
	
	output("\n\nThe pirate lord hefts her chaingun up onto her shoulder and strides toward you, a great big grin on her blue-painted lips. <i>“Well. Bragga’s gonna be </i>pissed<i> I kicked your shit in for her, kitten,”</i> she laughs, grabbing Kara by the collar and heaving her up off the ground.");
	if (flags["KQ2_SHADE_DEAD"] != undefined) output(" <i>“Then again, after what you did to Shade, maybe I should just kill you myself, huh?");
	else output(" <i>“I wonder what she’s gonna do to you... nothing pretty, I’m sure.");
	output("”</i>");
	
	output("\n\n<i>“Fuck you,”</i> Kara grunts, locking eyes with the pirate lord.");
	
	output("\n\nAmara only laughs at the kaithrit’s resilience and turns to you. <i>“Take [pc.himHer] down to Khan. Tell the doctor to prep a collar. Might as well put the little ass-kicker to good use.”</i>");
	
	output("\n\n<i>“Aye, captain,”</i> a few of the goons grunt in unison, grabbing your arms and hefting you up. You look over your shoulder, groaning weakly as you’re dragged away from Kara.");
	
	output("\n\nSuddenly, you hear a shrill beeping sound from behind you. The guards stop, looking back just in time to see Kara grinning like a maniac, a small silver orb in her hand.");
	
	output("\n\nShe screams, <i>“Run, [pc.name]!”</i> and smashes the orb into Amara’s unexpecting face. You’re thrown down by a concussive blast wave and a rush of heat");
	if (!pc.isBald()) output(" that scorches your hair");
	output(", leaving you flat on your face. Your ears ring painfully, making it a force of effort to stagger up. The guards lie on the ground - looks like they took the brunt of the blast. There’s nothing where Kara and Amara had been. Nothing but a scorch mark on the ground and bits of burning debris.");
	
	output("\n\nYou scramble up and make a break for it while the pirates are still down, and well away from their gunship. The door of the nearest shuttle pops open when you run up to it, and you find the keys waiting for you in the ignition; you try to turn them, but find your hands shaking, covered with dirt and grime and bits of... oh <i>god</i>.");
	
	output("\n\nYou manage to get the engine started and punch it back towards... something. The DMZ! Civilization! Nothing follows you, nothing tries to stop you. You’re not sure there’s anything, or any<i>one</i> left to.");
	// Nuke due to explode within 30 minutes
	if (flags["KQ2_NUKE_STARTED"] >= 0)
	{
		output(" Especially after the nuke goes off, flashing in the distance in your rear mirror.");
		flags["KQ2_NUKE_EXPLODED"] = 1;
		if(shipLocation == "600") shipLocation = "SPACE";
	}
	
	output("\n\nThe trip back to the DMZ is quiet. You try not to think, just letting your body go on autopilot as you cruise back to the familiar strip of tarmac in the desert wastes. It’s not hard to find a spacer to hitch-hike with back to the smuggler’s base, though in your state, you get more than few odd glances until you do.");
	
	output("\n\nA few hours later, you’re aboard your ship, finally letting yourself relax as the airlock cycles behind you.");
	if (annoIsCrew() && reahaIsCrew()) output(" Anno and Reaha both come");
	else if (annoIsCrew() && !reahaIsCrew()) output(" Anno comes");
	else if (!annoIsCrew() && reahaIsCrew()) output(" Reaha comes");
	if (annoIsCrew() || reahaIsCrew()) output(" to ask how it went and where the other ship is. You don’t have anything to say, but that silence speaks volumes.");
	output("...\n\n");
	
	//Return PC to ship. No reward, no harem, no nothing. Dump all Lust built up.
	pc.lustRaw = 0;
	flags["KQ2_KARA_WITH_PC"] = undefined;
	flags["KQ2_KARA_SACRIFICE"] = 1;
	flags["KQ2_QUEST_FINISHED"] = 2;
	currentLocation = "SHIP INTERIOR";
	
	CombatManager.genericLoss();
}

public function kq2KaraSexytimes():void
{
	clearOutput();
	showKara(true);

	output("Kara’s offering, and you’ve had your eyes on this pretty kitty since the moment you laid eyes on her. There’s no more fitting reward for all your selfless help than to take her up on her offer, and see what this sly cat’s got under that sleek suit of hers. You can’t wait.");
	
	output("\n\nKara smiles as you accept her offer, reaching over to take your hand. <i>“I was hoping you’d say that. Why don’t we head back to my quarters...”</i>");
	
	output("\n\nShe gives you a pull down the corridor, and a moment later, the two of you are stumbling through the hatch to the captain’s quarters.");
	if (pc.tallness >= 60 || pc.isTaur()) output(" Kara’s lept up into your arms, her legs wrapped around your [pc.hips] and lips exploring every inch of your [pc.face]. Your hands sink into her ass, groping at a lush, perfect behind just barely held back by the tight near-latex of her catsuit. You can feel her stiffening kitty-cock pressing against your belly.");
	else output(" Kara’s picked you up, slamming your back into her door while she fumbles for the controls. You distract her with kisses, groping her her tits through her skin-tight suit, sinking your fingers into those big, bouncy mounds until your lover’s moaning, tails wiggling uncontrollably behind her. Finally, she gets the hatch open, and the two of you stagger in.");

	output("\n\nYou have just enough time to blink before your back is slamming down on a feather-soft bed surrounded by sterile grey walls and discarded clothing. Your [pc.gear] is all gone, torn aside by the lusty kaithrit’s eager claws. Kara straddles you, diving down to lick from your [pc.belly] to your [pc.breast], ending with her lips around your [pc.nipple]");
	if (pc.isLactating()) output(", sucking just hard enough to draw a little trickle of [pc.milk]");
	else output(" and circling it with her tongue");
	output(". She comes up with a husky sigh, grabbing the zipper on the neck of her catsuit and pulling it down, tantalizingly slow.");

	output("\n\nYou can’t wait until the cat-girl finishes her show, and lean up to grab the zipper’s tab between your teeth, pulling down down in one rough yank that frees her breasts from the suit’s tight embrace. They’re even more gorgeous than you’d hope, two perfectly sculpted mounds of feline flesh, each tipped with a pale pink teat that’s been pierced by a little silver bar. From where you are already, it’s impossible not to dig your face in between them, nuzzling into Kara’s supple cleavage. She giggles and moans, wrapping her arms around you and letting her eyes sink closed.");

	output("\n\nWhile you’re busy enjoying her rack, Kara peels her suit off her shoulders, down around her waist. Your hands are already firmly planted on the kitty’s tush, and after one last moan-inducing squeeze, you reach up to grab the latex scrunched up around her flared hips. You peel it down, freeing her pert behind... and letting a hot, heavy rod of meat flop onto your belly, followed by a pair of meaty weights that brush against your");
	if (pc.hasCock()) output(" own cock");
	else output(" groin");
	output(".");

	if (pc.isMischievous()) output("\n\nSomebody’s happy to see you!");
	else if (pc.hasCock()) output("\n\nLooks like you’re not the only one thinking about getting your dick wet...");

	output("\n\nKara gives a wiggle of her hips, letting you pull her suit off of her long legs, leaving her just as bare as you are. One of her hands reaches down, caressing her cock in one, and keeping your face pinned between her breasts with the other.");
	if (pc.hasCock()) output(" She hesitates for a moment after that, though: a silent offer to let you decide who’s fucking who...");

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

public function kq2KaraTakeKittydick():void
{
	clearOutput();
	showKara(true);

	output("Every little motion of your love causes her lengthy cat-cock to rub against your [pc.belly], letting you feel the ring of feline nubs circling her slender cockhead. The thought of them inside you, stirring up your insides, is enough to make");
	if (!pc.hasVagina()) output(" your ass yearn for her touch");
	else output(" your [pc.cunt] drool in anticipation");
	output(". Your hands play down your lover’s body, from her flared hips to her firm ass and around to the meaty handfuls hanging between her legs. Kara gasps, arching her back as you roll her balls between your fingers, gently squeezing and massaging them. You can feel the fullness in the warm, fleshy orbs; the way they churn with cum, so full you can almost feel her balls sloshing as you cup them. Kara pulls you deeper into the soft embrace of her hefty cleavage, purring softly into your [pc.ear] as you play with her nads.");
	
	output("\n\nTrapped between your two bodies, her cock throbs to the beat of your lover’s racing heart, smearing your [pc.belly] with a musky dose of her excitement.");
	if (pc.hasTailCock()) output(" Responding with its own growing arousal, your [pc.cockTail] slithers around your [pc.leg], slipping up towards Kara’s defenseless rear. She gasps, eyes going wide as you feel your cock-tipped tail slip into something warm and wet. Doesn’t look like Kara minds, though, and after a moment to recover, she wiggles her hips and starts to move.");
	output(" Giving you a husky purr, your lover laces her hands around your shoulders and gives you a push down.");
	
	output("\n\nSuddenly freed from her boobalicious embrace, you’re left flat on your back as the amorous cat-girl crawls back, her slitted eyes drawing down to your [pc.vagOrAss]. <i>“You helped me out so much,”</i> she murmurs, tracing a finger along your bare thigh, slipping her hand towards your hole. <i>“Now it’s my turn.");
	if (kara.isNice()) output(" I want to make this a night for you to remember.");
	else if (kara.isMischievous()) output(" Just lie back and let me show you my gratitude...");
	else output(" I’m gonna make this [pc.vagOrAss] mine!");
	output("”</i>");
	
	output("\n\nKara punctuates her declaration by hooking her hands under your [pc.butt] and lifting up, folding you in on yourself until your ass is in the air and");
	if (pc.isBiped()) output(" your knees are near your ears");
	else output(" your [pc.legs] are out of the way");
	output(", leaving your [pc.vagOrAss] presented for Kara’s inspection. She licks her lips and dives in without a second thought, running her soft tongue across your hole with unabashed eagerness. You gasp, body clenching at the sudden touch, but another two or three hungry licks have you moaning and digging your fingers into the sheets.");
	if (pc.hasVagina()) output(" Not surprisingly, this pussy-cat knows how to eat pussy!");
	output(" Kara’s tongue circles your hole, teasing, never quite touching your entrance for what feels like tantalizing minutes.");
	if (pc.hasTailCock()) output(" Between her mouth and the feeling of her pussy clenching around your thrusting tail, she has you on edge before you can blink!");
	output(" She teases you until you can’t take it anymore, waiting until the last strands of your nerve threaten to snap before she finally hooks her thumbs in and spreads you wide, revealing the dark passage before her. She looks up, gives you a wink, and thrusts her tongue in.");

	output("\n\nYou gasp with pleasure, feeling her tongue slurp around your inner walls. Reacting on instinct, your body clamps down on the invading muscle, trying to push her back. All you manage to do is wrap yourself around her tongue, making sure she’s able to tease every inch of your [pc.vagOrAss]. Kara’s hands sink into your [pc.butt], groping at your backside while she slathers your hole as deep as she can reach.");
	if (pc.hasTailCock()) output(" As she does, your [pc.tailCock] squirms inside Kara’s own little hole, pumping deep into her pussy. With every thrust, you can feel her cock throbbing against your [pc.butt], starting to drool with pre. You’re not sure how long Kara can hang on!");
	else if (pc.hasTailCunt()) output(" Your pussy-lipped tail squirms underneath the orally-fixated cat-girl, driven mad by the half-hard kitty-cock she’s ignoring between her legs. Kara’s eyes go wide for a moment as your cunt-tail slurps up her cock, giving Kara a taste of the pleasure you’re getting.");

	output("\n\nShe keeps licking and tongue-thrusting until you’re almost on the edge, panting and moaning and clawing at her sheets.");
	if (pc.hasTailCock() || pc.hasTailCunt())
	{
		output(" You can’t feel bad for cumming, though, with Kara so close behind you. She gasps, cock pushing hard against your raised behind, and starting to spasm. You have just a moment of warning before your lover’s body tenses, and then her cock erupts");
		if (!pc.hasTailCunt()) output(" all over you");
		else output(" deep into your tail-pussy’s slit");
		output(", moaning quietly and bucking her hips... and never stopping her oral assault.");
	}
	output(" Your [pc.vagOrAss] squeezes around Kara’s thrusting tongue, helpless but to succumb to her magnificent skill. You cum, hard, screaming with pleasure as Kara’s tongue pushes you over the edge");
	if (pc.hasTailCock()) output(" and your tail fills her twat with cream");
	output(".");

	output("\n\nIn your orgasmic high, you barely notice Kara pulling out, licking her slick lips like she’s savoring your taste. Before you can catch your breath, the buxom cat lunges forward,");
	if (pc.hasTailCunt()) output(" dragging her cock free of your tail-cunt and");
	output(" grabbing your [pc.legs]. She spreads you out, throwing your");
	if (pc.isBiped()) output(" legs");
	else output(" lower body");
	output(" over her shoulders and aligning her glistening cat-cock with your [pc.vagOrAss]. She plunges in without a second thought, using the glaze of spittle");
	if (pc.hasVagina()) output(" and pussyjuice");
	output(" she left behind in your hole to ease her entry. The sudden penetration, so close on the heels of your climax, leaves you reeling. You moan, all but insensate to anything but the feeling of Kara’s nub-ringed cock spreading you open.");

	output("\n\n<i>“So good,”</i> Kara purrs, leaning in deep to give you a sloppy kiss, letting you taste yourself still on her lips.");

	var looseness:Number;
	if (pc.hasVagina()) looseness = pc.tightestVaginalLooseness();
	else looseness = pc.ass.looseness();
	
	output(" <i>“");
	if (looseness <= 1) output("You’re so tight! I’m not your first, am I?");
	else if (looseness < 4) output("Mmm, you’re a perfect fit for my cock, [pc.name]. Makes me wish we’d done this sooner...");
	else output("Nice and loose! Just means I can fuck you harder!");
	output("”</i> your lover teases.");
	
	pc.cuntChange(0, kara.biggestCockVolume(), true, true, false);

	output("\n\nYou manage to get your arms around Kara, groping blindly at her pert ass and hips as she starts to thrust. Her bumpy ridges sliding across your inner walls feels as incredible as you imagined and more, dragging across your sex-crazed flesh with steadily increasing speed.");
	if (pc.hasCock()) output(" Your own [pc.cock] throbs against Kara’s belly, half-hard again and smearing itself with the creamy remnants of your first orgasm.");
	output(" You and your lover press tight against each other,");
	if (pc.biggestTitSize() >= 1) output(" your breasts squeezing together in a pillowy embrace");
	else output(" her chest pressing softly against your [pc.chest]");
	output(".");

	output("\n\nWith your arms around your lover, holding her tight while her hips pound away at you, you find yourself drawn into Kara’s loving embrace. You kiss her back, passionately, letting your [pc.tongue] explore the lusty cat’s mouth. She accepts your advances eagerly, returning every advance with one of her own until your tongues are entwined in passion. Your heart’s racing, body trembling at Kara’s touch, building back up towards another crescendo.");

	output("\n\nYou’re not taking that lying down, though. Kara said tonight was all about you, and you want <i>more</i>. Your hands, wrapped around her waist, tighten and push, flipping your ardent lover onto her back this time, and leaving you straddling her. Kara smiles and locks her hands on your");
	if (pc.biggestTitSize() >= 1) output(" breasts");
	else output(" hips");
	output(", giving you a playful squeeze as you take control. <i>“I’m all yours, [pc.name],”</i> she purrs, lying back and surrendering.");

	output("\n\nNow that you’re on top, you start to take it slow, rising on your [pc.knees] and dragging Kara’s nub-ringed cock out to the crown");
	if (pc.hasTailCock()) output(" while your tail-cock rams itself in to the hilt in her pussy, almost ready to give her another parasitic creampie");
	output(". Your hands slide up Kara’s svelte, sweat-slickened body, running your thumbs across the pert, pierced pink promontories on her chest before reaching in to give her breasts more serious attention. As your hips slide down, your hands cup and squeeze her tits, playing with her piercings until your lover’s squirming into your grasp, trying not to moan like a queen cat in heat. Oh, she’s <i>sensitive</i>!");

	output("\n\nBetween rocking your [pc.hips], you lean in to run your [pc.tongue] across one of Kara’s teats, stopping to suck on it. Your teeth wrap around the bars of her piercing, giving her a gentle tug on the one hand, while the other is twisted between your fingers. The sudden sensation is too much for her, and you instantly feel Kara’s cock react to your teasing, swelling up inside you. Her legs clench around your hips, pulling you down until your [pc.butt] is flush with her lap, and her kitty-prick’s buried to the hilt in your [pc.vagOrAss].");

	output("\n\nA rush of wet, sticky heat fills your loins, bubbling up from Kara’s buried cock. Your lover moans, biting her lip and bucking her hips against your ass. Cum spurts into you, squirt after squirt as the catgirl climaxes. Feeling your");
	if (pc.hasVagina()) output(" pussy");
	else output(" ass");
	output(" getting flooded is enough to push you over with her, as soon you’re screaming in pleasure again, voice muffled in the soft embrace of Kara’s breast. Her arms wrap tight around you, holding you close as your bodies undulate together in mind-numbing pleasure.")
	if (pc.hasTailCock()) output(" Your tailcock erupts a moment later, filling your lover with a second helping of its cream and leaving her already-sodden box absolutely drenched with your tail-cum.");
	if (pc.hasCock()) output(" Clenched between your grinding bodies, your [pc.cock] joins your [pc.vagOrAss] in orgasm. Cum slathers your [pc.belly], making a mess of you and Kara both - and acting as lube as the two of you move, faster and faster in the throes of pleasure.");

	output("\n\nBy the time your orgasm subsides, you’ve left your lover a breathless, wet mess. Your head rests in the valley between her big, soft breasts until you feel a pair of hands reaching down to cup your cheeks, bringing you up and into a long, tongue-filled kiss. Kara moans happily, contentedly, and you can feel her tails raising around you.");
	
	output("\n\nWhen you break the kiss, you’re treated to a gorgeous smile from your lover. She nuzzles against you, brushing her short hair against your cheek in a sign of animalistic affection. <i>“Now I wish we’d done this sooner,”</i> she murmurs, reaching back to run a hand along your [pc.skinFurScales]. <i>“I guess we’ll just have to make up for lost time...”</i>");
	
	if (pc.hasVagina()) pc.loadInCunt(kara, 0);
	else pc.loadInAss(kara);
	
	clearMenu();
	addButton(0, "Next", kq2PostKaraSexyCombine, true);
}

public function kq2KaraFuckKittysKitty():void
{
	clearOutput();
	showKara(true);

	output("You decide to take the initiative, grabbing Kara’s juicy hips and pulling her towards the tumescent span of your [pc.cock]. She gives a little gasp as your prick brushes up between her legs, finding a hot, wet gash hidden behind her churning sack. Kara smiles at you, rocking her hips back against your [pc.cockHead]. She gives you a rough push down onto the bed, putting your back on the sheets and her hands firmly planted on your [pc.chest].");
	
	output("\n\n<i>“");
	if (kara.isMischievous()) output("Want a little cat-girl pussy, [pc.name]?”</i>");
	else output("Don’t lie... you’ve been looking forward to this since we first met,”</i>");
	output(" Kara teases, licking her lips while your cockhead caresses her lower pair. She winks one of her slitted green eyes at you, and eases herself back. You both gasp, united in pleasure in that brief moment as your [pc.cock] slides into her, parting her velvet-soft folds and pressing into her tight, slick embrace.");
	
	pc.cockChange();
	
	output("\n\nYour lover makes a sated little moan as her plush behind comes to rest on your lap. <i>“Oh, yeah,”</i> she purrs, rocking her hips around your buried shaft. <i>“That’s the stuff!”</i>");
	
	output("\n\nSmiling, you lock your hands back on Kara’s hips, guiding her as she starts to move. She answers your control with a lascivious grin,");
	if (pc.biggestTitSize() >= 1) output(" giving your tits a squeeze");
	else output(" pinching your [pc.nipples]");
	if (kara.isAss()) output(" - just enough to remind you who’s in charge");
	output(". She moves a little faster after that, rising on your" + possessive(ParseText(" [pc.cock]")) + " length and bouncing down again. The bed squeaks loudly underneath you, rebounding with every thrust of your hips or drop of Kara’s.");
	
	output("\n\nAs she moves, you feel the hefty weight of her own masculine endowment bouncing on your [pc.belly], giving you a wet slap with every thrust. Deciding to give Kara a thrill, you reach down and wrap your hand around her nub-ringed kitty-cock. The moment your thumb brushes one of those nubs, Kara’s entire body goes rigid - especially that meaty cock of hers, throbbing so hard in your hand you’re afraid she’s going to nut just from a casual caress.");
	
	output("\n\nShe holds back, but you’re left with a curvy cockhead that’s beading with pre in your hands. Not wanting to end things too early, you move your hand down, teasing the base of her shaft and cupping her balls instead. That seems to be the right balance, and you quickly have Kara moaning like a queen cat in heat, clamping down around your [pc.cock]. With a big ol’ cock of her own, Kara clearly knows how to treat one! Her twat’s like a lubed-up sleeve, perfectly melding itself to you, putting pressure on all the right places, working her muscles down your length in waves. With each bounce, her breasts jiggle alluringly, and her lips twitch around your base");
	if (pc.balls > 0) output(", drooling their slick excitement onto your [pc.balls]");
	output(". You can’t help but reach up and grab her rack, squeezing until she’s purring.");

	output("\n\n<i>“Mmm, this is nice and all,”</i> Kara murmurs, starting to slow down. She leans in, pressing her chest to yours");
	if (pc.biggestTitSize() >= 1) output(" until your tits are mashed together, and her piercings rub up against your [pc.nipples]");
	output(". <i>“But my heart is still racing from before.");
	if (kara.isNice()) output(" Would you mind if we made this a little rougher?");
	else if (kara.isMischievous()) output(" How about you throw me on all fours and give it to me rough, lover?");
	else output(" I need you to fuck me hard. Think you’re up for it?");
	output("”</i>");
	
	output("\n\nYou answer with your body, flipping the kaithrit babe onto her back and rolling onto her, pinning her arms to the bed. She gasps, arching her back when you dive in to lick and suck at her breasts. Gently, you pinch her pierced teats between your teeth, nibbling until she’s gasping with pleasure. Her cock leaps to attention, smacking your thigh with impotent need. No more playing with that - you’ve got this pussy’s needy pussy to deal with!");
	
	output("\n\nKara twists under you, sending a shock up your back of the strangest wringing sensation around your womb-deep [pc.cock]. Getting herself up on her knees, your lover braces her hands on the headboard and slaps her ass with a tail, inviting you to have your way with her - to fuck her like an animal! An offer you take eagerly...");
	
	output("\n\nGrabbing Kara by the tits, you ram yourself home into her steaming twat, making the whole bed rock forward with the weight of your thrust. She screams; no more cute moans and girly cries, just a feral roar of pleasure as you start to pound her. Her pierced nipples make the most perfect hand-holds, teasing her bars between your fingers between rough squeezes and pulls. The familiar sounds of flesh colliding with flesh echo loudly off the bare walls, mixing with your moans and Kara’s until her quarters are awash in a symphony of sensuality.");

	//if PC has a knot!
	if (pc.hasKnot())
	{
		output("\n\nYour hips hammer Kara’s raised rear-end, filling you with a visceral glee at seeing her derriere quiver to the beat of your thrusting hips. You barely even notice how swollen your [pc.knot] has become until Kara lets out a startled cry, and you realize you nearly buried it in her. Fuck it - you’ve earned this! You rear your hips back and ram them forward one last time, shoving the swollen bulb of your knot into the wet embrace of Kara’s pussylips. She shrieks, a wordless cry of pleasure as your knot drives her to climax.");
	}

	output("\n\nYou grab your lover’s hips and drive yourself as deep into her as you can, already feeling the pressure swelling in your loins. Kara’s just ahead of you, though, throwing her head back in a whorish moan as her pussy clenches around you, and her half-hard kitty-cock sprays a sheen of white cream down between her legs, bouncing with every one of her weak, orgasmic motions. <i>“[pc.name]!”</i> she manages to grunt out, eyes closed tight and cock spasming wildly. <i>“Fuck me! Fuck me!”</i>");

	output("\n\n");
	if (pc.hasKnot()) output("You can’t exactly thrust, tied as you are");
	else output("You’re not far behind her yourself");
	output(", and content yourself with short, shallow, fast motions into the squeezing embrace of her sodden quim until your cock feels so swollen with need that you can’t take it anymore. You all but collapses atop Kara, pressing your [pc.chest] into her back as your [pc.cock] erupts inside her, flooding her sex with a wave of [pc.cumNoun].");
	if (pc.cumQ() >= 1000 && pc.hasKnot()) output(" Kara’s eyes go wide as she feels the sheer, incredible <b>volume</b> of spunk you’re flooding her womb with, giving it nowhere to go thanks to the knot lodged firmly between her lips. She gives a weak gasp, clutching helplessly at her bloating belly as you fill her.");
	else if (pc.cumQ() >= 1000 && !pc.hasKnot()) output(" You fill her utterly in the span of a squirt or two, leaving the rest of your immense load to come flooding out around your [pc.cock].");
	else output(" Kara’s slit is left a sticky mess by your orgasm, coating the crown of your cock in a heady mix of her fem-slime and your seed.");
	output(" Kara’s own orgasm has left a musky swamp on her bed, staining her thighs with her own cum - and her cock’s still twitching, drooling little bits of creamy white spunk as her climax slowly abates.");

	output("\n\nYou’ve left her a breathless, wet mess");
	if (pc.cumQ() >= 1000 || pc.virility() > 2 || pc.hasPerk("Virile")) output(" - and thoroughly bred, too");
	output("! Still leaning against the well-fucked kaithrit’s back, you reach around and turn her chin to face you - and a long, passionate kiss. She moans happily, contentedly, and you can feel her tails raising around you.");

	output("\n\nWhen you break the kiss, you’re treated to a gorgeous smile from your lover. She nuzzles against you, brushing her short hair against your cheek in a sign of animalistic affection. <i>“Now I wish we’d done this sooner,”</i> she murmurs, reaching back to run a hand along your [pc.skinFurScales]. <i>“I guess we’ll just have to make up for lost time...”</i>");

	//[Next]
	clearMenu();
	addButton(0, "Next", kq2PostKaraSexyCombine);
}

public function kq2PostKaraSexyCombine(gotFucked:Boolean = false):void
{
	clearOutput();

	processTime(180 + rand(30));

	for (var i:int = 0; i < 10; i++)
	{
		if(gotFucked)
		{
			if (pc.hasVagina()) pc.loadInCunt(kara, 0);
			else pc.loadInAss(kara);
		}

		pc.orgasm();
		kara.orgasm();
	}

	output("<b>Several hours later...</b>");
	
	output("\n\nExhausted, sweaty, and utterly spent, you collapse on the bed spread-eagle and breathing hard. Kara’s beside you a second later, her whole lower half completely slathered in wasted cum from your hours of vigorous love-making. Smiling dreamily, the kaithrit curls up against you, resting her head on your [pc.chest] and idly tracing a faintly-moist digit across your [pc.belly].");
	
	output("\n\n<i>“That was... that was something,”</i> she purrs, holding you gently. <i>“And I loved every second of it.”</i>");
	
	output("\n\nYou put an arm around your lover’s shoulders, pulling her close, and tell her much the same. Her twin tails wiggle happily, and she relaxes in your embrace. <i>“Wanna stay for a while, [pc.name]? I know");
	if (kara.isNice()) output(" I’ve stolen a lot more of your time than you bargained for");
	else if (kara.isMischievous()) output(" you’ve got places to be, things to do...");
	else output(" I’ve pretty much worn you out, but...");
	output("”</i>");
	
	IncrementFlag("SEXED_KARA");
	flags["KQ2_KARA_WITH_PC"] = undefined;

	//[Stay] [Go]
	clearMenu();
	addButton(0, "Stay", kq2PostKaraSexyCombineStay, undefined, "Stay", "Stay the night with Kara.");
	addButton(1, "Go", kq2PostKaraSexyCombineGo, undefined, "Go", "You’ve got to go.");
}

public function kq2PostKaraSexyCombineGo():void
{
	clearOutput();
	showKara(true);

	output("You tell Kara you do need to leave - but you enjoyed the time you spent together. She smiles at that, propping herself up on an elbow to watch you as you swing out of bed and gather your discarded [pc.gear].");
	
	output("\n\n<i>“Thanks again, [pc.name],”</i> she says as you’re nearly ready to go. <i>“I can’t say that enough. Wouldn’t have made it this far without you.”</i>");
	
	output("\n\nReturning her smile, you lean back in to kiss your kitten one last time before you go.");
	
	output("\n\n<i>“See you around, [pc.name].”</i>");
	
	output("\n\nYou nod and slip out of her quarters, heading back to your ship.");

	currentLocation = "SHIP INTERIOR";

	if (!pc.hasStatusEffect("Kara Fuck Alternate Path"))
	{
		clearMenu();
		addButton(0, "Next", mainGameMenu);
	}
	else
	{
		output("\n\n");
		CombatManager.genericVictory();
	}
}

public function kq2PostKaraSexyCombineStay():void
{
	clearOutput();
	showKara(true);

	output("You answer Kara with another kiss, holding the cat-girl close and closing your eyes. The last thing you see is her smile, cobalt tails brushing against your [pc.legOrLegs].");

	output("\n\nYou wake up to a leaden body, still aching from your adventures... and the passions that followed it. Slowly, your eyes blink open, revealing a room bathed in a sensual red light emanating from a holoscreen on the other side of her quarters. It takes you a moment to realize that the faint heat beside you is nothing but residual; you roll over to find that you’re alone in bed. With a yawn and a long stretch, you sit up and look around.");
	
	output("\n\n<i>“Hey, lover,”</i> a familiar voice says, drawing your eyes to the shadow of the holo-screen, beneath the image of a billowing red sun muted down to only a dim light. Kara’s sitting beside it, wrapped up in a blue bathrobe with her legs crossed under her, sipping at a steaming mug. <i>“Sleep well? I did.”</i>");
	
	output("\n\nYou nod and slowly pull yourself out of bed, looking for your gear.");
	if (!pc.isNude()) output(" Your clothes have been cleaned and folded, sitting at the foot of the bed");
	else output(" Your gear’s been stacked neatly at the foot of the bed for you");
	output(". As you gather your things, Kara sets her mug aside and slips over you, wrapping her arms around your waist and pressing her cheek into your back. <i>“I can’t thank you enough, [pc.name]. For everything,”</i> she murmurs.");
	
	output("\n\nYou turn in her embrace and give her a fierce hug, taking comfort in the warmth and softness of your kaithrit lover. The two of you spend a little while together, just enjoying each other’s company, before a heavy heart pulls you towards your ship. You still have an adventure of your own to finish.");
	
	output("\n\nKara nods understandingly, and walks you to the airlock. <i>“If you ever need anything, [pc.name],”</i> she starts, lacing her fingers with yours.");
	
	currentLocation = "SHIP INTERIOR";
	genericSleep(480);
	
	if (!pc.hasStatusEffect("Kara Fuck Alternate Path"))
	{
		output(" <i>“I owe you. So, so much.”</i>");
		
		output("\n\nYou give her a parting hug as the airlock cycles. As you part, you see the <i>Ghost</i>’s pilot, Logan, rounding a corner with a dataslate tucked under her arm.");
		
		output("\n\n<i>“Kara! Chow’s on the Q-Comm for you,”</i> the pilot says, giving you a slight nod as you leave. <i>“Routed it to your quarters.”</i>");
		
		output("\n\nYour lover sighs and stuffs her hands into her robe pockets. <i>“Fun never ends. I’ll see you again soon [pc.name].”</i>");
		
		output("\n\nThe airlock snaps closed behind you, and you make the journey back to your own ship in silence.");

		clearMenu();
		addButton(0, "Next", mainGameMenu);
	}
	else
	{
		output(" <i>“Don’t hesitate to call. Just the chance to spend another night together would be reward enough.”</i>");
		
		output("\n\nYou give her a parting hug as the airlock cycles. As you part, you see the <i>Ghost</i>’s pilot, Logan, rounding a corner with a dataslate tucked under her arm.");
		
		output("\n\n<i>“Hey again, [pc.name],”</i> she says, giving you a friendly nod. <i>“You two sleep well?”</i>");
		
		output("\n\nKara murmurs an affirmation, slipping an arm around Logan’s waist so that she’s hugged between the two of you, resting her head on your shoulder. <i>“Mmm. Maybe next time you’ll even join us, you big shy baby.”</i>");
		
		output("\n\nThe reptilian-morphed pilot scowls, crossing her arms under her pert little bust. <i>“Just be happy I don’t mind sharing, you dirty minx. And you,”</i> she adds, reaching across the kaithrit’s jiggling robes, <i>“just keep treating my captain right, you hear?”</i>");
		
		output("\n\nYou chuckle and nod, tapping the airlock to cycle it open. That, you can do.");
		
		output("\n\nKara giggles and gives you a parting kiss - and a firm squeeze of your [pc.butt]. <i>“See ya, [pc.name]. Don’t be a stranger.”</i>");
		
		output("\n\nThe airlock snaps closed behind you, and you make the journey back to your own ship in silence.\n\n");

		pc.removeStatusEffect("Kara Fuck Alternate Path");

		CombatManager.genericVictory();
	}
}

public function kq2NukeBadend():void
{
	clearOutput();

	output("You’re moving as fast as you can, rushing towards the way out of this hell hole... but not fast enough. Over your head, you hear a crackling P.A. system announce in a mechanical, feminine voice: <i>“Self Destruct sequence activating in: Ten. Nine. Eight...”</i>");
	
	output("\n\nYou push yourself harder, knowing there’s no way to escape the blast, but desperate nonetheless.");
	
	output("\n\n<i>“Five... four... three...”</i>");
	
	output("\n\nShitshitshit.");
	if (flags["KQ2_KARA_WITH_PC"] == 1) output(" You grab Kara’s hand, staring into the cat-girls eyes in your last moments. She gives you a reproachful, sad look, but takes your hand in hers as the");
	else output(" The");
	output(" P.A. announces <i>“Two... one. Nuclear detonation imminent. Goodbye.”</i>");
	
	output("\n\nAnd then there’s a flash of searing pain. Then nothing.");

	flags["KQ2_KARA_WITH_PC"] = undefined;
	badEnd();
}

public function kq2NukeExplodesLater():void
{
	clearOutput();

	output("A short while later, you find yourself staring into space. Your sensors show the Confederate fleet in the distance, and you’ve had your sensors tuned to detect weaponsfire in the nearby system. But so far... nothing. Curious, you take the help and fly towards Myrellion, wondering what’s stopping the mass Xenocide you should have caused. Nothing seems to have changed on the surface, and you’re not picking up any broadcasts from the fleet.");
	
	output("\n\nJust as you’re starting to wonder, your sensors detect movement in the fleet. You watch with wide eyes as the Confederate fleet moves away from the planet, making way towards the Warp Gate. They vanish off your sensors an hour later, warping out of the system.");

	output("\n\nIt was a bluff all along.");
	if (pc.isAss()) output(" Looks like some admiral lost his nerve.");
	else if (pc.isMischievous()) output(" Looks like somebody left their big-boy pants back home.");

	output("\n\nWell, that doesn’t bode well for the cold war down there. Indeed, as you sweep towards the planet’s surface, your sensors start to blip up with various radiological alerts. The closer you get, the better you can see mushroom clouds billowing up through the planet’s atmosphere. Oh, shit. Dozens of ships are desperately zooming out of orbit, small spacer freighters and solo-ships, and the cargo vessels from every mega-corp that had a stake in the place. You wonder how much warning they had.");

	//if PC hadn't gotten the probe yet:
	if (!reclaimedProbeMyrellion())
	{
		output("\n\nSuddenly, your comms beep with an incoming message. From your cousin.");
		
		output("\n\nYou take the call, leaning back in your captain’s chair as the vidscreen clicks on. [rival.name] is clutching onto the controls of [rival.hisHer] ship, [rival.hisHer] clothes all but shredded and [rival.hisHer] nearly-bare flesh covered in sweat and dirt and dozens of small cuts.");
		
		output("\n\n<i>“You... you psycho!”</i> [rival.name] yells, breathing hard. <i>“I was watching... I saw that nuke go off right near you. You did it, didn’t you!? This... this is all YOUR fault!”</i>");
		
		output("\n\nYou shrug it off. Who knows who’s listening?");
		
		output("\n\n[rival.name] sneers. <i>“Fine! Don’t answer, you bloody monster! I’ve got the probe, so </i>fuck you<i>! See you at Steele Tech HQ!”</i>");
		
		output("\n\nThe comms cut off. Well, shit. How’re you going to come back from this? You sigh and drum your fingers on the helm... you’ll just have to think of something!");

		flags["KQ2_MYRELLION_STATE"] = 1;
		flags["KQ2_DANE_COORDS_TIMER"] = GetGameTimestamp();

		clearMenu();
		addButton(0, "Next", mainGameMenu);
	}
	// {PC has subjugated or married Taivra:
	else if (flags["KING_NYREA"] != undefined)
	{
		output("\n\nWell, there goes the surface of the planet. But you know there are other ways down into the depths. Maybe some of them made it through the apocalypse you unleashed. With any luck, Taivra and her queenship survived.");

		flags["KQ2_MYRELLION_STATE"] = 2;

		//Retain access to Myrellion. If the PC lands there, plant the starship at the Taxi Point in the Deep Caves. No access possible to the Upper Caves. 

		clearMenu();
		addButton(0, "Next", mainGameMenu);
	}
	
	if(shipLocation == "600") shipLocation = "SPACE";
	processTime(360);
}

public function flyToMyrellionDeepCaves():void
{
	if(flags["VISITED_MYRELLION"] <= 1)
	{
		author("Savin");
		
		output("You guide your ship through the ashen atmosphere of the ruined planet of Myrellion, slowly forging through pillars of radioactive smog and falling ash. Nuclear winter’s set in on the surface, bathing the desert world in white. It’s almost pretty, in a way - though you know the glistening coat lies overtop hundreds of craters where cities once lurked below the ground. You wonder if anyone survived, far from the front lines. Could the golds have reached the Federation homeland, pushed so far back as they were?");
		
		output("\n\nYou shake the thought and guide your vessel down, towards a fissure in the ground. You should be just above Taivra’s palace, now. With careful, slow precision, you lower yourself through the crack and down into the depths of Myrellion, far beneath the nuked-out myr tunnels. Miles down below the ground. It should still be safe, protected from the radiation by so much rock as you are.");
		
		output("\n\nYou park at the bottom of a familiar cavern network and set the ship’s automated scrubbers to clean off the hull before you depart - you don’t want to pick up anything the irradiated surface might have rubbed off on your vessel.");
		
		flags["VISITED_MYRELLION"] = 2;
		
		processTime(5);
	}
	else
	{
		output("You fly to the nuked planet of Myrellion, carefully guiding your vessel down towards the ground fissure that leads to the area just above Taivra’s palace. You finally park at the bottom of a nearby cavern");
		if(leaveShipOK()) output(" and step out of your ship.");
	}
}

public function kq2DaneCoordEmail():void
{
	flags["KQ2_DANE_COORDS_TIMER"] = undefined;

	clearOutput();
	author("Savin");

	output("Your Codex beeps unexpectedly, alerting you to an incoming extranet message. When you pull your device out, you’re greeted by an message addressed from one <i>“doubledog27@ausal.ril”</i> You flip it open and start to read:");
	
	//if fucked on Mhen'ga:
	if (flags["FOUGHT_DANE_ON_MHENGA"] == 1 && flags["WHUPPED_DANES_ASS_ON_MHENGA"] == undefined) output("\n\nHow’s my favorite cocksleeve doing?");
	else output("Sure hope this is actually your email address...");
	
	output("\n\nSo I don’t know if you’re actually the one that blew myrellion up or not. Dont really care either. Your dickweed cousin fired me right after.");
	if (rival.mf("m", "f") == "f") output(" What a bitch. Shoulda fucked her when I had the chance.");
	else output(" What an asshole. Glad I’m not working for him anymore.");
	output(" Didn’t even get my last paycheck. So I wrote down those dumb coordinates [rival.heShe] was yammering on about on my way out.");

	output("\n\nOops, I must have accidentally attached them to this message. Ha, silly me. Be a shame if somebody put a boot up [rival.name]’s ass on the next planet when [rival.heShe]’s not expecting it.");

	output("\n\nJust sayin.");

	//if fucked:
	if (flags["FOUGHT_DANE_ON_MHENGA"] == 1 && flags["WHUPPED_DANES_ASS_ON_MHENGA"] == undefined)
	{
		output("\n\nSoooo if you want a repeat of Mhen’ga, maybe we can hook up sometime? C’mon, I know you liked it ;)");
		if (silly) output(" Woulda save-scummed out of it otherwise!");
		
		output("\n\n<b>Below the message is attached a picture of Dane’s rock-hard tentacle wang, multiple knots fully engorged between his snowy fingers. Looks like somebody’s been thinking of you...</b>");
	}

	output("\n\nAt the bottom of the message, you see several stellar coordinates: the next probe’s location! Well, looks like Benedict Ausar just saved your inheritance!");

	if (!MailManager.isEntryUnlocked("danemyrellioncoords")) MailManager.unlockEntry("danemyrellioncoords", GetGameTimestamp());

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

// Follow Up w/ Shade
// next time PC interacts with Shade on Myrellion, if she’s still there. Must not have killed Shade/blown up Myrellion, etc.
public function kq2ShadeFollowUp():void
{
	clearOutput();
	showShade();
	author("Savin");
	
	output("You quietly sit down at the familiar table in the back corner of the Golden Peak, across from your lover. She doesn’t look up from her holo-screen at first, pointedly ignoring you for several uncomfortable seconds before shuddering out a long, heavy sigh. The matronly kaithrit leans forward, resting her temples in her hands, still not meeting the gaze you’ve been training on her since you sat down, expectant.");
	output("\n\n<i>“So,”</i> she finally says, shielding her eyes behind her laced fingers. <i>“This... is not a conversation I wanted to have.”</i>");
	output("\n\nYou neither.");
	if(pc.isMischievous()) output(" Part of you wants to suggest if that’s the case, you should both forget all about it. But you think better of it, and hold your snark back for once.");
	output("\n\nShade takes a deep breath, holds it a moment, and lets it go until her chest looks ready to collapse. Finally, she runs a hand through her silvered hair and looks up at you. Her face is unreadable. Cold. Tired. You can’t tell if she’s angry or sad or just <i>done</i> with you. <i>“I always thought you turned up on a hell of a night, kiddo. First good turn I’d had in this dump... should have known it was a lie. A good one, too. Must have been, since I fell hook, line, and sinker for you. What I don’t get is </i>why<i>. Why’d you go all the way with it; with me? Was this all some kind of sick game to you, or...”</i>");
	output("\n\nShe makes something between a laugh and a sigh and turns away, staring off into the crowd for a long while. Looks like she’s waiting for an answer. Your explanation. Why <i>did</i> you sleep with her?");
	
	processTime(5);
	flags["KQ2_SHADE_ENCOUNTERED"] = 2;
	
	kq2ShadeFollowUpMenu();
}
public function kq2ShadeFollowUpMenu():void
{
	// [A Good Fuck] [Like Shade] [For Kara] [Lie: Coincidence] [Say Nothing]
	clearMenu();
	addButton(0, "A Good Fuck", kq2ShadeFollowUpResponse, "fuck", "A Good Fuck", "She was good for a fuck, that’s why. What’s so surprising about that?");
	addButton(1, "Like Shade", kq2ShadeFollowUpResponse, "shade", "Like Shade", "You really do like Shade. Even if it was just a job at first, it became more than that to you...");
	addButton(2, "For Kara", kq2ShadeFollowUpResponse, "kara", "For Kara", "Tell Shade that you had to. Kara paid you to distract the bounty huntress, so you made damn sure she’d be distracted.");
	addButton(3, "Lie:Coincidence", kq2ShadeFollowUpResponse, "coincidence", "Lie: Coincidence", "Tell Shade this is all a big misunderstanding. Kara hired you later -- this is all some big coincidence you’ve gotten caught up in.");
	addButton(4, "Say Nothing", kq2ShadeFollowUpResponse, "nothing", "Say Nothing", "Keep your silence. Answering isn’t going to help here.");
}

//Append choice to previous page.
public function kq2ShadeFollowUpResponse(response:String = "none"):void
{
	clearOutput();
	showShade();
	author("Savin");
	
	if(response == "nothing")
	{
		output("You keep your lips shut, looking away from the huntress. ");
		output("\n\nAfter a long while, several minutes at least, Shade stands up. You keep your gaze locked where it is while she rises to her feet and walks out, straight for the door. Her hand brushes on your shoulder one last time before she departs, fading into the crowd.");
		output("\n\nYou sit for a while after that, letting");
		if(flags["MET_EMBRY"] != undefined) output(" [embry.name]");
		else output(" the waitress");
		output(" bring you a drink to ease your nerves. You can’t sit around forever, though.");
	}
	else if(response == "coincidence")
	{
		//+Heavy Mischievous.
		pc.addMischievous(20);
		
		output("You spend the next few minutes explaining the Shade the convoluted web of lies that you’re able to spin. The story you tell would make a damn fine novel full of intrigue and hard-boiled action. It was all happenstance that you met Shade when she was hunting Kara, that you met the beautiful femme-fatale later and she swept you up in her adventure, only to run into your precious lover in the middle of it all. How were you to know Shade worked for pirates, or helping one cat-girl would throw you into conflict with the other. You’re an innocent bystander in all of this!");
		output("\n\nShe listens to every word, silent and still as a statue until you wrap up your story with your arrival here, coming to try and explain what’s happened.");
		
		// if Ultra-High Misch Personality:
		var mischief:Number = pc.personality;
		// Maybe Smugglers get a bonus to this? Dunno!
		if(pc.characterClass == GLOBAL.CLASS_SMUGGLER)
		{
			if(mischief < 48) mischief++;
			if(mischief < 49) mischief++;
			if(mischief > 51) mischief--;
			if(mischief > 52) mischief--;
		}
		if(mischief > 45 && mischief <= 55)
		{
			output("\n\nA moment of silence passes when your story ends. And then, out of nowhere, Shade laughs. A long, hearty, throaty laugh. Her head swings back, and her arms wrap around her stomach. You blink away your surprise as you realize your lover’s absolutely losing her shit.");
			output("\n\n<i>“Fucking hell,”</i> she finally says, wiping her eyes. <i>“I don’t even know what to say to that.”</i>");
			output("\n\nYou’re not sure if your lie’s paid off or not until Shade finally calms down and leans back in her chair, reaching down to caress the green serpent sitting in her lap. <i>“I don’t normally believe in coincidences, but...”</i> she shakes her head and reaches across the table, taking your hand in hers. <i>“Fuck it. Fuck the blue-haired tramp. Fuck the Void, even. I just want one thing from you, [pc.name]...”</i>");
			
			processTime(2);
			clearMenu();
			addButton(0, "Next", kq2ShadeFollowUpAmends);
			return;
		}
		else
		{
			output("\n\nA moment of silence passes when your story ends. And then, out of nowhere, Shade laughs. A wry, dark laugh that leaves her hanging her head. <i>“That’s... yeah, sure,”</i> she grunts, running a hand back through her silver hair and standing up. <i>“I think I need some fresh air. See you around, kid.”</i>");
			output("\n\nWithout a word more, Shade stands and shoves her hands in her pockets. She gives you one last, lugubrious look before walking through the door and out into the crowd.");
			output("\n\nYou sit for a while after that, letting");
			if(flags["MET_EMBRY"] != undefined) output(" [embry.name]");
			else output(" the waitress");
			output(" bring you a drink to ease your nerves. You can’t sit around forever, though.");
		}
	}
	else if(response == "kara")
	{
		output("You tell Shade the truth: that Kara paid you to distract her that day. You decided to make absolutely sure Shade was nowhere near her quarry, and if that meant sex, then so be it. Anything to make sure Kara got out alright.");
		
		if(flags["SEXED_SHADE"] <= 1)
		{
			output("\n\nShade nods slowly as you finish your explanation. <i>“I guess... I guess I can respect that,”</i> she sighs, looking pointedly away from you. <i>“I’ve done worse in my life. I just... no, I don’t have the right to complain. I didn’t exactly state up front whom I was working for, either.”</i>");
			output("\n\nAfter a moment, Shade leans back in her chair and looks you over, appraisingly. <i>“Alright. I appreciate the honesty, [pc.name]. I appreciate it... but you and I are through. No vendetta, no grudge, but I don’t ever want to see you again. I’m done with this shithole planet.”</i>");
			output("\n\nShe gets up, starting towards the door, but stops beside you. You feel the familiar, heavy warmth of her hand on your shoulder one last time before she passes you by, vanishing in the crowd.");
			output("\n\nYou sit for a while after that, letting");
			if(flags["MET_EMBRY"] != undefined) output(" [embry.name]");
			else output(" the waitress");
			output(" bring you a drink to ease your nerves. You can’t sit around forever, though.");
		}
		else
		{
			output("\n\nShade’s eyes narrow at you. <i>“I could understand that if it had been a one night stand, kid. Might have even respected it. But to string me along like that? What the </i>fuck<i>, [pc.name]? Why?”</i>");
			
			//Remove this option and Lie. Keep everything else.
			kq2ShadeFollowUpMenu();
			addDisabledButton(2, "For Kara");
			addDisabledButton(3, "Lie:Coincidence");
			return;
		}
	}
	else if(response == "shade")
	{
		//+Kindness
		pc.addNice(10);
		
		output("You tell Shade the truth: while it might have started out as just a job to you, you found over time that you actually really like your one-time mark -- you genuinely wanted to spend more time with Shade. Since then, you’ve enjoyed the time you’ve spent with her. ");
		output("\n\nAnd you absolutely did not want it to end this way. ");
		output("\n\nShade’s head lowers as you talk, ears tucking down against her silvery hair. When you’ve finished, she sighs heavily and plants her elbows on the lip of the table, resting her chin in her hands. <i>“Is that right?”</i>");
		output("\n\nYou nod. You don’t know what else you can say to make amends with Shade, and she doesn’t seem ready to ask for anything. The huntress just stares at you for a long while, thinking. You’re starting to think she’s not going to say anything at all when she finally breaks down, taking a deep breath. <i>“I believe you,”</i> she finally murmurs, looking you dead in the eye now. <i>“I don’t exactly know what to do with that, but there it is.”</i>");
		output("\n\nHer words feel like a huge weight’s been lifted from your shoulders, and you let out a long sigh. As if sensing you relax, Shade tsks her tongue and adds, <i>“You’re not off the hook, kiddo. Oh, no. I told you I don’t like getting played, even if it... turns into something different. Look, I just want one thing from you, [pc.name]...”</i>");
		
		processTime(2);
		clearMenu();
		addButton(0, "Next", kq2ShadeFollowUpAmends);
		return;
	}
	else if(response == "fuck")
	{
		//+Hardness
		pc.addHard(10);
		
		output("<i>“It was a good fuck. Nothing more,”</i> you say with a shrug. Shade’s a hot momma, after all, and knows her way around the bedroom. You used her for the pleasure, nothing more. And, you think, she got a little something out of it too. ");
		output("\n\nShade scowls at you, and the next thing you know you’re reeling back, pain sparking out from your [pc.face]. Your cheek burns painfully, and you blink away stars from your vision just in time to see Shade walking off in a huff. You think about reaching out for her, but think better of it -- after a hit that hard, an armed and dangerous babe like her might just get violent if you did.");
		output("\n\nWith a sigh, you order a drink -- heavy on the ice -- and press it to your cheek. Ouch.");
		
		pc.HP(-10);
	}
	
	//Remove Shade from Myrellion. Doesn’t like PC anymore. 
	flags["SHADE_DISABLED"] = 1;
	
	processTime(2);
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

// From Like Shade or High Misch var. of Lie.
// if Probe Dungeon not done: Shade stays at the bar, but PC can’t interact with her. 
// if Probe Dungeon done: Shade leaves, and moves to Uveto.
public function kq2ShadeFollowUpAmends():void
{
	clearOutput();
	showShade();
	author("Savin");
	
	output("Shade squeezes your hand, looking at you with those golden eyes of hers. You take her hand, hoping to hear something that will keep the two of you together. She holds your gaze for a long moment, thinking, before finally saying what it is she wants from you: <i>“I’m going to need some time to think, [pc.name]. Maybe a lot of time. Just... I’m almost done here on Myrellion. About done with this whole planet. I’ll call you when I’m ready. <b>If</b> I’m ready.”</i>");
	output("\n\nYou nod, sadly. It’s understandable, you guess, though it hurts all the same. You can only hope that maybe some day - someday soon - she’ll be ready to talk again.");
	
	// if Probe Dungeon Not Done:
	if(flags["MYRELLION_PROBE_CASH_GOT"] == undefined)
	{
		output("\n\nShade gives you a faint smile, motioning towards the door -- a dismissal, though not entirely unkind. You give her hand a squeeze in kind before standing, giving the huntress a pause to decide on the future of your relationship. If there <i>is</i> a future.");
		
		flags["SHADE_DISABLED"] = -1;
	}
	// if Probe Dungeon done:
	else
	{
		output("\n\nShade nods at the thought, chewing her lip. <i>“Look, I’m leaving in a few hours.");
		// if beat Amara in KQ2:
		if(flags["KQ2_QUEST_FINISHED"] != undefined) output(" You and your friend put my daughter’s father in the hospital. I’ve got to check in on her.");
		else output(" Amara and I have some catching up to do while she’s here.");
		output(" After that... I’m off this rock. Going back home to Uveto.”</i>");
		
		flags["SHADE_ON_UVETO"] = 1;
	}
	output("\n\nShe releases your hand and stands, turning towards the door. <i>“Like I said, I’ll call you when I’m ready to talk again. I just need some time to deal with... this.”</i>");
	output("\n\nYou nod and say your farewells, left to watch the huntress leave... hopefully not for the last time. ");
	
	processTime(5);
	
	flags["KQ2_SHADE_AWAY_TIME"] = GetGameTimestamp();
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

// Probe Reclamation Modification
// If Shade’s still on-planet, not dead, doesn’t hate PC after the dungeon. Add on where Shade comes in during the Probe Reclamation scene:
// Unlock Uveto on GalMap, if it wasn’t already.
public function KQ2shadeHalfSisterOhNoes():void
{
	clearOutput();
	showShade();
	author("Savin");
	
	output("...and just save yourself from face-planting into a familiar pair of breasts barely held back by a ballistic vest.");
	output("\n\n<i>“Woah, easy there,”</i> Shade laughs, giving you a gentle but firm push out of her personal space. <i>“Going somewhere?”</i>");
	output("\n\nYou laugh off the near-collision and say that you just found one of your dad’s probes, loaded with the coordinates you need for the next leg of your quest. You might not be around Myrellion much after this, you add, hoping to provoke some decision from the thus-far reticent huntress.");
	output("\n\nLuckily, it doesn’t look like your meeting was a coincidence. Shade nods and plants a heavy, firm hand on your shoulder. <i>“Good for you, kid. Looks like I’m off, too.");
	if(flags["KQ2_QUEST_FINISHED"] != undefined) output(" Amara’s out of the hospital, and it’s been too long since I’ve seen my kid.");
	else output(" It’s been too damn long since I’ve seen my kid.");
	output(" Gonna head back to Uveto.”</i>");
	output("\n\nYour gut forms a knot the moment she says it. No reunion, no forgiveness. Just her... vanishing?");
	output("\n\nShade looks pointedly away, leaning back against the black probe floating on its hover-cart while she starts to speak. She doesn’t so much as open her mouth before the probe bleeps and its screens start glowing.");
	output("\n\n<i>“Uh...”</i> Shade blinks, staring at the probe. <i>“Did I do something?”</i>");
	output("\n\nOne of the Steele Tech pilots jogs over, pulling his Codex back out. <i>“Hey, weren’t these things only supposed to turn on for you, " + pc.mf("Mr.","Ms.") + " Steele?”</i>");
	output("\n\n<i>“Yeah,”</i> you admit. <i>“Me or anybody with enough of my Dad’s DNA.”</i>");
	output("\n\n<i>“Oh, shit,”</i> Shade says, forcing a chuckle. <i>“That’s a hell of a bug.");
	if(pc.raceShort() == "kaithrit") output(" What, does it think I’m your mom or something?");
	else output(" What, does it think I’m your long-lost sister or something?");
	output("”</i>");
	output("\n\nThe company pilot punches a few buttons on his Codex and waves its scanner over the banged-up old probe, mumbling about that specific model of probe and software hiccups. After a moment, though, he scratches his stubbly chin and furrows his brow. You and Shade both look at him expectantly, but rather than assuring you it’s just some random bug in the century-old probe, he pushes another button and turns the scanner towards Shade.");
	output("\n\n<i>“Hey,”</i> Shade scowls. <i>“What gives?”</i>");
	output("\n\nThe knot that’s been sitting in your stomach only gets tighter as the pilot’s Codex beeps at him, its screen flashing in his face. Despite your distance of late, you reach over and take your lover’s hand, assuring her it’s probably just a bug. She doesn’t object to the gesture, which for a second, puts your mind at ease.");
	output("\n\nAfter a couple more moments, the pilot makes a perplexed grunt and flips the Codex over and hands it to you screen-down. That alone is enough to make you worry - what the hell is going on? You take a peek at the Codex’s screen, where you see a bio-scanner readout showing your lover and all sorts of privacy-invading data: her age, blood type, a racial blurb about kaithrit... and a DNA analysis. Several computer-generated pinpoints cover the analysis, comparing several points on hers to your father’s - and yours. A red data readout in the corner gives what, to your untrained mind, is a meaningless series of compatibility notes summarized in big, bold capitals: <b>Chance of Close Relation: 98.356%</b>. Uh-oh...");
	output("\n\nYou curse your randy father under your breath, suddenly realizing what’s happened... and what you’ve done. Why the hell couldn’t he have left a list of all his bastards somewhere!?");
	// if talked about her history:
	if(flags["SHADE_TALKED_ABOUT_FAMILY"] != undefined) output(" Then again, maybe you should have seen this coming. She did say her father was a wealthy, mystery playboy. Even if she’s a full kaithrit, your dad never spent long as any one race. He could easily have been a cat-boy forty years ago or so, well before he started to get sick...");
	output("\n\nWith a sigh, you look between the revelatory Codex screen and Shade, sitting against the side of the probe with a hint of concern betrayed on her face. What do you say?");
	
	processTime(14);
	// [Reveal] [Hide]
	clearMenu();
	addButton(0, "Reveal", revealShadesDad,undefined, "Reveal", "Tell Shade the truth. She was able to activate the probe because, like you and [rival.name], she carries your father’s genes. More importantly, though, the two of you have been unknowingly incestuous.");
	addButton(1, "Hide", hideShadesRelation,undefined, "Hide", "Don’t tell Shade what your employee’s uncovered. No need to rock the cat-girl’s boat like that. Especially if you want to keep your affair with your new-found sister going.");
}

