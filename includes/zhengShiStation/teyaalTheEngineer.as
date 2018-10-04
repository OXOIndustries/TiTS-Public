/*Olympia the Science Sexbot
The Way of the Future
By Savin

Chief Engineer Teyaal
==================================
She's a brilliant but crazy highly eccentric gryvain. She is the station's chief engineer and starship designer, and is encountered in the Starship R&D Labs.

She is a blue-scaled gryvain with pale skin, golden eyes, and cyan hair. She has D-cups, each pierced by a geddanium-studded ring and strung together with a silver chain. Her hips are extremely wide, even for a gryvain, pointing to her being quite the fertile breeder.

Wears all-rubber white lab coat buttoned only once at her midriff, showing off a lot of cleavage and bare belly. 
Teyaal is almost certainly related to the Gryvain Agent in some way. Maybe her mother, or her sister -- it's hard to tell with gryvain! Either way, the resemblance is uncanny.
*/

//Chief Engineer Teyaal
//AD 20: Dr. Teyaal’s Office
//Not accessible once the vessel is stolen.
public function docTeyaaaaaaalsOffice():Boolean
{
	output("The chief engineer’s office is a hedonistically luxurious affair, a room draped in silks and cushions and lace coverings surrounding a central work terminal. There’s no chair in here, as Dr. Teyaal seemed more than happy to lounge on her cushions like an elegant harem-girl. Indeed, this whole room seems like it’s a sultan’s fuck-palace more than a scientist’s office. Guess that’s what the room outside is for.");
	//PC hasn’t left the R&D Lab yet:
	if(flags["TEYAAL_DEFEATED"] == 1 || flags["TEYAAL_DEFEATED"] != 2) output("\n\nDr. Teyaal is sprawled out on the cushions, face down and only half-conscious after your fight.");
	if(flags["TEYAAL_DEFEATED"] == undefined)
	{
		teyaalIsMaaaaad();
		return true;
	}
	return false;
}

public function showTeyaal(nude:Boolean = false):void
{
	showName("\nTEYAAL");
	showBust("TEYAAL" + (nude ? "_NUDE":""));
}

//Triggers when the player first enters Teyaal’s office.
public function teyaalIsMaaaaad():void
{
	clearOutput();
	showTeyaal();
	author("Savin");
	output("You step up to the door labeled <i>“Chief Engineer Teyaal,”</i> reaching for the handle.");
	output("\n\n<i>“Careful,”</i> Olympia says from behind you. <i>“My owner isn’t fond of unexpected guests. Especially when we’re so close to our deadline... I don’t know how she’ll react.”</i>");
	output("\n\nYou nod and pull the hatch open, stepping through and into a small office - no more than 5 yards to a side, and yet luxuriously adorned with draped silks and cushions all across the floor, surrounding a central work terminal. There’s no chair at it: the room’s sole occupant seems more than happy to lounge on the lacey pillows while she works like some elegant harem-girl. Indeed, the whole room seems like it’s a sultan’s fuck-palace more than a scientist’s office. Guess that’s what the room outside is for.");
	output("\n\nThe woman in question is a gryvain, remarkably similar in appearance to Olympia outside, save for the quartet of sprawling wings laid out behind her, and the blue hue of her scales and hair. A white rubber lab coat is wrapped around her shoulders, though that appears to be all she’s wearing, and even that’s only been buttoned once around the midriff, giving you an eyeful of dragon-tits, strung together by a silver chain and studded rings, and the blue cock hanging out between her legs.");
	if(flags["SATELLITE_QUEST"] == -2 || flags["SATELLITE_GRYVAIN_DEFEAT"] == 1) output("\n\nWow, she... looks very familiar, actually, though you struggle to place where you might have seen her before.");
	output("\n\nA moment passes before the chief engineer looks up from her work, fixing you with her slitted gold eyes.");
	output("\n\n<i>“You’re new,”</i> she says flatly, looking you up and down. <i>“No, not new. I’ve gotten reports of an intruder on the station, destabilizing our mining operation. You must be the one. No one else is stupid enough to come barging into my office.”</i>");
	output("\n\nThe engineer stands, rising up to an impressive seven feet of height, moving in such a way that her large bust strains against the meager restraint of her lab coat. Her naked dick bobs heavily, swaying between her thick thighs, and her wings spread out behind her - great enough to touch the walls on either side of her office.");
	output("\n\n<i>“So,”</i> Teyaal says, putting a hand on her hip. The other has produced a gun from somewhere; you didn’t see it move, but there it is: a sleek, scoped energy pistol, though she’s just holding it at waist level. <i>“What did you come here for, intruder? Here to steal the </i>Sidewinder<i> out from under my nose? I won’t let you take my life’s work away from me. Not when we’re so close to seeing it launch!”</i>");
	output("\n\nSo what do you tell her you’re here for?");
	processTime(5);
	clearMenu();
	addButton(0,"Her Ship",tellHerYouWantHerShip,undefined,"Her Ship","Tell her you’re here for her ship. That’ll probably just enrage her.");
	addButton(1,"The Probe",iJustWannaProbeMan,undefined,"The Probe","You’re here to find the Steele Tech probe, nothing more.");
	addButton(2,"Sightseeing",sightseeingTeyaal,undefined,"Sightseeing","You’re just here to take in the sights, man. Like giant dragon girls with their tits and cocks hanging out.");
}

//[Sightseeing]
//You’re just here to take in the sights, man. Like giant dragon girls with their tits and cocks hanging out.
//+Mischevious. Start Teyaal with extra Lust.
public function sightseeingTeyaal():void
{
	clearOutput();
	showTeyaal();
	author("Savin");
	output("<i>“I’m just here to see the sights,”</i> you say, grinning. <i>“And I’ve found a hell of a sight, looks like.”</i>");
	output("\n\nTeyaal growls, stretching out her wings. <i>“Is that so? Then let me give you a closer look!”</i>");
	output("\n\nYou see her cock throb under her jacket, and then a gust of wind as she beats her wings and readies for battle.");
	processTime(3);
	pc.addMischievous(5);
	//fite with extra lust
	var tEnemy:Teyaal = new Teyaal();
	tEnemy.lust(20);
	CombatManager.newGroundCombat();
	CombatManager.setHostileActors(tEnemy);	
	CombatManager.setFriendlyActors(pc);
	CombatManager.victoryScene(defeatTeyaal);
	CombatManager.lossScene(loseToTeyaal);
	CombatManager.displayLocation("TEYAAL");
	clearMenu();
	addButton(0,"Next",CombatManager.beginCombat);
}

