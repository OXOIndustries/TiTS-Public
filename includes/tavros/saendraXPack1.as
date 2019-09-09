import classes.Characters.SX1GroupPirates;
import classes.Characters.SX1Shotguard;
import classes.Characters.SX1Techguard;
import classes.Creature;
import classes.Engine.Combat.DamageTypes.TypeCollection;
/*

Flagdoc:

SAENDRA_XPACK1_STATUS:
	0/undefined -- not started

	1 -- mail sent to pc, has 6 hours to get to the elevator on tavros
	2 -- pc didn't get to the location in time
	3 -- pc turned up to deck 92 late
	4 -- pc turned up to deck 92 in time
	5 -- pc defeated the pirate group with saen -- rescue available
	6 -- pc defeated the pirate group with saen -- rescue expired
	7 -- started the rescue stuff
	8 -- failed to rescue the dude
	9 -- rescued the dude successfully
	10 -- had post-rescue discussion with saendra
	11 -- talked to saen about her friend post expiry

SAENDRA_XPACK1_RESCUE_SHOTGUARD_STATE:
	0/undefined -- not defeated
	1 -- removed by using the callgirl
	2 -- removed by using bitchkitten titties
	3 -- defeated in combat

SAENDRA_XPACK1_RESCUE_TECHGUARD_STATE:
	0/undefined -- not defeated
	1 -- removed by using the callgirl
	2 -- removed by using holoburn
	3 -- defeated in combat
	4 -- pc lost to the techie

SAENDRA_XPACK1_CREDITOFFER:
	0/undefined -- no change
	1 -- enable option for full donation
	2 -- given her the cash, disabled
	3 -- given her the cash, she's back

*/

