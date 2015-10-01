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


SAVE IMPORT FLAGS
SILENCE_RESCUED_CONNIE	-- 0/undefined, no
						-- 1, Kara rescued Connie
*/

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
	output("\n\nAs you’re boarding your ship, your Codex bleeps an alert: incoming video-call. From an in-system number, you note, as you take it out and glance at the screen. Curious, you tap the <b>Accept</b> button.");

	output("\n\nIt takes you a moment to recognize your caller as the fuzzy camera feed filters in: there’s a lot of interference in the connection, but the video eventually consolidates into a vaguely familiar shape: a cat-girl with cobalt-blue hair and a leather choker around her neck, sporting a cute kitty bell that jingles ever so slightly with its owner’s every movement. <b>It’s Kara!</b>");

	output("\n\n<i>“Hello again, captain,”</i> the kaithrit vagabond purrs, leaning in with her elbows atop some kind of console under the camera, cradling her chin. She gives you a faint hint of a smile, her odd eyes glinting in the light. <i>“Glad to see you’re still in-system; I’ve been meaning to talk to you again. To say thank you again, and to give you a new proposition, if you have the time: another job. And one that’ll pay several times more than that business in the Golden Peak.”</i>");

	output("\n\nWell, she was good for the money last time. You suppose you could hear her out, if nothing else.");

	output("\n\n<i>“Great,”</i> she grins, flicking a hand across a screen. Your Codex beeps with an incoming message, displaying a set of stellar coordinates. <i>“I’m parked in the second moon’s ring. Meet me at those coordinates, {handsome / sweetheart}, and I’ll tell you everything.”</i>");

	output("\n\nWithout waiting for a response, the mysterious cat-girl closes the channel, leaving you with a set of navpoints and a bucket of questions still unanswered.");

	//[Next]
	//Add [Kara] to the destination map. Same system and all as Myrellion, short travel time if in-system. No time limit to arrive. 
	//Tooltip: 
}

public function kq2TravelToKara():void
{
	clearOutput();
	//Walks through import process from Silence. Option to back out if not import.

	pc.credits += 10000;

	output("\n\nYou punch in the coordinates Kara gave you and engage the autopilot, letting the computer start your journey.");

	output("\n\nOne {lengthy journey through space and the Warp Gate network // quick trip through the atmosphere later} and you’re zooming through the blackness of space, hurtling towards Myrellion’s further moon. The journey toward the icy blue moon isn’t particularly long, by galactic standards, but the coordinates Kara gave you lead into rocky belt encircling it. You instinctively boost your shielding, gazing out your ship’s viewports as tumbling hunks of house-sized rock and ice smash against each other. Your shields rumble and flicker as shards of debris hit you, just enough to give you a light show - no threat, so long as you keep dodging the big rocks.");

	output("\n\nThe coordinates are just ahead, drawing you to one of the largest hunks of rock in the belt, nearly twice the size of a hydroball field. A scan of it comes back as a big empty: no signals on it, or for miles around. You furrow your brow, wondering why Kara’s brought you all the way out here... until the rock tumbles around, revealing a huge, hollow crack in its side, permitting entry for a ship about your size. Could be interfering with your scans, and this <i>is</i> where Kara said to meet.");

	output("\n\nYou take a steadying breath and ease your ship into the crack in the rock. You’re quickly bathed in darkness, no light from the sun or moon to guide you past the craggy cave mouth. A moment of doubt passes, before being blasted away by blinding light shining from inside the cavern. Your ship’s shielding keeps the worst of it at bay, just making you squint as the view outside consolidates into several large floodlights mounted on the walls, hanging over some kind of catwalk.");

	output("\n\nAnother ship is parked ahead, a sleek, blue-and-white freighter {not much bigger than your old Z14 // not much bigger than your own ship}. Your comms bleep with an incoming message.");

	output("\n\nYou accept it, and are greeted by Kara’s face, standing on what must be the bridge of the other ship, surrounded by blinking consoles and computer terminals - none of them manned. <i>“Captain! I was starting {if KaraKind: to worry something had happened to you. //KaraMisch: to worry you got lost! //KaraHard: to think you weren’t coming.} Good to see you again,”</i> she says, affecting a faint smile. <i>“In person, preferably. I’m extending a docking tether now... mind if I come over?”</i>");

	output("\n\n<i>“{if Kind: By all means, //Misch AND KaraMisch: Sure. If you think you can manage to not get lost on the way. //elseMisch: Looks like you’re already inviting yourself over, //Hard: I guess,}”</i> you say, as the docking clamps lock your ships together, ever so slightly rattling your outer hull.");

	output("\n\n<i>“Great. See you in a moment,”</i> she winks, flicking off the video.");

	output("\n\nYou make your way down to the airlock, just as it’s cycling through on the other side. You pop your lock and let it slide aside, revealing the familiar shape of the catgirl on the other side. Kara’s shed her cloak and hood since your first meeting, giving you a look at the woman underneath for the first time: she’s rocking a skin-tight black synth-leather suit, showing off womanly hips and a generous bust, accentuated by a shoulder holster loaded down with energy cells and a plasma pistol. A chrome-plated briefcase rests in one of her hands, gloved fingers wrapped tight around the handle. Knee-high leather boots finish off the ensemble, drawing your eyes up her long, toned legs and up to... to a faintly noticeable bulge in the front of the cat-girl’s pants, showing off a tight knot of more masculine flesh. Looks like this kitty’s packing a little something extra...");

	output("\n\n{KaraKind: <i>“Hey there, [pc.name],”</i> she smiles, reaching in and giving you a brisk hug. <i>“Good to see you again.");
	output("\n\n{KaraMisch: <i>“Heyya, {handsome/beautiful}”</i> Kara grins, giving you a rough clap on the shoulder.");
	output("\n\n{KaraHard: <i>“Steele,”</i> Kara says, giving you a firm but respectful nod.} <i>“It’s good to see you again. Like I said over the comms, I’ve got another job for you - if you’re interested. And I still owe you for {helping me kick that bounty hunter bitch’s ass // pulling my ass out of the fire back on Myrellion}.”</i>");

	output("\n\nShe flips a credit chit out of her shoulder rig and {if KaraMisch: tosses it to you //else: hands it to you}, waiting with a smile as you swipe it through your Codex. A moment later, the device beeps an alert that <b>ten thousand credits</b> have been transferred to your account. You blink away your surprise and tuck your Codex away with a grateful nod towards the kaithrit. {if KaraMisch: She gives you a playful wink and says, } <i>“Like I said, I owed you. Think that makes us even, hmm?”</i>");

	output("\n\n{if PCHard: <i>“That’s a start, I guess,”</i> you smirk.} <i>“So, you had a job you wanted to discuss?”</i>");

	output("\n\n<i>“That I do. {if KaraMisch: Permission to come aboard, captain? //else: Mind if we sit down somewhere?}”</i>");

	output("\n\n{if PC AND KaraMisch: <i>“Permission granted!”</i> you grin, giving Kara an exaggerated wink. //else: <i>“Sure, come on in,”</i> you say, waving her aboard.} You turn and lead her out of the airlock and into the ship’s common area.");

	output("\n\n<i>“Nice ship,”</i> she murmurs, a gloved hand running along the bulkhead as she enters, looking cautiously around. <i>“Haven’t been aboard a {ship model} in a while.”</i>");

	output("\n\n{if PC has Anno aboard:");
	output("\n\nYou hear footsteps coming your way. Both you and Kara turn to see Anno walking towards the galley, reading on a tablet couched in her arm. She looks up at the two of you and blinks. <i>“Oh, hey boss. Didn’t know we were expecting company.”</i> She tucks her datapad away and extends a hand to your companion. <i>“Anno Dorna. Ship’s scientist.”</i>");

	output("\n\n<i>“Kara Volke,”</i> Kara answers, shaking Anno’s hand. {if no Reaha: When Anno leaves to go about her business, Kara adds, <i>“I didn’t know you had a crew, [pc.name]. You kind of struck me as a loner. That, and you didn’t have anyone with you when we met.”</i>}");

	output("\n\n{elseif PC has Reaha aboard, no Anno:");
	output("\n\nYou hear footsteps coming your way. Both you and Kara turn to see Reaha //elseif Anno AND Reaha: The moment Anno leaves, Reaha comes out of her quarters, }padding down the corridor, moaning slightly as an auto-milker attached to her breasts buzzes happily. She stops and blinks at Kara, her own bare breasts jiggling as the milk is sucked out of them.");

	output("\n\nKara returns the stare, her feline tails moving more quickly behind her. <i>“That looks... really good,”</i> she purrs, eyes affixed to the cow-girl’s bosom.");

	output("\n\nReaha flushes red and twirls a lock of strawberry hair around a finger. <i>“T-thanks. I’m Reaha. [pc.name]’s my [pc.master]. Do you... uh, do you want a glass?”</i>");

	output("\n\n<i>“I’d love one, Reaha,”</i> Kara says, introducing herself as the cow-girl picks up a glass from the galley nearby and fills it from the back of the milker. Once Kara’s got herself a drink, you give Reaha {if Kind: an affectionate / a playful / a commanding} smack on her ass and tell her to scoot. You’ve got business to attend to.");

	output("\n\nReaha squeaks and walks off, wiggling her hips a little more as she goes. Kara chuckles and sips on her glass of milk, watching appreciatively. <i>“I didn’t know you had a crew, [pc.name]. You kind of struck me as a loner. That, and you didn’t have anyone with you when we met.”</i>");
	output("\n\n}");

	output("\n\nYou shrug and say that {you prefer to operate alone. Most of the time, anyway // Sillymode: Fenoxo won’t let you take party members with you most of the time}.");

	output("\n\n<i>“Well, we’re going to change that,”</i> Kara grins. {End Companion stuff. Combine here:}");

	output("\n\n<i>“Like I said, I have a job for you, [pc.name]. Dangerous work, but {if fought Shade: you’ve proven you can handle yourself // else: I think you can handle yourself}. Plus I can’t fly the </i>Ghost<i> solo into a fight, if it comes to that. Hopefully it won’t, but...”</i>");

	output("\n\n<i>“Alright{if Misch: , I’ll bite}, what’s the job?”</i>");

	output("\n\nKara nods, a glint in her eerie eyes. <i>“Now we’re talking. A very powerful... friend... of mine tells me that there’s a pirate base being set up down on Myrellion. {if KaraKind: I’ll be honest with you: they’re Black Void. Biggest and most powerful pirate syndicate in the galaxy. //if KaraMisch: You’ve heard of the Black Void, right? They’re no joke, but I’m going after them. Hard and fast. //if KaraHard: They’re tough bastards. Black Void. But nothing we can’t handle.}");

	output("\n\nThe Black Void. She’s not joking: they’re the most dangerous pirates around - you couldn’t go a day in flight school without somebody sharing a horror story about Void raiders slaughtering a crew to the man, or dragging them off to the slave pits of Raxxia. Most folk would do just about anything to stay out of their crosshairs... and Kara wants to kick a hornets’ nest. Maybe you should get a little more information.");

	output("\n\nKara kicks back on one of your seats, setting down the chromed briefcase she’s carrying between her legs, waiting for your response.");

	kq2InitTalkMenu();
}