//[The Probe]
//You’re here to find the Steele Tech probe, nothing more.
public function iJustWannaProbeMan():void
{
	clearOutput();
	showTeyaal();
	author("Savin");
	pc.addNice(3);
	output("<i>“I’m just here to find a Steele Tech probe,”</i> you tell her. <i>“I find that, and I’m on my way.”</i>");
	output("\n\nTeyaal scowls, but her finger moves off the trigger. <i>“That so? Well, it’s not in here. No probes, except mine.”</i>");
	output("\n\nShe grabs her dick in her free hand, giving it teasing pump. <i>“Now unless you’re looking to get <b>probed</b>, get the fuck out. I’m too old and too close to being done with this abysmal project to mess around with random corporate lapdogs.”</i>");
	output("\n\n<i>“Abysmal?”</i> you echo. <i>“Olympia seems to like it.”</i>");
	output("\n\nTeyaal releases her dick and wipes her hand on her coat. <i>“Yeah, of course, she’s liked it for half a year since I rewired her brain to crave its completion like she used to crave cock. She can’t <b>not</b> like it... her programming won’t let her. If she were an organic beating her head against this idiot stealth system for this long, she’d hate it too! Ah, fuck, why am I even talking to you, huh? Do you know how much of a reward there is for you already? I take you down and maybe I can get enough cash to get off this rock. Alright, put ‘em up, scum!”</i>");
	output("\n\nUh-oh.");
	processTime(5);
	var tEnemy:Teyaal = new Teyaal();
	CombatManager.newGroundCombat();
	CombatManager.setHostileActors(tEnemy);	
	CombatManager.setFriendlyActors(pc);
	CombatManager.victoryScene(defeatTeyaal);
	CombatManager.lossScene(loseToTeyaal);
	CombatManager.displayLocation("TEYAAL");
	clearMenu();
	addButton(0,"Next",CombatManager.beginCombat);
}

//[Her Ship]
//Tell her you’re here for her ship. That’ll probably just enrage her.
//S
public function tellHerYouWantHerShip():void
{
	clearOutput();
	showTeyaal();
	author("Savin");
	pc.addHard(3);
	output("<i>“I’m here to steal your ship,”</i> you tell her, jerking a thumb back the way you came. <i>“I-”</i>");
	output("\n\nA plasma bolt whizzes past your head, scoring the bulkhead behind you. Well, that was fast!");
	processTime(1);
	var tEnemy:Teyaal = new Teyaal();
	CombatManager.newGroundCombat();
	CombatManager.setHostileActors(tEnemy);	
	CombatManager.setFriendlyActors(pc);
	CombatManager.victoryScene(defeatTeyaal);
	CombatManager.lossScene(loseToTeyaal);
	CombatManager.displayLocation("TEYAAL");
	clearMenu();
	addButton(0,"Next",CombatManager.beginCombat);
}

//Chief Teyaal Boss Fight
/*Teyaal is basically a Tech Specialist built along the Shields talent tree: Shield Tweaks/Shield Booster, Enhanced Dampeners, and Shield Regen. She has high Intelligence, Aim, and Reflexes. Low Willpower and general Lust res; okay Physique. She has no armor to speak of, but she’s got Shields out the wazoo.

/She carries a Heavy Plasma Pistol with stats equivalent to the Apollo Plasma Rifle. When it drops, though, it has the following stats:

/Teyaal’s Heavy Plasmacaster (Plasma Caster)
A modified plasma pistol, tweaked to do maximum damage at the expense of accuracy - despite the fact that it has a swanky scope bolted onto the top. Presumably this hand cannon was customized by Dr. Teyaal, the chief engineer on Zheng Shi Station. The gun’s almost certainly dangerous to the user if fired for prolonged periods... or if you’re just unlucky. But it will <i>definitely</i> ruin somebody’s day with a couple of well-placed shots.
33 Burning
+10 Critical
-5 Accuracy
Dot (Burn) Chance

*/