public function unlockSaendraXPackMail():void
{
	clearOutput();
	clearBust();
	author("Savin");

	output("Your Codex beeps unexpectedly, alerting you to an incoming extranet message. When you pull your device out, you’re greeted by a message addressed from one <i>“FlyGirl@PhoenixCargo.net.”</i> No bonus points guessing who <i>that</i> is. You flip it open and start to read:");
	
	output("\n\n<i>Hey, hero, are you anywhere near Tavros? Please say yes!</i> the message reads. <i>If you are, I could really use a hand. I’m on Deck 92, up in the construction wing. Expect trouble. Hope I see you soon!</i>");
	
	output("\n\nThe message ends with a big heart-shaped emote.");
	
	output("\n\nYou glance over in the direction of the elevator. Wouldn’t be too hard to answer her request.");

	if (!MailManager.isEntryUnlocked("saendraxpack1")) MailManager.unlockEntry("saendraxpack1", GetGameTimestamp());

	flags["SAENDRA_XPACK1_STATUS"] = 1;
	flags["SAENDRA_XPACK1_TIMER"] = GetGameTimestamp();

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function updateSaendraXPackTimer(deltaT:Number = 0):void
{
	if (flags["SAENDRA_DISABLED"] != undefined || flags["SAENDRA GONNA GO GET A COCK"] == 1 || flags["SAENDRA GONNA GO GET A COCK"] == 2) return;
	
	if (flags["SAENDRA_XPACK1_STATUS"] == 1 || flags["SAENDRA_XPACK1_STATUS"] == 5)
	{
		flags["SAENDRA_XPACK1_TIMER"] += deltaT;

		// Making it to the elevator on time
		if (flags["SAENDRA_XPACK1_STATUS"] == 1 && (GetGameTimestamp() + deltaT) >= flags["SAENDRA_XPACK1_TIMER"] + (6 * 60))
		{
			flags["SAENDRA_XPACK1_STATUS"] = 2; // failed, rip you
		}

		if (flags["SAENDRA_XPACK1_STATUS"] == 5 && (GetGameTimestamp() + deltaT) >= flags["SAENDRA_XPACK1_TIMER"] + (7 * 24 * 60))
		{
			flags["SAENDRA_XPACK1_STATUS"] = 6;
		}
	}
}

public function saendraX1LiftGo():void
{
	clearOutput();
	showName("\nDECK 92");
	author("Savin");
	generateMapForLocation("SX1 FAKE FIGHT ROOM");

	// 2late
	if (flags["SAENDRA_XPACK1_STATUS"] == 2)
	{
		clearBust();
		
		output("The elevator door opens onto an open, dark area. Looks to be under construction, with half-finished walls arranged along an avenue, and heavy equipment lying all over. Tarps and semi-transparent sheets are tacked up on the skeletal outlines of walls, making it almost impossible to see more than a few yards ahead of you. There are no lights on, except dim glow coming from a flashlight lying on the ground. When you take a few steps closer, you see that its sitting in a pool of blood. Not that fresh, either.");
		
		output("\n\nYou spend a few minutes poking around, but nothing comes of it. Looks like whatever action was going on here came and went. Shit.");
		
		processTime(3);

		//Return PC to elevator. Remove Deck 92 from options, remove Saendra from the game.
		flags["SAENDRA_XPACK1_STATUS"] = 3;
		flags["SAENDRA_DISABLED"] = 1;

		clearMenu();
		addButton(0, "Next", mainGameMenu);
	}
	else
	{
		showBust(saendraBustDisplay());
		
		output("The elevator door opens onto an open, dark area. Looks to be under construction, with half-finished walls arranged along an avenue, and heavy equipment lying all over. Tarps and semi-transparent sheets are tacked up on the skeletal outlines of walls, making it almost impossible to see more than a few yards ahead of you. As the elevator door locks open and beeps, a flashlight suddenly clicks on just ahead, blinding you for a moment.");
		
		output("\n\n<i>“Oh, there you are!”</i> Saendra’s familiar voice says as the light swings out of your eyes. You can just make her out, sitting on the edge of a half-finished fountain. Her robotic hand’s clutching a light, you can see, and her other is wrapped around her Hammer pistol.");
		
		output("\n\n<i>“Looks like you’re expecting trouble,”</i> you call over to her, stepping out of the elevator before the doors can close on you.");
		
		output("\n\nSaen’s usual mirth is nowhere to be found. <i>“You could say that. I was supposed to meet somebody here, but he’s been a no-show. I’m starting to get worried.”</i>");
		
		output("\n\nYou make it over to Saen, and give her a hand up. She pulls herself to her feet, and all the way into a hug. It would almost be nice, if not for the cold hardness of her gun’s magazine pressed into the small of your back.");
		
		output("\n\n<i>“So what’s the story?”</i> you ask, looking from Saendra to the half-built deck around her.");
		
		output("\n\nShe clicks her flashlight off and slips it onto her gunbelt. <i>“Like I said, I was meeting somebody. A station tech who was supposed to be getting me something. Fuck knows why he wanted to meet up here, but overriding station security and wandering on up wasn’t exactly hard. But he should have showed before I even sent you that message. I’m getting worried.”</i>");
		
		output("\n\n<i>“You didn’t pay up front, did you?”</i> you chuckle, trying not to let the eerie silence of the deck get to you.");
		
		output("\n\n<i>“That’d imply I have any money,”</i> Saen answers with a half-hearted laugh. <i>“So no. I was going to trade for it. Good old-fashioned barter.”</i>");
		
		output("\n\nAs she says it, Saen pulls a small device out of her blouse - some kind of starship part, you’d guess.");
		
		output("\n\n<i>“Anyway, I don’t want to play damsel in distress or anything, but lightning has a tendency to strike twice with me, if you know what I mean. If you don’t have anything better to do, think you could just... I dunno... sit with me for a bit?”</i>");
		
		output("\n\nBefore you answer, you have to ask: <i>“What exactly is it you were trying to buy, anyway?”</i>");
		
		output("\n\nSaen fidgets a bit, rubbing at the back of her head with her robotic hand. <i>“Docking codes for the station. I’ve got the </i>Phoenix<i> beaten together enough to fly... and <i>probably</i> not explode, too. But the bastard running the garage refuses to clear me to launch. Apparently my girl doesn’t meet ‘Confederate regulation’ standards anymore. Bah.”</i>");
		
		output("\n\nThe holo-projector on Saen’s wrist flickers, and Valeria’s avatar pops up with her hands on her hips and a scowl on her lips. <i>“That’s because it probably WILL explode, you psychopath!”</i> Val snaps, glowering at her mistress. <i>“You’re going to get us both killed!”</i>");
		
		output("\n\n<i>“Am not,”</i> Saen huffs, sounding a little less self-assured.");
		
		output("\n\nWhile the two of them start bickering about whatever plan Saendra’s got up her sleeve, you turn and start looking around the construction site. You imagine they’re building shops here, probably high end judging by the fountain and wide open corridors. Much swankier than the main merchant deck near the hangar, that’s for sure.");
		
		output("\n\nAnd you’re almost certain you can hear a clinking sound coming towards you.");
		
		output("\n\nYou have just enough time to yell <i>“GET DOWN!”</i> when you see a small, black disc sliding across the floor towards your halfbreed friend.");
		
		output("\n\nThe grenade goes off with a deafening KABANG and a blinding flash, burning at your dark-adjusted eyes. You manage to cover your eyes and grab at your [pc.weapon], but the sounds of jackboots pounding on the deck, rushing towards you makes you realize you’re in a hell of a spot. You stumble into the closest thing you can find to cover and rub at your eyes, trying to adjust back to blackness.");
		
		output("\n\nBy the time you’re able to see again, the first things your eyes alight on are a twitching mass of small green lasers flickering across the bulkheads behind you, searching for targets. You’re able to see Saendra across from you, ducking down behind the edge of the fountain with her Hammer pistol shakily held in her hands. Slowly, you risk a peek around the corner of your hole. Several men in heavy armor are moving in from the far side of the merchant square, machine pistols held at their hips.");
		
		output("\n\nWith silent determination, the mysterious assailants storm forward, fingers on their triggers.");
		
		output("\n\nSaendra shoots you a look before leaping to her feet and firing off a shot. One of the assassins at the front of their formation screams and drops, firing his gun wildly into the ceiling and walls. The others start yelling, shooting, and diving for cover.");
		
		output("\n\nHere we go again!");
		
		processTime(7);

		//Pirate fight here
		clearMenu();
		addButton(0, "Next", initsx1PirateGroupFight);
	}
}

public function initsx1PirateGroupFight():void
{
	pc.createStatusEffect("Pitch Black", 0, 0, 0, 0, false, "Icon_Slow", "It’s pitch black here, making it almost impossible to see anything but for bursts of light accompanying weaponsfire.", true, 0);
	saendra.createStatusEffect("Pitch Black", 0, 0, 0, 0, false, "Icon_Slow", "It’s pitch black here, making it almost impossible to see anything but for bursts of light accompanying weaponsfire.", true, 0);
	saendra.long = "";
	saendra.customDodge = "";
	
	var enemies:Array = [];
	
	for (var i:int = 0; i < 4; i++)
	{
		var tEnemy:Creature = new SX1GroupPirates();
		tEnemy.createStatusEffect("Pitch Black", 0, 0, 0, 0, false, "Icon_Slow", "It’s pitch black here, making it almost impossible to see anything but for bursts of light accompanying weaponsfire.", true, 0);
		enemies.push(tEnemy);
	}
	
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors([pc, saendra]);
	CombatManager.setHostileActors(enemies);
	CombatManager.victoryScene(sx1PirateGroupPCVictory);
	CombatManager.lossScene(sx1PirateGroupPCLoss);
	CombatManager.displayLocation("VOID PIRATES");
	CombatManager.beginCombat();
}

public function sx1PirateGroupPCLoss():void
{
	clearOutput();
	showName("DEFEAT:\nVOID PIRATES");
	author("Savin");
	showBust("VOIDPIRATE", "VOIDPIRATE", "VOIDPIRATE", "VOIDPIRATE");

	generateMapForLocation("SX1 FAKE FIGHT ROOM");

	output("You slump to the ground, completely unable to put up even token resistance anymore.");
	if ((pc as Creature).hasEquippedWeapon()) output(" Your [pc.mainWeapon] clatters out of your hands, and is quickly stomped on by a jackbooted thug.");
	output(" You look up, in the barrel of a machine pistol, and can’t help but clench down in preparation for the inevitable.");
	
	pc.removeEquipment("weapons");
	
	output("\n\nIt doesn’t come. Instead, you’re roughly grabbed by plated hands and rolled onto your stomach. Your hands are cuffed behind your back, completely restrained as the other assassins grab Saendra and drag her off, kicking and screaming.");
	
	output("\n\n<i>“Stay down, kid,”</i> the man over you growls, making the barrel of his gun painfully apparent against your spine.");
	
	output("\n\nOut of the corner of your eye, you watch Saen get slammed down onto the side of the fountain. A few moments later, the elevator dings open behind you, and another figure strides into the corridor. A woman, dressed in an all-red jumpsuit under a black longcoat. Her flowing dark hair half-conceals a face that’s a network of scars and tattoos that wrap around an eyepatch.");
	
	output("\n\n<i>“[pc.HimHer] again?”</i> the woman growls, pointing at you. <i>“The same white knight from before? I’m almost impressed.”</i>");
	
	output("\n\nShe scoffs and closes the distance between her and Saendra, grabbing the halfbreed by the hair and yanking her head back.");
	
	output("\n\n<i>“Saendra. I’m disappointed in you.”</i> the woman says, scowling down at Saendra. <i>“After all we’ve done for you, this is how you repay us? And now you’re dragging civilians into it? Tsk, you should know better than that. Look at what you’ve done.”</i>");
	
	output("\n\nThe woman twists Saen’s face, making her look at you. One of the heavy-armored men around you rears back the butt of his weapon and cracks you in the back of the skull. You see stars and reel from the impact.");
	
	if(pc.HPRaw > 15) applyDamage(new TypeCollection( { unresistablehp: 15 }, DamageFlag.BYPASS_SHIELD ), null, pc, "minimal");
	
	output("\n\nThe woman reaches down and grabs one of Saendra’s tits, reaching right into her shirt. Saen recoils, struggling against the men holding her down.... until her hand comes back with a small data chit, still stuck to a piece of tape.");
	
	output("\n\n<i>“You really thought you could steal from us? You God damn idiot, Saendra. What were you thinking?”</i>");
	
	output("\n\nSaen stares the woman - the pirate, you guess - in the eye for a second, and spits in her face.");
	
	output("\n\n<i>“Is that all you have to say? So be it,”</i> the pirate woman says, wiping the insult from her cheek. <i>“Fine. Gentlemen, escort Saendra back to the </i>Rose<i>. We’ll deal with her there. Maybe Carver has an opening in her roster this year, hmm?”</i>");
	
	output("\n\n<i>“Fuck you, Miri,”</i> Saen growls as a pair of armored men heft her to her feet and drag her off.");
	
	output("\n\nAs your companion is dragged off, another pirate points your way and asks his commander, <i>“And what about this one? To the slaver, too?”</i>");
	
	output("\n\nThe pirate woman, Miri, approaches you. You’re hefted to your [pc.knees], and the woman leans in to look you in the eye. <i>“One interference I could understand,”</i> she says. <i>“You just bumbled into the </i>Phoenix<i> business, thought you were playing hero for a damsel in distress. But twice now? No, I can’t allow this.”</i>");
	
	output("\n\nShe turns from you to the soldier holding you. <i>“Give [pc.himHer] to Carver. The full break.”</i>");
	
	output("\n\n<i>“Aye, Lord Bragga,”</i> he says, hauling you up to your [pc.feet] and dragging you towards the elevator. You’re thrown against the far wall of the elevator when it opens, behind the soldier. He pushes a button, down to one of the docks. You feel your hopes of freedom slipping away with every deck. You’re going to spend the rest of your life as a sex slave, all because you wanted to help a friend. Fuck you for being nice, right?");
	
	processTime(25);

	badEnd();
}

public function sx1PirateGroupPCVictory():void
{
	clearOutput();
	showName("VICTORY:\nVOID PIRATES");
	author("Savin");
	showBust("VOIDPIRATE", "VOIDPIRATE", "VOIDPIRATE", "VOIDPIRATE");

	generateMapForLocation("SX1 FAKE FIGHT ROOM");

	output("The last of the assassins drops to his knees, several bullet holes smoking in his armor. Saendra twirls her pistol around her finger, blows the smoke off the barrel, and drops it into her holster.");
	
	output("\n\n<i>“Who the hell </i>were<i> they?”</i> you ask between gasping breaths.");
	
	output("\n\n<i>“WHAT!?”</i> Saen yells, rubbing at her feline ears. <i>“WHAT DID YOU SAY!?”</i>");
	
	output("\n\nYou shout a little louder, <i>“Who were they!?”</i>");
	
	output("\n\n<i>“I CAN’T HEAR YOU. MY EARS ARE RINGING.”</i> she yells, flailing at you. <i>“YOU OKAY!?”</i>");
	
	output("\n\nYou nod and, seeing as Saen’s not being very helpful, walk over to the bodies. They’re armored like proper soldiers, clad head to foot in vacuum-sealed plates over a skin-tight suit. Mercenaries or pirates, probably... actually, now that you think about it, the colors on their plates are distinctly reminiscent of the boarding party you saved Saen from back aboard the <i>Phoenix</i>. No way they tracked her all the way here. Did they?");
	
	output("\n\nYou turn to Saen and give her a look, which she answers with a loud declaration of <i>“MAWP”</i> while she rubs her ears. You mutter a small thanks to your nano-docs for repairing your hearing damage about as fast as it happens.");
	
	output("\n\nThanks to that, you’re able to hear the elevator ding into place. You");
	if ((pc as Creature).hasEquippedWeapon()) output(" [pc.readyWeapon] and");
	output(" grab Saendra’s shoulder, shoving the both of you into cover and out of sight. You pull Saendra tight against yourself, wrapping your arm around her belly. She has the sense to shut up and draw her gun, clumsily swapping magazines just before the elevator slides open.");
	
	output("\n\nLight floods into the darkened corridor, and a trio of people stride out - two more armored men, and a woman in a skin-tight red jumpsuit, worn under a flowing black longcoat. The woman’s dark hair half-conceals a face that’s a network of scars and tattoos that wrap around an eyepatch. One of her gloved hands rests on the hilt of a saber at her hip; the other carries a sleek laser pistol.");
	
	output("\n\n<i>“Fuck,”</i> one of the armored goons says, waving a flashlight over the corridor full of bodies and hot brass. <i>“How did one woman do all this?”</i>");
	
	output("\n\n<i>“I told your men not to underestimate her, captain,”</i> the woman says, holstering her pistol. <i>“And the man she was supposed to be meeting?”</i>");
	
	output("\n\nThe ‘captain’ grunts and rests his gun on his shoulder. <i>“He’s been taken care of. Stashed him in a private room at Anon’s, just like you asked.”</i>");
	
	output("\n\nThe woman nods. <i>“Good. I’ll be down to collect him shortly.”</i>");
	
	output("\n\nShe turns on a heel and re-embarks onto the elevator. Her soldiers follow her, leaving you and Saendra in darkness. You release a breath you hadn’t known you’d been holding, and your vice grip on Saendra’s belly relents, letting the halfbreed slip out of your arms.");
	
	output("\n\n<i>“Shit,”</i> she sighs, holstering her gun again. She’s still half-shouting over the ringing in her ears. <i>“How the fuck did she find me?”</i>");
	
	output("\n\n<i>“Who </i>was<i> that?”</i>");
	
	output("\n\nSaen shrugs. <i>“I, uh... look, we can talk about this later, hero. My buddy’s in trouble because of me, and I’m gonna go bail him out. Meet you back at the bar!”</i>");
	
	output("\n\nThe halfbreed runs off towards the elevator bank, disappearing into the car you’d taken up. She gives you a wink as the door closes, taking her back down to the merchant decks.");
	
	output("\n\n...And now you’re going to have to wait for another elevator.\n\n");
	
	processTime(15 + rand(8));

	flags["SAENDRA_XPACK1_STATUS"] = 5;
	flags["SAENDRA_XPACK1_TIMER"] = GetGameTimestamp();

	// [Next] //Put PC back in elevator. Saendra returns to the bar as usual.
	CombatManager.genericVictory();
}

public function sx1TalkFriend():void
{
	clearOutput();
	saenHeader();

	flags["SAENDRA_XPACK1_STATUS"] = 7;

	output("<i>“Hey,”</i> you say, reaching across the table to take Saen’s robotic hand. <i>“That friend of yours... did you find him?”</i>");
	
	output("\n\n<i>“Yeah, actually. He’s here, at the bar. Just upstairs, like the pirate said. I saw one of the rooms with an armed guard outside. Not, like, some dude in power armor or anything, but a guy trying not to be too obvious leaning on the wall all the time, playing with a cigar he won’t light. Pretty sure I saw a machine pistol under his coat.”</i>");
	
	output("\n\nSaendra fidgets, eyes locking on your hand. <i>“I, uh, I’d knock him out myself, but I don’t know what’s in the room. Could be a lot more assholes. They even put a block on the room’s sensors when I sent Val in to check.”</i>");
	
	output("\n\n<i>“They know we’re coming,”</i> Valeria adds, flickering up onto Saendra’s mechanical wrist. Her avatar stumbles back when it materializes next to your hand, and she ends up falling onto her holographic butt. <i>“Probably, anyway. The pirates you and Saen saw at the elevator have most likely alerted their friends here at Anon’s.”</i>");
	
	output("\n\nThat makes things interesting. <i>“Want some help?”</i> you offer, squeezing Saen’s hand.");
	
	output("\n\nThe halfbreed’s cheeks flush a little red. <i>“You don’t have to, hero. It’s not your fight. God knows I’ve dragged you into too many of my problems already.”</i>");
	
	output("\n\nYou assure her that you’re willing. You’ve come this far after all.");
	
	output("\n\nSaen smiles at that, her twin tails swishing loudly on the leather seat. <i>“Alright, alright. Keep this up and I’m not going to be able to solve </i>any<i> of my own problems,”</i> she teases with a wink, hopping up from her seat and adjusting the gunbelt on her hip.");
	
	output("\n\n<i>“Please don’t shoot up the bar!”</i> Val whines, fluttering after Saendra. <i>“We really need the free room and board here!”</i>");
	
	output("\n\n<i>“Yeah, yeah, I know,”</i> Saen huffs. <i>“[pc.name] and I will think of something, won’t we?”</i>");
	
	output("\n\nShe gives you a hand up onto your [pc.feet], and you follow her towards the stairs...");
	
	processTime(3);

	clearMenu();
	addButton(0, "Next", sx1TalkFriendII);
}

public function sx1TalkFriendII():void
{
	clearOutput();
	saenHeader();
	generateMapForLocation("HOTEL CORRIDOR");
	
	output("You and Saendra walk up the stairs behind the bar, towards the small hall of rooms for rent Anon’s sports. It’s small and undecorated, steel walls straight down a ten foot corridor. A fluorescent light flickers uneasily overhead, casting dark shadows across the dull gray bulkheads.");
	
	output("\n\nYou hear muffled moans and distant thumps against the walls, sounds of pleasure echoing from the handful of side rooms as you pass them. A man in a long, heavily worn brown coat is standing with his back to one of the doors, chewing on the butt of an unlit cigar. His hands are shoved into his pockets. The handful of self-defense classes Dad put you through tip you off to the way the man’s right pocket seems weighed down by something heavy... like a gun.");
	
	output("\n\nSaen gives you a look and falls behind you,");
	if (pc.tallness < 60) output(" awkwardly hiding her face behind your tiny form");
	else output(" trying to hide behind you");
	output(". That should give you a momentary advantage -- just enough to get you close to the guard. You pick up the pace, trying to seem as nonchalant as you can until you’re within striking range.");
	
	output("\n\nThe man looks up, chomping his cigar and sneering at you. <i>“");
	if (pc.isMasculine()) output("Move along, bro.");
	else output("Hey, sweetheart. You lookin’ for a good time?");
	output("”</i> he growls, turning towards you...");
	
	if (pc.PQ() >= 80)
	{
		output("\n\n... and right into a sucker-punch to the face. You deck the bastard, putting him down with one swift strike to the eye. He grunts and crumples, lying motionless on the floor.");
	
		output("\n\n<i>“Nice hit!”</i> Saen cheers, taking a knee beside the unconscious guard and lifting his wallet.");
	}
	else if (pc.AQ() >= 80)
	{
		output("\n\nYou lunge forward, sinking your fist right into his gut. He gasps for the wind you just knocked out of him, pulling his gun just in time for the tentacle-probe in Saendra’s wrist to shoot out and wrench it out of his hand.");
		
		output("\n\nThe hapless guard crumples to his knees and promptly gets a boot in the face from your halfbreed companion. He grunts, lying motionless on the floor.");
		
		output("\n\n<i>“Good teamwork!”</i> Saen grins, taking a knee beside the unconscious guard and lifting his wallet.");
	}
	else
	{
		output("\n\nYou take a swing at him, but the guard nimbly dodges out of the way of your fist, drawing his own weapon in the same fluid motion. Behind you, Saen hisses a curse and dives for it, tackling the guard to the ground and burying her knee in his crotch. He groans, and his weapon goes clattering across the floor.");
		
		output("\n\n<i>“Fuck off!”</i> Saendra growls, sucker-punching him with her robotic arm. The guard grunts and crumples, lying motionless on the floor.");
		
		output("\n\nWith a sigh of relief, Saendra sits back on her knees and runs a hand through her crimson hair. <i>“Let me handle the rough stuff next time,”</i> she teases, clenching her chromed fist. <i>“I punch harder.”</i>");
		
		output("\n\nYou bite back a comment as she lifts the guy’s wallet and crawls off of him.");
	}
	
	output("\n\nJust like Saen had suggested, you find a compact machine pistol next to the guard’s unconscious body."); // and pick it up. <b>You acquire a SecureMP</b>
	
	processTime(8);
	
	clearMenu();
	addButton(0, "Take It", sx1LootSecureMP);
	addButton(1, "Leave It", sx1TalkFriendIII);
}

public function sx1LootSecureMP():void
{
	clearOutput();
	saenHeader();
	generateMapForLocation("HOTEL CORRIDOR");
	
	output("You snatch up the pistol from the guards body, hefting it in your grip with ease. Feels... pretty light actually, but not in a bad way.");
	output("\n\n");

	lootScreen = sx1TalkFriendIII;
	itemCollect([new SecureMP()]);
}

public function sx1TalkFriendIII():void
{
	clearOutput();
	saenHeader();
	
	generateMapForLocation("HOTEL CORRIDOR");
	
	output("<i>“Okay, I don’t think anybody heard that,”</i> Saendra says, pulling the Hammer pistol off her hip. <i>“Or if they did, they probably figured it was that busty callgirl next door slamming her headboard into the wall again. Trust me, it was only sexy listening to her moaning all night the first time,”</i> she laughs.");
	
	output("\n\nThe way Saen’s cheeks tint with red, something tells you she did more than just listen to the local call-girl at that...");
	
	output("\n\n<i>“Alright, how do you want to do this, hero?”</i> she asks, nodding towards the door. <i>“We could go in guns blazing, but that’s going to draw a lot of attention. Anybody back in the bar could be a pirate in disguise, or the ones in there might call for reinforcements. Might get me kicked out of my free digs, too.”</i>");
	
	output("\n\n<i>“Any other suggestions, then?”</i>");
	
	output("\n\nSaendra shrugs. <i>“I’m not a subtle girl, hero. I’m good with a gun, a pilot’s stick, a cock, and my tools. If that gives you any ideas, I’m all ears.”</i>");
	
	output("\n\nAs if for emphasis, her feline ears twitch at you.");
	
	processTime(1);

	sx1PuzzleOfDoomMenu();
}

public function sx1PuzzleOfDoomMenu():void
{
	clearMenu();

	addButton(0, "Door Breach", sx1DoorBreach, undefined, "Door Breach", "Do it the old-fashioned way. Kick the door in and take down the pirates.");

	addButton(1, "Call Girl", sx1SeeCallgirl, undefined, "Call Girl", "Maybe you could throw that call girl next store some credits to distract the guards...");

	if (flags["SAENDRA_XPACK1_ASKEDSAEN"] == undefined) addButton(2, "Saendra", sx1AskSaendra, undefined, "Ask Saendra", "Get your favourite bitchkitten’s professional input.");
	else addButton(2, "Distract", sx1SaenDistract, undefined, "Distract", "Have Saendra pop her tits out and distract one of the guards.");

	if (flags["SAENDRA_XPACK1_ASKEDVAL"] == undefined) addButton(3, "Valeria", sx1AskValiera, undefined, "Ask Valeria", "Pitch an idea to Saendra’s holographic best friend...");
	else if (flags["SAENDRA_XPACK1_ASKEDVAL"] == 1) addButton(3, "Holo Burn", sx1Holoburn, undefined, "Holo Burn", "Try and overload the rooms electronics, and fry whoever’s jacked into the computer system in there.");
	else addDisabledButton(3, "Holo Burn");

	if (pc.characterClass == GLOBAL.CLASS_SMUGGLER || pc.hasItemByClass(FlashGrenade)) addButton(4, "Flashbang", sx1ThrowFlashbang, undefined, "Flashbang", "Throw a flashbang in and storm the room.");
	else addDisabledButton(4, "Flashbang", "Throw Flashbang", "You don’t have any flashbangs to hand.");
}

public function sx1AskValiera():void
{
	clearOutput();
	showValeria();
	author("Savin");
	generateMapForLocation("HOTEL CORRIDOR");

	flags["SAENDRA_XPACK1_ASKEDVAL"] = 1;

	output("<i>“Hey, Valeria?”</i> you say, leaning in towards Saendra’s wrist.");
	
	output("\n\n<i>“Hi, [pc.name],”</i> the holo-fairy chirps, fluttering around the halfbreed’s mechanical arm. <i>“Anything I can do to help?”</i>");
	
	output("\n\n<i>“You said you were trying to hack into the room earlier, right?”</i>");
	
	output("\n\nThe fairy nods eagerly. <i>“I tried to access the bar’s security system, but I got blocked. And not by any countermeasure I’ve ever seen when I poked around Anon’s systems before. I think the pirates probably have a tech with them who’s plugged into the network.”</i>");
	
	output("\n\nSo, they’re monitoring the computer network... You ask the fairy <i>“Anything else?”</i>");
	
	output("\n\nValeria glances around and, after a moment’s thought, says <i>“I don’t know... the way the countermeasure hit me when I poked my nose in, it was way more intelligent... more creative... than your average V.I. watchdog. The way it worked, I think somebody in there may be physically jacked into the network, maybe using a holoset.”</i>");
	
	output("\n\nHmm... Maybe you could use that to your advantage.");
	
	processTime(1);

	sx1PuzzleOfDoomMenu();
}

public function sx1AskSaendra():void
{
	clearOutput();
	saenHeader();
	flags["SAENDRA_XPACK1_ASKEDSAEN"] = 1;

	generateMapForLocation("HOTEL CORRIDOR");

	output("<i>“So, any ideas?”</i>");
	
	output("\n\nSaendra shrugs. <i>“I mean, aside from shooting bitches? I guess we could try and honeypot ‘em... I could put on a sweet voice, tell them their boss sent some pleasure. Maybe flash ‘em my tits when they open the door while you bum-rush ‘em.”</i>");
	
	output("\n\nWhen you don’t eagerly agree, Saen pouts and crosses her arms under her generous assets, hefting them up. <i>“What? Come on, nobody can resist these big beauties. Hell, the pirates will probably just want to cuddle up with me and use ‘em as pillows...");
	if (saendra.hasCock()) output(" Aaaaand now I have a boner. Dammit, [pc.name].");
	output("”</i> Saen chuckles to herself, running a thumb across one of her little teats.");
	
	output("\n\n<i>“Anyway. What I </i>actually<i> mean is we can try and draw ‘em out somehow. Take them out one at a time, or at least weaken the group inside.”</i>");
	
	output("\n\nMaybe...");
	
	processTime(1);

	sx1PuzzleOfDoomMenu();
}

public function sx1SeeCallgirl():void
{
	clearOutput();
	showZilCallGirl();
	author("Savin");
	generateMapForLocation("CALLGIRL ROOM");

	if (flags["SAENDRA_XPACK1_CALLGIRLSTATE"] == undefined)
	{
		flags["SAENDRA_XPACK1_CALLGIRLSTATE"] = 1;

		output("You ask Saendra to point out the room the call girl works out of. She nods to the door next to where you’ve been standing, from which comes a loud <i>thump</i> and a grunt of orgasmic male pleasure.");
		
		output("\n\n<i>“Hide that guy,”</i> you whisper, waving a hand at the body as you make your way over to the whore’s door. Saen growls something under her breath, hooks her hands under the guard’s legs, and starts dragging him off towards a janitor’s closet at the end of the hall.");
		
		output("\n\nYou knock, and hear an immediate response of a guttural grunt and a zipper zipping. A second later and the door swings open, revealing a towering green-skinned");
		if (CodexManager.entryViewed("Thraggen")) output(" thraggen");
		else output(" alien");
		output(" wearing combat trousers and a leather jacket with no shirt underneath, a very satisfied look on his face. He gives you a surprisingly friendly nod as he passes, leaving the door wide open as if inviting you to take his place inside.");
		
		output("\n\nSitting on the edge of a bed just past the door is a");
		if (!CodexManager.entryViewed("Zil")) output(" yellow-skinned, vaguely insectile woman");
		else output(" zil female");
		output(" with long, lustrous black hair spilling down her back and full, round breasts that would make a porn star jealous looming heavily over a corset made of chitin, hinting at a very flat, firm belly beneath it. A pair of long, pink leggings encircle her legs, but she’s otherwise nude, and you can see a very distinct patch of white staining the black lips of her sex, left over by the burly alien just with her.");
		
		output("\n\n<i>“Another one already?”</i> she smiles, leaning back and planting her arms on the bed, giving you a much better look at her bountiful bosom. <i>“Mmm, busy day today. You’ll have to give me a minute to clean up, honey... unless you like sloppy seconds. It’s certainly the most fun kind of lube.”</i>");
		
		processTime(2);
	}
	else
	{
		output("The callgirl is still sitting in her room, applying a bit of makeup when you walk back in.");
		
		output("\n\n<i>“Change your mind, honey?”</i> she asks, voice full of lascivious suggestion. <i>“Why don’t you come on in and let me take care of you...”</i>");
	}

	//[Okay...] [Job] [Nevermind]
	sx1CallgirlMenu();
}

public function sx1CallgirlMenu():void
{
	clearMenu();
	if (pc.credits >= 500 && (pc.hasCock() || pc.hasVagina()) && flags["SAENDRA_XPACK1_CALLGIRLSTATE"] != 2)
	{
		addButton(0, "Okay...", sx1CallgirlOkay, undefined, "Okay", "Well, you can probably spare a few minutes...");
	}
	else if (pc.credits < 500)
	{
		addDisabledButton(0, "Okay...", "Okay", "You don’t have enough credits!");
	}
	else if (!pc.hasCock() && !pc.hasVagina())
	{
		addDisabledButton(0, "Okay...", "Okay", "As nice as a quick romp with the callgirl sounds, you’d need some genitals to fully enjoy the experience...");
	}
	else
	{
		addDisabledButton(0, "Okay", "Okay", "Saen probably wouldn’t take too kindly to you literally fucking around any longer.")
	}

	if (pc.credits >= 500) addButton(1, "Job", sx1CallgirlOfferJob, undefined, "Offer Job", "Offer the Callgirl 500 credits to distract the guards.");
	else addDisabledButton(1, "Job", "Offer Job", "You don’t have enough credits to offer the Callgirl!");

	addButton(2, "Never Mind", sx1CallgirlNevermind);
}

public function sx1CallgirlNevermind():void
{
	clearOutput();
	showZilCallGirl();
	author("Savin");
	generateMapForLocation("CALLGIRL ROOM");

	output("<i>“Aww. Nervous, hun?”</i> the callgirl coos, blowing you a kiss. <i>“Go ahead and take your time. I’ll be here.”</i>");

	sx1PuzzleOfDoomMenu();
}

public function sx1CallgirlOkay():void
{
	clearOutput();
	showZilCallGirl();
	author("Savin");
	generateMapForLocation("CALLGIRL ROOM");

	flags["SAENDRA_XPACK1_CALLGIRLSTATE"] = 2;
	pc.credits -= 500;

	output("<i>“I don’t have a lot of time,”</i> you admit as you step into the whore’s room and slide the door closed. It seals with a pneumatic hiss, leaving the two of you alone and basking in the heady mix of incense, sweat, and sex that clings to the air of her room.");
	
	output("\n\nYour heart flutters as the callgirl smiles and spreads her legs invitingly, patting a thigh. <i>“Then I’ll just have to take care of you quickly. Don’t worry, honey: same pleasure, half the time, or the next one’s on the house...”</i>");
	
	output("\n\nWell, that’s an offer that’s hard to refuse. You shuck your [pc.gear] and stride over to the bed, pressing the alien beauty onto her back with a confident hand. She giggles, and lets her legs ride up around your [pc.hips], curling around you. You lean in and drink deep of her scent, rich and honey-link, mixed with the sheen of sweat from her last encounter, and the musk rising from between her legs where the alien’s seed is cooling.");
	
	output("\n\n<i>“Ohh, you </i>are<i> eager, aren’t you?”</i> the alien beauty coos, black lips pressing against yours. A long tongue finds its way out to play with yours, wrapping around your [pc.tongue] and drawing you deeper into her embrace.");
	
	output("\n\nWith a talented mouth like hers, it’d be a shame not to put it to good use...");
	
	output("\n\n<i>“Is that so?”</i> she says as you explain your desires. <i>“I think I can make all your dreams come true, then.”</i>");
	
	output("\n\nYou smile at her and run a hand along the cup of her of her soft, squeezable breasts. Steadily moving up her lush body, you brush your thumb over the sin-black flesh of her nipple, her slender shoulders, finally hooking it into her lip and gently pulling at the lush, dark rim of her mouth. You start to crawl up the");
	if (CodexManager.entryViewed("Zil")) output(" zil");
	else output(" exotic");
	output(" woman’s slender frame, kissing and caressing until your");
	if (pc.hasCock())
	{
		output(" [pc.cocks]");
		if (pc.cocks.length == 1) output(" is");
		else output(" are");
		output(" dangling");
	}
	else
	{
		output(" [pc.cunts]");
		if (pc.vaginas.length == 1) output(" is");
		else output(" are");
		output(" poised");
	}
	output(" over her mouth.");
	
	output("\n\nShe giggles and brushes her chitinous fingers along");
	if (pc.hasCock()) output(" the length of [pc.oneCock]");
	if (pc.hasCock() && pc.hasVagina()) output(" and up to");
	if (pc.hasVagina()) output(" the lips of [pc.oneCunt]");
	output(". A shiver of pleasure meanders through your spine as the lusty alien teases you, her long tongue reaching out to caress your sex. Her hands grab your [pc.butt], squeezing you and drawing you in until her");
	if (pc.hasVagina()) output(" tongue is pressing in between your lips");
	else output(" lips are pressed to your [pc.cockHead], opening wide to swallow your [pc.cock]");
	output(".");

	if (pc.hasCock())
	{
		output("\n\nYou chew your lip and ease your [pc.cock] between the alien babe’s lush, black cockpillows. She moans and takes all you have to give her, wrapping her lips around your prick and sucking hard. She wasn’t kidding about half the time, double the pleasure.... You grunt and dig your fingers into the sheets of her bed, pistoning your hips forward into her welcoming mouth.");
		
		output("\n\nYou quickly find yourself using her face like a tight little pussy, pounding away at her wet depths and shadowy lips. The alien vixen puts on like she loves every second of it, moaning and groaning and arching her back. Her plated fingers squeeze your ass, even giving you a playful smack as if to say <i>“More! More!”</i>");
		
		output("\n\nPressing her deeper into the bed, you fuck the");
		if (CodexManager.entryViewed("Zil")) output(" zil");
		else output(" alien");
		output("’s mouth as hard as you can. Her tongue works wonders, wrapping around your [pc.cock] in a sultry, wringing grasp. Every time you thrust between her lips, she moans lasciviously and seems to draw you deeper in, inviting you to ram your meat down her throat.");
		
		output("\n\nA few minutes of the alien beauty’s oral treatment brings you to the edge, and then over it with a spectacular series of moans and grunts. You hilt your prick in her mouth and let loose a");
		if (pc.cumQ() <= 100) output(" trickle of cum onto the back of her throat");
		else if (pc.cumQ() <= 250) output(" a few squirts a spooge down her throat");
		else if (pc.cumQ() <= 1000) output(" hefty load of spunk down her throat, making her gag on your virile load");
		else output(" torrential load of seed down her throat, bloating the alien girl’s belly with the sheer volume of your orgasm");
		output(".");
	}
	else
	{
		output("\n\nYou smile down at the exotic beauty and use a pair of fingers to spread your pussylips open, inviting the");
		if (CodexManager.entryViewed("Zil")) output(" zil");
		else output(" alien");
		output(" to explore your depths with that lengthy tongue of hers. She does so eagerly, flicking it along your inner lip");
		if(pc.hasClit()) output(" and tracing her way around your [pc.clit]");
		output(". You shiver with pleasure, moaning and groping at your [pc.chest] as she works her lascivious art.");
		
		output("\n\n<i>“What a lovely taste!”</i> the yellow wasp-girl coos, kissing her way");
		if(pc.hasClit()) output(" from your clit");
		output(" down to the gently-throbbing passage of your sex. You drink in a deep, long breath of air that twists into a husky moan when the alien babe’s tongue slithers into you. Ohhh, that’s the stuff! You bite your lower lip and gently rock your hips, riding her face and that writhing, thick tongue of hers.");
		
		output("\n\nThe callgirl controls her tongue with a serpentine grace, wiggling it against your juicy walls and hitting all the tenderest spots along the way. Your hand runs through her spiney, raven-black hair, urging her deeper and deeper into your quivering quim. Juices trickle down onto her face, smearing her black lips and chin with a glistening sheen of your mounting excitement.");
		
		output("\n\nA few minutes of the alien beauty’s oral treatment brings you to the edge, and then over it with a spectacular series of moans and grunts. You press your [pc.cunt] flush with her lips, getting as much of that squirming muscle inside you as you can before your climax washes over you in a wave of screaming ecstasy and gushing fem-cum. Your partner giggles as you orgasm all over her, splattering her face with girl-spunk.");
	}

	output("\n\n<i>“My, that was something,”</i> the");
	if (CodexManager.entryViewed("Zil")) output(" zil");
	else output(" waspy alien girl");
	output(" smiles, running a black-plated finger through the coating of juices on her face. <i>“I wish you weren’t in such a hurry... I’d love to have a repeat performance if-”</i>");
	
	output("\n\n<i>“[pc.name]!”</i> you hear from the door, along with a gentle knock. <i>“Come on already, what’s taking so long!?”</i>");
	
	output("\n\nThe callgirl tsks her tongue and takes the credit chit you slip her. <i>“Thank you, honey. Now go and tend to your woman... I’ll be here.”</i>");

	pc.orgasm();

	processTime(25);

	//Callgrill's menu
	sx1CallgirlMenu();
}

public function sx1CallgirlOfferJob():void
{
	clearOutput();
	pc.credits -= 500;
	showZilCallGirl();
	author("Savin");
	generateMapForLocation("CALLGIRL ROOM");

	output("<i>“Hey, so, my buddy is over in the next room,”</i> you lie, pulling a credstick out of your pocket. <i>“It’s his birthday, you know, and I was thinking maybe...”</i>");
	
	output("\n\nThe alien whore smiles, her lush black lips reflecting the candlelight of her room. <i>“Ah, how generous of you,”</i> she coos, crawling up off the bed and slinking over to you. She takes the credit chit, pressing herself flirtatiously close as she does so. <i>“Your friend’s lucky to have you... I’ll make sure he knows that by the time I’m done.”</i>");
	
	output("\n\nYou give her a nod and step out of the way, letting her walk over to the pirates’ room while you grab Saendra and scamper off out of sight. The call-girl saunters up to the door, raps her knuckles on it, and leans suggestively against the door frame, thrusting her bare chest out until one of her breasts is pressed against the cold metal.");
	
	output("\n\n<i>“Delivery!”</i> she croons, cupping the other breast and rolling the black nipple between her fingers, drawing out a sweet drop of amber nectar.");
	
	output("\n\nThe door opens a moment later, revealing a rough-looking man in a long duster, face covered in dark stubble. <i>“Wh-what the-”</i> he grunts, eyes going wide.");
	
	output("\n\n<i>“Your friend thought you deserved a little something special,”</i> the");
	if (CodexManager.entryViewed("Zil")) output(" zil");
	else output(" alien");
	output(" woman purrs, hooking her fingers into the front of the pirate’s ballistic vest and pulling him invitingly towards her room. <i>“Why don’t you come with me, hmm?”</i>");
	
	output("\n\n<i>“Uh,”</i> the pirate grunts, pulling at his collar. Over his shoulder, he calls, <i>“Sam, you think you can hold down the fort for a couple minutes?”</i>");
	
	output("\n\n<i>“Yeah, whatever,”</i> a woman’s voice says from inside. <i>“Go... do whatever you’re gonna do. Ya pig.”</i>");
	
	output("\n\nThe man scoffs and turns back to the alien callgirl, smiling wide. One of his hands slips back around her waist, grabbing a handful of yellow-skinned butt. The whore giggles and leads the pirate out of the room he’s supposed to be guarding, and into hers. The door slides closed behind them, and it’s not a minute later that you hear low moans and squeaking bed springs.");
	
	output("\n\n<i>“Wow, that actually worked,”</i> Saendra laughs, drawing her gun again and jogging over to the pirate door. <i>“Guess that guy was more of a lover than a... uh, security guard.”</i>");
	
	output("\n\nYou chuckle, and knock on the door.");
	
	output("\n\n<i>“God dammit,”</i> a woman shouts from inside. <i>“I’m working in here, Mike. Use your damn key.”</i>");
	
	output("\n\nYou and Saen exchange a glance, and you knock again.");
	
	output("\n\n<i>“MIKE I SWEAR TO GOD,”</i> the woman bellows, and you hear something metallic thumping onto the ground. <i>“How the FUCK did you lose your key. Did it fall up that whore’s cunt?”</i>");
	
	output("\n\nThe door’s lock cycles, and you’re face to face with a blonde ausar girl in a tank top with a pair of holo-band goggles pulled up on her forehead. She’s scowling hard when she opens the door, but then goes wide-eyed when she realizes you’re not her partner.");
	
	output("\n\n<i>“Knock knock!”</i> Saen says, cracking the woman over the head with the butt of her pistol.");
	
	output("\n\nThe pirate tech collapses with blood spilling out of her nose, leaving you and Saen to hop over her body and into the room. It’s a small, cramped space with peeling wallpaper and dim lights that barely let you see. A bed has been pushed against the northern wall, opposite a metal desk where a truckload of computer gear is set up.");
	
	output("\n\nSitting on the bed with ropes tied around his arms and legs is a grizzled looking human who’s clearly had some better days: he’s gotten roughed up pretty good, and his mechanic’s outfit’s been darkened with blood and grease. Saendra runs over to him and grabs the man’s shoulders.");
	
	processTime(5);

	flags["SAENDRA_XPACK1_RESCUE_SHOTGUARD_STATE"] = 1;
	flags["SAENDRA_XPACK1_RESCUE_TECHGUARD_STATE"] = 1;

	// go to rescue scene
	clearMenu();
	addButton(0, "Next", sx1RescueTheDude);
}

public function sx1Holoburn():void
{
	clearOutput();
	showValeria();
	author("Savin");
	generateMapForLocation("HOTEL CORRIDOR");
	
	output("<i>“Valeria, think you can overload the power in there?”</i> you ask, jerking a thumb to the pirates’ door.");
	
	output("\n\nThe little holo-fairy shakes her head apologetically. <i>“Not from digital space. I’m equipped for basic security tasks, but I don’t have the training protocols to go toe to toe with their hacker. You’d have to do it manually, [pc.name].”</i>");
	
	if (pc.characterClass != GLOBAL.CLASS_ENGINEER)
	{
		output("\n\nWell, shit. You’ll have to find another way.");
		flags["SAENDRA_XPACK1_ASKEDVAL"] = 2;
		sx1PuzzleOfDoomMenu();
		return;
	}
	else
	{
		output("\n\nYou can do that. <i>“Find me a access port and-”</i>");
	
		output("\n\n<i>“There’s one right there,”</i> Val says, flying over to a small panel on the wall. <i>“If you know what wires to cross, you should be able to cause a power surge. If I’m right, the pirates’ hacker is plugged into a holobank computer inside. Cause an overload, and you’ll knock him out at the very least.”</i>");
		
		output("\n\nSounds good. You crouch down and, with Saen’s help, pull the panel off of the wall and start to pull wires. With a little help from your halfbreed companion and her fairy partner, you find the right wires to cross and converters to boost until the panel erupts in a cloud of sparks and smoke.");
		
		output("\n\nFrom the pirates’ room, you hear a shriek of pain and a heavy thud, like a body collapsing. A second later and the door slams open, and a burly guy wearing a duster over a ballistic vest storms out, a shotgun at the ready.");
		
		output("\n\nSaendra has just enough time to yell <i>“Shit!”</i> before bullets start flying.");
		
		processTime(3);

		flags["SAENDRA_XPACK1_RESCUE_TECHGUARD_STATE"] = 2;

		// [Fight!] {Go to Shotgun Guard fite}
		clearMenu();
		addButton(0, "Fight!", sx1InitShotguardFight);
	}
}

public function sx1SaenDistract():void
{
	clearOutput();
	saenHeader(true);
	generateMapForLocation("HOTEL CORRIDOR");
	
	output("<i>“Alright, we’ll go with your plan,”</i> you tell Saendra, eyeing her mouthwatering rack. <i>“Let’s lure the bastards out.”</i>");
	
	output("\n\nShe laughs and pulls her shirt up over her head, letting her pink-tipped tits pop free. She gives a jubilant little bounce and saunters over to the pirates’ door, putting herself on full display as she knocks. You put your back to the wall, out of sight of whoever might answer.");
	if (pc.isTaur()) output(" Then again, with a gigantic animal body like yours, you’re not exactly hard to spot...");
	
	output("\n\nThe door opens a few moments later, revealing a burly, gruff-looking pirate in a long coat and a ballistic vest, with a shotgun slung over his shoulder. While he starts out with a scowl and narrowed eyes, his attention immediately shifts down to the halfbreed’s ample tits, and his jaw goes slack.");
	
	output("\n\n<i>“Woah,”</i> he says, staring at Saen’s chest. You take advantage of the man’s momentary distraction to lunge forward and");
	if (pc.PQ() >= 80) output(" deck the bastard, cracking him over the head and watching the body tumble to the deck");
	else if (pc.AQ() >= 80) output(" punch him right in the throat, dropping him gagging onto the deck");
	else output(" grab him, wresting the bastard down until Saen can bash him over the head with a steel-tipped boot");
	output(".");
	
	output("\n\n<i>“Down you go!”</i> Saen laughs, drawing her handgun.");
	
	processTime(3);

	flags["SAENDRA_XPACK1_RESCUE_SHOTGUARD_STATE"] = 2;

	// [Next] {to Pirate Tech fite}
	clearMenu();
	addButton(0, "Next", sx1SkipShotguard)
}

public function sx1ThrowFlashbang():void
{
	clearOutput();
	saenHeader();
	generateMapForLocation("HOTEL CORRIDOR");
	
	output("<i>“Kick the door,”</i> you say, pulling a flash grenade out and pulling the pin. Saen gives you a nod, rears her leg back, and slams her foot into the door. It buckles, tumbling back on its hinges and you toss the flashbang in.");
	
	output("\n\nA thunderous <i>kabang</i> echoes out of the room with a blinding flash to accompany it. The moment the bang passes, you and Saendra charge in with weapons drawn - and come face to face with a staggering man, dressed in a long coat and a ballistic vest, fumbling for the shotgun strapped to his back.");
	
	processTime(1);
	
	if(pc.characterClass != GLOBAL.CLASS_SMUGGLER && pc.hasItemByClass(FlashGrenade)) pc.destroyItemByClass(FlashGrenade, 1);

	clearMenu();
	addButton(0, "Fight!", sx1InitShotguardFight, true);
}

public function sx1DoorBreach():void
{
	clearOutput();
	saenHeader();
	generateMapForLocation("SX1 RESCUE ROOM");
	
	output("<i>“Fuck it. Let’s do it loud,”</i> you say, nodding towards the door. Saen grins and thumbs the safety on her Hammer pistol.");
	
	output("\n\n<i>“Guess I didn’t need a free place to stay anyway,”</i> she chuckles, following your lead and getting ready to knock the door in. The two of you exchange and glance, then shove the door in together, charging in the moment the heavy mass of steel buckles beneath your shoulder.");
	
	output("\n\nJust inside the door is a gruff-looking man in a long coat and a ballistic vest - and who’s got a shotgun aimed right at you. There’s no avoiding a fight now!");
	
	processTime(1);

	// To Shotgun Guard fite
	clearMenu();
	addButton(0, "Fight!", sx1InitShotguardFight);
}

public function sx1InitShotguardFight(wasFlashed:Boolean = false):void
{
	var tEnemy:Creature = new SX1Shotguard();
	if(wasFlashed) CombatAttacks.applyBlind(tEnemy, 3);
	saendra.long = "Saendra quickly pokes out of cover from time to time, ready to take potshots at anything and everything she can sight quickly enough before shifting back to safety.";
	saendra.customDodge = "Saen casually sidesteps out of the way.";
	
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors([pc, saendra]);
	CombatManager.setHostileActors(tEnemy);
	CombatManager.victoryScene(sx1ShotguardPCVictory);
	CombatManager.lossScene(sx1ShotguardPCLoss);
	CombatManager.displayLocation("VOID PIRATE");
	CombatManager.beginCombat();
}

public function sx1ShotguardPCVictory():void
{
	clearOutput();
	showBust("MERCGUARD");
	showName("VICTORY:\nVOID PIRATE");

	generateMapForLocation("SX1 RESCUE ROOM");

	flags["SAENDRA_XPACK1_RESCUE_SHOTGUARD_STATE"] = 3;

	output("The guard collapses, unable to fight anymore. Saen gives him a solid kick to the head, making sure he’s down for the count, and flashes you a cocky grin.");

	if (flags["SAENDRA_XPACK1_RESCUE_TECHGUARD_STATE"] != undefined)
	{
		output(" The two of you advance into the pirates’ room, stepping over the guard’s body as you go.");
		
		output("\n\nInside, you find a knocked out ausar woman jacked into an expensive-looking computer rig. She’s face-down on a desk at the side of the room, with smoke coming from the headset plugged into her ears. Ouch.");
		
		output("\n\nOpposite her, a bed has been pushed against the northern wall, opposite a metal desk where a truckload of computer gear is set up. Sitting on the bed with ropes tied around his arms and legs is a grizzled looking human who’s clearly had some better days: he’s gotten roughed up pretty good, and his mechanic’s outfit’s been darkened with blood and grease. Saendra runs over to him and grabs the man’s shoulders.");

		//Go to "Rescue" scene
		clearMenu();
		addButton(0, "Next", sx1RescueTheDude, true);
	}
	else
	{
		pc.shieldsRaw = pc.shieldsMax();
		
		output("\n\n");
		
		CombatManager.genericVictory(sx1ShotguardPCVictory2);
	}
}
public function sx1ShotguardPCVictory2():void
{
	clearOutput();
	saenHeader();
	
	generateMapForLocation("SX1 RESCUE ROOM");
	
	output("The two of you advance into the pirates’ room, stepping over the guard’s body as you go.");
	
	output("\n\nAn ausar woman with a shock of blonde hair is standing inside, aiming a machine pistol at you and stumbling back until she’s against the far wall with nowhere else to go. Wires lead down from a brace around her neck to a huge rig of computer equipment planted on a desk a few feet away.");
	
	output("\n\n<i>“Stay back!”</i> she shouts, waving her gun around. <i>“I’m warning you!”</i>");
	
	output("\n\n<i>“Get fucked, bitch,”</i> Saen answers, taking aim.");
	
	output("\n\nThat settles that!");

	// [Fight] {To Tech Fite}
	clearMenu();
	addButton(0, "Fight!", sx1InitTechguardFight);
 }

public function sx1SkipShotguard():void
{
	clearOutput();
	showBust("TECHGUARD");

	generateMapForLocation("SX1 RESCUE ROOM");

	output("Cautiously, you peer into the room. An ausar woman with a shock of blonde hair is standing inside, aiming a machine pistol toward the door and stumbling back until she’s against the far wall with nowhere else to go. Wires lead down from a brace around her neck to a huge rig of computer equipment planted on a desk a few feet away.");
		
	output("\n\n<i>“Stay back!”</i> she shouts, waving her gun around. <i>“I’m warning you!”</i>");
	
	output("\n\n<i>“Get fucked, bitch,”</i> Saen answers, taking aim through the door.");
	
	output("\n\nThat settles that!");

	clearMenu();
	addButton(0, "Fight!", sx1InitTechguardFight);
}

public function sx1ShotguardPCLoss():void
{
	clearOutput();
	showBust("MERCGUARD");
	showName("DEFEAT:\nVOID PIRATE");

	generateMapForLocation("SX1 RESCUE ROOM");

	output("<i>“Hehehe,”</i> the pirate chuckles as you and Saen collapse, battered down by his barrage of shells. <i>“Got us a couple of live ones here... and what’s this?”</i> he grunts, turning to Saendra. <i>“Ah, you’re the kitten Bragga was after, aren’t you? Come to rescue your friend, huh?”</i>");
	
	output("\n\nHe tsks his tongue and kicks Saen’s pistol away, leaving her defenseless. <i>“There’s a bounty out on you, kitten. Guess I’ll be getting paid double... plus a little fun before I hand you over. As for your friend...”</i> he waves his shotgun over in your direction, and pulls the trigger as casually as he might toss away a cigarette butt. Your world is overwhelmed by a lightning bolt of pain, and the world goes black.");
	
	output("\n\nIn the end, you got the easy way out.");
	
	processTime(2);

	badEnd();
}

public function sx1InitTechguardFight():void
{
	saendra.long = "Saendra quickly pokes out of cover from time to time, ready to take potshots at anything and everything she can sight quickly enough before shifting back to safety.";
	saendra.customDodge = "Saen casually sidesteps out of the way.";
	
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors([pc, saendra]);
	CombatManager.setHostileActors(new SX1Techguard());
	CombatManager.victoryScene(sx1TechguardPCVictory);
	CombatManager.lossScene(sx1TechguardPCLoss);
	CombatManager.displayLocation("VOID TECHIE");
	CombatManager.beginCombat();
}

public function sx1TechguardPCVictory():void
{
	clearOutput();
	showBust("TECHGUARD");
	showName("VICTORY:\nVOID TECHIE");

	generateMapForLocation("SX1 RESCUE ROOM");

	if (flags["SAENDRA_XPACK1_RESCUE_SHOTGUARD_STATE"] != 3) output("The last of the pirates");
	else output("The techie pirate");
	output(" collapses, unable to put up any more resistance. Saen breathes a sigh of relief, and the two of you advance into the room. It’s a small affair, with peeling wallpaper and dim lights that barely let you see. A bed has been pushed against the northern wall, opposite a metal desk where a truckload of computer gear is set up.");

	output("\n\nSitting on the bed with ropes tied around his arms and legs is a grizzled looking human who’s clearly had some better days: he’s gotten roughed up pretty good, and his mechanic’s outfit’s been darkened with blood and grease. Saendra runs over to him and grabs the man’s shoulders.");
	
	processTime(1);
	flags["SAENDRA_XPACK1_RESCUE_TECHGUARD_STATE"] = 3;
	// {To Rescue scene}
	clearMenu();
	addButton(0, "Next", sx1RescueTheDude, true);
}

public function sx1TechguardPCLoss():void
{
	clearOutput();
	showBust("TECHGUARD");
	showName("DEFEAT:\nVOID TECHIE");

	generateMapForLocation("SX1 RESCUE ROOM");

	flags["SAENDRA_XPACK1_RESCUE_TECHGUARD_STATE"] = 4;
	flags["SAENDRA_XPACK1_STATUS"] = 8;

	output("The resistance drains out of you, and soon you find yourself slumping to the ground with a groan. Saen follows you a moment later, succumbing to her injuries.");
	
	output("\n\n<i>“Holy shit. Get some!”</i> the pirate babe cheers, fist-pumping the air in front of her. She holsters her machine pistol and walks over to Saendra, grabbing the halfbreed by the scruff of the neck. <i>“And you’re that renegade we were supposed to keep an eye out for, aren’t you? Man, there’s a huge bounty on your head, bitch. Guess I get to collect.");
	
	output("\n\n<i>“As for you,”</i> she says, turning your way. <i>“Who the fuck are you? You know what; doesn’t matter. Fuck off.”</i>");
	
	output("\n\nHer boot comes down with an agonizing <i>crack</i>, and your world goes black.");
	
	processTime(1);
	var damage:Number = 35;
	var maxDamage:Number = (pc.HPRaw - 1);
	if (damage > maxDamage) damage = maxDamage;
	if (damage > 0) applyDamage(new TypeCollection( { unresistablehp: damage }, DamageFlag.BYPASS_SHIELD ), null, pc, "minimal");

	clearMenu();
	addButton(0, "Next", sx1TechguardPCLossII);
}

public function sx1TechguardPCLossII():void
{
	clearOutput();
	clearBust();
	showName("DEFEAT:\nVOID TECHIE");

	currentLocation = "MERCHANT'S THOROUGHFARE";

	output("You wake up... what must be hours later with a splitting headache and swimming vision. Everything hurts.");
	
	output("\n\n<i>“You okay?”</i> a voice says as you strain to open your eyes. You’re on Tavros station still - that much is obvious, by the blinding lights and the faint music playing over the merchant row speakers. A uniformed station security officer is kneeling over you, a concerned look on her face.");
	
	output("\n\n<i>“Hey, you alright?”</i> the officer repeats, shaking your shoulder. She’s reaching for her radio by the time you manage to nod, and pull yourself up into a sitting position. You grunt and grab your head, trying to arrest the pounding in your skull.");
	
	output("\n\nYou look around, at the glowing white lights above and the flickering holo-signs of the merchant shops around you. You’re just outside");
	if (flags["MET_SERA"] != undefined) output(" Sera’s shop");
	else output(" one of the transformative vendors");
	output(" near Anon’s... and very much alone. Saendra’s nowhere to be seen.");
	
	output("\n\n<i>“I’m... I’m fine,”</i> you groan. You must have been dumped on the side of the corridor after the pirates were done with you.");
	
	output("\n\nThe guard helps you up and you end up having to file a report with Tavros security: telling them that you and your friend got into a firefight with pirates twice, and ended up losing this second time. The officer expreses her sympathies, but tells you that there’s not a lot security can do about it: the station’s cameras tracked the pirates all the way to the docks, but they left well before you woke up. With Saen in tow, too.");
	
	output("\n\nAs you’re discharged from station security and make your way back down to the merchant deck, you are forced to come to the realization that you’ll probably never see Saendra again...");
	
	processTime((3 * 60) + rand(60));

	// {Return to Anon's. Saendra is missing.}
	flags["SAENDRA_DISABLED"] = 1;

	CombatManager.genericLoss();
}

public function sx1RescueTheDude(fromCombat:Boolean = false):void
{
	clearOutput();
	saenHeader();
	flags["SAENDRA_XPACK1_STATUS"] = 9;

	generateMapForLocation("SX1 RESCUE ROOM");

	output("<i>“Pete! Peter, you okay?”</i> Saendra says, gently shaking the man’s shoulders. He groans and slumps forward into her arms, alive but badly beaten.");
	
	output("\n\n<i>“Shit,”</i> Saen sighs, putting her arms around his shoulders. <i>“I gotta get him to a hospital, [pc.name]. Thanks for the help... I owe you.”</i>");
	
	output("\n\nSomething’s been gnawing at you for a while about... well, everything with Saendra. You’re not dumb enough to think these attacks are just random anymore. <i>“I think you owe me an explanation.”</i>");
	
	output("\n\nShe flinches as if struck, and her twin tails coil down defensively under her legs. <i>“Yeah... I guess I do, huh, hero? Look, like I said, I gotta get Pete here to a doctor. Catch me down at the bar sometime and I’ll tell you. I promise.");
	if (flags["SAENDRA_XPACK1_RESCUE_SHOTGUARD_STATE"] == 3 || flags["SAENDRA_XPACK1_RESCUE_TECHGUARD_STATE"] == 3) output(" Well, assuming I don’t get arrested first,”</i> she says, looking around at the bullet holes in the walls.");
	else output("”</i>");
	
	output("\n\nThat’ll have to do. You step out of Saendra’s way, and she hefts her friend up into her arms and staggers out towards the stairs. For your part, you spend a few minutes ransacking the place, trying to find anything of use.");
	
	output("\n\n");
	if (flags["SAENDRA_XPACK1_RESCUE_TECHGUARD_STATE"] == 2) output("Unfortunately, you fried the pirates’ computer");
	else output("Unfortunately, the pirate techie must have fried her hard drive before she went down");
	output(". You won’t be getting any information from that. You do, however, find a datapad on the tech’s body. Not only is it loaded with credits, which you quickly hijack, but there’s a bounty notice on it as well.");

	pc.credits += 5000;
	
	output("\n\nSomebody’s offering a hefty twenty grand for Saendra’s capture. Somebody named <i>“Lord Bragga”</i> of the Black Void Pirates. What the hell has Saen gotten herself mixed up with?");
	
	output("\n\nYou pocket the datapad and head back down to the bar. You’ll have to ask your hybrid companion herself if you want to find out the truth.");
	
	output("\n\n")
	
	processTime(2);
	
	//Key Item Added: Pirate Datapad
	pc.createKeyItem("Pirate Datapad");

	if (fromCombat) CombatManager.genericVictory();
	else
	{
		clearMenu();
		addButton(0, "Next", mainGameMenu);
	}
}

public function sx1SaensFriendExpired():void
{
	clearOutput();
	saenHeader();

	output("<i>“Did you manage to find your friend?”</i> you ask, immediately regretting asking when she gets a very sad look on her face.");
	
	output("\n\n<i>“No,”</i> Saen says, resting her chin in her hands. <i>“Well, yes, but too late. Pirate bastards had already put a bullet in him by the time I got there. I fucked up, [pc.name]. Real bad.”</i>");
	
	output("\n\nYou grimace and put a hand on hers, squeezing it tight as the halfbreed lets out a ragged breath. <i>“Pete is... he was a mechanic at the docks. The station chief decided the </i>Phoenix<i> was too banged up to take off - but she’s space worthy, I made sure of it! Pete agreed with me, said he’d smuggle me the access codes I’d need to take off without the chief noticing. I guess somebody must have been monitoring my comms... or maybe they grabbed Pete from the get-go. Who knows. Either way, I got him killed, and I’ve got nothing to show for it.”</i>");
	
	output("\n\nA moment of silence passes before you ask if there’s anything you can do to help her.");
	
	output("\n\nSaen sighs and runs her chrome fingers through her hair. <i>“I don’t know, hero. Unless you’ve got Tavros access codes tucked up your ass, I don’t think I’m ever going to get out of here. Not for a few years, anyway, until I can save up enough for a total refit of the </i>Phoenix<i>.”</i>");
	
	output("\n\n<b>If you have the credits to spare, maybe you could help Saendra out with that.</b>");
	
	processTime(3);

	flags["SAENDRA_XPACK1_STATUS"] = 11;
	flags["SAENDRA_XPACK1_CREDITOFFER"] = 1;

	saendrasBarMenu();
}

public function sx1OfferCredits():void
{
	clearOutput();
	saenHeader();

	output("<i>“Hey, I’ve been thinking,”</i> you say, fishing a credit stick out of your pack. <i>“If this would help you out, Saen...”</i>");
	
	output("\n\nHer eyes widen as she realizes what it is in your hand. <i>“Hey, what... what is this?”</i>");
	
	output("\n\nYou shrug. <i>“I know you’re strapped for cash, so, I mean, I have plenty to spare...”</i>");
	
	output("\n\n<i>“Oh, you");
	if (pc.tallness > saendra.tallness) output(" big");
	else output(" little");
	output(" idiot...”</i> Saen sighs, reaching across the table and curling your fingers back around the credit chit. <i>“I don’t... I can’t take that, hero. You’ve done so much for me already. The last thing I want is to owe you more than I already do.”</i>");
	
	output("\n\nShe tries to push your hand back, but you insist. You tell her to quit playing tough, to let you help her. After all, you <i>have</i> helped her so much in the past - you don’t want to see her rotting here on Tavros forever. She deserves a second chance, and you’re in a position to give it to her.");
	
	output("\n\nSaendra sighs. <i>“You’re a sweetheart, you know that?”</i> she says with a wry laugh. <i>“One hell of a sweetheart.”</i>");
	
	output("\n\nShe smiles and wraps her chromed fingers around your hand, and the credit chit therein. Before she takes it, though, you squeeze her hand and ask if <i>“sweetheart”</i> is all she thinks about you.");
	
	output("\n\n<i>“Not by a long shot,”</i> Saendra says, reaching across the table to plant a kiss on your lips: soft, gentle, loving. You give her the credit chit, and return the red-maned pilot’s kiss with as much ardor as you can muster.");
	
	output("\n\nWhen you break the kiss, Saen leans her brow against yours, keeping you together a moment longer. <i>“Alright. I’m gonna go get started putting this to good use. I, um... thank you, [pc.name]. This means the world to me. I’ll see you soon.”</i>");
	
	output("\n\nYou nod and wave, letting Saendra slip out of the bar to start putting that money to use.");
	
	processTime(2);

	//Remove Saen from the bar for 24 hours.
	flags["SAENDRA_XPACK1_CREDITOFFER"] = 2;
	flags["SAENDRA_XPACK1_CREDITTIME"] = GetGameTimestamp();
	pc.credits -= 20000;
	flags["SAENDRA_MAX_AFFECTION"] = 100;
	saendraAffection(30);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function sx1TalkPirates():void
{
	clearOutput();
	saenHeader();

	flags["SAENDRA_XPACK1_STATUS"] = 10;

	output("<i>“Hey,”</i> you say, drawing the pirate datapad from your pack and tossing it onto the table. <i>“We need to talk.”</i>");
	
	output("\n\nSaen cocks an eyebrow and picks it up. Murmuring <i>“What’s this,”</i> she starts to flip through it. As she does, her emerald eyes grow wide. <i>“What the fuck...”</i>");
	
	output("\n\n<i>“Don’t tell me you don’t know what that’s about,”</i> you say, narrowing your eyes. <i>“You don’t get the Black Void putting a bounty that big on you just because.”</i>");
	
	output("\n\nShe doesn’t answer you for a while, too busy staring slack-jawed at the datapad you looted from her would-be attackers. After what seems like a brief eternity, Saendra sets it down and steeples her fingers.");
	
	output("\n\n<i>“I can’t believe she did that,”</i> Saen finally says, sighing. <i>“I understand the shit with the </i>Phoenix<i>, even kind of expected it. But a bounty? That’s low, Miri.”</i>");
	
	output("\n\n<i>“What’re you talking about? Who’s Miri?”</i>");
	
	output("\n\nYour companion doesn’t meet your eye as she answers. <i>“Mirian Bragga. A Dread Lord of the Black Void pirates, one of the most powerful women in the galaxy’s underworld. She... we were...”</i> she pauses for a moment, struggling to collect her thoughts. When she continues, Saendra’s robotic fingers clench hard. <i>“Miri and I were raised together. Like sisters, almost. And yeah, before you ask, that means I used to be part of the Void. My parents commanded an interceptor frigate on the fringe; when I was born, they left me on a Void base to keep me safe. Miri was just a year older, and our parents were good friends. So Miss Bragga and her servants brought me up, same as her daughter.”</i>");
	
	output("\n\n<i>“I could have been her second in command,”</i> Saen laughs sadly. <i>“We were such good friends...”</i>");
	
	output("\n\nShe puts her chin in her hands and glances up at you, waiting for you to speak. <i>“What happened to make you leave?”</i>");
	
	output("\n\n<i>“I didn’t get the chance to leave. Not officially. I guess you could call the day you rescued me my farewell party.”</i> She laughs, <i>“No, I didn’t leave. I did steal something though - or at least, I refused to give Miri something she wanted. I just never thought she wanted it that badly.”</i>");
	
	output("\n\n<i>“Bad enough to want to kill you.”</i>");
	
	output("\n\n<i>“Probably worse than that,”</i> Saendra says with a shake of her head. <i>“Listen, I know you have questions... and if you never want to talk to a filthy pirate again, well... I’d understand. I’d feel like shit for a while, but I’d understand. Pirates have a bad rep for a reason, and I deserve that. I’ve done some shitty things that I wish I hadn’t. But my friend, Pete -- the guy we rescued? He’s fine, by the way -- he gave me the codes to pull the </i>Phoenix<i> out of Tavros without the chief mechanic’s permission. What I stole from Miri... that’s my chance to start fresh. It’s intelligence, data the Void’s been gathering and studying for years now. Some kind of treasure map, basically. And I’m going to steal it right out from under the bastards.”</i>");
	
	output("\n\nFirst Saendra turns out to be an ex-pirate, and now she wants to go on a treasure hunt? What storybook did she fall out of?");
	
	output("\n\n<i>“If you still want anything to do with me, I could always use a first mate when I go to find the Void’s treasure. Hopefully I’ll be ready to leave soon, now that I have the codes.”</i>");
	
	output("\n\nYou suppose you have a decision to make regarding your pirate-babe");
	if (flags["SAENDRA TIMES SEXED"] != undefined) output(" lover");
	else output(" companion");
	output(".");
	
	processTime(4);
	
	flags["SAENDRA_MAX_AFFECTION"] = 100;
	saendraAffection(30);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
// Techie Hotfix
public function sx1TalkTechGuardFix():void
{
	clearOutput();
	showSaendra();
	author("Jacques00");

	output("You ask Saendra about the whereabouts of the ausar techie the two of you encountered during her rescue mission on Deck 92.");
	output("\n\nThe crimson halfbreed perks up. <i>“Oh? I distinctly remember we defeated her in a fight... and it’s very likely she was sent off to the bowels of Gastigoth with the rest of the other low-lives. Bitch got what was coming to her if you ask me!”</i>");
	output("\n\nAs she continues with a more snarled expression, you tap your codex and make a note then segway the conversation to something less hostile. Soon, you find yourself chuckling at one of Val’s compromising anecdotes about Saendra with an embarrassed Saendra just taking it with some modest humility.");
	
	processTime(5);
	flags["SAENDRA_XPACK1_RESCUE_TECHGUARD_STATE"] = 3;
	
	saendrasBarMenu();
}

// Zil Call Girl:
//There's stuff for her being pregnant in here. I didn't write the actual pregpath, but if somebody else wants to, the groundwork's there. 

public function zilCallgirlAvailable():Boolean
{
	if (zilCallgirlAtNursery()) return false;
	
	if (flags["ZIL_CALLGIRL_DISABLED_TYPE"] == undefined || flags["ZIL_CALLGIRL_DISABLED_TYPE"] == 0) return true;
	if (flags["ZIL_CALLGIRL_DISABLED_TYPE"] == 1 && GetGameTimestamp() - flags["ZIL_CALLGIRL_DISABLED_TIMESTAMP"] > 1440) return true;
	if (flags["ZIL_CALLGIRL_DISABLED_TYPE"] == 2) return false;
	if (flags["ZIL_CALLGIRL_DISABLED_TYPE"] == 3) return false;
	if (flags["ZIL_CALLGIRL_DISABLED_TYPE"] == 4) return false;

	trace("Unhandled disabled type for ZilCallgirl");
	return false;
}

public function zilCallGirlAddendum(slot:int = 0):void
{
	if (!zilCallgirlAvailable()) return;

	// Dat zil call gurrrl
	if (flags["SAENDRA_XPACK1_STATUS"] >= 8)
	{
		// Call Girl (Didn't Visit in FRI)
		if (flags["SAENDRA_XPACK1_CALLGIRLSTATE"] == undefined && flags["ZIL_CALLGIRL_SEXED"] == undefined)
		{
			output("\n\nOne of the rooms is familiar to you and most likely houses the call girl Saendra mentioned. Maybe you should check it out if you feel the need to release some sexual tension.");
			addButton(slot, "Call Girl", zilCallGirlGo, false, "Call Girl", "Visit the call girl Saendra mentioned. You’ve earned a little R&R time...");
		}
		// [Call Girl] (Repeat Meeting)
		else
		{
			output("\n\nYou recognize one of the rooms as being where the local call girl lives. You can always give a knock if you feel the need to release some sexual tension.");
			addButton(slot, (flags["ZIL_CALLGIRL_NAME_KNOWN"] == undefined ? "Call Girl" : "Zheniya"), zilCallGirlGo, true, (flags["ZIL_CALLGIRL_NAME_KNOWN"] == undefined ? "Call Girl" : "Zheniya"), "Visit Anon’s resident insectile call girl.");
		}
	}
	return;
}

public function zilCallgirlPregnancyNotice():void
{
	clearOutput();
	showZilCallGirl();

	output("You walk right up to the call girl’s door and give it a quick knock, but you’re surprised when, rather than the usual throaty, seductive voice calling you in, you’re met with only silence. You knock once more just to be sure, but after waiting several long moments for a response, you decide that you should just return later.");
	
	output("\n\nIt’s then that you hear a series of sharp, tight <i>clicks</i> approaching behind you. You turn to spot the sultry golden-skinned woman you were hoping to see, though you don’t recall ever having seen her wearing this many clothes before. Her strappy, red platform heels make one last pair of hard taps on the walkway as she comes to a stop, just barely out of arm’s reach. Your eyes slide slowly from her red-painted toes, up her long, shapely legs and pink stockings, past her fuckable, womanly hips, and beyond her plump breasts, finally meeting her own rich, deep eyes.");
	
	output("\n\nShe interrupts your silent admiration with a quiet laugh. <i>“Hey there, sweet thing. You’re just the [pc.manWoman] I was hoping to see,”</i> she purrs, her eyes narrowing seductively.");
	
	output("\n\nShe steps toward you, slipping her hand into yours and laying your [pc.arm] around her shoulder. <i>“Come on in, sugar, I need to talk to you about something.”</i>");
	
	output("\n\nYour eyes wander curiously as she flips on the lights and leads you inside. It’s strange to see the room so clean and well-lit for once, and refreshing that it doesn’t have the usual lustful, choking smell of incense, sweat, and jizz that it usually does. She slips out from under your arm, grabbing a chair and spinning it to face her bed, sitting herself down on it.");
	
	output("\n\nSomehow, seeing her this way seems even more sexy than usual: her light, natural makeup unmarred by tears, sweat, and cum, and her desirable body clothed in a tight, playful dress. You’re offered a tantalizing glimpse of her inner thighs as her legs cross; her long, slender fingers directing you to sit yourself on her bed.");
	
	output("\n\n<i>“So, </i>lover<i>,”</i> she begins tentatively, leaning forward to rest her warm hand on your [pc.thigh]. <i>“It’s about us.”</i> She pauses, lightly brushing your [pc.leg] with her long, red, manicured nails.");
	
	output("\n\n<i>“Or, it </i>might<i> be about us,”</i> she continues softly, her usual sultry confidence mired by uncertainty.");
	if (pc.isNice()) output(" You place your hand comfortingly over her own, lightly squeezing as you meet her gaze and nod for her to continue.");
	else if (pc.isAss()) output(" You cross your arms with a huff and tell her to spit it out already.");
	else output(" You meet her gaze with your [pc.eyes] and urge her onward.");
	
	output("\n\n<i>“Well, sugar, I’ve enjoyed our time together. I </i>really<i> have...”</i> she trails off slightly as her free hand reaches up to sensually trace her chest. <i>“And I’m not just saying that!”</i> she adds, reassuringly.");
	
	output("\n\n<i>“See, sweetie, in my line of work I have to try and keep my... relationships with my customers from becoming too... burdensome. Ever since I came here, I’ve used a natural Mhen’gan contraceptive, which really works! Or, at least it did...”</i> she casts her eyes downward, simply staring at the ground for several moments as your own [pc.eyes] widen in realization at what she must mean. She grips your [pc.thigh] tighter as she seems to steel herself, her usual strong, gentle resolve returning as she commits to addressing this.");
	
	output("\n\n<i>“Lover, I’ve had morning sickness for days, now. I just returned from the clinic. I’m pregnant. It’s yours,”</i> she hits you directly, clearly done with dancing around the subject.");

	processTime(10);
	
	flags["ZIL_CALLGIRL_PREGNANT_TOLD"] = 1;

	clearMenu();
	addButton(0, "So?", zilCallgirlPregnancyNoticeSo, undefined, "So?", "How is this any concern of yours, even if it is your kid? It’s her job. She should have taken better precautions to prevent this.");
	addButton(1, "Mine?", zilCallgirlPregnancyNoticeMine, undefined, "Mine?", "How can she be so sure that you’re the father? She has plenty of customers, after all.");
}

public function zilCallgirlPregnancyNoticeSo():void
{
	clearOutput();
	showZilCallGirl();

	output("She turns away, dejected. <i>“I-I see... I suppose you have a point,”</i> she mutters softly to herself as she gets up, slowly walking to the door with her head downturned.");
	
	output("\n\n<i>“I just thought you should know, sugar.”</i> She dons a false grin and raises her head as she opens the door. <i>“That’s all I needed to talk to you about, "+ pc.mf("sir", "miss") +",”</i> she says, ushering you out the door.");
	
	output("\n\nYou shrug and rise to your [pc.feet], walking out the door.");
	if (pc.isNice() || pc.isMisc()) output(" You’re about to turn back to say goodbye when you hear the door click closed behind you, followed by the lock engaging.");
	else output(" You shrug to yourself again and walk away with your head held high.");

	flags["ZIL_CALLGIRL_DISABLED_TYPE"] = 1;
	flags["ZIL_CALLGIRL_DISABLED_TIMESTAMP"] = GetGameTimestamp();
	flags["ZIL_CALLGIRL_PREGNANCY_SO"] = 1;

	processTime(5);
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function zilCallgirlPregnancyNoticeMine():void
{
	clearOutput();
	showZilCallGirl();

	output("<i>“Sugar, it isn’t hard to figure,”</i> she smiles up at you demurely as her thumb softly strokes your [pc.thigh]. <i>“Most of my customers don’t make such vigorous use of my services,");
	if (pc.cumQ() >= 1000) output(" or leave behind such a plentiful </i>tip<i>");
	else if (pc.virility() >= 2) output("or leave behind such a potent </i>tip<i>");
	output(",”</i> she licks her strikingly black lips idly before shaking herself from her thoughts.");
	
	// if met vko (assuming dna wouldn't be available otherwise)
	if(metVKoDroid()) output("\n\n<i>“Plus, the DNA test confirmed it,”</i> she adds matter of factly.");
	
	output("\n\n<i>“I hate to suddenly push all of this onto you, sugar. I know it’s unfair,”</i> she says as she reaches out to stroke your [pc.arm] affectionately, <i>“But I was hoping so much that I could count on you as the father.”</i>");
	
	output("\n\nShe leans in close to meet your gaze pleadingly with her own, her hand moving from your arm to your [pc.face]. You can’t help but notice some slight worry subtly creeping into her seductive, but now wavering, tone.");

	processTime(5);
	clearMenu();
	addButton(0, "Piss Off", zilCallgirlPregnancyNoticeMinePissOff);
	addButton(1, "Money", zilCallgirlPregnancyNoticeMineMoney, undefined, "Money", "Well, it would be mighty shitty of you not to <i>at least</i> offer the unexpected mother-to-be some financial support.");
	addButton(2, "Father", zilCallgirlPregnancyNoticeMineFather, undefined, "Father", "Of course you’ll be there for her and the child. You wouldn’t want for her to have to raise it by herself, or for it to grow up without a father.");
}

public function zilCallgirlPregnancyNoticeMinePissOff():void
{
	clearOutput();
	showZilCallGirl();

	output("How is this any concern of yours, even if it is your kid? It’s her job. She should have taken better precautions to prevent this.");
	
	output("\n\nShe turns away, dejected. <i>“I-I see... I suppose you have a point,”</i> she mutters softly to herself as she gets up, slowly walking to the door with her head downturned.");
	
	output("\n\n<i>“I just thought you should know, sugar.”</i> She dons a false grin and raises her head as she opens the door. <i>“That’s all I needed to talk to you about, " + pc.mf("sir", "miss") +",”</i> she says, ushering you out the door.");
	
	output("\n\nYou shrug and rise to your [pc.feet], walking out the door.");
	if (pc.isNice() || pc.isMisc()) output(" You’re about to turn back to say goodbye when you hear the door click closed behind you, followed by the lock engaging. You stare at the door for several long moments contemplating what just happened when you hear a soft thump against the inside of the door, followed by soft sobbing. What have you done?");
	else output(" You shrug to yourself again and walk away with your head held high. Who needs her? Whores are easy come, easy go.");

	processTime(3);
	flags["ZIL_CALLGIRL_DISABLED_TYPE"] = 2;

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function zilCallgirlPregnancyNoticeMineMoney():void
{
	clearOutput();
	showZilCallGirl();

	output("You lean back on the bed, causing the yellow woman’s soft, slender hand to fall from your cheek to your chest. You clear your throat awkwardly and proceed to explain that, while the planet rush is your primary concern and you can’t exactly be a house-husband, you’re more than well-enough off to provide her with any aid she may need in raising your child. You point out that in addition to financial support, you can even offer her the use of your nursery - which sits a mere elevator’s ride away.");

	flags["ZIL_CALLGIRL_PREGNANCY_MONEY"] = 1;

	zilCallgirlPregnancyMineMerge();
}

public function zilCallgirlPregnancyNoticeMineFather():void
{
	clearOutput();
	showZilCallGirl();

	output("The callgirl’s eyes widen and water slightly as you place your hand warmly on her shoulder, assuring her that you’ll do everything you can to be there for her and your child. You even offer her the use of your nearby nursery, should she need it. She places her hand over yours and smiles across at you, before all but leaping from her chair to throw herself into your lap, wrapping her arms around you and burying her head into your [pc.chest].");

	output("\n\n<i>“Thank you so much, darling,”</i> she sniffles as she kisses your neck softly, leaving lipstick stains all over, from your jaw to your shoulder. Your arms close around her waist and pull her tight to you, stroking her back reassuringly as she presses her plump tits against your [pc.chest], her sensual perfume rousing your mind");
	if (pc.hasCock()) output(", and her ass in your lap rousing your [pc.cock]");
	output(".");

	flags["ZIL_CALLGIRL_PREGNANCY_MONEY"] = 2;

	zilCallgirlPregnancyMineMerge();
}

public function zilCallgirlPregnancyMineMerge():void
{
	output("\n\n<i>“You have </i>no<i> idea how much this means to me,”</i> she speaks in almost a hush as she composes herself, visibly relieved at your answer. She softly cups your [pc.face] in her hands, pulling your faces closer until her sinfully black lips meet your own, sucking gently and caressing your [pc.tongue] with her own.");
	
	output("\n\nWhen she breaks the kiss, the seductive zil wraps her arms around your neck, staring into your eyes for a long moment. <i>“You know, sugar, I don’t think I ever got your name.”</i>");
	
	output("\n\nYou cock an eyebrow. <i>“Not even from the DNA test?”</i>");
	
	output("\n\nShe chuckles, <i>“I want to hear it from you.”</i>");
	
	output("\n\n<i>“[pc.name],”</i> you answer, lacing your hands underneath her supple behind, already starting to peel off that slinky dress of hers.");
	
	output("\n\n<i>“And I’m Zheniya. A pleasure,”</i> she purrs, wetly licking your jaw to punctuate her flirtation. <i>“Now, what say you let this new mommy treat her "+ pc.mf("man", "woman") +", hmm?”</i>");
	
	output("\n\n<i>“Free of charge, of course,”</i> she follows, planting a quick kiss on your [pc.lips].");

	flags["ZIL_CALLGIRL_NAME_KNOWN"] = 1;

	processTime(5);

	clearMenu();
	addButton(0, "Next", zilCallgirlFatherFreebies, true);
}

public function showZilCallGirl(cum:Boolean = false):void
{
	if (flags["ZIL_CALLGIRL_NAME_KNOWN"] != undefined) showName("\nZHENIYA");
	else showName((CodexManager.entryViewed("Zil") ? "ZIL" : "ALIEN") + "\nCALL GIRL");
	
	var sBust:String = "ZIL_CALLGIRL";

	if (zilCallgirlAtNursery())
	{
		//sBust += "_UNIFORM";
	}

	if (zilCallGirlPregTime(true) >= 30) sBust += "_PREG";
	if (cum) sBust += "_CUM";
	
	showBust(sBust);
}

public function zilCallGirlSexed(count:Boolean = false):int
{
	if (count) IncrementFlag("ZIL_CALLGIRL_SEXED");
	
	var sexedCount:int = 0;
	// Increment
	if (flags["SAENDRA_XPACK1_CALLGIRLSTATE"] >= 2) sexedCount++;
	if (flags["ZIL_CALLGIRL_SEXED"] != undefined && flags["ZIL_CALLGIRL_SEXED"] > 0) sexedCount += flags["ZIL_CALLGIRL_SEXED"];
	
	return sexedCount;
}

public function zilCallGirlKnockUp(nVirility:Number = 0):void
{
	// Already visibly pregnant? Early return
	if (flags["ZIL_CALLGIRL_EGG_COUNT"] != undefined || (flags["ZIL_CALLGIRL_PREG"] != undefined && flags["ZIL_CALLGIRL_GESTATION"] != undefined))
	{
		trace("Already preggers");
		return;
	}

	// If birthed == 2, then she's now sterile (result of 'I'm preg' > 'So?')
	if (flags["ZIL_CALLGIRL_HAS_BIRTHED"] == 2)
	{
		trace("Sterile");
		return;
	}
	
	// Pregnancy chance based on virility!
	if
	(	(nVirility > 1.00 && rand(2) == 0)
	||	(nVirility > 0.75 && rand(3) == 0)
	||	(nVirility > 0.50 && rand(4) == 0)
	)
	{
		// ZIL_CALLGIRL_EGG_COUNT : Total children to be born. Chance for more than triplets if virile enough! (rare!)
		flags["ZIL_CALLGIRL_EGG_COUNT"] = 2;
		if (nVirility >= 1.75 || (nVirility >= 1.5 && rand(2) == 0)) flags["ZIL_CALLGIRL_EGG_COUNT"]++;
		if (nVirility >= 2 && rand(10) == 0) flags["ZIL_CALLGIRL_EGG_COUNT"] += rand(4);
		flags["ZIL_CALLGIRL_GESTATION"] = (debug ? 30 : ((180 + rand(31)) * 24 * 60));
		flags["ZIL_CALLGIRL_PREG"] = GetGameTimestamp();
		pc.clearRut();
		trace("Knocked up");
	}
	return;
}

public function zilCallGirlPregTime(percentage:Boolean = false, deltaT:uint = 0):Number
{
	if (flags["ZIL_CALLGIRL_PREG"] != undefined && flags["ZIL_CALLGIRL_GESTATION"] != undefined)
	{
		if (flags["ZIL_CALLGIRL_GESTATION"] > (30 * (60 * 24)) && debug) flags["ZIL_CALLGIRL_GESTATION"] = (30 * (60 * 24));
		
		var pregTime:Number = ((GetGameTimestamp() + deltaT) - flags["ZIL_CALLGIRL_PREG"]);
		
		if (percentage)
		{
			// Returns a percentage 0% to 100% of completion, for simplicity!
			var perc:Number = formatFloat(((pregTime / flags["ZIL_CALLGIRL_GESTATION"]) * 100), 2);
			
			trace("Zil Callgirl preg progression", perc, "%");
			
			return perc;
		}
		// Otherwise, returns the time pregnant (in minutes)
		return pregTime;
	}
	return -1;
}

public function zilCallGirlBellyFragment():String
{
	var progress:Number = zilCallGirlPregTime(true);

	if (progress > 80) return "gravid belly";
	if (progress > 50) return "pregnant belly";
	if (progress > 25) return "fecund belly";
	if (progress > 5) return "paunched middle";
	return "slim midriff";
}

public function zilCallGirlPregnant():Boolean
{
	// Visible signs/feelings of pregnancy at 5% or more
	if (zilCallGirlPregTime(true) >= 5) return true;
	return false;
}

public function zilCallGirlGo(hasSeen:Boolean = false):void
{
	clearOutput();
	generateMapForLocation("CALLGIRL ROOM");
	showZilCallGirl();
	author("Savin");
	
	// Never seen
	if (!hasSeen)
	{
		output("You head over to the door Saendra had pointed out earlier: the call girl’s place of business, from which comes a loud <i>thump</i> and a grunt of orgasmic male pleasure just as you near the door.");
		
		output("\n\nYou knock, and hear an immediate response of a guttural grunt and a zipper zipping. A second later and the door swings open, revealing a towering green-skinned ");
		if (CodexManager.entryViewed("Thraggen")) output("thraggen");
		else output("alien");
		output(" wearing combat trousers and a leather jacket with no shirt underneath, a very satisfied look on his face. He gives you a surprisingly friendly nod as he passes, leaving the door wide open as if inviting you to take his place inside."); 
		
		output("\n\nSitting on the edge of a bed just past the door is a ");
		if (CodexManager.entryViewed("Zil")) output("zil female");
		else output("yellow-skinned, vaguely insectile woman");
		output(" with long, lustrous black hair spilling down her back and full, round breasts that would make a porn star jealous looming heavily over a corset made of chitin, hinting at a very flat, firm belly beneath it. A pair of long, pink leggings encircle her legs, but she’s otherwise nude, and you can see a very distinct patch of white staining the black lips of her sex, left over by the burly alien just with her.");
		
		output("\n\n<i>“Another one already?”</i> she smiles, leaning back and planting her arms on the bed, giving you a much better look at her bountiful bosom. <i>“Mmm, busy day today. You’ll have to give me a minute to clean up, honey... unless you like sloppy seconds. It’s certainly the most fun kind of lube.”</i>");
		
		processTime(2);
	}
	else if (zilCallGirlPregnant() && flags["ZIL_CALLGIRL_PREGNANT_TOLD"] == undefined)
	{
		zilCallgirlPregnancyNotice();
		return;
	}
	else if (zilCallGirlPregnant() && flags["ZIL_CALLGIRL_TOTAL_BIRTHS"] == 1 && flags["ZIL_CALLGIRL_PREGNANT_TOLD"] == 1)
	{
		zilCallgirlPregnantAgain();
		return;
	}
	else if(flags["ZIL_CALLGIRL_PREGNANCY_SO"] == 1 && flags["ZIL_CALLGIRL_HAS_BIRTHED"] == 1)
	{
		zhenSoResponsePregReturn();
		return;
	}
	else if (flags["ZIL_CALLGIRL_HAS_BIRTHED"] == 1 && flags["ZIL_CALLGIRL_BIRTH_MEETING_REQ"] == 1)
	{
		flags["ZIL_CALLGIRL_BIRTH_MEETING_REQ"] = undefined;
		output("<i>“[pc.name]!”</i> a jubilant, if tired, voice calls from inside as you enter Zheniya’s home. You peek your head into the bedroom, and are greeted by the familiar sight of your zil lover sitting naked on her bed, now dramatically less gravid... though, you note happily, her breasts, hips, and ass all look delightfully thicker than when you first met her.");

		var ZC:UniqueChild = ChildManager.youngestOfUniqueType(ZilCallgirlUniqueChild);

		output("\n\nZheniya rests back on her arms, smiling at you with those plush black lips of hers. <i>“Thank you again, for everything, love. I’ve left our new "+ZC.describeCollection("son", "daughter", "children") +" at your nursery, as you asked.");
		if (flags["ZIL_CALLGIRL_TOTAL_BIRTHS"] == 1) output(" The woman working there, Briget, was quite lovely.");
		else output(" Briget was delighted to see me again. She’s quite enamored of you, [pc.name], and your growing brood.");
		output(" The clinic told me to take it easy for the next few days, but... I think I’m more than ready to welcome my baby’s father into my bed, if that’s what you’ve come for. Ooh, it’s been too long since I felt svelte and agile! Let’s take advantage, sweet thing, what do you say?”</i>");
	}
	else
	{
		output("You walk right up to the call girl’s door and give it a quick knock. A throaty, seductive voice answers your summons from within: <i>“Come on in, sugar!”</i>");
		output("\n\nYou slide the door open and find the call girl is sitting on the edge of her bed, applying a bit of makeup. The smells of incense and perfume hit you immediately, followed shortly by a barely-suppressed, familiar aroma: sex, arousal, and cum mixing together with the ");
		if (CodexManager.entryViewed("Zil")) output("zil");
		else output("alien");
		output(" girl’s other fragrances into a heady, alluring vapor that has you");
		if (pc.hasCock()) output(" half-hard");
		else output(" wet");
		output(" in the blink of an eye.");
		
		output("\n\n<i>“Back again, my friend?”</i> she asks, voice full of lascivious suggestion. <i>“I’m glad!");
		if(zilCallGirlPregnant() || StatTracking.getStat("pregnancy/zil call girl kids") > 0)
		{
			if (StatTracking.getStat("pregnancy/zil call girl kids") > 0) output(" I’m glad the father of my children would take the time to see me again.");
			else if (zilCallGirlPregnant()) output(" And you should be too, honey. This baby bump means that I’m bearing your spawn and I’m so happy that you’ve come back to see me again.");
			if (CodexManager.entryViewed("Zil")) output(" Few other zil would be so considerate");
		}
		else output(" A familiar face is quite refreshing in this oh-so-busy place");
		output(". Why don’t you shut the door and come in, and let me show my appreciation...”</i>");
		
		processTime(1);
	}
	
	if (flags["ZIL_CALLGIRL_SEXED"] == undefined) flags["ZIL_CALLGIRL_SEXED"] = 0;
	pc.lust(5);
	
	zilCallgirlSexMenu();
	return;
}

public function zhenSoResponsePregReturn():void
{
	clearOutput();
	showZilCallGirl();

	flags["ZIL_CALLGIRL_HAS_BIRTHED"] = 2;
	flags["ZIL_CALLGIRL_BIRTH_MEETING_REQ"] = undefined;

	output("<i>“Hello, [pc.name],”</i> the zil callgirl says as you step into her apartment. Something immediately strikes you as different upon entrance: the normally ever-present scent of sex and incense is muted, and the lights are turned up to the station’s norm rather than the dusky, sensual dim red as before. You take a look around, eventually finding the waspy whore sitting on the side of her bed, cradling a pink bundle in her arms. A pair of tiny yellow hands reach up from inside it, latched onto one of her breasts. A child, nursing.");

	output("\n\n<i>“I’m sorry, I’m a bit busy at the moment,”</i> she says, favoring you with an apologetic smile. <i>“Your daughter here is as obsessed with my honey as you are. Come back in a bit when I’ve put her to bed... and had a chance to try some of this wonderful Sterilex the clinic staff gave me. Then it’s back to business... though I’m afraid I’ll be raising my prices a bit to make up for this extra mouth I need to feed. You understand, hmm?”</i>");

	output("\n\nYou nod and step out.");
	//Zil Callgirl becomes sterile permanently. Increase her price to 620 a pop.
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function zilCallgirlPrice():int
{
	if (flags["ZIL_CALLGIRL_HAS_BIRTHED"] == 2) return 620;
	if (flags["ZIL_CALLGIRL_PREGNANCY_MONEY"] == 1) return 650;
	return 500;
}

public function zilCallgirlSexMenu(isFreebie:Boolean = false):void
{
	clearMenu();

	if (flags["ZIL_CALLGIRL_PREGNANCY_MONEY"] != 2)
	{
		if (pc.lust() < 33) addDisabledButton(0, "Rent Her", "Rent Her", "You are not turned on enough for this.");
		else if (!isFreebie && pc.credits < zilCallgirlPrice()) addDisabledButton(0, "Rent Her", "Rent Her", "You don’t have enough credits!");
		else if (!pc.hasGenitals()) addDisabledButton(0, "Rent Her", "Rent Her", "You’d need some genitals to fully enjoy the experience...");
		else addButton(0, "Rent Her", zilCallGirlCall, [true, isFreebie], "Rent Her", "Pay the lovely call girl’s fee and have a little fun.");
	}
	else
	{
		if (pc.lust() < 33) addDisabledButton(0, "Sex", "Sex", "You are not turned on enough for this.");
		else if (!pc.hasGenitals()) addDisabledButton(0, "Sex", "Sex", "You’d need some genitals to fully enjoy the experience...");
		else addButton(0, "Sex", zilCallgirlFatherFreebies, true, "Sex", "Give your little strumpet a good seeing to.");
		if (flags["ZIL_CALLGIRL_STOPWHORE_DISABLED_UNTIL"] == undefined || flags["ZIL_CALLGIRL_STOPWHORE_DISABLED_UNTIL"] <= GetGameTimestamp()) addButton(3, "Stop Whoring", zilCallgirlStopWhoring, false, "Stop Whoring", zilCallgirlStopWhoringTooltip());
		else addDisabledButton(3, "Stop Whoring");
		addButton(2, "Get Honey", zilCallGirlSuckleHoney, undefined, "Suckle Honey", "Your hands on the waspy girl’s breast gives you an idea...");
	}

	addButton(14, "Never Mind", zilCallGirlCall, [false, isFreebie], "Never Mind", "Maybe this was a bad idea.");
}

public function zilCallgirlStopWhoringTooltip():String
{
	if (flags["ZIL_CALLGIRL_STOPWHORE_ATTEMPTS"] == undefined) return "You’re not so sure you like the idea of your baby-momma supporting herself this way anymore. It just doesn’t seem like what’s best for her <i>or</i> your child.";
	if (flags["ZIL_CALLGIRL_STOPWHORE_ATTEMPTS"] == 1) return "Maybe you could find a way to convince Zheniya to give up her whoring ways...";
	return null;
}

public function zilCallgirlStopWhoring(fromPregnancyTalk:Boolean = false):void
{
	clearOutput();
	showZilCallGirl();

	if (flags["ZIL_CALLGIRL_STOPWHORE_ATTEMPTS"] == undefined)
	{
		flags["ZIL_CALLGIRL_STOPWHORE_ATTEMPTS"] = 1;
		if (!fromPregnancyTalk)
		{
			output("The zil woman softly smacks her lips in the mirror as you take your seat on her bed, placing her lipstick back down on the dresser before slowly sauntering over to you, her hips making exaggerated sways to and fro, followed eagerly by your [pc.eyes].");

			output("\n\nShe leans forward, black eyes narrowed and her breasts hanging invitingly in front of you as she plants a kiss on your [pc.lips]. She throws one long, smooth, slender leg up to your side - followed by the other - mounting you smoothly.");

			output("\n\n");
		}

		output("You let out a soft groan as she drapes her arms sensually over your shoulders and slips her tongue into your mouth,");
		if (pc.hasCock()) output(" grinding herself harder into your lap and skillfully manipulating your cock between the warm, plush globes of her ass.");
		else
		{
			output(" pressing her soft, pliant ass against your thighs, the heat of her sweltering pussy apparent");
			if (pc.isCrotchExposed()) output(" against your bare flesh.");
			else output(" even through your [pc.lowerGarment].");
		}

		output("\n\nBetween the feeling of her plump butt in your lap and your lower lip in her teeth, you almost forget what you came here to talk about in the first place! You manage to mumble out a <i>“Hold on a minute,”</i> before completely surrendering to your lust for the sexy zil. Zheniya leans back in your lap until only her hands remain locked behind your head, a thin string of saliva dripping between you until she daintily wipes it from her chin.");

		output("\n\n<i>“What’s the matter, sugar?”</i> she wonders, breathlessly.");

		output("\n\nYou briefly consider how best to broach the subject as as her smooth, dark eyes stare inquisitively into your own.");
		if (pc.isNice()) output(" Your hands stroke her hips warmly as you make sure she knows that you don’t mean it in any judgmental way, but that you think it would be best for her - and especially for her child - if she were to give up her current profession... at least for the time being.");
		else if (pc.isMisc()) output(" Your serious facade drifts into a grin, and you tell her that you’ve never really been a fan of sloppy seconds, after all, and that a looser schedule might do your favorite zil woman some good.");
		else output(" Your hands drift possessively to her thighs as you tell her to stop whoring herself out; she belongs to you now.");

		if (flags["ZIL_CALLGIRL_PREGNANCY_MONEY"] == 1)
		{
			output("\n\n<i>“[pc.name], sweetie,”</i> she begins with a sigh, almost sounding apologetic. <i>“I appreciate all the help you’ve offered me in this - I </i>really<i> do,”</i> she continues, trailing off slightly.");

			output("\n\n<i>“I’m just not sure if I can do that, sugar. I really need the income, and more than that, I just love - my - job,”</i> she punctuates each word with a kiss on your neck and a grind on your hips...");

			output("\n\n<i>“Speaking of my job,”</i> Zheniya continues, giving your jaw a lick. <i>“Since you’ve come all this way, maybe you’d like to have a go?”</i> She rolls off of you, laying back on her bed with her legs spread wide, her wetness clearly visible already, a silent invitation to claim your mate once more.");

			processTime(5);
			
			if (fromPregnancyTalk)
			{
				clearMenu();
				addButton(0, "Get Oral", zilCallGirlGetOral, undefined, "Get Oral", "Have her put that exotic tongue to use!");
				if (pc.hasCock()) addButton(1, "Fuck Her", zilCallGirlFuckHer, undefined, "Fuck Her", "You’re hard as a rock, and her legs are already spread for you. The girl’s twat is practically rubbing against your cock already, so go ahead and slide on in!");
				else addDisabledButton(1, "Fuck Her", "Fuck Her", "You need a cock to fuck her.");
				addButton(2, "Get Honey", zilCallGirlSuckleHoney, undefined, "Suckle Honey", "Your hands on the waspy girl’s breast gives you an idea...");
				if (flags["ZIL_CALLGIRL_STOPWHORE_DISABLED_UNTIL"] == undefined || flags["ZIL_CALLGIRL_STOPWHORE_DISABLED_UNTIL"] <= GetGameTimestamp()) addButton(3, "Stop Whoring", zilCallgirlStopWhoring, fromPregnancyTalk, "Stop Whoring", zilCallgirlStopWhoringTooltip());
				else addDisabledButton(3, "Stop Whoring");
				return;
			}
		}
		else if (flags["ZIL_CALLGIRL_PREGNANCY_MONEY"] == 2)
		{
			output("\n\n<i>“Is that how you feel, [pc.name]?”</i> Zheniya muses, pursing her lips as if in thought. <i>“You know I appreciate all the help you’ve offered me in this - I </i>really<i> do. Hearing you wanted to play father for me meant the world. But a girl’s still got to make a living, sugar. Your nursery is");
			if (flags["ZIL_CALLGIRL_HAS_BIRTHED"] == undefined) output(" going to be");
			output(" a big help and all, but that doesn’t take care of </i>me<i>.”</i>");
			
			output("\n\nShe gives you an apologetic smile. <i>“Besides, income aside, I just love - my - job,”</i> she punctuates each word with a kiss on your neck and a grind on your hips...");
			
			output("\n\n<i>“Speaking of my job,”</i> Zheniya continues, giving your jaw a lick. <i>“Since you’ve come all this way, maybe you’d like to have a go?”</i> She rolls off of you, laying back on her bed with her legs spread wide, her wetness clearly visible already, a silent invitation to claim your mate once more.");

			processTime(5);
			flags["ZIL_CALLGIRL_STOPWHORE_DISABLED_UNTIL"] = GetGameTimestamp() + (24 * 60);
			
			if (fromPregnancyTalk)
			{
				clearMenu();
				addButton(0, "Get Oral", zilCallGirlGetOral, undefined, "Get Oral", "Have her put that exotic tongue to use!");
				if (pc.hasCock()) addButton(1, "Fuck Her", zilCallGirlFuckHer, undefined, "Fuck Her", "You’re hard as a rock, and her legs are already spread for you. The girl’s twat is practically rubbing against your cock already, so go ahead and slide on in!");
				else addDisabledButton(1, "Fuck Her", "Fuck Her", "You need a cock to fuck her.");
				addButton(2, "Get Honey", zilCallGirlSuckleHoney, undefined, "Suckle Honey", "Your hands on the waspy girl’s breast gives you an idea...");
				addDisabledButton(3, "Stop Whoring");
				return;
			}
		}
	}
	else if (flags["ZIL_CALLGIRL_STOPWHORE_ATTEMPTS"] == 1)
	{
		output("Taking your familiar seat on the side of Zheniya’s bed, you once again turn your efforts towards convincing her to give up this less than ideal profession of hers.");
		if (pc.isMisc() || pc.isBimbo()) output(" Grinning up at her, you ask if she’s given what you talked about earlier any more thought. Maybe the two of you could be a little more of an item if she gave up the whole whoring theme...");
		else if (pc.isBro() || pc.isAss()) output(" Taking her hips possessively in your hands, you once again say that you want her to give up on whoring. This is no way for your child’s mother to be living.");
		else output(" You understand she enjoys it, but surely she doesn’t have to turn tricks to make ends meet. Amorous encounters on her terms would be so much better, wouldn’t they?");

		output("\n\nZheniya sighs, running a hand through her wild black hair. <i>“Sweetie... [pc.name]... listen, I understand where you’re coming from, but you’ve gotta understand, there’s not much else I can do to make a living here. I hate to say it, but even if I wanted a change of profession, what would I do? There’s not a lot of call for a spear-hunter on a metal city in space, with no animals to be found.”</i>");

		output("\n\n<i>“And before you ask,”</i> she says, putting a black-plated finger on your [pc.lips], <i>“I don’t want you to completely support me. A little help with");
		if (flags["ZIL_CALLGIRL_HAS_BIRTHED"] == undefined || flags["ZIL_CALLGIRL_HAS_BIRTHED"] == 1) output(" the baby");
		else output(" our kids");
		output(" is one thing, but I hate the idea of being dependent on anybody. I... well, I have my reasons. But I’ve got to do </i>something<i> for myself. Understand?”</i>");

		processTime(5);
		clearMenu();
		addButton(0, "Offer Help", zilCallgirlStopWhoreOfferHelp, undefined, "Offer Help", "She’s nuts if she won’t accept credits from you! Is her pride really worth all this ignominy? ");
		if (flags["BRIGET_MET"] != undefined) addButton(1, "Nursery Job", zilCallgirlStopWhoreNursery, undefined, "Nursery Job", "Well, if Zheniya wants to work for a living, maybe you could offer her a job.");
		else addDisabledButton(1, "Nursery Job", "Nursery Job", "It’d probably be a good idea to actually go speak to the person overseeing the nursery on your behalf before offering jobs to people!");
		addButton(2, "Okay", zilCallgirlStopWhoreOkay, undefined, "Okay", "You suppose you’ll have to live with that, then.");
		return;
	}
	
	// Failsafe!
	clearMenu();
	addButton(0, "Okay", zilCallgirlStopWhoreOkay, undefined, "Okay", "You suppose you’ll have to live with that, then.");
}

public function zilCallgirlStopWhoreOfferHelp():void
{
	clearOutput();
	showZilCallGirl();

	output("<i>“Come on, Zheniya,”</i> you say, stroking her thigh. <i>“Let me take care of you. I-”</i>");
	
	output("\n\nYour insectile lover shakes her head, making her dark hair swish wildly around her perfect visage. <i>“No! [pc.name], listen to me: I appreciate the offer, I really do, but you need to understand that I’m not going to sit around all day, lounging in comfort and opulence until my mighty star-walker hero" + pc.mf("", "ine") +" comes back and deigns to favor me with a frivolous fuck. Understand?”</i>");
	
	output("\n\nYou shake your head. <i>“Not really?”</i>");
	
	output("\n\nZheniya sighs and sits herself beside you, putting a hand on her "+zilCallGirlBellyFragment()+". <i>“I know you just want to help. And you want me to be all yours. Honestly, the second part would be nice... but the first... you want something I can’t give you. I won’t. I’ve got to be my own woman. So thank you, [pc.name], but no thank you. I’ve found work I enjoy here, that speaks to my abilities where nothing else in this strange space of yours does.”</i>");
	
	output("\n\nYou sigh and stand, impotently frustrated. Zheniya follows you, putting a soothing hand on your shoulder. <i>“Let me make it up to you,”</i> she offers, gently tugging you back to her bed. <i>“Please?”</i>");

	processTime(4);
	zilCallgirlSexMenu();
}

public function zilCallgirlStopWhoreOkay():void
{
	clearOutput();
	showZilCallGirl();

	output("You nod. <i>“Alright, alright.”</i>");

	output("\n\n<i>“Thank you, [pc.name],”</i> Zheniya says. Her serious expression melts into her familiar, seductive grin. <i>“Now, how about I show you how much I appreciate your being so understanding...”</i>");

	processTime(2);
	zilCallgirlSexMenu();
}

public function zilCallgirlStopWhoreNursery():void
{
	clearOutput();
	showZilCallGirl();

	output("An idea strikes you, and you smile up at Zheniya. <i>“How about I offer you a job?”</i>");

	output("\n\nShe cranes her head to the side, pursing her lips. You continue, explaining that you own the nursery, after all, and Briget is more than happy to accept your recommendations for new staff. You’re sure she could make herself useful there, even if it’s just cleaning or cooking");
	if (ChildManager.mobileInAgeRangeYears(14, -1)) output(" or maybe even teaching spear-fighting to your offspring. Physical education’s kind of lacking up there anyway");
	output(".");
	
	output("\n\nZheniya listens attentively through your proposal, murmuring softly to herself as you finish. <i>“You’re a master of compromise, aren’t you?”</i> she laughs after a moment’s thought. <i>“Among zil, raising children was always a communal effort. The whole village would work together for it. If I can help with your other children, and you with mine... well, that just feels like home.”</i>");
	
	output("\n\n<i>“So that’s a yes?”</i>");
	
	output("\n\nShe chuckles, leaning in and wrapping her black lips around yours, pulling back with a suckling pop. <i>“Oh, yes. Yes, yes, yes...”</i>");
	
	
	output("\n\nYou grab Zheniya by the waist, pulling her up and spinning her into a tight embrace. She laughs again, wrapping her legs around you and running her soft-armored fingers along your back. <i>“Alright, [pc.name], you’ve won. I’ll go and tell my, um, friend downstairs to close out my tab on the room. If your nursery is paying, I can finally move up to that lovely residential deck!”</i>");
	
	output("\n\nZheniya squirms out of your grasp and bounds over to her dresser, quickly throwing on the little red dress you saw her in once before. <i>“I’ll be a moment, love, and then I’ve got to pack. Mind putting off today’s rendezvous for a bit?”</i>");
	
	output("\n\n<i>“Not at all,”</i> you say, following her out. You give her an affectionate slap on the ass as you go, letting her walk downstairs with a sexy spring in her step.");

	processTime(5);

	//Back to Anon's Menu
	//Callgirl disabled for 24 hours. Then appears at Nursery and Res.Deck.
	flags["ZIL_CALLGIRL_DISABLED_TYPE"] = 3;
	flags["ZIL_CALLGIRL_DISABLED_TIMESTAMP"] = GetGameTimestamp();
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function zilCallgirlFatherFreebies(fromPregNote:Boolean = false):void
{
	clearOutput();
	showZilCallGirl();

	output("<i>“Alright. Let’s have some fun,”</i> you smile, stepping into the whore’s room and sliding the door closed behind you. It seals with a pneumatic hiss, leaving the two of you alone and basking in the heady mix of incense, sweat, and sex that clings to the air of her room.");
	
	output("\n\nYour heart flutters as the call girl smiles and spreads her legs invitingly, patting a thigh. <i>“Perrrrfect. I’m all yours then, lover. Come and get it!”</i>");
	
	output("\n\nYou shuck your [pc.gear] and stride over to the bed, pressing the alien beauty onto her back with a confident hand. She giggles, and lets her legs ride up around your [pc.hips], curling around you. You lean in and drink deep of her scent, rich and honey-like, made even sweeter by the delicious mix of sweat and arousal that clings to her smooth skin like a lurid perfume.");
	
	output("\n\n<i>“Ohh, you </i>are<i> eager, aren’t you?”</i> the alien beauty coos, black lips pressing against yours. A long tongue finds its way out to play with yours, wrapping around your [pc.tongue] and drawing you deeper into her embrace. She giggles girlishly, guiding one of your hands up to her full breast and the black, stiff teat atop it. Your [pc.legs] move to encircle her flared hips, pushing the alien beauty deeper onto her plush bed as you decide what to do with her. Still your kiss binds you together, linking your bodies even as her golden hand plays across your [pc.crotch], silently urging you to pin her down and fuck her hard.");

	processTime(2);
	
	clearMenu();
	addButton(0, "Get Oral", zilCallGirlGetOral, undefined, "Get Oral", "Have her put that exotic tongue to use!");
	if (pc.hasCock()) addButton(1, "Fuck Her", zilCallGirlFuckHer, undefined, "Fuck Her", "You’re hard as a rock, and her legs are already spread for you. The girl’s twat is practically rubbing against your cock already, so go ahead and slide on in!");
	else addDisabledButton(1, "Fuck Her", "Fuck Her", "You need a cock to fuck her.");
	addButton(2, "Get Honey", zilCallGirlSuckleHoney, undefined, "Suckle Honey", "Your hands on the waspy girl’s breast gives you an idea...");
	if (flags["ZIL_CALLGIRL_STOPWHORE_DISABLED_UNTIL"] == undefined || flags["ZIL_CALLGIRL_STOPWHORE_DISABLED_UNTIL"] <= GetGameTimestamp()) addButton(3, "Stop Whoring", zilCallgirlStopWhoring, fromPregNote, "Stop Whoring", zilCallgirlStopWhoringTooltip());
	else addDisabledButton(3, "Stop Whoring");
}

public function zilCallGirlCall(opts:Array):void
{
	var rentHer:Boolean = opts[0];
	var freebie:Boolean = opts[1];

	clearOutput();
	generateMapForLocation("CALLGIRL ROOM");
	showZilCallGirl();
	author("Savin");
	
	// Nevermind
	if (!rentHer)
	{
		output("<i>“Aww. Nervous, hun?”</i> the callgirl coos, blowing you a kiss. <i>“Go ahead and take your time. I’ll be here.”</i>");
		clearMenu();
		addButton(0, "Next", mainGameMenu);
		return;
	}
	// Rent Her
	else
	{
		output("<i>“Alright. Let’s have some fun,”</i> you smile, stepping into the whore’s room and sliding the door closed behind you. It seals with a pneumatic hiss, leaving the two of you alone and basking in the heady mix of incense, sweat, and sex that clings to the air of her room.");
		if (flags["ZIL_CALLGIRL_PREGNANCY_MONEY"] != 2 && !freebie)
		{
			output(" She nods her head towards a small cred-chit reader tucked onto a dresser near her bed, and you make quick work of paying your fee.");
			output("\n\nYour heart flutters as the call girl smiles and spreads her legs invitingly, patting a thigh. <i>“Perrrrfect. I’m all yours then, lover. Come and get it!”</i>");
			pc.credits -= zilCallgirlPrice();
		}
		else
		{
			output("\n\nYour heart flutters as the call girl smiles and spreads her legs invitingly, patting a thigh. <i>“I’m all yours, lover. Come and get it!”</i>");
		}
		
		output("\n\nYou shuck your [pc.gear] and stride over to the bed, pressing the alien beauty onto her back with a confident hand. She giggles, and lets her legs ride up around your [pc.hips], curling around you. You lean in and drink deep of her scent, rich and honey-like,");
		//if 1st time:
		if (zilCallGirlSexed() <= 0) output(" mixed with the sheen of sweat from her last encounter, and the musk rising from between her legs where the alien’s seed is cooling.");
		//else:
		else output(" made even sweeter by the delicious mix of sweat and arousal that clings to her smooth skin like a lurid perfume.");
		
		output("\n\n<i>“Ohh, you </i>are<i> eager, aren’t you?”</i> the alien beauty coos, black lips pressing against yours. A long tongue finds its way out to play with yours, wrapping around your [pc.tongue] and drawing you deeper into her embrace. She giggles girlishly, guiding one of your hands up to her full breast and the black, stiff teat atop it. Your [pc.legs] move to encircle her flared hips, pushing the alien beauty deeper onto her plush bed as you decide what to do with her. Still your kiss binds you together, linking your bodies even as her golden hand plays across your [pc.crotch], silently urging you to pin her down and fuck her hard.");
		
		output("\n\nHow do you take her?");
		
		processTime(2);
		
		clearMenu();
		addButton(0, "Get Oral", zilCallGirlGetOral, undefined, "Get Oral", "Have her put that exotic tongue to use!");
		if (pc.hasCock()) addButton(1, "Fuck Her", zilCallGirlFuckHer, undefined, "Fuck Her", "You’re hard as a rock, and her legs are already spread for you. The girl’s twat is practically rubbing against your cock already, so go ahead and slide on in!");
		else addDisabledButton(1, "Fuck Her", "Fuck Her", "You need a cock to fuck her.");
		addButton(2, "Get Honey", zilCallGirlSuckleHoney, undefined, "Suckle Honey", "Your hands on the waspy girl’s breast gives you an idea...");
	}
	return;
}

public function zilCallGirlGetOral(inAppt:Boolean = false):void
{
	clearOutput();
	if (!inAppt) generateMapForLocation("CALLGIRL ROOM");
	showZilCallGirl();
	author("Savin");
	
	output("With a talented mouth like hers, it’d be a shame not to put it to good use...");
	output("\n\n<i>“Is that so?”</i> she says as you explain your desires. <i>“I think I can make all your dreams come true, then.”</i>");
	
	output("\n\nYou smile at her and run a hand along the cup of her of her soft, squeezable breasts. Steadily moving up her lush body, you brush your thumb over the sin-black flesh of her nipple, her slender shoulders, finally hooking it into her lip and gently pulling at the lush, dark rim of her mouth.");
	// if preggoZil:
	if (zilCallGirlPregnant()) output(" Paying special attention to your lover’s swollen belly, you caress the tight golden flesh, feeling the wonderful warmth radiating off of her, so full of life.");
	output(" You start to crawl up the ");
	if (CodexManager.entryViewed("Zil")) output("zil");
	else output("exotic");
	output(" woman’s slender frame, kissing and caressing until your");
	if (pc.hasCock())
	{
		output(" [pc.cocks] ");
		if (pc.cockTotal() == 1) output("is");
		else output("are");
		output(" dangling");
	}
	else
	{
		output(" [pc.cunts] ");
		if (pc.totalVaginas() == 1) output("is");
		else output("are");
		output(" poised");
	}
	output(" over her mouth.");
	
	output("\n\nShe giggles and brushes her chitinous fingers along");
	if (pc.hasCock()) output(" the length of your [pc.cock]");
	if (pc.hasCock() && pc.hasVagina()) output(" and down to");
	if (pc.hasVagina()) output(" the lips of your [pc.cunt]");
	output(". A shiver of pleasure meanders through your spine as the lusty alien teases you, her long tongue reaching out to caress your sex. Her hands grab your [pc.butt], squeezing you and drawing you in until her");
	if (!pc.hasCock()) output(" tongue is pressing in between your lips");
	else output(" lips are pressed to your [pc.cockHead], opening wide to swallow your [pc.cock]");
	output(".");
	
	// if PC has a cock:
	if (pc.hasCock())
	{
		output("\n\nYou chew your lip and ease your [pc.cock] between the alien babe’s lush, black cockpillows. She moans and takes all you have to give her, wrapping her lips around your prick and sucking hard. She wasn’t kidding about half the time, double the pleasure.... You grunt and dig your fingers into the sheets of her bed, pistoning your hips forward into her welcoming mouth. ");
		output("\n\nYou quickly find yourself using her face like a tight little pussy, pounding away at her wet depths and shadowy lips. The alien vixen puts on like she loves every second of it, moaning and groaning and arching her back. Her plated fingers squeeze your ass, even giving you a playful smack as if to say <i>“More! More!”</i>");
		output("\n\nPressing her deeper into the bed, you fuck the ");
		if (CodexManager.entryViewed("Zil")) output("zil");
		else output("alien");
		output("’s mouth as hard as you can. Her tongue works wonders, wrapping around your [pc.cock] in a sultry, wringing grasp. Every time you thrust between her lips, she moans lasciviously and seems to draw you deeper in, inviting you to ram your meat down her throat.");
		output("\n\nA few minutes of the alien beauty’s oral treatment brings you to the edge, and then over it with a spectacular series of moans and grunts. You hilt your prick in her mouth and let loose a");
		if (pc.cumQ() < 50) output(" trickle of cum onto the back of her throat");
		else if (pc.cumQ() < 100) output(" few squirts of spooge down her throat");
		else if (pc.cumQ() < 200) output(" hefty load of spunk down her throat, making her gag on your virile load");
		else output(" torrential load of seed down her throat, bloating the alien girl’s belly with the sheer volume of your orgasm");
		output(".");
	}
	// Else if PC has a vag:
	else
	{
		output("\n\nYou smile down at the exotic beauty and use a pair of fingers to spread your pussylips open, inviting the ");
		if (CodexManager.entryViewed("Zil")) output("zil");
		else output("alien");
		output(" to explore your depths with that lengthy tongue of hers. She does so eagerly, flicking it along your inner lip and tracing her way around your [pc.clit]. You shiver with pleasure, moaning and groping at your [pc.chest] as she works her lascivious art.");
		output("\n\n<i>“What a lovely taste!”</i> the yellow wasp-girl coos, kissing her way from your clit down to the gently-throbbing passage of your sex. You drink in a deep, long breath of air that twists into a husky moan when the alien babe’s tongue slithers into you. Ohhh, that’s the stuff! You bite your lower lip and gently rock your hips, riding her face and that writhing, thick tongue of hers.");
		output("\n\nThe callgirl controls her tongue with a serpentine grace, wiggling it against your juicy walls and hitting all the tenderest spots along the way. Your hand runs through her spiney, raven-black hair, urging her deeper and deeper into your quivering quim. Juices trickle down onto her face, smearing her black lips and chin with a glistening sheen of your mounting excitement.");
		output("\n\nA few minutes of the alien beauty’s oral treatment brings you to the edge, and then over it with a spectacular series of moans and grunts. You press your [pc.cunt] flush with her lips, getting as much of that squirming muscle inside you as you can before your climax washes over you in a wave of screaming ecstasy and gushing fem-cum. Your partner giggles as you orgasm all over her, splattering her face with girl-spunk.");
	}
	// Combine
	output("\n\n<i>“My, that was something,”</i> the ");
	if (CodexManager.entryViewed("Zil")) output("zil");
	else output("waspy alien girl");
	output(" smiles, running a black-plated finger through the coating of juices on her face. <i>“Mmm, I never quite get used to the taste of you aliens,");
	// if honeycum:
	if
	(	(pc.hasCock() && InCollection(pc.cumType, GLOBAL.FLUID_TYPE_HONEY, GLOBAL.FLUID_TYPE_NECTAR))
	||	(pc.hasVagina() && InCollection(pc.girlCumType, GLOBAL.FLUID_TYPE_HONEY, GLOBAL.FLUID_TYPE_NECTAR))
	)
	output(" though you... your cum reminds me of home. Such a delicious honey...");
	// elseif normal dude cum:
	else if (pc.hasCock() && pc.cumType == GLOBAL.FLUID_TYPE_CUM) output(" so salty... and just a little bit bitter! Yet it’s surprisingly rich, like a gressia pear -- a fruit we have back on Mhen’ga. I like it.");
	// else:
	else output(" though it’s not bad by any means. Actually quite nice... and yours especially.");
	output(" You’ll come back and giving me another taste soon, won’t you, my friend?”</i>");
	
	output("\n\nYou");
	if(pc.isAss()) output(" shrug and tilt your head, collecting your discarded gear and swooping down to give her a parting smack in the ass");
	else output(" give her a nod as you collect your discarded gear, swooping in to give her a parting kiss");
	output(" before you take your leave.");
	
	pc.orgasm();
	zilCallGirlSexed(true);
	processTime(25);
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function zilCallGirlFuckHer(inAppt:Boolean = false):void
{
	clearOutput();
	if (!inAppt) generateMapForLocation("CALLGIRL ROOM");
	showZilCallGirl(true);
	author("Savin");
	
	// Select wiener!
	var x:int = pc.cockThatFits(chars["ZILFEMALE"].vaginalCapacity());
	if (x < 0) x = pc.smallestCockIndex();
	
	output("You smile lustfully around the waspy alien’s tongue-filled kiss, giving her breast a rough squeeze until she’s moaning, arching her back and squeezing her long legs around your waist. The whore’s reaction only serves to make you want her more, sending shivers of raw, animal lust through you until you’re bucking your hips against her sodden crotch, using your [pc.cockHead] to search out the lips of her black twat. Her hand slips down and grasps your member, giving you a quick stroke as she guides you lower, aligning your dick with the black lips of her sex.");
	// 1st time:
	if (zilCallGirlSexed() <= 0) output(" The green brut’s cum is still fresh on her pussylips, radiating wet warmth as you start to thrust in. She wasn’t kidding -- cum makes for a fine lube, letting you glide straight into her tight little twat.");
	// else:
	else output(" She’s as excited as you are, if the sheen of slimy feminine juice that greets your probing cockhead is any indication. The exotic babe coos lustily, pushing her hips back against you until your crown finally pushes through the startling tight lips of her dark hole, and you’re able to thrust deep into her sodden slit.");
	
	pc.cockChange();
	
	output("\n\n");
	// if cock > 6 inches:
	if (pc.cocks[x].cLength() > 6) output("<i>“Oh, so big!”</i> she groans, putting a hand on her belly and arching her back with every inch of cockmeat you pump into her. <i>“Nothing... nothing quite like this back home! Ah-ah yes!”</i>");
	// else:
	else output("<i>“Mmm, nice and snug!”</i> she purrs, clamping her muscles down around your tiny prick. She releases you a moment later, only to clench and ease again and again, squeeze-milking you like a wet, gloved hand around your pecker. You can only thrust ever so slightly with a grip like hers wringing you; damn, but she’s got amazing control down there! <i>“Ah, just like that. Wiggle those hips for me, love... and I’ll milk out every drop you have!”</i>");
	output(" A throaty moan of pleasure tears free from her black lips, and your " + ((flags["ZIL_CALLGIRL_NAME_KNOWN"] == undefined && !inAppt) ? "paid" : "lusty") + " lover rolls her head back into her pillows. You’re completely on top of her now, your [pc.belly] pressed against her");
	if (zilCallGirlPregTime(true) < 5) output(" flat, strong stomach");
	else if (zilCallGirlPregTime(true) < 25) output(" slightly plush, curvaceous belly");
	else if (zilCallGirlPregTime(true) < 50) output(" obviously swollen belly");
	else output(" gavidly pregnant womb");
	output(". She draws you deeper into her with her legs, using her strong muscles to guide you in and in until");
	if (pc.cocks[x].cLength() > 6) output(" her belly is stretching around your tremendous rod, fully packed with cockmeat. If you blew your load now, you’d be painting her womb with seed!");
	else output(" you’re hilted against her dark cunt, completely buried in the hot, luridly lubricated hole.");
	
	output("\n\nYou grab both of her breasts in that moment, roughly squeezing the full, fleshy mounds until her sin-black teats bubble up with a thick, yellow honey. She gasps with pleasure, sucking in an unexpected breath as you suck up her nectar, running your tongue around her nipples and gently nibbling on them, using your teeth to coax out more and more of her honey");
	if (zilCallGirlPregTime(true) > 33) output(" -- and as gravid as she is, her body is swollen not only with life but with a greater abundance of honey, leaving so much for you, that comes out so easily");
	output(". The ");
	if (CodexManager.entryViewed("Zil")) output("zil");
	else output("waspy alien");
	output(" moans and squirms under you, her muscles clenching hard around your [pc.cock] as you thrust and suck, trapping her in constant waves of pleasure that leave her screaming. Her vaginal muscles relax their deathgrip on your [pc.cock], letting you start to move a little faster. You take the opportunity with gusto, rearing back and hammering home, starting to pound the ");
	if (CodexManager.entryViewed("Zil")) output("zil-");
	else output(" call ");
	output("girl’s hole until the cramped quarters echo with the sounds for flesh smacking wetly against flesh, mixing with her moans to form a resounding symphony of pleasure.");
	output("\n\nEvery sense you have is assailed with the wonders of your lover’s body: the feeling of her breasts and pussy underneath you, the taste of her honey on your [pc.tongue], the sounds of her shrieks and your feral grunts, the sight of her throwing her head back holding you close, the smells of sex and her sweet honey-laden orgasm as ceaseless as your pounding pushing her to the very edge. Her climax brings out your own as her body goes wild, flooding your mouth with unbidden gouts of honey and clenching hard around your cock, trapping you");
	if (pc.balls > 0) output(" balls");
	output(" deep inside her when you finally cum, and cum, and cum...");
	output("\n\n<i>“Ah... ah, yes,”</i> the call girl moans, collapsing into the plush embrace of her bed, going utterly limp as you pump her womb full of seed.");
	if (pc.cumQ() >= 200)
	{
		output("<i>“Let it all out inside me... mmm. I love that feeling -- of seed sloshing around in my womb, coating my cunt.");
		if (zilCallGirlPregnant()) output(" Would that I could be pregnant twice over,”</i> she teases, cupping your cheek.");
		else output("”</i>");
	}

	if (!inAppt)
	{
		output("\n\nYou manage to moan between receding shockwaves of pleasure, finally emptying your [pc.balls] inside her. She coos happily");
		if (pc.cumQ() >= 500) output(", even as your prodigious load gushes back out when you withdraw, soaking her bed in a [pc.cumColor] mess");
		else output(" as you pull out, leaving her thighs and black lips stained with moisture");
		output(". <i>“You’ll have to do that to me again soon. Won’t you?”</i> she smiles, leaning down to plant a kiss on your brow.");
		output("\n\nYou");
		if(pc.isAss()) output(" smirk back");
		else output(" return the smile");
		output(", rolling off of her and onto the bed beside her. As much as you’d like to stay here for a moment, enjoying the afterglow... you know she’ll have more “customers” before long. Best to let her get on with it. You gather your gear and head out, giving her a");
		if(pc.isAss()) output(" parting slap on the ass");
		else output(" last parting kiss");
		output(" as you go. ");
		output("\n\n<i>“Take care,”</i> she calls after you, closing her eyes in contentment.");
	}
	else
	{
		output("\n\nYou manage to smile between receding shockwaves of pleasure, finally emptying your [pc.balls] inside her. She coos happily");
		if (pc.cumQ() >= 1000) output(", even as your prodigious load gushes back out when you withdraw, soaking her bed in a [pc.cumColor] mess");
		else output(" as you pull out, leaving her thighs and black lips stained with moisture");
		output(". <i>“You’ll have to do that to me again soon. Won’t you?”</i> she smiles, leaning down to plant a kiss on your brow.");
		// Not preggers:
		if(!zilCallGirlPregnant()) output(" <i>“Maybe that virile seed of yours will take inside me again... I look forward to it.”</i>");

		output("\n\nYou return the smile, rolling off of her and onto the bed beside her. As much as you’d like to stay, you do have business elsewhere.");

		output("\n\n<i>“Ah, I know,”</i> she sighs, wiping a trickle of [pc.cum] from her thigh and licking it off her fingers. <i>“I won’t keep you, love. Just promise you’ll come back when you’re able.”</i>");

		output("\n\nThat... you can do.");
	}
	
	pc.orgasm();
	// +25 Energy
	pc.energy(25);
	zilCallGirlSexed(true);
	processTime(25);
	
	// Try to get her pregnant!
	zilCallGirlKnockUp(pc.virility());
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function zilCallGirlSuckleHoney(doClear:Boolean = true):void
{
	if (doClear)
	{
		clearOutput();
		generateMapForLocation("CALLGIRL ROOM");
		showZilCallGirl();
		
		//Has gotten honey in last 6 hours:
		if (flags["ZHENIYA_LAST_HONEY_TIMESTAMP"] != undefined && flags["ZHENIYA_LAST_HONEY_TIMESTAMP"] + (6 * 60) > GetGameTimestamp())
		{
			output("You stroke a hand up from the buzzing beauty’s waist, along her chitinous corset and "+zilCallGirlBellyFragment()+", and let your fingers sink into the sinfully soft flesh of her meaty chest. She gasps quietly, letting the stiffening of the black nipple rubbing against your palm communicate her approval of the gesture.");
			output("\n\n<i>“Mmm, that feels lovely, sugar,”</i> she adds, nuzzling into your neck. <i>“But you’ve milked me dry already. Why don’t we try something a little less draining, hmm?”</i>");
			output("\n\nThe call girl gives you a little wink and takes your hand, moving it down onto her plump behind instead.");
			
			processTime(2);
			addDisabledButton(2, "Get Honey");
			
			return;
		}
	}

	author("Savin");
	
	var isMommy:Boolean = (flags["ZIL_CALLGIRL_NAME_KNOWN"] != undefined);
	
	output("You grin up at the golden-skinned beauty, squeezing her full, swollen breast. She’s so full of sweet nectar in there that groping her feels like you’re sinking your fingers into a full water balloon");
	// if preg:
	if (zilCallGirlPregnant()) output(", so swollen with honey that it might just pop at any moment");
	output(". The ");
	if (CodexManager.entryViewed("Zil")) output("zil");
	else output("waspy alien");
	output(" moans quietly, letting her head roll back as you play with her chest. <i>“Mmm, hungry, darling?”</i> she buzzes. <i>“With all the wonderful food on this station, I’ve got more than enough honey to feed all of my friends.”</i>");
	
	output("\n\nHer black-chitined fingers reach up, running across your [pc.hair] and gently guiding you down towards the rolling crest of honey-laden titflesh riding high on her chest. Your hands release her, letting your [pc.lips] take their place; you flick your [pc.tongue] across her oil-black nipple, circling around it before you latch on. Your teeth close around her black teat, rolling it between them until a sweet, thick taste bubbles out to stain your tongue. After that, it takes just the barest amount of suction to start her nectar flowing like liquid gold into your mouth");
	// if preg:
	if (zilCallGirlPregnant()) output(", coming in great waves that you struggle to keep up with -- her body is making so much more than a normal woman, now, that you barely have to do anything to get a mouthful of sweet honey");
	output(".");
	
	output("\n\n<i>“Drink as much as you want,”</i> " + (isMommy ? "Zheniya" : "the call girl") + " purrs, spreading her arms back around the headboard and thrusting her chest out -- and into your face. You grab her other breast, squeezing hard enough to make a nice squirt of amber spurt around your fingers. Even more finds its way into your mouth, bloating your cheeks with every passing second. You can’t swallow fast enough to keep up! As much as you’re able to gulp down, it isn’t enough to keep her from making a mess of your chin, slathering you in honey; more drools down her chest, splattering onto the bedsheets. After a while, the waspy girl starts moaning in time to your gasping suckles, biting her own black lip to keep from crying out -- she’s more sensitive than she lets on!");
	output("\n\nSmirking to yourself, you crawl a little higher up her body, caressing her tits with both hands and shifting your mouth from one golden peak to the other, savaging her black teats. Finally you manage to wrest a shrill, pleasured cry from the " + (isMommy ? "mother" : "whore") + "’s lips; she arches her back and screams, bucking her hips and pressing you tight into her chest as she cums just from you sucking and squeezing!");
	output("\n\nYou sigh and pull yourself off of her, letting the excess honey dribble down your chin as you lean back, as full as you can stand to be of her sweet, sweet nectar. The waspy " + (isMommy ? "mother" : "whore") + " smiles, eyes drooping heavily as her body continues to quake and quiver from the orgasm. <i>“My, you... you have a talented mouth,”</i> she murmurs, tracing her finger through some of the spilled honey surrounding her and bringing it to her mouth. She cleans the golden digit with relish, sucking up every drop with seductive moans.");
	output("\n\nSatisfied with your sweet meal, you roll off the bed and start to collect your gear. By the time you have, the well-sucked call girl’s cleaned up most of her mess, scooping the spilled honey into some bottles from her nightstand. Something tells you this happens to her pretty regularly.");
	
	pc.lust(25);
	// +25 Energy
	pc.energy(25);
	zilCallGirlSexed(true);
	processTime(25);
	
	flags["ZHENIYA_LAST_HONEY_TIMESTAMP"] = GetGameTimestamp();
	
	// PC gets 3 vials of Zil Honey. (Continuity: Only if they know what a zil is though!)
	if(CodexManager.entryViewed("Zil"))
	{
		var HunnyFlash:ZilHoney = new ZilHoney();
		HunnyFlash.quantity = 1 + rand(3);
		output("\n\n<i>“Here. For being so selfless with me,”</i> she smiles, pressing " + num2Text(HunnyFlash.quantity) + " of the vials into your hand. <i>“To remember me by.”</i>");
		output("\n\nYou take ");
		if (HunnyFlash.quantity == 1) output("it");
		else output("them");
		output(", leaning in to give the lusty alien a");
		if(pc.isAss()) output(" slap on the ass");
		else output(" parting kiss");
		output(" before you depart.");
		output("\n\n");
		quickLoot(HunnyFlash);
	}
	else
	{
		clearMenu();
		addButton(0, "Next", mainGameMenu);
	}
}

/*
public function zilCallGirlPregScene(isBirthing:Boolean = false):void
{
	clearOutput();
	generateMapForLocation("CALLGIRL ROOM");
	showZilCallGirl();
	author("???");
	
	// For her birthing and/or post-birth stuffs
	// Pregnancy blurbs and events!
	
	// Birthing!
	if (isBirthing)
	{
		output("...And boy is she expecting!");
		output("\n\nAs soon as you’re inside the room,");
		if (pc.hasAirtightSuit()) output(" you hear");
		else
		{
			output(" you are hit with a thick fog of pheromones, clouding your ability to smell, blurring your vision, and tingling your [pc.groin]. However, this only lasts for a brief moment when your sense of hearing picks up on");
			pc.lust(25);
		}
		output(" the sound of heavy, labored moaning. Homing in on the source, the haze on your senses quickly fades and you finally see the naked call girl before you, splayed out on her thick, poofy bed.");
		
		// 9999: Write her giving birth here! Describe her belly size! If first time, Steele may be a little panicky and wanting to call Tavros medical services. She'll say she knows how to give birth herself, so she asks Steele to help her out instead. Steele fetches her towels and water as she gives birth. Her belly shrinks for each child born. Children born are inside semi-soft egg-like shell (not sure if zil lay complete eggs, but these children are genetic chimeras, so they are part-Steele--if certain bodypart types are mentioned, then they need to be tracked and made sure they are recorded during the time of getting knocked up, otherwise the zil children will be part-human by default). After she is done birthing, she will ask for some privacy to recuperate. Steele will wait outside for about 15 minutes.
		
		output("\n\nThe call girl has given birth to ");
		if (flags["ZIL_CALLGIRL_EGG_COUNT"] == 2) output("twins");
		else if (flags["ZIL_CALLGIRL_EGG_COUNT"] == 3) output("triplets");
		else output(num2Text(flags["ZIL_CALLGIRL_EGG_COUNT"]) + " children");
		output("! Congratulations, dad!");
		
		processTime(40);
	}
	// Already birthed!
	else
	{
		output("...And boy is she expecting!");
		
		// 9999: She is breastfeeding her young, one on each tit. If there is a third, the third is sleeping near her in a crib. Other children may be playing napping beside her. Maybe have a blurb about her sending them off to a nursery or something! After all that, she will ask Steele for privacy so she can ready herself. Steele will wait outside for a few minutes.
		
		output("\n\nYou have sired " + num2Text(flags["ZIL_CALLGIRL_EGG_COUNT"]));
		if (StatTracking.getStat("pregnancy/zil call girl kids") > 0) output(" more");
		output(" children! They are quite the cute chimeral creatures if you can say so yourself!");
		
		processTime(5);
	}
	
	// Tracking number of kids:
	
	// Clear preg tracking.
	zilCallGirlPregnancyCleanup();
	
	// 9999: Maybe optional blurb for Steele to take these children to nursery, if that is ever a thing!
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
*/

public function resDeck16Func():Boolean
{
	if (zilCallgirlAtNursery())
	{
		output("\n\nOne of the apartments is certainly occupied, though: several Mhen’gan flowers are growing from pots in the window, and red silk curtains are flittering in the artificial breeze. A nameplate underneath that residence reads “Zheniya” - your lover has found quite a lovely place for herself with her new paycheck.");

		if ((hours >= 8 && hours <= 16) || pc.hasStatusEffect("Zheniya Birth Recover"))
		{
			if (pc.hasStatusEffect("Zheniya Birth Recover")) output(" <b>You’ll have to wait for her to recover from delivering her offspring before visiting her.</b>");
			else output(" <b>You’ll have to pay her a visit when she isn’t busy working in the nursery.</b>");
			flags["NAV_DISABLED"] = NAV_WEST_DISABLE;
		}
	}
	else flags["NAV_DISABLED"] = NAV_WEST_DISABLE;

	return false;
}

public function zheniyasApartmentFunc():Boolean
{
	author("Savin");
	
	if (hours >= 8 && hours <= 16)
	{
		clearOutput();
		showZilCallGirl();
		
		output("Zheniya brushes up against you and delivers a tantalizing peck on your cheek. <i>“Later, sugar. Some of us have work to do!”</i>");
		output("\n\nShe shuffles you out of her appartment, locking the door behind before vanishing off with a spring in her step toward the station elevator.");
		currentLocation = "RESIDENTIAL DECK 16";

		processTime(2);
		clearMenu();

		addButton(0, "Next", mainGameMenu);
		return true;
	}
	else
	{
		output("\n\nZheniya sits nearby, nude as the day you met her. In her own home, she still prefers the openness of bare flesh, allowing her ever-present honied smell to suffuse the air around her.");
		addButton(0, "Zheniya", zheniyaInAppt);
		return false;
	}
}

public function zheniyaInAppt():void
{
	clearOutput();
	showZilCallGirl();
	author("Savin");

	if (flags["ZIL_CALLGIRL_HAS_BIRTHED"] == 1 && flags["ZIL_CALLGIRL_BIRTH_MEETING_REQ"] == 1)
	{
		flags["ZIL_CALLGIRL_BIRTH_MEETING_REQ"] = undefined;
		output("<i>“[pc.name]!”</i> a jubilant, if tired, voice calls from inside as you enter Zheniya’s home. You peek your head into the bedroom, and are greeted by the familiar sight of your zil lover sitting naked on her bed, now dramatically less gravid... though, you note happily, her breasts, hips, and ass all look delightfully thicker than when you first met her.");

		var ZC:UniqueChild = ChildManager.youngestOfUniqueType(ZilCallgirlUniqueChild);

		output("\n\nZheniya rests back on her arms, smiling at you with those plush black lips of hers. <i>“Thank you again, for everything, love. I’ve left our new "+ZC.describeCollection("son", "daughter", "children") +" at your nursery, as you asked.");
		if (flags["ZIL_CALLGIRL_TOTAL_BIRTHS"] == 1) output(" The woman working there, Briget, was quite lovely.");
		else output(" Briget was delighted to see me again. She’s quite enamored of you, [pc.name], and your growing brood.");
		output(" The clinic told me to take it easy for the next few days, but... I think I’m more than ready to welcome my baby’s father into my bed, if that’s what you’ve come for. Ooh, it’s been too long since I felt svelte and agile! Let’s take advantage, sweet thing, what do you say?”</i>");
	}
	else if (zilCallGirlPregnant() && flags["ZIL_CALLGIRL_HAS_BIRTHED"] == 1 && flags["ZIL_CALLGIRL_PREGNANT_TOLD"] == 1)
	{
		zilCallgirlPregnantAgain();
		return;
	}
	else
	{
		output("You walk over to Zheniya and slip an arm around her supple waist, pulling your lover into a warm embrace. She purrs a wordless murmur of affection, tracing kisses up your neck. Her "+zilCallGirlBellyFragment()+" presses against you, and her heavy, honey-filled breasts quake with her every husky breath.");

		output("\n\n<i>“Hello, sweet thing,”</i> she breathes into your [pc.ear], running her chitinous digits down your back. So close to your zil lover, now, your senses are assailed by her sensual scent: honey and perfume and bare female sex: an alluring vapor that has you");
		if (pc.hasCock()) output(" half-hard");
		else if (pc.hasVagina()) output(" wet");
		else output(" worked up");
		output(" in the blink of an eye. <i>“Come to");
		if (flags["ZIL_CALLGIRL_TOTAL_BIRTHS"] == undefined && zilCallGirlPregnant()) output(" play with this mother-to-be?");
		else if (StatTracking.getStat("pregnancy/zil call girl kids") < 5) output(" see your mate, have you?");
		else output(" visit your beloved brood-mother again?");
		output("”</i>");
	}

	clearMenu();
	if (pc.lust() < 33) addDisabledButton(0, "Sex", "Sex", "You are not turned on enough for this.");
	else if (!pc.hasGenitals()) addDisabledButton(0, "Sex", "Sex", "You’d need some genitals to fully enjoy the experience...");
	else addButton(0, "Sex", zheniyaApptSex, undefined, "Sex", "Fuck your zil lover.");
	addButton(2, "Get Honey", zheniyaApptGetHoney, undefined, "Get Honey", "Ask Zheniya for a little of her sweet, sweet honey to go.");
	
	// Preg disable flag hotfix
	if(zilCallGirlPregTime(true) >= 100 && flags["ZIL_CALLGIRL_DISABLED_TYPE"] == 4 && (flags["ZIL_CALLGIRL_DISABLED_TIMESTAMP"] > GetGameTimestamp()) && flags["ZIL_CALLGIRL_BIRTH_MEETING_REQ"] == undefined)
	{
		output("\n\nYOU DONE FUCKED UP.");
		addButton(13, "Fix Preg", zheniyaFixPreg, undefined, "Fix Zheniya’s Pregnancy", "There was a mistake... use this to fix it.");
	}
	
	addButton(14, "Back", zheniyaApptBack);
}

public function zheniyaFixPreg():void
{
	clearOutput();
	showBust("");
	showName("PREGNANCY\nFIXED!");
	author("Jacques00");
	
	output("Zheniya’s pregnancy has been fixed. <b>You may need to wait for up to a day or so until a message appears.</b>");
	
	flags["ZIL_CALLGIRL_DISABLED_TIMESTAMP"] = GetGameTimestamp();
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function zheniyaApptSex():void
{
	clearOutput();
	showZilCallGirl();
	author("Savin");

	output("You "+ pc.mf("swagger", "sashay") +" into your waspy lover’s arms, pulling her against you and into a deep, long kiss. She all but melts in your arms, moaning sweetly; it’s effortless to start walking her back towards the bedroom");
	if (!pc.isNude()) output(", shedding your [pc.gear] as you go");
	output(". The silky curtains part around your lover’s shoulders, and");
	if (!zilCallGirlPregnant()) output(" one gentle push sends the alien beauty onto her back with a confident hand.");
	else output(" you sweep her up in your arms, carrying her tenderly to the bed and splaying her out on the minx covers.");
	output(" You follow her onto the bed, crawling onto her. Zheniya giggles, and lets her legs ride up around your [pc.hips], curling around you. You lean in and drink deep of her scent, rich and honey-like, made even sweeter by the delicious mix of sweat and arousal that clings to her smooth skin like a lurid perfume.");

	output("\n\n<i>“I’m yours, lover,”</i> the alien beauty coos, black lips pressing against yours. <i>“Body and spirit. Take me as you please.”</i>");

	output("\n\nA long tongue finds its way out to play with yours, wrapping around your [pc.tongue] and drawing you deeper into her embrace. She giggles girlishly, guiding one of your hands up to her full breast and the black, stiff teat atop it. Your [pc.legs] move to encircle her flared hips, pushing the alien beauty deeper onto her plush bed as you decide what to do with her. Still your kiss binds you together, linking your bodies even as her golden hand plays across your [pc.crotch], silently urging you to pin her down and fuck her hard.");

	output("\n\nHow do you take her?");

	processTime(3);

	clearMenu();
	addButton(0, "Get Oral", zilCallGirlGetOral, true, "Get Oral", "Have her put that exotic tongue to use!");
	if (pc.hasCock()) addButton(1, "Fuck Her", zilCallGirlFuckHer, true, "Fuck Her", "You’re hard as a rock, and her legs are already spread for you. The girl’s twat is practically rubbing against your cock already, so go ahead and slide on in!");
}

public function zheniyaApptBack():void
{
	clearOutput();
	showZilCallGirl();
	author("Savin");

	output("You spend a few moments in quiet conversation with the motherly zil-girl, holding her close while you catch up. But, eventually, your attentions drift to other matters, and Zheniya slips from your arms with a parting kiss.");

	output("\n\n<i>“Go on back to your adventures, love,”</i> she smiles. <i>“I’ll be here.”</i>");

	processTime(15+rand(5));
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function zheniyaApptGetHoney():void
{
	clearOutput();
	showZilCallGirl();
	author("Savin");

	output("You stroke a hand up from the buzzing beauty’s waist, along her chitinous corset and "+zilCallGirlBellyFragment()+", and let your fingers sink into the sinfully soft flesh of her meaty chest. She gasps quietly, letting the stiffening of the black nipple rubbing against your palm communicate her approval of the gesture.");

	//Has gotten honey in last 6 hours:
	if (flags["ZHENIYA_LAST_HONEY_TIMESTAMP"] != undefined && flags["ZHENIYA_LAST_HONEY_TIMESTAMP"] + (6 * 60) > GetGameTimestamp())
	{
		output("\n\n<i>“Mmm, that feels lovely, sugar,”</i> she adds, nuzzling into your neck. <i>“But you’ve milked me dry already. Why don’t we try something a little less draining, hmm?”</i>");

		output("\n\nZheniya gives you a little wink and takes your hand, moving it down onto her plump behind instead.");

		processTime(2);
		addDisabledButton(2, "Get Honey");
	}
	else
	{
		output("\n\n<i>“Feeling thirsty, love?”</i> Zheniya breathes, slipping her hands down and grabbing your [pc.butt] in both.");
		if (!pc.isNude()) output(" She slowly starts to peel your [pc.gear] off, teasing you with those smooth digits of hers all the while.");
		output(" <i>“I think we can see to that.”</i>");

		output("\n\nThe waspy beauty smiles, stepping back towards the bedroom. You follow close on her heels, letting her pull you backwards onto the bed. Her legs lock around your [pc.hips], and your hands both find their ways to her honey-swollen melons, squeezing hard enough to make little golden dollops bead around her black teats.");

		output("\n\nYou lean in and drink deep of her scent, rich and honey-like, made even sweeter by the delicious mix of sweat and arousal that clings to her smooth skin like a lurid perfume.");

		output("\n\n<i>“Ohh, just desperate for a taste of my honey, aren’t you?”</i> the alien beauty coos, black lips pressing against yours. <i>“Don’t fret, darling, I’ve got more than enough... drink your fill.”</i>");

		output("\n\nA long tongue finds its way out to play with yours, wrapping around your [pc.tongue] and drawing you deeper into her embrace. She giggles girlishly, guiding one of your hands up to her full breast and the black, stiff teat atop it. Your [pc.legs] move to encircle her flared hips, pushing the alien beauty deeper onto her plush bed.");

		processTime(5);

		output("\n\n");
		zilCallGirlSuckleHoney(false);
	}
}

public function processZheniyaEvents(deltaT:uint, doOut:Boolean, totalDays:int):void
{
	var pPerc:Number = zilCallGirlPregTime(true, deltaT);

	if (pPerc >= 100 && flags["ZIL_CALLGIRL_DISABLED_TYPE"] != 4)
	{
		flags["ZIL_CALLGIRL_DISABLED_TYPE"] = 4;
		flags["ZIL_CALLGIRL_DISABLED_TIMESTAMP"] = GetGameTimestamp() + deltaT;
	}
	else if (flags["ZIL_CALLGIRL_DISABLED_TYPE"] == 4)
	{
		if ((flags["ZIL_CALLGIRL_DISABLED_TIMESTAMP"] + 60) < (GetGameTimestamp() + deltaT) && flags["ZIL_CALLGIRL_BIRTH_MEETING_REQ"] == undefined)
		{
			// Need to know her pregnancy first!
			if (flags["ZIL_CALLGIRL_PREGNANT_TOLD"] != undefined) zilCallGirlPregnancyEnds(deltaT);
		}

		if ((flags["ZIL_CALLGIRL_DISABLED_TIMESTAMP"] + 360) < (GetGameTimestamp() + deltaT))
		{
			flags["ZIL_CALLGIRL_DISABLED_TYPE"] = undefined;
			flags["ZIL_CALLGIRL_DISABLED_TIMESTAMP"] = undefined;
		}
	}
}

private var _tempZilGirlChildRef:ZilCallgirlUniqueChild;

public function zilCallGirlBirthMessage():String
{
	var cs:String;

	if (_tempZilGirlChildRef == null || _tempZilGirlChildRef.Quantity <= 0) cs = "Our staff has taken her in and delivered the young. She and your offspring";
	else if (_tempZilGirlChildRef.NumMale == 1 && _tempZilGirlChildRef.NumFemale == 0) cs = "Our staff has taken her in and delivered a healthy son. She and your child";
	else if (_tempZilGirlChildRef.NumFemale == 1 && _tempZilGirlChildRef.NumMale == 0) cs = "Our staff has taken her in and delivered a healthy daughter. She and your child";
	else if (_tempZilGirlChildRef.NumFemale == 1 && _tempZilGirlChildRef.NumMale == 1) cs = "Our staff has taken her in and delivered a healthy son and daughter. She and your children";
	else cs = "Our staff has taken her in and delivered " + num2Text(_tempZilGirlChildRef.Quantity) + " healthy children. She and your offspring";

	var m:String = "Hello, " + pc.mf("Mr", "Miss") + ". Steele, I’m writing on behalf of Zheniya to inform you that your partner arrived at the Tavros Residential Clinic a few moments ago, having gone into labor. " + cs + " should be free to return home within the next few hours.\n\nCongratulations!\n\nNurse Carter\nTavros Residential Clinic, Deck 45\n<i>Healthier living for tomorrow.</i>";

	_tempZilGirlChildRef = null;

	return m;
}

public function zilCallGirlPregnancyEnds(deltaT:uint):void
{
	if(flags["ZIL_CALLGIRL_EGG_COUNT"] == undefined || flags["ZIL_CALLGIRL_EGG_COUNT"] <= 0) return;
	
	_tempZilGirlChildRef = new ZilCallgirlUniqueChild();
	_tempZilGirlChildRef.RaceType = GLOBAL.TYPE_BEE;
	_tempZilGirlChildRef.BornTimestamp = (flags["ZIL_CALLGIRL_PREG"] + flags["ZIL_CALLGIRL_GESTATION"]);
	_tempZilGirlChildRef.MaturationRate = 1.0;
	
	// Adopt father's colors at random (if applicable):
	if(rand(2) == 0) _tempZilGirlChildRef.skinTone = chars["PC_BABY"].skinTone;
	//if(rand(2) == 0) _tempZilGirlChildRef.lipColor = chars["PC_BABY"].lipColor;
	//if(rand(2) == 0) _tempZilGirlChildRef.nippleColor = chars["PC_BABY"].nippleColor;
	if(rand(2) == 0) _tempZilGirlChildRef.eyeColor = chars["PC_BABY"].eyeColor;
	if(rand(2) == 0) _tempZilGirlChildRef.hairColor = chars["PC_BABY"].hairColor;
	//if(rand(2) == 0) _tempZilGirlChildRef.furColor = chars["PC_BABY"].furColor;
	//if(rand(2) == 0) _tempZilGirlChildRef.scaleColor = chars["PC_BABY"].scaleColor;
	//if(rand(2) == 0) _tempZilGirlChildRef.chitinColor = chars["PC_BABY"].scaleColor;
	//if(rand(2) == 0) _tempZilGirlChildRef.featherColor = chars["PC_BABY"].furColor;

	for (var i:int = 0; i < flags["ZIL_CALLGIRL_EGG_COUNT"]; i++)
	{
		if (rand(2) == 0) _tempZilGirlChildRef.NumMale++;
		else _tempZilGirlChildRef.NumFemale++;
	}
	// Add child to nursery data (only if accepted into nursery)
	if(flags["ZIL_CALLGIRL_PREGNANCY_MONEY"] != undefined)
	{
		ChildManager.addChild(_tempZilGirlChildRef);
		StatTracking.track("pregnancy/total day care", flags["ZIL_CALLGIRL_EGG_COUNT"]);
		
		resendMail("zil_callgirl_birth", (flags["ZIL_CALLGIRL_PREG"] + flags["ZIL_CALLGIRL_GESTATION"]));
	}
	
	StatTracking.track("pregnancy/zil call girl kids", flags["ZIL_CALLGIRL_EGG_COUNT"]);
	StatTracking.track("pregnancy/total sired", flags["ZIL_CALLGIRL_EGG_COUNT"]);
	
	zilCallGirlPregnancyCleanup();
	if (flags["ZIL_CALLGIRL_HAS_BIRTHED"] == undefined) flags["ZIL_CALLGIRL_HAS_BIRTHED"] = 1;
	flags["ZIL_CALLGIRL_BIRTH_MEETING_REQ"] = 1;
	if (flags["ZIL_CALLGIRL_TOTAL_BIRTHS"] == undefined) flags["ZIL_CALLGIRL_TOTAL_BIRTHS"] = 1;
	else flags["ZIL_CALLGIRL_TOTAL_BIRTHS"]++;
	
	// Add timer for waiting
	pc.createStatusEffect("Zheniya Birth Recover");
	pc.setStatusMinutes("Zheniya Birth Recover", 1440);
}
public function zilCallGirlPregnancyCleanup():void
{
	flags["ZIL_CALLGIRL_EGG_COUNT"] = undefined;
	flags["ZIL_CALLGIRL_GESTATION"] = undefined;
	flags["ZIL_CALLGIRL_PREG"] = undefined;
}

public function zilCallgirlPregnantAgain():void
{
	clearOutput();
	showZilCallGirl();
	author("Savin");

	flags["ZIL_CALLGIRL_PREGNANT_TOLD"] = 2;

	output("<i>“Oh, [pc.name],”</i> you hear a sing-song voice call from inside before you’re halfway through the door. Zheniya is in your arms a moment later, hopping up into a hug that all but spins you around and into her waiting bed. You gasp, reeling as zil girl settles on her knees overtop you, both hands planted on her "+zilCallGirlBellyFragment()+".");

	output("\n\n<i>“");
	if (zilCallGirlPregTime(true) <= 33) output("I’ve just come back from the clinic, sweetie. It seems like no matter how carefully I prepare, your seed is simply too virile for my poor herbs and teas to contend with. I’m pregnant again!");
	else output("See what you’ve done, [pc.name]?”</i> she coos, running her dark fingers along the stretched-taut flesh of her belly. <i>“Nothing I do seems able to stop you, you awful... sexy... wonderful beast! We’re going to be parents once more, as you can see.");
	output("”</i>");

	output("\n\nYou blink in surprise, but soon find your hands playing across hers, and onto her "+zilCallGirlBellyFragment()+". She moans huskily, leaning down and planting kisses along your neck and jaw, finally working her way up to one long, tongue-filled, lip-sucking; she lets you pull her flush against yourself");
	if (zilCallGirlPregTime(true) >= 50) output(" - or at least as much as her gravid belly will allow - ");
	else output(",");
	output(" and guides your hands around to her bare, wiggling behind. You give it a smack, and see coos into your [pc.ear], chest heaving against yours. It’s an easy thing to roll her over onto her back, letting those chitinous legs of hers curl around your [pc.hips], her bare sex rubbing invitingly against your");
	if (!pc.hasCock()) output(" crotch.");
	else output(" stiffening cock.");

	if (flags["ZIL_CALLGIRL_PREGNANCY_MONEY"] != 2)
	{
		output("\n\n<i>“How about a night on me to celebrate, [pc.name]?”</i> Zheniya offers,");
	}
	else
	{
		output("\n\n<i>“Come on, lover. Let’s celebrate...”</i> the waspy beauty whispers,");
	}
	output(" pulling at your [pc.gear].");

	if (currentLocation == "RESIDENTIAL DECK ZHENIYA")
	{
		clearMenu();
		addButton(0, "Sex", zheniyaApptSex, undefined, "Sex", "Fuck your zil lover.");
		addButton(2, "Get Honey", zheniyaApptGetHoney, undefined, "Get Honey", "Ask Zheniya for a little of her sweet, sweet honey to go.");
		addButton(14, "Back", zheniyaApptBack);
	}
	else
	{
		zilCallgirlSexMenu(true);
	}
}