public function kq2InitTalkMenu():void
{
	clearMenu();
	if (flags["KQ2_BV_TALK"] == undefined) addButton(0, "Black Void", kq2KaraTalkBlackVoid, undefined, "Black Void", "Ask what Kara knows about the Black Void, and why she’s going after them.");
	else addDisabledButton(0, "Black Void");

	if (flags["KQ2_BV_TALK"] != undefined && flags["KQ2_F_TALK"] == undefined) addButton(1, "Friend", kq2KaraTalkFriend, undefined, "“Friend”", "");
	else if (flags["KQ2_BV_TALK"] != undefined && flags["KQ2_F_TALK"] != undefined) addButton(1, "Push", kq2KaraPushFriend, undefined, "Push “Friend”", "");
	else addDisabledButton(1, "Friend");

	if (flags["KQ2_PLAN_TALK"] == undefined) addButton(2, "Her Plan", kq2KaraThePlan, undefined, "Her Plan", "Let’s talk about this plan of yours, Kara.");
	else addDisabledButton(2, "Her Plan");

	if (flags["KQ2_EYES_TALK"] == undefined) addButton(3, "Her Eyes", kq2KarasEyes, undefined, "Her Eyes", "Ask kara about those eyes of hers. They look {TechSpec: artificial //Else: ... wrong}");
	else addDisabledButton(3, "Her Eyes");

	if (flags["KQ2_PLACE_TALK"] == undefined) addButton(4, "This Place", kq2ThisPlace);
	else addDisabledButton(4, "This Place");

	if (flags["KQ2_HERSELF_TALK"] == undefined) addButton(5, "Herself", kq2Herself);
	else addDisabledButton(5, "Herself");

	addButton(14, "Next", kq2InitTalkNext);
}

public function kq2KaraTalkBlackVoid():void
{
	output("\n\n<i>“Tell me about the Black Void.”</i>");

	output("\n\nThe kaithrit scoffs, <i>“What’s there to tell? They’re the biggest, baddest group of pirates in the galaxy, bar none. You don’t run into them much in the core, but out here in the fringe - especially during a Rush - they’re the biggest threat to trade and commerce we pilots face. The Void is ruthless, bloodthirsty even, and they’ve got no qualms about killing. Unless you’re unlucky enough to be pretty when they board you: then you’re bound to be sold as a slave, if whatever captain takes you doesn’t fancy you himself... then it’s worse. The Void’s scum, [pc.name]. Evil to the man.”</i>");

	output("\n\nSounds like bad news. <i>“So why are you going after them?”</i>");

	output("\n\nKara’s hand rubs at the back of her neck as she answers, <i>“I crossed them. Big time.”</i> She sighs, and hesitantly she adds, <i>“I’ll be honest, [pc.name], I might not have told the whole truth back at the bar. That bounty hunter was there to cash in on a price on my head. A big one. I took a chunk out of a Black Void frigate, the biggest and scariest pirate vessel I’ve ever seen, commanded by one of the Dread Lords. Because of that fight, I’m a wanted woman... and I racked up a big debt to a ‘friend,’ paying for the damage they did to my crew, my ship...");

	output("\n\n<i>“Plus, they did </i>this<i> to me,”</i> she adds, pointing a pair of fingers at her eyes.");

	addDisabledButton(0, "Black Void");
}

public function kq2KaraTalkFriend():void
{
	output("\n\n<i>“Tell me about this... ‘friend’ of yours.”</i>");

	output("\n\nThe kaithrit fidgets uncomfortably, mumbling, <i>“I’d rather not. Let’s just say he’s powerful, well-connected, and has a vested interest in kicking the Void in the nuts.”</i>");

	output("\n\nShe’s silent for a moment after that. Doesn’t look like she’s going to open up more than that without prodding.");
}

public function kq2KaraPushFriend():void
{
	//You're not letting her get off the hook that easily.

	output("\n\n<i>“If you want me to work with you, you’re going to have to be honest with me,”</i> you say, locking eyes with the cat-girl. <i>“Tell me about this ‘friend’.”</i>");

	output("\n\nKara sighs and runs a hand through her blue hair, pointedly avoiding eye contact with you. <i>“I think ‘friend’ might be too strong a word, anyway. Employer, financier, backer, take your pick. For right now, I work for a man named Lysander Chow. Aside from the Void, he’s one of the most powerful criminals in the galaxy. Non-violent crime, you understand: gambling, whoring, smuggling. I ran cargo on and off for him for years, and he’s... good to his word, if nothing else. His intel’s always been spot on, and I trust it to get me - us - into the base.”</i>");
}