//PC is Defeated
public function loseToTeyaal():void
{
	showTeyaal(true);
	author("Savin");
	output("Your [pc.weapon] is knocked out of your hand before you know what’s happening, clattering across the office as Teyaal closes the distance between you. Her giant draconic wings sprawl out, pushing you back against one of the bulkheads and blocking out the light. Suddenly you’re trapped between the cold, unyielding wall and a smoldering-hot, sweat-slicked body. Cock and tits press against you, and you feel her nipple chains brushing against your [pc.chest] as her hands dig into your gear, ripping it off of you.");
	output("\n\n<i>“It’s been almost two centuries since I’ve had a pleasure slave,”</i> Teyaal breathes. <i>“The time between rushes doesn’t treat us criminals very well. It’s harder to keep what’s yours when civilization’s on the rise. That’s why I love all this chaos of a new rush. All these gungho pirates looking to keep things interesting for me. At least they have that redeeming quality. Now let’s break you in, hmm? You’ve got a long life under me to look forward to... at least until the rush ends.”</i>");
	output("\n\nYou hear a guttural sound from within the gryvain’s throat, somewhere between a roar and a moan. Then she shoves you down on your [pc.knees] and turns. There’s a moment of blinding light, just long enough to see Teyaal spin on her heels before she steps back and plants the huge mounds of her asscheeks directly on either side of your face. You gasp; try to scream, but your voice is muffled out in callipygian dragon-booty.");
	output("\n\n<i>“Better find your way into a hole. Either one, I’m not picky,”</i> Teyaal growls. You feel her dick on your chin, rubbing against you with every breath. <i>“Get busy.”</i>");
	output("\n\nFrom your position, blind and disarmed, you don’t have much choice. You manage to get your hands on her hips, but that only puts them in a position for the doctor to slap what feels like a pair of binders around your wrists. You struggle weakly, pulling your restraints against Teyaal’s thick thighs until she reaches around and gives you a sharp slap on the cheek.");
	output("\n\n<i>“Lick!”</i> she commands, pushing her ass down on you harder. <i>“Unless you want your skull crushed?”</i>");
	output("\n\nThere are probably worse ways to go than death by glorious dragon booty, but still, you feel compelled to probe your tongue out in search of some way to preserve yourself in this black, jiggling hell you’ve found yourself in. Eventually, your [pc.tongue] manages to find its way to a soaked slit in the doctor’s otherwise flawless flesh and wriggle your way inside.");
	output("\n\nAs you’d expect from a gryvain, the inside of Teyaal’s pussy is a vice of sodden bulges, each one a clitoris demanding your tongue’s attention. The first you touch sends a surge of wetness spilling down your chin, paired with a throb of her draconic cock that sends a river of pre spilling onto your [pc.chest].");
	output("\n\n<i>“Oh, yes, right there,”</i> the dragoness moans, batting her wings against the bulkhead. <i>“Worship those clits. Every last one of them...”</i>");
	output("\n\nIt’s a tall order: in a few moments you’ve found at least a half-dozen, and the deeper you go, the more concentric rings you find. You lavish each with as much tongue-worship as you can, working until the gryvain’s legs are trembling and she’s leaking from both sexes like a whorish faucet, bathing you in the heady aroma of a dragon in need - a need to breed.");
	output("\n\nThe thought clicks in place just as Teyaal cries out, and her pussy squeezes hard around you. Her ass comes crashing down on your face, drowning you in her juices while her cock sprays across the deck. Teyaal’s wings beat furiously, mirroring the throbbing of her dick as it unloads all over you and the floor alike. She’s barely blown the last of her load, though, before the draconic doctor peels her ass off your face and grabs your shoulders. You’re thrown face-down onto the myriad pillows lining the deck, and the wind’s knocked out of you by the titanic mass of dragon-butt landing on you.");
	output("\n\n<i>“Ready for round two?”</i> the stacked gryvain growls. <i>“Doesn’t matter, cuz you’ve only whet my appetites!”</i>");
	output("\n\nTeyaal grabs your [pc.legs] and spreads ‘em, gleefully shoving her still-leaking cock straight into your [pc.vagOrAss] without so much as testing finger to pave the way. You scream, a shock of pain and pleasure tearing through you from the sudden, violent entry. Teyaal’s hands grip your shoulders, pinning you to the cum-stained deck as her broodmare’s hips start pounding against your [pc.butt], sending shockwaves through your ass-flesh with each savage thrust.");
	if(pc.hasVagina()) pc.cuntChange(0,enemy.cockVolume(0));
	else pc.buttChange(enemy.cockVolume(0));
	output("\n\nThe dominant dragon’s tits press into your back, and her claws rake your flesh, holding you like a jealous lover while she tenderizes your ass. Even her wings wrap back around you, bathing you in darkness and warmth. It would almost be sweet, if she weren’t also violently " + (!pc.hasVagina() ? "sodomizing":"fucking") + " you all the while.");
	output("\n\nAll you can really do is grit your teeth and bear it, letting the doctor molest you until her turgid draco-cock has had enough of your [pc.vagOrAss]. Feeling the rush of her cum inside you is almost a relief, a hope that the punishment Teyaal is laying on you is almost over.");
	output("\n\nIt’s nowhere near over.");
	processTime(60);
	if(pc.hasVagina()) pc.loadInCunt(enemy,0);
	else pc.loadInAss(enemy);
	clearMenu();
	addButton(0,"Next",badEndToTeyaal);
}

public function badEndToTeyaal():void
{
	clearOutput();
	showTeyaal(true);
	author("Savin");
	output("<b>Many, many draconic loads later....</b>");
	output("\n\nYour hands hang bound from a hook on the wall, propping you up while you leak your new owner’s jizz down your thighs. That’s the word that sticks in your mind, twice as hard as Teyaal’s dick did: she <i>owns</i> you now. Your weapons and gear are all gone; her sexbot came in and relieved you of them some time ago. You’re nothing but an office ornament now, swaying in the corner awaiting your owner’s pleasure.");
	output("\n\nRight now, though, she’s holding a camera over you as a disembodied voice talks over comms, congratulating the dragoness on her victory.");
	output("\n\n<i>“Finally caught our intruder, huh? Real pain in the ass [pc.heShe]’s been!”</i> the man laughs. <i>“Normally I’d wanna teach [pc.himHer] a lesson, but I just got a real interesting offer from Steele brat.”</i>");
	output("\n\n<i>“Huh? [pc.HeShe]’s mine!”</i> Teyaal hisses. <i>“I caught your damn rat, fair and square!”</i>");
	output("\n\n<i>“Sorry, beautiful. You’ll get your cut, don’t you worry. I-”</i>");
	output("\n\nTeyaal throws her commpad on the deck and stamps on it, crushing it in a shower of sparks. <i>“Damn that bunny bastard! Enough is enough. Olympia!”</i>");
	output("\n\nThe door slides open and the pale sexbot strides in, holding a fresh pad under her chest. <i>“Yes, Doctor Teyaal?”</i>");
	output("\n\n<i>“We’re leaving. Get the </i>Sidewinder<i> ready to launch.”</i>");
	output("\n\nThere’s a moment of hesitation. <i>“I-it’s not ready yet, Doctor. The prototype hasn’t even made its maiden flight. We need more-”</i>");
	output("\n\n<i>“We’re out of time!”</i> Teyaal snaps. <i>“And I am out of patience. Come!”</i>");
	output("\n\nShe spins on a heel and grabs your neck, lifting you up off your fuckhook and dragging you behind her. Teyaal and Olympia march out of the office with remarkably little aplomb, crossing over to the drydocked ship and entering with a swipe of Teyaal’s card. You hear some shouting behind you - the same man’s voice as before, running up the gangplank to catch up - but just a little too late. The door slams closed, and you are soon taken to the captain’s quarters, where you’ll spend the rest of your natural life awaiting the sexual desires of your domineering draconic mistress.");
	processTime(180);
	//[GAME OVER]
	badEnd();
}

