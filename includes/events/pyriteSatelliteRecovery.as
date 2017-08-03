//Pyrite Satellite Recovery
//A Level 2ish Quest for Mhen’ga
//By Savin

//Quest Get
//Add to the first square of Mhen’ga jungle, after the PC is at least Level 2
public function pyriteSatelliteLocationUnlocked():Boolean
{
	return (pc.level >= 2);
}
public function pyriteSatelliteIntroActive():Boolean
{
	return (pyriteSatelliteLocationUnlocked() && flags["SATELLITE_QUEST"] == undefined);
}
public function satelliteIntroShit(button:int = 0):void
{
	if(pyriteSatelliteIntroActive())
	{
		output("\n\nStanding at the very end of the path into the jungle is a man wearing a skin-tight corporate jumpsuit, colored a dark, almost mahogany red and trimmed with dark blue. A pair of feline ears poke out from a messy fop of moss green hair, and a brace of fuzzy tails swish behind him. One of his arms is in a sling, and the other is fumbling with a bulky Codex much like your own. He’s muttering and cursing under his breath, pacing in circles.");
		//[Kaithrit]
		addButton(button,"Kaithrit",kaithritSatelliteShit,undefined,"Kaithrit","The feline man seems to be rather distressed about something...");
	}
}

public function pcHasDrive():Boolean
{
	return (pc.hasKeyItem("Satellite Hard Drive"));
}

public function showGryvainShit(nude:Boolean = false):void
{
	var nudeS:String = "";
	if(nude) nudeS = "_NUDE";
	showBust("GRYVAIN_AGENT" + nudeS);
	showName("GRYVAIN\nAGENT");
}
public function showKaithritBoyslut():void
{
	showName("KAITHRIT\nBUSINESSGUY");
	showBust("KAITHRIT_SATELLITE_GUY");
}

public function kaithritSatelliteShit():void
{
	clearOutput();
	showKaithritBoyslut();
	author("Savin");
	if(pc.isNice()) output("<i>“You okay there, sir?”</i>");
	else if(pc.isMischievous()) output("<i>“What’s got your tails, buddy?”</i>");
	else output("<i>“Something wrong?”</i>");
	output(" you ask, approaching the kaithrit man.");
	output("\n\nHe looks up with a start, blinking a pair of mismatched eyes, green and gold, at you. <i>“Huh? Sorry, I’m a bit distracted as you can see.”</i> He indicates the datapad in his hand, which is displaying what looks like a topographical map of the area. The man looks you up and down, seeming to settle his eyes on your [pc.weapon]. <i>“Say, you don’t happen to be headed into the jungle, do you friend?”</i>");
	output("\n\n<i>“That’s why I’m headed this way,”</i> you answer.");
	output("\n\n<i>“Good. Great, even!”</i> he says with a sudden smile. <i>“Interested in earning a few credits for a side trip? Wouldn’t be far out of your way if you’re exploring the south side of the jungle.”</i>");
	output("\n\nYou nod, urging him to tell you his offer.");
	output("\n\n<i>“Right, of course. I’m a representative of Pyrite Industries, the company that’s sponsoring this fine settlement. One of our survey satellites encountered a software error and plummeted into the jungle recently. We’d like to recover it, but the natives are making it a bit difficult.”</i>");
	output("\n\nHe shrugs the shoulder that’s supporting the sling his arm’s in. <i>“I went looking for it earlier, but one of those felinid-snake creatures caught me by surprise. Gave the brute a taste of my stun baton, but his tail slammed me into a tree for my effort. It’ll be a few weeks before I can make the attempt again, and by then who knows what will have happened to the satellite.”</i>");
	output("\n\n<i>“So you want me to find it?”</i>");
	output("\n\n<i>“Yes. Well, in part anyway,”</i> the kaithrit says. <i>“The satellite itself isn’t terribly important, but my employers would very much like the hard drive contained inside it. There’s a reinforced hatch on the side of the fuselage: pop that open, bring back the hard drive from inside, and I’ve got a nice reward for your effort.”</i>");
	processTime(6);
	clearMenu();
	//[Accept] [No Thanks]
	//if PC already has the hard drive: [Give Drive]
	addButton(1,"No Thanks",noThanksBub);
	addButton(0,"Accept",acceptThatSatelliteShit);
	if(pcHasDrive()) addButton(2,"Give Drive",pubbieDriveShit,undefined,"Give Drive","Hand over the drive you found out in the jungle. Seems like it’s what he’s looking for.");
}