public function kq2KaraThePlan():void
{
	output("\n\n<i>“So, what’s your plan, Kara?{if Misch: We can’t exactly walk into a pirate base.}”</i>");

	output("\n\n<i>“It’s not going to be easy, but I’ve got a unique opportunity here. The pirates are just setting up on Myrellion, bringing in pre-fab buildings and blasting out some caverns near the surface, carving out a sewer. Some kind of bunker underground, too. Security’s going to be {if KaraKind: pretty stringent // KaraMisch: tighter than a princess’s chastity belt // KaraHard: fucking brutal} on the surface, but they’re still building up the sub-levels and sewers, and there’s a chance we could push in through the underground, pop up in the middle of the base.”</i>");

	output("\n\n<i>“The sewers? Really?”</i>");

	output("\n\n<i>“Really!”</i> Kara says, a little defensive. <i>“They’re not expecting trouble - they don’t think anybody knows they’re there. {KaraMisch: P-probably!} It’s a backwater research base, after all. A couple dozen footsoldiers at worst, plus some automated security. But leave that to me - punching through security systems is my speciality. If I can get access to their communications systems or a computer, I’ll be able to shut down the alarms and make sure no reinforcements show up. Once done, we push into the the subterranean research complex, and shut it down. Permanently.”</i>");

	output("\n\n<i>“Any idea what they’re researching, exactly?”</i>");

	output("\n\nKara grimaces. <i>“Bad things. You don’t build a base in the middle of a desert, hundreds of miles away from civilization {if KaraKind: if you’re doing anything short of evil. // if KaraMisch: just because. // KaraHard: unless you have something to hide.} Whatever they’re working on is dangerous, and we’ll all be a lot safer if the Black Void doesn’t succeed in whatever they’re doing. Besides, they picked Myrellion for a reason: this planet’s lousy with weapons of mass destruction. Chemical weapons, nukes, you name it. I wouldn’t be surprised if one of the local factions is supplying them with W.M.D.s, which you </i>know<i> are going to be used against spacers like us. The last thing any of us need is for a piercer rocket to punch into our ship’s hull and fill it with myr lust-gas, turning the whole crew into fuck-hungry animals begging to be enslaved if it means sweet relief.”</i>");

	output("\n\nYour kaithrit companion shakes her head with disgust and crosses her legs. <i>“Anyway, once we shut down the lab, we’ll need to make a quick getaway, unless we want to fight a couple dozen pirates all at once. There’s a launch pad on top of the research building, and I’ve got some experience piloting gunships of the same make and model that the Void uses. That’ll be our exfil.”</i>");
}

public function kq2KarasEyes():void
{
	output("\n\n<i>“{if Kind: Would you mind telling me what happened to your eyes? // if Misch: So, what’s with the peepers? // if Hard: So what’s the story with those eyes?}”</i>");
	
	output("\n\nKara winces, looking pointedly away from you when you ask. <i>“I... lost them. No, that’s too easy. A pirate bitch took them - a Dread Lord of the Black Void, I found out later. She had me dead to rights, was going to chain me up and sell me and my crew as slaves on the black market. We’d gone after the same treasure as the Void, and ended up damaging her ship in the crossfire. I’d intended to go out in a blaze of glory, but somehow we survived... and ended up surrounded by pirate troopers.”</i>");
	
	output("\n\nSelling us would have put a dent in that debt, if a Terran warship hadn’t hit her when it did. The pirate bitch ran, but not before trying to blast my brains all over the deck. Last shot at vengeance for what I did. She missed, mostly, but the laser blast boiled my eyes. My crew pulled me out while the pirates scrambled to get away, and I got patched up at a medbay on New Texas.”</i>");
	
	output("\n\nShe gives a wry chuckle and rubs at her cheeks. Now that she’s this close, with her hood down, you can see faint scarring all around her cyber eyes. <i>“Lucky me, {my ‘friend’ // Chow} was willing to get me some top shelf cyberware to replace them, on top of everything else I owed him afterwards. The only way I can repay a debt like that is this mission for him.”</i>");
}

public function kq2ThisPlace():void
{
	//How did Kara know about this place, anyway? 

	output("\n\n<i>“You didn’t put this place together yourself, did you?”</i> you ask, sweeping a hand out the forward viewscreen.");

	output("\n\nKara laughs. <i>“Oh, no. No. This was going to be used as a smuggling base right after the Rushers discovered Myrellion, before the Damocles Fleet arrived in orbit. After that, well, it’s hard enough to move goods on the down-low without a jumpy Confederate fleet next to your destination. The place was abandoned, and I {if talked about friends: decided to use it as a meet point. No chance of accidental pirate encounters here. //else: found it! Pretty handy, hmm?”</i>}");

	output("\n\n<i>“Definitely useful,”</i> you muse. <i>“Is there anything more to this place? Other than the dock, that is.”</i>");

	output("\n\n<i>“Some tunnels. A few half-built rooms,”</i> Kara answers. <i>“I haven’t explored this place too much. Mostly because there’s no atmosphere anywhere{if KaraMisch: , and space suits just chafe my tails, you know?}. If you want to look around on your time, you’re welcome to - like I said, it doesn’t belong to me.”</i>");

}

public function kq2Herself():void
{
	//Ask Kara about herself. You need to know who you're working with, after all. 

	output("\n\n<i>“I’d like to know a little bit more about you,”</i> you say, looking the blue-haired cat-girl up and down. <i>“{if Kind: I’d like to know who I’m working with, after all. //if Misch: We ought to get to know one another first, right? // if Hard: If you want my help, that is.}”</i>");

	output("\n\n<i>“That’s fair,”</i> Kara chuckles. <i>“I’ll save you the whole sob story, if it’s all the same to you. For the last few years, I was crew on a smuggling vessel: the </i>Silence<i>. She was originally captained by Rourke Blackstar. You might have heard of him.”</i>");

	output("\n\n{if PC = Smuggler: Of course you have. Blackstar was a legend among smugglers, the best of the best. At least, until he got pinched a couple years back. Kara smiles at your recognition. <i>“Good. Then you know what he could do. What he was capable of.”</i>");
	output("\n\n{else: You shake your head. Kara grunts a mute, <i>“Don’t worry about it. {if KaraKind: Suffice to say, he was the best smuggler to ever live. //if KaraMisch: I guess you’re a pretty shitty smuggler if everyone’s heard of you, now that I think about it. //if KaraHard: Can’t expect everyone to know, I guess.”</i>}");

	output("\n\nYour companion sighs and continues: <i>“I was born a slave in a kaithrit colony on Tarilia. The colony was short on males - it’s a problem on a lot of kaithrit worlds - so they kept anything with a dick cooped up as breeding stock. That includes me, if you’re wondering; I was born a hermaphrodite. About ten percent of kaithrit are. Blackstar met me on a run when the planet’s matriarch invited him to tour the ‘pleasure palace’ they kept us chained up in. Long story short: he liked me, and helped bust me out. I’ve been on the run ever since. I served under him on the </i>Silence</i>, learned the tricks of the trade, and when he was captured on Terra, I took command of the ship. Most of the crew bought their farms with him or got pinched by the Peacekeepers... or bailed out after the stunt I pulled with the Void. All that’s left is me{ and my first mate. // , my first mate, and a V.I. in a robot.} Not much of a crew.”</i>");

	output("\n\nAfter a moment’s consideration, you ask, <i>“I thought you said your ship was the </i>Ghost<i>?”</i>");

	output("\n\n<i>“Heh. About that... {if KaraKind: The </i>Silence</i> got destroyed by the Black Void the last time we tangled. // if KaraMisch: I might have sort of rammed a Black Void frigate with the </i>Silence</i>. It seemed like a good idea at the time, honest! //elseif KaraHard: I rammed a Black Void warship with the </i>Silence</i>. Crippled one of their best ships and killed dozens of pirates, though I lost the ship in the process. I’d do it again in a heartbeat.} Lucky me, my backer saw fit to replace her with a new ship: the </i>Ghost<i>. Brand new, sleek as hell, and tougher than </i>Silence<i> ever was.”</i>");

	output("\n\nShe sounds like she’s trying to convince herself on that last point as much as she is you.");
}