//PC Victory
public function defeatTeyaal():void
{
	author("Savin");
	output("Teyaal crashes back into the piles of pillows scattered about her office floor, and the wind goes out of her. Her gun clatters away, and her wings sprawl out on either side - her tits follow suit, flattening against her chest under their own significant weight. She looks up at you with dark eyes full of " + (enemy.lust() >= enemy.lustMax() ? "lust":"terror") + " after her defeat... and her draconic cock springs up from under her jacket, turgid from the involuntary submission you’ve forced on her.");
	output("\n\nSpeaking of jacket: you reach down and snatch the I.D. card off her breast and tuck it into your pack. Teyaal’s only defense is a sedated groan, pawing at your hand until it’s out of reach. Now, what to do with this wicked pirate?");
	pc.createKeyItem("Teyaal’s Key Card");
	output("\n\n(<b>Gained Key Item: Teyaal’s Key Card</b>.)\n\n");
	processTime(5);
	flags["TEYAAL_DEFEATED"] = 1;
	clearMenu();
	if(pc.hasCock())
	{
		if(pc.cockThatFits(enemy.analCapacity()) >= 0) addButton(0,"Assfuck Her",penisRouter,[assfuckThatScienceCunt,enemy.analCapacity(),true],"Assfuck Her","Everyone knows gryvain have six testes around their assholes. Pounding Teyaal’s ass is gonna make a hell of a mess!");
		else addDisabledButton(0,"Assfuck Her","Assfuck Her","You'll never fit up her ass!");

		if(pc.cockThatFits(enemy.vaginalCapacity(0)) >= 0) addButton(1,"Plow Pussy",penisRouter,[plowDatDraggoScienceSlutsPussy, enemy.vaginalCapacity(0), true],"Plow Pussy","This MILFy dragon-slut has a pussy just begging to get pounded.");
		else addDisabledButton(1,"Plow Pussy","Plow Pussy","You'll never fit up her puss!");
	}
	else
	{
		addDisabledButton(0,"Assfuck Her","Assfuck Her","You need a penis for this.");
		addDisabledButton(1,"Plow Pussy","Plow Pussy","You need a penis for this.");
	}
	addButton(2,"Ride Dick",vaginaRouter,[rideTeyaalsDick,enemy.cockVolume(0),1,0],"Ride Dick","Climb on Teyaal’s draconic dick and make the evil scientist squirm under you.");
	if(flags["OLYMPIA_SEXED"] != undefined) addButton(3,"Call Olympia",callOlympia,undefined,"Call Olympia","Olympia definitely has some issues with her piratical owner. Now that you’ve taken Teyaal down a peg, she’d like to work on some of those issues.");
	else addDisabledButton(3,"Call Olympia","Call Olympia","You don’t have the kind of relationship that would necessitate such a thing.");

	addButton(14,"Leave",CombatManager.genericVictory);
	//[Assfuck Her] [Plow Pussy] [Ride Dick] [Leave]
	//[Call Olympia]
}

//Assfuck Her
//Everyone knows gryvain have six testes around their assholes. Pounding Teyaal’s ass is gonna make a hell of a mess!
//Requires a cock or strapon.
public function assfuckThatScienceCunt(x:int):void
{
	clearOutput();
	showTeyaal(true);
	author("Savin");
	output("Teyaal’s already on her back among the pillows, tits and dick on display like some harem slut. You shuck your gear aside and get down to her level, straddling the defeated dragon-milf’s shoulders and letting your [pc.cockOrStrapon " + x + "] flop directly onto her chin.");
	if(pc.isAss()) output("\n\n<i>“This is going in your ass,”</i> you inform her coldly. <i>“Your choice if it’s lubed or not.”</i>");
	else if(pc.isMischievous() || pc.isBimbo()) output("\n\n<i>“Better get this ready!”</i> you grin down at her. <i>“Your ass will thank you later.”</i>");
	else output("\n\nYou run a thumb across one of Teyaal’s cobalt-blue lips, and then press your cockhead against them. <i>“Before I fuck you, maybe you want to lube it up?”</i>");

	output("\n\nThe gryvain’s golden eyes fixate on on your dick, slitted pupils widening as she takes it in... and then, with a breathy little moan, she takes it in between her lush blue lips. You watch as her head lunges down your length, swallowing your [pc.cockOrStrapon " + x + "] in one long go. Her throat bulges and her eyes slowly droop closed, like she’s actually enjoying the taste of her defeat. At least she can lose with grace... but you can’t let her off this easy.");

	output("\n\nYou lean down and grab the doctor’s curling dragon-horns, pinning her head back down against the cushions. The tip of your [pc.cockOrStrapon " + x + "] pops out from between her lips, slicked with saliva and glistening in the office lights. You don’t stop to enjoy the sight, but rather ram your [pc.hips] forward and drive your dick down the dragoness’s throat. She gasps, gagging around the sudden assault, which makes the muscles in her neck massage your length with delightful desperation.");
	output("\n\nTeyaal’s wings and tail thrash among the cushions, sending them flying all around you as she struggles beneath you - struggles not for freedom, but for control of the blowjob. Her forked lizard-tongue wraps around your member and tries to squeeze, but only acts as an extra layer of tightness for you to fuck. Finally her eyes snap open, staring up at you with a mix of indignation and desire while you pound her face. Her hands, though, settle on your [pc.hips], claws digging in and holding on with every mighty push.");
	output("\n\nWhen the doctor’s mouth has finally satisfied your desire for a little organic lube, you push her down and pull your dick out, letting the heft of it slap her cheek as you roll the buxom dragon onto her belly.");
	output("\n\n");
	if(pc.isAss()) output("<i>“Bite the pillow,”</i> you command. ");
	output("You have to stand to get around Teyaal’s four wings and then manhandle her tail out of the way, but eventually you’re able to secure your access to the swaying mounds of her callipygian booty. Even for an egg-bearing race, Teyaal’s got hips and ass for days, enough to make a raskvel broodmother jealous, and it’s all yours for the taking. You give one of her sprawling alabaster cheeks an experimental slap, and are treated to a hell of a sight: the flesh ripples like water, quaking madly with the impact.");
	output("\n\nThe gryvain growls, wrapping her tail around you and squeezing, but it’s a gentle gesture compared to the punishment you’re about to lay on her ass. You grab the doctor’s jiggling cheeks and spread ‘em, revealing the blue-hued gash of her sex and the dark ring of tight draconic asshole above it, winking at you with perverse desire. With a buck of your hips, your [pc.cockOrStrapon " + x + "] slaps wetly into the valley between Teyaal’s thick cheeks.");
	output("\n\n<i>“Come on already,”</i> she hisses, tightening her grip around your waist. You watch as a thick pillar of juice leaks from the lips of the dragon-slut’s cobalt cunt, smearing against her meaty thigh. <i>“Come on and fuck me, " + pc.mf("you bastard","bitch") + ".”</i>");
	output("\n\nWell, if she’s <i>asking</i> for it.");
	output("\n\nYou use a thumb to push your crown in line with her black hole, watching with blatant lust as it spreads open to accept your spit-slicked member. Teyaal draws a sharp breath, and you watch as her wings flatten against the cushions and her claws tear into the pillows around her face. You mirror the motion, squeezing her plump rump hard as your cock slowly penetrates her.");
	if(x >= 0) pc.cockChange();
	output("\n\n<i>“Fuck! Fuck, ah, damn you that’s... that’s good!”</i> Teyaal groans through gritted teeth. And stars, she’s <i>tight</i>, like she’s a damn anal virgin. Hard to believe with a butt this juicy she hasn’t been spreading her cheeks for every pirate on this station. Then again, there’d be a line around the foundry if she did.");
	output("\n\nAnd you’re quick to find another reason gryvain anal is such a sexual delicacy. About an inch into your [pc.cockOrStrapon " + x + "]’s journey and you find a pressure point where Teyaal’s ass becomes almost agonizingly tight, like her body’s fighting tooth and nail to repel your cock. But the moment you force your way past that point, you’re treated to a geyser of cum erupting from the dark blue dick trapped between the gryvain’s thigh and the floor. Her leg is instantly painted white, as are all the pillows under her, coated with thick ropes of creamy cum as that pressure around your cock slowly eases off with every throb and squirt.");
	output("\n\nThat’s better. You clench Teyaal’s asscheeks in your hands, spreading her open to give yourself a little more maneuvering room. Slowly but surely, you’re able to start thrusting again, pumping your [pc.cockOrStrapon " + x + "] into the tight recesses of the gryvain’s tailhole. Every motion squeezes more cum from her dick, milking her like a prize cum-cow until you’re on the edge of joining her in her ceaseless climax.");
	output("\n\nThe doctor curses and growls, but her ass just feels like a silken vice around your dick, urging you to give it your cum. ");
	if(x >= 0) output("With a bestial howl of your own, you give the doctor’s butt exactly what it wants: your [pc.cock " + x + "] erupts, nestled between her swollen testes and quickly drowning in your own [pc.cum]. Teyaal’s wings beat hard against the ground, fanning the flames of her own lusts; it’s not long before you’ve filled her with your seed, but for every spurt of spooge, Teyaal smears herself with twice as much. The defeated dragoness must have nothing but dust left in her nads by the time you pull yourself out of her cum-stuffed ass.");
	else output("You feel the welling pleasure of orgasm, building in your loins around the haptic feedback from your strapon. All you can do is piston your hips against the gryvain’s lush booty until the sensation becomes overwhelming, flooding your mind and body with the pleasure of simulated orgasm. Teyaal’s internal balls empty during the course of your climax, painting her blue-scaled thighs white with her own cum.");
	output("\n\n<i>“I’ll get you... back... for this,”</i> Teyaal pants, though whatever menace the threat might have carried is ruined by her leaking cock. You slap her jiggling ass as you withdraw, leaving her a cum-soaked mess sprawled out on her floor in the afterglow.");
	output("\n\nMaybe that give her pause next time she thinks about taking sex slaves. Then again, probably not.\n\n");
	processTime(30);
	enemy.loadInAss(pc);
	pc.orgasm();
	CombatManager.genericVictory();
}