//No Thanks
public function noThanksBub():void
{
	clearOutput();
	showKaithritBoyslut();
	author("Savin");
	output("<i>“No? Damn,”</i> he says, shoulders slumping. <i>“Well, if you happen across the satellite while you’re exploring and change your mind, I’ll be just outside the space port.”</i>");
	output("\n\nThe kaithrit salaryman sighs and turns back towards the town, trudging away.");
	flags["SATELLITE_QUEST"] = -1;
	processTime(3);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function acceptThatSatelliteShit():void
{
	clearOutput();
	showKaithritBoyslut();
	author("Savin");
	output("You nod, saying that shouldn’t be a problem.");
	output("\n\n<i>“Excellent!”</i> the salaryman says with a smile. <i>“When you find it, bring it back to me at your earliest convenience. You can find me just outside the space port. Oh! While I don’t have an exact location, I have reason to believe the satellite crashed more-or-less due east of here. Maybe near the border of the deeper jungle section southwards?”</i>");
	output("\n\nSeemingly satisfied, the man gives you a friendly nod and walks back towards town.");
	flags["SATELLITE_QUEST"] = 1;
	processTime(3);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Give Drive
//Hand over the drive you found out in the jungle. Seems like it’s what he’s looking for.
public function pubbieDriveShit():void
{
	clearOutput();
	showKaithritBoyslut();
	author("Savin");
	output("<i>“Actually, I already found it,”</i> you say, reaching into your pack and pulling the hard drive out.");
	output("\n\nThe man’s mis-matched eyes light up, and he takes it from you with a toothy smile. <i>“Ah, yes, this is it exactly! What luck!”</i>");
	output("\n\nHe takes his datapad and, with some difficulty given the state of his arm, he runs a cable into a port on the side of the drive and does a quick scan. <i>“Ah, yes, everything’s in order... and damn! Just as I thought, there’s evidence of a breach in our security protocols. I’ve had a feeling that satellite didn’t crash on its own!”</i>");
	output("\n\nThe man’s smile fades, replaced by a worried grimace. <i>“Well, thank you for this, friend. You’ve done Pyrite - and Port Esbeth - a service. I’ll make sure our I.T. department gets this straight away so we can plug up the leaks. But first...”</i>");
	output("\n\nHe reaches into one of the small pockets on his jumpsuit and produces a credit chit. <i>“Here’s for your trouble.”</i>");
	output("\n\nYou take it, swiping it into your Codex as the Pyrite man tucks the drive under his broken arm and starts trotting back into town. A notification pops up on your screen, showing a tidy 2,500 credits have been added to your account. Not bad for an accidental delivery.");
	pc.credits += 2500;
	flags["SATELLITE_QUEST"] = 2;
	pc.removeKeyItem("Satellite Hard Drive");

	//If the PC accepts or says No Thanks to the quest, move the pyrite dude to the square outside of the Space Port (so the PC has to see him on the way back to the ship).
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function repeatRepresentativeSatelliteShit(button:Number = 0):void
{
	if(flags["SATELLITE_QUEST"] == 1 || flags["SATELLITE_QUEST"] == -1)
	{
		output("\n\nThe Pyrite representative is pacing around outside the entrance to the Esbeth port, talking quietly into a commlink pressed into his shoulder. He’s having a hard time managing all his tech with an arm in a sling, and he seems to be quite manic about his lost toys.");
		//PC can’t talk to him again until they’ve gotten the Hard Drive.
		if(pcHasDrive()) addButton(button,"Pyrite Rep",turnInTheKaithritDiskuDrivo,undefined,"Pyrite Rep","Turn in the hard drive you recovered from the fallen satellite.");
		else addDisabledButton(button,"Pyrite Rep","Pyrite Rep","You should find his missing satellite before talking to him again.");
	}
}

//Finishing the Quest
//After having talked to the kaithrit company man and acquiring the hard drive key item, the PC can talk to him again outside the space port.
//[Kaithrit]
//Turn in the hard drive you recovered from the fallen satellite.
public function turnInTheKaithritDiskuDrivo():void
{
	clearOutput();
	showKaithritBoyslut();
	author("Savin");
	output("You approach the kaithrit company man, hard drive in hand. He looks up as you approach, and his concerned scowl evaporates in an instant, replaced by an ear-to-ear grin.");
	output("\n\n<i>“Nevermind. I’ll call you back,”</i> he says into his commpad, tucking it into his arm’s sling. <i>“As for you! I see you’ve had success out there. Thank the One for that. My superiors were breathing down my neck something fierce. May I examine it?”</i>");
	output("\n\nYou hand the device over, and the man (with some awkwardness due to his arm) runs a cable from his datapad to the drive. After a moment of squinting at the screen and muttering to himself, the cat-man gives a satisfied nod and detaches the cable. <i>“Ah, yes, everything’s in order... and just as I thought, there’s evidence of a breach in our security protocols. I’ve had a feeling that satellite didn’t crash on its own!”</i>");
	output("\n\nYou nod, telling him about the gryvain woman out in the jungle. She seemed to be responsible.");
	output("\n\nThe man’s smile fades, replaced by a worried grimace. <i>“Well, thank you for this, friend. You’ve done Pyrite - and Port Esbeth - a service. I’ll make sure our I.T. department gets this straight away so we can plug up the leaks. But first...”</i>");
	output("\n\nHe reaches into one of the small pockets on his jumpsuit and produces a credit chit. <i>“Here’s for your trouble.”</i>");
	output("\n\nYou take it, swiping it into your Codex as the Pyrite man tucks the drive under his broken arm and starts trotting back into town. A notification pops up on your screen, showing a tidy 2,500 credits have been added to your account. A decent sum for your trouble!");
	pc.credits += 2500;
	flags["SATELLITE_QUEST"] = 2;
	pc.removeKeyItem("Satellite Hard Drive");
	processTime(3);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Quest Business
//Add a new square to the Mhen’ga jungle, two spaces east of the north-easternmost Elder Pitcher’s square. The PC can access this square regardless of level or if they’ve gotten the quest or not.
//Add to the square 1W of the new one (between it and the Pitcher):
//<i>“There’s a small streak of burned trees, all pushed aside as if by some massive impact, leading eastward. There’s a pillar of black smoke rising from that direction, too...”</i>

//The new square has the following description:
//There’s a great big crater plunged into the forest floor here, surrounded by the shattered husks of Mhen’gan trees that have been blasted back by the impact. Smoke rises lazily from the inside of the crater, emanating from a sphere of metal surrounded by cracked mirrored wings. A satellite!
//[Investigate]

//There are three new items found in this quest, all gained from the new square:

/* Fen note: ech.... though it is an accessory. Maybe.
output("\n\nShield Amp");
output("\n\n//A high-tech amplifier of gryvain make that can be plugged into any shield generator. While equipped, you can spend 20 Energy to restore Shields equal to your Intelligence score.");
output("\n\n//Adds the “Shield Amp” special power.");

output("\n\nPyrite Hard Drive (Key Item)");
*/

public function satelliteBonus():Boolean
{
	if (flags["SATELLITE_GRYVAIN_DEFEAT"] == undefined) addButton(0, "Satellite", investigateSatelliteShit);
	return false;
}


//Investigate the Satellite Wreckage
public function investigateSatelliteShit():void
{
	clearOutput();
	showGryvainShit();
	author("Savin");
	output("You ");
	if(pc.isNaga()) output("slither");
	else output("scrabble");
	output(" down the jagged dirt edge of the crater, sliding a few feet down to where the satellite has come to rest. You can see a big, red logo printed across the scorched steel casing: <i>Pyrite Heavy Industries, LLC</i>. As you approach, your reflection appears across the shattered surface of its solar panels, a million tiny [pc.name]s looking back at you.");
	if(pc.isMischievous() || pc.isBimbo()) output(" Hey, good lookin’!");

	output("\n\nBefore you can take a good look around, however, you catch sight of another figure looming up behind you in the mirror, giving you just enough warning to spin around and draw your [pc.weapon].");
	output("\n\nBehind you, back at the top of the crater, is a woman with a pair of dark, curling horns on her brow and a quartet of leathery wings at her back. She’s wearing a black leather jacket over a vest of slick, sleek silver armor... and she’s just brought a laser pistol out from the holster at her hip, holding it trained on your chest.");
	if(!CodexManager.entryUnlocked("Gryvain")) output(" Your Codex beeps out that it’s found a gryvain, a core-ward race of winged reptilian humanoids. Little late for that, thanks.");
	CodexManager.unlockEntry("Gryvain");

	output("\n\n<i>“What have we got here?”</i> she calls down, flicking a forked tongue out over sharp teeth. <i>“You don’t look like a Pyrite peon. Another wayward Rusher, is it?”</i>");
	output("\n\nSomething like that. <i>“What’s with the gun?”</i>");
	output("\n\nShe smirks, and a cobalt-blue, scaly tail curls around one of her legs. <i>“Nothing personal, sweet thing, but I’ve been tracking this bit of space junk too long to let some snot-nosed kid ruin it. I’ve got a lot of time and credits riding on what’s inside that thing’s drive.”</i>");

	//if took quest & Kind:
	if(pc.isNice() && flags["SATELLITE_QUEST"] == 1)
	{
		output("\n\n<i>“Wait, that Pyrite guy sent me here, too,”</i> you call up.");
		output("\n\nThe dragon-like woman laughs, shaking her head. <i>“Sorry, kid, I’m not working for them. Now step away, eh?”</i>");
	}
	else if(flags["SATELLITE_QUEST"] == 1)
	{
		output("\n\n<i>“Sorry, finder’s keepers,”</i> you call up, tightening your grip on your [pc.weapon].");
		output("\n\n<i>“I’m sorry you feel that way,”</i> the dragon-woman growls, thumbing the charger on her pistol. <i>“Guess we’ll have to do this the old fashioned way...”</i>");
	}
	else 
	{
		output("\n\n<i>“Woah, wait, I’ve got nothing to do with this,”</i> you call up, putting your free hand up in a sign on peace.");
		output("\n\n<i>“That right? Good, like I said, didn’t take you for a Pyrite goon. Step away from the satellite, let me take the goods, and you and me... we’re good.”</i>");
	}
	clearMenu();
	//[Fight] {if Kind or No Quest: [Leave]}
	addButton(0,"Fight",fightDataMiniBaws);
	if(pc.isNice() || flags["SATELLITE_QUEST"] == 1)
	{
		addButton(14,"Leave",letTheGryvainTakeTheShit,undefined,"Leave","Let her take the goods. You’re not here for a fight.");
	}
}
//Leave
//Let her take the goods. You’re not here for a fight.
public function letTheGryvainTakeTheShit():void
{
	clearOutput();
	showName("FUCK\nTHIS");
	author("Savin");
	output("You take a step back from the downed satellite, putting your [pc.weapon] away. The dragon-woman smirks and slides down the side of the impact crater, keeping her gun trained on you. She uses her tail to rip off a side panel on the casing, revealing a sealed compartment that comes open with a little jiggling, letting her pull out a rather large black box with her free hand.");
	output("\n\n<i>“Made a good choice, kid. Now scram,”</i> she says, a smug smile spreading across her dark lips. <i>“Go on, get lost.”</i>");
	output("\n\nYou take her advice and beat feet out of the crater.");
	processTime(5);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Fight
//No way you’re letting this smug dragoness get the better of you.
//Level 2 miniboss. Low Health, light armor, high Shields
public function fightDataMiniBaws():void
{
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(new GryvainAgent());
	CombatManager.victoryScene(pcBeatsUpAGryvainCauseTheyreAShit);
	CombatManager.lossScene(lostFightToGryvainAgentDotDotDotShit);
	CombatManager.displayLocation("GRYVAIN AGENT");
	
	CombatManager.beginCombat();
}

//PC loses Fight
public function lostFightToGryvainAgentDotDotDotShit():void
{
	showGryvainShit();
	author("Savin");
	output("You stumble back against the edge of the crater, gasping for breath. The gryvain woman stalks forward, effortlessly batting your [pc.weapon] out of your hand with a swipe of her tail. Her clawed hand digs into the loamy dirt next to your head, and her chest presses in against your own, pinning you against the crater’s side.");
	output("\n\n<i>“That was fun. You’re kind of cute, in a pathetic sorta way,”</i> she says with a smirk. When you open your mouth to protest, though, she pushes her entire weight against you, making you eat your words with a gasp - before she thrusts her tongue into your mouth, silencing you with a rough kiss.");
	output("\n\nYou’re too stunned to resist before she can break it, taking a step back from you and letting her eyes run all over your body. <i>“Yeah, alright,”</i> she murmurs, tracing her hand down from the wall to your shoulder. Her other hand hooks into your ");
	if(!pc.isCrotchExposed() && !pc.isAssExposed()) output("[pc.armor]");
	else output("gear");
	output(", starting to pull it off. <i>“Not much of a fighter, but let’s get you down on ");
	if(!pc.isNaga()) output("your knees");
	else output("your snake-ass");
	output(" and see if you can handle a dick.”</i>");

	output("\n\nShe gives you a push, and without much fight left in you, you slump down on your [pc.knees] as she demanded, putting you more or less eye-level with her crotch. Now that you’re here, and not locked in battle, you can see a very distinct bulge between her legs, straining the front of her pants.The agent plants a hand on your head, keeping you right where she wants you, while the other hooks through her gunbelt, leveraging her breeches into dropping. As promised, a thick, tapered shaft of cyan cockflesh throbs into view with them gone, half-erect so close to your [pc.face] that, with a little tensing from its owner, its slender crown rises up to rest against your [pc.lips].");

	output("\n\n<i>“Go on then,”</i> she purrs, brushing her claws against your scalp. <i>“I’m waiting...”</i>");

	output("\n\nThere’s not much choice left to you. You slowly open your mouth and allow the victorious dragon-woman to guide you onto her cock, slowly spearing your [pc.lipsChaste] on veiny lizard-meat. She’s as thick around the base as an ausar’s knot, making you stretch your jaw wide to accommodate it. The tapered tip beats against the back of your mouth before sliding downwards, pumping your throat with slow, even movements of her hips.");
	output("\n\nBefore you’re allowed to get complacent, or even just used to the oral violation, the gryvain pounds her hips forward, pushing your head back against the dirt wall and starting to hammer at your mouth, fucking you like a raging beast. You’re able to do nothing but moan and take it, letting the dragon-woman dominate your mouth. It isn’t long before you hear husky grunts from overhead, and something salty starts smearing across your [pc.tongue]; first a trickle, then a tidal wave that shoots down your throat in thick, creamy spurts. The gryvain growls and claws at your [pc.hair], holding your head steady while she drives her dick as deep down your throat, making it bulge around the girth of throbbing dragonmeat being force-fed to you.");
	output("\n\n<i>“Fuck!”</i> the gryvain woman sighs, taking a step back. Her dick drags out of your mouth, coming free with a wet popping sound and leaking a smear of pearly spunk across your lips and chin. <i>“Well, guess your mouth is good for something, at least. Shame you’re wasted on the adventuring thing. Probably do better working at the next cathouse you bumble into than trying to jack a girl’s payday with a gun. Better luck next time, kid.”</i>");
	output("\n\nShe gives you a sultry wink and saunters off, swaying her hips and stuffing the hard drive into her jacket.");
	output("\n\nIt takes several minutes for you to catch your breath - and stop coughing up her cum - before you’re able to gather up your discarded belongings and stagger up out of the crater.\n\n");
	CombatManager.genericLoss();
}

//PC Victorious!
public function pcBeatsUpAGryvainCauseTheyreAShit():void
{
	showGryvainShit();
	author("Savin");
	output("With a ");
	if(enemy.HP() <= 1) output("cry of pain");
	else output("shameless moan, groping her tits through her armor");
	output(", the dragon-woman crumples to her knees and drops her weapon. <i>“Fuck!”</i> she gasps, digging her fingers into the dirt. <i>“I didn’t sign up for this shit.");
	if(enemy.HP() <= 1) output(" Don’t hurt me!”</i>");
	else output(" Don’t just stand there. You worked so hard to make me ready to cream myself, so take me already!”</i> Between her legs, you can see a hefty bulge straining the seam of her pants.");

	output("\n\nYou saunter up and pick up her gun, stuffing it into your pack, before looking down at the defeated gryvain and decided what to do with her...");
	clearMenu();
	if(pc.lust() >= 33)
	{
		if(pc.cockThatFits(enemy.analCapacity()) >= 0 || pc.hasHardLightEquipped()) addButton(0,"Fuck Her",fuckDatGryvainShit,undefined,"Fuck Her","You see a bulge in her pants. Take this naughty dragon for a ride...");
		else addDisabledButton(0,"Fuck Her","Fuck Her","You need a penis that will fit inside her or a hardlight strap-on in order to this.");
		addButton(1,"Ride Cock",rideDatCockAndShit,undefined,"Ride Cock","You see a bulge in her pants. Take this naughty dragon for a ride...");
	}
	else
	{
		addDisabledButton(0,"Fuck Her","Fuck Her","You aren’t aroused enough for this.");
		addDisabledButton(1,"Ride Cock","Ride Cock","You aren’t aroused enough for this.");
	}
	flags["SATELLITE_GRYVAIN_DEFEAT"] = 1;
	//[Fuck Her] [Ride Cock] [Leave]
	//PC gets her Heavy Laser Pistol and Shield Amp.
	addButton(14,"Leave",getOutOfHereSkank);
}

//[Leave]
//Kick the gryvain out and loot the satellite.
public function getOutOfHereSkank():void
{
	clearOutput();
	showGryvainShit();
	author("Savin");
	output("<i>“Get out of here,”</i> you command, pointing to the top of the crater. <i>“Go on!”</i>");
	output("\n\nThe gryvain whimpers and complies, scrambling up the edge and out of sight. You listen until her footfalls are long gone, deep into the jungle, before turning your attention back to the satellite. You find your way to a sealed compartment on its side, hidden under a panel");
	if(flags["SATELLITE_QUEST"] == 1) output(" right where the kaithrit man told you to look");
	output(". You ");
	if(pc.characterClass == GLOBAL.CLASS_MERCENARY) output("dig your fingers into the metal and, with a grunt of effort, rip the already-damaged seal off");
	else output("pull out your tools and get to work, slicing through the simple security system keeping it sealed");
	output(". Inside is a single removable piece: a hard drive about the size of your Codex with the Pyrite Industries logo printed on it.");

	output("\n\nYou take the black box and stuff it in your pack. ");
	if(flags["SATELLITE_QUEST"] == 1) output("Time to take it back to the Pyrite suit in town.");
	else output("Maybe somebody’ll pay out for it?");
	pc.createKeyItem("Satellite Hard Drive");
	output("\n\n(<b>Gained Key Item: Satellite Hard Drive</b>.)");
	output("\n\n");
	CombatManager.genericVictory();
}

//[Ride Cock]
//You see a bulge in her pants. Take this naughty dragon for a ride...
public function rideDatCockAndShit():void
{
	clearOutput();
	showGryvainShit(true);
	author("Savin");
	output("With the defenseless dragon-girl now at your mercy, you decide to have some fun with her. You take a step forward that closes the distance, pushing her onto her back and spreading her legs. Her four wings splay out on the ground behind her, little talons clawing into the dirt, but the moment you have her on her ass, you see the straining bulge in her pants throb greedily, begging for release. You lean down and hook your hands through her belt, yanking her pants down and off with one rough pull. The gryvain woman gasps, and sure enough you’re treated to the sight of a dark blue dick peeking out from a pair of black panties, surrounded by the scales of her lower body.");
	output("\n\nThe half-turgid member bobs up, wiggling in the warm jungle air when you tear her panties away, exposing the thick base of her tapered shaft and the parted slit of a pussy below it. You lick your lips and twirl a finger, telling the would-be gunslinger to pull her armor off and show you those big ol’ tits of hers.");
	output("\n\n<i>“" + pc.mf("Bastard","Bitch") + ",”</i> she grumbles, but she complies, pulling the armored vest up over her head and revealing a lacy bra that matches her torn underwear. Before you can tear it off too, the gryvain sits up and grudgingly takes it off, bearing a pair of quite large breasts - E-cups, you’d guess - each capped with a nipple as blue as the scales on her extremities, surrounded by cream-pale skin. You lower yourself down over her, running your hands over her tits, groping the big mounds of boobflesh until she’s squirming, soft moans replacing her distasteful grunts. Her cock stiffens, pressing against your thigh.");
	output("\n\nHer dick begs for attention with its throbbing heat, drooling a slime of pre across your [pc.skinFurScales] until you finally deign to let one of its owner’s tits go, wrapping your fingers around her girthy dragoncock. You squeeze just enough to make her gasp, arching her back off the dirt and making those big boobs quake for you. That’s the stuff! You lean down, running your [pc.tongue] around one of her cobalt nipples, nibbling around the pebbling ring until you feel clawed fingers digging into your back, and her cock’s slender tip swells in your hand, leaking across your fingers.");
	var x:int = -1;
	if(pc.hasVagina()) x = rand(pc.totalVaginas());
	output("\n\n<i>“You really want it, don’t you?”</i> you tease, pumping your wrist up and down her length. The gryvain snarls and turns away, her cheeks flushing crimson under your lustful gaze. Guess you’re not getting a rise out of her - well, that part of her anyway. You’ve definitely got her attention where it really matters: even when you take your hand away, her dick stands straight upright, bobbing with the beat of her heart while you rise up on your [pc.knees], pulling your gear off and giving the dragon-slut a good look at your [pc.vagOrAss " + x + "].");

	output("\n\nYou slowly sink down onto her cock, pausing as the tip presses ");
	if(x >= 0) output("between your lips");
	else output("against your [pc.asshole]");
	output(" and savoring the slowly, spearing sensation of her entering you inch by inch by inch. You bite your lip to suppress a moan, settling your [pc.butt] on the gryvain’s crotch and taking all that sweet, turgid dick inside you. Her cock throbs to the beat of her heart, swelling just enough for you to feel it grinding against your tender muscles.");
	if(x >= 0) pc.cuntChange(x,enemy.cockVolume(0));
	else pc.buttChange(enemy.cockVolume(0));
	if(pc.hasCock()) output(" Your own dick juts upright, squirting a little puddle of [pc.cumNoun] onto the dragon-girl’s belly.");
	else if(pc.tailCount > 0 && pc.hasTailFlag(GLOBAL.FLAG_LONG)) output(" As you settle in, your [pc.tail] slithers down your defeated partner’s leg, finding her own blue-scaled appendage thrashing beneath her. Your [pc.tail] scoots under her own, wrapping around her tail and squeezing it tight.");
	output("\n\n<i>“Dammit. Losing’s not supposed to feel this good,”</i> the dragon-babe moans, clawing plaintively at your [pc.hips]. <i>“Move already, damn you!”</i>");
	output("\n\nYou’ll move on your own time. Giving her a wink from your position latched onto her tits, you start to flex your ");
	if(x >= 0) output("vaginal");
	else output("anal");
	output(" muscles, squeezing them around her dick from the bulbous, knot-like base all the way to the pencil-thin crown. The gryvain gasps and arches her back off the dirt, thrusting her tits into your mouth and hands for you to play with. Good girl.");
	output("\n\nGood enough to justify you moving your hips a little, even. Keeping your front-end firmly planted on the scaly slut, you drag your hips up her pillar of cockmeat, halfway up or so before you drop back down onto her lap. This time, you join her in moaning your pleasure: the sudden thrust of all that dick into you makes you cry out into the dragon’s heaving tits. Once you get a taste of that pleasure, there’s no stopping you: you start riding the dragon-girl hard, bouncing on her dick until the sounds of [pc.skinFurScales] slamming into scales echoes throughout the steamy jungle.");
	output("\n\nFinally, the gryvain throws her head back and cries out, a wordless, guttural roar of climax that heralds the inevitable rush of hot jizz into your [pc.vagOrAss]. And there’s a <i>lot</i> of it, too, pumping into you like it’s a backed-up kui-tan’s under you. A seething heat suffuses through your belly, settling in as her cock slowly comes down from its desperate spasms. When it’s almost done, you haul yourself up off her wilting rod, unleashing a flood of steaming dragon-spunk that splashes down all over her belly and thighs from your gaping hole... before you turn yourself around scoot back, planting your [pc.butt] right on the woman’s face. Cum smears over her face before you align your [pc.vagOrAss] with her mouth and give a sharp command to get you off, too.");
	if(x >= 0) pc.loadInCunt(enemy,x);
	else pc.loadInAss(enemy);
	output("\n\nYou drive the point home by grabbing her nipples, tugging on the big blue saucers until their owner cries out, eating a mouthful of the spunk still drooling out of you. There’s nothing left of her pride after that and, with a whimper, she starts doing what you wanted. You feel her lizard-like tongue slither in ");
	if(x >= 0) output("between your parted pussylips");
	else output("through the still-gaping ring of your ass, fresh from being filled with her cum");
	output(". Now that she’s got a little control of what happens, at least, the dragon-babe manages to start doing some work for you. Her tongue slurps around your cum-slick walls, searching out every pleasure-point she can find and lavishing it with the forked tip of her tongue until you’re moaning, desperate for more.");

	output("\n\n");
	if(pc.biggestCockLength() >= 6) output("Panting with desire, you grab your [pc.cock] and thrust it into the narrow gap between her breasts, pushing them closed around it. ");
	output("A little more boob-groping and softly-worded instructions has the gryvani girl finding the perfect spots to bring you to climax, too. You buck your hips, grinding against her face and driving her tongue that much deeper, riding it like a miniature cock through your [pc.vagOrAss " + x + "]’s orgasm");
	if(pc.hasCock()) output(" while your own dick erupts all over her tits and belly, coating her in a second shower of cream");
	output(".");

	output("\n\n<i>“Ugh!”</i> the gryvain gasps when you stand, licking the cum off her lips. <i>“Gross.”</i>");
	output("\n\nYou give her a look, still leaking her seed as you go to gather your discarded belongings - and the choicest pieces of hers. You tell her to get going, to run back the way she came unless she wants to be covered in a few more rounds’ worth of spunk. She groans and scrambles to her feet, giving you a final huff before she clambers up the side of the crater and disappears.");
	output("\n\nYou listen until her footfalls are long gone, deep into the jungle, before turning your attention back to the satellite. You find your way to a sealed compartment on its side, hidden under a panel");
	if(flags["SATELLITE_QUEST"] == 1 ) output(" right where the kaithrit man told you to look");
	output(". You ");
	if(pc.characterClass == GLOBAL.CLASS_MERCENARY) output("dig your fingers into the metal and, with a grunt of effort, rip the already-damaged seal off");
	else output("pull out your tools and get to work, slicing through the simple security system keeping it sealed");
	output(". Inside is a single removable piece: a hard drive about the size of your Codex with the Pyrite Industries logo printed on it.");

	output("\n\nYou take the black box and stuff it in your pack.");
	if(flags["SATELLITE_QUEST"] == 1) output(" Time to take it back to the Pyrite suit in town.");
	else output(" Maybe somebody’ll pay out for it?");
	
	pc.createKeyItem("Satellite Hard Drive");
	output("\n\n(<b>Gained Key Item: Satellite Hard Drive</b>.)");
	output("\n\n");

	processTime(30);
	clearMenu();
	CombatManager.genericVictory();
}

//[Fuck Her]
//This dragon-babe tried to fuck you out of your treasure. Give her a little something to remember you by...
//Requires cock or hardlight.
public function fuckDatGryvainShit():void
{
	clearOutput();
	showGryvainShit(true);
	author("Savin");
	var x:int = pc.cockThatFits(enemy.analCapacity());
	if((x < 0 || !pc.hasCock()) && pc.hasHardLightEquipped()) x = -1;
	else x = pc.smallestCockIndex();
	output("She’s already on her knees with all the fight knocked out of her. You smirk and close the distance, shucking off your gear as you go. She gives you a sneering look... right until you ");
	if(x >= 0) output("plop the crown of your [pc.cock " + x + "] on her lips");
	else output("activate your hardlight strapon, dropping the tip of the beam right on her lips");
	output(". Your demand is implicit and undeniable");
	if(enemy.lust() >= enemy.lustMax()) output(", especially with her own passions enflamed so deeply");
	output(".");

	output("\n\n<i>“F-fine,”</i> the dragon-girl shudders, opening her mouth wide enough for your [pc.cockOrStrapon " + x + "] to thrust right on in. Her throat bulges around the sudden invasion of cock, gripping your girth tightly as you ram it in. Once you’re sheathed between her plush blue lips, however, you feel only the instinctual contractions of her muscles around you, and the soft flicks of her forked tongue against your underside. She’s either too stubborn or too inexperienced to know to move - so you’ll just have to take charge.");
	output("\n\nYou grab the dragoness by the horns, using them as handlebars to drive her face down the rest of your length, sheathing yourself in her mouth before pulling her back up for breath. She gags and coughs, struggling for breath as you quickly hammer her down on your [pc.cockOrStrapon " + x + "] again, and again, and again. A minute or two of that treatment and her face is a mess of tears and spittle, bridged to the base of your dick");
	if(x >= 0 && pc.hasKnot(x)) output(" and your slowly-swelling bitch-breaker");
	output(" by shimmering lines of saliva.");

	output("\n\nThat’s more like it! You let your thrusting [pc.hips] overbear the dragon-slut, shoving her down on her back so that her wings splay out in the dirt and her scaly legs spread beneath you. Your dick only leaves her mouth long enough for you to rip her armor off, exposing the big mounds of her E-cup tits, barely held back by a lacy black bra. The gryvain voluntarily takes that off this time, pushing her tits together with her shoulders for you to slide down and thrust into. Good girl - she knows what you want!");

	output("\n\nHer nipples are coral-blue, jutting up from her pale, heaving tits such that you can’t help but grab onto them, pinching her nipples and pulling them towards one another, making sure her cleavage wraps around your [pc.cockOrStrapon " + x + "] nice and tight. All the spittle her blowjob left you covered in is more than enough lube to let your glide across her flawless flesh.");
	if(pc.hasCuntTail()) 
	{
		output("\n\nYour feel your parasitic tail slithering behind you, drawn towards something. You cast a glance over your shoulder, and see a damn impressive bulge forming in the gryvain’s pants. Guess your tail’s hungry! You reach back and yank her pants down, just enough for her cock to spill out, and your tail goes to work without a second thought. A rush of spearing pleasure runs through you as the slit in your tail swallows up the gryvain’s tapered cock-head and slurps it up right to the knot-like bulge at the base.");
		output("\n\nThe dragon-girl gasps, arching her back as she’s subjected to a surprise tail-fuck. Your [pc.tail] certainly knows its business: it only feels like a minute’s passed in blissful pleasure for both your cock and tail-vag before you feel the dragon-girl’s cock throb, swelling for a moment before you feel a jet of cum spurting into your tail’s hungry maw. Gods, it’s good to be filled! Shivers of pleasure rock through you, followed by a contentment like that which follows a great feast. That’s the stuff...");
		output("\n\nYou shake yourself out of the cum-sdrunk reverie before your body can bring itself to climax on auto-pilot. No way you’re gonna cum without tasting what she’s got inside. ");
		if(pc.race() != "gryvain" && pc.race() != "half-gryvain") output("You’ve heard all sorts of wonderful things about a gryvain’s pussy, after all, filled with a hundred clits that make her twat ribbed for your pleasure. ");
		output("Licking your lips with anticipation, you slip back down her body, popping your tail off her cock with a wet splurt, and push her dick out of the way against her belly. Sure enough, underneath it is a slender slit of a pussy, glistening with sexual desire.");
	}
	//else, no cuntsnake:
	else
	{
		output("\n\nYou keep thrusting your hips, slapping them against her big boobs’ undersides until the sound echoes throughout the lush jungle around you. Stars, you could easily be satisfied just blowing your load over these luscious tits of hers. Maybe two or three times. But ");
		if(pc.race() != "gryvain" && pc.race() != "half-gryvain") output("you’ve heard all sorts of wonderful things about a gryvain’s pussy, after all, filled with a hundred clits that make her twat ribbed for your pleasure");
		else output("you know full well how awesome it is - for both of you - to fuck a gryvain’s pussy");
		output(". Before you can lose yourself completely in her cleavage, you reach back and yank the wanna-be hacker’s pants down. A thick, cobalt-blue shaft springs up, tearing its way out of her black panties and bobbing in the breeze like a flagpole.");
		output("\n\nToo bad you’re not interested in that as much as what’s below it. You slides yourself back down her body, batting her dick out of the way and checking out the sex-slicked slit glistening underneath it.");
	}
	//combine:
	output("\n\nNow that’s what you’ve been looking forward to. You grab the gryvain’s legs and push them up knees-to-shoulder, spreading her pussy. She doesn’t have a clit on the outside, making her cunt look almost like a featureless slit in her ivory flesh... but you know better. You align your [pc.cockOrStrapon " + x + "]’s crown with her pussy and, locking eyes with the buxom bitch before ramming your [pc.hips] forward.");
	pc.cockChange();
	output("\n\nThe effect is immediate. Your prick slides into the sodden slit, engulfed in a tight sheath of rounded nubs, all of which rub against your length with spasmic grasps. Their owner shrieks, throwing her head back and beating her wings against the ground hard enough to lift herself half a foot off the dirt. A jet of white seed squirts out of her dick, splattering the undersides of her tits and leaving smears all up her toned belly. And her cock doesn’t stop after that, but just keeps spurting and leaking with every quick thrust you give her, bobbing up and down with the beat of her hammering heart.");
	output("\n\nThe gryvain finally manages to shout a haggard <i>“Fuck!”</i> between cumming her brains out and squirming on the ground. Every one of those little bulges you feel in her pussy is a little clit, all rubbing against your [pc.cockOrStrapon " + x + "] with every little move you make. And all of them grinding against you... it feels <i>good</i>. Too good. After all that titfucking you just did, you’re already on edge, and seeing the dragon-bitch creaming herself like a virgin on his first time... it’s too much! With a grunt, you hilt yourself in her, hard enough to make her shoot a streak of cream right into her own face. You’re barely a second behind her, ");
	if(x < 0) output("feeling the feedback sensation from your hardlight shaft building up to a climactic peak that has you roaring with pleasure.");
	else output("fucking the first wad of [pc.cumNoun] deep into her before pulling back, smearing the bumpy interior of her alien twat with your seed.");
	output("\n\nWhen your orgasm finally passes, leaving you sweat-slicked and covered in more than a little sexual effluvium. Your chest heaves against the gryvain’s bosoms, letting her soft, wet tits cushion you until you catch your breath enough to stand and search out your discarded gear.");
	output("\n\n<i>“Fuck!”</i> the gryvain gasps when you stand, wiping the cum off her breasts. <i>“Why did that feel so good... losing’s supposed to suck!”</i>");
	output("\n\nYou give her a look");
	if(x >= 0) output(", watching your seed still leaking out of her,");
	output(" and tell her to get going, to run back the way she came unless she wants to be covered in a few more rounds’ worth of spunk. The draconic woman groans and scrambles to her feet, giving you a final huff before she clambers up the side of the crater and disappears.");
	output("\n\nYou listen until her footfalls are long gone, deep into the jungle, before turning your attention back to the satellite. You find your way to a sealed compartment on its side, hidden under a panel");
	if(flags["SATELLITE_QUEST"] == 1) output(" right where the kaithrit man told you to look");
	output(". You ");
	if(pc.characterClass == GLOBAL.CLASS_MERCENARY) output("dig your fingers into the metal and, with a grunt of effort, rip the already-damaged seal off");
	else output("pull out your tools and get to work, slicing through the simple security system keeping it sealed");
	output(". Inside is a single removable piece: a hard drive about the size of your Codex with the Pyrite Industries logo printed on it.");

	output("\n\nYou take the black box and stuff it in your pack.");
	if(flags["SATELLITE_QUEST"] == 1) output(" Time to take it back to the Pyrite suit in town.");
	else output(" Maybe somebody’ll pay out for it?");

	pc.createKeyItem("Satellite Hard Drive");
	output("\n\n(<b>Gained Key Item: Satellite Hard Drive</b>.)");
	output("\n\n");
	enemy.loadInCunt(pc,0);
	processTime(30);
	clearMenu();
	CombatManager.genericVictory();
}