public function kq2InitTalkNext():void
{
	//You've heard enough. Time to make your choice.
	//Remove previous options, add new ones.

	output("\n\n<i>“I think I’ve heard enough.”</i>");
	
	output("\n\n<i>“Good,”</i> Kara says with a smile. <i>“So, are we in business? Help me out, and 30,000 credits are yours. Plus whatever you want to loot from the Void base - I’m just there to {if KaraHard: wreck shit // else: hurt the bastards}.”</i>");

	clearMenu();
	addButton(0, "DontTrust", kq2DontTrust);
	addButton(1, "LetsGo", kq2LetsGo);
	addButton(2, "No", kq2NotGonnaHappen);
}

public function kq2DontTrust():void
{
	//Tell Kara that you don't trust her. 

	output("\n\n<i>“I don’t trust you,”</i> you bluntly state. {if talked about Black Void: <i>“You’ve already lied to me once. //else <i>“I don’t think you’re being straight with me.} I’m not trusting my life with you.”</i>");
	
	output("\n\nShe winces, chewing on her lip as your words sink in. <i>“I guess that’s fair. I wouldn’t ask anyone to go into a fight without trusting me. I just wish there was some way to change your mind...”</i>");

	addDisabledButton(0, "DontTrust");

	addButton(5, "PayFirst", kq2PayFirst);
	addButton(6, "Sex", kq2SexFirst);
}

public function kq2PayFirst():void
{
	//Tell Kara you might trust her if she payed you up front.
	//Append to previous scene

	output("\n\n<i>“Payment up front would help.”</i>");
	
	output("\n\nKara looks nervously around before drawing out a small datachit and swiping it through a small computer on her wrist. <i>“Uh, yeah, I guess that makes sense. Let’s call it halvsies, alright? Half now, half after?”</i>");
	
	output("\n\nThat’s pretty reasonable, you figure.");

	addDisabledButton(5, "");
	addDisabledButton(6, "");
	flags["KQ2_CREDS_FIRST"] = 1;

	//When PC hits [I'm In], grant PC 15,000C
}

public function kq2SexFirst():void
{
	//Tell Kara you might trust her if she threw in a more... <i>personal</i> incentive. 

	output("\n\n<i>“I could think of a few ways,”</i> you say, letting your eyes play across the cat-girl’s figure. With that black catsuit hugging her body like it is, there’s no hiding her lush curves - the swells of her breasts and butt, the flare of her hips, the long lengths of her legs...");
	
	output("\n\nYour gaze hardly goes unnoticed. Kara shifts ever so slightly, just enough to make her bust jut out against the front of her cloak, the twin mounds’ full size on display for you. Her lips twitch into a small smile and she purrs, <i>“Hey, now, I’ve paid you well already, haven’t I? And I’m offering to pay you a pretty penny this time, too... but if you want to talk about </i>bonuses<i>,”</i> she chuckles, <i>“Well, maybe you and I can work something out after the mission.{if KaraMisch: If you’re a good {boy/girl}, that is... //if KaraHard: If you don’t get yourself killed, anyway.}”</i>");

	addDisabledButton(5, "");
	addDisabledButton(6, "");
	flags["KQ2_SEX_PAY"] = 1;
}

public function kq2LetsGo():void
{
	output("\n\n<i>“Alright, I’m in,”</i> you say, extending a hand to Kara.");
	
	output("\n\nShe grins from ear to ear and shakes it hard. <i>“You’re the best, [pc.name]. I knew I could count on you.”</i>");
	
	output("\n\n<i>“So what’s next?”</i> you ask. Kara answers by hopping up to her feet and grabbing her case, starting towards you airlock.");
	
	output("\n\n<i>“Next... we go down to the planet. We’ll take my ship, if it’s all the same to you. </i>Ghost<i> is rigged with a high-end stealth system, and she’s fast and quiet besides. We’ll fly right under the pirates’ radar, land near their base, then hoof it in.{If KaraMisch and PC has hooves: Literally, in your case!}”</i>");
	
	output("\n\nKara waves you on after her, leading you back through the airlock cycle and onto her ship, and the beginning of your next adventure...");

	if (flags["KQ2_CREDS_FIRST"] == 1) pc.credits += 15000;

	clearMenu();
	addButton(0, "Next", kq2QUESTTIME);
}

public function kq2NotGonnaHappen():void
{
	//No way. Find someone else. 

	output("\n\n<i>“Sorry. Find someone else,”</i> you answer.");
	
	output("\n\nKara huffs and crosses her arms under her chest. <i>“Fine. I can probably find someone else... yeah, no problem. Sorry for bringing you out here for nothing, [pc.name].”</i>");
	
	output("\n\nYou nod as the kaithrit turns to leave. She gives you a wink over her shoulder before stepping through the hatch and back onto her own vessel. <i>“See you around, I guess, [pc.name].”</i>");
	
	output("\n\nYou wave, and the kaithrit vanishes through the airlock. A moment later and the docking tube disconnects, freeing you to take the helm and take off to a new destination.");

	clearMenu();

}