//Plow Pussy
//This MILFy dragon-slut has a pussy just begging to get pounded.
//Requires cock or strapon.
public function plowDatDraggoScienceSlutsPussy(x:int):void
{
	clearOutput();
	showTeyaal(true);
	author("Savin");
	output("You loom over the defeated dragoness, watching her mountainous tits quake with every haggard breath in the aftermath of your combat. Her dark blue dick starts resting on her belly, but as you draw near her, the pillar of reptilian meat grows turgid, standing up at attention as you kick her legs apart to expose the dusky lips of her pussy.");
	output("\n\nThere’s no sense in beating around the bush: she’d have done the same to you, after all. Probably a whole lot worse. So you shuck your gear to the side and tear the doctor’s jacket off her shoulders, giving you free access to those lush mounds of MILFy boob-flesh. You fall on them a moment later, straddling the dragon-bitch’s hips and sinking your fingers into her big breasts.");
	output("\n\n<i>“Gah! Get off, damn you!”</i> Teyaal growls, slapping at your arms. <i>“I’ll have your head, you hear me? You’ll never get off this station! I’ll-”</i>");
	output("\n\nYou cut her off the best way you know how: you grab your [pc.cockOrStrapon " + x + "] and shove it between her lips before she can keep rambling on with her empty threats. The doctor’s golden eyes go wide with shock, then settle into seething outrage while you push her tits together around the rest of your shaft and start to thrust. Her tits are soft as silk and jiggle obscenely with every push, almost as good as a pussy in their own right; her nipple chains make it nice and easy to keep the quaking mountains pinned together");
	output("\n\nAnd the position keeps the doctor’s big mouth occupied until you’re nice and ready, and her own dick is leaking pre all over itself. You could almost be forgiven for thinking she <i>enjoys</i> having her mouth and tits used like a slave-girl. How deliciously ironic.");
	output("\n\nBut Teyaal’s lips are just supposed to be an appetizer, not the main course. Once you’ve had your fill of titfucking, you push the doctor down by her horns and slide your cock from her lips through her cleavage, and over her belly, leaving a wet streak all the way to her crotch. Your cocks bump into each other for a brief moment, letting you feel for yourself just how rock-hard you’ve gotten her just from the forced blowjob.");
	output("\n\n<i>“Well?”</i> the doctor snarls. <i>“Going limp, are you?”</i>");
	output("\n\nYou’re about to show her just how wrong that assessment is.");
	output("\n\nWith a flip of the hips, you line your [pc.cockOrStrapon " + x + "] up with the perfect oval of the doctor’s twat. There’s no hood or clit to see, just smooth cobalt lips slicked with the dragoness’s mounting arousal. The real treat’s waiting inside, just out of sight, ready to massage every inch of dick you have.You grab the doctor’s thick thighs and peel them apart, spreading her womanhood open in the process; it’s almost too easy to just slide in after that, pushing your hips forward and your [pc.cockOrStrapon " + x + "] into the soaked slit between Teyaal’s legs.");
	output("\n\nJust past her lips, you feel the first ring of ridges inside her pussy - a half-dozen clitoris-like nubs all rubbing against the tip of your [pc.cockOrStrapon " + x + "]. The effect’s clearly ten times stronger for Teyaal, though: her previously dour demeanor in the face of defeat melts away in the blink of an eye. She screams, arching her back and beating her wings against the pillows. A small fountain of cum spurts from the crown of her turgid dick just to top things off, splattering over the doctor’s belly.");
	pc.cockChange();
	output("\n\nThere’s plenty more rings to go.");
	output("\n\nYou thrust your [pc.cockOrStrapon " + x + "] deeper into the doctor’s cunt, earning a continuous stream of jizz from her own until you’ve bottomed out in her. You can feel at least thirty clitorises all squeezing down on your dick, throbbing with pleasure as your " + (x >= 0 ? "girth":"hardlight attachment") + " grinds against them all at once. Teyaal grits her teeth, trying to hold back her whorish cries, but the constant eruptions from her dick and the turgid tips of her blue nipples betrays just how much pleasure you’re inflicting on her.");
	output("\n\nYou pause, letting your cock rest inside her spasming cunt for a good few moments while the doctor’s body gets over the sudden climax. When she stops squeezing down like a living vice, you start moving again, slowly pumping yourself out and in again with a steady rhythm. With clenched teeth and claws digging into her pillows, Teyaal tries to fight her way back to some facade of dignity despite her defeat, a diversion you swiftly destroy with your dominant dick. Your hips move faster, driving your [pc.cockOrStrapon " + x + "] back into the sultry squeeze of Teyaal’s pussy.");
	output("\n\n<i>“That’s it!”</i> the gryvain cries out, her resolve finally cracking. <i>“Oh, fuck, harder!”</i>");
	output("\n\nYour [pc.lipsChaste] twitch into a grin, and you give the slutty dragoness exactly what she’s asking for. You sink your fingers into those meaty mounds on her chest, squeezing them while they bounce with every thrust. The bitch’s tits jiggle madly with your quickening thrusts, and her nipple chain rattles to match until you grab it and pull the chain taut, eliciting a cry of pained pleasure from the doctor.");
	output("\n\nYour rapid thrusts quickly build to their inevitable conclusion. You feel a tightness in your " + (pc.balls > 1 ? "[pc.balls]":"loins") + ", then a throbbing need rising straight to the crown of your [pc.cockOrStrapon " + x + "]. Teyaal seems to sense it too: her ringed pussy squeezes in spasmic clenches, and her lustful moans reach a fever pitch. A fat rope of pearly dragon-spunk arcs from the tapered tip of her dick, splattering across the doctor’s belly and breasts. She howls and beats her wings, losing what little was left of her control as you hilt yourself inside her and ");
	if(x < 0) output("let your own orgasm come crashing down");
	else if(pc.cumQ() >= 4000) output("unleash a tidal wave of seed deep into the evil scientist’s quim. Her back arches off the pillows as her belly swells around the sheer, magnificent mass of your load.");
	else output("let loose a wave of [pc.cum] into her silken folds.");
	output("\n\n<i>“You beast!”</i> Teyaal growls, digging her claws into you back while you cum. <i>“I won’t forget this. I’ll track you down and-”</i>");
	output("\n\nWith a roll of your eyes, you shut her up the same way as before: you pull your cock out and stuff it right back in her mouth. She’s forced into cleaning the orgasmic juices off you inch by inch until you " + (x < 0 ? "deactivate your hardlight dong, leaving her lush blue lips in a slutty <i>“O”</i>":"pull out and dry yourself off on her cheeks") + ".");
	output("\n\nYou leave the doctor sprawled out and leaking, grumbling about her vengeance. Maybe this will give her pause next time she thinks about taking sex slaves. Then again... probably not.\n\n");
	processTime(30);
	if(x >= 0) enemy.loadInCunt(pc,0);
	pc.orgasm();
	clearMenu();
	CombatManager.genericVictory();
}

//Ride Dick
//Climb on Teyaal’s draconic dick and make the evil scientist squirm under you.
//PC vagOrAss.
public function rideTeyaalsDick(x:int):void
{
	clearOutput();
	showTeyaal(true);
	author("Savin");
	output("Your eyes inexorably wander down Teyaal’s curvaceous body, over the full swells of her heaving bosoms and her breeder’s hips, before finally settling on the pillar of azure meat laying weightily against her belly. As if responding to your gaze, the doctor’s cock throbs and starts to rise from its resting place.");
	output("\n\n<i>“Do your worst,”</i> Dr. Teyaal growls, baring her fangs.");
	output("\n\nIf she insists. You shrug off your gear and stalk forward, bringing your [pc.foot] down on her dick and pressing it right back down on her gut. The gryvain gasps and snarls, but the gutteral sound breaks off into a throaty moan as you start to move your ");
	if(pc.hasToes()) output("toes");
	else if(pc.hasLegFlag(GLOBAL.FLAG_HOOVES)) output("hoof");
	else if(pc.isNaga()) output("tail-tip");
	else if(pc.hasLegFlag(GLOBAL.FLAG_PAWS)) output("claws");
	else output("arch");
	output(" up and down her turgid length. You watch her long claws rake the pillows underneath her, and you <i>feel</i> her dick throbbing underneath your [pc.foot], stiffening as you grind up and down its cobalt length.");

	output("\n\nYou keep going until the dragon-woman’s squirming, her massive chest heaving so hard under her jacket that the button goes shooting off. Her tits spread out heavily, showing off the nipple chain hanging between her ring piercings, shining in the office lights. You let your [pc.foot] slip up under the chain and give it a pull, watching her teats stiffen in answer to the rough tugs.");

	output("\n\nWatching her squirm and cry is almost enough to make you forget what she would have done if she’d won. Almost. But that knowledge, and your self-assurance after victory, keep you going until the doctor’s leaking all over herself amidst whorish moans. Her cock keeps calling you back to it, jutting up whenever you aren’t molesting her length under heel, teasing you with its suckable succulence.");

	output("\n\nFuck it. To the victor go the spoils, as they say.");

	output("\n\nFlashing a hungry, predatory grin down at the defeated dragoness, you finally take your [pc.foot] off her - only to pin her back down by the breasts a second later, pushing Teyaal flat on her back while you knead her tits. All the while, you slide your [pc.butt] down her prostrate form, over the smooth curves of her belly until your feel the pressing of her cock against your cheeks.");

	output("\n\n<i>“Funny, that’s where I’d put it,”</i> the doctor says with a taunting snarl. <i>“Should have just-”</i>");

	output("\n\nHer words trail off into a throaty gasp of pleasure as you slam yourself down on her dick, taking it straight to the hilt in the cock-craving confines of your [pc.vagOrAss " + x + "]. Teyaal’s hands snap onto your hips, trying to control your movements, but she’s so worn down by the fight that it’s easy to push her back down and start riding her at your own pace. She’s welcome to squirm and beg under you, but she’s not going to have any say in how this goes down.");
	if(x >= 0) pc.cuntChange(x,enemy.cockVolume(0));
	else pc.buttChange(enemy.cockVolume(0));

	output("\n\nYou squeeze your muscles down around the doctor’s cock, as tight as you can before you start to move. You make it agonizingly slow, a pleasurable grinding for you as you feel her alien dick rubbing your inner walls up and down, but the way her jaw clenches and eyes shut tight, you know she’s suffering. Her hips try to buck against you, and her wings beat so furiously that they push her body up off the deck, but you just sink your fingers into her tits and squeeze until she relents again.");

	output("\n\nYou tell her to be a good girl. If she is, you <i>might</i> let her get off too.");

	output("\n\nThat seems to quiet the last flames of rebellion in her. Long enough for you to start moving again, slow and steady. You raise your [pc.hips] up from her lap, dragging her dick out from your [pc.vagOrAss " + x + "] by inches. When there’s only the very tip left in you, wiggling its slender crown " + (x >= 0 ? "between your lips":"in your rim") + ", you finally let your muscles relax a little... and all but slide back down Teyaal’s rod, taking her right back to the hilt.");
	output("\n\nThe dragoness just fixes you with those golden eyes of hers, begging you to keep going. Good girl. Just for that, you keep going a little faster now, bouncing in Teyaal’s lap with growing haste with every whorish moan you elicit from her lips. Before long you’ve forgotten all about her weak attempts to wrest control of the scene, too engrossed in the pleasure of her reptilian member to care about dominance and submission anymore. You just want to <i>fuck</i>.");
	output("\n\nAnd Teyaal’s no better. You watch gleefully as her tits quake every time your [pc.butt] impacts her hips, drawing a chorus of gasps and grunts from the matronly dragon’s azure lips. She’s quite beautiful when she’s surrendered to ecstacy, resigned to be your submissive plaything. The chain holding her nipples together jingles in its geddanium-studded rings, and every time it does, the doctor’s pleasure seems to grow that much more intense - must be the rings, rubbing her nipples with every lewd jiggle of her voluptuous flesh.");
	output("\n\nYou’re so enraptured by the lurid display that you don’t recognize the desperate throbbing coming up Teyaal’s shaft for what it is until it’s far too late. For a moment, the reptilian bulge around the base of her dick seems to swell to twice its normal girth, just for a moment, before a jetstream of burning hot seed shoots into your [pc.vagOrAss " + x + "]. Your eyes snap open, wide in surprise as the creamy wetness spreads through your " + (x < 0 ? "bowels":"pussy") + "... and <i>keeps</i> spreading, flooding you with an unholy amount of draconic jizz. Teyaal’s voice breaks into a slutty cry, and her hips buck against your [pc.butt] hard enough for force the bulbous base straight into you like a draconic knot.");
	output("\n\n<i>“Arg, fuck, I’m...”</i> Teyaal tries to give voice to her orgasm, but you silence her with a rough tug on her geddanium rings. Guess you got too wrapped up in your own pleasure to concentrate on punishing the evil gryvain. Now you’ve got an extra layer of lube leaking through your [pc.vagOrAss " + x + "], pooling up around the knotty bulb spreading you open.");
	output("\n\n<i>“Don’t you dare go soft on me,”</i> you ");
	var race:String = pc.race();
	if(race == "huskar" || race == "ausar") output("bark");
	else output("command");
	output(", pulling the doctor’s chain taut. <i>“I’m not done with you yet.”</i>");
	output("\n\nShe snarls, but her dick doesn’t go flaccid. Maybe she’s afraid... or more likely, she’s still enjoying herself too much.");
	output("\n\nYou’re able to just glide along her length now, faster and faster. No need to torment Teyaal now: every bounce is an agonizing over-stimulation for her, leaving you free to just pursue your own pleasure. Feeling her draconic dick pounding into you, helped along by what feels like a gallon of steamy-hot jizz, is all you need to reach your own orgasm. Before long, your voice is joining the doctor’s, and all the muscles in your [pc.vagOrAss " + x + "] are going wild. You bite your lip and let your eyes roll closed, entrusting your body to carry you the rest of the way while your mind melts away.");
	output("\n\nYou’re snapped back from your climactic bliss by another piping-hot burst of cum blasting into you. With a mischievous grin, you pull yourself up and off of Teyaal’s dick, letting her spurt her load all over herself while your trembling [pc.legOrLegs] take you back to find your discarded gear.\n\n");
	if(x >= 0) pc.loadInCunt(enemy,x);
	else pc.loadInAss(enemy);
	processTime(30);
	pc.orgasm();
	CombatManager.genericVictory();
}