public function kq2QUESTTIME():void
{
	clearOutput();

	output("\n\nA moment later and you’re aboard the <i>Ghost</i>, Kara’s ship, looking around at the sleek, bright white of the interior. She’s a new ship, still squeaky clean and polished to a shine. Consoles run along the length of every corridor you pass through on the way to the bridge. The whole ship has an oddly sterile feel - not like the cozy home you’ve made out of your own ship.");

	if (flags["SILENCE_RESCUED_CONNIE"] != undefined)
	{
		output("\n\nAs you’re walking, a side passage in the corridor slides open with a hiss, and a pale blue beauty sashays out into your path. You blink hard as the robotic bombshell smiles at you with big, ultramarine lips, putting her hand on a set of broad hips that strain the band of her skin-tight yoga pants. Her flat, sleek belly is left bare, all the way up to a too-tight black sports bra that’s somehow hugging back a set of tits that would look more at home {if met Irellia: on a gold myr queen // on a hyperporn star - and emphasis on the hyper}! {if met Gianna: She looks a lot like a certain New Texan companion droid you know - maybe they’re the same model?}");

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

	output("\n\n<i>“{if KaraMisch: Being a sexy stranger sure helps,”</i> Kara winks, pointedly ignoring a renewed pout from her second. //else: I guess of all the random spacers in that bar, I picked right,”</i> Kara grins.}");
	
	output("\n\nLogan rolls her reptilian eyes and turns back to the pilot’s console. <i>“Anyway, welcome aboard, [pc.name]. Pick a seat and strap in, should be ready to take off in a couple minutes.”</i>");
	
	output("\n\nYou {if Misch: make a beeline for the captain’s seat, only to be rebuffed by Kara, and sent packing to one of the weapons consoles // take a seat at one of the weapons consoles} beside Logan. She gives you a slight nod and turns her attention to her controls, fingers flying across the holographic interface. A moment later, you hear a distant <i>thunk!</i> as the docking umbilical disconnects, and a faint thrum shakes the deck as the engine spools up, and the <i>Ghost</i> starts to slide back through the hollowed out tunnel in the rock.");
	
	output("\n\nYou take a deep breath and lean back, letting the crew of the <i>Ghost</i> ferry you towards your next adventure.");

	clearMenu();
	addButton(0, "Next", kq2QUESTTIMEII);
}

public function kq2QUESTTIMEII():void
{
	output("\n\nThe trip goes by quickly and peacefully, until you hit the arid atmosphere of Myrellion. The ship shudders with turbulence, and you watch as Logan hammers several controls on a console above her. Part of the forward screen flickers off, replaced by a bird-eye view of the desert - some kind of probe’s camera, maybe? The second screen focuses in on some kind of walled compound sitting the bottom of a deep caldera, surrounded by nothing for miles and miles around. You squint, and think you make out all of three, maybe four buildings on the surface.");
	
	output("\n\nNot much of a base.");
	
	output("\n\n<i>“Bring us in low, Logan. Nice and easy,”</i> Kara says casually, leaning back in her captain’s chair with legs crossed. <i>“Any sign of Void ships?”</i>");
	
	output("\n\n<i>“None,”</i> your pilot calls back, flipped a button that replaces your view of the base with a radar image of the surrounding airspace: totally blank.");
	
	output("\n\nKara nods slowly. <i>“Alright, drop the rear hatch and bring us in. We’ll drop on that plateau, just ahead. [pc.name], you’re with me. We’re gonna fast rope onto the surface. Stealth system keeps us off their LIDAR, but doesn’t help much if we’re kicking up dust right on their front porch.”</i>");
	
	output("\n\nShe hops up and grabs that silver case of hers, still closed. You follow her off the bridge and through the gently-curving alabaster corridors of her ship, all the way to the freighter’s opposite end and down a short elevator ride to the cargo deck. {Connie’s waiting there for you, standing at an almost military at-ease as the cargo ramp slides down beside her. <i>“Best of luck, captain.”</i>}");
	
	output("\n\nWind whips past your face, threatening to either blast you back or suck you out with equal force. {Connie leans out with a robotic surety, securing a hook to an auto-loader cable on the roof and kicking out a long length of synth-silk rope, a hundred feet or more tumbling to the dirt. Kara tosses you a pair of climber’s gloves before grabbing on and sliding down and out of sight. You give the helpful robot a nod and grab the rope, following the <i>Ghost</i>’s captain down to the surface. // Kara tosses you a pair of climber’s gloves before shoving you aside and rushing past, right towards the lowering door. You have just enough time to blink before she spins on a heel, gives you a wink, and dives backwards out the door.");
	
	output("\n\nIt takes you a moment to realize there’s a huge bundle of synth-silk rope training after her, suddenly going taut as she lands. You let out a breath you hadn’t realized you were holding and grab it, following her down.}");

	clearMenu();
	addButton(0, "Next", kq2QUESTTIMEIII);
}

public function kq2QUESTTIMEIII():void
{
	output("\n\n<i>“Whoo!”</i> Kara laughs, making way as you drop to the ground beside her. {if Silly and Taur: Lucky you, you had your special centaur rocket-booties to help you down! Ropes and ladders would be a pain without them!} <i>“Alright. There should be a way down into the sub-levels just down the caldera. Ready?”</i>");
	
	output("\n\nAs she speaks, Kara steps back from you, finally unlatching the big silver case she’s been lugging around. You watch her{if med+ lust/high libido: appreciatively as she bends over to pop the case open, lifting her tails high and showing off a remarkable ass under that catsuit // as she leans over the case and pops it open}. Rather than opening, though, the handle on the case just slides up with her hand, attached to a black mass of metal that snaps out front and back into a barrel, stock, and magazine.");
	
	output("\n\nWhen she stands, Kara’s got a sleek black marksman’s rifle in her hands. She flips a holo-scope out of its chromed box and snaps it onto the former-handle, completing the package. The slide racks with liquid ease, chambering what looks like a big, meaty bullet.");
	
	output("\n\nKara grins at you, resting her rifle on her shoulder. <i>“Like what you see?”</i>");
	
	output("\n\nShe snickers before you can answer, turning towards the cliff’s edge. Above you, the <i>Ghost</i>’s engines sputter, and it turns on a dime before blasting off the way it came, towards a safe hiding spot out of view. <i>“C’mon. Let’s go give these pirate bastards a wake-up call.”</i>");

	flags["KQ2_KARA_WITH_PC"] = 1;

	// 9999 place in first room
}

public function kq2MeetWatson():void
{
	output("\n\n<i>“Gimme a sec, looks like security’s sealed the door. Should be just a moment,”</i> Kara says, yanking a wire from her wrist computer and attaching it to a small panel beside the door. A holo-display pops up around her hand, and she gets to work punching through the firewall. It barely takes a minute for her to finish.");
	
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

	output("<i>“So, what exactly are you?”</i> you ask, eyeing the hologram as it puffs on its pipe.");
	
	output("\n\nIt chuckles slightly, completely devoid of humor. <i>“Why, my dear [pc.boyGirl], I should like to think the correct question is ‘who’ am I? But I digress, this is hardly the moment for a discussions on the higher philosophies of artificial intelligences. Suffice to say, I am Watson. I oversee the Black Void’s operations.”</i>");
	
	output("\n\n<i>“What operations?”</i> your companion asks.");
	
	output("\n\nAgain, the A.I. chuckles dryly. <i>“Why, my dear girl, all of them. You’ll pardon a bit of bragging, but I am the most sophisticated artificial intelligence in the galaxy, bar a few specimens quite beyond the understanding of yourselves, and have several trillion credits’ resources at my disposal - for processing and the like, you understand. Ah, and before you excite yourselves, please understand that I’m hosted quite a distance from you - several systems away, in fact. I’m in no danger if you carry out your plans. Aren’t quantum communications remarkable?”</i>");

	addDisabledButton(0, "Watson");
}

public function kq2WatsonTalkKara():void
{
	clearOutput();

	output("<i>“So, what exactly do you pirates have against Kara?”</i>");
	
	output("\n\nWatson blows a particularly large puff of smoke in the kaithrit’s direction and rolls his eyes. <i>“My dear [pc.boyGirl], we’ve nothing against miss Volke personally. However, she is responsible for a great deal of damage being inflicted upon Lord Bragga’s flagship, putting the </i>Black Rose<i> out of commission for several months. I’m also told she’s also responsible for several dozen deaths among our organization’s foot-soldiery, though that’s of much less concern. Forgivable, where several billion credits’ worth of damage to a warship is not. For that insult, she must suffer.”</i>");
	
	output("\n\n<i>“We’ve come this far. And now, we’re going to blow up your precious base. I’m not afraid of you, you little shit,”</i> Kara snaps, scowling at the portly avatar.");
	
	output("\n\nWatson chuckles. <i>“My dear girl, you very well should be.”</i>");

	addDisabledButton(1, "Kara");
}

public function kq2WatsonTalkConstellation():void
{
	clearOutput();

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

	addDisabledButton(2, "Constellation");
}

public function kq2WatsonTalkIntervention():void
{
	clearOutput();

	output("<i>“You know Kara and I came here to put a stop to your research,”</i> you say, stepping closer to the projector. <i>“And you don’t seem too keen on stopping us.”</i>");
	
	output("\n\nWatson laughs, his voice full of condescension. <i>“My dear [pc.boyGirl], you misunderstand me. Of course I intend to stop you. In fact, I already have. The moment you set foot in the sub-levels - the sewers - I began the process of uploading all the data stored here on the base to different servers. Destroying the equipment here now is a futile, if childish, gesture. A few thousand credits of hardware lost, a drop in the bucket. At worst, if you kill or disable Doctor Khan, you’ll set us back by a few weeks until we can find a replacement. You are a small and insignificant bump along the path we tread, little more.”</i>");
	
	output("\n\n<i>“Son of a bitch!”</i> Kara screams, pounding her fist on the wall.");
	
	output("\n\n<i>“Indeed,”</i> Watson adds, clenching his pipe between his teeth and reaching out beside him. A holo-map of the Myrellion system flickers into place, showing several vessels closing in. <i>“Every moment you’ve been within this base, every soldier you’ve killed, every second wasted in pointless battle, has been a delaying tactic whilst I recall this base’s commander, Lord Faell, from her patrol of the outer moons. I estimate you have less than five seconds before the first troop transports set down on-base.");
	
	output("\n\n<i>“So please, make yourselves at home. Sit, relax. You still have a few moments before your lives are over. Use them wisely.”</i>");
	
	output("\n\nWatson flickers out of existence, leaving you in the dark.");
	
	output("\n\n<i>“God... no,”</i> Kara moans, slumping against the wall. <i>“We’re fucked.”</i>");
	
	output("\n\n<i>“Come on!”</i> you shout, grabbing her by the arm. <i>“We have to get out of here!”</i>");
	
	output("\n\nWith a little encouragement, Kara collects herself. <i>“Right... right. Before we leave, there’s something I need to know. Let’s get to Khan’s office. I need to see something.");
}

public function kq2WatsonSelfDestruct():void
{
	clearOutput();

	output("<i>“Fuck it, let’s be childish!”</i> you grin, grabbing a holo-board from one of the nearby servers and typing in a few commands. Kara’s hacking has given you more or less unlimited systems access, for what little good it does you. But there is one thing you could manage...");

	output("\n\nSure enough, there’s a self destruct routine buried deep in the command console. A quick glance tells you there’s a pocket nuke buried somewhere deep beneath the base: enough to wipe the place out, but the base’s position in the depths of the caldera should keep the blast from hurting any myr.");
	if (pc.IQ() >= 10) output(" Of course, you do remember something about a fleet ready to glass the planet overhead, if a nuclear launch -- or blast, you suppose -- is detected....");

	output("\n\nDo you risk it?");

	clearMenu();
	addButton(0, "Nuke It", kq2NukeIt);
	addBUtton(1, "No", mainGameMenu);
}

public function kq2NukeIt():void
{
	clearOutput();

	output("You rip the console’s wireless plug out, just in case Watson’s watching, and hit the activation sequence. Here we go!");

	output("\n\n<i>“Nuclear Cleansing System Activated,”</i> a feminine voice drones from the console. <i>“Detonation in T-minus: 10 minutes. Please get to minimum safe distance.”</i>");
	
	output("\n\n<i>“Wait, what did you just do?”</i> Kara blinks, ears perking straight up. <i>“Woah, wait, didn’t you hear about that... that fleet in orbit? They’ll glass the whole planet!”</i>");
	
	output("\n\nCalculated risk. You grab Kara by the shoulder and shove her towards the door - you’ve got get out of here, NOW!");

	flags["KQ2_NUKE_STARTED"] = GetGameTimestamp();

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function kq2EnterEngineersRoom():void
{
	if (flags["KQ2_ENGINEER_NUM_DRONES"] == undefined) flags["KQ2_ENGINEER_NUM_DRONES"] = 1 + rand(4);

	if (flags["KQ2_LEFT_ENGINEER"] == undefined)
	{
		clearOutput();

		output("You step into the security room, and immediately are greeted by the sound of low, metallic grating that’s almost like growling. You take a step back as a huge, black canine robot stalks out of the shadows, its teeth bared. Behind it stands a small, feminine figure - not quite four feet in height, with svelte curves that are muted by a ballistic breastplate that’s much too bulky for its user. She’s nearly naked aside from the plate and a pair of high-heeled boots... and a jockstrap that’s barely holding back a pair of oversized testicles, out of which bobs a six-inch canine cock. The diminutive creature scowls at you, hands on her hips, the pair of bunny-ears atop her head lying flat back against her scalp, showing off a pair of demonic-looking horns that sprout out from her orange hair.");
		
		//9999
		output("\n\n{It takes you a good moment to realize the creature’s a lapinara, clearly unlike those you’ve seen before! // It takes longer than usual for your Codex to identify the creature as a lapinara, of the non-parasitic variety.}");
		
		output("\n\n<i>“How did you get past all the guards!?”</i> she growls, staring {up at you // straight at you} with a pair of huge green eyes. <i>“Get out of here, or my pet{s} will rip you to shreds!”</i>");
		
		output("\n\nAfter a moment, she adds, <i>“A-and I’ll shoot you, too! Just for good measure!”</i>");

		// [Fight] [Leave] [Bribe]
		clearMenu();
		addButton(0, "Fight", kq2FightEngineer, flags["KQ2_ENGINEER_NUM_DRONES"]);
		addButton(1, "Leave", kq2LeaveEngineer);
		addButton(2, "Bribe", kq2BribeEngineer);
	}
	else
	{
		output("<i>“You again!?”</i> the lapinara screeches as you shove the door open. <i>“Th-that’s it! I gave you a warning. Go get {him/her}, pupp{y/ies}!”</i>");
		
		output("\n\nLooks like it’s a fight!");

		clearMenu();
		addButton(0, "Next", kq2FightEngineer, flags["KQ2_ENGINEER_NUM_DRONES"]);
	}
}

public function kq2FightEngineer(numDrones:int):void
{
	foes = [];
	foes.push(new KQ2BlackVoidEngineer());

	for (var i:int = 0; i < numDrones; i++)
	{
		foes.push(new KQ2FenrisDrone());
	}

	startCombatLight();
}

public function kq2LeaveEngineer():void
{
	clearOutput();
	flags["KQ2_LEFT_ENGINEER"] = 1;

	output("You cautiously step back out of the security room, and quickly have the door slammed in your face.");

	currentLocation = "KQ2_BARRACKSINTERIOR";
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function kq2BribeEngineer():void
{
	clearOutput();
	output("<i>“Come on. Maybe we can work something out?”</i> you suggest, raising your hands disarmingly.");
	
	output("\n\nThe hermaphroditic lapinara cocks an eyebrow and crosses her arms over her chest. <i>“Maybe... maybe we can, yeah. I’ll give you my keycard, and you fuck off to wherever you’re going if you...");

	//[Sex] [Money] [Dirty Magazine]
	clearMenu();
	addButton(0, "Sex", kq2GibEngyDankHoles, undefined, "Sex", "Bend over and let the lapinara bust a nut in your backside in exchange for the keycard.");
	addButton(1, "Money", kq2GibEngyCash, undefined, "Money", "Give the lapinara some money in trade. Considering who she works for, it'd probably take 1,000 credits to convince her.");
	if (pc.hasKeyItem("Hentai Magazine")) addButton(2, "DirtyMag", kq2GibEngyDirtyMag, undefined, "Dirty Magazine", "Try and pawn off that dirty magazine Kara gave you on the lapinara.");
}

public function kq2GibEngyDirtyMag():void
{
	clearOutput();

	output("<i>“...give me that magazine!”</i> she says, pointing to the hentai comic sticking out of your pack.");
	
	output("\n\nWell, that’s a pretty low price. You take it out and give it to the tiny dick-girl, noticing her cock harden as she takes possession of it. Her dog{s} growl{s} at you until you back off again a little ways. Their owner clutches the magazine, quickly leafing through the brightly-colored pages - and gaining a little color in her cheeks in the process.");
	
	output("\n\n<i>“So. Keycard?”</i>");
	
	output("\n\nShe looks up, startled. <i>“Uh. Yeah, sure. Card, whatever,”</i> she says, grabbing a card off of the desk behind her and shoving it into your hand. <i>“Now fuck off.{if convinced Steph to do porn: I’ve been waiting for the first issue of </i>Galactic Fucktress<i> for ages!}”</i>");
	
	output("\n\nSomewhat amazed that actually worked, you take the keycard and leave the lapinara engineer to her business.");

	pc.createKeyItem("Key Card - R&D Security Pass");
	output("<b>New Key Item: Key Card - R&D Security Pass</b>.");

	currentLocation = "KQ2_BARRACKSINTERIOR";
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function kq2GibEngyCash():void
{
	clearOutput();

	output("<i>“...give me a thousand credits!”</i> she says, extending a hand to you, palm open and expectant. You dig a credit chit out of your pack and plant it in her outstretched hand. The engineer squeals in excitement, bouncing around on her powerful legs. <i>“Score! Take the card, I’m going on a SHOPPING SPREE! Whoo!”</i>");
	
	output("\n\nShe grabs a keycard off of the desk behind her and tosses it at you. You narrowly catch it away from the fangs of {one of her} cyber-hound{s}, and quickly make your way out of the security office.");

	pc.createKeyItem("Key Card - R&D Security Pass");
	output("<b>New Key Item: Key Card - R&D Security Pass</b>.");

	currentLocation = "KQ2_BARRACKSINTERIOR";
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function kq2GibEngyDankHoles():void
{
	clearOutput();

output("\n\n<i>“...bend over and let me fuck you!”</i> the lapinara finishes, thrusting her crotch at you. Her bright red puppy pecker bobs eagerly, a tiny glint of moisture already on its tip. <i>“All the other pirates call me a parasite and won’t touch me! Please... I’m so horny, I’ll trade the card for just a quick fuck.”</i>");

output("\n\n{if Kara is with the PC: <i>“I’ll just, uh, wait outside.... Cover the door for you.”</i> Kara says, slipping away.}");

output("\n\nYou suppose fucking <i>is</i> preferable to fighting, and tell the diminutive slut as much. She grins, practically bouncing in place, and orders her pet{s} to stand down - for now. <i>“Great! Now just grab something and {if quadruped: just... uh, brace yourself! //else: bend over.} Don’t worry, I’ve got some lube somewhere around here...”</i>");

output("\n\n{if PC is really ass-loose and/or wet: You doubt a dick that size would <i>need</i> any to get into you, but you let the lapinara have her fun for now. //else: That’s a relief!} You shrug out of your [pc.gear] and stretch yourself out over one of the computer consoles, putting your [pc.butt] on display for the tiny engineer. She shows her appreciation with a gentle caress, rubbing her small fingers all along the curve of one of your cheeks.");

output("\n\nA little moan escapes her lips as she teases you. <i>“Mmm. Such a nice ass... I’ve waited soooo long for this,”</i> she purrs, planting her other hand on your opposite hip. She pulls herself in, digging her face right into the crack of your [pc.butt] {if big butt: and giving you a little back-door motor boat //else: and lapping her tongue through it, making you shiver with the sensation}. With a gasp of excitement, the girl manages to pull herself off of you long enough to say, <i>“Don’t worry. Gonna treat this ass right.”</i>");

output("\n\nShe reaches down and grabs the bottle of lube she’d promised, squirting a nice helping of cool liquid into her hand, and across your bare cheeks. You shiver at the coldness of it, but the sensation quickly fades as the lapinara goes to work, rubbing the lube into your skin and shepherding it towards your [pc.asshole]. A shock of pleasure runs through you as one of her fingers pushes into you, opening you just wide enough to let a steady stream of lube trickle in after in.");

output("\n\n<i>“Like that?”</i> your anal-obsessed lover asks, using her other hand to rub your butt, just enough to relax you a little around her probing digit. {if PC is at minimum height: Her finger feels not unlike a cock inside your tiny body, thrusting into you enough to make your ([pc.cock] jump to attention // body flush with heat) // if PC is bigger than 6 ft OR super loose: At least, that’s her intention. Truth be told, you can barely feel her in there, her finger’s so small compared to (you // the cocks you’re capable of pleasuring). You push back against her hand, urging her lube-slick digit deeper, making sure she slathers as much of your passage as she can.");

output("\n\nSatisfied with her work, the lapinara slowly withdraws from you. <i>“Okay, {let me go find a box to stand on!”</i> she says excitedly, scrounging up a small supply crate and dragging it up behind you. She scrambles up onto it, putting her more on level with your much larger frame. // let’s do this!”</i> she cheers, grabbing your [pc.hips].} Her six-inch puppy-dick slides up between your lubed-up cheeks, its pointed head rubbing through your crack and gently teasing your [pc.asshole]. Instinctively, your fingers dig into the edge of the console, stretching yourself out over it and wiggling your hips back against the lapinara’s canine cock.");

output("\n\nShe giggles as your backside slips and slides around her member, all but sucking her in. It’s just a slight shift of her own slender hips to put her crown flush against your asshole, and push in. Your breath catches as the pointed tip spreads your hole open, making room for her thicker shaft to follow it in. Her fingers dig into you, squeezing your ass, and she lets out a low, husky moan. <i>“Fuuuuck. Oh, that’s good. {So tight, too! You’re gonna make me work for it, huh? // And so loose! I feel like I’m just sliding in!”</i>}");

output("\n\nYou give the lapinara a little grin over your shoulder, and relax in her hands, enjoying the feeling of her prick inside you, {stretching you out // filling your cock-hungry hole}. After a moment of penetration, you quickly feel a tiny bump of thickness press against your hole - the knot at the base of her dick. The tiny engineer presses it against you, seeming to think about it for a moment before withdrawing, and starting to thrust. Your lover goes from slow to full throttle before you can blink, pounding away at you thanks to the ample helping of lube coating your anal walls. She moans like a whore, and you soon hear her breastplate clattering to the ground, letting her pinch and grab at her small breasts. Her other hand, however, slips down around your [pc.hip], starting to {caress your [pc.cunt] // rub the tender, sexless [pc.skinFurScales] of your crotch // wrap her fingers around your [pc.cock], bringing it from an excited half-mast to full attention. Her hand is still slathered with cool, slick lube, and she’s able to glide across your member with ease, returning the pleasure you’re giving her own member.} You let yourself moan in answer to her wandering hand, pushing back against her six-inch pole to take it deeper, trying to feel every inch of throbbing hot dog-meat inside you.");

output("\n\nA few heart-pounding moments of thrusting later, and your lapinara lover is screaming and jackhammering her hips, slamming them into your [pc.butt] with wild abandon. You can feel her {tiny / girthy} prick swelling inside you, straining to hold back her orgasm; her knot batters against the rim of your hole, swollen to nearly the size of its owner’s fist and demanding entrance. You’re only just able to push the swollen member back - you can’t spend <i>that</i> kind of time here, waiting for her to untie you. The lapinara makes a pleading moan when you rebuke her knot, but doesn’t push the issue: her attention is snatched away in a moment but a surge of seed rushing through her member and into your eagerly awaiting posterior. She screams her pleasure, slamming herself as deep into you as she can before unloading a thick rope of hot and creamy spunk across your anal walls.");

output("\n\nYou wince as you feel her cum pour into you. It’s much hotter than you were expecting, like a stream of boiling cream flooding into you and searing your walls. Giving a low groan of your own, you dig your fingers into the desk and try and bear it, gasping and moaning as the engineer continues to thrust into you as she cums. Your bowels get a thorough spunk-basting by the time she’s done, filling you with more lapinara cum than you’d have thought such a tiny girl could produce, even with those massive balls she was toting around.");

output("\n\nThe lapinara grunts as she pulls herself out of you, trailing a sticky web of spooge behind her. A little trickle of it leaks out of your well-fucked hole, drooling down your thigh. <i>“Whoo! I’ve never fucked a butt quite like that!”</i> she coos, wiping off the last traces of her orgasm off on your upraised ass. She flops back in a chair behind one of the desks and tosses a keycard to you. <i>“You earned it. Hehe, I’ll be fapping to this memory for a loooong time.”</i>");

output("\n\nYou spend a moment catching your breath, letting your body cool down from the rough buttfucking, before grabbing the card, cleaning up as best you can, and rejoining Kara outside.");

output("\n\n<i>“Score!”</i> you say, holding up the card.");

output("\n\n<i>“I guess you’re a lover, not a fighter, huh?”</i> she chuckles.");

	pc.createKeyItem("Key Card - R&D Security Pass");
	output("<b>New Key Item: Key Card - R&D Security Pass</b>.");

	currentLocation = "KQ2_BARRACKSINTERIOR";
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function kq2EncounterKhan():void
{
	clearOutput();

	output("You give Kara slight nod, signaling her to pop the hatch and open the door. You go in first, [pc.rangedWeapon] raised. The sealed lab hits you with a sultry heat the moment you step in, clinging to your [pc.skinFurScales] as your [pc.feet] tread through something wet and sticky covering the white floor. The lab’s a mess compared to the sterile facility you just passed through: computers and machinery is turned and toppled all over, and covered in a thick, musky white goo.");
	
	output("\n\nYou hear a click from across the lab, and have just enough time to dive behind an overturned desk before a lightning bolt screeches across the room, slamming into the wall just behind where you’d stood a moment ago. A laugh booms across the room, drawing your attention to a small man sitting on what at first glance is a large, tan beanbag chair in the corner of the room, a smoking pistol in his hand. Several young women surround him, gold-plated myr girls in white lab coats that hang open from bare shoulders, leaving their nude bodies underneath on shameless display for you: breasts swollen with honey, and honeypots drooling with blatant desire.");
	
	output("\n\nOnce the immediate excitement of the man’s shot is over, they begin to fawn over him, chitin-clad hands playing across his soft fur, caressing the seat beneath him, falling to their knees around a canine-shaped cock with three large, turgid knots at full mast - though it remains out of their reach, trapped in a hardlight cage not unlike a chastity belt. He’s a kui-tan, the same tanuki-like race as Ambassador Juro, and as you watch him, you can see that’s not a beanbag chair he’s sitting on, but a pair of almost comically swollen testicals, large enough to keep his feet from touching ground.");
	
	output("\n\n<i>“I told you pirate bastards to leave me alone!”</i> the man shouts, snapping off another shot as Kara dives into the room, rolling into cover behind an overturned desk. <i>“You’ll get your devices when they’re damn ready, and not a second before! I’ll not have my work roughshod by impatient peasants who don’t know the meaning of </i>SCIENCE<i>. Nobody rushes DOCTOR SOUTA KHAN!”</i>");
	
	
	output("\n\n<i>“{if KaraKind: Hold your fire! We aren’t pirates! //KaraMisch: We’re not pirates, you crazy furball! //KaraHard: Try that again, asshole! You’re shooting at the wrong people.}”</i>");
	
	output("\n\nHe laughs at that, racking the charger on his lightning gun. <i>“Not pirates? Then you’re just more lab rats, then? How considerate of my masters to replenish my stock... I was getting bored of these girls, anyway!”</i>");
	
	output("\n\nAs he speaks, several small hover drones take off from alcoves in the wall, charging up their own zappers as they ascend, starting to fly towards you.");
	
	output("\n\nLab rats? Something tells you he’s not letting you get past.");

	foes = [];
	foes.push(new KQ2Khan());
	for (var i:int = 0; i < 4; i++)
	{
		foes.push(new kq2FightSecDrones());
	}
	addButton(0, "Fight!", startCombatLight);
}

public function kq2EncounterShade():void
{
	clearOutput();

	flags["KQ2_SHADE_ENCOUNTERED"] = 1;

	// Encounter Text (PC hasn't fucked Shade)
	if (9999 == 0)
	{
		output("As you and Kara rush toward the helipad, you hear a deep, metallic howl echo across the helipad. Kara draws her pistol and skids to a stop near the foot of the stairs leading up to the helipad. A huge, black drone stands at the top of the steps, canid in shape with razor-sharp teeth bared. Another drone peeks over the ledge beside it, and a third howls behind you, leaping up onto the top of the elevator cabin. {They’re like Tam-wolf’s big brothers!}");
		
		output("\n\n<i>“That was a lucky break back at the bar,”</i> a familiar voice says, stepping up behind one of the wolf droids. Shade, the bounty hunter from the myrellion bar, steps into view, a lightning pistol resting on her shoulder. <i>“I guess you have your friend here to thank for that, don’t you, Kara? I think we both know things would have gone differently without {him/her}.”</i>");
		
		output("\n\nKara scowls, leveling her plasma caster at the other kaithrit. <i>“God </i>damn<i>, don’t you ever give up!?”</i>");
		
		output("\n\n<i>“Wouldn’t be much of a bounty hunter if I did,”</i> Shade laughs, whistling to her assault drones. They advance, lowering their heads and growling metallically. <i>“Now, why don’t you and your friend come quietly, hmm?{if didn’t fight Shade: And </i>you<i>, [pc.name]... that was a dirty trick you pulled. Damned scummy... maybe I’ll beat some better manners into you.}”</i>");
		
		output("\n\nNot likely!");

		foes = [];
		foes.push(new KQ2Shade());

		for (var i:int = 0; i < 3; i++)
		{
			foes.push(new KQ2FenrisDrone());
		}

		clearMenu();
		addButton(0, "Fight!", startCombatLight);
		return;
	}
	// Encounter Text: Fucked Shade
	else if (9999 == 1)
	{
		output("As you and Kara rush toward the helipad{, followed quickly by (your new harem of red myr // the group of freed red myr)}, you hear a deep, metallic howl echo across the helipad. Kara draws her pistol and skids to a stop near the foot of the stairs leading up to the helipad. A huge, black drone stands at the top of the steps, canid in shape with razor-sharp teeth bared. Another drone peeks over the ledge beside it, and a third howls behind you, leaping up onto the top of the elevator cabin. {They’re like Tam-wolf’s big brothers!}");
		
		output("\n\nA woman steps up behind the drone atop the stairs, scratching it between the ears. She’s carrying a big, bulky hand-cannon resting on her shoulder, her other hand firmly planted on her hip.");
		
		output("\n\nIt’s Shade.");
		
		output("\n\n<i>Shit.</i>");
		
		output("\n\nThe buxom kaithrit looks down at your and your companion with a mix of contempt and disappointment written across her face. Her eyes settle on you. <i>“Well, this is the last place I ever hoped to run into you, kid,”</i> she says, slowly lowering her lightning gun. <i>“Last person with you, too.”</i>");
		
		output("\n\n<i>“{if KaraMisch: I see you brought friends this time... might actually be a fair fight now! // else: If you want a fight, Shade, come on. We’ll send you packing{ again} if we have to.}”</i>");
		
		output("\n\nShade laughs, humorless, and holsters her gun. <i>“Relax, furball. I see you’ve got... precious cargo with you.”</i> With a sigh, Shade steps out of the way, whistling back her hounds. They whimper and retreat, slowly, never taking their eyes off you. <i>“Go on. Get.”</i>");
		
		output("\n\n<i>“W-what?”</i> Kara says, lowering her own weapon slightly.");
		
		output("\n\nThe huntress chuckles, waving towards the helipad. <i>“Don’t make me regret this... not that you’re likely to get through Amara anyway. Just thank [pc.name] if you do.”</i>");
		
		output("\n\nUncertainly, Kara moves past the other kaithrit, sprinting off towards the helipad. You follow suit, but Shade stops you at the top of the stairs, planting a firm hand on your chest.");
		
		output("\n\n<i>“I don’t like being played, kid,”</i> she whispers. <i>“Even if it was a damn </i>good<i> play. Assuming Amara doesn’t string you and your friend up, I’m gonna have words for you next time we talk.”</i>");
		
		output("\n\nYou nod your understand, and try to move by. She holds you in place for another moment, though: just long enough to plant a small kiss on your cheek. <i>“For luck. You’ll need it.”</i>");
		
		output("\n\n//Restore some PC Health, Energy. Increase +5 Lust.");
		
		output("\n\nShade gives you a slight nod and takes her hand back, letting you pass her by. You rush to rejoin Kara at the helipad...");

		// [Next]
		clearMenu();
		addButton(0, "Next", mainGameMenu);
		return;
	}
}