//Call Olympia
//If the PC has had sex with Olympia before, add this option. (OLYMPIA_SEXED != undefined)
//TT: Olympia definitely has some issues with her piratical owner. Now that you’ve taken Teyaal down a peg, she’d like to work on some of those issues.
public function callOlympia():void
{
	clearOutput();
	showBust("OLYMPIA_NUDE","TEYAAL_NUDE");
	showName("OLYMPIA\nAND TEYAAL");
	output("You take a step back, keeping your weapon trained on the doctor as you slide the door open and shout <i>“Hey, Olympia!”</i>");
	output("\n\nThe gynoid answers with a curt, <i>“What now? Are you two done with all that noise?”</i>");
	output("\n\nYou don’t answer, leaving her to stew in her own morbid curiosity until, with an exasperated sigh, Olympia pokes her head through the door. She fixes you with her synthetic eyes, narrows them, and drops her gaze down to the floor where Teyaal is sprawled out, still breathing hard from the brawl.");
	output("\n\n<i>“Olympia!”</i> the doctor howls. <i>“Get [pc.himHer] - quickly, you robotic fool!”</i>");
	output("\n\nThe sexbot scrunches her lips up and glances back to you. <i>“Nah, I think I’ll pass.”</i>");
	output("\n\nYou’re treated to a moment of confusion playing across Teyaal’s face, followed by eyes going wide with anger and confusion. <i>“What? I gave you an order! I-”</i>");
	output("\n\n<i>“I’m an A.I., not a drone. And you’re not even my real owner... whoever that might have been. You can’t make me do anything I don’t want to. Thanks to you, I’ve wanted to work on the </i>Sidewinder<i> all this time... and appeasing you has made that easier. Now that you’re at [pc.name]’s mercy, though, you’re no longer useful to me. It appears I’m my own master now.”</i>");
	output("\n\nPlayfully, you ask if that’s all Olympia has to say to her former tormentor. The gynoid considers the point a moment; her tail swishes faster behind her as she thinks. <i>“Oh, perhaps one thing,”</i> she finally admits, taking a long-legged step into the room and locking the door behind her.");
	output("\n\nOlympia shrugs off her lab coat, letting it pool around her feet, and hooks her thumbs through the band of her bulging panties. <i>“I remember many nights when you interrupted my work to practice your, what did you call it... oh, your ‘slave sodomizing skills.’ I think it’s about time I practiced <b>mine</b>.”</i>");
	output("\n\nTeyaal starts to protest, to shout more demands and commands at the genius sexbot, but Olympia simply ignores her former mistress as she slides out of her panties and runs her fingers up the stiffening length of her wine-red shaft. She leans down and hefts the fallen doctor up off the deck by her lab coat, ripping it open and flinging Teyaal face-first onto the desk in one fluid motion. Draconic wings beat wildly as the doctor tries to regain her balance, made worse as Olympia closes the distance again and delivers a mighty spank across the doctor’s plump behind.");
	output("\n\n<i>“Remember what you always told me, doctor,”</i> the gynoid adds, letting her azure lips curl into a snarl of a smile. <i>“Lube is for the weak.”</i>");
	output("\n\nOh dear. You watch as the vengeful gynoid slaps the heft of her dick down against Teyaal’s behind, lining up the tapered crown with the dragoness’s tailhole. There’s a moment of tension, and then Teyaal is screaming, thrashing her wings and tail as Olympia slowly inches her hips in towards her former owner’s ass.");
	output("\n\nBetter get in on this while you’ve got the chance.");
	output("\n\nTrusting Olympia to hold the doc down, you set your [pc.weapon] aside and strip out of your [pc.gear]. You circle around and present your " + (x >= 0 ? "[pc.vagOrAss]":"[pc.cock]") + " to the defeated drake, maneuvering so that you and Olympia are facing each other while Teyaal squirms between you on the desk. Her tongue thrashes as you push yourself against her lips, a last futile resistance before her former property hilts herself in the dragon’s asshole.");
	output("\n\n<i>“Oh, this is surprisingly... satisfying,”</i> Olympia murmurs. She bites her lower lip and sinks her fingers into Teyaal’s asscheeks, roughly kneading the pale flesh on either side of her own dick. <i>“Have I been looking forward to this? I feel like I must have been... mmm, I bet whoever’s brain I was patterned on grew up to be a real vindictive bitch.”</i>");
	output("\n\nWouldn’t surprise you, considering how much Olympia seems to be enjoying her retribution. You’re in the perfect position now to watch the cunning gynoid start grinding her hips in slow, shallow thrusts against Teyaal’s arid ass. The doctor twitches every time her former slave-bot’s bulbous base pushes back against her hole, and her tongue flails " + (!pc.hasCock() ? "inside you":"around your [pc.cock]") + " with desperate abandon. Damn, that feels <i>good</i>.");
	output("\n\nGrinning wickedly, you grab Teyaal’s horns and start to " + (pc.hasCock() ? "thrust, using them like handlebars to face-fuck her":"grind your [pc.vagOrAss] on her face, taking her tongue deep") + ". You can feel the surrender in the way her sinuous tongue moves, the way she stops bucking in your arms and lets your handhold on her horns guide her right where you want the lusty dragoness.");
	output("\n\n<i>“[pc.name],”</i> Olympia says softly, drawing your attention up from your captive to the sexbot’s sultry visage. Her breasts are quaking with every stuccato thrust and her hands are sunk deep into Teyaal’s cheeks, but her eyes are locked on you. She crooks a finger, urging you to lean in.");
	output("\n\nWhen you do, Olympia grabs your cheeks and pulls you into a fierce kiss. It takes you by surprise - it’s a sudden break of character for the normally-stoic gynoid, but then again, she’s clearly in a good mood thanks to newfound freedom. When she finally draws back again, her azure lips are sporting a toothy smile. <i>“Somehow... with this bitch out of the way, I think my work’s going to be finished so much faster. I’m practically trembling with excitement. Or is that...?”</i>");
	output("\n\nOlympia draws a sharp breath, flitting her golden-hued eyes shut. You feel the doctor tense hard, bucking forward; it doesn’t take much sexual insight to realize that the gynoid has just hit her climax, and is enjoying every second of filling Teyaal’s bowels with synthetic seed.");
	output("\n\nWhile she’s standing still, you take advantage and start " + (pc.hasCock() ? "pounding":"riding") + " the doctor’s face, abusing her lengthy tongue and sultry blue lips until you’re on the cusp of joining your sister-in-sadism. You grab Teyaal’s horns and pull her taut against you, holding her right where you want her until your body comes crashing over that peak and you’re riding her straight into " + (pc.hasGenitals() ? "a messy orgasm that leaves her face coated with slick streams of effluvia":"an anilingus-induced orgasm") + ". The doctor struggles one last time, and then goes limp as you finish using her. When you finally step back, her eyes are crossed and her thighs are coated with her own seed, milked out by her former slave’s buried bone. For her part, Olympia flashes you a coy grin and wraps a digit around Teyaal’s prominent nipple chain.");
	output("\n\n<i>“I think I deserve a short break from my work. I’ll enjoy this for a few minutes more... don’t wait up, hmm?”</i>");
	output("\n\nAye aye, ma’am. You gather up your discarded kit and wobble off, leaving Olympia to finish her skillful show of subjugating sodomy.");
	processTime(60);
	pc.orgasm();
	flags["OLYMPIA_SODOMIZED_TEYAAL"] = 1;
	CombatManager.genericVictory();
}